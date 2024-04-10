; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59098 () Bool)

(assert start!59098)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!374205 () Bool)

(declare-fun b!652018 () Bool)

(declare-datatypes ((array!38598 0))(
  ( (array!38599 (arr!18502 (Array (_ BitVec 32) (_ BitVec 64))) (size!18866 (_ BitVec 32))) )
))
(declare-fun lt!303295 () array!38598)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38598)

(declare-fun arrayContainsKey!0 (array!38598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652018 (= e!374205 (arrayContainsKey!0 lt!303295 (select (arr!18502 a!2986) j!136) index!984))))

(declare-fun b!652019 () Bool)

(declare-fun e!374204 () Bool)

(declare-fun e!374211 () Bool)

(assert (=> b!652019 (= e!374204 e!374211)))

(declare-fun res!422770 () Bool)

(assert (=> b!652019 (=> (not res!422770) (not e!374211))))

(declare-datatypes ((SeekEntryResult!6942 0))(
  ( (MissingZero!6942 (index!30121 (_ BitVec 32))) (Found!6942 (index!30122 (_ BitVec 32))) (Intermediate!6942 (undefined!7754 Bool) (index!30123 (_ BitVec 32)) (x!58909 (_ BitVec 32))) (Undefined!6942) (MissingVacant!6942 (index!30124 (_ BitVec 32))) )
))
(declare-fun lt!303291 () SeekEntryResult!6942)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!652019 (= res!422770 (and (= lt!303291 (Found!6942 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18502 a!2986) index!984) (select (arr!18502 a!2986) j!136))) (not (= (select (arr!18502 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38598 (_ BitVec 32)) SeekEntryResult!6942)

(assert (=> b!652019 (= lt!303291 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18502 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652020 () Bool)

(declare-fun res!422779 () Bool)

(declare-fun e!374202 () Bool)

(assert (=> b!652020 (=> (not res!422779) (not e!374202))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652020 (= res!422779 (validKeyInArray!0 k0!1786))))

(declare-fun b!652021 () Bool)

(declare-fun res!422780 () Bool)

(assert (=> b!652021 (=> (not res!422780) (not e!374202))))

(assert (=> b!652021 (= res!422780 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652022 () Bool)

(declare-datatypes ((Unit!22278 0))(
  ( (Unit!22279) )
))
(declare-fun e!374210 () Unit!22278)

(declare-fun Unit!22280 () Unit!22278)

(assert (=> b!652022 (= e!374210 Unit!22280)))

(declare-fun lt!303284 () Unit!22278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22278)

(assert (=> b!652022 (= lt!303284 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303295 (select (arr!18502 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652022 (arrayContainsKey!0 lt!303295 (select (arr!18502 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303289 () Unit!22278)

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((List!12543 0))(
  ( (Nil!12540) (Cons!12539 (h!13584 (_ BitVec 64)) (t!18771 List!12543)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12543) Unit!22278)

(assert (=> b!652022 (= lt!303289 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12540))))

(declare-fun arrayNoDuplicates!0 (array!38598 (_ BitVec 32) List!12543) Bool)

(assert (=> b!652022 (arrayNoDuplicates!0 lt!303295 #b00000000000000000000000000000000 Nil!12540)))

(declare-fun lt!303286 () Unit!22278)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38598 (_ BitVec 32) (_ BitVec 32)) Unit!22278)

(assert (=> b!652022 (= lt!303286 (lemmaNoDuplicateFromThenFromBigger!0 lt!303295 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652022 (arrayNoDuplicates!0 lt!303295 j!136 Nil!12540)))

(declare-fun lt!303292 () Unit!22278)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38598 (_ BitVec 64) (_ BitVec 32) List!12543) Unit!22278)

(assert (=> b!652022 (= lt!303292 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303295 (select (arr!18502 a!2986) j!136) j!136 Nil!12540))))

(assert (=> b!652022 false))

(declare-fun b!652023 () Bool)

(declare-fun e!374203 () Bool)

(assert (=> b!652023 (= e!374203 e!374205)))

(declare-fun res!422773 () Bool)

(assert (=> b!652023 (=> (not res!422773) (not e!374205))))

(assert (=> b!652023 (= res!422773 (arrayContainsKey!0 lt!303295 (select (arr!18502 a!2986) j!136) j!136))))

(declare-fun b!652024 () Bool)

(declare-fun res!422768 () Bool)

(declare-fun e!374207 () Bool)

(assert (=> b!652024 (=> (not res!422768) (not e!374207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38598 (_ BitVec 32)) Bool)

(assert (=> b!652024 (= res!422768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652025 () Bool)

(declare-fun e!374201 () Unit!22278)

(declare-fun Unit!22281 () Unit!22278)

(assert (=> b!652025 (= e!374201 Unit!22281)))

(declare-fun b!652026 () Bool)

(declare-fun e!374200 () Bool)

(declare-fun e!374199 () Bool)

(assert (=> b!652026 (= e!374200 e!374199)))

(declare-fun res!422776 () Bool)

(assert (=> b!652026 (=> res!422776 e!374199)))

(declare-fun lt!303283 () (_ BitVec 64))

(declare-fun lt!303287 () (_ BitVec 64))

(assert (=> b!652026 (= res!422776 (or (not (= (select (arr!18502 a!2986) j!136) lt!303287)) (not (= (select (arr!18502 a!2986) j!136) lt!303283))))))

(declare-fun e!374197 () Bool)

(assert (=> b!652026 e!374197))

(declare-fun res!422771 () Bool)

(assert (=> b!652026 (=> (not res!422771) (not e!374197))))

(assert (=> b!652026 (= res!422771 (= lt!303283 (select (arr!18502 a!2986) j!136)))))

(assert (=> b!652026 (= lt!303283 (select (store (arr!18502 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652027 () Bool)

(assert (=> b!652027 (= e!374207 e!374204)))

(declare-fun res!422767 () Bool)

(assert (=> b!652027 (=> (not res!422767) (not e!374204))))

(assert (=> b!652027 (= res!422767 (= (select (store (arr!18502 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652027 (= lt!303295 (array!38599 (store (arr!18502 a!2986) i!1108 k0!1786) (size!18866 a!2986)))))

(declare-fun res!422769 () Bool)

(assert (=> start!59098 (=> (not res!422769) (not e!374202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59098 (= res!422769 (validMask!0 mask!3053))))

(assert (=> start!59098 e!374202))

(assert (=> start!59098 true))

(declare-fun array_inv!14298 (array!38598) Bool)

(assert (=> start!59098 (array_inv!14298 a!2986)))

(declare-fun b!652028 () Bool)

(assert (=> b!652028 (= e!374211 (not e!374200))))

(declare-fun res!422772 () Bool)

(assert (=> b!652028 (=> res!422772 e!374200)))

(declare-fun lt!303285 () SeekEntryResult!6942)

(assert (=> b!652028 (= res!422772 (not (= lt!303285 (Found!6942 index!984))))))

(declare-fun lt!303288 () Unit!22278)

(assert (=> b!652028 (= lt!303288 e!374201)))

(declare-fun c!74995 () Bool)

(assert (=> b!652028 (= c!74995 (= lt!303285 Undefined!6942))))

(assert (=> b!652028 (= lt!303285 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303287 lt!303295 mask!3053))))

(declare-fun e!374208 () Bool)

(assert (=> b!652028 e!374208))

(declare-fun res!422778 () Bool)

(assert (=> b!652028 (=> (not res!422778) (not e!374208))))

(declare-fun lt!303282 () SeekEntryResult!6942)

(declare-fun lt!303279 () (_ BitVec 32))

(assert (=> b!652028 (= res!422778 (= lt!303282 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303279 vacantSpotIndex!68 lt!303287 lt!303295 mask!3053)))))

(assert (=> b!652028 (= lt!303282 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303279 vacantSpotIndex!68 (select (arr!18502 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652028 (= lt!303287 (select (store (arr!18502 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303281 () Unit!22278)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38598 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22278)

(assert (=> b!652028 (= lt!303281 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303279 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652028 (= lt!303279 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652029 () Bool)

(declare-fun res!422763 () Bool)

(assert (=> b!652029 (=> (not res!422763) (not e!374207))))

(assert (=> b!652029 (= res!422763 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18502 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652030 () Bool)

(assert (=> b!652030 (= e!374197 e!374203)))

(declare-fun res!422774 () Bool)

(assert (=> b!652030 (=> res!422774 e!374203)))

(assert (=> b!652030 (= res!422774 (or (not (= (select (arr!18502 a!2986) j!136) lt!303287)) (not (= (select (arr!18502 a!2986) j!136) lt!303283)) (bvsge j!136 index!984)))))

(declare-fun b!652031 () Bool)

(declare-fun e!374209 () Bool)

(assert (=> b!652031 (= e!374209 (arrayContainsKey!0 lt!303295 (select (arr!18502 a!2986) j!136) index!984))))

(declare-fun b!652032 () Bool)

(declare-fun Unit!22282 () Unit!22278)

(assert (=> b!652032 (= e!374210 Unit!22282)))

(declare-fun b!652033 () Bool)

(declare-fun e!374206 () Bool)

(assert (=> b!652033 (= e!374199 e!374206)))

(declare-fun res!422766 () Bool)

(assert (=> b!652033 (=> res!422766 e!374206)))

(assert (=> b!652033 (= res!422766 (bvsge index!984 j!136))))

(declare-fun lt!303280 () Unit!22278)

(assert (=> b!652033 (= lt!303280 e!374210)))

(declare-fun c!74996 () Bool)

(assert (=> b!652033 (= c!74996 (bvslt j!136 index!984))))

(declare-fun b!652034 () Bool)

(declare-fun res!422777 () Bool)

(assert (=> b!652034 (=> (not res!422777) (not e!374202))))

(assert (=> b!652034 (= res!422777 (validKeyInArray!0 (select (arr!18502 a!2986) j!136)))))

(declare-fun b!652035 () Bool)

(declare-fun res!422775 () Bool)

(assert (=> b!652035 (=> (not res!422775) (not e!374207))))

(assert (=> b!652035 (= res!422775 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12540))))

(declare-fun b!652036 () Bool)

(declare-fun res!422765 () Bool)

(assert (=> b!652036 (=> (not res!422765) (not e!374202))))

(assert (=> b!652036 (= res!422765 (and (= (size!18866 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18866 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18866 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652037 () Bool)

(assert (=> b!652037 (= e!374206 true)))

(assert (=> b!652037 (arrayNoDuplicates!0 lt!303295 index!984 Nil!12540)))

(declare-fun lt!303294 () Unit!22278)

(assert (=> b!652037 (= lt!303294 (lemmaNoDuplicateFromThenFromBigger!0 lt!303295 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652037 (arrayNoDuplicates!0 lt!303295 #b00000000000000000000000000000000 Nil!12540)))

(declare-fun lt!303278 () Unit!22278)

(assert (=> b!652037 (= lt!303278 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12540))))

(assert (=> b!652037 (arrayContainsKey!0 lt!303295 (select (arr!18502 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303293 () Unit!22278)

(assert (=> b!652037 (= lt!303293 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303295 (select (arr!18502 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652037 e!374209))

(declare-fun res!422764 () Bool)

(assert (=> b!652037 (=> (not res!422764) (not e!374209))))

(assert (=> b!652037 (= res!422764 (arrayContainsKey!0 lt!303295 (select (arr!18502 a!2986) j!136) j!136))))

(declare-fun b!652038 () Bool)

(assert (=> b!652038 (= e!374208 (= lt!303291 lt!303282))))

(declare-fun b!652039 () Bool)

(declare-fun Unit!22283 () Unit!22278)

(assert (=> b!652039 (= e!374201 Unit!22283)))

(assert (=> b!652039 false))

(declare-fun b!652040 () Bool)

(assert (=> b!652040 (= e!374202 e!374207)))

(declare-fun res!422762 () Bool)

(assert (=> b!652040 (=> (not res!422762) (not e!374207))))

(declare-fun lt!303290 () SeekEntryResult!6942)

(assert (=> b!652040 (= res!422762 (or (= lt!303290 (MissingZero!6942 i!1108)) (= lt!303290 (MissingVacant!6942 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38598 (_ BitVec 32)) SeekEntryResult!6942)

(assert (=> b!652040 (= lt!303290 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!59098 res!422769) b!652036))

(assert (= (and b!652036 res!422765) b!652034))

(assert (= (and b!652034 res!422777) b!652020))

(assert (= (and b!652020 res!422779) b!652021))

(assert (= (and b!652021 res!422780) b!652040))

(assert (= (and b!652040 res!422762) b!652024))

(assert (= (and b!652024 res!422768) b!652035))

(assert (= (and b!652035 res!422775) b!652029))

(assert (= (and b!652029 res!422763) b!652027))

(assert (= (and b!652027 res!422767) b!652019))

(assert (= (and b!652019 res!422770) b!652028))

(assert (= (and b!652028 res!422778) b!652038))

(assert (= (and b!652028 c!74995) b!652039))

(assert (= (and b!652028 (not c!74995)) b!652025))

(assert (= (and b!652028 (not res!422772)) b!652026))

(assert (= (and b!652026 res!422771) b!652030))

(assert (= (and b!652030 (not res!422774)) b!652023))

(assert (= (and b!652023 res!422773) b!652018))

(assert (= (and b!652026 (not res!422776)) b!652033))

(assert (= (and b!652033 c!74996) b!652022))

(assert (= (and b!652033 (not c!74996)) b!652032))

(assert (= (and b!652033 (not res!422766)) b!652037))

(assert (= (and b!652037 res!422764) b!652031))

(declare-fun m!625165 () Bool)

(assert (=> b!652035 m!625165))

(declare-fun m!625167 () Bool)

(assert (=> b!652034 m!625167))

(assert (=> b!652034 m!625167))

(declare-fun m!625169 () Bool)

(assert (=> b!652034 m!625169))

(declare-fun m!625171 () Bool)

(assert (=> b!652019 m!625171))

(assert (=> b!652019 m!625167))

(assert (=> b!652019 m!625167))

(declare-fun m!625173 () Bool)

(assert (=> b!652019 m!625173))

(assert (=> b!652031 m!625167))

(assert (=> b!652031 m!625167))

(declare-fun m!625175 () Bool)

(assert (=> b!652031 m!625175))

(declare-fun m!625177 () Bool)

(assert (=> b!652027 m!625177))

(declare-fun m!625179 () Bool)

(assert (=> b!652027 m!625179))

(declare-fun m!625181 () Bool)

(assert (=> b!652024 m!625181))

(assert (=> b!652018 m!625167))

(assert (=> b!652018 m!625167))

(assert (=> b!652018 m!625175))

(assert (=> b!652023 m!625167))

(assert (=> b!652023 m!625167))

(declare-fun m!625183 () Bool)

(assert (=> b!652023 m!625183))

(declare-fun m!625185 () Bool)

(assert (=> b!652028 m!625185))

(declare-fun m!625187 () Bool)

(assert (=> b!652028 m!625187))

(assert (=> b!652028 m!625167))

(declare-fun m!625189 () Bool)

(assert (=> b!652028 m!625189))

(assert (=> b!652028 m!625177))

(declare-fun m!625191 () Bool)

(assert (=> b!652028 m!625191))

(declare-fun m!625193 () Bool)

(assert (=> b!652028 m!625193))

(declare-fun m!625195 () Bool)

(assert (=> b!652028 m!625195))

(assert (=> b!652028 m!625167))

(declare-fun m!625197 () Bool)

(assert (=> b!652021 m!625197))

(declare-fun m!625199 () Bool)

(assert (=> b!652040 m!625199))

(declare-fun m!625201 () Bool)

(assert (=> b!652020 m!625201))

(declare-fun m!625203 () Bool)

(assert (=> b!652029 m!625203))

(declare-fun m!625205 () Bool)

(assert (=> start!59098 m!625205))

(declare-fun m!625207 () Bool)

(assert (=> start!59098 m!625207))

(declare-fun m!625209 () Bool)

(assert (=> b!652022 m!625209))

(assert (=> b!652022 m!625167))

(declare-fun m!625211 () Bool)

(assert (=> b!652022 m!625211))

(declare-fun m!625213 () Bool)

(assert (=> b!652022 m!625213))

(assert (=> b!652022 m!625167))

(declare-fun m!625215 () Bool)

(assert (=> b!652022 m!625215))

(declare-fun m!625217 () Bool)

(assert (=> b!652022 m!625217))

(assert (=> b!652022 m!625167))

(declare-fun m!625219 () Bool)

(assert (=> b!652022 m!625219))

(assert (=> b!652022 m!625167))

(declare-fun m!625221 () Bool)

(assert (=> b!652022 m!625221))

(assert (=> b!652037 m!625167))

(assert (=> b!652037 m!625167))

(declare-fun m!625223 () Bool)

(assert (=> b!652037 m!625223))

(declare-fun m!625225 () Bool)

(assert (=> b!652037 m!625225))

(declare-fun m!625227 () Bool)

(assert (=> b!652037 m!625227))

(assert (=> b!652037 m!625167))

(assert (=> b!652037 m!625183))

(assert (=> b!652037 m!625213))

(assert (=> b!652037 m!625167))

(declare-fun m!625229 () Bool)

(assert (=> b!652037 m!625229))

(assert (=> b!652037 m!625217))

(assert (=> b!652030 m!625167))

(assert (=> b!652026 m!625167))

(assert (=> b!652026 m!625177))

(declare-fun m!625231 () Bool)

(assert (=> b!652026 m!625231))

(check-sat (not b!652028) (not b!652022) (not b!652020) (not b!652024) (not b!652018) (not b!652035) (not b!652034) (not start!59098) (not b!652037) (not b!652019) (not b!652040) (not b!652023) (not b!652031) (not b!652021))
(check-sat)
