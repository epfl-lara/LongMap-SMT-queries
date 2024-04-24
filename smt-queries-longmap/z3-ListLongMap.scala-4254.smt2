; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59052 () Bool)

(assert start!59052)

(declare-fun b!651204 () Bool)

(declare-fun e!373654 () Bool)

(declare-fun e!373655 () Bool)

(assert (=> b!651204 (= e!373654 e!373655)))

(declare-fun res!422183 () Bool)

(assert (=> b!651204 (=> (not res!422183) (not e!373655))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6883 0))(
  ( (MissingZero!6883 (index!29882 (_ BitVec 32))) (Found!6883 (index!29883 (_ BitVec 32))) (Intermediate!6883 (undefined!7695 Bool) (index!29884 (_ BitVec 32)) (x!58820 (_ BitVec 32))) (Undefined!6883) (MissingVacant!6883 (index!29885 (_ BitVec 32))) )
))
(declare-fun lt!302698 () SeekEntryResult!6883)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38571 0))(
  ( (array!38572 (arr!18487 (Array (_ BitVec 32) (_ BitVec 64))) (size!18851 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38571)

(assert (=> b!651204 (= res!422183 (and (= lt!302698 (Found!6883 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18487 a!2986) index!984) (select (arr!18487 a!2986) j!136))) (not (= (select (arr!18487 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38571 (_ BitVec 32)) SeekEntryResult!6883)

(assert (=> b!651204 (= lt!302698 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18487 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651205 () Bool)

(declare-fun e!373648 () Bool)

(declare-fun e!373662 () Bool)

(assert (=> b!651205 (= e!373648 e!373662)))

(declare-fun res!422190 () Bool)

(assert (=> b!651205 (=> (not res!422190) (not e!373662))))

(declare-fun lt!302702 () SeekEntryResult!6883)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651205 (= res!422190 (or (= lt!302702 (MissingZero!6883 i!1108)) (= lt!302702 (MissingVacant!6883 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38571 (_ BitVec 32)) SeekEntryResult!6883)

(assert (=> b!651205 (= lt!302702 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651206 () Bool)

(declare-datatypes ((Unit!22197 0))(
  ( (Unit!22198) )
))
(declare-fun e!373649 () Unit!22197)

(declare-fun Unit!22199 () Unit!22197)

(assert (=> b!651206 (= e!373649 Unit!22199)))

(declare-fun lt!302708 () Unit!22197)

(declare-fun lt!302709 () array!38571)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22197)

(assert (=> b!651206 (= lt!302708 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302709 (select (arr!18487 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651206 (arrayContainsKey!0 lt!302709 (select (arr!18487 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302705 () Unit!22197)

(declare-datatypes ((List!12435 0))(
  ( (Nil!12432) (Cons!12431 (h!13479 (_ BitVec 64)) (t!18655 List!12435)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12435) Unit!22197)

(assert (=> b!651206 (= lt!302705 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12432))))

(declare-fun arrayNoDuplicates!0 (array!38571 (_ BitVec 32) List!12435) Bool)

(assert (=> b!651206 (arrayNoDuplicates!0 lt!302709 #b00000000000000000000000000000000 Nil!12432)))

(declare-fun lt!302704 () Unit!22197)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38571 (_ BitVec 32) (_ BitVec 32)) Unit!22197)

(assert (=> b!651206 (= lt!302704 (lemmaNoDuplicateFromThenFromBigger!0 lt!302709 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651206 (arrayNoDuplicates!0 lt!302709 j!136 Nil!12432)))

(declare-fun lt!302700 () Unit!22197)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38571 (_ BitVec 64) (_ BitVec 32) List!12435) Unit!22197)

(assert (=> b!651206 (= lt!302700 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302709 (select (arr!18487 a!2986) j!136) j!136 Nil!12432))))

(assert (=> b!651206 false))

(declare-fun b!651207 () Bool)

(declare-fun res!422178 () Bool)

(assert (=> b!651207 (=> (not res!422178) (not e!373648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651207 (= res!422178 (validKeyInArray!0 (select (arr!18487 a!2986) j!136)))))

(declare-fun b!651208 () Bool)

(declare-fun e!373653 () Bool)

(declare-fun e!373661 () Bool)

(assert (=> b!651208 (= e!373653 e!373661)))

(declare-fun res!422187 () Bool)

(assert (=> b!651208 (=> res!422187 e!373661)))

(declare-fun lt!302710 () (_ BitVec 64))

(declare-fun lt!302711 () (_ BitVec 64))

(assert (=> b!651208 (= res!422187 (or (not (= (select (arr!18487 a!2986) j!136) lt!302710)) (not (= (select (arr!18487 a!2986) j!136) lt!302711))))))

(declare-fun e!373658 () Bool)

(assert (=> b!651208 e!373658))

(declare-fun res!422174 () Bool)

(assert (=> b!651208 (=> (not res!422174) (not e!373658))))

(assert (=> b!651208 (= res!422174 (= lt!302711 (select (arr!18487 a!2986) j!136)))))

(assert (=> b!651208 (= lt!302711 (select (store (arr!18487 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651209 () Bool)

(declare-fun e!373660 () Bool)

(declare-fun lt!302713 () SeekEntryResult!6883)

(assert (=> b!651209 (= e!373660 (= lt!302698 lt!302713))))

(declare-fun b!651210 () Bool)

(declare-fun e!373652 () Unit!22197)

(declare-fun Unit!22200 () Unit!22197)

(assert (=> b!651210 (= e!373652 Unit!22200)))

(declare-fun b!651212 () Bool)

(declare-fun e!373650 () Bool)

(declare-fun e!373651 () Bool)

(assert (=> b!651212 (= e!373650 e!373651)))

(declare-fun res!422179 () Bool)

(assert (=> b!651212 (=> (not res!422179) (not e!373651))))

(assert (=> b!651212 (= res!422179 (arrayContainsKey!0 lt!302709 (select (arr!18487 a!2986) j!136) j!136))))

(declare-fun b!651213 () Bool)

(declare-fun e!373657 () Bool)

(assert (=> b!651213 (= e!373661 e!373657)))

(declare-fun res!422188 () Bool)

(assert (=> b!651213 (=> res!422188 e!373657)))

(assert (=> b!651213 (= res!422188 (bvsge index!984 j!136))))

(declare-fun lt!302697 () Unit!22197)

(assert (=> b!651213 (= lt!302697 e!373649)))

(declare-fun c!74884 () Bool)

(assert (=> b!651213 (= c!74884 (bvslt j!136 index!984))))

(declare-fun b!651214 () Bool)

(declare-fun e!373659 () Bool)

(assert (=> b!651214 (= e!373659 (arrayContainsKey!0 lt!302709 (select (arr!18487 a!2986) j!136) index!984))))

(declare-fun b!651215 () Bool)

(assert (=> b!651215 (= e!373658 e!373650)))

(declare-fun res!422182 () Bool)

(assert (=> b!651215 (=> res!422182 e!373650)))

(assert (=> b!651215 (= res!422182 (or (not (= (select (arr!18487 a!2986) j!136) lt!302710)) (not (= (select (arr!18487 a!2986) j!136) lt!302711)) (bvsge j!136 index!984)))))

(declare-fun b!651216 () Bool)

(declare-fun res!422191 () Bool)

(assert (=> b!651216 (=> (not res!422191) (not e!373648))))

(assert (=> b!651216 (= res!422191 (and (= (size!18851 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18851 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18851 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651217 () Bool)

(assert (=> b!651217 (= e!373662 e!373654)))

(declare-fun res!422176 () Bool)

(assert (=> b!651217 (=> (not res!422176) (not e!373654))))

(assert (=> b!651217 (= res!422176 (= (select (store (arr!18487 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651217 (= lt!302709 (array!38572 (store (arr!18487 a!2986) i!1108 k0!1786) (size!18851 a!2986)))))

(declare-fun b!651218 () Bool)

(declare-fun Unit!22201 () Unit!22197)

(assert (=> b!651218 (= e!373649 Unit!22201)))

(declare-fun b!651219 () Bool)

(assert (=> b!651219 (= e!373651 (arrayContainsKey!0 lt!302709 (select (arr!18487 a!2986) j!136) index!984))))

(declare-fun b!651220 () Bool)

(declare-fun Unit!22202 () Unit!22197)

(assert (=> b!651220 (= e!373652 Unit!22202)))

(assert (=> b!651220 false))

(declare-fun b!651221 () Bool)

(assert (=> b!651221 (= e!373655 (not e!373653))))

(declare-fun res!422180 () Bool)

(assert (=> b!651221 (=> res!422180 e!373653)))

(declare-fun lt!302706 () SeekEntryResult!6883)

(assert (=> b!651221 (= res!422180 (not (= lt!302706 (Found!6883 index!984))))))

(declare-fun lt!302701 () Unit!22197)

(assert (=> b!651221 (= lt!302701 e!373652)))

(declare-fun c!74885 () Bool)

(assert (=> b!651221 (= c!74885 (= lt!302706 Undefined!6883))))

(assert (=> b!651221 (= lt!302706 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302710 lt!302709 mask!3053))))

(assert (=> b!651221 e!373660))

(declare-fun res!422181 () Bool)

(assert (=> b!651221 (=> (not res!422181) (not e!373660))))

(declare-fun lt!302703 () (_ BitVec 32))

(assert (=> b!651221 (= res!422181 (= lt!302713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302703 vacantSpotIndex!68 lt!302710 lt!302709 mask!3053)))))

(assert (=> b!651221 (= lt!302713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302703 vacantSpotIndex!68 (select (arr!18487 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651221 (= lt!302710 (select (store (arr!18487 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302707 () Unit!22197)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22197)

(assert (=> b!651221 (= lt!302707 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302703 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651221 (= lt!302703 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!651222 () Bool)

(declare-fun res!422177 () Bool)

(assert (=> b!651222 (=> (not res!422177) (not e!373648))))

(assert (=> b!651222 (= res!422177 (validKeyInArray!0 k0!1786))))

(declare-fun b!651223 () Bool)

(declare-fun res!422186 () Bool)

(assert (=> b!651223 (=> (not res!422186) (not e!373662))))

(assert (=> b!651223 (= res!422186 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18487 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651224 () Bool)

(declare-fun res!422185 () Bool)

(assert (=> b!651224 (=> (not res!422185) (not e!373648))))

(assert (=> b!651224 (= res!422185 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651211 () Bool)

(declare-fun res!422175 () Bool)

(assert (=> b!651211 (=> (not res!422175) (not e!373662))))

(assert (=> b!651211 (= res!422175 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12432))))

(declare-fun res!422189 () Bool)

(assert (=> start!59052 (=> (not res!422189) (not e!373648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59052 (= res!422189 (validMask!0 mask!3053))))

(assert (=> start!59052 e!373648))

(assert (=> start!59052 true))

(declare-fun array_inv!14346 (array!38571) Bool)

(assert (=> start!59052 (array_inv!14346 a!2986)))

(declare-fun b!651225 () Bool)

(assert (=> b!651225 (= e!373657 true)))

(assert (=> b!651225 (arrayNoDuplicates!0 lt!302709 #b00000000000000000000000000000000 Nil!12432)))

(declare-fun lt!302699 () Unit!22197)

(assert (=> b!651225 (= lt!302699 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12432))))

(assert (=> b!651225 (arrayContainsKey!0 lt!302709 (select (arr!18487 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302712 () Unit!22197)

(assert (=> b!651225 (= lt!302712 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302709 (select (arr!18487 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651225 e!373659))

(declare-fun res!422184 () Bool)

(assert (=> b!651225 (=> (not res!422184) (not e!373659))))

(assert (=> b!651225 (= res!422184 (arrayContainsKey!0 lt!302709 (select (arr!18487 a!2986) j!136) j!136))))

(declare-fun b!651226 () Bool)

(declare-fun res!422173 () Bool)

(assert (=> b!651226 (=> (not res!422173) (not e!373662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38571 (_ BitVec 32)) Bool)

(assert (=> b!651226 (= res!422173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59052 res!422189) b!651216))

(assert (= (and b!651216 res!422191) b!651207))

(assert (= (and b!651207 res!422178) b!651222))

(assert (= (and b!651222 res!422177) b!651224))

(assert (= (and b!651224 res!422185) b!651205))

(assert (= (and b!651205 res!422190) b!651226))

(assert (= (and b!651226 res!422173) b!651211))

(assert (= (and b!651211 res!422175) b!651223))

(assert (= (and b!651223 res!422186) b!651217))

(assert (= (and b!651217 res!422176) b!651204))

(assert (= (and b!651204 res!422183) b!651221))

(assert (= (and b!651221 res!422181) b!651209))

(assert (= (and b!651221 c!74885) b!651220))

(assert (= (and b!651221 (not c!74885)) b!651210))

(assert (= (and b!651221 (not res!422180)) b!651208))

(assert (= (and b!651208 res!422174) b!651215))

(assert (= (and b!651215 (not res!422182)) b!651212))

(assert (= (and b!651212 res!422179) b!651219))

(assert (= (and b!651208 (not res!422187)) b!651213))

(assert (= (and b!651213 c!74884) b!651206))

(assert (= (and b!651213 (not c!74884)) b!651218))

(assert (= (and b!651213 (not res!422188)) b!651225))

(assert (= (and b!651225 res!422184) b!651214))

(declare-fun m!624805 () Bool)

(assert (=> b!651208 m!624805))

(declare-fun m!624807 () Bool)

(assert (=> b!651208 m!624807))

(declare-fun m!624809 () Bool)

(assert (=> b!651208 m!624809))

(declare-fun m!624811 () Bool)

(assert (=> start!59052 m!624811))

(declare-fun m!624813 () Bool)

(assert (=> start!59052 m!624813))

(declare-fun m!624815 () Bool)

(assert (=> b!651211 m!624815))

(declare-fun m!624817 () Bool)

(assert (=> b!651222 m!624817))

(declare-fun m!624819 () Bool)

(assert (=> b!651221 m!624819))

(assert (=> b!651221 m!624805))

(declare-fun m!624821 () Bool)

(assert (=> b!651221 m!624821))

(declare-fun m!624823 () Bool)

(assert (=> b!651221 m!624823))

(assert (=> b!651221 m!624805))

(declare-fun m!624825 () Bool)

(assert (=> b!651221 m!624825))

(declare-fun m!624827 () Bool)

(assert (=> b!651221 m!624827))

(assert (=> b!651221 m!624807))

(declare-fun m!624829 () Bool)

(assert (=> b!651221 m!624829))

(assert (=> b!651225 m!624805))

(declare-fun m!624831 () Bool)

(assert (=> b!651225 m!624831))

(assert (=> b!651225 m!624805))

(declare-fun m!624833 () Bool)

(assert (=> b!651225 m!624833))

(assert (=> b!651225 m!624805))

(declare-fun m!624835 () Bool)

(assert (=> b!651225 m!624835))

(assert (=> b!651225 m!624805))

(declare-fun m!624837 () Bool)

(assert (=> b!651225 m!624837))

(declare-fun m!624839 () Bool)

(assert (=> b!651225 m!624839))

(assert (=> b!651215 m!624805))

(declare-fun m!624841 () Bool)

(assert (=> b!651224 m!624841))

(assert (=> b!651214 m!624805))

(assert (=> b!651214 m!624805))

(declare-fun m!624843 () Bool)

(assert (=> b!651214 m!624843))

(declare-fun m!624845 () Bool)

(assert (=> b!651223 m!624845))

(assert (=> b!651217 m!624807))

(declare-fun m!624847 () Bool)

(assert (=> b!651217 m!624847))

(assert (=> b!651207 m!624805))

(assert (=> b!651207 m!624805))

(declare-fun m!624849 () Bool)

(assert (=> b!651207 m!624849))

(declare-fun m!624851 () Bool)

(assert (=> b!651226 m!624851))

(assert (=> b!651219 m!624805))

(assert (=> b!651219 m!624805))

(assert (=> b!651219 m!624843))

(declare-fun m!624853 () Bool)

(assert (=> b!651204 m!624853))

(assert (=> b!651204 m!624805))

(assert (=> b!651204 m!624805))

(declare-fun m!624855 () Bool)

(assert (=> b!651204 m!624855))

(declare-fun m!624857 () Bool)

(assert (=> b!651206 m!624857))

(assert (=> b!651206 m!624805))

(assert (=> b!651206 m!624831))

(assert (=> b!651206 m!624805))

(declare-fun m!624859 () Bool)

(assert (=> b!651206 m!624859))

(declare-fun m!624861 () Bool)

(assert (=> b!651206 m!624861))

(assert (=> b!651206 m!624805))

(declare-fun m!624863 () Bool)

(assert (=> b!651206 m!624863))

(assert (=> b!651206 m!624805))

(declare-fun m!624865 () Bool)

(assert (=> b!651206 m!624865))

(assert (=> b!651206 m!624839))

(assert (=> b!651212 m!624805))

(assert (=> b!651212 m!624805))

(assert (=> b!651212 m!624837))

(declare-fun m!624867 () Bool)

(assert (=> b!651205 m!624867))

(check-sat (not b!651226) (not b!651214) (not b!651225) (not b!651211) (not b!651222) (not b!651221) (not b!651219) (not b!651204) (not b!651212) (not b!651206) (not b!651205) (not start!59052) (not b!651224) (not b!651207))
(check-sat)
