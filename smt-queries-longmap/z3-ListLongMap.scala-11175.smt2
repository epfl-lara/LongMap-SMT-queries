; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130684 () Bool)

(assert start!130684)

(declare-fun res!1049893 () Bool)

(declare-fun e!854032 () Bool)

(assert (=> start!130684 (=> (not res!1049893) (not e!854032))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130684 (= res!1049893 (validMask!0 mask!2480))))

(assert (=> start!130684 e!854032))

(assert (=> start!130684 true))

(declare-datatypes ((array!101782 0))(
  ( (array!101783 (arr!49107 (Array (_ BitVec 32) (_ BitVec 64))) (size!49657 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101782)

(declare-fun array_inv!38135 (array!101782) Bool)

(assert (=> start!130684 (array_inv!38135 a!2792)))

(declare-fun b!1532802 () Bool)

(declare-fun res!1049891 () Bool)

(assert (=> b!1532802 (=> (not res!1049891) (not e!854032))))

(declare-datatypes ((List!35581 0))(
  ( (Nil!35578) (Cons!35577 (h!37022 (_ BitVec 64)) (t!50275 List!35581)) )
))
(declare-fun arrayNoDuplicates!0 (array!101782 (_ BitVec 32) List!35581) Bool)

(assert (=> b!1532802 (= res!1049891 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35578))))

(declare-fun b!1532803 () Bool)

(declare-fun res!1049892 () Bool)

(assert (=> b!1532803 (=> (not res!1049892) (not e!854032))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532803 (= res!1049892 (validKeyInArray!0 (select (arr!49107 a!2792) j!64)))))

(declare-fun b!1532804 () Bool)

(declare-fun res!1049888 () Bool)

(assert (=> b!1532804 (=> (not res!1049888) (not e!854032))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532804 (= res!1049888 (and (= (size!49657 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49657 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49657 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532805 () Bool)

(declare-fun res!1049890 () Bool)

(assert (=> b!1532805 (=> (not res!1049890) (not e!854032))))

(assert (=> b!1532805 (= res!1049890 (validKeyInArray!0 (select (arr!49107 a!2792) i!951)))))

(declare-fun b!1532806 () Bool)

(declare-fun res!1049889 () Bool)

(assert (=> b!1532806 (=> (not res!1049889) (not e!854032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101782 (_ BitVec 32)) Bool)

(assert (=> b!1532806 (= res!1049889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun b!1532807 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532807 (= e!854032 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49657 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49657 a!2792)) (= (select (arr!49107 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(assert (= (and start!130684 res!1049893) b!1532804))

(assert (= (and b!1532804 res!1049888) b!1532805))

(assert (= (and b!1532805 res!1049890) b!1532803))

(assert (= (and b!1532803 res!1049892) b!1532806))

(assert (= (and b!1532806 res!1049889) b!1532802))

(assert (= (and b!1532802 res!1049891) b!1532807))

(declare-fun m!1415505 () Bool)

(assert (=> b!1532806 m!1415505))

(declare-fun m!1415507 () Bool)

(assert (=> b!1532805 m!1415507))

(assert (=> b!1532805 m!1415507))

(declare-fun m!1415509 () Bool)

(assert (=> b!1532805 m!1415509))

(declare-fun m!1415511 () Bool)

(assert (=> b!1532807 m!1415511))

(declare-fun m!1415513 () Bool)

(assert (=> b!1532803 m!1415513))

(assert (=> b!1532803 m!1415513))

(declare-fun m!1415515 () Bool)

(assert (=> b!1532803 m!1415515))

(declare-fun m!1415517 () Bool)

(assert (=> b!1532802 m!1415517))

(declare-fun m!1415519 () Bool)

(assert (=> start!130684 m!1415519))

(declare-fun m!1415521 () Bool)

(assert (=> start!130684 m!1415521))

(check-sat (not b!1532802) (not b!1532803) (not b!1532805) (not b!1532806) (not start!130684))
(check-sat)
