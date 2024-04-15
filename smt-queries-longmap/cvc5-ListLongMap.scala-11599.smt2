; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135268 () Bool)

(assert start!135268)

(declare-fun res!1074921 () Bool)

(declare-fun e!877324 () Bool)

(assert (=> start!135268 (=> (not res!1074921) (not e!877324))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135268 (= res!1074921 (validMask!0 mask!889))))

(assert (=> start!135268 e!877324))

(assert (=> start!135268 true))

(declare-datatypes ((array!105055 0))(
  ( (array!105056 (arr!50683 (Array (_ BitVec 32) (_ BitVec 64))) (size!51235 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105055)

(declare-fun array_inv!39619 (array!105055) Bool)

(assert (=> start!135268 (array_inv!39619 _keys!600)))

(declare-fun b!1573295 () Bool)

(declare-fun e!877325 () Bool)

(declare-datatypes ((SeekEntryResult!13631 0))(
  ( (MissingZero!13631 (index!56922 (_ BitVec 32))) (Found!13631 (index!56923 (_ BitVec 32))) (Intermediate!13631 (undefined!14443 Bool) (index!56924 (_ BitVec 32)) (x!141723 (_ BitVec 32))) (Undefined!13631) (MissingVacant!13631 (index!56925 (_ BitVec 32))) )
))
(declare-fun lt!674211 () SeekEntryResult!13631)

(assert (=> b!1573295 (= e!877325 (and (not (is-MissingVacant!13631 lt!674211)) (is-Found!13631 lt!674211) (or (bvslt (index!56923 lt!674211) #b00000000000000000000000000000000) (bvsge (index!56923 lt!674211) (size!51235 _keys!600)))))))

(declare-fun err!146 () SeekEntryResult!13631)

(assert (=> b!1573295 (= lt!674211 err!146)))

(assert (=> b!1573295 true))

(declare-fun b!1573294 () Bool)

(assert (=> b!1573294 (= e!877324 e!877325)))

(declare-fun res!1074922 () Bool)

(assert (=> b!1573294 (=> (not res!1074922) (not e!877325))))

(declare-fun lt!674210 () Bool)

(declare-fun lt!674209 () SeekEntryResult!13631)

(assert (=> b!1573294 (= res!1074922 (and (or lt!674210 (not (undefined!14443 lt!674209))) (or lt!674210 (undefined!14443 lt!674209))))))

(assert (=> b!1573294 (= lt!674210 (not (is-Intermediate!13631 lt!674209)))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105055 (_ BitVec 32)) SeekEntryResult!13631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573294 (= lt!674209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573293 () Bool)

(declare-fun res!1074924 () Bool)

(assert (=> b!1573293 (=> (not res!1074924) (not e!877324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573293 (= res!1074924 (validKeyInArray!0 k!754))))

(declare-fun b!1573292 () Bool)

(declare-fun res!1074923 () Bool)

(assert (=> b!1573292 (=> (not res!1074923) (not e!877324))))

(assert (=> b!1573292 (= res!1074923 (= (size!51235 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(assert (= (and start!135268 res!1074921) b!1573292))

(assert (= (and b!1573292 res!1074923) b!1573293))

(assert (= (and b!1573293 res!1074924) b!1573294))

(assert (= (and b!1573294 res!1074922) b!1573295))

(declare-fun m!1446065 () Bool)

(assert (=> start!135268 m!1446065))

(declare-fun m!1446067 () Bool)

(assert (=> start!135268 m!1446067))

(declare-fun m!1446069 () Bool)

(assert (=> b!1573294 m!1446069))

(assert (=> b!1573294 m!1446069))

(declare-fun m!1446071 () Bool)

(assert (=> b!1573294 m!1446071))

(declare-fun m!1446073 () Bool)

(assert (=> b!1573293 m!1446073))

(push 1)

(assert (not start!135268))

(assert (not b!1573293))

(assert (not b!1573294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164787 () Bool)

(assert (=> d!164787 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135268 d!164787))

(declare-fun d!164793 () Bool)

(assert (=> d!164793 (= (array_inv!39619 _keys!600) (bvsge (size!51235 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135268 d!164793))

(declare-fun d!164795 () Bool)

(assert (=> d!164795 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573293 d!164795))

(declare-fun b!1573368 () Bool)

(declare-fun lt!674239 () SeekEntryResult!13631)

(assert (=> b!1573368 (and (bvsge (index!56924 lt!674239) #b00000000000000000000000000000000) (bvslt (index!56924 lt!674239) (size!51235 _keys!600)))))

(declare-fun res!1074952 () Bool)

(assert (=> b!1573368 (= res!1074952 (= (select (arr!50683 _keys!600) (index!56924 lt!674239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877368 () Bool)

(assert (=> b!1573368 (=> res!1074952 e!877368)))

(declare-fun d!164797 () Bool)

(declare-fun e!877369 () Bool)

(assert (=> d!164797 e!877369))

(declare-fun c!145466 () Bool)

(assert (=> d!164797 (= c!145466 (and (is-Intermediate!13631 lt!674239) (undefined!14443 lt!674239)))))

(declare-fun e!877367 () SeekEntryResult!13631)

(assert (=> d!164797 (= lt!674239 e!877367)))

(declare-fun c!145468 () Bool)

(assert (=> d!164797 (= c!145468 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674238 () (_ BitVec 64))

(assert (=> d!164797 (= lt!674238 (select (arr!50683 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164797 (validMask!0 mask!889)))

(assert (=> d!164797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674239)))

(declare-fun b!1573369 () Bool)

(assert (=> b!1573369 (= e!877367 (Intermediate!13631 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573370 () Bool)

(declare-fun e!877366 () SeekEntryResult!13631)

(assert (=> b!1573370 (= e!877366 (Intermediate!13631 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573371 () Bool)

(assert (=> b!1573371 (= e!877367 e!877366)))

(declare-fun c!145467 () Bool)

(assert (=> b!1573371 (= c!145467 (or (= lt!674238 k!754) (= (bvadd lt!674238 lt!674238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573372 () Bool)

(declare-fun e!877370 () Bool)

(assert (=> b!1573372 (= e!877369 e!877370)))

(declare-fun res!1074951 () Bool)

(assert (=> b!1573372 (= res!1074951 (and (is-Intermediate!13631 lt!674239) (not (undefined!14443 lt!674239)) (bvslt (x!141723 lt!674239) #b01111111111111111111111111111110) (bvsge (x!141723 lt!674239) #b00000000000000000000000000000000) (bvsge (x!141723 lt!674239) #b00000000000000000000000000000000)))))

(assert (=> b!1573372 (=> (not res!1074951) (not e!877370))))

(declare-fun b!1573373 () Bool)

(assert (=> b!1573373 (= e!877369 (bvsge (x!141723 lt!674239) #b01111111111111111111111111111110))))

(declare-fun b!1573374 () Bool)

(assert (=> b!1573374 (and (bvsge (index!56924 lt!674239) #b00000000000000000000000000000000) (bvslt (index!56924 lt!674239) (size!51235 _keys!600)))))

(assert (=> b!1573374 (= e!877368 (= (select (arr!50683 _keys!600) (index!56924 lt!674239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573375 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573375 (= e!877366 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573376 () Bool)

(assert (=> b!1573376 (and (bvsge (index!56924 lt!674239) #b00000000000000000000000000000000) (bvslt (index!56924 lt!674239) (size!51235 _keys!600)))))

(declare-fun res!1074953 () Bool)

(assert (=> b!1573376 (= res!1074953 (= (select (arr!50683 _keys!600) (index!56924 lt!674239)) k!754))))

(assert (=> b!1573376 (=> res!1074953 e!877368)))

(assert (=> b!1573376 (= e!877370 e!877368)))

(assert (= (and d!164797 c!145468) b!1573369))

(assert (= (and d!164797 (not c!145468)) b!1573371))

(assert (= (and b!1573371 c!145467) b!1573370))

(assert (= (and b!1573371 (not c!145467)) b!1573375))

(assert (= (and d!164797 c!145466) b!1573373))

(assert (= (and d!164797 (not c!145466)) b!1573372))

(assert (= (and b!1573372 res!1074951) b!1573376))

(assert (= (and b!1573376 (not res!1074953)) b!1573368))

(assert (= (and b!1573368 (not res!1074952)) b!1573374))

(assert (=> b!1573375 m!1446069))

(declare-fun m!1446091 () Bool)

(assert (=> b!1573375 m!1446091))

(assert (=> b!1573375 m!1446091))

(declare-fun m!1446093 () Bool)

(assert (=> b!1573375 m!1446093))

(declare-fun m!1446095 () Bool)

(assert (=> b!1573376 m!1446095))

(assert (=> d!164797 m!1446069))

(declare-fun m!1446097 () Bool)

(assert (=> d!164797 m!1446097))

(assert (=> d!164797 m!1446065))

(assert (=> b!1573368 m!1446095))

(assert (=> b!1573374 m!1446095))

(assert (=> b!1573294 d!164797))

(declare-fun d!164807 () Bool)

(declare-fun lt!674247 () (_ BitVec 32))

(declare-fun lt!674246 () (_ BitVec 32))

(assert (=> d!164807 (= lt!674247 (bvmul (bvxor lt!674246 (bvlshr lt!674246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164807 (= lt!674246 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164807 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074954 (let ((h!38284 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141729 (bvmul (bvxor h!38284 (bvlshr h!38284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141729 (bvlshr x!141729 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074954 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074954 #b00000000000000000000000000000000))))))

(assert (=> d!164807 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674247 (bvlshr lt!674247 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573294 d!164807))

(push 1)

(assert (not d!164797))

(assert (not b!1573375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

