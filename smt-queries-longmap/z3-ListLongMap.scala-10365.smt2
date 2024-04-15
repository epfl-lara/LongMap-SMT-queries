; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122000 () Bool)

(assert start!122000)

(declare-fun b!1415970 () Bool)

(declare-fun res!952065 () Bool)

(declare-fun e!801425 () Bool)

(assert (=> b!1415970 (=> (not res!952065) (not e!801425))))

(declare-datatypes ((array!96639 0))(
  ( (array!96640 (arr!46651 (Array (_ BitVec 32) (_ BitVec 64))) (size!47203 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96639)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415970 (= res!952065 (validKeyInArray!0 (select (arr!46651 a!2901) j!112)))))

(declare-fun b!1415971 () Bool)

(declare-fun e!801424 () Bool)

(assert (=> b!1415971 (= e!801425 (not e!801424))))

(declare-fun res!952072 () Bool)

(assert (=> b!1415971 (=> res!952072 e!801424)))

(declare-datatypes ((SeekEntryResult!10988 0))(
  ( (MissingZero!10988 (index!46344 (_ BitVec 32))) (Found!10988 (index!46345 (_ BitVec 32))) (Intermediate!10988 (undefined!11800 Bool) (index!46346 (_ BitVec 32)) (x!127944 (_ BitVec 32))) (Undefined!10988) (MissingVacant!10988 (index!46347 (_ BitVec 32))) )
))
(declare-fun lt!624420 () SeekEntryResult!10988)

(get-info :version)

(assert (=> b!1415971 (= res!952072 (or (not ((_ is Intermediate!10988) lt!624420)) (undefined!11800 lt!624420)))))

(declare-fun lt!624419 () SeekEntryResult!10988)

(assert (=> b!1415971 (= lt!624419 (Found!10988 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96639 (_ BitVec 32)) SeekEntryResult!10988)

(assert (=> b!1415971 (= lt!624419 (seekEntryOrOpen!0 (select (arr!46651 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96639 (_ BitVec 32)) Bool)

(assert (=> b!1415971 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47793 0))(
  ( (Unit!47794) )
))
(declare-fun lt!624418 () Unit!47793)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47793)

(assert (=> b!1415971 (= lt!624418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624415 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96639 (_ BitVec 32)) SeekEntryResult!10988)

(assert (=> b!1415971 (= lt!624420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624415 (select (arr!46651 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415971 (= lt!624415 (toIndex!0 (select (arr!46651 a!2901) j!112) mask!2840))))

(declare-fun res!952067 () Bool)

(assert (=> start!122000 (=> (not res!952067) (not e!801425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122000 (= res!952067 (validMask!0 mask!2840))))

(assert (=> start!122000 e!801425))

(assert (=> start!122000 true))

(declare-fun array_inv!35884 (array!96639) Bool)

(assert (=> start!122000 (array_inv!35884 a!2901)))

(declare-fun b!1415972 () Bool)

(declare-fun e!801428 () Bool)

(assert (=> b!1415972 (= e!801424 e!801428)))

(declare-fun res!952066 () Bool)

(assert (=> b!1415972 (=> res!952066 e!801428)))

(declare-fun lt!624416 () SeekEntryResult!10988)

(assert (=> b!1415972 (= res!952066 (or (= lt!624420 lt!624416) (not ((_ is Intermediate!10988) lt!624416))))))

(declare-fun lt!624414 () array!96639)

(declare-fun lt!624421 () (_ BitVec 64))

(assert (=> b!1415972 (= lt!624416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624421 mask!2840) lt!624421 lt!624414 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415972 (= lt!624421 (select (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415972 (= lt!624414 (array!96640 (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47203 a!2901)))))

(declare-fun b!1415973 () Bool)

(declare-fun res!952068 () Bool)

(assert (=> b!1415973 (=> (not res!952068) (not e!801425))))

(declare-datatypes ((List!33248 0))(
  ( (Nil!33245) (Cons!33244 (h!34531 (_ BitVec 64)) (t!47934 List!33248)) )
))
(declare-fun arrayNoDuplicates!0 (array!96639 (_ BitVec 32) List!33248) Bool)

(assert (=> b!1415973 (= res!952068 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33245))))

(declare-fun b!1415974 () Bool)

(declare-fun res!952069 () Bool)

(assert (=> b!1415974 (=> (not res!952069) (not e!801425))))

(assert (=> b!1415974 (= res!952069 (and (= (size!47203 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47203 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47203 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415975 () Bool)

(declare-fun res!952064 () Bool)

(assert (=> b!1415975 (=> (not res!952064) (not e!801425))))

(assert (=> b!1415975 (= res!952064 (validKeyInArray!0 (select (arr!46651 a!2901) i!1037)))))

(declare-fun b!1415976 () Bool)

(declare-fun e!801426 () Bool)

(assert (=> b!1415976 (= e!801426 true)))

(declare-fun lt!624422 () SeekEntryResult!10988)

(assert (=> b!1415976 (= lt!624419 lt!624422)))

(declare-fun lt!624413 () Unit!47793)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47793)

(assert (=> b!1415976 (= lt!624413 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624415 (x!127944 lt!624420) (index!46346 lt!624420) (x!127944 lt!624416) (index!46346 lt!624416) mask!2840))))

(declare-fun b!1415977 () Bool)

(assert (=> b!1415977 (= e!801428 e!801426)))

(declare-fun res!952071 () Bool)

(assert (=> b!1415977 (=> res!952071 e!801426)))

(assert (=> b!1415977 (= res!952071 (or (bvslt (x!127944 lt!624420) #b00000000000000000000000000000000) (bvsgt (x!127944 lt!624420) #b01111111111111111111111111111110) (bvslt (x!127944 lt!624416) #b00000000000000000000000000000000) (bvsgt (x!127944 lt!624416) #b01111111111111111111111111111110) (bvslt lt!624415 #b00000000000000000000000000000000) (bvsge lt!624415 (size!47203 a!2901)) (bvslt (index!46346 lt!624420) #b00000000000000000000000000000000) (bvsge (index!46346 lt!624420) (size!47203 a!2901)) (bvslt (index!46346 lt!624416) #b00000000000000000000000000000000) (bvsge (index!46346 lt!624416) (size!47203 a!2901)) (not (= lt!624420 (Intermediate!10988 false (index!46346 lt!624420) (x!127944 lt!624420)))) (not (= lt!624416 (Intermediate!10988 false (index!46346 lt!624416) (x!127944 lt!624416))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96639 (_ BitVec 32)) SeekEntryResult!10988)

(assert (=> b!1415977 (= lt!624422 (seekKeyOrZeroReturnVacant!0 (x!127944 lt!624416) (index!46346 lt!624416) (index!46346 lt!624416) (select (arr!46651 a!2901) j!112) lt!624414 mask!2840))))

(assert (=> b!1415977 (= lt!624422 (seekEntryOrOpen!0 lt!624421 lt!624414 mask!2840))))

(assert (=> b!1415977 (and (not (undefined!11800 lt!624416)) (= (index!46346 lt!624416) i!1037) (bvslt (x!127944 lt!624416) (x!127944 lt!624420)) (= (select (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46346 lt!624416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624417 () Unit!47793)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47793)

(assert (=> b!1415977 (= lt!624417 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624415 (x!127944 lt!624420) (index!46346 lt!624420) (x!127944 lt!624416) (index!46346 lt!624416) (undefined!11800 lt!624416) mask!2840))))

(declare-fun b!1415978 () Bool)

(declare-fun res!952070 () Bool)

(assert (=> b!1415978 (=> res!952070 e!801426)))

(assert (=> b!1415978 (= res!952070 (not (= lt!624416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624415 lt!624421 lt!624414 mask!2840))))))

(declare-fun b!1415979 () Bool)

(declare-fun res!952063 () Bool)

(assert (=> b!1415979 (=> (not res!952063) (not e!801425))))

(assert (=> b!1415979 (= res!952063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122000 res!952067) b!1415974))

(assert (= (and b!1415974 res!952069) b!1415975))

(assert (= (and b!1415975 res!952064) b!1415970))

(assert (= (and b!1415970 res!952065) b!1415979))

(assert (= (and b!1415979 res!952063) b!1415973))

(assert (= (and b!1415973 res!952068) b!1415971))

(assert (= (and b!1415971 (not res!952072)) b!1415972))

(assert (= (and b!1415972 (not res!952066)) b!1415977))

(assert (= (and b!1415977 (not res!952071)) b!1415978))

(assert (= (and b!1415978 (not res!952070)) b!1415976))

(declare-fun m!1306033 () Bool)

(assert (=> b!1415973 m!1306033))

(declare-fun m!1306035 () Bool)

(assert (=> start!122000 m!1306035))

(declare-fun m!1306037 () Bool)

(assert (=> start!122000 m!1306037))

(declare-fun m!1306039 () Bool)

(assert (=> b!1415978 m!1306039))

(declare-fun m!1306041 () Bool)

(assert (=> b!1415970 m!1306041))

(assert (=> b!1415970 m!1306041))

(declare-fun m!1306043 () Bool)

(assert (=> b!1415970 m!1306043))

(declare-fun m!1306045 () Bool)

(assert (=> b!1415972 m!1306045))

(assert (=> b!1415972 m!1306045))

(declare-fun m!1306047 () Bool)

(assert (=> b!1415972 m!1306047))

(declare-fun m!1306049 () Bool)

(assert (=> b!1415972 m!1306049))

(declare-fun m!1306051 () Bool)

(assert (=> b!1415972 m!1306051))

(assert (=> b!1415971 m!1306041))

(declare-fun m!1306053 () Bool)

(assert (=> b!1415971 m!1306053))

(assert (=> b!1415971 m!1306041))

(assert (=> b!1415971 m!1306041))

(declare-fun m!1306055 () Bool)

(assert (=> b!1415971 m!1306055))

(declare-fun m!1306057 () Bool)

(assert (=> b!1415971 m!1306057))

(assert (=> b!1415971 m!1306041))

(declare-fun m!1306059 () Bool)

(assert (=> b!1415971 m!1306059))

(declare-fun m!1306061 () Bool)

(assert (=> b!1415971 m!1306061))

(declare-fun m!1306063 () Bool)

(assert (=> b!1415976 m!1306063))

(declare-fun m!1306065 () Bool)

(assert (=> b!1415977 m!1306065))

(declare-fun m!1306067 () Bool)

(assert (=> b!1415977 m!1306067))

(declare-fun m!1306069 () Bool)

(assert (=> b!1415977 m!1306069))

(assert (=> b!1415977 m!1306041))

(assert (=> b!1415977 m!1306041))

(declare-fun m!1306071 () Bool)

(assert (=> b!1415977 m!1306071))

(assert (=> b!1415977 m!1306049))

(declare-fun m!1306073 () Bool)

(assert (=> b!1415975 m!1306073))

(assert (=> b!1415975 m!1306073))

(declare-fun m!1306075 () Bool)

(assert (=> b!1415975 m!1306075))

(declare-fun m!1306077 () Bool)

(assert (=> b!1415979 m!1306077))

(check-sat (not b!1415972) (not b!1415976) (not b!1415979) (not b!1415975) (not b!1415978) (not b!1415970) (not start!122000) (not b!1415973) (not b!1415977) (not b!1415971))
(check-sat)
