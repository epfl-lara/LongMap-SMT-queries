; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69728 () Bool)

(assert start!69728)

(declare-fun res!554320 () Bool)

(declare-fun e!449298 () Bool)

(assert (=> start!69728 (=> (not res!554320) (not e!449298))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69728 (= res!554320 (validMask!0 mask!3266))))

(assert (=> start!69728 e!449298))

(assert (=> start!69728 true))

(declare-datatypes ((array!44056 0))(
  ( (array!44057 (arr!21094 (Array (_ BitVec 32) (_ BitVec 64))) (size!21514 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44056)

(declare-fun array_inv!16953 (array!44056) Bool)

(assert (=> start!69728 (array_inv!16953 a!3170)))

(declare-fun b!811583 () Bool)

(declare-fun res!554322 () Bool)

(assert (=> b!811583 (=> (not res!554322) (not e!449298))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811583 (= res!554322 (and (= (size!21514 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21514 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21514 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811584 () Bool)

(declare-fun res!554312 () Bool)

(declare-fun e!449299 () Bool)

(assert (=> b!811584 (=> (not res!554312) (not e!449299))))

(declare-datatypes ((List!14964 0))(
  ( (Nil!14961) (Cons!14960 (h!16095 (_ BitVec 64)) (t!21271 List!14964)) )
))
(declare-fun arrayNoDuplicates!0 (array!44056 (_ BitVec 32) List!14964) Bool)

(assert (=> b!811584 (= res!554312 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14961))))

(declare-fun b!811585 () Bool)

(declare-fun e!449296 () Bool)

(assert (=> b!811585 (= e!449296 (not true))))

(declare-fun lt!363740 () array!44056)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363745 () (_ BitVec 64))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!363743 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8641 0))(
  ( (MissingZero!8641 (index!36932 (_ BitVec 32))) (Found!8641 (index!36933 (_ BitVec 32))) (Intermediate!8641 (undefined!9453 Bool) (index!36934 (_ BitVec 32)) (x!67907 (_ BitVec 32))) (Undefined!8641) (MissingVacant!8641 (index!36935 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44056 (_ BitVec 32)) SeekEntryResult!8641)

(assert (=> b!811585 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363743 vacantAfter!23 lt!363745 lt!363740 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363743 vacantBefore!23 (select (arr!21094 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27627 0))(
  ( (Unit!27628) )
))
(declare-fun lt!363742 () Unit!27627)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44056 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27627)

(assert (=> b!811585 (= lt!363742 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363743 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811585 (= lt!363743 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!811586 () Bool)

(declare-fun e!449297 () Bool)

(assert (=> b!811586 (= e!449297 e!449296)))

(declare-fun res!554321 () Bool)

(assert (=> b!811586 (=> (not res!554321) (not e!449296))))

(declare-fun lt!363744 () SeekEntryResult!8641)

(declare-fun lt!363741 () SeekEntryResult!8641)

(assert (=> b!811586 (= res!554321 (and (= lt!363741 lt!363744) (= lt!363744 (Found!8641 j!153)) (not (= (select (arr!21094 a!3170) index!1236) (select (arr!21094 a!3170) j!153)))))))

(assert (=> b!811586 (= lt!363744 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21094 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44056 (_ BitVec 32)) SeekEntryResult!8641)

(assert (=> b!811586 (= lt!363741 (seekEntryOrOpen!0 (select (arr!21094 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811587 () Bool)

(assert (=> b!811587 (= e!449298 e!449299)))

(declare-fun res!554315 () Bool)

(assert (=> b!811587 (=> (not res!554315) (not e!449299))))

(declare-fun lt!363746 () SeekEntryResult!8641)

(assert (=> b!811587 (= res!554315 (or (= lt!363746 (MissingZero!8641 i!1163)) (= lt!363746 (MissingVacant!8641 i!1163))))))

(assert (=> b!811587 (= lt!363746 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811588 () Bool)

(declare-fun res!554313 () Bool)

(assert (=> b!811588 (=> (not res!554313) (not e!449298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811588 (= res!554313 (validKeyInArray!0 (select (arr!21094 a!3170) j!153)))))

(declare-fun b!811589 () Bool)

(declare-fun res!554319 () Bool)

(assert (=> b!811589 (=> (not res!554319) (not e!449298))))

(declare-fun arrayContainsKey!0 (array!44056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811589 (= res!554319 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811590 () Bool)

(assert (=> b!811590 (= e!449299 e!449297)))

(declare-fun res!554314 () Bool)

(assert (=> b!811590 (=> (not res!554314) (not e!449297))))

(assert (=> b!811590 (= res!554314 (= (seekEntryOrOpen!0 lt!363745 lt!363740 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363745 lt!363740 mask!3266)))))

(assert (=> b!811590 (= lt!363745 (select (store (arr!21094 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811590 (= lt!363740 (array!44057 (store (arr!21094 a!3170) i!1163 k0!2044) (size!21514 a!3170)))))

(declare-fun b!811591 () Bool)

(declare-fun res!554317 () Bool)

(assert (=> b!811591 (=> (not res!554317) (not e!449299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44056 (_ BitVec 32)) Bool)

(assert (=> b!811591 (= res!554317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811592 () Bool)

(declare-fun res!554318 () Bool)

(assert (=> b!811592 (=> (not res!554318) (not e!449299))))

(assert (=> b!811592 (= res!554318 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21514 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21094 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21514 a!3170)) (= (select (arr!21094 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811593 () Bool)

(declare-fun res!554316 () Bool)

(assert (=> b!811593 (=> (not res!554316) (not e!449298))))

(assert (=> b!811593 (= res!554316 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69728 res!554320) b!811583))

(assert (= (and b!811583 res!554322) b!811588))

(assert (= (and b!811588 res!554313) b!811593))

(assert (= (and b!811593 res!554316) b!811589))

(assert (= (and b!811589 res!554319) b!811587))

(assert (= (and b!811587 res!554315) b!811591))

(assert (= (and b!811591 res!554317) b!811584))

(assert (= (and b!811584 res!554312) b!811592))

(assert (= (and b!811592 res!554318) b!811590))

(assert (= (and b!811590 res!554314) b!811586))

(assert (= (and b!811586 res!554321) b!811585))

(declare-fun m!754201 () Bool)

(assert (=> b!811585 m!754201))

(declare-fun m!754203 () Bool)

(assert (=> b!811585 m!754203))

(declare-fun m!754205 () Bool)

(assert (=> b!811585 m!754205))

(assert (=> b!811585 m!754201))

(declare-fun m!754207 () Bool)

(assert (=> b!811585 m!754207))

(declare-fun m!754209 () Bool)

(assert (=> b!811585 m!754209))

(assert (=> b!811588 m!754201))

(assert (=> b!811588 m!754201))

(declare-fun m!754211 () Bool)

(assert (=> b!811588 m!754211))

(declare-fun m!754213 () Bool)

(assert (=> b!811590 m!754213))

(declare-fun m!754215 () Bool)

(assert (=> b!811590 m!754215))

(declare-fun m!754217 () Bool)

(assert (=> b!811590 m!754217))

(declare-fun m!754219 () Bool)

(assert (=> b!811590 m!754219))

(declare-fun m!754221 () Bool)

(assert (=> b!811592 m!754221))

(declare-fun m!754223 () Bool)

(assert (=> b!811592 m!754223))

(declare-fun m!754225 () Bool)

(assert (=> b!811586 m!754225))

(assert (=> b!811586 m!754201))

(assert (=> b!811586 m!754201))

(declare-fun m!754227 () Bool)

(assert (=> b!811586 m!754227))

(assert (=> b!811586 m!754201))

(declare-fun m!754229 () Bool)

(assert (=> b!811586 m!754229))

(declare-fun m!754231 () Bool)

(assert (=> b!811593 m!754231))

(declare-fun m!754233 () Bool)

(assert (=> start!69728 m!754233))

(declare-fun m!754235 () Bool)

(assert (=> start!69728 m!754235))

(declare-fun m!754237 () Bool)

(assert (=> b!811591 m!754237))

(declare-fun m!754239 () Bool)

(assert (=> b!811589 m!754239))

(declare-fun m!754241 () Bool)

(assert (=> b!811587 m!754241))

(declare-fun m!754243 () Bool)

(assert (=> b!811584 m!754243))

(check-sat (not b!811587) (not b!811591) (not b!811586) (not b!811589) (not b!811585) (not b!811593) (not start!69728) (not b!811590) (not b!811584) (not b!811588))
(check-sat)
