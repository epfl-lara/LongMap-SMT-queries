; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120224 () Bool)

(assert start!120224)

(declare-fun b!1398586 () Bool)

(declare-fun res!936823 () Bool)

(declare-fun e!791874 () Bool)

(assert (=> b!1398586 (=> (not res!936823) (not e!791874))))

(declare-datatypes ((array!95675 0))(
  ( (array!95676 (arr!46189 (Array (_ BitVec 32) (_ BitVec 64))) (size!46740 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95675)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398586 (= res!936823 (validKeyInArray!0 (select (arr!46189 a!2901) j!112)))))

(declare-fun b!1398587 () Bool)

(declare-fun e!791876 () Bool)

(declare-fun e!791875 () Bool)

(assert (=> b!1398587 (= e!791876 e!791875)))

(declare-fun res!936819 () Bool)

(assert (=> b!1398587 (=> res!936819 e!791875)))

(declare-fun lt!614607 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10409 0))(
  ( (MissingZero!10409 (index!44007 (_ BitVec 32))) (Found!10409 (index!44008 (_ BitVec 32))) (Intermediate!10409 (undefined!11221 Bool) (index!44009 (_ BitVec 32)) (x!125818 (_ BitVec 32))) (Undefined!10409) (MissingVacant!10409 (index!44010 (_ BitVec 32))) )
))
(declare-fun lt!614609 () SeekEntryResult!10409)

(declare-fun lt!614612 () SeekEntryResult!10409)

(get-info :version)

