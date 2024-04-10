; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134854 () Bool)

(assert start!134854)

(declare-fun res!1074031 () Bool)

(declare-fun e!876490 () Bool)

(assert (=> start!134854 (=> (not res!1074031) (not e!876490))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134854 (= res!1074031 (validMask!0 mask!889))))

(assert (=> start!134854 e!876490))

(assert (=> start!134854 true))

(declare-datatypes ((array!104951 0))(
  ( (array!104952 (arr!50645 (Array (_ BitVec 32) (_ BitVec 64))) (size!51195 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104951)

(declare-fun array_inv!39372 (array!104951) Bool)

(assert (=> start!134854 (array_inv!39372 _keys!600)))

(declare-fun b!1571914 () Bool)

(declare-fun res!1074032 () Bool)

(assert (=> b!1571914 (=> (not res!1074032) (not e!876490))))

(assert (=> b!1571914 (= res!1074032 (= (size!51195 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571915 () Bool)

(declare-fun res!1074033 () Bool)

(assert (=> b!1571915 (=> (not res!1074033) (not e!876490))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571915 (= res!1074033 (validKeyInArray!0 k0!754))))

(declare-fun b!1571916 () Bool)

(declare-datatypes ((SeekEntryResult!13558 0))(
  ( (MissingZero!13558 (index!56630 (_ BitVec 32))) (Found!13558 (index!56631 (_ BitVec 32))) (Intermediate!13558 (undefined!14370 Bool) (index!56632 (_ BitVec 32)) (x!141394 (_ BitVec 32))) (Undefined!13558) (MissingVacant!13558 (index!56633 (_ BitVec 32))) )
))
(declare-fun lt!673783 () SeekEntryResult!13558)

(get-info :version)

(assert (=> b!1571916 (= e!876490 (and ((_ is Intermediate!13558) lt!673783) (not (undefined!14370 lt!673783)) (not (= (select (arr!50645 _keys!600) (index!56632 lt!673783)) k0!754)) (not (= (select (arr!50645 _keys!600) (index!56632 lt!673783)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50645 _keys!600) (index!56632 lt!673783)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56632 lt!673783) #b00000000000000000000000000000000) (bvslt (index!56632 lt!673783) (bvadd #b00000000000000000000000000000001 mask!889)) (bvsge mask!889 #b00000000000000000000000000000000) (or (bvsgt (x!141394 lt!673783) #b01111111111111111111111111111110) (bvslt (x!141394 lt!673783) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104951 (_ BitVec 32)) SeekEntryResult!13558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571916 (= lt!673783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134854 res!1074031) b!1571914))

(assert (= (and b!1571914 res!1074032) b!1571915))

(assert (= (and b!1571915 res!1074033) b!1571916))

(declare-fun m!1445809 () Bool)

(assert (=> start!134854 m!1445809))

(declare-fun m!1445811 () Bool)

(assert (=> start!134854 m!1445811))

(declare-fun m!1445813 () Bool)

(assert (=> b!1571915 m!1445813))

(declare-fun m!1445815 () Bool)

(assert (=> b!1571916 m!1445815))

(declare-fun m!1445817 () Bool)

(assert (=> b!1571916 m!1445817))

(assert (=> b!1571916 m!1445817))

(declare-fun m!1445819 () Bool)

(assert (=> b!1571916 m!1445819))

(check-sat (not b!1571915) (not b!1571916) (not start!134854))
(check-sat)
(get-model)

(declare-fun d!164673 () Bool)

(assert (=> d!164673 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571915 d!164673))

(declare-fun e!876510 () SeekEntryResult!13558)

(declare-fun b!1571944 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571944 (= e!876510 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1571945 () Bool)

(assert (=> b!1571945 (= e!876510 (Intermediate!13558 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571946 () Bool)

(declare-fun lt!673791 () SeekEntryResult!13558)

(assert (=> b!1571946 (and (bvsge (index!56632 lt!673791) #b00000000000000000000000000000000) (bvslt (index!56632 lt!673791) (size!51195 _keys!600)))))

(declare-fun res!1074051 () Bool)

(assert (=> b!1571946 (= res!1074051 (= (select (arr!50645 _keys!600) (index!56632 lt!673791)) k0!754))))

(declare-fun e!876508 () Bool)

(assert (=> b!1571946 (=> res!1074051 e!876508)))

(declare-fun e!876511 () Bool)

(assert (=> b!1571946 (= e!876511 e!876508)))

(declare-fun b!1571947 () Bool)

(declare-fun e!876512 () Bool)

(assert (=> b!1571947 (= e!876512 (bvsge (x!141394 lt!673791) #b01111111111111111111111111111110))))

(declare-fun b!1571948 () Bool)

(declare-fun e!876509 () SeekEntryResult!13558)

(assert (=> b!1571948 (= e!876509 (Intermediate!13558 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571949 () Bool)

(assert (=> b!1571949 (and (bvsge (index!56632 lt!673791) #b00000000000000000000000000000000) (bvslt (index!56632 lt!673791) (size!51195 _keys!600)))))

(declare-fun res!1074049 () Bool)

(assert (=> b!1571949 (= res!1074049 (= (select (arr!50645 _keys!600) (index!56632 lt!673791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571949 (=> res!1074049 e!876508)))

(declare-fun d!164675 () Bool)

(assert (=> d!164675 e!876512))

(declare-fun c!145186 () Bool)

(assert (=> d!164675 (= c!145186 (and ((_ is Intermediate!13558) lt!673791) (undefined!14370 lt!673791)))))

(assert (=> d!164675 (= lt!673791 e!876509)))

(declare-fun c!145188 () Bool)

(assert (=> d!164675 (= c!145188 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!673792 () (_ BitVec 64))

(assert (=> d!164675 (= lt!673792 (select (arr!50645 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164675 (validMask!0 mask!889)))

(assert (=> d!164675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673791)))

(declare-fun b!1571950 () Bool)

(assert (=> b!1571950 (= e!876512 e!876511)))

(declare-fun res!1074050 () Bool)

(assert (=> b!1571950 (= res!1074050 (and ((_ is Intermediate!13558) lt!673791) (not (undefined!14370 lt!673791)) (bvslt (x!141394 lt!673791) #b01111111111111111111111111111110) (bvsge (x!141394 lt!673791) #b00000000000000000000000000000000) (bvsge (x!141394 lt!673791) #b00000000000000000000000000000000)))))

(assert (=> b!1571950 (=> (not res!1074050) (not e!876511))))

(declare-fun b!1571951 () Bool)

(assert (=> b!1571951 (and (bvsge (index!56632 lt!673791) #b00000000000000000000000000000000) (bvslt (index!56632 lt!673791) (size!51195 _keys!600)))))

(assert (=> b!1571951 (= e!876508 (= (select (arr!50645 _keys!600) (index!56632 lt!673791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1571952 () Bool)

(assert (=> b!1571952 (= e!876509 e!876510)))

(declare-fun c!145187 () Bool)

(assert (=> b!1571952 (= c!145187 (or (= lt!673792 k0!754) (= (bvadd lt!673792 lt!673792) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164675 c!145188) b!1571948))

(assert (= (and d!164675 (not c!145188)) b!1571952))

(assert (= (and b!1571952 c!145187) b!1571945))

(assert (= (and b!1571952 (not c!145187)) b!1571944))

(assert (= (and d!164675 c!145186) b!1571947))

(assert (= (and d!164675 (not c!145186)) b!1571950))

(assert (= (and b!1571950 res!1074050) b!1571946))

(assert (= (and b!1571946 (not res!1074051)) b!1571949))

(assert (= (and b!1571949 (not res!1074049)) b!1571951))

(declare-fun m!1445833 () Bool)

(assert (=> b!1571951 m!1445833))

(assert (=> d!164675 m!1445817))

(declare-fun m!1445835 () Bool)

(assert (=> d!164675 m!1445835))

(assert (=> d!164675 m!1445809))

(assert (=> b!1571946 m!1445833))

(assert (=> b!1571949 m!1445833))

(assert (=> b!1571944 m!1445817))

(declare-fun m!1445837 () Bool)

(assert (=> b!1571944 m!1445837))

(assert (=> b!1571944 m!1445837))

(declare-fun m!1445839 () Bool)

(assert (=> b!1571944 m!1445839))

(assert (=> b!1571916 d!164675))

(declare-fun d!164685 () Bool)

(declare-fun lt!673802 () (_ BitVec 32))

(declare-fun lt!673801 () (_ BitVec 32))

(assert (=> d!164685 (= lt!673802 (bvmul (bvxor lt!673801 (bvlshr lt!673801 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164685 (= lt!673801 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164685 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074052 (let ((h!38210 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141398 (bvmul (bvxor h!38210 (bvlshr h!38210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141398 (bvlshr x!141398 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074052 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074052 #b00000000000000000000000000000000))))))

(assert (=> d!164685 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673802 (bvlshr lt!673802 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571916 d!164685))

(declare-fun d!164687 () Bool)

(assert (=> d!164687 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134854 d!164687))

(declare-fun d!164693 () Bool)

(assert (=> d!164693 (= (array_inv!39372 _keys!600) (bvsge (size!51195 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134854 d!164693))

(check-sat (not b!1571944) (not d!164675))
(check-sat)
