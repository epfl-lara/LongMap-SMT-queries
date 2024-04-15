; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115618 () Bool)

(assert start!115618)

(declare-fun b!1367358 () Bool)

(declare-fun res!910937 () Bool)

(declare-fun e!774919 () Bool)

(assert (=> b!1367358 (=> (not res!910937) (not e!774919))))

(declare-datatypes ((array!92808 0))(
  ( (array!92809 (arr!44830 (Array (_ BitVec 32) (_ BitVec 64))) (size!45382 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92808)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367358 (= res!910937 (validKeyInArray!0 (select (arr!44830 a!3861) from!3239)))))

(declare-fun b!1367359 () Bool)

(declare-fun res!910935 () Bool)

(declare-fun e!774920 () Bool)

(assert (=> b!1367359 (=> (not res!910935) (not e!774920))))

(declare-datatypes ((List!31976 0))(
  ( (Nil!31973) (Cons!31972 (h!33181 (_ BitVec 64)) (t!46662 List!31976)) )
))
(declare-fun acc!866 () List!31976)

(declare-fun contains!9569 (List!31976 (_ BitVec 64)) Bool)

(assert (=> b!1367359 (= res!910935 (not (contains!9569 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367360 () Bool)

(declare-fun res!910928 () Bool)

(assert (=> b!1367360 (=> (not res!910928) (not e!774919))))

(assert (=> b!1367360 (= res!910928 (bvslt from!3239 (size!45382 a!3861)))))

(declare-fun b!1367361 () Bool)

(declare-fun res!910932 () Bool)

(assert (=> b!1367361 (=> (not res!910932) (not e!774920))))

(declare-fun noDuplicate!2484 (List!31976) Bool)

(assert (=> b!1367361 (= res!910932 (noDuplicate!2484 acc!866))))

(declare-fun b!1367362 () Bool)

(assert (=> b!1367362 (= e!774920 e!774919)))

(declare-fun res!910936 () Bool)

(assert (=> b!1367362 (=> (not res!910936) (not e!774919))))

(declare-fun arrayNoDuplicates!0 (array!92808 (_ BitVec 32) List!31976) Bool)

(assert (=> b!1367362 (= res!910936 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44988 0))(
  ( (Unit!44989) )
))
(declare-fun lt!601701 () Unit!44988)

(declare-fun newAcc!98 () List!31976)

(declare-fun noDuplicateSubseq!194 (List!31976 List!31976) Unit!44988)

(assert (=> b!1367362 (= lt!601701 (noDuplicateSubseq!194 newAcc!98 acc!866))))

(declare-fun b!1367363 () Bool)

(declare-fun res!910929 () Bool)

(assert (=> b!1367363 (=> (not res!910929) (not e!774920))))

(assert (=> b!1367363 (= res!910929 (not (contains!9569 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367364 () Bool)

(declare-fun res!910931 () Bool)

(assert (=> b!1367364 (=> (not res!910931) (not e!774920))))

(assert (=> b!1367364 (= res!910931 (not (contains!9569 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910933 () Bool)

(assert (=> start!115618 (=> (not res!910933) (not e!774920))))

(assert (=> start!115618 (= res!910933 (and (bvslt (size!45382 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45382 a!3861))))))

(assert (=> start!115618 e!774920))

(declare-fun array_inv!34063 (array!92808) Bool)

(assert (=> start!115618 (array_inv!34063 a!3861)))

(assert (=> start!115618 true))

(declare-fun b!1367365 () Bool)

(declare-fun res!910927 () Bool)

(assert (=> b!1367365 (=> (not res!910927) (not e!774920))))

(declare-fun subseq!1007 (List!31976 List!31976) Bool)

(assert (=> b!1367365 (= res!910927 (subseq!1007 newAcc!98 acc!866))))

(declare-fun b!1367366 () Bool)

(declare-fun res!910930 () Bool)

(assert (=> b!1367366 (=> (not res!910930) (not e!774919))))

(assert (=> b!1367366 (= res!910930 (contains!9569 acc!866 (select (arr!44830 a!3861) from!3239)))))

(declare-fun b!1367367 () Bool)

(assert (=> b!1367367 (= e!774919 (not (noDuplicate!2484 newAcc!98)))))

(declare-fun b!1367368 () Bool)

(declare-fun res!910934 () Bool)

(assert (=> b!1367368 (=> (not res!910934) (not e!774920))))

(assert (=> b!1367368 (= res!910934 (not (contains!9569 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115618 res!910933) b!1367361))

(assert (= (and b!1367361 res!910932) b!1367364))

(assert (= (and b!1367364 res!910931) b!1367359))

(assert (= (and b!1367359 res!910935) b!1367363))

(assert (= (and b!1367363 res!910929) b!1367368))

(assert (= (and b!1367368 res!910934) b!1367365))

(assert (= (and b!1367365 res!910927) b!1367362))

(assert (= (and b!1367362 res!910936) b!1367360))

(assert (= (and b!1367360 res!910928) b!1367358))

(assert (= (and b!1367358 res!910937) b!1367366))

(assert (= (and b!1367366 res!910930) b!1367367))

(declare-fun m!1251129 () Bool)

(assert (=> b!1367358 m!1251129))

(assert (=> b!1367358 m!1251129))

(declare-fun m!1251131 () Bool)

(assert (=> b!1367358 m!1251131))

(declare-fun m!1251133 () Bool)

(assert (=> b!1367361 m!1251133))

(declare-fun m!1251135 () Bool)

(assert (=> b!1367359 m!1251135))

(declare-fun m!1251137 () Bool)

(assert (=> b!1367363 m!1251137))

(assert (=> b!1367366 m!1251129))

(assert (=> b!1367366 m!1251129))

(declare-fun m!1251139 () Bool)

(assert (=> b!1367366 m!1251139))

(declare-fun m!1251141 () Bool)

(assert (=> b!1367367 m!1251141))

(declare-fun m!1251143 () Bool)

(assert (=> b!1367368 m!1251143))

(declare-fun m!1251145 () Bool)

(assert (=> b!1367365 m!1251145))

(declare-fun m!1251147 () Bool)

(assert (=> b!1367364 m!1251147))

(declare-fun m!1251149 () Bool)

(assert (=> b!1367362 m!1251149))

(declare-fun m!1251151 () Bool)

(assert (=> b!1367362 m!1251151))

(declare-fun m!1251153 () Bool)

(assert (=> start!115618 m!1251153))

(check-sat (not b!1367363) (not b!1367361) (not b!1367359) (not start!115618) (not b!1367364) (not b!1367365) (not b!1367358) (not b!1367368) (not b!1367366) (not b!1367367) (not b!1367362))
(check-sat)
(get-model)

(declare-fun d!146691 () Bool)

(declare-fun res!911008 () Bool)

(declare-fun e!774944 () Bool)

(assert (=> d!146691 (=> res!911008 e!774944)))

(get-info :version)

(assert (=> d!146691 (= res!911008 ((_ is Nil!31973) acc!866))))

(assert (=> d!146691 (= (noDuplicate!2484 acc!866) e!774944)))

(declare-fun b!1367439 () Bool)

(declare-fun e!774945 () Bool)

(assert (=> b!1367439 (= e!774944 e!774945)))

(declare-fun res!911009 () Bool)

(assert (=> b!1367439 (=> (not res!911009) (not e!774945))))

(assert (=> b!1367439 (= res!911009 (not (contains!9569 (t!46662 acc!866) (h!33181 acc!866))))))

(declare-fun b!1367440 () Bool)

(assert (=> b!1367440 (= e!774945 (noDuplicate!2484 (t!46662 acc!866)))))

(assert (= (and d!146691 (not res!911008)) b!1367439))

(assert (= (and b!1367439 res!911009) b!1367440))

(declare-fun m!1251207 () Bool)

(assert (=> b!1367439 m!1251207))

(declare-fun m!1251209 () Bool)

(assert (=> b!1367440 m!1251209))

(assert (=> b!1367361 d!146691))

(declare-fun lt!601710 () Bool)

(declare-fun d!146693 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!713 (List!31976) (InoxSet (_ BitVec 64)))

(assert (=> d!146693 (= lt!601710 (select (content!713 acc!866) (select (arr!44830 a!3861) from!3239)))))

(declare-fun e!774951 () Bool)

(assert (=> d!146693 (= lt!601710 e!774951)))

(declare-fun res!911014 () Bool)

(assert (=> d!146693 (=> (not res!911014) (not e!774951))))

(assert (=> d!146693 (= res!911014 ((_ is Cons!31972) acc!866))))

(assert (=> d!146693 (= (contains!9569 acc!866 (select (arr!44830 a!3861) from!3239)) lt!601710)))

(declare-fun b!1367445 () Bool)

(declare-fun e!774950 () Bool)

(assert (=> b!1367445 (= e!774951 e!774950)))

(declare-fun res!911015 () Bool)

(assert (=> b!1367445 (=> res!911015 e!774950)))

(assert (=> b!1367445 (= res!911015 (= (h!33181 acc!866) (select (arr!44830 a!3861) from!3239)))))

(declare-fun b!1367446 () Bool)

(assert (=> b!1367446 (= e!774950 (contains!9569 (t!46662 acc!866) (select (arr!44830 a!3861) from!3239)))))

(assert (= (and d!146693 res!911014) b!1367445))

(assert (= (and b!1367445 (not res!911015)) b!1367446))

(declare-fun m!1251211 () Bool)

(assert (=> d!146693 m!1251211))

(assert (=> d!146693 m!1251129))

(declare-fun m!1251213 () Bool)

(assert (=> d!146693 m!1251213))

(assert (=> b!1367446 m!1251129))

(declare-fun m!1251215 () Bool)

(assert (=> b!1367446 m!1251215))

(assert (=> b!1367366 d!146693))

(declare-fun d!146699 () Bool)

(declare-fun lt!601711 () Bool)

(assert (=> d!146699 (= lt!601711 (select (content!713 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774953 () Bool)

(assert (=> d!146699 (= lt!601711 e!774953)))

(declare-fun res!911016 () Bool)

(assert (=> d!146699 (=> (not res!911016) (not e!774953))))

(assert (=> d!146699 (= res!911016 ((_ is Cons!31972) acc!866))))

(assert (=> d!146699 (= (contains!9569 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601711)))

(declare-fun b!1367447 () Bool)

(declare-fun e!774952 () Bool)

(assert (=> b!1367447 (= e!774953 e!774952)))

(declare-fun res!911017 () Bool)

(assert (=> b!1367447 (=> res!911017 e!774952)))

(assert (=> b!1367447 (= res!911017 (= (h!33181 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367448 () Bool)

(assert (=> b!1367448 (= e!774952 (contains!9569 (t!46662 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146699 res!911016) b!1367447))

(assert (= (and b!1367447 (not res!911017)) b!1367448))

(assert (=> d!146699 m!1251211))

(declare-fun m!1251217 () Bool)

(assert (=> d!146699 m!1251217))

(declare-fun m!1251219 () Bool)

(assert (=> b!1367448 m!1251219))

(assert (=> b!1367359 d!146699))

(declare-fun d!146701 () Bool)

(declare-fun lt!601714 () Bool)

(assert (=> d!146701 (= lt!601714 (select (content!713 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774959 () Bool)

(assert (=> d!146701 (= lt!601714 e!774959)))

(declare-fun res!911022 () Bool)

(assert (=> d!146701 (=> (not res!911022) (not e!774959))))

(assert (=> d!146701 (= res!911022 ((_ is Cons!31972) acc!866))))

(assert (=> d!146701 (= (contains!9569 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601714)))

(declare-fun b!1367453 () Bool)

(declare-fun e!774958 () Bool)

(assert (=> b!1367453 (= e!774959 e!774958)))

(declare-fun res!911023 () Bool)

(assert (=> b!1367453 (=> res!911023 e!774958)))

(assert (=> b!1367453 (= res!911023 (= (h!33181 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367454 () Bool)

(assert (=> b!1367454 (= e!774958 (contains!9569 (t!46662 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146701 res!911022) b!1367453))

(assert (= (and b!1367453 (not res!911023)) b!1367454))

(assert (=> d!146701 m!1251211))

(declare-fun m!1251221 () Bool)

(assert (=> d!146701 m!1251221))

(declare-fun m!1251223 () Bool)

(assert (=> b!1367454 m!1251223))

(assert (=> b!1367364 d!146701))

(declare-fun b!1367477 () Bool)

(declare-fun e!774981 () Bool)

(assert (=> b!1367477 (= e!774981 (subseq!1007 (t!46662 newAcc!98) (t!46662 acc!866)))))

(declare-fun b!1367478 () Bool)

(declare-fun e!774980 () Bool)

(assert (=> b!1367478 (= e!774980 (subseq!1007 newAcc!98 (t!46662 acc!866)))))

(declare-fun d!146703 () Bool)

(declare-fun res!911045 () Bool)

(declare-fun e!774982 () Bool)

(assert (=> d!146703 (=> res!911045 e!774982)))

(assert (=> d!146703 (= res!911045 ((_ is Nil!31973) newAcc!98))))

(assert (=> d!146703 (= (subseq!1007 newAcc!98 acc!866) e!774982)))

(declare-fun b!1367475 () Bool)

(declare-fun e!774983 () Bool)

(assert (=> b!1367475 (= e!774982 e!774983)))

(declare-fun res!911046 () Bool)

(assert (=> b!1367475 (=> (not res!911046) (not e!774983))))

(assert (=> b!1367475 (= res!911046 ((_ is Cons!31972) acc!866))))

(declare-fun b!1367476 () Bool)

(assert (=> b!1367476 (= e!774983 e!774980)))

(declare-fun res!911044 () Bool)

(assert (=> b!1367476 (=> res!911044 e!774980)))

(assert (=> b!1367476 (= res!911044 e!774981)))

(declare-fun res!911047 () Bool)

(assert (=> b!1367476 (=> (not res!911047) (not e!774981))))

(assert (=> b!1367476 (= res!911047 (= (h!33181 newAcc!98) (h!33181 acc!866)))))

(assert (= (and d!146703 (not res!911045)) b!1367475))

(assert (= (and b!1367475 res!911046) b!1367476))

(assert (= (and b!1367476 res!911047) b!1367477))

(assert (= (and b!1367476 (not res!911044)) b!1367478))

(declare-fun m!1251237 () Bool)

(assert (=> b!1367477 m!1251237))

(declare-fun m!1251239 () Bool)

(assert (=> b!1367478 m!1251239))

(assert (=> b!1367365 d!146703))

(declare-fun d!146711 () Bool)

(assert (=> d!146711 (= (array_inv!34063 a!3861) (bvsge (size!45382 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115618 d!146711))

(declare-fun d!146715 () Bool)

(declare-fun lt!601719 () Bool)

(assert (=> d!146715 (= lt!601719 (select (content!713 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774995 () Bool)

(assert (=> d!146715 (= lt!601719 e!774995)))

(declare-fun res!911056 () Bool)

(assert (=> d!146715 (=> (not res!911056) (not e!774995))))

(assert (=> d!146715 (= res!911056 ((_ is Cons!31972) newAcc!98))))

(assert (=> d!146715 (= (contains!9569 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601719)))

(declare-fun b!1367491 () Bool)

(declare-fun e!774994 () Bool)

(assert (=> b!1367491 (= e!774995 e!774994)))

(declare-fun res!911057 () Bool)

(assert (=> b!1367491 (=> res!911057 e!774994)))

(assert (=> b!1367491 (= res!911057 (= (h!33181 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367492 () Bool)

(assert (=> b!1367492 (= e!774994 (contains!9569 (t!46662 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146715 res!911056) b!1367491))

(assert (= (and b!1367491 (not res!911057)) b!1367492))

(declare-fun m!1251245 () Bool)

(assert (=> d!146715 m!1251245))

(declare-fun m!1251247 () Bool)

(assert (=> d!146715 m!1251247))

(declare-fun m!1251249 () Bool)

(assert (=> b!1367492 m!1251249))

(assert (=> b!1367363 d!146715))

(declare-fun d!146717 () Bool)

(declare-fun lt!601720 () Bool)

(assert (=> d!146717 (= lt!601720 (select (content!713 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774997 () Bool)

(assert (=> d!146717 (= lt!601720 e!774997)))

(declare-fun res!911058 () Bool)

(assert (=> d!146717 (=> (not res!911058) (not e!774997))))

(assert (=> d!146717 (= res!911058 ((_ is Cons!31972) newAcc!98))))

(assert (=> d!146717 (= (contains!9569 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601720)))

(declare-fun b!1367493 () Bool)

(declare-fun e!774996 () Bool)

(assert (=> b!1367493 (= e!774997 e!774996)))

(declare-fun res!911059 () Bool)

(assert (=> b!1367493 (=> res!911059 e!774996)))

(assert (=> b!1367493 (= res!911059 (= (h!33181 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367494 () Bool)

(assert (=> b!1367494 (= e!774996 (contains!9569 (t!46662 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146717 res!911058) b!1367493))

(assert (= (and b!1367493 (not res!911059)) b!1367494))

(assert (=> d!146717 m!1251245))

(declare-fun m!1251251 () Bool)

(assert (=> d!146717 m!1251251))

(declare-fun m!1251253 () Bool)

(assert (=> b!1367494 m!1251253))

(assert (=> b!1367368 d!146717))

(declare-fun d!146719 () Bool)

(assert (=> d!146719 (= (validKeyInArray!0 (select (arr!44830 a!3861) from!3239)) (and (not (= (select (arr!44830 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44830 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1367358 d!146719))

(declare-fun d!146721 () Bool)

(declare-fun res!911060 () Bool)

(declare-fun e!774998 () Bool)

(assert (=> d!146721 (=> res!911060 e!774998)))

(assert (=> d!146721 (= res!911060 ((_ is Nil!31973) newAcc!98))))

(assert (=> d!146721 (= (noDuplicate!2484 newAcc!98) e!774998)))

(declare-fun b!1367495 () Bool)

(declare-fun e!774999 () Bool)

(assert (=> b!1367495 (= e!774998 e!774999)))

(declare-fun res!911061 () Bool)

(assert (=> b!1367495 (=> (not res!911061) (not e!774999))))

(assert (=> b!1367495 (= res!911061 (not (contains!9569 (t!46662 newAcc!98) (h!33181 newAcc!98))))))

(declare-fun b!1367496 () Bool)

(assert (=> b!1367496 (= e!774999 (noDuplicate!2484 (t!46662 newAcc!98)))))

(assert (= (and d!146721 (not res!911060)) b!1367495))

(assert (= (and b!1367495 res!911061) b!1367496))

(declare-fun m!1251255 () Bool)

(assert (=> b!1367495 m!1251255))

(declare-fun m!1251257 () Bool)

(assert (=> b!1367496 m!1251257))

(assert (=> b!1367367 d!146721))

(declare-fun b!1367531 () Bool)

(declare-fun e!775030 () Bool)

(declare-fun e!775027 () Bool)

(assert (=> b!1367531 (= e!775030 e!775027)))

(declare-fun c!127666 () Bool)

(assert (=> b!1367531 (= c!127666 (validKeyInArray!0 (select (arr!44830 a!3861) from!3239)))))

(declare-fun b!1367532 () Bool)

(declare-fun call!65473 () Bool)

(assert (=> b!1367532 (= e!775027 call!65473)))

(declare-fun bm!65470 () Bool)

(assert (=> bm!65470 (= call!65473 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127666 (Cons!31972 (select (arr!44830 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1367530 () Bool)

(declare-fun e!775028 () Bool)

(assert (=> b!1367530 (= e!775028 e!775030)))

(declare-fun res!911085 () Bool)

(assert (=> b!1367530 (=> (not res!911085) (not e!775030))))

(declare-fun e!775029 () Bool)

(assert (=> b!1367530 (= res!911085 (not e!775029))))

(declare-fun res!911083 () Bool)

(assert (=> b!1367530 (=> (not res!911083) (not e!775029))))

(assert (=> b!1367530 (= res!911083 (validKeyInArray!0 (select (arr!44830 a!3861) from!3239)))))

(declare-fun d!146723 () Bool)

(declare-fun res!911084 () Bool)

(assert (=> d!146723 (=> res!911084 e!775028)))

(assert (=> d!146723 (= res!911084 (bvsge from!3239 (size!45382 a!3861)))))

(assert (=> d!146723 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775028)))

(declare-fun b!1367533 () Bool)

(assert (=> b!1367533 (= e!775027 call!65473)))

(declare-fun b!1367534 () Bool)

(assert (=> b!1367534 (= e!775029 (contains!9569 acc!866 (select (arr!44830 a!3861) from!3239)))))

(assert (= (and d!146723 (not res!911084)) b!1367530))

(assert (= (and b!1367530 res!911083) b!1367534))

(assert (= (and b!1367530 res!911085) b!1367531))

(assert (= (and b!1367531 c!127666) b!1367532))

(assert (= (and b!1367531 (not c!127666)) b!1367533))

(assert (= (or b!1367532 b!1367533) bm!65470))

(assert (=> b!1367531 m!1251129))

(assert (=> b!1367531 m!1251129))

(assert (=> b!1367531 m!1251131))

(assert (=> bm!65470 m!1251129))

(declare-fun m!1251265 () Bool)

(assert (=> bm!65470 m!1251265))

(assert (=> b!1367530 m!1251129))

(assert (=> b!1367530 m!1251129))

(assert (=> b!1367530 m!1251131))

(assert (=> b!1367534 m!1251129))

(assert (=> b!1367534 m!1251129))

(assert (=> b!1367534 m!1251139))

(assert (=> b!1367362 d!146723))

(declare-fun d!146731 () Bool)

(assert (=> d!146731 (noDuplicate!2484 newAcc!98)))

(declare-fun lt!601730 () Unit!44988)

(declare-fun choose!2007 (List!31976 List!31976) Unit!44988)

(assert (=> d!146731 (= lt!601730 (choose!2007 newAcc!98 acc!866))))

(declare-fun e!775052 () Bool)

(assert (=> d!146731 e!775052))

(declare-fun res!911107 () Bool)

(assert (=> d!146731 (=> (not res!911107) (not e!775052))))

(assert (=> d!146731 (= res!911107 (subseq!1007 newAcc!98 acc!866))))

(assert (=> d!146731 (= (noDuplicateSubseq!194 newAcc!98 acc!866) lt!601730)))

(declare-fun b!1367556 () Bool)

(assert (=> b!1367556 (= e!775052 (noDuplicate!2484 acc!866))))

(assert (= (and d!146731 res!911107) b!1367556))

(assert (=> d!146731 m!1251141))

(declare-fun m!1251281 () Bool)

(assert (=> d!146731 m!1251281))

(assert (=> d!146731 m!1251145))

(assert (=> b!1367556 m!1251133))

(assert (=> b!1367362 d!146731))

(check-sat (not d!146693) (not b!1367440) (not b!1367448) (not b!1367454) (not b!1367530) (not b!1367496) (not b!1367494) (not d!146701) (not b!1367446) (not b!1367492) (not b!1367439) (not d!146699) (not d!146731) (not bm!65470) (not b!1367534) (not b!1367478) (not b!1367495) (not b!1367556) (not b!1367531) (not d!146715) (not d!146717) (not b!1367477))
(check-sat)
