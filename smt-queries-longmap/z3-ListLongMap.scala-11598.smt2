; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135278 () Bool)

(assert start!135278)

(declare-fun res!1074978 () Bool)

(declare-fun e!877444 () Bool)

(assert (=> start!135278 (=> (not res!1074978) (not e!877444))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135278 (= res!1074978 (validMask!0 mask!889))))

(assert (=> start!135278 e!877444))

(assert (=> start!135278 true))

(declare-datatypes ((array!105116 0))(
  ( (array!105117 (arr!50714 (Array (_ BitVec 32) (_ BitVec 64))) (size!51264 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105116)

(declare-fun array_inv!39441 (array!105116) Bool)

(assert (=> start!135278 (array_inv!39441 _keys!600)))

(declare-fun b!1573480 () Bool)

(declare-fun res!1074977 () Bool)

(assert (=> b!1573480 (=> (not res!1074977) (not e!877444))))

(assert (=> b!1573480 (= res!1074977 (= (size!51264 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573481 () Bool)

(declare-fun res!1074976 () Bool)

(assert (=> b!1573481 (=> (not res!1074976) (not e!877444))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573481 (= res!1074976 (validKeyInArray!0 k0!754))))

(declare-fun b!1573482 () Bool)

(declare-fun lt!674427 () Bool)

(declare-datatypes ((SeekEntryResult!13627 0))(
  ( (MissingZero!13627 (index!56906 (_ BitVec 32))) (Found!13627 (index!56907 (_ BitVec 32))) (Intermediate!13627 (undefined!14439 Bool) (index!56908 (_ BitVec 32)) (x!141710 (_ BitVec 32))) (Undefined!13627) (MissingVacant!13627 (index!56909 (_ BitVec 32))) )
))
(declare-fun lt!674428 () SeekEntryResult!13627)

(assert (=> b!1573482 (= e!877444 (and (or lt!674427 (not (undefined!14439 lt!674428))) (or lt!674427 (undefined!14439 lt!674428))))))

(get-info :version)

(assert (=> b!1573482 (= lt!674427 (not ((_ is Intermediate!13627) lt!674428)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105116 (_ BitVec 32)) SeekEntryResult!13627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573482 (= lt!674428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135278 res!1074978) b!1573480))

(assert (= (and b!1573480 res!1074977) b!1573481))

(assert (= (and b!1573481 res!1074976) b!1573482))

(declare-fun m!1446893 () Bool)

(assert (=> start!135278 m!1446893))

(declare-fun m!1446895 () Bool)

(assert (=> start!135278 m!1446895))

(declare-fun m!1446897 () Bool)

(assert (=> b!1573481 m!1446897))

(declare-fun m!1446899 () Bool)

(assert (=> b!1573482 m!1446899))

(assert (=> b!1573482 m!1446899))

(declare-fun m!1446901 () Bool)

(assert (=> b!1573482 m!1446901))

(check-sat (not b!1573482) (not b!1573481) (not start!135278))
(check-sat)
(get-model)

(declare-fun b!1573555 () Bool)

(declare-fun e!877489 () SeekEntryResult!13627)

(assert (=> b!1573555 (= e!877489 (Intermediate!13627 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573556 () Bool)

(declare-fun lt!674449 () SeekEntryResult!13627)

(assert (=> b!1573556 (and (bvsge (index!56908 lt!674449) #b00000000000000000000000000000000) (bvslt (index!56908 lt!674449) (size!51264 _keys!600)))))

(declare-fun res!1075010 () Bool)

(assert (=> b!1573556 (= res!1075010 (= (select (arr!50714 _keys!600) (index!56908 lt!674449)) k0!754))))

(declare-fun e!877487 () Bool)

(assert (=> b!1573556 (=> res!1075010 e!877487)))

(declare-fun e!877490 () Bool)

(assert (=> b!1573556 (= e!877490 e!877487)))

(declare-fun b!1573557 () Bool)

(declare-fun e!877491 () SeekEntryResult!13627)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573557 (= e!877491 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573558 () Bool)

(declare-fun e!877488 () Bool)

(assert (=> b!1573558 (= e!877488 e!877490)))

(declare-fun res!1075012 () Bool)

(assert (=> b!1573558 (= res!1075012 (and ((_ is Intermediate!13627) lt!674449) (not (undefined!14439 lt!674449)) (bvslt (x!141710 lt!674449) #b01111111111111111111111111111110) (bvsge (x!141710 lt!674449) #b00000000000000000000000000000000) (bvsge (x!141710 lt!674449) #b00000000000000000000000000000000)))))

(assert (=> b!1573558 (=> (not res!1075012) (not e!877490))))

(declare-fun b!1573559 () Bool)

(assert (=> b!1573559 (and (bvsge (index!56908 lt!674449) #b00000000000000000000000000000000) (bvslt (index!56908 lt!674449) (size!51264 _keys!600)))))

(declare-fun res!1075011 () Bool)

(assert (=> b!1573559 (= res!1075011 (= (select (arr!50714 _keys!600) (index!56908 lt!674449)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573559 (=> res!1075011 e!877487)))

(declare-fun b!1573560 () Bool)

(assert (=> b!1573560 (= e!877489 e!877491)))

(declare-fun c!145526 () Bool)

(declare-fun lt!674450 () (_ BitVec 64))

(assert (=> b!1573560 (= c!145526 (or (= lt!674450 k0!754) (= (bvadd lt!674450 lt!674450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573561 () Bool)

(assert (=> b!1573561 (= e!877488 (bvsge (x!141710 lt!674449) #b01111111111111111111111111111110))))

(declare-fun d!165005 () Bool)

(assert (=> d!165005 e!877488))

(declare-fun c!145527 () Bool)

(assert (=> d!165005 (= c!145527 (and ((_ is Intermediate!13627) lt!674449) (undefined!14439 lt!674449)))))

(assert (=> d!165005 (= lt!674449 e!877489)))

(declare-fun c!145525 () Bool)

(assert (=> d!165005 (= c!145525 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165005 (= lt!674450 (select (arr!50714 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165005 (validMask!0 mask!889)))

(assert (=> d!165005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674449)))

(declare-fun b!1573562 () Bool)

(assert (=> b!1573562 (and (bvsge (index!56908 lt!674449) #b00000000000000000000000000000000) (bvslt (index!56908 lt!674449) (size!51264 _keys!600)))))

(assert (=> b!1573562 (= e!877487 (= (select (arr!50714 _keys!600) (index!56908 lt!674449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573563 () Bool)

(assert (=> b!1573563 (= e!877491 (Intermediate!13627 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!165005 c!145525) b!1573555))

(assert (= (and d!165005 (not c!145525)) b!1573560))

(assert (= (and b!1573560 c!145526) b!1573563))

(assert (= (and b!1573560 (not c!145526)) b!1573557))

(assert (= (and d!165005 c!145527) b!1573561))

(assert (= (and d!165005 (not c!145527)) b!1573558))

(assert (= (and b!1573558 res!1075012) b!1573556))

(assert (= (and b!1573556 (not res!1075010)) b!1573559))

(assert (= (and b!1573559 (not res!1075011)) b!1573562))

(assert (=> d!165005 m!1446899))

(declare-fun m!1446921 () Bool)

(assert (=> d!165005 m!1446921))

(assert (=> d!165005 m!1446893))

(declare-fun m!1446923 () Bool)

(assert (=> b!1573562 m!1446923))

(assert (=> b!1573556 m!1446923))

(assert (=> b!1573559 m!1446923))

(assert (=> b!1573557 m!1446899))

(declare-fun m!1446925 () Bool)

(assert (=> b!1573557 m!1446925))

(assert (=> b!1573557 m!1446925))

(declare-fun m!1446927 () Bool)

(assert (=> b!1573557 m!1446927))

(assert (=> b!1573482 d!165005))

(declare-fun d!165013 () Bool)

(declare-fun lt!674464 () (_ BitVec 32))

(declare-fun lt!674463 () (_ BitVec 32))

(assert (=> d!165013 (= lt!674464 (bvmul (bvxor lt!674463 (bvlshr lt!674463 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165013 (= lt!674463 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165013 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075013 (let ((h!38238 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141716 (bvmul (bvxor h!38238 (bvlshr h!38238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141716 (bvlshr x!141716 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075013 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075013 #b00000000000000000000000000000000))))))

(assert (=> d!165013 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674464 (bvlshr lt!674464 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573482 d!165013))

(declare-fun d!165021 () Bool)

(assert (=> d!165021 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573481 d!165021))

(declare-fun d!165023 () Bool)

(assert (=> d!165023 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135278 d!165023))

(declare-fun d!165031 () Bool)

(assert (=> d!165031 (= (array_inv!39441 _keys!600) (bvsge (size!51264 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135278 d!165031))

(check-sat (not d!165005) (not b!1573557))
