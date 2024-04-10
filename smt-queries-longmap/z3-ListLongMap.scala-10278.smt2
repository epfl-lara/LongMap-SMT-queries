; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120830 () Bool)

(assert start!120830)

(declare-fun b!1405905 () Bool)

(declare-fun res!944121 () Bool)

(declare-fun e!795776 () Bool)

(assert (=> b!1405905 (=> (not res!944121) (not e!795776))))

(declare-datatypes ((array!96137 0))(
  ( (array!96138 (arr!46416 (Array (_ BitVec 32) (_ BitVec 64))) (size!46966 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96137)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405905 (= res!944121 (validKeyInArray!0 (select (arr!46416 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1405906 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!795774 () Bool)

(declare-datatypes ((SeekEntryResult!10727 0))(
  ( (MissingZero!10727 (index!45285 (_ BitVec 32))) (Found!10727 (index!45286 (_ BitVec 32))) (Intermediate!10727 (undefined!11539 Bool) (index!45287 (_ BitVec 32)) (x!126894 (_ BitVec 32))) (Undefined!10727) (MissingVacant!10727 (index!45288 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96137 (_ BitVec 32)) SeekEntryResult!10727)

(assert (=> b!1405906 (= e!795774 (= (seekEntryOrOpen!0 (select (arr!46416 a!2901) j!112) a!2901 mask!2840) (Found!10727 j!112)))))

(declare-fun b!1405907 () Bool)

(declare-fun res!944125 () Bool)

(assert (=> b!1405907 (=> (not res!944125) (not e!795776))))

(assert (=> b!1405907 (= res!944125 (and (= (size!46966 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46966 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46966 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405908 () Bool)

(declare-fun res!944123 () Bool)

(assert (=> b!1405908 (=> (not res!944123) (not e!795776))))

(assert (=> b!1405908 (= res!944123 (validKeyInArray!0 (select (arr!46416 a!2901) j!112)))))

(declare-fun b!1405909 () Bool)

(declare-fun e!795773 () Bool)

(assert (=> b!1405909 (= e!795776 (not e!795773))))

(declare-fun res!944128 () Bool)

(assert (=> b!1405909 (=> res!944128 e!795773)))

(declare-fun lt!619185 () SeekEntryResult!10727)

(get-info :version)

(assert (=> b!1405909 (= res!944128 (or (not ((_ is Intermediate!10727) lt!619185)) (undefined!11539 lt!619185)))))

(assert (=> b!1405909 e!795774))

(declare-fun res!944126 () Bool)

(assert (=> b!1405909 (=> (not res!944126) (not e!795774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96137 (_ BitVec 32)) Bool)

(assert (=> b!1405909 (= res!944126 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47428 0))(
  ( (Unit!47429) )
))
(declare-fun lt!619183 () Unit!47428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47428)

(assert (=> b!1405909 (= lt!619183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96137 (_ BitVec 32)) SeekEntryResult!10727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405909 (= lt!619185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46416 a!2901) j!112) mask!2840) (select (arr!46416 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405910 () Bool)

(declare-fun res!944124 () Bool)

(assert (=> b!1405910 (=> (not res!944124) (not e!795776))))

(declare-datatypes ((List!32935 0))(
  ( (Nil!32932) (Cons!32931 (h!34185 (_ BitVec 64)) (t!47629 List!32935)) )
))
(declare-fun arrayNoDuplicates!0 (array!96137 (_ BitVec 32) List!32935) Bool)

(assert (=> b!1405910 (= res!944124 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32932))))

(declare-fun b!1405911 () Bool)

(assert (=> b!1405911 (= e!795773 true)))

(declare-fun lt!619184 () SeekEntryResult!10727)

(assert (=> b!1405911 (= lt!619184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46416 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46416 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96138 (store (arr!46416 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46966 a!2901)) mask!2840))))

(declare-fun b!1405904 () Bool)

(declare-fun res!944122 () Bool)

(assert (=> b!1405904 (=> (not res!944122) (not e!795776))))

(assert (=> b!1405904 (= res!944122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944127 () Bool)

(assert (=> start!120830 (=> (not res!944127) (not e!795776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120830 (= res!944127 (validMask!0 mask!2840))))

(assert (=> start!120830 e!795776))

(assert (=> start!120830 true))

(declare-fun array_inv!35444 (array!96137) Bool)

(assert (=> start!120830 (array_inv!35444 a!2901)))

(assert (= (and start!120830 res!944127) b!1405907))

(assert (= (and b!1405907 res!944125) b!1405905))

(assert (= (and b!1405905 res!944121) b!1405908))

(assert (= (and b!1405908 res!944123) b!1405904))

(assert (= (and b!1405904 res!944122) b!1405910))

(assert (= (and b!1405910 res!944124) b!1405909))

(assert (= (and b!1405909 res!944126) b!1405906))

(assert (= (and b!1405909 (not res!944128)) b!1405911))

(declare-fun m!1294825 () Bool)

(assert (=> start!120830 m!1294825))

(declare-fun m!1294827 () Bool)

(assert (=> start!120830 m!1294827))

(declare-fun m!1294829 () Bool)

(assert (=> b!1405905 m!1294829))

(assert (=> b!1405905 m!1294829))

(declare-fun m!1294831 () Bool)

(assert (=> b!1405905 m!1294831))

(declare-fun m!1294833 () Bool)

(assert (=> b!1405908 m!1294833))

(assert (=> b!1405908 m!1294833))

(declare-fun m!1294835 () Bool)

(assert (=> b!1405908 m!1294835))

(declare-fun m!1294837 () Bool)

(assert (=> b!1405904 m!1294837))

(assert (=> b!1405906 m!1294833))

(assert (=> b!1405906 m!1294833))

(declare-fun m!1294839 () Bool)

(assert (=> b!1405906 m!1294839))

(assert (=> b!1405909 m!1294833))

(declare-fun m!1294841 () Bool)

(assert (=> b!1405909 m!1294841))

(assert (=> b!1405909 m!1294833))

(declare-fun m!1294843 () Bool)

(assert (=> b!1405909 m!1294843))

(assert (=> b!1405909 m!1294841))

(assert (=> b!1405909 m!1294833))

(declare-fun m!1294845 () Bool)

(assert (=> b!1405909 m!1294845))

(declare-fun m!1294847 () Bool)

(assert (=> b!1405909 m!1294847))

(declare-fun m!1294849 () Bool)

(assert (=> b!1405910 m!1294849))

(declare-fun m!1294851 () Bool)

(assert (=> b!1405911 m!1294851))

(declare-fun m!1294853 () Bool)

(assert (=> b!1405911 m!1294853))

(assert (=> b!1405911 m!1294853))

(declare-fun m!1294855 () Bool)

(assert (=> b!1405911 m!1294855))

(assert (=> b!1405911 m!1294855))

(assert (=> b!1405911 m!1294853))

(declare-fun m!1294857 () Bool)

(assert (=> b!1405911 m!1294857))

(check-sat (not b!1405911) (not b!1405908) (not b!1405906) (not b!1405909) (not b!1405910) (not b!1405905) (not start!120830) (not b!1405904))
