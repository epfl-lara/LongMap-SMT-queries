; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136604 () Bool)

(assert start!136604)

(declare-fun b!1579014 () Bool)

(declare-fun e!880867 () Bool)

(declare-datatypes ((SeekEntryResult!13690 0))(
  ( (MissingZero!13690 (index!57158 (_ BitVec 32))) (Found!13690 (index!57159 (_ BitVec 32))) (Intermediate!13690 (undefined!14502 Bool) (index!57160 (_ BitVec 32)) (x!142367 (_ BitVec 32))) (Undefined!13690) (MissingVacant!13690 (index!57161 (_ BitVec 32))) )
))
(declare-fun lt!676591 () SeekEntryResult!13690)

(declare-datatypes ((array!105624 0))(
  ( (array!105625 (arr!50931 (Array (_ BitVec 32) (_ BitVec 64))) (size!51482 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105624)

(assert (=> b!1579014 (= e!880867 (and (not (is-Undefined!13690 lt!676591)) (is-Found!13690 lt!676591) (or (bvslt (index!57159 lt!676591) #b00000000000000000000000000000000) (bvsge (index!57159 lt!676591) (size!51482 _keys!605)))))))

(declare-fun err!182 () SeekEntryResult!13690)

(assert (=> b!1579014 (= lt!676591 err!182)))

(assert (=> b!1579014 true))

(declare-fun b!1579013 () Bool)

(declare-fun e!880868 () Bool)

(assert (=> b!1579013 (= e!880868 e!880867)))

(declare-fun res!1077902 () Bool)

(assert (=> b!1579013 (=> (not res!1077902) (not e!880867))))

(declare-fun lt!676593 () Bool)

(declare-fun lt!676592 () SeekEntryResult!13690)

(assert (=> b!1579013 (= res!1077902 (and (or lt!676593 (not (undefined!14502 lt!676592))) (or lt!676593 (undefined!14502 lt!676592))))))

(assert (=> b!1579013 (= lt!676593 (not (is-Intermediate!13690 lt!676592)))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105624 (_ BitVec 32)) SeekEntryResult!13690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579013 (= lt!676592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1579011 () Bool)

(declare-fun res!1077903 () Bool)

(assert (=> b!1579011 (=> (not res!1077903) (not e!880868))))

(assert (=> b!1579011 (= res!1077903 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51482 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1579012 () Bool)

(declare-fun res!1077904 () Bool)

(assert (=> b!1579012 (=> (not res!1077904) (not e!880868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579012 (= res!1077904 (validKeyInArray!0 k!761))))

(declare-fun res!1077905 () Bool)

(assert (=> start!136604 (=> (not res!1077905) (not e!880868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136604 (= res!1077905 (validMask!0 mask!898))))

(assert (=> start!136604 e!880868))

(assert (=> start!136604 true))

(declare-fun array_inv!39886 (array!105624) Bool)

(assert (=> start!136604 (array_inv!39886 _keys!605)))

(assert (= (and start!136604 res!1077905) b!1579011))

(assert (= (and b!1579011 res!1077903) b!1579012))

(assert (= (and b!1579012 res!1077904) b!1579013))

(assert (= (and b!1579013 res!1077902) b!1579014))

(declare-fun m!1451399 () Bool)

(assert (=> b!1579013 m!1451399))

(assert (=> b!1579013 m!1451399))

(declare-fun m!1451401 () Bool)

(assert (=> b!1579013 m!1451401))

(declare-fun m!1451403 () Bool)

(assert (=> b!1579012 m!1451403))

(declare-fun m!1451405 () Bool)

(assert (=> start!136604 m!1451405))

(declare-fun m!1451407 () Bool)

(assert (=> start!136604 m!1451407))

(push 1)

(assert (not b!1579012))

(assert (not start!136604))

(assert (not b!1579013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166405 () Bool)

(assert (=> d!166405 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579012 d!166405))

(declare-fun d!166407 () Bool)

(assert (=> d!166407 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136604 d!166407))

(declare-fun d!166413 () Bool)

(assert (=> d!166413 (= (array_inv!39886 _keys!605) (bvsge (size!51482 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136604 d!166413))

(declare-fun b!1579072 () Bool)

(declare-fun e!880904 () SeekEntryResult!13690)

(assert (=> b!1579072 (= e!880904 (Intermediate!13690 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1579073 () Bool)

(declare-fun lt!676614 () SeekEntryResult!13690)

(assert (=> b!1579073 (and (bvsge (index!57160 lt!676614) #b00000000000000000000000000000000) (bvslt (index!57160 lt!676614) (size!51482 _keys!605)))))

(declare-fun res!1077922 () Bool)

(assert (=> b!1579073 (= res!1077922 (= (select (arr!50931 _keys!605) (index!57160 lt!676614)) k!761))))

(declare-fun e!880901 () Bool)

(assert (=> b!1579073 (=> res!1077922 e!880901)))

(declare-fun e!880902 () Bool)

(assert (=> b!1579073 (= e!880902 e!880901)))

(declare-fun b!1579074 () Bool)

(declare-fun e!880903 () Bool)

(assert (=> b!1579074 (= e!880903 e!880902)))

(declare-fun res!1077923 () Bool)

(assert (=> b!1579074 (= res!1077923 (and (is-Intermediate!13690 lt!676614) (not (undefined!14502 lt!676614)) (bvslt (x!142367 lt!676614) #b01111111111111111111111111111110) (bvsge (x!142367 lt!676614) #b00000000000000000000000000000000) (bvsge (x!142367 lt!676614) #b00000000000000000000000000000000)))))

(assert (=> b!1579074 (=> (not res!1077923) (not e!880902))))

(declare-fun b!1579075 () Bool)

(assert (=> b!1579075 (and (bvsge (index!57160 lt!676614) #b00000000000000000000000000000000) (bvslt (index!57160 lt!676614) (size!51482 _keys!605)))))

(declare-fun res!1077924 () Bool)

(assert (=> b!1579075 (= res!1077924 (= (select (arr!50931 _keys!605) (index!57160 lt!676614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1579075 (=> res!1077924 e!880901)))

(declare-fun e!880900 () SeekEntryResult!13690)

(declare-fun b!1579076 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579076 (= e!880900 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1579077 () Bool)

(assert (=> b!1579077 (= e!880900 (Intermediate!13690 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1579079 () Bool)

(assert (=> b!1579079 (= e!880904 e!880900)))

(declare-fun c!146867 () Bool)

(declare-fun lt!676615 () (_ BitVec 64))

(assert (=> b!1579079 (= c!146867 (or (= lt!676615 k!761) (= (bvadd lt!676615 lt!676615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1579080 () Bool)

(assert (=> b!1579080 (and (bvsge (index!57160 lt!676614) #b00000000000000000000000000000000) (bvslt (index!57160 lt!676614) (size!51482 _keys!605)))))

(assert (=> b!1579080 (= e!880901 (= (select (arr!50931 _keys!605) (index!57160 lt!676614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!166415 () Bool)

(assert (=> d!166415 e!880903))

(declare-fun c!146866 () Bool)

(assert (=> d!166415 (= c!146866 (and (is-Intermediate!13690 lt!676614) (undefined!14502 lt!676614)))))

(assert (=> d!166415 (= lt!676614 e!880904)))

(declare-fun c!146865 () Bool)

(assert (=> d!166415 (= c!146865 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166415 (= lt!676615 (select (arr!50931 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166415 (validMask!0 mask!898)))

(assert (=> d!166415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676614)))

(declare-fun b!1579078 () Bool)

(assert (=> b!1579078 (= e!880903 (bvsge (x!142367 lt!676614) #b01111111111111111111111111111110))))

(assert (= (and d!166415 c!146865) b!1579072))

(assert (= (and d!166415 (not c!146865)) b!1579079))

(assert (= (and b!1579079 c!146867) b!1579077))

(assert (= (and b!1579079 (not c!146867)) b!1579076))

(assert (= (and d!166415 c!146866) b!1579078))

(assert (= (and d!166415 (not c!146866)) b!1579074))

(assert (= (and b!1579074 res!1077923) b!1579073))

(assert (= (and b!1579073 (not res!1077922)) b!1579075))

(assert (= (and b!1579075 (not res!1077924)) b!1579080))

(declare-fun m!1451417 () Bool)

(assert (=> b!1579075 m!1451417))

(assert (=> d!166415 m!1451399))

(declare-fun m!1451419 () Bool)

(assert (=> d!166415 m!1451419))

(assert (=> d!166415 m!1451405))

(assert (=> b!1579073 m!1451417))

(assert (=> b!1579076 m!1451399))

(declare-fun m!1451421 () Bool)

(assert (=> b!1579076 m!1451421))

(assert (=> b!1579076 m!1451421))

(declare-fun m!1451423 () Bool)

(assert (=> b!1579076 m!1451423))

(assert (=> b!1579080 m!1451417))

(assert (=> b!1579013 d!166415))

(declare-fun d!166427 () Bool)

(declare-fun lt!676623 () (_ BitVec 32))

(declare-fun lt!676622 () (_ BitVec 32))

(assert (=> d!166427 (= lt!676623 (bvmul (bvxor lt!676622 (bvlshr lt!676622 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166427 (= lt!676622 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166427 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077931 (let ((h!38339 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142372 (bvmul (bvxor h!38339 (bvlshr h!38339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142372 (bvlshr x!142372 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077931 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077931 #b00000000000000000000000000000000))))))

(assert (=> d!166427 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676623 (bvlshr lt!676623 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1579013 d!166427))

(push 1)

(assert (not b!1579076))

(assert (not d!166415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

