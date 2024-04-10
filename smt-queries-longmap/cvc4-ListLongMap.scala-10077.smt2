; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118600 () Bool)

(assert start!118600)

(declare-fun b!1386526 () Bool)

(declare-fun res!927706 () Bool)

(declare-fun e!785436 () Bool)

(assert (=> b!1386526 (=> (not res!927706) (not e!785436))))

(declare-datatypes ((array!94876 0))(
  ( (array!94877 (arr!45814 (Array (_ BitVec 32) (_ BitVec 64))) (size!46364 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94876)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94876 (_ BitVec 32)) Bool)

(assert (=> b!1386526 (= res!927706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386527 () Bool)

(declare-fun res!927711 () Bool)

(assert (=> b!1386527 (=> (not res!927711) (not e!785436))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386527 (= res!927711 (validKeyInArray!0 (select (arr!45814 a!2938) i!1065)))))

(declare-fun b!1386528 () Bool)

(assert (=> b!1386528 (= e!785436 false)))

(declare-datatypes ((Unit!46313 0))(
  ( (Unit!46314) )
))
(declare-fun lt!609494 () Unit!46313)

(declare-fun e!785437 () Unit!46313)

(assert (=> b!1386528 (= lt!609494 e!785437)))

(declare-fun c!128850 () Bool)

(declare-fun e!785435 () Bool)

(assert (=> b!1386528 (= c!128850 e!785435)))

(declare-fun res!927707 () Bool)

(assert (=> b!1386528 (=> (not res!927707) (not e!785435))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386528 (= res!927707 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386529 () Bool)

(declare-fun Unit!46315 () Unit!46313)

(assert (=> b!1386529 (= e!785437 Unit!46315)))

(declare-fun b!1386530 () Bool)

(declare-fun res!927712 () Bool)

(assert (=> b!1386530 (=> (not res!927712) (not e!785436))))

(assert (=> b!1386530 (= res!927712 (and (not (= (select (arr!45814 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45814 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386531 () Bool)

(assert (=> b!1386531 (= e!785435 (validKeyInArray!0 (select (arr!45814 a!2938) startIndex!16)))))

(declare-fun b!1386532 () Bool)

(declare-fun res!927709 () Bool)

(assert (=> b!1386532 (=> (not res!927709) (not e!785436))))

(assert (=> b!1386532 (= res!927709 (and (= (size!46364 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46364 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46364 a!2938))))))

(declare-fun res!927710 () Bool)

(assert (=> start!118600 (=> (not res!927710) (not e!785436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118600 (= res!927710 (validMask!0 mask!2987))))

(assert (=> start!118600 e!785436))

(assert (=> start!118600 true))

(declare-fun array_inv!34842 (array!94876) Bool)

(assert (=> start!118600 (array_inv!34842 a!2938)))

(declare-fun b!1386533 () Bool)

(declare-fun lt!609493 () Unit!46313)

(assert (=> b!1386533 (= e!785437 lt!609493)))

(declare-fun lt!609495 () Unit!46313)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46313)

(assert (=> b!1386533 (= lt!609495 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10157 0))(
  ( (MissingZero!10157 (index!42999 (_ BitVec 32))) (Found!10157 (index!43000 (_ BitVec 32))) (Intermediate!10157 (undefined!10969 Bool) (index!43001 (_ BitVec 32)) (x!124614 (_ BitVec 32))) (Undefined!10157) (MissingVacant!10157 (index!43002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94876 (_ BitVec 32)) SeekEntryResult!10157)

(assert (=> b!1386533 (= (seekEntryOrOpen!0 (select (arr!45814 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45814 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94877 (store (arr!45814 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46364 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46313)

(assert (=> b!1386533 (= lt!609493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386533 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386534 () Bool)

(declare-fun res!927708 () Bool)

(assert (=> b!1386534 (=> (not res!927708) (not e!785436))))

(declare-datatypes ((List!32342 0))(
  ( (Nil!32339) (Cons!32338 (h!33547 (_ BitVec 64)) (t!47036 List!32342)) )
))
(declare-fun arrayNoDuplicates!0 (array!94876 (_ BitVec 32) List!32342) Bool)

(assert (=> b!1386534 (= res!927708 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32339))))

(assert (= (and start!118600 res!927710) b!1386532))

(assert (= (and b!1386532 res!927709) b!1386527))

(assert (= (and b!1386527 res!927711) b!1386534))

(assert (= (and b!1386534 res!927708) b!1386526))

(assert (= (and b!1386526 res!927706) b!1386530))

(assert (= (and b!1386530 res!927712) b!1386528))

(assert (= (and b!1386528 res!927707) b!1386531))

(assert (= (and b!1386528 c!128850) b!1386533))

(assert (= (and b!1386528 (not c!128850)) b!1386529))

(declare-fun m!1271901 () Bool)

(assert (=> b!1386531 m!1271901))

(assert (=> b!1386531 m!1271901))

(declare-fun m!1271903 () Bool)

(assert (=> b!1386531 m!1271903))

(declare-fun m!1271905 () Bool)

(assert (=> b!1386530 m!1271905))

(declare-fun m!1271907 () Bool)

(assert (=> b!1386533 m!1271907))

(declare-fun m!1271909 () Bool)

(assert (=> b!1386533 m!1271909))

(assert (=> b!1386533 m!1271909))

(declare-fun m!1271911 () Bool)

(assert (=> b!1386533 m!1271911))

(declare-fun m!1271913 () Bool)

(assert (=> b!1386533 m!1271913))

(declare-fun m!1271915 () Bool)

(assert (=> b!1386533 m!1271915))

(assert (=> b!1386533 m!1271901))

(declare-fun m!1271917 () Bool)

(assert (=> b!1386533 m!1271917))

(assert (=> b!1386533 m!1271901))

(declare-fun m!1271919 () Bool)

(assert (=> b!1386533 m!1271919))

(assert (=> b!1386527 m!1271905))

(assert (=> b!1386527 m!1271905))

(declare-fun m!1271921 () Bool)

(assert (=> b!1386527 m!1271921))

(declare-fun m!1271923 () Bool)

(assert (=> b!1386526 m!1271923))

(declare-fun m!1271925 () Bool)

(assert (=> start!118600 m!1271925))

(declare-fun m!1271927 () Bool)

(assert (=> start!118600 m!1271927))

(declare-fun m!1271929 () Bool)

(assert (=> b!1386534 m!1271929))

(push 1)

(assert (not b!1386526))

(assert (not start!118600))

(assert (not b!1386527))

(assert (not b!1386533))

(assert (not b!1386531))

(assert (not b!1386534))

(check-sat)

