; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130696 () Bool)

(assert start!130696)

(declare-fun b!1532901 () Bool)

(declare-fun res!1049987 () Bool)

(declare-fun e!854068 () Bool)

(assert (=> b!1532901 (=> (not res!1049987) (not e!854068))))

(declare-datatypes ((array!101794 0))(
  ( (array!101795 (arr!49113 (Array (_ BitVec 32) (_ BitVec 64))) (size!49663 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101794)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101794 (_ BitVec 32)) Bool)

(assert (=> b!1532901 (= res!1049987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun b!1532902 () Bool)

(assert (=> b!1532902 (= e!854068 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49663 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49663 a!2792)) (= (select (arr!49113 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1532904 () Bool)

(declare-fun res!1049989 () Bool)

(assert (=> b!1532904 (=> (not res!1049989) (not e!854068))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532904 (= res!1049989 (and (= (size!49663 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49663 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49663 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532903 () Bool)

(declare-fun res!1049992 () Bool)

(assert (=> b!1532903 (=> (not res!1049992) (not e!854068))))

(declare-datatypes ((List!35587 0))(
  ( (Nil!35584) (Cons!35583 (h!37028 (_ BitVec 64)) (t!50281 List!35587)) )
))
(declare-fun arrayNoDuplicates!0 (array!101794 (_ BitVec 32) List!35587) Bool)

(assert (=> b!1532903 (= res!1049992 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35584))))

(declare-fun res!1049991 () Bool)

(assert (=> start!130696 (=> (not res!1049991) (not e!854068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130696 (= res!1049991 (validMask!0 mask!2480))))

(assert (=> start!130696 e!854068))

(assert (=> start!130696 true))

(declare-fun array_inv!38141 (array!101794) Bool)

(assert (=> start!130696 (array_inv!38141 a!2792)))

(declare-fun b!1532905 () Bool)

(declare-fun res!1049988 () Bool)

(assert (=> b!1532905 (=> (not res!1049988) (not e!854068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532905 (= res!1049988 (validKeyInArray!0 (select (arr!49113 a!2792) i!951)))))

(declare-fun b!1532906 () Bool)

(declare-fun res!1049990 () Bool)

(assert (=> b!1532906 (=> (not res!1049990) (not e!854068))))

(assert (=> b!1532906 (= res!1049990 (validKeyInArray!0 (select (arr!49113 a!2792) j!64)))))

(assert (= (and start!130696 res!1049991) b!1532904))

(assert (= (and b!1532904 res!1049989) b!1532905))

(assert (= (and b!1532905 res!1049988) b!1532906))

(assert (= (and b!1532906 res!1049990) b!1532901))

(assert (= (and b!1532901 res!1049987) b!1532903))

(assert (= (and b!1532903 res!1049992) b!1532902))

(declare-fun m!1415607 () Bool)

(assert (=> b!1532902 m!1415607))

(declare-fun m!1415609 () Bool)

(assert (=> b!1532905 m!1415609))

(assert (=> b!1532905 m!1415609))

(declare-fun m!1415611 () Bool)

(assert (=> b!1532905 m!1415611))

(declare-fun m!1415613 () Bool)

(assert (=> b!1532906 m!1415613))

(assert (=> b!1532906 m!1415613))

(declare-fun m!1415615 () Bool)

(assert (=> b!1532906 m!1415615))

(declare-fun m!1415617 () Bool)

(assert (=> b!1532903 m!1415617))

(declare-fun m!1415619 () Bool)

(assert (=> start!130696 m!1415619))

(declare-fun m!1415621 () Bool)

(assert (=> start!130696 m!1415621))

(declare-fun m!1415623 () Bool)

(assert (=> b!1532901 m!1415623))

(check-sat (not start!130696) (not b!1532905) (not b!1532906) (not b!1532903) (not b!1532901))
(check-sat)
