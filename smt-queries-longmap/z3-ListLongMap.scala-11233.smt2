; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131448 () Bool)

(assert start!131448)

(declare-fun b!1539865 () Bool)

(declare-fun e!857146 () Bool)

(declare-fun e!857145 () Bool)

(assert (=> b!1539865 (= e!857146 e!857145)))

(declare-fun res!1055375 () Bool)

(assert (=> b!1539865 (=> (not res!1055375) (not e!857145))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102250 0))(
  ( (array!102251 (arr!49333 (Array (_ BitVec 32) (_ BitVec 64))) (size!49884 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102250)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13360 0))(
  ( (MissingZero!13360 (index!55835 (_ BitVec 32))) (Found!13360 (index!55836 (_ BitVec 32))) (Intermediate!13360 (undefined!14172 Bool) (index!55837 (_ BitVec 32)) (x!137772 (_ BitVec 32))) (Undefined!13360) (MissingVacant!13360 (index!55838 (_ BitVec 32))) )
))
(declare-fun lt!665625 () SeekEntryResult!13360)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102250 (_ BitVec 32)) SeekEntryResult!13360)

(assert (=> b!1539865 (= res!1055375 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480) lt!665625))))

(assert (=> b!1539865 (= lt!665625 (Found!13360 j!64))))

(declare-fun b!1539866 () Bool)

(declare-fun res!1055378 () Bool)

