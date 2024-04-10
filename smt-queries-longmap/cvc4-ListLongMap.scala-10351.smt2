; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121660 () Bool)

(assert start!121660)

(declare-fun b!1413516 () Bool)

(declare-fun e!799949 () Bool)

(declare-fun e!799948 () Bool)

(assert (=> b!1413516 (= e!799949 e!799948)))

(declare-fun res!950514 () Bool)

(assert (=> b!1413516 (=> res!950514 e!799948)))

(declare-datatypes ((SeekEntryResult!10947 0))(
  ( (MissingZero!10947 (index!46168 (_ BitVec 32))) (Found!10947 (index!46169 (_ BitVec 32))) (Intermediate!10947 (undefined!11759 Bool) (index!46170 (_ BitVec 32)) (x!127746 (_ BitVec 32))) (Undefined!10947) (MissingVacant!10947 (index!46171 (_ BitVec 32))) )
))
(declare-fun lt!623092 () SeekEntryResult!10947)

(declare-fun lt!623090 () SeekEntryResult!10947)

(assert (=> b!1413516 (= res!950514 (or (= lt!623092 lt!623090) (not (is-Intermediate!10947 lt!623090))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!623089 () (_ BitVec 64))

(declare-datatypes ((array!96598 0))(
  ( (array!96599 (arr!46636 (Array (_ BitVec 32) (_ BitVec 64))) (size!47186 (_ BitVec 32))) )
))
(declare-fun lt!623088 () array!96598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96598 (_ BitVec 32)) SeekEntryResult!10947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413516 (= lt!623090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623089 mask!2840) lt!623089 lt!623088 mask!2840))))

