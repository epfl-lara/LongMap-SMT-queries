; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101976 () Bool)

(assert start!101976)

(declare-fun b!1227715 () Bool)

(declare-fun res!816327 () Bool)

(declare-fun e!697049 () Bool)

(assert (=> b!1227715 (=> (not res!816327) (not e!697049))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79249 0))(
  ( (array!79250 (arr!38247 (Array (_ BitVec 32) (_ BitVec 64))) (size!38783 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79249)

(assert (=> b!1227715 (= res!816327 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38783 a!3806)) (bvslt from!3184 (size!38783 a!3806))))))

(declare-fun b!1227716 () Bool)

(declare-fun res!816336 () Bool)

(assert (=> b!1227716 (=> (not res!816336) (not e!697049))))

(declare-datatypes ((List!27020 0))(
  ( (Nil!27017) (Cons!27016 (h!28225 (_ BitVec 64)) (t!40483 List!27020)) )
))
(declare-fun acc!823 () List!27020)

(declare-fun arrayNoDuplicates!0 (array!79249 (_ BitVec 32) List!27020) Bool)

(assert (=> b!1227716 (= res!816336 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227717 () Bool)

(declare-fun res!816329 () Bool)

(assert (=> b!1227717 (=> (not res!816329) (not e!697049))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227717 (= res!816329 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227718 () Bool)

(declare-fun res!816338 () Bool)

(declare-fun e!697047 () Bool)

(assert (=> b!1227718 (=> res!816338 e!697047)))

(declare-fun contains!7082 (List!27020 (_ BitVec 64)) Bool)

(assert (=> b!1227718 (= res!816338 (contains!7082 Nil!27017 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227719 () Bool)

(declare-fun res!816332 () Bool)

(assert (=> b!1227719 (=> (not res!816332) (not e!697049))))

(assert (=> b!1227719 (= res!816332 (not (contains!7082 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227721 () Bool)

(declare-fun res!816335 () Bool)

(assert (=> b!1227721 (=> (not res!816335) (not e!697049))))

(declare-fun noDuplicate!1679 (List!27020) Bool)

(assert (=> b!1227721 (= res!816335 (noDuplicate!1679 acc!823))))

(declare-fun b!1227722 () Bool)

(declare-fun res!816334 () Bool)

(assert (=> b!1227722 (=> res!816334 e!697047)))

(declare-fun subseq!486 (List!27020 List!27020) Bool)

(assert (=> b!1227722 (= res!816334 (not (subseq!486 Nil!27017 acc!823)))))

(declare-fun b!1227723 () Bool)

(declare-fun res!816339 () Bool)

(assert (=> b!1227723 (=> (not res!816339) (not e!697049))))

(assert (=> b!1227723 (= res!816339 (validKeyInArray!0 (select (arr!38247 a!3806) from!3184)))))

(declare-fun b!1227724 () Bool)

(declare-fun res!816333 () Bool)

(assert (=> b!1227724 (=> (not res!816333) (not e!697049))))

(declare-fun arrayContainsKey!0 (array!79249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227724 (= res!816333 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227725 () Bool)

(declare-fun res!816331 () Bool)

(assert (=> b!1227725 (=> (not res!816331) (not e!697049))))

(assert (=> b!1227725 (= res!816331 (not (contains!7082 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816330 () Bool)

(assert (=> start!101976 (=> (not res!816330) (not e!697049))))

(assert (=> start!101976 (= res!816330 (bvslt (size!38783 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101976 e!697049))

(declare-fun array_inv!29095 (array!79249) Bool)

(assert (=> start!101976 (array_inv!29095 a!3806)))

(assert (=> start!101976 true))

(declare-fun b!1227720 () Bool)

(assert (=> b!1227720 (= e!697049 (not e!697047))))

(declare-fun res!816328 () Bool)

(assert (=> b!1227720 (=> res!816328 e!697047)))

(assert (=> b!1227720 (= res!816328 (bvsgt from!3184 (size!38783 a!3806)))))

(assert (=> b!1227720 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27016 (select (arr!38247 a!3806) from!3184) acc!823))))

(declare-fun b!1227726 () Bool)

(assert (=> b!1227726 (= e!697047 true)))

(declare-datatypes ((Unit!40660 0))(
  ( (Unit!40661) )
))
(declare-fun lt!558936 () Unit!40660)

(declare-fun noDuplicateSubseq!39 (List!27020 List!27020) Unit!40660)

(assert (=> b!1227726 (= lt!558936 (noDuplicateSubseq!39 Nil!27017 acc!823))))

(declare-fun b!1227727 () Bool)

(declare-fun res!816337 () Bool)

(assert (=> b!1227727 (=> res!816337 e!697047)))

(assert (=> b!1227727 (= res!816337 (contains!7082 Nil!27017 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!101976 res!816330) b!1227717))

(assert (= (and b!1227717 res!816329) b!1227715))

(assert (= (and b!1227715 res!816327) b!1227721))

(assert (= (and b!1227721 res!816335) b!1227725))

(assert (= (and b!1227725 res!816331) b!1227719))

(assert (= (and b!1227719 res!816332) b!1227724))

(assert (= (and b!1227724 res!816333) b!1227716))

(assert (= (and b!1227716 res!816336) b!1227723))

(assert (= (and b!1227723 res!816339) b!1227720))

(assert (= (and b!1227720 (not res!816328)) b!1227727))

(assert (= (and b!1227727 (not res!816337)) b!1227718))

(assert (= (and b!1227718 (not res!816338)) b!1227722))

(assert (= (and b!1227722 (not res!816334)) b!1227726))

(declare-fun m!1132423 () Bool)

(assert (=> b!1227720 m!1132423))

(declare-fun m!1132425 () Bool)

(assert (=> b!1227720 m!1132425))

(assert (=> b!1227723 m!1132423))

(assert (=> b!1227723 m!1132423))

(declare-fun m!1132427 () Bool)

(assert (=> b!1227723 m!1132427))

(declare-fun m!1132429 () Bool)

(assert (=> b!1227727 m!1132429))

(declare-fun m!1132431 () Bool)

(assert (=> b!1227724 m!1132431))

(declare-fun m!1132433 () Bool)

(assert (=> b!1227717 m!1132433))

(declare-fun m!1132435 () Bool)

(assert (=> b!1227722 m!1132435))

(declare-fun m!1132437 () Bool)

(assert (=> b!1227719 m!1132437))

(declare-fun m!1132439 () Bool)

(assert (=> start!101976 m!1132439))

(declare-fun m!1132441 () Bool)

(assert (=> b!1227716 m!1132441))

(declare-fun m!1132443 () Bool)

(assert (=> b!1227726 m!1132443))

(declare-fun m!1132445 () Bool)

(assert (=> b!1227718 m!1132445))

(declare-fun m!1132447 () Bool)

(assert (=> b!1227725 m!1132447))

(declare-fun m!1132449 () Bool)

(assert (=> b!1227721 m!1132449))

(check-sat (not b!1227717) (not b!1227721) (not start!101976) (not b!1227722) (not b!1227720) (not b!1227718) (not b!1227727) (not b!1227726) (not b!1227724) (not b!1227723) (not b!1227716) (not b!1227719) (not b!1227725))
(check-sat)
