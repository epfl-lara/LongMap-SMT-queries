; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68670 () Bool)

(assert start!68670)

(declare-fun b!799392 () Bool)

(declare-fun res!543914 () Bool)

(declare-fun e!443307 () Bool)

(assert (=> b!799392 (=> (not res!543914) (not e!443307))))

(declare-datatypes ((array!43460 0))(
  ( (array!43461 (arr!20810 (Array (_ BitVec 32) (_ BitVec 64))) (size!21231 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43460)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799392 (= res!543914 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799393 () Bool)

(declare-fun res!543915 () Bool)

(declare-fun e!443309 () Bool)

(assert (=> b!799393 (=> (not res!543915) (not e!443309))))

(declare-fun lt!356963 () (_ BitVec 32))

(declare-fun lt!356964 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356967 () array!43460)

(declare-datatypes ((SeekEntryResult!8401 0))(
  ( (MissingZero!8401 (index!35972 (_ BitVec 32))) (Found!8401 (index!35973 (_ BitVec 32))) (Intermediate!8401 (undefined!9213 Bool) (index!35974 (_ BitVec 32)) (x!66847 (_ BitVec 32))) (Undefined!8401) (MissingVacant!8401 (index!35975 (_ BitVec 32))) )
))
(declare-fun lt!356965 () SeekEntryResult!8401)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43460 (_ BitVec 32)) SeekEntryResult!8401)

(assert (=> b!799393 (= res!543915 (= lt!356965 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356963 vacantAfter!23 lt!356964 lt!356967 mask!3266)))))

(declare-fun b!799394 () Bool)

(declare-fun e!443312 () Bool)

(assert (=> b!799394 (= e!443312 e!443309)))

(declare-fun res!543922 () Bool)

(assert (=> b!799394 (=> (not res!543922) (not e!443309))))

(assert (=> b!799394 (= res!543922 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356963 #b00000000000000000000000000000000) (bvslt lt!356963 (size!21231 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799394 (= lt!356963 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!543923 () Bool)

(assert (=> start!68670 (=> (not res!543923) (not e!443307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68670 (= res!543923 (validMask!0 mask!3266))))

(assert (=> start!68670 e!443307))

(assert (=> start!68670 true))

(declare-fun array_inv!16606 (array!43460) Bool)

(assert (=> start!68670 (array_inv!16606 a!3170)))

(declare-fun b!799395 () Bool)

(declare-fun e!443310 () Bool)

(assert (=> b!799395 (= e!443307 e!443310)))

(declare-fun res!543917 () Bool)

(assert (=> b!799395 (=> (not res!543917) (not e!443310))))

(declare-fun lt!356966 () SeekEntryResult!8401)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799395 (= res!543917 (or (= lt!356966 (MissingZero!8401 i!1163)) (= lt!356966 (MissingVacant!8401 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43460 (_ BitVec 32)) SeekEntryResult!8401)

(assert (=> b!799395 (= lt!356966 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799396 () Bool)

(declare-fun res!543920 () Bool)

(assert (=> b!799396 (=> (not res!543920) (not e!443307))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799396 (= res!543920 (and (= (size!21231 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21231 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21231 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799397 () Bool)

(declare-fun res!543918 () Bool)

(assert (=> b!799397 (=> (not res!543918) (not e!443307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799397 (= res!543918 (validKeyInArray!0 (select (arr!20810 a!3170) j!153)))))

(declare-fun b!799398 () Bool)

(declare-fun e!443311 () Bool)

(assert (=> b!799398 (= e!443310 e!443311)))

(declare-fun res!543912 () Bool)

(assert (=> b!799398 (=> (not res!543912) (not e!443311))))

(assert (=> b!799398 (= res!543912 (= lt!356965 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356964 lt!356967 mask!3266)))))

(assert (=> b!799398 (= lt!356965 (seekEntryOrOpen!0 lt!356964 lt!356967 mask!3266))))

(assert (=> b!799398 (= lt!356964 (select (store (arr!20810 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799398 (= lt!356967 (array!43461 (store (arr!20810 a!3170) i!1163 k!2044) (size!21231 a!3170)))))

(declare-fun b!799399 () Bool)

(declare-fun res!543913 () Bool)

(assert (=> b!799399 (=> (not res!543913) (not e!443307))))

(assert (=> b!799399 (= res!543913 (validKeyInArray!0 k!2044))))

(declare-fun b!799400 () Bool)

(declare-fun res!543921 () Bool)

(assert (=> b!799400 (=> (not res!543921) (not e!443310))))

(declare-datatypes ((List!14773 0))(
  ( (Nil!14770) (Cons!14769 (h!15898 (_ BitVec 64)) (t!21088 List!14773)) )
))
(declare-fun arrayNoDuplicates!0 (array!43460 (_ BitVec 32) List!14773) Bool)

(assert (=> b!799400 (= res!543921 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14770))))

(declare-fun b!799401 () Bool)

(declare-fun res!543919 () Bool)

(assert (=> b!799401 (=> (not res!543919) (not e!443310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43460 (_ BitVec 32)) Bool)

(assert (=> b!799401 (= res!543919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799402 () Bool)

(assert (=> b!799402 (= e!443309 false)))

(declare-fun lt!356969 () SeekEntryResult!8401)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799402 (= lt!356969 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356963 vacantBefore!23 (select (arr!20810 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799403 () Bool)

(declare-fun res!543916 () Bool)

(assert (=> b!799403 (=> (not res!543916) (not e!443310))))

(assert (=> b!799403 (= res!543916 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21231 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20810 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21231 a!3170)) (= (select (arr!20810 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799404 () Bool)

(assert (=> b!799404 (= e!443311 e!443312)))

(declare-fun res!543911 () Bool)

(assert (=> b!799404 (=> (not res!543911) (not e!443312))))

(declare-fun lt!356968 () SeekEntryResult!8401)

(declare-fun lt!356962 () SeekEntryResult!8401)

(assert (=> b!799404 (= res!543911 (and (= lt!356962 lt!356968) (= lt!356968 (Found!8401 j!153)) (not (= (select (arr!20810 a!3170) index!1236) (select (arr!20810 a!3170) j!153)))))))

(assert (=> b!799404 (= lt!356968 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20810 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799404 (= lt!356962 (seekEntryOrOpen!0 (select (arr!20810 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68670 res!543923) b!799396))

(assert (= (and b!799396 res!543920) b!799397))

(assert (= (and b!799397 res!543918) b!799399))

(assert (= (and b!799399 res!543913) b!799392))

(assert (= (and b!799392 res!543914) b!799395))

(assert (= (and b!799395 res!543917) b!799401))

(assert (= (and b!799401 res!543919) b!799400))

(assert (= (and b!799400 res!543921) b!799403))

(assert (= (and b!799403 res!543916) b!799398))

(assert (= (and b!799398 res!543912) b!799404))

(assert (= (and b!799404 res!543911) b!799394))

(assert (= (and b!799394 res!543922) b!799393))

(assert (= (and b!799393 res!543915) b!799402))

(declare-fun m!740399 () Bool)

(assert (=> b!799393 m!740399))

(declare-fun m!740401 () Bool)

(assert (=> b!799402 m!740401))

(assert (=> b!799402 m!740401))

(declare-fun m!740403 () Bool)

(assert (=> b!799402 m!740403))

(declare-fun m!740405 () Bool)

(assert (=> b!799392 m!740405))

(declare-fun m!740407 () Bool)

(assert (=> b!799394 m!740407))

(declare-fun m!740409 () Bool)

(assert (=> b!799401 m!740409))

(declare-fun m!740411 () Bool)

(assert (=> start!68670 m!740411))

(declare-fun m!740413 () Bool)

(assert (=> start!68670 m!740413))

(declare-fun m!740415 () Bool)

(assert (=> b!799395 m!740415))

(declare-fun m!740417 () Bool)

(assert (=> b!799398 m!740417))

(declare-fun m!740419 () Bool)

(assert (=> b!799398 m!740419))

(declare-fun m!740421 () Bool)

(assert (=> b!799398 m!740421))

(declare-fun m!740423 () Bool)

(assert (=> b!799398 m!740423))

(declare-fun m!740425 () Bool)

(assert (=> b!799400 m!740425))

(declare-fun m!740427 () Bool)

(assert (=> b!799399 m!740427))

(declare-fun m!740429 () Bool)

(assert (=> b!799404 m!740429))

(assert (=> b!799404 m!740401))

(assert (=> b!799404 m!740401))

(declare-fun m!740431 () Bool)

(assert (=> b!799404 m!740431))

(assert (=> b!799404 m!740401))

(declare-fun m!740433 () Bool)

(assert (=> b!799404 m!740433))

(assert (=> b!799397 m!740401))

(assert (=> b!799397 m!740401))

(declare-fun m!740435 () Bool)

(assert (=> b!799397 m!740435))

(declare-fun m!740437 () Bool)

(assert (=> b!799403 m!740437))

(declare-fun m!740439 () Bool)

(assert (=> b!799403 m!740439))

(push 1)

