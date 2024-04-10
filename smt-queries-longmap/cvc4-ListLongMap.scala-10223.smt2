; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120394 () Bool)

(assert start!120394)

(declare-fun b!1401509 () Bool)

(declare-fun e!793580 () Bool)

(declare-fun e!793579 () Bool)

(assert (=> b!1401509 (= e!793580 e!793579)))

(declare-fun res!940021 () Bool)

(assert (=> b!1401509 (=> res!940021 e!793579)))

(declare-datatypes ((SeekEntryResult!10569 0))(
  ( (MissingZero!10569 (index!44653 (_ BitVec 32))) (Found!10569 (index!44654 (_ BitVec 32))) (Intermediate!10569 (undefined!11381 Bool) (index!44655 (_ BitVec 32)) (x!126284 (_ BitVec 32))) (Undefined!10569) (MissingVacant!10569 (index!44656 (_ BitVec 32))) )
))
(declare-fun lt!616984 () SeekEntryResult!10569)

(declare-datatypes ((array!95803 0))(
  ( (array!95804 (arr!46252 (Array (_ BitVec 32) (_ BitVec 64))) (size!46802 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95803)

(declare-fun lt!616985 () (_ BitVec 32))

(declare-fun lt!616989 () SeekEntryResult!10569)

(assert (=> b!1401509 (= res!940021 (or (bvslt (x!126284 lt!616984) #b00000000000000000000000000000000) (bvsgt (x!126284 lt!616984) #b01111111111111111111111111111110) (bvslt (x!126284 lt!616989) #b00000000000000000000000000000000) (bvsgt (x!126284 lt!616989) #b01111111111111111111111111111110) (bvslt lt!616985 #b00000000000000000000000000000000) (bvsge lt!616985 (size!46802 a!2901)) (bvslt (index!44655 lt!616984) #b00000000000000000000000000000000) (bvsge (index!44655 lt!616984) (size!46802 a!2901)) (bvslt (index!44655 lt!616989) #b00000000000000000000000000000000) (bvsge (index!44655 lt!616989) (size!46802 a!2901)) (not (= lt!616984 (Intermediate!10569 false (index!44655 lt!616984) (x!126284 lt!616984)))) (not (= lt!616989 (Intermediate!10569 false (index!44655 lt!616989) (x!126284 lt!616989))))))))

(declare-fun e!793577 () Bool)

(assert (=> b!1401509 e!793577))

(declare-fun res!940026 () Bool)

(assert (=> b!1401509 (=> (not res!940026) (not e!793577))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401509 (= res!940026 (and (not (undefined!11381 lt!616989)) (= (index!44655 lt!616989) i!1037) (bvslt (x!126284 lt!616989) (x!126284 lt!616984)) (= (select (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44655 lt!616989)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47142 0))(
  ( (Unit!47143) )
))
(declare-fun lt!616988 () Unit!47142)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47142)

(assert (=> b!1401509 (= lt!616988 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616985 (x!126284 lt!616984) (index!44655 lt!616984) (x!126284 lt!616989) (index!44655 lt!616989) (undefined!11381 lt!616989) mask!2840))))

(declare-fun b!1401510 () Bool)

(declare-fun res!940030 () Bool)

(declare-fun e!793581 () Bool)

(assert (=> b!1401510 (=> (not res!940030) (not e!793581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401510 (= res!940030 (validKeyInArray!0 (select (arr!46252 a!2901) j!112)))))

(declare-fun b!1401511 () Bool)

(declare-fun e!793582 () Bool)

(assert (=> b!1401511 (= e!793581 (not e!793582))))

(declare-fun res!940023 () Bool)

(assert (=> b!1401511 (=> res!940023 e!793582)))

(assert (=> b!1401511 (= res!940023 (or (not (is-Intermediate!10569 lt!616984)) (undefined!11381 lt!616984)))))

(declare-fun e!793578 () Bool)

(assert (=> b!1401511 e!793578))

(declare-fun res!940020 () Bool)

(assert (=> b!1401511 (=> (not res!940020) (not e!793578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95803 (_ BitVec 32)) Bool)

(assert (=> b!1401511 (= res!940020 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616982 () Unit!47142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47142)

(assert (=> b!1401511 (= lt!616982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95803 (_ BitVec 32)) SeekEntryResult!10569)

(assert (=> b!1401511 (= lt!616984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616985 (select (arr!46252 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401511 (= lt!616985 (toIndex!0 (select (arr!46252 a!2901) j!112) mask!2840))))

(declare-fun b!1401512 () Bool)

(assert (=> b!1401512 (= e!793579 true)))

(declare-fun lt!616986 () array!95803)

(declare-fun lt!616983 () SeekEntryResult!10569)

(declare-fun lt!616987 () (_ BitVec 64))

(assert (=> b!1401512 (= lt!616983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616985 lt!616987 lt!616986 mask!2840))))

(declare-fun b!1401513 () Bool)

(declare-fun res!940024 () Bool)

(assert (=> b!1401513 (=> (not res!940024) (not e!793581))))

(assert (=> b!1401513 (= res!940024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401514 () Bool)

(declare-fun res!940022 () Bool)

(assert (=> b!1401514 (=> (not res!940022) (not e!793581))))

(assert (=> b!1401514 (= res!940022 (validKeyInArray!0 (select (arr!46252 a!2901) i!1037)))))

(declare-fun b!1401515 () Bool)

(declare-fun res!940029 () Bool)

(assert (=> b!1401515 (=> (not res!940029) (not e!793581))))

(assert (=> b!1401515 (= res!940029 (and (= (size!46802 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46802 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46802 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401516 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95803 (_ BitVec 32)) SeekEntryResult!10569)

(assert (=> b!1401516 (= e!793578 (= (seekEntryOrOpen!0 (select (arr!46252 a!2901) j!112) a!2901 mask!2840) (Found!10569 j!112)))))

(declare-fun b!1401517 () Bool)

(assert (=> b!1401517 (= e!793582 e!793580)))

(declare-fun res!940025 () Bool)

(assert (=> b!1401517 (=> res!940025 e!793580)))

(assert (=> b!1401517 (= res!940025 (or (= lt!616984 lt!616989) (not (is-Intermediate!10569 lt!616989))))))

(assert (=> b!1401517 (= lt!616989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616987 mask!2840) lt!616987 lt!616986 mask!2840))))

(assert (=> b!1401517 (= lt!616987 (select (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401517 (= lt!616986 (array!95804 (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46802 a!2901)))))

(declare-fun res!940028 () Bool)

(assert (=> start!120394 (=> (not res!940028) (not e!793581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120394 (= res!940028 (validMask!0 mask!2840))))

(assert (=> start!120394 e!793581))

(assert (=> start!120394 true))

(declare-fun array_inv!35280 (array!95803) Bool)

(assert (=> start!120394 (array_inv!35280 a!2901)))

(declare-fun b!1401518 () Bool)

(declare-fun res!940027 () Bool)

(assert (=> b!1401518 (=> (not res!940027) (not e!793581))))

(declare-datatypes ((List!32771 0))(
  ( (Nil!32768) (Cons!32767 (h!34015 (_ BitVec 64)) (t!47465 List!32771)) )
))
(declare-fun arrayNoDuplicates!0 (array!95803 (_ BitVec 32) List!32771) Bool)

(assert (=> b!1401518 (= res!940027 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32768))))

(declare-fun b!1401519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95803 (_ BitVec 32)) SeekEntryResult!10569)

(assert (=> b!1401519 (= e!793577 (= (seekEntryOrOpen!0 lt!616987 lt!616986 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126284 lt!616989) (index!44655 lt!616989) (index!44655 lt!616989) (select (arr!46252 a!2901) j!112) lt!616986 mask!2840)))))

(assert (= (and start!120394 res!940028) b!1401515))

(assert (= (and b!1401515 res!940029) b!1401514))

(assert (= (and b!1401514 res!940022) b!1401510))

(assert (= (and b!1401510 res!940030) b!1401513))

(assert (= (and b!1401513 res!940024) b!1401518))

(assert (= (and b!1401518 res!940027) b!1401511))

(assert (= (and b!1401511 res!940020) b!1401516))

(assert (= (and b!1401511 (not res!940023)) b!1401517))

(assert (= (and b!1401517 (not res!940025)) b!1401509))

(assert (= (and b!1401509 res!940026) b!1401519))

(assert (= (and b!1401509 (not res!940021)) b!1401512))

(declare-fun m!1289317 () Bool)

(assert (=> b!1401510 m!1289317))

(assert (=> b!1401510 m!1289317))

(declare-fun m!1289319 () Bool)

(assert (=> b!1401510 m!1289319))

(assert (=> b!1401511 m!1289317))

(declare-fun m!1289321 () Bool)

(assert (=> b!1401511 m!1289321))

(assert (=> b!1401511 m!1289317))

(declare-fun m!1289323 () Bool)

(assert (=> b!1401511 m!1289323))

(declare-fun m!1289325 () Bool)

(assert (=> b!1401511 m!1289325))

(assert (=> b!1401511 m!1289317))

(declare-fun m!1289327 () Bool)

(assert (=> b!1401511 m!1289327))

(declare-fun m!1289329 () Bool)

(assert (=> b!1401517 m!1289329))

(assert (=> b!1401517 m!1289329))

(declare-fun m!1289331 () Bool)

(assert (=> b!1401517 m!1289331))

(declare-fun m!1289333 () Bool)

(assert (=> b!1401517 m!1289333))

(declare-fun m!1289335 () Bool)

(assert (=> b!1401517 m!1289335))

(declare-fun m!1289337 () Bool)

(assert (=> b!1401514 m!1289337))

(assert (=> b!1401514 m!1289337))

(declare-fun m!1289339 () Bool)

(assert (=> b!1401514 m!1289339))

(declare-fun m!1289341 () Bool)

(assert (=> b!1401519 m!1289341))

(assert (=> b!1401519 m!1289317))

(assert (=> b!1401519 m!1289317))

(declare-fun m!1289343 () Bool)

(assert (=> b!1401519 m!1289343))

(assert (=> b!1401516 m!1289317))

(assert (=> b!1401516 m!1289317))

(declare-fun m!1289345 () Bool)

(assert (=> b!1401516 m!1289345))

(declare-fun m!1289347 () Bool)

(assert (=> b!1401512 m!1289347))

(declare-fun m!1289349 () Bool)

(assert (=> start!120394 m!1289349))

(declare-fun m!1289351 () Bool)

(assert (=> start!120394 m!1289351))

(assert (=> b!1401509 m!1289333))

(declare-fun m!1289353 () Bool)

(assert (=> b!1401509 m!1289353))

(declare-fun m!1289355 () Bool)

(assert (=> b!1401509 m!1289355))

(declare-fun m!1289357 () Bool)

(assert (=> b!1401513 m!1289357))

(declare-fun m!1289359 () Bool)

(assert (=> b!1401518 m!1289359))

(push 1)

