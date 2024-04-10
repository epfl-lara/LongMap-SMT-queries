; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136054 () Bool)

(assert start!136054)

(declare-fun b!1576104 () Bool)

(declare-fun e!879079 () Bool)

(declare-datatypes ((SeekEntryResult!13731 0))(
  ( (MissingZero!13731 (index!57322 (_ BitVec 32))) (Found!13731 (index!57323 (_ BitVec 32))) (Intermediate!13731 (undefined!14543 Bool) (index!57324 (_ BitVec 32)) (x!142309 (_ BitVec 32))) (Undefined!13731) (MissingVacant!13731 (index!57325 (_ BitVec 32))) )
))
(declare-fun lt!675466 () SeekEntryResult!13731)

(declare-datatypes ((array!105467 0))(
  ( (array!105468 (arr!50866 (Array (_ BitVec 32) (_ BitVec 64))) (size!51416 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105467)

(assert (=> b!1576104 (= e!879079 (and (not (is-Undefined!13731 lt!675466)) (not (is-Found!13731 lt!675466)) (not (is-MissingZero!13731 lt!675466)) (is-MissingVacant!13731 lt!675466) (or (bvslt (index!57325 lt!675466) #b00000000000000000000000000000000) (bvsge (index!57325 lt!675466) (size!51416 _keys!605)))))))

(declare-fun lt!675465 () SeekEntryResult!13731)

(declare-fun k!761 () (_ BitVec 64))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105467 (_ BitVec 32)) SeekEntryResult!13731)

(assert (=> b!1576104 (= lt!675466 (seekKeyOrZeroReturnVacant!0 (x!142309 lt!675465) (index!57324 lt!675465) (index!57324 lt!675465) k!761 _keys!605 mask!898))))

(declare-fun res!1076831 () Bool)

(declare-fun e!879080 () Bool)

(assert (=> start!136054 (=> (not res!1076831) (not e!879080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136054 (= res!1076831 (validMask!0 mask!898))))

(assert (=> start!136054 e!879080))

(assert (=> start!136054 true))

(declare-fun array_inv!39593 (array!105467) Bool)

(assert (=> start!136054 (array_inv!39593 _keys!605)))

(declare-fun b!1576103 () Bool)

(assert (=> b!1576103 (= e!879080 e!879079)))

(declare-fun res!1076830 () Bool)

(assert (=> b!1576103 (=> (not res!1076830) (not e!879079))))

(assert (=> b!1576103 (= res!1076830 (and (not (undefined!14543 lt!675465)) (is-Intermediate!13731 lt!675465) (not (= (select (arr!50866 _keys!605) (index!57324 lt!675465)) k!761)) (not (= (select (arr!50866 _keys!605) (index!57324 lt!675465)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50866 _keys!605) (index!57324 lt!675465)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57324 lt!675465) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675465) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105467 (_ BitVec 32)) SeekEntryResult!13731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576103 (= lt!675465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576102 () Bool)

(declare-fun res!1076832 () Bool)

(assert (=> b!1576102 (=> (not res!1076832) (not e!879080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576102 (= res!1076832 (validKeyInArray!0 k!761))))

(declare-fun b!1576101 () Bool)

(declare-fun res!1076829 () Bool)

(assert (=> b!1576101 (=> (not res!1076829) (not e!879080))))

(assert (=> b!1576101 (= res!1076829 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51416 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136054 res!1076831) b!1576101))

(assert (= (and b!1576101 res!1076829) b!1576102))

(assert (= (and b!1576102 res!1076832) b!1576103))

(assert (= (and b!1576103 res!1076830) b!1576104))

(declare-fun m!1448869 () Bool)

(assert (=> b!1576104 m!1448869))

(declare-fun m!1448871 () Bool)

(assert (=> start!136054 m!1448871))

(declare-fun m!1448873 () Bool)

(assert (=> start!136054 m!1448873))

(declare-fun m!1448875 () Bool)

(assert (=> b!1576103 m!1448875))

(declare-fun m!1448877 () Bool)

(assert (=> b!1576103 m!1448877))

(assert (=> b!1576103 m!1448877))

(declare-fun m!1448879 () Bool)

(assert (=> b!1576103 m!1448879))

(declare-fun m!1448881 () Bool)

(assert (=> b!1576102 m!1448881))

(push 1)

(assert (not b!1576103))

(assert (not b!1576104))

(assert (not start!136054))

(assert (not b!1576102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576147 () Bool)

(declare-fun e!879110 () SeekEntryResult!13731)

(assert (=> b!1576147 (= e!879110 (Intermediate!13731 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576148 () Bool)

(declare-fun e!879109 () SeekEntryResult!13731)

(assert (=> b!1576148 (= e!879110 e!879109)))

(declare-fun c!145915 () Bool)

(declare-fun lt!675484 () (_ BitVec 64))

(assert (=> b!1576148 (= c!145915 (or (= lt!675484 k!761) (= (bvadd lt!675484 lt!675484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576149 () Bool)

(assert (=> b!1576149 (= e!879109 (Intermediate!13731 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576150 () Bool)

(declare-fun e!879112 () Bool)

(declare-fun lt!675483 () SeekEntryResult!13731)

(assert (=> b!1576150 (= e!879112 (bvsge (x!142309 lt!675483) #b01111111111111111111111111111110))))

(declare-fun b!1576151 () Bool)

(assert (=> b!1576151 (and (bvsge (index!57324 lt!675483) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675483) (size!51416 _keys!605)))))

(declare-fun e!879111 () Bool)

(assert (=> b!1576151 (= e!879111 (= (select (arr!50866 _keys!605) (index!57324 lt!675483)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576152 () Bool)

(declare-fun e!879113 () Bool)

(assert (=> b!1576152 (= e!879112 e!879113)))

(declare-fun res!1076863 () Bool)

(assert (=> b!1576152 (= res!1076863 (and (is-Intermediate!13731 lt!675483) (not (undefined!14543 lt!675483)) (bvslt (x!142309 lt!675483) #b01111111111111111111111111111110) (bvsge (x!142309 lt!675483) #b00000000000000000000000000000000) (bvsge (x!142309 lt!675483) #b00000000000000000000000000000000)))))

(assert (=> b!1576152 (=> (not res!1076863) (not e!879113))))

(declare-fun b!1576153 () Bool)

(assert (=> b!1576153 (and (bvsge (index!57324 lt!675483) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675483) (size!51416 _keys!605)))))

(declare-fun res!1076865 () Bool)

(assert (=> b!1576153 (= res!1076865 (= (select (arr!50866 _keys!605) (index!57324 lt!675483)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576153 (=> res!1076865 e!879111)))

(declare-fun d!165581 () Bool)

(assert (=> d!165581 e!879112))

(declare-fun c!145916 () Bool)

(assert (=> d!165581 (= c!145916 (and (is-Intermediate!13731 lt!675483) (undefined!14543 lt!675483)))))

(assert (=> d!165581 (= lt!675483 e!879110)))

(declare-fun c!145917 () Bool)

(assert (=> d!165581 (= c!145917 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165581 (= lt!675484 (select (arr!50866 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165581 (validMask!0 mask!898)))

(assert (=> d!165581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675483)))

(declare-fun b!1576154 () Bool)

(assert (=> b!1576154 (and (bvsge (index!57324 lt!675483) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675483) (size!51416 _keys!605)))))

(declare-fun res!1076864 () Bool)

(assert (=> b!1576154 (= res!1076864 (= (select (arr!50866 _keys!605) (index!57324 lt!675483)) k!761))))

(assert (=> b!1576154 (=> res!1076864 e!879111)))

(assert (=> b!1576154 (= e!879113 e!879111)))

(declare-fun b!1576155 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576155 (= e!879109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165581 c!145917) b!1576147))

(assert (= (and d!165581 (not c!145917)) b!1576148))

(assert (= (and b!1576148 c!145915) b!1576149))

(assert (= (and b!1576148 (not c!145915)) b!1576155))

(assert (= (and d!165581 c!145916) b!1576150))

(assert (= (and d!165581 (not c!145916)) b!1576152))

(assert (= (and b!1576152 res!1076863) b!1576154))

(assert (= (and b!1576154 (not res!1076864)) b!1576153))

(assert (= (and b!1576153 (not res!1076865)) b!1576151))

(declare-fun m!1448911 () Bool)

(assert (=> b!1576153 m!1448911))

(assert (=> b!1576154 m!1448911))

(assert (=> b!1576155 m!1448877))

(declare-fun m!1448913 () Bool)

(assert (=> b!1576155 m!1448913))

(assert (=> b!1576155 m!1448913))

(declare-fun m!1448915 () Bool)

(assert (=> b!1576155 m!1448915))

(assert (=> d!165581 m!1448877))

(declare-fun m!1448917 () Bool)

(assert (=> d!165581 m!1448917))

(assert (=> d!165581 m!1448871))

(assert (=> b!1576151 m!1448911))

(assert (=> b!1576103 d!165581))

(declare-fun d!165591 () Bool)

(declare-fun lt!675494 () (_ BitVec 32))

(declare-fun lt!675493 () (_ BitVec 32))

(assert (=> d!165591 (= lt!675494 (bvmul (bvxor lt!675493 (bvlshr lt!675493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165591 (= lt!675493 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165591 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076866 (let ((h!38279 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142313 (bvmul (bvxor h!38279 (bvlshr h!38279 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142313 (bvlshr x!142313 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076866 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076866 #b00000000000000000000000000000000))))))

(assert (=> d!165591 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675494 (bvlshr lt!675494 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576103 d!165591))

(declare-fun b!1576213 () Bool)

(declare-fun e!879146 () SeekEntryResult!13731)

(assert (=> b!1576213 (= e!879146 (MissingVacant!13731 (index!57324 lt!675465)))))

(declare-fun b!1576214 () Bool)

(assert (=> b!1576214 (= e!879146 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142309 lt!675465) #b00000000000000000000000000000001) (nextIndex!0 (index!57324 lt!675465) (x!142309 lt!675465) mask!898) (index!57324 lt!675465) k!761 _keys!605 mask!898))))

(declare-fun b!1576215 () Bool)

(declare-fun e!879145 () SeekEntryResult!13731)

(assert (=> b!1576215 (= e!879145 (Found!13731 (index!57324 lt!675465)))))

(declare-fun lt!675505 () SeekEntryResult!13731)

(declare-fun d!165593 () Bool)

(assert (=> d!165593 (and (or (is-Undefined!13731 lt!675505) (not (is-Found!13731 lt!675505)) (and (bvsge (index!57323 lt!675505) #b00000000000000000000000000000000) (bvslt (index!57323 lt!675505) (size!51416 _keys!605)))) (or (is-Undefined!13731 lt!675505) (is-Found!13731 lt!675505) (not (is-MissingVacant!13731 lt!675505)) (not (= (index!57325 lt!675505) (index!57324 lt!675465))) (and (bvsge (index!57325 lt!675505) #b00000000000000000000000000000000) (bvslt (index!57325 lt!675505) (size!51416 _keys!605)))) (or (is-Undefined!13731 lt!675505) (ite (is-Found!13731 lt!675505) (= (select (arr!50866 _keys!605) (index!57323 lt!675505)) k!761) (and (is-MissingVacant!13731 lt!675505) (= (index!57325 lt!675505) (index!57324 lt!675465)) (= (select (arr!50866 _keys!605) (index!57325 lt!675505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!879147 () SeekEntryResult!13731)

(assert (=> d!165593 (= lt!675505 e!879147)))

(declare-fun c!145939 () Bool)

(assert (=> d!165593 (= c!145939 (bvsge (x!142309 lt!675465) #b01111111111111111111111111111110))))

(declare-fun lt!675506 () (_ BitVec 64))

(assert (=> d!165593 (= lt!675506 (select (arr!50866 _keys!605) (index!57324 lt!675465)))))

(assert (=> d!165593 (validMask!0 mask!898)))

(assert (=> d!165593 (= (seekKeyOrZeroReturnVacant!0 (x!142309 lt!675465) (index!57324 lt!675465) (index!57324 lt!675465) k!761 _keys!605 mask!898) lt!675505)))

(declare-fun b!1576216 () Bool)

(assert (=> b!1576216 (= e!879147 e!879145)))

(declare-fun c!145941 () Bool)

(assert (=> b!1576216 (= c!145941 (= lt!675506 k!761))))

(declare-fun b!1576217 () Bool)

(assert (=> b!1576217 (= e!879147 Undefined!13731)))

(declare-fun b!1576218 () Bool)

(declare-fun c!145940 () Bool)

(assert (=> b!1576218 (= c!145940 (= lt!675506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576218 (= e!879145 e!879146)))

(assert (= (and d!165593 c!145939) b!1576217))

(assert (= (and d!165593 (not c!145939)) b!1576216))

(assert (= (and b!1576216 c!145941) b!1576215))

(assert (= (and b!1576216 (not c!145941)) b!1576218))

(assert (= (and b!1576218 c!145940) b!1576213))

(assert (= (and b!1576218 (not c!145940)) b!1576214))

(declare-fun m!1448927 () Bool)

(assert (=> b!1576214 m!1448927))

(assert (=> b!1576214 m!1448927))

(declare-fun m!1448929 () Bool)

(assert (=> b!1576214 m!1448929))

(declare-fun m!1448931 () Bool)

(assert (=> d!165593 m!1448931))

(declare-fun m!1448933 () Bool)

(assert (=> d!165593 m!1448933))

(assert (=> d!165593 m!1448875))

(assert (=> d!165593 m!1448871))

(assert (=> b!1576104 d!165593))

(declare-fun d!165597 () Bool)

(assert (=> d!165597 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136054 d!165597))

(declare-fun d!165603 () Bool)

(assert (=> d!165603 (= (array_inv!39593 _keys!605) (bvsge (size!51416 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136054 d!165603))

(declare-fun d!165605 () Bool)

(assert (=> d!165605 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576102 d!165605))

(push 1)

(assert (not b!1576155))

(assert (not d!165581))

(assert (not d!165593))

(assert (not b!1576214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

