; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120472 () Bool)

(assert start!120472)

(declare-fun b!1402743 () Bool)

(declare-fun e!794294 () Bool)

(declare-fun e!794290 () Bool)

(assert (=> b!1402743 (= e!794294 e!794290)))

(declare-fun res!941259 () Bool)

(assert (=> b!1402743 (=> res!941259 e!794290)))

(declare-datatypes ((array!95881 0))(
  ( (array!95882 (arr!46291 (Array (_ BitVec 32) (_ BitVec 64))) (size!46841 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95881)

(declare-datatypes ((SeekEntryResult!10608 0))(
  ( (MissingZero!10608 (index!44809 (_ BitVec 32))) (Found!10608 (index!44810 (_ BitVec 32))) (Intermediate!10608 (undefined!11420 Bool) (index!44811 (_ BitVec 32)) (x!126427 (_ BitVec 32))) (Undefined!10608) (MissingVacant!10608 (index!44812 (_ BitVec 32))) )
))
(declare-fun lt!618031 () SeekEntryResult!10608)

(declare-fun lt!618025 () SeekEntryResult!10608)

(declare-fun lt!618029 () (_ BitVec 32))

(assert (=> b!1402743 (= res!941259 (or (bvslt (x!126427 lt!618025) #b00000000000000000000000000000000) (bvsgt (x!126427 lt!618025) #b01111111111111111111111111111110) (bvslt (x!126427 lt!618031) #b00000000000000000000000000000000) (bvsgt (x!126427 lt!618031) #b01111111111111111111111111111110) (bvslt lt!618029 #b00000000000000000000000000000000) (bvsge lt!618029 (size!46841 a!2901)) (bvslt (index!44811 lt!618025) #b00000000000000000000000000000000) (bvsge (index!44811 lt!618025) (size!46841 a!2901)) (bvslt (index!44811 lt!618031) #b00000000000000000000000000000000) (bvsge (index!44811 lt!618031) (size!46841 a!2901)) (not (= lt!618025 (Intermediate!10608 false (index!44811 lt!618025) (x!126427 lt!618025)))) (not (= lt!618031 (Intermediate!10608 false (index!44811 lt!618031) (x!126427 lt!618031))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!618028 () SeekEntryResult!10608)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!618030 () array!95881)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95881 (_ BitVec 32)) SeekEntryResult!10608)

(assert (=> b!1402743 (= lt!618028 (seekKeyOrZeroReturnVacant!0 (x!126427 lt!618031) (index!44811 lt!618031) (index!44811 lt!618031) (select (arr!46291 a!2901) j!112) lt!618030 mask!2840))))

(declare-fun lt!618026 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95881 (_ BitVec 32)) SeekEntryResult!10608)

(assert (=> b!1402743 (= lt!618028 (seekEntryOrOpen!0 lt!618026 lt!618030 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402743 (and (not (undefined!11420 lt!618031)) (= (index!44811 lt!618031) i!1037) (bvslt (x!126427 lt!618031) (x!126427 lt!618025)) (= (select (store (arr!46291 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44811 lt!618031)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47220 0))(
  ( (Unit!47221) )
))
(declare-fun lt!618027 () Unit!47220)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47220)

(assert (=> b!1402743 (= lt!618027 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618029 (x!126427 lt!618025) (index!44811 lt!618025) (x!126427 lt!618031) (index!44811 lt!618031) (undefined!11420 lt!618031) mask!2840))))

(declare-fun b!1402744 () Bool)

(declare-fun res!941254 () Bool)

(declare-fun e!794292 () Bool)

(assert (=> b!1402744 (=> (not res!941254) (not e!794292))))

(assert (=> b!1402744 (= res!941254 (and (= (size!46841 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46841 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46841 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402745 () Bool)

(declare-fun e!794293 () Bool)

(assert (=> b!1402745 (= e!794292 (not e!794293))))

(declare-fun res!941261 () Bool)

(assert (=> b!1402745 (=> res!941261 e!794293)))

(assert (=> b!1402745 (= res!941261 (or (not (is-Intermediate!10608 lt!618025)) (undefined!11420 lt!618025)))))

(declare-fun lt!618032 () SeekEntryResult!10608)

(assert (=> b!1402745 (= lt!618032 (Found!10608 j!112))))

(assert (=> b!1402745 (= lt!618032 (seekEntryOrOpen!0 (select (arr!46291 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95881 (_ BitVec 32)) Bool)

(assert (=> b!1402745 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618024 () Unit!47220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47220)

(assert (=> b!1402745 (= lt!618024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95881 (_ BitVec 32)) SeekEntryResult!10608)

(assert (=> b!1402745 (= lt!618025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618029 (select (arr!46291 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402745 (= lt!618029 (toIndex!0 (select (arr!46291 a!2901) j!112) mask!2840))))

(declare-fun b!1402746 () Bool)

(declare-fun res!941262 () Bool)

(assert (=> b!1402746 (=> res!941262 e!794290)))

(assert (=> b!1402746 (= res!941262 (not (= lt!618031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618029 lt!618026 lt!618030 mask!2840))))))

(declare-fun b!1402747 () Bool)

(declare-fun res!941260 () Bool)

(assert (=> b!1402747 (=> (not res!941260) (not e!794292))))

(declare-datatypes ((List!32810 0))(
  ( (Nil!32807) (Cons!32806 (h!34054 (_ BitVec 64)) (t!47504 List!32810)) )
))
(declare-fun arrayNoDuplicates!0 (array!95881 (_ BitVec 32) List!32810) Bool)

(assert (=> b!1402747 (= res!941260 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32807))))

(declare-fun res!941257 () Bool)

(assert (=> start!120472 (=> (not res!941257) (not e!794292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120472 (= res!941257 (validMask!0 mask!2840))))

(assert (=> start!120472 e!794292))

(assert (=> start!120472 true))

(declare-fun array_inv!35319 (array!95881) Bool)

(assert (=> start!120472 (array_inv!35319 a!2901)))

(declare-fun b!1402748 () Bool)

(declare-fun res!941263 () Bool)

(assert (=> b!1402748 (=> (not res!941263) (not e!794292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402748 (= res!941263 (validKeyInArray!0 (select (arr!46291 a!2901) j!112)))))

(declare-fun b!1402749 () Bool)

(declare-fun res!941258 () Bool)

(assert (=> b!1402749 (=> (not res!941258) (not e!794292))))

(assert (=> b!1402749 (= res!941258 (validKeyInArray!0 (select (arr!46291 a!2901) i!1037)))))

(declare-fun b!1402750 () Bool)

(assert (=> b!1402750 (= e!794290 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1402750 (= lt!618032 lt!618028)))

(declare-fun lt!618033 () Unit!47220)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47220)

(assert (=> b!1402750 (= lt!618033 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618029 (x!126427 lt!618025) (index!44811 lt!618025) (x!126427 lt!618031) (index!44811 lt!618031) mask!2840))))

(declare-fun b!1402751 () Bool)

(assert (=> b!1402751 (= e!794293 e!794294)))

(declare-fun res!941256 () Bool)

(assert (=> b!1402751 (=> res!941256 e!794294)))

(assert (=> b!1402751 (= res!941256 (or (= lt!618025 lt!618031) (not (is-Intermediate!10608 lt!618031))))))

(assert (=> b!1402751 (= lt!618031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618026 mask!2840) lt!618026 lt!618030 mask!2840))))

(assert (=> b!1402751 (= lt!618026 (select (store (arr!46291 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402751 (= lt!618030 (array!95882 (store (arr!46291 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46841 a!2901)))))

(declare-fun b!1402752 () Bool)

(declare-fun res!941255 () Bool)

(assert (=> b!1402752 (=> (not res!941255) (not e!794292))))

(assert (=> b!1402752 (= res!941255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120472 res!941257) b!1402744))

(assert (= (and b!1402744 res!941254) b!1402749))

(assert (= (and b!1402749 res!941258) b!1402748))

(assert (= (and b!1402748 res!941263) b!1402752))

(assert (= (and b!1402752 res!941255) b!1402747))

(assert (= (and b!1402747 res!941260) b!1402745))

(assert (= (and b!1402745 (not res!941261)) b!1402751))

(assert (= (and b!1402751 (not res!941256)) b!1402743))

(assert (= (and b!1402743 (not res!941259)) b!1402746))

(assert (= (and b!1402746 (not res!941262)) b!1402750))

(declare-fun m!1291067 () Bool)

(assert (=> b!1402749 m!1291067))

(assert (=> b!1402749 m!1291067))

(declare-fun m!1291069 () Bool)

(assert (=> b!1402749 m!1291069))

(declare-fun m!1291071 () Bool)

(assert (=> b!1402745 m!1291071))

(declare-fun m!1291073 () Bool)

(assert (=> b!1402745 m!1291073))

(assert (=> b!1402745 m!1291071))

(declare-fun m!1291075 () Bool)

(assert (=> b!1402745 m!1291075))

(assert (=> b!1402745 m!1291071))

(declare-fun m!1291077 () Bool)

(assert (=> b!1402745 m!1291077))

(declare-fun m!1291079 () Bool)

(assert (=> b!1402745 m!1291079))

(assert (=> b!1402745 m!1291071))

(declare-fun m!1291081 () Bool)

(assert (=> b!1402745 m!1291081))

(declare-fun m!1291083 () Bool)

(assert (=> b!1402747 m!1291083))

(declare-fun m!1291085 () Bool)

(assert (=> b!1402746 m!1291085))

(declare-fun m!1291087 () Bool)

(assert (=> start!120472 m!1291087))

(declare-fun m!1291089 () Bool)

(assert (=> start!120472 m!1291089))

(declare-fun m!1291091 () Bool)

(assert (=> b!1402743 m!1291091))

(assert (=> b!1402743 m!1291071))

(declare-fun m!1291093 () Bool)

(assert (=> b!1402743 m!1291093))

(declare-fun m!1291095 () Bool)

(assert (=> b!1402743 m!1291095))

(assert (=> b!1402743 m!1291071))

(declare-fun m!1291097 () Bool)

(assert (=> b!1402743 m!1291097))

(declare-fun m!1291099 () Bool)

(assert (=> b!1402743 m!1291099))

(declare-fun m!1291101 () Bool)

(assert (=> b!1402750 m!1291101))

(declare-fun m!1291103 () Bool)

(assert (=> b!1402751 m!1291103))

(assert (=> b!1402751 m!1291103))

(declare-fun m!1291105 () Bool)

(assert (=> b!1402751 m!1291105))

(assert (=> b!1402751 m!1291099))

(declare-fun m!1291107 () Bool)

(assert (=> b!1402751 m!1291107))

(assert (=> b!1402748 m!1291071))

(assert (=> b!1402748 m!1291071))

(declare-fun m!1291109 () Bool)

(assert (=> b!1402748 m!1291109))

(declare-fun m!1291111 () Bool)

(assert (=> b!1402752 m!1291111))

(push 1)

