; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118594 () Bool)

(assert start!118594)

(declare-fun b!1386445 () Bool)

(declare-datatypes ((Unit!46304 0))(
  ( (Unit!46305) )
))
(declare-fun e!785401 () Unit!46304)

(declare-fun lt!609468 () Unit!46304)

(assert (=> b!1386445 (= e!785401 lt!609468)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609466 () Unit!46304)

(declare-datatypes ((array!94870 0))(
  ( (array!94871 (arr!45811 (Array (_ BitVec 32) (_ BitVec 64))) (size!46361 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94870)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46304)

(assert (=> b!1386445 (= lt!609466 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10154 0))(
  ( (MissingZero!10154 (index!42987 (_ BitVec 32))) (Found!10154 (index!42988 (_ BitVec 32))) (Intermediate!10154 (undefined!10966 Bool) (index!42989 (_ BitVec 32)) (x!124603 (_ BitVec 32))) (Undefined!10154) (MissingVacant!10154 (index!42990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94870 (_ BitVec 32)) SeekEntryResult!10154)

(assert (=> b!1386445 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94871 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46361 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46304)

(assert (=> b!1386445 (= lt!609468 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94870 (_ BitVec 32)) Bool)

(assert (=> b!1386445 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386446 () Bool)

(declare-fun e!785400 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386446 (= e!785400 (validKeyInArray!0 (select (arr!45811 a!2938) startIndex!16)))))

(declare-fun b!1386447 () Bool)

(declare-fun res!927646 () Bool)

(declare-fun e!785399 () Bool)

(assert (=> b!1386447 (=> (not res!927646) (not e!785399))))

(declare-datatypes ((List!32339 0))(
  ( (Nil!32336) (Cons!32335 (h!33544 (_ BitVec 64)) (t!47033 List!32339)) )
))
(declare-fun arrayNoDuplicates!0 (array!94870 (_ BitVec 32) List!32339) Bool)

(assert (=> b!1386447 (= res!927646 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32336))))

(declare-fun res!927647 () Bool)

(assert (=> start!118594 (=> (not res!927647) (not e!785399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118594 (= res!927647 (validMask!0 mask!2987))))

(assert (=> start!118594 e!785399))

(assert (=> start!118594 true))

(declare-fun array_inv!34839 (array!94870) Bool)

(assert (=> start!118594 (array_inv!34839 a!2938)))

(declare-fun b!1386448 () Bool)

(assert (=> b!1386448 (= e!785399 false)))

(declare-fun lt!609467 () Unit!46304)

(assert (=> b!1386448 (= lt!609467 e!785401)))

(declare-fun c!128841 () Bool)

(assert (=> b!1386448 (= c!128841 e!785400)))

(declare-fun res!927648 () Bool)

(assert (=> b!1386448 (=> (not res!927648) (not e!785400))))

(assert (=> b!1386448 (= res!927648 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386449 () Bool)

(declare-fun res!927645 () Bool)

(assert (=> b!1386449 (=> (not res!927645) (not e!785399))))

(assert (=> b!1386449 (= res!927645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386450 () Bool)

(declare-fun res!927644 () Bool)

(assert (=> b!1386450 (=> (not res!927644) (not e!785399))))

(assert (=> b!1386450 (= res!927644 (and (not (= (select (arr!45811 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386451 () Bool)

(declare-fun res!927643 () Bool)

(assert (=> b!1386451 (=> (not res!927643) (not e!785399))))

(assert (=> b!1386451 (= res!927643 (validKeyInArray!0 (select (arr!45811 a!2938) i!1065)))))

(declare-fun b!1386452 () Bool)

(declare-fun res!927649 () Bool)

(assert (=> b!1386452 (=> (not res!927649) (not e!785399))))

(assert (=> b!1386452 (= res!927649 (and (= (size!46361 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46361 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46361 a!2938))))))

(declare-fun b!1386453 () Bool)

(declare-fun Unit!46306 () Unit!46304)

(assert (=> b!1386453 (= e!785401 Unit!46306)))

(assert (= (and start!118594 res!927647) b!1386452))

(assert (= (and b!1386452 res!927649) b!1386451))

(assert (= (and b!1386451 res!927643) b!1386447))

(assert (= (and b!1386447 res!927646) b!1386449))

(assert (= (and b!1386449 res!927645) b!1386450))

(assert (= (and b!1386450 res!927644) b!1386448))

(assert (= (and b!1386448 res!927648) b!1386446))

(assert (= (and b!1386448 c!128841) b!1386445))

(assert (= (and b!1386448 (not c!128841)) b!1386453))

(declare-fun m!1271811 () Bool)

(assert (=> b!1386445 m!1271811))

(declare-fun m!1271813 () Bool)

(assert (=> b!1386445 m!1271813))

(assert (=> b!1386445 m!1271813))

(declare-fun m!1271815 () Bool)

(assert (=> b!1386445 m!1271815))

(declare-fun m!1271817 () Bool)

(assert (=> b!1386445 m!1271817))

(declare-fun m!1271819 () Bool)

(assert (=> b!1386445 m!1271819))

(declare-fun m!1271821 () Bool)

(assert (=> b!1386445 m!1271821))

(declare-fun m!1271823 () Bool)

(assert (=> b!1386445 m!1271823))

(assert (=> b!1386445 m!1271821))

(declare-fun m!1271825 () Bool)

(assert (=> b!1386445 m!1271825))

(declare-fun m!1271827 () Bool)

(assert (=> start!118594 m!1271827))

(declare-fun m!1271829 () Bool)

(assert (=> start!118594 m!1271829))

(declare-fun m!1271831 () Bool)

(assert (=> b!1386451 m!1271831))

(assert (=> b!1386451 m!1271831))

(declare-fun m!1271833 () Bool)

(assert (=> b!1386451 m!1271833))

(declare-fun m!1271835 () Bool)

(assert (=> b!1386449 m!1271835))

(assert (=> b!1386450 m!1271831))

(assert (=> b!1386446 m!1271821))

(assert (=> b!1386446 m!1271821))

(declare-fun m!1271837 () Bool)

(assert (=> b!1386446 m!1271837))

(declare-fun m!1271839 () Bool)

(assert (=> b!1386447 m!1271839))

(push 1)

(assert (not b!1386447))

(assert (not b!1386451))

(assert (not b!1386449))

(assert (not b!1386445))

(assert (not start!118594))

(assert (not b!1386446))

(check-sat)

