; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57138 () Bool)

(assert start!57138)

(declare-fun b!631976 () Bool)

(declare-fun res!408571 () Bool)

(declare-fun e!361342 () Bool)

(assert (=> b!631976 (=> (not res!408571) (not e!361342))))

(declare-datatypes ((array!38100 0))(
  ( (array!38101 (arr!18280 (Array (_ BitVec 32) (_ BitVec 64))) (size!18644 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38100)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631976 (= res!408571 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631977 () Bool)

(declare-fun res!408563 () Bool)

(assert (=> b!631977 (=> (not res!408563) (not e!361342))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631977 (= res!408563 (and (= (size!18644 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18644 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18644 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631978 () Bool)

(declare-fun e!361344 () Bool)

(declare-fun e!361340 () Bool)

(assert (=> b!631978 (= e!361344 e!361340)))

(declare-fun res!408564 () Bool)

(assert (=> b!631978 (=> (not res!408564) (not e!361340))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6676 0))(
  ( (MissingZero!6676 (index!28997 (_ BitVec 32))) (Found!6676 (index!28998 (_ BitVec 32))) (Intermediate!6676 (undefined!7488 Bool) (index!28999 (_ BitVec 32)) (x!57890 (_ BitVec 32))) (Undefined!6676) (MissingVacant!6676 (index!29000 (_ BitVec 32))) )
))
(declare-fun lt!291992 () SeekEntryResult!6676)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631978 (= res!408564 (and (= lt!291992 (Found!6676 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18280 a!2986) index!984) (select (arr!18280 a!2986) j!136))) (not (= (select (arr!18280 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38100 (_ BitVec 32)) SeekEntryResult!6676)

(assert (=> b!631978 (= lt!291992 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18280 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631979 () Bool)

(declare-fun res!408560 () Bool)

(declare-fun e!361345 () Bool)

(assert (=> b!631979 (=> (not res!408560) (not e!361345))))

(declare-datatypes ((List!12228 0))(
  ( (Nil!12225) (Cons!12224 (h!13272 (_ BitVec 64)) (t!18448 List!12228)) )
))
(declare-fun arrayNoDuplicates!0 (array!38100 (_ BitVec 32) List!12228) Bool)

(assert (=> b!631979 (= res!408560 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12225))))

(declare-fun b!631980 () Bool)

(declare-datatypes ((Unit!21213 0))(
  ( (Unit!21214) )
))
(declare-fun e!361343 () Unit!21213)

(declare-fun Unit!21215 () Unit!21213)

(assert (=> b!631980 (= e!361343 Unit!21215)))

(declare-fun b!631981 () Bool)

(assert (=> b!631981 (= e!361345 e!361344)))

(declare-fun res!408569 () Bool)

(assert (=> b!631981 (=> (not res!408569) (not e!361344))))

(assert (=> b!631981 (= res!408569 (= (select (store (arr!18280 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291989 () array!38100)

(assert (=> b!631981 (= lt!291989 (array!38101 (store (arr!18280 a!2986) i!1108 k0!1786) (size!18644 a!2986)))))

(declare-fun res!408561 () Bool)

(assert (=> start!57138 (=> (not res!408561) (not e!361342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57138 (= res!408561 (validMask!0 mask!3053))))

(assert (=> start!57138 e!361342))

(assert (=> start!57138 true))

(declare-fun array_inv!14139 (array!38100) Bool)

(assert (=> start!57138 (array_inv!14139 a!2986)))

(declare-fun b!631982 () Bool)

(declare-fun res!408570 () Bool)

(assert (=> b!631982 (=> (not res!408570) (not e!361342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631982 (= res!408570 (validKeyInArray!0 k0!1786))))

(declare-fun b!631983 () Bool)

(declare-fun e!361341 () Bool)

(declare-fun lt!291993 () SeekEntryResult!6676)

(assert (=> b!631983 (= e!361341 (= lt!291992 lt!291993))))

(declare-fun b!631984 () Bool)

(declare-fun res!408567 () Bool)

(assert (=> b!631984 (=> (not res!408567) (not e!361345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38100 (_ BitVec 32)) Bool)

(assert (=> b!631984 (= res!408567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631985 () Bool)

(declare-fun e!361346 () Bool)

(assert (=> b!631985 (= e!361346 true)))

(assert (=> b!631985 (= (select (store (arr!18280 a!2986) i!1108 k0!1786) index!984) (select (arr!18280 a!2986) j!136))))

(declare-fun b!631986 () Bool)

(assert (=> b!631986 (= e!361340 (not e!361346))))

(declare-fun res!408562 () Bool)

(assert (=> b!631986 (=> res!408562 e!361346)))

(declare-fun lt!291991 () SeekEntryResult!6676)

(assert (=> b!631986 (= res!408562 (not (= lt!291991 (Found!6676 index!984))))))

(declare-fun lt!291997 () Unit!21213)

(assert (=> b!631986 (= lt!291997 e!361343)))

(declare-fun c!72077 () Bool)

(assert (=> b!631986 (= c!72077 (= lt!291991 Undefined!6676))))

(declare-fun lt!291990 () (_ BitVec 64))

(assert (=> b!631986 (= lt!291991 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291990 lt!291989 mask!3053))))

(assert (=> b!631986 e!361341))

(declare-fun res!408566 () Bool)

(assert (=> b!631986 (=> (not res!408566) (not e!361341))))

(declare-fun lt!291996 () (_ BitVec 32))

(assert (=> b!631986 (= res!408566 (= lt!291993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291996 vacantSpotIndex!68 lt!291990 lt!291989 mask!3053)))))

(assert (=> b!631986 (= lt!291993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291996 vacantSpotIndex!68 (select (arr!18280 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631986 (= lt!291990 (select (store (arr!18280 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291994 () Unit!21213)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38100 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21213)

(assert (=> b!631986 (= lt!291994 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291996 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631986 (= lt!291996 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!631987 () Bool)

(declare-fun res!408559 () Bool)

(assert (=> b!631987 (=> (not res!408559) (not e!361342))))

(assert (=> b!631987 (= res!408559 (validKeyInArray!0 (select (arr!18280 a!2986) j!136)))))

(declare-fun b!631988 () Bool)

(declare-fun res!408568 () Bool)

(assert (=> b!631988 (=> (not res!408568) (not e!361345))))

(assert (=> b!631988 (= res!408568 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18280 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631989 () Bool)

(assert (=> b!631989 (= e!361342 e!361345)))

(declare-fun res!408565 () Bool)

(assert (=> b!631989 (=> (not res!408565) (not e!361345))))

(declare-fun lt!291995 () SeekEntryResult!6676)

(assert (=> b!631989 (= res!408565 (or (= lt!291995 (MissingZero!6676 i!1108)) (= lt!291995 (MissingVacant!6676 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38100 (_ BitVec 32)) SeekEntryResult!6676)

(assert (=> b!631989 (= lt!291995 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631990 () Bool)

(declare-fun Unit!21216 () Unit!21213)

(assert (=> b!631990 (= e!361343 Unit!21216)))

(assert (=> b!631990 false))

(assert (= (and start!57138 res!408561) b!631977))

(assert (= (and b!631977 res!408563) b!631987))

(assert (= (and b!631987 res!408559) b!631982))

(assert (= (and b!631982 res!408570) b!631976))

(assert (= (and b!631976 res!408571) b!631989))

(assert (= (and b!631989 res!408565) b!631984))

(assert (= (and b!631984 res!408567) b!631979))

(assert (= (and b!631979 res!408560) b!631988))

(assert (= (and b!631988 res!408568) b!631981))

(assert (= (and b!631981 res!408569) b!631978))

(assert (= (and b!631978 res!408564) b!631986))

(assert (= (and b!631986 res!408566) b!631983))

(assert (= (and b!631986 c!72077) b!631990))

(assert (= (and b!631986 (not c!72077)) b!631980))

(assert (= (and b!631986 (not res!408562)) b!631985))

(declare-fun m!607159 () Bool)

(assert (=> b!631982 m!607159))

(declare-fun m!607161 () Bool)

(assert (=> b!631987 m!607161))

(assert (=> b!631987 m!607161))

(declare-fun m!607163 () Bool)

(assert (=> b!631987 m!607163))

(declare-fun m!607165 () Bool)

(assert (=> b!631976 m!607165))

(declare-fun m!607167 () Bool)

(assert (=> start!57138 m!607167))

(declare-fun m!607169 () Bool)

(assert (=> start!57138 m!607169))

(declare-fun m!607171 () Bool)

(assert (=> b!631978 m!607171))

(assert (=> b!631978 m!607161))

(assert (=> b!631978 m!607161))

(declare-fun m!607173 () Bool)

(assert (=> b!631978 m!607173))

(declare-fun m!607175 () Bool)

(assert (=> b!631988 m!607175))

(declare-fun m!607177 () Bool)

(assert (=> b!631981 m!607177))

(declare-fun m!607179 () Bool)

(assert (=> b!631981 m!607179))

(declare-fun m!607181 () Bool)

(assert (=> b!631989 m!607181))

(assert (=> b!631985 m!607177))

(declare-fun m!607183 () Bool)

(assert (=> b!631985 m!607183))

(assert (=> b!631985 m!607161))

(declare-fun m!607185 () Bool)

(assert (=> b!631984 m!607185))

(declare-fun m!607187 () Bool)

(assert (=> b!631979 m!607187))

(declare-fun m!607189 () Bool)

(assert (=> b!631986 m!607189))

(declare-fun m!607191 () Bool)

(assert (=> b!631986 m!607191))

(assert (=> b!631986 m!607161))

(assert (=> b!631986 m!607177))

(declare-fun m!607193 () Bool)

(assert (=> b!631986 m!607193))

(declare-fun m!607195 () Bool)

(assert (=> b!631986 m!607195))

(declare-fun m!607197 () Bool)

(assert (=> b!631986 m!607197))

(assert (=> b!631986 m!607161))

(declare-fun m!607199 () Bool)

(assert (=> b!631986 m!607199))

(check-sat (not b!631984) (not b!631979) (not b!631987) (not b!631989) (not start!57138) (not b!631976) (not b!631978) (not b!631982) (not b!631986))
(check-sat)
