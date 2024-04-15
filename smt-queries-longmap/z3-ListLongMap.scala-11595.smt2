; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135102 () Bool)

(assert start!135102)

(declare-fun res!1074642 () Bool)

(declare-fun e!876946 () Bool)

(assert (=> start!135102 (=> (not res!1074642) (not e!876946))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135102 (= res!1074642 (validMask!0 mask!889))))

(assert (=> start!135102 e!876946))

(assert (=> start!135102 true))

(declare-datatypes ((array!105015 0))(
  ( (array!105016 (arr!50669 (Array (_ BitVec 32) (_ BitVec 64))) (size!51221 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105015)

(declare-fun array_inv!39605 (array!105015) Bool)

(assert (=> start!135102 (array_inv!39605 _keys!600)))

(declare-fun b!1572649 () Bool)

(declare-fun e!876945 () Bool)

(assert (=> b!1572649 (= e!876946 e!876945)))

(declare-fun res!1074644 () Bool)

(assert (=> b!1572649 (=> (not res!1074644) (not e!876945))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13617 0))(
  ( (MissingZero!13617 (index!56866 (_ BitVec 32))) (Found!13617 (index!56867 (_ BitVec 32))) (Intermediate!13617 (undefined!14429 Bool) (index!56868 (_ BitVec 32)) (x!141644 (_ BitVec 32))) (Undefined!13617) (MissingVacant!13617 (index!56869 (_ BitVec 32))) )
))
(declare-fun lt!673920 () SeekEntryResult!13617)

(get-info :version)

(assert (=> b!1572649 (= res!1074644 (and (not (undefined!14429 lt!673920)) ((_ is Intermediate!13617) lt!673920) (not (= (select (arr!50669 _keys!600) (index!56868 lt!673920)) k0!754)) (not (= (select (arr!50669 _keys!600) (index!56868 lt!673920)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50669 _keys!600) (index!56868 lt!673920)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56868 lt!673920) #b00000000000000000000000000000000) (bvslt (index!56868 lt!673920) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105015 (_ BitVec 32)) SeekEntryResult!13617)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572649 (= lt!673920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572648 () Bool)

(declare-fun res!1074645 () Bool)

(assert (=> b!1572648 (=> (not res!1074645) (not e!876946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572648 (= res!1074645 (validKeyInArray!0 k0!754))))

(declare-fun b!1572647 () Bool)

(declare-fun res!1074643 () Bool)

(assert (=> b!1572647 (=> (not res!1074643) (not e!876946))))

(assert (=> b!1572647 (= res!1074643 (= (size!51221 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572650 () Bool)

(declare-fun lt!673919 () SeekEntryResult!13617)

(assert (=> b!1572650 (= e!876945 (and (not ((_ is MissingVacant!13617) lt!673919)) ((_ is Found!13617) lt!673919) (or (bvslt (index!56867 lt!673919) #b00000000000000000000000000000000) (bvsge (index!56867 lt!673919) (size!51221 _keys!600)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105015 (_ BitVec 32)) SeekEntryResult!13617)

(assert (=> b!1572650 (= lt!673919 (seekKeyOrZeroReturnVacant!0 (x!141644 lt!673920) (index!56868 lt!673920) (index!56868 lt!673920) k0!754 _keys!600 mask!889))))

(assert (= (and start!135102 res!1074642) b!1572647))

(assert (= (and b!1572647 res!1074643) b!1572648))

(assert (= (and b!1572648 res!1074645) b!1572649))

(assert (= (and b!1572649 res!1074644) b!1572650))

(declare-fun m!1445715 () Bool)

(assert (=> start!135102 m!1445715))

(declare-fun m!1445717 () Bool)

(assert (=> start!135102 m!1445717))

(declare-fun m!1445719 () Bool)

(assert (=> b!1572649 m!1445719))

(declare-fun m!1445721 () Bool)

(assert (=> b!1572649 m!1445721))

(assert (=> b!1572649 m!1445721))

(declare-fun m!1445723 () Bool)

(assert (=> b!1572649 m!1445723))

(declare-fun m!1445725 () Bool)

(assert (=> b!1572648 m!1445725))

(declare-fun m!1445727 () Bool)

(assert (=> b!1572650 m!1445727))

(check-sat (not b!1572650) (not start!135102) (not b!1572648) (not b!1572649))
(check-sat)
(get-model)

(declare-fun e!876974 () SeekEntryResult!13617)

(declare-fun b!1572688 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572688 (= e!876974 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141644 lt!673920) #b00000000000000000000000000000001) (nextIndex!0 (index!56868 lt!673920) (x!141644 lt!673920) mask!889) (index!56868 lt!673920) k0!754 _keys!600 mask!889))))

(declare-fun b!1572689 () Bool)

(declare-fun c!145260 () Bool)

(declare-fun lt!673938 () (_ BitVec 64))

(assert (=> b!1572689 (= c!145260 (= lt!673938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876972 () SeekEntryResult!13617)

(assert (=> b!1572689 (= e!876972 e!876974)))

(declare-fun b!1572690 () Bool)

(assert (=> b!1572690 (= e!876972 (Found!13617 (index!56868 lt!673920)))))

(declare-fun d!164639 () Bool)

(declare-fun lt!673937 () SeekEntryResult!13617)

(assert (=> d!164639 (and (or ((_ is Undefined!13617) lt!673937) (not ((_ is Found!13617) lt!673937)) (and (bvsge (index!56867 lt!673937) #b00000000000000000000000000000000) (bvslt (index!56867 lt!673937) (size!51221 _keys!600)))) (or ((_ is Undefined!13617) lt!673937) ((_ is Found!13617) lt!673937) (not ((_ is MissingVacant!13617) lt!673937)) (not (= (index!56869 lt!673937) (index!56868 lt!673920))) (and (bvsge (index!56869 lt!673937) #b00000000000000000000000000000000) (bvslt (index!56869 lt!673937) (size!51221 _keys!600)))) (or ((_ is Undefined!13617) lt!673937) (ite ((_ is Found!13617) lt!673937) (= (select (arr!50669 _keys!600) (index!56867 lt!673937)) k0!754) (and ((_ is MissingVacant!13617) lt!673937) (= (index!56869 lt!673937) (index!56868 lt!673920)) (= (select (arr!50669 _keys!600) (index!56869 lt!673937)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!876973 () SeekEntryResult!13617)

(assert (=> d!164639 (= lt!673937 e!876973)))

(declare-fun c!145261 () Bool)

(assert (=> d!164639 (= c!145261 (bvsge (x!141644 lt!673920) #b01111111111111111111111111111110))))

(assert (=> d!164639 (= lt!673938 (select (arr!50669 _keys!600) (index!56868 lt!673920)))))

(assert (=> d!164639 (validMask!0 mask!889)))

(assert (=> d!164639 (= (seekKeyOrZeroReturnVacant!0 (x!141644 lt!673920) (index!56868 lt!673920) (index!56868 lt!673920) k0!754 _keys!600 mask!889) lt!673937)))

(declare-fun b!1572687 () Bool)

(assert (=> b!1572687 (= e!876973 e!876972)))

(declare-fun c!145259 () Bool)

(assert (=> b!1572687 (= c!145259 (= lt!673938 k0!754))))

(declare-fun b!1572691 () Bool)

(assert (=> b!1572691 (= e!876974 (MissingVacant!13617 (index!56868 lt!673920)))))

(declare-fun b!1572692 () Bool)

(assert (=> b!1572692 (= e!876973 Undefined!13617)))

(assert (= (and d!164639 c!145261) b!1572692))

(assert (= (and d!164639 (not c!145261)) b!1572687))

(assert (= (and b!1572687 c!145259) b!1572690))

(assert (= (and b!1572687 (not c!145259)) b!1572689))

(assert (= (and b!1572689 c!145260) b!1572691))

(assert (= (and b!1572689 (not c!145260)) b!1572688))

(declare-fun m!1445757 () Bool)

(assert (=> b!1572688 m!1445757))

(assert (=> b!1572688 m!1445757))

(declare-fun m!1445759 () Bool)

(assert (=> b!1572688 m!1445759))

(declare-fun m!1445761 () Bool)

(assert (=> d!164639 m!1445761))

(declare-fun m!1445763 () Bool)

(assert (=> d!164639 m!1445763))

(assert (=> d!164639 m!1445719))

(assert (=> d!164639 m!1445715))

(assert (=> b!1572650 d!164639))

(declare-fun d!164643 () Bool)

(assert (=> d!164643 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135102 d!164643))

(declare-fun d!164649 () Bool)

(assert (=> d!164649 (= (array_inv!39605 _keys!600) (bvsge (size!51221 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135102 d!164649))

(declare-fun d!164653 () Bool)

(assert (=> d!164653 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572648 d!164653))

(declare-fun b!1572757 () Bool)

(declare-fun e!877011 () Bool)

(declare-fun e!877008 () Bool)

(assert (=> b!1572757 (= e!877011 e!877008)))

(declare-fun res!1074684 () Bool)

(declare-fun lt!673957 () SeekEntryResult!13617)

(assert (=> b!1572757 (= res!1074684 (and ((_ is Intermediate!13617) lt!673957) (not (undefined!14429 lt!673957)) (bvslt (x!141644 lt!673957) #b01111111111111111111111111111110) (bvsge (x!141644 lt!673957) #b00000000000000000000000000000000) (bvsge (x!141644 lt!673957) #b00000000000000000000000000000000)))))

(assert (=> b!1572757 (=> (not res!1074684) (not e!877008))))

(declare-fun b!1572758 () Bool)

(assert (=> b!1572758 (= e!877011 (bvsge (x!141644 lt!673957) #b01111111111111111111111111111110))))

(declare-fun b!1572759 () Bool)

(declare-fun e!877012 () SeekEntryResult!13617)

(assert (=> b!1572759 (= e!877012 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572760 () Bool)

(assert (=> b!1572760 (and (bvsge (index!56868 lt!673957) #b00000000000000000000000000000000) (bvslt (index!56868 lt!673957) (size!51221 _keys!600)))))

(declare-fun res!1074682 () Bool)

(assert (=> b!1572760 (= res!1074682 (= (select (arr!50669 _keys!600) (index!56868 lt!673957)) k0!754))))

(declare-fun e!877010 () Bool)

(assert (=> b!1572760 (=> res!1074682 e!877010)))

(assert (=> b!1572760 (= e!877008 e!877010)))

(declare-fun b!1572761 () Bool)

(declare-fun e!877009 () SeekEntryResult!13617)

(assert (=> b!1572761 (= e!877009 (Intermediate!13617 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572762 () Bool)

(assert (=> b!1572762 (and (bvsge (index!56868 lt!673957) #b00000000000000000000000000000000) (bvslt (index!56868 lt!673957) (size!51221 _keys!600)))))

(assert (=> b!1572762 (= e!877010 (= (select (arr!50669 _keys!600) (index!56868 lt!673957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572763 () Bool)

(assert (=> b!1572763 (= e!877012 (Intermediate!13617 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572764 () Bool)

(assert (=> b!1572764 (= e!877009 e!877012)))

(declare-fun c!145289 () Bool)

(declare-fun lt!673958 () (_ BitVec 64))

(assert (=> b!1572764 (= c!145289 (or (= lt!673958 k0!754) (= (bvadd lt!673958 lt!673958) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164657 () Bool)

(assert (=> d!164657 e!877011))

(declare-fun c!145288 () Bool)

(assert (=> d!164657 (= c!145288 (and ((_ is Intermediate!13617) lt!673957) (undefined!14429 lt!673957)))))

(assert (=> d!164657 (= lt!673957 e!877009)))

(declare-fun c!145287 () Bool)

(assert (=> d!164657 (= c!145287 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164657 (= lt!673958 (select (arr!50669 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164657 (validMask!0 mask!889)))

(assert (=> d!164657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673957)))

(declare-fun b!1572765 () Bool)

(assert (=> b!1572765 (and (bvsge (index!56868 lt!673957) #b00000000000000000000000000000000) (bvslt (index!56868 lt!673957) (size!51221 _keys!600)))))

(declare-fun res!1074683 () Bool)

(assert (=> b!1572765 (= res!1074683 (= (select (arr!50669 _keys!600) (index!56868 lt!673957)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572765 (=> res!1074683 e!877010)))

(assert (= (and d!164657 c!145287) b!1572761))

(assert (= (and d!164657 (not c!145287)) b!1572764))

(assert (= (and b!1572764 c!145289) b!1572763))

(assert (= (and b!1572764 (not c!145289)) b!1572759))

(assert (= (and d!164657 c!145288) b!1572758))

(assert (= (and d!164657 (not c!145288)) b!1572757))

(assert (= (and b!1572757 res!1074684) b!1572760))

(assert (= (and b!1572760 (not res!1074682)) b!1572765))

(assert (= (and b!1572765 (not res!1074683)) b!1572762))

(assert (=> b!1572759 m!1445721))

(declare-fun m!1445773 () Bool)

(assert (=> b!1572759 m!1445773))

(assert (=> b!1572759 m!1445773))

(declare-fun m!1445775 () Bool)

(assert (=> b!1572759 m!1445775))

(declare-fun m!1445777 () Bool)

(assert (=> b!1572760 m!1445777))

(assert (=> b!1572765 m!1445777))

(assert (=> b!1572762 m!1445777))

(assert (=> d!164657 m!1445721))

(declare-fun m!1445779 () Bool)

(assert (=> d!164657 m!1445779))

(assert (=> d!164657 m!1445715))

(assert (=> b!1572649 d!164657))

(declare-fun d!164667 () Bool)

(declare-fun lt!673972 () (_ BitVec 32))

(declare-fun lt!673971 () (_ BitVec 32))

(assert (=> d!164667 (= lt!673972 (bvmul (bvxor lt!673971 (bvlshr lt!673971 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164667 (= lt!673971 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164667 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074694 (let ((h!38270 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141652 (bvmul (bvxor h!38270 (bvlshr h!38270 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141652 (bvlshr x!141652 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074694 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074694 #b00000000000000000000000000000000))))))

(assert (=> d!164667 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673972 (bvlshr lt!673972 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572649 d!164667))

(check-sat (not d!164639) (not b!1572759) (not d!164657) (not b!1572688))
(check-sat)
