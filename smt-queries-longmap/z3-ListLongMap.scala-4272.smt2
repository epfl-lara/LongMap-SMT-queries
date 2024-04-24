; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59430 () Bool)

(assert start!59430)

(declare-fun b!656189 () Bool)

(declare-fun e!376865 () Bool)

(declare-fun e!376857 () Bool)

(assert (=> b!656189 (= e!376865 e!376857)))

(declare-fun res!425648 () Bool)

(assert (=> b!656189 (=> (not res!425648) (not e!376857))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6937 0))(
  ( (MissingZero!6937 (index!30107 (_ BitVec 32))) (Found!6937 (index!30108 (_ BitVec 32))) (Intermediate!6937 (undefined!7749 Bool) (index!30109 (_ BitVec 32)) (x!59045 (_ BitVec 32))) (Undefined!6937) (MissingVacant!6937 (index!30110 (_ BitVec 32))) )
))
(declare-fun lt!306235 () SeekEntryResult!6937)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38688 0))(
  ( (array!38689 (arr!18541 (Array (_ BitVec 32) (_ BitVec 64))) (size!18905 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38688)

(assert (=> b!656189 (= res!425648 (and (= lt!306235 (Found!6937 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18541 a!2986) index!984) (select (arr!18541 a!2986) j!136))) (not (= (select (arr!18541 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38688 (_ BitVec 32)) SeekEntryResult!6937)

(assert (=> b!656189 (= lt!306235 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656191 () Bool)

(assert (=> b!656191 false))

(declare-datatypes ((Unit!22593 0))(
  ( (Unit!22594) )
))
(declare-fun lt!306241 () Unit!22593)

(declare-fun lt!306226 () array!38688)

(declare-datatypes ((List!12489 0))(
  ( (Nil!12486) (Cons!12485 (h!13533 (_ BitVec 64)) (t!18709 List!12489)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38688 (_ BitVec 64) (_ BitVec 32) List!12489) Unit!22593)

(assert (=> b!656191 (= lt!306241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136 Nil!12486))))

(declare-fun arrayNoDuplicates!0 (array!38688 (_ BitVec 32) List!12489) Bool)

(assert (=> b!656191 (arrayNoDuplicates!0 lt!306226 j!136 Nil!12486)))

(declare-fun lt!306244 () Unit!22593)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38688 (_ BitVec 32) (_ BitVec 32)) Unit!22593)

(assert (=> b!656191 (= lt!306244 (lemmaNoDuplicateFromThenFromBigger!0 lt!306226 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656191 (arrayNoDuplicates!0 lt!306226 #b00000000000000000000000000000000 Nil!12486)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!306236 () Unit!22593)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12489) Unit!22593)

(assert (=> b!656191 (= lt!306236 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12486))))

(declare-fun arrayContainsKey!0 (array!38688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656191 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306242 () Unit!22593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22593)

(assert (=> b!656191 (= lt!306242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376858 () Unit!22593)

(declare-fun Unit!22595 () Unit!22593)

(assert (=> b!656191 (= e!376858 Unit!22595)))

(declare-fun b!656192 () Bool)

(declare-fun res!425653 () Bool)

(declare-fun e!376868 () Bool)

(assert (=> b!656192 (=> (not res!425653) (not e!376868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656192 (= res!425653 (validKeyInArray!0 k0!1786))))

(declare-fun b!656193 () Bool)

(declare-fun res!425652 () Bool)

(declare-fun e!376859 () Bool)

(assert (=> b!656193 (=> (not res!425652) (not e!376859))))

(assert (=> b!656193 (= res!425652 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18541 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656194 () Bool)

(declare-fun e!376861 () Unit!22593)

(declare-fun Unit!22596 () Unit!22593)

(assert (=> b!656194 (= e!376861 Unit!22596)))

(assert (=> b!656194 false))

(declare-fun b!656195 () Bool)

(declare-fun res!425640 () Bool)

(assert (=> b!656195 (= res!425640 (bvsge j!136 index!984))))

(declare-fun e!376869 () Bool)

(assert (=> b!656195 (=> res!425640 e!376869)))

(declare-fun e!376856 () Bool)

(assert (=> b!656195 (= e!376856 e!376869)))

(declare-fun b!656196 () Bool)

(declare-fun Unit!22597 () Unit!22593)

(assert (=> b!656196 (= e!376861 Unit!22597)))

(declare-fun b!656197 () Bool)

(declare-fun e!376867 () Bool)

(assert (=> b!656197 (= e!376867 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984))))

(declare-fun lt!306233 () SeekEntryResult!6937)

(declare-fun b!656198 () Bool)

(assert (=> b!656198 (= e!376857 (not (or (not (= lt!306233 (MissingVacant!6937 vacantSpotIndex!68))) (= (select (store (arr!18541 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306229 () Unit!22593)

(declare-fun e!376862 () Unit!22593)

(assert (=> b!656198 (= lt!306229 e!376862)))

(declare-fun c!75645 () Bool)

(assert (=> b!656198 (= c!75645 (= lt!306233 (Found!6937 index!984)))))

(declare-fun lt!306237 () Unit!22593)

(assert (=> b!656198 (= lt!306237 e!376861)))

(declare-fun c!75644 () Bool)

(assert (=> b!656198 (= c!75644 (= lt!306233 Undefined!6937))))

(declare-fun lt!306232 () (_ BitVec 64))

(assert (=> b!656198 (= lt!306233 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306232 lt!306226 mask!3053))))

(declare-fun e!376866 () Bool)

(assert (=> b!656198 e!376866))

(declare-fun res!425638 () Bool)

(assert (=> b!656198 (=> (not res!425638) (not e!376866))))

(declare-fun lt!306240 () SeekEntryResult!6937)

(declare-fun lt!306239 () (_ BitVec 32))

(assert (=> b!656198 (= res!425638 (= lt!306240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 lt!306232 lt!306226 mask!3053)))))

(assert (=> b!656198 (= lt!306240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656198 (= lt!306232 (select (store (arr!18541 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306231 () Unit!22593)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38688 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22593)

(assert (=> b!656198 (= lt!306231 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656198 (= lt!306239 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!656199 () Bool)

(assert (=> b!656199 false))

(declare-fun lt!306243 () Unit!22593)

(assert (=> b!656199 (= lt!306243 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984 Nil!12486))))

(assert (=> b!656199 (arrayNoDuplicates!0 lt!306226 index!984 Nil!12486)))

(declare-fun lt!306230 () Unit!22593)

(assert (=> b!656199 (= lt!306230 (lemmaNoDuplicateFromThenFromBigger!0 lt!306226 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656199 (arrayNoDuplicates!0 lt!306226 #b00000000000000000000000000000000 Nil!12486)))

(declare-fun lt!306228 () Unit!22593)

(assert (=> b!656199 (= lt!306228 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12486))))

(assert (=> b!656199 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306225 () Unit!22593)

(assert (=> b!656199 (= lt!306225 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!656199 e!376867))

(declare-fun res!425649 () Bool)

(assert (=> b!656199 (=> (not res!425649) (not e!376867))))

(assert (=> b!656199 (= res!425649 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136))))

(declare-fun e!376863 () Unit!22593)

(declare-fun Unit!22598 () Unit!22593)

(assert (=> b!656199 (= e!376863 Unit!22598)))

(declare-fun b!656200 () Bool)

(declare-fun Unit!22599 () Unit!22593)

(assert (=> b!656200 (= e!376863 Unit!22599)))

(declare-fun b!656201 () Bool)

(declare-fun e!376860 () Bool)

(assert (=> b!656201 (= e!376860 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984))))

(declare-fun res!425641 () Bool)

(assert (=> start!59430 (=> (not res!425641) (not e!376868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59430 (= res!425641 (validMask!0 mask!3053))))

(assert (=> start!59430 e!376868))

(assert (=> start!59430 true))

(declare-fun array_inv!14400 (array!38688) Bool)

(assert (=> start!59430 (array_inv!14400 a!2986)))

(declare-fun b!656190 () Bool)

(assert (=> b!656190 (= e!376868 e!376859)))

(declare-fun res!425651 () Bool)

(assert (=> b!656190 (=> (not res!425651) (not e!376859))))

(declare-fun lt!306238 () SeekEntryResult!6937)

(assert (=> b!656190 (= res!425651 (or (= lt!306238 (MissingZero!6937 i!1108)) (= lt!306238 (MissingVacant!6937 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38688 (_ BitVec 32)) SeekEntryResult!6937)

(assert (=> b!656190 (= lt!306238 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!656202 () Bool)

(declare-fun res!425647 () Bool)

(assert (=> b!656202 (=> (not res!425647) (not e!376868))))

(assert (=> b!656202 (= res!425647 (validKeyInArray!0 (select (arr!18541 a!2986) j!136)))))

(declare-fun b!656203 () Bool)

(assert (=> b!656203 (= e!376866 (= lt!306235 lt!306240))))

(declare-fun res!425650 () Bool)

(declare-fun b!656204 () Bool)

(assert (=> b!656204 (= res!425650 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136))))

(assert (=> b!656204 (=> (not res!425650) (not e!376860))))

(assert (=> b!656204 (= e!376869 e!376860)))

(declare-fun b!656205 () Bool)

(declare-fun Unit!22600 () Unit!22593)

(assert (=> b!656205 (= e!376858 Unit!22600)))

(declare-fun b!656206 () Bool)

(declare-fun Unit!22601 () Unit!22593)

(assert (=> b!656206 (= e!376862 Unit!22601)))

(declare-fun res!425642 () Bool)

(assert (=> b!656206 (= res!425642 (= (select (store (arr!18541 a!2986) i!1108 k0!1786) index!984) (select (arr!18541 a!2986) j!136)))))

(assert (=> b!656206 (=> (not res!425642) (not e!376856))))

(assert (=> b!656206 e!376856))

(declare-fun c!75647 () Bool)

(assert (=> b!656206 (= c!75647 (bvslt j!136 index!984))))

(declare-fun lt!306234 () Unit!22593)

(assert (=> b!656206 (= lt!306234 e!376858)))

(declare-fun c!75646 () Bool)

(assert (=> b!656206 (= c!75646 (bvslt index!984 j!136))))

(declare-fun lt!306227 () Unit!22593)

(assert (=> b!656206 (= lt!306227 e!376863)))

(assert (=> b!656206 false))

(declare-fun b!656207 () Bool)

(declare-fun res!425644 () Bool)

(assert (=> b!656207 (=> (not res!425644) (not e!376859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38688 (_ BitVec 32)) Bool)

(assert (=> b!656207 (= res!425644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656208 () Bool)

(assert (=> b!656208 (= e!376859 e!376865)))

(declare-fun res!425645 () Bool)

(assert (=> b!656208 (=> (not res!425645) (not e!376865))))

(assert (=> b!656208 (= res!425645 (= (select (store (arr!18541 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656208 (= lt!306226 (array!38689 (store (arr!18541 a!2986) i!1108 k0!1786) (size!18905 a!2986)))))

(declare-fun b!656209 () Bool)

(declare-fun res!425646 () Bool)

(assert (=> b!656209 (=> (not res!425646) (not e!376859))))

(assert (=> b!656209 (= res!425646 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12486))))

(declare-fun b!656210 () Bool)

(declare-fun res!425643 () Bool)

(assert (=> b!656210 (=> (not res!425643) (not e!376868))))

(assert (=> b!656210 (= res!425643 (and (= (size!18905 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18905 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18905 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656211 () Bool)

(declare-fun Unit!22602 () Unit!22593)

(assert (=> b!656211 (= e!376862 Unit!22602)))

(declare-fun b!656212 () Bool)

(declare-fun res!425639 () Bool)

(assert (=> b!656212 (=> (not res!425639) (not e!376868))))

(assert (=> b!656212 (= res!425639 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!59430 res!425641) b!656210))

(assert (= (and b!656210 res!425643) b!656202))

(assert (= (and b!656202 res!425647) b!656192))

(assert (= (and b!656192 res!425653) b!656212))

(assert (= (and b!656212 res!425639) b!656190))

(assert (= (and b!656190 res!425651) b!656207))

(assert (= (and b!656207 res!425644) b!656209))

(assert (= (and b!656209 res!425646) b!656193))

(assert (= (and b!656193 res!425652) b!656208))

(assert (= (and b!656208 res!425645) b!656189))

(assert (= (and b!656189 res!425648) b!656198))

(assert (= (and b!656198 res!425638) b!656203))

(assert (= (and b!656198 c!75644) b!656194))

(assert (= (and b!656198 (not c!75644)) b!656196))

(assert (= (and b!656198 c!75645) b!656206))

(assert (= (and b!656198 (not c!75645)) b!656211))

(assert (= (and b!656206 res!425642) b!656195))

(assert (= (and b!656195 (not res!425640)) b!656204))

(assert (= (and b!656204 res!425650) b!656201))

(assert (= (and b!656206 c!75647) b!656191))

(assert (= (and b!656206 (not c!75647)) b!656205))

(assert (= (and b!656206 c!75646) b!656199))

(assert (= (and b!656206 (not c!75646)) b!656200))

(assert (= (and b!656199 res!425649) b!656197))

(declare-fun m!629707 () Bool)

(assert (=> b!656193 m!629707))

(declare-fun m!629709 () Bool)

(assert (=> start!59430 m!629709))

(declare-fun m!629711 () Bool)

(assert (=> start!59430 m!629711))

(declare-fun m!629713 () Bool)

(assert (=> b!656197 m!629713))

(assert (=> b!656197 m!629713))

(declare-fun m!629715 () Bool)

(assert (=> b!656197 m!629715))

(declare-fun m!629717 () Bool)

(assert (=> b!656209 m!629717))

(declare-fun m!629719 () Bool)

(assert (=> b!656199 m!629719))

(assert (=> b!656199 m!629713))

(assert (=> b!656199 m!629713))

(declare-fun m!629721 () Bool)

(assert (=> b!656199 m!629721))

(declare-fun m!629723 () Bool)

(assert (=> b!656199 m!629723))

(assert (=> b!656199 m!629713))

(declare-fun m!629725 () Bool)

(assert (=> b!656199 m!629725))

(declare-fun m!629727 () Bool)

(assert (=> b!656199 m!629727))

(declare-fun m!629729 () Bool)

(assert (=> b!656199 m!629729))

(assert (=> b!656199 m!629713))

(declare-fun m!629731 () Bool)

(assert (=> b!656199 m!629731))

(assert (=> b!656199 m!629713))

(declare-fun m!629733 () Bool)

(assert (=> b!656199 m!629733))

(declare-fun m!629735 () Bool)

(assert (=> b!656208 m!629735))

(declare-fun m!629737 () Bool)

(assert (=> b!656208 m!629737))

(declare-fun m!629739 () Bool)

(assert (=> b!656207 m!629739))

(declare-fun m!629741 () Bool)

(assert (=> b!656192 m!629741))

(assert (=> b!656201 m!629713))

(assert (=> b!656201 m!629713))

(assert (=> b!656201 m!629715))

(declare-fun m!629743 () Bool)

(assert (=> b!656212 m!629743))

(declare-fun m!629745 () Bool)

(assert (=> b!656190 m!629745))

(assert (=> b!656202 m!629713))

(assert (=> b!656202 m!629713))

(declare-fun m!629747 () Bool)

(assert (=> b!656202 m!629747))

(assert (=> b!656206 m!629735))

(declare-fun m!629749 () Bool)

(assert (=> b!656206 m!629749))

(assert (=> b!656206 m!629713))

(assert (=> b!656191 m!629719))

(assert (=> b!656191 m!629713))

(assert (=> b!656191 m!629713))

(declare-fun m!629751 () Bool)

(assert (=> b!656191 m!629751))

(declare-fun m!629753 () Bool)

(assert (=> b!656191 m!629753))

(assert (=> b!656191 m!629713))

(declare-fun m!629755 () Bool)

(assert (=> b!656191 m!629755))

(declare-fun m!629757 () Bool)

(assert (=> b!656191 m!629757))

(assert (=> b!656191 m!629713))

(declare-fun m!629759 () Bool)

(assert (=> b!656191 m!629759))

(assert (=> b!656191 m!629729))

(assert (=> b!656204 m!629713))

(assert (=> b!656204 m!629713))

(assert (=> b!656204 m!629731))

(declare-fun m!629761 () Bool)

(assert (=> b!656189 m!629761))

(assert (=> b!656189 m!629713))

(assert (=> b!656189 m!629713))

(declare-fun m!629763 () Bool)

(assert (=> b!656189 m!629763))

(declare-fun m!629765 () Bool)

(assert (=> b!656198 m!629765))

(declare-fun m!629767 () Bool)

(assert (=> b!656198 m!629767))

(declare-fun m!629769 () Bool)

(assert (=> b!656198 m!629769))

(assert (=> b!656198 m!629713))

(assert (=> b!656198 m!629735))

(declare-fun m!629771 () Bool)

(assert (=> b!656198 m!629771))

(assert (=> b!656198 m!629713))

(declare-fun m!629773 () Bool)

(assert (=> b!656198 m!629773))

(assert (=> b!656198 m!629749))

(declare-fun m!629775 () Bool)

(assert (=> b!656198 m!629775))

(check-sat (not start!59430) (not b!656202) (not b!656207) (not b!656199) (not b!656204) (not b!656198) (not b!656192) (not b!656189) (not b!656190) (not b!656191) (not b!656197) (not b!656201) (not b!656212) (not b!656209))
(check-sat)
(get-model)

(declare-fun b!656367 () Bool)

(declare-fun e!376963 () Bool)

(declare-fun e!376965 () Bool)

(assert (=> b!656367 (= e!376963 e!376965)))

(declare-fun c!75674 () Bool)

(assert (=> b!656367 (= c!75674 (validKeyInArray!0 (select (arr!18541 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92715 () Bool)

(declare-fun res!425757 () Bool)

(declare-fun e!376962 () Bool)

(assert (=> d!92715 (=> res!425757 e!376962)))

(assert (=> d!92715 (= res!425757 (bvsge #b00000000000000000000000000000000 (size!18905 a!2986)))))

(assert (=> d!92715 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12486) e!376962)))

(declare-fun b!656368 () Bool)

(assert (=> b!656368 (= e!376962 e!376963)))

(declare-fun res!425758 () Bool)

(assert (=> b!656368 (=> (not res!425758) (not e!376963))))

(declare-fun e!376964 () Bool)

(assert (=> b!656368 (= res!425758 (not e!376964))))

(declare-fun res!425756 () Bool)

(assert (=> b!656368 (=> (not res!425756) (not e!376964))))

(assert (=> b!656368 (= res!425756 (validKeyInArray!0 (select (arr!18541 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656369 () Bool)

(declare-fun call!33843 () Bool)

(assert (=> b!656369 (= e!376965 call!33843)))

(declare-fun b!656370 () Bool)

(assert (=> b!656370 (= e!376965 call!33843)))

(declare-fun b!656371 () Bool)

(declare-fun contains!3169 (List!12489 (_ BitVec 64)) Bool)

(assert (=> b!656371 (= e!376964 (contains!3169 Nil!12486 (select (arr!18541 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33840 () Bool)

(assert (=> bm!33840 (= call!33843 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75674 (Cons!12485 (select (arr!18541 a!2986) #b00000000000000000000000000000000) Nil!12486) Nil!12486)))))

(assert (= (and d!92715 (not res!425757)) b!656368))

(assert (= (and b!656368 res!425756) b!656371))

(assert (= (and b!656368 res!425758) b!656367))

(assert (= (and b!656367 c!75674) b!656369))

(assert (= (and b!656367 (not c!75674)) b!656370))

(assert (= (or b!656369 b!656370) bm!33840))

(declare-fun m!629917 () Bool)

(assert (=> b!656367 m!629917))

(assert (=> b!656367 m!629917))

(declare-fun m!629919 () Bool)

(assert (=> b!656367 m!629919))

(assert (=> b!656368 m!629917))

(assert (=> b!656368 m!629917))

(assert (=> b!656368 m!629919))

(assert (=> b!656371 m!629917))

(assert (=> b!656371 m!629917))

(declare-fun m!629921 () Bool)

(assert (=> b!656371 m!629921))

(assert (=> bm!33840 m!629917))

(declare-fun m!629923 () Bool)

(assert (=> bm!33840 m!629923))

(assert (=> b!656209 d!92715))

(declare-fun d!92717 () Bool)

(assert (=> d!92717 (arrayNoDuplicates!0 lt!306226 index!984 Nil!12486)))

(declare-fun lt!306367 () Unit!22593)

(declare-fun choose!39 (array!38688 (_ BitVec 32) (_ BitVec 32)) Unit!22593)

(assert (=> d!92717 (= lt!306367 (choose!39 lt!306226 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92717 (bvslt (size!18905 lt!306226) #b01111111111111111111111111111111)))

(assert (=> d!92717 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306226 #b00000000000000000000000000000000 index!984) lt!306367)))

(declare-fun bs!19544 () Bool)

(assert (= bs!19544 d!92717))

(assert (=> bs!19544 m!629727))

(declare-fun m!629925 () Bool)

(assert (=> bs!19544 m!629925))

(assert (=> b!656199 d!92717))

(declare-fun d!92719 () Bool)

(declare-fun res!425763 () Bool)

(declare-fun e!376970 () Bool)

(assert (=> d!92719 (=> res!425763 e!376970)))

(assert (=> d!92719 (= res!425763 (= (select (arr!18541 lt!306226) j!136) (select (arr!18541 a!2986) j!136)))))

(assert (=> d!92719 (= (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136) e!376970)))

(declare-fun b!656376 () Bool)

(declare-fun e!376971 () Bool)

(assert (=> b!656376 (= e!376970 e!376971)))

(declare-fun res!425764 () Bool)

(assert (=> b!656376 (=> (not res!425764) (not e!376971))))

(assert (=> b!656376 (= res!425764 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18905 lt!306226)))))

(declare-fun b!656377 () Bool)

(assert (=> b!656377 (= e!376971 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92719 (not res!425763)) b!656376))

(assert (= (and b!656376 res!425764) b!656377))

(declare-fun m!629927 () Bool)

(assert (=> d!92719 m!629927))

(assert (=> b!656377 m!629713))

(declare-fun m!629929 () Bool)

(assert (=> b!656377 m!629929))

(assert (=> b!656199 d!92719))

(declare-fun d!92721 () Bool)

(declare-fun res!425765 () Bool)

(declare-fun e!376972 () Bool)

(assert (=> d!92721 (=> res!425765 e!376972)))

(assert (=> d!92721 (= res!425765 (= (select (arr!18541 lt!306226) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18541 a!2986) j!136)))))

(assert (=> d!92721 (= (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!376972)))

(declare-fun b!656378 () Bool)

(declare-fun e!376973 () Bool)

(assert (=> b!656378 (= e!376972 e!376973)))

(declare-fun res!425766 () Bool)

(assert (=> b!656378 (=> (not res!425766) (not e!376973))))

(assert (=> b!656378 (= res!425766 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18905 lt!306226)))))

(declare-fun b!656379 () Bool)

(assert (=> b!656379 (= e!376973 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92721 (not res!425765)) b!656378))

(assert (= (and b!656378 res!425766) b!656379))

(declare-fun m!629931 () Bool)

(assert (=> d!92721 m!629931))

(assert (=> b!656379 m!629713))

(declare-fun m!629933 () Bool)

(assert (=> b!656379 m!629933))

(assert (=> b!656199 d!92721))

(declare-fun d!92723 () Bool)

(declare-fun e!376976 () Bool)

(assert (=> d!92723 e!376976))

(declare-fun res!425769 () Bool)

(assert (=> d!92723 (=> (not res!425769) (not e!376976))))

(assert (=> d!92723 (= res!425769 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18905 a!2986))))))

(declare-fun lt!306370 () Unit!22593)

(declare-fun choose!41 (array!38688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12489) Unit!22593)

(assert (=> d!92723 (= lt!306370 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12486))))

(assert (=> d!92723 (bvslt (size!18905 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92723 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12486) lt!306370)))

(declare-fun b!656382 () Bool)

(assert (=> b!656382 (= e!376976 (arrayNoDuplicates!0 (array!38689 (store (arr!18541 a!2986) i!1108 k0!1786) (size!18905 a!2986)) #b00000000000000000000000000000000 Nil!12486))))

(assert (= (and d!92723 res!425769) b!656382))

(declare-fun m!629935 () Bool)

(assert (=> d!92723 m!629935))

(assert (=> b!656382 m!629735))

(declare-fun m!629937 () Bool)

(assert (=> b!656382 m!629937))

(assert (=> b!656199 d!92723))

(declare-fun d!92725 () Bool)

(assert (=> d!92725 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306373 () Unit!22593)

(declare-fun choose!114 (array!38688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22593)

(assert (=> d!92725 (= lt!306373 (choose!114 lt!306226 (select (arr!18541 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92725 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92725 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306373)))

(declare-fun bs!19545 () Bool)

(assert (= bs!19545 d!92725))

(assert (=> bs!19545 m!629713))

(assert (=> bs!19545 m!629725))

(assert (=> bs!19545 m!629713))

(declare-fun m!629939 () Bool)

(assert (=> bs!19545 m!629939))

(assert (=> b!656199 d!92725))

(declare-fun b!656383 () Bool)

(declare-fun e!376978 () Bool)

(declare-fun e!376980 () Bool)

(assert (=> b!656383 (= e!376978 e!376980)))

(declare-fun c!75675 () Bool)

(assert (=> b!656383 (= c!75675 (validKeyInArray!0 (select (arr!18541 lt!306226) index!984)))))

(declare-fun d!92727 () Bool)

(declare-fun res!425771 () Bool)

(declare-fun e!376977 () Bool)

(assert (=> d!92727 (=> res!425771 e!376977)))

(assert (=> d!92727 (= res!425771 (bvsge index!984 (size!18905 lt!306226)))))

(assert (=> d!92727 (= (arrayNoDuplicates!0 lt!306226 index!984 Nil!12486) e!376977)))

(declare-fun b!656384 () Bool)

(assert (=> b!656384 (= e!376977 e!376978)))

(declare-fun res!425772 () Bool)

(assert (=> b!656384 (=> (not res!425772) (not e!376978))))

(declare-fun e!376979 () Bool)

(assert (=> b!656384 (= res!425772 (not e!376979))))

(declare-fun res!425770 () Bool)

(assert (=> b!656384 (=> (not res!425770) (not e!376979))))

(assert (=> b!656384 (= res!425770 (validKeyInArray!0 (select (arr!18541 lt!306226) index!984)))))

(declare-fun b!656385 () Bool)

(declare-fun call!33844 () Bool)

(assert (=> b!656385 (= e!376980 call!33844)))

(declare-fun b!656386 () Bool)

(assert (=> b!656386 (= e!376980 call!33844)))

(declare-fun b!656387 () Bool)

(assert (=> b!656387 (= e!376979 (contains!3169 Nil!12486 (select (arr!18541 lt!306226) index!984)))))

(declare-fun bm!33841 () Bool)

(assert (=> bm!33841 (= call!33844 (arrayNoDuplicates!0 lt!306226 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75675 (Cons!12485 (select (arr!18541 lt!306226) index!984) Nil!12486) Nil!12486)))))

(assert (= (and d!92727 (not res!425771)) b!656384))

(assert (= (and b!656384 res!425770) b!656387))

(assert (= (and b!656384 res!425772) b!656383))

(assert (= (and b!656383 c!75675) b!656385))

(assert (= (and b!656383 (not c!75675)) b!656386))

(assert (= (or b!656385 b!656386) bm!33841))

(declare-fun m!629941 () Bool)

(assert (=> b!656383 m!629941))

(assert (=> b!656383 m!629941))

(declare-fun m!629943 () Bool)

(assert (=> b!656383 m!629943))

(assert (=> b!656384 m!629941))

(assert (=> b!656384 m!629941))

(assert (=> b!656384 m!629943))

(assert (=> b!656387 m!629941))

(assert (=> b!656387 m!629941))

(declare-fun m!629945 () Bool)

(assert (=> b!656387 m!629945))

(assert (=> bm!33841 m!629941))

(declare-fun m!629947 () Bool)

(assert (=> bm!33841 m!629947))

(assert (=> b!656199 d!92727))

(declare-fun b!656388 () Bool)

(declare-fun e!376982 () Bool)

(declare-fun e!376984 () Bool)

(assert (=> b!656388 (= e!376982 e!376984)))

(declare-fun c!75676 () Bool)

(assert (=> b!656388 (= c!75676 (validKeyInArray!0 (select (arr!18541 lt!306226) #b00000000000000000000000000000000)))))

(declare-fun d!92729 () Bool)

(declare-fun res!425774 () Bool)

(declare-fun e!376981 () Bool)

(assert (=> d!92729 (=> res!425774 e!376981)))

(assert (=> d!92729 (= res!425774 (bvsge #b00000000000000000000000000000000 (size!18905 lt!306226)))))

(assert (=> d!92729 (= (arrayNoDuplicates!0 lt!306226 #b00000000000000000000000000000000 Nil!12486) e!376981)))

(declare-fun b!656389 () Bool)

(assert (=> b!656389 (= e!376981 e!376982)))

(declare-fun res!425775 () Bool)

(assert (=> b!656389 (=> (not res!425775) (not e!376982))))

(declare-fun e!376983 () Bool)

(assert (=> b!656389 (= res!425775 (not e!376983))))

(declare-fun res!425773 () Bool)

(assert (=> b!656389 (=> (not res!425773) (not e!376983))))

(assert (=> b!656389 (= res!425773 (validKeyInArray!0 (select (arr!18541 lt!306226) #b00000000000000000000000000000000)))))

(declare-fun b!656390 () Bool)

(declare-fun call!33845 () Bool)

(assert (=> b!656390 (= e!376984 call!33845)))

(declare-fun b!656391 () Bool)

(assert (=> b!656391 (= e!376984 call!33845)))

(declare-fun b!656392 () Bool)

(assert (=> b!656392 (= e!376983 (contains!3169 Nil!12486 (select (arr!18541 lt!306226) #b00000000000000000000000000000000)))))

(declare-fun bm!33842 () Bool)

(assert (=> bm!33842 (= call!33845 (arrayNoDuplicates!0 lt!306226 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75676 (Cons!12485 (select (arr!18541 lt!306226) #b00000000000000000000000000000000) Nil!12486) Nil!12486)))))

(assert (= (and d!92729 (not res!425774)) b!656389))

(assert (= (and b!656389 res!425773) b!656392))

(assert (= (and b!656389 res!425775) b!656388))

(assert (= (and b!656388 c!75676) b!656390))

(assert (= (and b!656388 (not c!75676)) b!656391))

(assert (= (or b!656390 b!656391) bm!33842))

(declare-fun m!629949 () Bool)

(assert (=> b!656388 m!629949))

(assert (=> b!656388 m!629949))

(declare-fun m!629951 () Bool)

(assert (=> b!656388 m!629951))

(assert (=> b!656389 m!629949))

(assert (=> b!656389 m!629949))

(assert (=> b!656389 m!629951))

(assert (=> b!656392 m!629949))

(assert (=> b!656392 m!629949))

(declare-fun m!629953 () Bool)

(assert (=> b!656392 m!629953))

(assert (=> bm!33842 m!629949))

(declare-fun m!629955 () Bool)

(assert (=> bm!33842 m!629955))

(assert (=> b!656199 d!92729))

(declare-fun d!92731 () Bool)

(assert (=> d!92731 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18905 lt!306226)) (not (= (select (arr!18541 lt!306226) index!984) (select (arr!18541 a!2986) j!136))))))

(declare-fun lt!306376 () Unit!22593)

(declare-fun choose!21 (array!38688 (_ BitVec 64) (_ BitVec 32) List!12489) Unit!22593)

(assert (=> d!92731 (= lt!306376 (choose!21 lt!306226 (select (arr!18541 a!2986) j!136) index!984 Nil!12486))))

(assert (=> d!92731 (bvslt (size!18905 lt!306226) #b01111111111111111111111111111111)))

(assert (=> d!92731 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984 Nil!12486) lt!306376)))

(declare-fun bs!19546 () Bool)

(assert (= bs!19546 d!92731))

(assert (=> bs!19546 m!629941))

(assert (=> bs!19546 m!629713))

(declare-fun m!629957 () Bool)

(assert (=> bs!19546 m!629957))

(assert (=> b!656199 d!92731))

(declare-fun d!92733 () Bool)

(declare-fun res!425776 () Bool)

(declare-fun e!376985 () Bool)

(assert (=> d!92733 (=> res!425776 e!376985)))

(assert (=> d!92733 (= res!425776 (= (select (arr!18541 lt!306226) index!984) (select (arr!18541 a!2986) j!136)))))

(assert (=> d!92733 (= (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984) e!376985)))

(declare-fun b!656393 () Bool)

(declare-fun e!376986 () Bool)

(assert (=> b!656393 (= e!376985 e!376986)))

(declare-fun res!425777 () Bool)

(assert (=> b!656393 (=> (not res!425777) (not e!376986))))

(assert (=> b!656393 (= res!425777 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18905 lt!306226)))))

(declare-fun b!656394 () Bool)

(assert (=> b!656394 (= e!376986 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92733 (not res!425776)) b!656393))

(assert (= (and b!656393 res!425777) b!656394))

(assert (=> d!92733 m!629941))

(assert (=> b!656394 m!629713))

(declare-fun m!629959 () Bool)

(assert (=> b!656394 m!629959))

(assert (=> b!656197 d!92733))

(declare-fun b!656407 () Bool)

(declare-fun e!376995 () SeekEntryResult!6937)

(declare-fun e!376993 () SeekEntryResult!6937)

(assert (=> b!656407 (= e!376995 e!376993)))

(declare-fun c!75683 () Bool)

(declare-fun lt!306382 () (_ BitVec 64))

(assert (=> b!656407 (= c!75683 (= lt!306382 lt!306232))))

(declare-fun b!656408 () Bool)

(declare-fun e!376994 () SeekEntryResult!6937)

(assert (=> b!656408 (= e!376994 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!306232 lt!306226 mask!3053))))

(declare-fun b!656409 () Bool)

(assert (=> b!656409 (= e!376993 (Found!6937 index!984))))

(declare-fun lt!306381 () SeekEntryResult!6937)

(declare-fun d!92735 () Bool)

(get-info :version)

(assert (=> d!92735 (and (or ((_ is Undefined!6937) lt!306381) (not ((_ is Found!6937) lt!306381)) (and (bvsge (index!30108 lt!306381) #b00000000000000000000000000000000) (bvslt (index!30108 lt!306381) (size!18905 lt!306226)))) (or ((_ is Undefined!6937) lt!306381) ((_ is Found!6937) lt!306381) (not ((_ is MissingVacant!6937) lt!306381)) (not (= (index!30110 lt!306381) vacantSpotIndex!68)) (and (bvsge (index!30110 lt!306381) #b00000000000000000000000000000000) (bvslt (index!30110 lt!306381) (size!18905 lt!306226)))) (or ((_ is Undefined!6937) lt!306381) (ite ((_ is Found!6937) lt!306381) (= (select (arr!18541 lt!306226) (index!30108 lt!306381)) lt!306232) (and ((_ is MissingVacant!6937) lt!306381) (= (index!30110 lt!306381) vacantSpotIndex!68) (= (select (arr!18541 lt!306226) (index!30110 lt!306381)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92735 (= lt!306381 e!376995)))

(declare-fun c!75685 () Bool)

(assert (=> d!92735 (= c!75685 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92735 (= lt!306382 (select (arr!18541 lt!306226) index!984))))

(assert (=> d!92735 (validMask!0 mask!3053)))

(assert (=> d!92735 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306232 lt!306226 mask!3053) lt!306381)))

(declare-fun b!656410 () Bool)

(declare-fun c!75684 () Bool)

(assert (=> b!656410 (= c!75684 (= lt!306382 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656410 (= e!376993 e!376994)))

(declare-fun b!656411 () Bool)

(assert (=> b!656411 (= e!376995 Undefined!6937)))

(declare-fun b!656412 () Bool)

(assert (=> b!656412 (= e!376994 (MissingVacant!6937 vacantSpotIndex!68))))

(assert (= (and d!92735 c!75685) b!656411))

(assert (= (and d!92735 (not c!75685)) b!656407))

(assert (= (and b!656407 c!75683) b!656409))

(assert (= (and b!656407 (not c!75683)) b!656410))

(assert (= (and b!656410 c!75684) b!656412))

(assert (= (and b!656410 (not c!75684)) b!656408))

(declare-fun m!629961 () Bool)

(assert (=> b!656408 m!629961))

(assert (=> b!656408 m!629961))

(declare-fun m!629963 () Bool)

(assert (=> b!656408 m!629963))

(declare-fun m!629965 () Bool)

(assert (=> d!92735 m!629965))

(declare-fun m!629967 () Bool)

(assert (=> d!92735 m!629967))

(assert (=> d!92735 m!629941))

(assert (=> d!92735 m!629709))

(assert (=> b!656198 d!92735))

(declare-fun b!656413 () Bool)

(declare-fun e!376998 () SeekEntryResult!6937)

(declare-fun e!376996 () SeekEntryResult!6937)

(assert (=> b!656413 (= e!376998 e!376996)))

(declare-fun c!75686 () Bool)

(declare-fun lt!306384 () (_ BitVec 64))

(assert (=> b!656413 (= c!75686 (= lt!306384 (select (arr!18541 a!2986) j!136)))))

(declare-fun b!656414 () Bool)

(declare-fun e!376997 () SeekEntryResult!6937)

(assert (=> b!656414 (= e!376997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306239 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656415 () Bool)

(assert (=> b!656415 (= e!376996 (Found!6937 lt!306239))))

(declare-fun lt!306383 () SeekEntryResult!6937)

(declare-fun d!92737 () Bool)

(assert (=> d!92737 (and (or ((_ is Undefined!6937) lt!306383) (not ((_ is Found!6937) lt!306383)) (and (bvsge (index!30108 lt!306383) #b00000000000000000000000000000000) (bvslt (index!30108 lt!306383) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306383) ((_ is Found!6937) lt!306383) (not ((_ is MissingVacant!6937) lt!306383)) (not (= (index!30110 lt!306383) vacantSpotIndex!68)) (and (bvsge (index!30110 lt!306383) #b00000000000000000000000000000000) (bvslt (index!30110 lt!306383) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306383) (ite ((_ is Found!6937) lt!306383) (= (select (arr!18541 a!2986) (index!30108 lt!306383)) (select (arr!18541 a!2986) j!136)) (and ((_ is MissingVacant!6937) lt!306383) (= (index!30110 lt!306383) vacantSpotIndex!68) (= (select (arr!18541 a!2986) (index!30110 lt!306383)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92737 (= lt!306383 e!376998)))

(declare-fun c!75688 () Bool)

(assert (=> d!92737 (= c!75688 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92737 (= lt!306384 (select (arr!18541 a!2986) lt!306239))))

(assert (=> d!92737 (validMask!0 mask!3053)))

(assert (=> d!92737 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053) lt!306383)))

(declare-fun b!656416 () Bool)

(declare-fun c!75687 () Bool)

(assert (=> b!656416 (= c!75687 (= lt!306384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656416 (= e!376996 e!376997)))

(declare-fun b!656417 () Bool)

(assert (=> b!656417 (= e!376998 Undefined!6937)))

(declare-fun b!656418 () Bool)

(assert (=> b!656418 (= e!376997 (MissingVacant!6937 vacantSpotIndex!68))))

(assert (= (and d!92737 c!75688) b!656417))

(assert (= (and d!92737 (not c!75688)) b!656413))

(assert (= (and b!656413 c!75686) b!656415))

(assert (= (and b!656413 (not c!75686)) b!656416))

(assert (= (and b!656416 c!75687) b!656418))

(assert (= (and b!656416 (not c!75687)) b!656414))

(declare-fun m!629969 () Bool)

(assert (=> b!656414 m!629969))

(assert (=> b!656414 m!629969))

(assert (=> b!656414 m!629713))

(declare-fun m!629971 () Bool)

(assert (=> b!656414 m!629971))

(declare-fun m!629973 () Bool)

(assert (=> d!92737 m!629973))

(declare-fun m!629975 () Bool)

(assert (=> d!92737 m!629975))

(declare-fun m!629977 () Bool)

(assert (=> d!92737 m!629977))

(assert (=> d!92737 m!629709))

(assert (=> b!656198 d!92737))

(declare-fun b!656419 () Bool)

(declare-fun e!377001 () SeekEntryResult!6937)

(declare-fun e!376999 () SeekEntryResult!6937)

(assert (=> b!656419 (= e!377001 e!376999)))

(declare-fun c!75689 () Bool)

(declare-fun lt!306386 () (_ BitVec 64))

(assert (=> b!656419 (= c!75689 (= lt!306386 lt!306232))))

(declare-fun e!377000 () SeekEntryResult!6937)

(declare-fun b!656420 () Bool)

(assert (=> b!656420 (= e!377000 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306239 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!306232 lt!306226 mask!3053))))

(declare-fun b!656421 () Bool)

(assert (=> b!656421 (= e!376999 (Found!6937 lt!306239))))

(declare-fun d!92739 () Bool)

(declare-fun lt!306385 () SeekEntryResult!6937)

(assert (=> d!92739 (and (or ((_ is Undefined!6937) lt!306385) (not ((_ is Found!6937) lt!306385)) (and (bvsge (index!30108 lt!306385) #b00000000000000000000000000000000) (bvslt (index!30108 lt!306385) (size!18905 lt!306226)))) (or ((_ is Undefined!6937) lt!306385) ((_ is Found!6937) lt!306385) (not ((_ is MissingVacant!6937) lt!306385)) (not (= (index!30110 lt!306385) vacantSpotIndex!68)) (and (bvsge (index!30110 lt!306385) #b00000000000000000000000000000000) (bvslt (index!30110 lt!306385) (size!18905 lt!306226)))) (or ((_ is Undefined!6937) lt!306385) (ite ((_ is Found!6937) lt!306385) (= (select (arr!18541 lt!306226) (index!30108 lt!306385)) lt!306232) (and ((_ is MissingVacant!6937) lt!306385) (= (index!30110 lt!306385) vacantSpotIndex!68) (= (select (arr!18541 lt!306226) (index!30110 lt!306385)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92739 (= lt!306385 e!377001)))

(declare-fun c!75691 () Bool)

(assert (=> d!92739 (= c!75691 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92739 (= lt!306386 (select (arr!18541 lt!306226) lt!306239))))

(assert (=> d!92739 (validMask!0 mask!3053)))

(assert (=> d!92739 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 lt!306232 lt!306226 mask!3053) lt!306385)))

(declare-fun b!656422 () Bool)

(declare-fun c!75690 () Bool)

(assert (=> b!656422 (= c!75690 (= lt!306386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656422 (= e!376999 e!377000)))

(declare-fun b!656423 () Bool)

(assert (=> b!656423 (= e!377001 Undefined!6937)))

(declare-fun b!656424 () Bool)

(assert (=> b!656424 (= e!377000 (MissingVacant!6937 vacantSpotIndex!68))))

(assert (= (and d!92739 c!75691) b!656423))

(assert (= (and d!92739 (not c!75691)) b!656419))

(assert (= (and b!656419 c!75689) b!656421))

(assert (= (and b!656419 (not c!75689)) b!656422))

(assert (= (and b!656422 c!75690) b!656424))

(assert (= (and b!656422 (not c!75690)) b!656420))

(assert (=> b!656420 m!629969))

(assert (=> b!656420 m!629969))

(declare-fun m!629979 () Bool)

(assert (=> b!656420 m!629979))

(declare-fun m!629981 () Bool)

(assert (=> d!92739 m!629981))

(declare-fun m!629983 () Bool)

(assert (=> d!92739 m!629983))

(declare-fun m!629985 () Bool)

(assert (=> d!92739 m!629985))

(assert (=> d!92739 m!629709))

(assert (=> b!656198 d!92739))

(declare-fun d!92741 () Bool)

(declare-fun e!377004 () Bool)

(assert (=> d!92741 e!377004))

(declare-fun res!425780 () Bool)

(assert (=> d!92741 (=> (not res!425780) (not e!377004))))

(assert (=> d!92741 (= res!425780 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18905 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18905 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18905 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18905 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18905 a!2986))))))

(declare-fun lt!306389 () Unit!22593)

(declare-fun choose!9 (array!38688 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22593)

(assert (=> d!92741 (= lt!306389 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92741 (validMask!0 mask!3053)))

(assert (=> d!92741 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 mask!3053) lt!306389)))

(declare-fun b!656427 () Bool)

(assert (=> b!656427 (= e!377004 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306239 vacantSpotIndex!68 (select (store (arr!18541 a!2986) i!1108 k0!1786) j!136) (array!38689 (store (arr!18541 a!2986) i!1108 k0!1786) (size!18905 a!2986)) mask!3053)))))

(assert (= (and d!92741 res!425780) b!656427))

(declare-fun m!629987 () Bool)

(assert (=> d!92741 m!629987))

(assert (=> d!92741 m!629709))

(assert (=> b!656427 m!629767))

(declare-fun m!629989 () Bool)

(assert (=> b!656427 m!629989))

(assert (=> b!656427 m!629767))

(assert (=> b!656427 m!629713))

(assert (=> b!656427 m!629735))

(assert (=> b!656427 m!629713))

(assert (=> b!656427 m!629773))

(assert (=> b!656198 d!92741))

(declare-fun d!92743 () Bool)

(declare-fun lt!306392 () (_ BitVec 32))

(assert (=> d!92743 (and (bvsge lt!306392 #b00000000000000000000000000000000) (bvslt lt!306392 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92743 (= lt!306392 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!92743 (validMask!0 mask!3053)))

(assert (=> d!92743 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!306392)))

(declare-fun bs!19547 () Bool)

(assert (= bs!19547 d!92743))

(declare-fun m!629991 () Bool)

(assert (=> bs!19547 m!629991))

(assert (=> bs!19547 m!629709))

(assert (=> b!656198 d!92743))

(declare-fun b!656436 () Bool)

(declare-fun e!377013 () Bool)

(declare-fun e!377012 () Bool)

(assert (=> b!656436 (= e!377013 e!377012)))

(declare-fun c!75694 () Bool)

(assert (=> b!656436 (= c!75694 (validKeyInArray!0 (select (arr!18541 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656437 () Bool)

(declare-fun call!33848 () Bool)

(assert (=> b!656437 (= e!377012 call!33848)))

(declare-fun d!92745 () Bool)

(declare-fun res!425786 () Bool)

(assert (=> d!92745 (=> res!425786 e!377013)))

(assert (=> d!92745 (= res!425786 (bvsge #b00000000000000000000000000000000 (size!18905 a!2986)))))

(assert (=> d!92745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!377013)))

(declare-fun bm!33845 () Bool)

(assert (=> bm!33845 (= call!33848 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!656438 () Bool)

(declare-fun e!377011 () Bool)

(assert (=> b!656438 (= e!377011 call!33848)))

(declare-fun b!656439 () Bool)

(assert (=> b!656439 (= e!377012 e!377011)))

(declare-fun lt!306401 () (_ BitVec 64))

(assert (=> b!656439 (= lt!306401 (select (arr!18541 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306399 () Unit!22593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38688 (_ BitVec 64) (_ BitVec 32)) Unit!22593)

(assert (=> b!656439 (= lt!306399 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306401 #b00000000000000000000000000000000))))

(assert (=> b!656439 (arrayContainsKey!0 a!2986 lt!306401 #b00000000000000000000000000000000)))

(declare-fun lt!306400 () Unit!22593)

(assert (=> b!656439 (= lt!306400 lt!306399)))

(declare-fun res!425785 () Bool)

(assert (=> b!656439 (= res!425785 (= (seekEntryOrOpen!0 (select (arr!18541 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6937 #b00000000000000000000000000000000)))))

(assert (=> b!656439 (=> (not res!425785) (not e!377011))))

(assert (= (and d!92745 (not res!425786)) b!656436))

(assert (= (and b!656436 c!75694) b!656439))

(assert (= (and b!656436 (not c!75694)) b!656437))

(assert (= (and b!656439 res!425785) b!656438))

(assert (= (or b!656438 b!656437) bm!33845))

(assert (=> b!656436 m!629917))

(assert (=> b!656436 m!629917))

(assert (=> b!656436 m!629919))

(declare-fun m!629993 () Bool)

(assert (=> bm!33845 m!629993))

(assert (=> b!656439 m!629917))

(declare-fun m!629995 () Bool)

(assert (=> b!656439 m!629995))

(declare-fun m!629997 () Bool)

(assert (=> b!656439 m!629997))

(assert (=> b!656439 m!629917))

(declare-fun m!629999 () Bool)

(assert (=> b!656439 m!629999))

(assert (=> b!656207 d!92745))

(assert (=> b!656204 d!92719))

(declare-fun d!92747 () Bool)

(assert (=> d!92747 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656192 d!92747))

(assert (=> b!656201 d!92733))

(declare-fun d!92749 () Bool)

(declare-fun res!425787 () Bool)

(declare-fun e!377014 () Bool)

(assert (=> d!92749 (=> res!425787 e!377014)))

(assert (=> d!92749 (= res!425787 (= (select (arr!18541 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92749 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!377014)))

(declare-fun b!656440 () Bool)

(declare-fun e!377015 () Bool)

(assert (=> b!656440 (= e!377014 e!377015)))

(declare-fun res!425788 () Bool)

(assert (=> b!656440 (=> (not res!425788) (not e!377015))))

(assert (=> b!656440 (= res!425788 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18905 a!2986)))))

(declare-fun b!656441 () Bool)

(assert (=> b!656441 (= e!377015 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92749 (not res!425787)) b!656440))

(assert (= (and b!656440 res!425788) b!656441))

(assert (=> d!92749 m!629917))

(declare-fun m!630001 () Bool)

(assert (=> b!656441 m!630001))

(assert (=> b!656212 d!92749))

(declare-fun d!92751 () Bool)

(assert (=> d!92751 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306402 () Unit!22593)

(assert (=> d!92751 (= lt!306402 (choose!114 lt!306226 (select (arr!18541 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92751 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92751 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306226 (select (arr!18541 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306402)))

(declare-fun bs!19548 () Bool)

(assert (= bs!19548 d!92751))

(assert (=> bs!19548 m!629713))

(assert (=> bs!19548 m!629751))

(assert (=> bs!19548 m!629713))

(declare-fun m!630003 () Bool)

(assert (=> bs!19548 m!630003))

(assert (=> b!656191 d!92751))

(declare-fun d!92753 () Bool)

(assert (=> d!92753 (arrayNoDuplicates!0 lt!306226 j!136 Nil!12486)))

(declare-fun lt!306403 () Unit!22593)

(assert (=> d!92753 (= lt!306403 (choose!39 lt!306226 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92753 (bvslt (size!18905 lt!306226) #b01111111111111111111111111111111)))

(assert (=> d!92753 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306226 #b00000000000000000000000000000000 j!136) lt!306403)))

(declare-fun bs!19549 () Bool)

(assert (= bs!19549 d!92753))

(assert (=> bs!19549 m!629753))

(declare-fun m!630005 () Bool)

(assert (=> bs!19549 m!630005))

(assert (=> b!656191 d!92753))

(declare-fun d!92755 () Bool)

(declare-fun res!425789 () Bool)

(declare-fun e!377016 () Bool)

(assert (=> d!92755 (=> res!425789 e!377016)))

(assert (=> d!92755 (= res!425789 (= (select (arr!18541 lt!306226) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18541 a!2986) j!136)))))

(assert (=> d!92755 (= (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!377016)))

(declare-fun b!656442 () Bool)

(declare-fun e!377017 () Bool)

(assert (=> b!656442 (= e!377016 e!377017)))

(declare-fun res!425790 () Bool)

(assert (=> b!656442 (=> (not res!425790) (not e!377017))))

(assert (=> b!656442 (= res!425790 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18905 lt!306226)))))

(declare-fun b!656443 () Bool)

(assert (=> b!656443 (= e!377017 (arrayContainsKey!0 lt!306226 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92755 (not res!425789)) b!656442))

(assert (= (and b!656442 res!425790) b!656443))

(declare-fun m!630007 () Bool)

(assert (=> d!92755 m!630007))

(assert (=> b!656443 m!629713))

(declare-fun m!630009 () Bool)

(assert (=> b!656443 m!630009))

(assert (=> b!656191 d!92755))

(declare-fun d!92757 () Bool)

(assert (=> d!92757 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18905 lt!306226)) (not (= (select (arr!18541 lt!306226) j!136) (select (arr!18541 a!2986) j!136))))))

(declare-fun lt!306404 () Unit!22593)

(assert (=> d!92757 (= lt!306404 (choose!21 lt!306226 (select (arr!18541 a!2986) j!136) j!136 Nil!12486))))

(assert (=> d!92757 (bvslt (size!18905 lt!306226) #b01111111111111111111111111111111)))

(assert (=> d!92757 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306226 (select (arr!18541 a!2986) j!136) j!136 Nil!12486) lt!306404)))

(declare-fun bs!19550 () Bool)

(assert (= bs!19550 d!92757))

(assert (=> bs!19550 m!629927))

(assert (=> bs!19550 m!629713))

(declare-fun m!630011 () Bool)

(assert (=> bs!19550 m!630011))

(assert (=> b!656191 d!92757))

(assert (=> b!656191 d!92723))

(assert (=> b!656191 d!92729))

(declare-fun b!656444 () Bool)

(declare-fun e!377019 () Bool)

(declare-fun e!377021 () Bool)

(assert (=> b!656444 (= e!377019 e!377021)))

(declare-fun c!75695 () Bool)

(assert (=> b!656444 (= c!75695 (validKeyInArray!0 (select (arr!18541 lt!306226) j!136)))))

(declare-fun d!92759 () Bool)

(declare-fun res!425792 () Bool)

(declare-fun e!377018 () Bool)

(assert (=> d!92759 (=> res!425792 e!377018)))

(assert (=> d!92759 (= res!425792 (bvsge j!136 (size!18905 lt!306226)))))

(assert (=> d!92759 (= (arrayNoDuplicates!0 lt!306226 j!136 Nil!12486) e!377018)))

(declare-fun b!656445 () Bool)

(assert (=> b!656445 (= e!377018 e!377019)))

(declare-fun res!425793 () Bool)

(assert (=> b!656445 (=> (not res!425793) (not e!377019))))

(declare-fun e!377020 () Bool)

(assert (=> b!656445 (= res!425793 (not e!377020))))

(declare-fun res!425791 () Bool)

(assert (=> b!656445 (=> (not res!425791) (not e!377020))))

(assert (=> b!656445 (= res!425791 (validKeyInArray!0 (select (arr!18541 lt!306226) j!136)))))

(declare-fun b!656446 () Bool)

(declare-fun call!33849 () Bool)

(assert (=> b!656446 (= e!377021 call!33849)))

(declare-fun b!656447 () Bool)

(assert (=> b!656447 (= e!377021 call!33849)))

(declare-fun b!656448 () Bool)

(assert (=> b!656448 (= e!377020 (contains!3169 Nil!12486 (select (arr!18541 lt!306226) j!136)))))

(declare-fun bm!33846 () Bool)

(assert (=> bm!33846 (= call!33849 (arrayNoDuplicates!0 lt!306226 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75695 (Cons!12485 (select (arr!18541 lt!306226) j!136) Nil!12486) Nil!12486)))))

(assert (= (and d!92759 (not res!425792)) b!656445))

(assert (= (and b!656445 res!425791) b!656448))

(assert (= (and b!656445 res!425793) b!656444))

(assert (= (and b!656444 c!75695) b!656446))

(assert (= (and b!656444 (not c!75695)) b!656447))

(assert (= (or b!656446 b!656447) bm!33846))

(assert (=> b!656444 m!629927))

(assert (=> b!656444 m!629927))

(declare-fun m!630013 () Bool)

(assert (=> b!656444 m!630013))

(assert (=> b!656445 m!629927))

(assert (=> b!656445 m!629927))

(assert (=> b!656445 m!630013))

(assert (=> b!656448 m!629927))

(assert (=> b!656448 m!629927))

(declare-fun m!630015 () Bool)

(assert (=> b!656448 m!630015))

(assert (=> bm!33846 m!629927))

(declare-fun m!630017 () Bool)

(assert (=> bm!33846 m!630017))

(assert (=> b!656191 d!92759))

(declare-fun d!92761 () Bool)

(assert (=> d!92761 (= (validKeyInArray!0 (select (arr!18541 a!2986) j!136)) (and (not (= (select (arr!18541 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18541 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656202 d!92761))

(declare-fun d!92763 () Bool)

(assert (=> d!92763 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59430 d!92763))

(declare-fun d!92765 () Bool)

(assert (=> d!92765 (= (array_inv!14400 a!2986) (bvsge (size!18905 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59430 d!92765))

(declare-fun b!656449 () Bool)

(declare-fun e!377024 () SeekEntryResult!6937)

(declare-fun e!377022 () SeekEntryResult!6937)

(assert (=> b!656449 (= e!377024 e!377022)))

(declare-fun lt!306406 () (_ BitVec 64))

(declare-fun c!75696 () Bool)

(assert (=> b!656449 (= c!75696 (= lt!306406 (select (arr!18541 a!2986) j!136)))))

(declare-fun e!377023 () SeekEntryResult!6937)

(declare-fun b!656450 () Bool)

(assert (=> b!656450 (= e!377023 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656451 () Bool)

(assert (=> b!656451 (= e!377022 (Found!6937 index!984))))

(declare-fun lt!306405 () SeekEntryResult!6937)

(declare-fun d!92767 () Bool)

(assert (=> d!92767 (and (or ((_ is Undefined!6937) lt!306405) (not ((_ is Found!6937) lt!306405)) (and (bvsge (index!30108 lt!306405) #b00000000000000000000000000000000) (bvslt (index!30108 lt!306405) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306405) ((_ is Found!6937) lt!306405) (not ((_ is MissingVacant!6937) lt!306405)) (not (= (index!30110 lt!306405) vacantSpotIndex!68)) (and (bvsge (index!30110 lt!306405) #b00000000000000000000000000000000) (bvslt (index!30110 lt!306405) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306405) (ite ((_ is Found!6937) lt!306405) (= (select (arr!18541 a!2986) (index!30108 lt!306405)) (select (arr!18541 a!2986) j!136)) (and ((_ is MissingVacant!6937) lt!306405) (= (index!30110 lt!306405) vacantSpotIndex!68) (= (select (arr!18541 a!2986) (index!30110 lt!306405)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92767 (= lt!306405 e!377024)))

(declare-fun c!75698 () Bool)

(assert (=> d!92767 (= c!75698 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92767 (= lt!306406 (select (arr!18541 a!2986) index!984))))

(assert (=> d!92767 (validMask!0 mask!3053)))

(assert (=> d!92767 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053) lt!306405)))

(declare-fun b!656452 () Bool)

(declare-fun c!75697 () Bool)

(assert (=> b!656452 (= c!75697 (= lt!306406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656452 (= e!377022 e!377023)))

(declare-fun b!656453 () Bool)

(assert (=> b!656453 (= e!377024 Undefined!6937)))

(declare-fun b!656454 () Bool)

(assert (=> b!656454 (= e!377023 (MissingVacant!6937 vacantSpotIndex!68))))

(assert (= (and d!92767 c!75698) b!656453))

(assert (= (and d!92767 (not c!75698)) b!656449))

(assert (= (and b!656449 c!75696) b!656451))

(assert (= (and b!656449 (not c!75696)) b!656452))

(assert (= (and b!656452 c!75697) b!656454))

(assert (= (and b!656452 (not c!75697)) b!656450))

(assert (=> b!656450 m!629961))

(assert (=> b!656450 m!629961))

(assert (=> b!656450 m!629713))

(declare-fun m!630019 () Bool)

(assert (=> b!656450 m!630019))

(declare-fun m!630021 () Bool)

(assert (=> d!92767 m!630021))

(declare-fun m!630023 () Bool)

(assert (=> d!92767 m!630023))

(assert (=> d!92767 m!629761))

(assert (=> d!92767 m!629709))

(assert (=> b!656189 d!92767))

(declare-fun b!656473 () Bool)

(declare-fun e!377039 () SeekEntryResult!6937)

(declare-fun lt!306414 () SeekEntryResult!6937)

(assert (=> b!656473 (= e!377039 (MissingZero!6937 (index!30109 lt!306414)))))

(declare-fun b!656474 () Bool)

(declare-fun c!75707 () Bool)

(declare-fun lt!306413 () (_ BitVec 64))

(assert (=> b!656474 (= c!75707 (= lt!306413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377037 () SeekEntryResult!6937)

(assert (=> b!656474 (= e!377037 e!377039)))

(declare-fun b!656475 () Bool)

(assert (=> b!656475 (= e!377039 (seekKeyOrZeroReturnVacant!0 (x!59045 lt!306414) (index!30109 lt!306414) (index!30109 lt!306414) k0!1786 a!2986 mask!3053))))

(declare-fun b!656476 () Bool)

(declare-fun e!377038 () SeekEntryResult!6937)

(assert (=> b!656476 (= e!377038 Undefined!6937)))

(declare-fun d!92769 () Bool)

(declare-fun lt!306415 () SeekEntryResult!6937)

(assert (=> d!92769 (and (or ((_ is Undefined!6937) lt!306415) (not ((_ is Found!6937) lt!306415)) (and (bvsge (index!30108 lt!306415) #b00000000000000000000000000000000) (bvslt (index!30108 lt!306415) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306415) ((_ is Found!6937) lt!306415) (not ((_ is MissingZero!6937) lt!306415)) (and (bvsge (index!30107 lt!306415) #b00000000000000000000000000000000) (bvslt (index!30107 lt!306415) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306415) ((_ is Found!6937) lt!306415) ((_ is MissingZero!6937) lt!306415) (not ((_ is MissingVacant!6937) lt!306415)) (and (bvsge (index!30110 lt!306415) #b00000000000000000000000000000000) (bvslt (index!30110 lt!306415) (size!18905 a!2986)))) (or ((_ is Undefined!6937) lt!306415) (ite ((_ is Found!6937) lt!306415) (= (select (arr!18541 a!2986) (index!30108 lt!306415)) k0!1786) (ite ((_ is MissingZero!6937) lt!306415) (= (select (arr!18541 a!2986) (index!30107 lt!306415)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6937) lt!306415) (= (select (arr!18541 a!2986) (index!30110 lt!306415)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92769 (= lt!306415 e!377038)))

(declare-fun c!75705 () Bool)

(assert (=> d!92769 (= c!75705 (and ((_ is Intermediate!6937) lt!306414) (undefined!7749 lt!306414)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38688 (_ BitVec 32)) SeekEntryResult!6937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92769 (= lt!306414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92769 (validMask!0 mask!3053)))

(assert (=> d!92769 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!306415)))

(declare-fun b!656477 () Bool)

(assert (=> b!656477 (= e!377038 e!377037)))

(assert (=> b!656477 (= lt!306413 (select (arr!18541 a!2986) (index!30109 lt!306414)))))

(declare-fun c!75706 () Bool)

(assert (=> b!656477 (= c!75706 (= lt!306413 k0!1786))))

(declare-fun b!656478 () Bool)

(assert (=> b!656478 (= e!377037 (Found!6937 (index!30109 lt!306414)))))

(assert (= (and d!92769 c!75705) b!656476))

(assert (= (and d!92769 (not c!75705)) b!656477))

(assert (= (and b!656477 c!75706) b!656478))

(assert (= (and b!656477 (not c!75706)) b!656474))

(assert (= (and b!656474 c!75707) b!656473))

(assert (= (and b!656474 (not c!75707)) b!656475))

(declare-fun m!630029 () Bool)

(assert (=> b!656475 m!630029))

(assert (=> d!92769 m!629709))

(declare-fun m!630031 () Bool)

(assert (=> d!92769 m!630031))

(declare-fun m!630033 () Bool)

(assert (=> d!92769 m!630033))

(declare-fun m!630035 () Bool)

(assert (=> d!92769 m!630035))

(declare-fun m!630037 () Bool)

(assert (=> d!92769 m!630037))

(assert (=> d!92769 m!630031))

(declare-fun m!630039 () Bool)

(assert (=> d!92769 m!630039))

(declare-fun m!630041 () Bool)

(assert (=> b!656477 m!630041))

(assert (=> b!656190 d!92769))

(check-sat (not d!92757) (not b!656387) (not b!656377) (not d!92767) (not bm!33846) (not b!656439) (not b!656445) (not b!656383) (not b!656441) (not b!656368) (not d!92769) (not d!92725) (not d!92753) (not bm!33842) (not d!92731) (not b!656394) (not d!92741) (not d!92737) (not b!656384) (not d!92739) (not b!656443) (not bm!33845) (not d!92735) (not b!656420) (not b!656388) (not bm!33841) (not b!656408) (not d!92717) (not b!656427) (not b!656379) (not bm!33840) (not b!656448) (not b!656371) (not d!92723) (not b!656436) (not b!656392) (not b!656414) (not b!656389) (not b!656444) (not b!656382) (not b!656367) (not d!92751) (not b!656450) (not b!656475) (not d!92743))
(check-sat)
