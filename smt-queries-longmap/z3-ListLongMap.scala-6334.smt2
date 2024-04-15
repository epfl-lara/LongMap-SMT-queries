; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81618 () Bool)

(assert start!81618)

(declare-fun b!953019 () Bool)

(declare-fun res!638332 () Bool)

(declare-fun e!536782 () Bool)

(assert (=> b!953019 (=> (not res!638332) (not e!536782))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953019 (= res!638332 (validKeyInArray!0 k0!2725))))

(declare-fun res!638330 () Bool)

(assert (=> start!81618 (=> (not res!638330) (not e!536782))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81618 (= res!638330 (validMask!0 mask!4034))))

(assert (=> start!81618 e!536782))

(assert (=> start!81618 true))

(declare-datatypes ((array!57662 0))(
  ( (array!57663 (arr!27719 (Array (_ BitVec 32) (_ BitVec 64))) (size!28200 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57662)

(declare-fun array_inv!21576 (array!57662) Bool)

(assert (=> start!81618 (array_inv!21576 a!3460)))

(declare-fun b!953020 () Bool)

(assert (=> b!953020 (= e!536782 (bvslt mask!4034 #b00000000000000000000000000000000))))

(declare-fun b!953017 () Bool)

(declare-fun res!638333 () Bool)

(assert (=> b!953017 (=> (not res!638333) (not e!536782))))

(assert (=> b!953017 (= res!638333 (= (size!28200 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953018 () Bool)

(declare-fun res!638331 () Bool)

(assert (=> b!953018 (=> (not res!638331) (not e!536782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57662 (_ BitVec 32)) Bool)

(assert (=> b!953018 (= res!638331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81618 res!638330) b!953017))

(assert (= (and b!953017 res!638333) b!953018))

(assert (= (and b!953018 res!638331) b!953019))

(assert (= (and b!953019 res!638332) b!953020))

(declare-fun m!884579 () Bool)

(assert (=> b!953019 m!884579))

(declare-fun m!884581 () Bool)

(assert (=> start!81618 m!884581))

(declare-fun m!884583 () Bool)

(assert (=> start!81618 m!884583))

(declare-fun m!884585 () Bool)

(assert (=> b!953018 m!884585))

(check-sat (not start!81618) (not b!953019) (not b!953018))
(check-sat)
(get-model)

(declare-fun d!115443 () Bool)

(assert (=> d!115443 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81618 d!115443))

(declare-fun d!115453 () Bool)

(assert (=> d!115453 (= (array_inv!21576 a!3460) (bvsge (size!28200 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81618 d!115453))

(declare-fun d!115455 () Bool)

(assert (=> d!115455 (= (validKeyInArray!0 k0!2725) (and (not (= k0!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953019 d!115455))

(declare-fun d!115457 () Bool)

(declare-fun res!638372 () Bool)

(declare-fun e!536818 () Bool)

(assert (=> d!115457 (=> res!638372 e!536818)))

(assert (=> d!115457 (= res!638372 (bvsge #b00000000000000000000000000000000 (size!28200 a!3460)))))

(assert (=> d!115457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!536818)))

(declare-fun b!953073 () Bool)

(declare-fun e!536817 () Bool)

(assert (=> b!953073 (= e!536818 e!536817)))

(declare-fun c!99725 () Bool)

(assert (=> b!953073 (= c!99725 (validKeyInArray!0 (select (arr!27719 a!3460) #b00000000000000000000000000000000)))))

(declare-fun b!953074 () Bool)

(declare-fun e!536816 () Bool)

(declare-fun call!41630 () Bool)

(assert (=> b!953074 (= e!536816 call!41630)))

(declare-fun bm!41627 () Bool)

(assert (=> bm!41627 (= call!41630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun b!953075 () Bool)

(assert (=> b!953075 (= e!536817 e!536816)))

(declare-fun lt!429436 () (_ BitVec 64))

(assert (=> b!953075 (= lt!429436 (select (arr!27719 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31946 0))(
  ( (Unit!31947) )
))
(declare-fun lt!429437 () Unit!31946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57662 (_ BitVec 64) (_ BitVec 32)) Unit!31946)

(assert (=> b!953075 (= lt!429437 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429436 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953075 (arrayContainsKey!0 a!3460 lt!429436 #b00000000000000000000000000000000)))

(declare-fun lt!429435 () Unit!31946)

(assert (=> b!953075 (= lt!429435 lt!429437)))

(declare-fun res!638373 () Bool)

(declare-datatypes ((SeekEntryResult!9165 0))(
  ( (MissingZero!9165 (index!39031 (_ BitVec 32))) (Found!9165 (index!39032 (_ BitVec 32))) (Intermediate!9165 (undefined!9977 Bool) (index!39033 (_ BitVec 32)) (x!82016 (_ BitVec 32))) (Undefined!9165) (MissingVacant!9165 (index!39034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57662 (_ BitVec 32)) SeekEntryResult!9165)

(assert (=> b!953075 (= res!638373 (= (seekEntryOrOpen!0 (select (arr!27719 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9165 #b00000000000000000000000000000000)))))

(assert (=> b!953075 (=> (not res!638373) (not e!536816))))

(declare-fun b!953076 () Bool)

(assert (=> b!953076 (= e!536817 call!41630)))

(assert (= (and d!115457 (not res!638372)) b!953073))

(assert (= (and b!953073 c!99725) b!953075))

(assert (= (and b!953073 (not c!99725)) b!953076))

(assert (= (and b!953075 res!638373) b!953074))

(assert (= (or b!953074 b!953076) bm!41627))

(declare-fun m!884615 () Bool)

(assert (=> b!953073 m!884615))

(assert (=> b!953073 m!884615))

(declare-fun m!884617 () Bool)

(assert (=> b!953073 m!884617))

(declare-fun m!884619 () Bool)

(assert (=> bm!41627 m!884619))

(assert (=> b!953075 m!884615))

(declare-fun m!884621 () Bool)

(assert (=> b!953075 m!884621))

(declare-fun m!884623 () Bool)

(assert (=> b!953075 m!884623))

(assert (=> b!953075 m!884615))

(declare-fun m!884625 () Bool)

(assert (=> b!953075 m!884625))

(assert (=> b!953018 d!115457))

(check-sat (not b!953073) (not bm!41627) (not b!953075))
(check-sat)
