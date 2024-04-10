; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131022 () Bool)

(assert start!131022)

(declare-fun b!1537297 () Bool)

(declare-fun res!1054392 () Bool)

(declare-fun e!855574 () Bool)

(assert (=> b!1537297 (=> (not res!1054392) (not e!855574))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102120 0))(
  ( (array!102121 (arr!49276 (Array (_ BitVec 32) (_ BitVec 64))) (size!49826 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102120)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537297 (= res!1054392 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49826 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49826 a!2792)) (= (select (arr!49276 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537298 () Bool)

(declare-fun e!855576 () Bool)

(declare-fun e!855575 () Bool)

(assert (=> b!1537298 (= e!855576 e!855575)))

(declare-fun res!1054393 () Bool)

(assert (=> b!1537298 (=> (not res!1054393) (not e!855575))))

(declare-datatypes ((SeekEntryResult!13408 0))(
  ( (MissingZero!13408 (index!56027 (_ BitVec 32))) (Found!13408 (index!56028 (_ BitVec 32))) (Intermediate!13408 (undefined!14220 Bool) (index!56029 (_ BitVec 32)) (x!137754 (_ BitVec 32))) (Undefined!13408) (MissingVacant!13408 (index!56030 (_ BitVec 32))) )
))
(declare-fun lt!664663 () SeekEntryResult!13408)

(declare-fun lt!664664 () SeekEntryResult!13408)

(assert (=> b!1537298 (= res!1054393 (= lt!664663 lt!664664))))

(declare-fun lt!664666 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102120 (_ BitVec 32)) SeekEntryResult!13408)

(assert (=> b!1537298 (= lt!664663 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664666 vacantIndex!5 (select (arr!49276 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537299 () Bool)

(declare-fun res!1054391 () Bool)

(assert (=> b!1537299 (=> (not res!1054391) (not e!855574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102120 (_ BitVec 32)) Bool)

(assert (=> b!1537299 (= res!1054391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537300 () Bool)

(assert (=> b!1537300 (= e!855575 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537300 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664666 vacantIndex!5 (select (store (arr!49276 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102121 (store (arr!49276 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49826 a!2792)) mask!2480) lt!664663)))

(declare-datatypes ((Unit!51388 0))(
  ( (Unit!51389) )
))
(declare-fun lt!664665 () Unit!51388)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51388)

(assert (=> b!1537300 (= lt!664665 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664666 vacantIndex!5 mask!2480))))

(declare-fun b!1537301 () Bool)

(declare-fun res!1054390 () Bool)

(assert (=> b!1537301 (=> (not res!1054390) (not e!855574))))

(assert (=> b!1537301 (= res!1054390 (and (= (size!49826 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49826 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49826 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537302 () Bool)

(declare-fun res!1054385 () Bool)

(assert (=> b!1537302 (=> (not res!1054385) (not e!855574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537302 (= res!1054385 (validKeyInArray!0 (select (arr!49276 a!2792) i!951)))))

(declare-fun b!1537303 () Bool)

(declare-fun res!1054386 () Bool)

(declare-fun e!855573 () Bool)

(assert (=> b!1537303 (=> (not res!1054386) (not e!855573))))

(assert (=> b!1537303 (= res!1054386 (not (= (select (arr!49276 a!2792) index!463) (select (arr!49276 a!2792) j!64))))))

(declare-fun b!1537304 () Bool)

(declare-fun res!1054387 () Bool)

(assert (=> b!1537304 (=> (not res!1054387) (not e!855574))))

(declare-datatypes ((List!35750 0))(
  ( (Nil!35747) (Cons!35746 (h!37191 (_ BitVec 64)) (t!50444 List!35750)) )
))
(declare-fun arrayNoDuplicates!0 (array!102120 (_ BitVec 32) List!35750) Bool)

(assert (=> b!1537304 (= res!1054387 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35747))))

(declare-fun b!1537305 () Bool)

(assert (=> b!1537305 (= e!855574 e!855573)))

(declare-fun res!1054388 () Bool)

(assert (=> b!1537305 (=> (not res!1054388) (not e!855573))))

(assert (=> b!1537305 (= res!1054388 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49276 a!2792) j!64) a!2792 mask!2480) lt!664664))))

(assert (=> b!1537305 (= lt!664664 (Found!13408 j!64))))

(declare-fun res!1054384 () Bool)

(assert (=> start!131022 (=> (not res!1054384) (not e!855574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131022 (= res!1054384 (validMask!0 mask!2480))))

(assert (=> start!131022 e!855574))

(assert (=> start!131022 true))

(declare-fun array_inv!38304 (array!102120) Bool)

(assert (=> start!131022 (array_inv!38304 a!2792)))

(declare-fun b!1537306 () Bool)

(assert (=> b!1537306 (= e!855573 e!855576)))

(declare-fun res!1054389 () Bool)

(assert (=> b!1537306 (=> (not res!1054389) (not e!855576))))

(assert (=> b!1537306 (= res!1054389 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664666 #b00000000000000000000000000000000) (bvslt lt!664666 (size!49826 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537306 (= lt!664666 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537307 () Bool)

(declare-fun res!1054383 () Bool)

(assert (=> b!1537307 (=> (not res!1054383) (not e!855574))))

(assert (=> b!1537307 (= res!1054383 (validKeyInArray!0 (select (arr!49276 a!2792) j!64)))))

(assert (= (and start!131022 res!1054384) b!1537301))

(assert (= (and b!1537301 res!1054390) b!1537302))

(assert (= (and b!1537302 res!1054385) b!1537307))

(assert (= (and b!1537307 res!1054383) b!1537299))

(assert (= (and b!1537299 res!1054391) b!1537304))

(assert (= (and b!1537304 res!1054387) b!1537297))

(assert (= (and b!1537297 res!1054392) b!1537305))

(assert (= (and b!1537305 res!1054388) b!1537303))

(assert (= (and b!1537303 res!1054386) b!1537306))

(assert (= (and b!1537306 res!1054389) b!1537298))

(assert (= (and b!1537298 res!1054393) b!1537300))

(declare-fun m!1419797 () Bool)

(assert (=> b!1537297 m!1419797))

(declare-fun m!1419799 () Bool)

(assert (=> b!1537302 m!1419799))

(assert (=> b!1537302 m!1419799))

(declare-fun m!1419801 () Bool)

(assert (=> b!1537302 m!1419801))

(declare-fun m!1419803 () Bool)

(assert (=> b!1537305 m!1419803))

(assert (=> b!1537305 m!1419803))

(declare-fun m!1419805 () Bool)

(assert (=> b!1537305 m!1419805))

(declare-fun m!1419807 () Bool)

(assert (=> b!1537304 m!1419807))

(assert (=> b!1537298 m!1419803))

(assert (=> b!1537298 m!1419803))

(declare-fun m!1419809 () Bool)

(assert (=> b!1537298 m!1419809))

(declare-fun m!1419811 () Bool)

(assert (=> b!1537303 m!1419811))

(assert (=> b!1537303 m!1419803))

(declare-fun m!1419813 () Bool)

(assert (=> b!1537300 m!1419813))

(declare-fun m!1419815 () Bool)

(assert (=> b!1537300 m!1419815))

(assert (=> b!1537300 m!1419815))

(declare-fun m!1419817 () Bool)

(assert (=> b!1537300 m!1419817))

(declare-fun m!1419819 () Bool)

(assert (=> b!1537300 m!1419819))

(declare-fun m!1419821 () Bool)

(assert (=> start!131022 m!1419821))

(declare-fun m!1419823 () Bool)

(assert (=> start!131022 m!1419823))

(assert (=> b!1537307 m!1419803))

(assert (=> b!1537307 m!1419803))

(declare-fun m!1419825 () Bool)

(assert (=> b!1537307 m!1419825))

(declare-fun m!1419827 () Bool)

(assert (=> b!1537299 m!1419827))

(declare-fun m!1419829 () Bool)

(assert (=> b!1537306 m!1419829))

(push 1)

(assert (not b!1537305))

(assert (not b!1537299))

(assert (not b!1537306))

(assert (not start!131022))

(assert (not b!1537304))

(assert (not b!1537300))

(assert (not b!1537307))

(assert (not b!1537298))

(assert (not b!1537302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

