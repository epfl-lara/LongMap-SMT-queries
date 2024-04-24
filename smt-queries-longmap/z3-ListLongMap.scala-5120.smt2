; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69710 () Bool)

(assert start!69710)

(declare-fun b!811238 () Bool)

(declare-fun res!553969 () Bool)

(declare-fun e!449134 () Bool)

(assert (=> b!811238 (=> (not res!553969) (not e!449134))))

(declare-datatypes ((array!44038 0))(
  ( (array!44039 (arr!21085 (Array (_ BitVec 32) (_ BitVec 64))) (size!21505 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44038)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811238 (= res!553969 (validKeyInArray!0 (select (arr!21085 a!3170) j!153)))))

(declare-fun b!811239 () Bool)

(declare-fun res!553974 () Bool)

(assert (=> b!811239 (=> (not res!553974) (not e!449134))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811239 (= res!553974 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811240 () Bool)

(declare-fun e!449133 () Bool)

(declare-fun e!449130 () Bool)

(assert (=> b!811240 (= e!449133 e!449130)))

(declare-fun res!553975 () Bool)

(assert (=> b!811240 (=> (not res!553975) (not e!449130))))

(declare-datatypes ((SeekEntryResult!8632 0))(
  ( (MissingZero!8632 (index!36896 (_ BitVec 32))) (Found!8632 (index!36897 (_ BitVec 32))) (Intermediate!8632 (undefined!9444 Bool) (index!36898 (_ BitVec 32)) (x!67874 (_ BitVec 32))) (Undefined!8632) (MissingVacant!8632 (index!36899 (_ BitVec 32))) )
))
(declare-fun lt!363523 () SeekEntryResult!8632)

(declare-fun lt!363520 () SeekEntryResult!8632)

(assert (=> b!811240 (= res!553975 (= lt!363523 lt!363520))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44038 (_ BitVec 32)) SeekEntryResult!8632)

(assert (=> b!811240 (= lt!363520 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44038 (_ BitVec 32)) SeekEntryResult!8632)

(assert (=> b!811240 (= lt!363523 (seekEntryOrOpen!0 (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811241 () Bool)

(declare-fun res!553980 () Bool)

(assert (=> b!811241 (=> (not res!553980) (not e!449134))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811241 (= res!553980 (and (= (size!21505 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21505 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21505 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811242 () Bool)

(declare-fun res!553977 () Bool)

(declare-fun e!449128 () Bool)

(assert (=> b!811242 (=> (not res!553977) (not e!449128))))

(declare-fun lt!363521 () (_ BitVec 32))

(declare-fun lt!363527 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363519 () SeekEntryResult!8632)

(declare-fun lt!363524 () array!44038)

(assert (=> b!811242 (= res!553977 (= lt!363519 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363521 vacantAfter!23 lt!363527 lt!363524 mask!3266)))))

(declare-fun b!811243 () Bool)

(declare-fun e!449131 () Bool)

(assert (=> b!811243 (= e!449134 e!449131)))

(declare-fun res!553979 () Bool)

(assert (=> b!811243 (=> (not res!553979) (not e!449131))))

(declare-fun lt!363525 () SeekEntryResult!8632)

(assert (=> b!811243 (= res!553979 (or (= lt!363525 (MissingZero!8632 i!1163)) (= lt!363525 (MissingVacant!8632 i!1163))))))

(assert (=> b!811243 (= lt!363525 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811244 () Bool)

(declare-fun res!553973 () Bool)

(assert (=> b!811244 (=> (not res!553973) (not e!449131))))

(declare-datatypes ((List!14955 0))(
  ( (Nil!14952) (Cons!14951 (h!16086 (_ BitVec 64)) (t!21262 List!14955)) )
))
(declare-fun arrayNoDuplicates!0 (array!44038 (_ BitVec 32) List!14955) Bool)

(assert (=> b!811244 (= res!553973 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14952))))

(declare-fun b!811245 () Bool)

(assert (=> b!811245 (= e!449131 e!449133)))

(declare-fun res!553976 () Bool)

(assert (=> b!811245 (=> (not res!553976) (not e!449133))))

(assert (=> b!811245 (= res!553976 (= lt!363519 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363527 lt!363524 mask!3266)))))

(assert (=> b!811245 (= lt!363519 (seekEntryOrOpen!0 lt!363527 lt!363524 mask!3266))))

(assert (=> b!811245 (= lt!363527 (select (store (arr!21085 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811245 (= lt!363524 (array!44039 (store (arr!21085 a!3170) i!1163 k0!2044) (size!21505 a!3170)))))

(declare-fun b!811246 () Bool)

(declare-fun res!553978 () Bool)

(assert (=> b!811246 (=> (not res!553978) (not e!449134))))

(assert (=> b!811246 (= res!553978 (validKeyInArray!0 k0!2044))))

(declare-fun b!811247 () Bool)

(declare-fun e!449129 () Bool)

(assert (=> b!811247 (= e!449130 e!449129)))

(declare-fun res!553970 () Bool)

(assert (=> b!811247 (=> (not res!553970) (not e!449129))))

(declare-fun lt!363526 () SeekEntryResult!8632)

(assert (=> b!811247 (= res!553970 (and (= lt!363520 lt!363526) (not (= (select (arr!21085 a!3170) index!1236) (select (arr!21085 a!3170) j!153)))))))

(assert (=> b!811247 (= lt!363526 (Found!8632 j!153))))

(declare-fun lt!363522 () SeekEntryResult!8632)

(declare-fun b!811248 () Bool)

(assert (=> b!811248 (= e!449128 (and (= lt!363523 lt!363522) (not (= lt!363522 lt!363526))))))

(assert (=> b!811248 (= lt!363522 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363521 vacantBefore!23 (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811249 () Bool)

(assert (=> b!811249 (= e!449129 e!449128)))

(declare-fun res!553968 () Bool)

(assert (=> b!811249 (=> (not res!553968) (not e!449128))))

(assert (=> b!811249 (= res!553968 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363521 #b00000000000000000000000000000000) (bvslt lt!363521 (size!21505 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811249 (= lt!363521 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!811250 () Bool)

(declare-fun res!553972 () Bool)

(assert (=> b!811250 (=> (not res!553972) (not e!449131))))

(assert (=> b!811250 (= res!553972 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21505 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21085 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21505 a!3170)) (= (select (arr!21085 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!553967 () Bool)

(assert (=> start!69710 (=> (not res!553967) (not e!449134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69710 (= res!553967 (validMask!0 mask!3266))))

(assert (=> start!69710 e!449134))

(assert (=> start!69710 true))

(declare-fun array_inv!16944 (array!44038) Bool)

(assert (=> start!69710 (array_inv!16944 a!3170)))

(declare-fun b!811251 () Bool)

(declare-fun res!553971 () Bool)

(assert (=> b!811251 (=> (not res!553971) (not e!449131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44038 (_ BitVec 32)) Bool)

(assert (=> b!811251 (= res!553971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69710 res!553967) b!811241))

(assert (= (and b!811241 res!553980) b!811238))

(assert (= (and b!811238 res!553969) b!811246))

(assert (= (and b!811246 res!553978) b!811239))

(assert (= (and b!811239 res!553974) b!811243))

(assert (= (and b!811243 res!553979) b!811251))

(assert (= (and b!811251 res!553971) b!811244))

(assert (= (and b!811244 res!553973) b!811250))

(assert (= (and b!811250 res!553972) b!811245))

(assert (= (and b!811245 res!553976) b!811240))

(assert (= (and b!811240 res!553975) b!811247))

(assert (= (and b!811247 res!553970) b!811249))

(assert (= (and b!811249 res!553968) b!811242))

(assert (= (and b!811242 res!553977) b!811248))

(declare-fun m!753817 () Bool)

(assert (=> b!811250 m!753817))

(declare-fun m!753819 () Bool)

(assert (=> b!811250 m!753819))

(declare-fun m!753821 () Bool)

(assert (=> b!811249 m!753821))

(declare-fun m!753823 () Bool)

(assert (=> b!811251 m!753823))

(declare-fun m!753825 () Bool)

(assert (=> b!811247 m!753825))

(declare-fun m!753827 () Bool)

(assert (=> b!811247 m!753827))

(declare-fun m!753829 () Bool)

(assert (=> start!69710 m!753829))

(declare-fun m!753831 () Bool)

(assert (=> start!69710 m!753831))

(declare-fun m!753833 () Bool)

(assert (=> b!811246 m!753833))

(assert (=> b!811238 m!753827))

(assert (=> b!811238 m!753827))

(declare-fun m!753835 () Bool)

(assert (=> b!811238 m!753835))

(declare-fun m!753837 () Bool)

(assert (=> b!811239 m!753837))

(declare-fun m!753839 () Bool)

(assert (=> b!811244 m!753839))

(assert (=> b!811248 m!753827))

(assert (=> b!811248 m!753827))

(declare-fun m!753841 () Bool)

(assert (=> b!811248 m!753841))

(declare-fun m!753843 () Bool)

(assert (=> b!811245 m!753843))

(declare-fun m!753845 () Bool)

(assert (=> b!811245 m!753845))

(declare-fun m!753847 () Bool)

(assert (=> b!811245 m!753847))

(declare-fun m!753849 () Bool)

(assert (=> b!811245 m!753849))

(assert (=> b!811240 m!753827))

(assert (=> b!811240 m!753827))

(declare-fun m!753851 () Bool)

(assert (=> b!811240 m!753851))

(assert (=> b!811240 m!753827))

(declare-fun m!753853 () Bool)

(assert (=> b!811240 m!753853))

(declare-fun m!753855 () Bool)

(assert (=> b!811243 m!753855))

(declare-fun m!753857 () Bool)

(assert (=> b!811242 m!753857))

(check-sat (not b!811242) (not b!811243) (not b!811246) (not b!811240) (not b!811248) (not b!811249) (not b!811245) (not start!69710) (not b!811238) (not b!811239) (not b!811251) (not b!811244))
(check-sat)
