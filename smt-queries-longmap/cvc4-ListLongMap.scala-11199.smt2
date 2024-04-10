; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130830 () Bool)

(assert start!130830)

(declare-fun res!1051419 () Bool)

(declare-fun e!854469 () Bool)

(assert (=> start!130830 (=> (not res!1051419) (not e!854469))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130830 (= res!1051419 (validMask!0 mask!2480))))

(assert (=> start!130830 e!854469))

(assert (=> start!130830 true))

(declare-datatypes ((array!101928 0))(
  ( (array!101929 (arr!49180 (Array (_ BitVec 32) (_ BitVec 64))) (size!49730 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101928)

(declare-fun array_inv!38208 (array!101928) Bool)

(assert (=> start!130830 (array_inv!38208 a!2792)))

(declare-fun b!1534330 () Bool)

(declare-fun res!1051420 () Bool)

(assert (=> b!1534330 (=> (not res!1051420) (not e!854469))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534330 (= res!1051420 (validKeyInArray!0 (select (arr!49180 a!2792) j!64)))))

(declare-fun b!1534331 () Bool)

(declare-fun res!1051421 () Bool)

(assert (=> b!1534331 (=> (not res!1051421) (not e!854469))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13312 0))(
  ( (MissingZero!13312 (index!55643 (_ BitVec 32))) (Found!13312 (index!55644 (_ BitVec 32))) (Intermediate!13312 (undefined!14124 Bool) (index!55645 (_ BitVec 32)) (x!137402 (_ BitVec 32))) (Undefined!13312) (MissingVacant!13312 (index!55646 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101928 (_ BitVec 32)) SeekEntryResult!13312)

(assert (=> b!1534331 (= res!1051421 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49180 a!2792) j!64) a!2792 mask!2480) (Found!13312 j!64)))))

(declare-fun b!1534332 () Bool)

(assert (=> b!1534332 (= e!854469 (and (not (= (select (arr!49180 a!2792) index!463) (select (arr!49180 a!2792) j!64))) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1534333 () Bool)

(declare-fun res!1051416 () Bool)

(assert (=> b!1534333 (=> (not res!1051416) (not e!854469))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534333 (= res!1051416 (and (= (size!49730 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49730 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49730 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534334 () Bool)

(declare-fun res!1051422 () Bool)

(assert (=> b!1534334 (=> (not res!1051422) (not e!854469))))

(assert (=> b!1534334 (= res!1051422 (validKeyInArray!0 (select (arr!49180 a!2792) i!951)))))

(declare-fun b!1534335 () Bool)

(declare-fun res!1051418 () Bool)

(assert (=> b!1534335 (=> (not res!1051418) (not e!854469))))

(declare-datatypes ((List!35654 0))(
  ( (Nil!35651) (Cons!35650 (h!37095 (_ BitVec 64)) (t!50348 List!35654)) )
))
(declare-fun arrayNoDuplicates!0 (array!101928 (_ BitVec 32) List!35654) Bool)

(assert (=> b!1534335 (= res!1051418 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35651))))

(declare-fun b!1534336 () Bool)

(declare-fun res!1051423 () Bool)

(assert (=> b!1534336 (=> (not res!1051423) (not e!854469))))

(assert (=> b!1534336 (= res!1051423 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49730 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49730 a!2792)) (= (select (arr!49180 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534337 () Bool)

(declare-fun res!1051417 () Bool)

(assert (=> b!1534337 (=> (not res!1051417) (not e!854469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101928 (_ BitVec 32)) Bool)

(assert (=> b!1534337 (= res!1051417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130830 res!1051419) b!1534333))

(assert (= (and b!1534333 res!1051416) b!1534334))

(assert (= (and b!1534334 res!1051422) b!1534330))

(assert (= (and b!1534330 res!1051420) b!1534337))

(assert (= (and b!1534337 res!1051417) b!1534335))

(assert (= (and b!1534335 res!1051418) b!1534336))

(assert (= (and b!1534336 res!1051423) b!1534331))

(assert (= (and b!1534331 res!1051421) b!1534332))

(declare-fun m!1416989 () Bool)

(assert (=> start!130830 m!1416989))

(declare-fun m!1416991 () Bool)

(assert (=> start!130830 m!1416991))

(declare-fun m!1416993 () Bool)

(assert (=> b!1534335 m!1416993))

(declare-fun m!1416995 () Bool)

(assert (=> b!1534332 m!1416995))

(declare-fun m!1416997 () Bool)

(assert (=> b!1534332 m!1416997))

(declare-fun m!1416999 () Bool)

(assert (=> b!1534336 m!1416999))

(declare-fun m!1417001 () Bool)

(assert (=> b!1534334 m!1417001))

(assert (=> b!1534334 m!1417001))

(declare-fun m!1417003 () Bool)

(assert (=> b!1534334 m!1417003))

(declare-fun m!1417005 () Bool)

(assert (=> b!1534337 m!1417005))

(assert (=> b!1534330 m!1416997))

(assert (=> b!1534330 m!1416997))

(declare-fun m!1417007 () Bool)

(assert (=> b!1534330 m!1417007))

(assert (=> b!1534331 m!1416997))

(assert (=> b!1534331 m!1416997))

(declare-fun m!1417009 () Bool)

(assert (=> b!1534331 m!1417009))

(push 1)

(assert (not start!130830))

(assert (not b!1534330))

(assert (not b!1534335))

(assert (not b!1534337))

(assert (not b!1534331))

(assert (not b!1534334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

