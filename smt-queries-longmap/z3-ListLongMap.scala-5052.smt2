; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68824 () Bool)

(assert start!68824)

(declare-fun b!802277 () Bool)

(declare-fun res!546798 () Bool)

(declare-fun e!444635 () Bool)

(assert (=> b!802277 (=> (not res!546798) (not e!444635))))

(declare-datatypes ((array!43614 0))(
  ( (array!43615 (arr!20887 (Array (_ BitVec 32) (_ BitVec 64))) (size!21308 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43614)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802277 (= res!546798 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802278 () Bool)

(declare-fun e!444634 () Bool)

(assert (=> b!802278 (= e!444635 e!444634)))

(declare-fun res!546806 () Bool)

(assert (=> b!802278 (=> (not res!546806) (not e!444634))))

(declare-datatypes ((SeekEntryResult!8478 0))(
  ( (MissingZero!8478 (index!36280 (_ BitVec 32))) (Found!8478 (index!36281 (_ BitVec 32))) (Intermediate!8478 (undefined!9290 Bool) (index!36282 (_ BitVec 32)) (x!67132 (_ BitVec 32))) (Undefined!8478) (MissingVacant!8478 (index!36283 (_ BitVec 32))) )
))
(declare-fun lt!358751 () SeekEntryResult!8478)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802278 (= res!546806 (or (= lt!358751 (MissingZero!8478 i!1163)) (= lt!358751 (MissingVacant!8478 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43614 (_ BitVec 32)) SeekEntryResult!8478)

(assert (=> b!802278 (= lt!358751 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802279 () Bool)

(declare-fun res!546797 () Bool)

(assert (=> b!802279 (=> (not res!546797) (not e!444634))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802279 (= res!546797 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21308 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20887 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21308 a!3170)) (= (select (arr!20887 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802280 () Bool)

(declare-fun e!444637 () Bool)

(assert (=> b!802280 (= e!444634 e!444637)))

(declare-fun res!546801 () Bool)

(assert (=> b!802280 (=> (not res!546801) (not e!444637))))

(declare-fun lt!358757 () (_ BitVec 64))

(declare-fun lt!358752 () array!43614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43614 (_ BitVec 32)) SeekEntryResult!8478)

(assert (=> b!802280 (= res!546801 (= (seekEntryOrOpen!0 lt!358757 lt!358752 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358757 lt!358752 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802280 (= lt!358757 (select (store (arr!20887 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802280 (= lt!358752 (array!43615 (store (arr!20887 a!3170) i!1163 k0!2044) (size!21308 a!3170)))))

(declare-fun res!546802 () Bool)

(assert (=> start!68824 (=> (not res!546802) (not e!444635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68824 (= res!546802 (validMask!0 mask!3266))))

(assert (=> start!68824 e!444635))

(assert (=> start!68824 true))

(declare-fun array_inv!16683 (array!43614) Bool)

(assert (=> start!68824 (array_inv!16683 a!3170)))

(declare-fun b!802281 () Bool)

(declare-fun e!444636 () Bool)

(assert (=> b!802281 (= e!444636 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20887 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358754 () (_ BitVec 32))

(assert (=> b!802281 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358754 vacantAfter!23 lt!358757 lt!358752 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358754 vacantBefore!23 (select (arr!20887 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27496 0))(
  ( (Unit!27497) )
))
(declare-fun lt!358753 () Unit!27496)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43614 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27496)

(assert (=> b!802281 (= lt!358753 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358754 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802281 (= lt!358754 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802282 () Bool)

(declare-fun res!546804 () Bool)

(assert (=> b!802282 (=> (not res!546804) (not e!444635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802282 (= res!546804 (validKeyInArray!0 k0!2044))))

(declare-fun b!802283 () Bool)

(declare-fun res!546796 () Bool)

(assert (=> b!802283 (=> (not res!546796) (not e!444635))))

(assert (=> b!802283 (= res!546796 (and (= (size!21308 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21308 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21308 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802284 () Bool)

(declare-fun res!546799 () Bool)

(assert (=> b!802284 (=> (not res!546799) (not e!444635))))

(assert (=> b!802284 (= res!546799 (validKeyInArray!0 (select (arr!20887 a!3170) j!153)))))

(declare-fun b!802285 () Bool)

(declare-fun res!546800 () Bool)

(assert (=> b!802285 (=> (not res!546800) (not e!444634))))

(declare-datatypes ((List!14850 0))(
  ( (Nil!14847) (Cons!14846 (h!15975 (_ BitVec 64)) (t!21165 List!14850)) )
))
(declare-fun arrayNoDuplicates!0 (array!43614 (_ BitVec 32) List!14850) Bool)

(assert (=> b!802285 (= res!546800 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14847))))

(declare-fun b!802286 () Bool)

(assert (=> b!802286 (= e!444637 e!444636)))

(declare-fun res!546805 () Bool)

(assert (=> b!802286 (=> (not res!546805) (not e!444636))))

(declare-fun lt!358755 () SeekEntryResult!8478)

(declare-fun lt!358756 () SeekEntryResult!8478)

(assert (=> b!802286 (= res!546805 (and (= lt!358756 lt!358755) (= lt!358755 (Found!8478 j!153)) (not (= (select (arr!20887 a!3170) index!1236) (select (arr!20887 a!3170) j!153)))))))

(assert (=> b!802286 (= lt!358755 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20887 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802286 (= lt!358756 (seekEntryOrOpen!0 (select (arr!20887 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802287 () Bool)

(declare-fun res!546803 () Bool)

(assert (=> b!802287 (=> (not res!546803) (not e!444634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43614 (_ BitVec 32)) Bool)

(assert (=> b!802287 (= res!546803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68824 res!546802) b!802283))

(assert (= (and b!802283 res!546796) b!802284))

(assert (= (and b!802284 res!546799) b!802282))

(assert (= (and b!802282 res!546804) b!802277))

(assert (= (and b!802277 res!546798) b!802278))

(assert (= (and b!802278 res!546806) b!802287))

(assert (= (and b!802287 res!546803) b!802285))

(assert (= (and b!802285 res!546800) b!802279))

(assert (= (and b!802279 res!546797) b!802280))

(assert (= (and b!802280 res!546801) b!802286))

(assert (= (and b!802286 res!546805) b!802281))

(declare-fun m!743673 () Bool)

(assert (=> b!802285 m!743673))

(declare-fun m!743675 () Bool)

(assert (=> b!802278 m!743675))

(declare-fun m!743677 () Bool)

(assert (=> b!802281 m!743677))

(declare-fun m!743679 () Bool)

(assert (=> b!802281 m!743679))

(declare-fun m!743681 () Bool)

(assert (=> b!802281 m!743681))

(assert (=> b!802281 m!743677))

(declare-fun m!743683 () Bool)

(assert (=> b!802281 m!743683))

(declare-fun m!743685 () Bool)

(assert (=> b!802281 m!743685))

(declare-fun m!743687 () Bool)

(assert (=> b!802281 m!743687))

(declare-fun m!743689 () Bool)

(assert (=> b!802281 m!743689))

(assert (=> b!802284 m!743677))

(assert (=> b!802284 m!743677))

(declare-fun m!743691 () Bool)

(assert (=> b!802284 m!743691))

(declare-fun m!743693 () Bool)

(assert (=> b!802279 m!743693))

(declare-fun m!743695 () Bool)

(assert (=> b!802279 m!743695))

(declare-fun m!743697 () Bool)

(assert (=> b!802286 m!743697))

(assert (=> b!802286 m!743677))

(assert (=> b!802286 m!743677))

(declare-fun m!743699 () Bool)

(assert (=> b!802286 m!743699))

(assert (=> b!802286 m!743677))

(declare-fun m!743701 () Bool)

(assert (=> b!802286 m!743701))

(declare-fun m!743703 () Bool)

(assert (=> b!802280 m!743703))

(declare-fun m!743705 () Bool)

(assert (=> b!802280 m!743705))

(assert (=> b!802280 m!743687))

(declare-fun m!743707 () Bool)

(assert (=> b!802280 m!743707))

(declare-fun m!743709 () Bool)

(assert (=> b!802282 m!743709))

(declare-fun m!743711 () Bool)

(assert (=> start!68824 m!743711))

(declare-fun m!743713 () Bool)

(assert (=> start!68824 m!743713))

(declare-fun m!743715 () Bool)

(assert (=> b!802287 m!743715))

(declare-fun m!743717 () Bool)

(assert (=> b!802277 m!743717))

(check-sat (not b!802285) (not b!802286) (not b!802287) (not b!802284) (not b!802277) (not b!802282) (not b!802278) (not start!68824) (not b!802281) (not b!802280))
(check-sat)
