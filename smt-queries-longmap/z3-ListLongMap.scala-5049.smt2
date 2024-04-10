; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68806 () Bool)

(assert start!68806)

(declare-fun b!801980 () Bool)

(declare-fun e!444502 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801980 (= e!444502 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-datatypes ((array!43596 0))(
  ( (array!43597 (arr!20878 (Array (_ BitVec 32) (_ BitVec 64))) (size!21299 (_ BitVec 32))) )
))
(declare-fun lt!358562 () array!43596)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358567 () (_ BitVec 32))

(declare-fun lt!358565 () (_ BitVec 64))

(declare-fun a!3170 () array!43596)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8469 0))(
  ( (MissingZero!8469 (index!36244 (_ BitVec 32))) (Found!8469 (index!36245 (_ BitVec 32))) (Intermediate!8469 (undefined!9281 Bool) (index!36246 (_ BitVec 32)) (x!67099 (_ BitVec 32))) (Undefined!8469) (MissingVacant!8469 (index!36247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43596 (_ BitVec 32)) SeekEntryResult!8469)

(assert (=> b!801980 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358567 vacantAfter!23 lt!358565 lt!358562 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358567 vacantBefore!23 (select (arr!20878 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27478 0))(
  ( (Unit!27479) )
))
(declare-fun lt!358563 () Unit!27478)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43596 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27478)

(assert (=> b!801980 (= lt!358563 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358567 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801980 (= lt!358567 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801981 () Bool)

(declare-fun res!546503 () Bool)

(declare-fun e!444501 () Bool)

(assert (=> b!801981 (=> (not res!546503) (not e!444501))))

(assert (=> b!801981 (= res!546503 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21299 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20878 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21299 a!3170)) (= (select (arr!20878 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801982 () Bool)

(declare-fun res!546506 () Bool)

(declare-fun e!444499 () Bool)

(assert (=> b!801982 (=> (not res!546506) (not e!444499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801982 (= res!546506 (validKeyInArray!0 k0!2044))))

(declare-fun b!801984 () Bool)

(declare-fun res!546499 () Bool)

(assert (=> b!801984 (=> (not res!546499) (not e!444499))))

(declare-fun arrayContainsKey!0 (array!43596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801984 (= res!546499 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801985 () Bool)

(declare-fun res!546500 () Bool)

(assert (=> b!801985 (=> (not res!546500) (not e!444501))))

(declare-datatypes ((List!14841 0))(
  ( (Nil!14838) (Cons!14837 (h!15966 (_ BitVec 64)) (t!21156 List!14841)) )
))
(declare-fun arrayNoDuplicates!0 (array!43596 (_ BitVec 32) List!14841) Bool)

(assert (=> b!801985 (= res!546500 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14838))))

(declare-fun b!801986 () Bool)

(declare-fun e!444500 () Bool)

(assert (=> b!801986 (= e!444501 e!444500)))

(declare-fun res!546505 () Bool)

(assert (=> b!801986 (=> (not res!546505) (not e!444500))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43596 (_ BitVec 32)) SeekEntryResult!8469)

(assert (=> b!801986 (= res!546505 (= (seekEntryOrOpen!0 lt!358565 lt!358562 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358565 lt!358562 mask!3266)))))

(assert (=> b!801986 (= lt!358565 (select (store (arr!20878 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801986 (= lt!358562 (array!43597 (store (arr!20878 a!3170) i!1163 k0!2044) (size!21299 a!3170)))))

(declare-fun b!801987 () Bool)

(assert (=> b!801987 (= e!444499 e!444501)))

(declare-fun res!546501 () Bool)

(assert (=> b!801987 (=> (not res!546501) (not e!444501))))

(declare-fun lt!358566 () SeekEntryResult!8469)

(assert (=> b!801987 (= res!546501 (or (= lt!358566 (MissingZero!8469 i!1163)) (= lt!358566 (MissingVacant!8469 i!1163))))))

(assert (=> b!801987 (= lt!358566 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801988 () Bool)

(declare-fun res!546509 () Bool)

(assert (=> b!801988 (=> (not res!546509) (not e!444501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43596 (_ BitVec 32)) Bool)

(assert (=> b!801988 (= res!546509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801989 () Bool)

(declare-fun res!546508 () Bool)

(assert (=> b!801989 (=> (not res!546508) (not e!444499))))

(assert (=> b!801989 (= res!546508 (validKeyInArray!0 (select (arr!20878 a!3170) j!153)))))

(declare-fun b!801990 () Bool)

(assert (=> b!801990 (= e!444500 e!444502)))

(declare-fun res!546507 () Bool)

(assert (=> b!801990 (=> (not res!546507) (not e!444502))))

(declare-fun lt!358568 () SeekEntryResult!8469)

(declare-fun lt!358564 () SeekEntryResult!8469)

(assert (=> b!801990 (= res!546507 (and (= lt!358568 lt!358564) (= lt!358564 (Found!8469 j!153)) (not (= (select (arr!20878 a!3170) index!1236) (select (arr!20878 a!3170) j!153)))))))

(assert (=> b!801990 (= lt!358564 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20878 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801990 (= lt!358568 (seekEntryOrOpen!0 (select (arr!20878 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!546504 () Bool)

(assert (=> start!68806 (=> (not res!546504) (not e!444499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68806 (= res!546504 (validMask!0 mask!3266))))

(assert (=> start!68806 e!444499))

(assert (=> start!68806 true))

(declare-fun array_inv!16674 (array!43596) Bool)

(assert (=> start!68806 (array_inv!16674 a!3170)))

(declare-fun b!801983 () Bool)

(declare-fun res!546502 () Bool)

(assert (=> b!801983 (=> (not res!546502) (not e!444499))))

(assert (=> b!801983 (= res!546502 (and (= (size!21299 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21299 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21299 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68806 res!546504) b!801983))

(assert (= (and b!801983 res!546502) b!801989))

(assert (= (and b!801989 res!546508) b!801982))

(assert (= (and b!801982 res!546506) b!801984))

(assert (= (and b!801984 res!546499) b!801987))

(assert (= (and b!801987 res!546501) b!801988))

(assert (= (and b!801988 res!546509) b!801985))

(assert (= (and b!801985 res!546500) b!801981))

(assert (= (and b!801981 res!546503) b!801986))

(assert (= (and b!801986 res!546505) b!801990))

(assert (= (and b!801990 res!546507) b!801980))

(declare-fun m!743275 () Bool)

(assert (=> b!801987 m!743275))

(declare-fun m!743277 () Bool)

(assert (=> b!801984 m!743277))

(declare-fun m!743279 () Bool)

(assert (=> b!801981 m!743279))

(declare-fun m!743281 () Bool)

(assert (=> b!801981 m!743281))

(declare-fun m!743283 () Bool)

(assert (=> start!68806 m!743283))

(declare-fun m!743285 () Bool)

(assert (=> start!68806 m!743285))

(declare-fun m!743287 () Bool)

(assert (=> b!801982 m!743287))

(declare-fun m!743289 () Bool)

(assert (=> b!801990 m!743289))

(declare-fun m!743291 () Bool)

(assert (=> b!801990 m!743291))

(assert (=> b!801990 m!743291))

(declare-fun m!743293 () Bool)

(assert (=> b!801990 m!743293))

(assert (=> b!801990 m!743291))

(declare-fun m!743295 () Bool)

(assert (=> b!801990 m!743295))

(declare-fun m!743297 () Bool)

(assert (=> b!801988 m!743297))

(assert (=> b!801989 m!743291))

(assert (=> b!801989 m!743291))

(declare-fun m!743299 () Bool)

(assert (=> b!801989 m!743299))

(declare-fun m!743301 () Bool)

(assert (=> b!801986 m!743301))

(declare-fun m!743303 () Bool)

(assert (=> b!801986 m!743303))

(declare-fun m!743305 () Bool)

(assert (=> b!801986 m!743305))

(declare-fun m!743307 () Bool)

(assert (=> b!801986 m!743307))

(assert (=> b!801980 m!743291))

(declare-fun m!743309 () Bool)

(assert (=> b!801980 m!743309))

(declare-fun m!743311 () Bool)

(assert (=> b!801980 m!743311))

(declare-fun m!743313 () Bool)

(assert (=> b!801980 m!743313))

(assert (=> b!801980 m!743291))

(declare-fun m!743315 () Bool)

(assert (=> b!801980 m!743315))

(declare-fun m!743317 () Bool)

(assert (=> b!801985 m!743317))

(check-sat (not b!801988) (not b!801984) (not b!801986) (not b!801990) (not b!801985) (not b!801989) (not b!801980) (not b!801982) (not b!801987) (not start!68806))
(check-sat)
