; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130832 () Bool)

(assert start!130832)

(declare-fun res!1051446 () Bool)

(declare-fun e!854476 () Bool)

(assert (=> start!130832 (=> (not res!1051446) (not e!854476))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130832 (= res!1051446 (validMask!0 mask!2480))))

(assert (=> start!130832 e!854476))

(assert (=> start!130832 true))

(declare-datatypes ((array!101930 0))(
  ( (array!101931 (arr!49181 (Array (_ BitVec 32) (_ BitVec 64))) (size!49731 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101930)

(declare-fun array_inv!38209 (array!101930) Bool)

(assert (=> start!130832 (array_inv!38209 a!2792)))

(declare-fun b!1534354 () Bool)

(declare-fun res!1051441 () Bool)

(assert (=> b!1534354 (=> (not res!1051441) (not e!854476))))

(declare-datatypes ((List!35655 0))(
  ( (Nil!35652) (Cons!35651 (h!37096 (_ BitVec 64)) (t!50349 List!35655)) )
))
(declare-fun arrayNoDuplicates!0 (array!101930 (_ BitVec 32) List!35655) Bool)

(assert (=> b!1534354 (= res!1051441 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35652))))

(declare-fun b!1534355 () Bool)

(declare-fun res!1051447 () Bool)

(assert (=> b!1534355 (=> (not res!1051447) (not e!854476))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534355 (= res!1051447 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49731 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49731 a!2792)) (= (select (arr!49181 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534356 () Bool)

(declare-fun res!1051444 () Bool)

(assert (=> b!1534356 (=> (not res!1051444) (not e!854476))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534356 (= res!1051444 (validKeyInArray!0 (select (arr!49181 a!2792) j!64)))))

(declare-fun b!1534357 () Bool)

(declare-fun res!1051440 () Bool)

(assert (=> b!1534357 (=> (not res!1051440) (not e!854476))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534357 (= res!1051440 (validKeyInArray!0 (select (arr!49181 a!2792) i!951)))))

(declare-fun b!1534358 () Bool)

(declare-fun res!1051445 () Bool)

(assert (=> b!1534358 (=> (not res!1051445) (not e!854476))))

(declare-datatypes ((SeekEntryResult!13313 0))(
  ( (MissingZero!13313 (index!55647 (_ BitVec 32))) (Found!13313 (index!55648 (_ BitVec 32))) (Intermediate!13313 (undefined!14125 Bool) (index!55649 (_ BitVec 32)) (x!137411 (_ BitVec 32))) (Undefined!13313) (MissingVacant!13313 (index!55650 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101930 (_ BitVec 32)) SeekEntryResult!13313)

(assert (=> b!1534358 (= res!1051445 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49181 a!2792) j!64) a!2792 mask!2480) (Found!13313 j!64)))))

(declare-fun b!1534359 () Bool)

(declare-fun res!1051442 () Bool)

(assert (=> b!1534359 (=> (not res!1051442) (not e!854476))))

(assert (=> b!1534359 (= res!1051442 (and (= (size!49731 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49731 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49731 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534360 () Bool)

(declare-fun res!1051443 () Bool)

(assert (=> b!1534360 (=> (not res!1051443) (not e!854476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101930 (_ BitVec 32)) Bool)

(assert (=> b!1534360 (= res!1051443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534361 () Bool)

(assert (=> b!1534361 (= e!854476 (and (not (= (select (arr!49181 a!2792) index!463) (select (arr!49181 a!2792) j!64))) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(assert (= (and start!130832 res!1051446) b!1534359))

(assert (= (and b!1534359 res!1051442) b!1534357))

(assert (= (and b!1534357 res!1051440) b!1534356))

(assert (= (and b!1534356 res!1051444) b!1534360))

(assert (= (and b!1534360 res!1051443) b!1534354))

(assert (= (and b!1534354 res!1051441) b!1534355))

(assert (= (and b!1534355 res!1051447) b!1534358))

(assert (= (and b!1534358 res!1051445) b!1534361))

(declare-fun m!1417011 () Bool)

(assert (=> b!1534357 m!1417011))

(assert (=> b!1534357 m!1417011))

(declare-fun m!1417013 () Bool)

(assert (=> b!1534357 m!1417013))

(declare-fun m!1417015 () Bool)

(assert (=> b!1534358 m!1417015))

(assert (=> b!1534358 m!1417015))

(declare-fun m!1417017 () Bool)

(assert (=> b!1534358 m!1417017))

(declare-fun m!1417019 () Bool)

(assert (=> start!130832 m!1417019))

(declare-fun m!1417021 () Bool)

(assert (=> start!130832 m!1417021))

(assert (=> b!1534356 m!1417015))

(assert (=> b!1534356 m!1417015))

(declare-fun m!1417023 () Bool)

(assert (=> b!1534356 m!1417023))

(declare-fun m!1417025 () Bool)

(assert (=> b!1534361 m!1417025))

(assert (=> b!1534361 m!1417015))

(declare-fun m!1417027 () Bool)

(assert (=> b!1534355 m!1417027))

(declare-fun m!1417029 () Bool)

(assert (=> b!1534360 m!1417029))

(declare-fun m!1417031 () Bool)

(assert (=> b!1534354 m!1417031))

(push 1)

(assert (not b!1534357))

(assert (not b!1534358))

(assert (not b!1534354))

(assert (not b!1534356))

(assert (not b!1534360))

(assert (not start!130832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

