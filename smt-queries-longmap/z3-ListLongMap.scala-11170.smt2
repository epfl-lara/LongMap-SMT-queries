; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130944 () Bool)

(assert start!130944)

(declare-fun b!1534645 () Bool)

(declare-fun res!1050301 () Bool)

(declare-fun e!855205 () Bool)

(assert (=> b!1534645 (=> (not res!1050301) (not e!855205))))

(declare-datatypes ((array!101860 0))(
  ( (array!101861 (arr!49144 (Array (_ BitVec 32) (_ BitVec 64))) (size!49695 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101860)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534645 (= res!1050301 (validKeyInArray!0 (select (arr!49144 a!2792) i!951)))))

(declare-fun b!1534646 () Bool)

(declare-fun res!1050303 () Bool)

(assert (=> b!1534646 (=> (not res!1050303) (not e!855205))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101860 (_ BitVec 32)) Bool)

(assert (=> b!1534646 (= res!1050303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050299 () Bool)

(assert (=> start!130944 (=> (not res!1050299) (not e!855205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130944 (= res!1050299 (validMask!0 mask!2480))))

(assert (=> start!130944 e!855205))

(assert (=> start!130944 true))

(declare-fun array_inv!38425 (array!101860) Bool)

(assert (=> start!130944 (array_inv!38425 a!2792)))

(declare-fun b!1534647 () Bool)

(assert (=> b!1534647 (= e!855205 (bvsgt #b00000000000000000000000000000000 (size!49695 a!2792)))))

(declare-fun b!1534648 () Bool)

(declare-fun res!1050302 () Bool)

(assert (=> b!1534648 (=> (not res!1050302) (not e!855205))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534648 (= res!1050302 (validKeyInArray!0 (select (arr!49144 a!2792) j!64)))))

(declare-fun b!1534649 () Bool)

(declare-fun res!1050300 () Bool)

(assert (=> b!1534649 (=> (not res!1050300) (not e!855205))))

(assert (=> b!1534649 (= res!1050300 (and (= (size!49695 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49695 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49695 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130944 res!1050299) b!1534649))

(assert (= (and b!1534649 res!1050300) b!1534645))

(assert (= (and b!1534645 res!1050301) b!1534648))

(assert (= (and b!1534648 res!1050302) b!1534646))

(assert (= (and b!1534646 res!1050303) b!1534647))

(declare-fun m!1417243 () Bool)

(assert (=> b!1534645 m!1417243))

(assert (=> b!1534645 m!1417243))

(declare-fun m!1417245 () Bool)

(assert (=> b!1534645 m!1417245))

(declare-fun m!1417247 () Bool)

(assert (=> b!1534646 m!1417247))

(declare-fun m!1417249 () Bool)

(assert (=> start!130944 m!1417249))

(declare-fun m!1417251 () Bool)

(assert (=> start!130944 m!1417251))

(declare-fun m!1417253 () Bool)

(assert (=> b!1534648 m!1417253))

(assert (=> b!1534648 m!1417253))

(declare-fun m!1417255 () Bool)

(assert (=> b!1534648 m!1417255))

(check-sat (not b!1534648) (not b!1534646) (not start!130944) (not b!1534645))
(check-sat)
