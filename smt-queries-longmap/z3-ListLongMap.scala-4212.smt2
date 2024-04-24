; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57774 () Bool)

(assert start!57774)

(declare-fun b!638648 () Bool)

(declare-datatypes ((Unit!21537 0))(
  ( (Unit!21538) )
))
(declare-fun e!365446 () Unit!21537)

(declare-fun Unit!21539 () Unit!21537)

(assert (=> b!638648 (= e!365446 Unit!21539)))

(assert (=> b!638648 false))

(declare-fun b!638649 () Bool)

(declare-fun e!365456 () Bool)

(declare-fun e!365453 () Bool)

(assert (=> b!638649 (= e!365456 e!365453)))

(declare-fun res!413369 () Bool)

(assert (=> b!638649 (=> (not res!413369) (not e!365453))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38283 0))(
  ( (array!38284 (arr!18361 (Array (_ BitVec 32) (_ BitVec 64))) (size!18725 (_ BitVec 32))) )
))
(declare-fun lt!295354 () array!38283)

(declare-fun a!2986 () array!38283)

(declare-fun arrayContainsKey!0 (array!38283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638649 (= res!413369 (arrayContainsKey!0 lt!295354 (select (arr!18361 a!2986) j!136) j!136))))

(declare-fun b!638650 () Bool)

(declare-fun res!413359 () Bool)

(declare-fun e!365451 () Bool)

