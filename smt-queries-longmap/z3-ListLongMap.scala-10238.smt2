; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120668 () Bool)

(assert start!120668)

(declare-fun b!1404005 () Bool)

(declare-fun res!941833 () Bool)

(declare-fun e!795090 () Bool)

(assert (=> b!1404005 (=> (not res!941833) (not e!795090))))

(declare-datatypes ((array!95999 0))(
  ( (array!96000 (arr!46348 (Array (_ BitVec 32) (_ BitVec 64))) (size!46899 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95999)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404005 (= res!941833 (validKeyInArray!0 (select (arr!46348 a!2901) i!1037)))))

(declare-fun b!1404006 () Bool)

(declare-fun e!795094 () Bool)

(declare-fun lt!618544 () (_ BitVec 64))

(assert (=> b!1404006 (= e!795094 (validKeyInArray!0 lt!618544))))

(declare-fun b!1404007 () Bool)

(declare-fun e!795093 () Bool)

(assert (=> b!1404007 (= e!795093 e!795094)))

(declare-fun res!941836 () Bool)

(assert (=> b!1404007 (=> res!941836 e!795094)))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1404007 (= res!941836 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10568 0))(
  ( (MissingZero!10568 (index!44649 (_ BitVec 32))) (Found!10568 (index!44650 (_ BitVec 32))) (Intermediate!10568 (undefined!11380 Bool) (index!44651 (_ BitVec 32)) (x!126422 (_ BitVec 32))) (Undefined!10568) (MissingVacant!10568 (index!44652 (_ BitVec 32))) )
))
(declare-fun lt!618551 () SeekEntryResult!10568)

(declare-fun lt!618542 () SeekEntryResult!10568)

(assert (=> b!1404007 (= lt!618551 lt!618542)))

(declare-fun lt!618549 () SeekEntryResult!10568)

(declare-datatypes ((Unit!47167 0))(
  ( (Unit!47168) )
))
(declare-fun lt!618545 () Unit!47167)

(declare-fun lt!618550 () SeekEntryResult!10568)

(declare-fun lt!618546 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47167)

(assert (=> b!1404007 (= lt!618545 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618546 (x!126422 lt!618549) (index!44651 lt!618549) (x!126422 lt!618550) (index!44651 lt!618550) mask!2840))))

(declare-fun res!941839 () Bool)

