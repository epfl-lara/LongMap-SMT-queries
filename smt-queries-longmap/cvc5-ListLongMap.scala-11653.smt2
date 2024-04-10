; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136210 () Bool)

(assert start!136210)

(declare-fun b!1576671 () Bool)

(declare-fun e!879412 () Bool)

(declare-datatypes ((SeekEntryResult!13743 0))(
  ( (MissingZero!13743 (index!57370 (_ BitVec 32))) (Found!13743 (index!57371 (_ BitVec 32))) (Intermediate!13743 (undefined!14555 Bool) (index!57372 (_ BitVec 32)) (x!142383 (_ BitVec 32))) (Undefined!13743) (MissingVacant!13743 (index!57373 (_ BitVec 32))) )
))
(declare-fun lt!675728 () SeekEntryResult!13743)

(declare-datatypes ((array!105503 0))(
  ( (array!105504 (arr!50878 (Array (_ BitVec 32) (_ BitVec 64))) (size!51428 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105503)

(assert (=> b!1576671 (= e!879412 (and (not (is-Undefined!13743 lt!675728)) (not (is-Found!13743 lt!675728)) (is-MissingZero!13743 lt!675728) (or (bvslt (index!57370 lt!675728) #b00000000000000000000000000000000) (bvsge (index!57370 lt!675728) (size!51428 _keys!605)))))))

(declare-fun err!186 () SeekEntryResult!13743)

(assert (=> b!1576671 (= lt!675728 err!186)))

(assert (=> b!1576671 true))

(declare-fun b!1576669 () Bool)

(declare-fun res!1077085 () Bool)

(declare-fun e!879411 () Bool)

(assert (=> b!1576669 (=> (not res!1077085) (not e!879411))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576669 (= res!1077085 (validKeyInArray!0 k!761))))

(declare-fun res!1077086 () Bool)

(assert (=> start!136210 (=> (not res!1077086) (not e!879411))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136210 (= res!1077086 (validMask!0 mask!898))))

(assert (=> start!136210 e!879411))

(assert (=> start!136210 true))

(declare-fun array_inv!39605 (array!105503) Bool)

(assert (=> start!136210 (array_inv!39605 _keys!605)))

(declare-fun b!1576670 () Bool)

(assert (=> b!1576670 (= e!879411 e!879412)))

(declare-fun res!1077087 () Bool)

(assert (=> b!1576670 (=> (not res!1077087) (not e!879412))))

(declare-fun lt!675729 () Bool)

(declare-fun lt!675730 () SeekEntryResult!13743)

(assert (=> b!1576670 (= res!1077087 (and (or lt!675729 (not (undefined!14555 lt!675730))) (or lt!675729 (undefined!14555 lt!675730))))))

(assert (=> b!1576670 (= lt!675729 (not (is-Intermediate!13743 lt!675730)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105503 (_ BitVec 32)) SeekEntryResult!13743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576670 (= lt!675730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576668 () Bool)

(declare-fun res!1077084 () Bool)

(assert (=> b!1576668 (=> (not res!1077084) (not e!879411))))

(assert (=> b!1576668 (= res!1077084 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51428 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136210 res!1077086) b!1576668))

(assert (= (and b!1576668 res!1077084) b!1576669))

(assert (= (and b!1576669 res!1077085) b!1576670))

(assert (= (and b!1576670 res!1077087) b!1576671))

(declare-fun m!1449175 () Bool)

(assert (=> b!1576669 m!1449175))

(declare-fun m!1449177 () Bool)

(assert (=> start!136210 m!1449177))

(declare-fun m!1449179 () Bool)

(assert (=> start!136210 m!1449179))

(declare-fun m!1449181 () Bool)

(assert (=> b!1576670 m!1449181))

(assert (=> b!1576670 m!1449181))

(declare-fun m!1449183 () Bool)

(assert (=> b!1576670 m!1449183))

(push 1)

(assert (not start!136210))

(assert (not b!1576669))

(assert (not b!1576670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165721 () Bool)

(assert (=> d!165721 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136210 d!165721))

(declare-fun d!165725 () Bool)

(assert (=> d!165725 (= (array_inv!39605 _keys!605) (bvsge (size!51428 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136210 d!165725))

(declare-fun d!165727 () Bool)

(assert (=> d!165727 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576669 d!165727))

(declare-fun b!1576741 () Bool)

(declare-fun lt!675766 () SeekEntryResult!13743)

(assert (=> b!1576741 (and (bvsge (index!57372 lt!675766) #b00000000000000000000000000000000) (bvslt (index!57372 lt!675766) (size!51428 _keys!605)))))

(declare-fun e!879459 () Bool)

(assert (=> b!1576741 (= e!879459 (= (select (arr!50878 _keys!605) (index!57372 lt!675766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576742 () Bool)

(declare-fun e!879460 () SeekEntryResult!13743)

(assert (=> b!1576742 (= e!879460 (Intermediate!13743 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576743 () Bool)

(declare-fun e!879457 () Bool)

(declare-fun e!879461 () Bool)

(assert (=> b!1576743 (= e!879457 e!879461)))

(declare-fun res!1077129 () Bool)

(assert (=> b!1576743 (= res!1077129 (and (is-Intermediate!13743 lt!675766) (not (undefined!14555 lt!675766)) (bvslt (x!142383 lt!675766) #b01111111111111111111111111111110) (bvsge (x!142383 lt!675766) #b00000000000000000000000000000000) (bvsge (x!142383 lt!675766) #b00000000000000000000000000000000)))))

(assert (=> b!1576743 (=> (not res!1077129) (not e!879461))))

(declare-fun d!165733 () Bool)

(assert (=> d!165733 e!879457))

(declare-fun c!146086 () Bool)

(assert (=> d!165733 (= c!146086 (and (is-Intermediate!13743 lt!675766) (undefined!14555 lt!675766)))))

(declare-fun e!879458 () SeekEntryResult!13743)

(assert (=> d!165733 (= lt!675766 e!879458)))

(declare-fun c!146088 () Bool)

(assert (=> d!165733 (= c!146088 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675765 () (_ BitVec 64))

(assert (=> d!165733 (= lt!675765 (select (arr!50878 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165733 (validMask!0 mask!898)))

(assert (=> d!165733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675766)))

(declare-fun b!1576744 () Bool)

(assert (=> b!1576744 (= e!879457 (bvsge (x!142383 lt!675766) #b01111111111111111111111111111110))))

(declare-fun b!1576745 () Bool)

(assert (=> b!1576745 (= e!879458 (Intermediate!13743 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576746 () Bool)

(assert (=> b!1576746 (= e!879458 e!879460)))

(declare-fun c!146087 () Bool)

(assert (=> b!1576746 (= c!146087 (or (= lt!675765 k!761) (= (bvadd lt!675765 lt!675765) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576747 () Bool)

(assert (=> b!1576747 (and (bvsge (index!57372 lt!675766) #b00000000000000000000000000000000) (bvslt (index!57372 lt!675766) (size!51428 _keys!605)))))

(declare-fun res!1077130 () Bool)

(assert (=> b!1576747 (= res!1077130 (= (select (arr!50878 _keys!605) (index!57372 lt!675766)) k!761))))

(assert (=> b!1576747 (=> res!1077130 e!879459)))

(assert (=> b!1576747 (= e!879461 e!879459)))

(declare-fun b!1576748 () Bool)

(assert (=> b!1576748 (and (bvsge (index!57372 lt!675766) #b00000000000000000000000000000000) (bvslt (index!57372 lt!675766) (size!51428 _keys!605)))))

(declare-fun res!1077128 () Bool)

(assert (=> b!1576748 (= res!1077128 (= (select (arr!50878 _keys!605) (index!57372 lt!675766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576748 (=> res!1077128 e!879459)))

(declare-fun b!1576749 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576749 (= e!879460 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165733 c!146088) b!1576745))

(assert (= (and d!165733 (not c!146088)) b!1576746))

(assert (= (and b!1576746 c!146087) b!1576742))

(assert (= (and b!1576746 (not c!146087)) b!1576749))

(assert (= (and d!165733 c!146086) b!1576744))

(assert (= (and d!165733 (not c!146086)) b!1576743))

(assert (= (and b!1576743 res!1077129) b!1576747))

(assert (= (and b!1576747 (not res!1077130)) b!1576748))

(assert (= (and b!1576748 (not res!1077128)) b!1576741))

(declare-fun m!1449213 () Bool)

(assert (=> b!1576748 m!1449213))

(assert (=> b!1576747 m!1449213))

(assert (=> b!1576749 m!1449181))

(declare-fun m!1449215 () Bool)

(assert (=> b!1576749 m!1449215))

(assert (=> b!1576749 m!1449215))

(declare-fun m!1449217 () Bool)

(assert (=> b!1576749 m!1449217))

(assert (=> d!165733 m!1449181))

(declare-fun m!1449219 () Bool)

(assert (=> d!165733 m!1449219))

(assert (=> d!165733 m!1449177))

(assert (=> b!1576741 m!1449213))

(assert (=> b!1576670 d!165733))

(declare-fun d!165745 () Bool)

(declare-fun lt!675776 () (_ BitVec 32))

(declare-fun lt!675775 () (_ BitVec 32))

(assert (=> d!165745 (= lt!675776 (bvmul (bvxor lt!675775 (bvlshr lt!675775 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165745 (= lt!675775 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165745 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077131 (let ((h!38292 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142389 (bvmul (bvxor h!38292 (bvlshr h!38292 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142389 (bvlshr x!142389 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077131 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077131 #b00000000000000000000000000000000))))))

(assert (=> d!165745 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675776 (bvlshr lt!675776 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576670 d!165745))

(push 1)

(assert (not b!1576749))

(assert (not d!165733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

