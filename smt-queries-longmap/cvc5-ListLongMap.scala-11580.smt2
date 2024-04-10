; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134942 () Bool)

(assert start!134942)

(declare-fun res!1074217 () Bool)

(declare-fun e!876664 () Bool)

(assert (=> start!134942 (=> (not res!1074217) (not e!876664))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134942 (= res!1074217 (validMask!0 mask!889))))

(assert (=> start!134942 e!876664))

(assert (=> start!134942 true))

(declare-datatypes ((array!104985 0))(
  ( (array!104986 (arr!50659 (Array (_ BitVec 32) (_ BitVec 64))) (size!51209 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104985)

(declare-fun array_inv!39386 (array!104985) Bool)

(assert (=> start!134942 (array_inv!39386 _keys!600)))

(declare-fun b!1572202 () Bool)

(declare-fun res!1074219 () Bool)

(assert (=> b!1572202 (=> (not res!1074219) (not e!876664))))

(assert (=> b!1572202 (= res!1074219 (= (size!51209 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572203 () Bool)

(declare-fun res!1074218 () Bool)

(assert (=> b!1572203 (=> (not res!1074218) (not e!876664))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572203 (= res!1074218 (validKeyInArray!0 k!754))))

(declare-fun b!1572204 () Bool)

(declare-datatypes ((SeekEntryResult!13572 0))(
  ( (MissingZero!13572 (index!56686 (_ BitVec 32))) (Found!13572 (index!56687 (_ BitVec 32))) (Intermediate!13572 (undefined!14384 Bool) (index!56688 (_ BitVec 32)) (x!141460 (_ BitVec 32))) (Undefined!13572) (MissingVacant!13572 (index!56689 (_ BitVec 32))) )
))
(declare-fun lt!673897 () SeekEntryResult!13572)

(assert (=> b!1572204 (= e!876664 (and (is-Intermediate!13572 lt!673897) (not (undefined!14384 lt!673897)) (not (= (select (arr!50659 _keys!600) (index!56688 lt!673897)) k!754)) (not (= (select (arr!50659 _keys!600) (index!56688 lt!673897)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50659 _keys!600) (index!56688 lt!673897)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!56688 lt!673897) #b00000000000000000000000000000000) (bvsge (index!56688 lt!673897) (bvadd #b00000000000000000000000000000001 mask!889)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104985 (_ BitVec 32)) SeekEntryResult!13572)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572204 (= lt!673897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134942 res!1074217) b!1572202))

(assert (= (and b!1572202 res!1074219) b!1572203))

(assert (= (and b!1572203 res!1074218) b!1572204))

(declare-fun m!1446007 () Bool)

(assert (=> start!134942 m!1446007))

(declare-fun m!1446009 () Bool)

(assert (=> start!134942 m!1446009))

(declare-fun m!1446011 () Bool)

(assert (=> b!1572203 m!1446011))

(declare-fun m!1446013 () Bool)

(assert (=> b!1572204 m!1446013))

(declare-fun m!1446015 () Bool)

(assert (=> b!1572204 m!1446015))

(assert (=> b!1572204 m!1446015))

(declare-fun m!1446017 () Bool)

(assert (=> b!1572204 m!1446017))

(push 1)

(assert (not start!134942))

(assert (not b!1572203))

(assert (not b!1572204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164745 () Bool)

(assert (=> d!164745 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134942 d!164745))

(declare-fun d!164749 () Bool)

(assert (=> d!164749 (= (array_inv!39386 _keys!600) (bvsge (size!51209 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134942 d!164749))

(declare-fun d!164751 () Bool)

(assert (=> d!164751 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572203 d!164751))

(declare-fun b!1572295 () Bool)

(declare-fun e!876722 () Bool)

(declare-fun e!876718 () Bool)

(assert (=> b!1572295 (= e!876722 e!876718)))

(declare-fun res!1074266 () Bool)

(declare-fun lt!673927 () SeekEntryResult!13572)

(assert (=> b!1572295 (= res!1074266 (and (is-Intermediate!13572 lt!673927) (not (undefined!14384 lt!673927)) (bvslt (x!141460 lt!673927) #b01111111111111111111111111111110) (bvsge (x!141460 lt!673927) #b00000000000000000000000000000000) (bvsge (x!141460 lt!673927) #b00000000000000000000000000000000)))))

(assert (=> b!1572295 (=> (not res!1074266) (not e!876718))))

(declare-fun b!1572296 () Bool)

(assert (=> b!1572296 (and (bvsge (index!56688 lt!673927) #b00000000000000000000000000000000) (bvslt (index!56688 lt!673927) (size!51209 _keys!600)))))

(declare-fun e!876720 () Bool)

(assert (=> b!1572296 (= e!876720 (= (select (arr!50659 _keys!600) (index!56688 lt!673927)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572297 () Bool)

(declare-fun e!876719 () SeekEntryResult!13572)

(declare-fun e!876721 () SeekEntryResult!13572)

(assert (=> b!1572297 (= e!876719 e!876721)))

(declare-fun c!145258 () Bool)

(declare-fun lt!673926 () (_ BitVec 64))

(assert (=> b!1572297 (= c!145258 (or (= lt!673926 k!754) (= (bvadd lt!673926 lt!673926) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164753 () Bool)

(assert (=> d!164753 e!876722))

(declare-fun c!145259 () Bool)

(assert (=> d!164753 (= c!145259 (and (is-Intermediate!13572 lt!673927) (undefined!14384 lt!673927)))))

(assert (=> d!164753 (= lt!673927 e!876719)))

(declare-fun c!145260 () Bool)

(assert (=> d!164753 (= c!145260 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164753 (= lt!673926 (select (arr!50659 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164753 (validMask!0 mask!889)))

(assert (=> d!164753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673927)))

(declare-fun b!1572298 () Bool)

(assert (=> b!1572298 (= e!876722 (bvsge (x!141460 lt!673927) #b01111111111111111111111111111110))))

(declare-fun b!1572299 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572299 (= e!876721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572300 () Bool)

(assert (=> b!1572300 (and (bvsge (index!56688 lt!673927) #b00000000000000000000000000000000) (bvslt (index!56688 lt!673927) (size!51209 _keys!600)))))

(declare-fun res!1074265 () Bool)

(assert (=> b!1572300 (= res!1074265 (= (select (arr!50659 _keys!600) (index!56688 lt!673927)) k!754))))

(assert (=> b!1572300 (=> res!1074265 e!876720)))

(assert (=> b!1572300 (= e!876718 e!876720)))

(declare-fun b!1572301 () Bool)

(assert (=> b!1572301 (= e!876721 (Intermediate!13572 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572302 () Bool)

(assert (=> b!1572302 (and (bvsge (index!56688 lt!673927) #b00000000000000000000000000000000) (bvslt (index!56688 lt!673927) (size!51209 _keys!600)))))

(declare-fun res!1074264 () Bool)

(assert (=> b!1572302 (= res!1074264 (= (select (arr!50659 _keys!600) (index!56688 lt!673927)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572302 (=> res!1074264 e!876720)))

(declare-fun b!1572303 () Bool)

(assert (=> b!1572303 (= e!876719 (Intermediate!13572 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164753 c!145260) b!1572303))

(assert (= (and d!164753 (not c!145260)) b!1572297))

(assert (= (and b!1572297 c!145258) b!1572301))

(assert (= (and b!1572297 (not c!145258)) b!1572299))

(assert (= (and d!164753 c!145259) b!1572298))

(assert (= (and d!164753 (not c!145259)) b!1572295))

(assert (= (and b!1572295 res!1074266) b!1572300))

(assert (= (and b!1572300 (not res!1074265)) b!1572302))

(assert (= (and b!1572302 (not res!1074264)) b!1572296))

(declare-fun m!1446059 () Bool)

(assert (=> b!1572300 m!1446059))

(assert (=> b!1572299 m!1446015))

(declare-fun m!1446061 () Bool)

(assert (=> b!1572299 m!1446061))

(assert (=> b!1572299 m!1446061))

(declare-fun m!1446063 () Bool)

(assert (=> b!1572299 m!1446063))

(assert (=> b!1572296 m!1446059))

(assert (=> d!164753 m!1446015))

(declare-fun m!1446065 () Bool)

(assert (=> d!164753 m!1446065))

(assert (=> d!164753 m!1446007))

(assert (=> b!1572302 m!1446059))

(assert (=> b!1572204 d!164753))

(declare-fun d!164765 () Bool)

(declare-fun lt!673939 () (_ BitVec 32))

(declare-fun lt!673938 () (_ BitVec 32))

(assert (=> d!164765 (= lt!673939 (bvmul (bvxor lt!673938 (bvlshr lt!673938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164765 (= lt!673938 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164765 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074267 (let ((h!38218 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141468 (bvmul (bvxor h!38218 (bvlshr h!38218 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141468 (bvlshr x!141468 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074267 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074267 #b00000000000000000000000000000000))))))

(assert (=> d!164765 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673939 (bvlshr lt!673939 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572204 d!164765))

(push 1)

(assert (not d!164753))

(assert (not b!1572299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

