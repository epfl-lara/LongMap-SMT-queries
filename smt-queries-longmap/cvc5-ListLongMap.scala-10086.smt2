; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118758 () Bool)

(assert start!118758)

(declare-fun b!1387807 () Bool)

(declare-fun res!928467 () Bool)

(declare-fun e!786141 () Bool)

(assert (=> b!1387807 (=> (not res!928467) (not e!786141))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94929 0))(
  ( (array!94930 (arr!45839 (Array (_ BitVec 32) (_ BitVec 64))) (size!46389 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94929)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387807 (= res!928467 (and (= (size!46389 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46389 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46389 a!2938))))))

(declare-fun b!1387808 () Bool)

(declare-datatypes ((Unit!46388 0))(
  ( (Unit!46389) )
))
(declare-fun e!786140 () Unit!46388)

(declare-fun Unit!46390 () Unit!46388)

(assert (=> b!1387808 (= e!786140 Unit!46390)))

(declare-fun b!1387809 () Bool)

(declare-fun lt!610052 () Unit!46388)

(assert (=> b!1387809 (= e!786140 lt!610052)))

(declare-fun lt!610053 () Unit!46388)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46388)

(assert (=> b!1387809 (= lt!610053 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10182 0))(
  ( (MissingZero!10182 (index!43099 (_ BitVec 32))) (Found!10182 (index!43100 (_ BitVec 32))) (Intermediate!10182 (undefined!10994 Bool) (index!43101 (_ BitVec 32)) (x!124720 (_ BitVec 32))) (Undefined!10182) (MissingVacant!10182 (index!43102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94929 (_ BitVec 32)) SeekEntryResult!10182)

(assert (=> b!1387809 (= (seekEntryOrOpen!0 (select (arr!45839 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45839 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94930 (store (arr!45839 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46389 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46388)

(assert (=> b!1387809 (= lt!610052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94929 (_ BitVec 32)) Bool)

(assert (=> b!1387809 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387811 () Bool)

(declare-fun res!928468 () Bool)

(assert (=> b!1387811 (=> (not res!928468) (not e!786141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387811 (= res!928468 (validKeyInArray!0 (select (arr!45839 a!2938) i!1065)))))

(declare-fun b!1387812 () Bool)

(assert (=> b!1387812 (= e!786141 false)))

(declare-fun lt!610051 () Unit!46388)

(assert (=> b!1387812 (= lt!610051 e!786140)))

(declare-fun c!129114 () Bool)

(declare-fun e!786143 () Bool)

(assert (=> b!1387812 (= c!129114 e!786143)))

(declare-fun res!928462 () Bool)

(assert (=> b!1387812 (=> (not res!928462) (not e!786143))))

(assert (=> b!1387812 (= res!928462 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387813 () Bool)

(assert (=> b!1387813 (= e!786143 (validKeyInArray!0 (select (arr!45839 a!2938) startIndex!16)))))

(declare-fun b!1387814 () Bool)

(declare-fun res!928465 () Bool)

(assert (=> b!1387814 (=> (not res!928465) (not e!786141))))

(assert (=> b!1387814 (= res!928465 (and (not (= (select (arr!45839 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45839 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387815 () Bool)

(declare-fun res!928463 () Bool)

(assert (=> b!1387815 (=> (not res!928463) (not e!786141))))

(assert (=> b!1387815 (= res!928463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!928464 () Bool)

(assert (=> start!118758 (=> (not res!928464) (not e!786141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118758 (= res!928464 (validMask!0 mask!2987))))

(assert (=> start!118758 e!786141))

(assert (=> start!118758 true))

(declare-fun array_inv!34867 (array!94929) Bool)

(assert (=> start!118758 (array_inv!34867 a!2938)))

(declare-fun b!1387810 () Bool)

(declare-fun res!928466 () Bool)

(assert (=> b!1387810 (=> (not res!928466) (not e!786141))))

(declare-datatypes ((List!32367 0))(
  ( (Nil!32364) (Cons!32363 (h!33575 (_ BitVec 64)) (t!47061 List!32367)) )
))
(declare-fun arrayNoDuplicates!0 (array!94929 (_ BitVec 32) List!32367) Bool)

(assert (=> b!1387810 (= res!928466 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32364))))

(assert (= (and start!118758 res!928464) b!1387807))

(assert (= (and b!1387807 res!928467) b!1387811))

(assert (= (and b!1387811 res!928468) b!1387810))

(assert (= (and b!1387810 res!928466) b!1387815))

(assert (= (and b!1387815 res!928463) b!1387814))

(assert (= (and b!1387814 res!928465) b!1387812))

(assert (= (and b!1387812 res!928462) b!1387813))

(assert (= (and b!1387812 c!129114) b!1387809))

(assert (= (and b!1387812 (not c!129114)) b!1387808))

(declare-fun m!1273455 () Bool)

(assert (=> b!1387815 m!1273455))

(declare-fun m!1273457 () Bool)

(assert (=> b!1387810 m!1273457))

(declare-fun m!1273459 () Bool)

(assert (=> b!1387809 m!1273459))

(declare-fun m!1273461 () Bool)

(assert (=> b!1387809 m!1273461))

(assert (=> b!1387809 m!1273461))

(declare-fun m!1273463 () Bool)

(assert (=> b!1387809 m!1273463))

(declare-fun m!1273465 () Bool)

(assert (=> b!1387809 m!1273465))

(declare-fun m!1273467 () Bool)

(assert (=> b!1387809 m!1273467))

(declare-fun m!1273469 () Bool)

(assert (=> b!1387809 m!1273469))

(declare-fun m!1273471 () Bool)

(assert (=> b!1387809 m!1273471))

(assert (=> b!1387809 m!1273469))

(declare-fun m!1273473 () Bool)

(assert (=> b!1387809 m!1273473))

(declare-fun m!1273475 () Bool)

(assert (=> b!1387811 m!1273475))

(assert (=> b!1387811 m!1273475))

(declare-fun m!1273477 () Bool)

(assert (=> b!1387811 m!1273477))

(assert (=> b!1387813 m!1273469))

(assert (=> b!1387813 m!1273469))

(declare-fun m!1273479 () Bool)

(assert (=> b!1387813 m!1273479))

(declare-fun m!1273481 () Bool)

(assert (=> start!118758 m!1273481))

(declare-fun m!1273483 () Bool)

(assert (=> start!118758 m!1273483))

(assert (=> b!1387814 m!1273475))

(push 1)

(assert (not b!1387811))

(assert (not b!1387810))

(assert (not start!118758))

(assert (not b!1387813))

(assert (not b!1387809))

(assert (not b!1387815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

