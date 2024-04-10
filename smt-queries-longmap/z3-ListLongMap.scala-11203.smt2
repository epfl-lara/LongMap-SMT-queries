; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130852 () Bool)

(assert start!130852)

(declare-fun b!1534613 () Bool)

(declare-fun res!1051699 () Bool)

(declare-fun e!854550 () Bool)

(assert (=> b!1534613 (=> (not res!1051699) (not e!854550))))

(declare-datatypes ((array!101950 0))(
  ( (array!101951 (arr!49191 (Array (_ BitVec 32) (_ BitVec 64))) (size!49741 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101950)

(declare-datatypes ((List!35665 0))(
  ( (Nil!35662) (Cons!35661 (h!37106 (_ BitVec 64)) (t!50359 List!35665)) )
))
(declare-fun arrayNoDuplicates!0 (array!101950 (_ BitVec 32) List!35665) Bool)

(assert (=> b!1534613 (= res!1051699 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35662))))

(declare-fun b!1534614 () Bool)

(declare-fun e!854551 () Bool)

(assert (=> b!1534614 (= e!854550 e!854551)))

(declare-fun res!1051700 () Bool)

(assert (=> b!1534614 (=> (not res!1051700) (not e!854551))))

(declare-fun lt!663895 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1534614 (= res!1051700 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663895 #b00000000000000000000000000000000) (bvslt lt!663895 (size!49741 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534614 (= lt!663895 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534615 () Bool)

(declare-fun res!1051703 () Bool)

(assert (=> b!1534615 (=> (not res!1051703) (not e!854550))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534615 (= res!1051703 (and (= (size!49741 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49741 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49741 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534616 () Bool)

(declare-fun res!1051707 () Bool)

(assert (=> b!1534616 (=> (not res!1051707) (not e!854550))))

(assert (=> b!1534616 (= res!1051707 (not (= (select (arr!49191 a!2792) index!463) (select (arr!49191 a!2792) j!64))))))

(declare-fun b!1534617 () Bool)

(assert (=> b!1534617 (= e!854551 false)))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13323 0))(
  ( (MissingZero!13323 (index!55687 (_ BitVec 32))) (Found!13323 (index!55688 (_ BitVec 32))) (Intermediate!13323 (undefined!14135 Bool) (index!55689 (_ BitVec 32)) (x!137445 (_ BitVec 32))) (Undefined!13323) (MissingVacant!13323 (index!55690 (_ BitVec 32))) )
))
(declare-fun lt!663894 () SeekEntryResult!13323)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101950 (_ BitVec 32)) SeekEntryResult!13323)

(assert (=> b!1534617 (= lt!663894 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663895 vacantIndex!5 (select (arr!49191 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534618 () Bool)

(declare-fun res!1051701 () Bool)

(assert (=> b!1534618 (=> (not res!1051701) (not e!854550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534618 (= res!1051701 (validKeyInArray!0 (select (arr!49191 a!2792) i!951)))))

(declare-fun b!1534619 () Bool)

(declare-fun res!1051706 () Bool)

(assert (=> b!1534619 (=> (not res!1051706) (not e!854550))))

(assert (=> b!1534619 (= res!1051706 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49191 a!2792) j!64) a!2792 mask!2480) (Found!13323 j!64)))))

(declare-fun b!1534620 () Bool)

(declare-fun res!1051702 () Bool)

(assert (=> b!1534620 (=> (not res!1051702) (not e!854550))))

(assert (=> b!1534620 (= res!1051702 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49741 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49741 a!2792)) (= (select (arr!49191 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051708 () Bool)

(assert (=> start!130852 (=> (not res!1051708) (not e!854550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130852 (= res!1051708 (validMask!0 mask!2480))))

(assert (=> start!130852 e!854550))

(assert (=> start!130852 true))

(declare-fun array_inv!38219 (array!101950) Bool)

(assert (=> start!130852 (array_inv!38219 a!2792)))

(declare-fun b!1534621 () Bool)

(declare-fun res!1051705 () Bool)

(assert (=> b!1534621 (=> (not res!1051705) (not e!854550))))

(assert (=> b!1534621 (= res!1051705 (validKeyInArray!0 (select (arr!49191 a!2792) j!64)))))

(declare-fun b!1534622 () Bool)

(declare-fun res!1051704 () Bool)

(assert (=> b!1534622 (=> (not res!1051704) (not e!854550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101950 (_ BitVec 32)) Bool)

(assert (=> b!1534622 (= res!1051704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130852 res!1051708) b!1534615))

(assert (= (and b!1534615 res!1051703) b!1534618))

(assert (= (and b!1534618 res!1051701) b!1534621))

(assert (= (and b!1534621 res!1051705) b!1534622))

(assert (= (and b!1534622 res!1051704) b!1534613))

(assert (= (and b!1534613 res!1051699) b!1534620))

(assert (= (and b!1534620 res!1051702) b!1534619))

(assert (= (and b!1534619 res!1051706) b!1534616))

(assert (= (and b!1534616 res!1051707) b!1534614))

(assert (= (and b!1534614 res!1051700) b!1534617))

(declare-fun m!1417241 () Bool)

(assert (=> b!1534617 m!1417241))

(assert (=> b!1534617 m!1417241))

(declare-fun m!1417243 () Bool)

(assert (=> b!1534617 m!1417243))

(declare-fun m!1417245 () Bool)

(assert (=> b!1534614 m!1417245))

(declare-fun m!1417247 () Bool)

(assert (=> b!1534622 m!1417247))

(declare-fun m!1417249 () Bool)

(assert (=> b!1534616 m!1417249))

(assert (=> b!1534616 m!1417241))

(assert (=> b!1534619 m!1417241))

(assert (=> b!1534619 m!1417241))

(declare-fun m!1417251 () Bool)

(assert (=> b!1534619 m!1417251))

(declare-fun m!1417253 () Bool)

(assert (=> b!1534618 m!1417253))

(assert (=> b!1534618 m!1417253))

(declare-fun m!1417255 () Bool)

(assert (=> b!1534618 m!1417255))

(declare-fun m!1417257 () Bool)

(assert (=> b!1534613 m!1417257))

(declare-fun m!1417259 () Bool)

(assert (=> start!130852 m!1417259))

(declare-fun m!1417261 () Bool)

(assert (=> start!130852 m!1417261))

(assert (=> b!1534621 m!1417241))

(assert (=> b!1534621 m!1417241))

(declare-fun m!1417263 () Bool)

(assert (=> b!1534621 m!1417263))

(declare-fun m!1417265 () Bool)

(assert (=> b!1534620 m!1417265))

(check-sat (not b!1534613) (not b!1534619) (not b!1534621) (not start!130852) (not b!1534618) (not b!1534622) (not b!1534617) (not b!1534614))
(check-sat)
