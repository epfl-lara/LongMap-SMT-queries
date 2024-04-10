; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121102 () Bool)

(assert start!121102)

(declare-fun res!945763 () Bool)

(declare-fun e!796913 () Bool)

(assert (=> start!121102 (=> (not res!945763) (not e!796913))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121102 (= res!945763 (validMask!0 mask!2840))))

(assert (=> start!121102 e!796913))

(assert (=> start!121102 true))

(declare-datatypes ((array!96256 0))(
  ( (array!96257 (arr!46471 (Array (_ BitVec 32) (_ BitVec 64))) (size!47021 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96256)

(declare-fun array_inv!35499 (array!96256) Bool)

(assert (=> start!121102 (array_inv!35499 a!2901)))

(declare-fun b!1408033 () Bool)

(declare-fun res!945756 () Bool)

(declare-fun e!796911 () Bool)

(assert (=> b!1408033 (=> res!945756 e!796911)))

(declare-fun lt!620063 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10782 0))(
  ( (MissingZero!10782 (index!45505 (_ BitVec 32))) (Found!10782 (index!45506 (_ BitVec 32))) (Intermediate!10782 (undefined!11594 Bool) (index!45507 (_ BitVec 32)) (x!127111 (_ BitVec 32))) (Undefined!10782) (MissingVacant!10782 (index!45508 (_ BitVec 32))) )
))
(declare-fun lt!620065 () SeekEntryResult!10782)

(assert (=> b!1408033 (= res!945756 (or (bvslt (x!127111 lt!620065) #b00000000000000000000000000000000) (bvsgt (x!127111 lt!620065) #b01111111111111111111111111111110) (bvslt lt!620063 #b00000000000000000000000000000000) (bvsge lt!620063 (size!47021 a!2901)) (bvslt (index!45507 lt!620065) #b00000000000000000000000000000000) (bvsge (index!45507 lt!620065) (size!47021 a!2901)) (not (= lt!620065 (Intermediate!10782 false (index!45507 lt!620065) (x!127111 lt!620065))))))))

(declare-fun b!1408034 () Bool)

(declare-fun e!796910 () Bool)

(assert (=> b!1408034 (= e!796910 e!796911)))

(declare-fun res!945761 () Bool)

(assert (=> b!1408034 (=> res!945761 e!796911)))

(declare-fun lt!620062 () array!96256)

(declare-fun lt!620061 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96256 (_ BitVec 32)) SeekEntryResult!10782)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408034 (= res!945761 (not (= lt!620065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620061 mask!2840) lt!620061 lt!620062 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408034 (= lt!620061 (select (store (arr!46471 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408034 (= lt!620062 (array!96257 (store (arr!46471 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47021 a!2901)))))

(declare-fun b!1408035 () Bool)

(declare-fun res!945755 () Bool)

(assert (=> b!1408035 (=> (not res!945755) (not e!796913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408035 (= res!945755 (validKeyInArray!0 (select (arr!46471 a!2901) j!112)))))

(declare-fun b!1408036 () Bool)

(declare-fun res!945760 () Bool)

(assert (=> b!1408036 (=> (not res!945760) (not e!796913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96256 (_ BitVec 32)) Bool)

(assert (=> b!1408036 (= res!945760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408037 () Bool)

(assert (=> b!1408037 (= e!796913 (not e!796910))))

(declare-fun res!945757 () Bool)

(assert (=> b!1408037 (=> res!945757 e!796910)))

(assert (=> b!1408037 (= res!945757 (or (not (is-Intermediate!10782 lt!620065)) (undefined!11594 lt!620065)))))

(declare-fun lt!620067 () SeekEntryResult!10782)

(assert (=> b!1408037 (= lt!620067 (Found!10782 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96256 (_ BitVec 32)) SeekEntryResult!10782)

(assert (=> b!1408037 (= lt!620067 (seekEntryOrOpen!0 (select (arr!46471 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408037 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47538 0))(
  ( (Unit!47539) )
))
(declare-fun lt!620064 () Unit!47538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47538)

(assert (=> b!1408037 (= lt!620064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408037 (= lt!620065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620063 (select (arr!46471 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408037 (= lt!620063 (toIndex!0 (select (arr!46471 a!2901) j!112) mask!2840))))

(declare-fun b!1408038 () Bool)

(declare-fun res!945758 () Bool)

(assert (=> b!1408038 (=> (not res!945758) (not e!796913))))

(declare-datatypes ((List!32990 0))(
  ( (Nil!32987) (Cons!32986 (h!34249 (_ BitVec 64)) (t!47684 List!32990)) )
))
(declare-fun arrayNoDuplicates!0 (array!96256 (_ BitVec 32) List!32990) Bool)

(assert (=> b!1408038 (= res!945758 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32987))))

(declare-fun b!1408039 () Bool)

(declare-fun res!945759 () Bool)

(assert (=> b!1408039 (=> (not res!945759) (not e!796913))))

(assert (=> b!1408039 (= res!945759 (and (= (size!47021 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47021 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47021 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408040 () Bool)

(declare-fun res!945762 () Bool)

(assert (=> b!1408040 (=> (not res!945762) (not e!796913))))

(assert (=> b!1408040 (= res!945762 (validKeyInArray!0 (select (arr!46471 a!2901) i!1037)))))

(declare-fun b!1408041 () Bool)

(assert (=> b!1408041 (= e!796911 true)))

(assert (=> b!1408041 (= lt!620067 (seekEntryOrOpen!0 lt!620061 lt!620062 mask!2840))))

(declare-fun lt!620066 () Unit!47538)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47538)

(assert (=> b!1408041 (= lt!620066 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620063 (x!127111 lt!620065) (index!45507 lt!620065) mask!2840))))

(assert (= (and start!121102 res!945763) b!1408039))

(assert (= (and b!1408039 res!945759) b!1408040))

(assert (= (and b!1408040 res!945762) b!1408035))

(assert (= (and b!1408035 res!945755) b!1408036))

(assert (= (and b!1408036 res!945760) b!1408038))

(assert (= (and b!1408038 res!945758) b!1408037))

(assert (= (and b!1408037 (not res!945757)) b!1408034))

(assert (= (and b!1408034 (not res!945761)) b!1408033))

(assert (= (and b!1408033 (not res!945756)) b!1408041))

(declare-fun m!1297165 () Bool)

(assert (=> b!1408035 m!1297165))

(assert (=> b!1408035 m!1297165))

(declare-fun m!1297167 () Bool)

(assert (=> b!1408035 m!1297167))

(declare-fun m!1297169 () Bool)

(assert (=> b!1408040 m!1297169))

(assert (=> b!1408040 m!1297169))

(declare-fun m!1297171 () Bool)

(assert (=> b!1408040 m!1297171))

(declare-fun m!1297173 () Bool)

(assert (=> b!1408034 m!1297173))

(assert (=> b!1408034 m!1297173))

(declare-fun m!1297175 () Bool)

(assert (=> b!1408034 m!1297175))

(declare-fun m!1297177 () Bool)

(assert (=> b!1408034 m!1297177))

(declare-fun m!1297179 () Bool)

(assert (=> b!1408034 m!1297179))

(declare-fun m!1297181 () Bool)

(assert (=> b!1408041 m!1297181))

(declare-fun m!1297183 () Bool)

(assert (=> b!1408041 m!1297183))

(assert (=> b!1408037 m!1297165))

(declare-fun m!1297185 () Bool)

(assert (=> b!1408037 m!1297185))

(assert (=> b!1408037 m!1297165))

(declare-fun m!1297187 () Bool)

(assert (=> b!1408037 m!1297187))

(assert (=> b!1408037 m!1297165))

(declare-fun m!1297189 () Bool)

(assert (=> b!1408037 m!1297189))

(declare-fun m!1297191 () Bool)

(assert (=> b!1408037 m!1297191))

(assert (=> b!1408037 m!1297165))

(declare-fun m!1297193 () Bool)

(assert (=> b!1408037 m!1297193))

(declare-fun m!1297195 () Bool)

(assert (=> start!121102 m!1297195))

(declare-fun m!1297197 () Bool)

(assert (=> start!121102 m!1297197))

(declare-fun m!1297199 () Bool)

(assert (=> b!1408036 m!1297199))

(declare-fun m!1297201 () Bool)

(assert (=> b!1408038 m!1297201))

(push 1)

