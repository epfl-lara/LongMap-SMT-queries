; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131360 () Bool)

(assert start!131360)

(declare-fun res!1056804 () Bool)

(declare-fun e!856591 () Bool)

(assert (=> start!131360 (=> (not res!1056804) (not e!856591))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131360 (= res!1056804 (validMask!0 mask!2480))))

(assert (=> start!131360 e!856591))

(assert (=> start!131360 true))

(declare-datatypes ((array!102308 0))(
  ( (array!102309 (arr!49364 (Array (_ BitVec 32) (_ BitVec 64))) (size!49914 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102308)

(declare-fun array_inv!38392 (array!102308) Bool)

(assert (=> start!131360 (array_inv!38392 a!2792)))

(declare-fun b!1540111 () Bool)

(declare-fun res!1056802 () Bool)

(declare-fun e!856588 () Bool)

(assert (=> b!1540111 (=> (not res!1056802) (not e!856588))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540111 (= res!1056802 (not (= (select (arr!49364 a!2792) index!463) (select (arr!49364 a!2792) j!64))))))

(declare-fun b!1540112 () Bool)

(declare-fun res!1056807 () Bool)

(assert (=> b!1540112 (=> (not res!1056807) (not e!856591))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540112 (= res!1056807 (and (= (size!49914 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49914 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49914 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540113 () Bool)

(declare-fun res!1056810 () Bool)

(assert (=> b!1540113 (=> (not res!1056810) (not e!856591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102308 (_ BitVec 32)) Bool)

(assert (=> b!1540113 (= res!1056810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540114 () Bool)

(assert (=> b!1540114 (= e!856591 e!856588)))

(declare-fun res!1056808 () Bool)

(assert (=> b!1540114 (=> (not res!1056808) (not e!856588))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13490 0))(
  ( (MissingZero!13490 (index!56355 (_ BitVec 32))) (Found!13490 (index!56356 (_ BitVec 32))) (Intermediate!13490 (undefined!14302 Bool) (index!56357 (_ BitVec 32)) (x!138097 (_ BitVec 32))) (Undefined!13490) (MissingVacant!13490 (index!56358 (_ BitVec 32))) )
))
(declare-fun lt!665229 () SeekEntryResult!13490)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102308 (_ BitVec 32)) SeekEntryResult!13490)

(assert (=> b!1540114 (= res!1056808 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49364 a!2792) j!64) a!2792 mask!2480) lt!665229))))

(assert (=> b!1540114 (= lt!665229 (Found!13490 j!64))))

(declare-fun b!1540115 () Bool)

(declare-fun res!1056805 () Bool)

(assert (=> b!1540115 (=> (not res!1056805) (not e!856591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540115 (= res!1056805 (validKeyInArray!0 (select (arr!49364 a!2792) j!64)))))

(declare-fun b!1540116 () Bool)

(declare-fun e!856587 () Bool)

(assert (=> b!1540116 (= e!856588 e!856587)))

(declare-fun res!1056809 () Bool)

(assert (=> b!1540116 (=> (not res!1056809) (not e!856587))))

(declare-fun lt!665230 () (_ BitVec 32))

(assert (=> b!1540116 (= res!1056809 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665230 #b00000000000000000000000000000000) (bvslt lt!665230 (size!49914 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540116 (= lt!665230 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540117 () Bool)

(declare-fun res!1056806 () Bool)

(assert (=> b!1540117 (=> (not res!1056806) (not e!856591))))

(declare-datatypes ((List!35838 0))(
  ( (Nil!35835) (Cons!35834 (h!37279 (_ BitVec 64)) (t!50532 List!35838)) )
))
(declare-fun arrayNoDuplicates!0 (array!102308 (_ BitVec 32) List!35838) Bool)

(assert (=> b!1540117 (= res!1056806 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35835))))

(declare-fun b!1540118 () Bool)

(declare-fun e!856590 () Bool)

(assert (=> b!1540118 (= e!856590 (not true))))

(declare-fun lt!665228 () SeekEntryResult!13490)

(assert (=> b!1540118 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665230 vacantIndex!5 (select (store (arr!49364 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102309 (store (arr!49364 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792)) mask!2480) lt!665228)))

(declare-datatypes ((Unit!51420 0))(
  ( (Unit!51421) )
))
(declare-fun lt!665227 () Unit!51420)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51420)

(assert (=> b!1540118 (= lt!665227 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665230 vacantIndex!5 mask!2480))))

(declare-fun b!1540119 () Bool)

(declare-fun res!1056801 () Bool)

(assert (=> b!1540119 (=> (not res!1056801) (not e!856591))))

(assert (=> b!1540119 (= res!1056801 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49914 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49914 a!2792)) (= (select (arr!49364 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540120 () Bool)

(declare-fun res!1056803 () Bool)

(assert (=> b!1540120 (=> (not res!1056803) (not e!856591))))

(assert (=> b!1540120 (= res!1056803 (validKeyInArray!0 (select (arr!49364 a!2792) i!951)))))

(declare-fun b!1540121 () Bool)

(assert (=> b!1540121 (= e!856587 e!856590)))

(declare-fun res!1056811 () Bool)

(assert (=> b!1540121 (=> (not res!1056811) (not e!856590))))

(assert (=> b!1540121 (= res!1056811 (= lt!665228 lt!665229))))

(assert (=> b!1540121 (= lt!665228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665230 vacantIndex!5 (select (arr!49364 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131360 res!1056804) b!1540112))

(assert (= (and b!1540112 res!1056807) b!1540120))

(assert (= (and b!1540120 res!1056803) b!1540115))

(assert (= (and b!1540115 res!1056805) b!1540113))

(assert (= (and b!1540113 res!1056810) b!1540117))

(assert (= (and b!1540117 res!1056806) b!1540119))

(assert (= (and b!1540119 res!1056801) b!1540114))

(assert (= (and b!1540114 res!1056808) b!1540111))

(assert (= (and b!1540111 res!1056802) b!1540116))

(assert (= (and b!1540116 res!1056809) b!1540121))

(assert (= (and b!1540121 res!1056811) b!1540118))

(declare-fun m!1422213 () Bool)

(assert (=> start!131360 m!1422213))

(declare-fun m!1422215 () Bool)

(assert (=> start!131360 m!1422215))

(declare-fun m!1422217 () Bool)

(assert (=> b!1540121 m!1422217))

(assert (=> b!1540121 m!1422217))

(declare-fun m!1422219 () Bool)

(assert (=> b!1540121 m!1422219))

(declare-fun m!1422221 () Bool)

(assert (=> b!1540111 m!1422221))

(assert (=> b!1540111 m!1422217))

(declare-fun m!1422223 () Bool)

(assert (=> b!1540113 m!1422223))

(assert (=> b!1540114 m!1422217))

(assert (=> b!1540114 m!1422217))

(declare-fun m!1422225 () Bool)

(assert (=> b!1540114 m!1422225))

(declare-fun m!1422227 () Bool)

(assert (=> b!1540120 m!1422227))

(assert (=> b!1540120 m!1422227))

(declare-fun m!1422229 () Bool)

(assert (=> b!1540120 m!1422229))

(declare-fun m!1422231 () Bool)

(assert (=> b!1540117 m!1422231))

(declare-fun m!1422233 () Bool)

(assert (=> b!1540116 m!1422233))

(assert (=> b!1540115 m!1422217))

(assert (=> b!1540115 m!1422217))

(declare-fun m!1422235 () Bool)

(assert (=> b!1540115 m!1422235))

(declare-fun m!1422237 () Bool)

(assert (=> b!1540118 m!1422237))

(declare-fun m!1422239 () Bool)

(assert (=> b!1540118 m!1422239))

(assert (=> b!1540118 m!1422239))

(declare-fun m!1422241 () Bool)

(assert (=> b!1540118 m!1422241))

(declare-fun m!1422243 () Bool)

(assert (=> b!1540118 m!1422243))

(declare-fun m!1422245 () Bool)

(assert (=> b!1540119 m!1422245))

(push 1)

