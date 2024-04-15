; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68628 () Bool)

(assert start!68628)

(declare-fun b!798713 () Bool)

(declare-fun res!543377 () Bool)

(declare-fun e!442959 () Bool)

(assert (=> b!798713 (=> (not res!543377) (not e!442959))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43435 0))(
  ( (array!43436 (arr!20798 (Array (_ BitVec 32) (_ BitVec 64))) (size!21219 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43435)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798713 (= res!543377 (and (= (size!21219 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21219 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21219 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798714 () Bool)

(declare-fun res!543372 () Bool)

(assert (=> b!798714 (=> (not res!543372) (not e!442959))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798714 (= res!543372 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798715 () Bool)

(declare-fun e!442955 () Bool)

(declare-fun e!442960 () Bool)

(assert (=> b!798715 (= e!442955 e!442960)))

(declare-fun res!543374 () Bool)

(assert (=> b!798715 (=> (not res!543374) (not e!442960))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356464 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8386 0))(
  ( (MissingZero!8386 (index!35912 (_ BitVec 32))) (Found!8386 (index!35913 (_ BitVec 32))) (Intermediate!8386 (undefined!9198 Bool) (index!35914 (_ BitVec 32)) (x!66803 (_ BitVec 32))) (Undefined!8386) (MissingVacant!8386 (index!35915 (_ BitVec 32))) )
))
(declare-fun lt!356462 () SeekEntryResult!8386)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356459 () array!43435)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43435 (_ BitVec 32)) SeekEntryResult!8386)

(assert (=> b!798715 (= res!543374 (= lt!356462 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356464 lt!356459 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43435 (_ BitVec 32)) SeekEntryResult!8386)

(assert (=> b!798715 (= lt!356462 (seekEntryOrOpen!0 lt!356464 lt!356459 mask!3266))))

(assert (=> b!798715 (= lt!356464 (select (store (arr!20798 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798715 (= lt!356459 (array!43436 (store (arr!20798 a!3170) i!1163 k0!2044) (size!21219 a!3170)))))

(declare-fun res!543375 () Bool)

(assert (=> start!68628 (=> (not res!543375) (not e!442959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68628 (= res!543375 (validMask!0 mask!3266))))

(assert (=> start!68628 e!442959))

(assert (=> start!68628 true))

(declare-fun array_inv!16681 (array!43435) Bool)

(assert (=> start!68628 (array_inv!16681 a!3170)))

(declare-fun b!798716 () Bool)

(declare-fun res!543376 () Bool)

(assert (=> b!798716 (=> (not res!543376) (not e!442955))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798716 (= res!543376 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21219 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20798 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21219 a!3170)) (= (select (arr!20798 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798717 () Bool)

(assert (=> b!798717 (= e!442959 e!442955)))

(declare-fun res!543382 () Bool)

(assert (=> b!798717 (=> (not res!543382) (not e!442955))))

(declare-fun lt!356465 () SeekEntryResult!8386)

(assert (=> b!798717 (= res!543382 (or (= lt!356465 (MissingZero!8386 i!1163)) (= lt!356465 (MissingVacant!8386 i!1163))))))

(assert (=> b!798717 (= lt!356465 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798718 () Bool)

(declare-fun res!543380 () Bool)

(declare-fun e!442958 () Bool)

(assert (=> b!798718 (=> (not res!543380) (not e!442958))))

(declare-fun lt!356463 () (_ BitVec 32))

(assert (=> b!798718 (= res!543380 (= lt!356462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356463 vacantAfter!23 lt!356464 lt!356459 mask!3266)))))

(declare-fun b!798719 () Bool)

(assert (=> b!798719 (= e!442958 false)))

(declare-fun lt!356458 () SeekEntryResult!8386)

(assert (=> b!798719 (= lt!356458 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356463 vacantBefore!23 (select (arr!20798 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798720 () Bool)

(declare-fun e!442957 () Bool)

(assert (=> b!798720 (= e!442960 e!442957)))

(declare-fun res!543379 () Bool)

(assert (=> b!798720 (=> (not res!543379) (not e!442957))))

(declare-fun lt!356461 () SeekEntryResult!8386)

(declare-fun lt!356460 () SeekEntryResult!8386)

(assert (=> b!798720 (= res!543379 (and (= lt!356460 lt!356461) (= lt!356461 (Found!8386 j!153)) (not (= (select (arr!20798 a!3170) index!1236) (select (arr!20798 a!3170) j!153)))))))

(assert (=> b!798720 (= lt!356461 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20798 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798720 (= lt!356460 (seekEntryOrOpen!0 (select (arr!20798 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798721 () Bool)

(declare-fun res!543381 () Bool)

(assert (=> b!798721 (=> (not res!543381) (not e!442955))))

(declare-datatypes ((List!14800 0))(
  ( (Nil!14797) (Cons!14796 (h!15925 (_ BitVec 64)) (t!21106 List!14800)) )
))
(declare-fun arrayNoDuplicates!0 (array!43435 (_ BitVec 32) List!14800) Bool)

(assert (=> b!798721 (= res!543381 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14797))))

(declare-fun b!798722 () Bool)

(declare-fun res!543378 () Bool)

(assert (=> b!798722 (=> (not res!543378) (not e!442959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798722 (= res!543378 (validKeyInArray!0 k0!2044))))

(declare-fun b!798723 () Bool)

(assert (=> b!798723 (= e!442957 e!442958)))

(declare-fun res!543384 () Bool)

(assert (=> b!798723 (=> (not res!543384) (not e!442958))))

(assert (=> b!798723 (= res!543384 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356463 #b00000000000000000000000000000000) (bvslt lt!356463 (size!21219 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798723 (= lt!356463 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798724 () Bool)

(declare-fun res!543383 () Bool)

(assert (=> b!798724 (=> (not res!543383) (not e!442959))))

(assert (=> b!798724 (= res!543383 (validKeyInArray!0 (select (arr!20798 a!3170) j!153)))))

(declare-fun b!798725 () Bool)

(declare-fun res!543373 () Bool)

(assert (=> b!798725 (=> (not res!543373) (not e!442955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43435 (_ BitVec 32)) Bool)

(assert (=> b!798725 (= res!543373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68628 res!543375) b!798713))

(assert (= (and b!798713 res!543377) b!798724))

(assert (= (and b!798724 res!543383) b!798722))

(assert (= (and b!798722 res!543378) b!798714))

(assert (= (and b!798714 res!543372) b!798717))

(assert (= (and b!798717 res!543382) b!798725))

(assert (= (and b!798725 res!543373) b!798721))

(assert (= (and b!798721 res!543381) b!798716))

(assert (= (and b!798716 res!543376) b!798715))

(assert (= (and b!798715 res!543374) b!798720))

(assert (= (and b!798720 res!543379) b!798723))

(assert (= (and b!798723 res!543384) b!798718))

(assert (= (and b!798718 res!543380) b!798719))

(declare-fun m!739195 () Bool)

(assert (=> b!798720 m!739195))

(declare-fun m!739197 () Bool)

(assert (=> b!798720 m!739197))

(assert (=> b!798720 m!739197))

(declare-fun m!739199 () Bool)

(assert (=> b!798720 m!739199))

(assert (=> b!798720 m!739197))

(declare-fun m!739201 () Bool)

(assert (=> b!798720 m!739201))

(declare-fun m!739203 () Bool)

(assert (=> b!798714 m!739203))

(declare-fun m!739205 () Bool)

(assert (=> b!798717 m!739205))

(declare-fun m!739207 () Bool)

(assert (=> b!798723 m!739207))

(declare-fun m!739209 () Bool)

(assert (=> b!798725 m!739209))

(declare-fun m!739211 () Bool)

(assert (=> b!798722 m!739211))

(declare-fun m!739213 () Bool)

(assert (=> b!798716 m!739213))

(declare-fun m!739215 () Bool)

(assert (=> b!798716 m!739215))

(declare-fun m!739217 () Bool)

(assert (=> b!798721 m!739217))

(declare-fun m!739219 () Bool)

(assert (=> b!798715 m!739219))

(declare-fun m!739221 () Bool)

(assert (=> b!798715 m!739221))

(declare-fun m!739223 () Bool)

(assert (=> b!798715 m!739223))

(declare-fun m!739225 () Bool)

(assert (=> b!798715 m!739225))

(declare-fun m!739227 () Bool)

(assert (=> start!68628 m!739227))

(declare-fun m!739229 () Bool)

(assert (=> start!68628 m!739229))

(declare-fun m!739231 () Bool)

(assert (=> b!798718 m!739231))

(assert (=> b!798719 m!739197))

(assert (=> b!798719 m!739197))

(declare-fun m!739233 () Bool)

(assert (=> b!798719 m!739233))

(assert (=> b!798724 m!739197))

(assert (=> b!798724 m!739197))

(declare-fun m!739235 () Bool)

(assert (=> b!798724 m!739235))

(check-sat (not b!798714) (not b!798722) (not b!798725) (not b!798718) (not b!798721) (not b!798723) (not b!798719) (not start!68628) (not b!798717) (not b!798720) (not b!798724) (not b!798715))
(check-sat)
