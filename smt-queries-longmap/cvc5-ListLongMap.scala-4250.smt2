; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58886 () Bool)

(assert start!58886)

(declare-fun b!649819 () Bool)

(declare-fun e!372746 () Bool)

(declare-fun e!372753 () Bool)

(assert (=> b!649819 (= e!372746 e!372753)))

(declare-fun res!421260 () Bool)

(assert (=> b!649819 (=> (not res!421260) (not e!372753))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38548 0))(
  ( (array!38549 (arr!18480 (Array (_ BitVec 32) (_ BitVec 64))) (size!18844 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38548)

(assert (=> b!649819 (= res!421260 (= (select (store (arr!18480 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301851 () array!38548)

(assert (=> b!649819 (= lt!301851 (array!38549 (store (arr!18480 a!2986) i!1108 k!1786) (size!18844 a!2986)))))

(declare-fun b!649820 () Bool)

(declare-datatypes ((Unit!22146 0))(
  ( (Unit!22147) )
))
(declare-fun e!372751 () Unit!22146)

(declare-fun Unit!22148 () Unit!22146)

(assert (=> b!649820 (= e!372751 Unit!22148)))

(assert (=> b!649820 false))

(declare-fun b!649821 () Bool)

(declare-fun res!421253 () Bool)

(declare-fun e!372744 () Bool)

(assert (=> b!649821 (=> (not res!421253) (not e!372744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649821 (= res!421253 (validKeyInArray!0 k!1786))))

(declare-fun b!649822 () Bool)

(declare-fun e!372743 () Unit!22146)

(declare-fun Unit!22149 () Unit!22146)

(assert (=> b!649822 (= e!372743 Unit!22149)))

(declare-fun lt!301840 () Unit!22146)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22146)

(assert (=> b!649822 (= lt!301840 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301851 (select (arr!18480 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649822 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301839 () Unit!22146)

(declare-datatypes ((List!12521 0))(
  ( (Nil!12518) (Cons!12517 (h!13562 (_ BitVec 64)) (t!18749 List!12521)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12521) Unit!22146)

(assert (=> b!649822 (= lt!301839 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12518))))

(declare-fun arrayNoDuplicates!0 (array!38548 (_ BitVec 32) List!12521) Bool)

(assert (=> b!649822 (arrayNoDuplicates!0 lt!301851 #b00000000000000000000000000000000 Nil!12518)))

(declare-fun lt!301850 () Unit!22146)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38548 (_ BitVec 32) (_ BitVec 32)) Unit!22146)

(assert (=> b!649822 (= lt!301850 (lemmaNoDuplicateFromThenFromBigger!0 lt!301851 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649822 (arrayNoDuplicates!0 lt!301851 j!136 Nil!12518)))

(declare-fun lt!301848 () Unit!22146)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38548 (_ BitVec 64) (_ BitVec 32) List!12521) Unit!22146)

(assert (=> b!649822 (= lt!301848 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301851 (select (arr!18480 a!2986) j!136) j!136 Nil!12518))))

(assert (=> b!649822 false))

(declare-fun b!649823 () Bool)

(declare-fun e!372740 () Bool)

(declare-fun e!372748 () Bool)

(assert (=> b!649823 (= e!372740 (not e!372748))))

(declare-fun res!421256 () Bool)

(assert (=> b!649823 (=> res!421256 e!372748)))

(declare-datatypes ((SeekEntryResult!6920 0))(
  ( (MissingZero!6920 (index!30027 (_ BitVec 32))) (Found!6920 (index!30028 (_ BitVec 32))) (Intermediate!6920 (undefined!7732 Bool) (index!30029 (_ BitVec 32)) (x!58813 (_ BitVec 32))) (Undefined!6920) (MissingVacant!6920 (index!30030 (_ BitVec 32))) )
))
(declare-fun lt!301842 () SeekEntryResult!6920)

(assert (=> b!649823 (= res!421256 (not (= lt!301842 (Found!6920 index!984))))))

(declare-fun lt!301836 () Unit!22146)

(assert (=> b!649823 (= lt!301836 e!372751)))

(declare-fun c!74651 () Bool)

(assert (=> b!649823 (= c!74651 (= lt!301842 Undefined!6920))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!301852 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38548 (_ BitVec 32)) SeekEntryResult!6920)

(assert (=> b!649823 (= lt!301842 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301852 lt!301851 mask!3053))))

(declare-fun e!372742 () Bool)

(assert (=> b!649823 e!372742))

(declare-fun res!421258 () Bool)

(assert (=> b!649823 (=> (not res!421258) (not e!372742))))

(declare-fun lt!301838 () SeekEntryResult!6920)

(declare-fun lt!301841 () (_ BitVec 32))

(assert (=> b!649823 (= res!421258 (= lt!301838 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 lt!301852 lt!301851 mask!3053)))))

(assert (=> b!649823 (= lt!301838 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649823 (= lt!301852 (select (store (arr!18480 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301843 () Unit!22146)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38548 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22146)

(assert (=> b!649823 (= lt!301843 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649823 (= lt!301841 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649824 () Bool)

(declare-fun res!421266 () Bool)

(assert (=> b!649824 (=> (not res!421266) (not e!372746))))

(assert (=> b!649824 (= res!421266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18480 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649825 () Bool)

(declare-fun res!421259 () Bool)

(assert (=> b!649825 (=> (not res!421259) (not e!372746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38548 (_ BitVec 32)) Bool)

(assert (=> b!649825 (= res!421259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649826 () Bool)

(declare-fun e!372749 () Bool)

(declare-fun e!372739 () Bool)

(assert (=> b!649826 (= e!372749 e!372739)))

(declare-fun res!421267 () Bool)

(assert (=> b!649826 (=> res!421267 e!372739)))

(assert (=> b!649826 (= res!421267 (bvsge index!984 j!136))))

(declare-fun lt!301847 () Unit!22146)

(assert (=> b!649826 (= lt!301847 e!372743)))

(declare-fun c!74650 () Bool)

(assert (=> b!649826 (= c!74650 (bvslt j!136 index!984))))

(declare-fun res!421269 () Bool)

(assert (=> start!58886 (=> (not res!421269) (not e!372744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58886 (= res!421269 (validMask!0 mask!3053))))

(assert (=> start!58886 e!372744))

(assert (=> start!58886 true))

(declare-fun array_inv!14276 (array!38548) Bool)

(assert (=> start!58886 (array_inv!14276 a!2986)))

(declare-fun b!649827 () Bool)

(declare-fun lt!301845 () SeekEntryResult!6920)

(assert (=> b!649827 (= e!372742 (= lt!301845 lt!301838))))

(declare-fun b!649828 () Bool)

(assert (=> b!649828 (= e!372744 e!372746)))

(declare-fun res!421261 () Bool)

(assert (=> b!649828 (=> (not res!421261) (not e!372746))))

(declare-fun lt!301849 () SeekEntryResult!6920)

(assert (=> b!649828 (= res!421261 (or (= lt!301849 (MissingZero!6920 i!1108)) (= lt!301849 (MissingVacant!6920 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38548 (_ BitVec 32)) SeekEntryResult!6920)

(assert (=> b!649828 (= lt!301849 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649829 () Bool)

(declare-fun e!372741 () Bool)

(assert (=> b!649829 (= e!372741 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) index!984))))

(declare-fun b!649830 () Bool)

(assert (=> b!649830 (= e!372748 e!372749)))

(declare-fun res!421255 () Bool)

(assert (=> b!649830 (=> res!421255 e!372749)))

(declare-fun lt!301837 () (_ BitVec 64))

(assert (=> b!649830 (= res!421255 (or (not (= (select (arr!18480 a!2986) j!136) lt!301852)) (not (= (select (arr!18480 a!2986) j!136) lt!301837))))))

(declare-fun e!372750 () Bool)

(assert (=> b!649830 e!372750))

(declare-fun res!421265 () Bool)

(assert (=> b!649830 (=> (not res!421265) (not e!372750))))

(assert (=> b!649830 (= res!421265 (= lt!301837 (select (arr!18480 a!2986) j!136)))))

(assert (=> b!649830 (= lt!301837 (select (store (arr!18480 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649831 () Bool)

(declare-fun e!372745 () Bool)

(assert (=> b!649831 (= e!372750 e!372745)))

(declare-fun res!421271 () Bool)

(assert (=> b!649831 (=> res!421271 e!372745)))

(assert (=> b!649831 (= res!421271 (or (not (= (select (arr!18480 a!2986) j!136) lt!301852)) (not (= (select (arr!18480 a!2986) j!136) lt!301837)) (bvsge j!136 index!984)))))

(declare-fun b!649832 () Bool)

(assert (=> b!649832 (= e!372745 e!372741)))

(declare-fun res!421270 () Bool)

(assert (=> b!649832 (=> (not res!421270) (not e!372741))))

(assert (=> b!649832 (= res!421270 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) j!136))))

(declare-fun b!649833 () Bool)

(assert (=> b!649833 (= e!372753 e!372740)))

(declare-fun res!421264 () Bool)

(assert (=> b!649833 (=> (not res!421264) (not e!372740))))

(assert (=> b!649833 (= res!421264 (and (= lt!301845 (Found!6920 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18480 a!2986) index!984) (select (arr!18480 a!2986) j!136))) (not (= (select (arr!18480 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649833 (= lt!301845 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649834 () Bool)

(declare-fun Unit!22150 () Unit!22146)

(assert (=> b!649834 (= e!372743 Unit!22150)))

(declare-fun b!649835 () Bool)

(declare-fun Unit!22151 () Unit!22146)

(assert (=> b!649835 (= e!372751 Unit!22151)))

(declare-fun e!372747 () Bool)

(declare-fun b!649836 () Bool)

(assert (=> b!649836 (= e!372747 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) index!984))))

(declare-fun b!649837 () Bool)

(declare-fun res!421263 () Bool)

(assert (=> b!649837 (=> (not res!421263) (not e!372744))))

(assert (=> b!649837 (= res!421263 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649838 () Bool)

(declare-fun res!421262 () Bool)

(assert (=> b!649838 (=> (not res!421262) (not e!372744))))

(assert (=> b!649838 (= res!421262 (validKeyInArray!0 (select (arr!18480 a!2986) j!136)))))

(declare-fun b!649839 () Bool)

(assert (=> b!649839 (= e!372739 (bvslt (size!18844 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!649839 (arrayNoDuplicates!0 lt!301851 #b00000000000000000000000000000000 Nil!12518)))

(declare-fun lt!301844 () Unit!22146)

(assert (=> b!649839 (= lt!301844 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12518))))

(assert (=> b!649839 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301846 () Unit!22146)

(assert (=> b!649839 (= lt!301846 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301851 (select (arr!18480 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649839 e!372747))

(declare-fun res!421257 () Bool)

(assert (=> b!649839 (=> (not res!421257) (not e!372747))))

(assert (=> b!649839 (= res!421257 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) j!136))))

(declare-fun b!649840 () Bool)

(declare-fun res!421254 () Bool)

(assert (=> b!649840 (=> (not res!421254) (not e!372744))))

(assert (=> b!649840 (= res!421254 (and (= (size!18844 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18844 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18844 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649841 () Bool)

(declare-fun res!421268 () Bool)

(assert (=> b!649841 (=> (not res!421268) (not e!372746))))

(assert (=> b!649841 (= res!421268 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12518))))

(assert (= (and start!58886 res!421269) b!649840))

(assert (= (and b!649840 res!421254) b!649838))

(assert (= (and b!649838 res!421262) b!649821))

(assert (= (and b!649821 res!421253) b!649837))

(assert (= (and b!649837 res!421263) b!649828))

(assert (= (and b!649828 res!421261) b!649825))

(assert (= (and b!649825 res!421259) b!649841))

(assert (= (and b!649841 res!421268) b!649824))

(assert (= (and b!649824 res!421266) b!649819))

(assert (= (and b!649819 res!421260) b!649833))

(assert (= (and b!649833 res!421264) b!649823))

(assert (= (and b!649823 res!421258) b!649827))

(assert (= (and b!649823 c!74651) b!649820))

(assert (= (and b!649823 (not c!74651)) b!649835))

(assert (= (and b!649823 (not res!421256)) b!649830))

(assert (= (and b!649830 res!421265) b!649831))

(assert (= (and b!649831 (not res!421271)) b!649832))

(assert (= (and b!649832 res!421270) b!649829))

(assert (= (and b!649830 (not res!421255)) b!649826))

(assert (= (and b!649826 c!74650) b!649822))

(assert (= (and b!649826 (not c!74650)) b!649834))

(assert (= (and b!649826 (not res!421267)) b!649839))

(assert (= (and b!649839 res!421257) b!649836))

(declare-fun m!623045 () Bool)

(assert (=> b!649819 m!623045))

(declare-fun m!623047 () Bool)

(assert (=> b!649819 m!623047))

(declare-fun m!623049 () Bool)

(assert (=> b!649828 m!623049))

(declare-fun m!623051 () Bool)

(assert (=> b!649838 m!623051))

(assert (=> b!649838 m!623051))

(declare-fun m!623053 () Bool)

(assert (=> b!649838 m!623053))

(declare-fun m!623055 () Bool)

(assert (=> b!649824 m!623055))

(assert (=> b!649836 m!623051))

(assert (=> b!649836 m!623051))

(declare-fun m!623057 () Bool)

(assert (=> b!649836 m!623057))

(assert (=> b!649822 m!623051))

(assert (=> b!649822 m!623051))

(declare-fun m!623059 () Bool)

(assert (=> b!649822 m!623059))

(declare-fun m!623061 () Bool)

(assert (=> b!649822 m!623061))

(declare-fun m!623063 () Bool)

(assert (=> b!649822 m!623063))

(assert (=> b!649822 m!623051))

(declare-fun m!623065 () Bool)

(assert (=> b!649822 m!623065))

(assert (=> b!649822 m!623051))

(declare-fun m!623067 () Bool)

(assert (=> b!649822 m!623067))

(declare-fun m!623069 () Bool)

(assert (=> b!649822 m!623069))

(declare-fun m!623071 () Bool)

(assert (=> b!649822 m!623071))

(assert (=> b!649831 m!623051))

(assert (=> b!649839 m!623051))

(assert (=> b!649839 m!623051))

(declare-fun m!623073 () Bool)

(assert (=> b!649839 m!623073))

(assert (=> b!649839 m!623051))

(declare-fun m!623075 () Bool)

(assert (=> b!649839 m!623075))

(assert (=> b!649839 m!623051))

(declare-fun m!623077 () Bool)

(assert (=> b!649839 m!623077))

(assert (=> b!649839 m!623069))

(assert (=> b!649839 m!623071))

(declare-fun m!623079 () Bool)

(assert (=> b!649837 m!623079))

(assert (=> b!649829 m!623051))

(assert (=> b!649829 m!623051))

(assert (=> b!649829 m!623057))

(declare-fun m!623081 () Bool)

(assert (=> b!649841 m!623081))

(assert (=> b!649832 m!623051))

(assert (=> b!649832 m!623051))

(assert (=> b!649832 m!623077))

(declare-fun m!623083 () Bool)

(assert (=> b!649823 m!623083))

(declare-fun m!623085 () Bool)

(assert (=> b!649823 m!623085))

(assert (=> b!649823 m!623051))

(assert (=> b!649823 m!623045))

(assert (=> b!649823 m!623051))

(declare-fun m!623087 () Bool)

(assert (=> b!649823 m!623087))

(declare-fun m!623089 () Bool)

(assert (=> b!649823 m!623089))

(declare-fun m!623091 () Bool)

(assert (=> b!649823 m!623091))

(declare-fun m!623093 () Bool)

(assert (=> b!649823 m!623093))

(declare-fun m!623095 () Bool)

(assert (=> b!649821 m!623095))

(declare-fun m!623097 () Bool)

(assert (=> start!58886 m!623097))

(declare-fun m!623099 () Bool)

(assert (=> start!58886 m!623099))

(assert (=> b!649830 m!623051))

(assert (=> b!649830 m!623045))

(declare-fun m!623101 () Bool)

(assert (=> b!649830 m!623101))

(declare-fun m!623103 () Bool)

(assert (=> b!649833 m!623103))

(assert (=> b!649833 m!623051))

(assert (=> b!649833 m!623051))

(declare-fun m!623105 () Bool)

(assert (=> b!649833 m!623105))

(declare-fun m!623107 () Bool)

(assert (=> b!649825 m!623107))

(push 1)

(assert (not b!649822))

(assert (not b!649836))

(assert (not b!649841))

(assert (not b!649839))

(assert (not start!58886))

(assert (not b!649837))

(assert (not b!649821))

(assert (not b!649832))

(assert (not b!649833))

(assert (not b!649825))

(assert (not b!649838))

(assert (not b!649823))

(assert (not b!649828))

(assert (not b!649829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!33735 () Bool)

(declare-fun call!33738 () Bool)

(declare-fun c!74673 () Bool)

(assert (=> bm!33735 (= call!33738 (arrayNoDuplicates!0 lt!301851 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74673 (Cons!12517 (select (arr!18480 lt!301851) #b00000000000000000000000000000000) Nil!12518) Nil!12518)))))

(declare-fun d!91907 () Bool)

(declare-fun res!421422 () Bool)

(declare-fun e!372890 () Bool)

(assert (=> d!91907 (=> res!421422 e!372890)))

(assert (=> d!91907 (= res!421422 (bvsge #b00000000000000000000000000000000 (size!18844 lt!301851)))))

(assert (=> d!91907 (= (arrayNoDuplicates!0 lt!301851 #b00000000000000000000000000000000 Nil!12518) e!372890)))

(declare-fun b!650034 () Bool)

(declare-fun e!372892 () Bool)

(declare-fun contains!3174 (List!12521 (_ BitVec 64)) Bool)

(assert (=> b!650034 (= e!372892 (contains!3174 Nil!12518 (select (arr!18480 lt!301851) #b00000000000000000000000000000000)))))

(declare-fun b!650035 () Bool)

(declare-fun e!372889 () Bool)

(assert (=> b!650035 (= e!372889 call!33738)))

(declare-fun b!650036 () Bool)

(assert (=> b!650036 (= e!372889 call!33738)))

(declare-fun b!650037 () Bool)

(declare-fun e!372891 () Bool)

(assert (=> b!650037 (= e!372890 e!372891)))

(declare-fun res!421423 () Bool)

(assert (=> b!650037 (=> (not res!421423) (not e!372891))))

(assert (=> b!650037 (= res!421423 (not e!372892))))

(declare-fun res!421424 () Bool)

(assert (=> b!650037 (=> (not res!421424) (not e!372892))))

(assert (=> b!650037 (= res!421424 (validKeyInArray!0 (select (arr!18480 lt!301851) #b00000000000000000000000000000000)))))

(declare-fun b!650038 () Bool)

(assert (=> b!650038 (= e!372891 e!372889)))

(assert (=> b!650038 (= c!74673 (validKeyInArray!0 (select (arr!18480 lt!301851) #b00000000000000000000000000000000)))))

(assert (= (and d!91907 (not res!421422)) b!650037))

(assert (= (and b!650037 res!421424) b!650034))

(assert (= (and b!650037 res!421423) b!650038))

(assert (= (and b!650038 c!74673) b!650036))

(assert (= (and b!650038 (not c!74673)) b!650035))

(assert (= (or b!650036 b!650035) bm!33735))

(declare-fun m!623273 () Bool)

(assert (=> bm!33735 m!623273))

(declare-fun m!623275 () Bool)

(assert (=> bm!33735 m!623275))

(assert (=> b!650034 m!623273))

(assert (=> b!650034 m!623273))

(declare-fun m!623277 () Bool)

(assert (=> b!650034 m!623277))

(assert (=> b!650037 m!623273))

(assert (=> b!650037 m!623273))

(declare-fun m!623279 () Bool)

(assert (=> b!650037 m!623279))

(assert (=> b!650038 m!623273))

(assert (=> b!650038 m!623273))

(assert (=> b!650038 m!623279))

(assert (=> b!649839 d!91907))

(declare-fun d!91913 () Bool)

(declare-fun res!421430 () Bool)

(declare-fun e!372898 () Bool)

(assert (=> d!91913 (=> res!421430 e!372898)))

(assert (=> d!91913 (= res!421430 (= (select (arr!18480 lt!301851) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18480 a!2986) j!136)))))

(assert (=> d!91913 (= (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!372898)))

(declare-fun b!650044 () Bool)

(declare-fun e!372899 () Bool)

(assert (=> b!650044 (= e!372898 e!372899)))

(declare-fun res!421431 () Bool)

(assert (=> b!650044 (=> (not res!421431) (not e!372899))))

(assert (=> b!650044 (= res!421431 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18844 lt!301851)))))

(declare-fun b!650045 () Bool)

(assert (=> b!650045 (= e!372899 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91913 (not res!421430)) b!650044))

(assert (= (and b!650044 res!421431) b!650045))

(declare-fun m!623285 () Bool)

(assert (=> d!91913 m!623285))

(assert (=> b!650045 m!623051))

(declare-fun m!623287 () Bool)

(assert (=> b!650045 m!623287))

(assert (=> b!649839 d!91913))

(declare-fun d!91917 () Bool)

(declare-fun res!421432 () Bool)

(declare-fun e!372900 () Bool)

(assert (=> d!91917 (=> res!421432 e!372900)))

(assert (=> d!91917 (= res!421432 (= (select (arr!18480 lt!301851) j!136) (select (arr!18480 a!2986) j!136)))))

(assert (=> d!91917 (= (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) j!136) e!372900)))

(declare-fun b!650046 () Bool)

(declare-fun e!372901 () Bool)

(assert (=> b!650046 (= e!372900 e!372901)))

(declare-fun res!421433 () Bool)

(assert (=> b!650046 (=> (not res!421433) (not e!372901))))

(assert (=> b!650046 (= res!421433 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18844 lt!301851)))))

(declare-fun b!650047 () Bool)

(assert (=> b!650047 (= e!372901 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91917 (not res!421432)) b!650046))

(assert (= (and b!650046 res!421433) b!650047))

(declare-fun m!623289 () Bool)

(assert (=> d!91917 m!623289))

(assert (=> b!650047 m!623051))

(declare-fun m!623291 () Bool)

(assert (=> b!650047 m!623291))

(assert (=> b!649839 d!91917))

(declare-fun d!91919 () Bool)

(declare-fun e!372904 () Bool)

(assert (=> d!91919 e!372904))

(declare-fun res!421436 () Bool)

(assert (=> d!91919 (=> (not res!421436) (not e!372904))))

(assert (=> d!91919 (= res!421436 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18844 a!2986))))))

(declare-fun lt!301972 () Unit!22146)

(declare-fun choose!41 (array!38548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12521) Unit!22146)

(assert (=> d!91919 (= lt!301972 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12518))))

(assert (=> d!91919 (bvslt (size!18844 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91919 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12518) lt!301972)))

(declare-fun b!650050 () Bool)

(assert (=> b!650050 (= e!372904 (arrayNoDuplicates!0 (array!38549 (store (arr!18480 a!2986) i!1108 k!1786) (size!18844 a!2986)) #b00000000000000000000000000000000 Nil!12518))))

(assert (= (and d!91919 res!421436) b!650050))

(declare-fun m!623293 () Bool)

(assert (=> d!91919 m!623293))

(assert (=> b!650050 m!623045))

(declare-fun m!623295 () Bool)

(assert (=> b!650050 m!623295))

(assert (=> b!649839 d!91919))

(declare-fun d!91921 () Bool)

(assert (=> d!91921 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301975 () Unit!22146)

(declare-fun choose!114 (array!38548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22146)

(assert (=> d!91921 (= lt!301975 (choose!114 lt!301851 (select (arr!18480 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91921 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91921 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301851 (select (arr!18480 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!301975)))

(declare-fun bs!19391 () Bool)

(assert (= bs!19391 d!91921))

(assert (=> bs!19391 m!623051))

(assert (=> bs!19391 m!623075))

(assert (=> bs!19391 m!623051))

(declare-fun m!623297 () Bool)

(assert (=> bs!19391 m!623297))

(assert (=> b!649839 d!91921))

(declare-fun b!650112 () Bool)

(declare-fun e!372946 () SeekEntryResult!6920)

(declare-fun e!372945 () SeekEntryResult!6920)

(assert (=> b!650112 (= e!372946 e!372945)))

(declare-fun lt!302000 () (_ BitVec 64))

(declare-fun lt!301998 () SeekEntryResult!6920)

(assert (=> b!650112 (= lt!302000 (select (arr!18480 a!2986) (index!30029 lt!301998)))))

(declare-fun c!74697 () Bool)

(assert (=> b!650112 (= c!74697 (= lt!302000 k!1786))))

(declare-fun b!650113 () Bool)

(assert (=> b!650113 (= e!372945 (Found!6920 (index!30029 lt!301998)))))

(declare-fun b!650114 () Bool)

(declare-fun e!372947 () SeekEntryResult!6920)

(assert (=> b!650114 (= e!372947 (MissingZero!6920 (index!30029 lt!301998)))))

(declare-fun b!650115 () Bool)

(declare-fun c!74695 () Bool)

(assert (=> b!650115 (= c!74695 (= lt!302000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650115 (= e!372945 e!372947)))

(declare-fun b!650116 () Bool)

(assert (=> b!650116 (= e!372946 Undefined!6920)))

(declare-fun b!650117 () Bool)

(assert (=> b!650117 (= e!372947 (seekKeyOrZeroReturnVacant!0 (x!58813 lt!301998) (index!30029 lt!301998) (index!30029 lt!301998) k!1786 a!2986 mask!3053))))

(declare-fun d!91923 () Bool)

(declare-fun lt!301999 () SeekEntryResult!6920)

(assert (=> d!91923 (and (or (is-Undefined!6920 lt!301999) (not (is-Found!6920 lt!301999)) (and (bvsge (index!30028 lt!301999) #b00000000000000000000000000000000) (bvslt (index!30028 lt!301999) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!301999) (is-Found!6920 lt!301999) (not (is-MissingZero!6920 lt!301999)) (and (bvsge (index!30027 lt!301999) #b00000000000000000000000000000000) (bvslt (index!30027 lt!301999) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!301999) (is-Found!6920 lt!301999) (is-MissingZero!6920 lt!301999) (not (is-MissingVacant!6920 lt!301999)) (and (bvsge (index!30030 lt!301999) #b00000000000000000000000000000000) (bvslt (index!30030 lt!301999) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!301999) (ite (is-Found!6920 lt!301999) (= (select (arr!18480 a!2986) (index!30028 lt!301999)) k!1786) (ite (is-MissingZero!6920 lt!301999) (= (select (arr!18480 a!2986) (index!30027 lt!301999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6920 lt!301999) (= (select (arr!18480 a!2986) (index!30030 lt!301999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91923 (= lt!301999 e!372946)))

(declare-fun c!74696 () Bool)

(assert (=> d!91923 (= c!74696 (and (is-Intermediate!6920 lt!301998) (undefined!7732 lt!301998)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38548 (_ BitVec 32)) SeekEntryResult!6920)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91923 (= lt!301998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!91923 (validMask!0 mask!3053)))

(assert (=> d!91923 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!301999)))

(assert (= (and d!91923 c!74696) b!650116))

(assert (= (and d!91923 (not c!74696)) b!650112))

(assert (= (and b!650112 c!74697) b!650113))

(assert (= (and b!650112 (not c!74697)) b!650115))

(assert (= (and b!650115 c!74695) b!650114))

(assert (= (and b!650115 (not c!74695)) b!650117))

(declare-fun m!623337 () Bool)

(assert (=> b!650112 m!623337))

(declare-fun m!623339 () Bool)

(assert (=> b!650117 m!623339))

(declare-fun m!623341 () Bool)

(assert (=> d!91923 m!623341))

(declare-fun m!623343 () Bool)

(assert (=> d!91923 m!623343))

(declare-fun m!623345 () Bool)

(assert (=> d!91923 m!623345))

(assert (=> d!91923 m!623097))

(declare-fun m!623347 () Bool)

(assert (=> d!91923 m!623347))

(assert (=> d!91923 m!623345))

(declare-fun m!623351 () Bool)

(assert (=> d!91923 m!623351))

(assert (=> b!649828 d!91923))

(declare-fun d!91943 () Bool)

(declare-fun res!421457 () Bool)

(declare-fun e!372949 () Bool)

(assert (=> d!91943 (=> res!421457 e!372949)))

(assert (=> d!91943 (= res!421457 (= (select (arr!18480 lt!301851) index!984) (select (arr!18480 a!2986) j!136)))))

(assert (=> d!91943 (= (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) index!984) e!372949)))

(declare-fun b!650119 () Bool)

(declare-fun e!372950 () Bool)

(assert (=> b!650119 (= e!372949 e!372950)))

(declare-fun res!421458 () Bool)

(assert (=> b!650119 (=> (not res!421458) (not e!372950))))

(assert (=> b!650119 (= res!421458 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18844 lt!301851)))))

(declare-fun b!650120 () Bool)

(assert (=> b!650120 (= e!372950 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91943 (not res!421457)) b!650119))

(assert (= (and b!650119 res!421458) b!650120))

(declare-fun m!623355 () Bool)

(assert (=> d!91943 m!623355))

(assert (=> b!650120 m!623051))

(declare-fun m!623357 () Bool)

(assert (=> b!650120 m!623357))

(assert (=> b!649829 d!91943))

(assert (=> b!649836 d!91943))

(declare-fun b!650140 () Bool)

(declare-fun e!372967 () Bool)

(declare-fun e!372965 () Bool)

(assert (=> b!650140 (= e!372967 e!372965)))

(declare-fun lt!302014 () (_ BitVec 64))

(assert (=> b!650140 (= lt!302014 (select (arr!18480 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!302015 () Unit!22146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38548 (_ BitVec 64) (_ BitVec 32)) Unit!22146)

(assert (=> b!650140 (= lt!302015 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!302014 #b00000000000000000000000000000000))))

(assert (=> b!650140 (arrayContainsKey!0 a!2986 lt!302014 #b00000000000000000000000000000000)))

(declare-fun lt!302016 () Unit!22146)

(assert (=> b!650140 (= lt!302016 lt!302015)))

(declare-fun res!421468 () Bool)

(assert (=> b!650140 (= res!421468 (= (seekEntryOrOpen!0 (select (arr!18480 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6920 #b00000000000000000000000000000000)))))

(assert (=> b!650140 (=> (not res!421468) (not e!372965))))

(declare-fun b!650141 () Bool)

(declare-fun e!372966 () Bool)

(assert (=> b!650141 (= e!372966 e!372967)))

(declare-fun c!74703 () Bool)

(assert (=> b!650141 (= c!74703 (validKeyInArray!0 (select (arr!18480 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91947 () Bool)

(declare-fun res!421469 () Bool)

(assert (=> d!91947 (=> res!421469 e!372966)))

(assert (=> d!91947 (= res!421469 (bvsge #b00000000000000000000000000000000 (size!18844 a!2986)))))

(assert (=> d!91947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!372966)))

(declare-fun bm!33741 () Bool)

(declare-fun call!33744 () Bool)

(assert (=> bm!33741 (= call!33744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!650142 () Bool)

(assert (=> b!650142 (= e!372965 call!33744)))

(declare-fun b!650143 () Bool)

(assert (=> b!650143 (= e!372967 call!33744)))

(assert (= (and d!91947 (not res!421469)) b!650141))

(assert (= (and b!650141 c!74703) b!650140))

(assert (= (and b!650141 (not c!74703)) b!650143))

(assert (= (and b!650140 res!421468) b!650142))

(assert (= (or b!650142 b!650143) bm!33741))

(declare-fun m!623377 () Bool)

(assert (=> b!650140 m!623377))

(declare-fun m!623379 () Bool)

(assert (=> b!650140 m!623379))

(declare-fun m!623381 () Bool)

(assert (=> b!650140 m!623381))

(assert (=> b!650140 m!623377))

(declare-fun m!623383 () Bool)

(assert (=> b!650140 m!623383))

(assert (=> b!650141 m!623377))

(assert (=> b!650141 m!623377))

(declare-fun m!623385 () Bool)

(assert (=> b!650141 m!623385))

(declare-fun m!623387 () Bool)

(assert (=> bm!33741 m!623387))

(assert (=> b!649825 d!91947))

(declare-fun d!91957 () Bool)

(assert (=> d!91957 (= (validKeyInArray!0 (select (arr!18480 a!2986) j!136)) (and (not (= (select (arr!18480 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18480 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!649838 d!91957))

(declare-fun d!91961 () Bool)

(declare-fun res!421473 () Bool)

(declare-fun e!372972 () Bool)

(assert (=> d!91961 (=> res!421473 e!372972)))

(assert (=> d!91961 (= res!421473 (= (select (arr!18480 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91961 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!372972)))

(declare-fun b!650149 () Bool)

(declare-fun e!372973 () Bool)

(assert (=> b!650149 (= e!372972 e!372973)))

(declare-fun res!421474 () Bool)

(assert (=> b!650149 (=> (not res!421474) (not e!372973))))

(assert (=> b!650149 (= res!421474 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18844 a!2986)))))

(declare-fun b!650150 () Bool)

(assert (=> b!650150 (= e!372973 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91961 (not res!421473)) b!650149))

(assert (= (and b!650149 res!421474) b!650150))

(assert (=> d!91961 m!623377))

(declare-fun m!623391 () Bool)

(assert (=> b!650150 m!623391))

(assert (=> b!649837 d!91961))

(declare-fun d!91963 () Bool)

(assert (=> d!91963 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58886 d!91963))

(declare-fun d!91983 () Bool)

(assert (=> d!91983 (= (array_inv!14276 a!2986) (bvsge (size!18844 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58886 d!91983))

(declare-fun e!373015 () SeekEntryResult!6920)

(declare-fun b!650224 () Bool)

(assert (=> b!650224 (= e!373015 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!301852 lt!301851 mask!3053))))

(declare-fun d!91985 () Bool)

(declare-fun lt!302053 () SeekEntryResult!6920)

(assert (=> d!91985 (and (or (is-Undefined!6920 lt!302053) (not (is-Found!6920 lt!302053)) (and (bvsge (index!30028 lt!302053) #b00000000000000000000000000000000) (bvslt (index!30028 lt!302053) (size!18844 lt!301851)))) (or (is-Undefined!6920 lt!302053) (is-Found!6920 lt!302053) (not (is-MissingVacant!6920 lt!302053)) (not (= (index!30030 lt!302053) vacantSpotIndex!68)) (and (bvsge (index!30030 lt!302053) #b00000000000000000000000000000000) (bvslt (index!30030 lt!302053) (size!18844 lt!301851)))) (or (is-Undefined!6920 lt!302053) (ite (is-Found!6920 lt!302053) (= (select (arr!18480 lt!301851) (index!30028 lt!302053)) lt!301852) (and (is-MissingVacant!6920 lt!302053) (= (index!30030 lt!302053) vacantSpotIndex!68) (= (select (arr!18480 lt!301851) (index!30030 lt!302053)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373014 () SeekEntryResult!6920)

(assert (=> d!91985 (= lt!302053 e!373014)))

(declare-fun c!74740 () Bool)

(assert (=> d!91985 (= c!74740 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302054 () (_ BitVec 64))

(assert (=> d!91985 (= lt!302054 (select (arr!18480 lt!301851) index!984))))

(assert (=> d!91985 (validMask!0 mask!3053)))

(assert (=> d!91985 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301852 lt!301851 mask!3053) lt!302053)))

(declare-fun b!650225 () Bool)

(declare-fun c!74738 () Bool)

(assert (=> b!650225 (= c!74738 (= lt!302054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373016 () SeekEntryResult!6920)

(assert (=> b!650225 (= e!373016 e!373015)))

(declare-fun b!650226 () Bool)

(assert (=> b!650226 (= e!373014 Undefined!6920)))

(declare-fun b!650227 () Bool)

(assert (=> b!650227 (= e!373015 (MissingVacant!6920 vacantSpotIndex!68))))

(declare-fun b!650228 () Bool)

(assert (=> b!650228 (= e!373016 (Found!6920 index!984))))

(declare-fun b!650229 () Bool)

(assert (=> b!650229 (= e!373014 e!373016)))

(declare-fun c!74739 () Bool)

(assert (=> b!650229 (= c!74739 (= lt!302054 lt!301852))))

(assert (= (and d!91985 c!74740) b!650226))

(assert (= (and d!91985 (not c!74740)) b!650229))

(assert (= (and b!650229 c!74739) b!650228))

(assert (= (and b!650229 (not c!74739)) b!650225))

(assert (= (and b!650225 c!74738) b!650227))

(assert (= (and b!650225 (not c!74738)) b!650224))

(assert (=> b!650224 m!623083))

(assert (=> b!650224 m!623083))

(declare-fun m!623449 () Bool)

(assert (=> b!650224 m!623449))

(declare-fun m!623451 () Bool)

(assert (=> d!91985 m!623451))

(declare-fun m!623453 () Bool)

(assert (=> d!91985 m!623453))

(assert (=> d!91985 m!623355))

(assert (=> d!91985 m!623097))

(assert (=> b!649823 d!91985))

(declare-fun d!91993 () Bool)

(declare-fun lt!302060 () (_ BitVec 32))

(assert (=> d!91993 (and (bvsge lt!302060 #b00000000000000000000000000000000) (bvslt lt!302060 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91993 (= lt!302060 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91993 (validMask!0 mask!3053)))

(assert (=> d!91993 (= (nextIndex!0 index!984 x!910 mask!3053) lt!302060)))

(declare-fun bs!19398 () Bool)

(assert (= bs!19398 d!91993))

(declare-fun m!623469 () Bool)

(assert (=> bs!19398 m!623469))

(assert (=> bs!19398 m!623097))

(assert (=> b!649823 d!91993))

(declare-fun d!91995 () Bool)

(declare-fun e!373028 () Bool)

(assert (=> d!91995 e!373028))

(declare-fun res!421484 () Bool)

(assert (=> d!91995 (=> (not res!421484) (not e!373028))))

(assert (=> d!91995 (= res!421484 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18844 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18844 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18844 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18844 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18844 a!2986))))))

(declare-fun lt!302069 () Unit!22146)

(declare-fun choose!9 (array!38548 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22146)

(assert (=> d!91995 (= lt!302069 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91995 (validMask!0 mask!3053)))

(assert (=> d!91995 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 mask!3053) lt!302069)))

(declare-fun b!650250 () Bool)

(assert (=> b!650250 (= e!373028 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 (select (store (arr!18480 a!2986) i!1108 k!1786) j!136) (array!38549 (store (arr!18480 a!2986) i!1108 k!1786) (size!18844 a!2986)) mask!3053)))))

(assert (= (and d!91995 res!421484) b!650250))

(declare-fun m!623471 () Bool)

(assert (=> d!91995 m!623471))

(assert (=> d!91995 m!623097))

(assert (=> b!650250 m!623051))

(assert (=> b!650250 m!623051))

(assert (=> b!650250 m!623087))

(assert (=> b!650250 m!623085))

(declare-fun m!623473 () Bool)

(assert (=> b!650250 m!623473))

(assert (=> b!650250 m!623045))

(assert (=> b!650250 m!623085))

(assert (=> b!649823 d!91995))

(declare-fun e!373030 () SeekEntryResult!6920)

(declare-fun b!650251 () Bool)

(assert (=> b!650251 (= e!373030 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301841 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!301852 lt!301851 mask!3053))))

(declare-fun d!91997 () Bool)

(declare-fun lt!302070 () SeekEntryResult!6920)

(assert (=> d!91997 (and (or (is-Undefined!6920 lt!302070) (not (is-Found!6920 lt!302070)) (and (bvsge (index!30028 lt!302070) #b00000000000000000000000000000000) (bvslt (index!30028 lt!302070) (size!18844 lt!301851)))) (or (is-Undefined!6920 lt!302070) (is-Found!6920 lt!302070) (not (is-MissingVacant!6920 lt!302070)) (not (= (index!30030 lt!302070) vacantSpotIndex!68)) (and (bvsge (index!30030 lt!302070) #b00000000000000000000000000000000) (bvslt (index!30030 lt!302070) (size!18844 lt!301851)))) (or (is-Undefined!6920 lt!302070) (ite (is-Found!6920 lt!302070) (= (select (arr!18480 lt!301851) (index!30028 lt!302070)) lt!301852) (and (is-MissingVacant!6920 lt!302070) (= (index!30030 lt!302070) vacantSpotIndex!68) (= (select (arr!18480 lt!301851) (index!30030 lt!302070)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373029 () SeekEntryResult!6920)

(assert (=> d!91997 (= lt!302070 e!373029)))

(declare-fun c!74752 () Bool)

(assert (=> d!91997 (= c!74752 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302071 () (_ BitVec 64))

(assert (=> d!91997 (= lt!302071 (select (arr!18480 lt!301851) lt!301841))))

(assert (=> d!91997 (validMask!0 mask!3053)))

(assert (=> d!91997 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 lt!301852 lt!301851 mask!3053) lt!302070)))

(declare-fun b!650252 () Bool)

(declare-fun c!74750 () Bool)

(assert (=> b!650252 (= c!74750 (= lt!302071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373031 () SeekEntryResult!6920)

(assert (=> b!650252 (= e!373031 e!373030)))

(declare-fun b!650253 () Bool)

(assert (=> b!650253 (= e!373029 Undefined!6920)))

(declare-fun b!650254 () Bool)

(assert (=> b!650254 (= e!373030 (MissingVacant!6920 vacantSpotIndex!68))))

(declare-fun b!650255 () Bool)

(assert (=> b!650255 (= e!373031 (Found!6920 lt!301841))))

(declare-fun b!650256 () Bool)

(assert (=> b!650256 (= e!373029 e!373031)))

(declare-fun c!74751 () Bool)

(assert (=> b!650256 (= c!74751 (= lt!302071 lt!301852))))

(assert (= (and d!91997 c!74752) b!650253))

(assert (= (and d!91997 (not c!74752)) b!650256))

(assert (= (and b!650256 c!74751) b!650255))

(assert (= (and b!650256 (not c!74751)) b!650252))

(assert (= (and b!650252 c!74750) b!650254))

(assert (= (and b!650252 (not c!74750)) b!650251))

(declare-fun m!623475 () Bool)

(assert (=> b!650251 m!623475))

(assert (=> b!650251 m!623475))

(declare-fun m!623477 () Bool)

(assert (=> b!650251 m!623477))

(declare-fun m!623479 () Bool)

(assert (=> d!91997 m!623479))

(declare-fun m!623481 () Bool)

(assert (=> d!91997 m!623481))

(declare-fun m!623483 () Bool)

(assert (=> d!91997 m!623483))

(assert (=> d!91997 m!623097))

(assert (=> b!649823 d!91997))

(declare-fun e!373036 () SeekEntryResult!6920)

(declare-fun b!650263 () Bool)

(assert (=> b!650263 (= e!373036 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301841 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!91999 () Bool)

(declare-fun lt!302075 () SeekEntryResult!6920)

(assert (=> d!91999 (and (or (is-Undefined!6920 lt!302075) (not (is-Found!6920 lt!302075)) (and (bvsge (index!30028 lt!302075) #b00000000000000000000000000000000) (bvslt (index!30028 lt!302075) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!302075) (is-Found!6920 lt!302075) (not (is-MissingVacant!6920 lt!302075)) (not (= (index!30030 lt!302075) vacantSpotIndex!68)) (and (bvsge (index!30030 lt!302075) #b00000000000000000000000000000000) (bvslt (index!30030 lt!302075) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!302075) (ite (is-Found!6920 lt!302075) (= (select (arr!18480 a!2986) (index!30028 lt!302075)) (select (arr!18480 a!2986) j!136)) (and (is-MissingVacant!6920 lt!302075) (= (index!30030 lt!302075) vacantSpotIndex!68) (= (select (arr!18480 a!2986) (index!30030 lt!302075)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373035 () SeekEntryResult!6920)

(assert (=> d!91999 (= lt!302075 e!373035)))

(declare-fun c!74758 () Bool)

(assert (=> d!91999 (= c!74758 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302076 () (_ BitVec 64))

(assert (=> d!91999 (= lt!302076 (select (arr!18480 a!2986) lt!301841))))

(assert (=> d!91999 (validMask!0 mask!3053)))

(assert (=> d!91999 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301841 vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053) lt!302075)))

(declare-fun b!650264 () Bool)

(declare-fun c!74756 () Bool)

(assert (=> b!650264 (= c!74756 (= lt!302076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373037 () SeekEntryResult!6920)

(assert (=> b!650264 (= e!373037 e!373036)))

(declare-fun b!650265 () Bool)

(assert (=> b!650265 (= e!373035 Undefined!6920)))

(declare-fun b!650266 () Bool)

(assert (=> b!650266 (= e!373036 (MissingVacant!6920 vacantSpotIndex!68))))

(declare-fun b!650267 () Bool)

(assert (=> b!650267 (= e!373037 (Found!6920 lt!301841))))

(declare-fun b!650268 () Bool)

(assert (=> b!650268 (= e!373035 e!373037)))

(declare-fun c!74757 () Bool)

(assert (=> b!650268 (= c!74757 (= lt!302076 (select (arr!18480 a!2986) j!136)))))

(assert (= (and d!91999 c!74758) b!650265))

(assert (= (and d!91999 (not c!74758)) b!650268))

(assert (= (and b!650268 c!74757) b!650267))

(assert (= (and b!650268 (not c!74757)) b!650264))

(assert (= (and b!650264 c!74756) b!650266))

(assert (= (and b!650264 (not c!74756)) b!650263))

(assert (=> b!650263 m!623475))

(assert (=> b!650263 m!623475))

(assert (=> b!650263 m!623051))

(declare-fun m!623488 () Bool)

(assert (=> b!650263 m!623488))

(declare-fun m!623493 () Bool)

(assert (=> d!91999 m!623493))

(declare-fun m!623497 () Bool)

(assert (=> d!91999 m!623497))

(declare-fun m!623501 () Bool)

(assert (=> d!91999 m!623501))

(assert (=> d!91999 m!623097))

(assert (=> b!649823 d!91999))

(declare-fun b!650269 () Bool)

(declare-fun e!373039 () SeekEntryResult!6920)

(assert (=> b!650269 (= e!373039 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!92001 () Bool)

(declare-fun lt!302077 () SeekEntryResult!6920)

(assert (=> d!92001 (and (or (is-Undefined!6920 lt!302077) (not (is-Found!6920 lt!302077)) (and (bvsge (index!30028 lt!302077) #b00000000000000000000000000000000) (bvslt (index!30028 lt!302077) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!302077) (is-Found!6920 lt!302077) (not (is-MissingVacant!6920 lt!302077)) (not (= (index!30030 lt!302077) vacantSpotIndex!68)) (and (bvsge (index!30030 lt!302077) #b00000000000000000000000000000000) (bvslt (index!30030 lt!302077) (size!18844 a!2986)))) (or (is-Undefined!6920 lt!302077) (ite (is-Found!6920 lt!302077) (= (select (arr!18480 a!2986) (index!30028 lt!302077)) (select (arr!18480 a!2986) j!136)) (and (is-MissingVacant!6920 lt!302077) (= (index!30030 lt!302077) vacantSpotIndex!68) (= (select (arr!18480 a!2986) (index!30030 lt!302077)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373038 () SeekEntryResult!6920)

(assert (=> d!92001 (= lt!302077 e!373038)))

(declare-fun c!74761 () Bool)

(assert (=> d!92001 (= c!74761 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302078 () (_ BitVec 64))

(assert (=> d!92001 (= lt!302078 (select (arr!18480 a!2986) index!984))))

(assert (=> d!92001 (validMask!0 mask!3053)))

(assert (=> d!92001 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18480 a!2986) j!136) a!2986 mask!3053) lt!302077)))

(declare-fun b!650270 () Bool)

(declare-fun c!74759 () Bool)

(assert (=> b!650270 (= c!74759 (= lt!302078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373040 () SeekEntryResult!6920)

(assert (=> b!650270 (= e!373040 e!373039)))

(declare-fun b!650271 () Bool)

(assert (=> b!650271 (= e!373038 Undefined!6920)))

(declare-fun b!650272 () Bool)

(assert (=> b!650272 (= e!373039 (MissingVacant!6920 vacantSpotIndex!68))))

(declare-fun b!650273 () Bool)

(assert (=> b!650273 (= e!373040 (Found!6920 index!984))))

(declare-fun b!650274 () Bool)

(assert (=> b!650274 (= e!373038 e!373040)))

(declare-fun c!74760 () Bool)

(assert (=> b!650274 (= c!74760 (= lt!302078 (select (arr!18480 a!2986) j!136)))))

(assert (= (and d!92001 c!74761) b!650271))

(assert (= (and d!92001 (not c!74761)) b!650274))

(assert (= (and b!650274 c!74760) b!650273))

(assert (= (and b!650274 (not c!74760)) b!650270))

(assert (= (and b!650270 c!74759) b!650272))

(assert (= (and b!650270 (not c!74759)) b!650269))

(assert (=> b!650269 m!623083))

(assert (=> b!650269 m!623083))

(assert (=> b!650269 m!623051))

(declare-fun m!623511 () Bool)

(assert (=> b!650269 m!623511))

(declare-fun m!623513 () Bool)

(assert (=> d!92001 m!623513))

(declare-fun m!623515 () Bool)

(assert (=> d!92001 m!623515))

(assert (=> d!92001 m!623103))

(assert (=> d!92001 m!623097))

(assert (=> b!649833 d!92001))

(declare-fun bm!33743 () Bool)

(declare-fun call!33746 () Bool)

(declare-fun c!74762 () Bool)

(assert (=> bm!33743 (= call!33746 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74762 (Cons!12517 (select (arr!18480 a!2986) #b00000000000000000000000000000000) Nil!12518) Nil!12518)))))

(declare-fun d!92007 () Bool)

(declare-fun res!421487 () Bool)

(declare-fun e!373044 () Bool)

(assert (=> d!92007 (=> res!421487 e!373044)))

(assert (=> d!92007 (= res!421487 (bvsge #b00000000000000000000000000000000 (size!18844 a!2986)))))

(assert (=> d!92007 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12518) e!373044)))

(declare-fun b!650277 () Bool)

(declare-fun e!373046 () Bool)

(assert (=> b!650277 (= e!373046 (contains!3174 Nil!12518 (select (arr!18480 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!650278 () Bool)

(declare-fun e!373043 () Bool)

(assert (=> b!650278 (= e!373043 call!33746)))

(declare-fun b!650279 () Bool)

(assert (=> b!650279 (= e!373043 call!33746)))

(declare-fun b!650280 () Bool)

(declare-fun e!373045 () Bool)

(assert (=> b!650280 (= e!373044 e!373045)))

(declare-fun res!421488 () Bool)

(assert (=> b!650280 (=> (not res!421488) (not e!373045))))

(assert (=> b!650280 (= res!421488 (not e!373046))))

(declare-fun res!421489 () Bool)

(assert (=> b!650280 (=> (not res!421489) (not e!373046))))

(assert (=> b!650280 (= res!421489 (validKeyInArray!0 (select (arr!18480 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!650281 () Bool)

(assert (=> b!650281 (= e!373045 e!373043)))

(assert (=> b!650281 (= c!74762 (validKeyInArray!0 (select (arr!18480 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92007 (not res!421487)) b!650280))

(assert (= (and b!650280 res!421489) b!650277))

(assert (= (and b!650280 res!421488) b!650281))

(assert (= (and b!650281 c!74762) b!650279))

(assert (= (and b!650281 (not c!74762)) b!650278))

(assert (= (or b!650279 b!650278) bm!33743))

(assert (=> bm!33743 m!623377))

(declare-fun m!623517 () Bool)

(assert (=> bm!33743 m!623517))

(assert (=> b!650277 m!623377))

(assert (=> b!650277 m!623377))

(declare-fun m!623519 () Bool)

(assert (=> b!650277 m!623519))

(assert (=> b!650280 m!623377))

(assert (=> b!650280 m!623377))

(assert (=> b!650280 m!623385))

(assert (=> b!650281 m!623377))

(assert (=> b!650281 m!623377))

(assert (=> b!650281 m!623385))

(assert (=> b!649841 d!92007))

(declare-fun d!92009 () Bool)

(declare-fun res!421490 () Bool)

(declare-fun e!373047 () Bool)

(assert (=> d!92009 (=> res!421490 e!373047)))

(assert (=> d!92009 (= res!421490 (= (select (arr!18480 lt!301851) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18480 a!2986) j!136)))))

(assert (=> d!92009 (= (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!373047)))

(declare-fun b!650282 () Bool)

(declare-fun e!373048 () Bool)

(assert (=> b!650282 (= e!373047 e!373048)))

(declare-fun res!421491 () Bool)

(assert (=> b!650282 (=> (not res!421491) (not e!373048))))

(assert (=> b!650282 (= res!421491 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18844 lt!301851)))))

(declare-fun b!650283 () Bool)

(assert (=> b!650283 (= e!373048 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92009 (not res!421490)) b!650282))

(assert (= (and b!650282 res!421491) b!650283))

(declare-fun m!623521 () Bool)

(assert (=> d!92009 m!623521))

(assert (=> b!650283 m!623051))

(declare-fun m!623523 () Bool)

(assert (=> b!650283 m!623523))

(assert (=> b!649822 d!92009))

(declare-fun d!92011 () Bool)

(assert (=> d!92011 (arrayContainsKey!0 lt!301851 (select (arr!18480 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302079 () Unit!22146)

(assert (=> d!92011 (= lt!302079 (choose!114 lt!301851 (select (arr!18480 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92011 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92011 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301851 (select (arr!18480 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!302079)))

(declare-fun bs!19399 () Bool)

(assert (= bs!19399 d!92011))

(assert (=> bs!19399 m!623051))

(assert (=> bs!19399 m!623067))

(assert (=> bs!19399 m!623051))

