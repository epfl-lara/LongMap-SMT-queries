; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123194 () Bool)

(assert start!123194)

(declare-fun e!806587 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97430 0))(
  ( (array!97431 (arr!47029 (Array (_ BitVec 32) (_ BitVec 64))) (size!47580 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97430)

(declare-fun b!1427758 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11210 0))(
  ( (MissingZero!11210 (index!47232 (_ BitVec 32))) (Found!11210 (index!47233 (_ BitVec 32))) (Intermediate!11210 (undefined!12022 Bool) (index!47234 (_ BitVec 32)) (x!129021 (_ BitVec 32))) (Undefined!11210) (MissingVacant!11210 (index!47235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97430 (_ BitVec 32)) SeekEntryResult!11210)

(assert (=> b!1427758 (= e!806587 (not (= (seekEntryOrOpen!0 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) (Found!11210 j!81))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97430 (_ BitVec 32)) Bool)

(assert (=> b!1427758 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48197 0))(
  ( (Unit!48198) )
))
(declare-fun lt!628639 () Unit!48197)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48197)

(assert (=> b!1427758 (= lt!628639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427759 () Bool)

(declare-fun res!962309 () Bool)

(declare-fun e!806586 () Bool)

(assert (=> b!1427759 (=> (not res!962309) (not e!806586))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427759 (= res!962309 (and (= (size!47580 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47580 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47580 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427760 () Bool)

(declare-fun e!806588 () Bool)

(assert (=> b!1427760 (= e!806588 e!806587)))

(declare-fun res!962315 () Bool)

(assert (=> b!1427760 (=> (not res!962315) (not e!806587))))

(declare-fun lt!628636 () SeekEntryResult!11210)

(declare-fun lt!628637 () array!97430)

(declare-fun lt!628640 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97430 (_ BitVec 32)) SeekEntryResult!11210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427760 (= res!962315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628640 mask!2608) lt!628640 lt!628637 mask!2608) lt!628636))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427760 (= lt!628636 (Intermediate!11210 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427760 (= lt!628640 (select (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427760 (= lt!628637 (array!97431 (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47580 a!2831)))))

(declare-fun b!1427761 () Bool)

(declare-fun res!962311 () Bool)

(assert (=> b!1427761 (=> (not res!962311) (not e!806586))))

(declare-datatypes ((List!33526 0))(
  ( (Nil!33523) (Cons!33522 (h!34835 (_ BitVec 64)) (t!48212 List!33526)) )
))
(declare-fun arrayNoDuplicates!0 (array!97430 (_ BitVec 32) List!33526) Bool)

(assert (=> b!1427761 (= res!962311 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33523))))

(declare-fun b!1427762 () Bool)

(declare-fun res!962316 () Bool)

(assert (=> b!1427762 (=> (not res!962316) (not e!806587))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427762 (= res!962316 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427763 () Bool)

(declare-fun res!962308 () Bool)

(assert (=> b!1427763 (=> (not res!962308) (not e!806586))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427763 (= res!962308 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47580 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47580 a!2831))))))

(declare-fun b!1427764 () Bool)

(declare-fun res!962306 () Bool)

(assert (=> b!1427764 (=> (not res!962306) (not e!806586))))

(assert (=> b!1427764 (= res!962306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427765 () Bool)

(declare-fun res!962310 () Bool)

(assert (=> b!1427765 (=> (not res!962310) (not e!806587))))

(declare-fun lt!628638 () SeekEntryResult!11210)

(assert (=> b!1427765 (= res!962310 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!628638))))

(declare-fun b!1427766 () Bool)

(assert (=> b!1427766 (= e!806586 e!806588)))

(declare-fun res!962314 () Bool)

(assert (=> b!1427766 (=> (not res!962314) (not e!806588))))

(assert (=> b!1427766 (= res!962314 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!628638))))

(assert (=> b!1427766 (= lt!628638 (Intermediate!11210 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!962307 () Bool)

(assert (=> start!123194 (=> (not res!962307) (not e!806586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123194 (= res!962307 (validMask!0 mask!2608))))

(assert (=> start!123194 e!806586))

(assert (=> start!123194 true))

(declare-fun array_inv!36310 (array!97430) Bool)

(assert (=> start!123194 (array_inv!36310 a!2831)))

(declare-fun b!1427767 () Bool)

(declare-fun res!962313 () Bool)

(assert (=> b!1427767 (=> (not res!962313) (not e!806586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427767 (= res!962313 (validKeyInArray!0 (select (arr!47029 a!2831) i!982)))))

(declare-fun b!1427768 () Bool)

(declare-fun res!962312 () Bool)

(assert (=> b!1427768 (=> (not res!962312) (not e!806587))))

(assert (=> b!1427768 (= res!962312 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628640 lt!628637 mask!2608) lt!628636))))

(declare-fun b!1427769 () Bool)

(declare-fun res!962317 () Bool)

(assert (=> b!1427769 (=> (not res!962317) (not e!806586))))

(assert (=> b!1427769 (= res!962317 (validKeyInArray!0 (select (arr!47029 a!2831) j!81)))))

(assert (= (and start!123194 res!962307) b!1427759))

(assert (= (and b!1427759 res!962309) b!1427767))

(assert (= (and b!1427767 res!962313) b!1427769))

(assert (= (and b!1427769 res!962317) b!1427764))

(assert (= (and b!1427764 res!962306) b!1427761))

(assert (= (and b!1427761 res!962311) b!1427763))

(assert (= (and b!1427763 res!962308) b!1427766))

(assert (= (and b!1427766 res!962314) b!1427760))

(assert (= (and b!1427760 res!962315) b!1427765))

(assert (= (and b!1427765 res!962310) b!1427768))

(assert (= (and b!1427768 res!962312) b!1427762))

(assert (= (and b!1427762 res!962316) b!1427758))

(declare-fun m!1318485 () Bool)

(assert (=> b!1427764 m!1318485))

(declare-fun m!1318487 () Bool)

(assert (=> b!1427758 m!1318487))

(assert (=> b!1427758 m!1318487))

(declare-fun m!1318489 () Bool)

(assert (=> b!1427758 m!1318489))

(declare-fun m!1318491 () Bool)

(assert (=> b!1427758 m!1318491))

(declare-fun m!1318493 () Bool)

(assert (=> b!1427758 m!1318493))

(assert (=> b!1427765 m!1318487))

(assert (=> b!1427765 m!1318487))

(declare-fun m!1318495 () Bool)

(assert (=> b!1427765 m!1318495))

(declare-fun m!1318497 () Bool)

(assert (=> b!1427761 m!1318497))

(assert (=> b!1427769 m!1318487))

(assert (=> b!1427769 m!1318487))

(declare-fun m!1318499 () Bool)

(assert (=> b!1427769 m!1318499))

(assert (=> b!1427766 m!1318487))

(assert (=> b!1427766 m!1318487))

(declare-fun m!1318501 () Bool)

(assert (=> b!1427766 m!1318501))

(assert (=> b!1427766 m!1318501))

(assert (=> b!1427766 m!1318487))

(declare-fun m!1318503 () Bool)

(assert (=> b!1427766 m!1318503))

(declare-fun m!1318505 () Bool)

(assert (=> b!1427768 m!1318505))

(declare-fun m!1318507 () Bool)

(assert (=> start!123194 m!1318507))

(declare-fun m!1318509 () Bool)

(assert (=> start!123194 m!1318509))

(declare-fun m!1318511 () Bool)

(assert (=> b!1427767 m!1318511))

(assert (=> b!1427767 m!1318511))

(declare-fun m!1318513 () Bool)

(assert (=> b!1427767 m!1318513))

(declare-fun m!1318515 () Bool)

(assert (=> b!1427760 m!1318515))

(assert (=> b!1427760 m!1318515))

(declare-fun m!1318517 () Bool)

(assert (=> b!1427760 m!1318517))

(declare-fun m!1318519 () Bool)

(assert (=> b!1427760 m!1318519))

(declare-fun m!1318521 () Bool)

(assert (=> b!1427760 m!1318521))

(check-sat (not b!1427758) (not b!1427764) (not b!1427768) (not b!1427761) (not b!1427765) (not b!1427766) (not b!1427769) (not b!1427767) (not start!123194) (not b!1427760))
(check-sat)
(get-model)

(declare-fun b!1427850 () Bool)

(declare-fun e!806620 () Bool)

(declare-fun call!67404 () Bool)

(assert (=> b!1427850 (= e!806620 call!67404)))

(declare-fun d!153605 () Bool)

(declare-fun res!962394 () Bool)

(declare-fun e!806621 () Bool)

(assert (=> d!153605 (=> res!962394 e!806621)))

(assert (=> d!153605 (= res!962394 (bvsge #b00000000000000000000000000000000 (size!47580 a!2831)))))

(assert (=> d!153605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806621)))

(declare-fun bm!67401 () Bool)

(assert (=> bm!67401 (= call!67404 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427851 () Bool)

(declare-fun e!806619 () Bool)

(assert (=> b!1427851 (= e!806620 e!806619)))

(declare-fun lt!628678 () (_ BitVec 64))

(assert (=> b!1427851 (= lt!628678 (select (arr!47029 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628677 () Unit!48197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97430 (_ BitVec 64) (_ BitVec 32)) Unit!48197)

(assert (=> b!1427851 (= lt!628677 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628678 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427851 (arrayContainsKey!0 a!2831 lt!628678 #b00000000000000000000000000000000)))

(declare-fun lt!628679 () Unit!48197)

(assert (=> b!1427851 (= lt!628679 lt!628677)))

(declare-fun res!962395 () Bool)

(assert (=> b!1427851 (= res!962395 (= (seekEntryOrOpen!0 (select (arr!47029 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11210 #b00000000000000000000000000000000)))))

(assert (=> b!1427851 (=> (not res!962395) (not e!806619))))

(declare-fun b!1427852 () Bool)

(assert (=> b!1427852 (= e!806621 e!806620)))

(declare-fun c!132223 () Bool)

(assert (=> b!1427852 (= c!132223 (validKeyInArray!0 (select (arr!47029 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427853 () Bool)

(assert (=> b!1427853 (= e!806619 call!67404)))

(assert (= (and d!153605 (not res!962394)) b!1427852))

(assert (= (and b!1427852 c!132223) b!1427851))

(assert (= (and b!1427852 (not c!132223)) b!1427850))

(assert (= (and b!1427851 res!962395) b!1427853))

(assert (= (or b!1427853 b!1427850) bm!67401))

(declare-fun m!1318599 () Bool)

(assert (=> bm!67401 m!1318599))

(declare-fun m!1318601 () Bool)

(assert (=> b!1427851 m!1318601))

(declare-fun m!1318603 () Bool)

(assert (=> b!1427851 m!1318603))

(declare-fun m!1318605 () Bool)

(assert (=> b!1427851 m!1318605))

(assert (=> b!1427851 m!1318601))

(declare-fun m!1318607 () Bool)

(assert (=> b!1427851 m!1318607))

(assert (=> b!1427852 m!1318601))

(assert (=> b!1427852 m!1318601))

(declare-fun m!1318609 () Bool)

(assert (=> b!1427852 m!1318609))

(assert (=> b!1427764 d!153605))

(declare-fun d!153607 () Bool)

(assert (=> d!153607 (= (validKeyInArray!0 (select (arr!47029 a!2831) j!81)) (and (not (= (select (arr!47029 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47029 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427769 d!153607))

(declare-fun b!1427866 () Bool)

(declare-fun e!806628 () SeekEntryResult!11210)

(declare-fun lt!628687 () SeekEntryResult!11210)

(assert (=> b!1427866 (= e!806628 (Found!11210 (index!47234 lt!628687)))))

(declare-fun b!1427867 () Bool)

(declare-fun e!806629 () SeekEntryResult!11210)

(assert (=> b!1427867 (= e!806629 (MissingZero!11210 (index!47234 lt!628687)))))

(declare-fun b!1427868 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97430 (_ BitVec 32)) SeekEntryResult!11210)

(assert (=> b!1427868 (= e!806629 (seekKeyOrZeroReturnVacant!0 (x!129021 lt!628687) (index!47234 lt!628687) (index!47234 lt!628687) (select (arr!47029 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427869 () Bool)

(declare-fun c!132230 () Bool)

(declare-fun lt!628688 () (_ BitVec 64))

(assert (=> b!1427869 (= c!132230 (= lt!628688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427869 (= e!806628 e!806629)))

(declare-fun d!153609 () Bool)

(declare-fun lt!628686 () SeekEntryResult!11210)

(get-info :version)

(assert (=> d!153609 (and (or ((_ is Undefined!11210) lt!628686) (not ((_ is Found!11210) lt!628686)) (and (bvsge (index!47233 lt!628686) #b00000000000000000000000000000000) (bvslt (index!47233 lt!628686) (size!47580 a!2831)))) (or ((_ is Undefined!11210) lt!628686) ((_ is Found!11210) lt!628686) (not ((_ is MissingZero!11210) lt!628686)) (and (bvsge (index!47232 lt!628686) #b00000000000000000000000000000000) (bvslt (index!47232 lt!628686) (size!47580 a!2831)))) (or ((_ is Undefined!11210) lt!628686) ((_ is Found!11210) lt!628686) ((_ is MissingZero!11210) lt!628686) (not ((_ is MissingVacant!11210) lt!628686)) (and (bvsge (index!47235 lt!628686) #b00000000000000000000000000000000) (bvslt (index!47235 lt!628686) (size!47580 a!2831)))) (or ((_ is Undefined!11210) lt!628686) (ite ((_ is Found!11210) lt!628686) (= (select (arr!47029 a!2831) (index!47233 lt!628686)) (select (arr!47029 a!2831) j!81)) (ite ((_ is MissingZero!11210) lt!628686) (= (select (arr!47029 a!2831) (index!47232 lt!628686)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11210) lt!628686) (= (select (arr!47029 a!2831) (index!47235 lt!628686)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!806630 () SeekEntryResult!11210)

(assert (=> d!153609 (= lt!628686 e!806630)))

(declare-fun c!132231 () Bool)

(assert (=> d!153609 (= c!132231 (and ((_ is Intermediate!11210) lt!628687) (undefined!12022 lt!628687)))))

(assert (=> d!153609 (= lt!628687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153609 (validMask!0 mask!2608)))

(assert (=> d!153609 (= (seekEntryOrOpen!0 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!628686)))

(declare-fun b!1427870 () Bool)

(assert (=> b!1427870 (= e!806630 Undefined!11210)))

(declare-fun b!1427871 () Bool)

(assert (=> b!1427871 (= e!806630 e!806628)))

(assert (=> b!1427871 (= lt!628688 (select (arr!47029 a!2831) (index!47234 lt!628687)))))

(declare-fun c!132232 () Bool)

(assert (=> b!1427871 (= c!132232 (= lt!628688 (select (arr!47029 a!2831) j!81)))))

(assert (= (and d!153609 c!132231) b!1427870))

(assert (= (and d!153609 (not c!132231)) b!1427871))

(assert (= (and b!1427871 c!132232) b!1427866))

(assert (= (and b!1427871 (not c!132232)) b!1427869))

(assert (= (and b!1427869 c!132230) b!1427867))

(assert (= (and b!1427869 (not c!132230)) b!1427868))

(assert (=> b!1427868 m!1318487))

(declare-fun m!1318611 () Bool)

(assert (=> b!1427868 m!1318611))

(assert (=> d!153609 m!1318487))

(assert (=> d!153609 m!1318501))

(assert (=> d!153609 m!1318507))

(declare-fun m!1318613 () Bool)

(assert (=> d!153609 m!1318613))

(declare-fun m!1318615 () Bool)

(assert (=> d!153609 m!1318615))

(assert (=> d!153609 m!1318501))

(assert (=> d!153609 m!1318487))

(assert (=> d!153609 m!1318503))

(declare-fun m!1318617 () Bool)

(assert (=> d!153609 m!1318617))

(declare-fun m!1318619 () Bool)

(assert (=> b!1427871 m!1318619))

(assert (=> b!1427758 d!153609))

(declare-fun b!1427872 () Bool)

(declare-fun e!806632 () Bool)

(declare-fun call!67405 () Bool)

(assert (=> b!1427872 (= e!806632 call!67405)))

(declare-fun d!153615 () Bool)

(declare-fun res!962396 () Bool)

(declare-fun e!806633 () Bool)

(assert (=> d!153615 (=> res!962396 e!806633)))

(assert (=> d!153615 (= res!962396 (bvsge j!81 (size!47580 a!2831)))))

(assert (=> d!153615 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806633)))

(declare-fun bm!67402 () Bool)

(assert (=> bm!67402 (= call!67405 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427873 () Bool)

(declare-fun e!806631 () Bool)

(assert (=> b!1427873 (= e!806632 e!806631)))

(declare-fun lt!628690 () (_ BitVec 64))

(assert (=> b!1427873 (= lt!628690 (select (arr!47029 a!2831) j!81))))

(declare-fun lt!628689 () Unit!48197)

(assert (=> b!1427873 (= lt!628689 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628690 j!81))))

(assert (=> b!1427873 (arrayContainsKey!0 a!2831 lt!628690 #b00000000000000000000000000000000)))

(declare-fun lt!628691 () Unit!48197)

(assert (=> b!1427873 (= lt!628691 lt!628689)))

(declare-fun res!962397 () Bool)

(assert (=> b!1427873 (= res!962397 (= (seekEntryOrOpen!0 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) (Found!11210 j!81)))))

(assert (=> b!1427873 (=> (not res!962397) (not e!806631))))

(declare-fun b!1427874 () Bool)

(assert (=> b!1427874 (= e!806633 e!806632)))

(declare-fun c!132233 () Bool)

(assert (=> b!1427874 (= c!132233 (validKeyInArray!0 (select (arr!47029 a!2831) j!81)))))

(declare-fun b!1427875 () Bool)

(assert (=> b!1427875 (= e!806631 call!67405)))

(assert (= (and d!153615 (not res!962396)) b!1427874))

(assert (= (and b!1427874 c!132233) b!1427873))

(assert (= (and b!1427874 (not c!132233)) b!1427872))

(assert (= (and b!1427873 res!962397) b!1427875))

(assert (= (or b!1427875 b!1427872) bm!67402))

(declare-fun m!1318621 () Bool)

(assert (=> bm!67402 m!1318621))

(assert (=> b!1427873 m!1318487))

(declare-fun m!1318623 () Bool)

(assert (=> b!1427873 m!1318623))

(declare-fun m!1318625 () Bool)

(assert (=> b!1427873 m!1318625))

(assert (=> b!1427873 m!1318487))

(assert (=> b!1427873 m!1318489))

(assert (=> b!1427874 m!1318487))

(assert (=> b!1427874 m!1318487))

(assert (=> b!1427874 m!1318499))

(assert (=> b!1427758 d!153615))

(declare-fun d!153617 () Bool)

(assert (=> d!153617 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628694 () Unit!48197)

(declare-fun choose!38 (array!97430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48197)

(assert (=> d!153617 (= lt!628694 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153617 (validMask!0 mask!2608)))

(assert (=> d!153617 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628694)))

(declare-fun bs!41596 () Bool)

(assert (= bs!41596 d!153617))

(assert (=> bs!41596 m!1318491))

(declare-fun m!1318627 () Bool)

(assert (=> bs!41596 m!1318627))

(assert (=> bs!41596 m!1318507))

(assert (=> b!1427758 d!153617))

(declare-fun b!1427927 () Bool)

(declare-fun e!806668 () Bool)

(declare-fun e!806670 () Bool)

(assert (=> b!1427927 (= e!806668 e!806670)))

(declare-fun res!962420 () Bool)

(declare-fun lt!628703 () SeekEntryResult!11210)

(assert (=> b!1427927 (= res!962420 (and ((_ is Intermediate!11210) lt!628703) (not (undefined!12022 lt!628703)) (bvslt (x!129021 lt!628703) #b01111111111111111111111111111110) (bvsge (x!129021 lt!628703) #b00000000000000000000000000000000) (bvsge (x!129021 lt!628703) x!605)))))

(assert (=> b!1427927 (=> (not res!962420) (not e!806670))))

(declare-fun b!1427928 () Bool)

(declare-fun e!806666 () SeekEntryResult!11210)

(assert (=> b!1427928 (= e!806666 (Intermediate!11210 true index!585 x!605))))

(declare-fun d!153619 () Bool)

(assert (=> d!153619 e!806668))

(declare-fun c!132249 () Bool)

(assert (=> d!153619 (= c!132249 (and ((_ is Intermediate!11210) lt!628703) (undefined!12022 lt!628703)))))

(assert (=> d!153619 (= lt!628703 e!806666)))

(declare-fun c!132251 () Bool)

(assert (=> d!153619 (= c!132251 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628704 () (_ BitVec 64))

(assert (=> d!153619 (= lt!628704 (select (arr!47029 lt!628637) index!585))))

(assert (=> d!153619 (validMask!0 mask!2608)))

(assert (=> d!153619 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628640 lt!628637 mask!2608) lt!628703)))

(declare-fun b!1427929 () Bool)

(assert (=> b!1427929 (and (bvsge (index!47234 lt!628703) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628703) (size!47580 lt!628637)))))

(declare-fun res!962419 () Bool)

(assert (=> b!1427929 (= res!962419 (= (select (arr!47029 lt!628637) (index!47234 lt!628703)) lt!628640))))

(declare-fun e!806669 () Bool)

(assert (=> b!1427929 (=> res!962419 e!806669)))

(assert (=> b!1427929 (= e!806670 e!806669)))

(declare-fun b!1427930 () Bool)

(declare-fun e!806667 () SeekEntryResult!11210)

(assert (=> b!1427930 (= e!806667 (Intermediate!11210 false index!585 x!605))))

(declare-fun b!1427931 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427931 (= e!806667 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!628640 lt!628637 mask!2608))))

(declare-fun b!1427932 () Bool)

(assert (=> b!1427932 (= e!806666 e!806667)))

(declare-fun c!132250 () Bool)

(assert (=> b!1427932 (= c!132250 (or (= lt!628704 lt!628640) (= (bvadd lt!628704 lt!628704) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427933 () Bool)

(assert (=> b!1427933 (= e!806668 (bvsge (x!129021 lt!628703) #b01111111111111111111111111111110))))

(declare-fun b!1427934 () Bool)

(assert (=> b!1427934 (and (bvsge (index!47234 lt!628703) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628703) (size!47580 lt!628637)))))

(assert (=> b!1427934 (= e!806669 (= (select (arr!47029 lt!628637) (index!47234 lt!628703)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427935 () Bool)

(assert (=> b!1427935 (and (bvsge (index!47234 lt!628703) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628703) (size!47580 lt!628637)))))

(declare-fun res!962421 () Bool)

(assert (=> b!1427935 (= res!962421 (= (select (arr!47029 lt!628637) (index!47234 lt!628703)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427935 (=> res!962421 e!806669)))

(assert (= (and d!153619 c!132251) b!1427928))

(assert (= (and d!153619 (not c!132251)) b!1427932))

(assert (= (and b!1427932 c!132250) b!1427930))

(assert (= (and b!1427932 (not c!132250)) b!1427931))

(assert (= (and d!153619 c!132249) b!1427933))

(assert (= (and d!153619 (not c!132249)) b!1427927))

(assert (= (and b!1427927 res!962420) b!1427929))

(assert (= (and b!1427929 (not res!962419)) b!1427935))

(assert (= (and b!1427935 (not res!962421)) b!1427934))

(declare-fun m!1318637 () Bool)

(assert (=> b!1427935 m!1318637))

(assert (=> b!1427929 m!1318637))

(declare-fun m!1318639 () Bool)

(assert (=> d!153619 m!1318639))

(assert (=> d!153619 m!1318507))

(assert (=> b!1427934 m!1318637))

(declare-fun m!1318641 () Bool)

(assert (=> b!1427931 m!1318641))

(assert (=> b!1427931 m!1318641))

(declare-fun m!1318643 () Bool)

(assert (=> b!1427931 m!1318643))

(assert (=> b!1427768 d!153619))

(declare-fun d!153623 () Bool)

(assert (=> d!153623 (= (validKeyInArray!0 (select (arr!47029 a!2831) i!982)) (and (not (= (select (arr!47029 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47029 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427767 d!153623))

(declare-fun b!1427955 () Bool)

(declare-fun e!806684 () Bool)

(declare-fun call!67411 () Bool)

(assert (=> b!1427955 (= e!806684 call!67411)))

(declare-fun b!1427956 () Bool)

(declare-fun e!806686 () Bool)

(declare-fun contains!9892 (List!33526 (_ BitVec 64)) Bool)

(assert (=> b!1427956 (= e!806686 (contains!9892 Nil!33523 (select (arr!47029 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427957 () Bool)

(declare-fun e!806685 () Bool)

(assert (=> b!1427957 (= e!806685 e!806684)))

(declare-fun c!132257 () Bool)

(assert (=> b!1427957 (= c!132257 (validKeyInArray!0 (select (arr!47029 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427958 () Bool)

(assert (=> b!1427958 (= e!806684 call!67411)))

(declare-fun bm!67408 () Bool)

(assert (=> bm!67408 (= call!67411 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132257 (Cons!33522 (select (arr!47029 a!2831) #b00000000000000000000000000000000) Nil!33523) Nil!33523)))))

(declare-fun d!153625 () Bool)

(declare-fun res!962433 () Bool)

(declare-fun e!806687 () Bool)

(assert (=> d!153625 (=> res!962433 e!806687)))

(assert (=> d!153625 (= res!962433 (bvsge #b00000000000000000000000000000000 (size!47580 a!2831)))))

(assert (=> d!153625 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33523) e!806687)))

(declare-fun b!1427959 () Bool)

(assert (=> b!1427959 (= e!806687 e!806685)))

(declare-fun res!962434 () Bool)

(assert (=> b!1427959 (=> (not res!962434) (not e!806685))))

(assert (=> b!1427959 (= res!962434 (not e!806686))))

(declare-fun res!962432 () Bool)

(assert (=> b!1427959 (=> (not res!962432) (not e!806686))))

(assert (=> b!1427959 (= res!962432 (validKeyInArray!0 (select (arr!47029 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153625 (not res!962433)) b!1427959))

(assert (= (and b!1427959 res!962432) b!1427956))

(assert (= (and b!1427959 res!962434) b!1427957))

(assert (= (and b!1427957 c!132257) b!1427958))

(assert (= (and b!1427957 (not c!132257)) b!1427955))

(assert (= (or b!1427958 b!1427955) bm!67408))

(assert (=> b!1427956 m!1318601))

(assert (=> b!1427956 m!1318601))

(declare-fun m!1318653 () Bool)

(assert (=> b!1427956 m!1318653))

(assert (=> b!1427957 m!1318601))

(assert (=> b!1427957 m!1318601))

(assert (=> b!1427957 m!1318609))

(assert (=> bm!67408 m!1318601))

(declare-fun m!1318655 () Bool)

(assert (=> bm!67408 m!1318655))

(assert (=> b!1427959 m!1318601))

(assert (=> b!1427959 m!1318601))

(assert (=> b!1427959 m!1318609))

(assert (=> b!1427761 d!153625))

(declare-fun d!153629 () Bool)

(assert (=> d!153629 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123194 d!153629))

(declare-fun d!153633 () Bool)

(assert (=> d!153633 (= (array_inv!36310 a!2831) (bvsge (size!47580 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123194 d!153633))

(declare-fun b!1427978 () Bool)

(declare-fun e!806700 () Bool)

(declare-fun e!806702 () Bool)

(assert (=> b!1427978 (= e!806700 e!806702)))

(declare-fun res!962442 () Bool)

(declare-fun lt!628717 () SeekEntryResult!11210)

(assert (=> b!1427978 (= res!962442 (and ((_ is Intermediate!11210) lt!628717) (not (undefined!12022 lt!628717)) (bvslt (x!129021 lt!628717) #b01111111111111111111111111111110) (bvsge (x!129021 lt!628717) #b00000000000000000000000000000000) (bvsge (x!129021 lt!628717) #b00000000000000000000000000000000)))))

(assert (=> b!1427978 (=> (not res!962442) (not e!806702))))

(declare-fun e!806698 () SeekEntryResult!11210)

(declare-fun b!1427979 () Bool)

(assert (=> b!1427979 (= e!806698 (Intermediate!11210 true (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153635 () Bool)

(assert (=> d!153635 e!806700))

(declare-fun c!132264 () Bool)

(assert (=> d!153635 (= c!132264 (and ((_ is Intermediate!11210) lt!628717) (undefined!12022 lt!628717)))))

(assert (=> d!153635 (= lt!628717 e!806698)))

(declare-fun c!132266 () Bool)

(assert (=> d!153635 (= c!132266 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628718 () (_ BitVec 64))

(assert (=> d!153635 (= lt!628718 (select (arr!47029 a!2831) (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608)))))

(assert (=> d!153635 (validMask!0 mask!2608)))

(assert (=> d!153635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!628717)))

(declare-fun b!1427980 () Bool)

(assert (=> b!1427980 (and (bvsge (index!47234 lt!628717) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628717) (size!47580 a!2831)))))

(declare-fun res!962441 () Bool)

(assert (=> b!1427980 (= res!962441 (= (select (arr!47029 a!2831) (index!47234 lt!628717)) (select (arr!47029 a!2831) j!81)))))

(declare-fun e!806701 () Bool)

(assert (=> b!1427980 (=> res!962441 e!806701)))

(assert (=> b!1427980 (= e!806702 e!806701)))

(declare-fun e!806699 () SeekEntryResult!11210)

(declare-fun b!1427981 () Bool)

(assert (=> b!1427981 (= e!806699 (Intermediate!11210 false (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427982 () Bool)

(assert (=> b!1427982 (= e!806699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427983 () Bool)

(assert (=> b!1427983 (= e!806698 e!806699)))

(declare-fun c!132265 () Bool)

(assert (=> b!1427983 (= c!132265 (or (= lt!628718 (select (arr!47029 a!2831) j!81)) (= (bvadd lt!628718 lt!628718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427984 () Bool)

(assert (=> b!1427984 (= e!806700 (bvsge (x!129021 lt!628717) #b01111111111111111111111111111110))))

(declare-fun b!1427985 () Bool)

(assert (=> b!1427985 (and (bvsge (index!47234 lt!628717) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628717) (size!47580 a!2831)))))

(assert (=> b!1427985 (= e!806701 (= (select (arr!47029 a!2831) (index!47234 lt!628717)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427986 () Bool)

(assert (=> b!1427986 (and (bvsge (index!47234 lt!628717) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628717) (size!47580 a!2831)))))

(declare-fun res!962443 () Bool)

(assert (=> b!1427986 (= res!962443 (= (select (arr!47029 a!2831) (index!47234 lt!628717)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427986 (=> res!962443 e!806701)))

(assert (= (and d!153635 c!132266) b!1427979))

(assert (= (and d!153635 (not c!132266)) b!1427983))

(assert (= (and b!1427983 c!132265) b!1427981))

(assert (= (and b!1427983 (not c!132265)) b!1427982))

(assert (= (and d!153635 c!132264) b!1427984))

(assert (= (and d!153635 (not c!132264)) b!1427978))

(assert (= (and b!1427978 res!962442) b!1427980))

(assert (= (and b!1427980 (not res!962441)) b!1427986))

(assert (= (and b!1427986 (not res!962443)) b!1427985))

(declare-fun m!1318657 () Bool)

(assert (=> b!1427986 m!1318657))

(assert (=> b!1427980 m!1318657))

(assert (=> d!153635 m!1318501))

(declare-fun m!1318659 () Bool)

(assert (=> d!153635 m!1318659))

(assert (=> d!153635 m!1318507))

(assert (=> b!1427985 m!1318657))

(assert (=> b!1427982 m!1318501))

(declare-fun m!1318661 () Bool)

(assert (=> b!1427982 m!1318661))

(assert (=> b!1427982 m!1318661))

(assert (=> b!1427982 m!1318487))

(declare-fun m!1318663 () Bool)

(assert (=> b!1427982 m!1318663))

(assert (=> b!1427766 d!153635))

(declare-fun d!153637 () Bool)

(declare-fun lt!628728 () (_ BitVec 32))

(declare-fun lt!628727 () (_ BitVec 32))

(assert (=> d!153637 (= lt!628728 (bvmul (bvxor lt!628727 (bvlshr lt!628727 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153637 (= lt!628727 ((_ extract 31 0) (bvand (bvxor (select (arr!47029 a!2831) j!81) (bvlshr (select (arr!47029 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153637 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962447 (let ((h!34839 ((_ extract 31 0) (bvand (bvxor (select (arr!47029 a!2831) j!81) (bvlshr (select (arr!47029 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129028 (bvmul (bvxor h!34839 (bvlshr h!34839 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129028 (bvlshr x!129028 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962447 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962447 #b00000000000000000000000000000000))))))

(assert (=> d!153637 (= (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (bvand (bvxor lt!628728 (bvlshr lt!628728 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427766 d!153637))

(declare-fun b!1428005 () Bool)

(declare-fun e!806715 () Bool)

(declare-fun e!806717 () Bool)

(assert (=> b!1428005 (= e!806715 e!806717)))

(declare-fun res!962453 () Bool)

(declare-fun lt!628729 () SeekEntryResult!11210)

(assert (=> b!1428005 (= res!962453 (and ((_ is Intermediate!11210) lt!628729) (not (undefined!12022 lt!628729)) (bvslt (x!129021 lt!628729) #b01111111111111111111111111111110) (bvsge (x!129021 lt!628729) #b00000000000000000000000000000000) (bvsge (x!129021 lt!628729) #b00000000000000000000000000000000)))))

(assert (=> b!1428005 (=> (not res!962453) (not e!806717))))

(declare-fun b!1428006 () Bool)

(declare-fun e!806713 () SeekEntryResult!11210)

(assert (=> b!1428006 (= e!806713 (Intermediate!11210 true (toIndex!0 lt!628640 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153643 () Bool)

(assert (=> d!153643 e!806715))

(declare-fun c!132273 () Bool)

(assert (=> d!153643 (= c!132273 (and ((_ is Intermediate!11210) lt!628729) (undefined!12022 lt!628729)))))

(assert (=> d!153643 (= lt!628729 e!806713)))

(declare-fun c!132275 () Bool)

(assert (=> d!153643 (= c!132275 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628730 () (_ BitVec 64))

(assert (=> d!153643 (= lt!628730 (select (arr!47029 lt!628637) (toIndex!0 lt!628640 mask!2608)))))

(assert (=> d!153643 (validMask!0 mask!2608)))

(assert (=> d!153643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628640 mask!2608) lt!628640 lt!628637 mask!2608) lt!628729)))

(declare-fun b!1428007 () Bool)

(assert (=> b!1428007 (and (bvsge (index!47234 lt!628729) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628729) (size!47580 lt!628637)))))

(declare-fun res!962452 () Bool)

(assert (=> b!1428007 (= res!962452 (= (select (arr!47029 lt!628637) (index!47234 lt!628729)) lt!628640))))

(declare-fun e!806716 () Bool)

(assert (=> b!1428007 (=> res!962452 e!806716)))

(assert (=> b!1428007 (= e!806717 e!806716)))

(declare-fun b!1428008 () Bool)

(declare-fun e!806714 () SeekEntryResult!11210)

(assert (=> b!1428008 (= e!806714 (Intermediate!11210 false (toIndex!0 lt!628640 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428009 () Bool)

(assert (=> b!1428009 (= e!806714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628640 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!628640 lt!628637 mask!2608))))

(declare-fun b!1428010 () Bool)

(assert (=> b!1428010 (= e!806713 e!806714)))

(declare-fun c!132274 () Bool)

(assert (=> b!1428010 (= c!132274 (or (= lt!628730 lt!628640) (= (bvadd lt!628730 lt!628730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428011 () Bool)

(assert (=> b!1428011 (= e!806715 (bvsge (x!129021 lt!628729) #b01111111111111111111111111111110))))

(declare-fun b!1428012 () Bool)

(assert (=> b!1428012 (and (bvsge (index!47234 lt!628729) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628729) (size!47580 lt!628637)))))

(assert (=> b!1428012 (= e!806716 (= (select (arr!47029 lt!628637) (index!47234 lt!628729)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428013 () Bool)

(assert (=> b!1428013 (and (bvsge (index!47234 lt!628729) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628729) (size!47580 lt!628637)))))

(declare-fun res!962454 () Bool)

(assert (=> b!1428013 (= res!962454 (= (select (arr!47029 lt!628637) (index!47234 lt!628729)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428013 (=> res!962454 e!806716)))

(assert (= (and d!153643 c!132275) b!1428006))

(assert (= (and d!153643 (not c!132275)) b!1428010))

(assert (= (and b!1428010 c!132274) b!1428008))

(assert (= (and b!1428010 (not c!132274)) b!1428009))

(assert (= (and d!153643 c!132273) b!1428011))

(assert (= (and d!153643 (not c!132273)) b!1428005))

(assert (= (and b!1428005 res!962453) b!1428007))

(assert (= (and b!1428007 (not res!962452)) b!1428013))

(assert (= (and b!1428013 (not res!962454)) b!1428012))

(declare-fun m!1318681 () Bool)

(assert (=> b!1428013 m!1318681))

(assert (=> b!1428007 m!1318681))

(assert (=> d!153643 m!1318515))

(declare-fun m!1318683 () Bool)

(assert (=> d!153643 m!1318683))

(assert (=> d!153643 m!1318507))

(assert (=> b!1428012 m!1318681))

(assert (=> b!1428009 m!1318515))

(declare-fun m!1318685 () Bool)

(assert (=> b!1428009 m!1318685))

(assert (=> b!1428009 m!1318685))

(declare-fun m!1318687 () Bool)

(assert (=> b!1428009 m!1318687))

(assert (=> b!1427760 d!153643))

(declare-fun d!153645 () Bool)

(declare-fun lt!628732 () (_ BitVec 32))

(declare-fun lt!628731 () (_ BitVec 32))

(assert (=> d!153645 (= lt!628732 (bvmul (bvxor lt!628731 (bvlshr lt!628731 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153645 (= lt!628731 ((_ extract 31 0) (bvand (bvxor lt!628640 (bvlshr lt!628640 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153645 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962447 (let ((h!34839 ((_ extract 31 0) (bvand (bvxor lt!628640 (bvlshr lt!628640 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129028 (bvmul (bvxor h!34839 (bvlshr h!34839 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129028 (bvlshr x!129028 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962447 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962447 #b00000000000000000000000000000000))))))

(assert (=> d!153645 (= (toIndex!0 lt!628640 mask!2608) (bvand (bvxor lt!628732 (bvlshr lt!628732 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427760 d!153645))

(declare-fun b!1428014 () Bool)

(declare-fun e!806720 () Bool)

(declare-fun e!806722 () Bool)

(assert (=> b!1428014 (= e!806720 e!806722)))

(declare-fun res!962456 () Bool)

(declare-fun lt!628733 () SeekEntryResult!11210)

(assert (=> b!1428014 (= res!962456 (and ((_ is Intermediate!11210) lt!628733) (not (undefined!12022 lt!628733)) (bvslt (x!129021 lt!628733) #b01111111111111111111111111111110) (bvsge (x!129021 lt!628733) #b00000000000000000000000000000000) (bvsge (x!129021 lt!628733) x!605)))))

(assert (=> b!1428014 (=> (not res!962456) (not e!806722))))

(declare-fun b!1428015 () Bool)

(declare-fun e!806718 () SeekEntryResult!11210)

(assert (=> b!1428015 (= e!806718 (Intermediate!11210 true index!585 x!605))))

(declare-fun d!153647 () Bool)

(assert (=> d!153647 e!806720))

(declare-fun c!132276 () Bool)

(assert (=> d!153647 (= c!132276 (and ((_ is Intermediate!11210) lt!628733) (undefined!12022 lt!628733)))))

(assert (=> d!153647 (= lt!628733 e!806718)))

(declare-fun c!132278 () Bool)

(assert (=> d!153647 (= c!132278 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628734 () (_ BitVec 64))

(assert (=> d!153647 (= lt!628734 (select (arr!47029 a!2831) index!585))))

(assert (=> d!153647 (validMask!0 mask!2608)))

(assert (=> d!153647 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!628733)))

(declare-fun b!1428016 () Bool)

(assert (=> b!1428016 (and (bvsge (index!47234 lt!628733) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628733) (size!47580 a!2831)))))

(declare-fun res!962455 () Bool)

(assert (=> b!1428016 (= res!962455 (= (select (arr!47029 a!2831) (index!47234 lt!628733)) (select (arr!47029 a!2831) j!81)))))

(declare-fun e!806721 () Bool)

(assert (=> b!1428016 (=> res!962455 e!806721)))

(assert (=> b!1428016 (= e!806722 e!806721)))

(declare-fun b!1428017 () Bool)

(declare-fun e!806719 () SeekEntryResult!11210)

(assert (=> b!1428017 (= e!806719 (Intermediate!11210 false index!585 x!605))))

(declare-fun b!1428018 () Bool)

(assert (=> b!1428018 (= e!806719 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428019 () Bool)

(assert (=> b!1428019 (= e!806718 e!806719)))

(declare-fun c!132277 () Bool)

(assert (=> b!1428019 (= c!132277 (or (= lt!628734 (select (arr!47029 a!2831) j!81)) (= (bvadd lt!628734 lt!628734) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428020 () Bool)

(assert (=> b!1428020 (= e!806720 (bvsge (x!129021 lt!628733) #b01111111111111111111111111111110))))

(declare-fun b!1428021 () Bool)

(assert (=> b!1428021 (and (bvsge (index!47234 lt!628733) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628733) (size!47580 a!2831)))))

(assert (=> b!1428021 (= e!806721 (= (select (arr!47029 a!2831) (index!47234 lt!628733)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428022 () Bool)

(assert (=> b!1428022 (and (bvsge (index!47234 lt!628733) #b00000000000000000000000000000000) (bvslt (index!47234 lt!628733) (size!47580 a!2831)))))

(declare-fun res!962457 () Bool)

(assert (=> b!1428022 (= res!962457 (= (select (arr!47029 a!2831) (index!47234 lt!628733)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428022 (=> res!962457 e!806721)))

(assert (= (and d!153647 c!132278) b!1428015))

(assert (= (and d!153647 (not c!132278)) b!1428019))

(assert (= (and b!1428019 c!132277) b!1428017))

(assert (= (and b!1428019 (not c!132277)) b!1428018))

(assert (= (and d!153647 c!132276) b!1428020))

(assert (= (and d!153647 (not c!132276)) b!1428014))

(assert (= (and b!1428014 res!962456) b!1428016))

(assert (= (and b!1428016 (not res!962455)) b!1428022))

(assert (= (and b!1428022 (not res!962457)) b!1428021))

(declare-fun m!1318689 () Bool)

(assert (=> b!1428022 m!1318689))

(assert (=> b!1428016 m!1318689))

(declare-fun m!1318691 () Bool)

(assert (=> d!153647 m!1318691))

(assert (=> d!153647 m!1318507))

(assert (=> b!1428021 m!1318689))

(assert (=> b!1428018 m!1318641))

(assert (=> b!1428018 m!1318641))

(assert (=> b!1428018 m!1318487))

(declare-fun m!1318693 () Bool)

(assert (=> b!1428018 m!1318693))

(assert (=> b!1427765 d!153647))

(check-sat (not d!153619) (not b!1427873) (not b!1427874) (not d!153643) (not d!153617) (not b!1427868) (not b!1427851) (not b!1427852) (not d!153609) (not bm!67401) (not b!1427957) (not bm!67408) (not b!1428018) (not d!153647) (not bm!67402) (not b!1427956) (not b!1428009) (not d!153635) (not b!1427931) (not b!1427982) (not b!1427959))
(check-sat)
