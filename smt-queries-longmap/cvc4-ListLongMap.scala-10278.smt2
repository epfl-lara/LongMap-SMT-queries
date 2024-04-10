; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120832 () Bool)

(assert start!120832)

(declare-fun b!1405928 () Bool)

(declare-fun res!944145 () Bool)

(declare-fun e!795785 () Bool)

(assert (=> b!1405928 (=> (not res!944145) (not e!795785))))

(declare-datatypes ((array!96139 0))(
  ( (array!96140 (arr!46417 (Array (_ BitVec 32) (_ BitVec 64))) (size!46967 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96139)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405928 (= res!944145 (validKeyInArray!0 (select (arr!46417 a!2901) j!112)))))

(declare-fun b!1405929 () Bool)

(declare-fun res!944151 () Bool)

(assert (=> b!1405929 (=> (not res!944151) (not e!795785))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96139 (_ BitVec 32)) Bool)

(assert (=> b!1405929 (= res!944151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405930 () Bool)

(declare-fun e!795788 () Bool)

(declare-datatypes ((SeekEntryResult!10728 0))(
  ( (MissingZero!10728 (index!45289 (_ BitVec 32))) (Found!10728 (index!45290 (_ BitVec 32))) (Intermediate!10728 (undefined!11540 Bool) (index!45291 (_ BitVec 32)) (x!126895 (_ BitVec 32))) (Undefined!10728) (MissingVacant!10728 (index!45292 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96139 (_ BitVec 32)) SeekEntryResult!10728)

(assert (=> b!1405930 (= e!795788 (= (seekEntryOrOpen!0 (select (arr!46417 a!2901) j!112) a!2901 mask!2840) (Found!10728 j!112)))))

(declare-fun b!1405931 () Bool)

(declare-fun res!944150 () Bool)

(assert (=> b!1405931 (=> (not res!944150) (not e!795785))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405931 (= res!944150 (and (= (size!46967 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46967 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46967 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405932 () Bool)

(declare-fun e!795787 () Bool)

(assert (=> b!1405932 (= e!795785 (not e!795787))))

(declare-fun res!944152 () Bool)

(assert (=> b!1405932 (=> res!944152 e!795787)))

(declare-fun lt!619194 () SeekEntryResult!10728)

(assert (=> b!1405932 (= res!944152 (or (not (is-Intermediate!10728 lt!619194)) (undefined!11540 lt!619194)))))

(assert (=> b!1405932 e!795788))

(declare-fun res!944147 () Bool)

(assert (=> b!1405932 (=> (not res!944147) (not e!795788))))

(assert (=> b!1405932 (= res!944147 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47430 0))(
  ( (Unit!47431) )
))
(declare-fun lt!619193 () Unit!47430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47430)

(assert (=> b!1405932 (= lt!619193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96139 (_ BitVec 32)) SeekEntryResult!10728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405932 (= lt!619194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46417 a!2901) j!112) mask!2840) (select (arr!46417 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944149 () Bool)

(assert (=> start!120832 (=> (not res!944149) (not e!795785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120832 (= res!944149 (validMask!0 mask!2840))))

(assert (=> start!120832 e!795785))

(assert (=> start!120832 true))

(declare-fun array_inv!35445 (array!96139) Bool)

(assert (=> start!120832 (array_inv!35445 a!2901)))

(declare-fun b!1405933 () Bool)

(declare-fun res!944146 () Bool)

(assert (=> b!1405933 (=> (not res!944146) (not e!795785))))

(assert (=> b!1405933 (= res!944146 (validKeyInArray!0 (select (arr!46417 a!2901) i!1037)))))

(declare-fun b!1405934 () Bool)

(declare-fun res!944148 () Bool)

(assert (=> b!1405934 (=> (not res!944148) (not e!795785))))

(declare-datatypes ((List!32936 0))(
  ( (Nil!32933) (Cons!32932 (h!34186 (_ BitVec 64)) (t!47630 List!32936)) )
))
(declare-fun arrayNoDuplicates!0 (array!96139 (_ BitVec 32) List!32936) Bool)

(assert (=> b!1405934 (= res!944148 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32933))))

(declare-fun b!1405935 () Bool)

(assert (=> b!1405935 (= e!795787 true)))

(declare-fun lt!619192 () SeekEntryResult!10728)

(assert (=> b!1405935 (= lt!619192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46417 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46417 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96140 (store (arr!46417 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46967 a!2901)) mask!2840))))

(assert (= (and start!120832 res!944149) b!1405931))

(assert (= (and b!1405931 res!944150) b!1405933))

(assert (= (and b!1405933 res!944146) b!1405928))

(assert (= (and b!1405928 res!944145) b!1405929))

(assert (= (and b!1405929 res!944151) b!1405934))

(assert (= (and b!1405934 res!944148) b!1405932))

(assert (= (and b!1405932 res!944147) b!1405930))

(assert (= (and b!1405932 (not res!944152)) b!1405935))

(declare-fun m!1294859 () Bool)

(assert (=> b!1405934 m!1294859))

(declare-fun m!1294861 () Bool)

(assert (=> b!1405930 m!1294861))

(assert (=> b!1405930 m!1294861))

(declare-fun m!1294863 () Bool)

(assert (=> b!1405930 m!1294863))

(declare-fun m!1294865 () Bool)

(assert (=> b!1405935 m!1294865))

(declare-fun m!1294867 () Bool)

(assert (=> b!1405935 m!1294867))

(assert (=> b!1405935 m!1294867))

(declare-fun m!1294869 () Bool)

(assert (=> b!1405935 m!1294869))

(assert (=> b!1405935 m!1294869))

(assert (=> b!1405935 m!1294867))

(declare-fun m!1294871 () Bool)

(assert (=> b!1405935 m!1294871))

(declare-fun m!1294873 () Bool)

(assert (=> b!1405933 m!1294873))

(assert (=> b!1405933 m!1294873))

(declare-fun m!1294875 () Bool)

(assert (=> b!1405933 m!1294875))

(declare-fun m!1294877 () Bool)

(assert (=> start!120832 m!1294877))

(declare-fun m!1294879 () Bool)

(assert (=> start!120832 m!1294879))

(assert (=> b!1405932 m!1294861))

(declare-fun m!1294881 () Bool)

(assert (=> b!1405932 m!1294881))

(assert (=> b!1405932 m!1294861))

(declare-fun m!1294883 () Bool)

(assert (=> b!1405932 m!1294883))

(assert (=> b!1405932 m!1294881))

(assert (=> b!1405932 m!1294861))

(declare-fun m!1294885 () Bool)

(assert (=> b!1405932 m!1294885))

(declare-fun m!1294887 () Bool)

(assert (=> b!1405932 m!1294887))

(declare-fun m!1294889 () Bool)

(assert (=> b!1405929 m!1294889))

(assert (=> b!1405928 m!1294861))

(assert (=> b!1405928 m!1294861))

(declare-fun m!1294891 () Bool)

(assert (=> b!1405928 m!1294891))

(push 1)

(assert (not b!1405934))

(assert (not b!1405930))

(assert (not b!1405935))

(assert (not b!1405928))

(assert (not b!1405932))

(assert (not start!120832))

(assert (not b!1405933))

(assert (not b!1405929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

