; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120890 () Bool)

(assert start!120890)

(declare-fun b!1406624 () Bool)

(declare-fun res!944841 () Bool)

(declare-fun e!796135 () Bool)

(assert (=> b!1406624 (=> (not res!944841) (not e!796135))))

(declare-datatypes ((array!96197 0))(
  ( (array!96198 (arr!46446 (Array (_ BitVec 32) (_ BitVec 64))) (size!46996 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96197)

(declare-datatypes ((List!32965 0))(
  ( (Nil!32962) (Cons!32961 (h!34215 (_ BitVec 64)) (t!47659 List!32965)) )
))
(declare-fun arrayNoDuplicates!0 (array!96197 (_ BitVec 32) List!32965) Bool)

(assert (=> b!1406624 (= res!944841 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32962))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!796133 () Bool)

(declare-fun b!1406625 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10757 0))(
  ( (MissingZero!10757 (index!45405 (_ BitVec 32))) (Found!10757 (index!45406 (_ BitVec 32))) (Intermediate!10757 (undefined!11569 Bool) (index!45407 (_ BitVec 32)) (x!127004 (_ BitVec 32))) (Undefined!10757) (MissingVacant!10757 (index!45408 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96197 (_ BitVec 32)) SeekEntryResult!10757)

(assert (=> b!1406625 (= e!796133 (= (seekEntryOrOpen!0 (select (arr!46446 a!2901) j!112) a!2901 mask!2840) (Found!10757 j!112)))))

(declare-fun b!1406626 () Bool)

(declare-fun e!796136 () Bool)

(assert (=> b!1406626 (= e!796135 (not e!796136))))

(declare-fun res!944846 () Bool)

(assert (=> b!1406626 (=> res!944846 e!796136)))

(declare-fun lt!619455 () SeekEntryResult!10757)

(get-info :version)

(assert (=> b!1406626 (= res!944846 (or (not ((_ is Intermediate!10757) lt!619455)) (undefined!11569 lt!619455)))))

(assert (=> b!1406626 e!796133))

(declare-fun res!944842 () Bool)

(assert (=> b!1406626 (=> (not res!944842) (not e!796133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96197 (_ BitVec 32)) Bool)

(assert (=> b!1406626 (= res!944842 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47488 0))(
  ( (Unit!47489) )
))
(declare-fun lt!619453 () Unit!47488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47488)

(assert (=> b!1406626 (= lt!619453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96197 (_ BitVec 32)) SeekEntryResult!10757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406626 (= lt!619455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46446 a!2901) j!112) mask!2840) (select (arr!46446 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406627 () Bool)

(declare-fun res!944845 () Bool)

(assert (=> b!1406627 (=> (not res!944845) (not e!796135))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406627 (= res!944845 (validKeyInArray!0 (select (arr!46446 a!2901) i!1037)))))

(declare-fun b!1406629 () Bool)

(declare-fun res!944843 () Bool)

(assert (=> b!1406629 (=> (not res!944843) (not e!796135))))

(assert (=> b!1406629 (= res!944843 (and (= (size!46996 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46996 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46996 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406630 () Bool)

(assert (=> b!1406630 (= e!796136 true)))

(declare-fun lt!619454 () SeekEntryResult!10757)

(assert (=> b!1406630 (= lt!619454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46446 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46446 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96198 (store (arr!46446 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46996 a!2901)) mask!2840))))

(declare-fun b!1406631 () Bool)

(declare-fun res!944847 () Bool)

(assert (=> b!1406631 (=> (not res!944847) (not e!796135))))

(assert (=> b!1406631 (= res!944847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406628 () Bool)

(declare-fun res!944848 () Bool)

(assert (=> b!1406628 (=> (not res!944848) (not e!796135))))

(assert (=> b!1406628 (= res!944848 (validKeyInArray!0 (select (arr!46446 a!2901) j!112)))))

(declare-fun res!944844 () Bool)

(assert (=> start!120890 (=> (not res!944844) (not e!796135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120890 (= res!944844 (validMask!0 mask!2840))))

(assert (=> start!120890 e!796135))

(assert (=> start!120890 true))

(declare-fun array_inv!35474 (array!96197) Bool)

(assert (=> start!120890 (array_inv!35474 a!2901)))

(assert (= (and start!120890 res!944844) b!1406629))

(assert (= (and b!1406629 res!944843) b!1406627))

(assert (= (and b!1406627 res!944845) b!1406628))

(assert (= (and b!1406628 res!944848) b!1406631))

(assert (= (and b!1406631 res!944847) b!1406624))

(assert (= (and b!1406624 res!944841) b!1406626))

(assert (= (and b!1406626 res!944842) b!1406625))

(assert (= (and b!1406626 (not res!944846)) b!1406630))

(declare-fun m!1295845 () Bool)

(assert (=> b!1406628 m!1295845))

(assert (=> b!1406628 m!1295845))

(declare-fun m!1295847 () Bool)

(assert (=> b!1406628 m!1295847))

(declare-fun m!1295849 () Bool)

(assert (=> b!1406624 m!1295849))

(assert (=> b!1406625 m!1295845))

(assert (=> b!1406625 m!1295845))

(declare-fun m!1295851 () Bool)

(assert (=> b!1406625 m!1295851))

(declare-fun m!1295853 () Bool)

(assert (=> b!1406627 m!1295853))

(assert (=> b!1406627 m!1295853))

(declare-fun m!1295855 () Bool)

(assert (=> b!1406627 m!1295855))

(declare-fun m!1295857 () Bool)

(assert (=> start!120890 m!1295857))

(declare-fun m!1295859 () Bool)

(assert (=> start!120890 m!1295859))

(declare-fun m!1295861 () Bool)

(assert (=> b!1406630 m!1295861))

(declare-fun m!1295863 () Bool)

(assert (=> b!1406630 m!1295863))

(assert (=> b!1406630 m!1295863))

(declare-fun m!1295865 () Bool)

(assert (=> b!1406630 m!1295865))

(assert (=> b!1406630 m!1295865))

(assert (=> b!1406630 m!1295863))

(declare-fun m!1295867 () Bool)

(assert (=> b!1406630 m!1295867))

(assert (=> b!1406626 m!1295845))

(declare-fun m!1295869 () Bool)

(assert (=> b!1406626 m!1295869))

(assert (=> b!1406626 m!1295845))

(declare-fun m!1295871 () Bool)

(assert (=> b!1406626 m!1295871))

(assert (=> b!1406626 m!1295869))

(assert (=> b!1406626 m!1295845))

(declare-fun m!1295873 () Bool)

(assert (=> b!1406626 m!1295873))

(declare-fun m!1295875 () Bool)

(assert (=> b!1406626 m!1295875))

(declare-fun m!1295877 () Bool)

(assert (=> b!1406631 m!1295877))

(check-sat (not b!1406627) (not b!1406625) (not start!120890) (not b!1406628) (not b!1406624) (not b!1406631) (not b!1406630) (not b!1406626))
