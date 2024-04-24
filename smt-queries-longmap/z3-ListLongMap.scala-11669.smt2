; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136846 () Bool)

(assert start!136846)

(declare-fun res!1078556 () Bool)

(declare-fun e!881369 () Bool)

(assert (=> start!136846 (=> (not res!1078556) (not e!881369))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136846 (= res!1078556 (validMask!0 mask!910))))

(assert (=> start!136846 e!881369))

(assert (=> start!136846 true))

(declare-datatypes ((array!105737 0))(
  ( (array!105738 (arr!50980 (Array (_ BitVec 32) (_ BitVec 64))) (size!51531 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105737)

(declare-fun array_inv!39935 (array!105737) Bool)

(assert (=> start!136846 (array_inv!39935 _keys!610)))

(declare-fun b!1579870 () Bool)

(declare-fun res!1078557 () Bool)

(assert (=> b!1579870 (=> (not res!1078557) (not e!881369))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579870 (= res!1078557 (validKeyInArray!0 k0!768))))

(declare-fun b!1579872 () Bool)

(declare-fun x!458 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13700 0))(
  ( (MissingZero!13700 (index!57198 (_ BitVec 32))) (Found!13700 (index!57199 (_ BitVec 32))) (Intermediate!13700 (undefined!14512 Bool) (index!57200 (_ BitVec 32)) (x!142540 (_ BitVec 32))) (Undefined!13700) (MissingVacant!13700 (index!57201 (_ BitVec 32))) )
))
(declare-fun lt!676893 () SeekEntryResult!13700)

(get-info :version)

(assert (=> b!1579872 (= e!881369 (and ((_ is Intermediate!13700) lt!676893) (not (undefined!14512 lt!676893)) (bvslt (x!142540 lt!676893) #b01111111111111111111111111111110) (bvsge (x!142540 lt!676893) #b00000000000000000000000000000000) (bvsge (x!142540 lt!676893) x!458) (or (bvslt (index!57200 lt!676893) #b00000000000000000000000000000000) (bvsge (index!57200 lt!676893) (size!51531 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105737 (_ BitVec 32)) SeekEntryResult!13700)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579872 (= lt!676893 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1579869 () Bool)

(declare-fun res!1078558 () Bool)

(assert (=> b!1579869 (=> (not res!1078558) (not e!881369))))

(assert (=> b!1579869 (= res!1078558 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51531 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579871 () Bool)

(declare-fun res!1078559 () Bool)

(assert (=> b!1579871 (=> (not res!1078559) (not e!881369))))

(assert (=> b!1579871 (= res!1078559 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50980 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50980 _keys!610) ee!12) (select (arr!50980 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136846 res!1078556) b!1579869))

(assert (= (and b!1579869 res!1078558) b!1579870))

(assert (= (and b!1579870 res!1078557) b!1579871))

(assert (= (and b!1579871 res!1078559) b!1579872))

(declare-fun m!1451967 () Bool)

(assert (=> start!136846 m!1451967))

(declare-fun m!1451969 () Bool)

(assert (=> start!136846 m!1451969))

(declare-fun m!1451971 () Bool)

(assert (=> b!1579870 m!1451971))

(declare-fun m!1451973 () Bool)

(assert (=> b!1579872 m!1451973))

(assert (=> b!1579872 m!1451973))

(declare-fun m!1451975 () Bool)

(assert (=> b!1579872 m!1451975))

(declare-fun m!1451977 () Bool)

(assert (=> b!1579871 m!1451977))

(check-sat (not b!1579870) (not start!136846) (not b!1579872))
(check-sat)
(get-model)

(declare-fun d!166581 () Bool)

(assert (=> d!166581 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579870 d!166581))

(declare-fun d!166583 () Bool)

(assert (=> d!166583 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136846 d!166583))

(declare-fun d!166589 () Bool)

(assert (=> d!166589 (= (array_inv!39935 _keys!610) (bvsge (size!51531 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136846 d!166589))

(declare-fun b!1579915 () Bool)

(declare-fun e!881393 () SeekEntryResult!13700)

(assert (=> b!1579915 (= e!881393 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun d!166591 () Bool)

(declare-fun e!881395 () Bool)

(assert (=> d!166591 e!881395))

(declare-fun c!146960 () Bool)

(declare-fun lt!676905 () SeekEntryResult!13700)

(assert (=> d!166591 (= c!146960 (and ((_ is Intermediate!13700) lt!676905) (undefined!14512 lt!676905)))))

(declare-fun e!881396 () SeekEntryResult!13700)

(assert (=> d!166591 (= lt!676905 e!881396)))

(declare-fun c!146959 () Bool)

(assert (=> d!166591 (= c!146959 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676904 () (_ BitVec 64))

(assert (=> d!166591 (= lt!676904 (select (arr!50980 _keys!610) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910)))))

(assert (=> d!166591 (validMask!0 mask!910)))

(assert (=> d!166591 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910) lt!676905)))

(declare-fun b!1579916 () Bool)

(assert (=> b!1579916 (= e!881395 (bvsge (x!142540 lt!676905) #b01111111111111111111111111111110))))

(declare-fun b!1579917 () Bool)

(assert (=> b!1579917 (and (bvsge (index!57200 lt!676905) #b00000000000000000000000000000000) (bvslt (index!57200 lt!676905) (size!51531 _keys!610)))))

(declare-fun res!1078591 () Bool)

(assert (=> b!1579917 (= res!1078591 (= (select (arr!50980 _keys!610) (index!57200 lt!676905)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!881392 () Bool)

(assert (=> b!1579917 (=> res!1078591 e!881392)))

(declare-fun b!1579918 () Bool)

(assert (=> b!1579918 (and (bvsge (index!57200 lt!676905) #b00000000000000000000000000000000) (bvslt (index!57200 lt!676905) (size!51531 _keys!610)))))

(declare-fun res!1078590 () Bool)

(assert (=> b!1579918 (= res!1078590 (= (select (arr!50980 _keys!610) (index!57200 lt!676905)) k0!768))))

(assert (=> b!1579918 (=> res!1078590 e!881392)))

(declare-fun e!881394 () Bool)

(assert (=> b!1579918 (= e!881394 e!881392)))

(declare-fun b!1579919 () Bool)

(assert (=> b!1579919 (= e!881395 e!881394)))

(declare-fun res!1078592 () Bool)

(assert (=> b!1579919 (= res!1078592 (and ((_ is Intermediate!13700) lt!676905) (not (undefined!14512 lt!676905)) (bvslt (x!142540 lt!676905) #b01111111111111111111111111111110) (bvsge (x!142540 lt!676905) #b00000000000000000000000000000000) (bvsge (x!142540 lt!676905) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1579919 (=> (not res!1078592) (not e!881394))))

(declare-fun b!1579920 () Bool)

(assert (=> b!1579920 (and (bvsge (index!57200 lt!676905) #b00000000000000000000000000000000) (bvslt (index!57200 lt!676905) (size!51531 _keys!610)))))

(assert (=> b!1579920 (= e!881392 (= (select (arr!50980 _keys!610) (index!57200 lt!676905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1579921 () Bool)

(assert (=> b!1579921 (= e!881393 (Intermediate!13700 false (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1579922 () Bool)

(assert (=> b!1579922 (= e!881396 (Intermediate!13700 true (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1579923 () Bool)

(assert (=> b!1579923 (= e!881396 e!881393)))

(declare-fun c!146958 () Bool)

(assert (=> b!1579923 (= c!146958 (or (= lt!676904 k0!768) (= (bvadd lt!676904 lt!676904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!166591 c!146959) b!1579922))

(assert (= (and d!166591 (not c!146959)) b!1579923))

(assert (= (and b!1579923 c!146958) b!1579921))

(assert (= (and b!1579923 (not c!146958)) b!1579915))

(assert (= (and d!166591 c!146960) b!1579916))

(assert (= (and d!166591 (not c!146960)) b!1579919))

(assert (= (and b!1579919 res!1078592) b!1579918))

(assert (= (and b!1579918 (not res!1078590)) b!1579917))

(assert (= (and b!1579917 (not res!1078591)) b!1579920))

(declare-fun m!1452003 () Bool)

(assert (=> b!1579917 m!1452003))

(assert (=> b!1579918 m!1452003))

(assert (=> d!166591 m!1451973))

(declare-fun m!1452005 () Bool)

(assert (=> d!166591 m!1452005))

(assert (=> d!166591 m!1451967))

(assert (=> b!1579920 m!1452003))

(assert (=> b!1579915 m!1451973))

(declare-fun m!1452007 () Bool)

(assert (=> b!1579915 m!1452007))

(assert (=> b!1579915 m!1452007))

(declare-fun m!1452009 () Bool)

(assert (=> b!1579915 m!1452009))

(assert (=> b!1579872 d!166591))

(declare-fun d!166605 () Bool)

(declare-fun lt!676912 () (_ BitVec 32))

(assert (=> d!166605 (and (bvsge lt!676912 #b00000000000000000000000000000000) (bvslt lt!676912 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166605 (= lt!676912 (choose!52 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(assert (=> d!166605 (validMask!0 mask!910)))

(assert (=> d!166605 (= (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) lt!676912)))

(declare-fun bs!45604 () Bool)

(assert (= bs!45604 d!166605))

(declare-fun m!1452011 () Bool)

(assert (=> bs!45604 m!1452011))

(assert (=> bs!45604 m!1451967))

(assert (=> b!1579872 d!166605))

(check-sat (not d!166605) (not d!166591) (not b!1579915))
(check-sat)
