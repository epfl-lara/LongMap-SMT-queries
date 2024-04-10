; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136756 () Bool)

(assert start!136756)

(declare-fun b!1578555 () Bool)

(declare-fun e!880468 () Bool)

(assert (=> b!1578555 (= e!880468 (not true))))

(declare-datatypes ((array!105754 0))(
  ( (array!105755 (arr!50987 (Array (_ BitVec 32) (_ BitVec 64))) (size!51537 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105754)

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578555 (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((Unit!52176 0))(
  ( (Unit!52177) )
))
(declare-fun lt!676300 () Unit!52176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105754 (_ BitVec 64) (_ BitVec 32)) Unit!52176)

(assert (=> b!1578555 (= lt!676300 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578552 () Bool)

(declare-fun res!1078493 () Bool)

(assert (=> b!1578552 (=> (not res!1078493) (not e!880468))))

(assert (=> b!1578552 (= res!1078493 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578553 () Bool)

(declare-fun res!1078492 () Bool)

(assert (=> b!1578553 (=> (not res!1078492) (not e!880468))))

(assert (=> b!1578553 (= res!1078492 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51537 a!3559))))))

(declare-fun res!1078494 () Bool)

(assert (=> start!136756 (=> (not res!1078494) (not e!880468))))

(assert (=> start!136756 (= res!1078494 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51537 a!3559)) (bvslt (size!51537 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136756 e!880468))

(assert (=> start!136756 true))

(declare-fun array_inv!39714 (array!105754) Bool)

(assert (=> start!136756 (array_inv!39714 a!3559)))

(declare-fun b!1578554 () Bool)

(declare-fun res!1078491 () Bool)

(assert (=> b!1578554 (=> (not res!1078491) (not e!880468))))

(assert (=> b!1578554 (= res!1078491 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136756 res!1078494) b!1578552))

(assert (= (and b!1578552 res!1078493) b!1578553))

(assert (= (and b!1578553 res!1078492) b!1578554))

(assert (= (and b!1578554 res!1078491) b!1578555))

(declare-fun m!1450631 () Bool)

(assert (=> b!1578555 m!1450631))

(declare-fun m!1450633 () Bool)

(assert (=> b!1578555 m!1450633))

(declare-fun m!1450635 () Bool)

(assert (=> b!1578552 m!1450635))

(declare-fun m!1450637 () Bool)

(assert (=> start!136756 m!1450637))

(declare-fun m!1450639 () Bool)

(assert (=> b!1578554 m!1450639))

(check-sat (not b!1578552) (not b!1578554) (not start!136756) (not b!1578555))
