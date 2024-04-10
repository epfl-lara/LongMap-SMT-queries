; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135644 () Bool)

(assert start!135644)

(declare-fun res!1075956 () Bool)

(declare-fun e!878209 () Bool)

(assert (=> start!135644 (=> (not res!1075956) (not e!878209))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135644 (= res!1075956 (validMask!0 mask!898))))

(assert (=> start!135644 e!878209))

(assert (=> start!135644 true))

(declare-datatypes ((array!105311 0))(
  ( (array!105312 (arr!50801 (Array (_ BitVec 32) (_ BitVec 64))) (size!51351 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105311)

(declare-fun array_inv!39528 (array!105311) Bool)

(assert (=> start!135644 (array_inv!39528 _keys!605)))

(declare-fun b!1574659 () Bool)

(declare-fun res!1075955 () Bool)

(assert (=> b!1574659 (=> (not res!1075955) (not e!878209))))

(assert (=> b!1574659 (= res!1075955 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51351 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574660 () Bool)

(declare-fun res!1075954 () Bool)

(assert (=> b!1574660 (=> (not res!1075954) (not e!878209))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574660 (= res!1075954 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13666 0))(
  ( (MissingZero!13666 (index!57062 (_ BitVec 32))) (Found!13666 (index!57063 (_ BitVec 32))) (Intermediate!13666 (undefined!14478 Bool) (index!57064 (_ BitVec 32)) (x!142008 (_ BitVec 32))) (Undefined!13666) (MissingVacant!13666 (index!57065 (_ BitVec 32))) )
))
(declare-fun lt!674890 () SeekEntryResult!13666)

(declare-fun b!1574661 () Bool)

(get-info :version)

(assert (=> b!1574661 (= e!878209 (and ((_ is Intermediate!13666) lt!674890) (not (undefined!14478 lt!674890)) (not (= (select (arr!50801 _keys!605) (index!57064 lt!674890)) k0!761)) (not (= (select (arr!50801 _keys!605) (index!57064 lt!674890)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50801 _keys!605) (index!57064 lt!674890)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57064 lt!674890) #b00000000000000000000000000000000) (bvslt (index!57064 lt!674890) (bvadd #b00000000000000000000000000000001 mask!898)) (or (bvsgt (x!142008 lt!674890) #b01111111111111111111111111111110) (bvslt (x!142008 lt!674890) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105311 (_ BitVec 32)) SeekEntryResult!13666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574661 (= lt!674890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135644 res!1075956) b!1574659))

(assert (= (and b!1574659 res!1075955) b!1574660))

(assert (= (and b!1574660 res!1075954) b!1574661))

(declare-fun m!1447897 () Bool)

(assert (=> start!135644 m!1447897))

(declare-fun m!1447899 () Bool)

(assert (=> start!135644 m!1447899))

(declare-fun m!1447901 () Bool)

(assert (=> b!1574660 m!1447901))

(declare-fun m!1447903 () Bool)

(assert (=> b!1574661 m!1447903))

(declare-fun m!1447905 () Bool)

(assert (=> b!1574661 m!1447905))

(assert (=> b!1574661 m!1447905))

(declare-fun m!1447907 () Bool)

(assert (=> b!1574661 m!1447907))

(check-sat (not b!1574661) (not start!135644) (not b!1574660))
(check-sat)
(get-model)

(declare-fun b!1574743 () Bool)

(declare-fun e!878261 () Bool)

(declare-fun lt!674917 () SeekEntryResult!13666)

(assert (=> b!1574743 (= e!878261 (bvsge (x!142008 lt!674917) #b01111111111111111111111111111110))))

(declare-fun b!1574744 () Bool)

(declare-fun e!878257 () SeekEntryResult!13666)

(assert (=> b!1574744 (= e!878257 (Intermediate!13666 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574745 () Bool)

(declare-fun e!878258 () Bool)

(assert (=> b!1574745 (= e!878261 e!878258)))

(declare-fun res!1075993 () Bool)

(assert (=> b!1574745 (= res!1075993 (and ((_ is Intermediate!13666) lt!674917) (not (undefined!14478 lt!674917)) (bvslt (x!142008 lt!674917) #b01111111111111111111111111111110) (bvsge (x!142008 lt!674917) #b00000000000000000000000000000000) (bvsge (x!142008 lt!674917) #b00000000000000000000000000000000)))))

(assert (=> b!1574745 (=> (not res!1075993) (not e!878258))))

(declare-fun b!1574746 () Bool)

(assert (=> b!1574746 (and (bvsge (index!57064 lt!674917) #b00000000000000000000000000000000) (bvslt (index!57064 lt!674917) (size!51351 _keys!605)))))

(declare-fun e!878259 () Bool)

(assert (=> b!1574746 (= e!878259 (= (select (arr!50801 _keys!605) (index!57064 lt!674917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574747 () Bool)

(declare-fun e!878260 () SeekEntryResult!13666)

(assert (=> b!1574747 (= e!878260 (Intermediate!13666 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574748 () Bool)

(assert (=> b!1574748 (and (bvsge (index!57064 lt!674917) #b00000000000000000000000000000000) (bvslt (index!57064 lt!674917) (size!51351 _keys!605)))))

(declare-fun res!1075994 () Bool)

(assert (=> b!1574748 (= res!1075994 (= (select (arr!50801 _keys!605) (index!57064 lt!674917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574748 (=> res!1075994 e!878259)))

(declare-fun d!165259 () Bool)

(assert (=> d!165259 e!878261))

(declare-fun c!145637 () Bool)

(assert (=> d!165259 (= c!145637 (and ((_ is Intermediate!13666) lt!674917) (undefined!14478 lt!674917)))))

(assert (=> d!165259 (= lt!674917 e!878257)))

(declare-fun c!145638 () Bool)

(assert (=> d!165259 (= c!145638 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674916 () (_ BitVec 64))

(assert (=> d!165259 (= lt!674916 (select (arr!50801 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165259 (validMask!0 mask!898)))

(assert (=> d!165259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!674917)))

(declare-fun b!1574749 () Bool)

(assert (=> b!1574749 (= e!878257 e!878260)))

(declare-fun c!145636 () Bool)

(assert (=> b!1574749 (= c!145636 (or (= lt!674916 k0!761) (= (bvadd lt!674916 lt!674916) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574750 () Bool)

(assert (=> b!1574750 (and (bvsge (index!57064 lt!674917) #b00000000000000000000000000000000) (bvslt (index!57064 lt!674917) (size!51351 _keys!605)))))

(declare-fun res!1075992 () Bool)

(assert (=> b!1574750 (= res!1075992 (= (select (arr!50801 _keys!605) (index!57064 lt!674917)) k0!761))))

(assert (=> b!1574750 (=> res!1075992 e!878259)))

(assert (=> b!1574750 (= e!878258 e!878259)))

(declare-fun b!1574751 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574751 (= e!878260 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and d!165259 c!145638) b!1574744))

(assert (= (and d!165259 (not c!145638)) b!1574749))

(assert (= (and b!1574749 c!145636) b!1574747))

(assert (= (and b!1574749 (not c!145636)) b!1574751))

(assert (= (and d!165259 c!145637) b!1574743))

(assert (= (and d!165259 (not c!145637)) b!1574745))

(assert (= (and b!1574745 res!1075993) b!1574750))

(assert (= (and b!1574750 (not res!1075992)) b!1574748))

(assert (= (and b!1574748 (not res!1075994)) b!1574746))

(declare-fun m!1447937 () Bool)

(assert (=> b!1574746 m!1447937))

(assert (=> b!1574750 m!1447937))

(assert (=> d!165259 m!1447905))

(declare-fun m!1447939 () Bool)

(assert (=> d!165259 m!1447939))

(assert (=> d!165259 m!1447897))

(assert (=> b!1574748 m!1447937))

(assert (=> b!1574751 m!1447905))

(declare-fun m!1447941 () Bool)

(assert (=> b!1574751 m!1447941))

(assert (=> b!1574751 m!1447941))

(declare-fun m!1447943 () Bool)

(assert (=> b!1574751 m!1447943))

(assert (=> b!1574661 d!165259))

(declare-fun d!165271 () Bool)

(declare-fun lt!674929 () (_ BitVec 32))

(declare-fun lt!674928 () (_ BitVec 32))

(assert (=> d!165271 (= lt!674929 (bvmul (bvxor lt!674928 (bvlshr lt!674928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165271 (= lt!674928 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165271 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1075995 (let ((h!38254 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142015 (bvmul (bvxor h!38254 (bvlshr h!38254 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142015 (bvlshr x!142015 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1075995 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1075995 #b00000000000000000000000000000000))))))

(assert (=> d!165271 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!674929 (bvlshr lt!674929 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574661 d!165271))

(declare-fun d!165277 () Bool)

(assert (=> d!165277 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135644 d!165277))

(declare-fun d!165281 () Bool)

(assert (=> d!165281 (= (array_inv!39528 _keys!605) (bvsge (size!51351 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135644 d!165281))

(declare-fun d!165283 () Bool)

(assert (=> d!165283 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574660 d!165283))

(check-sat (not b!1574751) (not d!165259))
(check-sat)
