; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68822 () Bool)

(assert start!68822)

(declare-fun b!799968 () Bool)

(declare-fun e!443740 () Bool)

(assert (=> b!799968 (= e!443740 false)))

(declare-datatypes ((SeekEntryResult!8344 0))(
  ( (MissingZero!8344 (index!35744 (_ BitVec 32))) (Found!8344 (index!35745 (_ BitVec 32))) (Intermediate!8344 (undefined!9156 Bool) (index!35746 (_ BitVec 32)) (x!66788 (_ BitVec 32))) (Undefined!8344) (MissingVacant!8344 (index!35747 (_ BitVec 32))) )
))
(declare-fun lt!357133 () SeekEntryResult!8344)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43444 0))(
  ( (array!43445 (arr!20797 (Array (_ BitVec 32) (_ BitVec 64))) (size!21217 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43444)

(declare-fun lt!357131 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43444 (_ BitVec 32)) SeekEntryResult!8344)

(assert (=> b!799968 (= lt!357133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357131 vacantBefore!23 (select (arr!20797 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799969 () Bool)

(declare-fun res!543949 () Bool)

(declare-fun e!443737 () Bool)

(assert (=> b!799969 (=> (not res!543949) (not e!443737))))

(declare-datatypes ((List!14667 0))(
  ( (Nil!14664) (Cons!14663 (h!15798 (_ BitVec 64)) (t!20974 List!14667)) )
))
(declare-fun arrayNoDuplicates!0 (array!43444 (_ BitVec 32) List!14667) Bool)

(assert (=> b!799969 (= res!543949 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14664))))

(declare-fun b!799970 () Bool)

(declare-fun res!543951 () Bool)

(declare-fun e!443738 () Bool)

(assert (=> b!799970 (=> (not res!543951) (not e!443738))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799970 (= res!543951 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!543940 () Bool)

(assert (=> start!68822 (=> (not res!543940) (not e!443738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68822 (= res!543940 (validMask!0 mask!3266))))

(assert (=> start!68822 e!443738))

(assert (=> start!68822 true))

(declare-fun array_inv!16656 (array!43444) Bool)

(assert (=> start!68822 (array_inv!16656 a!3170)))

(declare-fun b!799971 () Bool)

(declare-fun res!543947 () Bool)

(assert (=> b!799971 (=> (not res!543947) (not e!443738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799971 (= res!543947 (validKeyInArray!0 k0!2044))))

(declare-fun b!799972 () Bool)

(assert (=> b!799972 (= e!443738 e!443737)))

(declare-fun res!543943 () Bool)

(assert (=> b!799972 (=> (not res!543943) (not e!443737))))

(declare-fun lt!357129 () SeekEntryResult!8344)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799972 (= res!543943 (or (= lt!357129 (MissingZero!8344 i!1163)) (= lt!357129 (MissingVacant!8344 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43444 (_ BitVec 32)) SeekEntryResult!8344)

(assert (=> b!799972 (= lt!357129 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799973 () Bool)

(declare-fun res!543948 () Bool)

(assert (=> b!799973 (=> (not res!543948) (not e!443738))))

(assert (=> b!799973 (= res!543948 (validKeyInArray!0 (select (arr!20797 a!3170) j!153)))))

(declare-fun b!799974 () Bool)

(declare-fun res!543950 () Bool)

(assert (=> b!799974 (=> (not res!543950) (not e!443737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43444 (_ BitVec 32)) Bool)

(assert (=> b!799974 (= res!543950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799975 () Bool)

(declare-fun e!443735 () Bool)

(declare-fun e!443739 () Bool)

(assert (=> b!799975 (= e!443735 e!443739)))

(declare-fun res!543939 () Bool)

(assert (=> b!799975 (=> (not res!543939) (not e!443739))))

(declare-fun lt!357132 () SeekEntryResult!8344)

(declare-fun lt!357130 () SeekEntryResult!8344)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799975 (= res!543939 (and (= lt!357132 lt!357130) (= lt!357130 (Found!8344 j!153)) (not (= (select (arr!20797 a!3170) index!1236) (select (arr!20797 a!3170) j!153)))))))

(assert (=> b!799975 (= lt!357130 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20797 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799975 (= lt!357132 (seekEntryOrOpen!0 (select (arr!20797 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799976 () Bool)

(assert (=> b!799976 (= e!443737 e!443735)))

(declare-fun res!543946 () Bool)

(assert (=> b!799976 (=> (not res!543946) (not e!443735))))

(declare-fun lt!357128 () array!43444)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357134 () SeekEntryResult!8344)

(declare-fun lt!357127 () (_ BitVec 64))

(assert (=> b!799976 (= res!543946 (= lt!357134 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357127 lt!357128 mask!3266)))))

(assert (=> b!799976 (= lt!357134 (seekEntryOrOpen!0 lt!357127 lt!357128 mask!3266))))

(assert (=> b!799976 (= lt!357127 (select (store (arr!20797 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799976 (= lt!357128 (array!43445 (store (arr!20797 a!3170) i!1163 k0!2044) (size!21217 a!3170)))))

(declare-fun b!799977 () Bool)

(declare-fun res!543942 () Bool)

(assert (=> b!799977 (=> (not res!543942) (not e!443740))))

(assert (=> b!799977 (= res!543942 (= lt!357134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357131 vacantAfter!23 lt!357127 lt!357128 mask!3266)))))

(declare-fun b!799978 () Bool)

(declare-fun res!543945 () Bool)

(assert (=> b!799978 (=> (not res!543945) (not e!443738))))

(assert (=> b!799978 (= res!543945 (and (= (size!21217 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21217 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21217 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799979 () Bool)

(declare-fun res!543941 () Bool)

(assert (=> b!799979 (=> (not res!543941) (not e!443737))))

(assert (=> b!799979 (= res!543941 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21217 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20797 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21217 a!3170)) (= (select (arr!20797 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799980 () Bool)

(assert (=> b!799980 (= e!443739 e!443740)))

(declare-fun res!543944 () Bool)

(assert (=> b!799980 (=> (not res!543944) (not e!443740))))

(assert (=> b!799980 (= res!543944 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357131 #b00000000000000000000000000000000) (bvslt lt!357131 (size!21217 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799980 (= lt!357131 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!68822 res!543940) b!799978))

(assert (= (and b!799978 res!543945) b!799973))

(assert (= (and b!799973 res!543948) b!799971))

(assert (= (and b!799971 res!543947) b!799970))

(assert (= (and b!799970 res!543951) b!799972))

(assert (= (and b!799972 res!543943) b!799974))

(assert (= (and b!799974 res!543950) b!799969))

(assert (= (and b!799969 res!543949) b!799979))

(assert (= (and b!799979 res!543941) b!799976))

(assert (= (and b!799976 res!543946) b!799975))

(assert (= (and b!799975 res!543939) b!799980))

(assert (= (and b!799980 res!543944) b!799977))

(assert (= (and b!799977 res!543942) b!799968))

(declare-fun m!741319 () Bool)

(assert (=> b!799979 m!741319))

(declare-fun m!741321 () Bool)

(assert (=> b!799979 m!741321))

(declare-fun m!741323 () Bool)

(assert (=> b!799970 m!741323))

(declare-fun m!741325 () Bool)

(assert (=> b!799976 m!741325))

(declare-fun m!741327 () Bool)

(assert (=> b!799976 m!741327))

(declare-fun m!741329 () Bool)

(assert (=> b!799976 m!741329))

(declare-fun m!741331 () Bool)

(assert (=> b!799976 m!741331))

(declare-fun m!741333 () Bool)

(assert (=> b!799973 m!741333))

(assert (=> b!799973 m!741333))

(declare-fun m!741335 () Bool)

(assert (=> b!799973 m!741335))

(declare-fun m!741337 () Bool)

(assert (=> b!799969 m!741337))

(declare-fun m!741339 () Bool)

(assert (=> b!799972 m!741339))

(declare-fun m!741341 () Bool)

(assert (=> b!799975 m!741341))

(assert (=> b!799975 m!741333))

(assert (=> b!799975 m!741333))

(declare-fun m!741343 () Bool)

(assert (=> b!799975 m!741343))

(assert (=> b!799975 m!741333))

(declare-fun m!741345 () Bool)

(assert (=> b!799975 m!741345))

(assert (=> b!799968 m!741333))

(assert (=> b!799968 m!741333))

(declare-fun m!741347 () Bool)

(assert (=> b!799968 m!741347))

(declare-fun m!741349 () Bool)

(assert (=> b!799980 m!741349))

(declare-fun m!741351 () Bool)

(assert (=> b!799971 m!741351))

(declare-fun m!741353 () Bool)

(assert (=> start!68822 m!741353))

(declare-fun m!741355 () Bool)

(assert (=> start!68822 m!741355))

(declare-fun m!741357 () Bool)

(assert (=> b!799974 m!741357))

(declare-fun m!741359 () Bool)

(assert (=> b!799977 m!741359))

(check-sat (not b!799976) (not b!799974) (not b!799972) (not b!799973) (not b!799975) (not b!799977) (not b!799980) (not b!799969) (not b!799970) (not start!68822) (not b!799968) (not b!799971))
(check-sat)
