; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121104 () Bool)

(assert start!121104)

(declare-fun b!1408060 () Bool)

(declare-fun e!796925 () Bool)

(declare-fun e!796924 () Bool)

(assert (=> b!1408060 (= e!796925 (not e!796924))))

(declare-fun res!945783 () Bool)

(assert (=> b!1408060 (=> res!945783 e!796924)))

(declare-datatypes ((SeekEntryResult!10783 0))(
  ( (MissingZero!10783 (index!45509 (_ BitVec 32))) (Found!10783 (index!45510 (_ BitVec 32))) (Intermediate!10783 (undefined!11595 Bool) (index!45511 (_ BitVec 32)) (x!127120 (_ BitVec 32))) (Undefined!10783) (MissingVacant!10783 (index!45512 (_ BitVec 32))) )
))
(declare-fun lt!620085 () SeekEntryResult!10783)

(assert (=> b!1408060 (= res!945783 (or (not (is-Intermediate!10783 lt!620085)) (undefined!11595 lt!620085)))))

(declare-fun lt!620084 () SeekEntryResult!10783)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408060 (= lt!620084 (Found!10783 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96258 0))(
  ( (array!96259 (arr!46472 (Array (_ BitVec 32) (_ BitVec 64))) (size!47022 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96258 (_ BitVec 32)) SeekEntryResult!10783)

(assert (=> b!1408060 (= lt!620084 (seekEntryOrOpen!0 (select (arr!46472 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96258 (_ BitVec 32)) Bool)

(assert (=> b!1408060 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47540 0))(
  ( (Unit!47541) )
))
(declare-fun lt!620083 () Unit!47540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47540)

(assert (=> b!1408060 (= lt!620083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620088 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96258 (_ BitVec 32)) SeekEntryResult!10783)

(assert (=> b!1408060 (= lt!620085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620088 (select (arr!46472 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408060 (= lt!620088 (toIndex!0 (select (arr!46472 a!2901) j!112) mask!2840))))

(declare-fun b!1408061 () Bool)

(declare-fun res!945782 () Bool)

(declare-fun e!796922 () Bool)

(assert (=> b!1408061 (=> res!945782 e!796922)))

(assert (=> b!1408061 (= res!945782 (or (bvslt (x!127120 lt!620085) #b00000000000000000000000000000000) (bvsgt (x!127120 lt!620085) #b01111111111111111111111111111110) (bvslt lt!620088 #b00000000000000000000000000000000) (bvsge lt!620088 (size!47022 a!2901)) (bvslt (index!45511 lt!620085) #b00000000000000000000000000000000) (bvsge (index!45511 lt!620085) (size!47022 a!2901)) (not (= lt!620085 (Intermediate!10783 false (index!45511 lt!620085) (x!127120 lt!620085))))))))

(declare-fun b!1408062 () Bool)

(declare-fun res!945784 () Bool)

(assert (=> b!1408062 (=> (not res!945784) (not e!796925))))

(assert (=> b!1408062 (= res!945784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408063 () Bool)

(assert (=> b!1408063 (= e!796922 true)))

(declare-fun lt!620087 () array!96258)

(declare-fun lt!620086 () (_ BitVec 64))

(assert (=> b!1408063 (= lt!620084 (seekEntryOrOpen!0 lt!620086 lt!620087 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620082 () Unit!47540)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47540)

(assert (=> b!1408063 (= lt!620082 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620088 (x!127120 lt!620085) (index!45511 lt!620085) mask!2840))))

(declare-fun res!945789 () Bool)

(assert (=> start!121104 (=> (not res!945789) (not e!796925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121104 (= res!945789 (validMask!0 mask!2840))))

(assert (=> start!121104 e!796925))

(assert (=> start!121104 true))

(declare-fun array_inv!35500 (array!96258) Bool)

(assert (=> start!121104 (array_inv!35500 a!2901)))

(declare-fun b!1408064 () Bool)

(declare-fun res!945786 () Bool)

(assert (=> b!1408064 (=> (not res!945786) (not e!796925))))

(declare-datatypes ((List!32991 0))(
  ( (Nil!32988) (Cons!32987 (h!34250 (_ BitVec 64)) (t!47685 List!32991)) )
))
(declare-fun arrayNoDuplicates!0 (array!96258 (_ BitVec 32) List!32991) Bool)

(assert (=> b!1408064 (= res!945786 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32988))))

(declare-fun b!1408065 () Bool)

(declare-fun res!945785 () Bool)

(assert (=> b!1408065 (=> (not res!945785) (not e!796925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408065 (= res!945785 (validKeyInArray!0 (select (arr!46472 a!2901) i!1037)))))

(declare-fun b!1408066 () Bool)

(declare-fun res!945788 () Bool)

(assert (=> b!1408066 (=> (not res!945788) (not e!796925))))

(assert (=> b!1408066 (= res!945788 (and (= (size!47022 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47022 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47022 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408067 () Bool)

(declare-fun res!945790 () Bool)

(assert (=> b!1408067 (=> (not res!945790) (not e!796925))))

(assert (=> b!1408067 (= res!945790 (validKeyInArray!0 (select (arr!46472 a!2901) j!112)))))

(declare-fun b!1408068 () Bool)

(assert (=> b!1408068 (= e!796924 e!796922)))

(declare-fun res!945787 () Bool)

(assert (=> b!1408068 (=> res!945787 e!796922)))

(assert (=> b!1408068 (= res!945787 (not (= lt!620085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620086 mask!2840) lt!620086 lt!620087 mask!2840))))))

(assert (=> b!1408068 (= lt!620086 (select (store (arr!46472 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408068 (= lt!620087 (array!96259 (store (arr!46472 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47022 a!2901)))))

(assert (= (and start!121104 res!945789) b!1408066))

(assert (= (and b!1408066 res!945788) b!1408065))

(assert (= (and b!1408065 res!945785) b!1408067))

(assert (= (and b!1408067 res!945790) b!1408062))

(assert (= (and b!1408062 res!945784) b!1408064))

(assert (= (and b!1408064 res!945786) b!1408060))

(assert (= (and b!1408060 (not res!945783)) b!1408068))

(assert (= (and b!1408068 (not res!945787)) b!1408061))

(assert (= (and b!1408061 (not res!945782)) b!1408063))

(declare-fun m!1297203 () Bool)

(assert (=> b!1408065 m!1297203))

(assert (=> b!1408065 m!1297203))

(declare-fun m!1297205 () Bool)

(assert (=> b!1408065 m!1297205))

(declare-fun m!1297207 () Bool)

(assert (=> b!1408062 m!1297207))

(declare-fun m!1297209 () Bool)

(assert (=> b!1408068 m!1297209))

(assert (=> b!1408068 m!1297209))

(declare-fun m!1297211 () Bool)

(assert (=> b!1408068 m!1297211))

(declare-fun m!1297213 () Bool)

(assert (=> b!1408068 m!1297213))

(declare-fun m!1297215 () Bool)

(assert (=> b!1408068 m!1297215))

(declare-fun m!1297217 () Bool)

(assert (=> b!1408067 m!1297217))

(assert (=> b!1408067 m!1297217))

(declare-fun m!1297219 () Bool)

(assert (=> b!1408067 m!1297219))

(declare-fun m!1297221 () Bool)

(assert (=> b!1408063 m!1297221))

(declare-fun m!1297223 () Bool)

(assert (=> b!1408063 m!1297223))

(assert (=> b!1408060 m!1297217))

(declare-fun m!1297225 () Bool)

(assert (=> b!1408060 m!1297225))

(assert (=> b!1408060 m!1297217))

(declare-fun m!1297227 () Bool)

(assert (=> b!1408060 m!1297227))

(assert (=> b!1408060 m!1297217))

(declare-fun m!1297229 () Bool)

(assert (=> b!1408060 m!1297229))

(assert (=> b!1408060 m!1297217))

(declare-fun m!1297231 () Bool)

(assert (=> b!1408060 m!1297231))

(declare-fun m!1297233 () Bool)

(assert (=> b!1408060 m!1297233))

(declare-fun m!1297235 () Bool)

(assert (=> start!121104 m!1297235))

(declare-fun m!1297237 () Bool)

(assert (=> start!121104 m!1297237))

(declare-fun m!1297239 () Bool)

(assert (=> b!1408064 m!1297239))

(push 1)

