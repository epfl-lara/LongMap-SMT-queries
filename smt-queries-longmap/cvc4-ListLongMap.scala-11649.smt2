; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136058 () Bool)

(assert start!136058)

(declare-fun b!1576125 () Bool)

(declare-fun res!1076854 () Bool)

(declare-fun e!879097 () Bool)

(assert (=> b!1576125 (=> (not res!1076854) (not e!879097))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((array!105471 0))(
  ( (array!105472 (arr!50868 (Array (_ BitVec 32) (_ BitVec 64))) (size!51418 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105471)

(assert (=> b!1576125 (= res!1076854 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51418 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576127 () Bool)

(declare-fun e!879096 () Bool)

(assert (=> b!1576127 (= e!879097 e!879096)))

(declare-fun res!1076853 () Bool)

(assert (=> b!1576127 (=> (not res!1076853) (not e!879096))))

(declare-datatypes ((SeekEntryResult!13733 0))(
  ( (MissingZero!13733 (index!57330 (_ BitVec 32))) (Found!13733 (index!57331 (_ BitVec 32))) (Intermediate!13733 (undefined!14545 Bool) (index!57332 (_ BitVec 32)) (x!142311 (_ BitVec 32))) (Undefined!13733) (MissingVacant!13733 (index!57333 (_ BitVec 32))) )
))
(declare-fun lt!675478 () SeekEntryResult!13733)

(declare-fun k!761 () (_ BitVec 64))

(assert (=> b!1576127 (= res!1076853 (and (not (undefined!14545 lt!675478)) (is-Intermediate!13733 lt!675478) (not (= (select (arr!50868 _keys!605) (index!57332 lt!675478)) k!761)) (not (= (select (arr!50868 _keys!605) (index!57332 lt!675478)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50868 _keys!605) (index!57332 lt!675478)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57332 lt!675478) #b00000000000000000000000000000000) (bvslt (index!57332 lt!675478) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105471 (_ BitVec 32)) SeekEntryResult!13733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576127 (= lt!675478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576126 () Bool)

(declare-fun res!1076855 () Bool)

(assert (=> b!1576126 (=> (not res!1076855) (not e!879097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576126 (= res!1076855 (validKeyInArray!0 k!761))))

(declare-fun b!1576128 () Bool)

(declare-fun lt!675477 () SeekEntryResult!13733)

(assert (=> b!1576128 (= e!879096 (and (not (is-Undefined!13733 lt!675477)) (not (is-Found!13733 lt!675477)) (not (is-MissingZero!13733 lt!675477)) (is-MissingVacant!13733 lt!675477) (or (bvslt (index!57333 lt!675477) #b00000000000000000000000000000000) (bvsge (index!57333 lt!675477) (size!51418 _keys!605)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105471 (_ BitVec 32)) SeekEntryResult!13733)

(assert (=> b!1576128 (= lt!675477 (seekKeyOrZeroReturnVacant!0 (x!142311 lt!675478) (index!57332 lt!675478) (index!57332 lt!675478) k!761 _keys!605 mask!898))))

(declare-fun res!1076856 () Bool)

(assert (=> start!136058 (=> (not res!1076856) (not e!879097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136058 (= res!1076856 (validMask!0 mask!898))))

(assert (=> start!136058 e!879097))

(assert (=> start!136058 true))

(declare-fun array_inv!39595 (array!105471) Bool)

(assert (=> start!136058 (array_inv!39595 _keys!605)))

(assert (= (and start!136058 res!1076856) b!1576125))

(assert (= (and b!1576125 res!1076854) b!1576126))

(assert (= (and b!1576126 res!1076855) b!1576127))

(assert (= (and b!1576127 res!1076853) b!1576128))

(declare-fun m!1448897 () Bool)

(assert (=> b!1576127 m!1448897))

(declare-fun m!1448899 () Bool)

(assert (=> b!1576127 m!1448899))

(assert (=> b!1576127 m!1448899))

(declare-fun m!1448901 () Bool)

(assert (=> b!1576127 m!1448901))

(declare-fun m!1448903 () Bool)

(assert (=> b!1576126 m!1448903))

(declare-fun m!1448905 () Bool)

(assert (=> b!1576128 m!1448905))

(declare-fun m!1448907 () Bool)

(assert (=> start!136058 m!1448907))

(declare-fun m!1448909 () Bool)

(assert (=> start!136058 m!1448909))

(push 1)

(assert (not b!1576127))

(assert (not b!1576128))

(assert (not start!136058))

(assert (not b!1576126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576219 () Bool)

(declare-fun e!879151 () SeekEntryResult!13733)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576219 (= e!879151 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!165589 () Bool)

(declare-fun e!879150 () Bool)

(assert (=> d!165589 e!879150))

(declare-fun c!145942 () Bool)

(declare-fun lt!675514 () SeekEntryResult!13733)

(assert (=> d!165589 (= c!145942 (and (is-Intermediate!13733 lt!675514) (undefined!14545 lt!675514)))))

(declare-fun e!879148 () SeekEntryResult!13733)

(assert (=> d!165589 (= lt!675514 e!879148)))

(declare-fun c!145944 () Bool)

(assert (=> d!165589 (= c!145944 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675513 () (_ BitVec 64))

(assert (=> d!165589 (= lt!675513 (select (arr!50868 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165589 (validMask!0 mask!898)))

(assert (=> d!165589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675514)))

(declare-fun b!1576220 () Bool)

(assert (=> b!1576220 (and (bvsge (index!57332 lt!675514) #b00000000000000000000000000000000) (bvslt (index!57332 lt!675514) (size!51418 _keys!605)))))

(declare-fun res!1076884 () Bool)

(assert (=> b!1576220 (= res!1076884 (= (select (arr!50868 _keys!605) (index!57332 lt!675514)) k!761))))

(declare-fun e!879152 () Bool)

(assert (=> b!1576220 (=> res!1076884 e!879152)))

(declare-fun e!879149 () Bool)

(assert (=> b!1576220 (= e!879149 e!879152)))

(declare-fun b!1576221 () Bool)

(assert (=> b!1576221 (= e!879148 e!879151)))

(declare-fun c!145943 () Bool)

(assert (=> b!1576221 (= c!145943 (or (= lt!675513 k!761) (= (bvadd lt!675513 lt!675513) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576222 () Bool)

(assert (=> b!1576222 (and (bvsge (index!57332 lt!675514) #b00000000000000000000000000000000) (bvslt (index!57332 lt!675514) (size!51418 _keys!605)))))

(assert (=> b!1576222 (= e!879152 (= (select (arr!50868 _keys!605) (index!57332 lt!675514)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576223 () Bool)

(assert (=> b!1576223 (= e!879150 e!879149)))

(declare-fun res!1076885 () Bool)

(assert (=> b!1576223 (= res!1076885 (and (is-Intermediate!13733 lt!675514) (not (undefined!14545 lt!675514)) (bvslt (x!142311 lt!675514) #b01111111111111111111111111111110) (bvsge (x!142311 lt!675514) #b00000000000000000000000000000000) (bvsge (x!142311 lt!675514) #b00000000000000000000000000000000)))))

(assert (=> b!1576223 (=> (not res!1076885) (not e!879149))))

(declare-fun b!1576224 () Bool)

(assert (=> b!1576224 (= e!879151 (Intermediate!13733 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576225 () Bool)

(assert (=> b!1576225 (= e!879150 (bvsge (x!142311 lt!675514) #b01111111111111111111111111111110))))

(declare-fun b!1576226 () Bool)

(assert (=> b!1576226 (= e!879148 (Intermediate!13733 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576227 () Bool)

(assert (=> b!1576227 (and (bvsge (index!57332 lt!675514) #b00000000000000000000000000000000) (bvslt (index!57332 lt!675514) (size!51418 _keys!605)))))

(declare-fun res!1076883 () Bool)

(assert (=> b!1576227 (= res!1076883 (= (select (arr!50868 _keys!605) (index!57332 lt!675514)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576227 (=> res!1076883 e!879152)))

(assert (= (and d!165589 c!145944) b!1576226))

(assert (= (and d!165589 (not c!145944)) b!1576221))

(assert (= (and b!1576221 c!145943) b!1576224))

(assert (= (and b!1576221 (not c!145943)) b!1576219))

(assert (= (and d!165589 c!145942) b!1576225))

(assert (= (and d!165589 (not c!145942)) b!1576223))

(assert (= (and b!1576223 res!1076885) b!1576220))

(assert (= (and b!1576220 (not res!1076884)) b!1576227))

(assert (= (and b!1576227 (not res!1076883)) b!1576222))

(declare-fun m!1448935 () Bool)

(assert (=> b!1576222 m!1448935))

(assert (=> b!1576219 m!1448899))

(declare-fun m!1448937 () Bool)

(assert (=> b!1576219 m!1448937))

(assert (=> b!1576219 m!1448937))

(declare-fun m!1448939 () Bool)

(assert (=> b!1576219 m!1448939))

(assert (=> b!1576220 m!1448935))

(assert (=> d!165589 m!1448899))

(declare-fun m!1448941 () Bool)

(assert (=> d!165589 m!1448941))

(assert (=> d!165589 m!1448907))

(assert (=> b!1576227 m!1448935))

(assert (=> b!1576127 d!165589))

(declare-fun d!165601 () Bool)

(declare-fun lt!675520 () (_ BitVec 32))

(declare-fun lt!675519 () (_ BitVec 32))

(assert (=> d!165601 (= lt!675520 (bvmul (bvxor lt!675519 (bvlshr lt!675519 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165601 (= lt!675519 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165601 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076886 (let ((h!38281 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142318 (bvmul (bvxor h!38281 (bvlshr h!38281 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142318 (bvlshr x!142318 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076886 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076886 #b00000000000000000000000000000000))))))

(assert (=> d!165601 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675520 (bvlshr lt!675520 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576127 d!165601))

(declare-fun b!1576258 () Bool)

(declare-fun e!879168 () SeekEntryResult!13733)

(assert (=> b!1576258 (= e!879168 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142311 lt!675478) #b00000000000000000000000000000001) (nextIndex!0 (index!57332 lt!675478) (x!142311 lt!675478) mask!898) (index!57332 lt!675478) k!761 _keys!605 mask!898))))

(declare-fun lt!675532 () SeekEntryResult!13733)

(declare-fun d!165607 () Bool)

(assert (=> d!165607 (and (or (is-Undefined!13733 lt!675532) (not (is-Found!13733 lt!675532)) (and (bvsge (index!57331 lt!675532) #b00000000000000000000000000000000) (bvslt (index!57331 lt!675532) (size!51418 _keys!605)))) (or (is-Undefined!13733 lt!675532) (is-Found!13733 lt!675532) (not (is-MissingVacant!13733 lt!675532)) (not (= (index!57333 lt!675532) (index!57332 lt!675478))) (and (bvsge (index!57333 lt!675532) #b00000000000000000000000000000000) (bvslt (index!57333 lt!675532) (size!51418 _keys!605)))) (or (is-Undefined!13733 lt!675532) (ite (is-Found!13733 lt!675532) (= (select (arr!50868 _keys!605) (index!57331 lt!675532)) k!761) (and (is-MissingVacant!13733 lt!675532) (= (index!57333 lt!675532) (index!57332 lt!675478)) (= (select (arr!50868 _keys!605) (index!57333 lt!675532)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!879170 () SeekEntryResult!13733)

(assert (=> d!165607 (= lt!675532 e!879170)))

(declare-fun c!145961 () Bool)

(assert (=> d!165607 (= c!145961 (bvsge (x!142311 lt!675478) #b01111111111111111111111111111110))))

(declare-fun lt!675531 () (_ BitVec 64))

(assert (=> d!165607 (= lt!675531 (select (arr!50868 _keys!605) (index!57332 lt!675478)))))

(assert (=> d!165607 (validMask!0 mask!898)))

(assert (=> d!165607 (= (seekKeyOrZeroReturnVacant!0 (x!142311 lt!675478) (index!57332 lt!675478) (index!57332 lt!675478) k!761 _keys!605 mask!898) lt!675532)))

(declare-fun b!1576259 () Bool)

(assert (=> b!1576259 (= e!879168 (MissingVacant!13733 (index!57332 lt!675478)))))

(declare-fun b!1576260 () Bool)

(declare-fun e!879169 () SeekEntryResult!13733)

(assert (=> b!1576260 (= e!879170 e!879169)))

(declare-fun c!145962 () Bool)

(assert (=> b!1576260 (= c!145962 (= lt!675531 k!761))))

(declare-fun b!1576261 () Bool)

(assert (=> b!1576261 (= e!879169 (Found!13733 (index!57332 lt!675478)))))

(declare-fun b!1576262 () Bool)

(declare-fun c!145960 () Bool)

(assert (=> b!1576262 (= c!145960 (= lt!675531 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576262 (= e!879169 e!879168)))

(declare-fun b!1576263 () Bool)

(assert (=> b!1576263 (= e!879170 Undefined!13733)))

(assert (= (and d!165607 c!145961) b!1576263))

(assert (= (and d!165607 (not c!145961)) b!1576260))

(assert (= (and b!1576260 c!145962) b!1576261))

(assert (= (and b!1576260 (not c!145962)) b!1576262))

(assert (= (and b!1576262 c!145960) b!1576259))

(assert (= (and b!1576262 (not c!145960)) b!1576258))

(declare-fun m!1448951 () Bool)

(assert (=> b!1576258 m!1448951))

(assert (=> b!1576258 m!1448951))

(declare-fun m!1448953 () Bool)

(assert (=> b!1576258 m!1448953))

(declare-fun m!1448955 () Bool)

(assert (=> d!165607 m!1448955))

(declare-fun m!1448957 () Bool)

(assert (=> d!165607 m!1448957))

(assert (=> d!165607 m!1448897))

(assert (=> d!165607 m!1448907))

(assert (=> b!1576128 d!165607))

(declare-fun d!165609 () Bool)

(assert (=> d!165609 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136058 d!165609))

(declare-fun d!165611 () Bool)

(assert (=> d!165611 (= (array_inv!39595 _keys!605) (bvsge (size!51418 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136058 d!165611))

(declare-fun d!165613 () Bool)

(assert (=> d!165613 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576126 d!165613))

(push 1)

(assert (not d!165589))

(assert (not b!1576258))

(assert (not b!1576219))

(assert (not d!165607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

