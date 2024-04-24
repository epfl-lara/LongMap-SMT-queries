; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68592 () Bool)

(assert start!68592)

(declare-fun b!796568 () Bool)

(declare-fun e!442117 () Bool)

(declare-fun e!442120 () Bool)

(assert (=> b!796568 (= e!442117 e!442120)))

(declare-fun res!540713 () Bool)

(assert (=> b!796568 (=> (not res!540713) (not e!442120))))

(declare-fun lt!355084 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43256 0))(
  ( (array!43257 (arr!20704 (Array (_ BitVec 32) (_ BitVec 64))) (size!21124 (_ BitVec 32))) )
))
(declare-fun lt!355086 () array!43256)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8251 0))(
  ( (MissingZero!8251 (index!35372 (_ BitVec 32))) (Found!8251 (index!35373 (_ BitVec 32))) (Intermediate!8251 (undefined!9063 Bool) (index!35374 (_ BitVec 32)) (x!66444 (_ BitVec 32))) (Undefined!8251) (MissingVacant!8251 (index!35375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43256 (_ BitVec 32)) SeekEntryResult!8251)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43256 (_ BitVec 32)) SeekEntryResult!8251)

(assert (=> b!796568 (= res!540713 (= (seekEntryOrOpen!0 lt!355084 lt!355086 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355084 lt!355086 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43256)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796568 (= lt!355084 (select (store (arr!20704 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796568 (= lt!355086 (array!43257 (store (arr!20704 a!3170) i!1163 k0!2044) (size!21124 a!3170)))))

(declare-fun res!540719 () Bool)

(declare-fun e!442116 () Bool)

(assert (=> start!68592 (=> (not res!540719) (not e!442116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68592 (= res!540719 (validMask!0 mask!3266))))

(assert (=> start!68592 e!442116))

(assert (=> start!68592 true))

(declare-fun array_inv!16563 (array!43256) Bool)

(assert (=> start!68592 (array_inv!16563 a!3170)))

(declare-fun b!796569 () Bool)

(declare-fun e!442119 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796569 (= e!442119 (not (validKeyInArray!0 lt!355084)))))

(declare-fun b!796570 () Bool)

(declare-fun res!540722 () Bool)

(assert (=> b!796570 (=> (not res!540722) (not e!442117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43256 (_ BitVec 32)) Bool)

(assert (=> b!796570 (= res!540722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796571 () Bool)

(declare-fun res!540718 () Bool)

(assert (=> b!796571 (=> (not res!540718) (not e!442117))))

(declare-datatypes ((List!14574 0))(
  ( (Nil!14571) (Cons!14570 (h!15705 (_ BitVec 64)) (t!20881 List!14574)) )
))
(declare-fun arrayNoDuplicates!0 (array!43256 (_ BitVec 32) List!14574) Bool)

(assert (=> b!796571 (= res!540718 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14571))))

(declare-fun b!796572 () Bool)

(declare-fun res!540720 () Bool)

(assert (=> b!796572 (=> (not res!540720) (not e!442116))))

(assert (=> b!796572 (= res!540720 (validKeyInArray!0 k0!2044))))

(declare-fun b!796573 () Bool)

(declare-fun res!540716 () Bool)

(assert (=> b!796573 (=> (not res!540716) (not e!442116))))

(assert (=> b!796573 (= res!540716 (and (= (size!21124 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21124 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21124 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796574 () Bool)

(declare-fun res!540721 () Bool)

(assert (=> b!796574 (=> (not res!540721) (not e!442116))))

(declare-fun arrayContainsKey!0 (array!43256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796574 (= res!540721 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796575 () Bool)

(declare-fun res!540714 () Bool)

(assert (=> b!796575 (=> (not res!540714) (not e!442117))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796575 (= res!540714 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21124 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20704 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21124 a!3170)) (= (select (arr!20704 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796576 () Bool)

(declare-fun res!540717 () Bool)

(assert (=> b!796576 (=> (not res!540717) (not e!442116))))

(assert (=> b!796576 (= res!540717 (validKeyInArray!0 (select (arr!20704 a!3170) j!153)))))

(declare-fun b!796577 () Bool)

(assert (=> b!796577 (= e!442116 e!442117)))

(declare-fun res!540715 () Bool)

(assert (=> b!796577 (=> (not res!540715) (not e!442117))))

(declare-fun lt!355085 () SeekEntryResult!8251)

(assert (=> b!796577 (= res!540715 (or (= lt!355085 (MissingZero!8251 i!1163)) (= lt!355085 (MissingVacant!8251 i!1163))))))

(assert (=> b!796577 (= lt!355085 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796578 () Bool)

(assert (=> b!796578 (= e!442120 e!442119)))

(declare-fun res!540723 () Bool)

(assert (=> b!796578 (=> (not res!540723) (not e!442119))))

(declare-fun lt!355083 () SeekEntryResult!8251)

(declare-fun lt!355087 () SeekEntryResult!8251)

(assert (=> b!796578 (= res!540723 (and (= lt!355083 lt!355087) (= lt!355087 (Found!8251 j!153)) (= (select (arr!20704 a!3170) index!1236) (select (arr!20704 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20704 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!796578 (= lt!355087 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20704 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796578 (= lt!355083 (seekEntryOrOpen!0 (select (arr!20704 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68592 res!540719) b!796573))

(assert (= (and b!796573 res!540716) b!796576))

(assert (= (and b!796576 res!540717) b!796572))

(assert (= (and b!796572 res!540720) b!796574))

(assert (= (and b!796574 res!540721) b!796577))

(assert (= (and b!796577 res!540715) b!796570))

(assert (= (and b!796570 res!540722) b!796571))

(assert (= (and b!796571 res!540718) b!796575))

(assert (= (and b!796575 res!540714) b!796568))

(assert (= (and b!796568 res!540713) b!796578))

(assert (= (and b!796578 res!540723) b!796569))

(declare-fun m!737723 () Bool)

(assert (=> b!796576 m!737723))

(assert (=> b!796576 m!737723))

(declare-fun m!737725 () Bool)

(assert (=> b!796576 m!737725))

(declare-fun m!737727 () Bool)

(assert (=> b!796574 m!737727))

(declare-fun m!737729 () Bool)

(assert (=> b!796570 m!737729))

(declare-fun m!737731 () Bool)

(assert (=> b!796577 m!737731))

(declare-fun m!737733 () Bool)

(assert (=> b!796571 m!737733))

(declare-fun m!737735 () Bool)

(assert (=> start!68592 m!737735))

(declare-fun m!737737 () Bool)

(assert (=> start!68592 m!737737))

(declare-fun m!737739 () Bool)

(assert (=> b!796575 m!737739))

(declare-fun m!737741 () Bool)

(assert (=> b!796575 m!737741))

(declare-fun m!737743 () Bool)

(assert (=> b!796572 m!737743))

(assert (=> b!796578 m!737723))

(declare-fun m!737745 () Bool)

(assert (=> b!796578 m!737745))

(declare-fun m!737747 () Bool)

(assert (=> b!796578 m!737747))

(assert (=> b!796578 m!737723))

(declare-fun m!737749 () Bool)

(assert (=> b!796578 m!737749))

(assert (=> b!796578 m!737723))

(declare-fun m!737751 () Bool)

(assert (=> b!796578 m!737751))

(declare-fun m!737753 () Bool)

(assert (=> b!796578 m!737753))

(declare-fun m!737755 () Bool)

(assert (=> b!796568 m!737755))

(declare-fun m!737757 () Bool)

(assert (=> b!796568 m!737757))

(assert (=> b!796568 m!737753))

(declare-fun m!737759 () Bool)

(assert (=> b!796568 m!737759))

(declare-fun m!737761 () Bool)

(assert (=> b!796569 m!737761))

(check-sat (not b!796570) (not b!796571) (not b!796574) (not b!796572) (not start!68592) (not b!796568) (not b!796569) (not b!796577) (not b!796578) (not b!796576))
(check-sat)