(assert (=> b!1539866 (=> (not res!1055378) (not e!857146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102250 (_ BitVec 32)) Bool)

(assert (=> b!1539866 (= res!1055378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539867 () Bool)

(declare-fun res!1055383 () Bool)

(assert (=> b!1539867 (=> (not res!1055383) (not e!857146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539867 (= res!1055383 (validKeyInArray!0 (select (arr!49333 a!2792) j!64)))))

(declare-fun b!1539868 () Bool)

(declare-fun res!1055381 () Bool)

(assert (=> b!1539868 (=> (not res!1055381) (not e!857145))))

(assert (=> b!1539868 (= res!1055381 (not (= (select (arr!49333 a!2792) index!463) (select (arr!49333 a!2792) j!64))))))

(declare-fun res!1055382 () Bool)

(assert (=> start!131448 (=> (not res!1055382) (not e!857146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131448 (= res!1055382 (validMask!0 mask!2480))))

(assert (=> start!131448 e!857146))

(assert (=> start!131448 true))

(declare-fun array_inv!38614 (array!102250) Bool)

(assert (=> start!131448 (array_inv!38614 a!2792)))

(declare-fun b!1539869 () Bool)

(declare-fun res!1055385 () Bool)

(assert (=> b!1539869 (=> (not res!1055385) (not e!857146))))

(assert (=> b!1539869 (= res!1055385 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49884 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49884 a!2792)) (= (select (arr!49333 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539870 () Bool)

(declare-fun res!1055379 () Bool)

(assert (=> b!1539870 (=> (not res!1055379) (not e!857146))))

(declare-datatypes ((List!35794 0))(
  ( (Nil!35791) (Cons!35790 (h!37253 (_ BitVec 64)) (t!50480 List!35794)) )
))
(declare-fun arrayNoDuplicates!0 (array!102250 (_ BitVec 32) List!35794) Bool)

(assert (=> b!1539870 (= res!1055379 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35791))))

(declare-fun b!1539871 () Bool)

(declare-fun e!857143 () Bool)

(declare-fun e!857142 () Bool)

(assert (=> b!1539871 (= e!857143 e!857142)))

(declare-fun res!1055377 () Bool)

(assert (=> b!1539871 (=> (not res!1055377) (not e!857142))))

(declare-fun lt!665624 () SeekEntryResult!13360)

(assert (=> b!1539871 (= res!1055377 (= lt!665624 lt!665625))))

(declare-fun lt!665623 () (_ BitVec 32))

(assert (=> b!1539871 (= lt!665624 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665623 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539872 () Bool)

(assert (=> b!1539872 (= e!857145 e!857143)))

(declare-fun res!1055376 () Bool)

(assert (=> b!1539872 (=> (not res!1055376) (not e!857143))))

(assert (=> b!1539872 (= res!1055376 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665623 #b00000000000000000000000000000000) (bvslt lt!665623 (size!49884 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539872 (= lt!665623 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539873 () Bool)

(declare-fun res!1055380 () Bool)

(assert (=> b!1539873 (=> (not res!1055380) (not e!857146))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539873 (= res!1055380 (validKeyInArray!0 (select (arr!49333 a!2792) i!951)))))

(declare-fun b!1539874 () Bool)

(assert (=> b!1539874 (= e!857142 (not true))))

(assert (=> b!1539874 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665623 vacantIndex!5 (select (store (arr!49333 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102251 (store (arr!49333 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49884 a!2792)) mask!2480) lt!665624)))

(declare-datatypes ((Unit!51329 0))(
  ( (Unit!51330) )
))
(declare-fun lt!665622 () Unit!51329)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51329)

(assert (=> b!1539874 (= lt!665622 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665623 vacantIndex!5 mask!2480))))

(declare-fun b!1539875 () Bool)

(declare-fun res!1055384 () Bool)

(assert (=> b!1539875 (=> (not res!1055384) (not e!857146))))

(assert (=> b!1539875 (= res!1055384 (and (= (size!49884 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49884 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49884 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131448 res!1055382) b!1539875))

(assert (= (and b!1539875 res!1055384) b!1539873))

(assert (= (and b!1539873 res!1055380) b!1539867))

(assert (= (and b!1539867 res!1055383) b!1539866))

(assert (= (and b!1539866 res!1055378) b!1539870))

(assert (= (and b!1539870 res!1055379) b!1539869))

(assert (= (and b!1539869 res!1055385) b!1539865))

(assert (= (and b!1539865 res!1055375) b!1539868))

(assert (= (and b!1539868 res!1055381) b!1539872))

(assert (= (and b!1539872 res!1055376) b!1539871))

(assert (= (and b!1539871 res!1055377) b!1539874))

(declare-fun m!1422169 () Bool)

(assert (=> b!1539872 m!1422169))

(declare-fun m!1422171 () Bool)

(assert (=> b!1539870 m!1422171))

(declare-fun m!1422173 () Bool)

(assert (=> b!1539869 m!1422173))

(declare-fun m!1422175 () Bool)

(assert (=> b!1539873 m!1422175))

(assert (=> b!1539873 m!1422175))

(declare-fun m!1422177 () Bool)

(assert (=> b!1539873 m!1422177))

(declare-fun m!1422179 () Bool)

(assert (=> b!1539871 m!1422179))

(assert (=> b!1539871 m!1422179))

(declare-fun m!1422181 () Bool)

(assert (=> b!1539871 m!1422181))

(declare-fun m!1422183 () Bool)

(assert (=> b!1539874 m!1422183))

(declare-fun m!1422185 () Bool)

(assert (=> b!1539874 m!1422185))

(assert (=> b!1539874 m!1422185))

(declare-fun m!1422187 () Bool)

(assert (=> b!1539874 m!1422187))

(declare-fun m!1422189 () Bool)

(assert (=> b!1539874 m!1422189))

(declare-fun m!1422191 () Bool)

(assert (=> start!131448 m!1422191))

(declare-fun m!1422193 () Bool)

(assert (=> start!131448 m!1422193))

(assert (=> b!1539865 m!1422179))

(assert (=> b!1539865 m!1422179))

(declare-fun m!1422195 () Bool)

(assert (=> b!1539865 m!1422195))

(declare-fun m!1422197 () Bool)

(assert (=> b!1539866 m!1422197))

(declare-fun m!1422199 () Bool)

(assert (=> b!1539868 m!1422199))

(assert (=> b!1539868 m!1422179))

(assert (=> b!1539867 m!1422179))

(assert (=> b!1539867 m!1422179))

(declare-fun m!1422201 () Bool)

(assert (=> b!1539867 m!1422201))

(check-sat (not b!1539866) (not b!1539870) (not b!1539871) (not start!131448) (not b!1539872) (not b!1539873) (not b!1539874) (not b!1539865) (not b!1539867))
(check-sat)
