; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135196 () Bool)

(assert start!135196)

(declare-fun b!1573143 () Bool)

(declare-fun res!1074849 () Bool)

(declare-fun e!877251 () Bool)

(assert (=> b!1573143 (=> (not res!1074849) (not e!877251))))

(declare-datatypes ((array!105098 0))(
  ( (array!105099 (arr!50708 (Array (_ BitVec 32) (_ BitVec 64))) (size!51258 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105098)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1573143 (= res!1074849 (= (size!51258 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573146 () Bool)

(declare-fun e!877253 () Bool)

(declare-datatypes ((SeekEntryResult!13621 0))(
  ( (MissingZero!13621 (index!56882 (_ BitVec 32))) (Found!13621 (index!56883 (_ BitVec 32))) (Intermediate!13621 (undefined!14433 Bool) (index!56884 (_ BitVec 32)) (x!141670 (_ BitVec 32))) (Undefined!13621) (MissingVacant!13621 (index!56885 (_ BitVec 32))) )
))
(declare-fun lt!674284 () SeekEntryResult!13621)

(get-info :version)

(assert (=> b!1573146 (= e!877253 (and (not ((_ is MissingVacant!13621) lt!674284)) (not ((_ is Found!13621) lt!674284)) (not ((_ is MissingZero!13621) lt!674284)) (not ((_ is Undefined!13621) lt!674284))))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun lt!674283 () SeekEntryResult!13621)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105098 (_ BitVec 32)) SeekEntryResult!13621)

(assert (=> b!1573146 (= lt!674284 (seekKeyOrZeroReturnVacant!0 (x!141670 lt!674283) (index!56884 lt!674283) (index!56884 lt!674283) k0!754 _keys!600 mask!889))))

(declare-fun b!1573144 () Bool)

(declare-fun res!1074851 () Bool)

(assert (=> b!1573144 (=> (not res!1074851) (not e!877251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573144 (= res!1074851 (validKeyInArray!0 k0!754))))

(declare-fun res!1074850 () Bool)

(assert (=> start!135196 (=> (not res!1074850) (not e!877251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135196 (= res!1074850 (validMask!0 mask!889))))

(assert (=> start!135196 e!877251))

(assert (=> start!135196 true))

(declare-fun array_inv!39435 (array!105098) Bool)

(assert (=> start!135196 (array_inv!39435 _keys!600)))

(declare-fun b!1573145 () Bool)

(assert (=> b!1573145 (= e!877251 e!877253)))

(declare-fun res!1074852 () Bool)

(assert (=> b!1573145 (=> (not res!1074852) (not e!877253))))

(assert (=> b!1573145 (= res!1074852 (and (not (undefined!14433 lt!674283)) ((_ is Intermediate!13621) lt!674283) (not (= (select (arr!50708 _keys!600) (index!56884 lt!674283)) k0!754)) (not (= (select (arr!50708 _keys!600) (index!56884 lt!674283)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50708 _keys!600) (index!56884 lt!674283)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56884 lt!674283) #b00000000000000000000000000000000) (bvslt (index!56884 lt!674283) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105098 (_ BitVec 32)) SeekEntryResult!13621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573145 (= lt!674283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135196 res!1074850) b!1573143))

(assert (= (and b!1573143 res!1074849) b!1573144))

(assert (= (and b!1573144 res!1074851) b!1573145))

(assert (= (and b!1573145 res!1074852) b!1573146))

(declare-fun m!1446711 () Bool)

(assert (=> b!1573146 m!1446711))

(declare-fun m!1446713 () Bool)

(assert (=> b!1573144 m!1446713))

(declare-fun m!1446715 () Bool)

(assert (=> start!135196 m!1446715))

(declare-fun m!1446717 () Bool)

(assert (=> start!135196 m!1446717))

(declare-fun m!1446719 () Bool)

(assert (=> b!1573145 m!1446719))

(declare-fun m!1446721 () Bool)

(assert (=> b!1573145 m!1446721))

(assert (=> b!1573145 m!1446721))

(declare-fun m!1446723 () Bool)

(assert (=> b!1573145 m!1446723))

(check-sat (not b!1573145) (not b!1573146) (not b!1573144) (not start!135196))
(check-sat)
(get-model)

(declare-fun b!1573177 () Bool)

(declare-fun e!877275 () SeekEntryResult!13621)

(assert (=> b!1573177 (= e!877275 (Intermediate!13621 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573178 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573178 (= e!877275 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573179 () Bool)

(declare-fun e!877274 () SeekEntryResult!13621)

(assert (=> b!1573179 (= e!877274 (Intermediate!13621 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573180 () Bool)

(declare-fun e!877277 () Bool)

(declare-fun lt!674295 () SeekEntryResult!13621)

(assert (=> b!1573180 (= e!877277 (bvsge (x!141670 lt!674295) #b01111111111111111111111111111110))))

(declare-fun d!164931 () Bool)

(assert (=> d!164931 e!877277))

(declare-fun c!145402 () Bool)

(assert (=> d!164931 (= c!145402 (and ((_ is Intermediate!13621) lt!674295) (undefined!14433 lt!674295)))))

(assert (=> d!164931 (= lt!674295 e!877274)))

(declare-fun c!145403 () Bool)

(assert (=> d!164931 (= c!145403 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674296 () (_ BitVec 64))

(assert (=> d!164931 (= lt!674296 (select (arr!50708 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164931 (validMask!0 mask!889)))

(assert (=> d!164931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674295)))

(declare-fun b!1573181 () Bool)

(declare-fun e!877273 () Bool)

(assert (=> b!1573181 (= e!877277 e!877273)))

(declare-fun res!1074871 () Bool)

(assert (=> b!1573181 (= res!1074871 (and ((_ is Intermediate!13621) lt!674295) (not (undefined!14433 lt!674295)) (bvslt (x!141670 lt!674295) #b01111111111111111111111111111110) (bvsge (x!141670 lt!674295) #b00000000000000000000000000000000) (bvsge (x!141670 lt!674295) #b00000000000000000000000000000000)))))

(assert (=> b!1573181 (=> (not res!1074871) (not e!877273))))

(declare-fun b!1573182 () Bool)

(assert (=> b!1573182 (and (bvsge (index!56884 lt!674295) #b00000000000000000000000000000000) (bvslt (index!56884 lt!674295) (size!51258 _keys!600)))))

(declare-fun res!1074872 () Bool)

(assert (=> b!1573182 (= res!1074872 (= (select (arr!50708 _keys!600) (index!56884 lt!674295)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877276 () Bool)

(assert (=> b!1573182 (=> res!1074872 e!877276)))

(declare-fun b!1573183 () Bool)

(assert (=> b!1573183 (= e!877274 e!877275)))

(declare-fun c!145404 () Bool)

(assert (=> b!1573183 (= c!145404 (or (= lt!674296 k0!754) (= (bvadd lt!674296 lt!674296) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573184 () Bool)

(assert (=> b!1573184 (and (bvsge (index!56884 lt!674295) #b00000000000000000000000000000000) (bvslt (index!56884 lt!674295) (size!51258 _keys!600)))))

(declare-fun res!1074873 () Bool)

(assert (=> b!1573184 (= res!1074873 (= (select (arr!50708 _keys!600) (index!56884 lt!674295)) k0!754))))

(assert (=> b!1573184 (=> res!1074873 e!877276)))

(assert (=> b!1573184 (= e!877273 e!877276)))

(declare-fun b!1573185 () Bool)

(assert (=> b!1573185 (and (bvsge (index!56884 lt!674295) #b00000000000000000000000000000000) (bvslt (index!56884 lt!674295) (size!51258 _keys!600)))))

(assert (=> b!1573185 (= e!877276 (= (select (arr!50708 _keys!600) (index!56884 lt!674295)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164931 c!145403) b!1573179))

(assert (= (and d!164931 (not c!145403)) b!1573183))

(assert (= (and b!1573183 c!145404) b!1573177))

(assert (= (and b!1573183 (not c!145404)) b!1573178))

(assert (= (and d!164931 c!145402) b!1573180))

(assert (= (and d!164931 (not c!145402)) b!1573181))

(assert (= (and b!1573181 res!1074871) b!1573184))

(assert (= (and b!1573184 (not res!1074873)) b!1573182))

(assert (= (and b!1573182 (not res!1074872)) b!1573185))

(declare-fun m!1446739 () Bool)

(assert (=> b!1573185 m!1446739))

(assert (=> b!1573178 m!1446721))

(declare-fun m!1446741 () Bool)

(assert (=> b!1573178 m!1446741))

(assert (=> b!1573178 m!1446741))

(declare-fun m!1446743 () Bool)

(assert (=> b!1573178 m!1446743))

(assert (=> d!164931 m!1446721))

(declare-fun m!1446745 () Bool)

(assert (=> d!164931 m!1446745))

(assert (=> d!164931 m!1446715))

(assert (=> b!1573184 m!1446739))

(assert (=> b!1573182 m!1446739))

(assert (=> b!1573145 d!164931))

(declare-fun d!164945 () Bool)

(declare-fun lt!674302 () (_ BitVec 32))

(declare-fun lt!674301 () (_ BitVec 32))

(assert (=> d!164945 (= lt!674302 (bvmul (bvxor lt!674301 (bvlshr lt!674301 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164945 (= lt!674301 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164945 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074874 (let ((h!38231 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141673 (bvmul (bvxor h!38231 (bvlshr h!38231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141673 (bvlshr x!141673 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074874 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074874 #b00000000000000000000000000000000))))))

(assert (=> d!164945 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674302 (bvlshr lt!674302 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573145 d!164945))

(declare-fun b!1573243 () Bool)

(declare-fun e!877309 () SeekEntryResult!13621)

(assert (=> b!1573243 (= e!877309 (MissingVacant!13621 (index!56884 lt!674283)))))

(declare-fun b!1573244 () Bool)

(declare-fun e!877311 () SeekEntryResult!13621)

(assert (=> b!1573244 (= e!877311 Undefined!13621)))

(declare-fun b!1573245 () Bool)

(assert (=> b!1573245 (= e!877309 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141670 lt!674283) #b00000000000000000000000000000001) (nextIndex!0 (index!56884 lt!674283) (x!141670 lt!674283) mask!889) (index!56884 lt!674283) k0!754 _keys!600 mask!889))))

(declare-fun d!164951 () Bool)

(declare-fun lt!674324 () SeekEntryResult!13621)

(assert (=> d!164951 (and (or ((_ is Undefined!13621) lt!674324) (not ((_ is Found!13621) lt!674324)) (and (bvsge (index!56883 lt!674324) #b00000000000000000000000000000000) (bvslt (index!56883 lt!674324) (size!51258 _keys!600)))) (or ((_ is Undefined!13621) lt!674324) ((_ is Found!13621) lt!674324) (not ((_ is MissingVacant!13621) lt!674324)) (not (= (index!56885 lt!674324) (index!56884 lt!674283))) (and (bvsge (index!56885 lt!674324) #b00000000000000000000000000000000) (bvslt (index!56885 lt!674324) (size!51258 _keys!600)))) (or ((_ is Undefined!13621) lt!674324) (ite ((_ is Found!13621) lt!674324) (= (select (arr!50708 _keys!600) (index!56883 lt!674324)) k0!754) (and ((_ is MissingVacant!13621) lt!674324) (= (index!56885 lt!674324) (index!56884 lt!674283)) (= (select (arr!50708 _keys!600) (index!56885 lt!674324)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!164951 (= lt!674324 e!877311)))

(declare-fun c!145427 () Bool)

(assert (=> d!164951 (= c!145427 (bvsge (x!141670 lt!674283) #b01111111111111111111111111111110))))

(declare-fun lt!674323 () (_ BitVec 64))

(assert (=> d!164951 (= lt!674323 (select (arr!50708 _keys!600) (index!56884 lt!674283)))))

(assert (=> d!164951 (validMask!0 mask!889)))

(assert (=> d!164951 (= (seekKeyOrZeroReturnVacant!0 (x!141670 lt!674283) (index!56884 lt!674283) (index!56884 lt!674283) k0!754 _keys!600 mask!889) lt!674324)))

(declare-fun b!1573246 () Bool)

(declare-fun c!145426 () Bool)

(assert (=> b!1573246 (= c!145426 (= lt!674323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877310 () SeekEntryResult!13621)

(assert (=> b!1573246 (= e!877310 e!877309)))

(declare-fun b!1573247 () Bool)

(assert (=> b!1573247 (= e!877310 (Found!13621 (index!56884 lt!674283)))))

(declare-fun b!1573248 () Bool)

(assert (=> b!1573248 (= e!877311 e!877310)))

(declare-fun c!145428 () Bool)

(assert (=> b!1573248 (= c!145428 (= lt!674323 k0!754))))

(assert (= (and d!164951 c!145427) b!1573244))

(assert (= (and d!164951 (not c!145427)) b!1573248))

(assert (= (and b!1573248 c!145428) b!1573247))

(assert (= (and b!1573248 (not c!145428)) b!1573246))

(assert (= (and b!1573246 c!145426) b!1573243))

(assert (= (and b!1573246 (not c!145426)) b!1573245))

(declare-fun m!1446755 () Bool)

(assert (=> b!1573245 m!1446755))

(assert (=> b!1573245 m!1446755))

(declare-fun m!1446757 () Bool)

(assert (=> b!1573245 m!1446757))

(declare-fun m!1446759 () Bool)

(assert (=> d!164951 m!1446759))

(declare-fun m!1446761 () Bool)

(assert (=> d!164951 m!1446761))

(assert (=> d!164951 m!1446719))

(assert (=> d!164951 m!1446715))

(assert (=> b!1573146 d!164951))

(declare-fun d!164957 () Bool)

(assert (=> d!164957 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573144 d!164957))

(declare-fun d!164959 () Bool)

(assert (=> d!164959 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135196 d!164959))

(declare-fun d!164965 () Bool)

(assert (=> d!164965 (= (array_inv!39435 _keys!600) (bvsge (size!51258 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135196 d!164965))

(check-sat (not b!1573245) (not d!164951) (not b!1573178) (not d!164931))
