.class final Lcom/android/server/ThemeService$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "ThemeService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ThemeService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SettingsObserver"
.end annotation


# instance fields
.field private final ALARM_ALERT_URI:Landroid/net/Uri;

.field private final NOTIFICATION_URI:Landroid/net/Uri;

.field private final RINGTONE_URI:Landroid/net/Uri;

.field final synthetic this$0:Lcom/android/server/ThemeService;


# direct methods
.method public constructor <init>(Lcom/android/server/ThemeService;)V
    .locals 1

    .prologue
    .line 1257
    iput-object p1, p0, Lcom/android/server/ThemeService$SettingsObserver;->this$0:Lcom/android/server/ThemeService;

    .line 1258
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 1250
    sget-object v0, Landroid/provider/Settings$System;->DEFAULT_ALARM_ALERT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/android/server/ThemeService$SettingsObserver;->ALARM_ALERT_URI:Landroid/net/Uri;

    .line 1252
    sget-object v0, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/android/server/ThemeService$SettingsObserver;->NOTIFICATION_URI:Landroid/net/Uri;

    .line 1254
    sget-object v0, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/android/server/ThemeService$SettingsObserver;->RINGTONE_URI:Landroid/net/Uri;

    .line 1259
    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 6
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1274
    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    .line 1275
    const/4 v1, 0x0

    .line 1276
    .local v1, "changed":Z
    new-instance v0, Landroid/content/res/ThemeChangeRequest$Builder;

    invoke-direct {v0}, Landroid/content/res/ThemeChangeRequest$Builder;-><init>()V

    .line 1277
    .local v0, "builder":Landroid/content/res/ThemeChangeRequest$Builder;
    iget-object v2, p0, Lcom/android/server/ThemeService$SettingsObserver;->ALARM_ALERT_URI:Landroid/net/Uri;

    invoke-virtual {v2, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1279
    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/content/res/ThemeChangeRequest$Builder;->setAlarm(Ljava/lang/String;)Landroid/content/res/ThemeChangeRequest$Builder;

    .line 1280
    const/4 v1, 0x1

    .line 1282
    :cond_0
    iget-object v2, p0, Lcom/android/server/ThemeService$SettingsObserver;->NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {v2, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1284
    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/content/res/ThemeChangeRequest$Builder;->setNotification(Ljava/lang/String;)Landroid/content/res/ThemeChangeRequest$Builder;

    .line 1285
    const/4 v1, 0x1

    .line 1287
    :cond_1
    iget-object v2, p0, Lcom/android/server/ThemeService$SettingsObserver;->RINGTONE_URI:Landroid/net/Uri;

    invoke-virtual {v2, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1289
    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/content/res/ThemeChangeRequest$Builder;->setRingtone(Ljava/lang/String;)Landroid/content/res/ThemeChangeRequest$Builder;

    .line 1290
    const/4 v1, 0x1

    .line 1293
    :cond_2
    if-eqz v1, :cond_3

    .line 1294
    iget-object v2, p0, Lcom/android/server/ThemeService$SettingsObserver;->this$0:Lcom/android/server/ThemeService;

    invoke-virtual {v0}, Landroid/content/res/ThemeChangeRequest$Builder;->build()Landroid/content/res/ThemeChangeRequest;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    # invokes: Lcom/android/server/ThemeService;->updateProvider(Landroid/content/res/ThemeChangeRequest;J)V
    invoke-static {v2, v3, v4, v5}, Lcom/android/server/ThemeService;->access$1100(Lcom/android/server/ThemeService;Landroid/content/res/ThemeChangeRequest;J)V

    .line 1296
    :cond_3
    return-void
.end method

.method public register(Z)V
    .locals 3
    .param p1, "register"    # Z

    .prologue
    const/4 v2, 0x0

    .line 1262
    iget-object v1, p0, Lcom/android/server/ThemeService$SettingsObserver;->this$0:Lcom/android/server/ThemeService;

    # getter for: Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/ThemeService;->access$1200(Lcom/android/server/ThemeService;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1263
    .local v0, "cr":Landroid/content/ContentResolver;
    if-eqz p1, :cond_0

    .line 1264
    iget-object v1, p0, Lcom/android/server/ThemeService$SettingsObserver;->ALARM_ALERT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1265
    iget-object v1, p0, Lcom/android/server/ThemeService$SettingsObserver;->NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1266
    iget-object v1, p0, Lcom/android/server/ThemeService$SettingsObserver;->RINGTONE_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1270
    :goto_0
    return-void

    .line 1268
    :cond_0
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    goto :goto_0
.end method
