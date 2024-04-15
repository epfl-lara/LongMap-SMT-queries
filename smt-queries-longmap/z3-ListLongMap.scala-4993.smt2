; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68448 () Bool)

(assert start!68448)

(declare-fun b!795667 () Bool)

(declare-fun res!540336 () Bool)

(declare-fun e!441542 () Bool)

(assert (=> b!795667 (=> (not res!540336) (not e!441542))))

(declare-datatypes ((array!43255 0))(
  ( (array!43256 (arr!20708 (Array (_ BitVec 32) (_ BitVec 64))) (size!21129 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43255)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795667 (= res!540336 (validKeyInArray!0 (select (arr!20708 a!3170) j!153)))))

(declare-fun b!795668 () Bool)

(declare-fun e!441544 () Bool)

(declare-fun lt!354574 () (_ BitVec 64))

(assert (=> b!795668 (= e!441544 (not (validKeyInArray!0 lt!354574)))))

(declare-fun b!795669 () Bool)

(declare-fun e!441540 () Bool)

(assert (=> b!795669 (= e!441542 e!441540)))

(declare-fun res!540333 () Bool)

(assert (=> b!795669 (=> (not res!540333) (not e!441540))))

(declare-datatypes ((SeekEntryResult!8296 0))(
  ( (MissingZero!8296 (index!35552 (_ BitVec 32))) (Found!8296 (index!35553 (_ BitVec 32))) (Intermediate!8296 (undefined!9108 Bool) (index!35554 (_ BitVec 32)) (x!66473 (_ BitVec 32))) (Undefined!8296) (MissingVacant!8296 (index!35555 (_ BitVec 32))) )
))
(declare-fun lt!354575 () SeekEntryResult!8296)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795669 (= res!540333 (or (= lt!354575 (MissingZero!8296 i!1163)) (= lt!354575 (MissingVacant!8296 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43255 (_ BitVec 32)) SeekEntryResult!8296)

(assert (=> b!795669 (= lt!354575 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795670 () Bool)

(declare-fun e!441543 () Bool)

(assert (=> b!795670 (= e!441543 e!441544)))

(declare-fun res!540330 () Bool)

(assert (=> b!795670 (=> (not res!540330) (not e!441544))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354573 () SeekEntryResult!8296)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354571 () SeekEntryResult!8296)

(assert (=> b!795670 (= res!540330 (and (= lt!354571 lt!354573) (= lt!354573 (Found!8296 j!153)) (= (select (arr!20708 a!3170) index!1236) (select (arr!20708 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20708 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43255 (_ BitVec 32)) SeekEntryResult!8296)

(assert (=> b!795670 (= lt!354573 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20708 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795670 (= lt!354571 (seekEntryOrOpen!0 (select (arr!20708 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795671 () Bool)

(declare-fun res!540331 () Bool)

(assert (=> b!795671 (=> (not res!540331) (not e!441540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43255 (_ BitVec 32)) Bool)

(assert (=> b!795671 (= res!540331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795672 () Bool)

(assert (=> b!795672 (= e!441540 e!441543)))

(declare-fun res!540332 () Bool)

(assert (=> b!795672 (=> (not res!540332) (not e!441543))))

(declare-fun lt!354572 () array!43255)

(assert (=> b!795672 (= res!540332 (= (seekEntryOrOpen!0 lt!354574 lt!354572 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354574 lt!354572 mask!3266)))))

(assert (=> b!795672 (= lt!354574 (select (store (arr!20708 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795672 (= lt!354572 (array!43256 (store (arr!20708 a!3170) i!1163 k0!2044) (size!21129 a!3170)))))

(declare-fun b!795673 () Bool)

(declare-fun res!540326 () Bool)

(assert (=> b!795673 (=> (not res!540326) (not e!441542))))

(assert (=> b!795673 (= res!540326 (and (= (size!21129 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21129 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21129 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795674 () Bool)

(declare-fun res!540329 () Bool)

(assert (=> b!795674 (=> (not res!540329) (not e!441540))))

(assert (=> b!795674 (= res!540329 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21129 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20708 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21129 a!3170)) (= (select (arr!20708 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795676 () Bool)

(declare-fun res!540335 () Bool)

(assert (=> b!795676 (=> (not res!540335) (not e!441542))))

(assert (=> b!795676 (= res!540335 (validKeyInArray!0 k0!2044))))

(declare-fun b!795677 () Bool)

(declare-fun res!540327 () Bool)

(assert (=> b!795677 (=> (not res!540327) (not e!441540))))

(declare-datatypes ((List!14710 0))(
  ( (Nil!14707) (Cons!14706 (h!15835 (_ BitVec 64)) (t!21016 List!14710)) )
))
(declare-fun arrayNoDuplicates!0 (array!43255 (_ BitVec 32) List!14710) Bool)

(assert (=> b!795677 (= res!540327 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14707))))

(declare-fun res!540334 () Bool)

(assert (=> start!68448 (=> (not res!540334) (not e!441542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68448 (= res!540334 (validMask!0 mask!3266))))

(assert (=> start!68448 e!441542))

(assert (=> start!68448 true))

(declare-fun array_inv!16591 (array!43255) Bool)

(assert (=> start!68448 (array_inv!16591 a!3170)))

(declare-fun b!795675 () Bool)

(declare-fun res!540328 () Bool)

(assert (=> b!795675 (=> (not res!540328) (not e!441542))))

(declare-fun arrayContainsKey!0 (array!43255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795675 (= res!540328 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68448 res!540334) b!795673))

(assert (= (and b!795673 res!540326) b!795667))

(assert (= (and b!795667 res!540336) b!795676))

(assert (= (and b!795676 res!540335) b!795675))

(assert (= (and b!795675 res!540328) b!795669))

(assert (= (and b!795669 res!540333) b!795671))

(assert (= (and b!795671 res!540331) b!795677))

(assert (= (and b!795677 res!540327) b!795674))

(assert (= (and b!795674 res!540329) b!795672))

(assert (= (and b!795672 res!540332) b!795670))

(assert (= (and b!795670 res!540330) b!795668))

(declare-fun m!735901 () Bool)

(assert (=> b!795676 m!735901))

(declare-fun m!735903 () Bool)

(assert (=> start!68448 m!735903))

(declare-fun m!735905 () Bool)

(assert (=> start!68448 m!735905))

(declare-fun m!735907 () Bool)

(assert (=> b!795669 m!735907))

(declare-fun m!735909 () Bool)

(assert (=> b!795677 m!735909))

(declare-fun m!735911 () Bool)

(assert (=> b!795667 m!735911))

(assert (=> b!795667 m!735911))

(declare-fun m!735913 () Bool)

(assert (=> b!795667 m!735913))

(declare-fun m!735915 () Bool)

(assert (=> b!795672 m!735915))

(declare-fun m!735917 () Bool)

(assert (=> b!795672 m!735917))

(declare-fun m!735919 () Bool)

(assert (=> b!795672 m!735919))

(declare-fun m!735921 () Bool)

(assert (=> b!795672 m!735921))

(declare-fun m!735923 () Bool)

(assert (=> b!795674 m!735923))

(declare-fun m!735925 () Bool)

(assert (=> b!795674 m!735925))

(declare-fun m!735927 () Bool)

(assert (=> b!795675 m!735927))

(declare-fun m!735929 () Bool)

(assert (=> b!795668 m!735929))

(assert (=> b!795670 m!735911))

(declare-fun m!735931 () Bool)

(assert (=> b!795670 m!735931))

(declare-fun m!735933 () Bool)

(assert (=> b!795670 m!735933))

(assert (=> b!795670 m!735911))

(declare-fun m!735935 () Bool)

(assert (=> b!795670 m!735935))

(assert (=> b!795670 m!735911))

(declare-fun m!735937 () Bool)

(assert (=> b!795670 m!735937))

(assert (=> b!795670 m!735919))

(declare-fun m!735939 () Bool)

(assert (=> b!795671 m!735939))

(check-sat (not b!795677) (not b!795675) (not start!68448) (not b!795672) (not b!795670) (not b!795671) (not b!795669) (not b!795668) (not b!795676) (not b!795667))
(check-sat)
