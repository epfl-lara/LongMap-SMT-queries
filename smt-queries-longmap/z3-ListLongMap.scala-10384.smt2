; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122246 () Bool)

(assert start!122246)

(declare-fun b!1417778 () Bool)

(declare-fun res!953545 () Bool)

(declare-fun e!802361 () Bool)

(assert (=> b!1417778 (=> (not res!953545) (not e!802361))))

(declare-datatypes ((array!96762 0))(
  ( (array!96763 (arr!46708 (Array (_ BitVec 32) (_ BitVec 64))) (size!47260 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96762)

(assert (=> b!1417778 (= res!953545 (and (bvsle #b00000000000000000000000000000000 (size!47260 a!2831)) (bvslt (size!47260 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417779 () Bool)

(declare-fun res!953540 () Bool)

(assert (=> b!1417779 (=> (not res!953540) (not e!802361))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417779 (= res!953540 (validKeyInArray!0 (select (arr!46708 a!2831) i!982)))))

(declare-fun b!1417780 () Bool)

(declare-datatypes ((List!33296 0))(
  ( (Nil!33293) (Cons!33292 (h!34585 (_ BitVec 64)) (t!47982 List!33296)) )
))
(declare-fun noDuplicate!2628 (List!33296) Bool)

(assert (=> b!1417780 (= e!802361 (not (noDuplicate!2628 Nil!33293)))))

(declare-fun b!1417781 () Bool)

(declare-fun res!953543 () Bool)

(assert (=> b!1417781 (=> (not res!953543) (not e!802361))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96762 (_ BitVec 32)) Bool)

(assert (=> b!1417781 (= res!953543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417782 () Bool)

(declare-fun res!953544 () Bool)

(assert (=> b!1417782 (=> (not res!953544) (not e!802361))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1417782 (= res!953544 (and (= (size!47260 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47260 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47260 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417777 () Bool)

(declare-fun res!953541 () Bool)

(assert (=> b!1417777 (=> (not res!953541) (not e!802361))))

(assert (=> b!1417777 (= res!953541 (validKeyInArray!0 (select (arr!46708 a!2831) j!81)))))

(declare-fun res!953542 () Bool)

(assert (=> start!122246 (=> (not res!953542) (not e!802361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122246 (= res!953542 (validMask!0 mask!2608))))

(assert (=> start!122246 e!802361))

(assert (=> start!122246 true))

(declare-fun array_inv!35941 (array!96762) Bool)

(assert (=> start!122246 (array_inv!35941 a!2831)))

(assert (= (and start!122246 res!953542) b!1417782))

(assert (= (and b!1417782 res!953544) b!1417779))

(assert (= (and b!1417779 res!953540) b!1417777))

(assert (= (and b!1417777 res!953541) b!1417781))

(assert (= (and b!1417781 res!953543) b!1417778))

(assert (= (and b!1417778 res!953545) b!1417780))

(declare-fun m!1308097 () Bool)

(assert (=> b!1417780 m!1308097))

(declare-fun m!1308099 () Bool)

(assert (=> b!1417779 m!1308099))

(assert (=> b!1417779 m!1308099))

(declare-fun m!1308101 () Bool)

(assert (=> b!1417779 m!1308101))

(declare-fun m!1308103 () Bool)

(assert (=> start!122246 m!1308103))

(declare-fun m!1308105 () Bool)

(assert (=> start!122246 m!1308105))

(declare-fun m!1308107 () Bool)

(assert (=> b!1417777 m!1308107))

(assert (=> b!1417777 m!1308107))

(declare-fun m!1308109 () Bool)

(assert (=> b!1417777 m!1308109))

(declare-fun m!1308111 () Bool)

(assert (=> b!1417781 m!1308111))

(check-sat (not b!1417780) (not b!1417779) (not start!122246) (not b!1417781) (not b!1417777))
(check-sat)
(get-model)

(declare-fun d!152619 () Bool)

(assert (=> d!152619 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122246 d!152619))

(declare-fun d!152625 () Bool)

(assert (=> d!152625 (= (array_inv!35941 a!2831) (bvsge (size!47260 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122246 d!152625))

(declare-fun d!152627 () Bool)

(assert (=> d!152627 (= (validKeyInArray!0 (select (arr!46708 a!2831) j!81)) (and (not (= (select (arr!46708 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46708 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417777 d!152627))

(declare-fun d!152629 () Bool)

(declare-fun res!953596 () Bool)

(declare-fun e!802393 () Bool)

(assert (=> d!152629 (=> res!953596 e!802393)))

(get-info :version)

(assert (=> d!152629 (= res!953596 ((_ is Nil!33293) Nil!33293))))

(assert (=> d!152629 (= (noDuplicate!2628 Nil!33293) e!802393)))

(declare-fun b!1417843 () Bool)

(declare-fun e!802394 () Bool)

(assert (=> b!1417843 (= e!802393 e!802394)))

(declare-fun res!953597 () Bool)

(assert (=> b!1417843 (=> (not res!953597) (not e!802394))))

(declare-fun contains!9795 (List!33296 (_ BitVec 64)) Bool)

(assert (=> b!1417843 (= res!953597 (not (contains!9795 (t!47982 Nil!33293) (h!34585 Nil!33293))))))

(declare-fun b!1417844 () Bool)

(assert (=> b!1417844 (= e!802394 (noDuplicate!2628 (t!47982 Nil!33293)))))

(assert (= (and d!152629 (not res!953596)) b!1417843))

(assert (= (and b!1417843 res!953597) b!1417844))

(declare-fun m!1308157 () Bool)

(assert (=> b!1417843 m!1308157))

(declare-fun m!1308159 () Bool)

(assert (=> b!1417844 m!1308159))

(assert (=> b!1417780 d!152629))

(declare-fun bm!67217 () Bool)

(declare-fun call!67220 () Bool)

(assert (=> bm!67217 (= call!67220 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!152633 () Bool)

(declare-fun res!953616 () Bool)

(declare-fun e!802417 () Bool)

(assert (=> d!152633 (=> res!953616 e!802417)))

(assert (=> d!152633 (= res!953616 (bvsge #b00000000000000000000000000000000 (size!47260 a!2831)))))

(assert (=> d!152633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802417)))

(declare-fun b!1417869 () Bool)

(declare-fun e!802418 () Bool)

(assert (=> b!1417869 (= e!802417 e!802418)))

(declare-fun c!131611 () Bool)

(assert (=> b!1417869 (= c!131611 (validKeyInArray!0 (select (arr!46708 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1417870 () Bool)

(declare-fun e!802416 () Bool)

(assert (=> b!1417870 (= e!802416 call!67220)))

(declare-fun b!1417871 () Bool)

(assert (=> b!1417871 (= e!802418 e!802416)))

(declare-fun lt!625302 () (_ BitVec 64))

(assert (=> b!1417871 (= lt!625302 (select (arr!46708 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47899 0))(
  ( (Unit!47900) )
))
(declare-fun lt!625303 () Unit!47899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96762 (_ BitVec 64) (_ BitVec 32)) Unit!47899)

(assert (=> b!1417871 (= lt!625303 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625302 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417871 (arrayContainsKey!0 a!2831 lt!625302 #b00000000000000000000000000000000)))

(declare-fun lt!625304 () Unit!47899)

(assert (=> b!1417871 (= lt!625304 lt!625303)))

(declare-fun res!953617 () Bool)

(declare-datatypes ((SeekEntryResult!11040 0))(
  ( (MissingZero!11040 (index!46552 (_ BitVec 32))) (Found!11040 (index!46553 (_ BitVec 32))) (Intermediate!11040 (undefined!11852 Bool) (index!46554 (_ BitVec 32)) (x!128160 (_ BitVec 32))) (Undefined!11040) (MissingVacant!11040 (index!46555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96762 (_ BitVec 32)) SeekEntryResult!11040)

(assert (=> b!1417871 (= res!953617 (= (seekEntryOrOpen!0 (select (arr!46708 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11040 #b00000000000000000000000000000000)))))

(assert (=> b!1417871 (=> (not res!953617) (not e!802416))))

(declare-fun b!1417872 () Bool)

(assert (=> b!1417872 (= e!802418 call!67220)))

(assert (= (and d!152633 (not res!953616)) b!1417869))

(assert (= (and b!1417869 c!131611) b!1417871))

(assert (= (and b!1417869 (not c!131611)) b!1417872))

(assert (= (and b!1417871 res!953617) b!1417870))

(assert (= (or b!1417870 b!1417872) bm!67217))

(declare-fun m!1308181 () Bool)

(assert (=> bm!67217 m!1308181))

(declare-fun m!1308183 () Bool)

(assert (=> b!1417869 m!1308183))

(assert (=> b!1417869 m!1308183))

(declare-fun m!1308185 () Bool)

(assert (=> b!1417869 m!1308185))

(assert (=> b!1417871 m!1308183))

(declare-fun m!1308187 () Bool)

(assert (=> b!1417871 m!1308187))

(declare-fun m!1308189 () Bool)

(assert (=> b!1417871 m!1308189))

(assert (=> b!1417871 m!1308183))

(declare-fun m!1308191 () Bool)

(assert (=> b!1417871 m!1308191))

(assert (=> b!1417781 d!152633))

(declare-fun d!152645 () Bool)

(assert (=> d!152645 (= (validKeyInArray!0 (select (arr!46708 a!2831) i!982)) (and (not (= (select (arr!46708 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46708 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417779 d!152645))

(check-sat (not b!1417869) (not bm!67217) (not b!1417844) (not b!1417843) (not b!1417871))
(check-sat)
