; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135972 () Bool)

(assert start!135972)

(declare-fun res!1076697 () Bool)

(declare-fun e!878882 () Bool)

(assert (=> start!135972 (=> (not res!1076697) (not e!878882))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135972 (= res!1076697 (validMask!0 mask!898))))

(assert (=> start!135972 e!878882))

(assert (=> start!135972 true))

(declare-datatypes ((array!105450 0))(
  ( (array!105451 (arr!50860 (Array (_ BitVec 32) (_ BitVec 64))) (size!51410 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105450)

(declare-fun array_inv!39587 (array!105450) Bool)

(assert (=> start!135972 (array_inv!39587 _keys!605)))

(declare-fun b!1575759 () Bool)

(declare-fun res!1076699 () Bool)

(assert (=> b!1575759 (=> (not res!1076699) (not e!878882))))

(assert (=> b!1575759 (= res!1076699 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51410 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575761 () Bool)

(declare-fun e!878880 () Bool)

(assert (=> b!1575761 (= e!878882 e!878880)))

(declare-fun res!1076700 () Bool)

(assert (=> b!1575761 (=> (not res!1076700) (not e!878880))))

(declare-datatypes ((SeekEntryResult!13725 0))(
  ( (MissingZero!13725 (index!57298 (_ BitVec 32))) (Found!13725 (index!57299 (_ BitVec 32))) (Intermediate!13725 (undefined!14537 Bool) (index!57300 (_ BitVec 32)) (x!142269 (_ BitVec 32))) (Undefined!13725) (MissingVacant!13725 (index!57301 (_ BitVec 32))) )
))
(declare-fun lt!675322 () SeekEntryResult!13725)

(declare-fun k!761 () (_ BitVec 64))

(assert (=> b!1575761 (= res!1076700 (and (not (undefined!14537 lt!675322)) (is-Intermediate!13725 lt!675322) (not (= (select (arr!50860 _keys!605) (index!57300 lt!675322)) k!761)) (not (= (select (arr!50860 _keys!605) (index!57300 lt!675322)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50860 _keys!605) (index!57300 lt!675322)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57300 lt!675322) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675322) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105450 (_ BitVec 32)) SeekEntryResult!13725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575761 (= lt!675322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575762 () Bool)

(declare-fun lt!675321 () SeekEntryResult!13725)

(assert (=> b!1575762 (= e!878880 (and (not (is-Undefined!13725 lt!675321)) (is-Found!13725 lt!675321) (or (bvslt (index!57299 lt!675321) #b00000000000000000000000000000000) (bvsge (index!57299 lt!675321) (size!51410 _keys!605)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105450 (_ BitVec 32)) SeekEntryResult!13725)

(assert (=> b!1575762 (= lt!675321 (seekKeyOrZeroReturnVacant!0 (x!142269 lt!675322) (index!57300 lt!675322) (index!57300 lt!675322) k!761 _keys!605 mask!898))))

(declare-fun b!1575760 () Bool)

(declare-fun res!1076698 () Bool)

(assert (=> b!1575760 (=> (not res!1076698) (not e!878882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575760 (= res!1076698 (validKeyInArray!0 k!761))))

(assert (= (and start!135972 res!1076697) b!1575759))

(assert (= (and b!1575759 res!1076699) b!1575760))

(assert (= (and b!1575760 res!1076698) b!1575761))

(assert (= (and b!1575761 res!1076700) b!1575762))

(declare-fun m!1448689 () Bool)

(assert (=> start!135972 m!1448689))

(declare-fun m!1448691 () Bool)

(assert (=> start!135972 m!1448691))

(declare-fun m!1448693 () Bool)

(assert (=> b!1575761 m!1448693))

(declare-fun m!1448695 () Bool)

(assert (=> b!1575761 m!1448695))

(assert (=> b!1575761 m!1448695))

(declare-fun m!1448697 () Bool)

(assert (=> b!1575761 m!1448697))

(declare-fun m!1448699 () Bool)

(assert (=> b!1575762 m!1448699))

(declare-fun m!1448701 () Bool)

(assert (=> b!1575760 m!1448701))

(push 1)

(assert (not b!1575760))

(assert (not b!1575762))

(assert (not start!135972))

(assert (not b!1575761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165507 () Bool)

(assert (=> d!165507 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575760 d!165507))

(declare-fun b!1575817 () Bool)

(declare-fun e!878916 () SeekEntryResult!13725)

(assert (=> b!1575817 (= e!878916 (MissingVacant!13725 (index!57300 lt!675322)))))

(declare-fun lt!675346 () SeekEntryResult!13725)

(declare-fun d!165509 () Bool)

(assert (=> d!165509 (and (or (is-Undefined!13725 lt!675346) (not (is-Found!13725 lt!675346)) (and (bvsge (index!57299 lt!675346) #b00000000000000000000000000000000) (bvslt (index!57299 lt!675346) (size!51410 _keys!605)))) (or (is-Undefined!13725 lt!675346) (is-Found!13725 lt!675346) (not (is-MissingVacant!13725 lt!675346)) (not (= (index!57301 lt!675346) (index!57300 lt!675322))) (and (bvsge (index!57301 lt!675346) #b00000000000000000000000000000000) (bvslt (index!57301 lt!675346) (size!51410 _keys!605)))) (or (is-Undefined!13725 lt!675346) (ite (is-Found!13725 lt!675346) (= (select (arr!50860 _keys!605) (index!57299 lt!675346)) k!761) (and (is-MissingVacant!13725 lt!675346) (= (index!57301 lt!675346) (index!57300 lt!675322)) (= (select (arr!50860 _keys!605) (index!57301 lt!675346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!878918 () SeekEntryResult!13725)

(assert (=> d!165509 (= lt!675346 e!878918)))

(declare-fun c!145817 () Bool)

(assert (=> d!165509 (= c!145817 (bvsge (x!142269 lt!675322) #b01111111111111111111111111111110))))

(declare-fun lt!675345 () (_ BitVec 64))

(assert (=> d!165509 (= lt!675345 (select (arr!50860 _keys!605) (index!57300 lt!675322)))))

(assert (=> d!165509 (validMask!0 mask!898)))

(assert (=> d!165509 (= (seekKeyOrZeroReturnVacant!0 (x!142269 lt!675322) (index!57300 lt!675322) (index!57300 lt!675322) k!761 _keys!605 mask!898) lt!675346)))

(declare-fun b!1575818 () Bool)

(declare-fun e!878917 () SeekEntryResult!13725)

(assert (=> b!1575818 (= e!878917 (Found!13725 (index!57300 lt!675322)))))

(declare-fun b!1575819 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575819 (= e!878916 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142269 lt!675322) #b00000000000000000000000000000001) (nextIndex!0 (index!57300 lt!675322) (x!142269 lt!675322) mask!898) (index!57300 lt!675322) k!761 _keys!605 mask!898))))

(declare-fun b!1575820 () Bool)

(declare-fun c!145818 () Bool)

(assert (=> b!1575820 (= c!145818 (= lt!675345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575820 (= e!878917 e!878916)))

(declare-fun b!1575821 () Bool)

(assert (=> b!1575821 (= e!878918 Undefined!13725)))

(declare-fun b!1575822 () Bool)

(assert (=> b!1575822 (= e!878918 e!878917)))

(declare-fun c!145816 () Bool)

(assert (=> b!1575822 (= c!145816 (= lt!675345 k!761))))

(assert (= (and d!165509 c!145817) b!1575821))

(assert (= (and d!165509 (not c!145817)) b!1575822))

(assert (= (and b!1575822 c!145816) b!1575818))

(assert (= (and b!1575822 (not c!145816)) b!1575820))

(assert (= (and b!1575820 c!145818) b!1575817))

(assert (= (and b!1575820 (not c!145818)) b!1575819))

(declare-fun m!1448739 () Bool)

(assert (=> d!165509 m!1448739))

(declare-fun m!1448741 () Bool)

(assert (=> d!165509 m!1448741))

(assert (=> d!165509 m!1448693))

(assert (=> d!165509 m!1448689))

(declare-fun m!1448743 () Bool)

(assert (=> b!1575819 m!1448743))

(assert (=> b!1575819 m!1448743))

(declare-fun m!1448745 () Bool)

(assert (=> b!1575819 m!1448745))

(assert (=> b!1575762 d!165509))

(declare-fun d!165517 () Bool)

(assert (=> d!165517 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135972 d!165517))

(declare-fun d!165523 () Bool)

(assert (=> d!165523 (= (array_inv!39587 _keys!605) (bvsge (size!51410 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135972 d!165523))

(declare-fun b!1575886 () Bool)

(declare-fun lt!675370 () SeekEntryResult!13725)

(assert (=> b!1575886 (and (bvsge (index!57300 lt!675370) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675370) (size!51410 _keys!605)))))

(declare-fun e!878957 () Bool)

(assert (=> b!1575886 (= e!878957 (= (select (arr!50860 _keys!605) (index!57300 lt!675370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165525 () Bool)

(declare-fun e!878953 () Bool)

(assert (=> d!165525 e!878953))

(declare-fun c!145844 () Bool)

(assert (=> d!165525 (= c!145844 (and (is-Intermediate!13725 lt!675370) (undefined!14537 lt!675370)))))

(declare-fun e!878956 () SeekEntryResult!13725)

(assert (=> d!165525 (= lt!675370 e!878956)))

(declare-fun c!145845 () Bool)

(assert (=> d!165525 (= c!145845 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675369 () (_ BitVec 64))

(assert (=> d!165525 (= lt!675369 (select (arr!50860 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165525 (validMask!0 mask!898)))

(assert (=> d!165525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675370)))

(declare-fun b!1575887 () Bool)

(declare-fun e!878954 () Bool)

(assert (=> b!1575887 (= e!878953 e!878954)))

(declare-fun res!1076741 () Bool)

(assert (=> b!1575887 (= res!1076741 (and (is-Intermediate!13725 lt!675370) (not (undefined!14537 lt!675370)) (bvslt (x!142269 lt!675370) #b01111111111111111111111111111110) (bvsge (x!142269 lt!675370) #b00000000000000000000000000000000) (bvsge (x!142269 lt!675370) #b00000000000000000000000000000000)))))

(assert (=> b!1575887 (=> (not res!1076741) (not e!878954))))

(declare-fun b!1575888 () Bool)

(assert (=> b!1575888 (and (bvsge (index!57300 lt!675370) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675370) (size!51410 _keys!605)))))

(declare-fun res!1076743 () Bool)

(assert (=> b!1575888 (= res!1076743 (= (select (arr!50860 _keys!605) (index!57300 lt!675370)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575888 (=> res!1076743 e!878957)))

(declare-fun b!1575889 () Bool)

(assert (=> b!1575889 (and (bvsge (index!57300 lt!675370) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675370) (size!51410 _keys!605)))))

(declare-fun res!1076742 () Bool)

(assert (=> b!1575889 (= res!1076742 (= (select (arr!50860 _keys!605) (index!57300 lt!675370)) k!761))))

(assert (=> b!1575889 (=> res!1076742 e!878957)))

(assert (=> b!1575889 (= e!878954 e!878957)))

(declare-fun b!1575890 () Bool)

(assert (=> b!1575890 (= e!878953 (bvsge (x!142269 lt!675370) #b01111111111111111111111111111110))))

(declare-fun e!878955 () SeekEntryResult!13725)

(declare-fun b!1575891 () Bool)

(assert (=> b!1575891 (= e!878955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575892 () Bool)

(assert (=> b!1575892 (= e!878956 (Intermediate!13725 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575893 () Bool)

(assert (=> b!1575893 (= e!878956 e!878955)))

(declare-fun c!145843 () Bool)

(assert (=> b!1575893 (= c!145843 (or (= lt!675369 k!761) (= (bvadd lt!675369 lt!675369) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575894 () Bool)

(assert (=> b!1575894 (= e!878955 (Intermediate!13725 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165525 c!145845) b!1575892))

(assert (= (and d!165525 (not c!145845)) b!1575893))

(assert (= (and b!1575893 c!145843) b!1575894))

(assert (= (and b!1575893 (not c!145843)) b!1575891))

(assert (= (and d!165525 c!145844) b!1575890))

(assert (= (and d!165525 (not c!145844)) b!1575887))

(assert (= (and b!1575887 res!1076741) b!1575889))

(assert (= (and b!1575889 (not res!1076742)) b!1575888))

(assert (= (and b!1575888 (not res!1076743)) b!1575886))

(assert (=> d!165525 m!1448695))

(declare-fun m!1448763 () Bool)

(assert (=> d!165525 m!1448763))

(assert (=> d!165525 m!1448689))

(declare-fun m!1448765 () Bool)

(assert (=> b!1575888 m!1448765))

(assert (=> b!1575886 m!1448765))

(assert (=> b!1575889 m!1448765))

(assert (=> b!1575891 m!1448695))

(declare-fun m!1448767 () Bool)

(assert (=> b!1575891 m!1448767))

(assert (=> b!1575891 m!1448767))

(declare-fun m!1448769 () Bool)

(assert (=> b!1575891 m!1448769))

(assert (=> b!1575761 d!165525))

(declare-fun d!165537 () Bool)

(declare-fun lt!675376 () (_ BitVec 32))

(declare-fun lt!675375 () (_ BitVec 32))

(assert (=> d!165537 (= lt!675376 (bvmul (bvxor lt!675375 (bvlshr lt!675375 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165537 (= lt!675375 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165537 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076744 (let ((h!38274 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142278 (bvmul (bvxor h!38274 (bvlshr h!38274 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142278 (bvlshr x!142278 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076744 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076744 #b00000000000000000000000000000000))))))

(assert (=> d!165537 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675376 (bvlshr lt!675376 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575761 d!165537))

(push 1)

(assert (not b!1575891))

(assert (not b!1575819))

(assert (not d!165525))

(assert (not d!165509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

