; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68682 () Bool)

(assert start!68682)

(declare-fun b!799626 () Bool)

(declare-fun res!544153 () Bool)

(declare-fun e!443415 () Bool)

(assert (=> b!799626 (=> (not res!544153) (not e!443415))))

(declare-datatypes ((array!43472 0))(
  ( (array!43473 (arr!20816 (Array (_ BitVec 32) (_ BitVec 64))) (size!21237 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43472)

(declare-datatypes ((List!14779 0))(
  ( (Nil!14776) (Cons!14775 (h!15904 (_ BitVec 64)) (t!21094 List!14779)) )
))
(declare-fun arrayNoDuplicates!0 (array!43472 (_ BitVec 32) List!14779) Bool)

(assert (=> b!799626 (= res!544153 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14776))))

(declare-fun b!799627 () Bool)

(declare-fun e!443416 () Bool)

(declare-fun e!443420 () Bool)

(assert (=> b!799627 (= e!443416 e!443420)))

(declare-fun res!544147 () Bool)

(assert (=> b!799627 (=> (not res!544147) (not e!443420))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8407 0))(
  ( (MissingZero!8407 (index!35996 (_ BitVec 32))) (Found!8407 (index!35997 (_ BitVec 32))) (Intermediate!8407 (undefined!9219 Bool) (index!35998 (_ BitVec 32)) (x!66869 (_ BitVec 32))) (Undefined!8407) (MissingVacant!8407 (index!35999 (_ BitVec 32))) )
))
(declare-fun lt!357110 () SeekEntryResult!8407)

(declare-fun lt!357111 () SeekEntryResult!8407)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799627 (= res!544147 (and (= lt!357111 lt!357110) (= lt!357110 (Found!8407 j!153)) (not (= (select (arr!20816 a!3170) index!1236) (select (arr!20816 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43472 (_ BitVec 32)) SeekEntryResult!8407)

(assert (=> b!799627 (= lt!357110 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20816 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43472 (_ BitVec 32)) SeekEntryResult!8407)

(assert (=> b!799627 (= lt!357111 (seekEntryOrOpen!0 (select (arr!20816 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799628 () Bool)

(declare-fun e!443417 () Bool)

(assert (=> b!799628 (= e!443420 e!443417)))

(declare-fun res!544157 () Bool)

(assert (=> b!799628 (=> (not res!544157) (not e!443417))))

(declare-fun lt!357106 () (_ BitVec 32))

(assert (=> b!799628 (= res!544157 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357106 #b00000000000000000000000000000000) (bvslt lt!357106 (size!21237 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799628 (= lt!357106 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799629 () Bool)

(declare-fun res!544155 () Bool)

(declare-fun e!443419 () Bool)

(assert (=> b!799629 (=> (not res!544155) (not e!443419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799629 (= res!544155 (validKeyInArray!0 (select (arr!20816 a!3170) j!153)))))

(declare-fun b!799630 () Bool)

(declare-fun res!544149 () Bool)

(assert (=> b!799630 (=> (not res!544149) (not e!443419))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!799630 (= res!544149 (validKeyInArray!0 k!2044))))

(declare-fun b!799631 () Bool)

(assert (=> b!799631 (= e!443415 e!443416)))

(declare-fun res!544156 () Bool)

(assert (=> b!799631 (=> (not res!544156) (not e!443416))))

(declare-fun lt!357113 () SeekEntryResult!8407)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357107 () (_ BitVec 64))

(declare-fun lt!357108 () array!43472)

(assert (=> b!799631 (= res!544156 (= lt!357113 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357107 lt!357108 mask!3266)))))

(assert (=> b!799631 (= lt!357113 (seekEntryOrOpen!0 lt!357107 lt!357108 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799631 (= lt!357107 (select (store (arr!20816 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799631 (= lt!357108 (array!43473 (store (arr!20816 a!3170) i!1163 k!2044) (size!21237 a!3170)))))

(declare-fun b!799632 () Bool)

(declare-fun res!544150 () Bool)

(assert (=> b!799632 (=> (not res!544150) (not e!443415))))

(assert (=> b!799632 (= res!544150 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21237 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20816 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21237 a!3170)) (= (select (arr!20816 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799633 () Bool)

(declare-fun res!544151 () Bool)

(assert (=> b!799633 (=> (not res!544151) (not e!443419))))

(declare-fun arrayContainsKey!0 (array!43472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799633 (= res!544151 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799634 () Bool)

(assert (=> b!799634 (= e!443419 e!443415)))

(declare-fun res!544154 () Bool)

(assert (=> b!799634 (=> (not res!544154) (not e!443415))))

(declare-fun lt!357112 () SeekEntryResult!8407)

(assert (=> b!799634 (= res!544154 (or (= lt!357112 (MissingZero!8407 i!1163)) (= lt!357112 (MissingVacant!8407 i!1163))))))

(assert (=> b!799634 (= lt!357112 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!544152 () Bool)

(assert (=> start!68682 (=> (not res!544152) (not e!443419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68682 (= res!544152 (validMask!0 mask!3266))))

(assert (=> start!68682 e!443419))

(assert (=> start!68682 true))

(declare-fun array_inv!16612 (array!43472) Bool)

(assert (=> start!68682 (array_inv!16612 a!3170)))

(declare-fun b!799635 () Bool)

(assert (=> b!799635 (= e!443417 false)))

(declare-fun lt!357109 () SeekEntryResult!8407)

(assert (=> b!799635 (= lt!357109 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357106 vacantBefore!23 (select (arr!20816 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799636 () Bool)

(declare-fun res!544146 () Bool)

(assert (=> b!799636 (=> (not res!544146) (not e!443417))))

(assert (=> b!799636 (= res!544146 (= lt!357113 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357106 vacantAfter!23 lt!357107 lt!357108 mask!3266)))))

(declare-fun b!799637 () Bool)

(declare-fun res!544145 () Bool)

(assert (=> b!799637 (=> (not res!544145) (not e!443419))))

(assert (=> b!799637 (= res!544145 (and (= (size!21237 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21237 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21237 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799638 () Bool)

(declare-fun res!544148 () Bool)

(assert (=> b!799638 (=> (not res!544148) (not e!443415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43472 (_ BitVec 32)) Bool)

(assert (=> b!799638 (= res!544148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68682 res!544152) b!799637))

(assert (= (and b!799637 res!544145) b!799629))

(assert (= (and b!799629 res!544155) b!799630))

(assert (= (and b!799630 res!544149) b!799633))

(assert (= (and b!799633 res!544151) b!799634))

(assert (= (and b!799634 res!544154) b!799638))

(assert (= (and b!799638 res!544148) b!799626))

(assert (= (and b!799626 res!544153) b!799632))

(assert (= (and b!799632 res!544150) b!799631))

(assert (= (and b!799631 res!544156) b!799627))

(assert (= (and b!799627 res!544147) b!799628))

(assert (= (and b!799628 res!544157) b!799636))

(assert (= (and b!799636 res!544146) b!799635))

(declare-fun m!740651 () Bool)

(assert (=> b!799627 m!740651))

(declare-fun m!740653 () Bool)

(assert (=> b!799627 m!740653))

(assert (=> b!799627 m!740653))

(declare-fun m!740655 () Bool)

(assert (=> b!799627 m!740655))

(assert (=> b!799627 m!740653))

(declare-fun m!740657 () Bool)

(assert (=> b!799627 m!740657))

(declare-fun m!740659 () Bool)

(assert (=> b!799628 m!740659))

(declare-fun m!740661 () Bool)

(assert (=> b!799633 m!740661))

(assert (=> b!799629 m!740653))

(assert (=> b!799629 m!740653))

(declare-fun m!740663 () Bool)

(assert (=> b!799629 m!740663))

(declare-fun m!740665 () Bool)

(assert (=> b!799631 m!740665))

(declare-fun m!740667 () Bool)

(assert (=> b!799631 m!740667))

(declare-fun m!740669 () Bool)

(assert (=> b!799631 m!740669))

(declare-fun m!740671 () Bool)

(assert (=> b!799631 m!740671))

(declare-fun m!740673 () Bool)

(assert (=> b!799632 m!740673))

(declare-fun m!740675 () Bool)

(assert (=> b!799632 m!740675))

(declare-fun m!740677 () Bool)

(assert (=> b!799626 m!740677))

(declare-fun m!740679 () Bool)

(assert (=> b!799630 m!740679))

(assert (=> b!799635 m!740653))

(assert (=> b!799635 m!740653))

(declare-fun m!740681 () Bool)

(assert (=> b!799635 m!740681))

(declare-fun m!740683 () Bool)

(assert (=> b!799636 m!740683))

(declare-fun m!740685 () Bool)

(assert (=> b!799634 m!740685))

(declare-fun m!740687 () Bool)

(assert (=> b!799638 m!740687))

(declare-fun m!740689 () Bool)

(assert (=> start!68682 m!740689))

(declare-fun m!740691 () Bool)

(assert (=> start!68682 m!740691))

(push 1)

