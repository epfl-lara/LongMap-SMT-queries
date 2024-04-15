; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68646 () Bool)

(assert start!68646)

(declare-fun b!799064 () Bool)

(declare-fun e!443120 () Bool)

(declare-fun e!443122 () Bool)

(assert (=> b!799064 (= e!443120 e!443122)))

(declare-fun res!543724 () Bool)

(assert (=> b!799064 (=> (not res!543724) (not e!443122))))

(declare-datatypes ((SeekEntryResult!8395 0))(
  ( (MissingZero!8395 (index!35948 (_ BitVec 32))) (Found!8395 (index!35949 (_ BitVec 32))) (Intermediate!8395 (undefined!9207 Bool) (index!35950 (_ BitVec 32)) (x!66836 (_ BitVec 32))) (Undefined!8395) (MissingVacant!8395 (index!35951 (_ BitVec 32))) )
))
(declare-fun lt!356681 () SeekEntryResult!8395)

(declare-datatypes ((array!43453 0))(
  ( (array!43454 (arr!20807 (Array (_ BitVec 32) (_ BitVec 64))) (size!21228 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43453)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!356675 () SeekEntryResult!8395)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799064 (= res!543724 (and (= lt!356681 lt!356675) (= lt!356675 (Found!8395 j!153)) (not (= (select (arr!20807 a!3170) index!1236) (select (arr!20807 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43453 (_ BitVec 32)) SeekEntryResult!8395)

(assert (=> b!799064 (= lt!356675 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20807 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43453 (_ BitVec 32)) SeekEntryResult!8395)

(assert (=> b!799064 (= lt!356681 (seekEntryOrOpen!0 (select (arr!20807 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799065 () Bool)

(declare-fun res!543733 () Bool)

(declare-fun e!443121 () Bool)

(assert (=> b!799065 (=> (not res!543733) (not e!443121))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799065 (= res!543733 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21228 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20807 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21228 a!3170)) (= (select (arr!20807 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799066 () Bool)

(declare-fun e!443118 () Bool)

(assert (=> b!799066 (= e!443118 e!443121)))

(declare-fun res!543732 () Bool)

(assert (=> b!799066 (=> (not res!543732) (not e!443121))))

(declare-fun lt!356676 () SeekEntryResult!8395)

(assert (=> b!799066 (= res!543732 (or (= lt!356676 (MissingZero!8395 i!1163)) (= lt!356676 (MissingVacant!8395 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!799066 (= lt!356676 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799067 () Bool)

(declare-fun res!543731 () Bool)

(assert (=> b!799067 (=> (not res!543731) (not e!443118))))

(assert (=> b!799067 (= res!543731 (and (= (size!21228 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21228 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21228 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!543728 () Bool)

(assert (=> start!68646 (=> (not res!543728) (not e!443118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68646 (= res!543728 (validMask!0 mask!3266))))

(assert (=> start!68646 e!443118))

(assert (=> start!68646 true))

(declare-fun array_inv!16690 (array!43453) Bool)

(assert (=> start!68646 (array_inv!16690 a!3170)))

(declare-fun b!799068 () Bool)

(declare-fun res!543729 () Bool)

(assert (=> b!799068 (=> (not res!543729) (not e!443121))))

(declare-datatypes ((List!14809 0))(
  ( (Nil!14806) (Cons!14805 (h!15934 (_ BitVec 64)) (t!21115 List!14809)) )
))
(declare-fun arrayNoDuplicates!0 (array!43453 (_ BitVec 32) List!14809) Bool)

(assert (=> b!799068 (= res!543729 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14806))))

(declare-fun b!799069 () Bool)

(declare-fun res!543735 () Bool)

(declare-fun e!443119 () Bool)

(assert (=> b!799069 (=> (not res!543735) (not e!443119))))

(declare-fun lt!356680 () array!43453)

(declare-fun lt!356677 () (_ BitVec 64))

(declare-fun lt!356678 () SeekEntryResult!8395)

(declare-fun lt!356674 () (_ BitVec 32))

(assert (=> b!799069 (= res!543735 (= lt!356678 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356674 vacantAfter!23 lt!356677 lt!356680 mask!3266)))))

(declare-fun b!799070 () Bool)

(assert (=> b!799070 (= e!443122 e!443119)))

(declare-fun res!543725 () Bool)

(assert (=> b!799070 (=> (not res!543725) (not e!443119))))

(assert (=> b!799070 (= res!543725 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356674 #b00000000000000000000000000000000) (bvslt lt!356674 (size!21228 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799070 (= lt!356674 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799071 () Bool)

(declare-fun res!543726 () Bool)

(assert (=> b!799071 (=> (not res!543726) (not e!443118))))

(declare-fun arrayContainsKey!0 (array!43453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799071 (= res!543726 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799072 () Bool)

(declare-fun res!543727 () Bool)

(assert (=> b!799072 (=> (not res!543727) (not e!443118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799072 (= res!543727 (validKeyInArray!0 k0!2044))))

(declare-fun b!799073 () Bool)

(declare-fun res!543734 () Bool)

(assert (=> b!799073 (=> (not res!543734) (not e!443118))))

(assert (=> b!799073 (= res!543734 (validKeyInArray!0 (select (arr!20807 a!3170) j!153)))))

(declare-fun b!799074 () Bool)

(declare-fun res!543723 () Bool)

(assert (=> b!799074 (=> (not res!543723) (not e!443121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43453 (_ BitVec 32)) Bool)

(assert (=> b!799074 (= res!543723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799075 () Bool)

(assert (=> b!799075 (= e!443119 false)))

(declare-fun lt!356679 () SeekEntryResult!8395)

(assert (=> b!799075 (= lt!356679 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356674 vacantBefore!23 (select (arr!20807 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799076 () Bool)

(assert (=> b!799076 (= e!443121 e!443120)))

(declare-fun res!543730 () Bool)

(assert (=> b!799076 (=> (not res!543730) (not e!443120))))

(assert (=> b!799076 (= res!543730 (= lt!356678 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356677 lt!356680 mask!3266)))))

(assert (=> b!799076 (= lt!356678 (seekEntryOrOpen!0 lt!356677 lt!356680 mask!3266))))

(assert (=> b!799076 (= lt!356677 (select (store (arr!20807 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799076 (= lt!356680 (array!43454 (store (arr!20807 a!3170) i!1163 k0!2044) (size!21228 a!3170)))))

(assert (= (and start!68646 res!543728) b!799067))

(assert (= (and b!799067 res!543731) b!799073))

(assert (= (and b!799073 res!543734) b!799072))

(assert (= (and b!799072 res!543727) b!799071))

(assert (= (and b!799071 res!543726) b!799066))

(assert (= (and b!799066 res!543732) b!799074))

(assert (= (and b!799074 res!543723) b!799068))

(assert (= (and b!799068 res!543729) b!799065))

(assert (= (and b!799065 res!543733) b!799076))

(assert (= (and b!799076 res!543730) b!799064))

(assert (= (and b!799064 res!543724) b!799070))

(assert (= (and b!799070 res!543725) b!799069))

(assert (= (and b!799069 res!543735) b!799075))

(declare-fun m!739573 () Bool)

(assert (=> b!799064 m!739573))

(declare-fun m!739575 () Bool)

(assert (=> b!799064 m!739575))

(assert (=> b!799064 m!739575))

(declare-fun m!739577 () Bool)

(assert (=> b!799064 m!739577))

(assert (=> b!799064 m!739575))

(declare-fun m!739579 () Bool)

(assert (=> b!799064 m!739579))

(declare-fun m!739581 () Bool)

(assert (=> b!799076 m!739581))

(declare-fun m!739583 () Bool)

(assert (=> b!799076 m!739583))

(declare-fun m!739585 () Bool)

(assert (=> b!799076 m!739585))

(declare-fun m!739587 () Bool)

(assert (=> b!799076 m!739587))

(declare-fun m!739589 () Bool)

(assert (=> b!799066 m!739589))

(assert (=> b!799073 m!739575))

(assert (=> b!799073 m!739575))

(declare-fun m!739591 () Bool)

(assert (=> b!799073 m!739591))

(declare-fun m!739593 () Bool)

(assert (=> b!799072 m!739593))

(declare-fun m!739595 () Bool)

(assert (=> b!799065 m!739595))

(declare-fun m!739597 () Bool)

(assert (=> b!799065 m!739597))

(declare-fun m!739599 () Bool)

(assert (=> b!799074 m!739599))

(assert (=> b!799075 m!739575))

(assert (=> b!799075 m!739575))

(declare-fun m!739601 () Bool)

(assert (=> b!799075 m!739601))

(declare-fun m!739603 () Bool)

(assert (=> b!799069 m!739603))

(declare-fun m!739605 () Bool)

(assert (=> b!799071 m!739605))

(declare-fun m!739607 () Bool)

(assert (=> b!799070 m!739607))

(declare-fun m!739609 () Bool)

(assert (=> b!799068 m!739609))

(declare-fun m!739611 () Bool)

(assert (=> start!68646 m!739611))

(declare-fun m!739613 () Bool)

(assert (=> start!68646 m!739613))

(check-sat (not b!799075) (not b!799066) (not start!68646) (not b!799070) (not b!799068) (not b!799071) (not b!799072) (not b!799069) (not b!799064) (not b!799074) (not b!799073) (not b!799076))
(check-sat)
