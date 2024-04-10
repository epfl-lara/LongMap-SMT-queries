; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135154 () Bool)

(assert start!135154)

(declare-fun b!1572975 () Bool)

(declare-fun e!877154 () Bool)

(declare-datatypes ((SeekEntryResult!13618 0))(
  ( (MissingZero!13618 (index!56870 (_ BitVec 32))) (Found!13618 (index!56871 (_ BitVec 32))) (Intermediate!13618 (undefined!14430 Bool) (index!56872 (_ BitVec 32)) (x!141650 (_ BitVec 32))) (Undefined!13618) (MissingVacant!13618 (index!56873 (_ BitVec 32))) )
))
(declare-fun lt!674212 () SeekEntryResult!13618)

(declare-datatypes ((array!105089 0))(
  ( (array!105090 (arr!50705 (Array (_ BitVec 32) (_ BitVec 64))) (size!51255 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105089)

(get-info :version)

(assert (=> b!1572975 (= e!877154 (and (not ((_ is MissingVacant!13618) lt!674212)) ((_ is Found!13618) lt!674212) (or (bvslt (index!56871 lt!674212) #b00000000000000000000000000000000) (bvsge (index!56871 lt!674212) (size!51255 _keys!600)))))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun lt!674211 () SeekEntryResult!13618)

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105089 (_ BitVec 32)) SeekEntryResult!13618)

(assert (=> b!1572975 (= lt!674212 (seekKeyOrZeroReturnVacant!0 (x!141650 lt!674211) (index!56872 lt!674211) (index!56872 lt!674211) k0!754 _keys!600 mask!889))))

(declare-fun b!1572973 () Bool)

(declare-fun res!1074785 () Bool)

(declare-fun e!877153 () Bool)

(assert (=> b!1572973 (=> (not res!1074785) (not e!877153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572973 (= res!1074785 (validKeyInArray!0 k0!754))))

(declare-fun b!1572972 () Bool)

(declare-fun res!1074783 () Bool)

(assert (=> b!1572972 (=> (not res!1074783) (not e!877153))))

(assert (=> b!1572972 (= res!1074783 (= (size!51255 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572974 () Bool)

(assert (=> b!1572974 (= e!877153 e!877154)))

(declare-fun res!1074786 () Bool)

(assert (=> b!1572974 (=> (not res!1074786) (not e!877154))))

(assert (=> b!1572974 (= res!1074786 (and (not (undefined!14430 lt!674211)) ((_ is Intermediate!13618) lt!674211) (not (= (select (arr!50705 _keys!600) (index!56872 lt!674211)) k0!754)) (not (= (select (arr!50705 _keys!600) (index!56872 lt!674211)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50705 _keys!600) (index!56872 lt!674211)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56872 lt!674211) #b00000000000000000000000000000000) (bvslt (index!56872 lt!674211) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105089 (_ BitVec 32)) SeekEntryResult!13618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572974 (= lt!674211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun res!1074784 () Bool)

(assert (=> start!135154 (=> (not res!1074784) (not e!877153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135154 (= res!1074784 (validMask!0 mask!889))))

(assert (=> start!135154 e!877153))

(assert (=> start!135154 true))

(declare-fun array_inv!39432 (array!105089) Bool)

(assert (=> start!135154 (array_inv!39432 _keys!600)))

(assert (= (and start!135154 res!1074784) b!1572972))

(assert (= (and b!1572972 res!1074783) b!1572973))

(assert (= (and b!1572973 res!1074785) b!1572974))

(assert (= (and b!1572974 res!1074786) b!1572975))

(declare-fun m!1446621 () Bool)

(assert (=> b!1572975 m!1446621))

(declare-fun m!1446623 () Bool)

(assert (=> b!1572973 m!1446623))

(declare-fun m!1446625 () Bool)

(assert (=> b!1572974 m!1446625))

(declare-fun m!1446627 () Bool)

(assert (=> b!1572974 m!1446627))

(assert (=> b!1572974 m!1446627))

(declare-fun m!1446629 () Bool)

(assert (=> b!1572974 m!1446629))

(declare-fun m!1446631 () Bool)

(assert (=> start!135154 m!1446631))

(declare-fun m!1446633 () Bool)

(assert (=> start!135154 m!1446633))

(check-sat (not b!1572975) (not b!1572973) (not start!135154) (not b!1572974))
(check-sat)
(get-model)

(declare-fun b!1573000 () Bool)

(declare-fun e!877172 () SeekEntryResult!13618)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573000 (= e!877172 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141650 lt!674211) #b00000000000000000000000000000001) (nextIndex!0 (index!56872 lt!674211) (x!141650 lt!674211) mask!889) (index!56872 lt!674211) k0!754 _keys!600 mask!889))))

(declare-fun b!1573002 () Bool)

(declare-fun e!877171 () SeekEntryResult!13618)

(assert (=> b!1573002 (= e!877171 (Found!13618 (index!56872 lt!674211)))))

(declare-fun b!1573003 () Bool)

(declare-fun c!145350 () Bool)

(declare-fun lt!674223 () (_ BitVec 64))

(assert (=> b!1573003 (= c!145350 (= lt!674223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573003 (= e!877171 e!877172)))

(declare-fun b!1573004 () Bool)

(assert (=> b!1573004 (= e!877172 (MissingVacant!13618 (index!56872 lt!674211)))))

(declare-fun b!1573005 () Bool)

(declare-fun e!877170 () SeekEntryResult!13618)

(assert (=> b!1573005 (= e!877170 e!877171)))

(declare-fun c!145348 () Bool)

(assert (=> b!1573005 (= c!145348 (= lt!674223 k0!754))))

(declare-fun b!1573001 () Bool)

(assert (=> b!1573001 (= e!877170 Undefined!13618)))

(declare-fun d!164893 () Bool)

(declare-fun lt!674224 () SeekEntryResult!13618)

(assert (=> d!164893 (and (or ((_ is Undefined!13618) lt!674224) (not ((_ is Found!13618) lt!674224)) (and (bvsge (index!56871 lt!674224) #b00000000000000000000000000000000) (bvslt (index!56871 lt!674224) (size!51255 _keys!600)))) (or ((_ is Undefined!13618) lt!674224) ((_ is Found!13618) lt!674224) (not ((_ is MissingVacant!13618) lt!674224)) (not (= (index!56873 lt!674224) (index!56872 lt!674211))) (and (bvsge (index!56873 lt!674224) #b00000000000000000000000000000000) (bvslt (index!56873 lt!674224) (size!51255 _keys!600)))) (or ((_ is Undefined!13618) lt!674224) (ite ((_ is Found!13618) lt!674224) (= (select (arr!50705 _keys!600) (index!56871 lt!674224)) k0!754) (and ((_ is MissingVacant!13618) lt!674224) (= (index!56873 lt!674224) (index!56872 lt!674211)) (= (select (arr!50705 _keys!600) (index!56873 lt!674224)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!164893 (= lt!674224 e!877170)))

(declare-fun c!145349 () Bool)

(assert (=> d!164893 (= c!145349 (bvsge (x!141650 lt!674211) #b01111111111111111111111111111110))))

(assert (=> d!164893 (= lt!674223 (select (arr!50705 _keys!600) (index!56872 lt!674211)))))

(assert (=> d!164893 (validMask!0 mask!889)))

(assert (=> d!164893 (= (seekKeyOrZeroReturnVacant!0 (x!141650 lt!674211) (index!56872 lt!674211) (index!56872 lt!674211) k0!754 _keys!600 mask!889) lt!674224)))

(assert (= (and d!164893 c!145349) b!1573001))

(assert (= (and d!164893 (not c!145349)) b!1573005))

(assert (= (and b!1573005 c!145348) b!1573002))

(assert (= (and b!1573005 (not c!145348)) b!1573003))

(assert (= (and b!1573003 c!145350) b!1573004))

(assert (= (and b!1573003 (not c!145350)) b!1573000))

(declare-fun m!1446649 () Bool)

(assert (=> b!1573000 m!1446649))

(assert (=> b!1573000 m!1446649))

(declare-fun m!1446651 () Bool)

(assert (=> b!1573000 m!1446651))

(declare-fun m!1446653 () Bool)

(assert (=> d!164893 m!1446653))

(declare-fun m!1446655 () Bool)

(assert (=> d!164893 m!1446655))

(assert (=> d!164893 m!1446625))

(assert (=> d!164893 m!1446631))

(assert (=> b!1572975 d!164893))

(declare-fun d!164903 () Bool)

(assert (=> d!164903 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572973 d!164903))

(declare-fun d!164905 () Bool)

(assert (=> d!164905 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135154 d!164905))

(declare-fun d!164915 () Bool)

(assert (=> d!164915 (= (array_inv!39432 _keys!600) (bvsge (size!51255 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135154 d!164915))

(declare-fun b!1573096 () Bool)

(declare-fun e!877224 () Bool)

(declare-fun e!877225 () Bool)

(assert (=> b!1573096 (= e!877224 e!877225)))

(declare-fun res!1074827 () Bool)

(declare-fun lt!674260 () SeekEntryResult!13618)

(assert (=> b!1573096 (= res!1074827 (and ((_ is Intermediate!13618) lt!674260) (not (undefined!14430 lt!674260)) (bvslt (x!141650 lt!674260) #b01111111111111111111111111111110) (bvsge (x!141650 lt!674260) #b00000000000000000000000000000000) (bvsge (x!141650 lt!674260) #b00000000000000000000000000000000)))))

(assert (=> b!1573096 (=> (not res!1074827) (not e!877225))))

(declare-fun b!1573097 () Bool)

(assert (=> b!1573097 (and (bvsge (index!56872 lt!674260) #b00000000000000000000000000000000) (bvslt (index!56872 lt!674260) (size!51255 _keys!600)))))

(declare-fun res!1074825 () Bool)

(assert (=> b!1573097 (= res!1074825 (= (select (arr!50705 _keys!600) (index!56872 lt!674260)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877223 () Bool)

(assert (=> b!1573097 (=> res!1074825 e!877223)))

(declare-fun b!1573098 () Bool)

(assert (=> b!1573098 (and (bvsge (index!56872 lt!674260) #b00000000000000000000000000000000) (bvslt (index!56872 lt!674260) (size!51255 _keys!600)))))

(assert (=> b!1573098 (= e!877223 (= (select (arr!50705 _keys!600) (index!56872 lt!674260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573100 () Bool)

(declare-fun e!877222 () SeekEntryResult!13618)

(declare-fun e!877226 () SeekEntryResult!13618)

(assert (=> b!1573100 (= e!877222 e!877226)))

(declare-fun c!145386 () Bool)

(declare-fun lt!674259 () (_ BitVec 64))

(assert (=> b!1573100 (= c!145386 (or (= lt!674259 k0!754) (= (bvadd lt!674259 lt!674259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573101 () Bool)

(assert (=> b!1573101 (and (bvsge (index!56872 lt!674260) #b00000000000000000000000000000000) (bvslt (index!56872 lt!674260) (size!51255 _keys!600)))))

(declare-fun res!1074826 () Bool)

(assert (=> b!1573101 (= res!1074826 (= (select (arr!50705 _keys!600) (index!56872 lt!674260)) k0!754))))

(assert (=> b!1573101 (=> res!1074826 e!877223)))

(assert (=> b!1573101 (= e!877225 e!877223)))

(declare-fun b!1573102 () Bool)

(assert (=> b!1573102 (= e!877226 (Intermediate!13618 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573103 () Bool)

(assert (=> b!1573103 (= e!877224 (bvsge (x!141650 lt!674260) #b01111111111111111111111111111110))))

(declare-fun b!1573104 () Bool)

(assert (=> b!1573104 (= e!877222 (Intermediate!13618 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573099 () Bool)

(assert (=> b!1573099 (= e!877226 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun d!164917 () Bool)

(assert (=> d!164917 e!877224))

(declare-fun c!145385 () Bool)

(assert (=> d!164917 (= c!145385 (and ((_ is Intermediate!13618) lt!674260) (undefined!14430 lt!674260)))))

(assert (=> d!164917 (= lt!674260 e!877222)))

(declare-fun c!145384 () Bool)

(assert (=> d!164917 (= c!145384 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164917 (= lt!674259 (select (arr!50705 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164917 (validMask!0 mask!889)))

(assert (=> d!164917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674260)))

(assert (= (and d!164917 c!145384) b!1573104))

(assert (= (and d!164917 (not c!145384)) b!1573100))

(assert (= (and b!1573100 c!145386) b!1573102))

(assert (= (and b!1573100 (not c!145386)) b!1573099))

(assert (= (and d!164917 c!145385) b!1573103))

(assert (= (and d!164917 (not c!145385)) b!1573096))

(assert (= (and b!1573096 res!1074827) b!1573101))

(assert (= (and b!1573101 (not res!1074826)) b!1573097))

(assert (= (and b!1573097 (not res!1074825)) b!1573098))

(declare-fun m!1446681 () Bool)

(assert (=> b!1573101 m!1446681))

(assert (=> b!1573097 m!1446681))

(assert (=> b!1573098 m!1446681))

(assert (=> d!164917 m!1446627))

(declare-fun m!1446683 () Bool)

(assert (=> d!164917 m!1446683))

(assert (=> d!164917 m!1446631))

(assert (=> b!1573099 m!1446627))

(declare-fun m!1446685 () Bool)

(assert (=> b!1573099 m!1446685))

(assert (=> b!1573099 m!1446685))

(declare-fun m!1446687 () Bool)

(assert (=> b!1573099 m!1446687))

(assert (=> b!1572974 d!164917))

(declare-fun d!164927 () Bool)

(declare-fun lt!674266 () (_ BitVec 32))

(declare-fun lt!674265 () (_ BitVec 32))

(assert (=> d!164927 (= lt!674266 (bvmul (bvxor lt!674265 (bvlshr lt!674265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164927 (= lt!674265 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164927 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074828 (let ((h!38230 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141659 (bvmul (bvxor h!38230 (bvlshr h!38230 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141659 (bvlshr x!141659 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074828 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074828 #b00000000000000000000000000000000))))))

(assert (=> d!164927 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674266 (bvlshr lt!674266 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572974 d!164927))

(check-sat (not b!1573000) (not d!164917) (not b!1573099) (not d!164893))
(check-sat)
