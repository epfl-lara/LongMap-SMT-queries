; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134908 () Bool)

(assert start!134908)

(declare-fun res!1074169 () Bool)

(declare-fun e!876608 () Bool)

(assert (=> start!134908 (=> (not res!1074169) (not e!876608))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134908 (= res!1074169 (validMask!0 mask!889))))

(assert (=> start!134908 e!876608))

(assert (=> start!134908 true))

(declare-datatypes ((array!104978 0))(
  ( (array!104979 (arr!50657 (Array (_ BitVec 32) (_ BitVec 64))) (size!51207 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104978)

(declare-fun array_inv!39384 (array!104978) Bool)

(assert (=> start!134908 (array_inv!39384 _keys!600)))

(declare-fun b!1572103 () Bool)

(declare-fun res!1074170 () Bool)

(assert (=> b!1572103 (=> (not res!1074170) (not e!876608))))

(assert (=> b!1572103 (= res!1074170 (= (size!51207 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572104 () Bool)

(declare-fun res!1074171 () Bool)

(assert (=> b!1572104 (=> (not res!1074171) (not e!876608))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572104 (= res!1074171 (validKeyInArray!0 k0!754))))

(declare-fun b!1572105 () Bool)

(declare-datatypes ((SeekEntryResult!13570 0))(
  ( (MissingZero!13570 (index!56678 (_ BitVec 32))) (Found!13570 (index!56679 (_ BitVec 32))) (Intermediate!13570 (undefined!14382 Bool) (index!56680 (_ BitVec 32)) (x!141444 (_ BitVec 32))) (Undefined!13570) (MissingVacant!13570 (index!56681 (_ BitVec 32))) )
))
(declare-fun lt!673855 () SeekEntryResult!13570)

(get-info :version)

(assert (=> b!1572105 (= e!876608 (and ((_ is Intermediate!13570) lt!673855) (not (undefined!14382 lt!673855)) (not (= (select (arr!50657 _keys!600) (index!56680 lt!673855)) k0!754)) (not (= (select (arr!50657 _keys!600) (index!56680 lt!673855)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50657 _keys!600) (index!56680 lt!673855)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104978 (_ BitVec 32)) SeekEntryResult!13570)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572105 (= lt!673855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134908 res!1074169) b!1572103))

(assert (= (and b!1572103 res!1074170) b!1572104))

(assert (= (and b!1572104 res!1074171) b!1572105))

(declare-fun m!1445959 () Bool)

(assert (=> start!134908 m!1445959))

(declare-fun m!1445961 () Bool)

(assert (=> start!134908 m!1445961))

(declare-fun m!1445963 () Bool)

(assert (=> b!1572104 m!1445963))

(declare-fun m!1445965 () Bool)

(assert (=> b!1572105 m!1445965))

(declare-fun m!1445967 () Bool)

(assert (=> b!1572105 m!1445967))

(assert (=> b!1572105 m!1445967))

(declare-fun m!1445969 () Bool)

(assert (=> b!1572105 m!1445969))

(check-sat (not b!1572105) (not start!134908) (not b!1572104))
(check-sat)
(get-model)

(declare-fun b!1572160 () Bool)

(declare-fun e!876641 () SeekEntryResult!13570)

(assert (=> b!1572160 (= e!876641 (Intermediate!13570 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572161 () Bool)

(declare-fun lt!673869 () SeekEntryResult!13570)

(assert (=> b!1572161 (and (bvsge (index!56680 lt!673869) #b00000000000000000000000000000000) (bvslt (index!56680 lt!673869) (size!51207 _keys!600)))))

(declare-fun e!876643 () Bool)

(assert (=> b!1572161 (= e!876643 (= (select (arr!50657 _keys!600) (index!56680 lt!673869)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572162 () Bool)

(assert (=> b!1572162 (and (bvsge (index!56680 lt!673869) #b00000000000000000000000000000000) (bvslt (index!56680 lt!673869) (size!51207 _keys!600)))))

(declare-fun res!1074198 () Bool)

(assert (=> b!1572162 (= res!1074198 (= (select (arr!50657 _keys!600) (index!56680 lt!673869)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572162 (=> res!1074198 e!876643)))

(declare-fun e!876644 () SeekEntryResult!13570)

(declare-fun b!1572163 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572163 (= e!876644 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572164 () Bool)

(assert (=> b!1572164 (= e!876641 e!876644)))

(declare-fun c!145224 () Bool)

(declare-fun lt!673870 () (_ BitVec 64))

(assert (=> b!1572164 (= c!145224 (or (= lt!673870 k0!754) (= (bvadd lt!673870 lt!673870) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572165 () Bool)

(declare-fun e!876640 () Bool)

(assert (=> b!1572165 (= e!876640 (bvsge (x!141444 lt!673869) #b01111111111111111111111111111110))))

(declare-fun d!164713 () Bool)

(assert (=> d!164713 e!876640))

(declare-fun c!145222 () Bool)

(assert (=> d!164713 (= c!145222 (and ((_ is Intermediate!13570) lt!673869) (undefined!14382 lt!673869)))))

(assert (=> d!164713 (= lt!673869 e!876641)))

(declare-fun c!145223 () Bool)

(assert (=> d!164713 (= c!145223 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164713 (= lt!673870 (select (arr!50657 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164713 (validMask!0 mask!889)))

(assert (=> d!164713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673869)))

(declare-fun b!1572166 () Bool)

(declare-fun e!876642 () Bool)

(assert (=> b!1572166 (= e!876640 e!876642)))

(declare-fun res!1074197 () Bool)

(assert (=> b!1572166 (= res!1074197 (and ((_ is Intermediate!13570) lt!673869) (not (undefined!14382 lt!673869)) (bvslt (x!141444 lt!673869) #b01111111111111111111111111111110) (bvsge (x!141444 lt!673869) #b00000000000000000000000000000000) (bvsge (x!141444 lt!673869) #b00000000000000000000000000000000)))))

(assert (=> b!1572166 (=> (not res!1074197) (not e!876642))))

(declare-fun b!1572167 () Bool)

(assert (=> b!1572167 (and (bvsge (index!56680 lt!673869) #b00000000000000000000000000000000) (bvslt (index!56680 lt!673869) (size!51207 _keys!600)))))

(declare-fun res!1074196 () Bool)

(assert (=> b!1572167 (= res!1074196 (= (select (arr!50657 _keys!600) (index!56680 lt!673869)) k0!754))))

(assert (=> b!1572167 (=> res!1074196 e!876643)))

(assert (=> b!1572167 (= e!876642 e!876643)))

(declare-fun b!1572168 () Bool)

(assert (=> b!1572168 (= e!876644 (Intermediate!13570 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164713 c!145223) b!1572160))

(assert (= (and d!164713 (not c!145223)) b!1572164))

(assert (= (and b!1572164 c!145224) b!1572168))

(assert (= (and b!1572164 (not c!145224)) b!1572163))

(assert (= (and d!164713 c!145222) b!1572165))

(assert (= (and d!164713 (not c!145222)) b!1572166))

(assert (= (and b!1572166 res!1074197) b!1572167))

(assert (= (and b!1572167 (not res!1074196)) b!1572162))

(assert (= (and b!1572162 (not res!1074198)) b!1572161))

(declare-fun m!1445987 () Bool)

(assert (=> b!1572161 m!1445987))

(assert (=> b!1572163 m!1445967))

(declare-fun m!1445989 () Bool)

(assert (=> b!1572163 m!1445989))

(assert (=> b!1572163 m!1445989))

(declare-fun m!1445993 () Bool)

(assert (=> b!1572163 m!1445993))

(assert (=> b!1572162 m!1445987))

(assert (=> d!164713 m!1445967))

(declare-fun m!1445997 () Bool)

(assert (=> d!164713 m!1445997))

(assert (=> d!164713 m!1445959))

(assert (=> b!1572167 m!1445987))

(assert (=> b!1572105 d!164713))

(declare-fun d!164719 () Bool)

(declare-fun lt!673886 () (_ BitVec 32))

(declare-fun lt!673885 () (_ BitVec 32))

(assert (=> d!164719 (= lt!673886 (bvmul (bvxor lt!673885 (bvlshr lt!673885 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164719 (= lt!673885 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164719 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074200 (let ((h!38214 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141450 (bvmul (bvxor h!38214 (bvlshr h!38214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141450 (bvlshr x!141450 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074200 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074200 #b00000000000000000000000000000000))))))

(assert (=> d!164719 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673886 (bvlshr lt!673886 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572105 d!164719))

(declare-fun d!164723 () Bool)

(assert (=> d!164723 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134908 d!164723))

(declare-fun d!164731 () Bool)

(assert (=> d!164731 (= (array_inv!39384 _keys!600) (bvsge (size!51207 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134908 d!164731))

(declare-fun d!164735 () Bool)

(assert (=> d!164735 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572104 d!164735))

(check-sat (not d!164713) (not b!1572163))
