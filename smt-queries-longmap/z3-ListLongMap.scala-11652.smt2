; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136176 () Bool)

(assert start!136176)

(declare-fun b!1576565 () Bool)

(declare-fun e!879350 () Bool)

(declare-fun e!879348 () Bool)

(assert (=> b!1576565 (= e!879350 e!879348)))

(declare-fun res!1077030 () Bool)

(assert (=> b!1576565 (=> (not res!1077030) (not e!879348))))

(declare-fun lt!675675 () Bool)

(declare-datatypes ((SeekEntryResult!13741 0))(
  ( (MissingZero!13741 (index!57362 (_ BitVec 32))) (Found!13741 (index!57363 (_ BitVec 32))) (Intermediate!13741 (undefined!14553 Bool) (index!57364 (_ BitVec 32)) (x!142367 (_ BitVec 32))) (Undefined!13741) (MissingVacant!13741 (index!57365 (_ BitVec 32))) )
))
(declare-fun lt!675676 () SeekEntryResult!13741)

(assert (=> b!1576565 (= res!1077030 (and (or lt!675675 (not (undefined!14553 lt!675676))) (or lt!675675 (undefined!14553 lt!675676))))))

(get-info :version)

(assert (=> b!1576565 (= lt!675675 (not ((_ is Intermediate!13741) lt!675676)))))

