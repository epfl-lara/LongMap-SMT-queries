; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137014 () Bool)

(assert start!137014)

(declare-fun b!1580475 () Bool)

(declare-fun e!881693 () Bool)

(declare-fun lt!677064 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1580475 (= e!881693 (or (bvslt lt!677064 #b00000000000000000000000000000000) (bvsge lt!677064 (bvadd #b00000000000000000000000000000001 mask!918))))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580475 (= lt!677064 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580472 () Bool)

(declare-fun res!1078943 () Bool)

(assert (=> b!1580472 (=> (not res!1078943) (not e!881693))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-datatypes ((array!105797 0))(
  ( (array!105798 (arr!51004 (Array (_ BitVec 32) (_ BitVec 64))) (size!51555 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105797)

(assert (=> b!1580472 (= res!1078943 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51555 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51004 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1078944 () Bool)

(assert (=> start!137014 (=> (not res!1078944) (not e!881693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137014 (= res!1078944 (validMask!0 mask!918))))

(assert (=> start!137014 e!881693))

(assert (=> start!137014 true))

(declare-fun array_inv!39959 (array!105797) Bool)

(assert (=> start!137014 (array_inv!39959 _keys!614)))

(declare-fun b!1580473 () Bool)

(declare-fun res!1078945 () Bool)

(assert (=> b!1580473 (=> (not res!1078945) (not e!881693))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580473 (= res!1078945 (validKeyInArray!0 k0!772))))

(declare-fun b!1580474 () Bool)

(declare-fun res!1078946 () Bool)

(assert (=> b!1580474 (=> (not res!1078946) (not e!881693))))

(assert (=> b!1580474 (= res!1078946 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51004 _keys!614) ee!18) k0!772)) (not (= (select (arr!51004 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137014 res!1078944) b!1580472))

(assert (= (and b!1580472 res!1078943) b!1580473))

(assert (= (and b!1580473 res!1078945) b!1580474))

(assert (= (and b!1580474 res!1078946) b!1580475))

(declare-fun m!1452387 () Bool)

(assert (=> b!1580473 m!1452387))

(declare-fun m!1452389 () Bool)

(assert (=> b!1580474 m!1452389))

(declare-fun m!1452391 () Bool)

(assert (=> b!1580472 m!1452391))

(declare-fun m!1452393 () Bool)

(assert (=> b!1580475 m!1452393))

(declare-fun m!1452395 () Bool)

(assert (=> start!137014 m!1452395))

(declare-fun m!1452397 () Bool)

(assert (=> start!137014 m!1452397))

(check-sat (not start!137014) (not b!1580475) (not b!1580473))
(check-sat)
(get-model)

(declare-fun d!166717 () Bool)

(assert (=> d!166717 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!137014 d!166717))

(declare-fun d!166719 () Bool)

(assert (=> d!166719 (= (array_inv!39959 _keys!614) (bvsge (size!51555 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!137014 d!166719))

(declare-fun d!166723 () Bool)

(declare-fun lt!677073 () (_ BitVec 32))

(assert (=> d!166723 (and (bvsge lt!677073 #b00000000000000000000000000000000) (bvslt lt!677073 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166723 (= lt!677073 (choose!52 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(assert (=> d!166723 (validMask!0 mask!918)))

(assert (=> d!166723 (= (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) lt!677073)))

(declare-fun bs!45640 () Bool)

(assert (= bs!45640 d!166723))

(declare-fun m!1452423 () Bool)

(assert (=> bs!45640 m!1452423))

(assert (=> bs!45640 m!1452395))

(assert (=> b!1580475 d!166723))

(declare-fun d!166725 () Bool)

(assert (=> d!166725 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1580473 d!166725))

(check-sat (not d!166723))
(check-sat)
