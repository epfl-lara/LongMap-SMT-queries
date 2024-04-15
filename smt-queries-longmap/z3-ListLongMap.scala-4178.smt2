; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56970 () Bool)

(assert start!56970)

(declare-fun b!630342 () Bool)

(declare-datatypes ((Unit!21128 0))(
  ( (Unit!21129) )
))
(declare-fun e!360426 () Unit!21128)

(declare-fun Unit!21130 () Unit!21128)

(assert (=> b!630342 (= e!360426 Unit!21130)))

(declare-fun b!630343 () Bool)

(declare-fun e!360425 () Bool)

(declare-datatypes ((SeekEntryResult!6700 0))(
  ( (MissingZero!6700 (index!29090 (_ BitVec 32))) (Found!6700 (index!29091 (_ BitVec 32))) (Intermediate!6700 (undefined!7512 Bool) (index!29092 (_ BitVec 32)) (x!57841 (_ BitVec 32))) (Undefined!6700) (MissingVacant!6700 (index!29093 (_ BitVec 32))) )
))
(declare-fun lt!291024 () SeekEntryResult!6700)

(declare-fun lt!291025 () SeekEntryResult!6700)

(assert (=> b!630343 (= e!360425 (= lt!291024 lt!291025))))

(declare-fun b!630345 () Bool)

(declare-fun res!407498 () Bool)

(declare-fun e!360428 () Bool)

(assert (=> b!630345 (=> (not res!407498) (not e!360428))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630345 (= res!407498 (validKeyInArray!0 k0!1786))))

(declare-fun b!630346 () Bool)

(declare-fun e!360427 () Bool)

(declare-fun e!360423 () Bool)

(assert (=> b!630346 (= e!360427 e!360423)))

(declare-fun res!407505 () Bool)

