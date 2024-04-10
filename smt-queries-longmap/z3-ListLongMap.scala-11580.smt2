; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134944 () Bool)

(assert start!134944)

(declare-fun res!1074228 () Bool)

(declare-fun e!876670 () Bool)

(assert (=> start!134944 (=> (not res!1074228) (not e!876670))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134944 (= res!1074228 (validMask!0 mask!889))))

(assert (=> start!134944 e!876670))

(assert (=> start!134944 true))

(declare-datatypes ((array!104987 0))(
  ( (array!104988 (arr!50660 (Array (_ BitVec 32) (_ BitVec 64))) (size!51210 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104987)

(declare-fun array_inv!39387 (array!104987) Bool)

(assert (=> start!134944 (array_inv!39387 _keys!600)))

(declare-fun b!1572211 () Bool)

(declare-fun res!1074226 () Bool)

(assert (=> b!1572211 (=> (not res!1074226) (not e!876670))))

(assert (=> b!1572211 (= res!1074226 (= (size!51210 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572212 () Bool)

(declare-fun res!1074227 () Bool)

(assert (=> b!1572212 (=> (not res!1074227) (not e!876670))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572212 (= res!1074227 (validKeyInArray!0 k0!754))))

(declare-datatypes ((SeekEntryResult!13573 0))(
  ( (MissingZero!13573 (index!56690 (_ BitVec 32))) (Found!13573 (index!56691 (_ BitVec 32))) (Intermediate!13573 (undefined!14385 Bool) (index!56692 (_ BitVec 32)) (x!141461 (_ BitVec 32))) (Undefined!13573) (MissingVacant!13573 (index!56693 (_ BitVec 32))) )
))
(declare-fun lt!673900 () SeekEntryResult!13573)

(declare-fun b!1572213 () Bool)

(get-info :version)

(assert (=> b!1572213 (= e!876670 (and ((_ is Intermediate!13573) lt!673900) (not (undefined!14385 lt!673900)) (not (= (select (arr!50660 _keys!600) (index!56692 lt!673900)) k0!754)) (not (= (select (arr!50660 _keys!600) (index!56692 lt!673900)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50660 _keys!600) (index!56692 lt!673900)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!56692 lt!673900) #b00000000000000000000000000000000) (bvsge (index!56692 lt!673900) (bvadd #b00000000000000000000000000000001 mask!889)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104987 (_ BitVec 32)) SeekEntryResult!13573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572213 (= lt!673900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134944 res!1074228) b!1572211))

(assert (= (and b!1572211 res!1074226) b!1572212))

(assert (= (and b!1572212 res!1074227) b!1572213))

(declare-fun m!1446019 () Bool)

(assert (=> start!134944 m!1446019))

(declare-fun m!1446021 () Bool)

(assert (=> start!134944 m!1446021))

(declare-fun m!1446023 () Bool)

(assert (=> b!1572212 m!1446023))

(declare-fun m!1446025 () Bool)

(assert (=> b!1572213 m!1446025))

(declare-fun m!1446027 () Bool)

(assert (=> b!1572213 m!1446027))

(assert (=> b!1572213 m!1446027))

(declare-fun m!1446029 () Bool)

(assert (=> b!1572213 m!1446029))

(check-sat (not b!1572213) (not start!134944) (not b!1572212))
(check-sat)
(get-model)

(declare-fun b!1572241 () Bool)

(declare-fun e!876691 () Bool)

(declare-fun lt!673909 () SeekEntryResult!13573)

(assert (=> b!1572241 (= e!876691 (bvsge (x!141461 lt!673909) #b01111111111111111111111111111110))))

(declare-fun b!1572242 () Bool)

(declare-fun e!876688 () SeekEntryResult!13573)

(declare-fun e!876690 () SeekEntryResult!13573)

(assert (=> b!1572242 (= e!876688 e!876690)))

(declare-fun c!145242 () Bool)

(declare-fun lt!673908 () (_ BitVec 64))

(assert (=> b!1572242 (= c!145242 (or (= lt!673908 k0!754) (= (bvadd lt!673908 lt!673908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572243 () Bool)

(assert (=> b!1572243 (= e!876688 (Intermediate!13573 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572244 () Bool)

(assert (=> b!1572244 (and (bvsge (index!56692 lt!673909) #b00000000000000000000000000000000) (bvslt (index!56692 lt!673909) (size!51210 _keys!600)))))

(declare-fun res!1074244 () Bool)

(assert (=> b!1572244 (= res!1074244 (= (select (arr!50660 _keys!600) (index!56692 lt!673909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876689 () Bool)

(assert (=> b!1572244 (=> res!1074244 e!876689)))

(declare-fun b!1572245 () Bool)

(assert (=> b!1572245 (and (bvsge (index!56692 lt!673909) #b00000000000000000000000000000000) (bvslt (index!56692 lt!673909) (size!51210 _keys!600)))))

(assert (=> b!1572245 (= e!876689 (= (select (arr!50660 _keys!600) (index!56692 lt!673909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!164743 () Bool)

(assert (=> d!164743 e!876691))

(declare-fun c!145240 () Bool)

(assert (=> d!164743 (= c!145240 (and ((_ is Intermediate!13573) lt!673909) (undefined!14385 lt!673909)))))

(assert (=> d!164743 (= lt!673909 e!876688)))

(declare-fun c!145241 () Bool)

(assert (=> d!164743 (= c!145241 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164743 (= lt!673908 (select (arr!50660 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164743 (validMask!0 mask!889)))

(assert (=> d!164743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673909)))

(declare-fun b!1572246 () Bool)

(declare-fun e!876692 () Bool)

(assert (=> b!1572246 (= e!876691 e!876692)))

(declare-fun res!1074246 () Bool)

(assert (=> b!1572246 (= res!1074246 (and ((_ is Intermediate!13573) lt!673909) (not (undefined!14385 lt!673909)) (bvslt (x!141461 lt!673909) #b01111111111111111111111111111110) (bvsge (x!141461 lt!673909) #b00000000000000000000000000000000) (bvsge (x!141461 lt!673909) #b00000000000000000000000000000000)))))

(assert (=> b!1572246 (=> (not res!1074246) (not e!876692))))

(declare-fun b!1572247 () Bool)

(assert (=> b!1572247 (= e!876690 (Intermediate!13573 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572248 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572248 (= e!876690 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572249 () Bool)

(assert (=> b!1572249 (and (bvsge (index!56692 lt!673909) #b00000000000000000000000000000000) (bvslt (index!56692 lt!673909) (size!51210 _keys!600)))))

(declare-fun res!1074245 () Bool)

(assert (=> b!1572249 (= res!1074245 (= (select (arr!50660 _keys!600) (index!56692 lt!673909)) k0!754))))

(assert (=> b!1572249 (=> res!1074245 e!876689)))

(assert (=> b!1572249 (= e!876692 e!876689)))

(assert (= (and d!164743 c!145241) b!1572243))

(assert (= (and d!164743 (not c!145241)) b!1572242))

(assert (= (and b!1572242 c!145242) b!1572247))

(assert (= (and b!1572242 (not c!145242)) b!1572248))

(assert (= (and d!164743 c!145240) b!1572241))

(assert (= (and d!164743 (not c!145240)) b!1572246))

(assert (= (and b!1572246 res!1074246) b!1572249))

(assert (= (and b!1572249 (not res!1074245)) b!1572244))

(assert (= (and b!1572244 (not res!1074244)) b!1572245))

(assert (=> d!164743 m!1446027))

(declare-fun m!1446043 () Bool)

(assert (=> d!164743 m!1446043))

(assert (=> d!164743 m!1446019))

(declare-fun m!1446045 () Bool)

(assert (=> b!1572244 m!1446045))

(assert (=> b!1572248 m!1446027))

(declare-fun m!1446047 () Bool)

(assert (=> b!1572248 m!1446047))

(assert (=> b!1572248 m!1446047))

(declare-fun m!1446049 () Bool)

(assert (=> b!1572248 m!1446049))

(assert (=> b!1572249 m!1446045))

(assert (=> b!1572245 m!1446045))

(assert (=> b!1572213 d!164743))

(declare-fun d!164755 () Bool)

(declare-fun lt!673915 () (_ BitVec 32))

(declare-fun lt!673914 () (_ BitVec 32))

(assert (=> d!164755 (= lt!673915 (bvmul (bvxor lt!673914 (bvlshr lt!673914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164755 (= lt!673914 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164755 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074247 (let ((h!38216 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141464 (bvmul (bvxor h!38216 (bvlshr h!38216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141464 (bvlshr x!141464 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074247 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074247 #b00000000000000000000000000000000))))))

(assert (=> d!164755 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673915 (bvlshr lt!673915 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572213 d!164755))

(declare-fun d!164757 () Bool)

(assert (=> d!164757 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134944 d!164757))

(declare-fun d!164761 () Bool)

(assert (=> d!164761 (= (array_inv!39387 _keys!600) (bvsge (size!51210 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134944 d!164761))

(declare-fun d!164763 () Bool)

(assert (=> d!164763 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572212 d!164763))

(check-sat (not b!1572248) (not d!164743))
(check-sat)
