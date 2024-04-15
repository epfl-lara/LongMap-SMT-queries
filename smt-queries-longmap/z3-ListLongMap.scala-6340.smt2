; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81678 () Bool)

(assert start!81678)

(declare-fun res!638532 () Bool)

(declare-fun e!536917 () Bool)

(assert (=> start!81678 (=> (not res!638532) (not e!536917))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81678 (= res!638532 (validMask!0 mask!4034))))

(assert (=> start!81678 e!536917))

(assert (=> start!81678 true))

(declare-datatypes ((array!57701 0))(
  ( (array!57702 (arr!27737 (Array (_ BitVec 32) (_ BitVec 64))) (size!28218 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57701)

(declare-fun array_inv!21594 (array!57701) Bool)

(assert (=> start!81678 (array_inv!21594 a!3460)))

(declare-fun b!953235 () Bool)

(declare-fun res!638534 () Bool)

(assert (=> b!953235 (=> (not res!638534) (not e!536917))))

(assert (=> b!953235 (= res!638534 (= (size!28218 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953236 () Bool)

(declare-fun res!638533 () Bool)

(assert (=> b!953236 (=> (not res!638533) (not e!536917))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953236 (= res!638533 (validKeyInArray!0 k0!2725))))

(declare-fun b!953237 () Bool)

(declare-fun res!638531 () Bool)

(assert (=> b!953237 (=> (not res!638531) (not e!536917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57701 (_ BitVec 32)) Bool)

(assert (=> b!953237 (= res!638531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953238 () Bool)

(declare-fun res!638530 () Bool)

(assert (=> b!953238 (=> (not res!638530) (not e!536917))))

(declare-fun i!1375 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9176 0))(
  ( (MissingZero!9176 (index!39075 (_ BitVec 32))) (Found!9176 (index!39076 (_ BitVec 32))) (Intermediate!9176 (undefined!9988 Bool) (index!39077 (_ BitVec 32)) (x!82075 (_ BitVec 32))) (Undefined!9176) (MissingVacant!9176 (index!39078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57701 (_ BitVec 32)) SeekEntryResult!9176)

(assert (=> b!953238 (= res!638530 (= (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034) (Found!9176 i!1375)))))

(declare-fun b!953239 () Bool)

(declare-fun lt!429488 () SeekEntryResult!9176)

(get-info :version)

(assert (=> b!953239 (= e!536917 (or (not ((_ is Found!9176) lt!429488)) (not (= (index!39076 lt!429488) i!1375))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57701 (_ BitVec 32)) SeekEntryResult!9176)

(assert (=> b!953239 (= lt!429488 (seekEntry!0 k0!2725 a!3460 mask!4034))))

(assert (= (and start!81678 res!638532) b!953235))

(assert (= (and b!953235 res!638534) b!953237))

(assert (= (and b!953237 res!638531) b!953236))

(assert (= (and b!953236 res!638533) b!953238))

(assert (= (and b!953238 res!638530) b!953239))

(declare-fun m!884765 () Bool)

(assert (=> start!81678 m!884765))

(declare-fun m!884767 () Bool)

(assert (=> start!81678 m!884767))

(declare-fun m!884769 () Bool)

(assert (=> b!953238 m!884769))

(declare-fun m!884771 () Bool)

(assert (=> b!953237 m!884771))

(declare-fun m!884773 () Bool)

(assert (=> b!953239 m!884773))

(declare-fun m!884775 () Bool)

(assert (=> b!953236 m!884775))

(check-sat (not start!81678) (not b!953238) (not b!953237) (not b!953236) (not b!953239))
(check-sat)
(get-model)

(declare-fun d!115479 () Bool)

(assert (=> d!115479 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81678 d!115479))

(declare-fun d!115485 () Bool)

(assert (=> d!115485 (= (array_inv!21594 a!3460) (bvsge (size!28218 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81678 d!115485))

(declare-fun b!953308 () Bool)

(declare-fun e!536951 () Bool)

(declare-fun e!536953 () Bool)

(assert (=> b!953308 (= e!536951 e!536953)))

(declare-fun c!99744 () Bool)

(assert (=> b!953308 (= c!99744 (validKeyInArray!0 (select (arr!27737 a!3460) #b00000000000000000000000000000000)))))

(declare-fun b!953309 () Bool)

(declare-fun call!41634 () Bool)

(assert (=> b!953309 (= e!536953 call!41634)))

(declare-fun b!953310 () Bool)

(declare-fun e!536952 () Bool)

(assert (=> b!953310 (= e!536952 call!41634)))

(declare-fun d!115487 () Bool)

(declare-fun res!638569 () Bool)

(assert (=> d!115487 (=> res!638569 e!536951)))

(assert (=> d!115487 (= res!638569 (bvsge #b00000000000000000000000000000000 (size!28218 a!3460)))))

(assert (=> d!115487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!536951)))

(declare-fun bm!41631 () Bool)

(assert (=> bm!41631 (= call!41634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun b!953311 () Bool)

(assert (=> b!953311 (= e!536953 e!536952)))

(declare-fun lt!429519 () (_ BitVec 64))

(assert (=> b!953311 (= lt!429519 (select (arr!27737 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31950 0))(
  ( (Unit!31951) )
))
(declare-fun lt!429520 () Unit!31950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57701 (_ BitVec 64) (_ BitVec 32)) Unit!31950)

(assert (=> b!953311 (= lt!429520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429519 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953311 (arrayContainsKey!0 a!3460 lt!429519 #b00000000000000000000000000000000)))

(declare-fun lt!429518 () Unit!31950)

(assert (=> b!953311 (= lt!429518 lt!429520)))

(declare-fun res!638570 () Bool)

(assert (=> b!953311 (= res!638570 (= (seekEntryOrOpen!0 (select (arr!27737 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9176 #b00000000000000000000000000000000)))))

(assert (=> b!953311 (=> (not res!638570) (not e!536952))))

(assert (= (and d!115487 (not res!638569)) b!953308))

(assert (= (and b!953308 c!99744) b!953311))

(assert (= (and b!953308 (not c!99744)) b!953309))

(assert (= (and b!953311 res!638570) b!953310))

(assert (= (or b!953310 b!953309) bm!41631))

(declare-fun m!884815 () Bool)

(assert (=> b!953308 m!884815))

(assert (=> b!953308 m!884815))

(declare-fun m!884817 () Bool)

(assert (=> b!953308 m!884817))

(declare-fun m!884819 () Bool)

(assert (=> bm!41631 m!884819))

(assert (=> b!953311 m!884815))

(declare-fun m!884821 () Bool)

(assert (=> b!953311 m!884821))

(declare-fun m!884823 () Bool)

(assert (=> b!953311 m!884823))

(assert (=> b!953311 m!884815))

(declare-fun m!884825 () Bool)

(assert (=> b!953311 m!884825))

(assert (=> b!953237 d!115487))

(declare-fun b!953356 () Bool)

(declare-fun e!536978 () SeekEntryResult!9176)

(declare-fun e!536979 () SeekEntryResult!9176)

(assert (=> b!953356 (= e!536978 e!536979)))

(declare-fun lt!429550 () (_ BitVec 64))

(declare-fun lt!429551 () SeekEntryResult!9176)

(assert (=> b!953356 (= lt!429550 (select (arr!27737 a!3460) (index!39077 lt!429551)))))

(declare-fun c!99765 () Bool)

(assert (=> b!953356 (= c!99765 (= lt!429550 k0!2725))))

(declare-fun b!953357 () Bool)

(assert (=> b!953357 (= e!536979 (Found!9176 (index!39077 lt!429551)))))

(declare-fun b!953358 () Bool)

(assert (=> b!953358 (= e!536978 Undefined!9176)))

(declare-fun b!953359 () Bool)

(declare-fun e!536980 () SeekEntryResult!9176)

(assert (=> b!953359 (= e!536980 (MissingZero!9176 (index!39077 lt!429551)))))

(declare-fun b!953360 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57701 (_ BitVec 32)) SeekEntryResult!9176)

(assert (=> b!953360 (= e!536980 (seekKeyOrZeroReturnVacant!0 (x!82075 lt!429551) (index!39077 lt!429551) (index!39077 lt!429551) k0!2725 a!3460 mask!4034))))

(declare-fun b!953361 () Bool)

(declare-fun c!99766 () Bool)

(assert (=> b!953361 (= c!99766 (= lt!429550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953361 (= e!536979 e!536980)))

(declare-fun d!115491 () Bool)

(declare-fun lt!429549 () SeekEntryResult!9176)

(assert (=> d!115491 (and (or ((_ is Undefined!9176) lt!429549) (not ((_ is Found!9176) lt!429549)) (and (bvsge (index!39076 lt!429549) #b00000000000000000000000000000000) (bvslt (index!39076 lt!429549) (size!28218 a!3460)))) (or ((_ is Undefined!9176) lt!429549) ((_ is Found!9176) lt!429549) (not ((_ is MissingZero!9176) lt!429549)) (and (bvsge (index!39075 lt!429549) #b00000000000000000000000000000000) (bvslt (index!39075 lt!429549) (size!28218 a!3460)))) (or ((_ is Undefined!9176) lt!429549) ((_ is Found!9176) lt!429549) ((_ is MissingZero!9176) lt!429549) (not ((_ is MissingVacant!9176) lt!429549)) (and (bvsge (index!39078 lt!429549) #b00000000000000000000000000000000) (bvslt (index!39078 lt!429549) (size!28218 a!3460)))) (or ((_ is Undefined!9176) lt!429549) (ite ((_ is Found!9176) lt!429549) (= (select (arr!27737 a!3460) (index!39076 lt!429549)) k0!2725) (ite ((_ is MissingZero!9176) lt!429549) (= (select (arr!27737 a!3460) (index!39075 lt!429549)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9176) lt!429549) (= (select (arr!27737 a!3460) (index!39078 lt!429549)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!115491 (= lt!429549 e!536978)))

(declare-fun c!99767 () Bool)

(assert (=> d!115491 (= c!99767 (and ((_ is Intermediate!9176) lt!429551) (undefined!9988 lt!429551)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57701 (_ BitVec 32)) SeekEntryResult!9176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115491 (= lt!429551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2725 mask!4034) k0!2725 a!3460 mask!4034))))

(assert (=> d!115491 (validMask!0 mask!4034)))

(assert (=> d!115491 (= (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034) lt!429549)))

(assert (= (and d!115491 c!99767) b!953358))

(assert (= (and d!115491 (not c!99767)) b!953356))

(assert (= (and b!953356 c!99765) b!953357))

(assert (= (and b!953356 (not c!99765)) b!953361))

(assert (= (and b!953361 c!99766) b!953359))

(assert (= (and b!953361 (not c!99766)) b!953360))

(declare-fun m!884843 () Bool)

(assert (=> b!953356 m!884843))

(declare-fun m!884845 () Bool)

(assert (=> b!953360 m!884845))

(declare-fun m!884849 () Bool)

(assert (=> d!115491 m!884849))

(declare-fun m!884851 () Bool)

(assert (=> d!115491 m!884851))

(declare-fun m!884855 () Bool)

(assert (=> d!115491 m!884855))

(declare-fun m!884859 () Bool)

(assert (=> d!115491 m!884859))

(declare-fun m!884863 () Bool)

(assert (=> d!115491 m!884863))

(assert (=> d!115491 m!884859))

(assert (=> d!115491 m!884765))

(assert (=> b!953238 d!115491))

(declare-fun d!115503 () Bool)

(declare-fun lt!429575 () SeekEntryResult!9176)

(assert (=> d!115503 (and (or ((_ is MissingVacant!9176) lt!429575) (not ((_ is Found!9176) lt!429575)) (and (bvsge (index!39076 lt!429575) #b00000000000000000000000000000000) (bvslt (index!39076 lt!429575) (size!28218 a!3460)))) (not ((_ is MissingVacant!9176) lt!429575)) (or (not ((_ is Found!9176) lt!429575)) (= (select (arr!27737 a!3460) (index!39076 lt!429575)) k0!2725)))))

(declare-fun e!537001 () SeekEntryResult!9176)

(assert (=> d!115503 (= lt!429575 e!537001)))

(declare-fun c!99779 () Bool)

(declare-fun lt!429574 () SeekEntryResult!9176)

(assert (=> d!115503 (= c!99779 (and ((_ is Intermediate!9176) lt!429574) (undefined!9988 lt!429574)))))

(assert (=> d!115503 (= lt!429574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2725 mask!4034) k0!2725 a!3460 mask!4034))))

(assert (=> d!115503 (validMask!0 mask!4034)))

(assert (=> d!115503 (= (seekEntry!0 k0!2725 a!3460 mask!4034) lt!429575)))

(declare-fun b!953390 () Bool)

(declare-fun c!99780 () Bool)

(declare-fun lt!429572 () (_ BitVec 64))

(assert (=> b!953390 (= c!99780 (= lt!429572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537000 () SeekEntryResult!9176)

(declare-fun e!536999 () SeekEntryResult!9176)

(assert (=> b!953390 (= e!537000 e!536999)))

(declare-fun b!953391 () Bool)

(assert (=> b!953391 (= e!537001 e!537000)))

(assert (=> b!953391 (= lt!429572 (select (arr!27737 a!3460) (index!39077 lt!429574)))))

(declare-fun c!99778 () Bool)

(assert (=> b!953391 (= c!99778 (= lt!429572 k0!2725))))

(declare-fun b!953392 () Bool)

(assert (=> b!953392 (= e!537000 (Found!9176 (index!39077 lt!429574)))))

(declare-fun b!953393 () Bool)

(declare-fun lt!429573 () SeekEntryResult!9176)

(assert (=> b!953393 (= e!536999 (ite ((_ is MissingVacant!9176) lt!429573) (MissingZero!9176 (index!39078 lt!429573)) lt!429573))))

(assert (=> b!953393 (= lt!429573 (seekKeyOrZeroReturnVacant!0 (x!82075 lt!429574) (index!39077 lt!429574) (index!39077 lt!429574) k0!2725 a!3460 mask!4034))))

(declare-fun b!953394 () Bool)

(assert (=> b!953394 (= e!536999 (MissingZero!9176 (index!39077 lt!429574)))))

(declare-fun b!953395 () Bool)

(assert (=> b!953395 (= e!537001 Undefined!9176)))

(assert (= (and d!115503 c!99779) b!953395))

(assert (= (and d!115503 (not c!99779)) b!953391))

(assert (= (and b!953391 c!99778) b!953392))

(assert (= (and b!953391 (not c!99778)) b!953390))

(assert (= (and b!953390 c!99780) b!953394))

(assert (= (and b!953390 (not c!99780)) b!953393))

(declare-fun m!884881 () Bool)

(assert (=> d!115503 m!884881))

(assert (=> d!115503 m!884859))

(assert (=> d!115503 m!884859))

(assert (=> d!115503 m!884863))

(assert (=> d!115503 m!884765))

(declare-fun m!884883 () Bool)

(assert (=> b!953391 m!884883))

(declare-fun m!884885 () Bool)

(assert (=> b!953393 m!884885))

(assert (=> b!953239 d!115503))

(declare-fun d!115513 () Bool)

(assert (=> d!115513 (= (validKeyInArray!0 k0!2725) (and (not (= k0!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953236 d!115513))

(check-sat (not b!953393) (not b!953311) (not d!115491) (not d!115503) (not b!953360) (not bm!41631) (not b!953308))
(check-sat)
