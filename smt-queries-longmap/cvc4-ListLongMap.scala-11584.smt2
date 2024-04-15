; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134948 () Bool)

(assert start!134948)

(declare-fun res!1074237 () Bool)

(declare-fun e!876589 () Bool)

(assert (=> start!134948 (=> (not res!1074237) (not e!876589))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134948 (= res!1074237 (validMask!0 mask!889))))

(assert (=> start!134948 e!876589))

(assert (=> start!134948 true))

(declare-datatypes ((array!104942 0))(
  ( (array!104943 (arr!50637 (Array (_ BitVec 32) (_ BitVec 64))) (size!51189 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104942)

(declare-fun array_inv!39573 (array!104942) Bool)

(assert (=> start!134948 (array_inv!39573 _keys!600)))

(declare-fun b!1572087 () Bool)

(declare-fun res!1074235 () Bool)

(assert (=> b!1572087 (=> (not res!1074235) (not e!876589))))

(assert (=> b!1572087 (= res!1074235 (= (size!51189 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572088 () Bool)

(declare-fun res!1074236 () Bool)

(assert (=> b!1572088 (=> (not res!1074236) (not e!876589))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572088 (= res!1074236 (validKeyInArray!0 k!754))))

(declare-fun b!1572089 () Bool)

(declare-datatypes ((SeekEntryResult!13585 0))(
  ( (MissingZero!13585 (index!56738 (_ BitVec 32))) (Found!13585 (index!56739 (_ BitVec 32))) (Intermediate!13585 (undefined!14397 Bool) (index!56740 (_ BitVec 32)) (x!141506 (_ BitVec 32))) (Undefined!13585) (MissingVacant!13585 (index!56741 (_ BitVec 32))) )
))
(declare-fun lt!673686 () SeekEntryResult!13585)

(assert (=> b!1572089 (= e!876589 (and (is-Intermediate!13585 lt!673686) (not (undefined!14397 lt!673686)) (or (bvslt (index!56740 lt!673686) #b00000000000000000000000000000000) (bvsge (index!56740 lt!673686) (size!51189 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104942 (_ BitVec 32)) SeekEntryResult!13585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572089 (= lt!673686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134948 res!1074237) b!1572087))

(assert (= (and b!1572087 res!1074235) b!1572088))

(assert (= (and b!1572088 res!1074236) b!1572089))

(declare-fun m!1445275 () Bool)

(assert (=> start!134948 m!1445275))

(declare-fun m!1445277 () Bool)

(assert (=> start!134948 m!1445277))

(declare-fun m!1445279 () Bool)

(assert (=> b!1572088 m!1445279))

(declare-fun m!1445281 () Bool)

(assert (=> b!1572089 m!1445281))

(assert (=> b!1572089 m!1445281))

(declare-fun m!1445283 () Bool)

(assert (=> b!1572089 m!1445283))

(push 1)

(assert (not b!1572089))

(assert (not start!134948))

(assert (not b!1572088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1572152 () Bool)

(declare-fun e!876630 () Bool)

(declare-fun lt!673711 () SeekEntryResult!13585)

(assert (=> b!1572152 (= e!876630 (bvsge (x!141506 lt!673711) #b01111111111111111111111111111110))))

(declare-fun b!1572153 () Bool)

(declare-fun e!876626 () SeekEntryResult!13585)

(declare-fun e!876628 () SeekEntryResult!13585)

(assert (=> b!1572153 (= e!876626 e!876628)))

(declare-fun c!145193 () Bool)

(declare-fun lt!673710 () (_ BitVec 64))

(assert (=> b!1572153 (= c!145193 (or (= lt!673710 k!754) (= (bvadd lt!673710 lt!673710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572154 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572154 (= e!876628 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572155 () Bool)

(assert (=> b!1572155 (= e!876626 (Intermediate!13585 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164533 () Bool)

(assert (=> d!164533 e!876630))

(declare-fun c!145192 () Bool)

(assert (=> d!164533 (= c!145192 (and (is-Intermediate!13585 lt!673711) (undefined!14397 lt!673711)))))

(assert (=> d!164533 (= lt!673711 e!876626)))

(declare-fun c!145191 () Bool)

(assert (=> d!164533 (= c!145191 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164533 (= lt!673710 (select (arr!50637 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164533 (validMask!0 mask!889)))

(assert (=> d!164533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673711)))

(declare-fun b!1572156 () Bool)

(assert (=> b!1572156 (and (bvsge (index!56740 lt!673711) #b00000000000000000000000000000000) (bvslt (index!56740 lt!673711) (size!51189 _keys!600)))))

(declare-fun res!1074265 () Bool)

(assert (=> b!1572156 (= res!1074265 (= (select (arr!50637 _keys!600) (index!56740 lt!673711)) k!754))))

(declare-fun e!876627 () Bool)

(assert (=> b!1572156 (=> res!1074265 e!876627)))

(declare-fun e!876629 () Bool)

(assert (=> b!1572156 (= e!876629 e!876627)))

(declare-fun b!1572157 () Bool)

(assert (=> b!1572157 (and (bvsge (index!56740 lt!673711) #b00000000000000000000000000000000) (bvslt (index!56740 lt!673711) (size!51189 _keys!600)))))

(declare-fun res!1074263 () Bool)

(assert (=> b!1572157 (= res!1074263 (= (select (arr!50637 _keys!600) (index!56740 lt!673711)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572157 (=> res!1074263 e!876627)))

(declare-fun b!1572158 () Bool)

(assert (=> b!1572158 (= e!876628 (Intermediate!13585 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572159 () Bool)

(assert (=> b!1572159 (and (bvsge (index!56740 lt!673711) #b00000000000000000000000000000000) (bvslt (index!56740 lt!673711) (size!51189 _keys!600)))))

(assert (=> b!1572159 (= e!876627 (= (select (arr!50637 _keys!600) (index!56740 lt!673711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572160 () Bool)

(assert (=> b!1572160 (= e!876630 e!876629)))

(declare-fun res!1074264 () Bool)

(assert (=> b!1572160 (= res!1074264 (and (is-Intermediate!13585 lt!673711) (not (undefined!14397 lt!673711)) (bvslt (x!141506 lt!673711) #b01111111111111111111111111111110) (bvsge (x!141506 lt!673711) #b00000000000000000000000000000000) (bvsge (x!141506 lt!673711) #b00000000000000000000000000000000)))))

(assert (=> b!1572160 (=> (not res!1074264) (not e!876629))))

(assert (= (and d!164533 c!145191) b!1572155))

(assert (= (and d!164533 (not c!145191)) b!1572153))

(assert (= (and b!1572153 c!145193) b!1572158))

(assert (= (and b!1572153 (not c!145193)) b!1572154))

(assert (= (and d!164533 c!145192) b!1572152))

(assert (= (and d!164533 (not c!145192)) b!1572160))

(assert (= (and b!1572160 res!1074264) b!1572156))

(assert (= (and b!1572156 (not res!1074265)) b!1572157))

(assert (= (and b!1572157 (not res!1074263)) b!1572159))

(declare-fun m!1445303 () Bool)

(assert (=> b!1572157 m!1445303))

(assert (=> d!164533 m!1445281))

(declare-fun m!1445305 () Bool)

(assert (=> d!164533 m!1445305))

(assert (=> d!164533 m!1445275))

(assert (=> b!1572156 m!1445303))

(assert (=> b!1572154 m!1445281))

(declare-fun m!1445307 () Bool)

(assert (=> b!1572154 m!1445307))

(assert (=> b!1572154 m!1445307))

(declare-fun m!1445309 () Bool)

(assert (=> b!1572154 m!1445309))

(assert (=> b!1572159 m!1445303))

(assert (=> b!1572089 d!164533))

(declare-fun d!164543 () Bool)

(declare-fun lt!673719 () (_ BitVec 32))

(declare-fun lt!673718 () (_ BitVec 32))

(assert (=> d!164543 (= lt!673719 (bvmul (bvxor lt!673718 (bvlshr lt!673718 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164543 (= lt!673718 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164543 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074272 (let ((h!38262 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141512 (bvmul (bvxor h!38262 (bvlshr h!38262 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141512 (bvlshr x!141512 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074272 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074272 #b00000000000000000000000000000000))))))

(assert (=> d!164543 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673719 (bvlshr lt!673719 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572089 d!164543))

(declare-fun d!164547 () Bool)

(assert (=> d!164547 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134948 d!164547))

(declare-fun d!164553 () Bool)

(assert (=> d!164553 (= (array_inv!39573 _keys!600) (bvsge (size!51189 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134948 d!164553))

(declare-fun d!164555 () Bool)

(assert (=> d!164555 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572088 d!164555))

(push 1)

(assert (not d!164533))

(assert (not b!1572154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

