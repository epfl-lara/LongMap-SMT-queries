; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130656 () Bool)

(assert start!130656)

(declare-fun b!1532669 () Bool)

(declare-fun res!1049939 () Bool)

(declare-fun e!853900 () Bool)

(assert (=> b!1532669 (=> (not res!1049939) (not e!853900))))

(declare-datatypes ((array!101752 0))(
  ( (array!101753 (arr!49093 (Array (_ BitVec 32) (_ BitVec 64))) (size!49645 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101752)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532669 (= res!1049939 (validKeyInArray!0 (select (arr!49093 a!2792) j!64)))))

(declare-fun b!1532670 () Bool)

(declare-fun res!1049943 () Bool)

(assert (=> b!1532670 (=> (not res!1049943) (not e!853900))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532670 (= res!1049943 (validKeyInArray!0 (select (arr!49093 a!2792) i!951)))))

(declare-fun res!1049942 () Bool)

(assert (=> start!130656 (=> (not res!1049942) (not e!853900))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130656 (= res!1049942 (validMask!0 mask!2480))))

(assert (=> start!130656 e!853900))

(assert (=> start!130656 true))

(declare-fun array_inv!38326 (array!101752) Bool)

(assert (=> start!130656 (array_inv!38326 a!2792)))

(declare-fun b!1532671 () Bool)

(declare-fun res!1049941 () Bool)

(assert (=> b!1532671 (=> (not res!1049941) (not e!853900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101752 (_ BitVec 32)) Bool)

(assert (=> b!1532671 (= res!1049941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532672 () Bool)

(declare-fun res!1049944 () Bool)

(assert (=> b!1532672 (=> (not res!1049944) (not e!853900))))

(declare-datatypes ((List!35645 0))(
  ( (Nil!35642) (Cons!35641 (h!37087 (_ BitVec 64)) (t!50331 List!35645)) )
))
(declare-fun arrayNoDuplicates!0 (array!101752 (_ BitVec 32) List!35645) Bool)

(assert (=> b!1532672 (= res!1049944 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35642))))

(declare-fun b!1532673 () Bool)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532673 (= e!853900 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49645 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49645 a!2792)) (= (select (arr!49093 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1532674 () Bool)

(declare-fun res!1049940 () Bool)

(assert (=> b!1532674 (=> (not res!1049940) (not e!853900))))

(assert (=> b!1532674 (= res!1049940 (and (= (size!49645 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49645 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49645 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130656 res!1049942) b!1532674))

(assert (= (and b!1532674 res!1049940) b!1532670))

(assert (= (and b!1532670 res!1049943) b!1532669))

(assert (= (and b!1532669 res!1049939) b!1532671))

(assert (= (and b!1532671 res!1049941) b!1532672))

(assert (= (and b!1532672 res!1049944) b!1532673))

(declare-fun m!1414799 () Bool)

(assert (=> b!1532672 m!1414799))

(declare-fun m!1414801 () Bool)

(assert (=> b!1532670 m!1414801))

(assert (=> b!1532670 m!1414801))

(declare-fun m!1414803 () Bool)

(assert (=> b!1532670 m!1414803))

(declare-fun m!1414805 () Bool)

(assert (=> b!1532669 m!1414805))

(assert (=> b!1532669 m!1414805))

(declare-fun m!1414807 () Bool)

(assert (=> b!1532669 m!1414807))

(declare-fun m!1414809 () Bool)

(assert (=> start!130656 m!1414809))

(declare-fun m!1414811 () Bool)

(assert (=> start!130656 m!1414811))

(declare-fun m!1414813 () Bool)

(assert (=> b!1532671 m!1414813))

(declare-fun m!1414815 () Bool)

(assert (=> b!1532673 m!1414815))

(check-sat (not b!1532672) (not b!1532671) (not b!1532670) (not start!130656) (not b!1532669))
(check-sat)