(assert (=> b!630346 (=> (not res!407505) (not e!360423))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38058 0))(
  ( (array!38059 (arr!18263 (Array (_ BitVec 32) (_ BitVec 64))) (size!18628 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38058)

(assert (=> b!630346 (= res!407505 (= (select (store (arr!18263 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291028 () array!38058)

(assert (=> b!630346 (= lt!291028 (array!38059 (store (arr!18263 a!2986) i!1108 k0!1786) (size!18628 a!2986)))))

(declare-fun b!630347 () Bool)

(declare-fun res!407500 () Bool)

(assert (=> b!630347 (=> (not res!407500) (not e!360427))))

(declare-datatypes ((List!12343 0))(
  ( (Nil!12340) (Cons!12339 (h!13384 (_ BitVec 64)) (t!18562 List!12343)) )
))
(declare-fun arrayNoDuplicates!0 (array!38058 (_ BitVec 32) List!12343) Bool)

(assert (=> b!630347 (= res!407500 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12340))))

(declare-fun b!630348 () Bool)

(declare-fun res!407501 () Bool)

(assert (=> b!630348 (=> (not res!407501) (not e!360428))))

(declare-fun arrayContainsKey!0 (array!38058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630348 (= res!407501 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630349 () Bool)

(declare-fun res!407496 () Bool)

(assert (=> b!630349 (=> (not res!407496) (not e!360428))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!630349 (= res!407496 (and (= (size!18628 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18628 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18628 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!407507 () Bool)

(assert (=> start!56970 (=> (not res!407507) (not e!360428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56970 (= res!407507 (validMask!0 mask!3053))))

(assert (=> start!56970 e!360428))

(assert (=> start!56970 true))

(declare-fun array_inv!14146 (array!38058) Bool)

(assert (=> start!56970 (array_inv!14146 a!2986)))

(declare-fun b!630344 () Bool)

(declare-fun e!360424 () Bool)

(assert (=> b!630344 (= e!360424 (not true))))

(declare-fun lt!291022 () Unit!21128)

(assert (=> b!630344 (= lt!291022 e!360426)))

(declare-fun lt!291026 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!71790 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38058 (_ BitVec 32)) SeekEntryResult!6700)

(assert (=> b!630344 (= c!71790 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291026 lt!291028 mask!3053) Undefined!6700))))

(assert (=> b!630344 e!360425))

(declare-fun res!407499 () Bool)

(assert (=> b!630344 (=> (not res!407499) (not e!360425))))

(declare-fun lt!291023 () (_ BitVec 32))

(assert (=> b!630344 (= res!407499 (= lt!291025 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291023 vacantSpotIndex!68 lt!291026 lt!291028 mask!3053)))))

(assert (=> b!630344 (= lt!291025 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291023 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630344 (= lt!291026 (select (store (arr!18263 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291027 () Unit!21128)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38058 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21128)

(assert (=> b!630344 (= lt!291027 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291023 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630344 (= lt!291023 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630350 () Bool)

(declare-fun res!407502 () Bool)

(assert (=> b!630350 (=> (not res!407502) (not e!360427))))

(assert (=> b!630350 (= res!407502 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18263 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630351 () Bool)

(declare-fun res!407503 () Bool)

(assert (=> b!630351 (=> (not res!407503) (not e!360427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38058 (_ BitVec 32)) Bool)

(assert (=> b!630351 (= res!407503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630352 () Bool)

(declare-fun res!407497 () Bool)

(assert (=> b!630352 (=> (not res!407497) (not e!360428))))

(assert (=> b!630352 (= res!407497 (validKeyInArray!0 (select (arr!18263 a!2986) j!136)))))

(declare-fun b!630353 () Bool)

(declare-fun Unit!21131 () Unit!21128)

(assert (=> b!630353 (= e!360426 Unit!21131)))

(assert (=> b!630353 false))

(declare-fun b!630354 () Bool)

(assert (=> b!630354 (= e!360423 e!360424)))

(declare-fun res!407504 () Bool)

(assert (=> b!630354 (=> (not res!407504) (not e!360424))))

(assert (=> b!630354 (= res!407504 (and (= lt!291024 (Found!6700 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18263 a!2986) index!984) (select (arr!18263 a!2986) j!136))) (not (= (select (arr!18263 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630354 (= lt!291024 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630355 () Bool)

(assert (=> b!630355 (= e!360428 e!360427)))

(declare-fun res!407506 () Bool)

(assert (=> b!630355 (=> (not res!407506) (not e!360427))))

(declare-fun lt!291021 () SeekEntryResult!6700)

(assert (=> b!630355 (= res!407506 (or (= lt!291021 (MissingZero!6700 i!1108)) (= lt!291021 (MissingVacant!6700 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38058 (_ BitVec 32)) SeekEntryResult!6700)

(assert (=> b!630355 (= lt!291021 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56970 res!407507) b!630349))

(assert (= (and b!630349 res!407496) b!630352))

(assert (= (and b!630352 res!407497) b!630345))

(assert (= (and b!630345 res!407498) b!630348))

(assert (= (and b!630348 res!407501) b!630355))

(assert (= (and b!630355 res!407506) b!630351))

(assert (= (and b!630351 res!407503) b!630347))

(assert (= (and b!630347 res!407500) b!630350))

(assert (= (and b!630350 res!407502) b!630346))

(assert (= (and b!630346 res!407505) b!630354))

(assert (= (and b!630354 res!407504) b!630344))

(assert (= (and b!630344 res!407499) b!630343))

(assert (= (and b!630344 c!71790) b!630353))

(assert (= (and b!630344 (not c!71790)) b!630342))

(declare-fun m!604819 () Bool)

(assert (=> b!630346 m!604819))

(declare-fun m!604821 () Bool)

(assert (=> b!630346 m!604821))

(declare-fun m!604823 () Bool)

(assert (=> b!630351 m!604823))

(declare-fun m!604825 () Bool)

(assert (=> b!630355 m!604825))

(declare-fun m!604827 () Bool)

(assert (=> b!630354 m!604827))

(declare-fun m!604829 () Bool)

(assert (=> b!630354 m!604829))

(assert (=> b!630354 m!604829))

(declare-fun m!604831 () Bool)

(assert (=> b!630354 m!604831))

(declare-fun m!604833 () Bool)

(assert (=> b!630345 m!604833))

(declare-fun m!604835 () Bool)

(assert (=> b!630347 m!604835))

(declare-fun m!604837 () Bool)

(assert (=> b!630350 m!604837))

(declare-fun m!604839 () Bool)

(assert (=> start!56970 m!604839))

(declare-fun m!604841 () Bool)

(assert (=> start!56970 m!604841))

(declare-fun m!604843 () Bool)

(assert (=> b!630348 m!604843))

(assert (=> b!630352 m!604829))

(assert (=> b!630352 m!604829))

(declare-fun m!604845 () Bool)

(assert (=> b!630352 m!604845))

(declare-fun m!604847 () Bool)

(assert (=> b!630344 m!604847))

(declare-fun m!604849 () Bool)

(assert (=> b!630344 m!604849))

(assert (=> b!630344 m!604819))

(declare-fun m!604851 () Bool)

(assert (=> b!630344 m!604851))

(declare-fun m!604853 () Bool)

(assert (=> b!630344 m!604853))

(declare-fun m!604855 () Bool)

(assert (=> b!630344 m!604855))

(assert (=> b!630344 m!604829))

(assert (=> b!630344 m!604829))

(declare-fun m!604857 () Bool)

(assert (=> b!630344 m!604857))

(check-sat (not b!630348) (not b!630345) (not b!630352) (not b!630347) (not b!630355) (not start!56970) (not b!630344) (not b!630351) (not b!630354))
(check-sat)
