; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56050 () Bool)

(assert start!56050)

(declare-fun b!617198 () Bool)

(declare-fun res!397615 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617198 (= res!397615 (bvsge j!136 index!984))))

(declare-fun e!353921 () Bool)

(assert (=> b!617198 (=> res!397615 e!353921)))

(declare-fun e!353910 () Bool)

(assert (=> b!617198 (= e!353910 e!353921)))

(declare-fun b!617199 () Bool)

(declare-fun e!353916 () Bool)

(assert (=> b!617199 (= e!353916 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37520 0))(
  ( (array!37521 (arr!18006 (Array (_ BitVec 32) (_ BitVec 64))) (size!18370 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37520)

(assert (=> b!617199 (= (select (store (arr!18006 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617200 () Bool)

(declare-fun e!353919 () Bool)

(declare-fun e!353909 () Bool)

(assert (=> b!617200 (= e!353919 e!353909)))

(declare-fun res!397607 () Bool)

(assert (=> b!617200 (=> (not res!397607) (not e!353909))))

(declare-datatypes ((SeekEntryResult!6446 0))(
  ( (MissingZero!6446 (index!28068 (_ BitVec 32))) (Found!6446 (index!28069 (_ BitVec 32))) (Intermediate!6446 (undefined!7258 Bool) (index!28070 (_ BitVec 32)) (x!56862 (_ BitVec 32))) (Undefined!6446) (MissingVacant!6446 (index!28071 (_ BitVec 32))) )
))
(declare-fun lt!284126 () SeekEntryResult!6446)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617200 (= res!397607 (and (= lt!284126 (Found!6446 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18006 a!2986) index!984) (select (arr!18006 a!2986) j!136))) (not (= (select (arr!18006 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37520 (_ BitVec 32)) SeekEntryResult!6446)

(assert (=> b!617200 (= lt!284126 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18006 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617201 () Bool)

(declare-fun e!353914 () Bool)

(assert (=> b!617201 (= e!353914 e!353919)))

(declare-fun res!397604 () Bool)

(assert (=> b!617201 (=> (not res!397604) (not e!353919))))

(assert (=> b!617201 (= res!397604 (= (select (store (arr!18006 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!284125 () array!37520)

(assert (=> b!617201 (= lt!284125 (array!37521 (store (arr!18006 a!2986) i!1108 k!1786) (size!18370 a!2986)))))

(declare-fun b!617202 () Bool)

(declare-fun res!397601 () Bool)

(declare-fun e!353915 () Bool)

(assert (=> b!617202 (=> (not res!397601) (not e!353915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617202 (= res!397601 (validKeyInArray!0 k!1786))))

(declare-fun b!617203 () Bool)

(declare-fun e!353911 () Bool)

(declare-fun arrayContainsKey!0 (array!37520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617203 (= e!353911 (arrayContainsKey!0 lt!284125 (select (arr!18006 a!2986) j!136) index!984))))

(declare-fun b!617204 () Bool)

(declare-fun res!397613 () Bool)

(assert (=> b!617204 (=> (not res!397613) (not e!353914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37520 (_ BitVec 32)) Bool)

(assert (=> b!617204 (= res!397613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617205 () Bool)

(declare-datatypes ((Unit!20188 0))(
  ( (Unit!20189) )
))
(declare-fun e!353922 () Unit!20188)

(declare-fun Unit!20190 () Unit!20188)

(assert (=> b!617205 (= e!353922 Unit!20190)))

(declare-fun b!617206 () Bool)

(declare-fun res!397614 () Bool)

(assert (=> b!617206 (=> (not res!397614) (not e!353915))))

(assert (=> b!617206 (= res!397614 (validKeyInArray!0 (select (arr!18006 a!2986) j!136)))))

(declare-fun b!617207 () Bool)

(assert (=> b!617207 false))

(declare-fun lt!284119 () Unit!20188)

(declare-datatypes ((List!12047 0))(
  ( (Nil!12044) (Cons!12043 (h!13088 (_ BitVec 64)) (t!18275 List!12047)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37520 (_ BitVec 64) (_ BitVec 32) List!12047) Unit!20188)

(assert (=> b!617207 (= lt!284119 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284125 (select (arr!18006 a!2986) j!136) index!984 Nil!12044))))

(declare-fun arrayNoDuplicates!0 (array!37520 (_ BitVec 32) List!12047) Bool)

(assert (=> b!617207 (arrayNoDuplicates!0 lt!284125 index!984 Nil!12044)))

(declare-fun lt!284123 () Unit!20188)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37520 (_ BitVec 32) (_ BitVec 32)) Unit!20188)

(assert (=> b!617207 (= lt!284123 (lemmaNoDuplicateFromThenFromBigger!0 lt!284125 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617207 (arrayNoDuplicates!0 lt!284125 #b00000000000000000000000000000000 Nil!12044)))

(declare-fun lt!284128 () Unit!20188)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12047) Unit!20188)

(assert (=> b!617207 (= lt!284128 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12044))))

(assert (=> b!617207 (arrayContainsKey!0 lt!284125 (select (arr!18006 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284127 () Unit!20188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20188)

(assert (=> b!617207 (= lt!284127 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284125 (select (arr!18006 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353920 () Bool)

(assert (=> b!617207 e!353920))

(declare-fun res!397611 () Bool)

(assert (=> b!617207 (=> (not res!397611) (not e!353920))))

(assert (=> b!617207 (= res!397611 (arrayContainsKey!0 lt!284125 (select (arr!18006 a!2986) j!136) j!136))))

(declare-fun e!353908 () Unit!20188)

(declare-fun Unit!20191 () Unit!20188)

(assert (=> b!617207 (= e!353908 Unit!20191)))

(declare-fun b!617208 () Bool)

(declare-fun res!397602 () Bool)

(assert (=> b!617208 (=> (not res!397602) (not e!353915))))

(assert (=> b!617208 (= res!397602 (and (= (size!18370 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18370 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18370 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617209 () Bool)

(assert (=> b!617209 false))

(declare-fun lt!284137 () Unit!20188)

(assert (=> b!617209 (= lt!284137 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284125 (select (arr!18006 a!2986) j!136) j!136 Nil!12044))))

(assert (=> b!617209 (arrayNoDuplicates!0 lt!284125 j!136 Nil!12044)))

(declare-fun lt!284134 () Unit!20188)

(assert (=> b!617209 (= lt!284134 (lemmaNoDuplicateFromThenFromBigger!0 lt!284125 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617209 (arrayNoDuplicates!0 lt!284125 #b00000000000000000000000000000000 Nil!12044)))

(declare-fun lt!284122 () Unit!20188)

(assert (=> b!617209 (= lt!284122 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12044))))

(assert (=> b!617209 (arrayContainsKey!0 lt!284125 (select (arr!18006 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284124 () Unit!20188)

(assert (=> b!617209 (= lt!284124 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284125 (select (arr!18006 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20192 () Unit!20188)

(assert (=> b!617209 (= e!353922 Unit!20192)))

(declare-fun b!617210 () Bool)

(declare-fun e!353917 () Unit!20188)

(declare-fun Unit!20193 () Unit!20188)

(assert (=> b!617210 (= e!353917 Unit!20193)))

(declare-fun b!617211 () Bool)

(assert (=> b!617211 (= e!353909 (not e!353916))))

(declare-fun res!397606 () Bool)

(assert (=> b!617211 (=> res!397606 e!353916)))

(declare-fun lt!284136 () SeekEntryResult!6446)

(assert (=> b!617211 (= res!397606 (not (= lt!284136 (MissingVacant!6446 vacantSpotIndex!68))))))

(declare-fun lt!284132 () Unit!20188)

(assert (=> b!617211 (= lt!284132 e!353917)))

(declare-fun c!70167 () Bool)

(assert (=> b!617211 (= c!70167 (= lt!284136 (Found!6446 index!984)))))

(declare-fun lt!284130 () Unit!20188)

(declare-fun e!353912 () Unit!20188)

(assert (=> b!617211 (= lt!284130 e!353912)))

(declare-fun c!70166 () Bool)

(assert (=> b!617211 (= c!70166 (= lt!284136 Undefined!6446))))

(declare-fun lt!284135 () (_ BitVec 64))

(assert (=> b!617211 (= lt!284136 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284135 lt!284125 mask!3053))))

(declare-fun e!353918 () Bool)

(assert (=> b!617211 e!353918))

(declare-fun res!397609 () Bool)

(assert (=> b!617211 (=> (not res!397609) (not e!353918))))

(declare-fun lt!284129 () SeekEntryResult!6446)

(declare-fun lt!284120 () (_ BitVec 32))

(assert (=> b!617211 (= res!397609 (= lt!284129 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284120 vacantSpotIndex!68 lt!284135 lt!284125 mask!3053)))))

(assert (=> b!617211 (= lt!284129 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284120 vacantSpotIndex!68 (select (arr!18006 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617211 (= lt!284135 (select (store (arr!18006 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284118 () Unit!20188)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37520 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20188)

(assert (=> b!617211 (= lt!284118 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284120 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617211 (= lt!284120 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617212 () Bool)

(declare-fun res!397608 () Bool)

(assert (=> b!617212 (= res!397608 (arrayContainsKey!0 lt!284125 (select (arr!18006 a!2986) j!136) j!136))))

(assert (=> b!617212 (=> (not res!397608) (not e!353911))))

(assert (=> b!617212 (= e!353921 e!353911)))

(declare-fun b!617213 () Bool)

(declare-fun Unit!20194 () Unit!20188)

(assert (=> b!617213 (= e!353912 Unit!20194)))

(declare-fun b!617214 () Bool)

(assert (=> b!617214 (= e!353920 (arrayContainsKey!0 lt!284125 (select (arr!18006 a!2986) j!136) index!984))))

(declare-fun b!617215 () Bool)

(assert (=> b!617215 (= e!353918 (= lt!284126 lt!284129))))

(declare-fun b!617216 () Bool)

(declare-fun res!397610 () Bool)

(assert (=> b!617216 (=> (not res!397610) (not e!353914))))

(assert (=> b!617216 (= res!397610 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18006 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617217 () Bool)

(declare-fun res!397600 () Bool)

(assert (=> b!617217 (=> (not res!397600) (not e!353914))))

(assert (=> b!617217 (= res!397600 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12044))))

(declare-fun b!617218 () Bool)

(declare-fun Unit!20195 () Unit!20188)

(assert (=> b!617218 (= e!353912 Unit!20195)))

(assert (=> b!617218 false))

(declare-fun b!617219 () Bool)

(declare-fun res!397612 () Bool)

(assert (=> b!617219 (=> (not res!397612) (not e!353915))))

(assert (=> b!617219 (= res!397612 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617220 () Bool)

(assert (=> b!617220 (= e!353915 e!353914)))

(declare-fun res!397603 () Bool)

(assert (=> b!617220 (=> (not res!397603) (not e!353914))))

(declare-fun lt!284121 () SeekEntryResult!6446)

(assert (=> b!617220 (= res!397603 (or (= lt!284121 (MissingZero!6446 i!1108)) (= lt!284121 (MissingVacant!6446 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37520 (_ BitVec 32)) SeekEntryResult!6446)

(assert (=> b!617220 (= lt!284121 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!397605 () Bool)

(assert (=> start!56050 (=> (not res!397605) (not e!353915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56050 (= res!397605 (validMask!0 mask!3053))))

(assert (=> start!56050 e!353915))

(assert (=> start!56050 true))

(declare-fun array_inv!13802 (array!37520) Bool)

(assert (=> start!56050 (array_inv!13802 a!2986)))

(declare-fun b!617221 () Bool)

(declare-fun Unit!20196 () Unit!20188)

(assert (=> b!617221 (= e!353908 Unit!20196)))

(declare-fun b!617222 () Bool)

(declare-fun Unit!20197 () Unit!20188)

(assert (=> b!617222 (= e!353917 Unit!20197)))

(declare-fun res!397616 () Bool)

(assert (=> b!617222 (= res!397616 (= (select (store (arr!18006 a!2986) i!1108 k!1786) index!984) (select (arr!18006 a!2986) j!136)))))

(assert (=> b!617222 (=> (not res!397616) (not e!353910))))

(assert (=> b!617222 e!353910))

(declare-fun c!70169 () Bool)

(assert (=> b!617222 (= c!70169 (bvslt j!136 index!984))))

(declare-fun lt!284131 () Unit!20188)

(assert (=> b!617222 (= lt!284131 e!353922)))

(declare-fun c!70168 () Bool)

(assert (=> b!617222 (= c!70168 (bvslt index!984 j!136))))

(declare-fun lt!284133 () Unit!20188)

(assert (=> b!617222 (= lt!284133 e!353908)))

(assert (=> b!617222 false))

(assert (= (and start!56050 res!397605) b!617208))

(assert (= (and b!617208 res!397602) b!617206))

(assert (= (and b!617206 res!397614) b!617202))

(assert (= (and b!617202 res!397601) b!617219))

(assert (= (and b!617219 res!397612) b!617220))

(assert (= (and b!617220 res!397603) b!617204))

(assert (= (and b!617204 res!397613) b!617217))

(assert (= (and b!617217 res!397600) b!617216))

(assert (= (and b!617216 res!397610) b!617201))

(assert (= (and b!617201 res!397604) b!617200))

(assert (= (and b!617200 res!397607) b!617211))

(assert (= (and b!617211 res!397609) b!617215))

(assert (= (and b!617211 c!70166) b!617218))

(assert (= (and b!617211 (not c!70166)) b!617213))

(assert (= (and b!617211 c!70167) b!617222))

(assert (= (and b!617211 (not c!70167)) b!617210))

(assert (= (and b!617222 res!397616) b!617198))

(assert (= (and b!617198 (not res!397615)) b!617212))

(assert (= (and b!617212 res!397608) b!617203))

(assert (= (and b!617222 c!70169) b!617209))

(assert (= (and b!617222 (not c!70169)) b!617205))

(assert (= (and b!617222 c!70168) b!617207))

(assert (= (and b!617222 (not c!70168)) b!617221))

(assert (= (and b!617207 res!397611) b!617214))

(assert (= (and b!617211 (not res!397606)) b!617199))

(declare-fun m!593321 () Bool)

(assert (=> b!617216 m!593321))

(declare-fun m!593323 () Bool)

(assert (=> b!617212 m!593323))

(assert (=> b!617212 m!593323))

(declare-fun m!593325 () Bool)

(assert (=> b!617212 m!593325))

(declare-fun m!593327 () Bool)

(assert (=> b!617222 m!593327))

(declare-fun m!593329 () Bool)

(assert (=> b!617222 m!593329))

(assert (=> b!617222 m!593323))

(declare-fun m!593331 () Bool)

(assert (=> start!56050 m!593331))

(declare-fun m!593333 () Bool)

(assert (=> start!56050 m!593333))

(declare-fun m!593335 () Bool)

(assert (=> b!617220 m!593335))

(assert (=> b!617209 m!593323))

(declare-fun m!593337 () Bool)

(assert (=> b!617209 m!593337))

(assert (=> b!617209 m!593323))

(declare-fun m!593339 () Bool)

(assert (=> b!617209 m!593339))

(declare-fun m!593341 () Bool)

(assert (=> b!617209 m!593341))

(declare-fun m!593343 () Bool)

(assert (=> b!617209 m!593343))

(declare-fun m!593345 () Bool)

(assert (=> b!617209 m!593345))

(assert (=> b!617209 m!593323))

(declare-fun m!593347 () Bool)

(assert (=> b!617209 m!593347))

(assert (=> b!617209 m!593323))

(declare-fun m!593349 () Bool)

(assert (=> b!617209 m!593349))

(assert (=> b!617207 m!593323))

(declare-fun m!593351 () Bool)

(assert (=> b!617207 m!593351))

(assert (=> b!617207 m!593323))

(declare-fun m!593353 () Bool)

(assert (=> b!617207 m!593353))

(assert (=> b!617207 m!593323))

(declare-fun m!593355 () Bool)

(assert (=> b!617207 m!593355))

(declare-fun m!593357 () Bool)

(assert (=> b!617207 m!593357))

(assert (=> b!617207 m!593323))

(declare-fun m!593359 () Bool)

(assert (=> b!617207 m!593359))

(assert (=> b!617207 m!593323))

(assert (=> b!617207 m!593325))

(assert (=> b!617207 m!593343))

(assert (=> b!617207 m!593345))

(assert (=> b!617201 m!593327))

(declare-fun m!593361 () Bool)

(assert (=> b!617201 m!593361))

(declare-fun m!593363 () Bool)

(assert (=> b!617217 m!593363))

(assert (=> b!617199 m!593327))

(assert (=> b!617199 m!593329))

(declare-fun m!593365 () Bool)

(assert (=> b!617202 m!593365))

(assert (=> b!617203 m!593323))

(assert (=> b!617203 m!593323))

(declare-fun m!593367 () Bool)

(assert (=> b!617203 m!593367))

(declare-fun m!593369 () Bool)

(assert (=> b!617219 m!593369))

(declare-fun m!593371 () Bool)

(assert (=> b!617204 m!593371))

(assert (=> b!617206 m!593323))

(assert (=> b!617206 m!593323))

(declare-fun m!593373 () Bool)

(assert (=> b!617206 m!593373))

(assert (=> b!617214 m!593323))

(assert (=> b!617214 m!593323))

(assert (=> b!617214 m!593367))

(declare-fun m!593375 () Bool)

(assert (=> b!617211 m!593375))

(declare-fun m!593377 () Bool)

(assert (=> b!617211 m!593377))

(assert (=> b!617211 m!593323))

(assert (=> b!617211 m!593327))

(declare-fun m!593379 () Bool)

(assert (=> b!617211 m!593379))

(declare-fun m!593381 () Bool)

(assert (=> b!617211 m!593381))

(assert (=> b!617211 m!593323))

(declare-fun m!593383 () Bool)

(assert (=> b!617211 m!593383))

(declare-fun m!593385 () Bool)

(assert (=> b!617211 m!593385))

(declare-fun m!593387 () Bool)

(assert (=> b!617200 m!593387))

(assert (=> b!617200 m!593323))

(assert (=> b!617200 m!593323))

(declare-fun m!593389 () Bool)

(assert (=> b!617200 m!593389))

(push 1)

