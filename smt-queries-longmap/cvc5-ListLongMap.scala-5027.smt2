; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68672 () Bool)

(assert start!68672)

(declare-fun b!799431 () Bool)

(declare-fun res!543959 () Bool)

(declare-fun e!443327 () Bool)

(assert (=> b!799431 (=> (not res!543959) (not e!443327))))

(declare-datatypes ((array!43462 0))(
  ( (array!43463 (arr!20811 (Array (_ BitVec 32) (_ BitVec 64))) (size!21232 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43462)

(declare-datatypes ((List!14774 0))(
  ( (Nil!14771) (Cons!14770 (h!15899 (_ BitVec 64)) (t!21089 List!14774)) )
))
(declare-fun arrayNoDuplicates!0 (array!43462 (_ BitVec 32) List!14774) Bool)

(assert (=> b!799431 (= res!543959 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14771))))

(declare-fun b!799432 () Bool)

(declare-fun res!543957 () Bool)

(declare-fun e!443328 () Bool)

(assert (=> b!799432 (=> (not res!543957) (not e!443328))))

(declare-datatypes ((SeekEntryResult!8402 0))(
  ( (MissingZero!8402 (index!35976 (_ BitVec 32))) (Found!8402 (index!35977 (_ BitVec 32))) (Intermediate!8402 (undefined!9214 Bool) (index!35978 (_ BitVec 32)) (x!66856 (_ BitVec 32))) (Undefined!8402) (MissingVacant!8402 (index!35979 (_ BitVec 32))) )
))
(declare-fun lt!356992 () SeekEntryResult!8402)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356989 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356987 () (_ BitVec 32))

(declare-fun lt!356988 () array!43462)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43462 (_ BitVec 32)) SeekEntryResult!8402)

(assert (=> b!799432 (= res!543957 (= lt!356992 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356987 vacantAfter!23 lt!356989 lt!356988 mask!3266)))))

(declare-fun b!799433 () Bool)

(declare-fun res!543960 () Bool)

(declare-fun e!443329 () Bool)

