; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69026 () Bool)

(assert start!69026)

(declare-fun b!803753 () Bool)

(declare-fun e!445491 () Bool)

(declare-fun e!445490 () Bool)

(assert (=> b!803753 (= e!445491 e!445490)))

(declare-fun res!547732 () Bool)

(assert (=> b!803753 (=> (not res!547732) (not e!445490))))

(declare-datatypes ((SeekEntryResult!8446 0))(
  ( (MissingZero!8446 (index!36152 (_ BitVec 32))) (Found!8446 (index!36153 (_ BitVec 32))) (Intermediate!8446 (undefined!9258 Bool) (index!36154 (_ BitVec 32)) (x!67162 (_ BitVec 32))) (Undefined!8446) (MissingVacant!8446 (index!36155 (_ BitVec 32))) )
))
(declare-fun lt!359519 () SeekEntryResult!8446)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803753 (= res!547732 (or (= lt!359519 (MissingZero!8446 i!1163)) (= lt!359519 (MissingVacant!8446 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43648 0))(
  ( (array!43649 (arr!20899 (Array (_ BitVec 32) (_ BitVec 64))) (size!21319 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43648)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43648 (_ BitVec 32)) SeekEntryResult!8446)

(assert (=> b!803753 (= lt!359519 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803754 () Bool)

(declare-fun res!547726 () Bool)

(assert (=> b!803754 (=> (not res!547726) (not e!445490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43648 (_ BitVec 32)) Bool)

(assert (=> b!803754 (= res!547726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803755 () Bool)

(declare-fun e!445492 () Bool)

(declare-fun e!445488 () Bool)

(assert (=> b!803755 (= e!445492 e!445488)))

(declare-fun res!547734 () Bool)

(assert (=> b!803755 (=> (not res!547734) (not e!445488))))

(declare-fun lt!359521 () SeekEntryResult!8446)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359524 () SeekEntryResult!8446)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803755 (= res!547734 (and (= lt!359524 lt!359521) (= lt!359521 (Found!8446 j!153)) (not (= (select (arr!20899 a!3170) index!1236) (select (arr!20899 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43648 (_ BitVec 32)) SeekEntryResult!8446)

(assert (=> b!803755 (= lt!359521 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20899 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803755 (= lt!359524 (seekEntryOrOpen!0 (select (arr!20899 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803756 () Bool)

(declare-fun res!547729 () Bool)

(assert (=> b!803756 (=> (not res!547729) (not e!445490))))

(declare-datatypes ((List!14769 0))(
  ( (Nil!14766) (Cons!14765 (h!15900 (_ BitVec 64)) (t!21076 List!14769)) )
))
(declare-fun arrayNoDuplicates!0 (array!43648 (_ BitVec 32) List!14769) Bool)

(assert (=> b!803756 (= res!547729 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14766))))

(declare-fun b!803757 () Bool)

(assert (=> b!803757 (= e!445488 (not true))))

(declare-fun lt!359525 () array!43648)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359522 () (_ BitVec 32))

(declare-fun lt!359523 () (_ BitVec 64))

(assert (=> b!803757 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359522 vacantAfter!23 lt!359523 lt!359525 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359522 vacantBefore!23 (select (arr!20899 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27517 0))(
  ( (Unit!27518) )
))
(declare-fun lt!359520 () Unit!27517)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43648 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27517)

(assert (=> b!803757 (= lt!359520 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359522 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803757 (= lt!359522 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803758 () Bool)

(declare-fun res!547727 () Bool)

(assert (=> b!803758 (=> (not res!547727) (not e!445490))))

(assert (=> b!803758 (= res!547727 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21319 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20899 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21319 a!3170)) (= (select (arr!20899 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803759 () Bool)

(assert (=> b!803759 (= e!445490 e!445492)))

(declare-fun res!547730 () Bool)

(assert (=> b!803759 (=> (not res!547730) (not e!445492))))

(assert (=> b!803759 (= res!547730 (= (seekEntryOrOpen!0 lt!359523 lt!359525 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359523 lt!359525 mask!3266)))))

(assert (=> b!803759 (= lt!359523 (select (store (arr!20899 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803759 (= lt!359525 (array!43649 (store (arr!20899 a!3170) i!1163 k0!2044) (size!21319 a!3170)))))

(declare-fun b!803760 () Bool)

(declare-fun res!547728 () Bool)

(assert (=> b!803760 (=> (not res!547728) (not e!445491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803760 (= res!547728 (validKeyInArray!0 (select (arr!20899 a!3170) j!153)))))

(declare-fun res!547724 () Bool)

(assert (=> start!69026 (=> (not res!547724) (not e!445491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69026 (= res!547724 (validMask!0 mask!3266))))

(assert (=> start!69026 e!445491))

(assert (=> start!69026 true))

(declare-fun array_inv!16758 (array!43648) Bool)

(assert (=> start!69026 (array_inv!16758 a!3170)))

(declare-fun b!803761 () Bool)

(declare-fun res!547725 () Bool)

(assert (=> b!803761 (=> (not res!547725) (not e!445491))))

(declare-fun arrayContainsKey!0 (array!43648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803761 (= res!547725 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803762 () Bool)

(declare-fun res!547733 () Bool)

(assert (=> b!803762 (=> (not res!547733) (not e!445491))))

(assert (=> b!803762 (= res!547733 (and (= (size!21319 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21319 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21319 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803763 () Bool)

(declare-fun res!547731 () Bool)

(assert (=> b!803763 (=> (not res!547731) (not e!445491))))

(assert (=> b!803763 (= res!547731 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69026 res!547724) b!803762))

(assert (= (and b!803762 res!547733) b!803760))

(assert (= (and b!803760 res!547728) b!803763))

(assert (= (and b!803763 res!547731) b!803761))

(assert (= (and b!803761 res!547725) b!803753))

(assert (= (and b!803753 res!547732) b!803754))

(assert (= (and b!803754 res!547726) b!803756))

(assert (= (and b!803756 res!547729) b!803758))

(assert (= (and b!803758 res!547727) b!803759))

(assert (= (and b!803759 res!547730) b!803755))

(assert (= (and b!803755 res!547734) b!803757))

(declare-fun m!745693 () Bool)

(assert (=> b!803755 m!745693))

(declare-fun m!745695 () Bool)

(assert (=> b!803755 m!745695))

(assert (=> b!803755 m!745695))

(declare-fun m!745697 () Bool)

(assert (=> b!803755 m!745697))

(assert (=> b!803755 m!745695))

(declare-fun m!745699 () Bool)

(assert (=> b!803755 m!745699))

(declare-fun m!745701 () Bool)

(assert (=> b!803754 m!745701))

(declare-fun m!745703 () Bool)

(assert (=> b!803753 m!745703))

(declare-fun m!745705 () Bool)

(assert (=> start!69026 m!745705))

(declare-fun m!745707 () Bool)

(assert (=> start!69026 m!745707))

(declare-fun m!745709 () Bool)

(assert (=> b!803759 m!745709))

(declare-fun m!745711 () Bool)

(assert (=> b!803759 m!745711))

(declare-fun m!745713 () Bool)

(assert (=> b!803759 m!745713))

(declare-fun m!745715 () Bool)

(assert (=> b!803759 m!745715))

(assert (=> b!803757 m!745695))

(declare-fun m!745717 () Bool)

(assert (=> b!803757 m!745717))

(declare-fun m!745719 () Bool)

(assert (=> b!803757 m!745719))

(declare-fun m!745721 () Bool)

(assert (=> b!803757 m!745721))

(assert (=> b!803757 m!745695))

(declare-fun m!745723 () Bool)

(assert (=> b!803757 m!745723))

(declare-fun m!745725 () Bool)

(assert (=> b!803761 m!745725))

(declare-fun m!745727 () Bool)

(assert (=> b!803758 m!745727))

(declare-fun m!745729 () Bool)

(assert (=> b!803758 m!745729))

(declare-fun m!745731 () Bool)

(assert (=> b!803763 m!745731))

(assert (=> b!803760 m!745695))

(assert (=> b!803760 m!745695))

(declare-fun m!745733 () Bool)

(assert (=> b!803760 m!745733))

(declare-fun m!745735 () Bool)

(assert (=> b!803756 m!745735))

(check-sat (not start!69026) (not b!803755) (not b!803763) (not b!803757) (not b!803760) (not b!803754) (not b!803761) (not b!803756) (not b!803759) (not b!803753))
(check-sat)