(assert (=> b!1398587 (= res!936819 (or (= lt!614609 lt!614612) (not ((_ is Intermediate!10409) lt!614612)) (bvslt (x!125818 lt!614609) #b00000000000000000000000000000000) (bvsgt (x!125818 lt!614609) #b01111111111111111111111111111110) (bvslt lt!614607 #b00000000000000000000000000000000) (bvsge lt!614607 (size!46740 a!2901)) (bvslt (index!44009 lt!614609) #b00000000000000000000000000000000) (bvsge (index!44009 lt!614609) (size!46740 a!2901)) (not (= lt!614609 (Intermediate!10409 false (index!44009 lt!614609) (x!125818 lt!614609)))) (not (= lt!614612 (Intermediate!10409 (undefined!11221 lt!614612) (index!44009 lt!614612) (x!125818 lt!614612))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!614606 () array!95675)

(declare-fun lt!614610 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95675 (_ BitVec 32)) SeekEntryResult!10409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398587 (= lt!614612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614610 mask!2840) lt!614610 lt!614606 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398587 (= lt!614610 (select (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398587 (= lt!614606 (array!95676 (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46740 a!2901)))))

(declare-fun b!1398588 () Bool)

(assert (=> b!1398588 (= e!791874 (not e!791876))))

(declare-fun res!936817 () Bool)

(assert (=> b!1398588 (=> res!936817 e!791876)))

(assert (=> b!1398588 (= res!936817 (or (not ((_ is Intermediate!10409) lt!614609)) (undefined!11221 lt!614609)))))

(declare-fun e!791872 () Bool)

(assert (=> b!1398588 e!791872))

(declare-fun res!936818 () Bool)

(assert (=> b!1398588 (=> (not res!936818) (not e!791872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95675 (_ BitVec 32)) Bool)

(assert (=> b!1398588 (= res!936818 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46849 0))(
  ( (Unit!46850) )
))
(declare-fun lt!614611 () Unit!46849)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46849)

(assert (=> b!1398588 (= lt!614611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398588 (= lt!614609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614607 (select (arr!46189 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398588 (= lt!614607 (toIndex!0 (select (arr!46189 a!2901) j!112) mask!2840))))

(declare-fun b!1398589 () Bool)

(declare-fun res!936821 () Bool)

(assert (=> b!1398589 (=> (not res!936821) (not e!791874))))

(assert (=> b!1398589 (= res!936821 (validKeyInArray!0 (select (arr!46189 a!2901) i!1037)))))

(declare-fun b!1398590 () Bool)

(declare-fun res!936815 () Bool)

(assert (=> b!1398590 (=> (not res!936815) (not e!791874))))

(assert (=> b!1398590 (= res!936815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398591 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95675 (_ BitVec 32)) SeekEntryResult!10409)

(assert (=> b!1398591 (= e!791872 (= (seekEntryOrOpen!0 (select (arr!46189 a!2901) j!112) a!2901 mask!2840) (Found!10409 j!112)))))

(declare-fun b!1398592 () Bool)

(declare-fun res!936822 () Bool)

(assert (=> b!1398592 (=> (not res!936822) (not e!791874))))

(declare-datatypes ((List!32695 0))(
  ( (Nil!32692) (Cons!32691 (h!33941 (_ BitVec 64)) (t!47381 List!32695)) )
))
(declare-fun arrayNoDuplicates!0 (array!95675 (_ BitVec 32) List!32695) Bool)

(assert (=> b!1398592 (= res!936822 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32692))))

(declare-fun res!936816 () Bool)

(assert (=> start!120224 (=> (not res!936816) (not e!791874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120224 (= res!936816 (validMask!0 mask!2840))))

(assert (=> start!120224 e!791874))

(assert (=> start!120224 true))

(declare-fun array_inv!35470 (array!95675) Bool)

(assert (=> start!120224 (array_inv!35470 a!2901)))

(declare-fun b!1398593 () Bool)

(declare-fun res!936820 () Bool)

(assert (=> b!1398593 (=> (not res!936820) (not e!791874))))

(assert (=> b!1398593 (= res!936820 (and (= (size!46740 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46740 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46740 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398594 () Bool)

(assert (=> b!1398594 (= e!791875 true)))

(declare-fun lt!614608 () SeekEntryResult!10409)

(assert (=> b!1398594 (= lt!614608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614607 lt!614610 lt!614606 mask!2840))))

(assert (= (and start!120224 res!936816) b!1398593))

(assert (= (and b!1398593 res!936820) b!1398589))

(assert (= (and b!1398589 res!936821) b!1398586))

(assert (= (and b!1398586 res!936823) b!1398590))

(assert (= (and b!1398590 res!936815) b!1398592))

(assert (= (and b!1398592 res!936822) b!1398588))

(assert (= (and b!1398588 res!936818) b!1398591))

(assert (= (and b!1398588 (not res!936817)) b!1398587))

(assert (= (and b!1398587 (not res!936819)) b!1398594))

(declare-fun m!1285591 () Bool)

(assert (=> start!120224 m!1285591))

(declare-fun m!1285593 () Bool)

(assert (=> start!120224 m!1285593))

(declare-fun m!1285595 () Bool)

(assert (=> b!1398589 m!1285595))

(assert (=> b!1398589 m!1285595))

(declare-fun m!1285597 () Bool)

(assert (=> b!1398589 m!1285597))

(declare-fun m!1285599 () Bool)

(assert (=> b!1398588 m!1285599))

(declare-fun m!1285601 () Bool)

(assert (=> b!1398588 m!1285601))

(assert (=> b!1398588 m!1285599))

(declare-fun m!1285603 () Bool)

(assert (=> b!1398588 m!1285603))

(assert (=> b!1398588 m!1285599))

(declare-fun m!1285605 () Bool)

(assert (=> b!1398588 m!1285605))

(declare-fun m!1285607 () Bool)

(assert (=> b!1398588 m!1285607))

(declare-fun m!1285609 () Bool)

(assert (=> b!1398590 m!1285609))

(assert (=> b!1398591 m!1285599))

(assert (=> b!1398591 m!1285599))

(declare-fun m!1285611 () Bool)

(assert (=> b!1398591 m!1285611))

(declare-fun m!1285613 () Bool)

(assert (=> b!1398587 m!1285613))

(assert (=> b!1398587 m!1285613))

(declare-fun m!1285615 () Bool)

(assert (=> b!1398587 m!1285615))

(declare-fun m!1285617 () Bool)

(assert (=> b!1398587 m!1285617))

(declare-fun m!1285619 () Bool)

(assert (=> b!1398587 m!1285619))

(assert (=> b!1398586 m!1285599))

(assert (=> b!1398586 m!1285599))

(declare-fun m!1285621 () Bool)

(assert (=> b!1398586 m!1285621))

(declare-fun m!1285623 () Bool)

(assert (=> b!1398592 m!1285623))

(declare-fun m!1285625 () Bool)

(assert (=> b!1398594 m!1285625))

(check-sat (not b!1398590) (not b!1398586) (not start!120224) (not b!1398594) (not b!1398587) (not b!1398591) (not b!1398588) (not b!1398592) (not b!1398589))
(check-sat)
