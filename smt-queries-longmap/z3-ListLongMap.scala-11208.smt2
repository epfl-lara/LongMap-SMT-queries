; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130882 () Bool)

(assert start!130882)

(declare-fun b!1535064 () Bool)

(declare-fun res!1052153 () Bool)

(declare-fun e!854685 () Bool)

(assert (=> b!1535064 (=> (not res!1052153) (not e!854685))))

(declare-datatypes ((array!101980 0))(
  ( (array!101981 (arr!49206 (Array (_ BitVec 32) (_ BitVec 64))) (size!49756 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101980)

(declare-datatypes ((List!35680 0))(
  ( (Nil!35677) (Cons!35676 (h!37121 (_ BitVec 64)) (t!50374 List!35680)) )
))
(declare-fun arrayNoDuplicates!0 (array!101980 (_ BitVec 32) List!35680) Bool)

(assert (=> b!1535064 (= res!1052153 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35677))))

(declare-fun b!1535065 () Bool)

(declare-fun e!854684 () Bool)

(assert (=> b!1535065 (= e!854684 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13338 0))(
  ( (MissingZero!13338 (index!55747 (_ BitVec 32))) (Found!13338 (index!55748 (_ BitVec 32))) (Intermediate!13338 (undefined!14150 Bool) (index!55749 (_ BitVec 32)) (x!137500 (_ BitVec 32))) (Undefined!13338) (MissingVacant!13338 (index!55750 (_ BitVec 32))) )
))
(declare-fun lt!663984 () SeekEntryResult!13338)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!663985 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101980 (_ BitVec 32)) SeekEntryResult!13338)

(assert (=> b!1535065 (= lt!663984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663985 vacantIndex!5 (select (arr!49206 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535066 () Bool)

(declare-fun res!1052156 () Bool)

(assert (=> b!1535066 (=> (not res!1052156) (not e!854685))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535066 (= res!1052156 (validKeyInArray!0 (select (arr!49206 a!2792) i!951)))))

(declare-fun b!1535067 () Bool)

(declare-fun res!1052155 () Bool)

(assert (=> b!1535067 (=> (not res!1052155) (not e!854685))))

(assert (=> b!1535067 (= res!1052155 (validKeyInArray!0 (select (arr!49206 a!2792) j!64)))))

(declare-fun b!1535068 () Bool)

(declare-fun res!1052158 () Bool)

(assert (=> b!1535068 (=> (not res!1052158) (not e!854685))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535068 (= res!1052158 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49206 a!2792) j!64) a!2792 mask!2480) (Found!13338 j!64)))))

(declare-fun res!1052149 () Bool)

(assert (=> start!130882 (=> (not res!1052149) (not e!854685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130882 (= res!1052149 (validMask!0 mask!2480))))

(assert (=> start!130882 e!854685))

(assert (=> start!130882 true))

(declare-fun array_inv!38234 (array!101980) Bool)

(assert (=> start!130882 (array_inv!38234 a!2792)))

(declare-fun b!1535063 () Bool)

(declare-fun res!1052157 () Bool)

(assert (=> b!1535063 (=> (not res!1052157) (not e!854685))))

(assert (=> b!1535063 (= res!1052157 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49756 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49756 a!2792)) (= (select (arr!49206 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535069 () Bool)

(declare-fun res!1052152 () Bool)

(assert (=> b!1535069 (=> (not res!1052152) (not e!854685))))

(assert (=> b!1535069 (= res!1052152 (not (= (select (arr!49206 a!2792) index!463) (select (arr!49206 a!2792) j!64))))))

(declare-fun b!1535070 () Bool)

(declare-fun res!1052151 () Bool)

(assert (=> b!1535070 (=> (not res!1052151) (not e!854685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101980 (_ BitVec 32)) Bool)

(assert (=> b!1535070 (= res!1052151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535071 () Bool)

(assert (=> b!1535071 (= e!854685 e!854684)))

(declare-fun res!1052154 () Bool)

(assert (=> b!1535071 (=> (not res!1052154) (not e!854684))))

(assert (=> b!1535071 (= res!1052154 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663985 #b00000000000000000000000000000000) (bvslt lt!663985 (size!49756 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535071 (= lt!663985 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535072 () Bool)

(declare-fun res!1052150 () Bool)

(assert (=> b!1535072 (=> (not res!1052150) (not e!854685))))

(assert (=> b!1535072 (= res!1052150 (and (= (size!49756 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49756 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49756 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130882 res!1052149) b!1535072))

(assert (= (and b!1535072 res!1052150) b!1535066))

(assert (= (and b!1535066 res!1052156) b!1535067))

(assert (= (and b!1535067 res!1052155) b!1535070))

(assert (= (and b!1535070 res!1052151) b!1535064))

(assert (= (and b!1535064 res!1052153) b!1535063))

(assert (= (and b!1535063 res!1052157) b!1535068))

(assert (= (and b!1535068 res!1052158) b!1535069))

(assert (= (and b!1535069 res!1052152) b!1535071))

(assert (= (and b!1535071 res!1052154) b!1535065))

(declare-fun m!1417631 () Bool)

(assert (=> b!1535066 m!1417631))

(assert (=> b!1535066 m!1417631))

(declare-fun m!1417633 () Bool)

(assert (=> b!1535066 m!1417633))

(declare-fun m!1417635 () Bool)

(assert (=> b!1535070 m!1417635))

(declare-fun m!1417637 () Bool)

(assert (=> b!1535067 m!1417637))

(assert (=> b!1535067 m!1417637))

(declare-fun m!1417639 () Bool)

(assert (=> b!1535067 m!1417639))

(assert (=> b!1535065 m!1417637))

(assert (=> b!1535065 m!1417637))

(declare-fun m!1417641 () Bool)

(assert (=> b!1535065 m!1417641))

(declare-fun m!1417643 () Bool)

(assert (=> start!130882 m!1417643))

(declare-fun m!1417645 () Bool)

(assert (=> start!130882 m!1417645))

(declare-fun m!1417647 () Bool)

(assert (=> b!1535069 m!1417647))

(assert (=> b!1535069 m!1417637))

(declare-fun m!1417649 () Bool)

(assert (=> b!1535063 m!1417649))

(declare-fun m!1417651 () Bool)

(assert (=> b!1535064 m!1417651))

(assert (=> b!1535068 m!1417637))

(assert (=> b!1535068 m!1417637))

(declare-fun m!1417653 () Bool)

(assert (=> b!1535068 m!1417653))

(declare-fun m!1417655 () Bool)

(assert (=> b!1535071 m!1417655))

(check-sat (not b!1535065) (not b!1535070) (not b!1535064) (not b!1535071) (not b!1535068) (not b!1535066) (not start!130882) (not b!1535067))
(check-sat)
