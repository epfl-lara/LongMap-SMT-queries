; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69190 () Bool)

(assert start!69190)

(declare-fun b!806975 () Bool)

(declare-fun res!551106 () Bool)

(declare-fun e!446841 () Bool)

(assert (=> b!806975 (=> (not res!551106) (not e!446841))))

(declare-datatypes ((array!43890 0))(
  ( (array!43891 (arr!21022 (Array (_ BitVec 32) (_ BitVec 64))) (size!21443 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43890)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43890 (_ BitVec 32)) Bool)

(assert (=> b!806975 (= res!551106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806976 () Bool)

(declare-fun e!446842 () Bool)

(assert (=> b!806976 (= e!446841 e!446842)))

(declare-fun res!551098 () Bool)

(assert (=> b!806976 (=> (not res!551098) (not e!446842))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361476 () array!43890)

(declare-fun lt!361477 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8613 0))(
  ( (MissingZero!8613 (index!36820 (_ BitVec 32))) (Found!8613 (index!36821 (_ BitVec 32))) (Intermediate!8613 (undefined!9425 Bool) (index!36822 (_ BitVec 32)) (x!67633 (_ BitVec 32))) (Undefined!8613) (MissingVacant!8613 (index!36823 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43890 (_ BitVec 32)) SeekEntryResult!8613)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43890 (_ BitVec 32)) SeekEntryResult!8613)

(assert (=> b!806976 (= res!551098 (= (seekEntryOrOpen!0 lt!361477 lt!361476 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361477 lt!361476 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806976 (= lt!361477 (select (store (arr!21022 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806976 (= lt!361476 (array!43891 (store (arr!21022 a!3170) i!1163 k0!2044) (size!21443 a!3170)))))

(declare-fun b!806978 () Bool)

(declare-fun e!446843 () Bool)

(assert (=> b!806978 (= e!446843 false)))

(declare-fun lt!361479 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806978 (= lt!361479 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!806979 () Bool)

(declare-fun res!551108 () Bool)

(assert (=> b!806979 (=> (not res!551108) (not e!446841))))

(declare-datatypes ((List!14985 0))(
  ( (Nil!14982) (Cons!14981 (h!16110 (_ BitVec 64)) (t!21300 List!14985)) )
))
(declare-fun arrayNoDuplicates!0 (array!43890 (_ BitVec 32) List!14985) Bool)

(assert (=> b!806979 (= res!551108 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14982))))

(declare-fun b!806980 () Bool)

(declare-fun res!551105 () Bool)

(declare-fun e!446839 () Bool)

(assert (=> b!806980 (=> (not res!551105) (not e!446839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806980 (= res!551105 (validKeyInArray!0 k0!2044))))

(declare-fun b!806981 () Bool)

(declare-fun res!551100 () Bool)

(assert (=> b!806981 (=> (not res!551100) (not e!446839))))

(assert (=> b!806981 (= res!551100 (validKeyInArray!0 (select (arr!21022 a!3170) j!153)))))

(declare-fun b!806982 () Bool)

(assert (=> b!806982 (= e!446842 e!446843)))

(declare-fun res!551099 () Bool)

(assert (=> b!806982 (=> (not res!551099) (not e!446843))))

(declare-fun lt!361478 () SeekEntryResult!8613)

(declare-fun lt!361480 () SeekEntryResult!8613)

(assert (=> b!806982 (= res!551099 (and (= lt!361480 lt!361478) (= lt!361478 (Found!8613 j!153)) (not (= (select (arr!21022 a!3170) index!1236) (select (arr!21022 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806982 (= lt!361478 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21022 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806982 (= lt!361480 (seekEntryOrOpen!0 (select (arr!21022 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806983 () Bool)

(assert (=> b!806983 (= e!446839 e!446841)))

(declare-fun res!551101 () Bool)

(assert (=> b!806983 (=> (not res!551101) (not e!446841))))

(declare-fun lt!361481 () SeekEntryResult!8613)

(assert (=> b!806983 (= res!551101 (or (= lt!361481 (MissingZero!8613 i!1163)) (= lt!361481 (MissingVacant!8613 i!1163))))))

(assert (=> b!806983 (= lt!361481 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!551103 () Bool)

(assert (=> start!69190 (=> (not res!551103) (not e!446839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69190 (= res!551103 (validMask!0 mask!3266))))

(assert (=> start!69190 e!446839))

(assert (=> start!69190 true))

(declare-fun array_inv!16818 (array!43890) Bool)

(assert (=> start!69190 (array_inv!16818 a!3170)))

(declare-fun b!806977 () Bool)

(declare-fun res!551107 () Bool)

(assert (=> b!806977 (=> (not res!551107) (not e!446841))))

(assert (=> b!806977 (= res!551107 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21443 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21022 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21443 a!3170)) (= (select (arr!21022 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806984 () Bool)

(declare-fun res!551104 () Bool)

(assert (=> b!806984 (=> (not res!551104) (not e!446839))))

(assert (=> b!806984 (= res!551104 (and (= (size!21443 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21443 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21443 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806985 () Bool)

(declare-fun res!551102 () Bool)

(assert (=> b!806985 (=> (not res!551102) (not e!446839))))

(declare-fun arrayContainsKey!0 (array!43890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806985 (= res!551102 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69190 res!551103) b!806984))

(assert (= (and b!806984 res!551104) b!806981))

(assert (= (and b!806981 res!551100) b!806980))

(assert (= (and b!806980 res!551105) b!806985))

(assert (= (and b!806985 res!551102) b!806983))

(assert (= (and b!806983 res!551101) b!806975))

(assert (= (and b!806975 res!551106) b!806979))

(assert (= (and b!806979 res!551108) b!806977))

(assert (= (and b!806977 res!551107) b!806976))

(assert (= (and b!806976 res!551098) b!806982))

(assert (= (and b!806982 res!551099) b!806978))

(declare-fun m!748939 () Bool)

(assert (=> b!806981 m!748939))

(assert (=> b!806981 m!748939))

(declare-fun m!748941 () Bool)

(assert (=> b!806981 m!748941))

(declare-fun m!748943 () Bool)

(assert (=> b!806975 m!748943))

(declare-fun m!748945 () Bool)

(assert (=> b!806979 m!748945))

(declare-fun m!748947 () Bool)

(assert (=> start!69190 m!748947))

(declare-fun m!748949 () Bool)

(assert (=> start!69190 m!748949))

(declare-fun m!748951 () Bool)

(assert (=> b!806977 m!748951))

(declare-fun m!748953 () Bool)

(assert (=> b!806977 m!748953))

(declare-fun m!748955 () Bool)

(assert (=> b!806983 m!748955))

(declare-fun m!748957 () Bool)

(assert (=> b!806982 m!748957))

(assert (=> b!806982 m!748939))

(assert (=> b!806982 m!748939))

(declare-fun m!748959 () Bool)

(assert (=> b!806982 m!748959))

(assert (=> b!806982 m!748939))

(declare-fun m!748961 () Bool)

(assert (=> b!806982 m!748961))

(declare-fun m!748963 () Bool)

(assert (=> b!806976 m!748963))

(declare-fun m!748965 () Bool)

(assert (=> b!806976 m!748965))

(declare-fun m!748967 () Bool)

(assert (=> b!806976 m!748967))

(declare-fun m!748969 () Bool)

(assert (=> b!806976 m!748969))

(declare-fun m!748971 () Bool)

(assert (=> b!806978 m!748971))

(declare-fun m!748973 () Bool)

(assert (=> b!806980 m!748973))

(declare-fun m!748975 () Bool)

(assert (=> b!806985 m!748975))

(check-sat (not b!806983) (not b!806978) (not b!806979) (not b!806985) (not b!806982) (not b!806981) (not b!806980) (not b!806976) (not start!69190) (not b!806975))
(check-sat)
