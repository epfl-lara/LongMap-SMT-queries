; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57440 () Bool)

(assert start!57440)

(declare-fun b!635833 () Bool)

(declare-fun e!363696 () Bool)

(declare-fun e!363695 () Bool)

(assert (=> b!635833 (= e!363696 e!363695)))

(declare-fun res!411407 () Bool)

(assert (=> b!635833 (=> (not res!411407) (not e!363695))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38230 0))(
  ( (array!38231 (arr!18342 (Array (_ BitVec 32) (_ BitVec 64))) (size!18706 (_ BitVec 32))) )
))
(declare-fun lt!294033 () array!38230)

(declare-fun a!2986 () array!38230)

(declare-fun arrayContainsKey!0 (array!38230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635833 (= res!411407 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) j!136))))

(declare-fun b!635834 () Bool)

(declare-fun res!411395 () Bool)

(declare-fun e!363690 () Bool)

(assert (=> b!635834 (=> (not res!411395) (not e!363690))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635834 (= res!411395 (and (= (size!18706 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18706 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18706 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635835 () Bool)

(declare-fun res!411408 () Bool)

(declare-fun e!363694 () Bool)

(assert (=> b!635835 (=> (not res!411408) (not e!363694))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635835 (= res!411408 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18342 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635836 () Bool)

(declare-fun e!363699 () Bool)

(assert (=> b!635836 (= e!363699 e!363696)))

(declare-fun res!411405 () Bool)

(assert (=> b!635836 (=> res!411405 e!363696)))

(declare-fun lt!294030 () (_ BitVec 64))

(declare-fun lt!294031 () (_ BitVec 64))

(assert (=> b!635836 (= res!411405 (or (not (= (select (arr!18342 a!2986) j!136) lt!294030)) (not (= (select (arr!18342 a!2986) j!136) lt!294031)) (bvsge j!136 index!984)))))

(declare-fun b!635837 () Bool)

(declare-fun e!363688 () Bool)

(declare-datatypes ((SeekEntryResult!6782 0))(
  ( (MissingZero!6782 (index!29433 (_ BitVec 32))) (Found!6782 (index!29434 (_ BitVec 32))) (Intermediate!6782 (undefined!7594 Bool) (index!29435 (_ BitVec 32)) (x!58181 (_ BitVec 32))) (Undefined!6782) (MissingVacant!6782 (index!29436 (_ BitVec 32))) )
))
(declare-fun lt!294028 () SeekEntryResult!6782)

(declare-fun lt!294034 () SeekEntryResult!6782)

(assert (=> b!635837 (= e!363688 (= lt!294028 lt!294034))))

(declare-fun b!635838 () Bool)

(declare-fun e!363687 () Bool)

(declare-fun e!363692 () Bool)

(assert (=> b!635838 (= e!363687 e!363692)))

(declare-fun res!411406 () Bool)

(assert (=> b!635838 (=> res!411406 e!363692)))

(assert (=> b!635838 (= res!411406 (or (not (= (select (arr!18342 a!2986) j!136) lt!294030)) (not (= (select (arr!18342 a!2986) j!136) lt!294031)) (bvsge j!136 index!984)))))

(assert (=> b!635838 e!363699))

(declare-fun res!411409 () Bool)

(assert (=> b!635838 (=> (not res!411409) (not e!363699))))

(assert (=> b!635838 (= res!411409 (= lt!294031 (select (arr!18342 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!635838 (= lt!294031 (select (store (arr!18342 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635839 () Bool)

(declare-fun e!363698 () Bool)

(declare-datatypes ((List!12383 0))(
  ( (Nil!12380) (Cons!12379 (h!13424 (_ BitVec 64)) (t!18611 List!12383)) )
))
(declare-fun noDuplicate!375 (List!12383) Bool)

(assert (=> b!635839 (= e!363698 (noDuplicate!375 Nil!12380))))

(declare-fun b!635840 () Bool)

(declare-fun res!411396 () Bool)

(assert (=> b!635840 (=> (not res!411396) (not e!363694))))

(declare-fun arrayNoDuplicates!0 (array!38230 (_ BitVec 32) List!12383) Bool)

(assert (=> b!635840 (= res!411396 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12380))))

(declare-fun b!635841 () Bool)

(declare-fun e!363697 () Bool)

(declare-fun e!363691 () Bool)

(assert (=> b!635841 (= e!363697 e!363691)))

(declare-fun res!411398 () Bool)

(assert (=> b!635841 (=> (not res!411398) (not e!363691))))

(assert (=> b!635841 (= res!411398 (and (= lt!294028 (Found!6782 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18342 a!2986) index!984) (select (arr!18342 a!2986) j!136))) (not (= (select (arr!18342 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38230 (_ BitVec 32)) SeekEntryResult!6782)

(assert (=> b!635841 (= lt!294028 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18342 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635843 () Bool)

(declare-fun res!411401 () Bool)

(assert (=> b!635843 (=> (not res!411401) (not e!363690))))

(assert (=> b!635843 (= res!411401 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635844 () Bool)

(declare-fun res!411402 () Bool)

(assert (=> b!635844 (=> (not res!411402) (not e!363690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635844 (= res!411402 (validKeyInArray!0 k!1786))))

(declare-fun b!635845 () Bool)

(assert (=> b!635845 (= e!363692 e!363698)))

(declare-fun res!411403 () Bool)

(assert (=> b!635845 (=> res!411403 e!363698)))

(assert (=> b!635845 (= res!411403 (or (bvsge (size!18706 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18706 a!2986))))))

(assert (=> b!635845 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21462 0))(
  ( (Unit!21463) )
))
(declare-fun lt!294032 () Unit!21462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38230 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21462)

(assert (=> b!635845 (= lt!294032 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294033 (select (arr!18342 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635846 () Bool)

(declare-fun res!411404 () Bool)

(assert (=> b!635846 (=> (not res!411404) (not e!363694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38230 (_ BitVec 32)) Bool)

(assert (=> b!635846 (= res!411404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635847 () Bool)

(declare-fun res!411397 () Bool)

(assert (=> b!635847 (=> (not res!411397) (not e!363690))))

(assert (=> b!635847 (= res!411397 (validKeyInArray!0 (select (arr!18342 a!2986) j!136)))))

(declare-fun b!635848 () Bool)

(declare-fun e!363693 () Unit!21462)

(declare-fun Unit!21464 () Unit!21462)

(assert (=> b!635848 (= e!363693 Unit!21464)))

(declare-fun b!635842 () Bool)

(assert (=> b!635842 (= e!363690 e!363694)))

(declare-fun res!411394 () Bool)

(assert (=> b!635842 (=> (not res!411394) (not e!363694))))

(declare-fun lt!294029 () SeekEntryResult!6782)

(assert (=> b!635842 (= res!411394 (or (= lt!294029 (MissingZero!6782 i!1108)) (= lt!294029 (MissingVacant!6782 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38230 (_ BitVec 32)) SeekEntryResult!6782)

(assert (=> b!635842 (= lt!294029 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!411393 () Bool)

(assert (=> start!57440 (=> (not res!411393) (not e!363690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57440 (= res!411393 (validMask!0 mask!3053))))

(assert (=> start!57440 e!363690))

(assert (=> start!57440 true))

(declare-fun array_inv!14138 (array!38230) Bool)

(assert (=> start!57440 (array_inv!14138 a!2986)))

(declare-fun b!635849 () Bool)

(declare-fun Unit!21465 () Unit!21462)

(assert (=> b!635849 (= e!363693 Unit!21465)))

(assert (=> b!635849 false))

(declare-fun b!635850 () Bool)

(assert (=> b!635850 (= e!363691 (not e!363687))))

(declare-fun res!411410 () Bool)

(assert (=> b!635850 (=> res!411410 e!363687)))

(declare-fun lt!294024 () SeekEntryResult!6782)

(assert (=> b!635850 (= res!411410 (not (= lt!294024 (Found!6782 index!984))))))

(declare-fun lt!294025 () Unit!21462)

(assert (=> b!635850 (= lt!294025 e!363693)))

(declare-fun c!72587 () Bool)

(assert (=> b!635850 (= c!72587 (= lt!294024 Undefined!6782))))

(assert (=> b!635850 (= lt!294024 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294030 lt!294033 mask!3053))))

(assert (=> b!635850 e!363688))

(declare-fun res!411400 () Bool)

(assert (=> b!635850 (=> (not res!411400) (not e!363688))))

(declare-fun lt!294027 () (_ BitVec 32))

(assert (=> b!635850 (= res!411400 (= lt!294034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294027 vacantSpotIndex!68 lt!294030 lt!294033 mask!3053)))))

(assert (=> b!635850 (= lt!294034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294027 vacantSpotIndex!68 (select (arr!18342 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635850 (= lt!294030 (select (store (arr!18342 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294026 () Unit!21462)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21462)

(assert (=> b!635850 (= lt!294026 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294027 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635850 (= lt!294027 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635851 () Bool)

(assert (=> b!635851 (= e!363694 e!363697)))

(declare-fun res!411399 () Bool)

(assert (=> b!635851 (=> (not res!411399) (not e!363697))))

(assert (=> b!635851 (= res!411399 (= (select (store (arr!18342 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635851 (= lt!294033 (array!38231 (store (arr!18342 a!2986) i!1108 k!1786) (size!18706 a!2986)))))

(declare-fun b!635852 () Bool)

(assert (=> b!635852 (= e!363695 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) index!984))))

(assert (= (and start!57440 res!411393) b!635834))

(assert (= (and b!635834 res!411395) b!635847))

(assert (= (and b!635847 res!411397) b!635844))

(assert (= (and b!635844 res!411402) b!635843))

(assert (= (and b!635843 res!411401) b!635842))

(assert (= (and b!635842 res!411394) b!635846))

(assert (= (and b!635846 res!411404) b!635840))

(assert (= (and b!635840 res!411396) b!635835))

(assert (= (and b!635835 res!411408) b!635851))

(assert (= (and b!635851 res!411399) b!635841))

(assert (= (and b!635841 res!411398) b!635850))

(assert (= (and b!635850 res!411400) b!635837))

(assert (= (and b!635850 c!72587) b!635849))

(assert (= (and b!635850 (not c!72587)) b!635848))

(assert (= (and b!635850 (not res!411410)) b!635838))

(assert (= (and b!635838 res!411409) b!635836))

(assert (= (and b!635836 (not res!411405)) b!635833))

(assert (= (and b!635833 res!411407) b!635852))

(assert (= (and b!635838 (not res!411406)) b!635845))

(assert (= (and b!635845 (not res!411403)) b!635839))

(declare-fun m!610139 () Bool)

(assert (=> b!635850 m!610139))

(declare-fun m!610141 () Bool)

(assert (=> b!635850 m!610141))

(declare-fun m!610143 () Bool)

(assert (=> b!635850 m!610143))

(declare-fun m!610145 () Bool)

(assert (=> b!635850 m!610145))

(declare-fun m!610147 () Bool)

(assert (=> b!635850 m!610147))

(declare-fun m!610149 () Bool)

(assert (=> b!635850 m!610149))

(assert (=> b!635850 m!610149))

(declare-fun m!610151 () Bool)

(assert (=> b!635850 m!610151))

(declare-fun m!610153 () Bool)

(assert (=> b!635850 m!610153))

(assert (=> b!635833 m!610149))

(assert (=> b!635833 m!610149))

(declare-fun m!610155 () Bool)

(assert (=> b!635833 m!610155))

(assert (=> b!635852 m!610149))

(assert (=> b!635852 m!610149))

(declare-fun m!610157 () Bool)

(assert (=> b!635852 m!610157))

(declare-fun m!610159 () Bool)

(assert (=> b!635841 m!610159))

(assert (=> b!635841 m!610149))

(assert (=> b!635841 m!610149))

(declare-fun m!610161 () Bool)

(assert (=> b!635841 m!610161))

(assert (=> b!635838 m!610149))

(assert (=> b!635838 m!610145))

(declare-fun m!610163 () Bool)

(assert (=> b!635838 m!610163))

(assert (=> b!635847 m!610149))

(assert (=> b!635847 m!610149))

(declare-fun m!610165 () Bool)

(assert (=> b!635847 m!610165))

(assert (=> b!635851 m!610145))

(declare-fun m!610167 () Bool)

(assert (=> b!635851 m!610167))

(assert (=> b!635845 m!610149))

(assert (=> b!635845 m!610149))

(declare-fun m!610169 () Bool)

(assert (=> b!635845 m!610169))

(assert (=> b!635845 m!610149))

(declare-fun m!610171 () Bool)

(assert (=> b!635845 m!610171))

(declare-fun m!610173 () Bool)

(assert (=> b!635846 m!610173))

(declare-fun m!610175 () Bool)

(assert (=> b!635839 m!610175))

(declare-fun m!610177 () Bool)

(assert (=> start!57440 m!610177))

(declare-fun m!610179 () Bool)

(assert (=> start!57440 m!610179))

(declare-fun m!610181 () Bool)

(assert (=> b!635843 m!610181))

(declare-fun m!610183 () Bool)

(assert (=> b!635840 m!610183))

(declare-fun m!610185 () Bool)

(assert (=> b!635842 m!610185))

(assert (=> b!635836 m!610149))

(declare-fun m!610187 () Bool)

(assert (=> b!635835 m!610187))

(declare-fun m!610189 () Bool)

(assert (=> b!635844 m!610189))

(push 1)

(assert (not b!635850))

(assert (not start!57440))

(assert (not b!635833))

(assert (not b!635842))

(assert (not b!635839))

(assert (not b!635846))

(assert (not b!635847))

(assert (not b!635845))

(assert (not b!635843))

(assert (not b!635840))

(assert (not b!635841))

(assert (not b!635852))

(assert (not b!635844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89843 () Bool)

(assert (=> d!89843 (= (validKeyInArray!0 (select (arr!18342 a!2986) j!136)) (and (not (= (select (arr!18342 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18342 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635847 d!89843))

(declare-fun b!636041 () Bool)

(declare-fun e!363828 () Bool)

(declare-fun call!33419 () Bool)

(assert (=> b!636041 (= e!363828 call!33419)))

(declare-fun b!636042 () Bool)

(declare-fun e!363827 () Bool)

(declare-fun e!363826 () Bool)

(assert (=> b!636042 (= e!363827 e!363826)))

(declare-fun c!72614 () Bool)

(assert (=> b!636042 (= c!72614 (validKeyInArray!0 (select (arr!18342 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33416 () Bool)

(assert (=> bm!33416 (= call!33419 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!636043 () Bool)

(assert (=> b!636043 (= e!363826 call!33419)))

(declare-fun b!636044 () Bool)

(assert (=> b!636044 (= e!363826 e!363828)))

(declare-fun lt!294126 () (_ BitVec 64))

(assert (=> b!636044 (= lt!294126 (select (arr!18342 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294127 () Unit!21462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38230 (_ BitVec 64) (_ BitVec 32)) Unit!21462)

(assert (=> b!636044 (= lt!294127 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294126 #b00000000000000000000000000000000))))

(assert (=> b!636044 (arrayContainsKey!0 a!2986 lt!294126 #b00000000000000000000000000000000)))

(declare-fun lt!294128 () Unit!21462)

(assert (=> b!636044 (= lt!294128 lt!294127)))

(declare-fun res!411547 () Bool)

(assert (=> b!636044 (= res!411547 (= (seekEntryOrOpen!0 (select (arr!18342 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6782 #b00000000000000000000000000000000)))))

(assert (=> b!636044 (=> (not res!411547) (not e!363828))))

(declare-fun d!89851 () Bool)

(declare-fun res!411548 () Bool)

(assert (=> d!89851 (=> res!411548 e!363827)))

(assert (=> d!89851 (= res!411548 (bvsge #b00000000000000000000000000000000 (size!18706 a!2986)))))

(assert (=> d!89851 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363827)))

(assert (= (and d!89851 (not res!411548)) b!636042))

(assert (= (and b!636042 c!72614) b!636044))

(assert (= (and b!636042 (not c!72614)) b!636043))

(assert (= (and b!636044 res!411547) b!636041))

(assert (= (or b!636041 b!636043) bm!33416))

(declare-fun m!610349 () Bool)

(assert (=> b!636042 m!610349))

(assert (=> b!636042 m!610349))

(declare-fun m!610351 () Bool)

(assert (=> b!636042 m!610351))

(declare-fun m!610353 () Bool)

(assert (=> bm!33416 m!610353))

(assert (=> b!636044 m!610349))

(declare-fun m!610355 () Bool)

(assert (=> b!636044 m!610355))

(declare-fun m!610357 () Bool)

(assert (=> b!636044 m!610357))

(assert (=> b!636044 m!610349))

(declare-fun m!610359 () Bool)

(assert (=> b!636044 m!610359))

(assert (=> b!635846 d!89851))

(declare-fun d!89861 () Bool)

(declare-fun res!411553 () Bool)

(declare-fun e!363836 () Bool)

(assert (=> d!89861 (=> res!411553 e!363836)))

(assert (=> d!89861 (= res!411553 (= (select (arr!18342 lt!294033) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18342 a!2986) j!136)))))

(assert (=> d!89861 (= (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363836)))

(declare-fun b!636055 () Bool)

(declare-fun e!363837 () Bool)

(assert (=> b!636055 (= e!363836 e!363837)))

(declare-fun res!411554 () Bool)

(assert (=> b!636055 (=> (not res!411554) (not e!363837))))

(assert (=> b!636055 (= res!411554 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18706 lt!294033)))))

(declare-fun b!636056 () Bool)

(assert (=> b!636056 (= e!363837 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89861 (not res!411553)) b!636055))

(assert (= (and b!636055 res!411554) b!636056))

(declare-fun m!610367 () Bool)

(assert (=> d!89861 m!610367))

(assert (=> b!636056 m!610149))

(declare-fun m!610369 () Bool)

(assert (=> b!636056 m!610369))

(assert (=> b!635845 d!89861))

(declare-fun d!89865 () Bool)

(assert (=> d!89865 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294133 () Unit!21462)

(declare-fun choose!114 (array!38230 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21462)

(assert (=> d!89865 (= lt!294133 (choose!114 lt!294033 (select (arr!18342 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89865 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89865 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294033 (select (arr!18342 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294133)))

(declare-fun bs!19107 () Bool)

(assert (= bs!19107 d!89865))

(assert (=> bs!19107 m!610149))

(assert (=> bs!19107 m!610169))

(assert (=> bs!19107 m!610149))

(declare-fun m!610371 () Bool)

(assert (=> bs!19107 m!610371))

(assert (=> b!635845 d!89865))

(declare-fun d!89867 () Bool)

(assert (=> d!89867 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57440 d!89867))

(declare-fun d!89875 () Bool)

(assert (=> d!89875 (= (array_inv!14138 a!2986) (bvsge (size!18706 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57440 d!89875))

(declare-fun d!89877 () Bool)

(assert (=> d!89877 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635844 d!89877))

(declare-fun d!89879 () Bool)

(declare-fun res!411563 () Bool)

(declare-fun e!363855 () Bool)

(assert (=> d!89879 (=> res!411563 e!363855)))

(assert (=> d!89879 (= res!411563 (= (select (arr!18342 lt!294033) j!136) (select (arr!18342 a!2986) j!136)))))

(assert (=> d!89879 (= (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) j!136) e!363855)))

(declare-fun b!636083 () Bool)

(declare-fun e!363856 () Bool)

(assert (=> b!636083 (= e!363855 e!363856)))

(declare-fun res!411564 () Bool)

(assert (=> b!636083 (=> (not res!411564) (not e!363856))))

(assert (=> b!636083 (= res!411564 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18706 lt!294033)))))

(declare-fun b!636084 () Bool)

(assert (=> b!636084 (= e!363856 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89879 (not res!411563)) b!636083))

(assert (= (and b!636083 res!411564) b!636084))

(declare-fun m!610395 () Bool)

(assert (=> d!89879 m!610395))

(assert (=> b!636084 m!610149))

(declare-fun m!610397 () Bool)

(assert (=> b!636084 m!610397))

(assert (=> b!635833 d!89879))

(declare-fun d!89881 () Bool)

(declare-fun res!411569 () Bool)

(declare-fun e!363861 () Bool)

(assert (=> d!89881 (=> res!411569 e!363861)))

(assert (=> d!89881 (= res!411569 (= (select (arr!18342 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89881 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!363861)))

(declare-fun b!636087 () Bool)

(declare-fun e!363862 () Bool)

(assert (=> b!636087 (= e!363861 e!363862)))

(declare-fun res!411570 () Bool)

(assert (=> b!636087 (=> (not res!411570) (not e!363862))))

(assert (=> b!636087 (= res!411570 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18706 a!2986)))))

(declare-fun b!636088 () Bool)

(assert (=> b!636088 (= e!363862 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89881 (not res!411569)) b!636087))

(assert (= (and b!636087 res!411570) b!636088))

(assert (=> d!89881 m!610349))

(declare-fun m!610399 () Bool)

(assert (=> b!636088 m!610399))

(assert (=> b!635843 d!89881))

(declare-fun b!636167 () Bool)

(declare-fun e!363910 () SeekEntryResult!6782)

(declare-fun lt!294177 () SeekEntryResult!6782)

(assert (=> b!636167 (= e!363910 (MissingZero!6782 (index!29435 lt!294177)))))

(declare-fun b!636168 () Bool)

(declare-fun e!363911 () SeekEntryResult!6782)

(declare-fun e!363909 () SeekEntryResult!6782)

(assert (=> b!636168 (= e!363911 e!363909)))

(declare-fun lt!294176 () (_ BitVec 64))

(assert (=> b!636168 (= lt!294176 (select (arr!18342 a!2986) (index!29435 lt!294177)))))

(declare-fun c!72659 () Bool)

(assert (=> b!636168 (= c!72659 (= lt!294176 k!1786))))

(declare-fun b!636169 () Bool)

(assert (=> b!636169 (= e!363910 (seekKeyOrZeroReturnVacant!0 (x!58181 lt!294177) (index!29435 lt!294177) (index!29435 lt!294177) k!1786 a!2986 mask!3053))))

(declare-fun b!636171 () Bool)

(assert (=> b!636171 (= e!363911 Undefined!6782)))

(declare-fun b!636172 () Bool)

(declare-fun c!72658 () Bool)

(assert (=> b!636172 (= c!72658 (= lt!294176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636172 (= e!363909 e!363910)))

(declare-fun b!636170 () Bool)

(assert (=> b!636170 (= e!363909 (Found!6782 (index!29435 lt!294177)))))

(declare-fun d!89883 () Bool)

(declare-fun lt!294175 () SeekEntryResult!6782)

(assert (=> d!89883 (and (or (is-Undefined!6782 lt!294175) (not (is-Found!6782 lt!294175)) (and (bvsge (index!29434 lt!294175) #b00000000000000000000000000000000) (bvslt (index!29434 lt!294175) (size!18706 a!2986)))) (or (is-Undefined!6782 lt!294175) (is-Found!6782 lt!294175) (not (is-MissingZero!6782 lt!294175)) (and (bvsge (index!29433 lt!294175) #b00000000000000000000000000000000) (bvslt (index!29433 lt!294175) (size!18706 a!2986)))) (or (is-Undefined!6782 lt!294175) (is-Found!6782 lt!294175) (is-MissingZero!6782 lt!294175) (not (is-MissingVacant!6782 lt!294175)) (and (bvsge (index!29436 lt!294175) #b00000000000000000000000000000000) (bvslt (index!29436 lt!294175) (size!18706 a!2986)))) (or (is-Undefined!6782 lt!294175) (ite (is-Found!6782 lt!294175) (= (select (arr!18342 a!2986) (index!29434 lt!294175)) k!1786) (ite (is-MissingZero!6782 lt!294175) (= (select (arr!18342 a!2986) (index!29433 lt!294175)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6782 lt!294175) (= (select (arr!18342 a!2986) (index!29436 lt!294175)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89883 (= lt!294175 e!363911)))

(declare-fun c!72657 () Bool)

(assert (=> d!89883 (= c!72657 (and (is-Intermediate!6782 lt!294177) (undefined!7594 lt!294177)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38230 (_ BitVec 32)) SeekEntryResult!6782)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89883 (= lt!294177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89883 (validMask!0 mask!3053)))

(assert (=> d!89883 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!294175)))

(assert (= (and d!89883 c!72657) b!636171))

(assert (= (and d!89883 (not c!72657)) b!636168))

(assert (= (and b!636168 c!72659) b!636170))

(assert (= (and b!636168 (not c!72659)) b!636172))

(assert (= (and b!636172 c!72658) b!636167))

(assert (= (and b!636172 (not c!72658)) b!636169))

(declare-fun m!610447 () Bool)

(assert (=> b!636168 m!610447))

(declare-fun m!610449 () Bool)

(assert (=> b!636169 m!610449))

(declare-fun m!610451 () Bool)

(assert (=> d!89883 m!610451))

(declare-fun m!610453 () Bool)

(assert (=> d!89883 m!610453))

(declare-fun m!610455 () Bool)

(assert (=> d!89883 m!610455))

(declare-fun m!610457 () Bool)

(assert (=> d!89883 m!610457))

(declare-fun m!610459 () Bool)

(assert (=> d!89883 m!610459))

(assert (=> d!89883 m!610457))

(assert (=> d!89883 m!610177))

(assert (=> b!635842 d!89883))

(declare-fun d!89899 () Bool)

(declare-fun res!411587 () Bool)

(declare-fun e!363912 () Bool)

(assert (=> d!89899 (=> res!411587 e!363912)))

(assert (=> d!89899 (= res!411587 (= (select (arr!18342 lt!294033) index!984) (select (arr!18342 a!2986) j!136)))))

(assert (=> d!89899 (= (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) index!984) e!363912)))

(declare-fun b!636173 () Bool)

(declare-fun e!363913 () Bool)

(assert (=> b!636173 (= e!363912 e!363913)))

(declare-fun res!411588 () Bool)

(assert (=> b!636173 (=> (not res!411588) (not e!363913))))

(assert (=> b!636173 (= res!411588 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18706 lt!294033)))))

(declare-fun b!636174 () Bool)

(assert (=> b!636174 (= e!363913 (arrayContainsKey!0 lt!294033 (select (arr!18342 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89899 (not res!411587)) b!636173))

(assert (= (and b!636173 res!411588) b!636174))

(declare-fun m!610461 () Bool)

(assert (=> d!89899 m!610461))

(assert (=> b!636174 m!610149))

(declare-fun m!610463 () Bool)

(assert (=> b!636174 m!610463))

(assert (=> b!635852 d!89899))

(declare-fun b!636201 () Bool)

(declare-fun e!363930 () SeekEntryResult!6782)

(assert (=> b!636201 (= e!363930 (Found!6782 index!984))))

(declare-fun b!636202 () Bool)

(declare-fun e!363929 () SeekEntryResult!6782)

(assert (=> b!636202 (= e!363929 Undefined!6782)))

(declare-fun b!636203 () Bool)

(declare-fun e!363928 () SeekEntryResult!6782)

(assert (=> b!636203 (= e!363928 (MissingVacant!6782 vacantSpotIndex!68))))

(declare-fun d!89901 () Bool)

(declare-fun lt!294192 () SeekEntryResult!6782)

(assert (=> d!89901 (and (or (is-Undefined!6782 lt!294192) (not (is-Found!6782 lt!294192)) (and (bvsge (index!29434 lt!294192) #b00000000000000000000000000000000) (bvslt (index!29434 lt!294192) (size!18706 a!2986)))) (or (is-Undefined!6782 lt!294192) (is-Found!6782 lt!294192) (not (is-MissingVacant!6782 lt!294192)) (not (= (index!29436 lt!294192) vacantSpotIndex!68)) (and (bvsge (index!29436 lt!294192) #b00000000000000000000000000000000) (bvslt (index!29436 lt!294192) (size!18706 a!2986)))) (or (is-Undefined!6782 lt!294192) (ite (is-Found!6782 lt!294192) (= (select (arr!18342 a!2986) (index!29434 lt!294192)) (select (arr!18342 a!2986) j!136)) (and (is-MissingVacant!6782 lt!294192) (= (index!29436 lt!294192) vacantSpotIndex!68) (= (select (arr!18342 a!2986) (index!29436 lt!294192)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89901 (= lt!294192 e!363929)))

(declare-fun c!72674 () Bool)

(assert (=> d!89901 (= c!72674 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!294191 () (_ BitVec 64))

(assert (=> d!89901 (= lt!294191 (select (arr!18342 a!2986) index!984))))

(assert (=> d!89901 (validMask!0 mask!3053)))

(assert (=> d!89901 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18342 a!2986) j!136) a!2986 mask!3053) lt!294192)))

(declare-fun b!636204 () Bool)

(assert (=> b!636204 (= e!363929 e!363930)))

(declare-fun c!72673 () Bool)

(assert (=> b!636204 (= c!72673 (= lt!294191 (select (arr!18342 a!2986) j!136)))))

(declare-fun b!636205 () Bool)

(declare-fun c!72672 () Bool)

(assert (=> b!636205 (= c!72672 (= lt!294191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636205 (= e!363930 e!363928)))

(declare-fun b!636206 () Bool)

(assert (=> b!636206 (= e!363928 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18342 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89901 c!72674) b!636202))

(assert (= (and d!89901 (not c!72674)) b!636204))

(assert (= (and b!636204 c!72673) b!636201))

(assert (= (and b!636204 (not c!72673)) b!636205))

(assert (= (and b!636205 c!72672) b!636203))

(assert (= (and b!636205 (not c!72672)) b!636206))

(declare-fun m!610485 () Bool)

(assert (=> d!89901 m!610485))

(declare-fun m!610487 () Bool)

(assert (=> d!89901 m!610487))

(assert (=> d!89901 m!610159))

(assert (=> d!89901 m!610177))

(assert (=> b!636206 m!610139))

(assert (=> b!636206 m!610139))

(assert (=> b!636206 m!610149))

(declare-fun m!610491 () Bool)

(assert (=> b!636206 m!610491))

(assert (=> b!635841 d!89901))

(declare-fun b!636220 () Bool)

(declare-fun e!363944 () Bool)

(declare-fun contains!3099 (List!12383 (_ BitVec 64)) Bool)

(assert (=> b!636220 (= e!363944 (