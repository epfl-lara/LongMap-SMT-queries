; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131304 () Bool)

(assert start!131304)

(declare-fun b!1537559 () Bool)

(declare-fun res!1053073 () Bool)

(declare-fun e!856213 () Bool)

(assert (=> b!1537559 (=> (not res!1053073) (not e!856213))))

(declare-datatypes ((array!102106 0))(
  ( (array!102107 (arr!49261 (Array (_ BitVec 32) (_ BitVec 64))) (size!49812 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102106)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537559 (= res!1053073 (validKeyInArray!0 (select (arr!49261 a!2792) i!951)))))

(declare-fun b!1537560 () Bool)

(declare-fun res!1053075 () Bool)

(assert (=> b!1537560 (=> (not res!1053075) (not e!856213))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537560 (= res!1053075 (validKeyInArray!0 (select (arr!49261 a!2792) j!64)))))

(declare-fun b!1537561 () Bool)

(declare-fun res!1053070 () Bool)

(assert (=> b!1537561 (=> (not res!1053070) (not e!856213))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13288 0))(
  ( (MissingZero!13288 (index!55547 (_ BitVec 32))) (Found!13288 (index!55548 (_ BitVec 32))) (Intermediate!13288 (undefined!14100 Bool) (index!55549 (_ BitVec 32)) (x!137508 (_ BitVec 32))) (Undefined!13288) (MissingVacant!13288 (index!55550 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102106 (_ BitVec 32)) SeekEntryResult!13288)

(assert (=> b!1537561 (= res!1053070 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49261 a!2792) j!64) a!2792 mask!2480) (Found!13288 j!64)))))

(declare-fun b!1537563 () Bool)

(declare-fun res!1053069 () Bool)

(assert (=> b!1537563 (=> (not res!1053069) (not e!856213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102106 (_ BitVec 32)) Bool)

(assert (=> b!1537563 (= res!1053069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537564 () Bool)

(declare-fun res!1053078 () Bool)

(assert (=> b!1537564 (=> (not res!1053078) (not e!856213))))

(declare-datatypes ((List!35722 0))(
  ( (Nil!35719) (Cons!35718 (h!37181 (_ BitVec 64)) (t!50408 List!35722)) )
))
(declare-fun arrayNoDuplicates!0 (array!102106 (_ BitVec 32) List!35722) Bool)

(assert (=> b!1537564 (= res!1053078 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35719))))

(declare-fun b!1537565 () Bool)

(declare-fun e!856212 () Bool)

(assert (=> b!1537565 (= e!856213 e!856212)))

(declare-fun res!1053072 () Bool)

(assert (=> b!1537565 (=> (not res!1053072) (not e!856212))))

(declare-fun lt!664908 () (_ BitVec 32))

(assert (=> b!1537565 (= res!1053072 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664908 #b00000000000000000000000000000000) (bvslt lt!664908 (size!49812 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537565 (= lt!664908 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537566 () Bool)

(declare-fun res!1053074 () Bool)

(assert (=> b!1537566 (=> (not res!1053074) (not e!856213))))

(assert (=> b!1537566 (= res!1053074 (not (= (select (arr!49261 a!2792) index!463) (select (arr!49261 a!2792) j!64))))))

(declare-fun b!1537567 () Bool)

(assert (=> b!1537567 (= e!856212 false)))

(declare-fun lt!664907 () SeekEntryResult!13288)

(assert (=> b!1537567 (= lt!664907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664908 vacantIndex!5 (select (arr!49261 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537568 () Bool)

(declare-fun res!1053077 () Bool)

(assert (=> b!1537568 (=> (not res!1053077) (not e!856213))))

(assert (=> b!1537568 (= res!1053077 (and (= (size!49812 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49812 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49812 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537562 () Bool)

(declare-fun res!1053076 () Bool)

(assert (=> b!1537562 (=> (not res!1053076) (not e!856213))))

(assert (=> b!1537562 (= res!1053076 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49812 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49812 a!2792)) (= (select (arr!49261 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1053071 () Bool)

(assert (=> start!131304 (=> (not res!1053071) (not e!856213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131304 (= res!1053071 (validMask!0 mask!2480))))

(assert (=> start!131304 e!856213))

(assert (=> start!131304 true))

(declare-fun array_inv!38542 (array!102106) Bool)

(assert (=> start!131304 (array_inv!38542 a!2792)))

(assert (= (and start!131304 res!1053071) b!1537568))

(assert (= (and b!1537568 res!1053077) b!1537559))

(assert (= (and b!1537559 res!1053073) b!1537560))

(assert (= (and b!1537560 res!1053075) b!1537563))

(assert (= (and b!1537563 res!1053069) b!1537564))

(assert (= (and b!1537564 res!1053078) b!1537562))

(assert (= (and b!1537562 res!1053076) b!1537561))

(assert (= (and b!1537561 res!1053070) b!1537566))

(assert (= (and b!1537566 res!1053074) b!1537565))

(assert (= (and b!1537565 res!1053072) b!1537567))

(declare-fun m!1419919 () Bool)

(assert (=> b!1537566 m!1419919))

(declare-fun m!1419921 () Bool)

(assert (=> b!1537566 m!1419921))

(declare-fun m!1419923 () Bool)

(assert (=> b!1537564 m!1419923))

(declare-fun m!1419925 () Bool)

(assert (=> b!1537563 m!1419925))

(declare-fun m!1419927 () Bool)

(assert (=> start!131304 m!1419927))

(declare-fun m!1419929 () Bool)

(assert (=> start!131304 m!1419929))

(assert (=> b!1537560 m!1419921))

(assert (=> b!1537560 m!1419921))

(declare-fun m!1419931 () Bool)

(assert (=> b!1537560 m!1419931))

(declare-fun m!1419933 () Bool)

(assert (=> b!1537559 m!1419933))

(assert (=> b!1537559 m!1419933))

(declare-fun m!1419935 () Bool)

(assert (=> b!1537559 m!1419935))

(assert (=> b!1537561 m!1419921))

(assert (=> b!1537561 m!1419921))

(declare-fun m!1419937 () Bool)

(assert (=> b!1537561 m!1419937))

(declare-fun m!1419939 () Bool)

(assert (=> b!1537565 m!1419939))

(assert (=> b!1537567 m!1419921))

(assert (=> b!1537567 m!1419921))

(declare-fun m!1419941 () Bool)

(assert (=> b!1537567 m!1419941))

(declare-fun m!1419943 () Bool)

(assert (=> b!1537562 m!1419943))

(check-sat (not b!1537560) (not b!1537559) (not b!1537567) (not b!1537561) (not b!1537563) (not b!1537564) (not start!131304) (not b!1537565))
(check-sat)
