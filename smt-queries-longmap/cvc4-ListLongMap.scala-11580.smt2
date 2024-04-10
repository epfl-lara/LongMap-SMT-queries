; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134946 () Bool)

(assert start!134946)

(declare-fun res!1074235 () Bool)

(declare-fun e!876677 () Bool)

(assert (=> start!134946 (=> (not res!1074235) (not e!876677))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134946 (= res!1074235 (validMask!0 mask!889))))

(assert (=> start!134946 e!876677))

(assert (=> start!134946 true))

(declare-datatypes ((array!104989 0))(
  ( (array!104990 (arr!50661 (Array (_ BitVec 32) (_ BitVec 64))) (size!51211 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104989)

(declare-fun array_inv!39388 (array!104989) Bool)

(assert (=> start!134946 (array_inv!39388 _keys!600)))

(declare-fun b!1572220 () Bool)

(declare-fun res!1074236 () Bool)

(assert (=> b!1572220 (=> (not res!1074236) (not e!876677))))

(assert (=> b!1572220 (= res!1074236 (= (size!51211 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572221 () Bool)

(declare-fun res!1074237 () Bool)

(assert (=> b!1572221 (=> (not res!1074237) (not e!876677))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572221 (= res!1074237 (validKeyInArray!0 k!754))))

(declare-fun b!1572222 () Bool)

(declare-datatypes ((SeekEntryResult!13574 0))(
  ( (MissingZero!13574 (index!56694 (_ BitVec 32))) (Found!13574 (index!56695 (_ BitVec 32))) (Intermediate!13574 (undefined!14386 Bool) (index!56696 (_ BitVec 32)) (x!141462 (_ BitVec 32))) (Undefined!13574) (MissingVacant!13574 (index!56697 (_ BitVec 32))) )
))
(declare-fun lt!673903 () SeekEntryResult!13574)

(assert (=> b!1572222 (= e!876677 (and (is-Intermediate!13574 lt!673903) (not (undefined!14386 lt!673903)) (not (= (select (arr!50661 _keys!600) (index!56696 lt!673903)) k!754)) (not (= (select (arr!50661 _keys!600) (index!56696 lt!673903)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50661 _keys!600) (index!56696 lt!673903)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!56696 lt!673903) #b00000000000000000000000000000000) (bvsge (index!56696 lt!673903) (bvadd #b00000000000000000000000000000001 mask!889)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104989 (_ BitVec 32)) SeekEntryResult!13574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572222 (= lt!673903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134946 res!1074235) b!1572220))

(assert (= (and b!1572220 res!1074236) b!1572221))

(assert (= (and b!1572221 res!1074237) b!1572222))

(declare-fun m!1446031 () Bool)

(assert (=> start!134946 m!1446031))

(declare-fun m!1446033 () Bool)

(assert (=> start!134946 m!1446033))

(declare-fun m!1446035 () Bool)

(assert (=> b!1572221 m!1446035))

(declare-fun m!1446037 () Bool)

(assert (=> b!1572222 m!1446037))

(declare-fun m!1446039 () Bool)

(assert (=> b!1572222 m!1446039))

(assert (=> b!1572222 m!1446039))

(declare-fun m!1446041 () Bool)

(assert (=> b!1572222 m!1446041))

(push 1)

(assert (not b!1572222))

(assert (not start!134946))

(assert (not b!1572221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164747 () Bool)

(declare-fun e!876716 () Bool)

(assert (=> d!164747 e!876716))

(declare-fun c!145255 () Bool)

(declare-fun lt!673924 () SeekEntryResult!13574)

(assert (=> d!164747 (= c!145255 (and (is-Intermediate!13574 lt!673924) (undefined!14386 lt!673924)))))

(declare-fun e!876713 () SeekEntryResult!13574)

(assert (=> d!164747 (= lt!673924 e!876713)))

(declare-fun c!145256 () Bool)

(assert (=> d!164747 (= c!145256 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!673925 () (_ BitVec 64))

(assert (=> d!164747 (= lt!673925 (select (arr!50661 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164747 (validMask!0 mask!889)))

(assert (=> d!164747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673924)))

(declare-fun b!1572284 () Bool)

(assert (=> b!1572284 (and (bvsge (index!56696 lt!673924) #b00000000000000000000000000000000) (bvslt (index!56696 lt!673924) (size!51211 _keys!600)))))

(declare-fun res!1074258 () Bool)

(assert (=> b!1572284 (= res!1074258 (= (select (arr!50661 _keys!600) (index!56696 lt!673924)) k!754))))

(declare-fun e!876714 () Bool)

(assert (=> b!1572284 (=> res!1074258 e!876714)))

(declare-fun e!876717 () Bool)

(assert (=> b!1572284 (= e!876717 e!876714)))

(declare-fun b!1572285 () Bool)

(assert (=> b!1572285 (and (bvsge (index!56696 lt!673924) #b00000000000000000000000000000000) (bvslt (index!56696 lt!673924) (size!51211 _keys!600)))))

(declare-fun res!1074262 () Bool)

(assert (=> b!1572285 (= res!1074262 (= (select (arr!50661 _keys!600) (index!56696 lt!673924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572285 (=> res!1074262 e!876714)))

(declare-fun b!1572286 () Bool)

(assert (=> b!1572286 (and (bvsge (index!56696 lt!673924) #b00000000000000000000000000000000) (bvslt (index!56696 lt!673924) (size!51211 _keys!600)))))

(assert (=> b!1572286 (= e!876714 (= (select (arr!50661 _keys!600) (index!56696 lt!673924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572287 () Bool)

(declare-fun e!876715 () SeekEntryResult!13574)

(assert (=> b!1572287 (= e!876715 (Intermediate!13574 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572288 () Bool)

(assert (=> b!1572288 (= e!876713 (Intermediate!13574 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572289 () Bool)

(assert (=> b!1572289 (= e!876716 e!876717)))

(declare-fun res!1074259 () Bool)

(assert (=> b!1572289 (= res!1074259 (and (is-Intermediate!13574 lt!673924) (not (undefined!14386 lt!673924)) (bvslt (x!141462 lt!673924) #b01111111111111111111111111111110) (bvsge (x!141462 lt!673924) #b00000000000000000000000000000000) (bvsge (x!141462 lt!673924) #b00000000000000000000000000000000)))))

(assert (=> b!1572289 (=> (not res!1074259) (not e!876717))))

(declare-fun b!1572290 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572290 (= e!876715 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572291 () Bool)

(assert (=> b!1572291 (= e!876713 e!876715)))

(declare-fun c!145257 () Bool)

(assert (=> b!1572291 (= c!145257 (or (= lt!673925 k!754) (= (bvadd lt!673925 lt!673925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572292 () Bool)

(assert (=> b!1572292 (= e!876716 (bvsge (x!141462 lt!673924) #b01111111111111111111111111111110))))

(assert (= (and d!164747 c!145256) b!1572288))

(assert (= (and d!164747 (not c!145256)) b!1572291))

(assert (= (and b!1572291 c!145257) b!1572287))

(assert (= (and b!1572291 (not c!145257)) b!1572290))

(assert (= (and d!164747 c!145255) b!1572292))

(assert (= (and d!164747 (not c!145255)) b!1572289))

(assert (= (and b!1572289 res!1074259) b!1572284))

(assert (= (and b!1572284 (not res!1074258)) b!1572285))

(assert (= (and b!1572285 (not res!1074262)) b!1572286))

(declare-fun m!1446051 () Bool)

(assert (=> b!1572286 m!1446051))

(assert (=> d!164747 m!1446039))

(declare-fun m!1446053 () Bool)

(assert (=> d!164747 m!1446053))

(assert (=> d!164747 m!1446031))

(assert (=> b!1572285 m!1446051))

(assert (=> b!1572290 m!1446039))

(declare-fun m!1446055 () Bool)

(assert (=> b!1572290 m!1446055))

(assert (=> b!1572290 m!1446055))

(declare-fun m!1446057 () Bool)

(assert (=> b!1572290 m!1446057))

(assert (=> b!1572284 m!1446051))

(assert (=> b!1572222 d!164747))

(declare-fun d!164759 () Bool)

(declare-fun lt!673933 () (_ BitVec 32))

(declare-fun lt!673932 () (_ BitVec 32))

(assert (=> d!164759 (= lt!673933 (bvmul (bvxor lt!673932 (bvlshr lt!673932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164759 (= lt!673932 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164759 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074263 (let ((h!38217 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141467 (bvmul (bvxor h!38217 (bvlshr h!38217 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141467 (bvlshr x!141467 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074263 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074263 #b00000000000000000000000000000000))))))

(assert (=> d!164759 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673933 (bvlshr lt!673933 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572222 d!164759))

(declare-fun d!164767 () Bool)

(assert (=> d!164767 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134946 d!164767))

(declare-fun d!164769 () Bool)

(assert (=> d!164769 (= (array_inv!39388 _keys!600) (bvsge (size!51211 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134946 d!164769))

(declare-fun d!164771 () Bool)

(assert (=> d!164771 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572221 d!164771))

(push 1)

