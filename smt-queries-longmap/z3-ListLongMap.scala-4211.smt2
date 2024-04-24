; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57768 () Bool)

(assert start!57768)

(declare-fun b!638449 () Bool)

(declare-fun e!365338 () Bool)

(assert (=> b!638449 (= e!365338 true)))

(declare-fun lt!295242 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12306 0))(
  ( (Nil!12303) (Cons!12302 (h!13350 (_ BitVec 64)) (t!18526 List!12306)) )
))
(declare-fun contains!3098 (List!12306 (_ BitVec 64)) Bool)

(assert (=> b!638449 (= lt!295242 (contains!3098 Nil!12303 k0!1786))))

(declare-fun b!638450 () Bool)

(declare-fun e!365339 () Bool)

(declare-fun e!365335 () Bool)

(assert (=> b!638450 (= e!365339 (not e!365335))))

(declare-fun res!413184 () Bool)

(assert (=> b!638450 (=> res!413184 e!365335)))

(declare-datatypes ((SeekEntryResult!6754 0))(
  ( (MissingZero!6754 (index!29330 (_ BitVec 32))) (Found!6754 (index!29331 (_ BitVec 32))) (Intermediate!6754 (undefined!7566 Bool) (index!29332 (_ BitVec 32)) (x!58239 (_ BitVec 32))) (Undefined!6754) (MissingVacant!6754 (index!29333 (_ BitVec 32))) )
))
(declare-fun lt!295238 () SeekEntryResult!6754)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638450 (= res!413184 (not (= lt!295238 (Found!6754 index!984))))))

(declare-datatypes ((Unit!21525 0))(
  ( (Unit!21526) )
))
(declare-fun lt!295237 () Unit!21525)

(declare-fun e!365336 () Unit!21525)

(assert (=> b!638450 (= lt!295237 e!365336)))

(declare-fun c!73004 () Bool)

(assert (=> b!638450 (= c!73004 (= lt!295238 Undefined!6754))))

(declare-fun lt!295236 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38277 0))(
  ( (array!38278 (arr!18358 (Array (_ BitVec 32) (_ BitVec 64))) (size!18722 (_ BitVec 32))) )
))
(declare-fun lt!295235 () array!38277)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38277 (_ BitVec 32)) SeekEntryResult!6754)

(assert (=> b!638450 (= lt!295238 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295236 lt!295235 mask!3053))))

(declare-fun e!365334 () Bool)

(assert (=> b!638450 e!365334))

(declare-fun res!413191 () Bool)

(assert (=> b!638450 (=> (not res!413191) (not e!365334))))

(declare-fun lt!295246 () (_ BitVec 32))

(declare-fun lt!295245 () SeekEntryResult!6754)

