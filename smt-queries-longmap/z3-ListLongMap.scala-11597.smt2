; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135186 () Bool)

(assert start!135186)

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun e!877145 () Bool)

(declare-fun b!1572992 () Bool)

(declare-datatypes ((SeekEntryResult!13623 0))(
  ( (MissingZero!13623 (index!56890 (_ BitVec 32))) (Found!13623 (index!56891 (_ BitVec 32))) (Intermediate!13623 (undefined!14435 Bool) (index!56892 (_ BitVec 32)) (x!141684 (_ BitVec 32))) (Undefined!13623) (MissingVacant!13623 (index!56893 (_ BitVec 32))) )
))
(declare-fun lt!674064 () SeekEntryResult!13623)

(declare-datatypes ((array!105033 0))(
  ( (array!105034 (arr!50675 (Array (_ BitVec 32) (_ BitVec 64))) (size!51227 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105033)

(get-info :version)

(assert (=> b!1572992 (= e!877145 (and (not ((_ is MissingVacant!13623) lt!674064)) ((_ is Found!13623) lt!674064) (not (= (select (arr!50675 _keys!600) (index!56891 lt!674064)) k0!754))))))

(declare-fun lt!674063 () SeekEntryResult!13623)

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105033 (_ BitVec 32)) SeekEntryResult!13623)

(assert (=> b!1572992 (= lt!674064 (seekKeyOrZeroReturnVacant!0 (x!141684 lt!674063) (index!56892 lt!674063) (index!56892 lt!674063) k0!754 _keys!600 mask!889))))

(declare-fun b!1572990 () Bool)

(declare-fun res!1074775 () Bool)

(declare-fun e!877144 () Bool)

(assert (=> b!1572990 (=> (not res!1074775) (not e!877144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572990 (= res!1074775 (validKeyInArray!0 k0!754))))

(declare-fun b!1572989 () Bool)

(declare-fun res!1074776 () Bool)

(assert (=> b!1572989 (=> (not res!1074776) (not e!877144))))

(assert (=> b!1572989 (= res!1074776 (= (size!51227 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572991 () Bool)

(assert (=> b!1572991 (= e!877144 e!877145)))

(declare-fun res!1074774 () Bool)

(assert (=> b!1572991 (=> (not res!1074774) (not e!877145))))

(assert (=> b!1572991 (= res!1074774 (and (not (undefined!14435 lt!674063)) ((_ is Intermediate!13623) lt!674063) (not (= (select (arr!50675 _keys!600) (index!56892 lt!674063)) k0!754)) (not (= (select (arr!50675 _keys!600) (index!56892 lt!674063)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50675 _keys!600) (index!56892 lt!674063)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56892 lt!674063) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674063) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105033 (_ BitVec 32)) SeekEntryResult!13623)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572991 (= lt!674063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun res!1074777 () Bool)

(assert (=> start!135186 (=> (not res!1074777) (not e!877144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135186 (= res!1074777 (validMask!0 mask!889))))

(assert (=> start!135186 e!877144))

(assert (=> start!135186 true))

(declare-fun array_inv!39611 (array!105033) Bool)

(assert (=> start!135186 (array_inv!39611 _keys!600)))

(assert (= (and start!135186 res!1074777) b!1572989))

(assert (= (and b!1572989 res!1074776) b!1572990))

(assert (= (and b!1572990 res!1074775) b!1572991))

(assert (= (and b!1572991 res!1074774) b!1572992))

(declare-fun m!1445895 () Bool)

(assert (=> b!1572992 m!1445895))

(declare-fun m!1445897 () Bool)

(assert (=> b!1572992 m!1445897))

(declare-fun m!1445899 () Bool)

(assert (=> b!1572990 m!1445899))

(declare-fun m!1445901 () Bool)

(assert (=> b!1572991 m!1445901))

(declare-fun m!1445903 () Bool)

(assert (=> b!1572991 m!1445903))

(assert (=> b!1572991 m!1445903))

(declare-fun m!1445905 () Bool)

(assert (=> b!1572991 m!1445905))

(declare-fun m!1445907 () Bool)

(assert (=> start!135186 m!1445907))

(declare-fun m!1445909 () Bool)

(assert (=> start!135186 m!1445909))

(check-sat (not b!1572992) (not b!1572991) (not b!1572990) (not start!135186))
(check-sat)
(get-model)

(declare-fun lt!674082 () SeekEntryResult!13623)

(declare-fun d!164715 () Bool)

(assert (=> d!164715 (and (or ((_ is Undefined!13623) lt!674082) (not ((_ is Found!13623) lt!674082)) (and (bvsge (index!56891 lt!674082) #b00000000000000000000000000000000) (bvslt (index!56891 lt!674082) (size!51227 _keys!600)))) (or ((_ is Undefined!13623) lt!674082) ((_ is Found!13623) lt!674082) (not ((_ is MissingVacant!13623) lt!674082)) (not (= (index!56893 lt!674082) (index!56892 lt!674063))) (and (bvsge (index!56893 lt!674082) #b00000000000000000000000000000000) (bvslt (index!56893 lt!674082) (size!51227 _keys!600)))) (or ((_ is Undefined!13623) lt!674082) (ite ((_ is Found!13623) lt!674082) (= (select (arr!50675 _keys!600) (index!56891 lt!674082)) k0!754) (and ((_ is MissingVacant!13623) lt!674082) (= (index!56893 lt!674082) (index!56892 lt!674063)) (= (select (arr!50675 _keys!600) (index!56893 lt!674082)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!877172 () SeekEntryResult!13623)

(assert (=> d!164715 (= lt!674082 e!877172)))

(declare-fun c!145367 () Bool)

(assert (=> d!164715 (= c!145367 (bvsge (x!141684 lt!674063) #b01111111111111111111111111111110))))

(declare-fun lt!674081 () (_ BitVec 64))

(assert (=> d!164715 (= lt!674081 (select (arr!50675 _keys!600) (index!56892 lt!674063)))))

(assert (=> d!164715 (validMask!0 mask!889)))

(assert (=> d!164715 (= (seekKeyOrZeroReturnVacant!0 (x!141684 lt!674063) (index!56892 lt!674063) (index!56892 lt!674063) k0!754 _keys!600 mask!889) lt!674082)))

(declare-fun b!1573029 () Bool)

(declare-fun c!145369 () Bool)

(assert (=> b!1573029 (= c!145369 (= lt!674081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877170 () SeekEntryResult!13623)

(declare-fun e!877171 () SeekEntryResult!13623)

(assert (=> b!1573029 (= e!877170 e!877171)))

(declare-fun b!1573030 () Bool)

(assert (=> b!1573030 (= e!877170 (Found!13623 (index!56892 lt!674063)))))

(declare-fun b!1573031 () Bool)

(assert (=> b!1573031 (= e!877171 (MissingVacant!13623 (index!56892 lt!674063)))))

(declare-fun b!1573032 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573032 (= e!877171 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141684 lt!674063) #b00000000000000000000000000000001) (nextIndex!0 (index!56892 lt!674063) (x!141684 lt!674063) mask!889) (index!56892 lt!674063) k0!754 _keys!600 mask!889))))

(declare-fun b!1573033 () Bool)

(assert (=> b!1573033 (= e!877172 Undefined!13623)))

(declare-fun b!1573034 () Bool)

(assert (=> b!1573034 (= e!877172 e!877170)))

(declare-fun c!145368 () Bool)

(assert (=> b!1573034 (= c!145368 (= lt!674081 k0!754))))

(assert (= (and d!164715 c!145367) b!1573033))

(assert (= (and d!164715 (not c!145367)) b!1573034))

(assert (= (and b!1573034 c!145368) b!1573030))

(assert (= (and b!1573034 (not c!145368)) b!1573029))

(assert (= (and b!1573029 c!145369) b!1573031))

(assert (= (and b!1573029 (not c!145369)) b!1573032))

(declare-fun m!1445943 () Bool)

(assert (=> d!164715 m!1445943))

(declare-fun m!1445945 () Bool)

(assert (=> d!164715 m!1445945))

(assert (=> d!164715 m!1445901))

(assert (=> d!164715 m!1445907))

(declare-fun m!1445947 () Bool)

(assert (=> b!1573032 m!1445947))

(assert (=> b!1573032 m!1445947))

(declare-fun m!1445949 () Bool)

(assert (=> b!1573032 m!1445949))

(assert (=> b!1572992 d!164715))

(declare-fun b!1573098 () Bool)

(declare-fun e!877209 () SeekEntryResult!13623)

(declare-fun e!877208 () SeekEntryResult!13623)

(assert (=> b!1573098 (= e!877209 e!877208)))

(declare-fun c!145394 () Bool)

(declare-fun lt!674106 () (_ BitVec 64))

(assert (=> b!1573098 (= c!145394 (or (= lt!674106 k0!754) (= (bvadd lt!674106 lt!674106) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573099 () Bool)

(declare-fun e!877210 () Bool)

(declare-fun lt!674105 () SeekEntryResult!13623)

(assert (=> b!1573099 (= e!877210 (bvsge (x!141684 lt!674105) #b01111111111111111111111111111110))))

(declare-fun d!164721 () Bool)

(assert (=> d!164721 e!877210))

(declare-fun c!145395 () Bool)

(assert (=> d!164721 (= c!145395 (and ((_ is Intermediate!13623) lt!674105) (undefined!14435 lt!674105)))))

(assert (=> d!164721 (= lt!674105 e!877209)))

(declare-fun c!145396 () Bool)

(assert (=> d!164721 (= c!145396 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164721 (= lt!674106 (select (arr!50675 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164721 (validMask!0 mask!889)))

(assert (=> d!164721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674105)))

(declare-fun b!1573100 () Bool)

(assert (=> b!1573100 (= e!877208 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573101 () Bool)

(declare-fun e!877211 () Bool)

(assert (=> b!1573101 (= e!877210 e!877211)))

(declare-fun res!1074818 () Bool)

(assert (=> b!1573101 (= res!1074818 (and ((_ is Intermediate!13623) lt!674105) (not (undefined!14435 lt!674105)) (bvslt (x!141684 lt!674105) #b01111111111111111111111111111110) (bvsge (x!141684 lt!674105) #b00000000000000000000000000000000) (bvsge (x!141684 lt!674105) #b00000000000000000000000000000000)))))

(assert (=> b!1573101 (=> (not res!1074818) (not e!877211))))

(declare-fun b!1573102 () Bool)

(assert (=> b!1573102 (and (bvsge (index!56892 lt!674105) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674105) (size!51227 _keys!600)))))

(declare-fun res!1074820 () Bool)

(assert (=> b!1573102 (= res!1074820 (= (select (arr!50675 _keys!600) (index!56892 lt!674105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877207 () Bool)

(assert (=> b!1573102 (=> res!1074820 e!877207)))

(declare-fun b!1573103 () Bool)

(assert (=> b!1573103 (and (bvsge (index!56892 lt!674105) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674105) (size!51227 _keys!600)))))

(assert (=> b!1573103 (= e!877207 (= (select (arr!50675 _keys!600) (index!56892 lt!674105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573104 () Bool)

(assert (=> b!1573104 (and (bvsge (index!56892 lt!674105) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674105) (size!51227 _keys!600)))))

(declare-fun res!1074819 () Bool)

(assert (=> b!1573104 (= res!1074819 (= (select (arr!50675 _keys!600) (index!56892 lt!674105)) k0!754))))

(assert (=> b!1573104 (=> res!1074819 e!877207)))

(assert (=> b!1573104 (= e!877211 e!877207)))

(declare-fun b!1573105 () Bool)

(assert (=> b!1573105 (= e!877209 (Intermediate!13623 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573106 () Bool)

(assert (=> b!1573106 (= e!877208 (Intermediate!13623 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164721 c!145396) b!1573105))

(assert (= (and d!164721 (not c!145396)) b!1573098))

(assert (= (and b!1573098 c!145394) b!1573106))

(assert (= (and b!1573098 (not c!145394)) b!1573100))

(assert (= (and d!164721 c!145395) b!1573099))

(assert (= (and d!164721 (not c!145395)) b!1573101))

(assert (= (and b!1573101 res!1074818) b!1573104))

(assert (= (and b!1573104 (not res!1074819)) b!1573102))

(assert (= (and b!1573102 (not res!1074820)) b!1573103))

(assert (=> b!1573100 m!1445903))

(declare-fun m!1445967 () Bool)

(assert (=> b!1573100 m!1445967))

(assert (=> b!1573100 m!1445967))

(declare-fun m!1445969 () Bool)

(assert (=> b!1573100 m!1445969))

(declare-fun m!1445971 () Bool)

(assert (=> b!1573102 m!1445971))

(assert (=> b!1573104 m!1445971))

(assert (=> d!164721 m!1445903))

(declare-fun m!1445973 () Bool)

(assert (=> d!164721 m!1445973))

(assert (=> d!164721 m!1445907))

(assert (=> b!1573103 m!1445971))

(assert (=> b!1572991 d!164721))

(declare-fun d!164729 () Bool)

(declare-fun lt!674112 () (_ BitVec 32))

(declare-fun lt!674111 () (_ BitVec 32))

(assert (=> d!164729 (= lt!674112 (bvmul (bvxor lt!674111 (bvlshr lt!674111 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164729 (= lt!674111 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164729 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074821 (let ((h!38277 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141692 (bvmul (bvxor h!38277 (bvlshr h!38277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141692 (bvlshr x!141692 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074821 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074821 #b00000000000000000000000000000000))))))

(assert (=> d!164729 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674112 (bvlshr lt!674112 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572991 d!164729))

(declare-fun d!164731 () Bool)

(assert (=> d!164731 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572990 d!164731))

(declare-fun d!164733 () Bool)

(assert (=> d!164733 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135186 d!164733))

(declare-fun d!164739 () Bool)

(assert (=> d!164739 (= (array_inv!39611 _keys!600) (bvsge (size!51227 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135186 d!164739))

(check-sat (not b!1573100) (not b!1573032) (not d!164721) (not d!164715))
(check-sat)
