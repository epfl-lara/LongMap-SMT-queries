; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68514 () Bool)

(assert start!68514)

(declare-fun b!796774 () Bool)

(declare-fun e!442057 () Bool)

(declare-fun e!442054 () Bool)

(assert (=> b!796774 (= e!442057 e!442054)))

(declare-fun res!541439 () Bool)

(assert (=> b!796774 (=> (not res!541439) (not e!442054))))

(declare-datatypes ((SeekEntryResult!8329 0))(
  ( (MissingZero!8329 (index!35684 (_ BitVec 32))) (Found!8329 (index!35685 (_ BitVec 32))) (Intermediate!8329 (undefined!9141 Bool) (index!35686 (_ BitVec 32)) (x!66594 (_ BitVec 32))) (Undefined!8329) (MissingVacant!8329 (index!35687 (_ BitVec 32))) )
))
(declare-fun lt!355263 () SeekEntryResult!8329)

(declare-fun lt!355265 () SeekEntryResult!8329)

(assert (=> b!796774 (= res!541439 (= lt!355263 lt!355265))))

(declare-datatypes ((array!43321 0))(
  ( (array!43322 (arr!20741 (Array (_ BitVec 32) (_ BitVec 64))) (size!21162 (_ BitVec 32))) )
))
(declare-fun lt!355262 () array!43321)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355259 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43321 (_ BitVec 32)) SeekEntryResult!8329)

