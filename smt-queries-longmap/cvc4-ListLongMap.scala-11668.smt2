; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136418 () Bool)

(assert start!136418)

(declare-fun b!1577431 () Bool)

(declare-fun res!1077693 () Bool)

(declare-fun e!879854 () Bool)

(assert (=> b!1577431 (=> (not res!1077693) (not e!879854))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577431 (= res!1077693 (validKeyInArray!0 k!768))))

(declare-fun x!458 () (_ BitVec 32))

(declare-datatypes ((array!105609 0))(
  ( (array!105610 (arr!50925 (Array (_ BitVec 32) (_ BitVec 64))) (size!51475 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105609)

(declare-datatypes ((SeekEntryResult!13754 0))(
  ( (MissingZero!13754 (index!57414 (_ BitVec 32))) (Found!13754 (index!57415 (_ BitVec 32))) (Intermediate!13754 (undefined!14566 Bool) (index!57416 (_ BitVec 32)) (x!142535 (_ BitVec 32))) (Undefined!13754) (MissingVacant!13754 (index!57417 (_ BitVec 32))) )
))
(declare-fun lt!675991 () SeekEntryResult!13754)

(declare-fun b!1577433 () Bool)

(assert (=> b!1577433 (= e!879854 (and (is-Intermediate!13754 lt!675991) (not (undefined!14566 lt!675991)) (bvslt (x!142535 lt!675991) #b01111111111111111111111111111110) (bvsge (x!142535 lt!675991) #b00000000000000000000000000000000) (bvsge (x!142535 lt!675991) x!458) (or (bvslt (index!57416 lt!675991) #b00000000000000000000000000000000) (bvsge (index!57416 lt!675991) (size!51475 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105609 (_ BitVec 32)) SeekEntryResult!13754)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577433 (= lt!675991 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577432 () Bool)

(declare-fun res!1077695 () Bool)

(assert (=> b!1577432 (=> (not res!1077695) (not e!879854))))

(assert (=> b!1577432 (= res!1077695 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50925 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50925 _keys!610) ee!12) (select (arr!50925 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077696 () Bool)

(assert (=> start!136418 (=> (not res!1077696) (not e!879854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136418 (= res!1077696 (validMask!0 mask!910))))

(assert (=> start!136418 e!879854))

(assert (=> start!136418 true))

(declare-fun array_inv!39652 (array!105609) Bool)

(assert (=> start!136418 (array_inv!39652 _keys!610)))

(declare-fun b!1577430 () Bool)

(declare-fun res!1077694 () Bool)

(assert (=> b!1577430 (=> (not res!1077694) (not e!879854))))

(assert (=> b!1577430 (= res!1077694 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51475 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136418 res!1077696) b!1577430))

(assert (= (and b!1577430 res!1077694) b!1577431))

(assert (= (and b!1577431 res!1077693) b!1577432))

(assert (= (and b!1577432 res!1077695) b!1577433))

(declare-fun m!1449709 () Bool)

(assert (=> b!1577431 m!1449709))

(declare-fun m!1449711 () Bool)

(assert (=> b!1577433 m!1449711))

(assert (=> b!1577433 m!1449711))

(declare-fun m!1449713 () Bool)

(assert (=> b!1577433 m!1449713))

(declare-fun m!1449715 () Bool)

(assert (=> b!1577432 m!1449715))

(declare-fun m!1449717 () Bool)

(assert (=> start!136418 m!1449717))

(declare-fun m!1449719 () Bool)

(assert (=> start!136418 m!1449719))

(push 1)

(assert (not b!1577433))

(assert (not start!136418))

(assert (not b!1577431))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1577506 () Bool)

(declare-fun e!879897 () SeekEntryResult!13754)

(declare-fun e!879895 () SeekEntryResult!13754)

(assert (=> b!1577506 (= e!879897 e!879895)))

(declare-fun c!146177 () Bool)

(declare-fun lt!676015 () (_ BitVec 64))

(assert (=> b!1577506 (= c!146177 (or (= lt!676015 k!768) (= (bvadd lt!676015 lt!676015) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577507 () Bool)

(declare-fun lt!676014 () SeekEntryResult!13754)

(assert (=> b!1577507 (and (bvsge (index!57416 lt!676014) #b00000000000000000000000000000000) (bvslt (index!57416 lt!676014) (size!51475 _keys!610)))))

(declare-fun e!879898 () Bool)

(assert (=> b!1577507 (= e!879898 (= (select (arr!50925 _keys!610) (index!57416 lt!676014)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577508 () Bool)

(assert (=> b!1577508 (= e!879895 (Intermediate!13754 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577509 () Bool)

(assert (=> b!1577509 (= e!879897 (Intermediate!13754 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577510 () Bool)

(assert (=> b!1577510 (and (bvsge (index!57416 lt!676014) #b00000000000000000000000000000000) (bvslt (index!57416 lt!676014) (size!51475 _keys!610)))))

(declare-fun res!1077721 () Bool)

(assert (=> b!1577510 (= res!1077721 (= (select (arr!50925 _keys!610) (index!57416 lt!676014)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577510 (=> res!1077721 e!879898)))

(declare-fun b!1577511 () Bool)

(declare-fun e!879896 () Bool)

(assert (=> b!1577511 (= e!879896 (bvsge (x!142535 lt!676014) #b01111111111111111111111111111110))))

(declare-fun b!1577512 () Bool)

(assert (=> b!1577512 (= e!879895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577513 () Bool)

(declare-fun e!879899 () Bool)

(assert (=> b!1577513 (= e!879896 e!879899)))

(declare-fun res!1077722 () Bool)

(assert (=> b!1577513 (= res!1077722 (and (is-Intermediate!13754 lt!676014) (not (undefined!14566 lt!676014)) (bvslt (x!142535 lt!676014) #b01111111111111111111111111111110) (bvsge (x!142535 lt!676014) #b00000000000000000000000000000000) (bvsge (x!142535 lt!676014) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577513 (=> (not res!1077722) (not e!879899))))

(declare-fun d!165867 () Bool)

(assert (=> d!165867 e!879896))

(declare-fun c!146178 () Bool)

(assert (=> d!165867 (= c!146178 (and (is-Intermediate!13754 lt!676014) (undefined!14566 lt!676014)))))

(assert (=> d!165867 (= lt!676014 e!879897)))

(declare-fun c!146176 () Bool)

(assert (=> d!165867 (= c!146176 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!165867 (= lt!676015 (select (arr!50925 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165867 (validMask!0 mask!910)))

(assert (=> d!165867 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676014)))

(declare-fun b!1577514 () Bool)

(assert (=> b!1577514 (and (bvsge (index!57416 lt!676014) #b00000000000000000000000000000000) (bvslt (index!57416 lt!676014) (size!51475 _keys!610)))))

(declare-fun res!1077723 () Bool)

(assert (=> b!1577514 (= res!1077723 (= (select (arr!50925 _keys!610) (index!57416 lt!676014)) k!768))))

(assert (=> b!1577514 (=> res!1077723 e!879898)))

(assert (=> b!1577514 (= e!879899 e!879898)))

(assert (= (and d!165867 c!146176) b!1577509))

(assert (= (and d!165867 (not c!146176)) b!1577506))

(assert (= (and b!1577506 c!146177) b!1577508))

(assert (= (and b!1577506 (not c!146177)) b!1577512))

(assert (= (and d!165867 c!146178) b!1577511))

(assert (= (and d!165867 (not c!146178)) b!1577513))

(assert (= (and b!1577513 res!1077722) b!1577514))

(assert (= (and b!1577514 (not res!1077723)) b!1577510))

(assert (= (and b!1577510 (not res!1077721)) b!1577507))

(assert (=> b!1577512 m!1449711))

(declare-fun m!1449741 () Bool)

(assert (=> b!1577512 m!1449741))

(assert (=> b!1577512 m!1449741))

(declare-fun m!1449743 () Bool)

(assert (=> b!1577512 m!1449743))

(declare-fun m!1449745 () Bool)

(assert (=> b!1577510 m!1449745))

(assert (=> b!1577507 m!1449745))

(assert (=> b!1577514 m!1449745))

(assert (=> d!165867 m!1449711))

(declare-fun m!1449747 () Bool)

(assert (=> d!165867 m!1449747))

(assert (=> d!165867 m!1449717))

(assert (=> b!1577433 d!165867))

(declare-fun d!165881 () Bool)

(declare-fun lt!676018 () (_ BitVec 32))

(assert (=> d!165881 (and (bvsge lt!676018 #b00000000000000000000000000000000) (bvslt lt!676018 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165881 (= lt!676018 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165881 (validMask!0 mask!910)))

(assert (=> d!165881 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676018)))

(declare-fun bs!45585 () Bool)

(assert (= bs!45585 d!165881))

(declare-fun m!1449749 () Bool)

(assert (=> bs!45585 m!1449749))

(assert (=> bs!45585 m!1449717))

(assert (=> b!1577433 d!165881))

(declare-fun d!165883 () Bool)

(assert (=> d!165883 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136418 d!165883))

(declare-fun d!165889 () Bool)

(assert (=> d!165889 (= (array_inv!39652 _keys!610) (bvsge (size!51475 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136418 d!165889))

(declare-fun d!165891 () Bool)

(assert (=> d!165891 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

