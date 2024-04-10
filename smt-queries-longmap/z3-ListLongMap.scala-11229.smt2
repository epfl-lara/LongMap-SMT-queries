; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131008 () Bool)

(assert start!131008)

(declare-fun b!1537066 () Bool)

(declare-fun e!855468 () Bool)

(declare-fun e!855471 () Bool)

(assert (=> b!1537066 (= e!855468 e!855471)))

(declare-fun res!1054161 () Bool)

(assert (=> b!1537066 (=> (not res!1054161) (not e!855471))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102106 0))(
  ( (array!102107 (arr!49269 (Array (_ BitVec 32) (_ BitVec 64))) (size!49819 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102106)

(declare-fun lt!664581 () (_ BitVec 32))

(assert (=> b!1537066 (= res!1054161 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664581 #b00000000000000000000000000000000) (bvslt lt!664581 (size!49819 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537066 (= lt!664581 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537067 () Bool)

(declare-fun res!1054160 () Bool)

(assert (=> b!1537067 (=> (not res!1054160) (not e!855468))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537067 (= res!1054160 (not (= (select (arr!49269 a!2792) index!463) (select (arr!49269 a!2792) j!64))))))

(declare-fun b!1537068 () Bool)

(declare-fun res!1054152 () Bool)

(declare-fun e!855470 () Bool)

(assert (=> b!1537068 (=> (not res!1054152) (not e!855470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102106 (_ BitVec 32)) Bool)

(assert (=> b!1537068 (= res!1054152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537069 () Bool)

(declare-fun e!855469 () Bool)

(assert (=> b!1537069 (= e!855471 e!855469)))

(declare-fun res!1054162 () Bool)

(assert (=> b!1537069 (=> (not res!1054162) (not e!855469))))

(declare-datatypes ((SeekEntryResult!13401 0))(
  ( (MissingZero!13401 (index!55999 (_ BitVec 32))) (Found!13401 (index!56000 (_ BitVec 32))) (Intermediate!13401 (undefined!14213 Bool) (index!56001 (_ BitVec 32)) (x!137731 (_ BitVec 32))) (Undefined!13401) (MissingVacant!13401 (index!56002 (_ BitVec 32))) )
))
(declare-fun lt!664579 () SeekEntryResult!13401)

(declare-fun lt!664582 () SeekEntryResult!13401)

(assert (=> b!1537069 (= res!1054162 (= lt!664579 lt!664582))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102106 (_ BitVec 32)) SeekEntryResult!13401)

(assert (=> b!1537069 (= lt!664579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664581 vacantIndex!5 (select (arr!49269 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537070 () Bool)

(declare-fun res!1054158 () Bool)

(assert (=> b!1537070 (=> (not res!1054158) (not e!855470))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537070 (= res!1054158 (and (= (size!49819 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49819 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49819 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537071 () Bool)

(declare-fun res!1054159 () Bool)

(assert (=> b!1537071 (=> (not res!1054159) (not e!855470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537071 (= res!1054159 (validKeyInArray!0 (select (arr!49269 a!2792) i!951)))))

(declare-fun b!1537072 () Bool)

(declare-fun res!1054155 () Bool)

(assert (=> b!1537072 (=> (not res!1054155) (not e!855470))))

(declare-datatypes ((List!35743 0))(
  ( (Nil!35740) (Cons!35739 (h!37184 (_ BitVec 64)) (t!50437 List!35743)) )
))
(declare-fun arrayNoDuplicates!0 (array!102106 (_ BitVec 32) List!35743) Bool)

(assert (=> b!1537072 (= res!1054155 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35740))))

(declare-fun b!1537073 () Bool)

(assert (=> b!1537073 (= e!855470 e!855468)))

(declare-fun res!1054153 () Bool)

(assert (=> b!1537073 (=> (not res!1054153) (not e!855468))))

(assert (=> b!1537073 (= res!1054153 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49269 a!2792) j!64) a!2792 mask!2480) lt!664582))))

(assert (=> b!1537073 (= lt!664582 (Found!13401 j!64))))

(declare-fun res!1054154 () Bool)

(assert (=> start!131008 (=> (not res!1054154) (not e!855470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131008 (= res!1054154 (validMask!0 mask!2480))))

(assert (=> start!131008 e!855470))

(assert (=> start!131008 true))

(declare-fun array_inv!38297 (array!102106) Bool)

(assert (=> start!131008 (array_inv!38297 a!2792)))

(declare-fun b!1537074 () Bool)

(assert (=> b!1537074 (= e!855469 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1537074 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664581 vacantIndex!5 (select (store (arr!49269 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102107 (store (arr!49269 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49819 a!2792)) mask!2480) lt!664579)))

(declare-datatypes ((Unit!51374 0))(
  ( (Unit!51375) )
))
(declare-fun lt!664580 () Unit!51374)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51374)

(assert (=> b!1537074 (= lt!664580 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664581 vacantIndex!5 mask!2480))))

(declare-fun b!1537075 () Bool)

(declare-fun res!1054156 () Bool)

(assert (=> b!1537075 (=> (not res!1054156) (not e!855470))))

(assert (=> b!1537075 (= res!1054156 (validKeyInArray!0 (select (arr!49269 a!2792) j!64)))))

(declare-fun b!1537076 () Bool)

(declare-fun res!1054157 () Bool)

(assert (=> b!1537076 (=> (not res!1054157) (not e!855470))))

(assert (=> b!1537076 (= res!1054157 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49819 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49819 a!2792)) (= (select (arr!49269 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131008 res!1054154) b!1537070))

(assert (= (and b!1537070 res!1054158) b!1537071))

(assert (= (and b!1537071 res!1054159) b!1537075))

(assert (= (and b!1537075 res!1054156) b!1537068))

(assert (= (and b!1537068 res!1054152) b!1537072))

(assert (= (and b!1537072 res!1054155) b!1537076))

(assert (= (and b!1537076 res!1054157) b!1537073))

(assert (= (and b!1537073 res!1054153) b!1537067))

(assert (= (and b!1537067 res!1054160) b!1537066))

(assert (= (and b!1537066 res!1054161) b!1537069))

(assert (= (and b!1537069 res!1054162) b!1537074))

(declare-fun m!1419559 () Bool)

(assert (=> b!1537074 m!1419559))

(declare-fun m!1419561 () Bool)

(assert (=> b!1537074 m!1419561))

(assert (=> b!1537074 m!1419561))

(declare-fun m!1419563 () Bool)

(assert (=> b!1537074 m!1419563))

(declare-fun m!1419565 () Bool)

(assert (=> b!1537074 m!1419565))

(declare-fun m!1419567 () Bool)

(assert (=> start!131008 m!1419567))

(declare-fun m!1419569 () Bool)

(assert (=> start!131008 m!1419569))

(declare-fun m!1419571 () Bool)

(assert (=> b!1537067 m!1419571))

(declare-fun m!1419573 () Bool)

(assert (=> b!1537067 m!1419573))

(declare-fun m!1419575 () Bool)

(assert (=> b!1537068 m!1419575))

(assert (=> b!1537069 m!1419573))

(assert (=> b!1537069 m!1419573))

(declare-fun m!1419577 () Bool)

(assert (=> b!1537069 m!1419577))

(declare-fun m!1419579 () Bool)

(assert (=> b!1537071 m!1419579))

(assert (=> b!1537071 m!1419579))

(declare-fun m!1419581 () Bool)

(assert (=> b!1537071 m!1419581))

(assert (=> b!1537073 m!1419573))

(assert (=> b!1537073 m!1419573))

(declare-fun m!1419583 () Bool)

(assert (=> b!1537073 m!1419583))

(declare-fun m!1419585 () Bool)

(assert (=> b!1537076 m!1419585))

(assert (=> b!1537075 m!1419573))

(assert (=> b!1537075 m!1419573))

(declare-fun m!1419587 () Bool)

(assert (=> b!1537075 m!1419587))

(declare-fun m!1419589 () Bool)

(assert (=> b!1537072 m!1419589))

(declare-fun m!1419591 () Bool)

(assert (=> b!1537066 m!1419591))

(check-sat (not b!1537066) (not b!1537071) (not b!1537069) (not b!1537075) (not b!1537074) (not start!131008) (not b!1537072) (not b!1537068) (not b!1537073))
(check-sat)
