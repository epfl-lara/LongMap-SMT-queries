; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130892 () Bool)

(assert start!130892)

(declare-fun b!1535213 () Bool)

(declare-fun res!1052300 () Bool)

(declare-fun e!854731 () Bool)

(assert (=> b!1535213 (=> (not res!1052300) (not e!854731))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101990 0))(
  ( (array!101991 (arr!49211 (Array (_ BitVec 32) (_ BitVec 64))) (size!49761 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101990)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13343 0))(
  ( (MissingZero!13343 (index!55767 (_ BitVec 32))) (Found!13343 (index!55768 (_ BitVec 32))) (Intermediate!13343 (undefined!14155 Bool) (index!55769 (_ BitVec 32)) (x!137521 (_ BitVec 32))) (Undefined!13343) (MissingVacant!13343 (index!55770 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101990 (_ BitVec 32)) SeekEntryResult!13343)

(assert (=> b!1535213 (= res!1052300 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49211 a!2792) j!64) a!2792 mask!2480) (Found!13343 j!64)))))

(declare-fun b!1535214 () Bool)

(declare-fun res!1052304 () Bool)

(assert (=> b!1535214 (=> (not res!1052304) (not e!854731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535214 (= res!1052304 (validKeyInArray!0 (select (arr!49211 a!2792) j!64)))))

(declare-fun b!1535215 () Bool)

(declare-fun e!854729 () Bool)

(assert (=> b!1535215 (= e!854729 false)))

(declare-fun lt!664014 () (_ BitVec 32))

(declare-fun lt!664015 () SeekEntryResult!13343)

(assert (=> b!1535215 (= lt!664015 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664014 vacantIndex!5 (select (arr!49211 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535216 () Bool)

(declare-fun res!1052306 () Bool)

(assert (=> b!1535216 (=> (not res!1052306) (not e!854731))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535216 (= res!1052306 (validKeyInArray!0 (select (arr!49211 a!2792) i!951)))))

(declare-fun b!1535217 () Bool)

(assert (=> b!1535217 (= e!854731 e!854729)))

(declare-fun res!1052308 () Bool)

(assert (=> b!1535217 (=> (not res!1052308) (not e!854729))))

(assert (=> b!1535217 (= res!1052308 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664014 #b00000000000000000000000000000000) (bvslt lt!664014 (size!49761 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535217 (= lt!664014 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535218 () Bool)

(declare-fun res!1052303 () Bool)

(assert (=> b!1535218 (=> (not res!1052303) (not e!854731))))

(assert (=> b!1535218 (= res!1052303 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49761 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49761 a!2792)) (= (select (arr!49211 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535219 () Bool)

(declare-fun res!1052305 () Bool)

(assert (=> b!1535219 (=> (not res!1052305) (not e!854731))))

(assert (=> b!1535219 (= res!1052305 (not (= (select (arr!49211 a!2792) index!463) (select (arr!49211 a!2792) j!64))))))

(declare-fun b!1535220 () Bool)

(declare-fun res!1052307 () Bool)

(assert (=> b!1535220 (=> (not res!1052307) (not e!854731))))

(declare-datatypes ((List!35685 0))(
  ( (Nil!35682) (Cons!35681 (h!37126 (_ BitVec 64)) (t!50379 List!35685)) )
))
(declare-fun arrayNoDuplicates!0 (array!101990 (_ BitVec 32) List!35685) Bool)

(assert (=> b!1535220 (= res!1052307 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35682))))

(declare-fun b!1535221 () Bool)

(declare-fun res!1052301 () Bool)

(assert (=> b!1535221 (=> (not res!1052301) (not e!854731))))

(assert (=> b!1535221 (= res!1052301 (and (= (size!49761 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49761 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49761 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535222 () Bool)

(declare-fun res!1052302 () Bool)

(assert (=> b!1535222 (=> (not res!1052302) (not e!854731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101990 (_ BitVec 32)) Bool)

(assert (=> b!1535222 (= res!1052302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1052299 () Bool)

(assert (=> start!130892 (=> (not res!1052299) (not e!854731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130892 (= res!1052299 (validMask!0 mask!2480))))

(assert (=> start!130892 e!854731))

(assert (=> start!130892 true))

(declare-fun array_inv!38239 (array!101990) Bool)

(assert (=> start!130892 (array_inv!38239 a!2792)))

(assert (= (and start!130892 res!1052299) b!1535221))

(assert (= (and b!1535221 res!1052301) b!1535216))

(assert (= (and b!1535216 res!1052306) b!1535214))

(assert (= (and b!1535214 res!1052304) b!1535222))

(assert (= (and b!1535222 res!1052302) b!1535220))

(assert (= (and b!1535220 res!1052307) b!1535218))

(assert (= (and b!1535218 res!1052303) b!1535213))

(assert (= (and b!1535213 res!1052300) b!1535219))

(assert (= (and b!1535219 res!1052305) b!1535217))

(assert (= (and b!1535217 res!1052308) b!1535215))

(declare-fun m!1417761 () Bool)

(assert (=> b!1535214 m!1417761))

(assert (=> b!1535214 m!1417761))

(declare-fun m!1417763 () Bool)

(assert (=> b!1535214 m!1417763))

(declare-fun m!1417765 () Bool)

(assert (=> b!1535222 m!1417765))

(assert (=> b!1535215 m!1417761))

(assert (=> b!1535215 m!1417761))

(declare-fun m!1417767 () Bool)

(assert (=> b!1535215 m!1417767))

(declare-fun m!1417769 () Bool)

(assert (=> b!1535218 m!1417769))

(declare-fun m!1417771 () Bool)

(assert (=> b!1535217 m!1417771))

(declare-fun m!1417773 () Bool)

(assert (=> b!1535216 m!1417773))

(assert (=> b!1535216 m!1417773))

(declare-fun m!1417775 () Bool)

(assert (=> b!1535216 m!1417775))

(declare-fun m!1417777 () Bool)

(assert (=> b!1535220 m!1417777))

(declare-fun m!1417779 () Bool)

(assert (=> start!130892 m!1417779))

(declare-fun m!1417781 () Bool)

(assert (=> start!130892 m!1417781))

(assert (=> b!1535213 m!1417761))

(assert (=> b!1535213 m!1417761))

(declare-fun m!1417783 () Bool)

(assert (=> b!1535213 m!1417783))

(declare-fun m!1417785 () Bool)

(assert (=> b!1535219 m!1417785))

(assert (=> b!1535219 m!1417761))

(push 1)