(declare-datatypes ((array!105496 0))(
  ( (array!105497 (arr!50876 (Array (_ BitVec 32) (_ BitVec 64))) (size!51426 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105496)

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105496 (_ BitVec 32)) SeekEntryResult!13741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576565 (= lt!675676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576566 () Bool)

(declare-fun lt!675674 () SeekEntryResult!13741)

(assert (=> b!1576566 (= e!879348 (and (not ((_ is Undefined!13741) lt!675674)) ((_ is Found!13741) lt!675674) (or (bvslt (index!57363 lt!675674) #b00000000000000000000000000000000) (bvsge (index!57363 lt!675674) (size!51426 _keys!605)))))))

(declare-fun err!178 () SeekEntryResult!13741)

(assert (=> b!1576566 (= lt!675674 err!178)))

(assert (=> b!1576566 true))

(declare-fun b!1576564 () Bool)

(declare-fun res!1077033 () Bool)

(assert (=> b!1576564 (=> (not res!1077033) (not e!879350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576564 (= res!1077033 (validKeyInArray!0 k0!761))))

(declare-fun res!1077032 () Bool)

(assert (=> start!136176 (=> (not res!1077032) (not e!879350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136176 (= res!1077032 (validMask!0 mask!898))))

(assert (=> start!136176 e!879350))

(assert (=> start!136176 true))

(declare-fun array_inv!39603 (array!105496) Bool)

(assert (=> start!136176 (array_inv!39603 _keys!605)))

(declare-fun b!1576563 () Bool)

(declare-fun res!1077031 () Bool)

(assert (=> b!1576563 (=> (not res!1077031) (not e!879350))))

(assert (=> b!1576563 (= res!1077031 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51426 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136176 res!1077032) b!1576563))

(assert (= (and b!1576563 res!1077031) b!1576564))

(assert (= (and b!1576564 res!1077033) b!1576565))

(assert (= (and b!1576565 res!1077030) b!1576566))

(declare-fun m!1449131 () Bool)

(assert (=> b!1576565 m!1449131))

(assert (=> b!1576565 m!1449131))

(declare-fun m!1449133 () Bool)

(assert (=> b!1576565 m!1449133))

(declare-fun m!1449135 () Bool)

(assert (=> b!1576564 m!1449135))

(declare-fun m!1449137 () Bool)

(assert (=> start!136176 m!1449137))

(declare-fun m!1449139 () Bool)

(assert (=> start!136176 m!1449139))

(check-sat (not start!136176) (not b!1576564) (not b!1576565))
(check-sat)
(get-model)

(declare-fun d!165687 () Bool)

(assert (=> d!165687 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136176 d!165687))

(declare-fun d!165697 () Bool)

(assert (=> d!165697 (= (array_inv!39603 _keys!605) (bvsge (size!51426 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136176 d!165697))

(declare-fun d!165699 () Bool)

(assert (=> d!165699 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576564 d!165699))

(declare-fun d!165701 () Bool)

(declare-fun e!879383 () Bool)

(assert (=> d!165701 e!879383))

(declare-fun c!146056 () Bool)

(declare-fun lt!675695 () SeekEntryResult!13741)

(assert (=> d!165701 (= c!146056 (and ((_ is Intermediate!13741) lt!675695) (undefined!14553 lt!675695)))))

(declare-fun e!879384 () SeekEntryResult!13741)

(assert (=> d!165701 (= lt!675695 e!879384)))

(declare-fun c!146058 () Bool)

(assert (=> d!165701 (= c!146058 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675694 () (_ BitVec 64))

(assert (=> d!165701 (= lt!675694 (select (arr!50876 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165701 (validMask!0 mask!898)))

(assert (=> d!165701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675695)))

(declare-fun b!1576615 () Bool)

(declare-fun e!879381 () SeekEntryResult!13741)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576615 (= e!879381 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576616 () Bool)

(assert (=> b!1576616 (and (bvsge (index!57364 lt!675695) #b00000000000000000000000000000000) (bvslt (index!57364 lt!675695) (size!51426 _keys!605)))))

(declare-fun res!1077059 () Bool)

(assert (=> b!1576616 (= res!1077059 (= (select (arr!50876 _keys!605) (index!57364 lt!675695)) k0!761))))

(declare-fun e!879380 () Bool)

(assert (=> b!1576616 (=> res!1077059 e!879380)))

(declare-fun e!879382 () Bool)

(assert (=> b!1576616 (= e!879382 e!879380)))

(declare-fun b!1576617 () Bool)

(assert (=> b!1576617 (= e!879383 (bvsge (x!142367 lt!675695) #b01111111111111111111111111111110))))

(declare-fun b!1576618 () Bool)

(assert (=> b!1576618 (= e!879381 (Intermediate!13741 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576619 () Bool)

(assert (=> b!1576619 (and (bvsge (index!57364 lt!675695) #b00000000000000000000000000000000) (bvslt (index!57364 lt!675695) (size!51426 _keys!605)))))

(assert (=> b!1576619 (= e!879380 (= (select (arr!50876 _keys!605) (index!57364 lt!675695)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576620 () Bool)

(assert (=> b!1576620 (= e!879384 (Intermediate!13741 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576621 () Bool)

(assert (=> b!1576621 (= e!879384 e!879381)))

(declare-fun c!146057 () Bool)

(assert (=> b!1576621 (= c!146057 (or (= lt!675694 k0!761) (= (bvadd lt!675694 lt!675694) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576622 () Bool)

(assert (=> b!1576622 (and (bvsge (index!57364 lt!675695) #b00000000000000000000000000000000) (bvslt (index!57364 lt!675695) (size!51426 _keys!605)))))

(declare-fun res!1077058 () Bool)

(assert (=> b!1576622 (= res!1077058 (= (select (arr!50876 _keys!605) (index!57364 lt!675695)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576622 (=> res!1077058 e!879380)))

(declare-fun b!1576623 () Bool)

(assert (=> b!1576623 (= e!879383 e!879382)))

(declare-fun res!1077060 () Bool)

(assert (=> b!1576623 (= res!1077060 (and ((_ is Intermediate!13741) lt!675695) (not (undefined!14553 lt!675695)) (bvslt (x!142367 lt!675695) #b01111111111111111111111111111110) (bvsge (x!142367 lt!675695) #b00000000000000000000000000000000) (bvsge (x!142367 lt!675695) #b00000000000000000000000000000000)))))

(assert (=> b!1576623 (=> (not res!1077060) (not e!879382))))

(assert (= (and d!165701 c!146058) b!1576620))

(assert (= (and d!165701 (not c!146058)) b!1576621))

(assert (= (and b!1576621 c!146057) b!1576618))

(assert (= (and b!1576621 (not c!146057)) b!1576615))

(assert (= (and d!165701 c!146056) b!1576617))

(assert (= (and d!165701 (not c!146056)) b!1576623))

(assert (= (and b!1576623 res!1077060) b!1576616))

(assert (= (and b!1576616 (not res!1077059)) b!1576622))

(assert (= (and b!1576622 (not res!1077058)) b!1576619))

(assert (=> b!1576615 m!1449131))

(declare-fun m!1449151 () Bool)

(assert (=> b!1576615 m!1449151))

(assert (=> b!1576615 m!1449151))

(declare-fun m!1449153 () Bool)

(assert (=> b!1576615 m!1449153))

(declare-fun m!1449155 () Bool)

(assert (=> b!1576622 m!1449155))

(assert (=> b!1576616 m!1449155))

(assert (=> d!165701 m!1449131))

(declare-fun m!1449157 () Bool)

(assert (=> d!165701 m!1449157))

(assert (=> d!165701 m!1449137))

(assert (=> b!1576619 m!1449155))

(assert (=> b!1576565 d!165701))

(declare-fun d!165711 () Bool)

(declare-fun lt!675707 () (_ BitVec 32))

(declare-fun lt!675706 () (_ BitVec 32))

(assert (=> d!165711 (= lt!675707 (bvmul (bvxor lt!675706 (bvlshr lt!675706 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165711 (= lt!675706 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165711 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077061 (let ((h!38288 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142371 (bvmul (bvxor h!38288 (bvlshr h!38288 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142371 (bvlshr x!142371 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077061 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077061 #b00000000000000000000000000000000))))))

(assert (=> d!165711 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675707 (bvlshr lt!675707 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576565 d!165711))

(check-sat (not d!165701) (not b!1576615))
(check-sat)
