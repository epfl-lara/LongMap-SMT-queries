; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57072 () Bool)

(assert start!57072)

(declare-fun b!631496 () Bool)

(declare-fun e!361044 () Bool)

(declare-datatypes ((SeekEntryResult!6721 0))(
  ( (MissingZero!6721 (index!29177 (_ BitVec 32))) (Found!6721 (index!29178 (_ BitVec 32))) (Intermediate!6721 (undefined!7533 Bool) (index!29179 (_ BitVec 32)) (x!57927 (_ BitVec 32))) (Undefined!6721) (MissingVacant!6721 (index!29180 (_ BitVec 32))) )
))
(declare-fun lt!291661 () SeekEntryResult!6721)

(declare-fun lt!291660 () SeekEntryResult!6721)

(assert (=> b!631496 (= e!361044 (= lt!291661 lt!291660))))

(declare-fun b!631497 () Bool)

(declare-fun e!361039 () Bool)

(declare-fun e!361042 () Bool)

(assert (=> b!631497 (= e!361039 (not e!361042))))

(declare-fun res!408328 () Bool)

(assert (=> b!631497 (=> res!408328 e!361042)))

(declare-fun lt!291654 () SeekEntryResult!6721)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631497 (= res!408328 (not (= lt!291654 (Found!6721 index!984))))))

(declare-datatypes ((Unit!21212 0))(
  ( (Unit!21213) )
))
(declare-fun lt!291658 () Unit!21212)

(declare-fun e!361043 () Unit!21212)

(assert (=> b!631497 (= lt!291658 e!361043)))

(declare-fun c!71952 () Bool)

(assert (=> b!631497 (= c!71952 (= lt!291654 Undefined!6721))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!291653 () (_ BitVec 64))

(declare-datatypes ((array!38103 0))(
  ( (array!38104 (arr!18284 (Array (_ BitVec 32) (_ BitVec 64))) (size!18649 (_ BitVec 32))) )
))
(declare-fun lt!291657 () array!38103)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38103 (_ BitVec 32)) SeekEntryResult!6721)

(assert (=> b!631497 (= lt!291654 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291653 lt!291657 mask!3053))))

(assert (=> b!631497 e!361044))

(declare-fun res!408335 () Bool)

(assert (=> b!631497 (=> (not res!408335) (not e!361044))))

(declare-fun lt!291655 () (_ BitVec 32))

