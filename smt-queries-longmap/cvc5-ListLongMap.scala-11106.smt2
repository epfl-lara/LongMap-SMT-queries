; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129610 () Bool)

(assert start!129610)

(declare-fun b!1521940 () Bool)

(declare-fun res!1041372 () Bool)

(declare-fun e!848583 () Bool)

(assert (=> b!1521940 (=> (not res!1041372) (not e!848583))))

(declare-datatypes ((array!101285 0))(
  ( (array!101286 (arr!48876 (Array (_ BitVec 32) (_ BitVec 64))) (size!49428 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101285)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521940 (= res!1041372 (validKeyInArray!0 (select (arr!48876 a!2804) i!961)))))

(declare-fun res!1041377 () Bool)

(assert (=> start!129610 (=> (not res!1041377) (not e!848583))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129610 (= res!1041377 (validMask!0 mask!2512))))

(assert (=> start!129610 e!848583))

(assert (=> start!129610 true))

(declare-fun array_inv!38109 (array!101285) Bool)

(assert (=> start!129610 (array_inv!38109 a!2804)))

(declare-fun b!1521941 () Bool)

(declare-fun res!1041374 () Bool)

(assert (=> b!1521941 (=> (not res!1041374) (not e!848583))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1521941 (= res!1041374 (and (= (size!49428 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49428 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49428 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521942 () Bool)

(declare-fun res!1041371 () Bool)

(assert (=> b!1521942 (=> (not res!1041371) (not e!848583))))

(assert (=> b!1521942 (= res!1041371 (validKeyInArray!0 (select (arr!48876 a!2804) j!70)))))

(declare-fun b!1521943 () Bool)

(declare-fun e!848581 () Bool)

(assert (=> b!1521943 (= e!848583 e!848581)))

(declare-fun res!1041373 () Bool)

(assert (=> b!1521943 (=> (not res!1041373) (not e!848581))))

(declare-datatypes ((SeekEntryResult!13064 0))(
  ( (MissingZero!13064 (index!54651 (_ BitVec 32))) (Found!13064 (index!54652 (_ BitVec 32))) (Intermediate!13064 (undefined!13876 Bool) (index!54653 (_ BitVec 32)) (x!136334 (_ BitVec 32))) (Undefined!13064) (MissingVacant!13064 (index!54654 (_ BitVec 32))) )
))
(declare-fun lt!659253 () SeekEntryResult!13064)

(declare-fun lt!659251 () SeekEntryResult!13064)

(assert (=> b!1521943 (= res!1041373 (= lt!659253 lt!659251))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521943 (= lt!659251 (Intermediate!13064 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101285 (_ BitVec 32)) SeekEntryResult!13064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521943 (= lt!659253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521944 () Bool)

(declare-fun res!1041369 () Bool)

(assert (=> b!1521944 (=> (not res!1041369) (not e!848583))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521944 (= res!1041369 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49428 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49428 a!2804))))))

(declare-fun b!1521945 () Bool)

(declare-fun res!1041375 () Bool)

(assert (=> b!1521945 (=> (not res!1041375) (not e!848581))))

(assert (=> b!1521945 (= res!1041375 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659251))))

(declare-fun b!1521946 () Bool)

(declare-fun res!1041376 () Bool)

(assert (=> b!1521946 (=> (not res!1041376) (not e!848583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101285 (_ BitVec 32)) Bool)

(assert (=> b!1521946 (= res!1041376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521947 () Bool)

(declare-fun res!1041370 () Bool)

(assert (=> b!1521947 (=> (not res!1041370) (not e!848581))))

(assert (=> b!1521947 (= res!1041370 (= lt!659253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)) mask!2512)))))

(declare-fun b!1521948 () Bool)

(declare-fun res!1041368 () Bool)

(assert (=> b!1521948 (=> (not res!1041368) (not e!848583))))

(declare-datatypes ((List!35437 0))(
  ( (Nil!35434) (Cons!35433 (h!36855 (_ BitVec 64)) (t!50123 List!35437)) )
))
(declare-fun arrayNoDuplicates!0 (array!101285 (_ BitVec 32) List!35437) Bool)

(assert (=> b!1521948 (= res!1041368 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35434))))

(declare-fun b!1521949 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101285 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1521949 (= e!848581 (not (= (seekEntry!0 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) (Found!13064 j!70))))))

(assert (=> b!1521949 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50751 0))(
  ( (Unit!50752) )
))
(declare-fun lt!659252 () Unit!50751)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50751)

(assert (=> b!1521949 (= lt!659252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129610 res!1041377) b!1521941))

(assert (= (and b!1521941 res!1041374) b!1521940))

(assert (= (and b!1521940 res!1041372) b!1521942))

(assert (= (and b!1521942 res!1041371) b!1521946))

(assert (= (and b!1521946 res!1041376) b!1521948))

(assert (= (and b!1521948 res!1041368) b!1521944))

(assert (= (and b!1521944 res!1041369) b!1521943))

(assert (= (and b!1521943 res!1041373) b!1521945))

(assert (= (and b!1521945 res!1041375) b!1521947))

(assert (= (and b!1521947 res!1041370) b!1521949))

(declare-fun m!1404525 () Bool)

(assert (=> b!1521942 m!1404525))

(assert (=> b!1521942 m!1404525))

(declare-fun m!1404527 () Bool)

(assert (=> b!1521942 m!1404527))

(assert (=> b!1521949 m!1404525))

(assert (=> b!1521949 m!1404525))

(declare-fun m!1404529 () Bool)

(assert (=> b!1521949 m!1404529))

(declare-fun m!1404531 () Bool)

(assert (=> b!1521949 m!1404531))

(declare-fun m!1404533 () Bool)

(assert (=> b!1521949 m!1404533))

(declare-fun m!1404535 () Bool)

(assert (=> start!129610 m!1404535))

(declare-fun m!1404537 () Bool)

(assert (=> start!129610 m!1404537))

(assert (=> b!1521943 m!1404525))

(assert (=> b!1521943 m!1404525))

(declare-fun m!1404539 () Bool)

(assert (=> b!1521943 m!1404539))

(assert (=> b!1521943 m!1404539))

(assert (=> b!1521943 m!1404525))

(declare-fun m!1404541 () Bool)

(assert (=> b!1521943 m!1404541))

(declare-fun m!1404543 () Bool)

(assert (=> b!1521946 m!1404543))

(assert (=> b!1521945 m!1404525))

(assert (=> b!1521945 m!1404525))

(declare-fun m!1404545 () Bool)

(assert (=> b!1521945 m!1404545))

(declare-fun m!1404547 () Bool)

(assert (=> b!1521940 m!1404547))

(assert (=> b!1521940 m!1404547))

(declare-fun m!1404549 () Bool)

(assert (=> b!1521940 m!1404549))

(declare-fun m!1404551 () Bool)

(assert (=> b!1521947 m!1404551))

(declare-fun m!1404553 () Bool)

(assert (=> b!1521947 m!1404553))

(assert (=> b!1521947 m!1404553))

(declare-fun m!1404555 () Bool)

(assert (=> b!1521947 m!1404555))

(assert (=> b!1521947 m!1404555))

(assert (=> b!1521947 m!1404553))

(declare-fun m!1404557 () Bool)

(assert (=> b!1521947 m!1404557))

(declare-fun m!1404559 () Bool)

(assert (=> b!1521948 m!1404559))

(push 1)

(assert (not b!1521949))

(assert (not b!1521943))

(assert (not start!129610))

(assert (not b!1521946))

(assert (not b!1521940))

(assert (not b!1521945))

(assert (not b!1521947))

(assert (not b!1521942))

(assert (not b!1521948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158815 () Bool)

(assert (=> d!158815 (= (validKeyInArray!0 (select (arr!48876 a!2804) i!961)) (and (not (= (select (arr!48876 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48876 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1521940 d!158815))

(declare-fun d!158821 () Bool)

(assert (=> d!158821 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129610 d!158821))

(declare-fun d!158831 () Bool)

(assert (=> d!158831 (= (array_inv!38109 a!2804) (bvsge (size!49428 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129610 d!158831))

(declare-fun b!1522118 () Bool)

(declare-fun lt!659322 () SeekEntryResult!13064)

(assert (=> b!1522118 (and (bvsge (index!54653 lt!659322) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659322) (size!49428 a!2804)))))

(declare-fun e!848685 () Bool)

(assert (=> b!1522118 (= e!848685 (= (select (arr!48876 a!2804) (index!54653 lt!659322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522119 () Bool)

(declare-fun e!848687 () SeekEntryResult!13064)

(declare-fun e!848689 () SeekEntryResult!13064)

(assert (=> b!1522119 (= e!848687 e!848689)))

(declare-fun c!139892 () Bool)

(declare-fun lt!659321 () (_ BitVec 64))

(assert (=> b!1522119 (= c!139892 (or (= lt!659321 (select (arr!48876 a!2804) j!70)) (= (bvadd lt!659321 lt!659321) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522120 () Bool)

(assert (=> b!1522120 (= e!848689 (Intermediate!13064 false index!487 x!534))))

(declare-fun b!1522121 () Bool)

(assert (=> b!1522121 (and (bvsge (index!54653 lt!659322) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659322) (size!49428 a!2804)))))

(declare-fun res!1041434 () Bool)

(assert (=> b!1522121 (= res!1041434 (= (select (arr!48876 a!2804) (index!54653 lt!659322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522121 (=> res!1041434 e!848685)))

(declare-fun b!1522122 () Bool)

(assert (=> b!1522122 (= e!848687 (Intermediate!13064 true index!487 x!534))))

(declare-fun b!1522123 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522123 (= e!848689 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522125 () Bool)

(declare-fun e!848686 () Bool)

(declare-fun e!848688 () Bool)

(assert (=> b!1522125 (= e!848686 e!848688)))

(declare-fun res!1041436 () Bool)

(assert (=> b!1522125 (= res!1041436 (and (is-Intermediate!13064 lt!659322) (not (undefined!13876 lt!659322)) (bvslt (x!136334 lt!659322) #b01111111111111111111111111111110) (bvsge (x!136334 lt!659322) #b00000000000000000000000000000000) (bvsge (x!136334 lt!659322) x!534)))))

(assert (=> b!1522125 (=> (not res!1041436) (not e!848688))))

(declare-fun b!1522126 () Bool)

(assert (=> b!1522126 (and (bvsge (index!54653 lt!659322) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659322) (size!49428 a!2804)))))

(declare-fun res!1041435 () Bool)

(assert (=> b!1522126 (= res!1041435 (= (select (arr!48876 a!2804) (index!54653 lt!659322)) (select (arr!48876 a!2804) j!70)))))

(assert (=> b!1522126 (=> res!1041435 e!848685)))

(assert (=> b!1522126 (= e!848688 e!848685)))

(declare-fun b!1522124 () Bool)

(assert (=> b!1522124 (= e!848686 (bvsge (x!136334 lt!659322) #b01111111111111111111111111111110))))

(declare-fun d!158833 () Bool)

(assert (=> d!158833 e!848686))

(declare-fun c!139894 () Bool)

(assert (=> d!158833 (= c!139894 (and (is-Intermediate!13064 lt!659322) (undefined!13876 lt!659322)))))

(assert (=> d!158833 (= lt!659322 e!848687)))

(declare-fun c!139893 () Bool)

(assert (=> d!158833 (= c!139893 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158833 (= lt!659321 (select (arr!48876 a!2804) index!487))))

(assert (=> d!158833 (validMask!0 mask!2512)))

(assert (=> d!158833 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659322)))

(assert (= (and d!158833 c!139893) b!1522122))

(assert (= (and d!158833 (not c!139893)) b!1522119))

(assert (= (and b!1522119 c!139892) b!1522120))

(assert (= (and b!1522119 (not c!139892)) b!1522123))

(assert (= (and d!158833 c!139894) b!1522124))

(assert (= (and d!158833 (not c!139894)) b!1522125))

(assert (= (and b!1522125 res!1041436) b!1522126))

(assert (= (and b!1522126 (not res!1041435)) b!1522121))

(assert (= (and b!1522121 (not res!1041434)) b!1522118))

(declare-fun m!1404629 () Bool)

(assert (=> b!1522118 m!1404629))

(declare-fun m!1404631 () Bool)

(assert (=> d!158833 m!1404631))

(assert (=> d!158833 m!1404535))

(assert (=> b!1522121 m!1404629))

(assert (=> b!1522126 m!1404629))

(declare-fun m!1404635 () Bool)

(assert (=> b!1522123 m!1404635))

(assert (=> b!1522123 m!1404635))

(assert (=> b!1522123 m!1404525))

(declare-fun m!1404641 () Bool)

(assert (=> b!1522123 m!1404641))

(assert (=> b!1521945 d!158833))

(declare-fun d!158853 () Bool)

(declare-fun lt!659352 () SeekEntryResult!13064)

(assert (=> d!158853 (and (or (is-MissingVacant!13064 lt!659352) (not (is-Found!13064 lt!659352)) (and (bvsge (index!54652 lt!659352) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659352) (size!49428 a!2804)))) (not (is-MissingVacant!13064 lt!659352)) (or (not (is-Found!13064 lt!659352)) (= (select (arr!48876 a!2804) (index!54652 lt!659352)) (select (arr!48876 a!2804) j!70))))))

(declare-fun e!848710 () SeekEntryResult!13064)

(assert (=> d!158853 (= lt!659352 e!848710)))

(declare-fun c!139906 () Bool)

(declare-fun lt!659351 () SeekEntryResult!13064)

(assert (=> d!158853 (= c!139906 (and (is-Intermediate!13064 lt!659351) (undefined!13876 lt!659351)))))

(assert (=> d!158853 (= lt!659351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158853 (validMask!0 mask!2512)))

(assert (=> d!158853 (= (seekEntry!0 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659352)))

(declare-fun b!1522155 () Bool)

(declare-fun c!139905 () Bool)

(declare-fun lt!659349 () (_ BitVec 64))

(assert (=> b!1522155 (= c!139905 (= lt!659349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848709 () SeekEntryResult!13064)

(declare-fun e!848708 () SeekEntryResult!13064)

(assert (=> b!1522155 (= e!848709 e!848708)))

(declare-fun b!1522156 () Bool)

(assert (=> b!1522156 (= e!848710 Undefined!13064)))

(declare-fun b!1522157 () Bool)

(assert (=> b!1522157 (= e!848708 (MissingZero!13064 (index!54653 lt!659351)))))

(declare-fun b!1522158 () Bool)

(assert (=> b!1522158 (= e!848709 (Found!13064 (index!54653 lt!659351)))))

(declare-fun b!1522159 () Bool)

(assert (=> b!1522159 (= e!848710 e!848709)))

(assert (=> b!1522159 (= lt!659349 (select (arr!48876 a!2804) (index!54653 lt!659351)))))

(declare-fun c!139907 () Bool)

(assert (=> b!1522159 (= c!139907 (= lt!659349 (select (arr!48876 a!2804) j!70)))))

(declare-fun b!1522160 () Bool)

(declare-fun lt!659350 () SeekEntryResult!13064)

(assert (=> b!1522160 (= e!848708 (ite (is-MissingVacant!13064 lt!659350) (MissingZero!13064 (index!54654 lt!659350)) lt!659350))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101285 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1522160 (= lt!659350 (seekKeyOrZeroReturnVacant!0 (x!136334 lt!659351) (index!54653 lt!659351) (index!54653 lt!659351) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158853 c!139906) b!1522156))

(assert (= (and d!158853 (not c!139906)) b!1522159))

(assert (= (and b!1522159 c!139907) b!1522158))

(assert (= (and b!1522159 (not c!139907)) b!1522155))

(assert (= (and b!1522155 c!139905) b!1522157))

(assert (= (and b!1522155 (not c!139905)) b!1522160))

(declare-fun m!1404657 () Bool)

(assert (=> d!158853 m!1404657))

(assert (=> d!158853 m!1404525))

(assert (=> d!158853 m!1404539))

(assert (=> d!158853 m!1404539))

(assert (=> d!158853 m!1404525))

(assert (=> d!158853 m!1404541))

(assert (=> d!158853 m!1404535))

(declare-fun m!1404659 () Bool)

(assert (=> b!1522159 m!1404659))

(assert (=> b!1522160 m!1404525))

(declare-fun m!1404661 () Bool)

(assert (=> b!1522160 m!1404661))

(assert (=> b!1521949 d!158853))

(declare-fun d!158861 () Bool)

(declare-fun res!1041457 () Bool)

(declare-fun e!848731 () Bool)

(assert (=> d!158861 (=> res!1041457 e!848731)))

(assert (=> d!158861 (= res!1041457 (bvsge j!70 (size!49428 a!2804)))))

(assert (=> d!158861 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848731)))

(declare-fun b!1522191 () Bool)

(declare-fun e!848730 () Bool)

(declare-fun call!68359 () Bool)

(assert (=> b!1522191 (= e!848730 call!68359)))

(declare-fun b!1522192 () Bool)

(declare-fun e!848732 () Bool)

(assert (=> b!1522192 (= e!848732 call!68359)))

(declare-fun b!1522193 () Bool)

(assert (=> b!1522193 (= e!848730 e!848732)))

(declare-fun lt!659369 () (_ BitVec 64))

(assert (=> b!1522193 (= lt!659369 (select (arr!48876 a!2804) j!70))))

(declare-fun lt!659368 () Unit!50751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101285 (_ BitVec 64) (_ BitVec 32)) Unit!50751)

(assert (=> b!1522193 (= lt!659368 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659369 j!70))))

(declare-fun arrayContainsKey!0 (array!101285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1522193 (arrayContainsKey!0 a!2804 lt!659369 #b00000000000000000000000000000000)))

(declare-fun lt!659370 () Unit!50751)

(assert (=> b!1522193 (= lt!659370 lt!659368)))

(declare-fun res!1041458 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101285 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1522193 (= res!1041458 (= (seekEntryOrOpen!0 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) (Found!13064 j!70)))))

(assert (=> b!1522193 (=> (not res!1041458) (not e!848732))))

(declare-fun b!1522194 () Bool)

(assert (=> b!1522194 (= e!848731 e!848730)))

(declare-fun c!139917 () Bool)

(assert (=> b!1522194 (= c!139917 (validKeyInArray!0 (select (arr!48876 a!2804) j!70)))))

(declare-fun bm!68356 () Bool)

(assert (=> bm!68356 (= call!68359 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158861 (not res!1041457)) b!1522194))

(assert (= (and b!1522194 c!139917) b!1522193))

(assert (= (and b!1522194 (not c!139917)) b!1522191))

(assert (= (and b!1522193 res!1041458) b!1522192))

(assert (= (or b!1522192 b!1522191) bm!68356))

(assert (=> b!1522193 m!1404525))

(declare-fun m!1404687 () Bool)

(assert (=> b!1522193 m!1404687))

(declare-fun m!1404689 () Bool)

(assert (=> b!1522193 m!1404689))

(assert (=> b!1522193 m!1404525))

(declare-fun m!1404691 () Bool)

(assert (=> b!1522193 m!1404691))

(assert (=> b!1522194 m!1404525))

(assert (=> b!1522194 m!1404525))

(assert (=> b!1522194 m!1404527))

(declare-fun m!1404693 () Bool)

(assert (=> bm!68356 m!1404693))

(assert (=> b!1521949 d!158861))

(declare-fun d!158875 () Bool)

(assert (=> d!158875 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659373 () Unit!50751)

(declare-fun choose!38 (array!101285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50751)

(assert (=> d!158875 (= lt!659373 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158875 (validMask!0 mask!2512)))

(assert (=> d!158875 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659373)))

(declare-fun bs!43652 () Bool)

(assert (= bs!43652 d!158875))

(assert (=> bs!43652 m!1404531))

(declare-fun m!1404695 () Bool)

(assert (=> bs!43652 m!1404695))

(assert (=> bs!43652 m!1404535))

(assert (=> b!1521949 d!158875))

(declare-fun b!1522205 () Bool)

(declare-fun e!848742 () Bool)

(declare-fun call!68362 () Bool)

(assert (=> b!1522205 (= e!848742 call!68362)))

(declare-fun d!158877 () Bool)

(declare-fun res!1041465 () Bool)

(declare-fun e!848744 () Bool)

(assert (=> d!158877 (=> res!1041465 e!848744)))

(assert (=> d!158877 (= res!1041465 (bvsge #b00000000000000000000000000000000 (size!49428 a!2804)))))

(assert (=> d!158877 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35434) e!848744)))

(declare-fun b!1522206 () Bool)

(declare-fun e!848743 () Bool)

(assert (=> b!1522206 (= e!848743 e!848742)))

(declare-fun c!139920 () Bool)

(assert (=> b!1522206 (= c!139920 (validKeyInArray!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522207 () Bool)

(assert (=> b!1522207 (= e!848742 call!68362)))

(declare-fun b!1522208 () Bool)

(declare-fun e!848741 () Bool)

(declare-fun contains!9952 (List!35437 (_ BitVec 64)) Bool)

(assert (=> b!1522208 (= e!848741 (contains!9952 Nil!35434 (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68359 () Bool)

(assert (=> bm!68359 (= call!68362 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139920 (Cons!35433 (select (arr!48876 a!2804) #b00000000000000000000000000000000) Nil!35434) Nil!35434)))))

(declare-fun b!1522209 () Bool)

(assert (=> b!1522209 (= e!848744 e!848743)))

(declare-fun res!1041466 () Bool)

(assert (=> b!1522209 (=> (not res!1041466) (not e!848743))))

(assert (=> b!1522209 (= res!1041466 (not e!848741))))

(declare-fun res!1041467 () Bool)

(assert (=> b!1522209 (=> (not res!1041467) (not e!848741))))

(assert (=> b!1522209 (= res!1041467 (validKeyInArray!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158877 (not res!1041465)) b!1522209))

(assert (= (and b!1522209 res!1041467) b!1522208))

(assert (= (and b!1522209 res!1041466) b!1522206))

(assert (= (and b!1522206 c!139920) b!1522207))

(assert (= (and b!1522206 (not c!139920)) b!1522205))

(assert (= (or b!1522207 b!1522205) bm!68359))

(declare-fun m!1404697 () Bool)

(assert (=> b!1522206 m!1404697))

(assert (=> b!1522206 m!1404697))

(declare-fun m!1404699 () Bool)

(assert (=> b!1522206 m!1404699))

(assert (=> b!1522208 m!1404697))

(assert (=> b!1522208 m!1404697))

(declare-fun m!1404701 () Bool)

(assert (=> b!1522208 m!1404701))

(assert (=> bm!68359 m!1404697))

(declare-fun m!1404703 () Bool)

(assert (=> bm!68359 m!1404703))

(assert (=> b!1522209 m!1404697))

(assert (=> b!1522209 m!1404697))

(assert (=> b!1522209 m!1404699))

(assert (=> b!1521948 d!158877))

(declare-fun b!1522210 () Bool)

(declare-fun lt!659375 () SeekEntryResult!13064)

(assert (=> b!1522210 (and (bvsge (index!54653 lt!659375) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659375) (size!49428 a!2804)))))

(declare-fun e!848745 () Bool)

(assert (=> b!1522210 (= e!848745 (= (select (arr!48876 a!2804) (index!54653 lt!659375)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522211 () Bool)

(declare-fun e!848747 () SeekEntryResult!13064)

(declare-fun e!848749 () SeekEntryResult!13064)

(assert (=> b!1522211 (= e!848747 e!848749)))

(declare-fun lt!659374 () (_ BitVec 64))

(declare-fun c!139921 () Bool)

(assert (=> b!1522211 (= c!139921 (or (= lt!659374 (select (arr!48876 a!2804) j!70)) (= (bvadd lt!659374 lt!659374) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522212 () Bool)

(assert (=> b!1522212 (= e!848749 (Intermediate!13064 false (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522213 () Bool)

(assert (=> b!1522213 (and (bvsge (index!54653 lt!659375) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659375) (size!49428 a!2804)))))

(declare-fun res!1041468 () Bool)

(assert (=> b!1522213 (= res!1041468 (= (select (arr!48876 a!2804) (index!54653 lt!659375)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522213 (=> res!1041468 e!848745)))

(declare-fun b!1522214 () Bool)

(assert (=> b!1522214 (= e!848747 (Intermediate!13064 true (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522215 () Bool)

(assert (=> b!1522215 (= e!848749 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522217 () Bool)

(declare-fun e!848746 () Bool)

(declare-fun e!848748 () Bool)

(assert (=> b!1522217 (= e!848746 e!848748)))

(declare-fun res!1041470 () Bool)

(assert (=> b!1522217 (= res!1041470 (and (is-Intermediate!13064 lt!659375) (not (undefined!13876 lt!659375)) (bvslt (x!136334 lt!659375) #b01111111111111111111111111111110) (bvsge (x!136334 lt!659375) #b00000000000000000000000000000000) (bvsge (x!136334 lt!659375) #b00000000000000000000000000000000)))))

(assert (=> b!1522217 (=> (not res!1041470) (not e!848748))))

(declare-fun b!1522218 () Bool)

(assert (=> b!1522218 (and (bvsge (index!54653 lt!659375) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659375) (size!49428 a!2804)))))

(declare-fun res!1041469 () Bool)

(assert (=> b!1522218 (= res!1041469 (= (select (arr!48876 a!2804) (index!54653 lt!659375)) (select (arr!48876 a!2804) j!70)))))

(assert (=> b!1522218 (=> res!1041469 e!848745)))

(assert (=> b!1522218 (= e!848748 e!848745)))

(declare-fun b!1522216 () Bool)

(assert (=> b!1522216 (= e!848746 (bvsge (x!136334 lt!659375) #b01111111111111111111111111111110))))

(declare-fun d!158879 () Bool)

(assert (=> d!158879 e!848746))

(declare-fun c!139923 () Bool)

(assert (=> d!158879 (= c!139923 (and (is-Intermediate!13064 lt!659375) (undefined!13876 lt!659375)))))

(assert (=> d!158879 (= lt!659375 e!848747)))

(declare-fun c!139922 () Bool)

(assert (=> d!158879 (= c!139922 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158879 (= lt!659374 (select (arr!48876 a!2804) (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512)))))

(assert (=> d!158879 (validMask!0 mask!2512)))

(assert (=> d!158879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659375)))

(assert (= (and d!158879 c!139922) b!1522214))

(assert (= (and d!158879 (not c!139922)) b!1522211))

(assert (= (and b!1522211 c!139921) b!1522212))

(assert (= (and b!1522211 (not c!139921)) b!1522215))

(assert (= (and d!158879 c!139923) b!1522216))

(assert (= (and d!158879 (not c!139923)) b!1522217))

(assert (= (and b!1522217 res!1041470) b!1522218))

(assert (= (and b!1522218 (not res!1041469)) b!1522213))

(assert (= (and b!1522213 (not res!1041468)) b!1522210))

(declare-fun m!1404705 () Bool)

(assert (=> b!1522210 m!1404705))

(assert (=> d!158879 m!1404539))

(declare-fun m!1404707 () Bool)

(assert (=> d!158879 m!1404707))

(assert (=> d!158879 m!1404535))

(assert (=> b!1522213 m!1404705))

(assert (=> b!1522218 m!1404705))

(assert (=> b!1522215 m!1404539))

(declare-fun m!1404709 () Bool)

(assert (=> b!1522215 m!1404709))

(assert (=> b!1522215 m!1404709))

(assert (=> b!1522215 m!1404525))

(declare-fun m!1404711 () Bool)

(assert (=> b!1522215 m!1404711))

(assert (=> b!1521943 d!158879))

(declare-fun d!158881 () Bool)

(declare-fun lt!659381 () (_ BitVec 32))

(declare-fun lt!659380 () (_ BitVec 32))

(assert (=> d!158881 (= lt!659381 (bvmul (bvxor lt!659380 (bvlshr lt!659380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158881 (= lt!659380 ((_ extract 31 0) (bvand (bvxor (select (arr!48876 a!2804) j!70) (bvlshr (select (arr!48876 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158881 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041471 (let ((h!36858 ((_ extract 31 0) (bvand (bvxor (select (arr!48876 a!2804) j!70) (bvlshr (select (arr!48876 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136340 (bvmul (bvxor h!36858 (bvlshr h!36858 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136340 (bvlshr x!136340 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041471 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041471 #b00000000000000000000000000000000))))))

(assert (=> d!158881 (= (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) (bvand (bvxor lt!659381 (bvlshr lt!659381 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1521943 d!158881))

(declare-fun d!158883 () Bool)

(assert (=> d!158883 (= (validKeyInArray!0 (select (arr!48876 a!2804) j!70)) (and (not (= (select (arr!48876 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48876 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1521942 d!158883))

(declare-fun b!1522219 () Bool)

(declare-fun lt!659383 () SeekEntryResult!13064)

(assert (=> b!1522219 (and (bvsge (index!54653 lt!659383) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659383) (size!49428 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))))

(declare-fun e!848750 () Bool)

(assert (=> b!1522219 (= e!848750 (= (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (index!54653 lt!659383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522220 () Bool)

(declare-fun e!848752 () SeekEntryResult!13064)

(declare-fun e!848754 () SeekEntryResult!13064)

(assert (=> b!1522220 (= e!848752 e!848754)))

(declare-fun c!139924 () Bool)

(declare-fun lt!659382 () (_ BitVec 64))

(assert (=> b!1522220 (= c!139924 (or (= lt!659382 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659382 lt!659382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522221 () Bool)

(assert (=> b!1522221 (= e!848754 (Intermediate!13064 false (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522222 () Bool)

(assert (=> b!1522222 (and (bvsge (index!54653 lt!659383) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659383) (size!49428 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))))

(declare-fun res!1041472 () Bool)

(assert (=> b!1522222 (= res!1041472 (= (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (index!54653 lt!659383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522222 (=> res!1041472 e!848750)))

(declare-fun b!1522223 () Bool)

(assert (=> b!1522223 (= e!848752 (Intermediate!13064 true (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522224 () Bool)

(assert (=> b!1522224 (= e!848754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)) mask!2512))))

(declare-fun b!1522226 () Bool)

(declare-fun e!848751 () Bool)

(declare-fun e!848753 () Bool)

(assert (=> b!1522226 (= e!848751 e!848753)))

(declare-fun res!1041474 () Bool)

(assert (=> b!1522226 (= res!1041474 (and (is-Intermediate!13064 lt!659383) (not (undefined!13876 lt!659383)) (bvslt (x!136334 lt!659383) #b01111111111111111111111111111110) (bvsge (x!136334 lt!659383) #b00000000000000000000000000000000) (bvsge (x!136334 lt!659383) #b00000000000000000000000000000000)))))

(assert (=> b!1522226 (=> (not res!1041474) (not e!848753))))

(declare-fun b!1522227 () Bool)

(assert (=> b!1522227 (and (bvsge (index!54653 lt!659383) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659383) (size!49428 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))))

(declare-fun res!1041473 () Bool)

(assert (=> b!1522227 (= res!1041473 (= (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (index!54653 lt!659383)) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522227 (=> res!1041473 e!848750)))

(assert (=> b!1522227 (= e!848753 e!848750)))

(declare-fun b!1522225 () Bool)

(assert (=> b!1522225 (= e!848751 (bvsge (x!136334 lt!659383) #b01111111111111111111111111111110))))

(declare-fun d!158885 () Bool)

(assert (=> d!158885 e!848751))

(declare-fun c!139926 () Bool)

(assert (=> d!158885 (= c!139926 (and (is-Intermediate!13064 lt!659383) (undefined!13876 lt!659383)))))

(assert (=> d!158885 (= lt!659383 e!848752)))

(declare-fun c!139925 () Bool)

(assert (=> d!158885 (= c!139925 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158885 (= lt!659382 (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158885 (validMask!0 mask!2512)))

(assert (=> d!158885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)) mask!2512) lt!659383)))

(assert (= (and d!158885 c!139925) b!1522223))

(assert (= (and d!158885 (not c!139925)) b!1522220))

(assert (= (and b!1522220 c!139924) b!1522221))

(assert (= (and b!1522220 (not c!139924)) b!1522224))

(assert (= (and d!158885 c!139926) b!1522225))

(assert (= (and d!158885 (not c!139926)) b!1522226))

(assert (= (and b!1522226 res!1041474) b!1522227))

(assert (= (and b!1522227 (not res!1041473)) b!1522222))

(assert (= (and b!1522222 (not res!1041472)) b!1522219))

(declare-fun m!1404713 () Bool)

(assert (=> b!1522219 m!1404713))

(assert (=> d!158885 m!1404555))

(declare-fun m!1404715 () Bool)

(assert (=> d!158885 m!1404715))

(assert (=> d!158885 m!1404535))

(assert (=> b!1522222 m!1404713))

(assert (=> b!1522227 m!1404713))

(assert (=> b!1522224 m!1404555))

(declare-fun m!1404717 () Bool)

(assert (=> b!1522224 m!1404717))

(assert (=> b!1522224 m!1404717))

(assert (=> b!1522224 m!1404553))

(declare-fun m!1404719 () Bool)

(assert (=> b!1522224 m!1404719))

(assert (=> b!1521947 d!158885))

(declare-fun d!158887 () Bool)

(declare-fun lt!659385 () (_ BitVec 32))

(declare-fun lt!659384 () (_ BitVec 32))

(assert (=> d!158887 (= lt!659385 (bvmul (bvxor lt!659384 (bvlshr lt!659384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158887 (= lt!659384 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158887 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041471 (let ((h!36858 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136340 (bvmul (bvxor h!36858 (bvlshr h!36858 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136340 (bvlshr x!136340 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041471 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041471 #b00000000000000000000000000000000))))))

(assert (=> d!158887 (= (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659385 (bvlshr lt!659385 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1521947 d!158887))

(declare-fun d!158889 () Bool)

(declare-fun res!1041475 () Bool)

(declare-fun e!848756 () Bool)

(assert (=> d!158889 (=> res!1041475 e!848756)))

(assert (=> d!158889 (= res!1041475 (bvsge #b00000000000000000000000000000000 (size!49428 a!2804)))))

(assert (=> d!158889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848756)))

(declare-fun b!1522228 () Bool)

(declare-fun e!848755 () Bool)

(declare-fun call!68363 () Bool)

(assert (=> b!1522228 (= e!848755 call!68363)))

(declare-fun b!1522229 () Bool)

(declare-fun e!848757 () Bool)

(assert (=> b!1522229 (= e!848757 call!68363)))

(declare-fun b!1522230 () Bool)

(assert (=> b!1522230 (= e!848755 e!848757)))

(declare-fun lt!659387 () (_ BitVec 64))

(assert (=> b!1522230 (= lt!659387 (select (arr!48876 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659386 () Unit!50751)

(assert (=> b!1522230 (= lt!659386 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659387 #b00000000000000000000000000000000))))

(assert (=> b!1522230 (arrayContainsKey!0 a!2804 lt!659387 #b00000000000000000000000000000000)))

(declare-fun lt!659388 () Unit!50751)

(assert (=> b!1522230 (= lt!659388 lt!659386)))

(declare-fun res!1041476 () Bool)

(assert (=> b!1522230 (= res!1041476 (= (seekEntryOrOpen!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13064 #b00000000000000000000000000000000)))))

(assert (=> b!1522230 (=> (not res!1041476) (not e!848757))))

(declare-fun b!1522231 () Bool)

(assert (=> b!1522231 (= e!848756 e!848755)))

(declare-fun c!139927 () Bool)

(assert (=> b!1522231 (= c!139927 (validKeyInArray!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68360 () Bool)

(assert (=> bm!68360 (= call!68363 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158889 (not res!1041475)) b!1522231))

(assert (= (and b!1522231 c!139927) b!1522230))

(assert (= (and b!1522231 (not c!139927)) b!1522228))

(assert (= (and b!1522230 res!1041476) b!1522229))

(assert (= (or b!1522229 b!1522228) bm!68360))

(assert (=> b!1522230 m!1404697))

(declare-fun m!1404721 () Bool)

(assert (=> b!1522230 m!1404721))

(declare-fun m!1404723 () Bool)

(assert (=> b!1522230 m!1404723))

(assert (=> b!1522230 m!1404697))

(declare-fun m!1404725 () Bool)

(assert (=> b!1522230 m!1404725))

(assert (=> b!1522231 m!1404697))

(assert (=> b!1522231 m!1404697))

(assert (=> b!1522231 m!1404699))

(declare-fun m!1404727 () Bool)

(assert (=> bm!68360 m!1404727))

(assert (=> b!1521946 d!158889))

(push 1)

(assert (not b!1522230))

(assert (not bm!68359))

(assert (not b!1522209))

(assert (not d!158885))

(assert (not bm!68356))

(assert (not b!1522224))

(assert (not b!1522160))

(assert (not b!1522123))

(assert (not d!158875))

(assert (not d!158833))

(assert (not b!1522231))

(assert (not b!1522208))

(assert (not d!158879))

(assert (not d!158853))

(assert (not b!1522206))

(assert (not b!1522194))

(assert (not b!1522215))

(assert (not bm!68360))

(assert (not b!1522193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158891 () Bool)

(assert (=> d!158891 (= (validKeyInArray!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48876 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48876 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522231 d!158891))

(declare-fun b!1522232 () Bool)

(declare-fun lt!659390 () SeekEntryResult!13064)

(assert (=> b!1522232 (and (bvsge (index!54653 lt!659390) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659390) (size!49428 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))))

(declare-fun e!848758 () Bool)

(assert (=> b!1522232 (= e!848758 (= (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (index!54653 lt!659390)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522233 () Bool)

(declare-fun e!848760 () SeekEntryResult!13064)

(declare-fun e!848762 () SeekEntryResult!13064)

(assert (=> b!1522233 (= e!848760 e!848762)))

(declare-fun lt!659389 () (_ BitVec 64))

(declare-fun c!139928 () Bool)

(assert (=> b!1522233 (= c!139928 (or (= lt!659389 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659389 lt!659389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522234 () Bool)

(assert (=> b!1522234 (= e!848762 (Intermediate!13064 false (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522235 () Bool)

(assert (=> b!1522235 (and (bvsge (index!54653 lt!659390) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659390) (size!49428 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))))

(declare-fun res!1041477 () Bool)

(assert (=> b!1522235 (= res!1041477 (= (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (index!54653 lt!659390)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522235 (=> res!1041477 e!848758)))

(declare-fun b!1522236 () Bool)

(assert (=> b!1522236 (= e!848760 (Intermediate!13064 true (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522237 () Bool)

(assert (=> b!1522237 (= e!848762 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)) mask!2512))))

(declare-fun b!1522239 () Bool)

(declare-fun e!848759 () Bool)

(declare-fun e!848761 () Bool)

(assert (=> b!1522239 (= e!848759 e!848761)))

(declare-fun res!1041479 () Bool)

(assert (=> b!1522239 (= res!1041479 (and (is-Intermediate!13064 lt!659390) (not (undefined!13876 lt!659390)) (bvslt (x!136334 lt!659390) #b01111111111111111111111111111110) (bvsge (x!136334 lt!659390) #b00000000000000000000000000000000) (bvsge (x!136334 lt!659390) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522239 (=> (not res!1041479) (not e!848761))))

(declare-fun b!1522240 () Bool)

(assert (=> b!1522240 (and (bvsge (index!54653 lt!659390) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659390) (size!49428 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))))

(declare-fun res!1041478 () Bool)

(assert (=> b!1522240 (= res!1041478 (= (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (index!54653 lt!659390)) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522240 (=> res!1041478 e!848758)))

(assert (=> b!1522240 (= e!848761 e!848758)))

(declare-fun b!1522238 () Bool)

(assert (=> b!1522238 (= e!848759 (bvsge (x!136334 lt!659390) #b01111111111111111111111111111110))))

(declare-fun d!158893 () Bool)

(assert (=> d!158893 e!848759))

(declare-fun c!139930 () Bool)

(assert (=> d!158893 (= c!139930 (and (is-Intermediate!13064 lt!659390) (undefined!13876 lt!659390)))))

(assert (=> d!158893 (= lt!659390 e!848760)))

(declare-fun c!139929 () Bool)

(assert (=> d!158893 (= c!139929 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158893 (= lt!659389 (select (arr!48876 (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!158893 (validMask!0 mask!2512)))

(assert (=> d!158893 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101286 (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)) mask!2512) lt!659390)))

(assert (= (and d!158893 c!139929) b!1522236))

(assert (= (and d!158893 (not c!139929)) b!1522233))

(assert (= (and b!1522233 c!139928) b!1522234))

(assert (= (and b!1522233 (not c!139928)) b!1522237))

(assert (= (and d!158893 c!139930) b!1522238))

(assert (= (and d!158893 (not c!139930)) b!1522239))

(assert (= (and b!1522239 res!1041479) b!1522240))

(assert (= (and b!1522240 (not res!1041478)) b!1522235))

(assert (= (and b!1522235 (not res!1041477)) b!1522232))

(declare-fun m!1404729 () Bool)

(assert (=> b!1522232 m!1404729))

(assert (=> d!158893 m!1404717))

(declare-fun m!1404731 () Bool)

(assert (=> d!158893 m!1404731))

(assert (=> d!158893 m!1404535))

(assert (=> b!1522235 m!1404729))

(assert (=> b!1522240 m!1404729))

(assert (=> b!1522237 m!1404717))

(declare-fun m!1404733 () Bool)

(assert (=> b!1522237 m!1404733))

(assert (=> b!1522237 m!1404733))

(assert (=> b!1522237 m!1404553))

(declare-fun m!1404735 () Bool)

(assert (=> b!1522237 m!1404735))

(assert (=> b!1522224 d!158893))

(declare-fun d!158895 () Bool)

(declare-fun lt!659393 () (_ BitVec 32))

(assert (=> d!158895 (and (bvsge lt!659393 #b00000000000000000000000000000000) (bvslt lt!659393 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158895 (= lt!659393 (choose!52 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!158895 (validMask!0 mask!2512)))

(assert (=> d!158895 (= (nextIndex!0 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659393)))

(declare-fun bs!43653 () Bool)

(assert (= bs!43653 d!158895))

(assert (=> bs!43653 m!1404555))

(declare-fun m!1404737 () Bool)

(assert (=> bs!43653 m!1404737))

(assert (=> bs!43653 m!1404535))

(assert (=> b!1522224 d!158895))

(declare-fun d!158897 () Bool)

(declare-fun res!1041480 () Bool)

(declare-fun e!848764 () Bool)

(assert (=> d!158897 (=> res!1041480 e!848764)))

(assert (=> d!158897 (= res!1041480 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49428 a!2804)))))

(assert (=> d!158897 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!848764)))

(declare-fun b!1522241 () Bool)

(declare-fun e!848763 () Bool)

(declare-fun call!68364 () Bool)

(assert (=> b!1522241 (= e!848763 call!68364)))

(declare-fun b!1522242 () Bool)

(declare-fun e!848765 () Bool)

(assert (=> b!1522242 (= e!848765 call!68364)))

(declare-fun b!1522243 () Bool)

(assert (=> b!1522243 (= e!848763 e!848765)))

(declare-fun lt!659395 () (_ BitVec 64))

(assert (=> b!1522243 (= lt!659395 (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!659394 () Unit!50751)

(assert (=> b!1522243 (= lt!659394 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659395 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1522243 (arrayContainsKey!0 a!2804 lt!659395 #b00000000000000000000000000000000)))

(declare-fun lt!659396 () Unit!50751)

(assert (=> b!1522243 (= lt!659396 lt!659394)))

(declare-fun res!1041481 () Bool)

(assert (=> b!1522243 (= res!1041481 (= (seekEntryOrOpen!0 (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13064 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522243 (=> (not res!1041481) (not e!848765))))

(declare-fun b!1522244 () Bool)

(assert (=> b!1522244 (= e!848764 e!848763)))

(declare-fun c!139931 () Bool)

(assert (=> b!1522244 (= c!139931 (validKeyInArray!0 (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!68361 () Bool)

(assert (=> bm!68361 (= call!68364 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158897 (not res!1041480)) b!1522244))

(assert (= (and b!1522244 c!139931) b!1522243))

(assert (= (and b!1522244 (not c!139931)) b!1522241))

(assert (= (and b!1522243 res!1041481) b!1522242))

(assert (= (or b!1522242 b!1522241) bm!68361))

(declare-fun m!1404739 () Bool)

(assert (=> b!1522243 m!1404739))

(declare-fun m!1404741 () Bool)

(assert (=> b!1522243 m!1404741))

(declare-fun m!1404743 () Bool)

(assert (=> b!1522243 m!1404743))

(assert (=> b!1522243 m!1404739))

(declare-fun m!1404745 () Bool)

(assert (=> b!1522243 m!1404745))

(assert (=> b!1522244 m!1404739))

(assert (=> b!1522244 m!1404739))

(declare-fun m!1404747 () Bool)

(assert (=> b!1522244 m!1404747))

(declare-fun m!1404749 () Bool)

(assert (=> bm!68361 m!1404749))

(assert (=> bm!68360 d!158897))

(assert (=> d!158853 d!158879))

(assert (=> d!158853 d!158881))

(assert (=> d!158853 d!158821))

(declare-fun d!158899 () Bool)

(assert (=> d!158899 (arrayContainsKey!0 a!2804 lt!659387 #b00000000000000000000000000000000)))

(declare-fun lt!659399 () Unit!50751)

(declare-fun choose!13 (array!101285 (_ BitVec 64) (_ BitVec 32)) Unit!50751)

(assert (=> d!158899 (= lt!659399 (choose!13 a!2804 lt!659387 #b00000000000000000000000000000000))))

(assert (=> d!158899 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!158899 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659387 #b00000000000000000000000000000000) lt!659399)))

(declare-fun bs!43654 () Bool)

(assert (= bs!43654 d!158899))

(assert (=> bs!43654 m!1404723))

(declare-fun m!1404751 () Bool)

(assert (=> bs!43654 m!1404751))

(assert (=> b!1522230 d!158899))

(declare-fun d!158901 () Bool)

(declare-fun res!1041486 () Bool)

(declare-fun e!848770 () Bool)

(assert (=> d!158901 (=> res!1041486 e!848770)))

(assert (=> d!158901 (= res!1041486 (= (select (arr!48876 a!2804) #b00000000000000000000000000000000) lt!659387))))

(assert (=> d!158901 (= (arrayContainsKey!0 a!2804 lt!659387 #b00000000000000000000000000000000) e!848770)))

(declare-fun b!1522249 () Bool)

(declare-fun e!848771 () Bool)

(assert (=> b!1522249 (= e!848770 e!848771)))

(declare-fun res!1041487 () Bool)

(assert (=> b!1522249 (=> (not res!1041487) (not e!848771))))

(assert (=> b!1522249 (= res!1041487 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49428 a!2804)))))

(declare-fun b!1522250 () Bool)

(assert (=> b!1522250 (= e!848771 (arrayContainsKey!0 a!2804 lt!659387 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158901 (not res!1041486)) b!1522249))

(assert (= (and b!1522249 res!1041487) b!1522250))

(assert (=> d!158901 m!1404697))

(declare-fun m!1404753 () Bool)

(assert (=> b!1522250 m!1404753))

(assert (=> b!1522230 d!158901))

(declare-fun b!1522263 () Bool)

(declare-fun e!848779 () SeekEntryResult!13064)

(assert (=> b!1522263 (= e!848779 Undefined!13064)))

(declare-fun b!1522264 () Bool)

(declare-fun c!139939 () Bool)

(declare-fun lt!659408 () (_ BitVec 64))

(assert (=> b!1522264 (= c!139939 (= lt!659408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848780 () SeekEntryResult!13064)

(declare-fun e!848778 () SeekEntryResult!13064)

(assert (=> b!1522264 (= e!848780 e!848778)))

(declare-fun b!1522265 () Bool)

(declare-fun lt!659406 () SeekEntryResult!13064)

(assert (=> b!1522265 (= e!848780 (Found!13064 (index!54653 lt!659406)))))

(declare-fun b!1522266 () Bool)

(assert (=> b!1522266 (= e!848779 e!848780)))

(assert (=> b!1522266 (= lt!659408 (select (arr!48876 a!2804) (index!54653 lt!659406)))))

(declare-fun c!139938 () Bool)

(assert (=> b!1522266 (= c!139938 (= lt!659408 (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158903 () Bool)

(declare-fun lt!659407 () SeekEntryResult!13064)

(assert (=> d!158903 (and (or (is-Undefined!13064 lt!659407) (not (is-Found!13064 lt!659407)) (and (bvsge (index!54652 lt!659407) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659407) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659407) (is-Found!13064 lt!659407) (not (is-MissingZero!13064 lt!659407)) (and (bvsge (index!54651 lt!659407) #b00000000000000000000000000000000) (bvslt (index!54651 lt!659407) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659407) (is-Found!13064 lt!659407) (is-MissingZero!13064 lt!659407) (not (is-MissingVacant!13064 lt!659407)) (and (bvsge (index!54654 lt!659407) #b00000000000000000000000000000000) (bvslt (index!54654 lt!659407) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659407) (ite (is-Found!13064 lt!659407) (= (select (arr!48876 a!2804) (index!54652 lt!659407)) (select (arr!48876 a!2804) #b00000000000000000000000000000000)) (ite (is-MissingZero!13064 lt!659407) (= (select (arr!48876 a!2804) (index!54651 lt!659407)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13064 lt!659407) (= (select (arr!48876 a!2804) (index!54654 lt!659407)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!158903 (= lt!659407 e!848779)))

(declare-fun c!139940 () Bool)

(assert (=> d!158903 (= c!139940 (and (is-Intermediate!13064 lt!659406) (undefined!13876 lt!659406)))))

(assert (=> d!158903 (= lt!659406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48876 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!158903 (validMask!0 mask!2512)))

(assert (=> d!158903 (= (seekEntryOrOpen!0 (select (arr!48876 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!659407)))

(declare-fun b!1522267 () Bool)

(assert (=> b!1522267 (= e!848778 (seekKeyOrZeroReturnVacant!0 (x!136334 lt!659406) (index!54653 lt!659406) (index!54653 lt!659406) (select (arr!48876 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(declare-fun b!1522268 () Bool)

(assert (=> b!1522268 (= e!848778 (MissingZero!13064 (index!54653 lt!659406)))))

(assert (= (and d!158903 c!139940) b!1522263))

(assert (= (and d!158903 (not c!139940)) b!1522266))

(assert (= (and b!1522266 c!139938) b!1522265))

(assert (= (and b!1522266 (not c!139938)) b!1522264))

(assert (= (and b!1522264 c!139939) b!1522268))

(assert (= (and b!1522264 (not c!139939)) b!1522267))

(declare-fun m!1404755 () Bool)

(assert (=> b!1522266 m!1404755))

(declare-fun m!1404757 () Bool)

(assert (=> d!158903 m!1404757))

(declare-fun m!1404759 () Bool)

(assert (=> d!158903 m!1404759))

(assert (=> d!158903 m!1404697))

(declare-fun m!1404761 () Bool)

(assert (=> d!158903 m!1404761))

(declare-fun m!1404763 () Bool)

(assert (=> d!158903 m!1404763))

(assert (=> d!158903 m!1404761))

(assert (=> d!158903 m!1404697))

(declare-fun m!1404765 () Bool)

(assert (=> d!158903 m!1404765))

(assert (=> d!158903 m!1404535))

(assert (=> b!1522267 m!1404697))

(declare-fun m!1404767 () Bool)

(assert (=> b!1522267 m!1404767))

(assert (=> b!1522230 d!158903))

(assert (=> d!158833 d!158821))

(assert (=> d!158885 d!158821))

(declare-fun b!1522269 () Bool)

(declare-fun lt!659410 () SeekEntryResult!13064)

(assert (=> b!1522269 (and (bvsge (index!54653 lt!659410) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659410) (size!49428 a!2804)))))

(declare-fun e!848781 () Bool)

(assert (=> b!1522269 (= e!848781 (= (select (arr!48876 a!2804) (index!54653 lt!659410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522270 () Bool)

(declare-fun e!848783 () SeekEntryResult!13064)

(declare-fun e!848785 () SeekEntryResult!13064)

(assert (=> b!1522270 (= e!848783 e!848785)))

(declare-fun c!139941 () Bool)

(declare-fun lt!659409 () (_ BitVec 64))

(assert (=> b!1522270 (= c!139941 (or (= lt!659409 (select (arr!48876 a!2804) j!70)) (= (bvadd lt!659409 lt!659409) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522271 () Bool)

(assert (=> b!1522271 (= e!848785 (Intermediate!13064 false (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522272 () Bool)

(assert (=> b!1522272 (and (bvsge (index!54653 lt!659410) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659410) (size!49428 a!2804)))))

(declare-fun res!1041488 () Bool)

(assert (=> b!1522272 (= res!1041488 (= (select (arr!48876 a!2804) (index!54653 lt!659410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522272 (=> res!1041488 e!848781)))

(declare-fun b!1522273 () Bool)

(assert (=> b!1522273 (= e!848783 (Intermediate!13064 true (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522274 () Bool)

(assert (=> b!1522274 (= e!848785 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522276 () Bool)

(declare-fun e!848782 () Bool)

(declare-fun e!848784 () Bool)

(assert (=> b!1522276 (= e!848782 e!848784)))

(declare-fun res!1041490 () Bool)

(assert (=> b!1522276 (= res!1041490 (and (is-Intermediate!13064 lt!659410) (not (undefined!13876 lt!659410)) (bvslt (x!136334 lt!659410) #b01111111111111111111111111111110) (bvsge (x!136334 lt!659410) #b00000000000000000000000000000000) (bvsge (x!136334 lt!659410) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1522276 (=> (not res!1041490) (not e!848784))))

(declare-fun b!1522277 () Bool)

(assert (=> b!1522277 (and (bvsge (index!54653 lt!659410) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659410) (size!49428 a!2804)))))

(declare-fun res!1041489 () Bool)

(assert (=> b!1522277 (= res!1041489 (= (select (arr!48876 a!2804) (index!54653 lt!659410)) (select (arr!48876 a!2804) j!70)))))

(assert (=> b!1522277 (=> res!1041489 e!848781)))

(assert (=> b!1522277 (= e!848784 e!848781)))

(declare-fun b!1522275 () Bool)

(assert (=> b!1522275 (= e!848782 (bvsge (x!136334 lt!659410) #b01111111111111111111111111111110))))

(declare-fun d!158905 () Bool)

(assert (=> d!158905 e!848782))

(declare-fun c!139943 () Bool)

(assert (=> d!158905 (= c!139943 (and (is-Intermediate!13064 lt!659410) (undefined!13876 lt!659410)))))

(assert (=> d!158905 (= lt!659410 e!848783)))

(declare-fun c!139942 () Bool)

(assert (=> d!158905 (= c!139942 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158905 (= lt!659409 (select (arr!48876 a!2804) (nextIndex!0 index!487 x!534 mask!2512)))))

(assert (=> d!158905 (validMask!0 mask!2512)))

(assert (=> d!158905 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659410)))

(assert (= (and d!158905 c!139942) b!1522273))

(assert (= (and d!158905 (not c!139942)) b!1522270))

(assert (= (and b!1522270 c!139941) b!1522271))

(assert (= (and b!1522270 (not c!139941)) b!1522274))

(assert (= (and d!158905 c!139943) b!1522275))

(assert (= (and d!158905 (not c!139943)) b!1522276))

(assert (= (and b!1522276 res!1041490) b!1522277))

(assert (= (and b!1522277 (not res!1041489)) b!1522272))

(assert (= (and b!1522272 (not res!1041488)) b!1522269))

(declare-fun m!1404769 () Bool)

(assert (=> b!1522269 m!1404769))

(assert (=> d!158905 m!1404635))

(declare-fun m!1404771 () Bool)

(assert (=> d!158905 m!1404771))

(assert (=> d!158905 m!1404535))

(assert (=> b!1522272 m!1404769))

(assert (=> b!1522277 m!1404769))

(assert (=> b!1522274 m!1404635))

(declare-fun m!1404773 () Bool)

(assert (=> b!1522274 m!1404773))

(assert (=> b!1522274 m!1404773))

(assert (=> b!1522274 m!1404525))

(declare-fun m!1404775 () Bool)

(assert (=> b!1522274 m!1404775))

(assert (=> b!1522123 d!158905))

(declare-fun d!158907 () Bool)

(declare-fun lt!659411 () (_ BitVec 32))

(assert (=> d!158907 (and (bvsge lt!659411 #b00000000000000000000000000000000) (bvslt lt!659411 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!158907 (= lt!659411 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!158907 (validMask!0 mask!2512)))

(assert (=> d!158907 (= (nextIndex!0 index!487 x!534 mask!2512) lt!659411)))

(declare-fun bs!43655 () Bool)

(assert (= bs!43655 d!158907))

(declare-fun m!1404777 () Bool)

(assert (=> bs!43655 m!1404777))

(assert (=> bs!43655 m!1404535))

(assert (=> b!1522123 d!158907))

(declare-fun b!1522278 () Bool)

(declare-fun lt!659413 () SeekEntryResult!13064)

(assert (=> b!1522278 (and (bvsge (index!54653 lt!659413) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659413) (size!49428 a!2804)))))

(declare-fun e!848786 () Bool)

(assert (=> b!1522278 (= e!848786 (= (select (arr!48876 a!2804) (index!54653 lt!659413)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522279 () Bool)

(declare-fun e!848788 () SeekEntryResult!13064)

(declare-fun e!848790 () SeekEntryResult!13064)

(assert (=> b!1522279 (= e!848788 e!848790)))

(declare-fun lt!659412 () (_ BitVec 64))

(declare-fun c!139944 () Bool)

(assert (=> b!1522279 (= c!139944 (or (= lt!659412 (select (arr!48876 a!2804) j!70)) (= (bvadd lt!659412 lt!659412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522280 () Bool)

(assert (=> b!1522280 (= e!848790 (Intermediate!13064 false (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522281 () Bool)

(assert (=> b!1522281 (and (bvsge (index!54653 lt!659413) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659413) (size!49428 a!2804)))))

(declare-fun res!1041491 () Bool)

(assert (=> b!1522281 (= res!1041491 (= (select (arr!48876 a!2804) (index!54653 lt!659413)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522281 (=> res!1041491 e!848786)))

(declare-fun b!1522282 () Bool)

(assert (=> b!1522282 (= e!848788 (Intermediate!13064 true (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522283 () Bool)

(assert (=> b!1522283 (= e!848790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522285 () Bool)

(declare-fun e!848787 () Bool)

(declare-fun e!848789 () Bool)

(assert (=> b!1522285 (= e!848787 e!848789)))

(declare-fun res!1041493 () Bool)

(assert (=> b!1522285 (= res!1041493 (and (is-Intermediate!13064 lt!659413) (not (undefined!13876 lt!659413)) (bvslt (x!136334 lt!659413) #b01111111111111111111111111111110) (bvsge (x!136334 lt!659413) #b00000000000000000000000000000000) (bvsge (x!136334 lt!659413) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522285 (=> (not res!1041493) (not e!848789))))

(declare-fun b!1522286 () Bool)

(assert (=> b!1522286 (and (bvsge (index!54653 lt!659413) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659413) (size!49428 a!2804)))))

(declare-fun res!1041492 () Bool)

(assert (=> b!1522286 (= res!1041492 (= (select (arr!48876 a!2804) (index!54653 lt!659413)) (select (arr!48876 a!2804) j!70)))))

(assert (=> b!1522286 (=> res!1041492 e!848786)))

(assert (=> b!1522286 (= e!848789 e!848786)))

(declare-fun b!1522284 () Bool)

(assert (=> b!1522284 (= e!848787 (bvsge (x!136334 lt!659413) #b01111111111111111111111111111110))))

(declare-fun d!158909 () Bool)

(assert (=> d!158909 e!848787))

(declare-fun c!139946 () Bool)

(assert (=> d!158909 (= c!139946 (and (is-Intermediate!13064 lt!659413) (undefined!13876 lt!659413)))))

(assert (=> d!158909 (= lt!659413 e!848788)))

(declare-fun c!139945 () Bool)

(assert (=> d!158909 (= c!139945 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158909 (= lt!659412 (select (arr!48876 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!158909 (validMask!0 mask!2512)))

(assert (=> d!158909 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659413)))

(assert (= (and d!158909 c!139945) b!1522282))

(assert (= (and d!158909 (not c!139945)) b!1522279))

(assert (= (and b!1522279 c!139944) b!1522280))

(assert (= (and b!1522279 (not c!139944)) b!1522283))

(assert (= (and d!158909 c!139946) b!1522284))

(assert (= (and d!158909 (not c!139946)) b!1522285))

(assert (= (and b!1522285 res!1041493) b!1522286))

(assert (= (and b!1522286 (not res!1041492)) b!1522281))

(assert (= (and b!1522281 (not res!1041491)) b!1522278))

(declare-fun m!1404779 () Bool)

(assert (=> b!1522278 m!1404779))

(assert (=> d!158909 m!1404709))

(declare-fun m!1404781 () Bool)

(assert (=> d!158909 m!1404781))

(assert (=> d!158909 m!1404535))

(assert (=> b!1522281 m!1404779))

(assert (=> b!1522286 m!1404779))

(assert (=> b!1522283 m!1404709))

(declare-fun m!1404783 () Bool)

(assert (=> b!1522283 m!1404783))

(assert (=> b!1522283 m!1404783))

(assert (=> b!1522283 m!1404525))

(declare-fun m!1404785 () Bool)

(assert (=> b!1522283 m!1404785))

(assert (=> b!1522215 d!158909))

(declare-fun d!158911 () Bool)

(declare-fun lt!659414 () (_ BitVec 32))

(assert (=> d!158911 (and (bvsge lt!659414 #b00000000000000000000000000000000) (bvslt lt!659414 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!158911 (= lt!659414 (choose!52 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!158911 (validMask!0 mask!2512)))

(assert (=> d!158911 (= (nextIndex!0 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659414)))

(declare-fun bs!43656 () Bool)

(assert (= bs!43656 d!158911))

(assert (=> bs!43656 m!1404539))

(declare-fun m!1404787 () Bool)

(assert (=> bs!43656 m!1404787))

(assert (=> bs!43656 m!1404535))

(assert (=> b!1522215 d!158911))

(assert (=> d!158875 d!158861))

(declare-fun d!158913 () Bool)

(assert (=> d!158913 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!158913 true))

(declare-fun _$72!158 () Unit!50751)

(assert (=> d!158913 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!158)))

(declare-fun bs!43657 () Bool)

(assert (= bs!43657 d!158913))

(assert (=> bs!43657 m!1404531))

(assert (=> d!158875 d!158913))

(assert (=> d!158875 d!158821))

(declare-fun d!158919 () Bool)

(declare-fun lt!659420 () Bool)

(declare-fun content!777 (List!35437) (Set (_ BitVec 64)))

(assert (=> d!158919 (= lt!659420 (set.member (select (arr!48876 a!2804) #b00000000000000000000000000000000) (content!777 Nil!35434)))))

(declare-fun e!848798 () Bool)

(assert (=> d!158919 (= lt!659420 e!848798)))

(declare-fun res!1041500 () Bool)

(assert (=> d!158919 (=> (not res!1041500) (not e!848798))))

(assert (=> d!158919 (= res!1041500 (is-Cons!35433 Nil!35434))))

(assert (=> d!158919 (= (contains!9952 Nil!35434 (select (arr!48876 a!2804) #b00000000000000000000000000000000)) lt!659420)))

(declare-fun b!1522295 () Bool)

(declare-fun e!848799 () Bool)

(assert (=> b!1522295 (= e!848798 e!848799)))

(declare-fun res!1041501 () Bool)

(assert (=> b!1522295 (=> res!1041501 e!848799)))

(assert (=> b!1522295 (= res!1041501 (= (h!36855 Nil!35434) (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522296 () Bool)

(assert (=> b!1522296 (= e!848799 (contains!9952 (t!50123 Nil!35434) (select (arr!48876 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158919 res!1041500) b!1522295))

(assert (= (and b!1522295 (not res!1041501)) b!1522296))

(declare-fun m!1404801 () Bool)

(assert (=> d!158919 m!1404801))

(assert (=> d!158919 m!1404697))

(declare-fun m!1404803 () Bool)

(assert (=> d!158919 m!1404803))

(assert (=> b!1522296 m!1404697))

(declare-fun m!1404805 () Bool)

(assert (=> b!1522296 m!1404805))

(assert (=> b!1522208 d!158919))

(declare-fun lt!659434 () SeekEntryResult!13064)

(declare-fun d!158921 () Bool)

(assert (=> d!158921 (and (or (is-Undefined!13064 lt!659434) (not (is-Found!13064 lt!659434)) (and (bvsge (index!54652 lt!659434) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659434) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659434) (is-Found!13064 lt!659434) (not (is-MissingVacant!13064 lt!659434)) (not (= (index!54654 lt!659434) (index!54653 lt!659351))) (and (bvsge (index!54654 lt!659434) #b00000000000000000000000000000000) (bvslt (index!54654 lt!659434) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659434) (ite (is-Found!13064 lt!659434) (= (select (arr!48876 a!2804) (index!54652 lt!659434)) (select (arr!48876 a!2804) j!70)) (and (is-MissingVacant!13064 lt!659434) (= (index!54654 lt!659434) (index!54653 lt!659351)) (= (select (arr!48876 a!2804) (index!54654 lt!659434)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!848822 () SeekEntryResult!13064)

(assert (=> d!158921 (= lt!659434 e!848822)))

(declare-fun c!139968 () Bool)

(assert (=> d!158921 (= c!139968 (bvsge (x!136334 lt!659351) #b01111111111111111111111111111110))))

(declare-fun lt!659433 () (_ BitVec 64))

(assert (=> d!158921 (= lt!659433 (select (arr!48876 a!2804) (index!54653 lt!659351)))))

(assert (=> d!158921 (validMask!0 mask!2512)))

(assert (=> d!158921 (= (seekKeyOrZeroReturnVacant!0 (x!136334 lt!659351) (index!54653 lt!659351) (index!54653 lt!659351) (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659434)))

(declare-fun b!1522336 () Bool)

(declare-fun e!848821 () SeekEntryResult!13064)

(assert (=> b!1522336 (= e!848821 (Found!13064 (index!54653 lt!659351)))))

(declare-fun b!1522337 () Bool)

(declare-fun e!848820 () SeekEntryResult!13064)

(assert (=> b!1522337 (= e!848820 (MissingVacant!13064 (index!54653 lt!659351)))))

(declare-fun b!1522338 () Bool)

(declare-fun c!139966 () Bool)

(assert (=> b!1522338 (= c!139966 (= lt!659433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522338 (= e!848821 e!848820)))

(declare-fun b!1522339 () Bool)

(assert (=> b!1522339 (= e!848820 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136334 lt!659351) #b00000000000000000000000000000001) (nextIndex!0 (index!54653 lt!659351) (x!136334 lt!659351) mask!2512) (index!54653 lt!659351) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522340 () Bool)

(assert (=> b!1522340 (= e!848822 e!848821)))

(declare-fun c!139967 () Bool)

(assert (=> b!1522340 (= c!139967 (= lt!659433 (select (arr!48876 a!2804) j!70)))))

(declare-fun b!1522341 () Bool)

(assert (=> b!1522341 (= e!848822 Undefined!13064)))

(assert (= (and d!158921 c!139968) b!1522341))

(assert (= (and d!158921 (not c!139968)) b!1522340))

(assert (= (and b!1522340 c!139967) b!1522336))

(assert (= (and b!1522340 (not c!139967)) b!1522338))

(assert (= (and b!1522338 c!139966) b!1522337))

(assert (= (and b!1522338 (not c!139966)) b!1522339))

(declare-fun m!1404823 () Bool)

(assert (=> d!158921 m!1404823))

(declare-fun m!1404825 () Bool)

(assert (=> d!158921 m!1404825))

(assert (=> d!158921 m!1404659))

(assert (=> d!158921 m!1404535))

(declare-fun m!1404827 () Bool)

(assert (=> b!1522339 m!1404827))

(assert (=> b!1522339 m!1404827))

(assert (=> b!1522339 m!1404525))

(declare-fun m!1404829 () Bool)

(assert (=> b!1522339 m!1404829))

(assert (=> b!1522160 d!158921))

(assert (=> b!1522194 d!158883))

(assert (=> b!1522206 d!158891))

(declare-fun d!158927 () Bool)

(assert (=> d!158927 (arrayContainsKey!0 a!2804 lt!659369 #b00000000000000000000000000000000)))

(declare-fun lt!659435 () Unit!50751)

(assert (=> d!158927 (= lt!659435 (choose!13 a!2804 lt!659369 j!70))))

(assert (=> d!158927 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!158927 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659369 j!70) lt!659435)))

(declare-fun bs!43658 () Bool)

(assert (= bs!43658 d!158927))

(assert (=> bs!43658 m!1404689))

(declare-fun m!1404831 () Bool)

(assert (=> bs!43658 m!1404831))

(assert (=> b!1522193 d!158927))

(declare-fun d!158929 () Bool)

(declare-fun res!1041505 () Bool)

(declare-fun e!848823 () Bool)

(assert (=> d!158929 (=> res!1041505 e!848823)))

(assert (=> d!158929 (= res!1041505 (= (select (arr!48876 a!2804) #b00000000000000000000000000000000) lt!659369))))

(assert (=> d!158929 (= (arrayContainsKey!0 a!2804 lt!659369 #b00000000000000000000000000000000) e!848823)))

(declare-fun b!1522342 () Bool)

(declare-fun e!848824 () Bool)

(assert (=> b!1522342 (= e!848823 e!848824)))

(declare-fun res!1041506 () Bool)

(assert (=> b!1522342 (=> (not res!1041506) (not e!848824))))

(assert (=> b!1522342 (= res!1041506 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49428 a!2804)))))

(declare-fun b!1522343 () Bool)

(assert (=> b!1522343 (= e!848824 (arrayContainsKey!0 a!2804 lt!659369 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158929 (not res!1041505)) b!1522342))

(assert (= (and b!1522342 res!1041506) b!1522343))

(assert (=> d!158929 m!1404697))

(declare-fun m!1404833 () Bool)

(assert (=> b!1522343 m!1404833))

(assert (=> b!1522193 d!158929))

(declare-fun b!1522344 () Bool)

(declare-fun e!848826 () SeekEntryResult!13064)

(assert (=> b!1522344 (= e!848826 Undefined!13064)))

(declare-fun b!1522345 () Bool)

(declare-fun c!139970 () Bool)

(declare-fun lt!659440 () (_ BitVec 64))

(assert (=> b!1522345 (= c!139970 (= lt!659440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848827 () SeekEntryResult!13064)

(declare-fun e!848825 () SeekEntryResult!13064)

(assert (=> b!1522345 (= e!848827 e!848825)))

(declare-fun b!1522346 () Bool)

(declare-fun lt!659438 () SeekEntryResult!13064)

(assert (=> b!1522346 (= e!848827 (Found!13064 (index!54653 lt!659438)))))

(declare-fun b!1522347 () Bool)

(assert (=> b!1522347 (= e!848826 e!848827)))

(assert (=> b!1522347 (= lt!659440 (select (arr!48876 a!2804) (index!54653 lt!659438)))))

(declare-fun c!139969 () Bool)

(assert (=> b!1522347 (= c!139969 (= lt!659440 (select (arr!48876 a!2804) j!70)))))

(declare-fun d!158931 () Bool)

(declare-fun lt!659439 () SeekEntryResult!13064)

(assert (=> d!158931 (and (or (is-Undefined!13064 lt!659439) (not (is-Found!13064 lt!659439)) (and (bvsge (index!54652 lt!659439) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659439) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659439) (is-Found!13064 lt!659439) (not (is-MissingZero!13064 lt!659439)) (and (bvsge (index!54651 lt!659439) #b00000000000000000000000000000000) (bvslt (index!54651 lt!659439) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659439) (is-Found!13064 lt!659439) (is-MissingZero!13064 lt!659439) (not (is-MissingVacant!13064 lt!659439)) (and (bvsge (index!54654 lt!659439) #b00000000000000000000000000000000) (bvslt (index!54654 lt!659439) (size!49428 a!2804)))) (or (is-Undefined!13064 lt!659439) (ite (is-Found!13064 lt!659439) (= (select (arr!48876 a!2804) (index!54652 lt!659439)) (select (arr!48876 a!2804) j!70)) (ite (is-MissingZero!13064 lt!659439) (= (select (arr!48876 a!2804) (index!54651 lt!659439)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13064 lt!659439) (= (select (arr!48876 a!2804) (index!54654 lt!659439)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!158931 (= lt!659439 e!848826)))

(declare-fun c!139971 () Bool)

(assert (=> d!158931 (= c!139971 (and (is-Intermediate!13064 lt!659438) (undefined!13876 lt!659438)))))

(assert (=> d!158931 (= lt!659438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158931 (validMask!0 mask!2512)))

(assert (=> d!158931 (= (seekEntryOrOpen!0 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659439)))

(declare-fun b!1522348 () Bool)

(assert (=> b!1522348 (= e!848825 (seekKeyOrZeroReturnVacant!0 (x!136334 lt!659438) (index!54653 lt!659438) (index!54653 lt!659438) (select (arr!48876 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522349 () Bool)

(assert (=> b!1522349 (= e!848825 (MissingZero!13064 (index!54653 lt!659438)))))

(assert (= (and d!158931 c!139971) b!1522344))

(assert (= (and d!158931 (not c!139971)) b!1522347))

(assert (= (and b!1522347 c!139969) b!1522346))

(assert (= (and b!1522347 (not c!139969)) b!1522345))

(assert (= (and b!1522345 c!139970) b!1522349))

(assert (= (and b!1522345 (not c!139970)) b!1522348))

(declare-fun m!1404835 () Bool)

(assert (=> b!1522347 m!1404835))

(declare-fun m!1404839 () Bool)

(assert (=> d!158931 m!1404839))

(declare-fun m!1404841 () Bool)

(assert (=> d!158931 m!1404841))

(assert (=> d!158931 m!1404525))

(assert (=> d!158931 m!1404539))

(declare-fun m!1404843 () Bool)

(assert (=> d!158931 m!1404843))

(assert (=> d!158931 m!1404539))

(assert (=> d!158931 m!1404525))

(assert (=> d!158931 m!1404541))

(assert (=> d!158931 m!1404535))

(assert (=> b!1522348 m!1404525))

(declare-fun m!1404845 () Bool)

(assert (=> b!1522348 m!1404845))

(assert (=> b!1522193 d!158931))

(assert (=> b!1522209 d!158891))

(declare-fun d!158935 () Bool)

(declare-fun res!1041510 () Bool)

(declare-fun e!848833 () Bool)

(assert (=> d!158935 (=> res!1041510 e!848833)))

(assert (=> d!158935 (= res!1041510 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49428 a!2804)))))

(assert (=> d!158935 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!848833)))

(declare-fun b!1522355 () Bool)

(declare-fun e!848832 () Bool)

(declare-fun call!68367 () Bool)

(assert (=> b!1522355 (= e!848832 call!68367)))

(declare-fun b!1522356 () Bool)

(declare-fun e!848834 () Bool)

(assert (=> b!1522356 (= e!848834 call!68367)))

(declare-fun b!1522357 () Bool)

(assert (=> b!1522357 (= e!848832 e!848834)))

(declare-fun lt!659443 () (_ BitVec 64))

(assert (=> b!1522357 (= lt!659443 (select (arr!48876 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!659442 () Unit!50751)

(assert (=> b!1522357 (= lt!659442 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659443 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1522357 (arrayContainsKey!0 a!2804 lt!659443 #b00000000000000000000000000000000)))

(declare-fun lt!659444 () Unit!50751)

(assert (=> b!1522357 (= lt!659444 lt!659442)))

(declare-fun res!1041511 () Bool)

(assert (=> b!1522357 (= res!1041511 (= (seekEntryOrOpen!0 (select (arr!48876 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13064 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1522357 (=> (not res!1041511) (not e!848834))))

(declare-fun b!1522358 () Bool)

(assert (=> b!1522358 (= e!848833 e!848832)))

(declare-fun c!139973 () Bool)

(assert (=> b!1522358 (= c!139973 (validKeyInArray!0 (select (arr!48876 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun bm!68364 () Bool)

(assert (=> bm!68364 (= call!68367 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158935 (not res!1041510)) b!1522358))

(assert (= (and b!1522358 c!139973) b!1522357))

(assert (= (and b!1522358 (not c!139973)) b!1522355))

(assert (= (and b!1522357 res!1041511) b!1522356))

(assert (= (or b!1522356 b!1522355) bm!68364))

(declare-fun m!1404847 () Bool)

(assert (=> b!1522357 m!1404847))

(declare-fun m!1404849 () Bool)

(assert (=> b!1522357 m!1404849))

(declare-fun m!1404851 () Bool)

(assert (=> b!1522357 m!1404851))

(assert (=> b!1522357 m!1404847))

(declare-fun m!1404855 () Bool)

(assert (=> b!1522357 m!1404855))

(assert (=> b!1522358 m!1404847))

(assert (=> b!1522358 m!1404847))

(declare-fun m!1404857 () Bool)

(assert (=> b!1522358 m!1404857))

(declare-fun m!1404859 () Bool)

(assert (=> bm!68364 m!1404859))

(assert (=> bm!68356 d!158935))

(assert (=> d!158879 d!158821))

(declare-fun b!1522359 () Bool)

(declare-fun e!848836 () Bool)

(declare-fun call!68368 () Bool)

(assert (=> b!1522359 (= e!848836 call!68368)))

(declare-fun d!158937 () Bool)

(declare-fun res!1041512 () Bool)

(declare-fun e!848838 () Bool)

(assert (=> d!158937 (=> res!1041512 e!848838)))

(assert (=> d!158937 (= res!1041512 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49428 a!2804)))))

(assert (=> d!158937 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139920 (Cons!35433 (select (arr!48876 a!2804) #b00000000000000000000000000000000) Nil!35434) Nil!35434)) e!848838)))

(declare-fun b!1522360 () Bool)

(declare-fun e!848837 () Bool)

(assert (=> b!1522360 (= e!848837 e!848836)))

(declare-fun c!139974 () Bool)

(assert (=> b!1522360 (= c!139974 (validKeyInArray!0 (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522361 () Bool)

(assert (=> b!1522361 (= e!848836 call!68368)))

(declare-fun b!1522362 () Bool)

(declare-fun e!848835 () Bool)

(assert (=> b!1522362 (= e!848835 (contains!9952 (ite c!139920 (Cons!35433 (select (arr!48876 a!2804) #b00000000000000000000000000000000) Nil!35434) Nil!35434) (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!68365 () Bool)

(assert (=> bm!68365 (= call!68368 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!139974 (Cons!35433 (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!139920 (Cons!35433 (select (arr!48876 a!2804) #b00000000000000000000000000000000) Nil!35434) Nil!35434)) (ite c!139920 (Cons!35433 (select (arr!48876 a!2804) #b00000000000000000000000000000000) Nil!35434) Nil!35434))))))

(declare-fun b!1522363 () Bool)

(assert (=> b!1522363 (= e!848838 e!848837)))

(declare-fun res!1041513 () Bool)

(assert (=> b!1522363 (=> (not res!1041513) (not e!848837))))

(assert (=> b!1522363 (= res!1041513 (not e!848835))))

(declare-fun res!1041514 () Bool)

(assert (=> b!1522363 (=> (not res!1041514) (not e!848835))))

(assert (=> b!1522363 (= res!1041514 (validKeyInArray!0 (select (arr!48876 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!158937 (not res!1041512)) b!1522363))

(assert (= (and b!1522363 res!1041514) b!1522362))

(assert (= (and b!1522363 res!1041513) b!1522360))

(assert (= (and b!1522360 c!139974) b!1522361))

(assert (= (and b!1522360 (not c!139974)) b!1522359))

(assert (= (or b!1522361 b!1522359) bm!68365))

(assert (=> b!1522360 m!1404739))

(assert (=> b!1522360 m!1404739))

(assert (=> b!1522360 m!1404747))

(assert (=> b!1522362 m!1404739))

(assert (=> b!1522362 m!1404739))

(declare-fun m!1404863 () Bool)

(assert (=> b!1522362 m!1404863))

(assert (=> bm!68365 m!1404739))

(declare-fun m!1404865 () Bool)

(assert (=> bm!68365 m!1404865))

(assert (=> b!1522363 m!1404739))

(assert (=> b!1522363 m!1404739))

(assert (=> b!1522363 m!1404747))

(assert (=> bm!68359 d!158937))

(push 1)

(assert (not b!1522357))

(assert (not bm!68361))

(assert (not d!158913))

(assert (not b!1522339))

(assert (not bm!68364))

(assert (not b!1522348))

(assert (not d!158919))

(assert (not d!158907))

(assert (not bm!68365))

(assert (not b!1522244))

(assert (not b!1522296))

(assert (not b!1522283))

(assert (not d!158903))

(assert (not b!1522237))

(assert (not b!1522250))

(assert (not b!1522360))

(assert (not b!1522358))

(assert (not d!158895))

(assert (not d!158927))

(assert (not b!1522274))

(assert (not d!158911))

(assert (not d!158931))

(assert (not b!1522267))

(assert (not b!1522363))

(assert (not b!1522243))

(assert (not b!1522343))

(assert (not d!158909))

(assert (not d!158893))

(assert (not b!1522362))

(assert (not d!158921))

(assert (not d!158905))

(assert (not d!158899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

