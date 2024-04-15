; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135658 () Bool)

(assert start!135658)

(declare-fun res!1075954 () Bool)

(declare-fun e!878122 () Bool)

(assert (=> start!135658 (=> (not res!1075954) (not e!878122))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135658 (= res!1075954 (validMask!0 mask!898))))

(assert (=> start!135658 e!878122))

(assert (=> start!135658 true))

(declare-datatypes ((array!105266 0))(
  ( (array!105267 (arr!50777 (Array (_ BitVec 32) (_ BitVec 64))) (size!51329 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105266)

(declare-fun array_inv!39713 (array!105266) Bool)

(assert (=> start!135658 (array_inv!39713 _keys!605)))

(declare-fun b!1574526 () Bool)

(declare-fun res!1075956 () Bool)

(assert (=> b!1574526 (=> (not res!1075956) (not e!878122))))

(assert (=> b!1574526 (= res!1075956 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51329 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574527 () Bool)

(declare-fun res!1075955 () Bool)

(assert (=> b!1574527 (=> (not res!1075955) (not e!878122))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574527 (= res!1075955 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13677 0))(
  ( (MissingZero!13677 (index!57106 (_ BitVec 32))) (Found!13677 (index!57107 (_ BitVec 32))) (Intermediate!13677 (undefined!14489 Bool) (index!57108 (_ BitVec 32)) (x!142052 (_ BitVec 32))) (Undefined!13677) (MissingVacant!13677 (index!57109 (_ BitVec 32))) )
))
(declare-fun lt!674673 () SeekEntryResult!13677)

(declare-fun b!1574528 () Bool)

(get-info :version)

(assert (=> b!1574528 (= e!878122 (and ((_ is Intermediate!13677) lt!674673) (not (undefined!14489 lt!674673)) (not (= (select (arr!50777 _keys!605) (index!57108 lt!674673)) k0!761)) (not (= (select (arr!50777 _keys!605) (index!57108 lt!674673)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50777 _keys!605) (index!57108 lt!674673)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105266 (_ BitVec 32)) SeekEntryResult!13677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574528 (= lt!674673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135658 res!1075954) b!1574526))

(assert (= (and b!1574526 res!1075956) b!1574527))

(assert (= (and b!1574527 res!1075955) b!1574528))

(declare-fun m!1447143 () Bool)

(assert (=> start!135658 m!1447143))

(declare-fun m!1447145 () Bool)

(assert (=> start!135658 m!1447145))

(declare-fun m!1447147 () Bool)

(assert (=> b!1574527 m!1447147))

(declare-fun m!1447149 () Bool)

(assert (=> b!1574528 m!1447149))

(declare-fun m!1447151 () Bool)

(assert (=> b!1574528 m!1447151))

(assert (=> b!1574528 m!1447151))

(declare-fun m!1447153 () Bool)

(assert (=> b!1574528 m!1447153))

(check-sat (not start!135658) (not b!1574528) (not b!1574527))
(check-sat)
(get-model)

(declare-fun d!165051 () Bool)

(assert (=> d!165051 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135658 d!165051))

(declare-fun d!165057 () Bool)

(assert (=> d!165057 (= (array_inv!39713 _keys!605) (bvsge (size!51329 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135658 d!165057))

(declare-fun b!1574583 () Bool)

(declare-fun e!878156 () SeekEntryResult!13677)

(assert (=> b!1574583 (= e!878156 (Intermediate!13677 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574584 () Bool)

(declare-fun e!878157 () Bool)

(declare-fun e!878160 () Bool)

(assert (=> b!1574584 (= e!878157 e!878160)))

(declare-fun res!1075988 () Bool)

(declare-fun lt!674688 () SeekEntryResult!13677)

(assert (=> b!1574584 (= res!1075988 (and ((_ is Intermediate!13677) lt!674688) (not (undefined!14489 lt!674688)) (bvslt (x!142052 lt!674688) #b01111111111111111111111111111110) (bvsge (x!142052 lt!674688) #b00000000000000000000000000000000) (bvsge (x!142052 lt!674688) #b00000000000000000000000000000000)))))

(assert (=> b!1574584 (=> (not res!1075988) (not e!878160))))

(declare-fun d!165059 () Bool)

(assert (=> d!165059 e!878157))

(declare-fun c!145563 () Bool)

(assert (=> d!165059 (= c!145563 (and ((_ is Intermediate!13677) lt!674688) (undefined!14489 lt!674688)))))

(assert (=> d!165059 (= lt!674688 e!878156)))

(declare-fun c!145562 () Bool)

(assert (=> d!165059 (= c!145562 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674689 () (_ BitVec 64))

(assert (=> d!165059 (= lt!674689 (select (arr!50777 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165059 (validMask!0 mask!898)))

(assert (=> d!165059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!674688)))

(declare-fun b!1574585 () Bool)

(assert (=> b!1574585 (and (bvsge (index!57108 lt!674688) #b00000000000000000000000000000000) (bvslt (index!57108 lt!674688) (size!51329 _keys!605)))))

(declare-fun res!1075987 () Bool)

(assert (=> b!1574585 (= res!1075987 (= (select (arr!50777 _keys!605) (index!57108 lt!674688)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878159 () Bool)

(assert (=> b!1574585 (=> res!1075987 e!878159)))

(declare-fun b!1574586 () Bool)

(assert (=> b!1574586 (and (bvsge (index!57108 lt!674688) #b00000000000000000000000000000000) (bvslt (index!57108 lt!674688) (size!51329 _keys!605)))))

(assert (=> b!1574586 (= e!878159 (= (select (arr!50777 _keys!605) (index!57108 lt!674688)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878158 () SeekEntryResult!13677)

(declare-fun b!1574587 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574587 (= e!878158 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1574588 () Bool)

(assert (=> b!1574588 (= e!878158 (Intermediate!13677 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574589 () Bool)

(assert (=> b!1574589 (= e!878156 e!878158)))

(declare-fun c!145564 () Bool)

(assert (=> b!1574589 (= c!145564 (or (= lt!674689 k0!761) (= (bvadd lt!674689 lt!674689) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574590 () Bool)

(assert (=> b!1574590 (and (bvsge (index!57108 lt!674688) #b00000000000000000000000000000000) (bvslt (index!57108 lt!674688) (size!51329 _keys!605)))))

(declare-fun res!1075989 () Bool)

(assert (=> b!1574590 (= res!1075989 (= (select (arr!50777 _keys!605) (index!57108 lt!674688)) k0!761))))

(assert (=> b!1574590 (=> res!1075989 e!878159)))

(assert (=> b!1574590 (= e!878160 e!878159)))

(declare-fun b!1574591 () Bool)

(assert (=> b!1574591 (= e!878157 (bvsge (x!142052 lt!674688) #b01111111111111111111111111111110))))

(assert (= (and d!165059 c!145562) b!1574583))

(assert (= (and d!165059 (not c!145562)) b!1574589))

(assert (= (and b!1574589 c!145564) b!1574588))

(assert (= (and b!1574589 (not c!145564)) b!1574587))

(assert (= (and d!165059 c!145563) b!1574591))

(assert (= (and d!165059 (not c!145563)) b!1574584))

(assert (= (and b!1574584 res!1075988) b!1574590))

(assert (= (and b!1574590 (not res!1075989)) b!1574585))

(assert (= (and b!1574585 (not res!1075987)) b!1574586))

(declare-fun m!1447179 () Bool)

(assert (=> b!1574590 m!1447179))

(assert (=> b!1574587 m!1447151))

(declare-fun m!1447181 () Bool)

(assert (=> b!1574587 m!1447181))

(assert (=> b!1574587 m!1447181))

(declare-fun m!1447183 () Bool)

(assert (=> b!1574587 m!1447183))

(assert (=> b!1574586 m!1447179))

(assert (=> d!165059 m!1447151))

(declare-fun m!1447185 () Bool)

(assert (=> d!165059 m!1447185))

(assert (=> d!165059 m!1447143))

(assert (=> b!1574585 m!1447179))

(assert (=> b!1574528 d!165059))

(declare-fun d!165069 () Bool)

(declare-fun lt!674701 () (_ BitVec 32))

(declare-fun lt!674700 () (_ BitVec 32))

(assert (=> d!165069 (= lt!674701 (bvmul (bvxor lt!674700 (bvlshr lt!674700 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165069 (= lt!674700 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165069 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1075990 (let ((h!38297 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142057 (bvmul (bvxor h!38297 (bvlshr h!38297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142057 (bvlshr x!142057 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1075990 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1075990 #b00000000000000000000000000000000))))))

(assert (=> d!165069 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!674701 (bvlshr lt!674701 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574528 d!165069))

(declare-fun d!165073 () Bool)

(assert (=> d!165073 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574527 d!165073))

(check-sat (not b!1574587) (not d!165059))
(check-sat)
