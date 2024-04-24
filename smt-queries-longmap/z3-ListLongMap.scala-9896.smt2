; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117352 () Bool)

(assert start!117352)

(declare-fun b!1379883 () Bool)

(declare-fun res!921628 () Bool)

(declare-fun e!781810 () Bool)

(assert (=> b!1379883 (=> (not res!921628) (not e!781810))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379883 (= res!921628 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921629 () Bool)

(assert (=> start!117352 (=> (not res!921629) (not e!781810))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93853 0))(
  ( (array!93854 (arr!45322 (Array (_ BitVec 32) (_ BitVec 64))) (size!45873 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93853)

(assert (=> start!117352 (= res!921629 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45873 a!4094))))))

(assert (=> start!117352 e!781810))

(assert (=> start!117352 true))

(declare-fun array_inv!34603 (array!93853) Bool)

(assert (=> start!117352 (array_inv!34603 a!4094)))

(declare-fun b!1379884 () Bool)

(declare-fun e!781809 () Bool)

(assert (=> b!1379884 (= e!781810 e!781809)))

(declare-fun res!921632 () Bool)

(assert (=> b!1379884 (=> (not res!921632) (not e!781809))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607290 () (_ BitVec 32))

(declare-fun lt!607288 () (_ BitVec 32))

(assert (=> b!1379884 (= res!921632 (and (= lt!607290 (bvsub lt!607288 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607284 () array!93853)

(declare-fun arrayCountValidKeys!0 (array!93853 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379884 (= lt!607290 (arrayCountValidKeys!0 lt!607284 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379884 (= lt!607288 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379884 (= lt!607284 (array!93854 (store (arr!45322 a!4094) i!1451 k0!2953) (size!45873 a!4094)))))

(declare-fun b!1379885 () Bool)

(declare-fun res!921631 () Bool)

(assert (=> b!1379885 (=> (not res!921631) (not e!781810))))

(assert (=> b!1379885 (= res!921631 (and (bvslt (size!45873 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45873 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379886 () Bool)

(declare-fun e!781812 () Bool)

(assert (=> b!1379886 (= e!781809 (not e!781812))))

(declare-fun res!921633 () Bool)

(assert (=> b!1379886 (=> res!921633 e!781812)))

(declare-fun lt!607291 () (_ BitVec 32))

(declare-fun lt!607289 () (_ BitVec 32))

(assert (=> b!1379886 (= res!921633 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45873 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607291 (bvsub lt!607289 #b00000000000000000000000000000001)))))))

(declare-fun lt!607283 () (_ BitVec 32))

(assert (=> b!1379886 (= (bvadd lt!607283 lt!607290) lt!607291)))

(assert (=> b!1379886 (= lt!607291 (arrayCountValidKeys!0 lt!607284 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379886 (= lt!607283 (arrayCountValidKeys!0 lt!607284 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45740 0))(
  ( (Unit!45741) )
))
(declare-fun lt!607286 () Unit!45740)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45740)

(assert (=> b!1379886 (= lt!607286 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607284 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607282 () (_ BitVec 32))

(assert (=> b!1379886 (= (bvadd lt!607282 lt!607288) lt!607289)))

(assert (=> b!1379886 (= lt!607289 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379886 (= lt!607282 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607287 () Unit!45740)

(assert (=> b!1379886 (= lt!607287 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379887 () Bool)

(assert (=> b!1379887 (= e!781812 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379887 (= (arrayCountValidKeys!0 lt!607284 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607285 () Unit!45740)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93853 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45740)

(assert (=> b!1379887 (= lt!607285 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379888 () Bool)

(declare-fun res!921630 () Bool)

(assert (=> b!1379888 (=> (not res!921630) (not e!781810))))

(assert (=> b!1379888 (= res!921630 (validKeyInArray!0 (select (arr!45322 a!4094) i!1451)))))

(assert (= (and start!117352 res!921629) b!1379888))

(assert (= (and b!1379888 res!921630) b!1379883))

(assert (= (and b!1379883 res!921628) b!1379885))

(assert (= (and b!1379885 res!921631) b!1379884))

(assert (= (and b!1379884 res!921632) b!1379886))

(assert (= (and b!1379886 (not res!921633)) b!1379887))

(declare-fun m!1264939 () Bool)

(assert (=> start!117352 m!1264939))

(declare-fun m!1264941 () Bool)

(assert (=> b!1379884 m!1264941))

(declare-fun m!1264943 () Bool)

(assert (=> b!1379884 m!1264943))

(declare-fun m!1264945 () Bool)

(assert (=> b!1379884 m!1264945))

(declare-fun m!1264947 () Bool)

(assert (=> b!1379883 m!1264947))

(declare-fun m!1264949 () Bool)

(assert (=> b!1379886 m!1264949))

(declare-fun m!1264951 () Bool)

(assert (=> b!1379886 m!1264951))

(declare-fun m!1264953 () Bool)

(assert (=> b!1379886 m!1264953))

(declare-fun m!1264955 () Bool)

(assert (=> b!1379886 m!1264955))

(declare-fun m!1264957 () Bool)

(assert (=> b!1379886 m!1264957))

(declare-fun m!1264959 () Bool)

(assert (=> b!1379886 m!1264959))

(declare-fun m!1264961 () Bool)

(assert (=> b!1379888 m!1264961))

(assert (=> b!1379888 m!1264961))

(declare-fun m!1264963 () Bool)

(assert (=> b!1379888 m!1264963))

(declare-fun m!1264965 () Bool)

(assert (=> b!1379887 m!1264965))

(declare-fun m!1264967 () Bool)

(assert (=> b!1379887 m!1264967))

(declare-fun m!1264969 () Bool)

(assert (=> b!1379887 m!1264969))

(check-sat (not b!1379887) (not b!1379888) (not b!1379886) (not b!1379883) (not b!1379884) (not start!117352))
(check-sat)
