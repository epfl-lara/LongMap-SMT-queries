; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118616 () Bool)

(assert start!118616)

(declare-fun b!1386742 () Bool)

(declare-fun res!927874 () Bool)

(declare-fun e!785533 () Bool)

(assert (=> b!1386742 (=> (not res!927874) (not e!785533))))

(declare-datatypes ((array!94892 0))(
  ( (array!94893 (arr!45822 (Array (_ BitVec 32) (_ BitVec 64))) (size!46372 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94892)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386742 (= res!927874 (and (not (= (select (arr!45822 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45822 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386743 () Bool)

(declare-fun e!785531 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386743 (= e!785531 (validKeyInArray!0 (select (arr!45822 a!2938) startIndex!16)))))

(declare-fun res!927880 () Bool)

(assert (=> start!118616 (=> (not res!927880) (not e!785533))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118616 (= res!927880 (validMask!0 mask!2987))))

(assert (=> start!118616 e!785533))

(assert (=> start!118616 true))

(declare-fun array_inv!34850 (array!94892) Bool)

(assert (=> start!118616 (array_inv!34850 a!2938)))

(declare-fun b!1386744 () Bool)

(assert (=> b!1386744 (= e!785533 false)))

(declare-datatypes ((Unit!46337 0))(
  ( (Unit!46338) )
))
(declare-fun lt!609567 () Unit!46337)

(declare-fun e!785532 () Unit!46337)

(assert (=> b!1386744 (= lt!609567 e!785532)))

(declare-fun c!128874 () Bool)

(assert (=> b!1386744 (= c!128874 e!785531)))

(declare-fun res!927875 () Bool)

(assert (=> b!1386744 (=> (not res!927875) (not e!785531))))

(assert (=> b!1386744 (= res!927875 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386745 () Bool)

(declare-fun Unit!46339 () Unit!46337)

(assert (=> b!1386745 (= e!785532 Unit!46339)))

(declare-fun b!1386746 () Bool)

(declare-fun res!927877 () Bool)

(assert (=> b!1386746 (=> (not res!927877) (not e!785533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94892 (_ BitVec 32)) Bool)

(assert (=> b!1386746 (= res!927877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386747 () Bool)

(declare-fun res!927879 () Bool)

(assert (=> b!1386747 (=> (not res!927879) (not e!785533))))

(assert (=> b!1386747 (= res!927879 (and (= (size!46372 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46372 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46372 a!2938))))))

(declare-fun b!1386748 () Bool)

(declare-fun lt!609566 () Unit!46337)

(assert (=> b!1386748 (= e!785532 lt!609566)))

(declare-fun lt!609565 () Unit!46337)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46337)

(assert (=> b!1386748 (= lt!609565 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10165 0))(
  ( (MissingZero!10165 (index!43031 (_ BitVec 32))) (Found!10165 (index!43032 (_ BitVec 32))) (Intermediate!10165 (undefined!10977 Bool) (index!43033 (_ BitVec 32)) (x!124646 (_ BitVec 32))) (Undefined!10165) (MissingVacant!10165 (index!43034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94892 (_ BitVec 32)) SeekEntryResult!10165)

(assert (=> b!1386748 (= (seekEntryOrOpen!0 (select (arr!45822 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45822 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94893 (store (arr!45822 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46372 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46337)

(assert (=> b!1386748 (= lt!609566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386748 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386749 () Bool)

(declare-fun res!927878 () Bool)

(assert (=> b!1386749 (=> (not res!927878) (not e!785533))))

(assert (=> b!1386749 (= res!927878 (validKeyInArray!0 (select (arr!45822 a!2938) i!1065)))))

(declare-fun b!1386750 () Bool)

(declare-fun res!927876 () Bool)

(assert (=> b!1386750 (=> (not res!927876) (not e!785533))))

(declare-datatypes ((List!32350 0))(
  ( (Nil!32347) (Cons!32346 (h!33555 (_ BitVec 64)) (t!47044 List!32350)) )
))
(declare-fun arrayNoDuplicates!0 (array!94892 (_ BitVec 32) List!32350) Bool)

(assert (=> b!1386750 (= res!927876 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32347))))

(assert (= (and start!118616 res!927880) b!1386747))

(assert (= (and b!1386747 res!927879) b!1386749))

(assert (= (and b!1386749 res!927878) b!1386750))

(assert (= (and b!1386750 res!927876) b!1386746))

(assert (= (and b!1386746 res!927877) b!1386742))

(assert (= (and b!1386742 res!927874) b!1386744))

(assert (= (and b!1386744 res!927875) b!1386743))

(assert (= (and b!1386744 c!128874) b!1386748))

(assert (= (and b!1386744 (not c!128874)) b!1386745))

(declare-fun m!1272141 () Bool)

(assert (=> b!1386746 m!1272141))

(declare-fun m!1272143 () Bool)

(assert (=> b!1386742 m!1272143))

(declare-fun m!1272145 () Bool)

(assert (=> start!118616 m!1272145))

(declare-fun m!1272147 () Bool)

(assert (=> start!118616 m!1272147))

(declare-fun m!1272149 () Bool)

(assert (=> b!1386750 m!1272149))

(declare-fun m!1272151 () Bool)

(assert (=> b!1386748 m!1272151))

(declare-fun m!1272153 () Bool)

(assert (=> b!1386748 m!1272153))

(assert (=> b!1386748 m!1272153))

(declare-fun m!1272155 () Bool)

(assert (=> b!1386748 m!1272155))

(declare-fun m!1272157 () Bool)

(assert (=> b!1386748 m!1272157))

(declare-fun m!1272159 () Bool)

(assert (=> b!1386748 m!1272159))

(declare-fun m!1272161 () Bool)

(assert (=> b!1386748 m!1272161))

(declare-fun m!1272163 () Bool)

(assert (=> b!1386748 m!1272163))

(assert (=> b!1386748 m!1272161))

(declare-fun m!1272165 () Bool)

(assert (=> b!1386748 m!1272165))

(assert (=> b!1386749 m!1272143))

(assert (=> b!1386749 m!1272143))

(declare-fun m!1272167 () Bool)

(assert (=> b!1386749 m!1272167))

(assert (=> b!1386743 m!1272161))

(assert (=> b!1386743 m!1272161))

(declare-fun m!1272169 () Bool)

(assert (=> b!1386743 m!1272169))

(check-sat (not b!1386749) (not b!1386750) (not b!1386746) (not b!1386748) (not b!1386743) (not start!118616))
