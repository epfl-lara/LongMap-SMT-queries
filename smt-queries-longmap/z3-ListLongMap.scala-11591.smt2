; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135100 () Bool)

(assert start!135100)

(declare-fun res!1074615 () Bool)

(declare-fun e!877003 () Bool)

(assert (=> start!135100 (=> (not res!1074615) (not e!877003))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135100 (= res!1074615 (validMask!0 mask!889))))

(assert (=> start!135100 e!877003))

(assert (=> start!135100 true))

(declare-datatypes ((array!105062 0))(
  ( (array!105063 (arr!50693 (Array (_ BitVec 32) (_ BitVec 64))) (size!51243 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105062)

(declare-fun array_inv!39420 (array!105062) Bool)

(assert (=> start!135100 (array_inv!39420 _keys!600)))

(declare-fun b!1572751 () Bool)

(declare-fun res!1074613 () Bool)

(assert (=> b!1572751 (=> (not res!1074613) (not e!877003))))

(assert (=> b!1572751 (= res!1074613 (= (size!51243 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572752 () Bool)

(declare-fun res!1074614 () Bool)

(assert (=> b!1572752 (=> (not res!1074614) (not e!877003))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572752 (= res!1074614 (validKeyInArray!0 k0!754))))

(declare-fun b!1572753 () Bool)

(declare-datatypes ((SeekEntryResult!13606 0))(
  ( (MissingZero!13606 (index!56822 (_ BitVec 32))) (Found!13606 (index!56823 (_ BitVec 32))) (Intermediate!13606 (undefined!14418 Bool) (index!56824 (_ BitVec 32)) (x!141600 (_ BitVec 32))) (Undefined!13606) (MissingVacant!13606 (index!56825 (_ BitVec 32))) )
))
(declare-fun lt!674107 () SeekEntryResult!13606)

(get-info :version)

(assert (=> b!1572753 (= e!877003 (and ((_ is Intermediate!13606) lt!674107) (not (undefined!14418 lt!674107)) (not (= (select (arr!50693 _keys!600) (index!56824 lt!674107)) k0!754)) (not (= (select (arr!50693 _keys!600) (index!56824 lt!674107)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!56824 lt!674107) #b00000000000000000000000000000000) (bvsge (index!56824 lt!674107) (size!51243 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105062 (_ BitVec 32)) SeekEntryResult!13606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572753 (= lt!674107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135100 res!1074615) b!1572751))

(assert (= (and b!1572751 res!1074613) b!1572752))

(assert (= (and b!1572752 res!1074614) b!1572753))

(declare-fun m!1446433 () Bool)

(assert (=> start!135100 m!1446433))

(declare-fun m!1446435 () Bool)

(assert (=> start!135100 m!1446435))

(declare-fun m!1446437 () Bool)

(assert (=> b!1572752 m!1446437))

(declare-fun m!1446439 () Bool)

(assert (=> b!1572753 m!1446439))

(declare-fun m!1446441 () Bool)

(assert (=> b!1572753 m!1446441))

(assert (=> b!1572753 m!1446441))

(declare-fun m!1446443 () Bool)

(assert (=> b!1572753 m!1446443))

(check-sat (not start!135100) (not b!1572752) (not b!1572753))
(check-sat)
(get-model)

(declare-fun d!164855 () Bool)

(assert (=> d!164855 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135100 d!164855))

(declare-fun d!164865 () Bool)

(assert (=> d!164865 (= (array_inv!39420 _keys!600) (bvsge (size!51243 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135100 d!164865))

(declare-fun d!164867 () Bool)

(assert (=> d!164867 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572752 d!164867))

(declare-fun b!1572835 () Bool)

(declare-fun lt!674132 () SeekEntryResult!13606)

(assert (=> b!1572835 (and (bvsge (index!56824 lt!674132) #b00000000000000000000000000000000) (bvslt (index!56824 lt!674132) (size!51243 _keys!600)))))

(declare-fun res!1074652 () Bool)

(assert (=> b!1572835 (= res!1074652 (= (select (arr!50693 _keys!600) (index!56824 lt!674132)) k0!754))))

(declare-fun e!877052 () Bool)

(assert (=> b!1572835 (=> res!1074652 e!877052)))

(declare-fun e!877054 () Bool)

(assert (=> b!1572835 (= e!877054 e!877052)))

(declare-fun b!1572837 () Bool)

(declare-fun e!877053 () Bool)

(assert (=> b!1572837 (= e!877053 e!877054)))

(declare-fun res!1074653 () Bool)

(assert (=> b!1572837 (= res!1074653 (and ((_ is Intermediate!13606) lt!674132) (not (undefined!14418 lt!674132)) (bvslt (x!141600 lt!674132) #b01111111111111111111111111111110) (bvsge (x!141600 lt!674132) #b00000000000000000000000000000000) (bvsge (x!141600 lt!674132) #b00000000000000000000000000000000)))))

(assert (=> b!1572837 (=> (not res!1074653) (not e!877054))))

(declare-fun b!1572838 () Bool)

(declare-fun e!877051 () SeekEntryResult!13606)

(assert (=> b!1572838 (= e!877051 (Intermediate!13606 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572839 () Bool)

(assert (=> b!1572839 (= e!877053 (bvsge (x!141600 lt!674132) #b01111111111111111111111111111110))))

(declare-fun b!1572840 () Bool)

(declare-fun e!877055 () SeekEntryResult!13606)

(assert (=> b!1572840 (= e!877055 e!877051)))

(declare-fun c!145341 () Bool)

(declare-fun lt!674131 () (_ BitVec 64))

(assert (=> b!1572840 (= c!145341 (or (= lt!674131 k0!754) (= (bvadd lt!674131 lt!674131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572841 () Bool)

(assert (=> b!1572841 (and (bvsge (index!56824 lt!674132) #b00000000000000000000000000000000) (bvslt (index!56824 lt!674132) (size!51243 _keys!600)))))

(assert (=> b!1572841 (= e!877052 (= (select (arr!50693 _keys!600) (index!56824 lt!674132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572842 () Bool)

(assert (=> b!1572842 (= e!877055 (Intermediate!13606 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572843 () Bool)

(assert (=> b!1572843 (and (bvsge (index!56824 lt!674132) #b00000000000000000000000000000000) (bvslt (index!56824 lt!674132) (size!51243 _keys!600)))))

(declare-fun res!1074651 () Bool)

(assert (=> b!1572843 (= res!1074651 (= (select (arr!50693 _keys!600) (index!56824 lt!674132)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572843 (=> res!1074651 e!877052)))

(declare-fun d!164869 () Bool)

(assert (=> d!164869 e!877053))

(declare-fun c!145339 () Bool)

(assert (=> d!164869 (= c!145339 (and ((_ is Intermediate!13606) lt!674132) (undefined!14418 lt!674132)))))

(assert (=> d!164869 (= lt!674132 e!877055)))

(declare-fun c!145340 () Bool)

(assert (=> d!164869 (= c!145340 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164869 (= lt!674131 (select (arr!50693 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164869 (validMask!0 mask!889)))

(assert (=> d!164869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674132)))

(declare-fun b!1572836 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572836 (= e!877051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and d!164869 c!145340) b!1572842))

(assert (= (and d!164869 (not c!145340)) b!1572840))

(assert (= (and b!1572840 c!145341) b!1572838))

(assert (= (and b!1572840 (not c!145341)) b!1572836))

(assert (= (and d!164869 c!145339) b!1572839))

(assert (= (and d!164869 (not c!145339)) b!1572837))

(assert (= (and b!1572837 res!1074653) b!1572835))

(assert (= (and b!1572835 (not res!1074652)) b!1572843))

(assert (= (and b!1572843 (not res!1074651)) b!1572841))

(declare-fun m!1446473 () Bool)

(assert (=> b!1572843 m!1446473))

(assert (=> b!1572835 m!1446473))

(assert (=> b!1572841 m!1446473))

(assert (=> d!164869 m!1446441))

(declare-fun m!1446475 () Bool)

(assert (=> d!164869 m!1446475))

(assert (=> d!164869 m!1446433))

(assert (=> b!1572836 m!1446441))

(declare-fun m!1446477 () Bool)

(assert (=> b!1572836 m!1446477))

(assert (=> b!1572836 m!1446477))

(declare-fun m!1446479 () Bool)

(assert (=> b!1572836 m!1446479))

(assert (=> b!1572753 d!164869))

(declare-fun d!164877 () Bool)

(declare-fun lt!674146 () (_ BitVec 32))

(declare-fun lt!674145 () (_ BitVec 32))

(assert (=> d!164877 (= lt!674146 (bvmul (bvxor lt!674145 (bvlshr lt!674145 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164877 (= lt!674145 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164877 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074654 (let ((h!38227 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141607 (bvmul (bvxor h!38227 (bvlshr h!38227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141607 (bvlshr x!141607 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074654 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074654 #b00000000000000000000000000000000))))))

(assert (=> d!164877 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674146 (bvlshr lt!674146 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572753 d!164877))

(check-sat (not d!164869) (not b!1572836))
(check-sat)