(assert (=> b!638450 (= res!413191 (= lt!295245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295246 vacantSpotIndex!68 lt!295236 lt!295235 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38277)

(assert (=> b!638450 (= lt!295245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295246 vacantSpotIndex!68 (select (arr!18358 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638450 (= lt!295236 (select (store (arr!18358 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295243 () Unit!21525)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21525)

(assert (=> b!638450 (= lt!295243 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295246 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638450 (= lt!295246 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!638451 () Bool)

(declare-fun res!413180 () Bool)

(declare-fun e!365337 () Bool)

(assert (=> b!638451 (=> (not res!413180) (not e!365337))))

(declare-fun arrayContainsKey!0 (array!38277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638451 (= res!413180 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638452 () Bool)

(declare-fun e!365331 () Bool)

(assert (=> b!638452 (= e!365331 e!365339)))

(declare-fun res!413187 () Bool)

(assert (=> b!638452 (=> (not res!413187) (not e!365339))))

(declare-fun lt!295240 () SeekEntryResult!6754)

(assert (=> b!638452 (= res!413187 (and (= lt!295240 (Found!6754 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18358 a!2986) index!984) (select (arr!18358 a!2986) j!136))) (not (= (select (arr!18358 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638452 (= lt!295240 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18358 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638453 () Bool)

(declare-fun res!413193 () Bool)

(assert (=> b!638453 (=> res!413193 e!365338)))

(assert (=> b!638453 (= res!413193 (contains!3098 Nil!12303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638454 () Bool)

(declare-fun e!365341 () Bool)

(assert (=> b!638454 (= e!365341 e!365338)))

(declare-fun res!413183 () Bool)

(assert (=> b!638454 (=> res!413183 e!365338)))

(assert (=> b!638454 (= res!413183 (or (bvsge (size!18722 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18722 a!2986))))))

(assert (=> b!638454 (arrayContainsKey!0 lt!295235 (select (arr!18358 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295239 () Unit!21525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21525)

(assert (=> b!638454 (= lt!295239 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295235 (select (arr!18358 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638455 () Bool)

(declare-fun res!413197 () Bool)

(declare-fun e!365342 () Bool)

(assert (=> b!638455 (=> (not res!413197) (not e!365342))))

(declare-fun arrayNoDuplicates!0 (array!38277 (_ BitVec 32) List!12306) Bool)

(assert (=> b!638455 (= res!413197 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12303))))

(declare-fun b!638456 () Bool)

(declare-fun res!413190 () Bool)

(assert (=> b!638456 (=> (not res!413190) (not e!365337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638456 (= res!413190 (validKeyInArray!0 k0!1786))))

(declare-fun b!638457 () Bool)

(assert (=> b!638457 (= e!365334 (= lt!295240 lt!295245))))

(declare-fun b!638458 () Bool)

(assert (=> b!638458 (= e!365342 e!365331)))

(declare-fun res!413185 () Bool)

(assert (=> b!638458 (=> (not res!413185) (not e!365331))))

(assert (=> b!638458 (= res!413185 (= (select (store (arr!18358 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638458 (= lt!295235 (array!38278 (store (arr!18358 a!2986) i!1108 k0!1786) (size!18722 a!2986)))))

(declare-fun b!638459 () Bool)

(assert (=> b!638459 (= e!365335 e!365341)))

(declare-fun res!413181 () Bool)

(assert (=> b!638459 (=> res!413181 e!365341)))

(declare-fun lt!295244 () (_ BitVec 64))

(assert (=> b!638459 (= res!413181 (or (not (= (select (arr!18358 a!2986) j!136) lt!295236)) (not (= (select (arr!18358 a!2986) j!136) lt!295244)) (bvsge j!136 index!984)))))

(declare-fun e!365332 () Bool)

(assert (=> b!638459 e!365332))

(declare-fun res!413186 () Bool)

(assert (=> b!638459 (=> (not res!413186) (not e!365332))))

(assert (=> b!638459 (= res!413186 (= lt!295244 (select (arr!18358 a!2986) j!136)))))

(assert (=> b!638459 (= lt!295244 (select (store (arr!18358 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638460 () Bool)

(declare-fun res!413194 () Bool)

(assert (=> b!638460 (=> res!413194 e!365338)))

(declare-fun noDuplicate!400 (List!12306) Bool)

(assert (=> b!638460 (= res!413194 (not (noDuplicate!400 Nil!12303)))))

(declare-fun b!638461 () Bool)

(declare-fun e!365343 () Bool)

(declare-fun e!365340 () Bool)

(assert (=> b!638461 (= e!365343 e!365340)))

(declare-fun res!413192 () Bool)

(assert (=> b!638461 (=> (not res!413192) (not e!365340))))

(assert (=> b!638461 (= res!413192 (arrayContainsKey!0 lt!295235 (select (arr!18358 a!2986) j!136) j!136))))

(declare-fun b!638462 () Bool)

(assert (=> b!638462 (= e!365332 e!365343)))

(declare-fun res!413177 () Bool)

(assert (=> b!638462 (=> res!413177 e!365343)))

(assert (=> b!638462 (= res!413177 (or (not (= (select (arr!18358 a!2986) j!136) lt!295236)) (not (= (select (arr!18358 a!2986) j!136) lt!295244)) (bvsge j!136 index!984)))))

(declare-fun b!638463 () Bool)

(declare-fun Unit!21527 () Unit!21525)

(assert (=> b!638463 (= e!365336 Unit!21527)))

(declare-fun b!638464 () Bool)

(declare-fun res!413179 () Bool)

(assert (=> b!638464 (=> (not res!413179) (not e!365342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38277 (_ BitVec 32)) Bool)

(assert (=> b!638464 (= res!413179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638448 () Bool)

(declare-fun res!413182 () Bool)

(assert (=> b!638448 (=> res!413182 e!365338)))

(assert (=> b!638448 (= res!413182 (contains!3098 Nil!12303 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!413196 () Bool)

(assert (=> start!57768 (=> (not res!413196) (not e!365337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57768 (= res!413196 (validMask!0 mask!3053))))

(assert (=> start!57768 e!365337))

(assert (=> start!57768 true))

(declare-fun array_inv!14217 (array!38277) Bool)

(assert (=> start!57768 (array_inv!14217 a!2986)))

(declare-fun b!638465 () Bool)

(declare-fun Unit!21528 () Unit!21525)

(assert (=> b!638465 (= e!365336 Unit!21528)))

(assert (=> b!638465 false))

(declare-fun b!638466 () Bool)

(assert (=> b!638466 (= e!365337 e!365342)))

(declare-fun res!413188 () Bool)

(assert (=> b!638466 (=> (not res!413188) (not e!365342))))

(declare-fun lt!295241 () SeekEntryResult!6754)

(assert (=> b!638466 (= res!413188 (or (= lt!295241 (MissingZero!6754 i!1108)) (= lt!295241 (MissingVacant!6754 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38277 (_ BitVec 32)) SeekEntryResult!6754)

(assert (=> b!638466 (= lt!295241 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638467 () Bool)

(declare-fun res!413178 () Bool)

(assert (=> b!638467 (=> (not res!413178) (not e!365342))))

(assert (=> b!638467 (= res!413178 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18358 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638468 () Bool)

(declare-fun res!413195 () Bool)

(assert (=> b!638468 (=> (not res!413195) (not e!365337))))

(assert (=> b!638468 (= res!413195 (validKeyInArray!0 (select (arr!18358 a!2986) j!136)))))

(declare-fun b!638469 () Bool)

(assert (=> b!638469 (= e!365340 (arrayContainsKey!0 lt!295235 (select (arr!18358 a!2986) j!136) index!984))))

(declare-fun b!638470 () Bool)

(declare-fun res!413189 () Bool)

(assert (=> b!638470 (=> (not res!413189) (not e!365337))))

(assert (=> b!638470 (= res!413189 (and (= (size!18722 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18722 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18722 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57768 res!413196) b!638470))

(assert (= (and b!638470 res!413189) b!638468))

(assert (= (and b!638468 res!413195) b!638456))

(assert (= (and b!638456 res!413190) b!638451))

(assert (= (and b!638451 res!413180) b!638466))

(assert (= (and b!638466 res!413188) b!638464))

(assert (= (and b!638464 res!413179) b!638455))

(assert (= (and b!638455 res!413197) b!638467))

(assert (= (and b!638467 res!413178) b!638458))

(assert (= (and b!638458 res!413185) b!638452))

(assert (= (and b!638452 res!413187) b!638450))

(assert (= (and b!638450 res!413191) b!638457))

(assert (= (and b!638450 c!73004) b!638465))

(assert (= (and b!638450 (not c!73004)) b!638463))

(assert (= (and b!638450 (not res!413184)) b!638459))

(assert (= (and b!638459 res!413186) b!638462))

(assert (= (and b!638462 (not res!413177)) b!638461))

(assert (= (and b!638461 res!413192) b!638469))

(assert (= (and b!638459 (not res!413181)) b!638454))

(assert (= (and b!638454 (not res!413183)) b!638460))

(assert (= (and b!638460 (not res!413194)) b!638453))

(assert (= (and b!638453 (not res!413193)) b!638448))

(assert (= (and b!638448 (not res!413182)) b!638449))

(declare-fun m!612769 () Bool)

(assert (=> b!638449 m!612769))

(declare-fun m!612771 () Bool)

(assert (=> b!638448 m!612771))

(declare-fun m!612773 () Bool)

(assert (=> b!638461 m!612773))

(assert (=> b!638461 m!612773))

(declare-fun m!612775 () Bool)

(assert (=> b!638461 m!612775))

(declare-fun m!612777 () Bool)

(assert (=> b!638450 m!612777))

(declare-fun m!612779 () Bool)

(assert (=> b!638450 m!612779))

(assert (=> b!638450 m!612773))

(declare-fun m!612781 () Bool)

(assert (=> b!638450 m!612781))

(declare-fun m!612783 () Bool)

(assert (=> b!638450 m!612783))

(declare-fun m!612785 () Bool)

(assert (=> b!638450 m!612785))

(assert (=> b!638450 m!612773))

(declare-fun m!612787 () Bool)

(assert (=> b!638450 m!612787))

(declare-fun m!612789 () Bool)

(assert (=> b!638450 m!612789))

(declare-fun m!612791 () Bool)

(assert (=> b!638456 m!612791))

(declare-fun m!612793 () Bool)

(assert (=> b!638467 m!612793))

(declare-fun m!612795 () Bool)

(assert (=> b!638451 m!612795))

(declare-fun m!612797 () Bool)

(assert (=> b!638466 m!612797))

(declare-fun m!612799 () Bool)

(assert (=> b!638455 m!612799))

(declare-fun m!612801 () Bool)

(assert (=> start!57768 m!612801))

(declare-fun m!612803 () Bool)

(assert (=> start!57768 m!612803))

(declare-fun m!612805 () Bool)

(assert (=> b!638464 m!612805))

(assert (=> b!638468 m!612773))

(assert (=> b!638468 m!612773))

(declare-fun m!612807 () Bool)

(assert (=> b!638468 m!612807))

(declare-fun m!612809 () Bool)

(assert (=> b!638453 m!612809))

(assert (=> b!638458 m!612781))

(declare-fun m!612811 () Bool)

(assert (=> b!638458 m!612811))

(assert (=> b!638469 m!612773))

(assert (=> b!638469 m!612773))

(declare-fun m!612813 () Bool)

(assert (=> b!638469 m!612813))

(declare-fun m!612815 () Bool)

(assert (=> b!638452 m!612815))

(assert (=> b!638452 m!612773))

(assert (=> b!638452 m!612773))

(declare-fun m!612817 () Bool)

(assert (=> b!638452 m!612817))

(assert (=> b!638462 m!612773))

(assert (=> b!638454 m!612773))

(assert (=> b!638454 m!612773))

(declare-fun m!612819 () Bool)

(assert (=> b!638454 m!612819))

(assert (=> b!638454 m!612773))

(declare-fun m!612821 () Bool)

(assert (=> b!638454 m!612821))

(assert (=> b!638459 m!612773))

(assert (=> b!638459 m!612781))

(declare-fun m!612823 () Bool)

(assert (=> b!638459 m!612823))

(declare-fun m!612825 () Bool)

(assert (=> b!638460 m!612825))

(check-sat (not b!638466) (not b!638453) (not b!638469) (not b!638448) (not b!638449) (not b!638450) (not b!638460) (not b!638451) (not b!638464) (not b!638455) (not b!638452) (not b!638468) (not start!57768) (not b!638454) (not b!638461) (not b!638456))
(check-sat)
