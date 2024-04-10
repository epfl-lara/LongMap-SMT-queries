; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68742 () Bool)

(assert start!68742)

(declare-fun b!800796 () Bool)

(declare-fun res!545324 () Bool)

(declare-fun e!443957 () Bool)

(assert (=> b!800796 (=> (not res!545324) (not e!443957))))

(declare-fun lt!357833 () (_ BitVec 32))

(declare-fun lt!357832 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8437 0))(
  ( (MissingZero!8437 (index!36116 (_ BitVec 32))) (Found!8437 (index!36117 (_ BitVec 32))) (Intermediate!8437 (undefined!9249 Bool) (index!36118 (_ BitVec 32)) (x!66979 (_ BitVec 32))) (Undefined!8437) (MissingVacant!8437 (index!36119 (_ BitVec 32))) )
))
(declare-fun lt!357830 () SeekEntryResult!8437)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43532 0))(
  ( (array!43533 (arr!20846 (Array (_ BitVec 32) (_ BitVec 64))) (size!21267 (_ BitVec 32))) )
))
(declare-fun lt!357828 () array!43532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43532 (_ BitVec 32)) SeekEntryResult!8437)

(assert (=> b!800796 (= res!545324 (= lt!357830 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357833 vacantAfter!23 lt!357832 lt!357828 mask!3266)))))

(declare-fun b!800797 () Bool)

(declare-fun res!545326 () Bool)

(declare-fun e!443958 () Bool)

(assert (=> b!800797 (=> (not res!545326) (not e!443958))))

(declare-fun a!3170 () array!43532)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43532 (_ BitVec 32)) Bool)

