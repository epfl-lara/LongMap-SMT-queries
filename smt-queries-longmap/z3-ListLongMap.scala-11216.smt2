; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130878 () Bool)

(assert start!130878)

(declare-fun b!1535440 () Bool)

(declare-fun e!854694 () Bool)

(assert (=> b!1535440 (= e!854694 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101974 0))(
  ( (array!101975 (arr!49204 (Array (_ BitVec 32) (_ BitVec 64))) (size!49756 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101974)

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13361 0))(
  ( (MissingZero!13361 (index!55839 (_ BitVec 32))) (Found!13361 (index!55840 (_ BitVec 32))) (Intermediate!13361 (undefined!14173 Bool) (index!55841 (_ BitVec 32)) (x!137582 (_ BitVec 32))) (Undefined!13361) (MissingVacant!13361 (index!55842 (_ BitVec 32))) )
))
(declare-fun lt!663836 () SeekEntryResult!13361)

(declare-fun lt!663837 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101974 (_ BitVec 32)) SeekEntryResult!13361)

(assert (=> b!1535440 (= lt!663836 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663837 vacantIndex!5 (select (arr!49204 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535441 () Bool)

(declare-fun res!1052718 () Bool)

(declare-fun e!854695 () Bool)

(assert (=> b!1535441 (=> (not res!1052718) (not e!854695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535441 (= res!1052718 (validKeyInArray!0 (select (arr!49204 a!2792) j!64)))))

(declare-fun b!1535442 () Bool)

(declare-fun res!1052717 () Bool)

(assert (=> b!1535442 (=> (not res!1052717) (not e!854695))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535442 (= res!1052717 (and (= (size!49756 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49756 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49756 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535443 () Bool)

(assert (=> b!1535443 (= e!854695 e!854694)))

(declare-fun res!1052712 () Bool)

(assert (=> b!1535443 (=> (not res!1052712) (not e!854694))))

(assert (=> b!1535443 (= res!1052712 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663837 #b00000000000000000000000000000000) (bvslt lt!663837 (size!49756 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535443 (= lt!663837 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535444 () Bool)

(declare-fun res!1052715 () Bool)

(assert (=> b!1535444 (=> (not res!1052715) (not e!854695))))

(assert (=> b!1535444 (= res!1052715 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49204 a!2792) j!64) a!2792 mask!2480) (Found!13361 j!64)))))

(declare-fun res!1052719 () Bool)

(assert (=> start!130878 (=> (not res!1052719) (not e!854695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130878 (= res!1052719 (validMask!0 mask!2480))))

(assert (=> start!130878 e!854695))

(assert (=> start!130878 true))

(declare-fun array_inv!38437 (array!101974) Bool)

(assert (=> start!130878 (array_inv!38437 a!2792)))

(declare-fun b!1535445 () Bool)

(declare-fun res!1052716 () Bool)

(assert (=> b!1535445 (=> (not res!1052716) (not e!854695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101974 (_ BitVec 32)) Bool)

(assert (=> b!1535445 (= res!1052716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535446 () Bool)

(declare-fun res!1052711 () Bool)

(assert (=> b!1535446 (=> (not res!1052711) (not e!854695))))

(declare-datatypes ((List!35756 0))(
  ( (Nil!35753) (Cons!35752 (h!37198 (_ BitVec 64)) (t!50442 List!35756)) )
))
(declare-fun arrayNoDuplicates!0 (array!101974 (_ BitVec 32) List!35756) Bool)

(assert (=> b!1535446 (= res!1052711 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35753))))

(declare-fun b!1535447 () Bool)

(declare-fun res!1052713 () Bool)

(assert (=> b!1535447 (=> (not res!1052713) (not e!854695))))

(assert (=> b!1535447 (= res!1052713 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49756 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49756 a!2792)) (= (select (arr!49204 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535448 () Bool)

(declare-fun res!1052710 () Bool)

(assert (=> b!1535448 (=> (not res!1052710) (not e!854695))))

(assert (=> b!1535448 (= res!1052710 (validKeyInArray!0 (select (arr!49204 a!2792) i!951)))))

(declare-fun b!1535449 () Bool)

(declare-fun res!1052714 () Bool)

(assert (=> b!1535449 (=> (not res!1052714) (not e!854695))))

(assert (=> b!1535449 (= res!1052714 (not (= (select (arr!49204 a!2792) index!463) (select (arr!49204 a!2792) j!64))))))

(assert (= (and start!130878 res!1052719) b!1535442))

(assert (= (and b!1535442 res!1052717) b!1535448))

(assert (= (and b!1535448 res!1052710) b!1535441))

(assert (= (and b!1535441 res!1052718) b!1535445))

(assert (= (and b!1535445 res!1052716) b!1535446))

(assert (= (and b!1535446 res!1052711) b!1535447))

(assert (= (and b!1535447 res!1052713) b!1535444))

(assert (= (and b!1535444 res!1052715) b!1535449))

(assert (= (and b!1535449 res!1052714) b!1535443))

(assert (= (and b!1535443 res!1052712) b!1535440))

(declare-fun m!1417337 () Bool)

(assert (=> b!1535446 m!1417337))

(declare-fun m!1417339 () Bool)

(assert (=> b!1535447 m!1417339))

(declare-fun m!1417341 () Bool)

(assert (=> b!1535443 m!1417341))

(declare-fun m!1417343 () Bool)

(assert (=> b!1535441 m!1417343))

(assert (=> b!1535441 m!1417343))

(declare-fun m!1417345 () Bool)

(assert (=> b!1535441 m!1417345))

(assert (=> b!1535444 m!1417343))

(assert (=> b!1535444 m!1417343))

(declare-fun m!1417347 () Bool)

(assert (=> b!1535444 m!1417347))

(declare-fun m!1417349 () Bool)

(assert (=> b!1535445 m!1417349))

(declare-fun m!1417351 () Bool)

(assert (=> start!130878 m!1417351))

(declare-fun m!1417353 () Bool)

(assert (=> start!130878 m!1417353))

(declare-fun m!1417355 () Bool)

(assert (=> b!1535449 m!1417355))

(assert (=> b!1535449 m!1417343))

(declare-fun m!1417357 () Bool)

(assert (=> b!1535448 m!1417357))

(assert (=> b!1535448 m!1417357))

(declare-fun m!1417359 () Bool)

(assert (=> b!1535448 m!1417359))

(assert (=> b!1535440 m!1417343))

(assert (=> b!1535440 m!1417343))

(declare-fun m!1417361 () Bool)

(assert (=> b!1535440 m!1417361))

(check-sat (not b!1535446) (not b!1535441) (not b!1535448) (not start!130878) (not b!1535440) (not b!1535445) (not b!1535444) (not b!1535443))
(check-sat)
