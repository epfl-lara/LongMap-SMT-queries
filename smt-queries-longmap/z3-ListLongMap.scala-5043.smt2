; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68936 () Bool)

(assert start!68936)

(declare-fun res!546173 () Bool)

(declare-fun e!444762 () Bool)

(assert (=> start!68936 (=> (not res!546173) (not e!444762))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68936 (= res!546173 (validMask!0 mask!3266))))

(assert (=> start!68936 e!444762))

(assert (=> start!68936 true))

(declare-datatypes ((array!43558 0))(
  ( (array!43559 (arr!20854 (Array (_ BitVec 32) (_ BitVec 64))) (size!21274 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43558)

(declare-fun array_inv!16713 (array!43558) Bool)

(assert (=> start!68936 (array_inv!16713 a!3170)))

(declare-fun b!802191 () Bool)

(declare-fun e!444761 () Bool)

(declare-fun e!444764 () Bool)

(assert (=> b!802191 (= e!444761 e!444764)))

(declare-fun res!546168 () Bool)

(assert (=> b!802191 (=> (not res!546168) (not e!444764))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358495 () (_ BitVec 32))

(assert (=> b!802191 (= res!546168 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358495 #b00000000000000000000000000000000) (bvslt lt!358495 (size!21274 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802191 (= lt!358495 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802192 () Bool)

(assert (=> b!802192 (= e!444764 false)))

(declare-datatypes ((SeekEntryResult!8401 0))(
  ( (MissingZero!8401 (index!35972 (_ BitVec 32))) (Found!8401 (index!35973 (_ BitVec 32))) (Intermediate!8401 (undefined!9213 Bool) (index!35974 (_ BitVec 32)) (x!66997 (_ BitVec 32))) (Undefined!8401) (MissingVacant!8401 (index!35975 (_ BitVec 32))) )
))
(declare-fun lt!358500 () SeekEntryResult!8401)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43558 (_ BitVec 32)) SeekEntryResult!8401)

(assert (=> b!802192 (= lt!358500 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358495 vacantBefore!23 (select (arr!20854 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802193 () Bool)

(declare-fun e!444765 () Bool)

(declare-fun e!444763 () Bool)

(assert (=> b!802193 (= e!444765 e!444763)))

(declare-fun res!546172 () Bool)

(assert (=> b!802193 (=> (not res!546172) (not e!444763))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358497 () SeekEntryResult!8401)

(declare-fun lt!358502 () array!43558)

(declare-fun lt!358499 () (_ BitVec 64))

(assert (=> b!802193 (= res!546172 (= lt!358497 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358499 lt!358502 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43558 (_ BitVec 32)) SeekEntryResult!8401)

(assert (=> b!802193 (= lt!358497 (seekEntryOrOpen!0 lt!358499 lt!358502 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802193 (= lt!358499 (select (store (arr!20854 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802193 (= lt!358502 (array!43559 (store (arr!20854 a!3170) i!1163 k0!2044) (size!21274 a!3170)))))

(declare-fun b!802194 () Bool)

(declare-fun res!546171 () Bool)

(assert (=> b!802194 (=> (not res!546171) (not e!444762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802194 (= res!546171 (validKeyInArray!0 k0!2044))))

(declare-fun b!802195 () Bool)

(declare-fun res!546164 () Bool)

(assert (=> b!802195 (=> (not res!546164) (not e!444764))))

(assert (=> b!802195 (= res!546164 (= lt!358497 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358495 vacantAfter!23 lt!358499 lt!358502 mask!3266)))))

(declare-fun b!802196 () Bool)

(declare-fun res!546170 () Bool)

(assert (=> b!802196 (=> (not res!546170) (not e!444762))))

(assert (=> b!802196 (= res!546170 (and (= (size!21274 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21274 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21274 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802197 () Bool)

(declare-fun res!546165 () Bool)

(assert (=> b!802197 (=> (not res!546165) (not e!444762))))

(declare-fun arrayContainsKey!0 (array!43558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802197 (= res!546165 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802198 () Bool)

(assert (=> b!802198 (= e!444763 e!444761)))

(declare-fun res!546167 () Bool)

(assert (=> b!802198 (=> (not res!546167) (not e!444761))))

(declare-fun lt!358496 () SeekEntryResult!8401)

(declare-fun lt!358501 () SeekEntryResult!8401)

(assert (=> b!802198 (= res!546167 (and (= lt!358496 lt!358501) (= lt!358501 (Found!8401 j!153)) (not (= (select (arr!20854 a!3170) index!1236) (select (arr!20854 a!3170) j!153)))))))

(assert (=> b!802198 (= lt!358501 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20854 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802198 (= lt!358496 (seekEntryOrOpen!0 (select (arr!20854 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802199 () Bool)

(declare-fun res!546166 () Bool)

(assert (=> b!802199 (=> (not res!546166) (not e!444765))))

(declare-datatypes ((List!14724 0))(
  ( (Nil!14721) (Cons!14720 (h!15855 (_ BitVec 64)) (t!21031 List!14724)) )
))
(declare-fun arrayNoDuplicates!0 (array!43558 (_ BitVec 32) List!14724) Bool)

(assert (=> b!802199 (= res!546166 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14721))))

(declare-fun b!802200 () Bool)

(assert (=> b!802200 (= e!444762 e!444765)))

(declare-fun res!546163 () Bool)

(assert (=> b!802200 (=> (not res!546163) (not e!444765))))

(declare-fun lt!358498 () SeekEntryResult!8401)

(assert (=> b!802200 (= res!546163 (or (= lt!358498 (MissingZero!8401 i!1163)) (= lt!358498 (MissingVacant!8401 i!1163))))))

(assert (=> b!802200 (= lt!358498 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802201 () Bool)

(declare-fun res!546169 () Bool)

(assert (=> b!802201 (=> (not res!546169) (not e!444765))))

(assert (=> b!802201 (= res!546169 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21274 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20854 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21274 a!3170)) (= (select (arr!20854 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802202 () Bool)

(declare-fun res!546162 () Bool)

(assert (=> b!802202 (=> (not res!546162) (not e!444765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43558 (_ BitVec 32)) Bool)

(assert (=> b!802202 (= res!546162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802203 () Bool)

(declare-fun res!546174 () Bool)

(assert (=> b!802203 (=> (not res!546174) (not e!444762))))

(assert (=> b!802203 (= res!546174 (validKeyInArray!0 (select (arr!20854 a!3170) j!153)))))

(assert (= (and start!68936 res!546173) b!802196))

(assert (= (and b!802196 res!546170) b!802203))

(assert (= (and b!802203 res!546174) b!802194))

(assert (= (and b!802194 res!546171) b!802197))

(assert (= (and b!802197 res!546165) b!802200))

(assert (= (and b!802200 res!546163) b!802202))

(assert (= (and b!802202 res!546162) b!802199))

(assert (= (and b!802199 res!546166) b!802201))

(assert (= (and b!802201 res!546169) b!802193))

(assert (= (and b!802193 res!546172) b!802198))

(assert (= (and b!802198 res!546167) b!802191))

(assert (= (and b!802191 res!546168) b!802195))

(assert (= (and b!802195 res!546164) b!802192))

(declare-fun m!743713 () Bool)

(assert (=> b!802194 m!743713))

(declare-fun m!743715 () Bool)

(assert (=> b!802202 m!743715))

(declare-fun m!743717 () Bool)

(assert (=> b!802193 m!743717))

(declare-fun m!743719 () Bool)

(assert (=> b!802193 m!743719))

(declare-fun m!743721 () Bool)

(assert (=> b!802193 m!743721))

(declare-fun m!743723 () Bool)

(assert (=> b!802193 m!743723))

(declare-fun m!743725 () Bool)

(assert (=> b!802197 m!743725))

(declare-fun m!743727 () Bool)

(assert (=> b!802201 m!743727))

(declare-fun m!743729 () Bool)

(assert (=> b!802201 m!743729))

(declare-fun m!743731 () Bool)

(assert (=> start!68936 m!743731))

(declare-fun m!743733 () Bool)

(assert (=> start!68936 m!743733))

(declare-fun m!743735 () Bool)

(assert (=> b!802203 m!743735))

(assert (=> b!802203 m!743735))

(declare-fun m!743737 () Bool)

(assert (=> b!802203 m!743737))

(declare-fun m!743739 () Bool)

(assert (=> b!802199 m!743739))

(declare-fun m!743741 () Bool)

(assert (=> b!802195 m!743741))

(declare-fun m!743743 () Bool)

(assert (=> b!802200 m!743743))

(declare-fun m!743745 () Bool)

(assert (=> b!802198 m!743745))

(assert (=> b!802198 m!743735))

(assert (=> b!802198 m!743735))

(declare-fun m!743747 () Bool)

(assert (=> b!802198 m!743747))

(assert (=> b!802198 m!743735))

(declare-fun m!743749 () Bool)

(assert (=> b!802198 m!743749))

(declare-fun m!743751 () Bool)

(assert (=> b!802191 m!743751))

(assert (=> b!802192 m!743735))

(assert (=> b!802192 m!743735))

(declare-fun m!743753 () Bool)

(assert (=> b!802192 m!743753))

(check-sat (not b!802200) (not b!802203) (not b!802192) (not b!802199) (not b!802194) (not b!802202) (not b!802197) (not b!802193) (not b!802198) (not start!68936) (not b!802191) (not b!802195))
(check-sat)
