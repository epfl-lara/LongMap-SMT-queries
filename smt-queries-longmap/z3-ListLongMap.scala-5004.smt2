; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68658 () Bool)

(assert start!68658)

(declare-fun b!797675 () Bool)

(declare-fun res!541822 () Bool)

(declare-fun e!442633 () Bool)

(assert (=> b!797675 (=> (not res!541822) (not e!442633))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43322 0))(
  ( (array!43323 (arr!20737 (Array (_ BitVec 32) (_ BitVec 64))) (size!21157 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43322)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797675 (= res!541822 (and (= (size!21157 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21157 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21157 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797676 () Bool)

(declare-fun res!541824 () Bool)

(declare-fun e!442630 () Bool)

(assert (=> b!797676 (=> (not res!541824) (not e!442630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43322 (_ BitVec 32)) Bool)

(assert (=> b!797676 (= res!541824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797677 () Bool)

(declare-fun res!541820 () Bool)

(assert (=> b!797677 (=> (not res!541820) (not e!442633))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797677 (= res!541820 (validKeyInArray!0 k0!2044))))

(declare-fun b!797678 () Bool)

(declare-fun e!442632 () Bool)

(assert (=> b!797678 (= e!442632 (not true))))

(declare-datatypes ((SeekEntryResult!8284 0))(
  ( (MissingZero!8284 (index!35504 (_ BitVec 32))) (Found!8284 (index!35505 (_ BitVec 32))) (Intermediate!8284 (undefined!9096 Bool) (index!35506 (_ BitVec 32)) (x!66565 (_ BitVec 32))) (Undefined!8284) (MissingVacant!8284 (index!35507 (_ BitVec 32))) )
))
(declare-fun lt!355773 () SeekEntryResult!8284)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797678 (= lt!355773 (Found!8284 index!1236))))

(declare-fun res!541821 () Bool)

(assert (=> start!68658 (=> (not res!541821) (not e!442633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68658 (= res!541821 (validMask!0 mask!3266))))

(assert (=> start!68658 e!442633))

(assert (=> start!68658 true))

(declare-fun array_inv!16596 (array!43322) Bool)

(assert (=> start!68658 (array_inv!16596 a!3170)))

(declare-fun b!797679 () Bool)

(declare-fun res!541829 () Bool)

(assert (=> b!797679 (=> (not res!541829) (not e!442633))))

(declare-fun arrayContainsKey!0 (array!43322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797679 (= res!541829 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797680 () Bool)

(declare-fun e!442629 () Bool)

(assert (=> b!797680 (= e!442629 e!442632)))

(declare-fun res!541826 () Bool)

(assert (=> b!797680 (=> (not res!541826) (not e!442632))))

(declare-fun lt!355775 () SeekEntryResult!8284)

(declare-fun lt!355772 () SeekEntryResult!8284)

(assert (=> b!797680 (= res!541826 (and (= lt!355772 lt!355775) (= lt!355775 (Found!8284 j!153)) (= (select (arr!20737 a!3170) index!1236) (select (arr!20737 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43322 (_ BitVec 32)) SeekEntryResult!8284)

(assert (=> b!797680 (= lt!355775 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20737 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43322 (_ BitVec 32)) SeekEntryResult!8284)

(assert (=> b!797680 (= lt!355772 (seekEntryOrOpen!0 (select (arr!20737 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797681 () Bool)

(assert (=> b!797681 (= e!442633 e!442630)))

(declare-fun res!541830 () Bool)

(assert (=> b!797681 (=> (not res!541830) (not e!442630))))

(declare-fun lt!355771 () SeekEntryResult!8284)

(assert (=> b!797681 (= res!541830 (or (= lt!355771 (MissingZero!8284 i!1163)) (= lt!355771 (MissingVacant!8284 i!1163))))))

(assert (=> b!797681 (= lt!355771 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797682 () Bool)

(assert (=> b!797682 (= e!442630 e!442629)))

(declare-fun res!541825 () Bool)

(assert (=> b!797682 (=> (not res!541825) (not e!442629))))

(declare-fun lt!355777 () SeekEntryResult!8284)

(assert (=> b!797682 (= res!541825 (= lt!355777 lt!355773))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355774 () (_ BitVec 64))

(declare-fun lt!355776 () array!43322)

(assert (=> b!797682 (= lt!355773 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355774 lt!355776 mask!3266))))

(assert (=> b!797682 (= lt!355777 (seekEntryOrOpen!0 lt!355774 lt!355776 mask!3266))))

(assert (=> b!797682 (= lt!355774 (select (store (arr!20737 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797682 (= lt!355776 (array!43323 (store (arr!20737 a!3170) i!1163 k0!2044) (size!21157 a!3170)))))

(declare-fun b!797683 () Bool)

(declare-fun res!541827 () Bool)

(assert (=> b!797683 (=> (not res!541827) (not e!442633))))

(assert (=> b!797683 (= res!541827 (validKeyInArray!0 (select (arr!20737 a!3170) j!153)))))

(declare-fun b!797684 () Bool)

(declare-fun res!541828 () Bool)

(assert (=> b!797684 (=> (not res!541828) (not e!442630))))

(declare-datatypes ((List!14607 0))(
  ( (Nil!14604) (Cons!14603 (h!15738 (_ BitVec 64)) (t!20914 List!14607)) )
))
(declare-fun arrayNoDuplicates!0 (array!43322 (_ BitVec 32) List!14607) Bool)

(assert (=> b!797684 (= res!541828 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14604))))

(declare-fun b!797685 () Bool)

(declare-fun res!541823 () Bool)

(assert (=> b!797685 (=> (not res!541823) (not e!442630))))

(assert (=> b!797685 (= res!541823 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21157 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20737 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21157 a!3170)) (= (select (arr!20737 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68658 res!541821) b!797675))

(assert (= (and b!797675 res!541822) b!797683))

(assert (= (and b!797683 res!541827) b!797677))

(assert (= (and b!797677 res!541820) b!797679))

(assert (= (and b!797679 res!541829) b!797681))

(assert (= (and b!797681 res!541830) b!797676))

(assert (= (and b!797676 res!541824) b!797684))

(assert (= (and b!797684 res!541828) b!797685))

(assert (= (and b!797685 res!541823) b!797682))

(assert (= (and b!797682 res!541825) b!797680))

(assert (= (and b!797680 res!541826) b!797678))

(declare-fun m!738941 () Bool)

(assert (=> b!797684 m!738941))

(declare-fun m!738943 () Bool)

(assert (=> b!797685 m!738943))

(declare-fun m!738945 () Bool)

(assert (=> b!797685 m!738945))

(declare-fun m!738947 () Bool)

(assert (=> b!797680 m!738947))

(declare-fun m!738949 () Bool)

(assert (=> b!797680 m!738949))

(assert (=> b!797680 m!738949))

(declare-fun m!738951 () Bool)

(assert (=> b!797680 m!738951))

(assert (=> b!797680 m!738949))

(declare-fun m!738953 () Bool)

(assert (=> b!797680 m!738953))

(declare-fun m!738955 () Bool)

(assert (=> b!797681 m!738955))

(declare-fun m!738957 () Bool)

(assert (=> b!797682 m!738957))

(declare-fun m!738959 () Bool)

(assert (=> b!797682 m!738959))

(declare-fun m!738961 () Bool)

(assert (=> b!797682 m!738961))

(declare-fun m!738963 () Bool)

(assert (=> b!797682 m!738963))

(declare-fun m!738965 () Bool)

(assert (=> b!797679 m!738965))

(declare-fun m!738967 () Bool)

(assert (=> b!797677 m!738967))

(declare-fun m!738969 () Bool)

(assert (=> b!797676 m!738969))

(assert (=> b!797683 m!738949))

(assert (=> b!797683 m!738949))

(declare-fun m!738971 () Bool)

(assert (=> b!797683 m!738971))

(declare-fun m!738973 () Bool)

(assert (=> start!68658 m!738973))

(declare-fun m!738975 () Bool)

(assert (=> start!68658 m!738975))

(check-sat (not b!797679) (not b!797680) (not b!797684) (not start!68658) (not b!797677) (not b!797683) (not b!797676) (not b!797682) (not b!797681))
(check-sat)
