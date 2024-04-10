; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121624 () Bool)

(assert start!121624)

(declare-fun res!949973 () Bool)

(declare-fun e!799626 () Bool)

(assert (=> start!121624 (=> (not res!949973) (not e!799626))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121624 (= res!949973 (validMask!0 mask!2840))))

(assert (=> start!121624 e!799626))

(assert (=> start!121624 true))

(declare-datatypes ((array!96562 0))(
  ( (array!96563 (arr!46618 (Array (_ BitVec 32) (_ BitVec 64))) (size!47168 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96562)

(declare-fun array_inv!35646 (array!96562) Bool)

(assert (=> start!121624 (array_inv!35646 a!2901)))

(declare-fun b!1412976 () Bool)

(declare-fun res!949975 () Bool)

(assert (=> b!1412976 (=> (not res!949975) (not e!799626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96562 (_ BitVec 32)) Bool)

(assert (=> b!1412976 (= res!949975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412977 () Bool)

(declare-fun e!799628 () Bool)

(assert (=> b!1412977 (= e!799628 true)))

(declare-fun e!799623 () Bool)

(assert (=> b!1412977 e!799623))

(declare-fun res!949967 () Bool)

(assert (=> b!1412977 (=> (not res!949967) (not e!799623))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10929 0))(
  ( (MissingZero!10929 (index!46096 (_ BitVec 32))) (Found!10929 (index!46097 (_ BitVec 32))) (Intermediate!10929 (undefined!11741 Bool) (index!46098 (_ BitVec 32)) (x!127680 (_ BitVec 32))) (Undefined!10929) (MissingVacant!10929 (index!46099 (_ BitVec 32))) )
))
(declare-fun lt!622710 () SeekEntryResult!10929)

(declare-fun lt!622714 () SeekEntryResult!10929)

(assert (=> b!1412977 (= res!949967 (and (not (undefined!11741 lt!622714)) (= (index!46098 lt!622714) i!1037) (bvslt (x!127680 lt!622714) (x!127680 lt!622710)) (= (select (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46098 lt!622714)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47832 0))(
  ( (Unit!47833) )
))
(declare-fun lt!622715 () Unit!47832)

(declare-fun lt!622712 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47832)

(assert (=> b!1412977 (= lt!622715 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622712 (x!127680 lt!622710) (index!46098 lt!622710) (x!127680 lt!622714) (index!46098 lt!622714) (undefined!11741 lt!622714) mask!2840))))

(declare-fun b!1412978 () Bool)

(declare-fun res!949971 () Bool)

(assert (=> b!1412978 (=> (not res!949971) (not e!799626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412978 (= res!949971 (validKeyInArray!0 (select (arr!46618 a!2901) i!1037)))))

(declare-fun b!1412979 () Bool)

(declare-fun res!949969 () Bool)

(assert (=> b!1412979 (=> (not res!949969) (not e!799626))))

(assert (=> b!1412979 (= res!949969 (validKeyInArray!0 (select (arr!46618 a!2901) j!112)))))

(declare-fun b!1412980 () Bool)

(declare-fun e!799625 () Bool)

(assert (=> b!1412980 (= e!799626 (not e!799625))))

(declare-fun res!949970 () Bool)

(assert (=> b!1412980 (=> res!949970 e!799625)))

(assert (=> b!1412980 (= res!949970 (or (not (is-Intermediate!10929 lt!622710)) (undefined!11741 lt!622710)))))

(declare-fun e!799624 () Bool)

(assert (=> b!1412980 e!799624))

(declare-fun res!949966 () Bool)

(assert (=> b!1412980 (=> (not res!949966) (not e!799624))))

(assert (=> b!1412980 (= res!949966 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622716 () Unit!47832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47832)

(assert (=> b!1412980 (= lt!622716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96562 (_ BitVec 32)) SeekEntryResult!10929)

(assert (=> b!1412980 (= lt!622710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622712 (select (arr!46618 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412980 (= lt!622712 (toIndex!0 (select (arr!46618 a!2901) j!112) mask!2840))))

(declare-fun b!1412981 () Bool)

(declare-fun lt!622711 () (_ BitVec 64))

(declare-fun lt!622713 () array!96562)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96562 (_ BitVec 32)) SeekEntryResult!10929)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96562 (_ BitVec 32)) SeekEntryResult!10929)

(assert (=> b!1412981 (= e!799623 (= (seekEntryOrOpen!0 lt!622711 lt!622713 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127680 lt!622714) (index!46098 lt!622714) (index!46098 lt!622714) (select (arr!46618 a!2901) j!112) lt!622713 mask!2840)))))

(declare-fun b!1412982 () Bool)

(assert (=> b!1412982 (= e!799624 (= (seekEntryOrOpen!0 (select (arr!46618 a!2901) j!112) a!2901 mask!2840) (Found!10929 j!112)))))

(declare-fun b!1412983 () Bool)

(declare-fun res!949974 () Bool)

(assert (=> b!1412983 (=> (not res!949974) (not e!799626))))

(declare-datatypes ((List!33137 0))(
  ( (Nil!33134) (Cons!33133 (h!34408 (_ BitVec 64)) (t!47831 List!33137)) )
))
(declare-fun arrayNoDuplicates!0 (array!96562 (_ BitVec 32) List!33137) Bool)

(assert (=> b!1412983 (= res!949974 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33134))))

(declare-fun b!1412984 () Bool)

(assert (=> b!1412984 (= e!799625 e!799628)))

(declare-fun res!949968 () Bool)

(assert (=> b!1412984 (=> res!949968 e!799628)))

(assert (=> b!1412984 (= res!949968 (or (= lt!622710 lt!622714) (not (is-Intermediate!10929 lt!622714))))))

(assert (=> b!1412984 (= lt!622714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622711 mask!2840) lt!622711 lt!622713 mask!2840))))

(assert (=> b!1412984 (= lt!622711 (select (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412984 (= lt!622713 (array!96563 (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47168 a!2901)))))

(declare-fun b!1412985 () Bool)

(declare-fun res!949972 () Bool)

(assert (=> b!1412985 (=> (not res!949972) (not e!799626))))

(assert (=> b!1412985 (= res!949972 (and (= (size!47168 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47168 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47168 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121624 res!949973) b!1412985))

(assert (= (and b!1412985 res!949972) b!1412978))

(assert (= (and b!1412978 res!949971) b!1412979))

(assert (= (and b!1412979 res!949969) b!1412976))

(assert (= (and b!1412976 res!949975) b!1412983))

(assert (= (and b!1412983 res!949974) b!1412980))

(assert (= (and b!1412980 res!949966) b!1412982))

(assert (= (and b!1412980 (not res!949970)) b!1412984))

(assert (= (and b!1412984 (not res!949968)) b!1412977))

(assert (= (and b!1412977 res!949967) b!1412981))

(declare-fun m!1303215 () Bool)

(assert (=> b!1412984 m!1303215))

(assert (=> b!1412984 m!1303215))

(declare-fun m!1303217 () Bool)

(assert (=> b!1412984 m!1303217))

(declare-fun m!1303219 () Bool)

(assert (=> b!1412984 m!1303219))

(declare-fun m!1303221 () Bool)

(assert (=> b!1412984 m!1303221))

(declare-fun m!1303223 () Bool)

(assert (=> b!1412983 m!1303223))

(declare-fun m!1303225 () Bool)

(assert (=> b!1412976 m!1303225))

(assert (=> b!1412977 m!1303219))

(declare-fun m!1303227 () Bool)

(assert (=> b!1412977 m!1303227))

(declare-fun m!1303229 () Bool)

(assert (=> b!1412977 m!1303229))

(declare-fun m!1303231 () Bool)

(assert (=> start!121624 m!1303231))

(declare-fun m!1303233 () Bool)

(assert (=> start!121624 m!1303233))

(declare-fun m!1303235 () Bool)

(assert (=> b!1412980 m!1303235))

(declare-fun m!1303237 () Bool)

(assert (=> b!1412980 m!1303237))

(assert (=> b!1412980 m!1303235))

(declare-fun m!1303239 () Bool)

(assert (=> b!1412980 m!1303239))

(assert (=> b!1412980 m!1303235))

(declare-fun m!1303241 () Bool)

(assert (=> b!1412980 m!1303241))

(declare-fun m!1303243 () Bool)

(assert (=> b!1412980 m!1303243))

(declare-fun m!1303245 () Bool)

(assert (=> b!1412978 m!1303245))

(assert (=> b!1412978 m!1303245))

(declare-fun m!1303247 () Bool)

(assert (=> b!1412978 m!1303247))

(declare-fun m!1303249 () Bool)

(assert (=> b!1412981 m!1303249))

(assert (=> b!1412981 m!1303235))

(assert (=> b!1412981 m!1303235))

(declare-fun m!1303251 () Bool)

(assert (=> b!1412981 m!1303251))

(assert (=> b!1412982 m!1303235))

(assert (=> b!1412982 m!1303235))

(declare-fun m!1303253 () Bool)

(assert (=> b!1412982 m!1303253))

(assert (=> b!1412979 m!1303235))

(assert (=> b!1412979 m!1303235))

(declare-fun m!1303255 () Bool)

(assert (=> b!1412979 m!1303255))

(push 1)

