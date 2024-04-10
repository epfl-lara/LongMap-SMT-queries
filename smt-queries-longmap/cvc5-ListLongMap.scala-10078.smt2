; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118602 () Bool)

(assert start!118602)

(declare-fun b!1386553 () Bool)

(declare-datatypes ((Unit!46316 0))(
  ( (Unit!46317) )
))
(declare-fun e!785447 () Unit!46316)

(declare-fun lt!609503 () Unit!46316)

(assert (=> b!1386553 (= e!785447 lt!609503)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609502 () Unit!46316)

(declare-datatypes ((array!94878 0))(
  ( (array!94879 (arr!45815 (Array (_ BitVec 32) (_ BitVec 64))) (size!46365 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94878)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46316)

(assert (=> b!1386553 (= lt!609502 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10158 0))(
  ( (MissingZero!10158 (index!43003 (_ BitVec 32))) (Found!10158 (index!43004 (_ BitVec 32))) (Intermediate!10158 (undefined!10970 Bool) (index!43005 (_ BitVec 32)) (x!124623 (_ BitVec 32))) (Undefined!10158) (MissingVacant!10158 (index!43006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94878 (_ BitVec 32)) SeekEntryResult!10158)

(assert (=> b!1386553 (= (seekEntryOrOpen!0 (select (arr!45815 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45815 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94879 (store (arr!45815 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46365 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46316)

(assert (=> b!1386553 (= lt!609503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94878 (_ BitVec 32)) Bool)

(assert (=> b!1386553 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386554 () Bool)

(declare-fun res!927733 () Bool)

(declare-fun e!785450 () Bool)

(assert (=> b!1386554 (=> (not res!927733) (not e!785450))))

(assert (=> b!1386554 (= res!927733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386555 () Bool)

(declare-fun res!927731 () Bool)

(assert (=> b!1386555 (=> (not res!927731) (not e!785450))))

(declare-datatypes ((List!32343 0))(
  ( (Nil!32340) (Cons!32339 (h!33548 (_ BitVec 64)) (t!47037 List!32343)) )
))
(declare-fun arrayNoDuplicates!0 (array!94878 (_ BitVec 32) List!32343) Bool)

(assert (=> b!1386555 (= res!927731 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32340))))

(declare-fun res!927732 () Bool)

(assert (=> start!118602 (=> (not res!927732) (not e!785450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118602 (= res!927732 (validMask!0 mask!2987))))

(assert (=> start!118602 e!785450))

(assert (=> start!118602 true))

(declare-fun array_inv!34843 (array!94878) Bool)

(assert (=> start!118602 (array_inv!34843 a!2938)))

(declare-fun b!1386556 () Bool)

(assert (=> b!1386556 (= e!785450 (and (bvslt startIndex!16 (bvsub (size!46365 a!2938) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609504 () Unit!46316)

(assert (=> b!1386556 (= lt!609504 e!785447)))

(declare-fun c!128853 () Bool)

(declare-fun e!785449 () Bool)

(assert (=> b!1386556 (= c!128853 e!785449)))

(declare-fun res!927728 () Bool)

(assert (=> b!1386556 (=> (not res!927728) (not e!785449))))

(assert (=> b!1386556 (= res!927728 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386557 () Bool)

(declare-fun res!927730 () Bool)

(assert (=> b!1386557 (=> (not res!927730) (not e!785450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386557 (= res!927730 (validKeyInArray!0 (select (arr!45815 a!2938) i!1065)))))

(declare-fun b!1386558 () Bool)

(declare-fun Unit!46318 () Unit!46316)

(assert (=> b!1386558 (= e!785447 Unit!46318)))

(declare-fun b!1386559 () Bool)

(declare-fun res!927729 () Bool)

(assert (=> b!1386559 (=> (not res!927729) (not e!785450))))

(assert (=> b!1386559 (= res!927729 (and (not (= (select (arr!45815 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45815 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386560 () Bool)

(declare-fun res!927727 () Bool)

(assert (=> b!1386560 (=> (not res!927727) (not e!785450))))

(assert (=> b!1386560 (= res!927727 (and (= (size!46365 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46365 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46365 a!2938))))))

(declare-fun b!1386561 () Bool)

(assert (=> b!1386561 (= e!785449 (validKeyInArray!0 (select (arr!45815 a!2938) startIndex!16)))))

(assert (= (and start!118602 res!927732) b!1386560))

(assert (= (and b!1386560 res!927727) b!1386557))

(assert (= (and b!1386557 res!927730) b!1386555))

(assert (= (and b!1386555 res!927731) b!1386554))

(assert (= (and b!1386554 res!927733) b!1386559))

(assert (= (and b!1386559 res!927729) b!1386556))

(assert (= (and b!1386556 res!927728) b!1386561))

(assert (= (and b!1386556 c!128853) b!1386553))

(assert (= (and b!1386556 (not c!128853)) b!1386558))

(declare-fun m!1271931 () Bool)

(assert (=> b!1386561 m!1271931))

(assert (=> b!1386561 m!1271931))

(declare-fun m!1271933 () Bool)

(assert (=> b!1386561 m!1271933))

(declare-fun m!1271935 () Bool)

(assert (=> b!1386557 m!1271935))

(assert (=> b!1386557 m!1271935))

(declare-fun m!1271937 () Bool)

(assert (=> b!1386557 m!1271937))

(declare-fun m!1271939 () Bool)

(assert (=> b!1386553 m!1271939))

(declare-fun m!1271941 () Bool)

(assert (=> b!1386553 m!1271941))

(assert (=> b!1386553 m!1271941))

(declare-fun m!1271943 () Bool)

(assert (=> b!1386553 m!1271943))

(declare-fun m!1271945 () Bool)

(assert (=> b!1386553 m!1271945))

(declare-fun m!1271947 () Bool)

(assert (=> b!1386553 m!1271947))

(assert (=> b!1386553 m!1271931))

(declare-fun m!1271949 () Bool)

(assert (=> b!1386553 m!1271949))

(assert (=> b!1386553 m!1271931))

(declare-fun m!1271951 () Bool)

(assert (=> b!1386553 m!1271951))

(assert (=> b!1386559 m!1271935))

(declare-fun m!1271953 () Bool)

(assert (=> start!118602 m!1271953))

(declare-fun m!1271955 () Bool)

(assert (=> start!118602 m!1271955))

(declare-fun m!1271957 () Bool)

(assert (=> b!1386555 m!1271957))

(declare-fun m!1271959 () Bool)

(assert (=> b!1386554 m!1271959))

(push 1)

