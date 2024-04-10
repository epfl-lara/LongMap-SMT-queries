; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136768 () Bool)

(assert start!136768)

(declare-fun b!1578625 () Bool)

(declare-fun res!1078563 () Bool)

(declare-fun e!880504 () Bool)

(assert (=> b!1578625 (=> (not res!1078563) (not e!880504))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105766 0))(
  ( (array!105767 (arr!50993 (Array (_ BitVec 32) (_ BitVec 64))) (size!51543 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105766)

(assert (=> b!1578625 (= res!1078563 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51543 a!3559))))))

(declare-fun b!1578626 () Bool)

(declare-fun res!1078564 () Bool)

(assert (=> b!1578626 (=> (not res!1078564) (not e!880504))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578626 (= res!1078564 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078566 () Bool)

(assert (=> start!136768 (=> (not res!1078566) (not e!880504))))

(assert (=> start!136768 (= res!1078566 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51543 a!3559)) (bvslt (size!51543 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136768 e!880504))

(assert (=> start!136768 true))

(declare-fun array_inv!39720 (array!105766) Bool)

(assert (=> start!136768 (array_inv!39720 a!3559)))

(declare-fun b!1578624 () Bool)

(declare-fun res!1078565 () Bool)

(assert (=> b!1578624 (=> (not res!1078565) (not e!880504))))

(assert (=> b!1578624 (= res!1078565 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578627 () Bool)

(assert (=> b!1578627 (= e!880504 (not true))))

(assert (=> b!1578627 (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52188 0))(
  ( (Unit!52189) )
))
(declare-fun lt!676318 () Unit!52188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105766 (_ BitVec 64) (_ BitVec 32)) Unit!52188)

(assert (=> b!1578627 (= lt!676318 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136768 res!1078566) b!1578624))

(assert (= (and b!1578624 res!1078565) b!1578625))

(assert (= (and b!1578625 res!1078563) b!1578626))

(assert (= (and b!1578626 res!1078564) b!1578627))

(declare-fun m!1450691 () Bool)

(assert (=> b!1578626 m!1450691))

(declare-fun m!1450693 () Bool)

(assert (=> start!136768 m!1450693))

(declare-fun m!1450695 () Bool)

(assert (=> b!1578624 m!1450695))

(declare-fun m!1450697 () Bool)

(assert (=> b!1578627 m!1450697))

(declare-fun m!1450699 () Bool)

(assert (=> b!1578627 m!1450699))

(check-sat (not b!1578626) (not start!136768) (not b!1578627) (not b!1578624))
