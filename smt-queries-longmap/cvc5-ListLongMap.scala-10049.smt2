; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118398 () Bool)

(assert start!118398)

(declare-fun b!1384918 () Bool)

(declare-fun e!784730 () Bool)

(declare-datatypes ((array!94654 0))(
  ( (array!94655 (arr!45705 (Array (_ BitVec 32) (_ BitVec 64))) (size!46257 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94654)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384918 (= e!784730 (validKeyInArray!0 (select (arr!45705 a!2938) startIndex!16)))))

(declare-fun b!1384919 () Bool)

(declare-fun res!926291 () Bool)

(declare-fun e!784732 () Bool)

(assert (=> b!1384919 (=> (not res!926291) (not e!784732))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384919 (= res!926291 (and (= (size!46257 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46257 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46257 a!2938))))))

(declare-fun b!1384920 () Bool)

(declare-fun res!926286 () Bool)

(assert (=> b!1384920 (=> (not res!926286) (not e!784732))))

(assert (=> b!1384920 (= res!926286 (validKeyInArray!0 (select (arr!45705 a!2938) i!1065)))))

(declare-fun b!1384921 () Bool)

(assert (=> b!1384921 (= e!784732 false)))

(declare-datatypes ((Unit!46068 0))(
  ( (Unit!46069) )
))
(declare-fun lt!608949 () Unit!46068)

(declare-fun e!784731 () Unit!46068)

(assert (=> b!1384921 (= lt!608949 e!784731)))

(declare-fun c!128759 () Bool)

(assert (=> b!1384921 (= c!128759 e!784730)))

(declare-fun res!926285 () Bool)

(assert (=> b!1384921 (=> (not res!926285) (not e!784730))))

(assert (=> b!1384921 (= res!926285 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384922 () Bool)

(declare-fun res!926289 () Bool)

(assert (=> b!1384922 (=> (not res!926289) (not e!784732))))

(declare-datatypes ((List!32311 0))(
  ( (Nil!32308) (Cons!32307 (h!33516 (_ BitVec 64)) (t!46997 List!32311)) )
))
(declare-fun arrayNoDuplicates!0 (array!94654 (_ BitVec 32) List!32311) Bool)

(assert (=> b!1384922 (= res!926289 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32308))))

(declare-fun res!926288 () Bool)

(assert (=> start!118398 (=> (not res!926288) (not e!784732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118398 (= res!926288 (validMask!0 mask!2987))))

(assert (=> start!118398 e!784732))

(assert (=> start!118398 true))

(declare-fun array_inv!34938 (array!94654) Bool)

(assert (=> start!118398 (array_inv!34938 a!2938)))

(declare-fun b!1384923 () Bool)

(declare-fun res!926290 () Bool)

(assert (=> b!1384923 (=> (not res!926290) (not e!784732))))

(assert (=> b!1384923 (= res!926290 (and (not (= (select (arr!45705 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45705 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384924 () Bool)

(declare-fun res!926287 () Bool)

(assert (=> b!1384924 (=> (not res!926287) (not e!784732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94654 (_ BitVec 32)) Bool)

(assert (=> b!1384924 (= res!926287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384925 () Bool)

(declare-fun Unit!46070 () Unit!46068)

(assert (=> b!1384925 (= e!784731 Unit!46070)))

(declare-fun b!1384926 () Bool)

(declare-fun lt!608951 () Unit!46068)

(assert (=> b!1384926 (= e!784731 lt!608951)))

(declare-fun lt!608950 () Unit!46068)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46068)

(assert (=> b!1384926 (= lt!608950 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10122 0))(
  ( (MissingZero!10122 (index!42859 (_ BitVec 32))) (Found!10122 (index!42860 (_ BitVec 32))) (Intermediate!10122 (undefined!10934 Bool) (index!42861 (_ BitVec 32)) (x!124352 (_ BitVec 32))) (Undefined!10122) (MissingVacant!10122 (index!42862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94654 (_ BitVec 32)) SeekEntryResult!10122)

(assert (=> b!1384926 (= (seekEntryOrOpen!0 (select (arr!45705 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45705 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94655 (store (arr!45705 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46257 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46068)

(assert (=> b!1384926 (= lt!608951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384926 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118398 res!926288) b!1384919))

(assert (= (and b!1384919 res!926291) b!1384920))

(assert (= (and b!1384920 res!926286) b!1384922))

(assert (= (and b!1384922 res!926289) b!1384924))

(assert (= (and b!1384924 res!926287) b!1384923))

(assert (= (and b!1384923 res!926290) b!1384921))

(assert (= (and b!1384921 res!926285) b!1384918))

(assert (= (and b!1384921 c!128759) b!1384926))

(assert (= (and b!1384921 (not c!128759)) b!1384925))

(declare-fun m!1269795 () Bool)

(assert (=> start!118398 m!1269795))

(declare-fun m!1269797 () Bool)

(assert (=> start!118398 m!1269797))

(declare-fun m!1269799 () Bool)

(assert (=> b!1384918 m!1269799))

(assert (=> b!1384918 m!1269799))

(declare-fun m!1269801 () Bool)

(assert (=> b!1384918 m!1269801))

(declare-fun m!1269803 () Bool)

(assert (=> b!1384922 m!1269803))

(declare-fun m!1269805 () Bool)

(assert (=> b!1384926 m!1269805))

(declare-fun m!1269807 () Bool)

(assert (=> b!1384926 m!1269807))

(assert (=> b!1384926 m!1269807))

(declare-fun m!1269809 () Bool)

(assert (=> b!1384926 m!1269809))

(declare-fun m!1269811 () Bool)

(assert (=> b!1384926 m!1269811))

(declare-fun m!1269813 () Bool)

(assert (=> b!1384926 m!1269813))

(assert (=> b!1384926 m!1269799))

(declare-fun m!1269815 () Bool)

(assert (=> b!1384926 m!1269815))

(assert (=> b!1384926 m!1269799))

(declare-fun m!1269817 () Bool)

(assert (=> b!1384926 m!1269817))

(declare-fun m!1269819 () Bool)

(assert (=> b!1384924 m!1269819))

(declare-fun m!1269821 () Bool)

(assert (=> b!1384920 m!1269821))

(assert (=> b!1384920 m!1269821))

(declare-fun m!1269823 () Bool)

(assert (=> b!1384920 m!1269823))

(assert (=> b!1384923 m!1269821))

(push 1)

(assert (not b!1384918))

(assert (not b!1384920))

(assert (not b!1384924))

(assert (not start!118398))

(assert (not b!1384926))

(assert (not b!1384922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