(assert (=> b!799433 (=> (not res!543960) (not e!443329))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799433 (= res!543960 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799434 () Bool)

(declare-fun e!443330 () Bool)

(declare-fun e!443326 () Bool)

(assert (=> b!799434 (= e!443330 e!443326)))

(declare-fun res!543953 () Bool)

(assert (=> b!799434 (=> (not res!543953) (not e!443326))))

(declare-fun lt!356986 () SeekEntryResult!8402)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!356990 () SeekEntryResult!8402)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799434 (= res!543953 (and (= lt!356986 lt!356990) (= lt!356990 (Found!8402 j!153)) (not (= (select (arr!20811 a!3170) index!1236) (select (arr!20811 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799434 (= lt!356990 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20811 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43462 (_ BitVec 32)) SeekEntryResult!8402)

(assert (=> b!799434 (= lt!356986 (seekEntryOrOpen!0 (select (arr!20811 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799435 () Bool)

(declare-fun res!543958 () Bool)

(assert (=> b!799435 (=> (not res!543958) (not e!443329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799435 (= res!543958 (validKeyInArray!0 k!2044))))

(declare-fun b!799436 () Bool)

(assert (=> b!799436 (= e!443327 e!443330)))

(declare-fun res!543951 () Bool)

(assert (=> b!799436 (=> (not res!543951) (not e!443330))))

(assert (=> b!799436 (= res!543951 (= lt!356992 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356989 lt!356988 mask!3266)))))

(assert (=> b!799436 (= lt!356992 (seekEntryOrOpen!0 lt!356989 lt!356988 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799436 (= lt!356989 (select (store (arr!20811 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799436 (= lt!356988 (array!43463 (store (arr!20811 a!3170) i!1163 k!2044) (size!21232 a!3170)))))

(declare-fun b!799437 () Bool)

(declare-fun res!543955 () Bool)

(assert (=> b!799437 (=> (not res!543955) (not e!443327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43462 (_ BitVec 32)) Bool)

(assert (=> b!799437 (= res!543955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799438 () Bool)

(assert (=> b!799438 (= e!443328 false)))

(declare-fun lt!356993 () SeekEntryResult!8402)

(assert (=> b!799438 (= lt!356993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356987 vacantBefore!23 (select (arr!20811 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799439 () Bool)

(declare-fun res!543954 () Bool)

(assert (=> b!799439 (=> (not res!543954) (not e!443327))))

(assert (=> b!799439 (= res!543954 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21232 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20811 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21232 a!3170)) (= (select (arr!20811 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799440 () Bool)

(assert (=> b!799440 (= e!443326 e!443328)))

(declare-fun res!543956 () Bool)

(assert (=> b!799440 (=> (not res!543956) (not e!443328))))

(assert (=> b!799440 (= res!543956 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356987 #b00000000000000000000000000000000) (bvslt lt!356987 (size!21232 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799440 (= lt!356987 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799441 () Bool)

(declare-fun res!543950 () Bool)

(assert (=> b!799441 (=> (not res!543950) (not e!443329))))

(assert (=> b!799441 (= res!543950 (validKeyInArray!0 (select (arr!20811 a!3170) j!153)))))

(declare-fun b!799442 () Bool)

(assert (=> b!799442 (= e!443329 e!443327)))

(declare-fun res!543961 () Bool)

(assert (=> b!799442 (=> (not res!543961) (not e!443327))))

(declare-fun lt!356991 () SeekEntryResult!8402)

(assert (=> b!799442 (= res!543961 (or (= lt!356991 (MissingZero!8402 i!1163)) (= lt!356991 (MissingVacant!8402 i!1163))))))

(assert (=> b!799442 (= lt!356991 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!543962 () Bool)

(assert (=> start!68672 (=> (not res!543962) (not e!443329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68672 (= res!543962 (validMask!0 mask!3266))))

(assert (=> start!68672 e!443329))

(assert (=> start!68672 true))

(declare-fun array_inv!16607 (array!43462) Bool)

(assert (=> start!68672 (array_inv!16607 a!3170)))

(declare-fun b!799443 () Bool)

(declare-fun res!543952 () Bool)

(assert (=> b!799443 (=> (not res!543952) (not e!443329))))

(assert (=> b!799443 (= res!543952 (and (= (size!21232 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21232 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21232 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68672 res!543962) b!799443))

(assert (= (and b!799443 res!543952) b!799441))

(assert (= (and b!799441 res!543950) b!799435))

(assert (= (and b!799435 res!543958) b!799433))

(assert (= (and b!799433 res!543960) b!799442))

(assert (= (and b!799442 res!543961) b!799437))

(assert (= (and b!799437 res!543955) b!799431))

(assert (= (and b!799431 res!543959) b!799439))

(assert (= (and b!799439 res!543954) b!799436))

(assert (= (and b!799436 res!543951) b!799434))

(assert (= (and b!799434 res!543953) b!799440))

(assert (= (and b!799440 res!543956) b!799432))

(assert (= (and b!799432 res!543957) b!799438))

(declare-fun m!740441 () Bool)

(assert (=> b!799440 m!740441))

(declare-fun m!740443 () Bool)

(assert (=> b!799431 m!740443))

(declare-fun m!740445 () Bool)

(assert (=> b!799439 m!740445))

(declare-fun m!740447 () Bool)

(assert (=> b!799439 m!740447))

(declare-fun m!740449 () Bool)

(assert (=> b!799438 m!740449))

(assert (=> b!799438 m!740449))

(declare-fun m!740451 () Bool)

(assert (=> b!799438 m!740451))

(assert (=> b!799441 m!740449))

(assert (=> b!799441 m!740449))

(declare-fun m!740453 () Bool)

(assert (=> b!799441 m!740453))

(declare-fun m!740455 () Bool)

(assert (=> b!799437 m!740455))

(declare-fun m!740457 () Bool)

(assert (=> b!799436 m!740457))

(declare-fun m!740459 () Bool)

(assert (=> b!799436 m!740459))

(declare-fun m!740461 () Bool)

(assert (=> b!799436 m!740461))

(declare-fun m!740463 () Bool)

(assert (=> b!799436 m!740463))

(declare-fun m!740465 () Bool)

(assert (=> b!799442 m!740465))

(declare-fun m!740467 () Bool)

(assert (=> b!799432 m!740467))

(declare-fun m!740469 () Bool)

(assert (=> b!799434 m!740469))

(assert (=> b!799434 m!740449))

(assert (=> b!799434 m!740449))

(declare-fun m!740471 () Bool)

(assert (=> b!799434 m!740471))

(assert (=> b!799434 m!740449))

(declare-fun m!740473 () Bool)

(assert (=> b!799434 m!740473))

(declare-fun m!740475 () Bool)

(assert (=> b!799435 m!740475))

(declare-fun m!740477 () Bool)

(assert (=> b!799433 m!740477))

(declare-fun m!740479 () Bool)

(assert (=> start!68672 m!740479))

(declare-fun m!740481 () Bool)

(assert (=> start!68672 m!740481))

(push 1)