(assert (=> b!800797 (= res!545326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800798 () Bool)

(declare-fun e!443959 () Bool)

(assert (=> b!800798 (= e!443959 e!443957)))

(declare-fun res!545315 () Bool)

(assert (=> b!800798 (=> (not res!545315) (not e!443957))))

(assert (=> b!800798 (= res!545315 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357833 #b00000000000000000000000000000000) (bvslt lt!357833 (size!21267 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800798 (= lt!357833 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!545319 () Bool)

(declare-fun e!443956 () Bool)

(assert (=> start!68742 (=> (not res!545319) (not e!443956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68742 (= res!545319 (validMask!0 mask!3266))))

(assert (=> start!68742 e!443956))

(assert (=> start!68742 true))

(declare-fun array_inv!16642 (array!43532) Bool)

(assert (=> start!68742 (array_inv!16642 a!3170)))

(declare-fun b!800799 () Bool)

(declare-fun res!545325 () Bool)

(assert (=> b!800799 (=> (not res!545325) (not e!443956))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800799 (= res!545325 (validKeyInArray!0 k!2044))))

(declare-fun b!800800 () Bool)

(declare-fun res!545316 () Bool)

(assert (=> b!800800 (=> (not res!545316) (not e!443958))))

(declare-datatypes ((List!14809 0))(
  ( (Nil!14806) (Cons!14805 (h!15934 (_ BitVec 64)) (t!21124 List!14809)) )
))
(declare-fun arrayNoDuplicates!0 (array!43532 (_ BitVec 32) List!14809) Bool)

(assert (=> b!800800 (= res!545316 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14806))))

(declare-fun b!800801 () Bool)

(declare-fun e!443955 () Bool)

(assert (=> b!800801 (= e!443955 e!443959)))

(declare-fun res!545318 () Bool)

(assert (=> b!800801 (=> (not res!545318) (not e!443959))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357829 () SeekEntryResult!8437)

(declare-fun lt!357827 () SeekEntryResult!8437)

(assert (=> b!800801 (= res!545318 (and (= lt!357827 lt!357829) (= lt!357829 (Found!8437 j!153)) (not (= (select (arr!20846 a!3170) index!1236) (select (arr!20846 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800801 (= lt!357829 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20846 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43532 (_ BitVec 32)) SeekEntryResult!8437)

(assert (=> b!800801 (= lt!357827 (seekEntryOrOpen!0 (select (arr!20846 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800802 () Bool)

(assert (=> b!800802 (= e!443957 false)))

(declare-fun lt!357831 () SeekEntryResult!8437)

(assert (=> b!800802 (= lt!357831 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357833 vacantBefore!23 (select (arr!20846 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800803 () Bool)

(declare-fun res!545321 () Bool)

(assert (=> b!800803 (=> (not res!545321) (not e!443958))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800803 (= res!545321 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21267 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20846 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21267 a!3170)) (= (select (arr!20846 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800804 () Bool)

(declare-fun res!545322 () Bool)

(assert (=> b!800804 (=> (not res!545322) (not e!443956))))

(assert (=> b!800804 (= res!545322 (and (= (size!21267 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21267 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21267 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800805 () Bool)

(assert (=> b!800805 (= e!443956 e!443958)))

(declare-fun res!545320 () Bool)

(assert (=> b!800805 (=> (not res!545320) (not e!443958))))

(declare-fun lt!357826 () SeekEntryResult!8437)

(assert (=> b!800805 (= res!545320 (or (= lt!357826 (MissingZero!8437 i!1163)) (= lt!357826 (MissingVacant!8437 i!1163))))))

(assert (=> b!800805 (= lt!357826 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800806 () Bool)

(declare-fun res!545317 () Bool)

(assert (=> b!800806 (=> (not res!545317) (not e!443956))))

(assert (=> b!800806 (= res!545317 (validKeyInArray!0 (select (arr!20846 a!3170) j!153)))))

(declare-fun b!800807 () Bool)

(declare-fun res!545323 () Bool)

(assert (=> b!800807 (=> (not res!545323) (not e!443956))))

(declare-fun arrayContainsKey!0 (array!43532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800807 (= res!545323 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800808 () Bool)

(assert (=> b!800808 (= e!443958 e!443955)))

(declare-fun res!545327 () Bool)

(assert (=> b!800808 (=> (not res!545327) (not e!443955))))

(assert (=> b!800808 (= res!545327 (= lt!357830 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357832 lt!357828 mask!3266)))))

(assert (=> b!800808 (= lt!357830 (seekEntryOrOpen!0 lt!357832 lt!357828 mask!3266))))

(assert (=> b!800808 (= lt!357832 (select (store (arr!20846 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800808 (= lt!357828 (array!43533 (store (arr!20846 a!3170) i!1163 k!2044) (size!21267 a!3170)))))

(assert (= (and start!68742 res!545319) b!800804))

(assert (= (and b!800804 res!545322) b!800806))

(assert (= (and b!800806 res!545317) b!800799))

(assert (= (and b!800799 res!545325) b!800807))

(assert (= (and b!800807 res!545323) b!800805))

(assert (= (and b!800805 res!545320) b!800797))

(assert (= (and b!800797 res!545326) b!800800))

(assert (= (and b!800800 res!545316) b!800803))

(assert (= (and b!800803 res!545321) b!800808))

(assert (= (and b!800808 res!545327) b!800801))

(assert (= (and b!800801 res!545318) b!800798))

(assert (= (and b!800798 res!545315) b!800796))

(assert (= (and b!800796 res!545324) b!800802))

(declare-fun m!741911 () Bool)

(assert (=> b!800807 m!741911))

(declare-fun m!741913 () Bool)

(assert (=> b!800808 m!741913))

(declare-fun m!741915 () Bool)

(assert (=> b!800808 m!741915))

(declare-fun m!741917 () Bool)

(assert (=> b!800808 m!741917))

(declare-fun m!741919 () Bool)

(assert (=> b!800808 m!741919))

(declare-fun m!741921 () Bool)

(assert (=> b!800802 m!741921))

(assert (=> b!800802 m!741921))

(declare-fun m!741923 () Bool)

(assert (=> b!800802 m!741923))

(declare-fun m!741925 () Bool)

(assert (=> b!800805 m!741925))

(declare-fun m!741927 () Bool)

(assert (=> b!800800 m!741927))

(declare-fun m!741929 () Bool)

(assert (=> b!800803 m!741929))

(declare-fun m!741931 () Bool)

(assert (=> b!800803 m!741931))

(declare-fun m!741933 () Bool)

(assert (=> start!68742 m!741933))

(declare-fun m!741935 () Bool)

(assert (=> start!68742 m!741935))

(declare-fun m!741937 () Bool)

(assert (=> b!800799 m!741937))

(declare-fun m!741939 () Bool)

(assert (=> b!800796 m!741939))

(declare-fun m!741941 () Bool)

(assert (=> b!800801 m!741941))

(assert (=> b!800801 m!741921))

(assert (=> b!800801 m!741921))

(declare-fun m!741943 () Bool)

(assert (=> b!800801 m!741943))

(assert (=> b!800801 m!741921))

(declare-fun m!741945 () Bool)

(assert (=> b!800801 m!741945))

(declare-fun m!741947 () Bool)

(assert (=> b!800798 m!741947))

(declare-fun m!741949 () Bool)

(assert (=> b!800797 m!741949))

(assert (=> b!800806 m!741921))

(assert (=> b!800806 m!741921))

(declare-fun m!741951 () Bool)

(assert (=> b!800806 m!741951))

(push 1)

