; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56976 () Bool)

(assert start!56976)

(declare-fun b!630468 () Bool)

(declare-fun res!407614 () Bool)

(declare-fun e!360487 () Bool)

(assert (=> b!630468 (=> (not res!407614) (not e!360487))))

(declare-datatypes ((array!38064 0))(
  ( (array!38065 (arr!18266 (Array (_ BitVec 32) (_ BitVec 64))) (size!18631 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38064)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630468 (= res!407614 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630469 () Bool)

(declare-datatypes ((Unit!21140 0))(
  ( (Unit!21141) )
))
(declare-fun e!360490 () Unit!21140)

(declare-fun Unit!21142 () Unit!21140)

(assert (=> b!630469 (= e!360490 Unit!21142)))

(declare-fun b!630470 () Bool)

(declare-fun Unit!21143 () Unit!21140)

(assert (=> b!630470 (= e!360490 Unit!21143)))

(assert (=> b!630470 false))

(declare-fun b!630471 () Bool)

(declare-fun res!407611 () Bool)

(assert (=> b!630471 (=> (not res!407611) (not e!360487))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630471 (= res!407611 (validKeyInArray!0 (select (arr!18266 a!2986) j!136)))))

(declare-fun b!630472 () Bool)

(declare-fun e!360489 () Bool)

(declare-fun e!360492 () Bool)

(assert (=> b!630472 (= e!360489 e!360492)))

(declare-fun res!407610 () Bool)

(assert (=> b!630472 (=> (not res!407610) (not e!360492))))

(declare-datatypes ((SeekEntryResult!6703 0))(
  ( (MissingZero!6703 (index!29102 (_ BitVec 32))) (Found!6703 (index!29103 (_ BitVec 32))) (Intermediate!6703 (undefined!7515 Bool) (index!29104 (_ BitVec 32)) (x!57852 (_ BitVec 32))) (Undefined!6703) (MissingVacant!6703 (index!29105 (_ BitVec 32))) )
))
(declare-fun lt!291095 () SeekEntryResult!6703)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630472 (= res!407610 (and (= lt!291095 (Found!6703 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18266 a!2986) index!984) (select (arr!18266 a!2986) j!136))) (not (= (select (arr!18266 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38064 (_ BitVec 32)) SeekEntryResult!6703)

(assert (=> b!630472 (= lt!291095 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18266 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630474 () Bool)

(declare-fun e!360488 () Bool)

(declare-fun lt!291094 () SeekEntryResult!6703)

(assert (=> b!630474 (= e!360488 (= lt!291095 lt!291094))))

(declare-fun b!630475 () Bool)

(declare-fun e!360486 () Bool)

(assert (=> b!630475 (= e!360487 e!360486)))

(declare-fun res!407608 () Bool)

(assert (=> b!630475 (=> (not res!407608) (not e!360486))))

(declare-fun lt!291100 () SeekEntryResult!6703)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630475 (= res!407608 (or (= lt!291100 (MissingZero!6703 i!1108)) (= lt!291100 (MissingVacant!6703 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38064 (_ BitVec 32)) SeekEntryResult!6703)

(assert (=> b!630475 (= lt!291100 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630476 () Bool)

(declare-fun res!407615 () Bool)

(assert (=> b!630476 (=> (not res!407615) (not e!360487))))

(assert (=> b!630476 (= res!407615 (and (= (size!18631 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18631 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18631 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630477 () Bool)

(declare-fun res!407609 () Bool)

(assert (=> b!630477 (=> (not res!407609) (not e!360486))))

(assert (=> b!630477 (= res!407609 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18266 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630478 () Bool)

(declare-fun res!407604 () Bool)

(assert (=> b!630478 (=> (not res!407604) (not e!360486))))

(declare-datatypes ((List!12346 0))(
  ( (Nil!12343) (Cons!12342 (h!13387 (_ BitVec 64)) (t!18565 List!12346)) )
))
(declare-fun arrayNoDuplicates!0 (array!38064 (_ BitVec 32) List!12346) Bool)

(assert (=> b!630478 (= res!407604 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12343))))

(declare-fun b!630479 () Bool)

(declare-fun res!407606 () Bool)

(assert (=> b!630479 (=> (not res!407606) (not e!360486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38064 (_ BitVec 32)) Bool)

(assert (=> b!630479 (= res!407606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630480 () Bool)

(assert (=> b!630480 (= e!360492 (not true))))

(declare-fun lt!291096 () Unit!21140)

(assert (=> b!630480 (= lt!291096 e!360490)))

(declare-fun c!71799 () Bool)

(declare-fun lt!291097 () (_ BitVec 64))

(declare-fun lt!291093 () array!38064)

(assert (=> b!630480 (= c!71799 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291097 lt!291093 mask!3053) Undefined!6703))))

(assert (=> b!630480 e!360488))

(declare-fun res!407605 () Bool)

(assert (=> b!630480 (=> (not res!407605) (not e!360488))))

(declare-fun lt!291099 () (_ BitVec 32))

(assert (=> b!630480 (= res!407605 (= lt!291094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291099 vacantSpotIndex!68 lt!291097 lt!291093 mask!3053)))))

(assert (=> b!630480 (= lt!291094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291099 vacantSpotIndex!68 (select (arr!18266 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630480 (= lt!291097 (select (store (arr!18266 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291098 () Unit!21140)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38064 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21140)

(assert (=> b!630480 (= lt!291098 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291099 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630480 (= lt!291099 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630481 () Bool)

(declare-fun res!407607 () Bool)

(assert (=> b!630481 (=> (not res!407607) (not e!360487))))

(assert (=> b!630481 (= res!407607 (validKeyInArray!0 k0!1786))))

(declare-fun b!630473 () Bool)

(assert (=> b!630473 (= e!360486 e!360489)))

(declare-fun res!407613 () Bool)

(assert (=> b!630473 (=> (not res!407613) (not e!360489))))

(assert (=> b!630473 (= res!407613 (= (select (store (arr!18266 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630473 (= lt!291093 (array!38065 (store (arr!18266 a!2986) i!1108 k0!1786) (size!18631 a!2986)))))

(declare-fun res!407612 () Bool)

(assert (=> start!56976 (=> (not res!407612) (not e!360487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56976 (= res!407612 (validMask!0 mask!3053))))

(assert (=> start!56976 e!360487))

(assert (=> start!56976 true))

(declare-fun array_inv!14149 (array!38064) Bool)

(assert (=> start!56976 (array_inv!14149 a!2986)))

(assert (= (and start!56976 res!407612) b!630476))

(assert (= (and b!630476 res!407615) b!630471))

(assert (= (and b!630471 res!407611) b!630481))

(assert (= (and b!630481 res!407607) b!630468))

(assert (= (and b!630468 res!407614) b!630475))

(assert (= (and b!630475 res!407608) b!630479))

(assert (= (and b!630479 res!407606) b!630478))

(assert (= (and b!630478 res!407604) b!630477))

(assert (= (and b!630477 res!407609) b!630473))

(assert (= (and b!630473 res!407613) b!630472))

(assert (= (and b!630472 res!407610) b!630480))

(assert (= (and b!630480 res!407605) b!630474))

(assert (= (and b!630480 c!71799) b!630470))

(assert (= (and b!630480 (not c!71799)) b!630469))

(declare-fun m!604939 () Bool)

(assert (=> b!630475 m!604939))

(declare-fun m!604941 () Bool)

(assert (=> b!630472 m!604941))

(declare-fun m!604943 () Bool)

(assert (=> b!630472 m!604943))

(assert (=> b!630472 m!604943))

(declare-fun m!604945 () Bool)

(assert (=> b!630472 m!604945))

(declare-fun m!604947 () Bool)

(assert (=> b!630481 m!604947))

(declare-fun m!604949 () Bool)

(assert (=> b!630473 m!604949))

(declare-fun m!604951 () Bool)

(assert (=> b!630473 m!604951))

(declare-fun m!604953 () Bool)

(assert (=> b!630468 m!604953))

(declare-fun m!604955 () Bool)

(assert (=> start!56976 m!604955))

(declare-fun m!604957 () Bool)

(assert (=> start!56976 m!604957))

(declare-fun m!604959 () Bool)

(assert (=> b!630477 m!604959))

(declare-fun m!604961 () Bool)

(assert (=> b!630480 m!604961))

(declare-fun m!604963 () Bool)

(assert (=> b!630480 m!604963))

(assert (=> b!630480 m!604943))

(declare-fun m!604965 () Bool)

(assert (=> b!630480 m!604965))

(declare-fun m!604967 () Bool)

(assert (=> b!630480 m!604967))

(declare-fun m!604969 () Bool)

(assert (=> b!630480 m!604969))

(assert (=> b!630480 m!604943))

(declare-fun m!604971 () Bool)

(assert (=> b!630480 m!604971))

(assert (=> b!630480 m!604949))

(assert (=> b!630471 m!604943))

(assert (=> b!630471 m!604943))

(declare-fun m!604973 () Bool)

(assert (=> b!630471 m!604973))

(declare-fun m!604975 () Bool)

(assert (=> b!630479 m!604975))

(declare-fun m!604977 () Bool)

(assert (=> b!630478 m!604977))

(check-sat (not b!630481) (not b!630471) (not b!630480) (not b!630472) (not start!56976) (not b!630468) (not b!630479) (not b!630478) (not b!630475))
(check-sat)
