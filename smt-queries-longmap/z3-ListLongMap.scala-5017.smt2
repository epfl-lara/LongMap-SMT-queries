; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68592 () Bool)

(assert start!68592)

(declare-fun b!798133 () Bool)

(declare-fun res!542796 () Bool)

(declare-fun e!442714 () Bool)

(assert (=> b!798133 (=> (not res!542796) (not e!442714))))

(declare-datatypes ((array!43399 0))(
  ( (array!43400 (arr!20780 (Array (_ BitVec 32) (_ BitVec 64))) (size!21201 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43399)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798133 (= res!542796 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798134 () Bool)

(declare-fun res!542792 () Bool)

(assert (=> b!798134 (=> (not res!542792) (not e!442714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798134 (= res!542792 (validKeyInArray!0 k0!2044))))

(declare-fun b!798135 () Bool)

(declare-fun res!542795 () Bool)

(declare-fun e!442710 () Bool)

(assert (=> b!798135 (=> (not res!542795) (not e!442710))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43399 (_ BitVec 32)) Bool)

(assert (=> b!798135 (= res!542795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798136 () Bool)

(declare-fun res!542798 () Bool)

(assert (=> b!798136 (=> (not res!542798) (not e!442710))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798136 (= res!542798 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21201 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20780 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21201 a!3170)) (= (select (arr!20780 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798137 () Bool)

(declare-fun e!442712 () Bool)

(declare-fun e!442713 () Bool)

(assert (=> b!798137 (= e!442712 e!442713)))

(declare-fun res!542794 () Bool)

(assert (=> b!798137 (=> (not res!542794) (not e!442713))))

(declare-datatypes ((SeekEntryResult!8368 0))(
  ( (MissingZero!8368 (index!35840 (_ BitVec 32))) (Found!8368 (index!35841 (_ BitVec 32))) (Intermediate!8368 (undefined!9180 Bool) (index!35842 (_ BitVec 32)) (x!66737 (_ BitVec 32))) (Undefined!8368) (MissingVacant!8368 (index!35843 (_ BitVec 32))) )
))
(declare-fun lt!356147 () SeekEntryResult!8368)

(declare-fun lt!356142 () SeekEntryResult!8368)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798137 (= res!542794 (and (= lt!356142 lt!356147) (= lt!356147 (Found!8368 j!153)) (= (select (arr!20780 a!3170) index!1236) (select (arr!20780 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43399 (_ BitVec 32)) SeekEntryResult!8368)

(assert (=> b!798137 (= lt!356147 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20780 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43399 (_ BitVec 32)) SeekEntryResult!8368)

(assert (=> b!798137 (= lt!356142 (seekEntryOrOpen!0 (select (arr!20780 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798138 () Bool)

(declare-fun res!542797 () Bool)

(assert (=> b!798138 (=> (not res!542797) (not e!442714))))

(assert (=> b!798138 (= res!542797 (validKeyInArray!0 (select (arr!20780 a!3170) j!153)))))

(declare-fun b!798139 () Bool)

(declare-fun res!542802 () Bool)

(assert (=> b!798139 (=> (not res!542802) (not e!442714))))

(assert (=> b!798139 (= res!542802 (and (= (size!21201 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21201 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21201 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!542799 () Bool)

(assert (=> start!68592 (=> (not res!542799) (not e!442714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68592 (= res!542799 (validMask!0 mask!3266))))

(assert (=> start!68592 e!442714))

(assert (=> start!68592 true))

(declare-fun array_inv!16663 (array!43399) Bool)

(assert (=> start!68592 (array_inv!16663 a!3170)))

(declare-fun b!798140 () Bool)

(assert (=> b!798140 (= e!442710 e!442712)))

(declare-fun res!542801 () Bool)

(assert (=> b!798140 (=> (not res!542801) (not e!442712))))

(declare-fun lt!356145 () SeekEntryResult!8368)

(declare-fun lt!356143 () SeekEntryResult!8368)

(assert (=> b!798140 (= res!542801 (= lt!356145 lt!356143))))

(declare-fun lt!356144 () array!43399)

(declare-fun lt!356141 () (_ BitVec 64))

(assert (=> b!798140 (= lt!356143 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356141 lt!356144 mask!3266))))

(assert (=> b!798140 (= lt!356145 (seekEntryOrOpen!0 lt!356141 lt!356144 mask!3266))))

(assert (=> b!798140 (= lt!356141 (select (store (arr!20780 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798140 (= lt!356144 (array!43400 (store (arr!20780 a!3170) i!1163 k0!2044) (size!21201 a!3170)))))

(declare-fun b!798141 () Bool)

(assert (=> b!798141 (= e!442714 e!442710)))

(declare-fun res!542800 () Bool)

(assert (=> b!798141 (=> (not res!542800) (not e!442710))))

(declare-fun lt!356146 () SeekEntryResult!8368)

(assert (=> b!798141 (= res!542800 (or (= lt!356146 (MissingZero!8368 i!1163)) (= lt!356146 (MissingVacant!8368 i!1163))))))

(assert (=> b!798141 (= lt!356146 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798142 () Bool)

(declare-fun res!542793 () Bool)

(assert (=> b!798142 (=> (not res!542793) (not e!442710))))

(declare-datatypes ((List!14782 0))(
  ( (Nil!14779) (Cons!14778 (h!15907 (_ BitVec 64)) (t!21088 List!14782)) )
))
(declare-fun arrayNoDuplicates!0 (array!43399 (_ BitVec 32) List!14782) Bool)

(assert (=> b!798142 (= res!542793 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14779))))

(declare-fun b!798143 () Bool)

(assert (=> b!798143 (= e!442713 (not true))))

(assert (=> b!798143 (= lt!356143 (Found!8368 index!1236))))

(assert (= (and start!68592 res!542799) b!798139))

(assert (= (and b!798139 res!542802) b!798138))

(assert (= (and b!798138 res!542797) b!798134))

(assert (= (and b!798134 res!542792) b!798133))

(assert (= (and b!798133 res!542796) b!798141))

(assert (= (and b!798141 res!542800) b!798135))

(assert (= (and b!798135 res!542795) b!798142))

(assert (= (and b!798142 res!542793) b!798136))

(assert (= (and b!798136 res!542798) b!798140))

(assert (= (and b!798140 res!542801) b!798137))

(assert (= (and b!798137 res!542794) b!798143))

(declare-fun m!738541 () Bool)

(assert (=> b!798133 m!738541))

(declare-fun m!738543 () Bool)

(assert (=> start!68592 m!738543))

(declare-fun m!738545 () Bool)

(assert (=> start!68592 m!738545))

(declare-fun m!738547 () Bool)

(assert (=> b!798134 m!738547))

(declare-fun m!738549 () Bool)

(assert (=> b!798138 m!738549))

(assert (=> b!798138 m!738549))

(declare-fun m!738551 () Bool)

(assert (=> b!798138 m!738551))

(declare-fun m!738553 () Bool)

(assert (=> b!798136 m!738553))

(declare-fun m!738555 () Bool)

(assert (=> b!798136 m!738555))

(declare-fun m!738557 () Bool)

(assert (=> b!798137 m!738557))

(assert (=> b!798137 m!738549))

(assert (=> b!798137 m!738549))

(declare-fun m!738559 () Bool)

(assert (=> b!798137 m!738559))

(assert (=> b!798137 m!738549))

(declare-fun m!738561 () Bool)

(assert (=> b!798137 m!738561))

(declare-fun m!738563 () Bool)

(assert (=> b!798142 m!738563))

(declare-fun m!738565 () Bool)

(assert (=> b!798141 m!738565))

(declare-fun m!738567 () Bool)

(assert (=> b!798140 m!738567))

(declare-fun m!738569 () Bool)

(assert (=> b!798140 m!738569))

(declare-fun m!738571 () Bool)

(assert (=> b!798140 m!738571))

(declare-fun m!738573 () Bool)

(assert (=> b!798140 m!738573))

(declare-fun m!738575 () Bool)

(assert (=> b!798135 m!738575))

(check-sat (not b!798133) (not b!798140) (not b!798137) (not b!798138) (not b!798135) (not b!798134) (not start!68592) (not b!798142) (not b!798141))
(check-sat)
