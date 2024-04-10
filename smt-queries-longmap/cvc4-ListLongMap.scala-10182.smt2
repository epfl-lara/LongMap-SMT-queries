; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120022 () Bool)

(assert start!120022)

(declare-fun b!1397257 () Bool)

(declare-fun res!936177 () Bool)

(declare-fun e!791032 () Bool)

(assert (=> b!1397257 (=> (not res!936177) (not e!791032))))

(declare-datatypes ((array!95551 0))(
  ( (array!95552 (arr!46129 (Array (_ BitVec 32) (_ BitVec 64))) (size!46679 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95551)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397257 (= res!936177 (validKeyInArray!0 (select (arr!46129 a!2901) i!1037)))))

(declare-fun b!1397258 () Bool)

(declare-fun res!936174 () Bool)

(assert (=> b!1397258 (=> (not res!936174) (not e!791032))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95551 (_ BitVec 32)) Bool)

(assert (=> b!1397258 (= res!936174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397259 () Bool)

(declare-fun e!791029 () Bool)

(assert (=> b!1397259 (= e!791032 (not e!791029))))

(declare-fun res!936175 () Bool)

(assert (=> b!1397259 (=> res!936175 e!791029)))

(declare-datatypes ((SeekEntryResult!10446 0))(
  ( (MissingZero!10446 (index!44155 (_ BitVec 32))) (Found!10446 (index!44156 (_ BitVec 32))) (Intermediate!10446 (undefined!11258 Bool) (index!44157 (_ BitVec 32)) (x!125812 (_ BitVec 32))) (Undefined!10446) (MissingVacant!10446 (index!44158 (_ BitVec 32))) )
))
(declare-fun lt!614066 () SeekEntryResult!10446)

(assert (=> b!1397259 (= res!936175 (or (not (is-Intermediate!10446 lt!614066)) (undefined!11258 lt!614066)))))

(declare-fun e!791033 () Bool)

(assert (=> b!1397259 e!791033))

(declare-fun res!936172 () Bool)

(assert (=> b!1397259 (=> (not res!936172) (not e!791033))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397259 (= res!936172 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46896 0))(
  ( (Unit!46897) )
))
(declare-fun lt!614064 () Unit!46896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46896)

(assert (=> b!1397259 (= lt!614064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614061 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95551 (_ BitVec 32)) SeekEntryResult!10446)

(assert (=> b!1397259 (= lt!614066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614061 (select (arr!46129 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397259 (= lt!614061 (toIndex!0 (select (arr!46129 a!2901) j!112) mask!2840))))

(declare-fun b!1397260 () Bool)

(declare-fun e!791030 () Bool)

(assert (=> b!1397260 (= e!791030 true)))

(declare-fun lt!614063 () SeekEntryResult!10446)

(declare-fun lt!614062 () (_ BitVec 64))

(declare-fun lt!614065 () array!95551)

(assert (=> b!1397260 (= lt!614063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614061 lt!614062 lt!614065 mask!2840))))

(declare-fun res!936173 () Bool)

(assert (=> start!120022 (=> (not res!936173) (not e!791032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120022 (= res!936173 (validMask!0 mask!2840))))

(assert (=> start!120022 e!791032))

(assert (=> start!120022 true))

(declare-fun array_inv!35157 (array!95551) Bool)

(assert (=> start!120022 (array_inv!35157 a!2901)))

(declare-fun b!1397261 () Bool)

(declare-fun res!936171 () Bool)

(assert (=> b!1397261 (=> (not res!936171) (not e!791032))))

(assert (=> b!1397261 (= res!936171 (validKeyInArray!0 (select (arr!46129 a!2901) j!112)))))

(declare-fun b!1397262 () Bool)

(declare-fun res!936170 () Bool)

(assert (=> b!1397262 (=> (not res!936170) (not e!791032))))

(assert (=> b!1397262 (= res!936170 (and (= (size!46679 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46679 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46679 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397263 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95551 (_ BitVec 32)) SeekEntryResult!10446)

(assert (=> b!1397263 (= e!791033 (= (seekEntryOrOpen!0 (select (arr!46129 a!2901) j!112) a!2901 mask!2840) (Found!10446 j!112)))))

(declare-fun b!1397264 () Bool)

(assert (=> b!1397264 (= e!791029 e!791030)))

(declare-fun res!936176 () Bool)

(assert (=> b!1397264 (=> res!936176 e!791030)))

(declare-fun lt!614067 () SeekEntryResult!10446)

(assert (=> b!1397264 (= res!936176 (or (= lt!614066 lt!614067) (not (is-Intermediate!10446 lt!614067)) (bvslt (x!125812 lt!614066) #b00000000000000000000000000000000) (bvsgt (x!125812 lt!614066) #b01111111111111111111111111111110) (bvslt lt!614061 #b00000000000000000000000000000000) (bvsge lt!614061 (size!46679 a!2901)) (bvslt (index!44157 lt!614066) #b00000000000000000000000000000000) (bvsge (index!44157 lt!614066) (size!46679 a!2901)) (not (= lt!614066 (Intermediate!10446 false (index!44157 lt!614066) (x!125812 lt!614066)))) (not (= lt!614067 (Intermediate!10446 (undefined!11258 lt!614067) (index!44157 lt!614067) (x!125812 lt!614067))))))))

(assert (=> b!1397264 (= lt!614067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614062 mask!2840) lt!614062 lt!614065 mask!2840))))

(assert (=> b!1397264 (= lt!614062 (select (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397264 (= lt!614065 (array!95552 (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46679 a!2901)))))

(declare-fun b!1397265 () Bool)

(declare-fun res!936178 () Bool)

(assert (=> b!1397265 (=> (not res!936178) (not e!791032))))

(declare-datatypes ((List!32648 0))(
  ( (Nil!32645) (Cons!32644 (h!33886 (_ BitVec 64)) (t!47342 List!32648)) )
))
(declare-fun arrayNoDuplicates!0 (array!95551 (_ BitVec 32) List!32648) Bool)

(assert (=> b!1397265 (= res!936178 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32645))))

(assert (= (and start!120022 res!936173) b!1397262))

(assert (= (and b!1397262 res!936170) b!1397257))

(assert (= (and b!1397257 res!936177) b!1397261))

(assert (= (and b!1397261 res!936171) b!1397258))

(assert (= (and b!1397258 res!936174) b!1397265))

(assert (= (and b!1397265 res!936178) b!1397259))

(assert (= (and b!1397259 res!936172) b!1397263))

(assert (= (and b!1397259 (not res!936175)) b!1397264))

(assert (= (and b!1397264 (not res!936176)) b!1397260))

(declare-fun m!1283967 () Bool)

(assert (=> b!1397265 m!1283967))

(declare-fun m!1283969 () Bool)

(assert (=> b!1397260 m!1283969))

(declare-fun m!1283971 () Bool)

(assert (=> b!1397261 m!1283971))

(assert (=> b!1397261 m!1283971))

(declare-fun m!1283973 () Bool)

(assert (=> b!1397261 m!1283973))

(declare-fun m!1283975 () Bool)

(assert (=> b!1397257 m!1283975))

(assert (=> b!1397257 m!1283975))

(declare-fun m!1283977 () Bool)

(assert (=> b!1397257 m!1283977))

(declare-fun m!1283979 () Bool)

(assert (=> b!1397258 m!1283979))

(declare-fun m!1283981 () Bool)

(assert (=> start!120022 m!1283981))

(declare-fun m!1283983 () Bool)

(assert (=> start!120022 m!1283983))

(assert (=> b!1397259 m!1283971))

(declare-fun m!1283985 () Bool)

(assert (=> b!1397259 m!1283985))

(assert (=> b!1397259 m!1283971))

(declare-fun m!1283987 () Bool)

(assert (=> b!1397259 m!1283987))

(assert (=> b!1397259 m!1283971))

(declare-fun m!1283989 () Bool)

(assert (=> b!1397259 m!1283989))

(declare-fun m!1283991 () Bool)

(assert (=> b!1397259 m!1283991))

(declare-fun m!1283993 () Bool)

(assert (=> b!1397264 m!1283993))

(assert (=> b!1397264 m!1283993))

(declare-fun m!1283995 () Bool)

(assert (=> b!1397264 m!1283995))

(declare-fun m!1283997 () Bool)

(assert (=> b!1397264 m!1283997))

(declare-fun m!1283999 () Bool)

(assert (=> b!1397264 m!1283999))

(assert (=> b!1397263 m!1283971))

(assert (=> b!1397263 m!1283971))

(declare-fun m!1284001 () Bool)

(assert (=> b!1397263 m!1284001))

(push 1)

