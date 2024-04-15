; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68712 () Bool)

(assert start!68712)

(declare-fun b!800351 () Bool)

(declare-fun e!443713 () Bool)

(declare-fun e!443711 () Bool)

(assert (=> b!800351 (= e!443713 e!443711)))

(declare-fun res!545014 () Bool)

(assert (=> b!800351 (=> (not res!545014) (not e!443711))))

(declare-datatypes ((SeekEntryResult!8428 0))(
  ( (MissingZero!8428 (index!36080 (_ BitVec 32))) (Found!8428 (index!36081 (_ BitVec 32))) (Intermediate!8428 (undefined!9240 Bool) (index!36082 (_ BitVec 32)) (x!66957 (_ BitVec 32))) (Undefined!8428) (MissingVacant!8428 (index!36083 (_ BitVec 32))) )
))
(declare-fun lt!357471 () SeekEntryResult!8428)

(declare-datatypes ((array!43519 0))(
  ( (array!43520 (arr!20840 (Array (_ BitVec 32) (_ BitVec 64))) (size!21261 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43519)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!357468 () SeekEntryResult!8428)

(assert (=> b!800351 (= res!545014 (and (= lt!357471 lt!357468) (= lt!357468 (Found!8428 j!153)) (not (= (select (arr!20840 a!3170) index!1236) (select (arr!20840 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43519 (_ BitVec 32)) SeekEntryResult!8428)

(assert (=> b!800351 (= lt!357468 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20840 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43519 (_ BitVec 32)) SeekEntryResult!8428)

(assert (=> b!800351 (= lt!357471 (seekEntryOrOpen!0 (select (arr!20840 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545016 () Bool)

(declare-fun e!443716 () Bool)

(assert (=> start!68712 (=> (not res!545016) (not e!443716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68712 (= res!545016 (validMask!0 mask!3266))))

(assert (=> start!68712 e!443716))

(assert (=> start!68712 true))

(declare-fun array_inv!16723 (array!43519) Bool)

(assert (=> start!68712 (array_inv!16723 a!3170)))

(declare-fun b!800352 () Bool)

(declare-fun e!443715 () Bool)

(assert (=> b!800352 (= e!443715 false)))

(declare-fun lt!357467 () (_ BitVec 32))

(declare-fun lt!357472 () SeekEntryResult!8428)

(assert (=> b!800352 (= lt!357472 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357467 vacantBefore!23 (select (arr!20840 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800353 () Bool)

(declare-fun res!545013 () Bool)

(declare-fun e!443714 () Bool)

(assert (=> b!800353 (=> (not res!545013) (not e!443714))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800353 (= res!545013 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21261 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20840 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21261 a!3170)) (= (select (arr!20840 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800354 () Bool)

(declare-fun res!545021 () Bool)

(assert (=> b!800354 (=> (not res!545021) (not e!443716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800354 (= res!545021 (validKeyInArray!0 (select (arr!20840 a!3170) j!153)))))

(declare-fun b!800355 () Bool)

(assert (=> b!800355 (= e!443716 e!443714)))

(declare-fun res!545022 () Bool)

(assert (=> b!800355 (=> (not res!545022) (not e!443714))))

(declare-fun lt!357466 () SeekEntryResult!8428)

(assert (=> b!800355 (= res!545022 (or (= lt!357466 (MissingZero!8428 i!1163)) (= lt!357466 (MissingVacant!8428 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!800355 (= lt!357466 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800356 () Bool)

(declare-fun res!545019 () Bool)

(assert (=> b!800356 (=> (not res!545019) (not e!443716))))

(assert (=> b!800356 (= res!545019 (and (= (size!21261 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21261 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21261 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800357 () Bool)

(declare-fun res!545017 () Bool)

(assert (=> b!800357 (=> (not res!545017) (not e!443714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43519 (_ BitVec 32)) Bool)

(assert (=> b!800357 (= res!545017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800358 () Bool)

(declare-fun res!545020 () Bool)

(assert (=> b!800358 (=> (not res!545020) (not e!443716))))

(assert (=> b!800358 (= res!545020 (validKeyInArray!0 k0!2044))))

(declare-fun b!800359 () Bool)

(declare-fun res!545018 () Bool)

(assert (=> b!800359 (=> (not res!545018) (not e!443716))))

(declare-fun arrayContainsKey!0 (array!43519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800359 (= res!545018 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800360 () Bool)

(declare-fun res!545010 () Bool)

(assert (=> b!800360 (=> (not res!545010) (not e!443714))))

(declare-datatypes ((List!14842 0))(
  ( (Nil!14839) (Cons!14838 (h!15967 (_ BitVec 64)) (t!21148 List!14842)) )
))
(declare-fun arrayNoDuplicates!0 (array!43519 (_ BitVec 32) List!14842) Bool)

(assert (=> b!800360 (= res!545010 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14839))))

(declare-fun b!800361 () Bool)

(assert (=> b!800361 (= e!443714 e!443713)))

(declare-fun res!545011 () Bool)

(assert (=> b!800361 (=> (not res!545011) (not e!443713))))

(declare-fun lt!357470 () array!43519)

(declare-fun lt!357473 () SeekEntryResult!8428)

(declare-fun lt!357469 () (_ BitVec 64))

(assert (=> b!800361 (= res!545011 (= lt!357473 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357469 lt!357470 mask!3266)))))

(assert (=> b!800361 (= lt!357473 (seekEntryOrOpen!0 lt!357469 lt!357470 mask!3266))))

(assert (=> b!800361 (= lt!357469 (select (store (arr!20840 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800361 (= lt!357470 (array!43520 (store (arr!20840 a!3170) i!1163 k0!2044) (size!21261 a!3170)))))

(declare-fun b!800362 () Bool)

(assert (=> b!800362 (= e!443711 e!443715)))

(declare-fun res!545015 () Bool)

(assert (=> b!800362 (=> (not res!545015) (not e!443715))))

(assert (=> b!800362 (= res!545015 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357467 #b00000000000000000000000000000000) (bvslt lt!357467 (size!21261 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800362 (= lt!357467 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800363 () Bool)

(declare-fun res!545012 () Bool)

(assert (=> b!800363 (=> (not res!545012) (not e!443715))))

(assert (=> b!800363 (= res!545012 (= lt!357473 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357467 vacantAfter!23 lt!357469 lt!357470 mask!3266)))))

(assert (= (and start!68712 res!545016) b!800356))

(assert (= (and b!800356 res!545019) b!800354))

(assert (= (and b!800354 res!545021) b!800358))

(assert (= (and b!800358 res!545020) b!800359))

(assert (= (and b!800359 res!545018) b!800355))

(assert (= (and b!800355 res!545022) b!800357))

(assert (= (and b!800357 res!545017) b!800360))

(assert (= (and b!800360 res!545010) b!800353))

(assert (= (and b!800353 res!545013) b!800361))

(assert (= (and b!800361 res!545011) b!800351))

(assert (= (and b!800351 res!545014) b!800362))

(assert (= (and b!800362 res!545015) b!800363))

(assert (= (and b!800363 res!545012) b!800352))

(declare-fun m!740959 () Bool)

(assert (=> b!800352 m!740959))

(assert (=> b!800352 m!740959))

(declare-fun m!740961 () Bool)

(assert (=> b!800352 m!740961))

(declare-fun m!740963 () Bool)

(assert (=> b!800353 m!740963))

(declare-fun m!740965 () Bool)

(assert (=> b!800353 m!740965))

(declare-fun m!740967 () Bool)

(assert (=> b!800360 m!740967))

(declare-fun m!740969 () Bool)

(assert (=> b!800351 m!740969))

(assert (=> b!800351 m!740959))

(assert (=> b!800351 m!740959))

(declare-fun m!740971 () Bool)

(assert (=> b!800351 m!740971))

(assert (=> b!800351 m!740959))

(declare-fun m!740973 () Bool)

(assert (=> b!800351 m!740973))

(declare-fun m!740975 () Bool)

(assert (=> start!68712 m!740975))

(declare-fun m!740977 () Bool)

(assert (=> start!68712 m!740977))

(assert (=> b!800354 m!740959))

(assert (=> b!800354 m!740959))

(declare-fun m!740979 () Bool)

(assert (=> b!800354 m!740979))

(declare-fun m!740981 () Bool)

(assert (=> b!800355 m!740981))

(declare-fun m!740983 () Bool)

(assert (=> b!800359 m!740983))

(declare-fun m!740985 () Bool)

(assert (=> b!800362 m!740985))

(declare-fun m!740987 () Bool)

(assert (=> b!800363 m!740987))

(declare-fun m!740989 () Bool)

(assert (=> b!800361 m!740989))

(declare-fun m!740991 () Bool)

(assert (=> b!800361 m!740991))

(declare-fun m!740993 () Bool)

(assert (=> b!800361 m!740993))

(declare-fun m!740995 () Bool)

(assert (=> b!800361 m!740995))

(declare-fun m!740997 () Bool)

(assert (=> b!800358 m!740997))

(declare-fun m!740999 () Bool)

(assert (=> b!800357 m!740999))

(check-sat (not b!800361) (not b!800358) (not b!800357) (not b!800360) (not b!800363) (not b!800359) (not start!68712) (not b!800355) (not b!800362) (not b!800354) (not b!800352) (not b!800351))
(check-sat)