(assert (=> b!638650 (=> (not res!413359) (not e!365451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638650 (= res!413359 (validKeyInArray!0 (select (arr!18361 a!2986) j!136)))))

(declare-fun b!638651 () Bool)

(declare-fun e!365452 () Bool)

(declare-fun e!365450 () Bool)

(assert (=> b!638651 (= e!365452 e!365450)))

(declare-fun res!413360 () Bool)

(assert (=> b!638651 (=> (not res!413360) (not e!365450))))

(declare-datatypes ((SeekEntryResult!6757 0))(
  ( (MissingZero!6757 (index!29342 (_ BitVec 32))) (Found!6757 (index!29343 (_ BitVec 32))) (Intermediate!6757 (undefined!7569 Bool) (index!29344 (_ BitVec 32)) (x!58250 (_ BitVec 32))) (Undefined!6757) (MissingVacant!6757 (index!29345 (_ BitVec 32))) )
))
(declare-fun lt!295344 () SeekEntryResult!6757)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638651 (= res!413360 (and (= lt!295344 (Found!6757 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18361 a!2986) index!984) (select (arr!18361 a!2986) j!136))) (not (= (select (arr!18361 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38283 (_ BitVec 32)) SeekEntryResult!6757)

(assert (=> b!638651 (= lt!295344 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18361 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638652 () Bool)

(declare-fun res!413374 () Bool)

(declare-fun e!365449 () Bool)

(assert (=> b!638652 (=> (not res!413374) (not e!365449))))

(declare-datatypes ((List!12309 0))(
  ( (Nil!12306) (Cons!12305 (h!13353 (_ BitVec 64)) (t!18529 List!12309)) )
))
(declare-fun arrayNoDuplicates!0 (array!38283 (_ BitVec 32) List!12309) Bool)

(assert (=> b!638652 (= res!413374 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12306))))

(declare-fun b!638653 () Bool)

(declare-fun e!365448 () Bool)

(assert (=> b!638653 (= e!365448 true)))

(assert (=> b!638653 (arrayNoDuplicates!0 lt!295354 #b00000000000000000000000000000000 Nil!12306)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!295353 () Unit!21537)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12309) Unit!21537)

(assert (=> b!638653 (= lt!295353 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12306))))

(assert (=> b!638653 (arrayContainsKey!0 lt!295354 (select (arr!18361 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295349 () Unit!21537)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21537)

(assert (=> b!638653 (= lt!295349 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295354 (select (arr!18361 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638654 () Bool)

(assert (=> b!638654 (= e!365451 e!365449)))

(declare-fun res!413361 () Bool)

(assert (=> b!638654 (=> (not res!413361) (not e!365449))))

(declare-fun lt!295348 () SeekEntryResult!6757)

(assert (=> b!638654 (= res!413361 (or (= lt!295348 (MissingZero!6757 i!1108)) (= lt!295348 (MissingVacant!6757 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38283 (_ BitVec 32)) SeekEntryResult!6757)

(assert (=> b!638654 (= lt!295348 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638655 () Bool)

(declare-fun e!365457 () Bool)

(assert (=> b!638655 (= e!365457 e!365456)))

(declare-fun res!413367 () Bool)

(assert (=> b!638655 (=> res!413367 e!365456)))

(declare-fun lt!295346 () (_ BitVec 64))

(declare-fun lt!295345 () (_ BitVec 64))

(assert (=> b!638655 (= res!413367 (or (not (= (select (arr!18361 a!2986) j!136) lt!295345)) (not (= (select (arr!18361 a!2986) j!136) lt!295346)) (bvsge j!136 index!984)))))

(declare-fun b!638656 () Bool)

(declare-fun res!413363 () Bool)

(assert (=> b!638656 (=> (not res!413363) (not e!365451))))

(assert (=> b!638656 (= res!413363 (and (= (size!18725 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18725 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18725 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638657 () Bool)

(declare-fun e!365454 () Bool)

(assert (=> b!638657 (= e!365454 e!365448)))

(declare-fun res!413362 () Bool)

(assert (=> b!638657 (=> res!413362 e!365448)))

(assert (=> b!638657 (= res!413362 (or (not (= (select (arr!18361 a!2986) j!136) lt!295345)) (not (= (select (arr!18361 a!2986) j!136) lt!295346)) (bvsge j!136 index!984)))))

(assert (=> b!638657 e!365457))

(declare-fun res!413372 () Bool)

(assert (=> b!638657 (=> (not res!413372) (not e!365457))))

(assert (=> b!638657 (= res!413372 (= lt!295346 (select (arr!18361 a!2986) j!136)))))

(assert (=> b!638657 (= lt!295346 (select (store (arr!18361 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638658 () Bool)

(declare-fun res!413365 () Bool)

(assert (=> b!638658 (=> (not res!413365) (not e!365451))))

(assert (=> b!638658 (= res!413365 (validKeyInArray!0 k0!1786))))

(declare-fun b!638659 () Bool)

(assert (=> b!638659 (= e!365450 (not e!365454))))

(declare-fun res!413373 () Bool)

(assert (=> b!638659 (=> res!413373 e!365454)))

(declare-fun lt!295343 () SeekEntryResult!6757)

(assert (=> b!638659 (= res!413373 (not (= lt!295343 (Found!6757 index!984))))))

(declare-fun lt!295351 () Unit!21537)

(assert (=> b!638659 (= lt!295351 e!365446)))

(declare-fun c!73013 () Bool)

(assert (=> b!638659 (= c!73013 (= lt!295343 Undefined!6757))))

(assert (=> b!638659 (= lt!295343 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295345 lt!295354 mask!3053))))

(declare-fun e!365447 () Bool)

(assert (=> b!638659 e!365447))

(declare-fun res!413366 () Bool)

(assert (=> b!638659 (=> (not res!413366) (not e!365447))))

(declare-fun lt!295350 () SeekEntryResult!6757)

(declare-fun lt!295347 () (_ BitVec 32))

(assert (=> b!638659 (= res!413366 (= lt!295350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295347 vacantSpotIndex!68 lt!295345 lt!295354 mask!3053)))))

(assert (=> b!638659 (= lt!295350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295347 vacantSpotIndex!68 (select (arr!18361 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638659 (= lt!295345 (select (store (arr!18361 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295352 () Unit!21537)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21537)

(assert (=> b!638659 (= lt!295352 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295347 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638659 (= lt!295347 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!413364 () Bool)

(assert (=> start!57774 (=> (not res!413364) (not e!365451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57774 (= res!413364 (validMask!0 mask!3053))))

(assert (=> start!57774 e!365451))

(assert (=> start!57774 true))

(declare-fun array_inv!14220 (array!38283) Bool)

(assert (=> start!57774 (array_inv!14220 a!2986)))

(declare-fun b!638647 () Bool)

(assert (=> b!638647 (= e!365453 (arrayContainsKey!0 lt!295354 (select (arr!18361 a!2986) j!136) index!984))))

(declare-fun b!638660 () Bool)

(assert (=> b!638660 (= e!365449 e!365452)))

(declare-fun res!413370 () Bool)

(assert (=> b!638660 (=> (not res!413370) (not e!365452))))

(assert (=> b!638660 (= res!413370 (= (select (store (arr!18361 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638660 (= lt!295354 (array!38284 (store (arr!18361 a!2986) i!1108 k0!1786) (size!18725 a!2986)))))

(declare-fun b!638661 () Bool)

(assert (=> b!638661 (= e!365447 (= lt!295344 lt!295350))))

(declare-fun b!638662 () Bool)

(declare-fun Unit!21540 () Unit!21537)

(assert (=> b!638662 (= e!365446 Unit!21540)))

(declare-fun b!638663 () Bool)

(declare-fun res!413358 () Bool)

(assert (=> b!638663 (=> (not res!413358) (not e!365449))))

(assert (=> b!638663 (= res!413358 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18361 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638664 () Bool)

(declare-fun res!413368 () Bool)

(assert (=> b!638664 (=> (not res!413368) (not e!365449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38283 (_ BitVec 32)) Bool)

(assert (=> b!638664 (= res!413368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638665 () Bool)

(declare-fun res!413371 () Bool)

(assert (=> b!638665 (=> (not res!413371) (not e!365451))))

(assert (=> b!638665 (= res!413371 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!57774 res!413364) b!638656))

(assert (= (and b!638656 res!413363) b!638650))

(assert (= (and b!638650 res!413359) b!638658))

(assert (= (and b!638658 res!413365) b!638665))

(assert (= (and b!638665 res!413371) b!638654))

(assert (= (and b!638654 res!413361) b!638664))

(assert (= (and b!638664 res!413368) b!638652))

(assert (= (and b!638652 res!413374) b!638663))

(assert (= (and b!638663 res!413358) b!638660))

(assert (= (and b!638660 res!413370) b!638651))

(assert (= (and b!638651 res!413360) b!638659))

(assert (= (and b!638659 res!413366) b!638661))

(assert (= (and b!638659 c!73013) b!638648))

(assert (= (and b!638659 (not c!73013)) b!638662))

(assert (= (and b!638659 (not res!413373)) b!638657))

(assert (= (and b!638657 res!413372) b!638655))

(assert (= (and b!638655 (not res!413367)) b!638649))

(assert (= (and b!638649 res!413369) b!638647))

(assert (= (and b!638657 (not res!413362)) b!638653))

(declare-fun m!612943 () Bool)

(assert (=> b!638655 m!612943))

(declare-fun m!612945 () Bool)

(assert (=> b!638664 m!612945))

(declare-fun m!612947 () Bool)

(assert (=> b!638658 m!612947))

(assert (=> b!638657 m!612943))

(declare-fun m!612949 () Bool)

(assert (=> b!638657 m!612949))

(declare-fun m!612951 () Bool)

(assert (=> b!638657 m!612951))

(assert (=> b!638647 m!612943))

(assert (=> b!638647 m!612943))

(declare-fun m!612953 () Bool)

(assert (=> b!638647 m!612953))

(declare-fun m!612955 () Bool)

(assert (=> b!638665 m!612955))

(declare-fun m!612957 () Bool)

(assert (=> b!638663 m!612957))

(assert (=> b!638649 m!612943))

(assert (=> b!638649 m!612943))

(declare-fun m!612959 () Bool)

(assert (=> b!638649 m!612959))

(assert (=> b!638659 m!612943))

(declare-fun m!612961 () Bool)

(assert (=> b!638659 m!612961))

(declare-fun m!612963 () Bool)

(assert (=> b!638659 m!612963))

(declare-fun m!612965 () Bool)

(assert (=> b!638659 m!612965))

(assert (=> b!638659 m!612943))

(assert (=> b!638659 m!612949))

(declare-fun m!612967 () Bool)

(assert (=> b!638659 m!612967))

(declare-fun m!612969 () Bool)

(assert (=> b!638659 m!612969))

(declare-fun m!612971 () Bool)

(assert (=> b!638659 m!612971))

(declare-fun m!612973 () Bool)

(assert (=> start!57774 m!612973))

(declare-fun m!612975 () Bool)

(assert (=> start!57774 m!612975))

(declare-fun m!612977 () Bool)

(assert (=> b!638651 m!612977))

(assert (=> b!638651 m!612943))

(assert (=> b!638651 m!612943))

(declare-fun m!612979 () Bool)

(assert (=> b!638651 m!612979))

(declare-fun m!612981 () Bool)

(assert (=> b!638652 m!612981))

(assert (=> b!638650 m!612943))

(assert (=> b!638650 m!612943))

(declare-fun m!612983 () Bool)

(assert (=> b!638650 m!612983))

(declare-fun m!612985 () Bool)

(assert (=> b!638654 m!612985))

(assert (=> b!638653 m!612943))

(declare-fun m!612987 () Bool)

(assert (=> b!638653 m!612987))

(assert (=> b!638653 m!612943))

(declare-fun m!612989 () Bool)

(assert (=> b!638653 m!612989))

(assert (=> b!638653 m!612943))

(declare-fun m!612991 () Bool)

(assert (=> b!638653 m!612991))

(declare-fun m!612993 () Bool)

(assert (=> b!638653 m!612993))

(assert (=> b!638660 m!612949))

(declare-fun m!612995 () Bool)

(assert (=> b!638660 m!612995))

(check-sat (not start!57774) (not b!638658) (not b!638654) (not b!638652) (not b!638653) (not b!638659) (not b!638664) (not b!638649) (not b!638647) (not b!638665) (not b!638650) (not b!638651))
(check-sat)
