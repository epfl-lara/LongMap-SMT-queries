; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130736 () Bool)

(assert start!130736)

(declare-fun b!1533529 () Bool)

(declare-fun res!1050799 () Bool)

(declare-fun e!854140 () Bool)

(assert (=> b!1533529 (=> (not res!1050799) (not e!854140))))

(declare-datatypes ((array!101832 0))(
  ( (array!101833 (arr!49133 (Array (_ BitVec 32) (_ BitVec 64))) (size!49685 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101832)

(declare-datatypes ((List!35685 0))(
  ( (Nil!35682) (Cons!35681 (h!37127 (_ BitVec 64)) (t!50371 List!35685)) )
))
(declare-fun arrayNoDuplicates!0 (array!101832 (_ BitVec 32) List!35685) Bool)

(assert (=> b!1533529 (= res!1050799 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35682))))

(declare-fun b!1533530 () Bool)

(declare-fun res!1050803 () Bool)

(assert (=> b!1533530 (=> (not res!1050803) (not e!854140))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533530 (= res!1050803 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49685 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49685 a!2792)) (= (select (arr!49133 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533531 () Bool)

(declare-fun res!1050804 () Bool)

(assert (=> b!1533531 (=> (not res!1050804) (not e!854140))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533531 (= res!1050804 (validKeyInArray!0 (select (arr!49133 a!2792) j!64)))))

(declare-fun b!1533532 () Bool)

(assert (=> b!1533532 (= e!854140 false)))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13290 0))(
  ( (MissingZero!13290 (index!55555 (_ BitVec 32))) (Found!13290 (index!55556 (_ BitVec 32))) (Intermediate!13290 (undefined!14102 Bool) (index!55557 (_ BitVec 32)) (x!137319 (_ BitVec 32))) (Undefined!13290) (MissingVacant!13290 (index!55558 (_ BitVec 32))) )
))
(declare-fun lt!663531 () SeekEntryResult!13290)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101832 (_ BitVec 32)) SeekEntryResult!13290)

(assert (=> b!1533532 (= lt!663531 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49133 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533533 () Bool)

(declare-fun res!1050800 () Bool)

(assert (=> b!1533533 (=> (not res!1050800) (not e!854140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101832 (_ BitVec 32)) Bool)

(assert (=> b!1533533 (= res!1050800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533534 () Bool)

(declare-fun res!1050801 () Bool)

(assert (=> b!1533534 (=> (not res!1050801) (not e!854140))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533534 (= res!1050801 (and (= (size!49685 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49685 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49685 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050802 () Bool)

(assert (=> start!130736 (=> (not res!1050802) (not e!854140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130736 (= res!1050802 (validMask!0 mask!2480))))

(assert (=> start!130736 e!854140))

(assert (=> start!130736 true))

(declare-fun array_inv!38366 (array!101832) Bool)

(assert (=> start!130736 (array_inv!38366 a!2792)))

(declare-fun b!1533535 () Bool)

(declare-fun res!1050805 () Bool)

(assert (=> b!1533535 (=> (not res!1050805) (not e!854140))))

(assert (=> b!1533535 (= res!1050805 (validKeyInArray!0 (select (arr!49133 a!2792) i!951)))))

(assert (= (and start!130736 res!1050802) b!1533534))

(assert (= (and b!1533534 res!1050801) b!1533535))

(assert (= (and b!1533535 res!1050805) b!1533531))

(assert (= (and b!1533531 res!1050804) b!1533533))

(assert (= (and b!1533533 res!1050800) b!1533529))

(assert (= (and b!1533529 res!1050799) b!1533530))

(assert (= (and b!1533530 res!1050803) b!1533532))

(declare-fun m!1415641 () Bool)

(assert (=> b!1533533 m!1415641))

(declare-fun m!1415643 () Bool)

(assert (=> b!1533531 m!1415643))

(assert (=> b!1533531 m!1415643))

(declare-fun m!1415645 () Bool)

(assert (=> b!1533531 m!1415645))

(declare-fun m!1415647 () Bool)

(assert (=> b!1533535 m!1415647))

(assert (=> b!1533535 m!1415647))

(declare-fun m!1415649 () Bool)

(assert (=> b!1533535 m!1415649))

(declare-fun m!1415651 () Bool)

(assert (=> start!130736 m!1415651))

(declare-fun m!1415653 () Bool)

(assert (=> start!130736 m!1415653))

(assert (=> b!1533532 m!1415643))

(assert (=> b!1533532 m!1415643))

(declare-fun m!1415655 () Bool)

(assert (=> b!1533532 m!1415655))

(declare-fun m!1415657 () Bool)

(assert (=> b!1533530 m!1415657))

(declare-fun m!1415659 () Bool)

(assert (=> b!1533529 m!1415659))

(push 1)

(assert (not b!1533531))

(assert (not start!130736))

(assert (not b!1533529))

(assert (not b!1533533))

(assert (not b!1533535))

(assert (not b!1533532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

