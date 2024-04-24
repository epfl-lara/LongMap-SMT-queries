; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127668 () Bool)

(assert start!127668)

(declare-fun b!1499430 () Bool)

(declare-fun res!1019458 () Bool)

(declare-fun e!839747 () Bool)

(assert (=> b!1499430 (=> (not res!1019458) (not e!839747))))

(declare-datatypes ((array!99969 0))(
  ( (array!99970 (arr!48244 (Array (_ BitVec 32) (_ BitVec 64))) (size!48795 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99969)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499430 (= res!1019458 (validKeyInArray!0 (select (arr!48244 a!2850) j!87)))))

(declare-fun b!1499431 () Bool)

(assert (=> b!1499431 (= e!839747 (and (bvsle #b00000000000000000000000000000000 (size!48795 a!2850)) (bvsge (size!48795 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1499432 () Bool)

(declare-fun res!1019456 () Bool)

(assert (=> b!1499432 (=> (not res!1019456) (not e!839747))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499432 (= res!1019456 (and (= (size!48795 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48795 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48795 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499433 () Bool)

(declare-fun res!1019455 () Bool)

(assert (=> b!1499433 (=> (not res!1019455) (not e!839747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99969 (_ BitVec 32)) Bool)

(assert (=> b!1499433 (= res!1019455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019459 () Bool)

(assert (=> start!127668 (=> (not res!1019459) (not e!839747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127668 (= res!1019459 (validMask!0 mask!2661))))

(assert (=> start!127668 e!839747))

(assert (=> start!127668 true))

(declare-fun array_inv!37525 (array!99969) Bool)

(assert (=> start!127668 (array_inv!37525 a!2850)))

(declare-fun b!1499434 () Bool)

(declare-fun res!1019457 () Bool)

(assert (=> b!1499434 (=> (not res!1019457) (not e!839747))))

(assert (=> b!1499434 (= res!1019457 (validKeyInArray!0 (select (arr!48244 a!2850) i!996)))))

(assert (= (and start!127668 res!1019459) b!1499432))

(assert (= (and b!1499432 res!1019456) b!1499434))

(assert (= (and b!1499434 res!1019457) b!1499430))

(assert (= (and b!1499430 res!1019458) b!1499433))

(assert (= (and b!1499433 res!1019455) b!1499431))

(declare-fun m!1382535 () Bool)

(assert (=> b!1499430 m!1382535))

(assert (=> b!1499430 m!1382535))

(declare-fun m!1382537 () Bool)

(assert (=> b!1499430 m!1382537))

(declare-fun m!1382539 () Bool)

(assert (=> b!1499433 m!1382539))

(declare-fun m!1382541 () Bool)

(assert (=> start!127668 m!1382541))

(declare-fun m!1382543 () Bool)

(assert (=> start!127668 m!1382543))

(declare-fun m!1382545 () Bool)

(assert (=> b!1499434 m!1382545))

(assert (=> b!1499434 m!1382545))

(declare-fun m!1382547 () Bool)

(assert (=> b!1499434 m!1382547))

(check-sat (not b!1499433) (not b!1499434) (not b!1499430) (not start!127668))
(check-sat)
(get-model)

(declare-fun d!157915 () Bool)

(declare-fun res!1019494 () Bool)

(declare-fun e!839769 () Bool)

(assert (=> d!157915 (=> res!1019494 e!839769)))

(assert (=> d!157915 (= res!1019494 (bvsge #b00000000000000000000000000000000 (size!48795 a!2850)))))

(assert (=> d!157915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!839769)))

(declare-fun b!1499473 () Bool)

(declare-fun e!839767 () Bool)

(assert (=> b!1499473 (= e!839769 e!839767)))

(declare-fun c!139534 () Bool)

(assert (=> b!1499473 (= c!139534 (validKeyInArray!0 (select (arr!48244 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1499474 () Bool)

(declare-fun e!839768 () Bool)

(declare-fun call!68136 () Bool)

(assert (=> b!1499474 (= e!839768 call!68136)))

(declare-fun b!1499475 () Bool)

(assert (=> b!1499475 (= e!839767 call!68136)))

(declare-fun b!1499476 () Bool)

(assert (=> b!1499476 (= e!839767 e!839768)))

(declare-fun lt!653160 () (_ BitVec 64))

(assert (=> b!1499476 (= lt!653160 (select (arr!48244 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50123 0))(
  ( (Unit!50124) )
))
(declare-fun lt!653158 () Unit!50123)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99969 (_ BitVec 64) (_ BitVec 32)) Unit!50123)

(assert (=> b!1499476 (= lt!653158 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653160 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1499476 (arrayContainsKey!0 a!2850 lt!653160 #b00000000000000000000000000000000)))

(declare-fun lt!653159 () Unit!50123)

(assert (=> b!1499476 (= lt!653159 lt!653158)))

(declare-fun res!1019495 () Bool)

(declare-datatypes ((SeekEntryResult!12375 0))(
  ( (MissingZero!12375 (index!51892 (_ BitVec 32))) (Found!12375 (index!51893 (_ BitVec 32))) (Intermediate!12375 (undefined!13187 Bool) (index!51894 (_ BitVec 32)) (x!133715 (_ BitVec 32))) (Undefined!12375) (MissingVacant!12375 (index!51895 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99969 (_ BitVec 32)) SeekEntryResult!12375)

(assert (=> b!1499476 (= res!1019495 (= (seekEntryOrOpen!0 (select (arr!48244 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12375 #b00000000000000000000000000000000)))))

(assert (=> b!1499476 (=> (not res!1019495) (not e!839768))))

(declare-fun bm!68133 () Bool)

(assert (=> bm!68133 (= call!68136 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157915 (not res!1019494)) b!1499473))

(assert (= (and b!1499473 c!139534) b!1499476))

(assert (= (and b!1499473 (not c!139534)) b!1499475))

(assert (= (and b!1499476 res!1019495) b!1499474))

(assert (= (or b!1499474 b!1499475) bm!68133))

(declare-fun m!1382577 () Bool)

(assert (=> b!1499473 m!1382577))

(assert (=> b!1499473 m!1382577))

(declare-fun m!1382579 () Bool)

(assert (=> b!1499473 m!1382579))

(assert (=> b!1499476 m!1382577))

(declare-fun m!1382581 () Bool)

(assert (=> b!1499476 m!1382581))

(declare-fun m!1382583 () Bool)

(assert (=> b!1499476 m!1382583))

(assert (=> b!1499476 m!1382577))

(declare-fun m!1382585 () Bool)

(assert (=> b!1499476 m!1382585))

(declare-fun m!1382587 () Bool)

(assert (=> bm!68133 m!1382587))

(assert (=> b!1499433 d!157915))

(declare-fun d!157921 () Bool)

(assert (=> d!157921 (= (validKeyInArray!0 (select (arr!48244 a!2850) i!996)) (and (not (= (select (arr!48244 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48244 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1499434 d!157921))

(declare-fun d!157923 () Bool)

(assert (=> d!157923 (= (validKeyInArray!0 (select (arr!48244 a!2850) j!87)) (and (not (= (select (arr!48244 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48244 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1499430 d!157923))

(declare-fun d!157925 () Bool)

(assert (=> d!157925 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127668 d!157925))

(declare-fun d!157935 () Bool)

(assert (=> d!157935 (= (array_inv!37525 a!2850) (bvsge (size!48795 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127668 d!157935))

(check-sat (not b!1499476) (not bm!68133) (not b!1499473))
(check-sat)