(assert (=> start!120668 (=> (not res!941839) (not e!795090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120668 (= res!941839 (validMask!0 mask!2840))))

(assert (=> start!120668 e!795090))

(assert (=> start!120668 true))

(declare-fun array_inv!35629 (array!95999) Bool)

(assert (=> start!120668 (array_inv!35629 a!2901)))

(declare-fun b!1404008 () Bool)

(declare-fun e!795092 () Bool)

(assert (=> b!1404008 (= e!795092 e!795093)))

(declare-fun res!941835 () Bool)

(assert (=> b!1404008 (=> res!941835 e!795093)))

(assert (=> b!1404008 (= res!941835 (or (bvslt (x!126422 lt!618549) #b00000000000000000000000000000000) (bvsgt (x!126422 lt!618549) #b01111111111111111111111111111110) (bvslt (x!126422 lt!618550) #b00000000000000000000000000000000) (bvsgt (x!126422 lt!618550) #b01111111111111111111111111111110) (bvslt lt!618546 #b00000000000000000000000000000000) (bvsge lt!618546 (size!46899 a!2901)) (bvslt (index!44651 lt!618549) #b00000000000000000000000000000000) (bvsge (index!44651 lt!618549) (size!46899 a!2901)) (bvslt (index!44651 lt!618550) #b00000000000000000000000000000000) (bvsge (index!44651 lt!618550) (size!46899 a!2901)) (not (= lt!618549 (Intermediate!10568 false (index!44651 lt!618549) (x!126422 lt!618549)))) (not (= lt!618550 (Intermediate!10568 false (index!44651 lt!618550) (x!126422 lt!618550))))))))

(declare-fun lt!618548 () array!95999)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95999 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1404008 (= lt!618542 (seekKeyOrZeroReturnVacant!0 (x!126422 lt!618550) (index!44651 lt!618550) (index!44651 lt!618550) (select (arr!46348 a!2901) j!112) lt!618548 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95999 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1404008 (= lt!618542 (seekEntryOrOpen!0 lt!618544 lt!618548 mask!2840))))

(assert (=> b!1404008 (and (not (undefined!11380 lt!618550)) (= (index!44651 lt!618550) i!1037) (bvslt (x!126422 lt!618550) (x!126422 lt!618549)) (= (select (store (arr!46348 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44651 lt!618550)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618543 () Unit!47167)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47167)

(assert (=> b!1404008 (= lt!618543 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618546 (x!126422 lt!618549) (index!44651 lt!618549) (x!126422 lt!618550) (index!44651 lt!618550) (undefined!11380 lt!618550) mask!2840))))

(declare-fun b!1404009 () Bool)

(declare-fun e!795095 () Bool)

(assert (=> b!1404009 (= e!795095 e!795092)))

(declare-fun res!941841 () Bool)

(assert (=> b!1404009 (=> res!941841 e!795092)))

(get-info :version)

(assert (=> b!1404009 (= res!941841 (or (= lt!618549 lt!618550) (not ((_ is Intermediate!10568) lt!618550))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95999 (_ BitVec 32)) SeekEntryResult!10568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404009 (= lt!618550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618544 mask!2840) lt!618544 lt!618548 mask!2840))))

(assert (=> b!1404009 (= lt!618544 (select (store (arr!46348 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1404009 (= lt!618548 (array!96000 (store (arr!46348 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46899 a!2901)))))

(declare-fun b!1404010 () Bool)

(declare-fun res!941837 () Bool)

(assert (=> b!1404010 (=> (not res!941837) (not e!795090))))

(declare-datatypes ((List!32854 0))(
  ( (Nil!32851) (Cons!32850 (h!34106 (_ BitVec 64)) (t!47540 List!32854)) )
))
(declare-fun arrayNoDuplicates!0 (array!95999 (_ BitVec 32) List!32854) Bool)

(assert (=> b!1404010 (= res!941837 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32851))))

(declare-fun b!1404011 () Bool)

(declare-fun res!941842 () Bool)

(assert (=> b!1404011 (=> (not res!941842) (not e!795090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95999 (_ BitVec 32)) Bool)

(assert (=> b!1404011 (= res!941842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404012 () Bool)

(declare-fun res!941840 () Bool)

(assert (=> b!1404012 (=> res!941840 e!795093)))

(assert (=> b!1404012 (= res!941840 (not (= lt!618550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618546 lt!618544 lt!618548 mask!2840))))))

(declare-fun b!1404013 () Bool)

(declare-fun res!941838 () Bool)

(assert (=> b!1404013 (=> (not res!941838) (not e!795090))))

(assert (=> b!1404013 (= res!941838 (and (= (size!46899 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46899 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46899 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404014 () Bool)

(declare-fun res!941834 () Bool)

(assert (=> b!1404014 (=> (not res!941834) (not e!795090))))

(assert (=> b!1404014 (= res!941834 (validKeyInArray!0 (select (arr!46348 a!2901) j!112)))))

(declare-fun b!1404015 () Bool)

(assert (=> b!1404015 (= e!795090 (not e!795095))))

(declare-fun res!941832 () Bool)

(assert (=> b!1404015 (=> res!941832 e!795095)))

(assert (=> b!1404015 (= res!941832 (or (not ((_ is Intermediate!10568) lt!618549)) (undefined!11380 lt!618549)))))

(assert (=> b!1404015 (= lt!618551 (Found!10568 j!112))))

(assert (=> b!1404015 (= lt!618551 (seekEntryOrOpen!0 (select (arr!46348 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1404015 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618547 () Unit!47167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47167)

(assert (=> b!1404015 (= lt!618547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404015 (= lt!618549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618546 (select (arr!46348 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1404015 (= lt!618546 (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840))))

(assert (= (and start!120668 res!941839) b!1404013))

(assert (= (and b!1404013 res!941838) b!1404005))

(assert (= (and b!1404005 res!941833) b!1404014))

(assert (= (and b!1404014 res!941834) b!1404011))

(assert (= (and b!1404011 res!941842) b!1404010))

(assert (= (and b!1404010 res!941837) b!1404015))

(assert (= (and b!1404015 (not res!941832)) b!1404009))

(assert (= (and b!1404009 (not res!941841)) b!1404008))

(assert (= (and b!1404008 (not res!941835)) b!1404012))

(assert (= (and b!1404012 (not res!941840)) b!1404007))

(assert (= (and b!1404007 (not res!941836)) b!1404006))

(declare-fun m!1292623 () Bool)

(assert (=> b!1404010 m!1292623))

(declare-fun m!1292625 () Bool)

(assert (=> b!1404006 m!1292625))

(declare-fun m!1292627 () Bool)

(assert (=> b!1404014 m!1292627))

(assert (=> b!1404014 m!1292627))

(declare-fun m!1292629 () Bool)

(assert (=> b!1404014 m!1292629))

(declare-fun m!1292631 () Bool)

(assert (=> b!1404011 m!1292631))

(declare-fun m!1292633 () Bool)

(assert (=> start!120668 m!1292633))

(declare-fun m!1292635 () Bool)

(assert (=> start!120668 m!1292635))

(declare-fun m!1292637 () Bool)

(assert (=> b!1404012 m!1292637))

(assert (=> b!1404015 m!1292627))

(declare-fun m!1292639 () Bool)

(assert (=> b!1404015 m!1292639))

(assert (=> b!1404015 m!1292627))

(declare-fun m!1292641 () Bool)

(assert (=> b!1404015 m!1292641))

(assert (=> b!1404015 m!1292627))

(declare-fun m!1292643 () Bool)

(assert (=> b!1404015 m!1292643))

(declare-fun m!1292645 () Bool)

(assert (=> b!1404015 m!1292645))

(assert (=> b!1404015 m!1292627))

(declare-fun m!1292647 () Bool)

(assert (=> b!1404015 m!1292647))

(declare-fun m!1292649 () Bool)

(assert (=> b!1404009 m!1292649))

(assert (=> b!1404009 m!1292649))

(declare-fun m!1292651 () Bool)

(assert (=> b!1404009 m!1292651))

(declare-fun m!1292653 () Bool)

(assert (=> b!1404009 m!1292653))

(declare-fun m!1292655 () Bool)

(assert (=> b!1404009 m!1292655))

(assert (=> b!1404008 m!1292627))

(declare-fun m!1292657 () Bool)

(assert (=> b!1404008 m!1292657))

(declare-fun m!1292659 () Bool)

(assert (=> b!1404008 m!1292659))

(assert (=> b!1404008 m!1292653))

(assert (=> b!1404008 m!1292627))

(declare-fun m!1292661 () Bool)

(assert (=> b!1404008 m!1292661))

(declare-fun m!1292663 () Bool)

(assert (=> b!1404008 m!1292663))

(declare-fun m!1292665 () Bool)

(assert (=> b!1404005 m!1292665))

(assert (=> b!1404005 m!1292665))

(declare-fun m!1292667 () Bool)

(assert (=> b!1404005 m!1292667))

(declare-fun m!1292669 () Bool)

(assert (=> b!1404007 m!1292669))

(check-sat (not b!1404007) (not b!1404006) (not b!1404012) (not b!1404014) (not b!1404011) (not b!1404010) (not b!1404005) (not b!1404008) (not b!1404015) (not b!1404009) (not start!120668))
(check-sat)
