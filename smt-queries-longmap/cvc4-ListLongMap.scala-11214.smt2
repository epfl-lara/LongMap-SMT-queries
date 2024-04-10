; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130920 () Bool)

(assert start!130920)

(declare-fun b!1535633 () Bool)

(declare-fun res!1052724 () Bool)

(declare-fun e!854856 () Bool)

(assert (=> b!1535633 (=> (not res!1052724) (not e!854856))))

(declare-datatypes ((array!102018 0))(
  ( (array!102019 (arr!49225 (Array (_ BitVec 32) (_ BitVec 64))) (size!49775 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102018)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535633 (= res!1052724 (validKeyInArray!0 (select (arr!49225 a!2792) j!64)))))

(declare-fun res!1052726 () Bool)

(assert (=> start!130920 (=> (not res!1052726) (not e!854856))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130920 (= res!1052726 (validMask!0 mask!2480))))

(assert (=> start!130920 e!854856))

(assert (=> start!130920 true))

(declare-fun array_inv!38253 (array!102018) Bool)

(assert (=> start!130920 (array_inv!38253 a!2792)))

(declare-fun b!1535634 () Bool)

(declare-fun e!854857 () Bool)

(assert (=> b!1535634 (= e!854856 e!854857)))

(declare-fun res!1052722 () Bool)

(assert (=> b!1535634 (=> (not res!1052722) (not e!854857))))

(declare-fun lt!664098 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1535634 (= res!1052722 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664098 #b00000000000000000000000000000000) (bvslt lt!664098 (size!49775 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535634 (= lt!664098 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535635 () Bool)

(declare-fun res!1052723 () Bool)

(assert (=> b!1535635 (=> (not res!1052723) (not e!854856))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13357 0))(
  ( (MissingZero!13357 (index!55823 (_ BitVec 32))) (Found!13357 (index!55824 (_ BitVec 32))) (Intermediate!13357 (undefined!14169 Bool) (index!55825 (_ BitVec 32)) (x!137567 (_ BitVec 32))) (Undefined!13357) (MissingVacant!13357 (index!55826 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102018 (_ BitVec 32)) SeekEntryResult!13357)

(assert (=> b!1535635 (= res!1052723 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49225 a!2792) j!64) a!2792 mask!2480) (Found!13357 j!64)))))

(declare-fun b!1535636 () Bool)

(declare-fun res!1052725 () Bool)

(assert (=> b!1535636 (=> (not res!1052725) (not e!854856))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535636 (= res!1052725 (validKeyInArray!0 (select (arr!49225 a!2792) i!951)))))

(declare-fun b!1535637 () Bool)

(declare-fun res!1052728 () Bool)

(assert (=> b!1535637 (=> (not res!1052728) (not e!854856))))

(assert (=> b!1535637 (= res!1052728 (not (= (select (arr!49225 a!2792) index!463) (select (arr!49225 a!2792) j!64))))))

(declare-fun b!1535638 () Bool)

(declare-fun res!1052727 () Bool)

(assert (=> b!1535638 (=> (not res!1052727) (not e!854856))))

(assert (=> b!1535638 (= res!1052727 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49775 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49775 a!2792)) (= (select (arr!49225 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535639 () Bool)

(assert (=> b!1535639 (= e!854857 false)))

(declare-fun lt!664099 () SeekEntryResult!13357)

(assert (=> b!1535639 (= lt!664099 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664098 vacantIndex!5 (select (arr!49225 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535640 () Bool)

(declare-fun res!1052720 () Bool)

(assert (=> b!1535640 (=> (not res!1052720) (not e!854856))))

(declare-datatypes ((List!35699 0))(
  ( (Nil!35696) (Cons!35695 (h!37140 (_ BitVec 64)) (t!50393 List!35699)) )
))
(declare-fun arrayNoDuplicates!0 (array!102018 (_ BitVec 32) List!35699) Bool)

(assert (=> b!1535640 (= res!1052720 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35696))))

(declare-fun b!1535641 () Bool)

(declare-fun res!1052719 () Bool)

(assert (=> b!1535641 (=> (not res!1052719) (not e!854856))))

(assert (=> b!1535641 (= res!1052719 (and (= (size!49775 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49775 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49775 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535642 () Bool)

(declare-fun res!1052721 () Bool)

(assert (=> b!1535642 (=> (not res!1052721) (not e!854856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102018 (_ BitVec 32)) Bool)

(assert (=> b!1535642 (= res!1052721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130920 res!1052726) b!1535641))

(assert (= (and b!1535641 res!1052719) b!1535636))

(assert (= (and b!1535636 res!1052725) b!1535633))

(assert (= (and b!1535633 res!1052724) b!1535642))

(assert (= (and b!1535642 res!1052721) b!1535640))

(assert (= (and b!1535640 res!1052720) b!1535638))

(assert (= (and b!1535638 res!1052727) b!1535635))

(assert (= (and b!1535635 res!1052723) b!1535637))

(assert (= (and b!1535637 res!1052728) b!1535634))

(assert (= (and b!1535634 res!1052722) b!1535639))

(declare-fun m!1418125 () Bool)

(assert (=> b!1535636 m!1418125))

(assert (=> b!1535636 m!1418125))

(declare-fun m!1418127 () Bool)

(assert (=> b!1535636 m!1418127))

(declare-fun m!1418129 () Bool)

(assert (=> b!1535640 m!1418129))

(declare-fun m!1418131 () Bool)

(assert (=> b!1535638 m!1418131))

(declare-fun m!1418133 () Bool)

(assert (=> b!1535635 m!1418133))

(assert (=> b!1535635 m!1418133))

(declare-fun m!1418135 () Bool)

(assert (=> b!1535635 m!1418135))

(declare-fun m!1418137 () Bool)

(assert (=> b!1535637 m!1418137))

(assert (=> b!1535637 m!1418133))

(declare-fun m!1418139 () Bool)

(assert (=> b!1535642 m!1418139))

(declare-fun m!1418141 () Bool)

(assert (=> b!1535634 m!1418141))

(assert (=> b!1535639 m!1418133))

(assert (=> b!1535639 m!1418133))

(declare-fun m!1418143 () Bool)

(assert (=> b!1535639 m!1418143))

(assert (=> b!1535633 m!1418133))

(assert (=> b!1535633 m!1418133))

(declare-fun m!1418145 () Bool)

(assert (=> b!1535633 m!1418145))

(declare-fun m!1418147 () Bool)

(assert (=> start!130920 m!1418147))

(declare-fun m!1418149 () Bool)

(assert (=> start!130920 m!1418149))

(push 1)

(assert (not b!1535636))

(assert (not b!1535639))

(assert (not b!1535640))

(assert (not b!1535633))

(assert (not b!1535634))

(assert (not b!1535635))

(assert (not b!1535642))

(assert (not start!130920))

(check-sat)

