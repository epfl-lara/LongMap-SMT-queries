; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127394 () Bool)

(assert start!127394)

(declare-fun b!1497721 () Bool)

(declare-fun res!1018851 () Bool)

(declare-fun e!838681 () Bool)

(assert (=> b!1497721 (=> (not res!1018851) (not e!838681))))

(declare-datatypes ((array!99856 0))(
  ( (array!99857 (arr!48192 (Array (_ BitVec 32) (_ BitVec 64))) (size!48742 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99856)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497721 (= res!1018851 (validKeyInArray!0 (select (arr!48192 a!2850) j!87)))))

(declare-fun res!1018852 () Bool)

(assert (=> start!127394 (=> (not res!1018852) (not e!838681))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127394 (= res!1018852 (validMask!0 mask!2661))))

(assert (=> start!127394 e!838681))

(assert (=> start!127394 true))

(declare-fun array_inv!37220 (array!99856) Bool)

(assert (=> start!127394 (array_inv!37220 a!2850)))

(declare-fun b!1497722 () Bool)

(declare-fun res!1018853 () Bool)

(assert (=> b!1497722 (=> (not res!1018853) (not e!838681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99856 (_ BitVec 32)) Bool)

(assert (=> b!1497722 (= res!1018853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497723 () Bool)

(declare-fun res!1018854 () Bool)

(assert (=> b!1497723 (=> (not res!1018854) (not e!838681))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497723 (= res!1018854 (validKeyInArray!0 (select (arr!48192 a!2850) i!996)))))

(declare-fun b!1497724 () Bool)

(declare-fun res!1018855 () Bool)

(assert (=> b!1497724 (=> (not res!1018855) (not e!838681))))

(assert (=> b!1497724 (= res!1018855 (and (= (size!48742 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48742 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48742 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497725 () Bool)

(assert (=> b!1497725 (= e!838681 (and (bvsle #b00000000000000000000000000000000 (size!48742 a!2850)) (bvsge (size!48742 a!2850) #b01111111111111111111111111111111)))))

(assert (= (and start!127394 res!1018852) b!1497724))

(assert (= (and b!1497724 res!1018855) b!1497723))

(assert (= (and b!1497723 res!1018854) b!1497721))

(assert (= (and b!1497721 res!1018851) b!1497722))

(assert (= (and b!1497722 res!1018853) b!1497725))

(declare-fun m!1380807 () Bool)

(assert (=> b!1497721 m!1380807))

(assert (=> b!1497721 m!1380807))

(declare-fun m!1380809 () Bool)

(assert (=> b!1497721 m!1380809))

(declare-fun m!1380811 () Bool)

(assert (=> start!127394 m!1380811))

(declare-fun m!1380813 () Bool)

(assert (=> start!127394 m!1380813))

(declare-fun m!1380815 () Bool)

(assert (=> b!1497722 m!1380815))

(declare-fun m!1380817 () Bool)

(assert (=> b!1497723 m!1380817))

(assert (=> b!1497723 m!1380817))

(declare-fun m!1380819 () Bool)

(assert (=> b!1497723 m!1380819))

(check-sat (not b!1497723) (not b!1497722) (not b!1497721) (not start!127394))
(check-sat)
(get-model)

(declare-fun d!157429 () Bool)

(assert (=> d!157429 (= (validKeyInArray!0 (select (arr!48192 a!2850) i!996)) (and (not (= (select (arr!48192 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48192 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497723 d!157429))

(declare-fun d!157431 () Bool)

(declare-fun res!1018876 () Bool)

(declare-fun e!838695 () Bool)

(assert (=> d!157431 (=> res!1018876 e!838695)))

(assert (=> d!157431 (= res!1018876 (bvsge #b00000000000000000000000000000000 (size!48742 a!2850)))))

(assert (=> d!157431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838695)))

(declare-fun bm!68040 () Bool)

(declare-fun call!68043 () Bool)

(assert (=> bm!68040 (= call!68043 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497749 () Bool)

(declare-fun e!838696 () Bool)

(assert (=> b!1497749 (= e!838695 e!838696)))

(declare-fun c!138971 () Bool)

(assert (=> b!1497749 (= c!138971 (validKeyInArray!0 (select (arr!48192 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1497750 () Bool)

(declare-fun e!838694 () Bool)

(assert (=> b!1497750 (= e!838694 call!68043)))

(declare-fun b!1497751 () Bool)

(assert (=> b!1497751 (= e!838696 call!68043)))

(declare-fun b!1497752 () Bool)

(assert (=> b!1497752 (= e!838696 e!838694)))

(declare-fun lt!652512 () (_ BitVec 64))

(assert (=> b!1497752 (= lt!652512 (select (arr!48192 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50192 0))(
  ( (Unit!50193) )
))
(declare-fun lt!652513 () Unit!50192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99856 (_ BitVec 64) (_ BitVec 32)) Unit!50192)

(assert (=> b!1497752 (= lt!652513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652512 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497752 (arrayContainsKey!0 a!2850 lt!652512 #b00000000000000000000000000000000)))

(declare-fun lt!652511 () Unit!50192)

(assert (=> b!1497752 (= lt!652511 lt!652513)))

(declare-fun res!1018875 () Bool)

(declare-datatypes ((SeekEntryResult!12426 0))(
  ( (MissingZero!12426 (index!52096 (_ BitVec 32))) (Found!12426 (index!52097 (_ BitVec 32))) (Intermediate!12426 (undefined!13238 Bool) (index!52098 (_ BitVec 32)) (x!133732 (_ BitVec 32))) (Undefined!12426) (MissingVacant!12426 (index!52099 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99856 (_ BitVec 32)) SeekEntryResult!12426)

(assert (=> b!1497752 (= res!1018875 (= (seekEntryOrOpen!0 (select (arr!48192 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12426 #b00000000000000000000000000000000)))))

(assert (=> b!1497752 (=> (not res!1018875) (not e!838694))))

(assert (= (and d!157431 (not res!1018876)) b!1497749))

(assert (= (and b!1497749 c!138971) b!1497752))

(assert (= (and b!1497749 (not c!138971)) b!1497751))

(assert (= (and b!1497752 res!1018875) b!1497750))

(assert (= (or b!1497750 b!1497751) bm!68040))

(declare-fun m!1380835 () Bool)

(assert (=> bm!68040 m!1380835))

(declare-fun m!1380837 () Bool)

(assert (=> b!1497749 m!1380837))

(assert (=> b!1497749 m!1380837))

(declare-fun m!1380839 () Bool)

(assert (=> b!1497749 m!1380839))

(assert (=> b!1497752 m!1380837))

(declare-fun m!1380841 () Bool)

(assert (=> b!1497752 m!1380841))

(declare-fun m!1380843 () Bool)

(assert (=> b!1497752 m!1380843))

(assert (=> b!1497752 m!1380837))

(declare-fun m!1380845 () Bool)

(assert (=> b!1497752 m!1380845))

(assert (=> b!1497722 d!157431))

(declare-fun d!157437 () Bool)

(assert (=> d!157437 (= (validKeyInArray!0 (select (arr!48192 a!2850) j!87)) (and (not (= (select (arr!48192 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48192 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497721 d!157437))

(declare-fun d!157439 () Bool)

(assert (=> d!157439 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127394 d!157439))

(declare-fun d!157453 () Bool)

(assert (=> d!157453 (= (array_inv!37220 a!2850) (bvsge (size!48742 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127394 d!157453))

(check-sat (not b!1497752) (not bm!68040) (not b!1497749))
(check-sat)
