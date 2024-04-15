; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68322 () Bool)

(assert start!68322)

(declare-fun b!793782 () Bool)

(declare-fun res!538445 () Bool)

(declare-fun e!440817 () Bool)

(assert (=> b!793782 (=> (not res!538445) (not e!440817))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793782 (= res!538445 (validKeyInArray!0 k0!2044))))

(declare-fun b!793783 () Bool)

(declare-fun res!538444 () Bool)

(assert (=> b!793783 (=> (not res!538444) (not e!440817))))

(declare-datatypes ((array!43129 0))(
  ( (array!43130 (arr!20645 (Array (_ BitVec 32) (_ BitVec 64))) (size!21066 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43129)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793783 (= res!538444 (validKeyInArray!0 (select (arr!20645 a!3170) j!153)))))

(declare-fun b!793784 () Bool)

(declare-fun e!440816 () Bool)

(assert (=> b!793784 (= e!440816 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353720 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8233 0))(
  ( (MissingZero!8233 (index!35300 (_ BitVec 32))) (Found!8233 (index!35301 (_ BitVec 32))) (Intermediate!8233 (undefined!9045 Bool) (index!35302 (_ BitVec 32)) (x!66242 (_ BitVec 32))) (Undefined!8233) (MissingVacant!8233 (index!35303 (_ BitVec 32))) )
))
(declare-fun lt!353717 () SeekEntryResult!8233)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!353718 () array!43129)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43129 (_ BitVec 32)) SeekEntryResult!8233)

(assert (=> b!793784 (= lt!353717 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353720 lt!353718 mask!3266))))

(declare-fun lt!353716 () SeekEntryResult!8233)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43129 (_ BitVec 32)) SeekEntryResult!8233)

(assert (=> b!793784 (= lt!353716 (seekEntryOrOpen!0 lt!353720 lt!353718 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793784 (= lt!353720 (select (store (arr!20645 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793784 (= lt!353718 (array!43130 (store (arr!20645 a!3170) i!1163 k0!2044) (size!21066 a!3170)))))

(declare-fun b!793785 () Bool)

(assert (=> b!793785 (= e!440817 e!440816)))

(declare-fun res!538441 () Bool)

(assert (=> b!793785 (=> (not res!538441) (not e!440816))))

(declare-fun lt!353719 () SeekEntryResult!8233)

(assert (=> b!793785 (= res!538441 (or (= lt!353719 (MissingZero!8233 i!1163)) (= lt!353719 (MissingVacant!8233 i!1163))))))

(assert (=> b!793785 (= lt!353719 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793786 () Bool)

(declare-fun res!538447 () Bool)

(assert (=> b!793786 (=> (not res!538447) (not e!440816))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793786 (= res!538447 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21066 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20645 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21066 a!3170)) (= (select (arr!20645 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793787 () Bool)

(declare-fun res!538449 () Bool)

(assert (=> b!793787 (=> (not res!538449) (not e!440817))))

(assert (=> b!793787 (= res!538449 (and (= (size!21066 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21066 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21066 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793789 () Bool)

(declare-fun res!538448 () Bool)

(assert (=> b!793789 (=> (not res!538448) (not e!440816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43129 (_ BitVec 32)) Bool)

(assert (=> b!793789 (= res!538448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793790 () Bool)

(declare-fun res!538442 () Bool)

(assert (=> b!793790 (=> (not res!538442) (not e!440817))))

(declare-fun arrayContainsKey!0 (array!43129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793790 (= res!538442 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793788 () Bool)

(declare-fun res!538443 () Bool)

(assert (=> b!793788 (=> (not res!538443) (not e!440816))))

(declare-datatypes ((List!14647 0))(
  ( (Nil!14644) (Cons!14643 (h!15772 (_ BitVec 64)) (t!20953 List!14647)) )
))
(declare-fun arrayNoDuplicates!0 (array!43129 (_ BitVec 32) List!14647) Bool)

(assert (=> b!793788 (= res!538443 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14644))))

(declare-fun res!538446 () Bool)

(assert (=> start!68322 (=> (not res!538446) (not e!440817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68322 (= res!538446 (validMask!0 mask!3266))))

(assert (=> start!68322 e!440817))

(assert (=> start!68322 true))

(declare-fun array_inv!16528 (array!43129) Bool)

(assert (=> start!68322 (array_inv!16528 a!3170)))

(assert (= (and start!68322 res!538446) b!793787))

(assert (= (and b!793787 res!538449) b!793783))

(assert (= (and b!793783 res!538444) b!793782))

(assert (= (and b!793782 res!538445) b!793790))

(assert (= (and b!793790 res!538442) b!793785))

(assert (= (and b!793785 res!538441) b!793789))

(assert (= (and b!793789 res!538448) b!793788))

(assert (= (and b!793788 res!538443) b!793786))

(assert (= (and b!793786 res!538447) b!793784))

(declare-fun m!733801 () Bool)

(assert (=> start!68322 m!733801))

(declare-fun m!733803 () Bool)

(assert (=> start!68322 m!733803))

(declare-fun m!733805 () Bool)

(assert (=> b!793786 m!733805))

(declare-fun m!733807 () Bool)

(assert (=> b!793786 m!733807))

(declare-fun m!733809 () Bool)

(assert (=> b!793784 m!733809))

(declare-fun m!733811 () Bool)

(assert (=> b!793784 m!733811))

(declare-fun m!733813 () Bool)

(assert (=> b!793784 m!733813))

(declare-fun m!733815 () Bool)

(assert (=> b!793784 m!733815))

(declare-fun m!733817 () Bool)

(assert (=> b!793789 m!733817))

(declare-fun m!733819 () Bool)

(assert (=> b!793788 m!733819))

(declare-fun m!733821 () Bool)

(assert (=> b!793790 m!733821))

(declare-fun m!733823 () Bool)

(assert (=> b!793782 m!733823))

(declare-fun m!733825 () Bool)

(assert (=> b!793785 m!733825))

(declare-fun m!733827 () Bool)

(assert (=> b!793783 m!733827))

(assert (=> b!793783 m!733827))

(declare-fun m!733829 () Bool)

(assert (=> b!793783 m!733829))

(check-sat (not b!793789) (not start!68322) (not b!793783) (not b!793782) (not b!793790) (not b!793785) (not b!793784) (not b!793788))
(check-sat)
