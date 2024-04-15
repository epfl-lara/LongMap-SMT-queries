; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135976 () Bool)

(assert start!135976)

(declare-fun b!1575617 () Bool)

(declare-fun res!1076637 () Bool)

(declare-fun e!878782 () Bool)

(assert (=> b!1575617 (=> (not res!1076637) (not e!878782))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((array!105389 0))(
  ( (array!105390 (arr!50828 (Array (_ BitVec 32) (_ BitVec 64))) (size!51380 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105389)

(assert (=> b!1575617 (= res!1076637 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51380 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575618 () Bool)

(declare-fun res!1076636 () Bool)

(assert (=> b!1575618 (=> (not res!1076636) (not e!878782))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575618 (= res!1076636 (validKeyInArray!0 k0!761))))

(declare-fun b!1575620 () Bool)

(declare-fun e!878783 () Bool)

(declare-datatypes ((SeekEntryResult!13728 0))(
  ( (MissingZero!13728 (index!57310 (_ BitVec 32))) (Found!13728 (index!57311 (_ BitVec 32))) (Intermediate!13728 (undefined!14540 Bool) (index!57312 (_ BitVec 32)) (x!142284 (_ BitVec 32))) (Undefined!13728) (MissingVacant!13728 (index!57313 (_ BitVec 32))) )
))
(declare-fun lt!675108 () SeekEntryResult!13728)

(get-info :version)

(assert (=> b!1575620 (= e!878783 (and (not ((_ is Undefined!13728) lt!675108)) (not ((_ is Found!13728) lt!675108)) ((_ is MissingZero!13728) lt!675108) (or (bvslt (index!57310 lt!675108) #b00000000000000000000000000000000) (bvsge (index!57310 lt!675108) (size!51380 _keys!605)))))))

(declare-fun lt!675107 () SeekEntryResult!13728)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105389 (_ BitVec 32)) SeekEntryResult!13728)

(assert (=> b!1575620 (= lt!675108 (seekKeyOrZeroReturnVacant!0 (x!142284 lt!675107) (index!57312 lt!675107) (index!57312 lt!675107) k0!761 _keys!605 mask!898))))

(declare-fun b!1575619 () Bool)

(assert (=> b!1575619 (= e!878782 e!878783)))

(declare-fun res!1076635 () Bool)

(assert (=> b!1575619 (=> (not res!1076635) (not e!878783))))

(assert (=> b!1575619 (= res!1076635 (and (not (undefined!14540 lt!675107)) ((_ is Intermediate!13728) lt!675107) (not (= (select (arr!50828 _keys!605) (index!57312 lt!675107)) k0!761)) (not (= (select (arr!50828 _keys!605) (index!57312 lt!675107)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50828 _keys!605) (index!57312 lt!675107)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57312 lt!675107) #b00000000000000000000000000000000) (bvslt (index!57312 lt!675107) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105389 (_ BitVec 32)) SeekEntryResult!13728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575619 (= lt!675107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun res!1076634 () Bool)

(assert (=> start!135976 (=> (not res!1076634) (not e!878782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135976 (= res!1076634 (validMask!0 mask!898))))

(assert (=> start!135976 e!878782))

(assert (=> start!135976 true))

(declare-fun array_inv!39764 (array!105389) Bool)

(assert (=> start!135976 (array_inv!39764 _keys!605)))

(assert (= (and start!135976 res!1076634) b!1575617))

(assert (= (and b!1575617 res!1076637) b!1575618))

(assert (= (and b!1575618 res!1076636) b!1575619))

(assert (= (and b!1575619 res!1076635) b!1575620))

(declare-fun m!1447887 () Bool)

(assert (=> b!1575618 m!1447887))

(declare-fun m!1447889 () Bool)

(assert (=> b!1575620 m!1447889))

(declare-fun m!1447891 () Bool)

(assert (=> b!1575619 m!1447891))

(declare-fun m!1447893 () Bool)

(assert (=> b!1575619 m!1447893))

(assert (=> b!1575619 m!1447893))

(declare-fun m!1447895 () Bool)

(assert (=> b!1575619 m!1447895))

(declare-fun m!1447897 () Bool)

(assert (=> start!135976 m!1447897))

(declare-fun m!1447899 () Bool)

(assert (=> start!135976 m!1447899))

(check-sat (not b!1575620) (not b!1575619) (not start!135976) (not b!1575618))
(check-sat)
(get-model)

(declare-fun b!1575657 () Bool)

(declare-fun e!878809 () SeekEntryResult!13728)

(assert (=> b!1575657 (= e!878809 (Found!13728 (index!57312 lt!675107)))))

(declare-fun b!1575658 () Bool)

(declare-fun e!878808 () SeekEntryResult!13728)

(assert (=> b!1575658 (= e!878808 e!878809)))

(declare-fun c!145774 () Bool)

(declare-fun lt!675125 () (_ BitVec 64))

(assert (=> b!1575658 (= c!145774 (= lt!675125 k0!761))))

(declare-fun b!1575659 () Bool)

(declare-fun e!878810 () SeekEntryResult!13728)

(assert (=> b!1575659 (= e!878810 (MissingVacant!13728 (index!57312 lt!675107)))))

(declare-fun lt!675126 () SeekEntryResult!13728)

(declare-fun d!165301 () Bool)

(assert (=> d!165301 (and (or ((_ is Undefined!13728) lt!675126) (not ((_ is Found!13728) lt!675126)) (and (bvsge (index!57311 lt!675126) #b00000000000000000000000000000000) (bvslt (index!57311 lt!675126) (size!51380 _keys!605)))) (or ((_ is Undefined!13728) lt!675126) ((_ is Found!13728) lt!675126) (not ((_ is MissingVacant!13728) lt!675126)) (not (= (index!57313 lt!675126) (index!57312 lt!675107))) (and (bvsge (index!57313 lt!675126) #b00000000000000000000000000000000) (bvslt (index!57313 lt!675126) (size!51380 _keys!605)))) (or ((_ is Undefined!13728) lt!675126) (ite ((_ is Found!13728) lt!675126) (= (select (arr!50828 _keys!605) (index!57311 lt!675126)) k0!761) (and ((_ is MissingVacant!13728) lt!675126) (= (index!57313 lt!675126) (index!57312 lt!675107)) (= (select (arr!50828 _keys!605) (index!57313 lt!675126)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165301 (= lt!675126 e!878808)))

(declare-fun c!145773 () Bool)

(assert (=> d!165301 (= c!145773 (bvsge (x!142284 lt!675107) #b01111111111111111111111111111110))))

(assert (=> d!165301 (= lt!675125 (select (arr!50828 _keys!605) (index!57312 lt!675107)))))

(assert (=> d!165301 (validMask!0 mask!898)))

(assert (=> d!165301 (= (seekKeyOrZeroReturnVacant!0 (x!142284 lt!675107) (index!57312 lt!675107) (index!57312 lt!675107) k0!761 _keys!605 mask!898) lt!675126)))

(declare-fun b!1575660 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575660 (= e!878810 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142284 lt!675107) #b00000000000000000000000000000001) (nextIndex!0 (index!57312 lt!675107) (x!142284 lt!675107) mask!898) (index!57312 lt!675107) k0!761 _keys!605 mask!898))))

(declare-fun b!1575661 () Bool)

(declare-fun c!145772 () Bool)

(assert (=> b!1575661 (= c!145772 (= lt!675125 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575661 (= e!878809 e!878810)))

(declare-fun b!1575662 () Bool)

(assert (=> b!1575662 (= e!878808 Undefined!13728)))

(assert (= (and d!165301 c!145773) b!1575662))

(assert (= (and d!165301 (not c!145773)) b!1575658))

(assert (= (and b!1575658 c!145774) b!1575657))

(assert (= (and b!1575658 (not c!145774)) b!1575661))

(assert (= (and b!1575661 c!145772) b!1575659))

(assert (= (and b!1575661 (not c!145772)) b!1575660))

(declare-fun m!1447929 () Bool)

(assert (=> d!165301 m!1447929))

(declare-fun m!1447931 () Bool)

(assert (=> d!165301 m!1447931))

(assert (=> d!165301 m!1447891))

(assert (=> d!165301 m!1447897))

(declare-fun m!1447933 () Bool)

(assert (=> b!1575660 m!1447933))

(assert (=> b!1575660 m!1447933))

(declare-fun m!1447935 () Bool)

(assert (=> b!1575660 m!1447935))

(assert (=> b!1575620 d!165301))

(declare-fun b!1575727 () Bool)

(declare-fun e!878848 () SeekEntryResult!13728)

(assert (=> b!1575727 (= e!878848 (Intermediate!13728 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575728 () Bool)

(declare-fun lt!675143 () SeekEntryResult!13728)

(assert (=> b!1575728 (and (bvsge (index!57312 lt!675143) #b00000000000000000000000000000000) (bvslt (index!57312 lt!675143) (size!51380 _keys!605)))))

(declare-fun res!1076679 () Bool)

(assert (=> b!1575728 (= res!1076679 (= (select (arr!50828 _keys!605) (index!57312 lt!675143)) k0!761))))

(declare-fun e!878849 () Bool)

(assert (=> b!1575728 (=> res!1076679 e!878849)))

(declare-fun e!878845 () Bool)

(assert (=> b!1575728 (= e!878845 e!878849)))

(declare-fun b!1575729 () Bool)

(assert (=> b!1575729 (= e!878848 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575730 () Bool)

(declare-fun e!878847 () Bool)

(assert (=> b!1575730 (= e!878847 (bvsge (x!142284 lt!675143) #b01111111111111111111111111111110))))

(declare-fun b!1575731 () Bool)

(declare-fun e!878846 () SeekEntryResult!13728)

(assert (=> b!1575731 (= e!878846 (Intermediate!13728 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575732 () Bool)

(assert (=> b!1575732 (and (bvsge (index!57312 lt!675143) #b00000000000000000000000000000000) (bvslt (index!57312 lt!675143) (size!51380 _keys!605)))))

(declare-fun res!1076680 () Bool)

(assert (=> b!1575732 (= res!1076680 (= (select (arr!50828 _keys!605) (index!57312 lt!675143)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575732 (=> res!1076680 e!878849)))

(declare-fun b!1575733 () Bool)

(assert (=> b!1575733 (= e!878847 e!878845)))

(declare-fun res!1076678 () Bool)

(assert (=> b!1575733 (= res!1076678 (and ((_ is Intermediate!13728) lt!675143) (not (undefined!14540 lt!675143)) (bvslt (x!142284 lt!675143) #b01111111111111111111111111111110) (bvsge (x!142284 lt!675143) #b00000000000000000000000000000000) (bvsge (x!142284 lt!675143) #b00000000000000000000000000000000)))))

(assert (=> b!1575733 (=> (not res!1076678) (not e!878845))))

(declare-fun b!1575734 () Bool)

(assert (=> b!1575734 (and (bvsge (index!57312 lt!675143) #b00000000000000000000000000000000) (bvslt (index!57312 lt!675143) (size!51380 _keys!605)))))

(assert (=> b!1575734 (= e!878849 (= (select (arr!50828 _keys!605) (index!57312 lt!675143)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165307 () Bool)

(assert (=> d!165307 e!878847))

(declare-fun c!145800 () Bool)

(assert (=> d!165307 (= c!145800 (and ((_ is Intermediate!13728) lt!675143) (undefined!14540 lt!675143)))))

(assert (=> d!165307 (= lt!675143 e!878846)))

(declare-fun c!145799 () Bool)

(assert (=> d!165307 (= c!145799 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675144 () (_ BitVec 64))

(assert (=> d!165307 (= lt!675144 (select (arr!50828 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165307 (validMask!0 mask!898)))

(assert (=> d!165307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675143)))

(declare-fun b!1575726 () Bool)

(assert (=> b!1575726 (= e!878846 e!878848)))

(declare-fun c!145801 () Bool)

(assert (=> b!1575726 (= c!145801 (or (= lt!675144 k0!761) (= (bvadd lt!675144 lt!675144) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165307 c!145799) b!1575731))

(assert (= (and d!165307 (not c!145799)) b!1575726))

(assert (= (and b!1575726 c!145801) b!1575727))

(assert (= (and b!1575726 (not c!145801)) b!1575729))

(assert (= (and d!165307 c!145800) b!1575730))

(assert (= (and d!165307 (not c!145800)) b!1575733))

(assert (= (and b!1575733 res!1076678) b!1575728))

(assert (= (and b!1575728 (not res!1076679)) b!1575732))

(assert (= (and b!1575732 (not res!1076680)) b!1575734))

(declare-fun m!1447953 () Bool)

(assert (=> b!1575728 m!1447953))

(assert (=> d!165307 m!1447893))

(declare-fun m!1447955 () Bool)

(assert (=> d!165307 m!1447955))

(assert (=> d!165307 m!1447897))

(assert (=> b!1575732 m!1447953))

(assert (=> b!1575734 m!1447953))

(assert (=> b!1575729 m!1447893))

(declare-fun m!1447957 () Bool)

(assert (=> b!1575729 m!1447957))

(assert (=> b!1575729 m!1447957))

(declare-fun m!1447959 () Bool)

(assert (=> b!1575729 m!1447959))

(assert (=> b!1575619 d!165307))

(declare-fun d!165313 () Bool)

(declare-fun lt!675160 () (_ BitVec 32))

(declare-fun lt!675159 () (_ BitVec 32))

(assert (=> d!165313 (= lt!675160 (bvmul (bvxor lt!675159 (bvlshr lt!675159 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165313 (= lt!675159 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165313 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076681 (let ((h!38319 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142293 (bvmul (bvxor h!38319 (bvlshr h!38319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142293 (bvlshr x!142293 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076681 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076681 #b00000000000000000000000000000000))))))

(assert (=> d!165313 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675160 (bvlshr lt!675160 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575619 d!165313))

(declare-fun d!165317 () Bool)

(assert (=> d!165317 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135976 d!165317))

(declare-fun d!165329 () Bool)

(assert (=> d!165329 (= (array_inv!39764 _keys!605) (bvsge (size!51380 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135976 d!165329))

(declare-fun d!165331 () Bool)

(assert (=> d!165331 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575618 d!165331))

(check-sat (not d!165301) (not b!1575729) (not d!165307) (not b!1575660))
(check-sat)
