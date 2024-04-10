; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134906 () Bool)

(assert start!134906)

(declare-fun res!1074160 () Bool)

(declare-fun e!876602 () Bool)

(assert (=> start!134906 (=> (not res!1074160) (not e!876602))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134906 (= res!1074160 (validMask!0 mask!889))))

(assert (=> start!134906 e!876602))

(assert (=> start!134906 true))

(declare-datatypes ((array!104976 0))(
  ( (array!104977 (arr!50656 (Array (_ BitVec 32) (_ BitVec 64))) (size!51206 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104976)

(declare-fun array_inv!39383 (array!104976) Bool)

(assert (=> start!134906 (array_inv!39383 _keys!600)))

(declare-fun b!1572094 () Bool)

(declare-fun res!1074161 () Bool)

(assert (=> b!1572094 (=> (not res!1074161) (not e!876602))))

(assert (=> b!1572094 (= res!1074161 (= (size!51206 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572095 () Bool)

(declare-fun res!1074162 () Bool)

(assert (=> b!1572095 (=> (not res!1074162) (not e!876602))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572095 (= res!1074162 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13569 0))(
  ( (MissingZero!13569 (index!56674 (_ BitVec 32))) (Found!13569 (index!56675 (_ BitVec 32))) (Intermediate!13569 (undefined!14381 Bool) (index!56676 (_ BitVec 32)) (x!141443 (_ BitVec 32))) (Undefined!13569) (MissingVacant!13569 (index!56677 (_ BitVec 32))) )
))
(declare-fun lt!673852 () SeekEntryResult!13569)

(declare-fun b!1572096 () Bool)

(assert (=> b!1572096 (= e!876602 (and (is-Intermediate!13569 lt!673852) (not (undefined!14381 lt!673852)) (not (= (select (arr!50656 _keys!600) (index!56676 lt!673852)) k!754)) (not (= (select (arr!50656 _keys!600) (index!56676 lt!673852)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50656 _keys!600) (index!56676 lt!673852)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104976 (_ BitVec 32)) SeekEntryResult!13569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572096 (= lt!673852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134906 res!1074160) b!1572094))

(assert (= (and b!1572094 res!1074161) b!1572095))

(assert (= (and b!1572095 res!1074162) b!1572096))

(declare-fun m!1445947 () Bool)

(assert (=> start!134906 m!1445947))

(declare-fun m!1445949 () Bool)

(assert (=> start!134906 m!1445949))

(declare-fun m!1445951 () Bool)

(assert (=> b!1572095 m!1445951))

(declare-fun m!1445953 () Bool)

(assert (=> b!1572096 m!1445953))

(declare-fun m!1445955 () Bool)

(assert (=> b!1572096 m!1445955))

(assert (=> b!1572096 m!1445955))

(declare-fun m!1445957 () Bool)

(assert (=> b!1572096 m!1445957))

(push 1)

(assert (not b!1572096))

(assert (not start!134906))

(assert (not b!1572095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1572151 () Bool)

(declare-fun e!876638 () Bool)

(declare-fun e!876637 () Bool)

(assert (=> b!1572151 (= e!876638 e!876637)))

(declare-fun res!1074193 () Bool)

(declare-fun lt!673868 () SeekEntryResult!13569)

(assert (=> b!1572151 (= res!1074193 (and (is-Intermediate!13569 lt!673868) (not (undefined!14381 lt!673868)) (bvslt (x!141443 lt!673868) #b01111111111111111111111111111110) (bvsge (x!141443 lt!673868) #b00000000000000000000000000000000) (bvsge (x!141443 lt!673868) #b00000000000000000000000000000000)))))

(assert (=> b!1572151 (=> (not res!1074193) (not e!876637))))

(declare-fun b!1572152 () Bool)

(declare-fun e!876639 () SeekEntryResult!13569)

(assert (=> b!1572152 (= e!876639 (Intermediate!13569 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572153 () Bool)

(assert (=> b!1572153 (and (bvsge (index!56676 lt!673868) #b00000000000000000000000000000000) (bvslt (index!56676 lt!673868) (size!51206 _keys!600)))))

(declare-fun res!1074194 () Bool)

(assert (=> b!1572153 (= res!1074194 (= (select (arr!50656 _keys!600) (index!56676 lt!673868)) k!754))))

(declare-fun e!876636 () Bool)

(assert (=> b!1572153 (=> res!1074194 e!876636)))

(assert (=> b!1572153 (= e!876637 e!876636)))

(declare-fun b!1572154 () Bool)

(declare-fun e!876635 () SeekEntryResult!13569)

(assert (=> b!1572154 (= e!876635 (Intermediate!13569 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572155 () Bool)

(assert (=> b!1572155 (and (bvsge (index!56676 lt!673868) #b00000000000000000000000000000000) (bvslt (index!56676 lt!673868) (size!51206 _keys!600)))))

(declare-fun res!1074195 () Bool)

(assert (=> b!1572155 (= res!1074195 (= (select (arr!50656 _keys!600) (index!56676 lt!673868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572155 (=> res!1074195 e!876636)))

(declare-fun b!1572156 () Bool)

(assert (=> b!1572156 (= e!876638 (bvsge (x!141443 lt!673868) #b01111111111111111111111111111110))))

(declare-fun b!1572157 () Bool)

(assert (=> b!1572157 (= e!876635 e!876639)))

(declare-fun c!145220 () Bool)

(declare-fun lt!673867 () (_ BitVec 64))

(assert (=> b!1572157 (= c!145220 (or (= lt!673867 k!754) (= (bvadd lt!673867 lt!673867) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164711 () Bool)

(assert (=> d!164711 e!876638))

(declare-fun c!145219 () Bool)

(assert (=> d!164711 (= c!145219 (and (is-Intermediate!13569 lt!673868) (undefined!14381 lt!673868)))))

(assert (=> d!164711 (= lt!673868 e!876635)))

(declare-fun c!145221 () Bool)

(assert (=> d!164711 (= c!145221 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164711 (= lt!673867 (select (arr!50656 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164711 (validMask!0 mask!889)))

(assert (=> d!164711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673868)))

(declare-fun b!1572158 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572158 (= e!876639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572159 () Bool)

(assert (=> b!1572159 (and (bvsge (index!56676 lt!673868) #b00000000000000000000000000000000) (bvslt (index!56676 lt!673868) (size!51206 _keys!600)))))

(assert (=> b!1572159 (= e!876636 (= (select (arr!50656 _keys!600) (index!56676 lt!673868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164711 c!145221) b!1572154))

(assert (= (and d!164711 (not c!145221)) b!1572157))

(assert (= (and b!1572157 c!145220) b!1572152))

(assert (= (and b!1572157 (not c!145220)) b!1572158))

(assert (= (and d!164711 c!145219) b!1572156))

(assert (= (and d!164711 (not c!145219)) b!1572151))

(assert (= (and b!1572151 res!1074193) b!1572153))

(assert (= (and b!1572153 (not res!1074194)) b!1572155))

(assert (= (and b!1572155 (not res!1074195)) b!1572159))

(declare-fun m!1445983 () Bool)

(assert (=> b!1572159 m!1445983))

(assert (=> d!164711 m!1445955))

(declare-fun m!1445985 () Bool)

(assert (=> d!164711 m!1445985))

(assert (=> d!164711 m!1445947))

(assert (=> b!1572155 m!1445983))

(assert (=> b!1572153 m!1445983))

(assert (=> b!1572158 m!1445955))

(declare-fun m!1445991 () Bool)

(assert (=> b!1572158 m!1445991))

(assert (=> b!1572158 m!1445991))

(declare-fun m!1445995 () Bool)

(assert (=> b!1572158 m!1445995))

(assert (=> b!1572096 d!164711))

(declare-fun d!164717 () Bool)

(declare-fun lt!673884 () (_ BitVec 32))

(declare-fun lt!673883 () (_ BitVec 32))

(assert (=> d!164717 (= lt!673884 (bvmul (bvxor lt!673883 (bvlshr lt!673883 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164717 (= lt!673883 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164717 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074199 (let ((h!38213 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141449 (bvmul (bvxor h!38213 (bvlshr h!38213 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141449 (bvlshr x!141449 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074199 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074199 #b00000000000000000000000000000000))))))

(assert (=> d!164717 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673884 (bvlshr lt!673884 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572096 d!164717))

(declare-fun d!164721 () Bool)

(assert (=> d!164721 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134906 d!164721))

(declare-fun d!164729 () Bool)

(assert (=> d!164729 (= (array_inv!39383 _keys!600) (bvsge (size!51206 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134906 d!164729))

(declare-fun d!164733 () Bool)

(assert (=> d!164733 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572095 d!164733))

(push 1)

(assert (not d!164711))

(assert (not b!1572158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

