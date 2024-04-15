; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136726 () Bool)

(assert start!136726)

(declare-fun b!1578266 () Bool)

(declare-fun e!880282 () Bool)

(declare-datatypes ((array!105689 0))(
  ( (array!105690 (arr!50954 (Array (_ BitVec 32) (_ BitVec 64))) (size!51506 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105689)

(assert (=> b!1578266 (= e!880282 (not (bvslt #b00000000000000000000000000000000 (size!51506 a!3559))))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578266 (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51989 0))(
  ( (Unit!51990) )
))
(declare-fun lt!676023 () Unit!51989)

(declare-fun from!2937 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105689 (_ BitVec 64) (_ BitVec 32)) Unit!51989)

(assert (=> b!1578266 (= lt!676023 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578264 () Bool)

(declare-fun res!1078389 () Bool)

(assert (=> b!1578264 (=> (not res!1078389) (not e!880282))))

(assert (=> b!1578264 (= res!1078389 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51506 a!3559))))))

(declare-fun b!1578263 () Bool)

(declare-fun res!1078387 () Bool)

(assert (=> b!1578263 (=> (not res!1078387) (not e!880282))))

(assert (=> b!1578263 (= res!1078387 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578265 () Bool)

(declare-fun res!1078386 () Bool)

(assert (=> b!1578265 (=> (not res!1078386) (not e!880282))))

(assert (=> b!1578265 (= res!1078386 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078388 () Bool)

(assert (=> start!136726 (=> (not res!1078388) (not e!880282))))

(assert (=> start!136726 (= res!1078388 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51506 a!3559)) (bvslt (size!51506 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136726 e!880282))

(assert (=> start!136726 true))

(declare-fun array_inv!39890 (array!105689) Bool)

(assert (=> start!136726 (array_inv!39890 a!3559)))

(assert (= (and start!136726 res!1078388) b!1578263))

(assert (= (and b!1578263 res!1078387) b!1578264))

(assert (= (and b!1578264 res!1078389) b!1578265))

(assert (= (and b!1578265 res!1078386) b!1578266))

(declare-fun m!1449771 () Bool)

(assert (=> b!1578266 m!1449771))

(declare-fun m!1449773 () Bool)

(assert (=> b!1578266 m!1449773))

(declare-fun m!1449775 () Bool)

(assert (=> b!1578263 m!1449775))

(declare-fun m!1449777 () Bool)

(assert (=> b!1578265 m!1449777))

(declare-fun m!1449779 () Bool)

(assert (=> start!136726 m!1449779))

(check-sat (not b!1578263) (not b!1578266) (not start!136726) (not b!1578265))
(check-sat)
