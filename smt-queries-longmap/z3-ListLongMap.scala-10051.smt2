; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118412 () Bool)

(assert start!118412)

(declare-fun b!1385122 () Bool)

(declare-fun res!926419 () Bool)

(declare-fun e!784823 () Bool)

(assert (=> b!1385122 (=> (not res!926419) (not e!784823))))

(declare-datatypes ((array!94715 0))(
  ( (array!94716 (arr!45735 (Array (_ BitVec 32) (_ BitVec 64))) (size!46285 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94715)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385122 (= res!926419 (and (not (= (select (arr!45735 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45735 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385124 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385124 (= e!784823 (and (bvsge startIndex!16 (bvsub (size!46285 a!2938) #b00000000000000000000000000000001)) (bvsgt startIndex!16 (size!46285 a!2938))))))

(declare-datatypes ((Unit!46242 0))(
  ( (Unit!46243) )
))
(declare-fun lt!609178 () Unit!46242)

(declare-fun e!784820 () Unit!46242)

(assert (=> b!1385124 (= lt!609178 e!784820)))

(declare-fun c!128793 () Bool)

(declare-fun e!784821 () Bool)

(assert (=> b!1385124 (= c!128793 e!784821)))

(declare-fun res!926420 () Bool)

(assert (=> b!1385124 (=> (not res!926420) (not e!784821))))

(assert (=> b!1385124 (= res!926420 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385125 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385125 (= e!784821 (validKeyInArray!0 (select (arr!45735 a!2938) startIndex!16)))))

(declare-fun b!1385126 () Bool)

(declare-fun res!926421 () Bool)

(assert (=> b!1385126 (=> (not res!926421) (not e!784823))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94715 (_ BitVec 32)) Bool)

(assert (=> b!1385126 (= res!926421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385127 () Bool)

(declare-fun res!926416 () Bool)

(assert (=> b!1385127 (=> (not res!926416) (not e!784823))))

(assert (=> b!1385127 (= res!926416 (and (= (size!46285 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46285 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46285 a!2938))))))

(declare-fun b!1385128 () Bool)

(declare-fun res!926418 () Bool)

(assert (=> b!1385128 (=> (not res!926418) (not e!784823))))

(declare-datatypes ((List!32263 0))(
  ( (Nil!32260) (Cons!32259 (h!33468 (_ BitVec 64)) (t!46957 List!32263)) )
))
(declare-fun arrayNoDuplicates!0 (array!94715 (_ BitVec 32) List!32263) Bool)

(assert (=> b!1385128 (= res!926418 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32260))))

(declare-fun b!1385129 () Bool)

(declare-fun Unit!46244 () Unit!46242)

(assert (=> b!1385129 (= e!784820 Unit!46244)))

(declare-fun b!1385130 () Bool)

(declare-fun lt!609180 () Unit!46242)

(assert (=> b!1385130 (= e!784820 lt!609180)))

(declare-fun lt!609179 () Unit!46242)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46242)

(assert (=> b!1385130 (= lt!609179 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10128 0))(
  ( (MissingZero!10128 (index!42883 (_ BitVec 32))) (Found!10128 (index!42884 (_ BitVec 32))) (Intermediate!10128 (undefined!10940 Bool) (index!42885 (_ BitVec 32)) (x!124377 (_ BitVec 32))) (Undefined!10128) (MissingVacant!10128 (index!42886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94715 (_ BitVec 32)) SeekEntryResult!10128)

(assert (=> b!1385130 (= (seekEntryOrOpen!0 (select (arr!45735 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45735 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94716 (store (arr!45735 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46285 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46242)

(assert (=> b!1385130 (= lt!609180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385130 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385123 () Bool)

(declare-fun res!926422 () Bool)

(assert (=> b!1385123 (=> (not res!926422) (not e!784823))))

(assert (=> b!1385123 (= res!926422 (validKeyInArray!0 (select (arr!45735 a!2938) i!1065)))))

(declare-fun res!926417 () Bool)

(assert (=> start!118412 (=> (not res!926417) (not e!784823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118412 (= res!926417 (validMask!0 mask!2987))))

(assert (=> start!118412 e!784823))

(assert (=> start!118412 true))

(declare-fun array_inv!34763 (array!94715) Bool)

(assert (=> start!118412 (array_inv!34763 a!2938)))

(assert (= (and start!118412 res!926417) b!1385127))

(assert (= (and b!1385127 res!926416) b!1385123))

(assert (= (and b!1385123 res!926422) b!1385128))

(assert (= (and b!1385128 res!926418) b!1385126))

(assert (= (and b!1385126 res!926421) b!1385122))

(assert (= (and b!1385122 res!926419) b!1385124))

(assert (= (and b!1385124 res!926420) b!1385125))

(assert (= (and b!1385124 c!128793) b!1385130))

(assert (= (and b!1385124 (not c!128793)) b!1385129))

(declare-fun m!1270449 () Bool)

(assert (=> b!1385125 m!1270449))

(assert (=> b!1385125 m!1270449))

(declare-fun m!1270451 () Bool)

(assert (=> b!1385125 m!1270451))

(declare-fun m!1270453 () Bool)

(assert (=> b!1385128 m!1270453))

(declare-fun m!1270455 () Bool)

(assert (=> start!118412 m!1270455))

(declare-fun m!1270457 () Bool)

(assert (=> start!118412 m!1270457))

(declare-fun m!1270459 () Bool)

(assert (=> b!1385123 m!1270459))

(assert (=> b!1385123 m!1270459))

(declare-fun m!1270461 () Bool)

(assert (=> b!1385123 m!1270461))

(assert (=> b!1385122 m!1270459))

(declare-fun m!1270463 () Bool)

(assert (=> b!1385130 m!1270463))

(declare-fun m!1270465 () Bool)

(assert (=> b!1385130 m!1270465))

(assert (=> b!1385130 m!1270465))

(declare-fun m!1270467 () Bool)

(assert (=> b!1385130 m!1270467))

(declare-fun m!1270469 () Bool)

(assert (=> b!1385130 m!1270469))

(declare-fun m!1270471 () Bool)

(assert (=> b!1385130 m!1270471))

(assert (=> b!1385130 m!1270449))

(declare-fun m!1270473 () Bool)

(assert (=> b!1385130 m!1270473))

(assert (=> b!1385130 m!1270449))

(declare-fun m!1270475 () Bool)

(assert (=> b!1385130 m!1270475))

(declare-fun m!1270477 () Bool)

(assert (=> b!1385126 m!1270477))

(check-sat (not b!1385130) (not b!1385128) (not b!1385125) (not start!118412) (not b!1385126) (not b!1385123))
(check-sat)
