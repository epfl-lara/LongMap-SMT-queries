; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135974 () Bool)

(assert start!135974)

(declare-fun b!1575774 () Bool)

(declare-fun e!878889 () Bool)

(declare-datatypes ((SeekEntryResult!13726 0))(
  ( (MissingZero!13726 (index!57302 (_ BitVec 32))) (Found!13726 (index!57303 (_ BitVec 32))) (Intermediate!13726 (undefined!14538 Bool) (index!57304 (_ BitVec 32)) (x!142270 (_ BitVec 32))) (Undefined!13726) (MissingVacant!13726 (index!57305 (_ BitVec 32))) )
))
(declare-fun lt!675328 () SeekEntryResult!13726)

(declare-datatypes ((array!105452 0))(
  ( (array!105453 (arr!50861 (Array (_ BitVec 32) (_ BitVec 64))) (size!51411 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105452)

(get-info :version)

(assert (=> b!1575774 (= e!878889 (and (not ((_ is Undefined!13726) lt!675328)) ((_ is Found!13726) lt!675328) (or (bvslt (index!57303 lt!675328) #b00000000000000000000000000000000) (bvsge (index!57303 lt!675328) (size!51411 _keys!605)))))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun lt!675327 () SeekEntryResult!13726)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105452 (_ BitVec 32)) SeekEntryResult!13726)

(assert (=> b!1575774 (= lt!675328 (seekKeyOrZeroReturnVacant!0 (x!142270 lt!675327) (index!57304 lt!675327) (index!57304 lt!675327) k0!761 _keys!605 mask!898))))

(declare-fun res!1076709 () Bool)

(declare-fun e!878891 () Bool)

(assert (=> start!135974 (=> (not res!1076709) (not e!878891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135974 (= res!1076709 (validMask!0 mask!898))))

(assert (=> start!135974 e!878891))

(assert (=> start!135974 true))

(declare-fun array_inv!39588 (array!105452) Bool)

(assert (=> start!135974 (array_inv!39588 _keys!605)))

(declare-fun b!1575772 () Bool)

(declare-fun res!1076712 () Bool)

(assert (=> b!1575772 (=> (not res!1076712) (not e!878891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575772 (= res!1076712 (validKeyInArray!0 k0!761))))

(declare-fun b!1575773 () Bool)

(assert (=> b!1575773 (= e!878891 e!878889)))

(declare-fun res!1076711 () Bool)

(assert (=> b!1575773 (=> (not res!1076711) (not e!878889))))

(assert (=> b!1575773 (= res!1076711 (and (not (undefined!14538 lt!675327)) ((_ is Intermediate!13726) lt!675327) (not (= (select (arr!50861 _keys!605) (index!57304 lt!675327)) k0!761)) (not (= (select (arr!50861 _keys!605) (index!57304 lt!675327)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50861 _keys!605) (index!57304 lt!675327)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57304 lt!675327) #b00000000000000000000000000000000) (bvslt (index!57304 lt!675327) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105452 (_ BitVec 32)) SeekEntryResult!13726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575773 (= lt!675327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575771 () Bool)

(declare-fun res!1076710 () Bool)

(assert (=> b!1575771 (=> (not res!1076710) (not e!878891))))

(assert (=> b!1575771 (= res!1076710 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51411 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!135974 res!1076709) b!1575771))

(assert (= (and b!1575771 res!1076710) b!1575772))

(assert (= (and b!1575772 res!1076712) b!1575773))

(assert (= (and b!1575773 res!1076711) b!1575774))

(declare-fun m!1448703 () Bool)

(assert (=> b!1575774 m!1448703))

(declare-fun m!1448705 () Bool)

(assert (=> start!135974 m!1448705))

(declare-fun m!1448707 () Bool)

(assert (=> start!135974 m!1448707))

(declare-fun m!1448709 () Bool)

(assert (=> b!1575772 m!1448709))

(declare-fun m!1448711 () Bool)

(assert (=> b!1575773 m!1448711))

(declare-fun m!1448713 () Bool)

(assert (=> b!1575773 m!1448713))

(assert (=> b!1575773 m!1448713))

(declare-fun m!1448715 () Bool)

(assert (=> b!1575773 m!1448715))

(check-sat (not b!1575774) (not start!135974) (not b!1575773) (not b!1575772))
(check-sat)
(get-model)

(declare-fun b!1575799 () Bool)

(declare-fun e!878907 () SeekEntryResult!13726)

(assert (=> b!1575799 (= e!878907 (MissingVacant!13726 (index!57304 lt!675327)))))

(declare-fun lt!675340 () SeekEntryResult!13726)

(declare-fun d!165505 () Bool)

(assert (=> d!165505 (and (or ((_ is Undefined!13726) lt!675340) (not ((_ is Found!13726) lt!675340)) (and (bvsge (index!57303 lt!675340) #b00000000000000000000000000000000) (bvslt (index!57303 lt!675340) (size!51411 _keys!605)))) (or ((_ is Undefined!13726) lt!675340) ((_ is Found!13726) lt!675340) (not ((_ is MissingVacant!13726) lt!675340)) (not (= (index!57305 lt!675340) (index!57304 lt!675327))) (and (bvsge (index!57305 lt!675340) #b00000000000000000000000000000000) (bvslt (index!57305 lt!675340) (size!51411 _keys!605)))) (or ((_ is Undefined!13726) lt!675340) (ite ((_ is Found!13726) lt!675340) (= (select (arr!50861 _keys!605) (index!57303 lt!675340)) k0!761) (and ((_ is MissingVacant!13726) lt!675340) (= (index!57305 lt!675340) (index!57304 lt!675327)) (= (select (arr!50861 _keys!605) (index!57305 lt!675340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!878909 () SeekEntryResult!13726)

(assert (=> d!165505 (= lt!675340 e!878909)))

(declare-fun c!145807 () Bool)

(assert (=> d!165505 (= c!145807 (bvsge (x!142270 lt!675327) #b01111111111111111111111111111110))))

(declare-fun lt!675339 () (_ BitVec 64))

(assert (=> d!165505 (= lt!675339 (select (arr!50861 _keys!605) (index!57304 lt!675327)))))

(assert (=> d!165505 (validMask!0 mask!898)))

(assert (=> d!165505 (= (seekKeyOrZeroReturnVacant!0 (x!142270 lt!675327) (index!57304 lt!675327) (index!57304 lt!675327) k0!761 _keys!605 mask!898) lt!675340)))

(declare-fun b!1575800 () Bool)

(declare-fun c!145809 () Bool)

(assert (=> b!1575800 (= c!145809 (= lt!675339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878908 () SeekEntryResult!13726)

(assert (=> b!1575800 (= e!878908 e!878907)))

(declare-fun b!1575801 () Bool)

(assert (=> b!1575801 (= e!878909 e!878908)))

(declare-fun c!145808 () Bool)

(assert (=> b!1575801 (= c!145808 (= lt!675339 k0!761))))

(declare-fun b!1575802 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575802 (= e!878907 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142270 lt!675327) #b00000000000000000000000000000001) (nextIndex!0 (index!57304 lt!675327) (x!142270 lt!675327) mask!898) (index!57304 lt!675327) k0!761 _keys!605 mask!898))))

(declare-fun b!1575803 () Bool)

(assert (=> b!1575803 (= e!878909 Undefined!13726)))

(declare-fun b!1575804 () Bool)

(assert (=> b!1575804 (= e!878908 (Found!13726 (index!57304 lt!675327)))))

(assert (= (and d!165505 c!145807) b!1575803))

(assert (= (and d!165505 (not c!145807)) b!1575801))

(assert (= (and b!1575801 c!145808) b!1575804))

(assert (= (and b!1575801 (not c!145808)) b!1575800))

(assert (= (and b!1575800 c!145809) b!1575799))

(assert (= (and b!1575800 (not c!145809)) b!1575802))

(declare-fun m!1448731 () Bool)

(assert (=> d!165505 m!1448731))

(declare-fun m!1448733 () Bool)

(assert (=> d!165505 m!1448733))

(assert (=> d!165505 m!1448711))

(assert (=> d!165505 m!1448705))

(declare-fun m!1448735 () Bool)

(assert (=> b!1575802 m!1448735))

(assert (=> b!1575802 m!1448735))

(declare-fun m!1448737 () Bool)

(assert (=> b!1575802 m!1448737))

(assert (=> b!1575774 d!165505))

(declare-fun d!165511 () Bool)

(assert (=> d!165511 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135974 d!165511))

(declare-fun d!165519 () Bool)

(assert (=> d!165519 (= (array_inv!39588 _keys!605) (bvsge (size!51411 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135974 d!165519))

(declare-fun b!1575859 () Bool)

(declare-fun lt!675358 () SeekEntryResult!13726)

(assert (=> b!1575859 (and (bvsge (index!57304 lt!675358) #b00000000000000000000000000000000) (bvslt (index!57304 lt!675358) (size!51411 _keys!605)))))

(declare-fun e!878939 () Bool)

(assert (=> b!1575859 (= e!878939 (= (select (arr!50861 _keys!605) (index!57304 lt!675358)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575860 () Bool)

(declare-fun e!878942 () SeekEntryResult!13726)

(assert (=> b!1575860 (= e!878942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575861 () Bool)

(assert (=> b!1575861 (and (bvsge (index!57304 lt!675358) #b00000000000000000000000000000000) (bvslt (index!57304 lt!675358) (size!51411 _keys!605)))))

(declare-fun res!1076732 () Bool)

(assert (=> b!1575861 (= res!1076732 (= (select (arr!50861 _keys!605) (index!57304 lt!675358)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575861 (=> res!1076732 e!878939)))

(declare-fun b!1575863 () Bool)

(assert (=> b!1575863 (= e!878942 (Intermediate!13726 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575864 () Bool)

(declare-fun e!878941 () Bool)

(declare-fun e!878938 () Bool)

(assert (=> b!1575864 (= e!878941 e!878938)))

(declare-fun res!1076731 () Bool)

(assert (=> b!1575864 (= res!1076731 (and ((_ is Intermediate!13726) lt!675358) (not (undefined!14538 lt!675358)) (bvslt (x!142270 lt!675358) #b01111111111111111111111111111110) (bvsge (x!142270 lt!675358) #b00000000000000000000000000000000) (bvsge (x!142270 lt!675358) #b00000000000000000000000000000000)))))

(assert (=> b!1575864 (=> (not res!1076731) (not e!878938))))

(declare-fun b!1575865 () Bool)

(declare-fun e!878940 () SeekEntryResult!13726)

(assert (=> b!1575865 (= e!878940 (Intermediate!13726 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575862 () Bool)

(assert (=> b!1575862 (= e!878941 (bvsge (x!142270 lt!675358) #b01111111111111111111111111111110))))

(declare-fun d!165521 () Bool)

(assert (=> d!165521 e!878941))

(declare-fun c!145834 () Bool)

(assert (=> d!165521 (= c!145834 (and ((_ is Intermediate!13726) lt!675358) (undefined!14538 lt!675358)))))

(assert (=> d!165521 (= lt!675358 e!878940)))

(declare-fun c!145836 () Bool)

(assert (=> d!165521 (= c!145836 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675357 () (_ BitVec 64))

(assert (=> d!165521 (= lt!675357 (select (arr!50861 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165521 (validMask!0 mask!898)))

(assert (=> d!165521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675358)))

(declare-fun b!1575866 () Bool)

(assert (=> b!1575866 (and (bvsge (index!57304 lt!675358) #b00000000000000000000000000000000) (bvslt (index!57304 lt!675358) (size!51411 _keys!605)))))

(declare-fun res!1076733 () Bool)

(assert (=> b!1575866 (= res!1076733 (= (select (arr!50861 _keys!605) (index!57304 lt!675358)) k0!761))))

(assert (=> b!1575866 (=> res!1076733 e!878939)))

(assert (=> b!1575866 (= e!878938 e!878939)))

(declare-fun b!1575867 () Bool)

(assert (=> b!1575867 (= e!878940 e!878942)))

(declare-fun c!145835 () Bool)

(assert (=> b!1575867 (= c!145835 (or (= lt!675357 k0!761) (= (bvadd lt!675357 lt!675357) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165521 c!145836) b!1575865))

(assert (= (and d!165521 (not c!145836)) b!1575867))

(assert (= (and b!1575867 c!145835) b!1575863))

(assert (= (and b!1575867 (not c!145835)) b!1575860))

(assert (= (and d!165521 c!145834) b!1575862))

(assert (= (and d!165521 (not c!145834)) b!1575864))

(assert (= (and b!1575864 res!1076731) b!1575866))

(assert (= (and b!1575866 (not res!1076733)) b!1575861))

(assert (= (and b!1575861 (not res!1076732)) b!1575859))

(declare-fun m!1448755 () Bool)

(assert (=> b!1575859 m!1448755))

(assert (=> d!165521 m!1448713))

(declare-fun m!1448757 () Bool)

(assert (=> d!165521 m!1448757))

(assert (=> d!165521 m!1448705))

(assert (=> b!1575866 m!1448755))

(assert (=> b!1575860 m!1448713))

(declare-fun m!1448759 () Bool)

(assert (=> b!1575860 m!1448759))

(assert (=> b!1575860 m!1448759))

(declare-fun m!1448761 () Bool)

(assert (=> b!1575860 m!1448761))

(assert (=> b!1575861 m!1448755))

(assert (=> b!1575773 d!165521))

(declare-fun d!165529 () Bool)

(declare-fun lt!675368 () (_ BitVec 32))

(declare-fun lt!675367 () (_ BitVec 32))

(assert (=> d!165529 (= lt!675368 (bvmul (bvxor lt!675367 (bvlshr lt!675367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165529 (= lt!675367 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165529 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076734 (let ((h!38273 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142276 (bvmul (bvxor h!38273 (bvlshr h!38273 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142276 (bvlshr x!142276 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076734 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076734 #b00000000000000000000000000000000))))))

(assert (=> d!165529 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675368 (bvlshr lt!675368 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575773 d!165529))

(declare-fun d!165535 () Bool)

(assert (=> d!165535 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575772 d!165535))

(check-sat (not b!1575802) (not d!165505) (not d!165521) (not b!1575860))
(check-sat)
