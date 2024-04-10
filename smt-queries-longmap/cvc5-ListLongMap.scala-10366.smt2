; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122010 () Bool)

(assert start!122010)

(declare-fun b!1416141 () Bool)

(declare-fun res!952190 () Bool)

(declare-fun e!801508 () Bool)

(assert (=> b!1416141 (=> (not res!952190) (not e!801508))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96696 0))(
  ( (array!96697 (arr!46679 (Array (_ BitVec 32) (_ BitVec 64))) (size!47229 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96696)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416141 (= res!952190 (and (= (size!47229 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47229 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47229 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416142 () Bool)

(declare-fun res!952187 () Bool)

(declare-fun e!801512 () Bool)

(assert (=> b!1416142 (=> res!952187 e!801512)))

(declare-fun lt!624697 () (_ BitVec 64))

(declare-fun lt!624698 () (_ BitVec 32))

(declare-fun lt!624693 () array!96696)

(declare-datatypes ((SeekEntryResult!10990 0))(
  ( (MissingZero!10990 (index!46352 (_ BitVec 32))) (Found!10990 (index!46353 (_ BitVec 32))) (Intermediate!10990 (undefined!11802 Bool) (index!46354 (_ BitVec 32)) (x!127957 (_ BitVec 32))) (Undefined!10990) (MissingVacant!10990 (index!46355 (_ BitVec 32))) )
))
(declare-fun lt!624696 () SeekEntryResult!10990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96696 (_ BitVec 32)) SeekEntryResult!10990)

(assert (=> b!1416142 (= res!952187 (not (= lt!624696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624698 lt!624697 lt!624693 mask!2840))))))

(declare-fun b!1416143 () Bool)

(declare-fun e!801511 () Bool)

(declare-fun e!801509 () Bool)

(assert (=> b!1416143 (= e!801511 e!801509)))

(declare-fun res!952186 () Bool)

(assert (=> b!1416143 (=> res!952186 e!801509)))

(declare-fun lt!624702 () SeekEntryResult!10990)

(assert (=> b!1416143 (= res!952186 (or (= lt!624702 lt!624696) (not (is-Intermediate!10990 lt!624696))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416143 (= lt!624696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624697 mask!2840) lt!624697 lt!624693 mask!2840))))

(assert (=> b!1416143 (= lt!624697 (select (store (arr!46679 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416143 (= lt!624693 (array!96697 (store (arr!46679 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47229 a!2901)))))

(declare-fun b!1416145 () Bool)

(declare-fun res!952184 () Bool)

(assert (=> b!1416145 (=> (not res!952184) (not e!801508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416145 (= res!952184 (validKeyInArray!0 (select (arr!46679 a!2901) i!1037)))))

(declare-fun b!1416146 () Bool)

(assert (=> b!1416146 (= e!801508 (not e!801511))))

(declare-fun res!952189 () Bool)

(assert (=> b!1416146 (=> res!952189 e!801511)))

(assert (=> b!1416146 (= res!952189 (or (not (is-Intermediate!10990 lt!624702)) (undefined!11802 lt!624702)))))

(declare-fun lt!624700 () SeekEntryResult!10990)

(assert (=> b!1416146 (= lt!624700 (Found!10990 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96696 (_ BitVec 32)) SeekEntryResult!10990)

(assert (=> b!1416146 (= lt!624700 (seekEntryOrOpen!0 (select (arr!46679 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96696 (_ BitVec 32)) Bool)

(assert (=> b!1416146 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47954 0))(
  ( (Unit!47955) )
))
(declare-fun lt!624694 () Unit!47954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47954)

(assert (=> b!1416146 (= lt!624694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416146 (= lt!624702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624698 (select (arr!46679 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416146 (= lt!624698 (toIndex!0 (select (arr!46679 a!2901) j!112) mask!2840))))

(declare-fun b!1416147 () Bool)

(assert (=> b!1416147 (= e!801509 e!801512)))

(declare-fun res!952192 () Bool)

(assert (=> b!1416147 (=> res!952192 e!801512)))

(assert (=> b!1416147 (= res!952192 (or (bvslt (x!127957 lt!624702) #b00000000000000000000000000000000) (bvsgt (x!127957 lt!624702) #b01111111111111111111111111111110) (bvslt (x!127957 lt!624696) #b00000000000000000000000000000000) (bvsgt (x!127957 lt!624696) #b01111111111111111111111111111110) (bvslt lt!624698 #b00000000000000000000000000000000) (bvsge lt!624698 (size!47229 a!2901)) (bvslt (index!46354 lt!624702) #b00000000000000000000000000000000) (bvsge (index!46354 lt!624702) (size!47229 a!2901)) (bvslt (index!46354 lt!624696) #b00000000000000000000000000000000) (bvsge (index!46354 lt!624696) (size!47229 a!2901)) (not (= lt!624702 (Intermediate!10990 false (index!46354 lt!624702) (x!127957 lt!624702)))) (not (= lt!624696 (Intermediate!10990 false (index!46354 lt!624696) (x!127957 lt!624696))))))))

(declare-fun lt!624699 () SeekEntryResult!10990)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96696 (_ BitVec 32)) SeekEntryResult!10990)

(assert (=> b!1416147 (= lt!624699 (seekKeyOrZeroReturnVacant!0 (x!127957 lt!624696) (index!46354 lt!624696) (index!46354 lt!624696) (select (arr!46679 a!2901) j!112) lt!624693 mask!2840))))

(assert (=> b!1416147 (= lt!624699 (seekEntryOrOpen!0 lt!624697 lt!624693 mask!2840))))

(assert (=> b!1416147 (and (not (undefined!11802 lt!624696)) (= (index!46354 lt!624696) i!1037) (bvslt (x!127957 lt!624696) (x!127957 lt!624702)) (= (select (store (arr!46679 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46354 lt!624696)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624701 () Unit!47954)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47954)

(assert (=> b!1416147 (= lt!624701 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624698 (x!127957 lt!624702) (index!46354 lt!624702) (x!127957 lt!624696) (index!46354 lt!624696) (undefined!11802 lt!624696) mask!2840))))

(declare-fun b!1416148 () Bool)

(declare-fun res!952191 () Bool)

(assert (=> b!1416148 (=> (not res!952191) (not e!801508))))

(assert (=> b!1416148 (= res!952191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416149 () Bool)

(assert (=> b!1416149 (= e!801512 true)))

(assert (=> b!1416149 (= lt!624700 lt!624699)))

(declare-fun lt!624695 () Unit!47954)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47954)

(assert (=> b!1416149 (= lt!624695 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624698 (x!127957 lt!624702) (index!46354 lt!624702) (x!127957 lt!624696) (index!46354 lt!624696) mask!2840))))

(declare-fun b!1416150 () Bool)

(declare-fun res!952183 () Bool)

(assert (=> b!1416150 (=> (not res!952183) (not e!801508))))

(assert (=> b!1416150 (= res!952183 (validKeyInArray!0 (select (arr!46679 a!2901) j!112)))))

(declare-fun res!952185 () Bool)

(assert (=> start!122010 (=> (not res!952185) (not e!801508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122010 (= res!952185 (validMask!0 mask!2840))))

(assert (=> start!122010 e!801508))

(assert (=> start!122010 true))

(declare-fun array_inv!35707 (array!96696) Bool)

(assert (=> start!122010 (array_inv!35707 a!2901)))

(declare-fun b!1416144 () Bool)

(declare-fun res!952188 () Bool)

(assert (=> b!1416144 (=> (not res!952188) (not e!801508))))

(declare-datatypes ((List!33198 0))(
  ( (Nil!33195) (Cons!33194 (h!34481 (_ BitVec 64)) (t!47892 List!33198)) )
))
(declare-fun arrayNoDuplicates!0 (array!96696 (_ BitVec 32) List!33198) Bool)

(assert (=> b!1416144 (= res!952188 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33195))))

(assert (= (and start!122010 res!952185) b!1416141))

(assert (= (and b!1416141 res!952190) b!1416145))

(assert (= (and b!1416145 res!952184) b!1416150))

(assert (= (and b!1416150 res!952183) b!1416148))

(assert (= (and b!1416148 res!952191) b!1416144))

(assert (= (and b!1416144 res!952188) b!1416146))

(assert (= (and b!1416146 (not res!952189)) b!1416143))

(assert (= (and b!1416143 (not res!952186)) b!1416147))

(assert (= (and b!1416147 (not res!952192)) b!1416142))

(assert (= (and b!1416142 (not res!952187)) b!1416149))

(declare-fun m!1306707 () Bool)

(assert (=> b!1416150 m!1306707))

(assert (=> b!1416150 m!1306707))

(declare-fun m!1306709 () Bool)

(assert (=> b!1416150 m!1306709))

(declare-fun m!1306711 () Bool)

(assert (=> b!1416145 m!1306711))

(assert (=> b!1416145 m!1306711))

(declare-fun m!1306713 () Bool)

(assert (=> b!1416145 m!1306713))

(declare-fun m!1306715 () Bool)

(assert (=> b!1416149 m!1306715))

(declare-fun m!1306717 () Bool)

(assert (=> b!1416148 m!1306717))

(declare-fun m!1306719 () Bool)

(assert (=> b!1416142 m!1306719))

(declare-fun m!1306721 () Bool)

(assert (=> b!1416147 m!1306721))

(assert (=> b!1416147 m!1306707))

(declare-fun m!1306723 () Bool)

(assert (=> b!1416147 m!1306723))

(declare-fun m!1306725 () Bool)

(assert (=> b!1416147 m!1306725))

(assert (=> b!1416147 m!1306707))

(declare-fun m!1306727 () Bool)

(assert (=> b!1416147 m!1306727))

(declare-fun m!1306729 () Bool)

(assert (=> b!1416147 m!1306729))

(declare-fun m!1306731 () Bool)

(assert (=> b!1416143 m!1306731))

(assert (=> b!1416143 m!1306731))

(declare-fun m!1306733 () Bool)

(assert (=> b!1416143 m!1306733))

(assert (=> b!1416143 m!1306729))

(declare-fun m!1306735 () Bool)

(assert (=> b!1416143 m!1306735))

(declare-fun m!1306737 () Bool)

(assert (=> b!1416144 m!1306737))

(declare-fun m!1306739 () Bool)

(assert (=> start!122010 m!1306739))

(declare-fun m!1306741 () Bool)

(assert (=> start!122010 m!1306741))

(assert (=> b!1416146 m!1306707))

(declare-fun m!1306743 () Bool)

(assert (=> b!1416146 m!1306743))

(assert (=> b!1416146 m!1306707))

(declare-fun m!1306745 () Bool)

(assert (=> b!1416146 m!1306745))

(assert (=> b!1416146 m!1306707))

(declare-fun m!1306747 () Bool)

(assert (=> b!1416146 m!1306747))

(declare-fun m!1306749 () Bool)

(assert (=> b!1416146 m!1306749))

(assert (=> b!1416146 m!1306707))

(declare-fun m!1306751 () Bool)

(assert (=> b!1416146 m!1306751))

(push 1)

