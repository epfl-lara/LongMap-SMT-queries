; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68838 () Bool)

(assert start!68838)

(declare-fun res!547281 () Bool)

(declare-fun e!444764 () Bool)

(assert (=> start!68838 (=> (not res!547281) (not e!444764))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68838 (= res!547281 (validMask!0 mask!3266))))

(assert (=> start!68838 e!444764))

(assert (=> start!68838 true))

(declare-datatypes ((array!43645 0))(
  ( (array!43646 (arr!20903 (Array (_ BitVec 32) (_ BitVec 64))) (size!21324 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43645)

(declare-fun array_inv!16786 (array!43645) Bool)

(assert (=> start!68838 (array_inv!16786 a!3170)))

(declare-fun b!802615 () Bool)

(declare-fun res!547278 () Bool)

(assert (=> b!802615 (=> (not res!547278) (not e!444764))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802615 (= res!547278 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802616 () Bool)

(declare-fun e!444762 () Bool)

(assert (=> b!802616 (= e!444762 (not true))))

(declare-fun lt!358923 () array!43645)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358924 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358927 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8491 0))(
  ( (MissingZero!8491 (index!36332 (_ BitVec 32))) (Found!8491 (index!36333 (_ BitVec 32))) (Intermediate!8491 (undefined!9303 Bool) (index!36334 (_ BitVec 32)) (x!67188 (_ BitVec 32))) (Undefined!8491) (MissingVacant!8491 (index!36335 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43645 (_ BitVec 32)) SeekEntryResult!8491)

(assert (=> b!802616 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358927 vacantAfter!23 lt!358924 lt!358923 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358927 vacantBefore!23 (select (arr!20903 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27496 0))(
  ( (Unit!27497) )
))
(declare-fun lt!358926 () Unit!27496)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43645 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27496)

(assert (=> b!802616 (= lt!358926 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358927 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802616 (= lt!358927 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802617 () Bool)

(declare-fun res!547277 () Bool)

(assert (=> b!802617 (=> (not res!547277) (not e!444764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802617 (= res!547277 (validKeyInArray!0 (select (arr!20903 a!3170) j!153)))))

(declare-fun b!802618 () Bool)

(declare-fun res!547284 () Bool)

(assert (=> b!802618 (=> (not res!547284) (not e!444764))))

(assert (=> b!802618 (= res!547284 (and (= (size!21324 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21324 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21324 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802619 () Bool)

(declare-fun e!444766 () Bool)

(declare-fun e!444763 () Bool)

(assert (=> b!802619 (= e!444766 e!444763)))

(declare-fun res!547282 () Bool)

(assert (=> b!802619 (=> (not res!547282) (not e!444763))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43645 (_ BitVec 32)) SeekEntryResult!8491)

(assert (=> b!802619 (= res!547282 (= (seekEntryOrOpen!0 lt!358924 lt!358923 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358924 lt!358923 mask!3266)))))

(assert (=> b!802619 (= lt!358924 (select (store (arr!20903 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802619 (= lt!358923 (array!43646 (store (arr!20903 a!3170) i!1163 k0!2044) (size!21324 a!3170)))))

(declare-fun b!802620 () Bool)

(declare-fun res!547275 () Bool)

(assert (=> b!802620 (=> (not res!547275) (not e!444766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43645 (_ BitVec 32)) Bool)

(assert (=> b!802620 (= res!547275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802621 () Bool)

(assert (=> b!802621 (= e!444763 e!444762)))

(declare-fun res!547280 () Bool)

(assert (=> b!802621 (=> (not res!547280) (not e!444762))))

(declare-fun lt!358922 () SeekEntryResult!8491)

(declare-fun lt!358925 () SeekEntryResult!8491)

(assert (=> b!802621 (= res!547280 (and (= lt!358922 lt!358925) (= lt!358925 (Found!8491 j!153)) (not (= (select (arr!20903 a!3170) index!1236) (select (arr!20903 a!3170) j!153)))))))

(assert (=> b!802621 (= lt!358925 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20903 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802621 (= lt!358922 (seekEntryOrOpen!0 (select (arr!20903 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802622 () Bool)

(declare-fun res!547274 () Bool)

(assert (=> b!802622 (=> (not res!547274) (not e!444766))))

(assert (=> b!802622 (= res!547274 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21324 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20903 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21324 a!3170)) (= (select (arr!20903 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802623 () Bool)

(declare-fun res!547283 () Bool)

(assert (=> b!802623 (=> (not res!547283) (not e!444764))))

(assert (=> b!802623 (= res!547283 (validKeyInArray!0 k0!2044))))

(declare-fun b!802624 () Bool)

(assert (=> b!802624 (= e!444764 e!444766)))

(declare-fun res!547279 () Bool)

(assert (=> b!802624 (=> (not res!547279) (not e!444766))))

(declare-fun lt!358928 () SeekEntryResult!8491)

(assert (=> b!802624 (= res!547279 (or (= lt!358928 (MissingZero!8491 i!1163)) (= lt!358928 (MissingVacant!8491 i!1163))))))

(assert (=> b!802624 (= lt!358928 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802625 () Bool)

(declare-fun res!547276 () Bool)

(assert (=> b!802625 (=> (not res!547276) (not e!444766))))

(declare-datatypes ((List!14905 0))(
  ( (Nil!14902) (Cons!14901 (h!16030 (_ BitVec 64)) (t!21211 List!14905)) )
))
(declare-fun arrayNoDuplicates!0 (array!43645 (_ BitVec 32) List!14905) Bool)

(assert (=> b!802625 (= res!547276 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14902))))

(assert (= (and start!68838 res!547281) b!802618))

(assert (= (and b!802618 res!547284) b!802617))

(assert (= (and b!802617 res!547277) b!802623))

(assert (= (and b!802623 res!547283) b!802615))

(assert (= (and b!802615 res!547278) b!802624))

(assert (= (and b!802624 res!547279) b!802620))

(assert (= (and b!802620 res!547275) b!802625))

(assert (= (and b!802625 res!547276) b!802622))

(assert (= (and b!802622 res!547274) b!802619))

(assert (= (and b!802619 res!547282) b!802621))

(assert (= (and b!802621 res!547280) b!802616))

(declare-fun m!743695 () Bool)

(assert (=> b!802620 m!743695))

(declare-fun m!743697 () Bool)

(assert (=> b!802615 m!743697))

(declare-fun m!743699 () Bool)

(assert (=> b!802621 m!743699))

(declare-fun m!743701 () Bool)

(assert (=> b!802621 m!743701))

(assert (=> b!802621 m!743701))

(declare-fun m!743703 () Bool)

(assert (=> b!802621 m!743703))

(assert (=> b!802621 m!743701))

(declare-fun m!743705 () Bool)

(assert (=> b!802621 m!743705))

(declare-fun m!743707 () Bool)

(assert (=> start!68838 m!743707))

(declare-fun m!743709 () Bool)

(assert (=> start!68838 m!743709))

(assert (=> b!802617 m!743701))

(assert (=> b!802617 m!743701))

(declare-fun m!743711 () Bool)

(assert (=> b!802617 m!743711))

(declare-fun m!743713 () Bool)

(assert (=> b!802625 m!743713))

(declare-fun m!743715 () Bool)

(assert (=> b!802622 m!743715))

(declare-fun m!743717 () Bool)

(assert (=> b!802622 m!743717))

(declare-fun m!743719 () Bool)

(assert (=> b!802616 m!743719))

(declare-fun m!743721 () Bool)

(assert (=> b!802616 m!743721))

(declare-fun m!743723 () Bool)

(assert (=> b!802616 m!743723))

(assert (=> b!802616 m!743701))

(declare-fun m!743725 () Bool)

(assert (=> b!802616 m!743725))

(assert (=> b!802616 m!743701))

(declare-fun m!743727 () Bool)

(assert (=> b!802623 m!743727))

(declare-fun m!743729 () Bool)

(assert (=> b!802624 m!743729))

(declare-fun m!743731 () Bool)

(assert (=> b!802619 m!743731))

(declare-fun m!743733 () Bool)

(assert (=> b!802619 m!743733))

(declare-fun m!743735 () Bool)

(assert (=> b!802619 m!743735))

(declare-fun m!743737 () Bool)

(assert (=> b!802619 m!743737))

(check-sat (not b!802625) (not b!802621) (not b!802617) (not b!802619) (not b!802624) (not start!68838) (not b!802623) (not b!802615) (not b!802616) (not b!802620))
(check-sat)
