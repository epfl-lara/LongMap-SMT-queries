; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135232 () Bool)

(assert start!135232)

(declare-fun res!1074856 () Bool)

(declare-fun e!877252 () Bool)

(assert (=> start!135232 (=> (not res!1074856) (not e!877252))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135232 (= res!1074856 (validMask!0 mask!889))))

(assert (=> start!135232 e!877252))

(assert (=> start!135232 true))

(declare-datatypes ((array!105046 0))(
  ( (array!105047 (arr!50680 (Array (_ BitVec 32) (_ BitVec 64))) (size!51232 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105046)

(declare-fun array_inv!39616 (array!105046) Bool)

(assert (=> start!135232 (array_inv!39616 _keys!600)))

(declare-fun b!1573176 () Bool)

(declare-fun res!1074857 () Bool)

(assert (=> b!1573176 (=> (not res!1074857) (not e!877252))))

(assert (=> b!1573176 (= res!1074857 (= (size!51232 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573177 () Bool)

(declare-fun res!1074858 () Bool)

(assert (=> b!1573177 (=> (not res!1074858) (not e!877252))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573177 (= res!1074858 (validKeyInArray!0 k!754))))

(declare-fun b!1573178 () Bool)

(declare-fun lt!674147 () Bool)

(declare-datatypes ((SeekEntryResult!13628 0))(
  ( (MissingZero!13628 (index!56910 (_ BitVec 32))) (Found!13628 (index!56911 (_ BitVec 32))) (Intermediate!13628 (undefined!14440 Bool) (index!56912 (_ BitVec 32)) (x!141706 (_ BitVec 32))) (Undefined!13628) (MissingVacant!13628 (index!56913 (_ BitVec 32))) )
))
(declare-fun lt!674148 () SeekEntryResult!13628)

(assert (=> b!1573178 (= e!877252 (and (or lt!674147 (not (undefined!14440 lt!674148))) (or lt!674147 (undefined!14440 lt!674148))))))

(assert (=> b!1573178 (= lt!674147 (not (is-Intermediate!13628 lt!674148)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105046 (_ BitVec 32)) SeekEntryResult!13628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573178 (= lt!674148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135232 res!1074856) b!1573176))

(assert (= (and b!1573176 res!1074857) b!1573177))

(assert (= (and b!1573177 res!1074858) b!1573178))

(declare-fun m!1446011 () Bool)

(assert (=> start!135232 m!1446011))

(declare-fun m!1446013 () Bool)

(assert (=> start!135232 m!1446013))

(declare-fun m!1446015 () Bool)

(assert (=> b!1573177 m!1446015))

(declare-fun m!1446017 () Bool)

(assert (=> b!1573178 m!1446017))

(assert (=> b!1573178 m!1446017))

(declare-fun m!1446019 () Bool)

(assert (=> b!1573178 m!1446019))

(push 1)

(assert (not b!1573177))

(assert (not b!1573178))

(assert (not start!135232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164755 () Bool)

(assert (=> d!164755 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573177 d!164755))

(declare-fun b!1573242 () Bool)

(declare-fun e!877290 () SeekEntryResult!13628)

(assert (=> b!1573242 (= e!877290 (Intermediate!13628 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573243 () Bool)

(declare-fun e!877289 () SeekEntryResult!13628)

(assert (=> b!1573243 (= e!877289 (Intermediate!13628 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573244 () Bool)

(declare-fun e!877292 () Bool)

(declare-fun e!877293 () Bool)

(assert (=> b!1573244 (= e!877292 e!877293)))

(declare-fun res!1074883 () Bool)

(declare-fun lt!674163 () SeekEntryResult!13628)

(assert (=> b!1573244 (= res!1074883 (and (is-Intermediate!13628 lt!674163) (not (undefined!14440 lt!674163)) (bvslt (x!141706 lt!674163) #b01111111111111111111111111111110) (bvsge (x!141706 lt!674163) #b00000000000000000000000000000000) (bvsge (x!141706 lt!674163) #b00000000000000000000000000000000)))))

(assert (=> b!1573244 (=> (not res!1074883) (not e!877293))))

(declare-fun b!1573245 () Bool)

(assert (=> b!1573245 (and (bvsge (index!56912 lt!674163) #b00000000000000000000000000000000) (bvslt (index!56912 lt!674163) (size!51232 _keys!600)))))

(declare-fun res!1074882 () Bool)

(assert (=> b!1573245 (= res!1074882 (= (select (arr!50680 _keys!600) (index!56912 lt!674163)) k!754))))

(declare-fun e!877291 () Bool)

(assert (=> b!1573245 (=> res!1074882 e!877291)))

(assert (=> b!1573245 (= e!877293 e!877291)))

(declare-fun b!1573246 () Bool)

(assert (=> b!1573246 (= e!877290 e!877289)))

(declare-fun c!145437 () Bool)

(declare-fun lt!674164 () (_ BitVec 64))

(assert (=> b!1573246 (= c!145437 (or (= lt!674164 k!754) (= (bvadd lt!674164 lt!674164) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573247 () Bool)

(assert (=> b!1573247 (= e!877292 (bvsge (x!141706 lt!674163) #b01111111111111111111111111111110))))

(declare-fun b!1573248 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573248 (= e!877289 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573249 () Bool)

(assert (=> b!1573249 (and (bvsge (index!56912 lt!674163) #b00000000000000000000000000000000) (bvslt (index!56912 lt!674163) (size!51232 _keys!600)))))

(declare-fun res!1074881 () Bool)

(assert (=> b!1573249 (= res!1074881 (= (select (arr!50680 _keys!600) (index!56912 lt!674163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573249 (=> res!1074881 e!877291)))

(declare-fun b!1573250 () Bool)

(assert (=> b!1573250 (and (bvsge (index!56912 lt!674163) #b00000000000000000000000000000000) (bvslt (index!56912 lt!674163) (size!51232 _keys!600)))))

(assert (=> b!1573250 (= e!877291 (= (select (arr!50680 _keys!600) (index!56912 lt!674163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!164757 () Bool)

(assert (=> d!164757 e!877292))

(declare-fun c!145436 () Bool)

(assert (=> d!164757 (= c!145436 (and (is-Intermediate!13628 lt!674163) (undefined!14440 lt!674163)))))

(assert (=> d!164757 (= lt!674163 e!877290)))

(declare-fun c!145438 () Bool)

(assert (=> d!164757 (= c!145438 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164757 (= lt!674164 (select (arr!50680 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164757 (validMask!0 mask!889)))

(assert (=> d!164757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674163)))

(assert (= (and d!164757 c!145438) b!1573242))

(assert (= (and d!164757 (not c!145438)) b!1573246))

(assert (= (and b!1573246 c!145437) b!1573243))

(assert (= (and b!1573246 (not c!145437)) b!1573248))

(assert (= (and d!164757 c!145436) b!1573247))

(assert (= (and d!164757 (not c!145436)) b!1573244))

(assert (= (and b!1573244 res!1074883) b!1573245))

(assert (= (and b!1573245 (not res!1074882)) b!1573249))

(assert (= (and b!1573249 (not res!1074881)) b!1573250))

(assert (=> b!1573248 m!1446017))

(declare-fun m!1446029 () Bool)

(assert (=> b!1573248 m!1446029))

(assert (=> b!1573248 m!1446029))

(declare-fun m!1446031 () Bool)

(assert (=> b!1573248 m!1446031))

(declare-fun m!1446033 () Bool)

(assert (=> b!1573245 m!1446033))

(assert (=> b!1573250 m!1446033))

(assert (=> d!164757 m!1446017))

(declare-fun m!1446035 () Bool)

(assert (=> d!164757 m!1446035))

(assert (=> d!164757 m!1446011))

(assert (=> b!1573249 m!1446033))

(assert (=> b!1573178 d!164757))

(declare-fun d!164765 () Bool)

(declare-fun lt!674182 () (_ BitVec 32))

(declare-fun lt!674181 () (_ BitVec 32))

(assert (=> d!164765 (= lt!674182 (bvmul (bvxor lt!674181 (bvlshr lt!674181 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164765 (= lt!674181 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164765 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074887 (let ((h!38280 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141711 (bvmul (bvxor h!38280 (bvlshr h!38280 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141711 (bvlshr x!141711 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074887 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074887 #b00000000000000000000000000000000))))))

(assert (=> d!164765 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674182 (bvlshr lt!674182 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573178 d!164765))

(declare-fun d!164771 () Bool)

(assert (=> d!164771 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135232 d!164771))

(declare-fun d!164779 () Bool)

(assert (=> d!164779 (= (array_inv!39616 _keys!600) (bvsge (size!51232 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135232 d!164779))

(push 1)

(assert (not d!164757))

(assert (not b!1573248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

