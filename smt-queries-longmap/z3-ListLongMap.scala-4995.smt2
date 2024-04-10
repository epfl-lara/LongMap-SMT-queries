; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68482 () Bool)

(assert start!68482)

(declare-fun b!796148 () Bool)

(declare-fun res!540671 () Bool)

(declare-fun e!441803 () Bool)

(assert (=> b!796148 (=> (not res!540671) (not e!441803))))

(declare-datatypes ((array!43272 0))(
  ( (array!43273 (arr!20716 (Array (_ BitVec 32) (_ BitVec 64))) (size!21137 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43272)

(declare-datatypes ((List!14679 0))(
  ( (Nil!14676) (Cons!14675 (h!15804 (_ BitVec 64)) (t!20994 List!14679)) )
))
(declare-fun arrayNoDuplicates!0 (array!43272 (_ BitVec 32) List!14679) Bool)

(assert (=> b!796148 (= res!540671 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14676))))

(declare-fun b!796149 () Bool)

(declare-fun e!441801 () Bool)

(assert (=> b!796149 (= e!441803 e!441801)))

(declare-fun res!540677 () Bool)

(assert (=> b!796149 (=> (not res!540677) (not e!441801))))

(declare-datatypes ((SeekEntryResult!8307 0))(
  ( (MissingZero!8307 (index!35596 (_ BitVec 32))) (Found!8307 (index!35597 (_ BitVec 32))) (Intermediate!8307 (undefined!9119 Bool) (index!35598 (_ BitVec 32)) (x!66505 (_ BitVec 32))) (Undefined!8307) (MissingVacant!8307 (index!35599 (_ BitVec 32))) )
))
(declare-fun lt!354950 () SeekEntryResult!8307)

(declare-fun lt!354949 () SeekEntryResult!8307)

(assert (=> b!796149 (= res!540677 (= lt!354950 lt!354949))))

(declare-fun lt!354947 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354948 () array!43272)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43272 (_ BitVec 32)) SeekEntryResult!8307)

(assert (=> b!796149 (= lt!354949 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354947 lt!354948 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43272 (_ BitVec 32)) SeekEntryResult!8307)

(assert (=> b!796149 (= lt!354950 (seekEntryOrOpen!0 lt!354947 lt!354948 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796149 (= lt!354947 (select (store (arr!20716 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796149 (= lt!354948 (array!43273 (store (arr!20716 a!3170) i!1163 k0!2044) (size!21137 a!3170)))))

(declare-fun b!796150 () Bool)

(declare-fun e!441800 () Bool)

(assert (=> b!796150 (= e!441801 e!441800)))

(declare-fun res!540674 () Bool)

(assert (=> b!796150 (=> (not res!540674) (not e!441800))))

(declare-fun lt!354946 () SeekEntryResult!8307)

(declare-fun lt!354944 () SeekEntryResult!8307)

(assert (=> b!796150 (= res!540674 (and (= lt!354946 lt!354944) (= lt!354944 (Found!8307 j!153)) (= (select (arr!20716 a!3170) index!1236) (select (arr!20716 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796150 (= lt!354944 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20716 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796150 (= lt!354946 (seekEntryOrOpen!0 (select (arr!20716 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796151 () Bool)

(assert (=> b!796151 (= e!441800 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!796151 (= lt!354949 (Found!8307 index!1236))))

(declare-fun res!540669 () Bool)

(declare-fun e!441802 () Bool)

(assert (=> start!68482 (=> (not res!540669) (not e!441802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68482 (= res!540669 (validMask!0 mask!3266))))

(assert (=> start!68482 e!441802))

(assert (=> start!68482 true))

(declare-fun array_inv!16512 (array!43272) Bool)

(assert (=> start!68482 (array_inv!16512 a!3170)))

(declare-fun b!796152 () Bool)

(declare-fun res!540673 () Bool)

(assert (=> b!796152 (=> (not res!540673) (not e!441802))))

(declare-fun arrayContainsKey!0 (array!43272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796152 (= res!540673 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796153 () Bool)

(assert (=> b!796153 (= e!441802 e!441803)))

(declare-fun res!540676 () Bool)

(assert (=> b!796153 (=> (not res!540676) (not e!441803))))

(declare-fun lt!354945 () SeekEntryResult!8307)

(assert (=> b!796153 (= res!540676 (or (= lt!354945 (MissingZero!8307 i!1163)) (= lt!354945 (MissingVacant!8307 i!1163))))))

(assert (=> b!796153 (= lt!354945 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796154 () Bool)

(declare-fun res!540670 () Bool)

(assert (=> b!796154 (=> (not res!540670) (not e!441802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796154 (= res!540670 (validKeyInArray!0 k0!2044))))

(declare-fun b!796155 () Bool)

(declare-fun res!540667 () Bool)

(assert (=> b!796155 (=> (not res!540667) (not e!441802))))

(assert (=> b!796155 (= res!540667 (and (= (size!21137 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21137 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21137 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796156 () Bool)

(declare-fun res!540672 () Bool)

(assert (=> b!796156 (=> (not res!540672) (not e!441803))))

(assert (=> b!796156 (= res!540672 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21137 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20716 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21137 a!3170)) (= (select (arr!20716 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796157 () Bool)

(declare-fun res!540675 () Bool)

(assert (=> b!796157 (=> (not res!540675) (not e!441802))))

(assert (=> b!796157 (= res!540675 (validKeyInArray!0 (select (arr!20716 a!3170) j!153)))))

(declare-fun b!796158 () Bool)

(declare-fun res!540668 () Bool)

(assert (=> b!796158 (=> (not res!540668) (not e!441803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43272 (_ BitVec 32)) Bool)

(assert (=> b!796158 (= res!540668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68482 res!540669) b!796155))

(assert (= (and b!796155 res!540667) b!796157))

(assert (= (and b!796157 res!540675) b!796154))

(assert (= (and b!796154 res!540670) b!796152))

(assert (= (and b!796152 res!540673) b!796153))

(assert (= (and b!796153 res!540676) b!796158))

(assert (= (and b!796158 res!540668) b!796148))

(assert (= (and b!796148 res!540671) b!796156))

(assert (= (and b!796156 res!540672) b!796149))

(assert (= (and b!796149 res!540677) b!796150))

(assert (= (and b!796150 res!540674) b!796151))

(declare-fun m!736907 () Bool)

(assert (=> b!796152 m!736907))

(declare-fun m!736909 () Bool)

(assert (=> b!796149 m!736909))

(declare-fun m!736911 () Bool)

(assert (=> b!796149 m!736911))

(declare-fun m!736913 () Bool)

(assert (=> b!796149 m!736913))

(declare-fun m!736915 () Bool)

(assert (=> b!796149 m!736915))

(declare-fun m!736917 () Bool)

(assert (=> b!796157 m!736917))

(assert (=> b!796157 m!736917))

(declare-fun m!736919 () Bool)

(assert (=> b!796157 m!736919))

(declare-fun m!736921 () Bool)

(assert (=> b!796154 m!736921))

(declare-fun m!736923 () Bool)

(assert (=> start!68482 m!736923))

(declare-fun m!736925 () Bool)

(assert (=> start!68482 m!736925))

(declare-fun m!736927 () Bool)

(assert (=> b!796153 m!736927))

(declare-fun m!736929 () Bool)

(assert (=> b!796148 m!736929))

(declare-fun m!736931 () Bool)

(assert (=> b!796158 m!736931))

(declare-fun m!736933 () Bool)

(assert (=> b!796156 m!736933))

(declare-fun m!736935 () Bool)

(assert (=> b!796156 m!736935))

(declare-fun m!736937 () Bool)

(assert (=> b!796150 m!736937))

(assert (=> b!796150 m!736917))

(assert (=> b!796150 m!736917))

(declare-fun m!736939 () Bool)

(assert (=> b!796150 m!736939))

(assert (=> b!796150 m!736917))

(declare-fun m!736941 () Bool)

(assert (=> b!796150 m!736941))

(check-sat (not b!796154) (not b!796152) (not b!796158) (not b!796153) (not b!796157) (not start!68482) (not b!796149) (not b!796150) (not b!796148))
(check-sat)