(assert (=> b!631497 (= res!408335 (= lt!291660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291655 vacantSpotIndex!68 lt!291653 lt!291657 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38103)

(assert (=> b!631497 (= lt!291660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291655 vacantSpotIndex!68 (select (arr!18284 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!631497 (= lt!291653 (select (store (arr!18284 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291659 () Unit!21212)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38103 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21212)

(assert (=> b!631497 (= lt!291659 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291655 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631497 (= lt!291655 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631498 () Bool)

(declare-fun res!408332 () Bool)

(declare-fun e!361038 () Bool)

(assert (=> b!631498 (=> (not res!408332) (not e!361038))))

(declare-datatypes ((List!12364 0))(
  ( (Nil!12361) (Cons!12360 (h!13405 (_ BitVec 64)) (t!18583 List!12364)) )
))
(declare-fun arrayNoDuplicates!0 (array!38103 (_ BitVec 32) List!12364) Bool)

(assert (=> b!631498 (= res!408332 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12361))))

(declare-fun res!408337 () Bool)

(declare-fun e!361037 () Bool)

(assert (=> start!57072 (=> (not res!408337) (not e!361037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57072 (= res!408337 (validMask!0 mask!3053))))

(assert (=> start!57072 e!361037))

(assert (=> start!57072 true))

(declare-fun array_inv!14167 (array!38103) Bool)

(assert (=> start!57072 (array_inv!14167 a!2986)))

(declare-fun b!631499 () Bool)

(assert (=> b!631499 (= e!361037 e!361038)))

(declare-fun res!408327 () Bool)

(assert (=> b!631499 (=> (not res!408327) (not e!361038))))

(declare-fun lt!291656 () SeekEntryResult!6721)

(assert (=> b!631499 (= res!408327 (or (= lt!291656 (MissingZero!6721 i!1108)) (= lt!291656 (MissingVacant!6721 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38103 (_ BitVec 32)) SeekEntryResult!6721)

(assert (=> b!631499 (= lt!291656 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631500 () Bool)

(declare-fun res!408330 () Bool)

(assert (=> b!631500 (=> (not res!408330) (not e!361037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631500 (= res!408330 (validKeyInArray!0 k0!1786))))

(declare-fun b!631501 () Bool)

(declare-fun res!408333 () Bool)

(assert (=> b!631501 (=> (not res!408333) (not e!361038))))

(assert (=> b!631501 (= res!408333 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18284 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631502 () Bool)

(declare-fun res!408329 () Bool)

(assert (=> b!631502 (=> (not res!408329) (not e!361037))))

(assert (=> b!631502 (= res!408329 (and (= (size!18649 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18649 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18649 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631503 () Bool)

(declare-fun res!408331 () Bool)

(assert (=> b!631503 (=> (not res!408331) (not e!361037))))

(assert (=> b!631503 (= res!408331 (validKeyInArray!0 (select (arr!18284 a!2986) j!136)))))

(declare-fun b!631504 () Bool)

(declare-fun e!361041 () Bool)

(assert (=> b!631504 (= e!361038 e!361041)))

(declare-fun res!408336 () Bool)

(assert (=> b!631504 (=> (not res!408336) (not e!361041))))

(assert (=> b!631504 (= res!408336 (= (select (store (arr!18284 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631504 (= lt!291657 (array!38104 (store (arr!18284 a!2986) i!1108 k0!1786) (size!18649 a!2986)))))

(declare-fun b!631505 () Bool)

(assert (=> b!631505 (= e!361042 true)))

(assert (=> b!631505 (= (select (store (arr!18284 a!2986) i!1108 k0!1786) index!984) (select (arr!18284 a!2986) j!136))))

(declare-fun b!631506 () Bool)

(declare-fun res!408326 () Bool)

(assert (=> b!631506 (=> (not res!408326) (not e!361038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38103 (_ BitVec 32)) Bool)

(assert (=> b!631506 (= res!408326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631507 () Bool)

(declare-fun Unit!21214 () Unit!21212)

(assert (=> b!631507 (= e!361043 Unit!21214)))

(declare-fun b!631508 () Bool)

(declare-fun res!408334 () Bool)

(assert (=> b!631508 (=> (not res!408334) (not e!361037))))

(declare-fun arrayContainsKey!0 (array!38103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631508 (= res!408334 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631509 () Bool)

(declare-fun Unit!21215 () Unit!21212)

(assert (=> b!631509 (= e!361043 Unit!21215)))

(assert (=> b!631509 false))

(declare-fun b!631510 () Bool)

(assert (=> b!631510 (= e!361041 e!361039)))

(declare-fun res!408338 () Bool)

(assert (=> b!631510 (=> (not res!408338) (not e!361039))))

(assert (=> b!631510 (= res!408338 (and (= lt!291661 (Found!6721 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18284 a!2986) index!984) (select (arr!18284 a!2986) j!136))) (not (= (select (arr!18284 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631510 (= lt!291661 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18284 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57072 res!408337) b!631502))

(assert (= (and b!631502 res!408329) b!631503))

(assert (= (and b!631503 res!408331) b!631500))

(assert (= (and b!631500 res!408330) b!631508))

(assert (= (and b!631508 res!408334) b!631499))

(assert (= (and b!631499 res!408327) b!631506))

(assert (= (and b!631506 res!408326) b!631498))

(assert (= (and b!631498 res!408332) b!631501))

(assert (= (and b!631501 res!408333) b!631504))

(assert (= (and b!631504 res!408336) b!631510))

(assert (= (and b!631510 res!408338) b!631497))

(assert (= (and b!631497 res!408335) b!631496))

(assert (= (and b!631497 c!71952) b!631509))

(assert (= (and b!631497 (not c!71952)) b!631507))

(assert (= (and b!631497 (not res!408328)) b!631505))

(declare-fun m!605875 () Bool)

(assert (=> b!631501 m!605875))

(declare-fun m!605877 () Bool)

(assert (=> b!631499 m!605877))

(declare-fun m!605879 () Bool)

(assert (=> b!631508 m!605879))

(declare-fun m!605881 () Bool)

(assert (=> b!631498 m!605881))

(declare-fun m!605883 () Bool)

(assert (=> b!631497 m!605883))

(declare-fun m!605885 () Bool)

(assert (=> b!631497 m!605885))

(declare-fun m!605887 () Bool)

(assert (=> b!631497 m!605887))

(declare-fun m!605889 () Bool)

(assert (=> b!631497 m!605889))

(declare-fun m!605891 () Bool)

(assert (=> b!631497 m!605891))

(declare-fun m!605893 () Bool)

(assert (=> b!631497 m!605893))

(declare-fun m!605895 () Bool)

(assert (=> b!631497 m!605895))

(assert (=> b!631497 m!605889))

(declare-fun m!605897 () Bool)

(assert (=> b!631497 m!605897))

(declare-fun m!605899 () Bool)

(assert (=> b!631506 m!605899))

(declare-fun m!605901 () Bool)

(assert (=> b!631510 m!605901))

(assert (=> b!631510 m!605889))

(assert (=> b!631510 m!605889))

(declare-fun m!605903 () Bool)

(assert (=> b!631510 m!605903))

(declare-fun m!605905 () Bool)

(assert (=> start!57072 m!605905))

(declare-fun m!605907 () Bool)

(assert (=> start!57072 m!605907))

(assert (=> b!631503 m!605889))

(assert (=> b!631503 m!605889))

(declare-fun m!605909 () Bool)

(assert (=> b!631503 m!605909))

(assert (=> b!631505 m!605891))

(declare-fun m!605911 () Bool)

(assert (=> b!631505 m!605911))

(assert (=> b!631505 m!605889))

(declare-fun m!605913 () Bool)

(assert (=> b!631500 m!605913))

(assert (=> b!631504 m!605891))

(declare-fun m!605915 () Bool)

(assert (=> b!631504 m!605915))

(check-sat (not b!631510) (not b!631506) (not b!631508) (not b!631498) (not b!631497) (not b!631503) (not b!631500) (not start!57072) (not b!631499))
(check-sat)
