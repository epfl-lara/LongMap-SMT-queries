; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117206 () Bool)

(assert start!117206)

(declare-fun b!1379226 () Bool)

(declare-fun res!921762 () Bool)

(declare-fun e!781308 () Bool)

(assert (=> b!1379226 (=> (not res!921762) (not e!781308))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379226 (= res!921762 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379227 () Bool)

(declare-fun res!921761 () Bool)

(assert (=> b!1379227 (=> (not res!921761) (not e!781308))))

(declare-datatypes ((array!93823 0))(
  ( (array!93824 (arr!45312 (Array (_ BitVec 32) (_ BitVec 64))) (size!45862 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93823)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379227 (= res!921761 (and (bvslt (size!45862 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45862 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379228 () Bool)

(declare-fun e!781309 () Bool)

(assert (=> b!1379228 (= e!781308 e!781309)))

(declare-fun res!921759 () Bool)

(assert (=> b!1379228 (=> (not res!921759) (not e!781309))))

(declare-fun lt!607256 () (_ BitVec 32))

(declare-fun lt!607260 () (_ BitVec 32))

(assert (=> b!1379228 (= res!921759 (and (= lt!607256 (bvsub lt!607260 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607257 () array!93823)

(declare-fun arrayCountValidKeys!0 (array!93823 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379228 (= lt!607256 (arrayCountValidKeys!0 lt!607257 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379228 (= lt!607260 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379228 (= lt!607257 (array!93824 (store (arr!45312 a!4094) i!1451 k0!2953) (size!45862 a!4094)))))

(declare-fun b!1379229 () Bool)

(declare-fun res!921763 () Bool)

(assert (=> b!1379229 (=> (not res!921763) (not e!781308))))

(assert (=> b!1379229 (= res!921763 (validKeyInArray!0 (select (arr!45312 a!4094) i!1451)))))

(declare-fun res!921760 () Bool)

(assert (=> start!117206 (=> (not res!921760) (not e!781308))))

(assert (=> start!117206 (= res!921760 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45862 a!4094))))))

(assert (=> start!117206 e!781308))

(assert (=> start!117206 true))

(declare-fun array_inv!34340 (array!93823) Bool)

(assert (=> start!117206 (array_inv!34340 a!4094)))

(declare-fun b!1379225 () Bool)

(assert (=> b!1379225 (= e!781309 (not (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (size!45862 a!4094)) (bvsge i!1451 (bvsub from!3466 #b00000000000000000000000000000001)))))))

(assert (=> b!1379225 (= (bvadd (arrayCountValidKeys!0 lt!607257 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607256) (arrayCountValidKeys!0 lt!607257 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45851 0))(
  ( (Unit!45852) )
))
(declare-fun lt!607258 () Unit!45851)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45851)

(assert (=> b!1379225 (= lt!607258 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607257 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379225 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607260) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607259 () Unit!45851)

(assert (=> b!1379225 (= lt!607259 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117206 res!921760) b!1379229))

(assert (= (and b!1379229 res!921763) b!1379226))

(assert (= (and b!1379226 res!921762) b!1379227))

(assert (= (and b!1379227 res!921761) b!1379228))

(assert (= (and b!1379228 res!921759) b!1379225))

(declare-fun m!1264205 () Bool)

(assert (=> b!1379225 m!1264205))

(declare-fun m!1264207 () Bool)

(assert (=> b!1379225 m!1264207))

(declare-fun m!1264209 () Bool)

(assert (=> b!1379225 m!1264209))

(declare-fun m!1264211 () Bool)

(assert (=> b!1379225 m!1264211))

(declare-fun m!1264213 () Bool)

(assert (=> b!1379225 m!1264213))

(declare-fun m!1264215 () Bool)

(assert (=> b!1379225 m!1264215))

(declare-fun m!1264217 () Bool)

(assert (=> b!1379229 m!1264217))

(assert (=> b!1379229 m!1264217))

(declare-fun m!1264219 () Bool)

(assert (=> b!1379229 m!1264219))

(declare-fun m!1264221 () Bool)

(assert (=> b!1379226 m!1264221))

(declare-fun m!1264223 () Bool)

(assert (=> b!1379228 m!1264223))

(declare-fun m!1264225 () Bool)

(assert (=> b!1379228 m!1264225))

(declare-fun m!1264227 () Bool)

(assert (=> b!1379228 m!1264227))

(declare-fun m!1264229 () Bool)

(assert (=> start!117206 m!1264229))

(check-sat (not b!1379229) (not start!117206) (not b!1379226) (not b!1379228) (not b!1379225))
(check-sat)
