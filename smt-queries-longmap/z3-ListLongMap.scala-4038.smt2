; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55002 () Bool)

(assert start!55002)

(declare-fun b!602128 () Bool)

(declare-fun e!344354 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37170 0))(
  ( (array!37171 (arr!17843 (Array (_ BitVec 32) (_ BitVec 64))) (size!18208 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37170)

(assert (=> b!602128 (= e!344354 (or (bvsge index!984 (size!18208 a!2986)) (bvslt (size!18208 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!274150 () array!37170)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602128 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) j!136)))

(declare-fun b!602129 () Bool)

(declare-fun res!386712 () Bool)

(declare-fun e!344355 () Bool)

(assert (=> b!602129 (=> (not res!386712) (not e!344355))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602129 (= res!386712 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17843 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602130 () Bool)

(declare-datatypes ((Unit!19062 0))(
  ( (Unit!19063) )
))
(declare-fun e!344351 () Unit!19062)

(declare-fun Unit!19064 () Unit!19062)

(assert (=> b!602130 (= e!344351 Unit!19064)))

(declare-fun b!602131 () Bool)

(declare-fun e!344353 () Bool)

(assert (=> b!602131 (= e!344353 e!344355)))

(declare-fun res!386711 () Bool)

(assert (=> b!602131 (=> (not res!386711) (not e!344355))))

(declare-datatypes ((SeekEntryResult!6280 0))(
  ( (MissingZero!6280 (index!27380 (_ BitVec 32))) (Found!6280 (index!27381 (_ BitVec 32))) (Intermediate!6280 (undefined!7092 Bool) (index!27382 (_ BitVec 32)) (x!56187 (_ BitVec 32))) (Undefined!6280) (MissingVacant!6280 (index!27383 (_ BitVec 32))) )
))
(declare-fun lt!274145 () SeekEntryResult!6280)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602131 (= res!386711 (or (= lt!274145 (MissingZero!6280 i!1108)) (= lt!274145 (MissingVacant!6280 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37170 (_ BitVec 32)) SeekEntryResult!6280)

(assert (=> b!602131 (= lt!274145 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602132 () Bool)

(declare-fun res!386708 () Bool)

(assert (=> b!602132 (=> (not res!386708) (not e!344353))))

(assert (=> b!602132 (= res!386708 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602133 () Bool)

(declare-fun e!344346 () Bool)

(declare-fun e!344343 () Bool)

(assert (=> b!602133 (= e!344346 e!344343)))

(declare-fun res!386704 () Bool)

(assert (=> b!602133 (=> res!386704 e!344343)))

(declare-fun lt!274147 () (_ BitVec 64))

(declare-fun lt!274155 () (_ BitVec 64))

(assert (=> b!602133 (= res!386704 (or (not (= (select (arr!17843 a!2986) j!136) lt!274155)) (not (= (select (arr!17843 a!2986) j!136) lt!274147)) (bvsge j!136 index!984)))))

(declare-fun b!602134 () Bool)

(declare-fun e!344348 () Bool)

(declare-fun lt!274151 () SeekEntryResult!6280)

(declare-fun lt!274152 () SeekEntryResult!6280)

(assert (=> b!602134 (= e!344348 (= lt!274151 lt!274152))))

(declare-fun b!602135 () Bool)

(declare-fun res!386713 () Bool)

(assert (=> b!602135 (=> (not res!386713) (not e!344353))))

(assert (=> b!602135 (= res!386713 (and (= (size!18208 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18208 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602136 () Bool)

(declare-fun e!344342 () Unit!19062)

(declare-fun Unit!19065 () Unit!19062)

(assert (=> b!602136 (= e!344342 Unit!19065)))

(declare-fun e!344345 () Bool)

(declare-fun b!602137 () Bool)

(assert (=> b!602137 (= e!344345 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) index!984))))

(declare-fun b!602138 () Bool)

(declare-fun res!386703 () Bool)

(assert (=> b!602138 (=> (not res!386703) (not e!344353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602138 (= res!386703 (validKeyInArray!0 k0!1786))))

(declare-fun b!602139 () Bool)

(declare-fun e!344350 () Bool)

(assert (=> b!602139 (= e!344350 e!344354)))

(declare-fun res!386709 () Bool)

(assert (=> b!602139 (=> res!386709 e!344354)))

(assert (=> b!602139 (= res!386709 (bvsge index!984 j!136))))

(declare-fun lt!274153 () Unit!19062)

(assert (=> b!602139 (= lt!274153 e!344351)))

(declare-fun c!68081 () Bool)

(assert (=> b!602139 (= c!68081 (bvslt j!136 index!984))))

(declare-fun b!602140 () Bool)

(declare-fun e!344349 () Bool)

(assert (=> b!602140 (= e!344349 e!344350)))

(declare-fun res!386714 () Bool)

(assert (=> b!602140 (=> res!386714 e!344350)))

(assert (=> b!602140 (= res!386714 (or (not (= (select (arr!17843 a!2986) j!136) lt!274155)) (not (= (select (arr!17843 a!2986) j!136) lt!274147))))))

(assert (=> b!602140 e!344346))

(declare-fun res!386700 () Bool)

(assert (=> b!602140 (=> (not res!386700) (not e!344346))))

(assert (=> b!602140 (= res!386700 (= lt!274147 (select (arr!17843 a!2986) j!136)))))

(assert (=> b!602140 (= lt!274147 (select (store (arr!17843 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!386715 () Bool)

(assert (=> start!55002 (=> (not res!386715) (not e!344353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55002 (= res!386715 (validMask!0 mask!3053))))

(assert (=> start!55002 e!344353))

(assert (=> start!55002 true))

(declare-fun array_inv!13726 (array!37170) Bool)

(assert (=> start!55002 (array_inv!13726 a!2986)))

(declare-fun b!602141 () Bool)

(declare-fun Unit!19066 () Unit!19062)

(assert (=> b!602141 (= e!344342 Unit!19066)))

(assert (=> b!602141 false))

(declare-fun b!602142 () Bool)

(declare-fun e!344352 () Bool)

(assert (=> b!602142 (= e!344352 (not e!344349))))

(declare-fun res!386716 () Bool)

(assert (=> b!602142 (=> res!386716 e!344349)))

(declare-fun lt!274159 () SeekEntryResult!6280)

(assert (=> b!602142 (= res!386716 (not (= lt!274159 (Found!6280 index!984))))))

(declare-fun lt!274154 () Unit!19062)

(assert (=> b!602142 (= lt!274154 e!344342)))

(declare-fun c!68082 () Bool)

(assert (=> b!602142 (= c!68082 (= lt!274159 Undefined!6280))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37170 (_ BitVec 32)) SeekEntryResult!6280)

(assert (=> b!602142 (= lt!274159 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274155 lt!274150 mask!3053))))

(assert (=> b!602142 e!344348))

(declare-fun res!386707 () Bool)

(assert (=> b!602142 (=> (not res!386707) (not e!344348))))

(declare-fun lt!274158 () (_ BitVec 32))

(assert (=> b!602142 (= res!386707 (= lt!274152 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 lt!274155 lt!274150 mask!3053)))))

(assert (=> b!602142 (= lt!274152 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602142 (= lt!274155 (select (store (arr!17843 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274149 () Unit!19062)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37170 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19062)

(assert (=> b!602142 (= lt!274149 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602142 (= lt!274158 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602143 () Bool)

(declare-fun res!386705 () Bool)

(assert (=> b!602143 (=> (not res!386705) (not e!344355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37170 (_ BitVec 32)) Bool)

(assert (=> b!602143 (= res!386705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602144 () Bool)

(declare-fun Unit!19067 () Unit!19062)

(assert (=> b!602144 (= e!344351 Unit!19067)))

(declare-fun lt!274148 () Unit!19062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19062)

(assert (=> b!602144 (= lt!274148 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274150 (select (arr!17843 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602144 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274157 () Unit!19062)

(declare-datatypes ((List!11923 0))(
  ( (Nil!11920) (Cons!11919 (h!12964 (_ BitVec 64)) (t!18142 List!11923)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11923) Unit!19062)

(assert (=> b!602144 (= lt!274157 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11920))))

(declare-fun arrayNoDuplicates!0 (array!37170 (_ BitVec 32) List!11923) Bool)

(assert (=> b!602144 (arrayNoDuplicates!0 lt!274150 #b00000000000000000000000000000000 Nil!11920)))

(declare-fun lt!274146 () Unit!19062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37170 (_ BitVec 32) (_ BitVec 32)) Unit!19062)

(assert (=> b!602144 (= lt!274146 (lemmaNoDuplicateFromThenFromBigger!0 lt!274150 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602144 (arrayNoDuplicates!0 lt!274150 j!136 Nil!11920)))

(declare-fun lt!274156 () Unit!19062)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37170 (_ BitVec 64) (_ BitVec 32) List!11923) Unit!19062)

(assert (=> b!602144 (= lt!274156 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274150 (select (arr!17843 a!2986) j!136) j!136 Nil!11920))))

(assert (=> b!602144 false))

(declare-fun b!602145 () Bool)

(declare-fun res!386701 () Bool)

(assert (=> b!602145 (=> (not res!386701) (not e!344353))))

(assert (=> b!602145 (= res!386701 (validKeyInArray!0 (select (arr!17843 a!2986) j!136)))))

(declare-fun b!602146 () Bool)

(declare-fun e!344347 () Bool)

(assert (=> b!602146 (= e!344347 e!344352)))

(declare-fun res!386717 () Bool)

(assert (=> b!602146 (=> (not res!386717) (not e!344352))))

(assert (=> b!602146 (= res!386717 (and (= lt!274151 (Found!6280 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17843 a!2986) index!984) (select (arr!17843 a!2986) j!136))) (not (= (select (arr!17843 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602146 (= lt!274151 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602147 () Bool)

(declare-fun res!386706 () Bool)

(assert (=> b!602147 (=> (not res!386706) (not e!344355))))

(assert (=> b!602147 (= res!386706 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11920))))

(declare-fun b!602148 () Bool)

(assert (=> b!602148 (= e!344355 e!344347)))

(declare-fun res!386710 () Bool)

(assert (=> b!602148 (=> (not res!386710) (not e!344347))))

(assert (=> b!602148 (= res!386710 (= (select (store (arr!17843 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602148 (= lt!274150 (array!37171 (store (arr!17843 a!2986) i!1108 k0!1786) (size!18208 a!2986)))))

(declare-fun b!602149 () Bool)

(assert (=> b!602149 (= e!344343 e!344345)))

(declare-fun res!386702 () Bool)

(assert (=> b!602149 (=> (not res!386702) (not e!344345))))

(assert (=> b!602149 (= res!386702 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) j!136))))

(assert (= (and start!55002 res!386715) b!602135))

(assert (= (and b!602135 res!386713) b!602145))

(assert (= (and b!602145 res!386701) b!602138))

(assert (= (and b!602138 res!386703) b!602132))

(assert (= (and b!602132 res!386708) b!602131))

(assert (= (and b!602131 res!386711) b!602143))

(assert (= (and b!602143 res!386705) b!602147))

(assert (= (and b!602147 res!386706) b!602129))

(assert (= (and b!602129 res!386712) b!602148))

(assert (= (and b!602148 res!386710) b!602146))

(assert (= (and b!602146 res!386717) b!602142))

(assert (= (and b!602142 res!386707) b!602134))

(assert (= (and b!602142 c!68082) b!602141))

(assert (= (and b!602142 (not c!68082)) b!602136))

(assert (= (and b!602142 (not res!386716)) b!602140))

(assert (= (and b!602140 res!386700) b!602133))

(assert (= (and b!602133 (not res!386704)) b!602149))

(assert (= (and b!602149 res!386702) b!602137))

(assert (= (and b!602140 (not res!386714)) b!602139))

(assert (= (and b!602139 c!68081) b!602144))

(assert (= (and b!602139 (not c!68081)) b!602130))

(assert (= (and b!602139 (not res!386709)) b!602128))

(declare-fun m!578749 () Bool)

(assert (=> b!602143 m!578749))

(declare-fun m!578751 () Bool)

(assert (=> start!55002 m!578751))

(declare-fun m!578753 () Bool)

(assert (=> start!55002 m!578753))

(declare-fun m!578755 () Bool)

(assert (=> b!602131 m!578755))

(declare-fun m!578757 () Bool)

(assert (=> b!602147 m!578757))

(declare-fun m!578759 () Bool)

(assert (=> b!602145 m!578759))

(assert (=> b!602145 m!578759))

(declare-fun m!578761 () Bool)

(assert (=> b!602145 m!578761))

(declare-fun m!578763 () Bool)

(assert (=> b!602148 m!578763))

(declare-fun m!578765 () Bool)

(assert (=> b!602148 m!578765))

(assert (=> b!602144 m!578759))

(assert (=> b!602144 m!578759))

(declare-fun m!578767 () Bool)

(assert (=> b!602144 m!578767))

(declare-fun m!578769 () Bool)

(assert (=> b!602144 m!578769))

(assert (=> b!602144 m!578759))

(declare-fun m!578771 () Bool)

(assert (=> b!602144 m!578771))

(declare-fun m!578773 () Bool)

(assert (=> b!602144 m!578773))

(assert (=> b!602144 m!578759))

(declare-fun m!578775 () Bool)

(assert (=> b!602144 m!578775))

(declare-fun m!578777 () Bool)

(assert (=> b!602144 m!578777))

(declare-fun m!578779 () Bool)

(assert (=> b!602144 m!578779))

(assert (=> b!602140 m!578759))

(assert (=> b!602140 m!578763))

(declare-fun m!578781 () Bool)

(assert (=> b!602140 m!578781))

(assert (=> b!602128 m!578759))

(assert (=> b!602128 m!578759))

(declare-fun m!578783 () Bool)

(assert (=> b!602128 m!578783))

(assert (=> b!602133 m!578759))

(assert (=> b!602149 m!578759))

(assert (=> b!602149 m!578759))

(assert (=> b!602149 m!578783))

(declare-fun m!578785 () Bool)

(assert (=> b!602132 m!578785))

(declare-fun m!578787 () Bool)

(assert (=> b!602142 m!578787))

(declare-fun m!578789 () Bool)

(assert (=> b!602142 m!578789))

(assert (=> b!602142 m!578759))

(assert (=> b!602142 m!578763))

(declare-fun m!578791 () Bool)

(assert (=> b!602142 m!578791))

(assert (=> b!602142 m!578759))

(declare-fun m!578793 () Bool)

(assert (=> b!602142 m!578793))

(declare-fun m!578795 () Bool)

(assert (=> b!602142 m!578795))

(declare-fun m!578797 () Bool)

(assert (=> b!602142 m!578797))

(declare-fun m!578799 () Bool)

(assert (=> b!602146 m!578799))

(assert (=> b!602146 m!578759))

(assert (=> b!602146 m!578759))

(declare-fun m!578801 () Bool)

(assert (=> b!602146 m!578801))

(declare-fun m!578803 () Bool)

(assert (=> b!602129 m!578803))

(assert (=> b!602137 m!578759))

(assert (=> b!602137 m!578759))

(declare-fun m!578805 () Bool)

(assert (=> b!602137 m!578805))

(declare-fun m!578807 () Bool)

(assert (=> b!602138 m!578807))

(check-sat (not b!602143) (not b!602137) (not b!602146) (not b!602132) (not b!602131) (not start!55002) (not b!602128) (not b!602142) (not b!602147) (not b!602145) (not b!602138) (not b!602144) (not b!602149))
(check-sat)
(get-model)

(declare-fun d!87067 () Bool)

(assert (=> d!87067 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55002 d!87067))

(declare-fun d!87069 () Bool)

(assert (=> d!87069 (= (array_inv!13726 a!2986) (bvsge (size!18208 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55002 d!87069))

(declare-fun d!87071 () Bool)

(declare-fun res!386830 () Bool)

(declare-fun e!344444 () Bool)

(assert (=> d!87071 (=> res!386830 e!344444)))

(assert (=> d!87071 (= res!386830 (= (select (arr!17843 lt!274150) j!136) (select (arr!17843 a!2986) j!136)))))

(assert (=> d!87071 (= (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) j!136) e!344444)))

(declare-fun b!602286 () Bool)

(declare-fun e!344445 () Bool)

(assert (=> b!602286 (= e!344444 e!344445)))

(declare-fun res!386831 () Bool)

(assert (=> b!602286 (=> (not res!386831) (not e!344445))))

(assert (=> b!602286 (= res!386831 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18208 lt!274150)))))

(declare-fun b!602287 () Bool)

(assert (=> b!602287 (= e!344445 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87071 (not res!386830)) b!602286))

(assert (= (and b!602286 res!386831) b!602287))

(declare-fun m!578929 () Bool)

(assert (=> d!87071 m!578929))

(assert (=> b!602287 m!578759))

(declare-fun m!578931 () Bool)

(assert (=> b!602287 m!578931))

(assert (=> b!602149 d!87071))

(assert (=> b!602128 d!87071))

(declare-fun b!602296 () Bool)

(declare-fun e!344453 () Bool)

(declare-fun e!344454 () Bool)

(assert (=> b!602296 (= e!344453 e!344454)))

(declare-fun lt!274258 () (_ BitVec 64))

(assert (=> b!602296 (= lt!274258 (select (arr!17843 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!274256 () Unit!19062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37170 (_ BitVec 64) (_ BitVec 32)) Unit!19062)

(assert (=> b!602296 (= lt!274256 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!274258 #b00000000000000000000000000000000))))

(assert (=> b!602296 (arrayContainsKey!0 a!2986 lt!274258 #b00000000000000000000000000000000)))

(declare-fun lt!274257 () Unit!19062)

(assert (=> b!602296 (= lt!274257 lt!274256)))

(declare-fun res!386836 () Bool)

(assert (=> b!602296 (= res!386836 (= (seekEntryOrOpen!0 (select (arr!17843 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6280 #b00000000000000000000000000000000)))))

(assert (=> b!602296 (=> (not res!386836) (not e!344454))))

(declare-fun b!602297 () Bool)

(declare-fun e!344452 () Bool)

(assert (=> b!602297 (= e!344452 e!344453)))

(declare-fun c!68097 () Bool)

(assert (=> b!602297 (= c!68097 (validKeyInArray!0 (select (arr!17843 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32965 () Bool)

(declare-fun call!32968 () Bool)

(assert (=> bm!32965 (= call!32968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!602298 () Bool)

(assert (=> b!602298 (= e!344454 call!32968)))

(declare-fun d!87073 () Bool)

(declare-fun res!386837 () Bool)

(assert (=> d!87073 (=> res!386837 e!344452)))

(assert (=> d!87073 (= res!386837 (bvsge #b00000000000000000000000000000000 (size!18208 a!2986)))))

(assert (=> d!87073 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!344452)))

(declare-fun b!602299 () Bool)

(assert (=> b!602299 (= e!344453 call!32968)))

(assert (= (and d!87073 (not res!386837)) b!602297))

(assert (= (and b!602297 c!68097) b!602296))

(assert (= (and b!602297 (not c!68097)) b!602299))

(assert (= (and b!602296 res!386836) b!602298))

(assert (= (or b!602298 b!602299) bm!32965))

(declare-fun m!578933 () Bool)

(assert (=> b!602296 m!578933))

(declare-fun m!578935 () Bool)

(assert (=> b!602296 m!578935))

(declare-fun m!578937 () Bool)

(assert (=> b!602296 m!578937))

(assert (=> b!602296 m!578933))

(declare-fun m!578939 () Bool)

(assert (=> b!602296 m!578939))

(assert (=> b!602297 m!578933))

(assert (=> b!602297 m!578933))

(declare-fun m!578941 () Bool)

(assert (=> b!602297 m!578941))

(declare-fun m!578943 () Bool)

(assert (=> bm!32965 m!578943))

(assert (=> b!602143 d!87073))

(declare-fun d!87075 () Bool)

(declare-fun res!386838 () Bool)

(declare-fun e!344455 () Bool)

(assert (=> d!87075 (=> res!386838 e!344455)))

(assert (=> d!87075 (= res!386838 (= (select (arr!17843 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87075 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!344455)))

(declare-fun b!602300 () Bool)

(declare-fun e!344456 () Bool)

(assert (=> b!602300 (= e!344455 e!344456)))

(declare-fun res!386839 () Bool)

(assert (=> b!602300 (=> (not res!386839) (not e!344456))))

(assert (=> b!602300 (= res!386839 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18208 a!2986)))))

(declare-fun b!602301 () Bool)

(assert (=> b!602301 (= e!344456 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87075 (not res!386838)) b!602300))

(assert (= (and b!602300 res!386839) b!602301))

(assert (=> d!87075 m!578933))

(declare-fun m!578945 () Bool)

(assert (=> b!602301 m!578945))

(assert (=> b!602132 d!87075))

(declare-fun b!602314 () Bool)

(declare-fun c!68105 () Bool)

(declare-fun lt!274267 () (_ BitVec 64))

(assert (=> b!602314 (= c!68105 (= lt!274267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344465 () SeekEntryResult!6280)

(declare-fun e!344464 () SeekEntryResult!6280)

(assert (=> b!602314 (= e!344465 e!344464)))

(declare-fun b!602315 () Bool)

(declare-fun lt!274266 () SeekEntryResult!6280)

(assert (=> b!602315 (= e!344464 (MissingZero!6280 (index!27382 lt!274266)))))

(declare-fun b!602316 () Bool)

(declare-fun e!344463 () SeekEntryResult!6280)

(assert (=> b!602316 (= e!344463 Undefined!6280)))

(declare-fun b!602317 () Bool)

(assert (=> b!602317 (= e!344465 (Found!6280 (index!27382 lt!274266)))))

(declare-fun d!87077 () Bool)

(declare-fun lt!274265 () SeekEntryResult!6280)

(get-info :version)

(assert (=> d!87077 (and (or ((_ is Undefined!6280) lt!274265) (not ((_ is Found!6280) lt!274265)) (and (bvsge (index!27381 lt!274265) #b00000000000000000000000000000000) (bvslt (index!27381 lt!274265) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274265) ((_ is Found!6280) lt!274265) (not ((_ is MissingZero!6280) lt!274265)) (and (bvsge (index!27380 lt!274265) #b00000000000000000000000000000000) (bvslt (index!27380 lt!274265) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274265) ((_ is Found!6280) lt!274265) ((_ is MissingZero!6280) lt!274265) (not ((_ is MissingVacant!6280) lt!274265)) (and (bvsge (index!27383 lt!274265) #b00000000000000000000000000000000) (bvslt (index!27383 lt!274265) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274265) (ite ((_ is Found!6280) lt!274265) (= (select (arr!17843 a!2986) (index!27381 lt!274265)) k0!1786) (ite ((_ is MissingZero!6280) lt!274265) (= (select (arr!17843 a!2986) (index!27380 lt!274265)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6280) lt!274265) (= (select (arr!17843 a!2986) (index!27383 lt!274265)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87077 (= lt!274265 e!344463)))

(declare-fun c!68104 () Bool)

(assert (=> d!87077 (= c!68104 (and ((_ is Intermediate!6280) lt!274266) (undefined!7092 lt!274266)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37170 (_ BitVec 32)) SeekEntryResult!6280)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87077 (= lt!274266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87077 (validMask!0 mask!3053)))

(assert (=> d!87077 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!274265)))

(declare-fun b!602318 () Bool)

(assert (=> b!602318 (= e!344464 (seekKeyOrZeroReturnVacant!0 (x!56187 lt!274266) (index!27382 lt!274266) (index!27382 lt!274266) k0!1786 a!2986 mask!3053))))

(declare-fun b!602319 () Bool)

(assert (=> b!602319 (= e!344463 e!344465)))

(assert (=> b!602319 (= lt!274267 (select (arr!17843 a!2986) (index!27382 lt!274266)))))

(declare-fun c!68106 () Bool)

(assert (=> b!602319 (= c!68106 (= lt!274267 k0!1786))))

(assert (= (and d!87077 c!68104) b!602316))

(assert (= (and d!87077 (not c!68104)) b!602319))

(assert (= (and b!602319 c!68106) b!602317))

(assert (= (and b!602319 (not c!68106)) b!602314))

(assert (= (and b!602314 c!68105) b!602315))

(assert (= (and b!602314 (not c!68105)) b!602318))

(assert (=> d!87077 m!578751))

(declare-fun m!578947 () Bool)

(assert (=> d!87077 m!578947))

(declare-fun m!578949 () Bool)

(assert (=> d!87077 m!578949))

(declare-fun m!578951 () Bool)

(assert (=> d!87077 m!578951))

(declare-fun m!578953 () Bool)

(assert (=> d!87077 m!578953))

(assert (=> d!87077 m!578947))

(declare-fun m!578955 () Bool)

(assert (=> d!87077 m!578955))

(declare-fun m!578957 () Bool)

(assert (=> b!602318 m!578957))

(declare-fun m!578959 () Bool)

(assert (=> b!602319 m!578959))

(assert (=> b!602131 d!87077))

(declare-fun d!87079 () Bool)

(declare-fun e!344474 () Bool)

(assert (=> d!87079 e!344474))

(declare-fun res!386848 () Bool)

(assert (=> d!87079 (=> (not res!386848) (not e!344474))))

(assert (=> d!87079 (= res!386848 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18208 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18208 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18208 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986))))))

(declare-fun lt!274270 () Unit!19062)

(declare-fun choose!9 (array!37170 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19062)

(assert (=> d!87079 (= lt!274270 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87079 (validMask!0 mask!3053)))

(assert (=> d!87079 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 mask!3053) lt!274270)))

(declare-fun b!602328 () Bool)

(assert (=> b!602328 (= e!344474 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 (select (store (arr!17843 a!2986) i!1108 k0!1786) j!136) (array!37171 (store (arr!17843 a!2986) i!1108 k0!1786) (size!18208 a!2986)) mask!3053)))))

(assert (= (and d!87079 res!386848) b!602328))

(declare-fun m!578965 () Bool)

(assert (=> d!87079 m!578965))

(assert (=> d!87079 m!578751))

(assert (=> b!602328 m!578759))

(assert (=> b!602328 m!578793))

(assert (=> b!602328 m!578759))

(assert (=> b!602328 m!578789))

(assert (=> b!602328 m!578789))

(declare-fun m!578967 () Bool)

(assert (=> b!602328 m!578967))

(assert (=> b!602328 m!578763))

(assert (=> b!602142 d!87079))

(declare-fun b!602361 () Bool)

(declare-fun e!344499 () SeekEntryResult!6280)

(declare-fun e!344497 () SeekEntryResult!6280)

(assert (=> b!602361 (= e!344499 e!344497)))

(declare-fun c!68119 () Bool)

(declare-fun lt!274279 () (_ BitVec 64))

(assert (=> b!602361 (= c!68119 (= lt!274279 lt!274155))))

(declare-fun b!602362 () Bool)

(assert (=> b!602362 (= e!344499 Undefined!6280)))

(declare-fun b!602363 () Bool)

(declare-fun e!344498 () SeekEntryResult!6280)

(assert (=> b!602363 (= e!344498 (MissingVacant!6280 vacantSpotIndex!68))))

(declare-fun b!602364 () Bool)

(assert (=> b!602364 (= e!344497 (Found!6280 lt!274158))))

(declare-fun d!87087 () Bool)

(declare-fun lt!274278 () SeekEntryResult!6280)

(assert (=> d!87087 (and (or ((_ is Undefined!6280) lt!274278) (not ((_ is Found!6280) lt!274278)) (and (bvsge (index!27381 lt!274278) #b00000000000000000000000000000000) (bvslt (index!27381 lt!274278) (size!18208 lt!274150)))) (or ((_ is Undefined!6280) lt!274278) ((_ is Found!6280) lt!274278) (not ((_ is MissingVacant!6280) lt!274278)) (not (= (index!27383 lt!274278) vacantSpotIndex!68)) (and (bvsge (index!27383 lt!274278) #b00000000000000000000000000000000) (bvslt (index!27383 lt!274278) (size!18208 lt!274150)))) (or ((_ is Undefined!6280) lt!274278) (ite ((_ is Found!6280) lt!274278) (= (select (arr!17843 lt!274150) (index!27381 lt!274278)) lt!274155) (and ((_ is MissingVacant!6280) lt!274278) (= (index!27383 lt!274278) vacantSpotIndex!68) (= (select (arr!17843 lt!274150) (index!27383 lt!274278)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87087 (= lt!274278 e!344499)))

(declare-fun c!68118 () Bool)

(assert (=> d!87087 (= c!68118 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87087 (= lt!274279 (select (arr!17843 lt!274150) lt!274158))))

(assert (=> d!87087 (validMask!0 mask!3053)))

(assert (=> d!87087 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 lt!274155 lt!274150 mask!3053) lt!274278)))

(declare-fun b!602365 () Bool)

(declare-fun c!68117 () Bool)

(assert (=> b!602365 (= c!68117 (= lt!274279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602365 (= e!344497 e!344498)))

(declare-fun b!602366 () Bool)

(assert (=> b!602366 (= e!344498 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274158 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!274155 lt!274150 mask!3053))))

(assert (= (and d!87087 c!68118) b!602362))

(assert (= (and d!87087 (not c!68118)) b!602361))

(assert (= (and b!602361 c!68119) b!602364))

(assert (= (and b!602361 (not c!68119)) b!602365))

(assert (= (and b!602365 c!68117) b!602363))

(assert (= (and b!602365 (not c!68117)) b!602366))

(declare-fun m!578983 () Bool)

(assert (=> d!87087 m!578983))

(declare-fun m!578985 () Bool)

(assert (=> d!87087 m!578985))

(declare-fun m!578989 () Bool)

(assert (=> d!87087 m!578989))

(assert (=> d!87087 m!578751))

(declare-fun m!578991 () Bool)

(assert (=> b!602366 m!578991))

(assert (=> b!602366 m!578991))

(declare-fun m!578993 () Bool)

(assert (=> b!602366 m!578993))

(assert (=> b!602142 d!87087))

(declare-fun b!602373 () Bool)

(declare-fun e!344508 () SeekEntryResult!6280)

(declare-fun e!344506 () SeekEntryResult!6280)

(assert (=> b!602373 (= e!344508 e!344506)))

(declare-fun lt!274281 () (_ BitVec 64))

(declare-fun c!68122 () Bool)

(assert (=> b!602373 (= c!68122 (= lt!274281 (select (arr!17843 a!2986) j!136)))))

(declare-fun b!602374 () Bool)

(assert (=> b!602374 (= e!344508 Undefined!6280)))

(declare-fun b!602375 () Bool)

(declare-fun e!344507 () SeekEntryResult!6280)

(assert (=> b!602375 (= e!344507 (MissingVacant!6280 vacantSpotIndex!68))))

(declare-fun b!602376 () Bool)

(assert (=> b!602376 (= e!344506 (Found!6280 lt!274158))))

(declare-fun lt!274280 () SeekEntryResult!6280)

(declare-fun d!87101 () Bool)

(assert (=> d!87101 (and (or ((_ is Undefined!6280) lt!274280) (not ((_ is Found!6280) lt!274280)) (and (bvsge (index!27381 lt!274280) #b00000000000000000000000000000000) (bvslt (index!27381 lt!274280) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274280) ((_ is Found!6280) lt!274280) (not ((_ is MissingVacant!6280) lt!274280)) (not (= (index!27383 lt!274280) vacantSpotIndex!68)) (and (bvsge (index!27383 lt!274280) #b00000000000000000000000000000000) (bvslt (index!27383 lt!274280) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274280) (ite ((_ is Found!6280) lt!274280) (= (select (arr!17843 a!2986) (index!27381 lt!274280)) (select (arr!17843 a!2986) j!136)) (and ((_ is MissingVacant!6280) lt!274280) (= (index!27383 lt!274280) vacantSpotIndex!68) (= (select (arr!17843 a!2986) (index!27383 lt!274280)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87101 (= lt!274280 e!344508)))

(declare-fun c!68121 () Bool)

(assert (=> d!87101 (= c!68121 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87101 (= lt!274281 (select (arr!17843 a!2986) lt!274158))))

(assert (=> d!87101 (validMask!0 mask!3053)))

(assert (=> d!87101 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274158 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053) lt!274280)))

(declare-fun b!602377 () Bool)

(declare-fun c!68120 () Bool)

(assert (=> b!602377 (= c!68120 (= lt!274281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602377 (= e!344506 e!344507)))

(declare-fun b!602378 () Bool)

(assert (=> b!602378 (= e!344507 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274158 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87101 c!68121) b!602374))

(assert (= (and d!87101 (not c!68121)) b!602373))

(assert (= (and b!602373 c!68122) b!602376))

(assert (= (and b!602373 (not c!68122)) b!602377))

(assert (= (and b!602377 c!68120) b!602375))

(assert (= (and b!602377 (not c!68120)) b!602378))

(declare-fun m!578999 () Bool)

(assert (=> d!87101 m!578999))

(declare-fun m!579001 () Bool)

(assert (=> d!87101 m!579001))

(declare-fun m!579003 () Bool)

(assert (=> d!87101 m!579003))

(assert (=> d!87101 m!578751))

(assert (=> b!602378 m!578991))

(assert (=> b!602378 m!578991))

(assert (=> b!602378 m!578759))

(declare-fun m!579005 () Bool)

(assert (=> b!602378 m!579005))

(assert (=> b!602142 d!87101))

(declare-fun d!87105 () Bool)

(declare-fun lt!274287 () (_ BitVec 32))

(assert (=> d!87105 (and (bvsge lt!274287 #b00000000000000000000000000000000) (bvslt lt!274287 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87105 (= lt!274287 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87105 (validMask!0 mask!3053)))

(assert (=> d!87105 (= (nextIndex!0 index!984 x!910 mask!3053) lt!274287)))

(declare-fun bs!18432 () Bool)

(assert (= bs!18432 d!87105))

(declare-fun m!579013 () Bool)

(assert (=> bs!18432 m!579013))

(assert (=> bs!18432 m!578751))

(assert (=> b!602142 d!87105))

(declare-fun b!602381 () Bool)

(declare-fun e!344513 () SeekEntryResult!6280)

(declare-fun e!344511 () SeekEntryResult!6280)

(assert (=> b!602381 (= e!344513 e!344511)))

(declare-fun c!68125 () Bool)

(declare-fun lt!274289 () (_ BitVec 64))

(assert (=> b!602381 (= c!68125 (= lt!274289 lt!274155))))

(declare-fun b!602382 () Bool)

(assert (=> b!602382 (= e!344513 Undefined!6280)))

(declare-fun b!602383 () Bool)

(declare-fun e!344512 () SeekEntryResult!6280)

(assert (=> b!602383 (= e!344512 (MissingVacant!6280 vacantSpotIndex!68))))

(declare-fun b!602384 () Bool)

(assert (=> b!602384 (= e!344511 (Found!6280 index!984))))

(declare-fun d!87111 () Bool)

(declare-fun lt!274288 () SeekEntryResult!6280)

(assert (=> d!87111 (and (or ((_ is Undefined!6280) lt!274288) (not ((_ is Found!6280) lt!274288)) (and (bvsge (index!27381 lt!274288) #b00000000000000000000000000000000) (bvslt (index!27381 lt!274288) (size!18208 lt!274150)))) (or ((_ is Undefined!6280) lt!274288) ((_ is Found!6280) lt!274288) (not ((_ is MissingVacant!6280) lt!274288)) (not (= (index!27383 lt!274288) vacantSpotIndex!68)) (and (bvsge (index!27383 lt!274288) #b00000000000000000000000000000000) (bvslt (index!27383 lt!274288) (size!18208 lt!274150)))) (or ((_ is Undefined!6280) lt!274288) (ite ((_ is Found!6280) lt!274288) (= (select (arr!17843 lt!274150) (index!27381 lt!274288)) lt!274155) (and ((_ is MissingVacant!6280) lt!274288) (= (index!27383 lt!274288) vacantSpotIndex!68) (= (select (arr!17843 lt!274150) (index!27383 lt!274288)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87111 (= lt!274288 e!344513)))

(declare-fun c!68124 () Bool)

(assert (=> d!87111 (= c!68124 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87111 (= lt!274289 (select (arr!17843 lt!274150) index!984))))

(assert (=> d!87111 (validMask!0 mask!3053)))

(assert (=> d!87111 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274155 lt!274150 mask!3053) lt!274288)))

(declare-fun b!602385 () Bool)

(declare-fun c!68123 () Bool)

(assert (=> b!602385 (= c!68123 (= lt!274289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602385 (= e!344511 e!344512)))

(declare-fun b!602386 () Bool)

(assert (=> b!602386 (= e!344512 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!274155 lt!274150 mask!3053))))

(assert (= (and d!87111 c!68124) b!602382))

(assert (= (and d!87111 (not c!68124)) b!602381))

(assert (= (and b!602381 c!68125) b!602384))

(assert (= (and b!602381 (not c!68125)) b!602385))

(assert (= (and b!602385 c!68123) b!602383))

(assert (= (and b!602385 (not c!68123)) b!602386))

(declare-fun m!579015 () Bool)

(assert (=> d!87111 m!579015))

(declare-fun m!579017 () Bool)

(assert (=> d!87111 m!579017))

(declare-fun m!579019 () Bool)

(assert (=> d!87111 m!579019))

(assert (=> d!87111 m!578751))

(assert (=> b!602386 m!578787))

(assert (=> b!602386 m!578787))

(declare-fun m!579021 () Bool)

(assert (=> b!602386 m!579021))

(assert (=> b!602142 d!87111))

(declare-fun b!602387 () Bool)

(declare-fun e!344516 () SeekEntryResult!6280)

(declare-fun e!344514 () SeekEntryResult!6280)

(assert (=> b!602387 (= e!344516 e!344514)))

(declare-fun lt!274293 () (_ BitVec 64))

(declare-fun c!68128 () Bool)

(assert (=> b!602387 (= c!68128 (= lt!274293 (select (arr!17843 a!2986) j!136)))))

(declare-fun b!602388 () Bool)

(assert (=> b!602388 (= e!344516 Undefined!6280)))

(declare-fun b!602389 () Bool)

(declare-fun e!344515 () SeekEntryResult!6280)

(assert (=> b!602389 (= e!344515 (MissingVacant!6280 vacantSpotIndex!68))))

(declare-fun b!602390 () Bool)

(assert (=> b!602390 (= e!344514 (Found!6280 index!984))))

(declare-fun d!87113 () Bool)

(declare-fun lt!274292 () SeekEntryResult!6280)

(assert (=> d!87113 (and (or ((_ is Undefined!6280) lt!274292) (not ((_ is Found!6280) lt!274292)) (and (bvsge (index!27381 lt!274292) #b00000000000000000000000000000000) (bvslt (index!27381 lt!274292) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274292) ((_ is Found!6280) lt!274292) (not ((_ is MissingVacant!6280) lt!274292)) (not (= (index!27383 lt!274292) vacantSpotIndex!68)) (and (bvsge (index!27383 lt!274292) #b00000000000000000000000000000000) (bvslt (index!27383 lt!274292) (size!18208 a!2986)))) (or ((_ is Undefined!6280) lt!274292) (ite ((_ is Found!6280) lt!274292) (= (select (arr!17843 a!2986) (index!27381 lt!274292)) (select (arr!17843 a!2986) j!136)) (and ((_ is MissingVacant!6280) lt!274292) (= (index!27383 lt!274292) vacantSpotIndex!68) (= (select (arr!17843 a!2986) (index!27383 lt!274292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87113 (= lt!274292 e!344516)))

(declare-fun c!68127 () Bool)

(assert (=> d!87113 (= c!68127 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87113 (= lt!274293 (select (arr!17843 a!2986) index!984))))

(assert (=> d!87113 (validMask!0 mask!3053)))

(assert (=> d!87113 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053) lt!274292)))

(declare-fun b!602391 () Bool)

(declare-fun c!68126 () Bool)

(assert (=> b!602391 (= c!68126 (= lt!274293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602391 (= e!344514 e!344515)))

(declare-fun b!602392 () Bool)

(assert (=> b!602392 (= e!344515 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87113 c!68127) b!602388))

(assert (= (and d!87113 (not c!68127)) b!602387))

(assert (= (and b!602387 c!68128) b!602390))

(assert (= (and b!602387 (not c!68128)) b!602391))

(assert (= (and b!602391 c!68126) b!602389))

(assert (= (and b!602391 (not c!68126)) b!602392))

(declare-fun m!579023 () Bool)

(assert (=> d!87113 m!579023))

(declare-fun m!579027 () Bool)

(assert (=> d!87113 m!579027))

(assert (=> d!87113 m!578799))

(assert (=> d!87113 m!578751))

(assert (=> b!602392 m!578787))

(assert (=> b!602392 m!578787))

(assert (=> b!602392 m!578759))

(declare-fun m!579029 () Bool)

(assert (=> b!602392 m!579029))

(assert (=> b!602146 d!87113))

(declare-fun d!87117 () Bool)

(assert (=> d!87117 (= (validKeyInArray!0 (select (arr!17843 a!2986) j!136)) (and (not (= (select (arr!17843 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17843 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602145 d!87117))

(declare-fun d!87119 () Bool)

(assert (=> d!87119 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18208 lt!274150)) (not (= (select (arr!17843 lt!274150) j!136) (select (arr!17843 a!2986) j!136))))))

(declare-fun lt!274299 () Unit!19062)

(declare-fun choose!21 (array!37170 (_ BitVec 64) (_ BitVec 32) List!11923) Unit!19062)

(assert (=> d!87119 (= lt!274299 (choose!21 lt!274150 (select (arr!17843 a!2986) j!136) j!136 Nil!11920))))

(assert (=> d!87119 (bvslt (size!18208 lt!274150) #b01111111111111111111111111111111)))

(assert (=> d!87119 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274150 (select (arr!17843 a!2986) j!136) j!136 Nil!11920) lt!274299)))

(declare-fun bs!18434 () Bool)

(assert (= bs!18434 d!87119))

(assert (=> bs!18434 m!578929))

(assert (=> bs!18434 m!578759))

(declare-fun m!579031 () Bool)

(assert (=> bs!18434 m!579031))

(assert (=> b!602144 d!87119))

(declare-fun b!602421 () Bool)

(declare-fun e!344540 () Bool)

(declare-fun call!32978 () Bool)

(assert (=> b!602421 (= e!344540 call!32978)))

(declare-fun b!602422 () Bool)

(declare-fun e!344542 () Bool)

(assert (=> b!602422 (= e!344542 e!344540)))

(declare-fun c!68134 () Bool)

(assert (=> b!602422 (= c!68134 (validKeyInArray!0 (select (arr!17843 lt!274150) j!136)))))

(declare-fun bm!32975 () Bool)

(assert (=> bm!32975 (= call!32978 (arrayNoDuplicates!0 lt!274150 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68134 (Cons!11919 (select (arr!17843 lt!274150) j!136) Nil!11920) Nil!11920)))))

(declare-fun b!602423 () Bool)

(assert (=> b!602423 (= e!344540 call!32978)))

(declare-fun b!602424 () Bool)

(declare-fun e!344541 () Bool)

(assert (=> b!602424 (= e!344541 e!344542)))

(declare-fun res!386887 () Bool)

(assert (=> b!602424 (=> (not res!386887) (not e!344542))))

(declare-fun e!344543 () Bool)

(assert (=> b!602424 (= res!386887 (not e!344543))))

(declare-fun res!386888 () Bool)

(assert (=> b!602424 (=> (not res!386888) (not e!344543))))

(assert (=> b!602424 (= res!386888 (validKeyInArray!0 (select (arr!17843 lt!274150) j!136)))))

(declare-fun d!87121 () Bool)

(declare-fun res!386889 () Bool)

(assert (=> d!87121 (=> res!386889 e!344541)))

(assert (=> d!87121 (= res!386889 (bvsge j!136 (size!18208 lt!274150)))))

(assert (=> d!87121 (= (arrayNoDuplicates!0 lt!274150 j!136 Nil!11920) e!344541)))

(declare-fun b!602425 () Bool)

(declare-fun contains!2974 (List!11923 (_ BitVec 64)) Bool)

(assert (=> b!602425 (= e!344543 (contains!2974 Nil!11920 (select (arr!17843 lt!274150) j!136)))))

(assert (= (and d!87121 (not res!386889)) b!602424))

(assert (= (and b!602424 res!386888) b!602425))

(assert (= (and b!602424 res!386887) b!602422))

(assert (= (and b!602422 c!68134) b!602423))

(assert (= (and b!602422 (not c!68134)) b!602421))

(assert (= (or b!602423 b!602421) bm!32975))

(assert (=> b!602422 m!578929))

(assert (=> b!602422 m!578929))

(declare-fun m!579043 () Bool)

(assert (=> b!602422 m!579043))

(assert (=> bm!32975 m!578929))

(declare-fun m!579045 () Bool)

(assert (=> bm!32975 m!579045))

(assert (=> b!602424 m!578929))

(assert (=> b!602424 m!578929))

(assert (=> b!602424 m!579043))

(assert (=> b!602425 m!578929))

(assert (=> b!602425 m!578929))

(declare-fun m!579047 () Bool)

(assert (=> b!602425 m!579047))

(assert (=> b!602144 d!87121))

(declare-fun d!87127 () Bool)

(assert (=> d!87127 (arrayNoDuplicates!0 lt!274150 j!136 Nil!11920)))

(declare-fun lt!274303 () Unit!19062)

(declare-fun choose!39 (array!37170 (_ BitVec 32) (_ BitVec 32)) Unit!19062)

(assert (=> d!87127 (= lt!274303 (choose!39 lt!274150 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87127 (bvslt (size!18208 lt!274150) #b01111111111111111111111111111111)))

(assert (=> d!87127 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!274150 #b00000000000000000000000000000000 j!136) lt!274303)))

(declare-fun bs!18435 () Bool)

(assert (= bs!18435 d!87127))

(assert (=> bs!18435 m!578769))

(declare-fun m!579049 () Bool)

(assert (=> bs!18435 m!579049))

(assert (=> b!602144 d!87127))

(declare-fun d!87129 () Bool)

(declare-fun res!386890 () Bool)

(declare-fun e!344544 () Bool)

(assert (=> d!87129 (=> res!386890 e!344544)))

(assert (=> d!87129 (= res!386890 (= (select (arr!17843 lt!274150) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17843 a!2986) j!136)))))

(assert (=> d!87129 (= (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344544)))

(declare-fun b!602426 () Bool)

(declare-fun e!344545 () Bool)

(assert (=> b!602426 (= e!344544 e!344545)))

(declare-fun res!386891 () Bool)

(assert (=> b!602426 (=> (not res!386891) (not e!344545))))

(assert (=> b!602426 (= res!386891 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18208 lt!274150)))))

(declare-fun b!602427 () Bool)

(assert (=> b!602427 (= e!344545 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87129 (not res!386890)) b!602426))

(assert (= (and b!602426 res!386891) b!602427))

(declare-fun m!579051 () Bool)

(assert (=> d!87129 m!579051))

(assert (=> b!602427 m!578759))

(declare-fun m!579053 () Bool)

(assert (=> b!602427 m!579053))

(assert (=> b!602144 d!87129))

(declare-fun b!602428 () Bool)

(declare-fun e!344546 () Bool)

(declare-fun call!32979 () Bool)

(assert (=> b!602428 (= e!344546 call!32979)))

(declare-fun b!602429 () Bool)

(declare-fun e!344548 () Bool)

(assert (=> b!602429 (= e!344548 e!344546)))

(declare-fun c!68135 () Bool)

(assert (=> b!602429 (= c!68135 (validKeyInArray!0 (select (arr!17843 lt!274150) #b00000000000000000000000000000000)))))

(declare-fun bm!32976 () Bool)

(assert (=> bm!32976 (= call!32979 (arrayNoDuplicates!0 lt!274150 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68135 (Cons!11919 (select (arr!17843 lt!274150) #b00000000000000000000000000000000) Nil!11920) Nil!11920)))))

(declare-fun b!602430 () Bool)

(assert (=> b!602430 (= e!344546 call!32979)))

(declare-fun b!602431 () Bool)

(declare-fun e!344547 () Bool)

(assert (=> b!602431 (= e!344547 e!344548)))

(declare-fun res!386892 () Bool)

(assert (=> b!602431 (=> (not res!386892) (not e!344548))))

(declare-fun e!344549 () Bool)

(assert (=> b!602431 (= res!386892 (not e!344549))))

(declare-fun res!386893 () Bool)

(assert (=> b!602431 (=> (not res!386893) (not e!344549))))

(assert (=> b!602431 (= res!386893 (validKeyInArray!0 (select (arr!17843 lt!274150) #b00000000000000000000000000000000)))))

(declare-fun d!87131 () Bool)

(declare-fun res!386894 () Bool)

(assert (=> d!87131 (=> res!386894 e!344547)))

(assert (=> d!87131 (= res!386894 (bvsge #b00000000000000000000000000000000 (size!18208 lt!274150)))))

(assert (=> d!87131 (= (arrayNoDuplicates!0 lt!274150 #b00000000000000000000000000000000 Nil!11920) e!344547)))

(declare-fun b!602432 () Bool)

(assert (=> b!602432 (= e!344549 (contains!2974 Nil!11920 (select (arr!17843 lt!274150) #b00000000000000000000000000000000)))))

(assert (= (and d!87131 (not res!386894)) b!602431))

(assert (= (and b!602431 res!386893) b!602432))

(assert (= (and b!602431 res!386892) b!602429))

(assert (= (and b!602429 c!68135) b!602430))

(assert (= (and b!602429 (not c!68135)) b!602428))

(assert (= (or b!602430 b!602428) bm!32976))

(declare-fun m!579055 () Bool)

(assert (=> b!602429 m!579055))

(assert (=> b!602429 m!579055))

(declare-fun m!579057 () Bool)

(assert (=> b!602429 m!579057))

(assert (=> bm!32976 m!579055))

(declare-fun m!579059 () Bool)

(assert (=> bm!32976 m!579059))

(assert (=> b!602431 m!579055))

(assert (=> b!602431 m!579055))

(assert (=> b!602431 m!579057))

(assert (=> b!602432 m!579055))

(assert (=> b!602432 m!579055))

(declare-fun m!579061 () Bool)

(assert (=> b!602432 m!579061))

(assert (=> b!602144 d!87131))

(declare-fun d!87133 () Bool)

(assert (=> d!87133 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274310 () Unit!19062)

(declare-fun choose!114 (array!37170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19062)

(assert (=> d!87133 (= lt!274310 (choose!114 lt!274150 (select (arr!17843 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87133 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87133 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274150 (select (arr!17843 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274310)))

(declare-fun bs!18436 () Bool)

(assert (= bs!18436 d!87133))

(assert (=> bs!18436 m!578759))

(assert (=> bs!18436 m!578771))

(assert (=> bs!18436 m!578759))

(declare-fun m!579063 () Bool)

(assert (=> bs!18436 m!579063))

(assert (=> b!602144 d!87133))

(declare-fun d!87135 () Bool)

(declare-fun e!344567 () Bool)

(assert (=> d!87135 e!344567))

(declare-fun res!386902 () Bool)

(assert (=> d!87135 (=> (not res!386902) (not e!344567))))

(assert (=> d!87135 (= res!386902 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986))))))

(declare-fun lt!274315 () Unit!19062)

(declare-fun choose!41 (array!37170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11923) Unit!19062)

(assert (=> d!87135 (= lt!274315 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11920))))

(assert (=> d!87135 (bvslt (size!18208 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87135 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11920) lt!274315)))

(declare-fun b!602460 () Bool)

(assert (=> b!602460 (= e!344567 (arrayNoDuplicates!0 (array!37171 (store (arr!17843 a!2986) i!1108 k0!1786) (size!18208 a!2986)) #b00000000000000000000000000000000 Nil!11920))))

(assert (= (and d!87135 res!386902) b!602460))

(declare-fun m!579083 () Bool)

(assert (=> d!87135 m!579083))

(assert (=> b!602460 m!578763))

(declare-fun m!579085 () Bool)

(assert (=> b!602460 m!579085))

(assert (=> b!602144 d!87135))

(declare-fun d!87145 () Bool)

(assert (=> d!87145 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602138 d!87145))

(declare-fun d!87147 () Bool)

(declare-fun res!386903 () Bool)

(declare-fun e!344568 () Bool)

(assert (=> d!87147 (=> res!386903 e!344568)))

(assert (=> d!87147 (= res!386903 (= (select (arr!17843 lt!274150) index!984) (select (arr!17843 a!2986) j!136)))))

(assert (=> d!87147 (= (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) index!984) e!344568)))

(declare-fun b!602461 () Bool)

(declare-fun e!344569 () Bool)

(assert (=> b!602461 (= e!344568 e!344569)))

(declare-fun res!386904 () Bool)

(assert (=> b!602461 (=> (not res!386904) (not e!344569))))

(assert (=> b!602461 (= res!386904 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18208 lt!274150)))))

(declare-fun b!602462 () Bool)

(assert (=> b!602462 (= e!344569 (arrayContainsKey!0 lt!274150 (select (arr!17843 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87147 (not res!386903)) b!602461))

(assert (= (and b!602461 res!386904) b!602462))

(assert (=> d!87147 m!579019))

(assert (=> b!602462 m!578759))

(declare-fun m!579087 () Bool)

(assert (=> b!602462 m!579087))

(assert (=> b!602137 d!87147))

(declare-fun b!602463 () Bool)

(declare-fun e!344570 () Bool)

(declare-fun call!32981 () Bool)

(assert (=> b!602463 (= e!344570 call!32981)))

(declare-fun b!602464 () Bool)

(declare-fun e!344572 () Bool)

(assert (=> b!602464 (= e!344572 e!344570)))

(declare-fun c!68146 () Bool)

(assert (=> b!602464 (= c!68146 (validKeyInArray!0 (select (arr!17843 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32978 () Bool)

(assert (=> bm!32978 (= call!32981 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68146 (Cons!11919 (select (arr!17843 a!2986) #b00000000000000000000000000000000) Nil!11920) Nil!11920)))))

(declare-fun b!602465 () Bool)

(assert (=> b!602465 (= e!344570 call!32981)))

(declare-fun b!602466 () Bool)

(declare-fun e!344571 () Bool)

(assert (=> b!602466 (= e!344571 e!344572)))

(declare-fun res!386905 () Bool)

(assert (=> b!602466 (=> (not res!386905) (not e!344572))))

(declare-fun e!344573 () Bool)

(assert (=> b!602466 (= res!386905 (not e!344573))))

(declare-fun res!386906 () Bool)

(assert (=> b!602466 (=> (not res!386906) (not e!344573))))

(assert (=> b!602466 (= res!386906 (validKeyInArray!0 (select (arr!17843 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87149 () Bool)

(declare-fun res!386907 () Bool)

(assert (=> d!87149 (=> res!386907 e!344571)))

(assert (=> d!87149 (= res!386907 (bvsge #b00000000000000000000000000000000 (size!18208 a!2986)))))

(assert (=> d!87149 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11920) e!344571)))

(declare-fun b!602467 () Bool)

(assert (=> b!602467 (= e!344573 (contains!2974 Nil!11920 (select (arr!17843 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87149 (not res!386907)) b!602466))

(assert (= (and b!602466 res!386906) b!602467))

(assert (= (and b!602466 res!386905) b!602464))

(assert (= (and b!602464 c!68146) b!602465))

(assert (= (and b!602464 (not c!68146)) b!602463))

(assert (= (or b!602465 b!602463) bm!32978))

(assert (=> b!602464 m!578933))

(assert (=> b!602464 m!578933))

(assert (=> b!602464 m!578941))

(assert (=> bm!32978 m!578933))

(declare-fun m!579089 () Bool)

(assert (=> bm!32978 m!579089))

(assert (=> b!602466 m!578933))

(assert (=> b!602466 m!578933))

(assert (=> b!602466 m!578941))

(assert (=> b!602467 m!578933))

(assert (=> b!602467 m!578933))

(declare-fun m!579091 () Bool)

(assert (=> b!602467 m!579091))

(assert (=> b!602147 d!87149))

(check-sat (not b!602425) (not d!87087) (not b!602301) (not d!87135) (not b!602462) (not d!87105) (not b!602429) (not bm!32978) (not d!87111) (not b!602466) (not b!602297) (not b!602378) (not b!602460) (not d!87119) (not b!602464) (not d!87079) (not bm!32975) (not d!87133) (not b!602392) (not b!602424) (not bm!32965) (not b!602427) (not b!602287) (not b!602386) (not b!602467) (not b!602296) (not d!87113) (not d!87077) (not b!602432) (not b!602328) (not d!87101) (not b!602318) (not b!602366) (not d!87127) (not b!602431) (not bm!32976) (not b!602422))
(check-sat)
