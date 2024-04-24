; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59622 () Bool)

(assert start!59622)

(declare-fun b!657778 () Bool)

(declare-fun res!426523 () Bool)

(declare-fun e!377875 () Bool)

(assert (=> b!657778 (=> (not res!426523) (not e!377875))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38718 0))(
  ( (array!38719 (arr!18553 (Array (_ BitVec 32) (_ BitVec 64))) (size!18917 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38718)

(assert (=> b!657778 (= res!426523 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18553 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657779 () Bool)

(declare-fun res!426519 () Bool)

(assert (=> b!657779 (=> (not res!426519) (not e!377875))))

(declare-datatypes ((List!12501 0))(
  ( (Nil!12498) (Cons!12497 (h!13545 (_ BitVec 64)) (t!18721 List!12501)) )
))
(declare-fun arrayNoDuplicates!0 (array!38718 (_ BitVec 32) List!12501) Bool)

(assert (=> b!657779 (= res!426519 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12498))))

(declare-fun b!657780 () Bool)

(declare-datatypes ((Unit!22713 0))(
  ( (Unit!22714) )
))
(declare-fun e!377880 () Unit!22713)

(declare-fun Unit!22715 () Unit!22713)

(assert (=> b!657780 (= e!377880 Unit!22715)))

(declare-fun b!657781 () Bool)

(declare-fun Unit!22716 () Unit!22713)

(assert (=> b!657781 (= e!377880 Unit!22716)))

(assert (=> b!657781 false))

(declare-fun b!657782 () Bool)

(declare-fun e!377872 () Unit!22713)

(declare-fun Unit!22717 () Unit!22713)

(assert (=> b!657782 (= e!377872 Unit!22717)))

(declare-fun b!657783 () Bool)

(declare-fun e!377878 () Bool)

(assert (=> b!657783 (= e!377878 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!657783 (= (select (store (arr!18553 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657784 () Bool)

(declare-fun e!377869 () Unit!22713)

(declare-fun Unit!22718 () Unit!22713)

(assert (=> b!657784 (= e!377869 Unit!22718)))

(declare-fun b!657785 () Bool)

(declare-fun res!426513 () Bool)

(declare-fun e!377881 () Bool)

(assert (=> b!657785 (=> (not res!426513) (not e!377881))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!657785 (= res!426513 (and (= (size!18917 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18917 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18917 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657786 () Bool)

(assert (=> b!657786 false))

(declare-fun lt!307253 () Unit!22713)

(declare-fun lt!307267 () array!38718)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38718 (_ BitVec 64) (_ BitVec 32) List!12501) Unit!22713)

(assert (=> b!657786 (= lt!307253 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307267 (select (arr!18553 a!2986) j!136) j!136 Nil!12498))))

(assert (=> b!657786 (arrayNoDuplicates!0 lt!307267 j!136 Nil!12498)))

(declare-fun lt!307260 () Unit!22713)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38718 (_ BitVec 32) (_ BitVec 32)) Unit!22713)

(assert (=> b!657786 (= lt!307260 (lemmaNoDuplicateFromThenFromBigger!0 lt!307267 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657786 (arrayNoDuplicates!0 lt!307267 #b00000000000000000000000000000000 Nil!12498)))

(declare-fun lt!307257 () Unit!22713)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38718 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12501) Unit!22713)

(assert (=> b!657786 (= lt!307257 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12498))))

(declare-fun arrayContainsKey!0 (array!38718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657786 (arrayContainsKey!0 lt!307267 (select (arr!18553 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307258 () Unit!22713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38718 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22713)

(assert (=> b!657786 (= lt!307258 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307267 (select (arr!18553 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22719 () Unit!22713)

(assert (=> b!657786 (= e!377869 Unit!22719)))

(declare-fun b!657787 () Bool)

(declare-fun res!426512 () Bool)

(assert (=> b!657787 (=> (not res!426512) (not e!377881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657787 (= res!426512 (validKeyInArray!0 k0!1786))))

(declare-fun res!426510 () Bool)

(assert (=> start!59622 (=> (not res!426510) (not e!377881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59622 (= res!426510 (validMask!0 mask!3053))))

(assert (=> start!59622 e!377881))

(assert (=> start!59622 true))

(declare-fun array_inv!14412 (array!38718) Bool)

(assert (=> start!59622 (array_inv!14412 a!2986)))

(declare-fun b!657788 () Bool)

(assert (=> b!657788 (= e!377881 e!377875)))

(declare-fun res!426516 () Bool)

(assert (=> b!657788 (=> (not res!426516) (not e!377875))))

(declare-datatypes ((SeekEntryResult!6949 0))(
  ( (MissingZero!6949 (index!30161 (_ BitVec 32))) (Found!6949 (index!30162 (_ BitVec 32))) (Intermediate!6949 (undefined!7761 Bool) (index!30163 (_ BitVec 32)) (x!59107 (_ BitVec 32))) (Undefined!6949) (MissingVacant!6949 (index!30164 (_ BitVec 32))) )
))
(declare-fun lt!307256 () SeekEntryResult!6949)

(assert (=> b!657788 (= res!426516 (or (= lt!307256 (MissingZero!6949 i!1108)) (= lt!307256 (MissingVacant!6949 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38718 (_ BitVec 32)) SeekEntryResult!6949)

(assert (=> b!657788 (= lt!307256 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657789 () Bool)

(declare-fun e!377883 () Bool)

(assert (=> b!657789 (= e!377883 (arrayContainsKey!0 lt!307267 (select (arr!18553 a!2986) j!136) index!984))))

(declare-fun b!657790 () Bool)

(declare-fun e!377874 () Bool)

(assert (=> b!657790 (= e!377874 (not e!377878))))

(declare-fun res!426521 () Bool)

(assert (=> b!657790 (=> res!426521 e!377878)))

(declare-fun lt!307255 () SeekEntryResult!6949)

(assert (=> b!657790 (= res!426521 (not (= lt!307255 (MissingVacant!6949 vacantSpotIndex!68))))))

(declare-fun lt!307262 () Unit!22713)

(assert (=> b!657790 (= lt!307262 e!377872)))

(declare-fun c!76006 () Bool)

(assert (=> b!657790 (= c!76006 (= lt!307255 (Found!6949 index!984)))))

(declare-fun lt!307268 () Unit!22713)

(assert (=> b!657790 (= lt!307268 e!377880)))

(declare-fun c!76004 () Bool)

(assert (=> b!657790 (= c!76004 (= lt!307255 Undefined!6949))))

(declare-fun lt!307269 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38718 (_ BitVec 32)) SeekEntryResult!6949)

(assert (=> b!657790 (= lt!307255 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307269 lt!307267 mask!3053))))

(declare-fun e!377876 () Bool)

(assert (=> b!657790 e!377876))

(declare-fun res!426508 () Bool)

(assert (=> b!657790 (=> (not res!426508) (not e!377876))))

(declare-fun lt!307263 () SeekEntryResult!6949)

(declare-fun lt!307259 () (_ BitVec 32))

(assert (=> b!657790 (= res!426508 (= lt!307263 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307259 vacantSpotIndex!68 lt!307269 lt!307267 mask!3053)))))

(assert (=> b!657790 (= lt!307263 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307259 vacantSpotIndex!68 (select (arr!18553 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657790 (= lt!307269 (select (store (arr!18553 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307251 () Unit!22713)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38718 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22713)

(assert (=> b!657790 (= lt!307251 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307259 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657790 (= lt!307259 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!657791 () Bool)

(declare-fun e!377871 () Bool)

(assert (=> b!657791 (= e!377871 e!377874)))

(declare-fun res!426520 () Bool)

(assert (=> b!657791 (=> (not res!426520) (not e!377874))))

(declare-fun lt!307270 () SeekEntryResult!6949)

(assert (=> b!657791 (= res!426520 (and (= lt!307270 (Found!6949 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18553 a!2986) index!984) (select (arr!18553 a!2986) j!136))) (not (= (select (arr!18553 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657791 (= lt!307270 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18553 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657792 () Bool)

(assert (=> b!657792 (= e!377875 e!377871)))

(declare-fun res!426517 () Bool)

(assert (=> b!657792 (=> (not res!426517) (not e!377871))))

(assert (=> b!657792 (= res!426517 (= (select (store (arr!18553 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657792 (= lt!307267 (array!38719 (store (arr!18553 a!2986) i!1108 k0!1786) (size!18917 a!2986)))))

(declare-fun b!657793 () Bool)

(declare-fun res!426509 () Bool)

(assert (=> b!657793 (= res!426509 (arrayContainsKey!0 lt!307267 (select (arr!18553 a!2986) j!136) j!136))))

(declare-fun e!377877 () Bool)

(assert (=> b!657793 (=> (not res!426509) (not e!377877))))

(declare-fun e!377882 () Bool)

(assert (=> b!657793 (= e!377882 e!377877)))

(declare-fun b!657794 () Bool)

(assert (=> b!657794 false))

(declare-fun lt!307266 () Unit!22713)

(assert (=> b!657794 (= lt!307266 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307267 (select (arr!18553 a!2986) j!136) index!984 Nil!12498))))

(assert (=> b!657794 (arrayNoDuplicates!0 lt!307267 index!984 Nil!12498)))

(declare-fun lt!307254 () Unit!22713)

(assert (=> b!657794 (= lt!307254 (lemmaNoDuplicateFromThenFromBigger!0 lt!307267 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657794 (arrayNoDuplicates!0 lt!307267 #b00000000000000000000000000000000 Nil!12498)))

(declare-fun lt!307252 () Unit!22713)

(assert (=> b!657794 (= lt!307252 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12498))))

(assert (=> b!657794 (arrayContainsKey!0 lt!307267 (select (arr!18553 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307261 () Unit!22713)

(assert (=> b!657794 (= lt!307261 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307267 (select (arr!18553 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657794 e!377883))

(declare-fun res!426514 () Bool)

(assert (=> b!657794 (=> (not res!426514) (not e!377883))))

(assert (=> b!657794 (= res!426514 (arrayContainsKey!0 lt!307267 (select (arr!18553 a!2986) j!136) j!136))))

(declare-fun e!377879 () Unit!22713)

(declare-fun Unit!22720 () Unit!22713)

(assert (=> b!657794 (= e!377879 Unit!22720)))

(declare-fun b!657795 () Bool)

(declare-fun res!426518 () Bool)

(assert (=> b!657795 (=> (not res!426518) (not e!377875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38718 (_ BitVec 32)) Bool)

(assert (=> b!657795 (= res!426518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657796 () Bool)

(assert (=> b!657796 (= e!377877 (arrayContainsKey!0 lt!307267 (select (arr!18553 a!2986) j!136) index!984))))

(declare-fun b!657797 () Bool)

(declare-fun res!426522 () Bool)

(assert (=> b!657797 (=> (not res!426522) (not e!377881))))

(assert (=> b!657797 (= res!426522 (validKeyInArray!0 (select (arr!18553 a!2986) j!136)))))

(declare-fun b!657798 () Bool)

(declare-fun Unit!22721 () Unit!22713)

(assert (=> b!657798 (= e!377879 Unit!22721)))

(declare-fun b!657799 () Bool)

(assert (=> b!657799 (= e!377876 (= lt!307270 lt!307263))))

(declare-fun b!657800 () Bool)

(declare-fun res!426507 () Bool)

(assert (=> b!657800 (=> (not res!426507) (not e!377881))))

(assert (=> b!657800 (= res!426507 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657801 () Bool)

(declare-fun Unit!22722 () Unit!22713)

(assert (=> b!657801 (= e!377872 Unit!22722)))

(declare-fun res!426515 () Bool)

(assert (=> b!657801 (= res!426515 (= (select (store (arr!18553 a!2986) i!1108 k0!1786) index!984) (select (arr!18553 a!2986) j!136)))))

(declare-fun e!377873 () Bool)

(assert (=> b!657801 (=> (not res!426515) (not e!377873))))

(assert (=> b!657801 e!377873))

(declare-fun c!76005 () Bool)

(assert (=> b!657801 (= c!76005 (bvslt j!136 index!984))))

(declare-fun lt!307265 () Unit!22713)

(assert (=> b!657801 (= lt!307265 e!377869)))

(declare-fun c!76007 () Bool)

(assert (=> b!657801 (= c!76007 (bvslt index!984 j!136))))

(declare-fun lt!307264 () Unit!22713)

(assert (=> b!657801 (= lt!307264 e!377879)))

(assert (=> b!657801 false))

(declare-fun b!657802 () Bool)

(declare-fun res!426511 () Bool)

(assert (=> b!657802 (= res!426511 (bvsge j!136 index!984))))

(assert (=> b!657802 (=> res!426511 e!377882)))

(assert (=> b!657802 (= e!377873 e!377882)))

(assert (= (and start!59622 res!426510) b!657785))

(assert (= (and b!657785 res!426513) b!657797))

(assert (= (and b!657797 res!426522) b!657787))

(assert (= (and b!657787 res!426512) b!657800))

(assert (= (and b!657800 res!426507) b!657788))

(assert (= (and b!657788 res!426516) b!657795))

(assert (= (and b!657795 res!426518) b!657779))

(assert (= (and b!657779 res!426519) b!657778))

(assert (= (and b!657778 res!426523) b!657792))

(assert (= (and b!657792 res!426517) b!657791))

(assert (= (and b!657791 res!426520) b!657790))

(assert (= (and b!657790 res!426508) b!657799))

(assert (= (and b!657790 c!76004) b!657781))

(assert (= (and b!657790 (not c!76004)) b!657780))

(assert (= (and b!657790 c!76006) b!657801))

(assert (= (and b!657790 (not c!76006)) b!657782))

(assert (= (and b!657801 res!426515) b!657802))

(assert (= (and b!657802 (not res!426511)) b!657793))

(assert (= (and b!657793 res!426509) b!657796))

(assert (= (and b!657801 c!76005) b!657786))

(assert (= (and b!657801 (not c!76005)) b!657784))

(assert (= (and b!657801 c!76007) b!657794))

(assert (= (and b!657801 (not c!76007)) b!657798))

(assert (= (and b!657794 res!426514) b!657789))

(assert (= (and b!657790 (not res!426521)) b!657783))

(declare-fun m!631279 () Bool)

(assert (=> b!657791 m!631279))

(declare-fun m!631281 () Bool)

(assert (=> b!657791 m!631281))

(assert (=> b!657791 m!631281))

(declare-fun m!631283 () Bool)

(assert (=> b!657791 m!631283))

(assert (=> b!657796 m!631281))

(assert (=> b!657796 m!631281))

(declare-fun m!631285 () Bool)

(assert (=> b!657796 m!631285))

(declare-fun m!631287 () Bool)

(assert (=> b!657788 m!631287))

(declare-fun m!631289 () Bool)

(assert (=> b!657778 m!631289))

(declare-fun m!631291 () Bool)

(assert (=> b!657787 m!631291))

(declare-fun m!631293 () Bool)

(assert (=> b!657800 m!631293))

(assert (=> b!657789 m!631281))

(assert (=> b!657789 m!631281))

(assert (=> b!657789 m!631285))

(assert (=> b!657797 m!631281))

(assert (=> b!657797 m!631281))

(declare-fun m!631295 () Bool)

(assert (=> b!657797 m!631295))

(declare-fun m!631297 () Bool)

(assert (=> b!657794 m!631297))

(declare-fun m!631299 () Bool)

(assert (=> b!657794 m!631299))

(assert (=> b!657794 m!631281))

(declare-fun m!631301 () Bool)

(assert (=> b!657794 m!631301))

(assert (=> b!657794 m!631281))

(declare-fun m!631303 () Bool)

(assert (=> b!657794 m!631303))

(declare-fun m!631305 () Bool)

(assert (=> b!657794 m!631305))

(assert (=> b!657794 m!631281))

(declare-fun m!631307 () Bool)

(assert (=> b!657794 m!631307))

(declare-fun m!631309 () Bool)

(assert (=> b!657794 m!631309))

(assert (=> b!657794 m!631281))

(declare-fun m!631311 () Bool)

(assert (=> b!657794 m!631311))

(assert (=> b!657794 m!631281))

(declare-fun m!631313 () Bool)

(assert (=> b!657792 m!631313))

(declare-fun m!631315 () Bool)

(assert (=> b!657792 m!631315))

(assert (=> b!657801 m!631313))

(declare-fun m!631317 () Bool)

(assert (=> b!657801 m!631317))

(assert (=> b!657801 m!631281))

(declare-fun m!631319 () Bool)

(assert (=> b!657786 m!631319))

(assert (=> b!657786 m!631281))

(assert (=> b!657786 m!631281))

(declare-fun m!631321 () Bool)

(assert (=> b!657786 m!631321))

(assert (=> b!657786 m!631305))

(assert (=> b!657786 m!631281))

(declare-fun m!631323 () Bool)

(assert (=> b!657786 m!631323))

(assert (=> b!657786 m!631309))

(declare-fun m!631325 () Bool)

(assert (=> b!657786 m!631325))

(assert (=> b!657786 m!631281))

(declare-fun m!631327 () Bool)

(assert (=> b!657786 m!631327))

(declare-fun m!631329 () Bool)

(assert (=> b!657779 m!631329))

(declare-fun m!631331 () Bool)

(assert (=> start!59622 m!631331))

(declare-fun m!631333 () Bool)

(assert (=> start!59622 m!631333))

(assert (=> b!657793 m!631281))

(assert (=> b!657793 m!631281))

(assert (=> b!657793 m!631307))

(declare-fun m!631335 () Bool)

(assert (=> b!657790 m!631335))

(declare-fun m!631337 () Bool)

(assert (=> b!657790 m!631337))

(assert (=> b!657790 m!631281))

(declare-fun m!631339 () Bool)

(assert (=> b!657790 m!631339))

(assert (=> b!657790 m!631313))

(assert (=> b!657790 m!631281))

(declare-fun m!631341 () Bool)

(assert (=> b!657790 m!631341))

(declare-fun m!631343 () Bool)

(assert (=> b!657790 m!631343))

(declare-fun m!631345 () Bool)

(assert (=> b!657790 m!631345))

(assert (=> b!657783 m!631313))

(assert (=> b!657783 m!631317))

(declare-fun m!631347 () Bool)

(assert (=> b!657795 m!631347))

(check-sat (not b!657796) (not b!657786) (not b!657779) (not b!657793) (not b!657795) (not start!59622) (not b!657788) (not b!657787) (not b!657789) (not b!657797) (not b!657790) (not b!657791) (not b!657794) (not b!657800))
(check-sat)