(assert (=> b!796774 (= lt!355265 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355259 lt!355262 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43321 (_ BitVec 32)) SeekEntryResult!8329)

(assert (=> b!796774 (= lt!355263 (seekEntryOrOpen!0 lt!355259 lt!355262 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43321)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796774 (= lt!355259 (select (store (arr!20741 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796774 (= lt!355262 (array!43322 (store (arr!20741 a!3170) i!1163 k0!2044) (size!21162 a!3170)))))

(declare-fun b!796775 () Bool)

(declare-fun e!442056 () Bool)

(assert (=> b!796775 (= e!442056 e!442057)))

(declare-fun res!541443 () Bool)

(assert (=> b!796775 (=> (not res!541443) (not e!442057))))

(declare-fun lt!355260 () SeekEntryResult!8329)

(assert (=> b!796775 (= res!541443 (or (= lt!355260 (MissingZero!8329 i!1163)) (= lt!355260 (MissingVacant!8329 i!1163))))))

(assert (=> b!796775 (= lt!355260 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!541433 () Bool)

(assert (=> start!68514 (=> (not res!541433) (not e!442056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68514 (= res!541433 (validMask!0 mask!3266))))

(assert (=> start!68514 e!442056))

(assert (=> start!68514 true))

(declare-fun array_inv!16624 (array!43321) Bool)

(assert (=> start!68514 (array_inv!16624 a!3170)))

(declare-fun b!796776 () Bool)

(declare-fun res!541436 () Bool)

(assert (=> b!796776 (=> (not res!541436) (not e!442056))))

(declare-fun arrayContainsKey!0 (array!43321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796776 (= res!541436 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796777 () Bool)

(declare-fun e!442053 () Bool)

(assert (=> b!796777 (= e!442054 e!442053)))

(declare-fun res!541434 () Bool)

(assert (=> b!796777 (=> (not res!541434) (not e!442053))))

(declare-fun lt!355264 () SeekEntryResult!8329)

(declare-fun lt!355261 () SeekEntryResult!8329)

(assert (=> b!796777 (= res!541434 (and (= lt!355264 lt!355261) (= lt!355261 (Found!8329 j!153)) (= (select (arr!20741 a!3170) index!1236) (select (arr!20741 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796777 (= lt!355261 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20741 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796777 (= lt!355264 (seekEntryOrOpen!0 (select (arr!20741 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796778 () Bool)

(declare-fun res!541438 () Bool)

(assert (=> b!796778 (=> (not res!541438) (not e!442057))))

(assert (=> b!796778 (= res!541438 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21162 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20741 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21162 a!3170)) (= (select (arr!20741 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796779 () Bool)

(declare-fun res!541435 () Bool)

(assert (=> b!796779 (=> (not res!541435) (not e!442056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796779 (= res!541435 (validKeyInArray!0 (select (arr!20741 a!3170) j!153)))))

(declare-fun b!796780 () Bool)

(declare-fun res!541440 () Bool)

(assert (=> b!796780 (=> (not res!541440) (not e!442057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43321 (_ BitVec 32)) Bool)

(assert (=> b!796780 (= res!541440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796781 () Bool)

(declare-fun res!541442 () Bool)

(assert (=> b!796781 (=> (not res!541442) (not e!442056))))

(assert (=> b!796781 (= res!541442 (and (= (size!21162 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21162 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21162 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796782 () Bool)

(assert (=> b!796782 (= e!442053 (not true))))

(assert (=> b!796782 (= lt!355265 (Found!8329 index!1236))))

(declare-fun b!796783 () Bool)

(declare-fun res!541441 () Bool)

(assert (=> b!796783 (=> (not res!541441) (not e!442057))))

(declare-datatypes ((List!14743 0))(
  ( (Nil!14740) (Cons!14739 (h!15868 (_ BitVec 64)) (t!21049 List!14743)) )
))
(declare-fun arrayNoDuplicates!0 (array!43321 (_ BitVec 32) List!14743) Bool)

(assert (=> b!796783 (= res!541441 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14740))))

(declare-fun b!796784 () Bool)

(declare-fun res!541437 () Bool)

(assert (=> b!796784 (=> (not res!541437) (not e!442056))))

(assert (=> b!796784 (= res!541437 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68514 res!541433) b!796781))

(assert (= (and b!796781 res!541442) b!796779))

(assert (= (and b!796779 res!541435) b!796784))

(assert (= (and b!796784 res!541437) b!796776))

(assert (= (and b!796776 res!541436) b!796775))

(assert (= (and b!796775 res!541443) b!796780))

(assert (= (and b!796780 res!541440) b!796783))

(assert (= (and b!796783 res!541441) b!796778))

(assert (= (and b!796778 res!541438) b!796774))

(assert (= (and b!796774 res!541439) b!796777))

(assert (= (and b!796777 res!541434) b!796782))

(declare-fun m!737119 () Bool)

(assert (=> b!796777 m!737119))

(declare-fun m!737121 () Bool)

(assert (=> b!796777 m!737121))

(assert (=> b!796777 m!737121))

(declare-fun m!737123 () Bool)

(assert (=> b!796777 m!737123))

(assert (=> b!796777 m!737121))

(declare-fun m!737125 () Bool)

(assert (=> b!796777 m!737125))

(declare-fun m!737127 () Bool)

(assert (=> start!68514 m!737127))

(declare-fun m!737129 () Bool)

(assert (=> start!68514 m!737129))

(declare-fun m!737131 () Bool)

(assert (=> b!796776 m!737131))

(declare-fun m!737133 () Bool)

(assert (=> b!796780 m!737133))

(declare-fun m!737135 () Bool)

(assert (=> b!796784 m!737135))

(assert (=> b!796779 m!737121))

(assert (=> b!796779 m!737121))

(declare-fun m!737137 () Bool)

(assert (=> b!796779 m!737137))

(declare-fun m!737139 () Bool)

(assert (=> b!796778 m!737139))

(declare-fun m!737141 () Bool)

(assert (=> b!796778 m!737141))

(declare-fun m!737143 () Bool)

(assert (=> b!796783 m!737143))

(declare-fun m!737145 () Bool)

(assert (=> b!796774 m!737145))

(declare-fun m!737147 () Bool)

(assert (=> b!796774 m!737147))

(declare-fun m!737149 () Bool)

(assert (=> b!796774 m!737149))

(declare-fun m!737151 () Bool)

(assert (=> b!796774 m!737151))

(declare-fun m!737153 () Bool)

(assert (=> b!796775 m!737153))

(check-sat (not b!796775) (not b!796783) (not b!796774) (not start!68514) (not b!796780) (not b!796784) (not b!796776) (not b!796777) (not b!796779))
(check-sat)
