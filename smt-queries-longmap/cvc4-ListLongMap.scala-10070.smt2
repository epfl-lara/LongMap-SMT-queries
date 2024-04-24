; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118768 () Bool)

(assert start!118768)

(declare-fun b!1387302 () Bool)

(declare-fun e!786081 () Bool)

(assert (=> b!1387302 (= e!786081 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94942 0))(
  ( (array!94943 (arr!45845 (Array (_ BitVec 32) (_ BitVec 64))) (size!46396 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94942)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10092 0))(
  ( (MissingZero!10092 (index!42739 (_ BitVec 32))) (Found!10092 (index!42740 (_ BitVec 32))) (Intermediate!10092 (undefined!10904 Bool) (index!42741 (_ BitVec 32)) (x!124515 (_ BitVec 32))) (Undefined!10092) (MissingVacant!10092 (index!42742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94942 (_ BitVec 32)) SeekEntryResult!10092)

(assert (=> b!1387302 (= (seekEntryOrOpen!0 (select (arr!45845 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45845 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94943 (store (arr!45845 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46396 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46199 0))(
  ( (Unit!46200) )
))
(declare-fun lt!609837 () Unit!46199)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46199)

(assert (=> b!1387302 (= lt!609837 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1387303 () Bool)

(declare-fun res!927769 () Bool)

(assert (=> b!1387303 (=> (not res!927769) (not e!786081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387303 (= res!927769 (validKeyInArray!0 (select (arr!45845 a!2938) startIndex!16)))))

(declare-fun b!1387304 () Bool)

(declare-fun res!927765 () Bool)

(assert (=> b!1387304 (=> (not res!927765) (not e!786081))))

(assert (=> b!1387304 (= res!927765 (and (= (size!46396 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46396 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46396 a!2938))))))

(declare-fun res!927763 () Bool)

(assert (=> start!118768 (=> (not res!927763) (not e!786081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118768 (= res!927763 (validMask!0 mask!2987))))

(assert (=> start!118768 e!786081))

(assert (=> start!118768 true))

(declare-fun array_inv!35126 (array!94942) Bool)

(assert (=> start!118768 (array_inv!35126 a!2938)))

(declare-fun b!1387305 () Bool)

(declare-fun res!927768 () Bool)

(assert (=> b!1387305 (=> (not res!927768) (not e!786081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94942 (_ BitVec 32)) Bool)

(assert (=> b!1387305 (= res!927768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387306 () Bool)

(declare-fun res!927767 () Bool)

(assert (=> b!1387306 (=> (not res!927767) (not e!786081))))

(assert (=> b!1387306 (= res!927767 (and (not (= (select (arr!45845 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45845 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1387307 () Bool)

(declare-fun res!927766 () Bool)

(assert (=> b!1387307 (=> (not res!927766) (not e!786081))))

(assert (=> b!1387307 (= res!927766 (validKeyInArray!0 (select (arr!45845 a!2938) i!1065)))))

(declare-fun b!1387308 () Bool)

(declare-fun res!927764 () Bool)

(assert (=> b!1387308 (=> (not res!927764) (not e!786081))))

(declare-datatypes ((List!32360 0))(
  ( (Nil!32357) (Cons!32356 (h!33574 (_ BitVec 64)) (t!47046 List!32360)) )
))
(declare-fun arrayNoDuplicates!0 (array!94942 (_ BitVec 32) List!32360) Bool)

(assert (=> b!1387308 (= res!927764 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32357))))

(assert (= (and start!118768 res!927763) b!1387304))

(assert (= (and b!1387304 res!927765) b!1387307))

(assert (= (and b!1387307 res!927766) b!1387308))

(assert (= (and b!1387308 res!927764) b!1387305))

(assert (= (and b!1387305 res!927768) b!1387306))

(assert (= (and b!1387306 res!927767) b!1387303))

(assert (= (and b!1387303 res!927769) b!1387302))

(declare-fun m!1272917 () Bool)

(assert (=> b!1387308 m!1272917))

(declare-fun m!1272919 () Bool)

(assert (=> b!1387305 m!1272919))

(declare-fun m!1272921 () Bool)

(assert (=> b!1387307 m!1272921))

(assert (=> b!1387307 m!1272921))

(declare-fun m!1272923 () Bool)

(assert (=> b!1387307 m!1272923))

(declare-fun m!1272925 () Bool)

(assert (=> b!1387302 m!1272925))

(assert (=> b!1387302 m!1272925))

(declare-fun m!1272927 () Bool)

(assert (=> b!1387302 m!1272927))

(declare-fun m!1272929 () Bool)

(assert (=> b!1387302 m!1272929))

(declare-fun m!1272931 () Bool)

(assert (=> b!1387302 m!1272931))

(declare-fun m!1272933 () Bool)

(assert (=> b!1387302 m!1272933))

(assert (=> b!1387302 m!1272933))

(declare-fun m!1272935 () Bool)

(assert (=> b!1387302 m!1272935))

(assert (=> b!1387303 m!1272933))

(assert (=> b!1387303 m!1272933))

(declare-fun m!1272937 () Bool)

(assert (=> b!1387303 m!1272937))

(declare-fun m!1272939 () Bool)

(assert (=> start!118768 m!1272939))

(declare-fun m!1272941 () Bool)

(assert (=> start!118768 m!1272941))

(assert (=> b!1387306 m!1272921))

(push 1)

(assert (not b!1387302))

(assert (not b!1387305))

(assert (not b!1387307))

(assert (not start!118768))

(assert (not b!1387308))

(assert (not b!1387303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

