; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134996 () Bool)

(assert start!134996)

(declare-fun res!1074357 () Bool)

(declare-fun e!876782 () Bool)

(assert (=> start!134996 (=> (not res!1074357) (not e!876782))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134996 (= res!1074357 (validMask!0 mask!889))))

(assert (=> start!134996 e!876782))

(assert (=> start!134996 true))

(declare-datatypes ((array!105012 0))(
  ( (array!105013 (arr!50671 (Array (_ BitVec 32) (_ BitVec 64))) (size!51221 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105012)

(declare-fun array_inv!39398 (array!105012) Bool)

(assert (=> start!134996 (array_inv!39398 _keys!600)))

(declare-fun b!1572391 () Bool)

(declare-fun res!1074356 () Bool)

(assert (=> b!1572391 (=> (not res!1074356) (not e!876782))))

(assert (=> b!1572391 (= res!1074356 (= (size!51221 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572392 () Bool)

(declare-fun res!1074355 () Bool)

(assert (=> b!1572392 (=> (not res!1074355) (not e!876782))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572392 (= res!1074355 (validKeyInArray!0 k!754))))

(declare-fun b!1572393 () Bool)

(declare-datatypes ((SeekEntryResult!13584 0))(
  ( (MissingZero!13584 (index!56734 (_ BitVec 32))) (Found!13584 (index!56735 (_ BitVec 32))) (Intermediate!13584 (undefined!14396 Bool) (index!56736 (_ BitVec 32)) (x!141510 (_ BitVec 32))) (Undefined!13584) (MissingVacant!13584 (index!56737 (_ BitVec 32))) )
))
(declare-fun lt!673969 () SeekEntryResult!13584)

(assert (=> b!1572393 (= e!876782 (and (is-Intermediate!13584 lt!673969) (not (undefined!14396 lt!673969)) (or (bvslt (index!56736 lt!673969) #b00000000000000000000000000000000) (bvsge (index!56736 lt!673969) (size!51221 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105012 (_ BitVec 32)) SeekEntryResult!13584)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572393 (= lt!673969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134996 res!1074357) b!1572391))

(assert (= (and b!1572391 res!1074356) b!1572392))

(assert (= (and b!1572392 res!1074355) b!1572393))

(declare-fun m!1446157 () Bool)

(assert (=> start!134996 m!1446157))

(declare-fun m!1446159 () Bool)

(assert (=> start!134996 m!1446159))

(declare-fun m!1446161 () Bool)

(assert (=> b!1572392 m!1446161))

(declare-fun m!1446163 () Bool)

(assert (=> b!1572393 m!1446163))

(assert (=> b!1572393 m!1446163))

(declare-fun m!1446165 () Bool)

(assert (=> b!1572393 m!1446165))

(push 1)

(assert (not b!1572392))

(assert (not b!1572393))

(assert (not start!134996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164785 () Bool)

(assert (=> d!164785 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572392 d!164785))

(declare-fun b!1572475 () Bool)

(declare-fun e!876831 () SeekEntryResult!13584)

(assert (=> b!1572475 (= e!876831 (Intermediate!13584 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572476 () Bool)

(declare-fun lt!673990 () SeekEntryResult!13584)

(assert (=> b!1572476 (and (bvsge (index!56736 lt!673990) #b00000000000000000000000000000000) (bvslt (index!56736 lt!673990) (size!51221 _keys!600)))))

(declare-fun e!876833 () Bool)

(assert (=> b!1572476 (= e!876833 (= (select (arr!50671 _keys!600) (index!56736 lt!673990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572477 () Bool)

(declare-fun e!876834 () Bool)

(declare-fun e!876830 () Bool)

(assert (=> b!1572477 (= e!876834 e!876830)))

(declare-fun res!1074399 () Bool)

(assert (=> b!1572477 (= res!1074399 (and (is-Intermediate!13584 lt!673990) (not (undefined!14396 lt!673990)) (bvslt (x!141510 lt!673990) #b01111111111111111111111111111110) (bvsge (x!141510 lt!673990) #b00000000000000000000000000000000) (bvsge (x!141510 lt!673990) #b00000000000000000000000000000000)))))

(assert (=> b!1572477 (=> (not res!1074399) (not e!876830))))

(declare-fun b!1572478 () Bool)

(declare-fun e!876832 () SeekEntryResult!13584)

(assert (=> b!1572478 (= e!876832 e!876831)))

(declare-fun c!145283 () Bool)

(declare-fun lt!673991 () (_ BitVec 64))

(assert (=> b!1572478 (= c!145283 (or (= lt!673991 k!754) (= (bvadd lt!673991 lt!673991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572479 () Bool)

(assert (=> b!1572479 (= e!876832 (Intermediate!13584 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164787 () Bool)

(assert (=> d!164787 e!876834))

(declare-fun c!145282 () Bool)

(assert (=> d!164787 (= c!145282 (and (is-Intermediate!13584 lt!673990) (undefined!14396 lt!673990)))))

(assert (=> d!164787 (= lt!673990 e!876832)))

(declare-fun c!145284 () Bool)

(assert (=> d!164787 (= c!145284 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164787 (= lt!673991 (select (arr!50671 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164787 (validMask!0 mask!889)))

(assert (=> d!164787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673990)))

(declare-fun b!1572480 () Bool)

(assert (=> b!1572480 (and (bvsge (index!56736 lt!673990) #b00000000000000000000000000000000) (bvslt (index!56736 lt!673990) (size!51221 _keys!600)))))

(declare-fun res!1074398 () Bool)

(assert (=> b!1572480 (= res!1074398 (= (select (arr!50671 _keys!600) (index!56736 lt!673990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572480 (=> res!1074398 e!876833)))

(declare-fun b!1572481 () Bool)

(assert (=> b!1572481 (= e!876834 (bvsge (x!141510 lt!673990) #b01111111111111111111111111111110))))

(declare-fun b!1572482 () Bool)

(assert (=> b!1572482 (and (bvsge (index!56736 lt!673990) #b00000000000000000000000000000000) (bvslt (index!56736 lt!673990) (size!51221 _keys!600)))))

(declare-fun res!1074400 () Bool)

(assert (=> b!1572482 (= res!1074400 (= (select (arr!50671 _keys!600) (index!56736 lt!673990)) k!754))))

(assert (=> b!1572482 (=> res!1074400 e!876833)))

(assert (=> b!1572482 (= e!876830 e!876833)))

(declare-fun b!1572483 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572483 (= e!876831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and d!164787 c!145284) b!1572479))

(assert (= (and d!164787 (not c!145284)) b!1572478))

(assert (= (and b!1572478 c!145283) b!1572475))

(assert (= (and b!1572478 (not c!145283)) b!1572483))

(assert (= (and d!164787 c!145282) b!1572481))

(assert (= (and d!164787 (not c!145282)) b!1572477))

(assert (= (and b!1572477 res!1074399) b!1572482))

(assert (= (and b!1572482 (not res!1074400)) b!1572480))

(assert (= (and b!1572480 (not res!1074398)) b!1572476))

(declare-fun m!1446195 () Bool)

(assert (=> b!1572482 m!1446195))

(assert (=> b!1572476 m!1446195))

(assert (=> b!1572480 m!1446195))

(assert (=> b!1572483 m!1446163))

(declare-fun m!1446197 () Bool)

(assert (=> b!1572483 m!1446197))

(assert (=> b!1572483 m!1446197))

(declare-fun m!1446199 () Bool)

(assert (=> b!1572483 m!1446199))

(assert (=> d!164787 m!1446163))

(declare-fun m!1446201 () Bool)

(assert (=> d!164787 m!1446201))

(assert (=> d!164787 m!1446157))

(assert (=> b!1572393 d!164787))

(declare-fun d!164795 () Bool)

(declare-fun lt!674005 () (_ BitVec 32))

(declare-fun lt!674004 () (_ BitVec 32))

(assert (=> d!164795 (= lt!674005 (bvmul (bvxor lt!674004 (bvlshr lt!674004 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164795 (= lt!674004 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164795 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074401 (let ((h!38220 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141517 (bvmul (bvxor h!38220 (bvlshr h!38220 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141517 (bvlshr x!141517 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074401 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074401 #b00000000000000000000000000000000))))))

(assert (=> d!164795 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674005 (bvlshr lt!674005 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572393 d!164795))

(declare-fun d!164801 () Bool)

(assert (=> d!164801 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134996 d!164801))

(declare-fun d!164807 () Bool)

(assert (=> d!164807 (= (array_inv!39398 _keys!600) (bvsge (size!51221 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134996 d!164807))

(push 1)

(assert (not d!164787))

(assert (not b!1572483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

