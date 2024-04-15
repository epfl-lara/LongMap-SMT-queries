; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68472 () Bool)

(assert start!68472)

(declare-fun b!796063 () Bool)

(declare-fun res!540722 () Bool)

(declare-fun e!441720 () Bool)

(assert (=> b!796063 (=> (not res!540722) (not e!441720))))

(declare-datatypes ((array!43279 0))(
  ( (array!43280 (arr!20720 (Array (_ BitVec 32) (_ BitVec 64))) (size!21141 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43279)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796063 (= res!540722 (validKeyInArray!0 (select (arr!20720 a!3170) j!153)))))

(declare-fun b!796064 () Bool)

(declare-fun res!540725 () Bool)

(declare-fun e!441724 () Bool)

(assert (=> b!796064 (=> (not res!540725) (not e!441724))))

(declare-datatypes ((List!14722 0))(
  ( (Nil!14719) (Cons!14718 (h!15847 (_ BitVec 64)) (t!21028 List!14722)) )
))
(declare-fun arrayNoDuplicates!0 (array!43279 (_ BitVec 32) List!14722) Bool)

(assert (=> b!796064 (= res!540725 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14719))))

(declare-fun b!796065 () Bool)

(declare-fun res!540724 () Bool)

(assert (=> b!796065 (=> (not res!540724) (not e!441720))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796065 (= res!540724 (and (= (size!21141 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21141 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21141 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796066 () Bool)

(declare-fun e!441721 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796066 (= e!441721 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-datatypes ((SeekEntryResult!8308 0))(
  ( (MissingZero!8308 (index!35600 (_ BitVec 32))) (Found!8308 (index!35601 (_ BitVec 32))) (Intermediate!8308 (undefined!9120 Bool) (index!35602 (_ BitVec 32)) (x!66517 (_ BitVec 32))) (Undefined!8308) (MissingVacant!8308 (index!35603 (_ BitVec 32))) )
))
(declare-fun lt!354814 () SeekEntryResult!8308)

(assert (=> b!796066 (= lt!354814 (Found!8308 index!1236))))

(declare-fun res!540728 () Bool)

(assert (=> start!68472 (=> (not res!540728) (not e!441720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68472 (= res!540728 (validMask!0 mask!3266))))

(assert (=> start!68472 e!441720))

(assert (=> start!68472 true))

(declare-fun array_inv!16603 (array!43279) Bool)

(assert (=> start!68472 (array_inv!16603 a!3170)))

(declare-fun b!796067 () Bool)

(assert (=> b!796067 (= e!441720 e!441724)))

(declare-fun res!540731 () Bool)

(assert (=> b!796067 (=> (not res!540731) (not e!441724))))

(declare-fun lt!354815 () SeekEntryResult!8308)

(assert (=> b!796067 (= res!540731 (or (= lt!354815 (MissingZero!8308 i!1163)) (= lt!354815 (MissingVacant!8308 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43279 (_ BitVec 32)) SeekEntryResult!8308)

(assert (=> b!796067 (= lt!354815 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796068 () Bool)

(declare-fun e!441723 () Bool)

(assert (=> b!796068 (= e!441723 e!441721)))

(declare-fun res!540727 () Bool)

(assert (=> b!796068 (=> (not res!540727) (not e!441721))))

(declare-fun lt!354810 () SeekEntryResult!8308)

(declare-fun lt!354811 () SeekEntryResult!8308)

(assert (=> b!796068 (= res!540727 (and (= lt!354810 lt!354811) (= lt!354811 (Found!8308 j!153)) (= (select (arr!20720 a!3170) index!1236) (select (arr!20720 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43279 (_ BitVec 32)) SeekEntryResult!8308)

(assert (=> b!796068 (= lt!354811 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20720 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796068 (= lt!354810 (seekEntryOrOpen!0 (select (arr!20720 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796069 () Bool)

(declare-fun res!540723 () Bool)

(assert (=> b!796069 (=> (not res!540723) (not e!441724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43279 (_ BitVec 32)) Bool)

(assert (=> b!796069 (= res!540723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796070 () Bool)

(declare-fun res!540732 () Bool)

(assert (=> b!796070 (=> (not res!540732) (not e!441724))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!796070 (= res!540732 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21141 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20720 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21141 a!3170)) (= (select (arr!20720 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796071 () Bool)

(assert (=> b!796071 (= e!441724 e!441723)))

(declare-fun res!540726 () Bool)

(assert (=> b!796071 (=> (not res!540726) (not e!441723))))

(declare-fun lt!354809 () SeekEntryResult!8308)

(assert (=> b!796071 (= res!540726 (= lt!354809 lt!354814))))

(declare-fun lt!354813 () array!43279)

(declare-fun lt!354812 () (_ BitVec 64))

(assert (=> b!796071 (= lt!354814 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354812 lt!354813 mask!3266))))

(assert (=> b!796071 (= lt!354809 (seekEntryOrOpen!0 lt!354812 lt!354813 mask!3266))))

(assert (=> b!796071 (= lt!354812 (select (store (arr!20720 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796071 (= lt!354813 (array!43280 (store (arr!20720 a!3170) i!1163 k0!2044) (size!21141 a!3170)))))

(declare-fun b!796072 () Bool)

(declare-fun res!540729 () Bool)

(assert (=> b!796072 (=> (not res!540729) (not e!441720))))

(declare-fun arrayContainsKey!0 (array!43279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796072 (= res!540729 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796073 () Bool)

(declare-fun res!540730 () Bool)

(assert (=> b!796073 (=> (not res!540730) (not e!441720))))

(assert (=> b!796073 (= res!540730 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68472 res!540728) b!796065))

(assert (= (and b!796065 res!540724) b!796063))

(assert (= (and b!796063 res!540722) b!796073))

(assert (= (and b!796073 res!540730) b!796072))

(assert (= (and b!796072 res!540729) b!796067))

(assert (= (and b!796067 res!540731) b!796069))

(assert (= (and b!796069 res!540723) b!796064))

(assert (= (and b!796064 res!540725) b!796070))

(assert (= (and b!796070 res!540732) b!796071))

(assert (= (and b!796071 res!540726) b!796068))

(assert (= (and b!796068 res!540727) b!796066))

(declare-fun m!736345 () Bool)

(assert (=> b!796064 m!736345))

(declare-fun m!736347 () Bool)

(assert (=> b!796072 m!736347))

(declare-fun m!736349 () Bool)

(assert (=> b!796069 m!736349))

(declare-fun m!736351 () Bool)

(assert (=> b!796071 m!736351))

(declare-fun m!736353 () Bool)

(assert (=> b!796071 m!736353))

(declare-fun m!736355 () Bool)

(assert (=> b!796071 m!736355))

(declare-fun m!736357 () Bool)

(assert (=> b!796071 m!736357))

(declare-fun m!736359 () Bool)

(assert (=> b!796063 m!736359))

(assert (=> b!796063 m!736359))

(declare-fun m!736361 () Bool)

(assert (=> b!796063 m!736361))

(declare-fun m!736363 () Bool)

(assert (=> b!796068 m!736363))

(assert (=> b!796068 m!736359))

(assert (=> b!796068 m!736359))

(declare-fun m!736365 () Bool)

(assert (=> b!796068 m!736365))

(assert (=> b!796068 m!736359))

(declare-fun m!736367 () Bool)

(assert (=> b!796068 m!736367))

(declare-fun m!736369 () Bool)

(assert (=> start!68472 m!736369))

(declare-fun m!736371 () Bool)

(assert (=> start!68472 m!736371))

(declare-fun m!736373 () Bool)

(assert (=> b!796073 m!736373))

(declare-fun m!736375 () Bool)

(assert (=> b!796067 m!736375))

(declare-fun m!736377 () Bool)

(assert (=> b!796070 m!736377))

(declare-fun m!736379 () Bool)

(assert (=> b!796070 m!736379))

(check-sat (not b!796071) (not b!796067) (not start!68472) (not b!796072) (not b!796064) (not b!796073) (not b!796063) (not b!796068) (not b!796069))
(check-sat)
