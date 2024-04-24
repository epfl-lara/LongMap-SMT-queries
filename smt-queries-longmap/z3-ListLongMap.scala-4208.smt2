; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57750 () Bool)

(assert start!57750)

(declare-fun b!637827 () Bool)

(declare-fun e!364985 () Bool)

(declare-fun e!364983 () Bool)

(assert (=> b!637827 (= e!364985 e!364983)))

(declare-fun res!412624 () Bool)

(assert (=> b!637827 (=> res!412624 e!364983)))

(declare-datatypes ((array!38259 0))(
  ( (array!38260 (arr!18349 (Array (_ BitVec 32) (_ BitVec 64))) (size!18713 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38259)

(assert (=> b!637827 (= res!412624 (or (bvsge (size!18713 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18713 a!2986))))))

(declare-fun lt!294917 () array!38259)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637827 (arrayContainsKey!0 lt!294917 (select (arr!18349 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21489 0))(
  ( (Unit!21490) )
))
(declare-fun lt!294919 () Unit!21489)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38259 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21489)

(assert (=> b!637827 (= lt!294919 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294917 (select (arr!18349 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637828 () Bool)

(declare-fun res!412627 () Bool)

(declare-fun e!364990 () Bool)

(assert (=> b!637828 (=> (not res!412627) (not e!364990))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!637828 (= res!412627 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18349 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637829 () Bool)

(declare-fun e!364992 () Bool)

(assert (=> b!637829 (= e!364992 e!364990)))

(declare-fun res!412623 () Bool)

(assert (=> b!637829 (=> (not res!412623) (not e!364990))))

(declare-datatypes ((SeekEntryResult!6745 0))(
  ( (MissingZero!6745 (index!29294 (_ BitVec 32))) (Found!6745 (index!29295 (_ BitVec 32))) (Intermediate!6745 (undefined!7557 Bool) (index!29296 (_ BitVec 32)) (x!58206 (_ BitVec 32))) (Undefined!6745) (MissingVacant!6745 (index!29297 (_ BitVec 32))) )
))
(declare-fun lt!294915 () SeekEntryResult!6745)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637829 (= res!412623 (or (= lt!294915 (MissingZero!6745 i!1108)) (= lt!294915 (MissingVacant!6745 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38259 (_ BitVec 32)) SeekEntryResult!6745)

(assert (=> b!637829 (= lt!294915 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637830 () Bool)

(declare-fun e!364980 () Unit!21489)

(declare-fun Unit!21491 () Unit!21489)

(assert (=> b!637830 (= e!364980 Unit!21491)))

(assert (=> b!637830 false))

(declare-fun b!637831 () Bool)

(declare-fun res!412618 () Bool)

(assert (=> b!637831 (=> res!412618 e!364983)))

(declare-datatypes ((List!12297 0))(
  ( (Nil!12294) (Cons!12293 (h!13341 (_ BitVec 64)) (t!18517 List!12297)) )
))
(declare-fun contains!3089 (List!12297 (_ BitVec 64)) Bool)

(assert (=> b!637831 (= res!412618 (contains!3089 Nil!12294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637832 () Bool)

(declare-fun res!412611 () Bool)

(assert (=> b!637832 (=> (not res!412611) (not e!364992))))

(assert (=> b!637832 (= res!412611 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637833 () Bool)

(declare-fun res!412616 () Bool)

(assert (=> b!637833 (=> (not res!412616) (not e!364990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38259 (_ BitVec 32)) Bool)

(assert (=> b!637833 (= res!412616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!364981 () Bool)

(declare-fun b!637834 () Bool)

(assert (=> b!637834 (= e!364981 (arrayContainsKey!0 lt!294917 (select (arr!18349 a!2986) j!136) index!984))))

(declare-fun b!637835 () Bool)

(declare-fun e!364987 () Bool)

(declare-fun e!364986 () Bool)

(assert (=> b!637835 (= e!364987 e!364986)))

(declare-fun res!412620 () Bool)

(assert (=> b!637835 (=> (not res!412620) (not e!364986))))

(declare-fun lt!294921 () SeekEntryResult!6745)

(assert (=> b!637835 (= res!412620 (and (= lt!294921 (Found!6745 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18349 a!2986) index!984) (select (arr!18349 a!2986) j!136))) (not (= (select (arr!18349 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38259 (_ BitVec 32)) SeekEntryResult!6745)

(assert (=> b!637835 (= lt!294921 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637836 () Bool)

(declare-fun Unit!21492 () Unit!21489)

(assert (=> b!637836 (= e!364980 Unit!21492)))

(declare-fun b!637837 () Bool)

(declare-fun e!364988 () Bool)

(declare-fun lt!294916 () SeekEntryResult!6745)

(assert (=> b!637837 (= e!364988 (= lt!294921 lt!294916))))

(declare-fun b!637838 () Bool)

(declare-fun e!364982 () Bool)

(assert (=> b!637838 (= e!364982 e!364985)))

(declare-fun res!412612 () Bool)

(assert (=> b!637838 (=> res!412612 e!364985)))

(declare-fun lt!294913 () (_ BitVec 64))

(declare-fun lt!294911 () (_ BitVec 64))

(assert (=> b!637838 (= res!412612 (or (not (= (select (arr!18349 a!2986) j!136) lt!294911)) (not (= (select (arr!18349 a!2986) j!136) lt!294913)) (bvsge j!136 index!984)))))

(declare-fun e!364984 () Bool)

(assert (=> b!637838 e!364984))

(declare-fun res!412621 () Bool)

(assert (=> b!637838 (=> (not res!412621) (not e!364984))))

(assert (=> b!637838 (= res!412621 (= lt!294913 (select (arr!18349 a!2986) j!136)))))

(assert (=> b!637838 (= lt!294913 (select (store (arr!18349 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637839 () Bool)

(assert (=> b!637839 (= e!364983 true)))

(declare-fun lt!294914 () Bool)

(assert (=> b!637839 (= lt!294914 (contains!3089 Nil!12294 k0!1786))))

(declare-fun b!637840 () Bool)

(assert (=> b!637840 (= e!364986 (not e!364982))))

(declare-fun res!412625 () Bool)

(assert (=> b!637840 (=> res!412625 e!364982)))

(declare-fun lt!294912 () SeekEntryResult!6745)

(assert (=> b!637840 (= res!412625 (not (= lt!294912 (Found!6745 index!984))))))

(declare-fun lt!294922 () Unit!21489)

(assert (=> b!637840 (= lt!294922 e!364980)))

(declare-fun c!72977 () Bool)

(assert (=> b!637840 (= c!72977 (= lt!294912 Undefined!6745))))

(assert (=> b!637840 (= lt!294912 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294911 lt!294917 mask!3053))))

(assert (=> b!637840 e!364988))

(declare-fun res!412630 () Bool)

(assert (=> b!637840 (=> (not res!412630) (not e!364988))))

(declare-fun lt!294920 () (_ BitVec 32))

(assert (=> b!637840 (= res!412630 (= lt!294916 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294920 vacantSpotIndex!68 lt!294911 lt!294917 mask!3053)))))

(assert (=> b!637840 (= lt!294916 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294920 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637840 (= lt!294911 (select (store (arr!18349 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294918 () Unit!21489)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21489)

(assert (=> b!637840 (= lt!294918 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294920 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637840 (= lt!294920 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!637841 () Bool)

(declare-fun res!412615 () Bool)

(assert (=> b!637841 (=> (not res!412615) (not e!364990))))

(declare-fun arrayNoDuplicates!0 (array!38259 (_ BitVec 32) List!12297) Bool)

(assert (=> b!637841 (= res!412615 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12294))))

(declare-fun b!637842 () Bool)

(declare-fun e!364991 () Bool)

(assert (=> b!637842 (= e!364991 e!364981)))

(declare-fun res!412613 () Bool)

(assert (=> b!637842 (=> (not res!412613) (not e!364981))))

(assert (=> b!637842 (= res!412613 (arrayContainsKey!0 lt!294917 (select (arr!18349 a!2986) j!136) j!136))))

(declare-fun b!637843 () Bool)

(declare-fun res!412614 () Bool)

(assert (=> b!637843 (=> res!412614 e!364983)))

(assert (=> b!637843 (= res!412614 (contains!3089 Nil!12294 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!412629 () Bool)

(assert (=> start!57750 (=> (not res!412629) (not e!364992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57750 (= res!412629 (validMask!0 mask!3053))))

(assert (=> start!57750 e!364992))

(assert (=> start!57750 true))

(declare-fun array_inv!14208 (array!38259) Bool)

(assert (=> start!57750 (array_inv!14208 a!2986)))

(declare-fun b!637844 () Bool)

(declare-fun res!412610 () Bool)

(assert (=> b!637844 (=> (not res!412610) (not e!364992))))

(assert (=> b!637844 (= res!412610 (and (= (size!18713 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18713 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18713 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637845 () Bool)

(declare-fun res!412617 () Bool)

(assert (=> b!637845 (=> (not res!412617) (not e!364992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637845 (= res!412617 (validKeyInArray!0 k0!1786))))

(declare-fun b!637846 () Bool)

(assert (=> b!637846 (= e!364990 e!364987)))

(declare-fun res!412628 () Bool)

(assert (=> b!637846 (=> (not res!412628) (not e!364987))))

(assert (=> b!637846 (= res!412628 (= (select (store (arr!18349 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637846 (= lt!294917 (array!38260 (store (arr!18349 a!2986) i!1108 k0!1786) (size!18713 a!2986)))))

(declare-fun b!637847 () Bool)

(assert (=> b!637847 (= e!364984 e!364991)))

(declare-fun res!412619 () Bool)

(assert (=> b!637847 (=> res!412619 e!364991)))

(assert (=> b!637847 (= res!412619 (or (not (= (select (arr!18349 a!2986) j!136) lt!294911)) (not (= (select (arr!18349 a!2986) j!136) lt!294913)) (bvsge j!136 index!984)))))

(declare-fun b!637848 () Bool)

(declare-fun res!412622 () Bool)

(assert (=> b!637848 (=> res!412622 e!364983)))

(declare-fun noDuplicate!391 (List!12297) Bool)

(assert (=> b!637848 (= res!412622 (not (noDuplicate!391 Nil!12294)))))

(declare-fun b!637849 () Bool)

(declare-fun res!412626 () Bool)

(assert (=> b!637849 (=> (not res!412626) (not e!364992))))

(assert (=> b!637849 (= res!412626 (validKeyInArray!0 (select (arr!18349 a!2986) j!136)))))

(assert (= (and start!57750 res!412629) b!637844))

(assert (= (and b!637844 res!412610) b!637849))

(assert (= (and b!637849 res!412626) b!637845))

(assert (= (and b!637845 res!412617) b!637832))

(assert (= (and b!637832 res!412611) b!637829))

(assert (= (and b!637829 res!412623) b!637833))

(assert (= (and b!637833 res!412616) b!637841))

(assert (= (and b!637841 res!412615) b!637828))

(assert (= (and b!637828 res!412627) b!637846))

(assert (= (and b!637846 res!412628) b!637835))

(assert (= (and b!637835 res!412620) b!637840))

(assert (= (and b!637840 res!412630) b!637837))

(assert (= (and b!637840 c!72977) b!637830))

(assert (= (and b!637840 (not c!72977)) b!637836))

(assert (= (and b!637840 (not res!412625)) b!637838))

(assert (= (and b!637838 res!412621) b!637847))

(assert (= (and b!637847 (not res!412619)) b!637842))

(assert (= (and b!637842 res!412613) b!637834))

(assert (= (and b!637838 (not res!412612)) b!637827))

(assert (= (and b!637827 (not res!412624)) b!637848))

(assert (= (and b!637848 (not res!412622)) b!637831))

(assert (= (and b!637831 (not res!412618)) b!637843))

(assert (= (and b!637843 (not res!412614)) b!637839))

(declare-fun m!612247 () Bool)

(assert (=> b!637829 m!612247))

(declare-fun m!612249 () Bool)

(assert (=> b!637846 m!612249))

(declare-fun m!612251 () Bool)

(assert (=> b!637846 m!612251))

(declare-fun m!612253 () Bool)

(assert (=> b!637849 m!612253))

(assert (=> b!637849 m!612253))

(declare-fun m!612255 () Bool)

(assert (=> b!637849 m!612255))

(declare-fun m!612257 () Bool)

(assert (=> b!637833 m!612257))

(assert (=> b!637827 m!612253))

(assert (=> b!637827 m!612253))

(declare-fun m!612259 () Bool)

(assert (=> b!637827 m!612259))

(assert (=> b!637827 m!612253))

(declare-fun m!612261 () Bool)

(assert (=> b!637827 m!612261))

(assert (=> b!637842 m!612253))

(assert (=> b!637842 m!612253))

(declare-fun m!612263 () Bool)

(assert (=> b!637842 m!612263))

(declare-fun m!612265 () Bool)

(assert (=> b!637839 m!612265))

(declare-fun m!612267 () Bool)

(assert (=> b!637843 m!612267))

(assert (=> b!637847 m!612253))

(declare-fun m!612269 () Bool)

(assert (=> b!637840 m!612269))

(declare-fun m!612271 () Bool)

(assert (=> b!637840 m!612271))

(assert (=> b!637840 m!612253))

(declare-fun m!612273 () Bool)

(assert (=> b!637840 m!612273))

(declare-fun m!612275 () Bool)

(assert (=> b!637840 m!612275))

(assert (=> b!637840 m!612249))

(assert (=> b!637840 m!612253))

(declare-fun m!612277 () Bool)

(assert (=> b!637840 m!612277))

(declare-fun m!612279 () Bool)

(assert (=> b!637840 m!612279))

(declare-fun m!612281 () Bool)

(assert (=> b!637832 m!612281))

(declare-fun m!612283 () Bool)

(assert (=> b!637845 m!612283))

(declare-fun m!612285 () Bool)

(assert (=> start!57750 m!612285))

(declare-fun m!612287 () Bool)

(assert (=> start!57750 m!612287))

(assert (=> b!637838 m!612253))

(assert (=> b!637838 m!612249))

(declare-fun m!612289 () Bool)

(assert (=> b!637838 m!612289))

(declare-fun m!612291 () Bool)

(assert (=> b!637828 m!612291))

(declare-fun m!612293 () Bool)

(assert (=> b!637848 m!612293))

(declare-fun m!612295 () Bool)

(assert (=> b!637831 m!612295))

(declare-fun m!612297 () Bool)

(assert (=> b!637841 m!612297))

(declare-fun m!612299 () Bool)

(assert (=> b!637835 m!612299))

(assert (=> b!637835 m!612253))

(assert (=> b!637835 m!612253))

(declare-fun m!612301 () Bool)

(assert (=> b!637835 m!612301))

(assert (=> b!637834 m!612253))

(assert (=> b!637834 m!612253))

(declare-fun m!612303 () Bool)

(assert (=> b!637834 m!612303))

(check-sat (not b!637834) (not b!637833) (not b!637843) (not b!637842) (not b!637827) (not b!637841) (not b!637829) (not b!637832) (not start!57750) (not b!637845) (not b!637849) (not b!637831) (not b!637839) (not b!637835) (not b!637848) (not b!637840))
(check-sat)
