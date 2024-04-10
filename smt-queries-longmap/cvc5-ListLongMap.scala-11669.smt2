; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136450 () Bool)

(assert start!136450)

(declare-fun b!1577524 () Bool)

(declare-fun res!1077734 () Bool)

(declare-fun e!879904 () Bool)

(assert (=> b!1577524 (=> (not res!1077734) (not e!879904))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577524 (= res!1077734 (validKeyInArray!0 k!768))))

(declare-fun b!1577525 () Bool)

(declare-fun res!1077733 () Bool)

(assert (=> b!1577525 (=> (not res!1077733) (not e!879904))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105614 0))(
  ( (array!105615 (arr!50926 (Array (_ BitVec 32) (_ BitVec 64))) (size!51476 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105614)

(assert (=> b!1577525 (= res!1077733 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50926 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50926 _keys!610) ee!12) (select (arr!50926 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!13755 0))(
  ( (MissingZero!13755 (index!57418 (_ BitVec 32))) (Found!13755 (index!57419 (_ BitVec 32))) (Intermediate!13755 (undefined!14567 Bool) (index!57420 (_ BitVec 32)) (x!142550 (_ BitVec 32))) (Undefined!13755) (MissingVacant!13755 (index!57421 (_ BitVec 32))) )
))
(declare-fun lt!676021 () SeekEntryResult!13755)

(declare-fun b!1577526 () Bool)

(assert (=> b!1577526 (= e!879904 (and (is-Intermediate!13755 lt!676021) (not (undefined!14567 lt!676021)) (bvslt (x!142550 lt!676021) #b01111111111111111111111111111110) (bvsge (x!142550 lt!676021) #b00000000000000000000000000000000) (bvsge (x!142550 lt!676021) x!458) (not (= (select (arr!50926 _keys!610) (index!57420 lt!676021)) k!768)) (or (bvslt (index!57420 lt!676021) #b00000000000000000000000000000000) (bvsge (index!57420 lt!676021) (size!51476 _keys!610)))))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105614 (_ BitVec 32)) SeekEntryResult!13755)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577526 (= lt!676021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun res!1077735 () Bool)

(assert (=> start!136450 (=> (not res!1077735) (not e!879904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136450 (= res!1077735 (validMask!0 mask!910))))

(assert (=> start!136450 e!879904))

(assert (=> start!136450 true))

(declare-fun array_inv!39653 (array!105614) Bool)

(assert (=> start!136450 (array_inv!39653 _keys!610)))

(declare-fun b!1577523 () Bool)

(declare-fun res!1077732 () Bool)

(assert (=> b!1577523 (=> (not res!1077732) (not e!879904))))

(assert (=> b!1577523 (= res!1077732 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51476 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136450 res!1077735) b!1577523))

(assert (= (and b!1577523 res!1077732) b!1577524))

(assert (= (and b!1577524 res!1077734) b!1577525))

(assert (= (and b!1577525 res!1077733) b!1577526))

(declare-fun m!1449751 () Bool)

(assert (=> b!1577524 m!1449751))

(declare-fun m!1449753 () Bool)

(assert (=> b!1577525 m!1449753))

(declare-fun m!1449755 () Bool)

(assert (=> b!1577526 m!1449755))

(declare-fun m!1449757 () Bool)

(assert (=> b!1577526 m!1449757))

(assert (=> b!1577526 m!1449757))

(declare-fun m!1449759 () Bool)

(assert (=> b!1577526 m!1449759))

(declare-fun m!1449761 () Bool)

(assert (=> start!136450 m!1449761))

(declare-fun m!1449763 () Bool)

(assert (=> start!136450 m!1449763))

(push 1)

(assert (not b!1577524))

(assert (not b!1577526))

(assert (not start!136450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165897 () Bool)

(assert (=> d!165897 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577524 d!165897))

(declare-fun b!1577596 () Bool)

(declare-fun lt!676041 () SeekEntryResult!13755)

(assert (=> b!1577596 (and (bvsge (index!57420 lt!676041) #b00000000000000000000000000000000) (bvslt (index!57420 lt!676041) (size!51476 _keys!610)))))

(declare-fun res!1077777 () Bool)

(assert (=> b!1577596 (= res!1077777 (= (select (arr!50926 _keys!610) (index!57420 lt!676041)) k!768))))

(declare-fun e!879946 () Bool)

(assert (=> b!1577596 (=> res!1077777 e!879946)))

(declare-fun e!879944 () Bool)

(assert (=> b!1577596 (= e!879944 e!879946)))

(declare-fun b!1577597 () Bool)

(declare-fun e!879943 () SeekEntryResult!13755)

(declare-fun e!879947 () SeekEntryResult!13755)

(assert (=> b!1577597 (= e!879943 e!879947)))

(declare-fun c!146196 () Bool)

(declare-fun lt!676042 () (_ BitVec 64))

(assert (=> b!1577597 (= c!146196 (or (= lt!676042 k!768) (= (bvadd lt!676042 lt!676042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577598 () Bool)

(assert (=> b!1577598 (= e!879947 (Intermediate!13755 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577599 () Bool)

(declare-fun e!879945 () Bool)

(assert (=> b!1577599 (= e!879945 (bvsge (x!142550 lt!676041) #b01111111111111111111111111111110))))

(declare-fun b!1577600 () Bool)

(assert (=> b!1577600 (= e!879947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577601 () Bool)

(assert (=> b!1577601 (= e!879945 e!879944)))

(declare-fun res!1077776 () Bool)

(assert (=> b!1577601 (= res!1077776 (and (is-Intermediate!13755 lt!676041) (not (undefined!14567 lt!676041)) (bvslt (x!142550 lt!676041) #b01111111111111111111111111111110) (bvsge (x!142550 lt!676041) #b00000000000000000000000000000000) (bvsge (x!142550 lt!676041) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577601 (=> (not res!1077776) (not e!879944))))

(declare-fun b!1577602 () Bool)

(assert (=> b!1577602 (and (bvsge (index!57420 lt!676041) #b00000000000000000000000000000000) (bvslt (index!57420 lt!676041) (size!51476 _keys!610)))))

(assert (=> b!1577602 (= e!879946 (= (select (arr!50926 _keys!610) (index!57420 lt!676041)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165899 () Bool)

(assert (=> d!165899 e!879945))

(declare-fun c!146194 () Bool)

(assert (=> d!165899 (= c!146194 (and (is-Intermediate!13755 lt!676041) (undefined!14567 lt!676041)))))

(assert (=> d!165899 (= lt!676041 e!879943)))

(declare-fun c!146195 () Bool)

(assert (=> d!165899 (= c!146195 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!165899 (= lt!676042 (select (arr!50926 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165899 (validMask!0 mask!910)))

(assert (=> d!165899 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676041)))

(declare-fun b!1577603 () Bool)

(assert (=> b!1577603 (= e!879943 (Intermediate!13755 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577604 () Bool)

(assert (=> b!1577604 (and (bvsge (index!57420 lt!676041) #b00000000000000000000000000000000) (bvslt (index!57420 lt!676041) (size!51476 _keys!610)))))

(declare-fun res!1077775 () Bool)

(assert (=> b!1577604 (= res!1077775 (= (select (arr!50926 _keys!610) (index!57420 lt!676041)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577604 (=> res!1077775 e!879946)))

(assert (= (and d!165899 c!146195) b!1577603))

(assert (= (and d!165899 (not c!146195)) b!1577597))

(assert (= (and b!1577597 c!146196) b!1577598))

(assert (= (and b!1577597 (not c!146196)) b!1577600))

(assert (= (and d!165899 c!146194) b!1577599))

(assert (= (and d!165899 (not c!146194)) b!1577601))

(assert (= (and b!1577601 res!1077776) b!1577596))

(assert (= (and b!1577596 (not res!1077777)) b!1577604))

(assert (= (and b!1577604 (not res!1077775)) b!1577602))

(declare-fun m!1449803 () Bool)

(assert (=> b!1577604 m!1449803))

(assert (=> b!1577600 m!1449757))

(declare-fun m!1449805 () Bool)

(assert (=> b!1577600 m!1449805))

(assert (=> b!1577600 m!1449805))

(declare-fun m!1449807 () Bool)

(assert (=> b!1577600 m!1449807))

(assert (=> b!1577596 m!1449803))

(assert (=> b!1577602 m!1449803))

(assert (=> d!165899 m!1449757))

(declare-fun m!1449809 () Bool)

(assert (=> d!165899 m!1449809))

(assert (=> d!165899 m!1449761))

(assert (=> b!1577526 d!165899))

(declare-fun d!165911 () Bool)

(declare-fun lt!676045 () (_ BitVec 32))

(assert (=> d!165911 (and (bvsge lt!676045 #b00000000000000000000000000000000) (bvslt lt!676045 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165911 (= lt!676045 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165911 (validMask!0 mask!910)))

(assert (=> d!165911 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676045)))

(declare-fun bs!45590 () Bool)

(assert (= bs!45590 d!165911))

(declare-fun m!1449811 () Bool)

(assert (=> bs!45590 m!1449811))

(assert (=> bs!45590 m!1449761))

(assert (=> b!1577526 d!165911))

(declare-fun d!165915 () Bool)

(assert (=> d!165915 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136450 d!165915))

(declare-fun d!165921 () Bool)

(assert (=> d!165921 (= (array_inv!39653 _keys!610) (bvsge (size!51476 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136450 d!165921))

(push 1)

