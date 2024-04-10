; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58438 () Bool)

(assert start!58438)

(declare-fun b!645298 () Bool)

(declare-fun e!369801 () Bool)

(declare-datatypes ((SeekEntryResult!6879 0))(
  ( (MissingZero!6879 (index!29851 (_ BitVec 32))) (Found!6879 (index!29852 (_ BitVec 32))) (Intermediate!6879 (undefined!7691 Bool) (index!29853 (_ BitVec 32)) (x!58624 (_ BitVec 32))) (Undefined!6879) (MissingVacant!6879 (index!29854 (_ BitVec 32))) )
))
(declare-fun lt!299205 () SeekEntryResult!6879)

(declare-fun lt!299208 () SeekEntryResult!6879)

(assert (=> b!645298 (= e!369801 (= lt!299205 lt!299208))))

(declare-fun b!645300 () Bool)

(declare-datatypes ((Unit!21900 0))(
  ( (Unit!21901) )
))
(declare-fun e!369803 () Unit!21900)

(declare-fun Unit!21902 () Unit!21900)

(assert (=> b!645300 (= e!369803 Unit!21902)))

(declare-fun b!645301 () Bool)

(declare-fun res!418071 () Bool)

(declare-fun e!369805 () Bool)

(assert (=> b!645301 (=> (not res!418071) (not e!369805))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38454 0))(
  ( (array!38455 (arr!18439 (Array (_ BitVec 32) (_ BitVec 64))) (size!18803 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38454)

(assert (=> b!645301 (= res!418071 (and (= (size!18803 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18803 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18803 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645302 () Bool)

(declare-fun e!369804 () Bool)

(assert (=> b!645302 (= e!369805 e!369804)))

(declare-fun res!418077 () Bool)

(assert (=> b!645302 (=> (not res!418077) (not e!369804))))

(declare-fun lt!299212 () SeekEntryResult!6879)

(assert (=> b!645302 (= res!418077 (or (= lt!299212 (MissingZero!6879 i!1108)) (= lt!299212 (MissingVacant!6879 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38454 (_ BitVec 32)) SeekEntryResult!6879)

(assert (=> b!645302 (= lt!299212 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645303 () Bool)

(declare-fun e!369799 () Bool)

(declare-fun e!369795 () Bool)

(assert (=> b!645303 (= e!369799 (not e!369795))))

(declare-fun res!418073 () Bool)

(assert (=> b!645303 (=> res!418073 e!369795)))

(declare-fun lt!299202 () SeekEntryResult!6879)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645303 (= res!418073 (not (= lt!299202 (Found!6879 index!984))))))

(declare-fun lt!299201 () Unit!21900)

(declare-fun e!369797 () Unit!21900)

(assert (=> b!645303 (= lt!299201 e!369797)))

(declare-fun c!73984 () Bool)

(assert (=> b!645303 (= c!73984 (= lt!299202 Undefined!6879))))

(declare-fun lt!299209 () array!38454)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!299199 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38454 (_ BitVec 32)) SeekEntryResult!6879)

(assert (=> b!645303 (= lt!299202 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299199 lt!299209 mask!3053))))

(assert (=> b!645303 e!369801))

(declare-fun res!418081 () Bool)

(assert (=> b!645303 (=> (not res!418081) (not e!369801))))

(declare-fun lt!299197 () (_ BitVec 32))

(assert (=> b!645303 (= res!418081 (= lt!299208 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299197 vacantSpotIndex!68 lt!299199 lt!299209 mask!3053)))))

(assert (=> b!645303 (= lt!299208 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299197 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645303 (= lt!299199 (select (store (arr!18439 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299210 () Unit!21900)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38454 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21900)

(assert (=> b!645303 (= lt!299210 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299197 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645303 (= lt!299197 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645304 () Bool)

(declare-fun e!369798 () Bool)

(declare-fun e!369807 () Bool)

(assert (=> b!645304 (= e!369798 e!369807)))

(declare-fun res!418070 () Bool)

(assert (=> b!645304 (=> res!418070 e!369807)))

(assert (=> b!645304 (= res!418070 (bvsge index!984 j!136))))

(declare-fun lt!299207 () Unit!21900)

(assert (=> b!645304 (= lt!299207 e!369803)))

(declare-fun c!73985 () Bool)

(assert (=> b!645304 (= c!73985 (bvslt j!136 index!984))))

(declare-fun b!645305 () Bool)

(declare-fun res!418069 () Bool)

(assert (=> b!645305 (=> (not res!418069) (not e!369805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645305 (= res!418069 (validKeyInArray!0 k0!1786))))

(declare-fun b!645306 () Bool)

(declare-fun Unit!21903 () Unit!21900)

(assert (=> b!645306 (= e!369803 Unit!21903)))

(declare-fun lt!299198 () Unit!21900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21900)

(assert (=> b!645306 (= lt!299198 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299209 (select (arr!18439 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645306 (arrayContainsKey!0 lt!299209 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299203 () Unit!21900)

(declare-datatypes ((List!12480 0))(
  ( (Nil!12477) (Cons!12476 (h!13521 (_ BitVec 64)) (t!18708 List!12480)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12480) Unit!21900)

(assert (=> b!645306 (= lt!299203 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12477))))

(declare-fun arrayNoDuplicates!0 (array!38454 (_ BitVec 32) List!12480) Bool)

(assert (=> b!645306 (arrayNoDuplicates!0 lt!299209 #b00000000000000000000000000000000 Nil!12477)))

(declare-fun lt!299211 () Unit!21900)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38454 (_ BitVec 32) (_ BitVec 32)) Unit!21900)

(assert (=> b!645306 (= lt!299211 (lemmaNoDuplicateFromThenFromBigger!0 lt!299209 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645306 (arrayNoDuplicates!0 lt!299209 j!136 Nil!12477)))

(declare-fun lt!299204 () Unit!21900)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38454 (_ BitVec 64) (_ BitVec 32) List!12480) Unit!21900)

(assert (=> b!645306 (= lt!299204 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299209 (select (arr!18439 a!2986) j!136) j!136 Nil!12477))))

(assert (=> b!645306 false))

(declare-fun b!645307 () Bool)

(declare-fun res!418076 () Bool)

(assert (=> b!645307 (=> (not res!418076) (not e!369805))))

(assert (=> b!645307 (= res!418076 (validKeyInArray!0 (select (arr!18439 a!2986) j!136)))))

(declare-fun b!645308 () Bool)

(assert (=> b!645308 (= e!369807 true)))

(assert (=> b!645308 (arrayContainsKey!0 lt!299209 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299200 () Unit!21900)

(assert (=> b!645308 (= lt!299200 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299209 (select (arr!18439 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!369793 () Bool)

(assert (=> b!645308 e!369793))

(declare-fun res!418072 () Bool)

(assert (=> b!645308 (=> (not res!418072) (not e!369793))))

(assert (=> b!645308 (= res!418072 (arrayContainsKey!0 lt!299209 (select (arr!18439 a!2986) j!136) j!136))))

(declare-fun b!645309 () Bool)

(declare-fun res!418074 () Bool)

(assert (=> b!645309 (=> (not res!418074) (not e!369804))))

(assert (=> b!645309 (= res!418074 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12477))))

(declare-fun b!645299 () Bool)

(declare-fun e!369802 () Bool)

(declare-fun e!369806 () Bool)

(assert (=> b!645299 (= e!369802 e!369806)))

(declare-fun res!418064 () Bool)

(assert (=> b!645299 (=> (not res!418064) (not e!369806))))

(assert (=> b!645299 (= res!418064 (arrayContainsKey!0 lt!299209 (select (arr!18439 a!2986) j!136) j!136))))

(declare-fun res!418065 () Bool)

(assert (=> start!58438 (=> (not res!418065) (not e!369805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58438 (= res!418065 (validMask!0 mask!3053))))

(assert (=> start!58438 e!369805))

(assert (=> start!58438 true))

(declare-fun array_inv!14235 (array!38454) Bool)

(assert (=> start!58438 (array_inv!14235 a!2986)))

(declare-fun b!645310 () Bool)

(declare-fun e!369800 () Bool)

(assert (=> b!645310 (= e!369800 e!369799)))

(declare-fun res!418078 () Bool)

(assert (=> b!645310 (=> (not res!418078) (not e!369799))))

(assert (=> b!645310 (= res!418078 (and (= lt!299205 (Found!6879 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18439 a!2986) index!984) (select (arr!18439 a!2986) j!136))) (not (= (select (arr!18439 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645310 (= lt!299205 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645311 () Bool)

(declare-fun Unit!21904 () Unit!21900)

(assert (=> b!645311 (= e!369797 Unit!21904)))

(declare-fun b!645312 () Bool)

(assert (=> b!645312 (= e!369804 e!369800)))

(declare-fun res!418068 () Bool)

(assert (=> b!645312 (=> (not res!418068) (not e!369800))))

(assert (=> b!645312 (= res!418068 (= (select (store (arr!18439 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645312 (= lt!299209 (array!38455 (store (arr!18439 a!2986) i!1108 k0!1786) (size!18803 a!2986)))))

(declare-fun b!645313 () Bool)

(declare-fun Unit!21905 () Unit!21900)

(assert (=> b!645313 (= e!369797 Unit!21905)))

(assert (=> b!645313 false))

(declare-fun b!645314 () Bool)

(assert (=> b!645314 (= e!369795 e!369798)))

(declare-fun res!418067 () Bool)

(assert (=> b!645314 (=> res!418067 e!369798)))

(declare-fun lt!299206 () (_ BitVec 64))

(assert (=> b!645314 (= res!418067 (or (not (= (select (arr!18439 a!2986) j!136) lt!299199)) (not (= (select (arr!18439 a!2986) j!136) lt!299206))))))

(declare-fun e!369796 () Bool)

(assert (=> b!645314 e!369796))

(declare-fun res!418079 () Bool)

(assert (=> b!645314 (=> (not res!418079) (not e!369796))))

(assert (=> b!645314 (= res!418079 (= lt!299206 (select (arr!18439 a!2986) j!136)))))

(assert (=> b!645314 (= lt!299206 (select (store (arr!18439 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645315 () Bool)

(declare-fun res!418075 () Bool)

(assert (=> b!645315 (=> (not res!418075) (not e!369805))))

(assert (=> b!645315 (= res!418075 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645316 () Bool)

(assert (=> b!645316 (= e!369796 e!369802)))

(declare-fun res!418066 () Bool)

(assert (=> b!645316 (=> res!418066 e!369802)))

(assert (=> b!645316 (= res!418066 (or (not (= (select (arr!18439 a!2986) j!136) lt!299199)) (not (= (select (arr!18439 a!2986) j!136) lt!299206)) (bvsge j!136 index!984)))))

(declare-fun b!645317 () Bool)

(assert (=> b!645317 (= e!369806 (arrayContainsKey!0 lt!299209 (select (arr!18439 a!2986) j!136) index!984))))

(declare-fun b!645318 () Bool)

(assert (=> b!645318 (= e!369793 (arrayContainsKey!0 lt!299209 (select (arr!18439 a!2986) j!136) index!984))))

(declare-fun b!645319 () Bool)

(declare-fun res!418082 () Bool)

(assert (=> b!645319 (=> (not res!418082) (not e!369804))))

(assert (=> b!645319 (= res!418082 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18439 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645320 () Bool)

(declare-fun res!418080 () Bool)

(assert (=> b!645320 (=> (not res!418080) (not e!369804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38454 (_ BitVec 32)) Bool)

(assert (=> b!645320 (= res!418080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58438 res!418065) b!645301))

(assert (= (and b!645301 res!418071) b!645307))

(assert (= (and b!645307 res!418076) b!645305))

(assert (= (and b!645305 res!418069) b!645315))

(assert (= (and b!645315 res!418075) b!645302))

(assert (= (and b!645302 res!418077) b!645320))

(assert (= (and b!645320 res!418080) b!645309))

(assert (= (and b!645309 res!418074) b!645319))

(assert (= (and b!645319 res!418082) b!645312))

(assert (= (and b!645312 res!418068) b!645310))

(assert (= (and b!645310 res!418078) b!645303))

(assert (= (and b!645303 res!418081) b!645298))

(assert (= (and b!645303 c!73984) b!645313))

(assert (= (and b!645303 (not c!73984)) b!645311))

(assert (= (and b!645303 (not res!418073)) b!645314))

(assert (= (and b!645314 res!418079) b!645316))

(assert (= (and b!645316 (not res!418066)) b!645299))

(assert (= (and b!645299 res!418064) b!645317))

(assert (= (and b!645314 (not res!418067)) b!645304))

(assert (= (and b!645304 c!73985) b!645306))

(assert (= (and b!645304 (not c!73985)) b!645300))

(assert (= (and b!645304 (not res!418070)) b!645308))

(assert (= (and b!645308 res!418072) b!645318))

(declare-fun m!618825 () Bool)

(assert (=> b!645315 m!618825))

(declare-fun m!618827 () Bool)

(assert (=> b!645306 m!618827))

(declare-fun m!618829 () Bool)

(assert (=> b!645306 m!618829))

(assert (=> b!645306 m!618829))

(declare-fun m!618831 () Bool)

(assert (=> b!645306 m!618831))

(declare-fun m!618833 () Bool)

(assert (=> b!645306 m!618833))

(assert (=> b!645306 m!618829))

(declare-fun m!618835 () Bool)

(assert (=> b!645306 m!618835))

(declare-fun m!618837 () Bool)

(assert (=> b!645306 m!618837))

(declare-fun m!618839 () Bool)

(assert (=> b!645306 m!618839))

(assert (=> b!645306 m!618829))

(declare-fun m!618841 () Bool)

(assert (=> b!645306 m!618841))

(declare-fun m!618843 () Bool)

(assert (=> b!645309 m!618843))

(declare-fun m!618845 () Bool)

(assert (=> b!645312 m!618845))

(declare-fun m!618847 () Bool)

(assert (=> b!645312 m!618847))

(declare-fun m!618849 () Bool)

(assert (=> b!645319 m!618849))

(declare-fun m!618851 () Bool)

(assert (=> b!645303 m!618851))

(declare-fun m!618853 () Bool)

(assert (=> b!645303 m!618853))

(assert (=> b!645303 m!618829))

(assert (=> b!645303 m!618845))

(assert (=> b!645303 m!618829))

(declare-fun m!618855 () Bool)

(assert (=> b!645303 m!618855))

(declare-fun m!618857 () Bool)

(assert (=> b!645303 m!618857))

(declare-fun m!618859 () Bool)

(assert (=> b!645303 m!618859))

(declare-fun m!618861 () Bool)

(assert (=> b!645303 m!618861))

(assert (=> b!645314 m!618829))

(assert (=> b!645314 m!618845))

(declare-fun m!618863 () Bool)

(assert (=> b!645314 m!618863))

(assert (=> b!645317 m!618829))

(assert (=> b!645317 m!618829))

(declare-fun m!618865 () Bool)

(assert (=> b!645317 m!618865))

(declare-fun m!618867 () Bool)

(assert (=> b!645320 m!618867))

(assert (=> b!645307 m!618829))

(assert (=> b!645307 m!618829))

(declare-fun m!618869 () Bool)

(assert (=> b!645307 m!618869))

(declare-fun m!618871 () Bool)

(assert (=> b!645310 m!618871))

(assert (=> b!645310 m!618829))

(assert (=> b!645310 m!618829))

(declare-fun m!618873 () Bool)

(assert (=> b!645310 m!618873))

(assert (=> b!645299 m!618829))

(assert (=> b!645299 m!618829))

(declare-fun m!618875 () Bool)

(assert (=> b!645299 m!618875))

(assert (=> b!645316 m!618829))

(assert (=> b!645318 m!618829))

(assert (=> b!645318 m!618829))

(assert (=> b!645318 m!618865))

(declare-fun m!618877 () Bool)

(assert (=> b!645305 m!618877))

(declare-fun m!618879 () Bool)

(assert (=> b!645302 m!618879))

(declare-fun m!618881 () Bool)

(assert (=> start!58438 m!618881))

(declare-fun m!618883 () Bool)

(assert (=> start!58438 m!618883))

(assert (=> b!645308 m!618829))

(assert (=> b!645308 m!618829))

(declare-fun m!618885 () Bool)

(assert (=> b!645308 m!618885))

(assert (=> b!645308 m!618829))

(declare-fun m!618887 () Bool)

(assert (=> b!645308 m!618887))

(assert (=> b!645308 m!618829))

(assert (=> b!645308 m!618875))

(check-sat (not b!645306) (not start!58438) (not b!645315) (not b!645309) (not b!645310) (not b!645308) (not b!645303) (not b!645307) (not b!645317) (not b!645302) (not b!645318) (not b!645305) (not b!645299) (not b!645320))
(check-sat)