(declare-fun a!2901 () array!96598)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413516 (= lt!623089 (select (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413516 (= lt!623088 (array!96599 (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47186 a!2901)))))

(declare-fun b!1413517 () Bool)

(assert (=> b!1413517 (= e!799948 (and (bvsge (x!127746 lt!623092) #b00000000000000000000000000000000) (bvsle (x!127746 lt!623092) #b01111111111111111111111111111110)))))

(declare-fun e!799951 () Bool)

(assert (=> b!1413517 e!799951))

(declare-fun res!950512 () Bool)

(assert (=> b!1413517 (=> (not res!950512) (not e!799951))))

(assert (=> b!1413517 (= res!950512 (and (not (undefined!11759 lt!623090)) (= (index!46170 lt!623090) i!1037) (bvslt (x!127746 lt!623090) (x!127746 lt!623092)) (= (select (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46170 lt!623090)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47868 0))(
  ( (Unit!47869) )
))
(declare-fun lt!623094 () Unit!47868)

(declare-fun lt!623093 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47868)

(assert (=> b!1413517 (= lt!623094 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623093 (x!127746 lt!623092) (index!46170 lt!623092) (x!127746 lt!623090) (index!46170 lt!623090) (undefined!11759 lt!623090) mask!2840))))

(declare-fun b!1413518 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96598 (_ BitVec 32)) SeekEntryResult!10947)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96598 (_ BitVec 32)) SeekEntryResult!10947)

(assert (=> b!1413518 (= e!799951 (= (seekEntryOrOpen!0 lt!623089 lt!623088 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127746 lt!623090) (index!46170 lt!623090) (index!46170 lt!623090) (select (arr!46636 a!2901) j!112) lt!623088 mask!2840)))))

(declare-fun b!1413519 () Bool)

(declare-fun res!950513 () Bool)

(declare-fun e!799947 () Bool)

(assert (=> b!1413519 (=> (not res!950513) (not e!799947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413519 (= res!950513 (validKeyInArray!0 (select (arr!46636 a!2901) i!1037)))))

(declare-fun b!1413520 () Bool)

(declare-fun res!950507 () Bool)

(assert (=> b!1413520 (=> (not res!950507) (not e!799947))))

(declare-datatypes ((List!33155 0))(
  ( (Nil!33152) (Cons!33151 (h!34426 (_ BitVec 64)) (t!47849 List!33155)) )
))
(declare-fun arrayNoDuplicates!0 (array!96598 (_ BitVec 32) List!33155) Bool)

(assert (=> b!1413520 (= res!950507 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33152))))

(declare-fun res!950506 () Bool)

(assert (=> start!121660 (=> (not res!950506) (not e!799947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121660 (= res!950506 (validMask!0 mask!2840))))

(assert (=> start!121660 e!799947))

(assert (=> start!121660 true))

(declare-fun array_inv!35664 (array!96598) Bool)

(assert (=> start!121660 (array_inv!35664 a!2901)))

(declare-fun b!1413521 () Bool)

(declare-fun res!950508 () Bool)

(assert (=> b!1413521 (=> (not res!950508) (not e!799947))))

(assert (=> b!1413521 (= res!950508 (validKeyInArray!0 (select (arr!46636 a!2901) j!112)))))

(declare-fun b!1413522 () Bool)

(declare-fun res!950509 () Bool)

(assert (=> b!1413522 (=> (not res!950509) (not e!799947))))

(assert (=> b!1413522 (= res!950509 (and (= (size!47186 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47186 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47186 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413523 () Bool)

(declare-fun e!799950 () Bool)

(assert (=> b!1413523 (= e!799950 (= (seekEntryOrOpen!0 (select (arr!46636 a!2901) j!112) a!2901 mask!2840) (Found!10947 j!112)))))

(declare-fun b!1413524 () Bool)

(declare-fun res!950515 () Bool)

(assert (=> b!1413524 (=> (not res!950515) (not e!799947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96598 (_ BitVec 32)) Bool)

(assert (=> b!1413524 (= res!950515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413525 () Bool)

(assert (=> b!1413525 (= e!799947 (not e!799949))))

(declare-fun res!950510 () Bool)

(assert (=> b!1413525 (=> res!950510 e!799949)))

(assert (=> b!1413525 (= res!950510 (or (not (is-Intermediate!10947 lt!623092)) (undefined!11759 lt!623092)))))

(assert (=> b!1413525 e!799950))

(declare-fun res!950511 () Bool)

(assert (=> b!1413525 (=> (not res!950511) (not e!799950))))

(assert (=> b!1413525 (= res!950511 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623091 () Unit!47868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47868)

(assert (=> b!1413525 (= lt!623091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413525 (= lt!623092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623093 (select (arr!46636 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413525 (= lt!623093 (toIndex!0 (select (arr!46636 a!2901) j!112) mask!2840))))

(assert (= (and start!121660 res!950506) b!1413522))

(assert (= (and b!1413522 res!950509) b!1413519))

(assert (= (and b!1413519 res!950513) b!1413521))

(assert (= (and b!1413521 res!950508) b!1413524))

(assert (= (and b!1413524 res!950515) b!1413520))

(assert (= (and b!1413520 res!950507) b!1413525))

(assert (= (and b!1413525 res!950511) b!1413523))

(assert (= (and b!1413525 (not res!950510)) b!1413516))

(assert (= (and b!1413516 (not res!950514)) b!1413517))

(assert (= (and b!1413517 res!950512) b!1413518))

(declare-fun m!1303971 () Bool)

(assert (=> b!1413518 m!1303971))

(declare-fun m!1303973 () Bool)

(assert (=> b!1413518 m!1303973))

(assert (=> b!1413518 m!1303973))

(declare-fun m!1303975 () Bool)

(assert (=> b!1413518 m!1303975))

(declare-fun m!1303977 () Bool)

(assert (=> b!1413516 m!1303977))

(assert (=> b!1413516 m!1303977))

(declare-fun m!1303979 () Bool)

(assert (=> b!1413516 m!1303979))

(declare-fun m!1303981 () Bool)

(assert (=> b!1413516 m!1303981))

(declare-fun m!1303983 () Bool)

(assert (=> b!1413516 m!1303983))

(declare-fun m!1303985 () Bool)

(assert (=> b!1413520 m!1303985))

(assert (=> b!1413525 m!1303973))

(declare-fun m!1303987 () Bool)

(assert (=> b!1413525 m!1303987))

(assert (=> b!1413525 m!1303973))

(assert (=> b!1413525 m!1303973))

(declare-fun m!1303989 () Bool)

(assert (=> b!1413525 m!1303989))

(declare-fun m!1303991 () Bool)

(assert (=> b!1413525 m!1303991))

(declare-fun m!1303993 () Bool)

(assert (=> b!1413525 m!1303993))

(declare-fun m!1303995 () Bool)

(assert (=> b!1413524 m!1303995))

(assert (=> b!1413523 m!1303973))

(assert (=> b!1413523 m!1303973))

(declare-fun m!1303997 () Bool)

(assert (=> b!1413523 m!1303997))

(assert (=> b!1413517 m!1303981))

(declare-fun m!1303999 () Bool)

(assert (=> b!1413517 m!1303999))

(declare-fun m!1304001 () Bool)

(assert (=> b!1413517 m!1304001))

(declare-fun m!1304003 () Bool)

(assert (=> start!121660 m!1304003))

(declare-fun m!1304005 () Bool)

(assert (=> start!121660 m!1304005))

(declare-fun m!1304007 () Bool)

(assert (=> b!1413519 m!1304007))

(assert (=> b!1413519 m!1304007))

(declare-fun m!1304009 () Bool)

(assert (=> b!1413519 m!1304009))

(assert (=> b!1413521 m!1303973))

(assert (=> b!1413521 m!1303973))

(declare-fun m!1304011 () Bool)

(assert (=> b!1413521 m!1304011))

(push 1)

(assert (not b!1413518))

(assert (not b!1413519))

(assert (not b!1413517))

(assert (not b!1413524))

(assert (not b!1413523))

(assert (not b!1413521))

(assert (not start!121660))

(assert (not b!1413525))

(assert (not b!1413516))

(assert (not b!1413520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1413586 () Bool)

(declare-fun e!799986 () SeekEntryResult!10947)

(declare-fun lt!623135 () SeekEntryResult!10947)

(assert (=> b!1413586 (= e!799986 (Found!10947 (index!46170 lt!623135)))))

(declare-fun b!1413587 () Bool)

(declare-fun e!799987 () SeekEntryResult!10947)

(assert (=> b!1413587 (= e!799987 (MissingZero!10947 (index!46170 lt!623135)))))

(declare-fun b!1413588 () Bool)

(declare-fun e!799988 () SeekEntryResult!10947)

(assert (=> b!1413588 (= e!799988 e!799986)))

(declare-fun lt!623134 () (_ BitVec 64))

(assert (=> b!1413588 (= lt!623134 (select (arr!46636 a!2901) (index!46170 lt!623135)))))

(declare-fun c!131006 () Bool)

(assert (=> b!1413588 (= c!131006 (= lt!623134 (select (arr!46636 a!2901) j!112)))))

(declare-fun b!1413589 () Bool)

(declare-fun c!131005 () Bool)

(assert (=> b!1413589 (= c!131005 (= lt!623134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413589 (= e!799986 e!799987)))

(declare-fun d!152133 () Bool)

(declare-fun lt!623136 () SeekEntryResult!10947)

(assert (=> d!152133 (and (or (is-Undefined!10947 lt!623136) (not (is-Found!10947 lt!623136)) (and (bvsge (index!46169 lt!623136) #b00000000000000000000000000000000) (bvslt (index!46169 lt!623136) (size!47186 a!2901)))) (or (is-Undefined!10947 lt!623136) (is-Found!10947 lt!623136) (not (is-MissingZero!10947 lt!623136)) (and (bvsge (index!46168 lt!623136) #b00000000000000000000000000000000) (bvslt (index!46168 lt!623136) (size!47186 a!2901)))) (or (is-Undefined!10947 lt!623136) (is-Found!10947 lt!623136) (is-MissingZero!10947 lt!623136) (not (is-MissingVacant!10947 lt!623136)) (and (bvsge (index!46171 lt!623136) #b00000000000000000000000000000000) (bvslt (index!46171 lt!623136) (size!47186 a!2901)))) (or (is-Undefined!10947 lt!623136) (ite (is-Found!10947 lt!623136) (= (select (arr!46636 a!2901) (index!46169 lt!623136)) (select (arr!46636 a!2901) j!112)) (ite (is-MissingZero!10947 lt!623136) (= (select (arr!46636 a!2901) (index!46168 lt!623136)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10947 lt!623136) (= (select (arr!46636 a!2901) (index!46171 lt!623136)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152133 (= lt!623136 e!799988)))

(declare-fun c!131007 () Bool)

(assert (=> d!152133 (= c!131007 (and (is-Intermediate!10947 lt!623135) (undefined!11759 lt!623135)))))

(assert (=> d!152133 (= lt!623135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46636 a!2901) j!112) mask!2840) (select (arr!46636 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152133 (validMask!0 mask!2840)))

(assert (=> d!152133 (= (seekEntryOrOpen!0 (select (arr!46636 a!2901) j!112) a!2901 mask!2840) lt!623136)))

(declare-fun b!1413590 () Bool)

(assert (=> b!1413590 (= e!799988 Undefined!10947)))

(declare-fun b!1413591 () Bool)

(assert (=> b!1413591 (= e!799987 (seekKeyOrZeroReturnVacant!0 (x!127746 lt!623135) (index!46170 lt!623135) (index!46170 lt!623135) (select (arr!46636 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152133 c!131007) b!1413590))

(assert (= (and d!152133 (not c!131007)) b!1413588))

(assert (= (and b!1413588 c!131006) b!1413586))

(assert (= (and b!1413588 (not c!131006)) b!1413589))

(assert (= (and b!1413589 c!131005) b!1413587))

(assert (= (and b!1413589 (not c!131005)) b!1413591))

(declare-fun m!1304047 () Bool)

(assert (=> b!1413588 m!1304047))

(assert (=> d!152133 m!1303973))

(assert (=> d!152133 m!1303987))

(assert (=> d!152133 m!1303987))

(assert (=> d!152133 m!1303973))

(declare-fun m!1304049 () Bool)

(assert (=> d!152133 m!1304049))

(declare-fun m!1304051 () Bool)

(assert (=> d!152133 m!1304051))

(declare-fun m!1304053 () Bool)

(assert (=> d!152133 m!1304053))

(declare-fun m!1304055 () Bool)

(assert (=> d!152133 m!1304055))

(assert (=> d!152133 m!1304003))

(assert (=> b!1413591 m!1303973))

(declare-fun m!1304057 () Bool)

(assert (=> b!1413591 m!1304057))

(assert (=> b!1413523 d!152133))

(declare-fun b!1413592 () Bool)

(declare-fun e!799989 () SeekEntryResult!10947)

(declare-fun lt!623138 () SeekEntryResult!10947)

(assert (=> b!1413592 (= e!799989 (Found!10947 (index!46170 lt!623138)))))

(declare-fun b!1413593 () Bool)

(declare-fun e!799990 () SeekEntryResult!10947)

(assert (=> b!1413593 (= e!799990 (MissingZero!10947 (index!46170 lt!623138)))))

(declare-fun b!1413594 () Bool)

(declare-fun e!799991 () SeekEntryResult!10947)

(assert (=> b!1413594 (= e!799991 e!799989)))

(declare-fun lt!623137 () (_ BitVec 64))

(assert (=> b!1413594 (= lt!623137 (select (arr!46636 lt!623088) (index!46170 lt!623138)))))

(declare-fun c!131009 () Bool)

(assert (=> b!1413594 (= c!131009 (= lt!623137 lt!623089))))

(declare-fun b!1413595 () Bool)

(declare-fun c!131008 () Bool)

(assert (=> b!1413595 (= c!131008 (= lt!623137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413595 (= e!799989 e!799990)))

(declare-fun d!152141 () Bool)

(declare-fun lt!623139 () SeekEntryResult!10947)

(assert (=> d!152141 (and (or (is-Undefined!10947 lt!623139) (not (is-Found!10947 lt!623139)) (and (bvsge (index!46169 lt!623139) #b00000000000000000000000000000000) (bvslt (index!46169 lt!623139) (size!47186 lt!623088)))) (or (is-Undefined!10947 lt!623139) (is-Found!10947 lt!623139) (not (is-MissingZero!10947 lt!623139)) (and (bvsge (index!46168 lt!623139) #b00000000000000000000000000000000) (bvslt (index!46168 lt!623139) (size!47186 lt!623088)))) (or (is-Undefined!10947 lt!623139) (is-Found!10947 lt!623139) (is-MissingZero!10947 lt!623139) (not (is-MissingVacant!10947 lt!623139)) (and (bvsge (index!46171 lt!623139) #b00000000000000000000000000000000) (bvslt (index!46171 lt!623139) (size!47186 lt!623088)))) (or (is-Undefined!10947 lt!623139) (ite (is-Found!10947 lt!623139) (= (select (arr!46636 lt!623088) (index!46169 lt!623139)) lt!623089) (ite (is-MissingZero!10947 lt!623139) (= (select (arr!46636 lt!623088) (index!46168 lt!623139)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10947 lt!623139) (= (select (arr!46636 lt!623088) (index!46171 lt!623139)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152141 (= lt!623139 e!799991)))

(declare-fun c!131010 () Bool)

(assert (=> d!152141 (= c!131010 (and (is-Intermediate!10947 lt!623138) (undefined!11759 lt!623138)))))

(assert (=> d!152141 (= lt!623138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623089 mask!2840) lt!623089 lt!623088 mask!2840))))

(assert (=> d!152141 (validMask!0 mask!2840)))

(assert (=> d!152141 (= (seekEntryOrOpen!0 lt!623089 lt!623088 mask!2840) lt!623139)))

(declare-fun b!1413596 () Bool)

(assert (=> b!1413596 (= e!799991 Undefined!10947)))

(declare-fun b!1413597 () Bool)

(assert (=> b!1413597 (= e!799990 (seekKeyOrZeroReturnVacant!0 (x!127746 lt!623138) (index!46170 lt!623138) (index!46170 lt!623138) lt!623089 lt!623088 mask!2840))))

(assert (= (and d!152141 c!131010) b!1413596))

(assert (= (and d!152141 (not c!131010)) b!1413594))

(assert (= (and b!1413594 c!131009) b!1413592))

(assert (= (and b!1413594 (not c!131009)) b!1413595))

(assert (= (and b!1413595 c!131008) b!1413593))

(assert (= (and b!1413595 (not c!131008)) b!1413597))

(declare-fun m!1304059 () Bool)

(assert (=> b!1413594 m!1304059))

(assert (=> d!152141 m!1303977))

(assert (=> d!152141 m!1303977))

(assert (=> d!152141 m!1303979))

(declare-fun m!1304061 () Bool)

(assert (=> d!152141 m!1304061))

(declare-fun m!1304063 () Bool)

(assert (=> d!152141 m!1304063))

(declare-fun m!1304065 () Bool)

(assert (=> d!152141 m!1304065))

(assert (=> d!152141 m!1304003))

(declare-fun m!1304067 () Bool)

(assert (=> b!1413597 m!1304067))

(assert (=> b!1413518 d!152141))

(declare-fun b!1413654 () Bool)

(declare-fun e!800025 () SeekEntryResult!10947)

(declare-fun e!800024 () SeekEntryResult!10947)

(assert (=> b!1413654 (= e!800025 e!800024)))

(declare-fun lt!623170 () (_ BitVec 64))

(declare-fun c!131031 () Bool)

(assert (=> b!1413654 (= c!131031 (= lt!623170 (select (arr!46636 a!2901) j!112)))))

(declare-fun b!1413656 () Bool)

(assert (=> b!1413656 (= e!800024 (Found!10947 (index!46170 lt!623090)))))

(declare-fun b!1413657 () Bool)

(assert (=> b!1413657 (= e!800025 Undefined!10947)))

(declare-fun b!1413658 () Bool)

(declare-fun c!131033 () Bool)

(assert (=> b!1413658 (= c!131033 (= lt!623170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800026 () SeekEntryResult!10947)

(assert (=> b!1413658 (= e!800024 e!800026)))

(declare-fun b!1413659 () Bool)

(assert (=> b!1413659 (= e!800026 (MissingVacant!10947 (index!46170 lt!623090)))))

(declare-fun b!1413655 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413655 (= e!800026 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127746 lt!623090) #b00000000000000000000000000000001) (nextIndex!0 (index!46170 lt!623090) (x!127746 lt!623090) mask!2840) (index!46170 lt!623090) (select (arr!46636 a!2901) j!112) lt!623088 mask!2840))))

(declare-fun lt!623169 () SeekEntryResult!10947)

(declare-fun d!152143 () Bool)

(assert (=> d!152143 (and (or (is-Undefined!10947 lt!623169) (not (is-Found!10947 lt!623169)) (and (bvsge (index!46169 lt!623169) #b00000000000000000000000000000000) (bvslt (index!46169 lt!623169) (size!47186 lt!623088)))) (or (is-Undefined!10947 lt!623169) (is-Found!10947 lt!623169) (not (is-MissingVacant!10947 lt!623169)) (not (= (index!46171 lt!623169) (index!46170 lt!623090))) (and (bvsge (index!46171 lt!623169) #b00000000000000000000000000000000) (bvslt (index!46171 lt!623169) (size!47186 lt!623088)))) (or (is-Undefined!10947 lt!623169) (ite (is-Found!10947 lt!623169) (= (select (arr!46636 lt!623088) (index!46169 lt!623169)) (select (arr!46636 a!2901) j!112)) (and (is-MissingVacant!10947 lt!623169) (= (index!46171 lt!623169) (index!46170 lt!623090)) (= (select (arr!46636 lt!623088) (index!46171 lt!623169)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152143 (= lt!623169 e!800025)))

(declare-fun c!131032 () Bool)

(assert (=> d!152143 (= c!131032 (bvsge (x!127746 lt!623090) #b01111111111111111111111111111110))))

(assert (=> d!152143 (= lt!623170 (select (arr!46636 lt!623088) (index!46170 lt!623090)))))

(assert (=> d!152143 (validMask!0 mask!2840)))

(assert (=> d!152143 (= (seekKeyOrZeroReturnVacant!0 (x!127746 lt!623090) (index!46170 lt!623090) (index!46170 lt!623090) (select (arr!46636 a!2901) j!112) lt!623088 mask!2840) lt!623169)))

(assert (= (and d!152143 c!131032) b!1413657))

(assert (= (and d!152143 (not c!131032)) b!1413654))

(assert (= (and b!1413654 c!131031) b!1413656))

(assert (= (and b!1413654 (not c!131031)) b!1413658))

(assert (= (and b!1413658 c!131033) b!1413659))

(assert (= (and b!1413658 (not c!131033)) b!1413655))

(declare-fun m!1304087 () Bool)

(assert (=> b!1413655 m!1304087))

(assert (=> b!1413655 m!1304087))

(assert (=> b!1413655 m!1303973))

(declare-fun m!1304089 () Bool)

(assert (=> b!1413655 m!1304089))

(declare-fun m!1304091 () Bool)

(assert (=> d!152143 m!1304091))

(declare-fun m!1304093 () Bool)

(assert (=> d!152143 m!1304093))

(declare-fun m!1304095 () Bool)

(assert (=> d!152143 m!1304095))

(assert (=> d!152143 m!1304003))

(assert (=> b!1413518 d!152143))

(declare-fun b!1413687 () Bool)

(declare-fun e!800049 () Bool)

(declare-fun call!67108 () Bool)

(assert (=> b!1413687 (= e!800049 call!67108)))

(declare-fun d!152159 () Bool)

(declare-fun res!950554 () Bool)

(declare-fun e!800050 () Bool)

(assert (=> d!152159 (=> res!950554 e!800050)))

(assert (=> d!152159 (= res!950554 (bvsge #b00000000000000000000000000000000 (size!47186 a!2901)))))

(assert (=> d!152159 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800050)))

(declare-fun b!1413688 () Bool)

(declare-fun e!800048 () Bool)

(assert (=> b!1413688 (= e!800050 e!800048)))

(declare-fun c!131040 () Bool)

(assert (=> b!1413688 (= c!131040 (validKeyInArray!0 (select (arr!46636 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413689 () Bool)

(assert (=> b!1413689 (= e!800048 call!67108)))

(declare-fun bm!67105 () Bool)

(assert (=> bm!67105 (= call!67108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413690 () Bool)

(assert (=> b!1413690 (= e!800048 e!800049)))

(declare-fun lt!623181 () (_ BitVec 64))

(assert (=> b!1413690 (= lt!623181 (select (arr!46636 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623180 () Unit!47868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96598 (_ BitVec 64) (_ BitVec 32)) Unit!47868)

(assert (=> b!1413690 (= lt!623180 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623181 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1413690 (arrayContainsKey!0 a!2901 lt!623181 #b00000000000000000000000000000000)))

(declare-fun lt!623182 () Unit!47868)

(assert (=> b!1413690 (= lt!623182 lt!623180)))

(declare-fun res!950555 () Bool)

(assert (=> b!1413690 (= res!950555 (= (seekEntryOrOpen!0 (select (arr!46636 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10947 #b00000000000000000000000000000000)))))

(assert (=> b!1413690 (=> (not res!950555) (not e!800049))))

(assert (= (and d!152159 (not res!950554)) b!1413688))

(assert (= (and b!1413688 c!131040) b!1413690))

(assert (= (and b!1413688 (not c!131040)) b!1413689))

(assert (= (and b!1413690 res!950555) b!1413687))

(assert (= (or b!1413687 b!1413689) bm!67105))

(declare-fun m!1304113 () Bool)

(assert (=> b!1413688 m!1304113))

(assert (=> b!1413688 m!1304113))

(declare-fun m!1304115 () Bool)

(assert (=> b!1413688 m!1304115))

(declare-fun m!1304117 () Bool)

(assert (=> bm!67105 m!1304117))

(assert (=> b!1413690 m!1304113))

(declare-fun m!1304119 () Bool)

(assert (=> b!1413690 m!1304119))

(declare-fun m!1304121 () Bool)

(assert (=> b!1413690 m!1304121))

(assert (=> b!1413690 m!1304113))

(declare-fun m!1304123 () Bool)

(assert (=> b!1413690 m!1304123))

(assert (=> b!1413524 d!152159))

(declare-fun d!152169 () Bool)

(assert (=> d!152169 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121660 d!152169))

(declare-fun d!152179 () Bool)

(assert (=> d!152179 (= (array_inv!35664 a!2901) (bvsge (size!47186 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121660 d!152179))

(declare-fun d!152181 () Bool)

(assert (=> d!152181 (and (not (undefined!11759 lt!623090)) (= (index!46170 lt!623090) i!1037) (bvslt (x!127746 lt!623090) (x!127746 lt!623092)))))

(declare-fun lt!623195 () Unit!47868)

(declare-fun choose!62 (array!96598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47868)

(assert (=> d!152181 (= lt!623195 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623093 (x!127746 lt!623092) (index!46170 lt!623092) (x!127746 lt!623090) (index!46170 lt!623090) (undefined!11759 lt!623090) mask!2840))))

(assert (=> d!152181 (validMask!0 mask!2840)))

(assert (=> d!152181 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623093 (x!127746 lt!623092) (index!46170 lt!623092) (x!127746 lt!623090) (index!46170 lt!623090) (undefined!11759 lt!623090) mask!2840) lt!623195)))

(declare-fun bs!41219 () Bool)

(assert (= bs!41219 d!152181))

(declare-fun m!1304151 () Bool)

(assert (=> bs!41219 m!1304151))

(assert (=> bs!41219 m!1304003))

(assert (=> b!1413517 d!152181))

(declare-fun d!152183 () Bool)

(assert (=> d!152183 (= (validKeyInArray!0 (select (arr!46636 a!2901) j!112)) (and (not (= (select (arr!46636 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46636 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413521 d!152183))

(declare-fun b!1413785 () Bool)

(declare-fun e!800107 () Bool)

(declare-fun lt!623217 () SeekEntryResult!10947)

(assert (=> b!1413785 (= e!800107 (bvsge (x!127746 lt!623217) #b01111111111111111111111111111110))))

(declare-fun b!1413786 () Bool)

(assert (=> b!1413786 (and (bvsge (index!46170 lt!623217) #b00000000000000000000000000000000) (bvslt (index!46170 lt!623217) (size!47186 lt!623088)))))

(declare-fun res!950584 () Bool)

(assert (=> b!1413786 (= res!950584 (= (select (arr!46636 lt!623088) (index!46170 lt!623217)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800109 () Bool)

(assert (=> b!1413786 (=> res!950584 e!800109)))

(declare-fun b!1413787 () Bool)

(assert (=> b!1413787 (and (bvsge (index!46170 lt!623217) #b00000000000000000000000000000000) (bvslt (index!46170 lt!623217) (size!47186 lt!623088)))))

(assert (=> b!1413787 (= e!800109 (= (select (arr!46636 lt!623088) (index!46170 lt!623217)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413788 () Bool)

(declare-fun e!800110 () Bool)

(assert (=> b!1413788 (= e!800107 e!800110)))

(declare-fun res!950585 () Bool)

(assert (=> b!1413788 (= res!950585 (and (is-Intermediate!10947 lt!623217) (not (undefined!11759 lt!623217)) (bvslt (x!127746 lt!623217) #b01111111111111111111111111111110) (bvsge (x!127746 lt!623217) #b00000000000000000000000000000000) (bvsge (x!127746 lt!623217) #b00000000000000000000000000000000)))))

(assert (=> b!1413788 (=> (not res!950585) (not e!800110))))

(declare-fun b!1413789 () Bool)

(assert (=> b!1413789 (and (bvsge (index!46170 lt!623217) #b00000000000000000000000000000000) (bvslt (index!46170 lt!623217) (size!47186 lt!623088)))))

(declare-fun res!950583 () Bool)

(assert (=> b!1413789 (= res!950583 (= (select (arr!46636 lt!623088) (index!46170 lt!623217)) lt!623089))))

(assert (=> b!1413789 (=> res!950583 e!800109)))

(assert (=> b!1413789 (= e!800110 e!800109)))

(declare-fun b!1413790 () Bool)

(declare-fun e!800106 () SeekEntryResult!10947)

(assert (=> b!1413790 (= e!800106 (Intermediate!10947 true (toIndex!0 lt!623089 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413791 () Bool)

(declare-fun e!800108 () SeekEntryResult!10947)

(assert (=> b!1413791 (= e!800108 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623089 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623089 lt!623088 mask!2840))))

(declare-fun d!152185 () Bool)

(assert (=> d!152185 e!800107))

(declare-fun c!131075 () Bool)

(assert (=> d!152185 (= c!131075 (and (is-Intermediate!10947 lt!623217) (undefined!11759 lt!623217)))))

(assert (=> d!152185 (= lt!623217 e!800106)))

(declare-fun c!131076 () Bool)

(assert (=> d!152185 (= c!131076 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623218 () (_ BitVec 64))

(assert (=> d!152185 (= lt!623218 (select (arr!46636 lt!623088) (toIndex!0 lt!623089 mask!2840)))))

(assert (=> d!152185 (validMask!0 mask!2840)))

(assert (=> d!152185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623089 mask!2840) lt!623089 lt!623088 mask!2840) lt!623217)))

(declare-fun b!1413792 () Bool)

(assert (=> b!1413792 (= e!800106 e!800108)))

(declare-fun c!131077 () Bool)

(assert (=> b!1413792 (= c!131077 (or (= lt!623218 lt!623089) (= (bvadd lt!623218 lt!623218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1413793 () Bool)

(assert (=> b!1413793 (= e!800108 (Intermediate!10947 false (toIndex!0 lt!623089 mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152185 c!131076) b!1413790))

(assert (= (and d!152185 (not c!131076)) b!1413792))

(assert (= (and b!1413792 c!131077) b!1413793))

(assert (= (and b!1413792 (not c!131077)) b!1413791))

(assert (= (and d!152185 c!131075) b!1413785))

(assert (= (and d!152185 (not c!131075)) b!1413788))

(assert (= (and b!1413788 res!950585) b!1413789))

(assert (= (and b!1413789 (not res!950583)) b!1413786))

(assert (= (and b!1413786 (not res!950584)) b!1413787))

(assert (=> d!152185 m!1303977))

(declare-fun m!1304181 () Bool)

(assert (=> d!152185 m!1304181))

(assert (=> d!152185 m!1304003))

(declare-fun m!1304183 () Bool)

(assert (=> b!1413789 m!1304183))

(assert (=> b!1413786 m!1304183))

(assert (=> b!1413791 m!1303977))

(declare-fun m!1304185 () Bool)

(assert (=> b!1413791 m!1304185))

(assert (=> b!1413791 m!1304185))

(declare-fun m!1304187 () Bool)

(assert (=> b!1413791 m!1304187))

(assert (=> b!1413787 m!1304183))

(assert (=> b!1413516 d!152185))

(declare-fun d!152195 () Bool)

(declare-fun lt!623228 () (_ BitVec 32))

(declare-fun lt!623227 () (_ BitVec 32))

(assert (=> d!152195 (= lt!623228 (bvmul (bvxor lt!623227 (bvlshr lt!623227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152195 (= lt!623227 ((_ extract 31 0) (bvand (bvxor lt!623089 (bvlshr lt!623089 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152195 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950586 (let ((h!34429 ((_ extract 31 0) (bvand (bvxor lt!623089 (bvlshr lt!623089 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127757 (bvmul (bvxor h!34429 (bvlshr h!34429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127757 (bvlshr x!127757 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950586 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950586 #b00000000000000000000000000000000))))))

(assert (=> d!152195 (= (toIndex!0 lt!623089 mask!2840) (bvand (bvxor lt!623228 (bvlshr lt!623228 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413516 d!152195))

(declare-fun d!152197 () Bool)

(assert (=> d!152197 (= (validKeyInArray!0 (select (arr!46636 a!2901) i!1037)) (and (not (= (select (arr!46636 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46636 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413519 d!152197))

(declare-fun b!1413806 () Bool)

(declare-fun e!800118 () Bool)

(declare-fun call!67113 () Bool)

(assert (=> b!1413806 (= e!800118 call!67113)))

(declare-fun d!152199 () Bool)

(declare-fun res!950587 () Bool)

(declare-fun e!800119 () Bool)

(assert (=> d!152199 (=> res!950587 e!800119)))

(assert (=> d!152199 (= res!950587 (bvsge j!112 (size!47186 a!2901)))))

(assert (=> d!152199 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800119)))

(declare-fun b!1413807 () Bool)

(declare-fun e!800117 () Bool)

(assert (=> b!1413807 (= e!800119 e!800117)))

(declare-fun c!131084 () Bool)

(assert (=> b!1413807 (= c!131084 (validKeyInArray!0 (select (arr!46636 a!2901) j!112)))))

(declare-fun b!1413808 () Bool)

(assert (=> b!1413808 (= e!800117 call!67113)))

(declare-fun bm!67110 () Bool)

(assert (=> bm!67110 (= call!67113 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413809 () Bool)

(assert (=> b!1413809 (= e!800117 e!800118)))

(declare-fun lt!623230 () (_ BitVec 64))

(assert (=> b!1413809 (= lt!623230 (select (arr!46636 a!2901) j!112))))

(declare-fun lt!623229 () Unit!47868)

(assert (=> b!1413809 (= lt!623229 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623230 j!112))))

(assert (=> b!1413809 (arrayContainsKey!0 a!2901 lt!623230 #b00000000000000000000000000000000)))

(declare-fun lt!623231 () Unit!47868)

(assert (=> b!1413809 (= lt!623231 lt!623229)))

(declare-fun res!950588 () Bool)

(assert (=> b!1413809 (= res!950588 (= (seekEntryOrOpen!0 (select (arr!46636 a!2901) j!112) a!2901 mask!2840) (Found!10947 j!112)))))

(assert (=> b!1413809 (=> (not res!950588) (not e!800118))))

(assert (= (and d!152199 (not res!950587)) b!1413807))

(assert (= (and b!1413807 c!131084) b!1413809))

(assert (= (and b!1413807 (not c!131084)) b!1413808))

(assert (= (and b!1413809 res!950588) b!1413806))

(assert (= (or b!1413806 b!1413808) bm!67110))

(assert (=> b!1413807 m!1303973))

(assert (=> b!1413807 m!1303973))

(assert (=> b!1413807 m!1304011))

(declare-fun m!1304189 () Bool)

(assert (=> bm!67110 m!1304189))

(assert (=> b!1413809 m!1303973))

(declare-fun m!1304191 () Bool)

(assert (=> b!1413809 m!1304191))

(declare-fun m!1304193 () Bool)

(assert (=> b!1413809 m!1304193))

(assert (=> b!1413809 m!1303973))

(assert (=> b!1413809 m!1303997))

(assert (=> b!1413525 d!152199))

(declare-fun d!152201 () Bool)

