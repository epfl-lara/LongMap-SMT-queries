; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56130 () Bool)

(assert start!56130)

(declare-fun b!620193 () Bool)

(declare-datatypes ((Unit!20588 0))(
  ( (Unit!20589) )
))
(declare-fun e!355716 () Unit!20588)

(declare-fun Unit!20590 () Unit!20588)

(assert (=> b!620193 (= e!355716 Unit!20590)))

(assert (=> b!620193 false))

(declare-fun b!620194 () Bool)

(declare-fun e!355705 () Bool)

(declare-fun e!355703 () Bool)

(assert (=> b!620194 (= e!355705 e!355703)))

(declare-fun res!399639 () Bool)

(assert (=> b!620194 (=> (not res!399639) (not e!355703))))

(declare-datatypes ((SeekEntryResult!6486 0))(
  ( (MissingZero!6486 (index!28228 (_ BitVec 32))) (Found!6486 (index!28229 (_ BitVec 32))) (Intermediate!6486 (undefined!7298 Bool) (index!28230 (_ BitVec 32)) (x!57006 (_ BitVec 32))) (Undefined!6486) (MissingVacant!6486 (index!28231 (_ BitVec 32))) )
))
(declare-fun lt!286526 () SeekEntryResult!6486)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37600 0))(
  ( (array!37601 (arr!18046 (Array (_ BitVec 32) (_ BitVec 64))) (size!18410 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37600)

(assert (=> b!620194 (= res!399639 (and (= lt!286526 (Found!6486 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18046 a!2986) index!984) (select (arr!18046 a!2986) j!136))) (not (= (select (arr!18046 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37600 (_ BitVec 32)) SeekEntryResult!6486)

(assert (=> b!620194 (= lt!286526 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18046 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620195 () Bool)

(declare-fun res!399641 () Bool)

(declare-fun e!355704 () Bool)

(assert (=> b!620195 (=> (not res!399641) (not e!355704))))

(assert (=> b!620195 (= res!399641 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18046 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620196 () Bool)

(declare-fun res!399649 () Bool)

(assert (=> b!620196 (=> (not res!399649) (not e!355704))))

(declare-datatypes ((List!12087 0))(
  ( (Nil!12084) (Cons!12083 (h!13128 (_ BitVec 64)) (t!18315 List!12087)) )
))
(declare-fun arrayNoDuplicates!0 (array!37600 (_ BitVec 32) List!12087) Bool)

(assert (=> b!620196 (= res!399649 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12084))))

(declare-fun res!399648 () Bool)

(declare-fun e!355713 () Bool)

(assert (=> start!56130 (=> (not res!399648) (not e!355713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56130 (= res!399648 (validMask!0 mask!3053))))

(assert (=> start!56130 e!355713))

(assert (=> start!56130 true))

(declare-fun array_inv!13842 (array!37600) Bool)

(assert (=> start!56130 (array_inv!13842 a!2986)))

(declare-fun e!355709 () Bool)

(declare-fun b!620197 () Bool)

(declare-fun lt!286532 () array!37600)

(declare-fun arrayContainsKey!0 (array!37600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620197 (= e!355709 (arrayContainsKey!0 lt!286532 (select (arr!18046 a!2986) j!136) index!984))))

(declare-fun b!620198 () Bool)

(declare-fun e!355712 () Unit!20588)

(declare-fun Unit!20591 () Unit!20588)

(assert (=> b!620198 (= e!355712 Unit!20591)))

(declare-fun res!399643 () Bool)

(declare-fun b!620199 () Bool)

(assert (=> b!620199 (= res!399643 (arrayContainsKey!0 lt!286532 (select (arr!18046 a!2986) j!136) j!136))))

(assert (=> b!620199 (=> (not res!399643) (not e!355709))))

(declare-fun e!355714 () Bool)

(assert (=> b!620199 (= e!355714 e!355709)))

(declare-fun b!620200 () Bool)

(declare-fun e!355715 () Unit!20588)

(declare-fun Unit!20592 () Unit!20588)

(assert (=> b!620200 (= e!355715 Unit!20592)))

(declare-fun b!620201 () Bool)

(assert (=> b!620201 false))

(declare-fun lt!286531 () Unit!20588)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37600 (_ BitVec 64) (_ BitVec 32) List!12087) Unit!20588)

(assert (=> b!620201 (= lt!286531 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286532 (select (arr!18046 a!2986) j!136) j!136 Nil!12084))))

(assert (=> b!620201 (arrayNoDuplicates!0 lt!286532 j!136 Nil!12084)))

(declare-fun lt!286518 () Unit!20588)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37600 (_ BitVec 32) (_ BitVec 32)) Unit!20588)

(assert (=> b!620201 (= lt!286518 (lemmaNoDuplicateFromThenFromBigger!0 lt!286532 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620201 (arrayNoDuplicates!0 lt!286532 #b00000000000000000000000000000000 Nil!12084)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!286530 () Unit!20588)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12087) Unit!20588)

(assert (=> b!620201 (= lt!286530 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12084))))

(assert (=> b!620201 (arrayContainsKey!0 lt!286532 (select (arr!18046 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286533 () Unit!20588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20588)

(assert (=> b!620201 (= lt!286533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286532 (select (arr!18046 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355707 () Unit!20588)

(declare-fun Unit!20593 () Unit!20588)

(assert (=> b!620201 (= e!355707 Unit!20593)))

(declare-fun b!620202 () Bool)

(declare-fun res!399647 () Bool)

(assert (=> b!620202 (=> (not res!399647) (not e!355713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620202 (= res!399647 (validKeyInArray!0 (select (arr!18046 a!2986) j!136)))))

(declare-fun b!620203 () Bool)

(declare-fun Unit!20594 () Unit!20588)

(assert (=> b!620203 (= e!355716 Unit!20594)))

(declare-fun b!620204 () Bool)

(declare-fun res!399644 () Bool)

(assert (=> b!620204 (=> (not res!399644) (not e!355713))))

(assert (=> b!620204 (= res!399644 (and (= (size!18410 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18410 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18410 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620205 () Bool)

(declare-fun res!399646 () Bool)

(assert (=> b!620205 (=> (not res!399646) (not e!355713))))

(assert (=> b!620205 (= res!399646 (validKeyInArray!0 k0!1786))))

(declare-fun b!620206 () Bool)

(assert (=> b!620206 (= e!355704 e!355705)))

(declare-fun res!399637 () Bool)

(assert (=> b!620206 (=> (not res!399637) (not e!355705))))

(assert (=> b!620206 (= res!399637 (= (select (store (arr!18046 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620206 (= lt!286532 (array!37601 (store (arr!18046 a!2986) i!1108 k0!1786) (size!18410 a!2986)))))

(declare-fun b!620207 () Bool)

(declare-fun res!399636 () Bool)

(assert (=> b!620207 (=> (not res!399636) (not e!355713))))

(assert (=> b!620207 (= res!399636 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620208 () Bool)

(declare-fun res!399650 () Bool)

(assert (=> b!620208 (= res!399650 (bvsge j!136 index!984))))

(assert (=> b!620208 (=> res!399650 e!355714)))

(declare-fun e!355711 () Bool)

(assert (=> b!620208 (= e!355711 e!355714)))

(declare-fun b!620209 () Bool)

(declare-fun res!399638 () Bool)

(assert (=> b!620209 (=> (not res!399638) (not e!355704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37600 (_ BitVec 32)) Bool)

(assert (=> b!620209 (= res!399638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620210 () Bool)

(declare-fun Unit!20595 () Unit!20588)

(assert (=> b!620210 (= e!355707 Unit!20595)))

(declare-fun b!620211 () Bool)

(assert (=> b!620211 (= e!355703 (not true))))

(declare-fun lt!286521 () Unit!20588)

(assert (=> b!620211 (= lt!286521 e!355712)))

(declare-fun c!70646 () Bool)

(declare-fun lt!286527 () SeekEntryResult!6486)

(assert (=> b!620211 (= c!70646 (= lt!286527 (Found!6486 index!984)))))

(declare-fun lt!286522 () Unit!20588)

(assert (=> b!620211 (= lt!286522 e!355716)))

(declare-fun c!70648 () Bool)

(assert (=> b!620211 (= c!70648 (= lt!286527 Undefined!6486))))

(declare-fun lt!286536 () (_ BitVec 64))

(assert (=> b!620211 (= lt!286527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286536 lt!286532 mask!3053))))

(declare-fun e!355708 () Bool)

(assert (=> b!620211 e!355708))

(declare-fun res!399642 () Bool)

(assert (=> b!620211 (=> (not res!399642) (not e!355708))))

(declare-fun lt!286519 () (_ BitVec 32))

(declare-fun lt!286520 () SeekEntryResult!6486)

(assert (=> b!620211 (= res!399642 (= lt!286520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286519 vacantSpotIndex!68 lt!286536 lt!286532 mask!3053)))))

(assert (=> b!620211 (= lt!286520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286519 vacantSpotIndex!68 (select (arr!18046 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620211 (= lt!286536 (select (store (arr!18046 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286529 () Unit!20588)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20588)

(assert (=> b!620211 (= lt!286529 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286519 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620211 (= lt!286519 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620212 () Bool)

(declare-fun e!355710 () Bool)

(assert (=> b!620212 (= e!355710 (arrayContainsKey!0 lt!286532 (select (arr!18046 a!2986) j!136) index!984))))

(declare-fun b!620213 () Bool)

(assert (=> b!620213 (= e!355713 e!355704)))

(declare-fun res!399640 () Bool)

(assert (=> b!620213 (=> (not res!399640) (not e!355704))))

(declare-fun lt!286535 () SeekEntryResult!6486)

(assert (=> b!620213 (= res!399640 (or (= lt!286535 (MissingZero!6486 i!1108)) (= lt!286535 (MissingVacant!6486 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37600 (_ BitVec 32)) SeekEntryResult!6486)

(assert (=> b!620213 (= lt!286535 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620214 () Bool)

(assert (=> b!620214 (= e!355708 (= lt!286526 lt!286520))))

(declare-fun b!620215 () Bool)

(declare-fun Unit!20596 () Unit!20588)

(assert (=> b!620215 (= e!355712 Unit!20596)))

(declare-fun res!399635 () Bool)

(assert (=> b!620215 (= res!399635 (= (select (store (arr!18046 a!2986) i!1108 k0!1786) index!984) (select (arr!18046 a!2986) j!136)))))

(assert (=> b!620215 (=> (not res!399635) (not e!355711))))

(assert (=> b!620215 e!355711))

(declare-fun c!70647 () Bool)

(assert (=> b!620215 (= c!70647 (bvslt j!136 index!984))))

(declare-fun lt!286525 () Unit!20588)

(assert (=> b!620215 (= lt!286525 e!355707)))

(declare-fun c!70649 () Bool)

(assert (=> b!620215 (= c!70649 (bvslt index!984 j!136))))

(declare-fun lt!286523 () Unit!20588)

(assert (=> b!620215 (= lt!286523 e!355715)))

(assert (=> b!620215 false))

(declare-fun b!620216 () Bool)

(assert (=> b!620216 false))

(declare-fun lt!286534 () Unit!20588)

(assert (=> b!620216 (= lt!286534 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286532 (select (arr!18046 a!2986) j!136) index!984 Nil!12084))))

(assert (=> b!620216 (arrayNoDuplicates!0 lt!286532 index!984 Nil!12084)))

(declare-fun lt!286528 () Unit!20588)

(assert (=> b!620216 (= lt!286528 (lemmaNoDuplicateFromThenFromBigger!0 lt!286532 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620216 (arrayNoDuplicates!0 lt!286532 #b00000000000000000000000000000000 Nil!12084)))

(declare-fun lt!286524 () Unit!20588)

(assert (=> b!620216 (= lt!286524 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12084))))

(assert (=> b!620216 (arrayContainsKey!0 lt!286532 (select (arr!18046 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286537 () Unit!20588)

(assert (=> b!620216 (= lt!286537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286532 (select (arr!18046 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620216 e!355710))

(declare-fun res!399645 () Bool)

(assert (=> b!620216 (=> (not res!399645) (not e!355710))))

(assert (=> b!620216 (= res!399645 (arrayContainsKey!0 lt!286532 (select (arr!18046 a!2986) j!136) j!136))))

(declare-fun Unit!20597 () Unit!20588)

(assert (=> b!620216 (= e!355715 Unit!20597)))

(assert (= (and start!56130 res!399648) b!620204))

(assert (= (and b!620204 res!399644) b!620202))

(assert (= (and b!620202 res!399647) b!620205))

(assert (= (and b!620205 res!399646) b!620207))

(assert (= (and b!620207 res!399636) b!620213))

(assert (= (and b!620213 res!399640) b!620209))

(assert (= (and b!620209 res!399638) b!620196))

(assert (= (and b!620196 res!399649) b!620195))

(assert (= (and b!620195 res!399641) b!620206))

(assert (= (and b!620206 res!399637) b!620194))

(assert (= (and b!620194 res!399639) b!620211))

(assert (= (and b!620211 res!399642) b!620214))

(assert (= (and b!620211 c!70648) b!620193))

(assert (= (and b!620211 (not c!70648)) b!620203))

(assert (= (and b!620211 c!70646) b!620215))

(assert (= (and b!620211 (not c!70646)) b!620198))

(assert (= (and b!620215 res!399635) b!620208))

(assert (= (and b!620208 (not res!399650)) b!620199))

(assert (= (and b!620199 res!399643) b!620197))

(assert (= (and b!620215 c!70647) b!620201))

(assert (= (and b!620215 (not c!70647)) b!620210))

(assert (= (and b!620215 c!70649) b!620216))

(assert (= (and b!620215 (not c!70649)) b!620200))

(assert (= (and b!620216 res!399645) b!620212))

(declare-fun m!596121 () Bool)

(assert (=> b!620194 m!596121))

(declare-fun m!596123 () Bool)

(assert (=> b!620194 m!596123))

(assert (=> b!620194 m!596123))

(declare-fun m!596125 () Bool)

(assert (=> b!620194 m!596125))

(assert (=> b!620199 m!596123))

(assert (=> b!620199 m!596123))

(declare-fun m!596127 () Bool)

(assert (=> b!620199 m!596127))

(assert (=> b!620212 m!596123))

(assert (=> b!620212 m!596123))

(declare-fun m!596129 () Bool)

(assert (=> b!620212 m!596129))

(declare-fun m!596131 () Bool)

(assert (=> b!620207 m!596131))

(declare-fun m!596133 () Bool)

(assert (=> b!620206 m!596133))

(declare-fun m!596135 () Bool)

(assert (=> b!620206 m!596135))

(declare-fun m!596137 () Bool)

(assert (=> b!620216 m!596137))

(assert (=> b!620216 m!596123))

(declare-fun m!596139 () Bool)

(assert (=> b!620216 m!596139))

(assert (=> b!620216 m!596123))

(assert (=> b!620216 m!596123))

(assert (=> b!620216 m!596127))

(declare-fun m!596141 () Bool)

(assert (=> b!620216 m!596141))

(declare-fun m!596143 () Bool)

(assert (=> b!620216 m!596143))

(assert (=> b!620216 m!596123))

(declare-fun m!596145 () Bool)

(assert (=> b!620216 m!596145))

(assert (=> b!620216 m!596123))

(declare-fun m!596147 () Bool)

(assert (=> b!620216 m!596147))

(declare-fun m!596149 () Bool)

(assert (=> b!620216 m!596149))

(declare-fun m!596151 () Bool)

(assert (=> b!620205 m!596151))

(declare-fun m!596153 () Bool)

(assert (=> b!620196 m!596153))

(declare-fun m!596155 () Bool)

(assert (=> b!620201 m!596155))

(assert (=> b!620201 m!596123))

(assert (=> b!620201 m!596123))

(declare-fun m!596157 () Bool)

(assert (=> b!620201 m!596157))

(assert (=> b!620201 m!596123))

(declare-fun m!596159 () Bool)

(assert (=> b!620201 m!596159))

(assert (=> b!620201 m!596123))

(declare-fun m!596161 () Bool)

(assert (=> b!620201 m!596161))

(assert (=> b!620201 m!596149))

(declare-fun m!596163 () Bool)

(assert (=> b!620201 m!596163))

(assert (=> b!620201 m!596143))

(assert (=> b!620215 m!596133))

(declare-fun m!596165 () Bool)

(assert (=> b!620215 m!596165))

(assert (=> b!620215 m!596123))

(declare-fun m!596167 () Bool)

(assert (=> b!620209 m!596167))

(declare-fun m!596169 () Bool)

(assert (=> start!56130 m!596169))

(declare-fun m!596171 () Bool)

(assert (=> start!56130 m!596171))

(assert (=> b!620197 m!596123))

(assert (=> b!620197 m!596123))

(assert (=> b!620197 m!596129))

(declare-fun m!596173 () Bool)

(assert (=> b!620211 m!596173))

(declare-fun m!596175 () Bool)

(assert (=> b!620211 m!596175))

(declare-fun m!596177 () Bool)

(assert (=> b!620211 m!596177))

(assert (=> b!620211 m!596123))

(assert (=> b!620211 m!596133))

(declare-fun m!596179 () Bool)

(assert (=> b!620211 m!596179))

(declare-fun m!596181 () Bool)

(assert (=> b!620211 m!596181))

(assert (=> b!620211 m!596123))

(declare-fun m!596183 () Bool)

(assert (=> b!620211 m!596183))

(assert (=> b!620202 m!596123))

(assert (=> b!620202 m!596123))

(declare-fun m!596185 () Bool)

(assert (=> b!620202 m!596185))

(declare-fun m!596187 () Bool)

(assert (=> b!620195 m!596187))

(declare-fun m!596189 () Bool)

(assert (=> b!620213 m!596189))

(check-sat (not b!620205) (not b!620212) (not b!620201) (not b!620207) (not b!620194) (not start!56130) (not b!620213) (not b!620196) (not b!620211) (not b!620216) (not b!620202) (not b!620209) (not b!620197) (not b!620199))
(check-sat)
