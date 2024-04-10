; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120894 () Bool)

(assert start!120894)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96201 0))(
  ( (array!96202 (arr!46448 (Array (_ BitVec 32) (_ BitVec 64))) (size!46998 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96201)

(declare-fun e!796160 () Bool)

(declare-fun b!1406672 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10759 0))(
  ( (MissingZero!10759 (index!45413 (_ BitVec 32))) (Found!10759 (index!45414 (_ BitVec 32))) (Intermediate!10759 (undefined!11571 Bool) (index!45415 (_ BitVec 32)) (x!127014 (_ BitVec 32))) (Undefined!10759) (MissingVacant!10759 (index!45416 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96201 (_ BitVec 32)) SeekEntryResult!10759)

(assert (=> b!1406672 (= e!796160 (= (seekEntryOrOpen!0 (select (arr!46448 a!2901) j!112) a!2901 mask!2840) (Found!10759 j!112)))))

(declare-fun b!1406673 () Bool)

(declare-fun e!796158 () Bool)

(assert (=> b!1406673 (= e!796158 true)))

(declare-fun lt!619473 () SeekEntryResult!10759)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96201 (_ BitVec 32)) SeekEntryResult!10759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406673 (= lt!619473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46448 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46448 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96202 (store (arr!46448 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46998 a!2901)) mask!2840))))

(declare-fun b!1406674 () Bool)

(declare-fun res!944893 () Bool)

(declare-fun e!796159 () Bool)

(assert (=> b!1406674 (=> (not res!944893) (not e!796159))))

(assert (=> b!1406674 (= res!944893 (and (= (size!46998 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46998 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46998 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406675 () Bool)

(declare-fun res!944892 () Bool)

(assert (=> b!1406675 (=> (not res!944892) (not e!796159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406675 (= res!944892 (validKeyInArray!0 (select (arr!46448 a!2901) i!1037)))))

(declare-fun b!1406676 () Bool)

(declare-fun res!944895 () Bool)

(assert (=> b!1406676 (=> (not res!944895) (not e!796159))))

(declare-datatypes ((List!32967 0))(
  ( (Nil!32964) (Cons!32963 (h!34217 (_ BitVec 64)) (t!47661 List!32967)) )
))
(declare-fun arrayNoDuplicates!0 (array!96201 (_ BitVec 32) List!32967) Bool)

(assert (=> b!1406676 (= res!944895 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32964))))

(declare-fun b!1406677 () Bool)

(declare-fun res!944896 () Bool)

(assert (=> b!1406677 (=> (not res!944896) (not e!796159))))

(assert (=> b!1406677 (= res!944896 (validKeyInArray!0 (select (arr!46448 a!2901) j!112)))))

(declare-fun b!1406678 () Bool)

(assert (=> b!1406678 (= e!796159 (not e!796158))))

(declare-fun res!944890 () Bool)

(assert (=> b!1406678 (=> res!944890 e!796158)))

(declare-fun lt!619471 () SeekEntryResult!10759)

(assert (=> b!1406678 (= res!944890 (or (not (is-Intermediate!10759 lt!619471)) (undefined!11571 lt!619471)))))

(assert (=> b!1406678 e!796160))

(declare-fun res!944894 () Bool)

(assert (=> b!1406678 (=> (not res!944894) (not e!796160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96201 (_ BitVec 32)) Bool)

(assert (=> b!1406678 (= res!944894 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47492 0))(
  ( (Unit!47493) )
))
(declare-fun lt!619472 () Unit!47492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47492)

(assert (=> b!1406678 (= lt!619472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406678 (= lt!619471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46448 a!2901) j!112) mask!2840) (select (arr!46448 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944891 () Bool)

(assert (=> start!120894 (=> (not res!944891) (not e!796159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120894 (= res!944891 (validMask!0 mask!2840))))

(assert (=> start!120894 e!796159))

(assert (=> start!120894 true))

(declare-fun array_inv!35476 (array!96201) Bool)

(assert (=> start!120894 (array_inv!35476 a!2901)))

(declare-fun b!1406679 () Bool)

(declare-fun res!944889 () Bool)

(assert (=> b!1406679 (=> (not res!944889) (not e!796159))))

(assert (=> b!1406679 (= res!944889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120894 res!944891) b!1406674))

(assert (= (and b!1406674 res!944893) b!1406675))

(assert (= (and b!1406675 res!944892) b!1406677))

(assert (= (and b!1406677 res!944896) b!1406679))

(assert (= (and b!1406679 res!944889) b!1406676))

(assert (= (and b!1406676 res!944895) b!1406678))

(assert (= (and b!1406678 res!944894) b!1406672))

(assert (= (and b!1406678 (not res!944890)) b!1406673))

(declare-fun m!1295913 () Bool)

(assert (=> b!1406678 m!1295913))

(declare-fun m!1295915 () Bool)

(assert (=> b!1406678 m!1295915))

(assert (=> b!1406678 m!1295913))

(declare-fun m!1295917 () Bool)

(assert (=> b!1406678 m!1295917))

(assert (=> b!1406678 m!1295915))

(assert (=> b!1406678 m!1295913))

(declare-fun m!1295919 () Bool)

(assert (=> b!1406678 m!1295919))

(declare-fun m!1295921 () Bool)

(assert (=> b!1406678 m!1295921))

(assert (=> b!1406677 m!1295913))

(assert (=> b!1406677 m!1295913))

(declare-fun m!1295923 () Bool)

(assert (=> b!1406677 m!1295923))

(declare-fun m!1295925 () Bool)

(assert (=> start!120894 m!1295925))

(declare-fun m!1295927 () Bool)

(assert (=> start!120894 m!1295927))

(assert (=> b!1406672 m!1295913))

(assert (=> b!1406672 m!1295913))

(declare-fun m!1295929 () Bool)

(assert (=> b!1406672 m!1295929))

(declare-fun m!1295931 () Bool)

(assert (=> b!1406679 m!1295931))

(declare-fun m!1295933 () Bool)

(assert (=> b!1406676 m!1295933))

(declare-fun m!1295935 () Bool)

(assert (=> b!1406673 m!1295935))

(declare-fun m!1295937 () Bool)

(assert (=> b!1406673 m!1295937))

(assert (=> b!1406673 m!1295937))

(declare-fun m!1295939 () Bool)

(assert (=> b!1406673 m!1295939))

(assert (=> b!1406673 m!1295939))

(assert (=> b!1406673 m!1295937))

(declare-fun m!1295941 () Bool)

(assert (=> b!1406673 m!1295941))

(declare-fun m!1295943 () Bool)

(assert (=> b!1406675 m!1295943))

(assert (=> b!1406675 m!1295943))

(declare-fun m!1295945 () Bool)

(assert (=> b!1406675 m!1295945))

(push 1)

(assert (not b!1406672))

(assert (not b!1406678))

(assert (not b!1406673))

(assert (not start!120894))

(assert (not b!1406675))

(assert (not b!1406677))

(assert (not b!1406679))

(assert (not b!1406676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

