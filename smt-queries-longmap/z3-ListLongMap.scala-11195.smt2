; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130752 () Bool)

(assert start!130752)

(declare-fun b!1533708 () Bool)

(declare-fun res!1050982 () Bool)

(declare-fun e!854188 () Bool)

(assert (=> b!1533708 (=> (not res!1050982) (not e!854188))))

(declare-datatypes ((array!101848 0))(
  ( (array!101849 (arr!49141 (Array (_ BitVec 32) (_ BitVec 64))) (size!49693 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101848)

(declare-datatypes ((List!35693 0))(
  ( (Nil!35690) (Cons!35689 (h!37135 (_ BitVec 64)) (t!50379 List!35693)) )
))
(declare-fun arrayNoDuplicates!0 (array!101848 (_ BitVec 32) List!35693) Bool)

(assert (=> b!1533708 (= res!1050982 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35690))))

(declare-fun b!1533709 () Bool)

(declare-fun res!1050985 () Bool)

(assert (=> b!1533709 (=> (not res!1050985) (not e!854188))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533709 (= res!1050985 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49693 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49693 a!2792)) (= (select (arr!49141 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533710 () Bool)

(declare-fun res!1050980 () Bool)

(assert (=> b!1533710 (=> (not res!1050980) (not e!854188))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533710 (= res!1050980 (validKeyInArray!0 (select (arr!49141 a!2792) j!64)))))

(declare-fun b!1533711 () Bool)

(declare-fun res!1050983 () Bool)

(assert (=> b!1533711 (=> (not res!1050983) (not e!854188))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13298 0))(
  ( (MissingZero!13298 (index!55587 (_ BitVec 32))) (Found!13298 (index!55588 (_ BitVec 32))) (Intermediate!13298 (undefined!14110 Bool) (index!55589 (_ BitVec 32)) (x!137351 (_ BitVec 32))) (Undefined!13298) (MissingVacant!13298 (index!55590 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101848 (_ BitVec 32)) SeekEntryResult!13298)

(assert (=> b!1533711 (= res!1050983 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49141 a!2792) j!64) a!2792 mask!2480) (Found!13298 j!64)))))

(declare-fun b!1533712 () Bool)

(assert (=> b!1533712 (= e!854188 (and (= (select (arr!49141 a!2792) index!463) (select (arr!49141 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1050981 () Bool)

(assert (=> start!130752 (=> (not res!1050981) (not e!854188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130752 (= res!1050981 (validMask!0 mask!2480))))

(assert (=> start!130752 e!854188))

(assert (=> start!130752 true))

(declare-fun array_inv!38374 (array!101848) Bool)

(assert (=> start!130752 (array_inv!38374 a!2792)))

(declare-fun b!1533713 () Bool)

(declare-fun res!1050978 () Bool)

(assert (=> b!1533713 (=> (not res!1050978) (not e!854188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101848 (_ BitVec 32)) Bool)

(assert (=> b!1533713 (= res!1050978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533714 () Bool)

(declare-fun res!1050979 () Bool)

(assert (=> b!1533714 (=> (not res!1050979) (not e!854188))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533714 (= res!1050979 (validKeyInArray!0 (select (arr!49141 a!2792) i!951)))))

(declare-fun b!1533715 () Bool)

(declare-fun res!1050984 () Bool)

(assert (=> b!1533715 (=> (not res!1050984) (not e!854188))))

(assert (=> b!1533715 (= res!1050984 (and (= (size!49693 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49693 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49693 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130752 res!1050981) b!1533715))

(assert (= (and b!1533715 res!1050984) b!1533714))

(assert (= (and b!1533714 res!1050979) b!1533710))

(assert (= (and b!1533710 res!1050980) b!1533713))

(assert (= (and b!1533713 res!1050978) b!1533708))

(assert (= (and b!1533708 res!1050982) b!1533709))

(assert (= (and b!1533709 res!1050985) b!1533711))

(assert (= (and b!1533711 res!1050983) b!1533712))

(declare-fun m!1415807 () Bool)

(assert (=> b!1533712 m!1415807))

(declare-fun m!1415809 () Bool)

(assert (=> b!1533712 m!1415809))

(declare-fun m!1415811 () Bool)

(assert (=> start!130752 m!1415811))

(declare-fun m!1415813 () Bool)

(assert (=> start!130752 m!1415813))

(assert (=> b!1533711 m!1415809))

(assert (=> b!1533711 m!1415809))

(declare-fun m!1415815 () Bool)

(assert (=> b!1533711 m!1415815))

(declare-fun m!1415817 () Bool)

(assert (=> b!1533713 m!1415817))

(declare-fun m!1415819 () Bool)

(assert (=> b!1533714 m!1415819))

(assert (=> b!1533714 m!1415819))

(declare-fun m!1415821 () Bool)

(assert (=> b!1533714 m!1415821))

(assert (=> b!1533710 m!1415809))

(assert (=> b!1533710 m!1415809))

(declare-fun m!1415823 () Bool)

(assert (=> b!1533710 m!1415823))

(declare-fun m!1415825 () Bool)

(assert (=> b!1533709 m!1415825))

(declare-fun m!1415827 () Bool)

(assert (=> b!1533708 m!1415827))

(check-sat (not b!1533711) (not start!130752) (not b!1533713) (not b!1533710) (not b!1533708) (not b!1533714))
(check-sat)
