; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120076 () Bool)

(assert start!120076)

(declare-fun res!936900 () Bool)

(declare-fun e!791437 () Bool)

(assert (=> start!120076 (=> (not res!936900) (not e!791437))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120076 (= res!936900 (validMask!0 mask!2840))))

(assert (=> start!120076 e!791437))

(assert (=> start!120076 true))

(declare-datatypes ((array!95605 0))(
  ( (array!95606 (arr!46156 (Array (_ BitVec 32) (_ BitVec 64))) (size!46706 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95605)

(declare-fun array_inv!35184 (array!95605) Bool)

(assert (=> start!120076 (array_inv!35184 a!2901)))

(declare-fun b!1397986 () Bool)

(declare-fun res!936902 () Bool)

(assert (=> b!1397986 (=> (not res!936902) (not e!791437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95605 (_ BitVec 32)) Bool)

(assert (=> b!1397986 (= res!936902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397987 () Bool)

(declare-fun res!936907 () Bool)

(assert (=> b!1397987 (=> (not res!936907) (not e!791437))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397987 (= res!936907 (validKeyInArray!0 (select (arr!46156 a!2901) i!1037)))))

(declare-fun b!1397988 () Bool)

(declare-fun res!936904 () Bool)

(assert (=> b!1397988 (=> (not res!936904) (not e!791437))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397988 (= res!936904 (validKeyInArray!0 (select (arr!46156 a!2901) j!112)))))

(declare-fun b!1397989 () Bool)

(declare-fun e!791438 () Bool)

(assert (=> b!1397989 (= e!791438 true)))

(declare-fun lt!614629 () (_ BitVec 32))

(declare-fun lt!614630 () array!95605)

(declare-datatypes ((SeekEntryResult!10473 0))(
  ( (MissingZero!10473 (index!44263 (_ BitVec 32))) (Found!10473 (index!44264 (_ BitVec 32))) (Intermediate!10473 (undefined!11285 Bool) (index!44265 (_ BitVec 32)) (x!125911 (_ BitVec 32))) (Undefined!10473) (MissingVacant!10473 (index!44266 (_ BitVec 32))) )
))
(declare-fun lt!614632 () SeekEntryResult!10473)

(declare-fun lt!614634 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95605 (_ BitVec 32)) SeekEntryResult!10473)

(assert (=> b!1397989 (= lt!614632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614629 lt!614634 lt!614630 mask!2840))))

(declare-fun b!1397990 () Bool)

(declare-fun res!936905 () Bool)

(assert (=> b!1397990 (=> (not res!936905) (not e!791437))))

(declare-datatypes ((List!32675 0))(
  ( (Nil!32672) (Cons!32671 (h!33913 (_ BitVec 64)) (t!47369 List!32675)) )
))
(declare-fun arrayNoDuplicates!0 (array!95605 (_ BitVec 32) List!32675) Bool)

(assert (=> b!1397990 (= res!936905 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32672))))

(declare-fun b!1397991 () Bool)

(declare-fun res!936903 () Bool)

(assert (=> b!1397991 (=> (not res!936903) (not e!791437))))

(assert (=> b!1397991 (= res!936903 (and (= (size!46706 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46706 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46706 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397992 () Bool)

(declare-fun e!791435 () Bool)

(assert (=> b!1397992 (= e!791437 (not e!791435))))

(declare-fun res!936906 () Bool)

(assert (=> b!1397992 (=> res!936906 e!791435)))

(declare-fun lt!614631 () SeekEntryResult!10473)

(assert (=> b!1397992 (= res!936906 (or (not (is-Intermediate!10473 lt!614631)) (undefined!11285 lt!614631)))))

(declare-fun e!791436 () Bool)

(assert (=> b!1397992 e!791436))

(declare-fun res!936901 () Bool)

(assert (=> b!1397992 (=> (not res!936901) (not e!791436))))

(assert (=> b!1397992 (= res!936901 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46950 0))(
  ( (Unit!46951) )
))
(declare-fun lt!614633 () Unit!46950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46950)

(assert (=> b!1397992 (= lt!614633 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397992 (= lt!614631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614629 (select (arr!46156 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397992 (= lt!614629 (toIndex!0 (select (arr!46156 a!2901) j!112) mask!2840))))

(declare-fun b!1397993 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95605 (_ BitVec 32)) SeekEntryResult!10473)

(assert (=> b!1397993 (= e!791436 (= (seekEntryOrOpen!0 (select (arr!46156 a!2901) j!112) a!2901 mask!2840) (Found!10473 j!112)))))

(declare-fun b!1397994 () Bool)

(assert (=> b!1397994 (= e!791435 e!791438)))

(declare-fun res!936899 () Bool)

(assert (=> b!1397994 (=> res!936899 e!791438)))

(declare-fun lt!614628 () SeekEntryResult!10473)

(assert (=> b!1397994 (= res!936899 (or (= lt!614631 lt!614628) (not (is-Intermediate!10473 lt!614628)) (bvslt (x!125911 lt!614631) #b00000000000000000000000000000000) (bvsgt (x!125911 lt!614631) #b01111111111111111111111111111110) (bvslt lt!614629 #b00000000000000000000000000000000) (bvsge lt!614629 (size!46706 a!2901)) (bvslt (index!44265 lt!614631) #b00000000000000000000000000000000) (bvsge (index!44265 lt!614631) (size!46706 a!2901)) (not (= lt!614631 (Intermediate!10473 false (index!44265 lt!614631) (x!125911 lt!614631)))) (not (= lt!614628 (Intermediate!10473 (undefined!11285 lt!614628) (index!44265 lt!614628) (x!125911 lt!614628))))))))

(assert (=> b!1397994 (= lt!614628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614634 mask!2840) lt!614634 lt!614630 mask!2840))))

(assert (=> b!1397994 (= lt!614634 (select (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397994 (= lt!614630 (array!95606 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46706 a!2901)))))

(assert (= (and start!120076 res!936900) b!1397991))

(assert (= (and b!1397991 res!936903) b!1397987))

(assert (= (and b!1397987 res!936907) b!1397988))

(assert (= (and b!1397988 res!936904) b!1397986))

(assert (= (and b!1397986 res!936902) b!1397990))

(assert (= (and b!1397990 res!936905) b!1397992))

(assert (= (and b!1397992 res!936901) b!1397993))

(assert (= (and b!1397992 (not res!936906)) b!1397994))

(assert (= (and b!1397994 (not res!936899)) b!1397989))

(declare-fun m!1284939 () Bool)

(assert (=> b!1397986 m!1284939))

(declare-fun m!1284941 () Bool)

(assert (=> b!1397990 m!1284941))

(declare-fun m!1284943 () Bool)

(assert (=> b!1397989 m!1284943))

(declare-fun m!1284945 () Bool)

(assert (=> b!1397987 m!1284945))

(assert (=> b!1397987 m!1284945))

(declare-fun m!1284947 () Bool)

(assert (=> b!1397987 m!1284947))

(declare-fun m!1284949 () Bool)

(assert (=> b!1397992 m!1284949))

(declare-fun m!1284951 () Bool)

(assert (=> b!1397992 m!1284951))

(assert (=> b!1397992 m!1284949))

(declare-fun m!1284953 () Bool)

(assert (=> b!1397992 m!1284953))

(assert (=> b!1397992 m!1284949))

(declare-fun m!1284955 () Bool)

(assert (=> b!1397992 m!1284955))

(declare-fun m!1284957 () Bool)

(assert (=> b!1397992 m!1284957))

(declare-fun m!1284959 () Bool)

(assert (=> start!120076 m!1284959))

(declare-fun m!1284961 () Bool)

(assert (=> start!120076 m!1284961))

(declare-fun m!1284963 () Bool)

(assert (=> b!1397994 m!1284963))

(assert (=> b!1397994 m!1284963))

(declare-fun m!1284965 () Bool)

(assert (=> b!1397994 m!1284965))

(declare-fun m!1284967 () Bool)

(assert (=> b!1397994 m!1284967))

(declare-fun m!1284969 () Bool)

(assert (=> b!1397994 m!1284969))

(assert (=> b!1397988 m!1284949))

(assert (=> b!1397988 m!1284949))

(declare-fun m!1284971 () Bool)

(assert (=> b!1397988 m!1284971))

(assert (=> b!1397993 m!1284949))

(assert (=> b!1397993 m!1284949))

(declare-fun m!1284973 () Bool)

(assert (=> b!1397993 m!1284973))

(push 1)

