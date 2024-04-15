; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134984 () Bool)

(assert start!134984)

(declare-fun res!1074292 () Bool)

(declare-fun e!876653 () Bool)

(assert (=> start!134984 (=> (not res!1074292) (not e!876653))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134984 (= res!1074292 (validMask!0 mask!889))))

(assert (=> start!134984 e!876653))

(assert (=> start!134984 true))

(declare-datatypes ((array!104951 0))(
  ( (array!104952 (arr!50640 (Array (_ BitVec 32) (_ BitVec 64))) (size!51192 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104951)

(declare-fun array_inv!39576 (array!104951) Bool)

(assert (=> start!134984 (array_inv!39576 _keys!600)))

(declare-fun b!1572195 () Bool)

(declare-fun res!1074294 () Bool)

(assert (=> b!1572195 (=> (not res!1074294) (not e!876653))))

(assert (=> b!1572195 (= res!1074294 (= (size!51192 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572196 () Bool)

(declare-fun res!1074293 () Bool)

(assert (=> b!1572196 (=> (not res!1074293) (not e!876653))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572196 (= res!1074293 (validKeyInArray!0 k!754))))

(declare-fun b!1572197 () Bool)

(declare-datatypes ((SeekEntryResult!13588 0))(
  ( (MissingZero!13588 (index!56750 (_ BitVec 32))) (Found!13588 (index!56751 (_ BitVec 32))) (Intermediate!13588 (undefined!14400 Bool) (index!56752 (_ BitVec 32)) (x!141523 (_ BitVec 32))) (Undefined!13588) (MissingVacant!13588 (index!56753 (_ BitVec 32))) )
))
(declare-fun lt!673731 () SeekEntryResult!13588)

(assert (=> b!1572197 (= e!876653 (and (is-Intermediate!13588 lt!673731) (not (undefined!14400 lt!673731)) (= (select (arr!50640 _keys!600) (index!56752 lt!673731)) k!754) (or (bvslt (index!56752 lt!673731) #b00000000000000000000000000000000) (bvsge (index!56752 lt!673731) (size!51192 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104951 (_ BitVec 32)) SeekEntryResult!13588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572197 (= lt!673731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134984 res!1074292) b!1572195))

(assert (= (and b!1572195 res!1074294) b!1572196))

(assert (= (and b!1572196 res!1074293) b!1572197))

(declare-fun m!1445331 () Bool)

(assert (=> start!134984 m!1445331))

(declare-fun m!1445333 () Bool)

(assert (=> start!134984 m!1445333))

(declare-fun m!1445335 () Bool)

(assert (=> b!1572196 m!1445335))

(declare-fun m!1445337 () Bool)

(assert (=> b!1572197 m!1445337))

(declare-fun m!1445339 () Bool)

(assert (=> b!1572197 m!1445339))

(assert (=> b!1572197 m!1445339))

(declare-fun m!1445341 () Bool)

(assert (=> b!1572197 m!1445341))

(push 1)

(assert (not b!1572197))

(assert (not start!134984))

(assert (not b!1572196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1572279 () Bool)

(declare-fun e!876701 () Bool)

(declare-fun e!876703 () Bool)

(assert (=> b!1572279 (= e!876701 e!876703)))

(declare-fun res!1074331 () Bool)

(declare-fun lt!673760 () SeekEntryResult!13588)

(assert (=> b!1572279 (= res!1074331 (and (is-Intermediate!13588 lt!673760) (not (undefined!14400 lt!673760)) (bvslt (x!141523 lt!673760) #b01111111111111111111111111111110) (bvsge (x!141523 lt!673760) #b00000000000000000000000000000000) (bvsge (x!141523 lt!673760) #b00000000000000000000000000000000)))))

(assert (=> b!1572279 (=> (not res!1074331) (not e!876703))))

(declare-fun b!1572280 () Bool)

(assert (=> b!1572280 (= e!876701 (bvsge (x!141523 lt!673760) #b01111111111111111111111111111110))))

(declare-fun b!1572281 () Bool)

(declare-fun e!876702 () SeekEntryResult!13588)

(assert (=> b!1572281 (= e!876702 (Intermediate!13588 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164563 () Bool)

(assert (=> d!164563 e!876701))

(declare-fun c!145225 () Bool)

(assert (=> d!164563 (= c!145225 (and (is-Intermediate!13588 lt!673760) (undefined!14400 lt!673760)))))

(declare-fun e!876700 () SeekEntryResult!13588)

(assert (=> d!164563 (= lt!673760 e!876700)))

(declare-fun c!145223 () Bool)

(assert (=> d!164563 (= c!145223 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!673757 () (_ BitVec 64))

(assert (=> d!164563 (= lt!673757 (select (arr!50640 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164563 (validMask!0 mask!889)))

(assert (=> d!164563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673760)))

(declare-fun b!1572282 () Bool)

(assert (=> b!1572282 (and (bvsge (index!56752 lt!673760) #b00000000000000000000000000000000) (bvslt (index!56752 lt!673760) (size!51192 _keys!600)))))

(declare-fun res!1074332 () Bool)

(assert (=> b!1572282 (= res!1074332 (= (select (arr!50640 _keys!600) (index!56752 lt!673760)) k!754))))

(declare-fun e!876704 () Bool)

(assert (=> b!1572282 (=> res!1074332 e!876704)))

(assert (=> b!1572282 (= e!876703 e!876704)))

(declare-fun b!1572283 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572283 (= e!876702 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572284 () Bool)

(assert (=> b!1572284 (and (bvsge (index!56752 lt!673760) #b00000000000000000000000000000000) (bvslt (index!56752 lt!673760) (size!51192 _keys!600)))))

(assert (=> b!1572284 (= e!876704 (= (select (arr!50640 _keys!600) (index!56752 lt!673760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572285 () Bool)

(assert (=> b!1572285 (and (bvsge (index!56752 lt!673760) #b00000000000000000000000000000000) (bvslt (index!56752 lt!673760) (size!51192 _keys!600)))))

(declare-fun res!1074330 () Bool)

(assert (=> b!1572285 (= res!1074330 (= (select (arr!50640 _keys!600) (index!56752 lt!673760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572285 (=> res!1074330 e!876704)))

(declare-fun b!1572286 () Bool)

(assert (=> b!1572286 (= e!876700 (Intermediate!13588 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572287 () Bool)

(assert (=> b!1572287 (= e!876700 e!876702)))

(declare-fun c!145224 () Bool)

(assert (=> b!1572287 (= c!145224 (or (= lt!673757 k!754) (= (bvadd lt!673757 lt!673757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164563 c!145223) b!1572286))

(assert (= (and d!164563 (not c!145223)) b!1572287))

(assert (= (and b!1572287 c!145224) b!1572281))

(assert (= (and b!1572287 (not c!145224)) b!1572283))

(assert (= (and d!164563 c!145225) b!1572280))

(assert (= (and d!164563 (not c!145225)) b!1572279))

(assert (= (and b!1572279 res!1074331) b!1572282))

(assert (= (and b!1572282 (not res!1074332)) b!1572285))

(assert (= (and b!1572285 (not res!1074330)) b!1572284))

(assert (=> b!1572283 m!1445339))

(declare-fun m!1445371 () Bool)

(assert (=> b!1572283 m!1445371))

(assert (=> b!1572283 m!1445371))

(declare-fun m!1445373 () Bool)

(assert (=> b!1572283 m!1445373))

(declare-fun m!1445375 () Bool)

(assert (=> b!1572284 m!1445375))

(assert (=> d!164563 m!1445339))

(declare-fun m!1445377 () Bool)

(assert (=> d!164563 m!1445377))

(assert (=> d!164563 m!1445331))

(assert (=> b!1572282 m!1445375))

(assert (=> b!1572285 m!1445375))

(assert (=> b!1572197 d!164563))

(declare-fun d!164571 () Bool)

(declare-fun lt!673770 () (_ BitVec 32))

(declare-fun lt!673769 () (_ BitVec 32))

(assert (=> d!164571 (= lt!673770 (bvmul (bvxor lt!673769 (bvlshr lt!673769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164571 (= lt!673769 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164571 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074333 (let ((h!38266 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141530 (bvmul (bvxor h!38266 (bvlshr h!38266 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141530 (bvlshr x!141530 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074333 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074333 #b00000000000000000000000000000000))))))

(assert (=> d!164571 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673770 (bvlshr lt!673770 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572197 d!164571))

(declare-fun d!164575 () Bool)

(assert (=> d!164575 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134984 d!164575))

(declare-fun d!164585 () Bool)

(assert (=> d!164585 (= (array_inv!39576 _keys!600) (bvsge (size!51192 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134984 d!164585))

(declare-fun d!164587 () Bool)

(assert (=> d!164587 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572196 d!164587))

(push 1)

(assert (not d!164563))

(assert (not b!1572283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

