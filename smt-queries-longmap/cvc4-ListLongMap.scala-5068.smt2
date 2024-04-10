; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68922 () Bool)

(assert start!68922)

(declare-fun b!803984 () Bool)

(declare-fun res!548506 () Bool)

(declare-fun e!445461 () Bool)

(assert (=> b!803984 (=> (not res!548506) (not e!445461))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803984 (= res!548506 (validKeyInArray!0 k!2044))))

(declare-fun b!803985 () Bool)

(declare-fun res!548510 () Bool)

(assert (=> b!803985 (=> (not res!548510) (not e!445461))))

(declare-datatypes ((array!43712 0))(
  ( (array!43713 (arr!20936 (Array (_ BitVec 32) (_ BitVec 64))) (size!21357 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43712)

(declare-fun arrayContainsKey!0 (array!43712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803985 (= res!548510 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!548503 () Bool)

(assert (=> start!68922 (=> (not res!548503) (not e!445461))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68922 (= res!548503 (validMask!0 mask!3266))))

(assert (=> start!68922 e!445461))

(assert (=> start!68922 true))

(declare-fun array_inv!16732 (array!43712) Bool)

(assert (=> start!68922 (array_inv!16732 a!3170)))

(declare-fun b!803986 () Bool)

(declare-fun res!548504 () Bool)

(declare-fun e!445460 () Bool)

(assert (=> b!803986 (=> (not res!548504) (not e!445460))))

(declare-datatypes ((List!14899 0))(
  ( (Nil!14896) (Cons!14895 (h!16024 (_ BitVec 64)) (t!21214 List!14899)) )
))
(declare-fun arrayNoDuplicates!0 (array!43712 (_ BitVec 32) List!14899) Bool)

(assert (=> b!803986 (= res!548504 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14896))))

(declare-fun b!803987 () Bool)

(declare-fun e!445459 () Bool)

(assert (=> b!803987 (= e!445460 e!445459)))

(declare-fun res!548511 () Bool)

(assert (=> b!803987 (=> (not res!548511) (not e!445459))))

(declare-fun lt!359999 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360000 () array!43712)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8527 0))(
  ( (MissingZero!8527 (index!36476 (_ BitVec 32))) (Found!8527 (index!36477 (_ BitVec 32))) (Intermediate!8527 (undefined!9339 Bool) (index!36478 (_ BitVec 32)) (x!67309 (_ BitVec 32))) (Undefined!8527) (MissingVacant!8527 (index!36479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43712 (_ BitVec 32)) SeekEntryResult!8527)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43712 (_ BitVec 32)) SeekEntryResult!8527)

(assert (=> b!803987 (= res!548511 (= (seekEntryOrOpen!0 lt!359999 lt!360000 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359999 lt!360000 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803987 (= lt!359999 (select (store (arr!20936 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803987 (= lt!360000 (array!43713 (store (arr!20936 a!3170) i!1163 k!2044) (size!21357 a!3170)))))

(declare-fun b!803988 () Bool)

(declare-fun res!548513 () Bool)

(assert (=> b!803988 (=> (not res!548513) (not e!445460))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803988 (= res!548513 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21357 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20936 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21357 a!3170)) (= (select (arr!20936 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803989 () Bool)

(declare-fun res!548507 () Bool)

(assert (=> b!803989 (=> (not res!548507) (not e!445460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43712 (_ BitVec 32)) Bool)

(assert (=> b!803989 (= res!548507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803990 () Bool)

(declare-fun res!548509 () Bool)

(assert (=> b!803990 (=> (not res!548509) (not e!445461))))

(assert (=> b!803990 (= res!548509 (validKeyInArray!0 (select (arr!20936 a!3170) j!153)))))

(declare-fun b!803991 () Bool)

(declare-fun e!445463 () Bool)

(assert (=> b!803991 (= e!445463 (not true))))

(declare-fun lt!360002 () (_ BitVec 32))

(assert (=> b!803991 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360002 vacantAfter!23 lt!359999 lt!360000 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360002 vacantBefore!23 (select (arr!20936 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27594 0))(
  ( (Unit!27595) )
))
(declare-fun lt!359998 () Unit!27594)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43712 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27594)

(assert (=> b!803991 (= lt!359998 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!360002 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803991 (= lt!360002 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803992 () Bool)

(assert (=> b!803992 (= e!445461 e!445460)))

(declare-fun res!548505 () Bool)

(assert (=> b!803992 (=> (not res!548505) (not e!445460))))

(declare-fun lt!360001 () SeekEntryResult!8527)

(assert (=> b!803992 (= res!548505 (or (= lt!360001 (MissingZero!8527 i!1163)) (= lt!360001 (MissingVacant!8527 i!1163))))))

(assert (=> b!803992 (= lt!360001 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803993 () Bool)

(declare-fun res!548512 () Bool)

(assert (=> b!803993 (=> (not res!548512) (not e!445461))))

(assert (=> b!803993 (= res!548512 (and (= (size!21357 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21357 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21357 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803994 () Bool)

(assert (=> b!803994 (= e!445459 e!445463)))

(declare-fun res!548508 () Bool)

(assert (=> b!803994 (=> (not res!548508) (not e!445463))))

(declare-fun lt!359997 () SeekEntryResult!8527)

(declare-fun lt!359996 () SeekEntryResult!8527)

(assert (=> b!803994 (= res!548508 (and (= lt!359997 lt!359996) (= lt!359996 (Found!8527 j!153)) (not (= (select (arr!20936 a!3170) index!1236) (select (arr!20936 a!3170) j!153)))))))

(assert (=> b!803994 (= lt!359996 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20936 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803994 (= lt!359997 (seekEntryOrOpen!0 (select (arr!20936 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68922 res!548503) b!803993))

(assert (= (and b!803993 res!548512) b!803990))

(assert (= (and b!803990 res!548509) b!803984))

(assert (= (and b!803984 res!548506) b!803985))

(assert (= (and b!803985 res!548510) b!803992))

(assert (= (and b!803992 res!548505) b!803989))

(assert (= (and b!803989 res!548507) b!803986))

(assert (= (and b!803986 res!548504) b!803988))

(assert (= (and b!803988 res!548513) b!803987))

(assert (= (and b!803987 res!548511) b!803994))

(assert (= (and b!803994 res!548508) b!803991))

(declare-fun m!745863 () Bool)

(assert (=> b!803986 m!745863))

(declare-fun m!745865 () Bool)

(assert (=> b!803988 m!745865))

(declare-fun m!745867 () Bool)

(assert (=> b!803988 m!745867))

(declare-fun m!745869 () Bool)

(assert (=> b!803985 m!745869))

(declare-fun m!745871 () Bool)

(assert (=> start!68922 m!745871))

(declare-fun m!745873 () Bool)

(assert (=> start!68922 m!745873))

(declare-fun m!745875 () Bool)

(assert (=> b!803994 m!745875))

(declare-fun m!745877 () Bool)

(assert (=> b!803994 m!745877))

(assert (=> b!803994 m!745877))

(declare-fun m!745879 () Bool)

(assert (=> b!803994 m!745879))

(assert (=> b!803994 m!745877))

(declare-fun m!745881 () Bool)

(assert (=> b!803994 m!745881))

(declare-fun m!745883 () Bool)

(assert (=> b!803984 m!745883))

(assert (=> b!803991 m!745877))

(assert (=> b!803991 m!745877))

(declare-fun m!745885 () Bool)

(assert (=> b!803991 m!745885))

(declare-fun m!745887 () Bool)

(assert (=> b!803991 m!745887))

(declare-fun m!745889 () Bool)

(assert (=> b!803991 m!745889))

(declare-fun m!745891 () Bool)

(assert (=> b!803991 m!745891))

(assert (=> b!803990 m!745877))

(assert (=> b!803990 m!745877))

(declare-fun m!745893 () Bool)

(assert (=> b!803990 m!745893))

(declare-fun m!745895 () Bool)

(assert (=> b!803992 m!745895))

(declare-fun m!745897 () Bool)

(assert (=> b!803989 m!745897))

(declare-fun m!745899 () Bool)

(assert (=> b!803987 m!745899))

(declare-fun m!745901 () Bool)

(assert (=> b!803987 m!745901))

(declare-fun m!745903 () Bool)

(assert (=> b!803987 m!745903))

(declare-fun m!745905 () Bool)

(assert (=> b!803987 m!745905))

(push 1)

