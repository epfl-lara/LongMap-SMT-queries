; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135194 () Bool)

(assert start!135194)

(declare-fun b!1573131 () Bool)

(declare-fun res!1074839 () Bool)

(declare-fun e!877242 () Bool)

(assert (=> b!1573131 (=> (not res!1074839) (not e!877242))))

(declare-datatypes ((array!105096 0))(
  ( (array!105097 (arr!50707 (Array (_ BitVec 32) (_ BitVec 64))) (size!51257 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105096)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1573131 (= res!1074839 (= (size!51257 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573133 () Bool)

(declare-fun e!877244 () Bool)

(assert (=> b!1573133 (= e!877242 e!877244)))

(declare-fun res!1074837 () Bool)

(assert (=> b!1573133 (=> (not res!1074837) (not e!877244))))

(declare-datatypes ((SeekEntryResult!13620 0))(
  ( (MissingZero!13620 (index!56878 (_ BitVec 32))) (Found!13620 (index!56879 (_ BitVec 32))) (Intermediate!13620 (undefined!14432 Bool) (index!56880 (_ BitVec 32)) (x!141669 (_ BitVec 32))) (Undefined!13620) (MissingVacant!13620 (index!56881 (_ BitVec 32))) )
))
(declare-fun lt!674278 () SeekEntryResult!13620)

(declare-fun k!754 () (_ BitVec 64))

(assert (=> b!1573133 (= res!1074837 (and (not (undefined!14432 lt!674278)) (is-Intermediate!13620 lt!674278) (not (= (select (arr!50707 _keys!600) (index!56880 lt!674278)) k!754)) (not (= (select (arr!50707 _keys!600) (index!56880 lt!674278)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50707 _keys!600) (index!56880 lt!674278)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56880 lt!674278) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674278) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105096 (_ BitVec 32)) SeekEntryResult!13620)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573133 (= lt!674278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun res!1074838 () Bool)

(assert (=> start!135194 (=> (not res!1074838) (not e!877242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135194 (= res!1074838 (validMask!0 mask!889))))

(assert (=> start!135194 e!877242))

(assert (=> start!135194 true))

(declare-fun array_inv!39434 (array!105096) Bool)

(assert (=> start!135194 (array_inv!39434 _keys!600)))

(declare-fun b!1573132 () Bool)

(declare-fun res!1074840 () Bool)

(assert (=> b!1573132 (=> (not res!1074840) (not e!877242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573132 (= res!1074840 (validKeyInArray!0 k!754))))

(declare-fun b!1573134 () Bool)

(declare-fun lt!674277 () SeekEntryResult!13620)

(assert (=> b!1573134 (= e!877244 (and (not (is-MissingVacant!13620 lt!674277)) (not (is-Found!13620 lt!674277)) (not (is-MissingZero!13620 lt!674277)) (not (is-Undefined!13620 lt!674277))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105096 (_ BitVec 32)) SeekEntryResult!13620)

(assert (=> b!1573134 (= lt!674277 (seekKeyOrZeroReturnVacant!0 (x!141669 lt!674278) (index!56880 lt!674278) (index!56880 lt!674278) k!754 _keys!600 mask!889))))

(assert (= (and start!135194 res!1074838) b!1573131))

(assert (= (and b!1573131 res!1074839) b!1573132))

(assert (= (and b!1573132 res!1074840) b!1573133))

(assert (= (and b!1573133 res!1074837) b!1573134))

(declare-fun m!1446697 () Bool)

(assert (=> b!1573133 m!1446697))

(declare-fun m!1446699 () Bool)

(assert (=> b!1573133 m!1446699))

(assert (=> b!1573133 m!1446699))

(declare-fun m!1446701 () Bool)

(assert (=> b!1573133 m!1446701))

(declare-fun m!1446703 () Bool)

(assert (=> start!135194 m!1446703))

(declare-fun m!1446705 () Bool)

(assert (=> start!135194 m!1446705))

(declare-fun m!1446707 () Bool)

(assert (=> b!1573132 m!1446707))

(declare-fun m!1446709 () Bool)

(assert (=> b!1573134 m!1446709))

(push 1)

(assert (not b!1573132))

(assert (not start!135194))

(assert (not b!1573133))

(assert (not b!1573134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164933 () Bool)

(assert (=> d!164933 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573132 d!164933))

(declare-fun d!164935 () Bool)

(assert (=> d!164935 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135194 d!164935))

(declare-fun d!164941 () Bool)

(assert (=> d!164941 (= (array_inv!39434 _keys!600) (bvsge (size!51257 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135194 d!164941))

(declare-fun b!1573204 () Bool)

(declare-fun e!877289 () SeekEntryResult!13620)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573204 (= e!877289 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573205 () Bool)

(declare-fun e!877290 () Bool)

(declare-fun e!877288 () Bool)

(assert (=> b!1573205 (= e!877290 e!877288)))

(declare-fun res!1074883 () Bool)

(declare-fun lt!674307 () SeekEntryResult!13620)

(assert (=> b!1573205 (= res!1074883 (and (is-Intermediate!13620 lt!674307) (not (undefined!14432 lt!674307)) (bvslt (x!141669 lt!674307) #b01111111111111111111111111111110) (bvsge (x!141669 lt!674307) #b00000000000000000000000000000000) (bvsge (x!141669 lt!674307) #b00000000000000000000000000000000)))))

(assert (=> b!1573205 (=> (not res!1074883) (not e!877288))))

(declare-fun b!1573206 () Bool)

(assert (=> b!1573206 (= e!877289 (Intermediate!13620 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164943 () Bool)

(assert (=> d!164943 e!877290))

(declare-fun c!145411 () Bool)

(assert (=> d!164943 (= c!145411 (and (is-Intermediate!13620 lt!674307) (undefined!14432 lt!674307)))))

(declare-fun e!877291 () SeekEntryResult!13620)

(assert (=> d!164943 (= lt!674307 e!877291)))

(declare-fun c!145413 () Bool)

(assert (=> d!164943 (= c!145413 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674308 () (_ BitVec 64))

(assert (=> d!164943 (= lt!674308 (select (arr!50707 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164943 (validMask!0 mask!889)))

(assert (=> d!164943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674307)))

(declare-fun b!1573207 () Bool)

(assert (=> b!1573207 (and (bvsge (index!56880 lt!674307) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674307) (size!51257 _keys!600)))))

(declare-fun e!877292 () Bool)

(assert (=> b!1573207 (= e!877292 (= (select (arr!50707 _keys!600) (index!56880 lt!674307)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573208 () Bool)

(assert (=> b!1573208 (and (bvsge (index!56880 lt!674307) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674307) (size!51257 _keys!600)))))

(declare-fun res!1074882 () Bool)

(assert (=> b!1573208 (= res!1074882 (= (select (arr!50707 _keys!600) (index!56880 lt!674307)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573208 (=> res!1074882 e!877292)))

(declare-fun b!1573209 () Bool)

(assert (=> b!1573209 (= e!877291 e!877289)))

(declare-fun c!145412 () Bool)

(assert (=> b!1573209 (= c!145412 (or (= lt!674308 k!754) (= (bvadd lt!674308 lt!674308) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573210 () Bool)

(assert (=> b!1573210 (and (bvsge (index!56880 lt!674307) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674307) (size!51257 _keys!600)))))

(declare-fun res!1074881 () Bool)

(assert (=> b!1573210 (= res!1074881 (= (select (arr!50707 _keys!600) (index!56880 lt!674307)) k!754))))

(assert (=> b!1573210 (=> res!1074881 e!877292)))

(assert (=> b!1573210 (= e!877288 e!877292)))

(declare-fun b!1573211 () Bool)

(assert (=> b!1573211 (= e!877291 (Intermediate!13620 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573212 () Bool)

(assert (=> b!1573212 (= e!877290 (bvsge (x!141669 lt!674307) #b01111111111111111111111111111110))))

(assert (= (and d!164943 c!145413) b!1573211))

(assert (= (and d!164943 (not c!145413)) b!1573209))

(assert (= (and b!1573209 c!145412) b!1573206))

(assert (= (and b!1573209 (not c!145412)) b!1573204))

(assert (= (and d!164943 c!145411) b!1573212))

(assert (= (and d!164943 (not c!145411)) b!1573205))

(assert (= (and b!1573205 res!1074883) b!1573210))

(assert (= (and b!1573210 (not res!1074881)) b!1573208))

(assert (= (and b!1573208 (not res!1074882)) b!1573207))

(assert (=> b!1573204 m!1446699))

(declare-fun m!1446747 () Bool)

(assert (=> b!1573204 m!1446747))

(assert (=> b!1573204 m!1446747))

(declare-fun m!1446749 () Bool)

(assert (=> b!1573204 m!1446749))

(assert (=> d!164943 m!1446699))

(declare-fun m!1446751 () Bool)

(assert (=> d!164943 m!1446751))

(assert (=> d!164943 m!1446703))

(declare-fun m!1446753 () Bool)

(assert (=> b!1573208 m!1446753))

(assert (=> b!1573207 m!1446753))

(assert (=> b!1573210 m!1446753))

(assert (=> b!1573133 d!164943))

(declare-fun d!164953 () Bool)

(declare-fun lt!674318 () (_ BitVec 32))

(declare-fun lt!674317 () (_ BitVec 32))

(assert (=> d!164953 (= lt!674318 (bvmul (bvxor lt!674317 (bvlshr lt!674317 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164953 (= lt!674317 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164953 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074884 (let ((h!38232 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141675 (bvmul (bvxor h!38232 (bvlshr h!38232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141675 (bvlshr x!141675 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074884 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074884 #b00000000000000000000000000000000))))))

(assert (=> d!164953 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674318 (bvlshr lt!674318 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573133 d!164953))

(declare-fun b!1573270 () Bool)

(declare-fun e!877323 () SeekEntryResult!13620)

(assert (=> b!1573270 (= e!877323 Undefined!13620)))

(declare-fun lt!674337 () SeekEntryResult!13620)

(declare-fun d!164955 () Bool)

(assert (=> d!164955 (and (or (is-Undefined!13620 lt!674337) (not (is-Found!13620 lt!674337)) (and (bvsge (index!56879 lt!674337) #b00000000000000000000000000000000) (bvslt (index!56879 lt!674337) (size!51257 _keys!600)))) (or (is-Undefined!13620 lt!674337) (is-Found!13620 lt!674337) (not (is-MissingVacant!13620 lt!674337)) (not (= (index!56881 lt!674337) (index!56880 lt!674278))) (and (bvsge (index!56881 lt!674337) #b00000000000000000000000000000000) (bvslt (index!56881 lt!674337) (size!51257 _keys!600)))) (or (is-Undefined!13620 lt!674337) (ite (is-Found!13620 lt!674337) (= (select (arr!50707 _keys!600) (index!56879 lt!674337)) k!754) (and (is-MissingVacant!13620 lt!674337) (= (index!56881 lt!674337) (index!56880 lt!674278)) (= (select (arr!50707 _keys!600) (index!56881 lt!674337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!164955 (= lt!674337 e!877323)))

(declare-fun c!145439 () Bool)

(assert (=> d!164955 (= c!145439 (bvsge (x!141669 lt!674278) #b01111111111111111111111111111110))))

(declare-fun lt!674338 () (_ BitVec 64))

(assert (=> d!164955 (= lt!674338 (select (arr!50707 _keys!600) (index!56880 lt!674278)))))

(assert (=> d!164955 (validMask!0 mask!889)))

(assert (=> d!164955 (= (seekKeyOrZeroReturnVacant!0 (x!141669 lt!674278) (index!56880 lt!674278) (index!56880 lt!674278) k!754 _keys!600 mask!889) lt!674337)))

(declare-fun b!1573271 () Bool)

(declare-fun e!877324 () SeekEntryResult!13620)

(assert (=> b!1573271 (= e!877324 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141669 lt!674278) #b00000000000000000000000000000001) (nextIndex!0 (index!56880 lt!674278) (x!141669 lt!674278) mask!889) (index!56880 lt!674278) k!754 _keys!600 mask!889))))

(declare-fun b!1573272 () Bool)

(declare-fun e!877325 () SeekEntryResult!13620)

(assert (=> b!1573272 (= e!877323 e!877325)))

(declare-fun c!145438 () Bool)

(assert (=> b!1573272 (= c!145438 (= lt!674338 k!754))))

(declare-fun b!1573273 () Bool)

(declare-fun c!145440 () Bool)

(assert (=> b!1573273 (= c!145440 (= lt!674338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573273 (= e!877325 e!877324)))

(declare-fun b!1573274 () Bool)

(assert (=> b!1573274 (= e!877324 (MissingVacant!13620 (index!56880 lt!674278)))))

(declare-fun b!1573275 () Bool)

(assert (=> b!1573275 (= e!877325 (Found!13620 (index!56880 lt!674278)))))

(assert (= (and d!164955 c!145439) b!1573270))

(assert (= (and d!164955 (not c!145439)) b!1573272))

(assert (= (and b!1573272 c!145438) b!1573275))

(assert (= (and b!1573272 (not c!145438)) b!1573273))

(assert (= (and b!1573273 c!145440) b!1573274))

(assert (= (and b!1573273 (not c!145440)) b!1573271))

(declare-fun m!1446771 () Bool)

(assert (=> d!164955 m!1446771))

(declare-fun m!1446773 () Bool)

(assert (=> d!164955 m!1446773))

(assert (=> d!164955 m!1446697))

(assert (=> d!164955 m!1446703))

(declare-fun m!1446775 () Bool)

(assert (=> b!1573271 m!1446775))

(assert (=> b!1573271 m!1446775))

(declare-fun m!1446777 () Bool)

(assert (=> b!1573271 m!1446777))

(assert (=> b!1573134 d!164955))

(push 1)

(assert (not b!1573271))

(assert (not d!164955))

(assert (not b!1573204))

(assert (not d!164943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

