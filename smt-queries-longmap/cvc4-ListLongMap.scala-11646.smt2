; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136362 () Bool)

(assert start!136362)

(declare-fun res!1077507 () Bool)

(declare-fun e!880331 () Bool)

(assert (=> start!136362 (=> (not res!1077507) (not e!880331))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136362 (= res!1077507 (validMask!0 mask!898))))

(assert (=> start!136362 e!880331))

(assert (=> start!136362 true))

(declare-datatypes ((array!105568 0))(
  ( (array!105569 (arr!50912 (Array (_ BitVec 32) (_ BitVec 64))) (size!51463 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105568)

(declare-fun array_inv!39867 (array!105568) Bool)

(assert (=> start!136362 (array_inv!39867 _keys!605)))

(declare-fun b!1578094 () Bool)

(declare-fun res!1077509 () Bool)

(assert (=> b!1578094 (=> (not res!1077509) (not e!880331))))

(assert (=> b!1578094 (= res!1077509 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51463 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578095 () Bool)

(declare-fun res!1077508 () Bool)

(assert (=> b!1578095 (=> (not res!1077508) (not e!880331))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578095 (= res!1077508 (validKeyInArray!0 k!761))))

(declare-fun b!1578096 () Bool)

(declare-datatypes ((SeekEntryResult!13671 0))(
  ( (MissingZero!13671 (index!57082 (_ BitVec 32))) (Found!13671 (index!57083 (_ BitVec 32))) (Intermediate!13671 (undefined!14483 Bool) (index!57084 (_ BitVec 32)) (x!142252 (_ BitVec 32))) (Undefined!13671) (MissingVacant!13671 (index!57085 (_ BitVec 32))) )
))
(declare-fun lt!676185 () SeekEntryResult!13671)

(assert (=> b!1578096 (= e!880331 (and (is-Intermediate!13671 lt!676185) (not (undefined!14483 lt!676185)) (not (= (select (arr!50912 _keys!605) (index!57084 lt!676185)) k!761)) (not (= (select (arr!50912 _keys!605) (index!57084 lt!676185)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57084 lt!676185) #b00000000000000000000000000000000) (bvsge (index!57084 lt!676185) (size!51463 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105568 (_ BitVec 32)) SeekEntryResult!13671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578096 (= lt!676185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136362 res!1077507) b!1578094))

(assert (= (and b!1578094 res!1077509) b!1578095))

(assert (= (and b!1578095 res!1077508) b!1578096))

(declare-fun m!1450899 () Bool)

(assert (=> start!136362 m!1450899))

(declare-fun m!1450901 () Bool)

(assert (=> start!136362 m!1450901))

(declare-fun m!1450903 () Bool)

(assert (=> b!1578095 m!1450903))

(declare-fun m!1450905 () Bool)

(assert (=> b!1578096 m!1450905))

(declare-fun m!1450907 () Bool)

(assert (=> b!1578096 m!1450907))

(assert (=> b!1578096 m!1450907))

(declare-fun m!1450909 () Bool)

(assert (=> b!1578096 m!1450909))

(push 1)

(assert (not start!136362))

(assert (not b!1578095))

(assert (not b!1578096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166195 () Bool)

(assert (=> d!166195 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136362 d!166195))

(declare-fun d!166197 () Bool)

(assert (=> d!166197 (= (array_inv!39867 _keys!605) (bvsge (size!51463 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136362 d!166197))

(declare-fun d!166199 () Bool)

(assert (=> d!166199 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578095 d!166199))

(declare-fun b!1578178 () Bool)

(declare-fun e!880382 () Bool)

(declare-fun lt!676217 () SeekEntryResult!13671)

(assert (=> b!1578178 (= e!880382 (bvsge (x!142252 lt!676217) #b01111111111111111111111111111110))))

(declare-fun b!1578179 () Bool)

(assert (=> b!1578179 (and (bvsge (index!57084 lt!676217) #b00000000000000000000000000000000) (bvslt (index!57084 lt!676217) (size!51463 _keys!605)))))

(declare-fun e!880379 () Bool)

(assert (=> b!1578179 (= e!880379 (= (select (arr!50912 _keys!605) (index!57084 lt!676217)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1578180 () Bool)

(declare-fun e!880378 () SeekEntryResult!13671)

(assert (=> b!1578180 (= e!880378 (Intermediate!13671 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun e!880381 () SeekEntryResult!13671)

(declare-fun b!1578181 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578181 (= e!880381 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1578182 () Bool)

(assert (=> b!1578182 (= e!880381 (Intermediate!13671 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578183 () Bool)

(assert (=> b!1578183 (and (bvsge (index!57084 lt!676217) #b00000000000000000000000000000000) (bvslt (index!57084 lt!676217) (size!51463 _keys!605)))))

(declare-fun res!1077545 () Bool)

(assert (=> b!1578183 (= res!1077545 (= (select (arr!50912 _keys!605) (index!57084 lt!676217)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578183 (=> res!1077545 e!880379)))

(declare-fun b!1578185 () Bool)

(assert (=> b!1578185 (= e!880378 e!880381)))

(declare-fun c!146598 () Bool)

(declare-fun lt!676218 () (_ BitVec 64))

(assert (=> b!1578185 (= c!146598 (or (= lt!676218 k!761) (= (bvadd lt!676218 lt!676218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578186 () Bool)

(declare-fun e!880380 () Bool)

(assert (=> b!1578186 (= e!880382 e!880380)))

(declare-fun res!1077546 () Bool)

(assert (=> b!1578186 (= res!1077546 (and (is-Intermediate!13671 lt!676217) (not (undefined!14483 lt!676217)) (bvslt (x!142252 lt!676217) #b01111111111111111111111111111110) (bvsge (x!142252 lt!676217) #b00000000000000000000000000000000) (bvsge (x!142252 lt!676217) #b00000000000000000000000000000000)))))

(assert (=> b!1578186 (=> (not res!1077546) (not e!880380))))

(declare-fun b!1578184 () Bool)

(assert (=> b!1578184 (and (bvsge (index!57084 lt!676217) #b00000000000000000000000000000000) (bvslt (index!57084 lt!676217) (size!51463 _keys!605)))))

(declare-fun res!1077547 () Bool)

(assert (=> b!1578184 (= res!1077547 (= (select (arr!50912 _keys!605) (index!57084 lt!676217)) k!761))))

(assert (=> b!1578184 (=> res!1077547 e!880379)))

(assert (=> b!1578184 (= e!880380 e!880379)))

(declare-fun d!166201 () Bool)

(assert (=> d!166201 e!880382))

(declare-fun c!146599 () Bool)

(assert (=> d!166201 (= c!146599 (and (is-Intermediate!13671 lt!676217) (undefined!14483 lt!676217)))))

(assert (=> d!166201 (= lt!676217 e!880378)))

(declare-fun c!146600 () Bool)

(assert (=> d!166201 (= c!146600 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166201 (= lt!676218 (select (arr!50912 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166201 (validMask!0 mask!898)))

(assert (=> d!166201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676217)))

(assert (= (and d!166201 c!146600) b!1578180))

(assert (= (and d!166201 (not c!146600)) b!1578185))

(assert (= (and b!1578185 c!146598) b!1578182))

(assert (= (and b!1578185 (not c!146598)) b!1578181))

(assert (= (and d!166201 c!146599) b!1578178))

(assert (= (and d!166201 (not c!146599)) b!1578186))

(assert (= (and b!1578186 res!1077546) b!1578184))

(assert (= (and b!1578184 (not res!1077547)) b!1578183))

(assert (= (and b!1578183 (not res!1077545)) b!1578179))

(assert (=> d!166201 m!1450907))

(declare-fun m!1450939 () Bool)

(assert (=> d!166201 m!1450939))

(assert (=> d!166201 m!1450899))

(declare-fun m!1450941 () Bool)

(assert (=> b!1578179 m!1450941))

(assert (=> b!1578181 m!1450907))

(declare-fun m!1450943 () Bool)

(assert (=> b!1578181 m!1450943))

(assert (=> b!1578181 m!1450943))

(declare-fun m!1450945 () Bool)

(assert (=> b!1578181 m!1450945))

(assert (=> b!1578183 m!1450941))

(assert (=> b!1578184 m!1450941))

(assert (=> b!1578096 d!166201))

(declare-fun d!166215 () Bool)

(declare-fun lt!676224 () (_ BitVec 32))

(declare-fun lt!676223 () (_ BitVec 32))

(assert (=> d!166215 (= lt!676224 (bvmul (bvxor lt!676223 (bvlshr lt!676223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166215 (= lt!676223 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166215 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077548 (let ((h!38322 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142259 (bvmul (bvxor h!38322 (bvlshr h!38322 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142259 (bvlshr x!142259 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077548 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077548 #b00000000000000000000000000000000))))))

(assert (=> d!166215 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676224 (bvlshr lt!676224 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1578096 d!166215))

(push 1)

(assert (not d!166201))

(assert (not b!1578181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

