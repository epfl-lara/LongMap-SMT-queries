; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69574 () Bool)

(assert start!69574)

(declare-fun b!810931 () Bool)

(declare-fun res!554218 () Bool)

(declare-fun e!448835 () Bool)

(assert (=> b!810931 (=> (not res!554218) (not e!448835))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44070 0))(
  ( (array!44071 (arr!21106 (Array (_ BitVec 32) (_ BitVec 64))) (size!21527 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44070)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!810931 (= res!554218 (and (= (size!21527 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21527 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21527 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810933 () Bool)

(declare-fun res!554216 () Bool)

(declare-fun e!448836 () Bool)

(assert (=> b!810933 (=> (not res!554216) (not e!448836))))

(declare-datatypes ((List!15069 0))(
  ( (Nil!15066) (Cons!15065 (h!16194 (_ BitVec 64)) (t!21384 List!15069)) )
))
(declare-fun arrayNoDuplicates!0 (array!44070 (_ BitVec 32) List!15069) Bool)

(assert (=> b!810933 (= res!554216 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15066))))

(declare-fun b!810934 () Bool)

(declare-fun e!448837 () Bool)

(declare-fun e!448833 () Bool)

(assert (=> b!810934 (= e!448837 e!448833)))

(declare-fun res!554219 () Bool)

(assert (=> b!810934 (=> (not res!554219) (not e!448833))))

(declare-datatypes ((SeekEntryResult!8697 0))(
  ( (MissingZero!8697 (index!37156 (_ BitVec 32))) (Found!8697 (index!37157 (_ BitVec 32))) (Intermediate!8697 (undefined!9509 Bool) (index!37158 (_ BitVec 32)) (x!67965 (_ BitVec 32))) (Undefined!8697) (MissingVacant!8697 (index!37159 (_ BitVec 32))) )
))
(declare-fun lt!363548 () SeekEntryResult!8697)

(declare-fun lt!363552 () SeekEntryResult!8697)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810934 (= res!554219 (and (= lt!363548 lt!363552) (not (= (select (arr!21106 a!3170) index!1236) (select (arr!21106 a!3170) j!153)))))))

(assert (=> b!810934 (= lt!363552 (Found!8697 j!153))))

(declare-fun b!810935 () Bool)

(declare-fun e!448834 () Bool)

(assert (=> b!810935 (= e!448836 e!448834)))

(declare-fun res!554212 () Bool)

(assert (=> b!810935 (=> (not res!554212) (not e!448834))))

(declare-fun lt!363550 () SeekEntryResult!8697)

(declare-fun lt!363551 () SeekEntryResult!8697)

(assert (=> b!810935 (= res!554212 (= lt!363550 lt!363551))))

(declare-fun lt!363554 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363545 () array!44070)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44070 (_ BitVec 32)) SeekEntryResult!8697)

(assert (=> b!810935 (= lt!363551 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363554 lt!363545 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44070 (_ BitVec 32)) SeekEntryResult!8697)

(assert (=> b!810935 (= lt!363550 (seekEntryOrOpen!0 lt!363554 lt!363545 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810935 (= lt!363554 (select (store (arr!21106 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810935 (= lt!363545 (array!44071 (store (arr!21106 a!3170) i!1163 k0!2044) (size!21527 a!3170)))))

(declare-fun b!810936 () Bool)

(declare-fun res!554210 () Bool)

(assert (=> b!810936 (=> (not res!554210) (not e!448835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810936 (= res!554210 (validKeyInArray!0 k0!2044))))

(declare-fun res!554208 () Bool)

(assert (=> start!69574 (=> (not res!554208) (not e!448835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69574 (= res!554208 (validMask!0 mask!3266))))

(assert (=> start!69574 e!448835))

(assert (=> start!69574 true))

(declare-fun array_inv!16902 (array!44070) Bool)

(assert (=> start!69574 (array_inv!16902 a!3170)))

(declare-fun b!810932 () Bool)

(declare-fun res!554214 () Bool)

(assert (=> b!810932 (=> (not res!554214) (not e!448836))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810932 (= res!554214 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21527 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21106 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21527 a!3170)) (= (select (arr!21106 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810937 () Bool)

(declare-fun res!554217 () Bool)

(assert (=> b!810937 (=> (not res!554217) (not e!448836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44070 (_ BitVec 32)) Bool)

(assert (=> b!810937 (= res!554217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810938 () Bool)

(assert (=> b!810938 (= e!448835 e!448836)))

(declare-fun res!554209 () Bool)

(assert (=> b!810938 (=> (not res!554209) (not e!448836))))

(declare-fun lt!363549 () SeekEntryResult!8697)

(assert (=> b!810938 (= res!554209 (or (= lt!363549 (MissingZero!8697 i!1163)) (= lt!363549 (MissingVacant!8697 i!1163))))))

(assert (=> b!810938 (= lt!363549 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810939 () Bool)

(declare-fun res!554211 () Bool)

(assert (=> b!810939 (=> (not res!554211) (not e!448835))))

(declare-fun arrayContainsKey!0 (array!44070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810939 (= res!554211 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810940 () Bool)

(declare-fun res!554215 () Bool)

(assert (=> b!810940 (=> (not res!554215) (not e!448835))))

(assert (=> b!810940 (= res!554215 (validKeyInArray!0 (select (arr!21106 a!3170) j!153)))))

(declare-fun b!810941 () Bool)

(assert (=> b!810941 (= e!448834 e!448837)))

(declare-fun res!554213 () Bool)

(assert (=> b!810941 (=> (not res!554213) (not e!448837))))

(declare-fun lt!363546 () SeekEntryResult!8697)

(assert (=> b!810941 (= res!554213 (= lt!363546 lt!363548))))

(assert (=> b!810941 (= lt!363548 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810941 (= lt!363546 (seekEntryOrOpen!0 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810942 () Bool)

(assert (=> b!810942 (= e!448833 (not (= lt!363551 lt!363552)))))

(declare-fun lt!363553 () (_ BitVec 32))

(assert (=> b!810942 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantAfter!23 lt!363554 lt!363545 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27656 0))(
  ( (Unit!27657) )
))
(declare-fun lt!363547 () Unit!27656)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27656)

(assert (=> b!810942 (= lt!363547 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363553 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810942 (= lt!363553 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69574 res!554208) b!810931))

(assert (= (and b!810931 res!554218) b!810940))

(assert (= (and b!810940 res!554215) b!810936))

(assert (= (and b!810936 res!554210) b!810939))

(assert (= (and b!810939 res!554211) b!810938))

(assert (= (and b!810938 res!554209) b!810937))

(assert (= (and b!810937 res!554217) b!810933))

(assert (= (and b!810933 res!554216) b!810932))

(assert (= (and b!810932 res!554214) b!810935))

(assert (= (and b!810935 res!554212) b!810941))

(assert (= (and b!810941 res!554213) b!810934))

(assert (= (and b!810934 res!554219) b!810942))

(declare-fun m!753229 () Bool)

(assert (=> b!810942 m!753229))

(declare-fun m!753231 () Bool)

(assert (=> b!810942 m!753231))

(assert (=> b!810942 m!753229))

(declare-fun m!753233 () Bool)

(assert (=> b!810942 m!753233))

(declare-fun m!753235 () Bool)

(assert (=> b!810942 m!753235))

(declare-fun m!753237 () Bool)

(assert (=> b!810942 m!753237))

(assert (=> b!810941 m!753229))

(assert (=> b!810941 m!753229))

(declare-fun m!753239 () Bool)

(assert (=> b!810941 m!753239))

(assert (=> b!810941 m!753229))

(declare-fun m!753241 () Bool)

(assert (=> b!810941 m!753241))

(declare-fun m!753243 () Bool)

(assert (=> b!810939 m!753243))

(declare-fun m!753245 () Bool)

(assert (=> b!810936 m!753245))

(declare-fun m!753247 () Bool)

(assert (=> b!810935 m!753247))

(declare-fun m!753249 () Bool)

(assert (=> b!810935 m!753249))

(declare-fun m!753251 () Bool)

(assert (=> b!810935 m!753251))

(declare-fun m!753253 () Bool)

(assert (=> b!810935 m!753253))

(declare-fun m!753255 () Bool)

(assert (=> b!810937 m!753255))

(assert (=> b!810940 m!753229))

(assert (=> b!810940 m!753229))

(declare-fun m!753257 () Bool)

(assert (=> b!810940 m!753257))

(declare-fun m!753259 () Bool)

(assert (=> b!810938 m!753259))

(declare-fun m!753261 () Bool)

(assert (=> start!69574 m!753261))

(declare-fun m!753263 () Bool)

(assert (=> start!69574 m!753263))

(declare-fun m!753265 () Bool)

(assert (=> b!810934 m!753265))

(assert (=> b!810934 m!753229))

(declare-fun m!753267 () Bool)

(assert (=> b!810933 m!753267))

(declare-fun m!753269 () Bool)

(assert (=> b!810932 m!753269))

(declare-fun m!753271 () Bool)

(assert (=> b!810932 m!753271))

(check-sat (not b!810939) (not b!810933) (not b!810935) (not b!810942) (not b!810938) (not b!810940) (not b!810937) (not start!69574) (not b!810936) (not b!810941))
(check-sat)
(get-model)

(declare-fun b!810991 () Bool)

(declare-fun e!448864 () SeekEntryResult!8697)

(assert (=> b!810991 (= e!448864 Undefined!8697)))

(declare-fun lt!363590 () SeekEntryResult!8697)

(declare-fun d!104101 () Bool)

(get-info :version)

(assert (=> d!104101 (and (or ((_ is Undefined!8697) lt!363590) (not ((_ is Found!8697) lt!363590)) (and (bvsge (index!37157 lt!363590) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363590) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363590) ((_ is Found!8697) lt!363590) (not ((_ is MissingVacant!8697) lt!363590)) (not (= (index!37159 lt!363590) vacantAfter!23)) (and (bvsge (index!37159 lt!363590) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363590) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363590) (ite ((_ is Found!8697) lt!363590) (= (select (arr!21106 lt!363545) (index!37157 lt!363590)) lt!363554) (and ((_ is MissingVacant!8697) lt!363590) (= (index!37159 lt!363590) vacantAfter!23) (= (select (arr!21106 lt!363545) (index!37159 lt!363590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104101 (= lt!363590 e!448864)))

(declare-fun c!88778 () Bool)

(assert (=> d!104101 (= c!88778 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363589 () (_ BitVec 64))

(assert (=> d!104101 (= lt!363589 (select (arr!21106 lt!363545) index!1236))))

(assert (=> d!104101 (validMask!0 mask!3266)))

(assert (=> d!104101 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363554 lt!363545 mask!3266) lt!363590)))

(declare-fun b!810992 () Bool)

(declare-fun e!448865 () SeekEntryResult!8697)

(assert (=> b!810992 (= e!448864 e!448865)))

(declare-fun c!88779 () Bool)

(assert (=> b!810992 (= c!88779 (= lt!363589 lt!363554))))

(declare-fun b!810993 () Bool)

(declare-fun e!448863 () SeekEntryResult!8697)

(assert (=> b!810993 (= e!448863 (MissingVacant!8697 vacantAfter!23))))

(declare-fun b!810994 () Bool)

(assert (=> b!810994 (= e!448863 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!363554 lt!363545 mask!3266))))

(declare-fun b!810995 () Bool)

(declare-fun c!88780 () Bool)

(assert (=> b!810995 (= c!88780 (= lt!363589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810995 (= e!448865 e!448863)))

(declare-fun b!810996 () Bool)

(assert (=> b!810996 (= e!448865 (Found!8697 index!1236))))

(assert (= (and d!104101 c!88778) b!810991))

(assert (= (and d!104101 (not c!88778)) b!810992))

(assert (= (and b!810992 c!88779) b!810996))

(assert (= (and b!810992 (not c!88779)) b!810995))

(assert (= (and b!810995 c!88780) b!810993))

(assert (= (and b!810995 (not c!88780)) b!810994))

(declare-fun m!753317 () Bool)

(assert (=> d!104101 m!753317))

(declare-fun m!753319 () Bool)

(assert (=> d!104101 m!753319))

(declare-fun m!753321 () Bool)

(assert (=> d!104101 m!753321))

(assert (=> d!104101 m!753261))

(assert (=> b!810994 m!753231))

(assert (=> b!810994 m!753231))

(declare-fun m!753323 () Bool)

(assert (=> b!810994 m!753323))

(assert (=> b!810935 d!104101))

(declare-fun b!811057 () Bool)

(declare-fun e!448904 () SeekEntryResult!8697)

(declare-fun lt!363624 () SeekEntryResult!8697)

(assert (=> b!811057 (= e!448904 (Found!8697 (index!37158 lt!363624)))))

(declare-fun b!811058 () Bool)

(declare-fun c!88806 () Bool)

(declare-fun lt!363623 () (_ BitVec 64))

(assert (=> b!811058 (= c!88806 (= lt!363623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448902 () SeekEntryResult!8697)

(assert (=> b!811058 (= e!448904 e!448902)))

(declare-fun b!811059 () Bool)

(declare-fun e!448903 () SeekEntryResult!8697)

(assert (=> b!811059 (= e!448903 Undefined!8697)))

(declare-fun d!104107 () Bool)

(declare-fun lt!363625 () SeekEntryResult!8697)

(assert (=> d!104107 (and (or ((_ is Undefined!8697) lt!363625) (not ((_ is Found!8697) lt!363625)) (and (bvsge (index!37157 lt!363625) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363625) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363625) ((_ is Found!8697) lt!363625) (not ((_ is MissingZero!8697) lt!363625)) (and (bvsge (index!37156 lt!363625) #b00000000000000000000000000000000) (bvslt (index!37156 lt!363625) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363625) ((_ is Found!8697) lt!363625) ((_ is MissingZero!8697) lt!363625) (not ((_ is MissingVacant!8697) lt!363625)) (and (bvsge (index!37159 lt!363625) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363625) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363625) (ite ((_ is Found!8697) lt!363625) (= (select (arr!21106 lt!363545) (index!37157 lt!363625)) lt!363554) (ite ((_ is MissingZero!8697) lt!363625) (= (select (arr!21106 lt!363545) (index!37156 lt!363625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8697) lt!363625) (= (select (arr!21106 lt!363545) (index!37159 lt!363625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104107 (= lt!363625 e!448903)))

(declare-fun c!88805 () Bool)

(assert (=> d!104107 (= c!88805 (and ((_ is Intermediate!8697) lt!363624) (undefined!9509 lt!363624)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44070 (_ BitVec 32)) SeekEntryResult!8697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104107 (= lt!363624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363554 mask!3266) lt!363554 lt!363545 mask!3266))))

(assert (=> d!104107 (validMask!0 mask!3266)))

(assert (=> d!104107 (= (seekEntryOrOpen!0 lt!363554 lt!363545 mask!3266) lt!363625)))

(declare-fun b!811060 () Bool)

(assert (=> b!811060 (= e!448902 (MissingZero!8697 (index!37158 lt!363624)))))

(declare-fun b!811061 () Bool)

(assert (=> b!811061 (= e!448903 e!448904)))

(assert (=> b!811061 (= lt!363623 (select (arr!21106 lt!363545) (index!37158 lt!363624)))))

(declare-fun c!88807 () Bool)

(assert (=> b!811061 (= c!88807 (= lt!363623 lt!363554))))

(declare-fun b!811062 () Bool)

(assert (=> b!811062 (= e!448902 (seekKeyOrZeroReturnVacant!0 (x!67965 lt!363624) (index!37158 lt!363624) (index!37158 lt!363624) lt!363554 lt!363545 mask!3266))))

(assert (= (and d!104107 c!88805) b!811059))

(assert (= (and d!104107 (not c!88805)) b!811061))

(assert (= (and b!811061 c!88807) b!811057))

(assert (= (and b!811061 (not c!88807)) b!811058))

(assert (= (and b!811058 c!88806) b!811060))

(assert (= (and b!811058 (not c!88806)) b!811062))

(declare-fun m!753349 () Bool)

(assert (=> d!104107 m!753349))

(declare-fun m!753351 () Bool)

(assert (=> d!104107 m!753351))

(assert (=> d!104107 m!753261))

(assert (=> d!104107 m!753351))

(declare-fun m!753355 () Bool)

(assert (=> d!104107 m!753355))

(declare-fun m!753359 () Bool)

(assert (=> d!104107 m!753359))

(declare-fun m!753363 () Bool)

(assert (=> d!104107 m!753363))

(declare-fun m!753365 () Bool)

(assert (=> b!811061 m!753365))

(declare-fun m!753369 () Bool)

(assert (=> b!811062 m!753369))

(assert (=> b!810935 d!104107))

(declare-fun d!104113 () Bool)

(assert (=> d!104113 (= (validKeyInArray!0 (select (arr!21106 a!3170) j!153)) (and (not (= (select (arr!21106 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21106 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810940 d!104113))

(declare-fun b!811081 () Bool)

(declare-fun e!448915 () SeekEntryResult!8697)

(assert (=> b!811081 (= e!448915 Undefined!8697)))

(declare-fun lt!363633 () SeekEntryResult!8697)

(declare-fun d!104119 () Bool)

(assert (=> d!104119 (and (or ((_ is Undefined!8697) lt!363633) (not ((_ is Found!8697) lt!363633)) (and (bvsge (index!37157 lt!363633) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363633) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363633) ((_ is Found!8697) lt!363633) (not ((_ is MissingVacant!8697) lt!363633)) (not (= (index!37159 lt!363633) vacantAfter!23)) (and (bvsge (index!37159 lt!363633) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363633) (size!21527 lt!363545)))) (or ((_ is Undefined!8697) lt!363633) (ite ((_ is Found!8697) lt!363633) (= (select (arr!21106 lt!363545) (index!37157 lt!363633)) lt!363554) (and ((_ is MissingVacant!8697) lt!363633) (= (index!37159 lt!363633) vacantAfter!23) (= (select (arr!21106 lt!363545) (index!37159 lt!363633)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104119 (= lt!363633 e!448915)))

(declare-fun c!88817 () Bool)

(assert (=> d!104119 (= c!88817 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363632 () (_ BitVec 64))

(assert (=> d!104119 (= lt!363632 (select (arr!21106 lt!363545) lt!363553))))

(assert (=> d!104119 (validMask!0 mask!3266)))

(assert (=> d!104119 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantAfter!23 lt!363554 lt!363545 mask!3266) lt!363633)))

(declare-fun b!811082 () Bool)

(declare-fun e!448916 () SeekEntryResult!8697)

(assert (=> b!811082 (= e!448915 e!448916)))

(declare-fun c!88818 () Bool)

(assert (=> b!811082 (= c!88818 (= lt!363632 lt!363554))))

(declare-fun b!811083 () Bool)

(declare-fun e!448914 () SeekEntryResult!8697)

(assert (=> b!811083 (= e!448914 (MissingVacant!8697 vacantAfter!23))))

(declare-fun b!811084 () Bool)

(assert (=> b!811084 (= e!448914 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363553 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!363554 lt!363545 mask!3266))))

(declare-fun b!811085 () Bool)

(declare-fun c!88819 () Bool)

(assert (=> b!811085 (= c!88819 (= lt!363632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811085 (= e!448916 e!448914)))

(declare-fun b!811086 () Bool)

(assert (=> b!811086 (= e!448916 (Found!8697 lt!363553))))

(assert (= (and d!104119 c!88817) b!811081))

(assert (= (and d!104119 (not c!88817)) b!811082))

(assert (= (and b!811082 c!88818) b!811086))

(assert (= (and b!811082 (not c!88818)) b!811085))

(assert (= (and b!811085 c!88819) b!811083))

(assert (= (and b!811085 (not c!88819)) b!811084))

(declare-fun m!753383 () Bool)

(assert (=> d!104119 m!753383))

(declare-fun m!753387 () Bool)

(assert (=> d!104119 m!753387))

(declare-fun m!753391 () Bool)

(assert (=> d!104119 m!753391))

(assert (=> d!104119 m!753261))

(declare-fun m!753393 () Bool)

(assert (=> b!811084 m!753393))

(assert (=> b!811084 m!753393))

(declare-fun m!753395 () Bool)

(assert (=> b!811084 m!753395))

(assert (=> b!810942 d!104119))

(declare-fun b!811087 () Bool)

(declare-fun e!448918 () SeekEntryResult!8697)

(assert (=> b!811087 (= e!448918 Undefined!8697)))

(declare-fun lt!363635 () SeekEntryResult!8697)

(declare-fun d!104123 () Bool)

(assert (=> d!104123 (and (or ((_ is Undefined!8697) lt!363635) (not ((_ is Found!8697) lt!363635)) (and (bvsge (index!37157 lt!363635) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363635) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363635) ((_ is Found!8697) lt!363635) (not ((_ is MissingVacant!8697) lt!363635)) (not (= (index!37159 lt!363635) vacantBefore!23)) (and (bvsge (index!37159 lt!363635) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363635) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363635) (ite ((_ is Found!8697) lt!363635) (= (select (arr!21106 a!3170) (index!37157 lt!363635)) (select (arr!21106 a!3170) j!153)) (and ((_ is MissingVacant!8697) lt!363635) (= (index!37159 lt!363635) vacantBefore!23) (= (select (arr!21106 a!3170) (index!37159 lt!363635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104123 (= lt!363635 e!448918)))

(declare-fun c!88820 () Bool)

(assert (=> d!104123 (= c!88820 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363634 () (_ BitVec 64))

(assert (=> d!104123 (= lt!363634 (select (arr!21106 a!3170) lt!363553))))

(assert (=> d!104123 (validMask!0 mask!3266)))

(assert (=> d!104123 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266) lt!363635)))

(declare-fun b!811088 () Bool)

(declare-fun e!448919 () SeekEntryResult!8697)

(assert (=> b!811088 (= e!448918 e!448919)))

(declare-fun c!88821 () Bool)

(assert (=> b!811088 (= c!88821 (= lt!363634 (select (arr!21106 a!3170) j!153)))))

(declare-fun b!811089 () Bool)

(declare-fun e!448917 () SeekEntryResult!8697)

(assert (=> b!811089 (= e!448917 (MissingVacant!8697 vacantBefore!23))))

(declare-fun b!811090 () Bool)

(assert (=> b!811090 (= e!448917 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363553 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811091 () Bool)

(declare-fun c!88822 () Bool)

(assert (=> b!811091 (= c!88822 (= lt!363634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811091 (= e!448919 e!448917)))

(declare-fun b!811092 () Bool)

(assert (=> b!811092 (= e!448919 (Found!8697 lt!363553))))

(assert (= (and d!104123 c!88820) b!811087))

(assert (= (and d!104123 (not c!88820)) b!811088))

(assert (= (and b!811088 c!88821) b!811092))

(assert (= (and b!811088 (not c!88821)) b!811091))

(assert (= (and b!811091 c!88822) b!811089))

(assert (= (and b!811091 (not c!88822)) b!811090))

(declare-fun m!753397 () Bool)

(assert (=> d!104123 m!753397))

(declare-fun m!753399 () Bool)

(assert (=> d!104123 m!753399))

(declare-fun m!753401 () Bool)

(assert (=> d!104123 m!753401))

(assert (=> d!104123 m!753261))

(assert (=> b!811090 m!753393))

(assert (=> b!811090 m!753393))

(assert (=> b!811090 m!753229))

(declare-fun m!753403 () Bool)

(assert (=> b!811090 m!753403))

(assert (=> b!810942 d!104123))

(declare-fun d!104125 () Bool)

(declare-fun e!448925 () Bool)

(assert (=> d!104125 e!448925))

(declare-fun res!554273 () Bool)

(assert (=> d!104125 (=> (not res!554273) (not e!448925))))

(assert (=> d!104125 (= res!554273 (and (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21527 a!3170)) (and (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21527 a!3170)))) (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21527 a!3170)) (and (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21527 a!3170)))) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21527 a!3170))))))

(declare-fun lt!363641 () Unit!27656)

(declare-fun choose!112 (array!44070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27656)

(assert (=> d!104125 (= lt!363641 (choose!112 a!3170 i!1163 k0!2044 j!153 lt!363553 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(assert (=> d!104125 (validMask!0 mask!3266)))

(assert (=> d!104125 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363553 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266) lt!363641)))

(declare-fun b!811098 () Bool)

(assert (=> b!811098 (= e!448925 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantAfter!23 (select (store (arr!21106 a!3170) i!1163 k0!2044) j!153) (array!44071 (store (arr!21106 a!3170) i!1163 k0!2044) (size!21527 a!3170)) mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266)))))

(assert (= (and d!104125 res!554273) b!811098))

(declare-fun m!753409 () Bool)

(assert (=> d!104125 m!753409))

(assert (=> d!104125 m!753261))

(assert (=> b!811098 m!753229))

(assert (=> b!811098 m!753233))

(assert (=> b!811098 m!753253))

(assert (=> b!811098 m!753253))

(declare-fun m!753411 () Bool)

(assert (=> b!811098 m!753411))

(assert (=> b!811098 m!753251))

(assert (=> b!811098 m!753229))

(assert (=> b!810942 d!104125))

(declare-fun d!104129 () Bool)

(declare-fun lt!363653 () (_ BitVec 32))

(assert (=> d!104129 (and (bvsge lt!363653 #b00000000000000000000000000000000) (bvslt lt!363653 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104129 (= lt!363653 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!104129 (validMask!0 mask!3266)))

(assert (=> d!104129 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363653)))

(declare-fun bs!22451 () Bool)

(assert (= bs!22451 d!104129))

(declare-fun m!753415 () Bool)

(assert (=> bs!22451 m!753415))

(assert (=> bs!22451 m!753261))

(assert (=> b!810942 d!104129))

(declare-fun b!811115 () Bool)

(declare-fun e!448937 () SeekEntryResult!8697)

(assert (=> b!811115 (= e!448937 Undefined!8697)))

(declare-fun d!104133 () Bool)

(declare-fun lt!363655 () SeekEntryResult!8697)

(assert (=> d!104133 (and (or ((_ is Undefined!8697) lt!363655) (not ((_ is Found!8697) lt!363655)) (and (bvsge (index!37157 lt!363655) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363655) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363655) ((_ is Found!8697) lt!363655) (not ((_ is MissingVacant!8697) lt!363655)) (not (= (index!37159 lt!363655) vacantBefore!23)) (and (bvsge (index!37159 lt!363655) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363655) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363655) (ite ((_ is Found!8697) lt!363655) (= (select (arr!21106 a!3170) (index!37157 lt!363655)) (select (arr!21106 a!3170) j!153)) (and ((_ is MissingVacant!8697) lt!363655) (= (index!37159 lt!363655) vacantBefore!23) (= (select (arr!21106 a!3170) (index!37159 lt!363655)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104133 (= lt!363655 e!448937)))

(declare-fun c!88829 () Bool)

(assert (=> d!104133 (= c!88829 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363654 () (_ BitVec 64))

(assert (=> d!104133 (= lt!363654 (select (arr!21106 a!3170) index!1236))))

(assert (=> d!104133 (validMask!0 mask!3266)))

(assert (=> d!104133 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266) lt!363655)))

(declare-fun b!811116 () Bool)

(declare-fun e!448938 () SeekEntryResult!8697)

(assert (=> b!811116 (= e!448937 e!448938)))

(declare-fun c!88830 () Bool)

(assert (=> b!811116 (= c!88830 (= lt!363654 (select (arr!21106 a!3170) j!153)))))

(declare-fun b!811117 () Bool)

(declare-fun e!448936 () SeekEntryResult!8697)

(assert (=> b!811117 (= e!448936 (MissingVacant!8697 vacantBefore!23))))

(declare-fun b!811118 () Bool)

(assert (=> b!811118 (= e!448936 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811119 () Bool)

(declare-fun c!88831 () Bool)

(assert (=> b!811119 (= c!88831 (= lt!363654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811119 (= e!448938 e!448936)))

(declare-fun b!811120 () Bool)

(assert (=> b!811120 (= e!448938 (Found!8697 index!1236))))

(assert (= (and d!104133 c!88829) b!811115))

(assert (= (and d!104133 (not c!88829)) b!811116))

(assert (= (and b!811116 c!88830) b!811120))

(assert (= (and b!811116 (not c!88830)) b!811119))

(assert (= (and b!811119 c!88831) b!811117))

(assert (= (and b!811119 (not c!88831)) b!811118))

(declare-fun m!753419 () Bool)

(assert (=> d!104133 m!753419))

(declare-fun m!753421 () Bool)

(assert (=> d!104133 m!753421))

(assert (=> d!104133 m!753265))

(assert (=> d!104133 m!753261))

(assert (=> b!811118 m!753231))

(assert (=> b!811118 m!753231))

(assert (=> b!811118 m!753229))

(declare-fun m!753423 () Bool)

(assert (=> b!811118 m!753423))

(assert (=> b!810941 d!104133))

(declare-fun b!811123 () Bool)

(declare-fun e!448943 () SeekEntryResult!8697)

(declare-fun lt!363657 () SeekEntryResult!8697)

(assert (=> b!811123 (= e!448943 (Found!8697 (index!37158 lt!363657)))))

(declare-fun b!811124 () Bool)

(declare-fun c!88833 () Bool)

(declare-fun lt!363656 () (_ BitVec 64))

(assert (=> b!811124 (= c!88833 (= lt!363656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448941 () SeekEntryResult!8697)

(assert (=> b!811124 (= e!448943 e!448941)))

(declare-fun b!811125 () Bool)

(declare-fun e!448942 () SeekEntryResult!8697)

(assert (=> b!811125 (= e!448942 Undefined!8697)))

(declare-fun d!104137 () Bool)

(declare-fun lt!363658 () SeekEntryResult!8697)

(assert (=> d!104137 (and (or ((_ is Undefined!8697) lt!363658) (not ((_ is Found!8697) lt!363658)) (and (bvsge (index!37157 lt!363658) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363658) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363658) ((_ is Found!8697) lt!363658) (not ((_ is MissingZero!8697) lt!363658)) (and (bvsge (index!37156 lt!363658) #b00000000000000000000000000000000) (bvslt (index!37156 lt!363658) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363658) ((_ is Found!8697) lt!363658) ((_ is MissingZero!8697) lt!363658) (not ((_ is MissingVacant!8697) lt!363658)) (and (bvsge (index!37159 lt!363658) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363658) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363658) (ite ((_ is Found!8697) lt!363658) (= (select (arr!21106 a!3170) (index!37157 lt!363658)) (select (arr!21106 a!3170) j!153)) (ite ((_ is MissingZero!8697) lt!363658) (= (select (arr!21106 a!3170) (index!37156 lt!363658)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8697) lt!363658) (= (select (arr!21106 a!3170) (index!37159 lt!363658)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104137 (= lt!363658 e!448942)))

(declare-fun c!88832 () Bool)

(assert (=> d!104137 (= c!88832 (and ((_ is Intermediate!8697) lt!363657) (undefined!9509 lt!363657)))))

(assert (=> d!104137 (= lt!363657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21106 a!3170) j!153) mask!3266) (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104137 (validMask!0 mask!3266)))

(assert (=> d!104137 (= (seekEntryOrOpen!0 (select (arr!21106 a!3170) j!153) a!3170 mask!3266) lt!363658)))

(declare-fun b!811126 () Bool)

(assert (=> b!811126 (= e!448941 (MissingZero!8697 (index!37158 lt!363657)))))

(declare-fun b!811127 () Bool)

(assert (=> b!811127 (= e!448942 e!448943)))

(assert (=> b!811127 (= lt!363656 (select (arr!21106 a!3170) (index!37158 lt!363657)))))

(declare-fun c!88834 () Bool)

(assert (=> b!811127 (= c!88834 (= lt!363656 (select (arr!21106 a!3170) j!153)))))

(declare-fun b!811128 () Bool)

(assert (=> b!811128 (= e!448941 (seekKeyOrZeroReturnVacant!0 (x!67965 lt!363657) (index!37158 lt!363657) (index!37158 lt!363657) (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!104137 c!88832) b!811125))

(assert (= (and d!104137 (not c!88832)) b!811127))

(assert (= (and b!811127 c!88834) b!811123))

(assert (= (and b!811127 (not c!88834)) b!811124))

(assert (= (and b!811124 c!88833) b!811126))

(assert (= (and b!811124 (not c!88833)) b!811128))

(declare-fun m!753425 () Bool)

(assert (=> d!104137 m!753425))

(assert (=> d!104137 m!753229))

(declare-fun m!753427 () Bool)

(assert (=> d!104137 m!753427))

(assert (=> d!104137 m!753261))

(assert (=> d!104137 m!753427))

(assert (=> d!104137 m!753229))

(declare-fun m!753429 () Bool)

(assert (=> d!104137 m!753429))

(declare-fun m!753431 () Bool)

(assert (=> d!104137 m!753431))

(declare-fun m!753433 () Bool)

(assert (=> d!104137 m!753433))

(declare-fun m!753435 () Bool)

(assert (=> b!811127 m!753435))

(assert (=> b!811128 m!753229))

(declare-fun m!753437 () Bool)

(assert (=> b!811128 m!753437))

(assert (=> b!810941 d!104137))

(declare-fun d!104141 () Bool)

(assert (=> d!104141 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810936 d!104141))

(declare-fun b!811129 () Bool)

(declare-fun e!448946 () SeekEntryResult!8697)

(declare-fun lt!363660 () SeekEntryResult!8697)

(assert (=> b!811129 (= e!448946 (Found!8697 (index!37158 lt!363660)))))

(declare-fun b!811130 () Bool)

(declare-fun c!88836 () Bool)

(declare-fun lt!363659 () (_ BitVec 64))

(assert (=> b!811130 (= c!88836 (= lt!363659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448944 () SeekEntryResult!8697)

(assert (=> b!811130 (= e!448946 e!448944)))

(declare-fun b!811131 () Bool)

(declare-fun e!448945 () SeekEntryResult!8697)

(assert (=> b!811131 (= e!448945 Undefined!8697)))

(declare-fun d!104143 () Bool)

(declare-fun lt!363661 () SeekEntryResult!8697)

(assert (=> d!104143 (and (or ((_ is Undefined!8697) lt!363661) (not ((_ is Found!8697) lt!363661)) (and (bvsge (index!37157 lt!363661) #b00000000000000000000000000000000) (bvslt (index!37157 lt!363661) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363661) ((_ is Found!8697) lt!363661) (not ((_ is MissingZero!8697) lt!363661)) (and (bvsge (index!37156 lt!363661) #b00000000000000000000000000000000) (bvslt (index!37156 lt!363661) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363661) ((_ is Found!8697) lt!363661) ((_ is MissingZero!8697) lt!363661) (not ((_ is MissingVacant!8697) lt!363661)) (and (bvsge (index!37159 lt!363661) #b00000000000000000000000000000000) (bvslt (index!37159 lt!363661) (size!21527 a!3170)))) (or ((_ is Undefined!8697) lt!363661) (ite ((_ is Found!8697) lt!363661) (= (select (arr!21106 a!3170) (index!37157 lt!363661)) k0!2044) (ite ((_ is MissingZero!8697) lt!363661) (= (select (arr!21106 a!3170) (index!37156 lt!363661)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8697) lt!363661) (= (select (arr!21106 a!3170) (index!37159 lt!363661)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104143 (= lt!363661 e!448945)))

(declare-fun c!88835 () Bool)

(assert (=> d!104143 (= c!88835 (and ((_ is Intermediate!8697) lt!363660) (undefined!9509 lt!363660)))))

(assert (=> d!104143 (= lt!363660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104143 (validMask!0 mask!3266)))

(assert (=> d!104143 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!363661)))

(declare-fun b!811132 () Bool)

(assert (=> b!811132 (= e!448944 (MissingZero!8697 (index!37158 lt!363660)))))

(declare-fun b!811133 () Bool)

(assert (=> b!811133 (= e!448945 e!448946)))

(assert (=> b!811133 (= lt!363659 (select (arr!21106 a!3170) (index!37158 lt!363660)))))

(declare-fun c!88837 () Bool)

(assert (=> b!811133 (= c!88837 (= lt!363659 k0!2044))))

(declare-fun b!811134 () Bool)

(assert (=> b!811134 (= e!448944 (seekKeyOrZeroReturnVacant!0 (x!67965 lt!363660) (index!37158 lt!363660) (index!37158 lt!363660) k0!2044 a!3170 mask!3266))))

(assert (= (and d!104143 c!88835) b!811131))

(assert (= (and d!104143 (not c!88835)) b!811133))

(assert (= (and b!811133 c!88837) b!811129))

(assert (= (and b!811133 (not c!88837)) b!811130))

(assert (= (and b!811130 c!88836) b!811132))

(assert (= (and b!811130 (not c!88836)) b!811134))

(declare-fun m!753439 () Bool)

(assert (=> d!104143 m!753439))

(declare-fun m!753441 () Bool)

(assert (=> d!104143 m!753441))

(assert (=> d!104143 m!753261))

(assert (=> d!104143 m!753441))

(declare-fun m!753443 () Bool)

(assert (=> d!104143 m!753443))

(declare-fun m!753445 () Bool)

(assert (=> d!104143 m!753445))

(declare-fun m!753447 () Bool)

(assert (=> d!104143 m!753447))

(declare-fun m!753449 () Bool)

(assert (=> b!811133 m!753449))

(declare-fun m!753453 () Bool)

(assert (=> b!811134 m!753453))

(assert (=> b!810938 d!104143))

(declare-fun b!811173 () Bool)

(declare-fun e!448972 () Bool)

(declare-fun e!448973 () Bool)

(assert (=> b!811173 (= e!448972 e!448973)))

(declare-fun lt!363680 () (_ BitVec 64))

(assert (=> b!811173 (= lt!363680 (select (arr!21106 a!3170) #b00000000000000000000000000000000))))

(declare-fun lt!363681 () Unit!27656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44070 (_ BitVec 64) (_ BitVec 32)) Unit!27656)

(assert (=> b!811173 (= lt!363681 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363680 #b00000000000000000000000000000000))))

(assert (=> b!811173 (arrayContainsKey!0 a!3170 lt!363680 #b00000000000000000000000000000000)))

(declare-fun lt!363679 () Unit!27656)

(assert (=> b!811173 (= lt!363679 lt!363681)))

(declare-fun res!554290 () Bool)

(assert (=> b!811173 (= res!554290 (= (seekEntryOrOpen!0 (select (arr!21106 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8697 #b00000000000000000000000000000000)))))

(assert (=> b!811173 (=> (not res!554290) (not e!448973))))

(declare-fun d!104145 () Bool)

(declare-fun res!554291 () Bool)

(declare-fun e!448971 () Bool)

(assert (=> d!104145 (=> res!554291 e!448971)))

(assert (=> d!104145 (= res!554291 (bvsge #b00000000000000000000000000000000 (size!21527 a!3170)))))

(assert (=> d!104145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448971)))

(declare-fun bm!35460 () Bool)

(declare-fun call!35463 () Bool)

(assert (=> bm!35460 (= call!35463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!811174 () Bool)

(assert (=> b!811174 (= e!448972 call!35463)))

(declare-fun b!811175 () Bool)

(assert (=> b!811175 (= e!448973 call!35463)))

(declare-fun b!811176 () Bool)

(assert (=> b!811176 (= e!448971 e!448972)))

(declare-fun c!88852 () Bool)

(assert (=> b!811176 (= c!88852 (validKeyInArray!0 (select (arr!21106 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104145 (not res!554291)) b!811176))

(assert (= (and b!811176 c!88852) b!811173))

(assert (= (and b!811176 (not c!88852)) b!811174))

(assert (= (and b!811173 res!554290) b!811175))

(assert (= (or b!811175 b!811174) bm!35460))

(declare-fun m!753505 () Bool)

(assert (=> b!811173 m!753505))

(declare-fun m!753507 () Bool)

(assert (=> b!811173 m!753507))

(declare-fun m!753509 () Bool)

(assert (=> b!811173 m!753509))

(assert (=> b!811173 m!753505))

(declare-fun m!753511 () Bool)

(assert (=> b!811173 m!753511))

(declare-fun m!753513 () Bool)

(assert (=> bm!35460 m!753513))

(assert (=> b!811176 m!753505))

(assert (=> b!811176 m!753505))

(declare-fun m!753515 () Bool)

(assert (=> b!811176 m!753515))

(assert (=> b!810937 d!104145))

(declare-fun d!104165 () Bool)

(declare-fun res!554296 () Bool)

(declare-fun e!448978 () Bool)

(assert (=> d!104165 (=> res!554296 e!448978)))

(assert (=> d!104165 (= res!554296 (= (select (arr!21106 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!104165 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448978)))

(declare-fun b!811181 () Bool)

(declare-fun e!448979 () Bool)

(assert (=> b!811181 (= e!448978 e!448979)))

(declare-fun res!554297 () Bool)

(assert (=> b!811181 (=> (not res!554297) (not e!448979))))

(assert (=> b!811181 (= res!554297 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21527 a!3170)))))

(declare-fun b!811182 () Bool)

(assert (=> b!811182 (= e!448979 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104165 (not res!554296)) b!811181))

(assert (= (and b!811181 res!554297) b!811182))

(assert (=> d!104165 m!753505))

(declare-fun m!753517 () Bool)

(assert (=> b!811182 m!753517))

(assert (=> b!810939 d!104165))

(declare-fun d!104167 () Bool)

(assert (=> d!104167 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69574 d!104167))

(declare-fun d!104175 () Bool)

(assert (=> d!104175 (= (array_inv!16902 a!3170) (bvsge (size!21527 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69574 d!104175))

(declare-fun b!811232 () Bool)

(declare-fun e!449014 () Bool)

(declare-fun contains!4137 (List!15069 (_ BitVec 64)) Bool)

(assert (=> b!811232 (= e!449014 (contains!4137 Nil!15066 (select (arr!21106 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811233 () Bool)

(declare-fun e!449013 () Bool)

(declare-fun e!449015 () Bool)

(assert (=> b!811233 (= e!449013 e!449015)))

(declare-fun res!554314 () Bool)

(assert (=> b!811233 (=> (not res!554314) (not e!449015))))

(assert (=> b!811233 (= res!554314 (not e!449014))))

(declare-fun res!554315 () Bool)

(assert (=> b!811233 (=> (not res!554315) (not e!449014))))

(assert (=> b!811233 (= res!554315 (validKeyInArray!0 (select (arr!21106 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811234 () Bool)

(declare-fun e!449012 () Bool)

(declare-fun call!35469 () Bool)

(assert (=> b!811234 (= e!449012 call!35469)))

(declare-fun d!104177 () Bool)

(declare-fun res!554313 () Bool)

(assert (=> d!104177 (=> res!554313 e!449013)))

(assert (=> d!104177 (= res!554313 (bvsge #b00000000000000000000000000000000 (size!21527 a!3170)))))

(assert (=> d!104177 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15066) e!449013)))

(declare-fun b!811235 () Bool)

(assert (=> b!811235 (= e!449012 call!35469)))

(declare-fun b!811236 () Bool)

(assert (=> b!811236 (= e!449015 e!449012)))

(declare-fun c!88870 () Bool)

(assert (=> b!811236 (= c!88870 (validKeyInArray!0 (select (arr!21106 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35466 () Bool)

(assert (=> bm!35466 (= call!35469 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88870 (Cons!15065 (select (arr!21106 a!3170) #b00000000000000000000000000000000) Nil!15066) Nil!15066)))))

(assert (= (and d!104177 (not res!554313)) b!811233))

(assert (= (and b!811233 res!554315) b!811232))

(assert (= (and b!811233 res!554314) b!811236))

(assert (= (and b!811236 c!88870) b!811234))

(assert (= (and b!811236 (not c!88870)) b!811235))

(assert (= (or b!811234 b!811235) bm!35466))

(assert (=> b!811232 m!753505))

(assert (=> b!811232 m!753505))

(declare-fun m!753541 () Bool)

(assert (=> b!811232 m!753541))

(assert (=> b!811233 m!753505))

(assert (=> b!811233 m!753505))

(assert (=> b!811233 m!753515))

(assert (=> b!811236 m!753505))

(assert (=> b!811236 m!753505))

(assert (=> b!811236 m!753515))

(assert (=> bm!35466 m!753505))

(declare-fun m!753543 () Bool)

(assert (=> bm!35466 m!753543))

(assert (=> b!810933 d!104177))

(check-sat (not b!811098) (not d!104133) (not b!811118) (not b!811233) (not d!104101) (not b!811084) (not d!104129) (not b!811236) (not bm!35460) (not bm!35466) (not d!104125) (not b!811062) (not b!811176) (not b!811128) (not b!811173) (not b!810994) (not b!811232) (not d!104107) (not d!104123) (not b!811090) (not d!104137) (not b!811182) (not b!811134) (not d!104119) (not d!104143))
(check-sat)
