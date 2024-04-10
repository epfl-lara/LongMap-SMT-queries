; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130836 () Bool)

(assert start!130836)

(declare-datatypes ((array!101934 0))(
  ( (array!101935 (arr!49183 (Array (_ BitVec 32) (_ BitVec 64))) (size!49733 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101934)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun e!854487 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun b!1534402 () Bool)

(assert (=> b!1534402 (= e!854487 (and (not (= (select (arr!49183 a!2792) index!463) (select (arr!49183 a!2792) j!64))) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1534403 () Bool)

(declare-fun res!1051493 () Bool)

(assert (=> b!1534403 (=> (not res!1051493) (not e!854487))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534403 (= res!1051493 (validKeyInArray!0 (select (arr!49183 a!2792) i!951)))))

(declare-fun b!1534404 () Bool)

(declare-fun res!1051494 () Bool)

(assert (=> b!1534404 (=> (not res!1051494) (not e!854487))))

(declare-datatypes ((List!35657 0))(
  ( (Nil!35654) (Cons!35653 (h!37098 (_ BitVec 64)) (t!50351 List!35657)) )
))
(declare-fun arrayNoDuplicates!0 (array!101934 (_ BitVec 32) List!35657) Bool)

(assert (=> b!1534404 (= res!1051494 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35654))))

(declare-fun b!1534405 () Bool)

(declare-fun res!1051491 () Bool)

(assert (=> b!1534405 (=> (not res!1051491) (not e!854487))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1534405 (= res!1051491 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49733 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49733 a!2792)) (= (select (arr!49183 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534406 () Bool)

(declare-fun res!1051495 () Bool)

(assert (=> b!1534406 (=> (not res!1051495) (not e!854487))))

(declare-datatypes ((SeekEntryResult!13315 0))(
  ( (MissingZero!13315 (index!55655 (_ BitVec 32))) (Found!13315 (index!55656 (_ BitVec 32))) (Intermediate!13315 (undefined!14127 Bool) (index!55657 (_ BitVec 32)) (x!137413 (_ BitVec 32))) (Undefined!13315) (MissingVacant!13315 (index!55658 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101934 (_ BitVec 32)) SeekEntryResult!13315)

(assert (=> b!1534406 (= res!1051495 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49183 a!2792) j!64) a!2792 mask!2480) (Found!13315 j!64)))))

(declare-fun b!1534407 () Bool)

(declare-fun res!1051488 () Bool)

(assert (=> b!1534407 (=> (not res!1051488) (not e!854487))))

(assert (=> b!1534407 (= res!1051488 (and (= (size!49733 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49733 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49733 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534408 () Bool)

(declare-fun res!1051490 () Bool)

(assert (=> b!1534408 (=> (not res!1051490) (not e!854487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101934 (_ BitVec 32)) Bool)

(assert (=> b!1534408 (= res!1051490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534409 () Bool)

(declare-fun res!1051489 () Bool)

(assert (=> b!1534409 (=> (not res!1051489) (not e!854487))))

(assert (=> b!1534409 (= res!1051489 (validKeyInArray!0 (select (arr!49183 a!2792) j!64)))))

(declare-fun res!1051492 () Bool)

(assert (=> start!130836 (=> (not res!1051492) (not e!854487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130836 (= res!1051492 (validMask!0 mask!2480))))

(assert (=> start!130836 e!854487))

(assert (=> start!130836 true))

(declare-fun array_inv!38211 (array!101934) Bool)

(assert (=> start!130836 (array_inv!38211 a!2792)))

(assert (= (and start!130836 res!1051492) b!1534407))

(assert (= (and b!1534407 res!1051488) b!1534403))

(assert (= (and b!1534403 res!1051493) b!1534409))

(assert (= (and b!1534409 res!1051489) b!1534408))

(assert (= (and b!1534408 res!1051490) b!1534404))

(assert (= (and b!1534404 res!1051494) b!1534405))

(assert (= (and b!1534405 res!1051491) b!1534406))

(assert (= (and b!1534406 res!1051495) b!1534402))

(declare-fun m!1417055 () Bool)

(assert (=> b!1534405 m!1417055))

(declare-fun m!1417057 () Bool)

(assert (=> b!1534406 m!1417057))

(assert (=> b!1534406 m!1417057))

(declare-fun m!1417059 () Bool)

(assert (=> b!1534406 m!1417059))

(assert (=> b!1534409 m!1417057))

(assert (=> b!1534409 m!1417057))

(declare-fun m!1417061 () Bool)

(assert (=> b!1534409 m!1417061))

(declare-fun m!1417063 () Bool)

(assert (=> start!130836 m!1417063))

(declare-fun m!1417065 () Bool)

(assert (=> start!130836 m!1417065))

(declare-fun m!1417067 () Bool)

(assert (=> b!1534408 m!1417067))

(declare-fun m!1417069 () Bool)

(assert (=> b!1534402 m!1417069))

(assert (=> b!1534402 m!1417057))

(declare-fun m!1417071 () Bool)

(assert (=> b!1534403 m!1417071))

(assert (=> b!1534403 m!1417071))

(declare-fun m!1417073 () Bool)

(assert (=> b!1534403 m!1417073))

(declare-fun m!1417075 () Bool)

(assert (=> b!1534404 m!1417075))

(push 1)

(assert (not b!1534406))

(assert (not b!1534403))

(assert (not b!1534408))

(assert (not b!1534404))

(assert (not start!130836))

(assert (not b!1534409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

