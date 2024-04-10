; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122002 () Bool)

(assert start!122002)

(declare-fun b!1416021 () Bool)

(declare-fun res!952064 () Bool)

(declare-fun e!801451 () Bool)

(assert (=> b!1416021 (=> (not res!952064) (not e!801451))))

(declare-datatypes ((array!96688 0))(
  ( (array!96689 (arr!46675 (Array (_ BitVec 32) (_ BitVec 64))) (size!47225 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96688)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416021 (= res!952064 (validKeyInArray!0 (select (arr!46675 a!2901) j!112)))))

(declare-fun b!1416022 () Bool)

(declare-fun e!801449 () Bool)

(declare-fun e!801450 () Bool)

(assert (=> b!1416022 (= e!801449 e!801450)))

(declare-fun res!952070 () Bool)

(assert (=> b!1416022 (=> res!952070 e!801450)))

(declare-datatypes ((SeekEntryResult!10986 0))(
  ( (MissingZero!10986 (index!46336 (_ BitVec 32))) (Found!10986 (index!46337 (_ BitVec 32))) (Intermediate!10986 (undefined!11798 Bool) (index!46338 (_ BitVec 32)) (x!127937 (_ BitVec 32))) (Undefined!10986) (MissingVacant!10986 (index!46339 (_ BitVec 32))) )
))
(declare-fun lt!624575 () SeekEntryResult!10986)

(declare-fun lt!624578 () SeekEntryResult!10986)

(declare-fun lt!624579 () (_ BitVec 32))

(assert (=> b!1416022 (= res!952070 (or (bvslt (x!127937 lt!624578) #b00000000000000000000000000000000) (bvsgt (x!127937 lt!624578) #b01111111111111111111111111111110) (bvslt (x!127937 lt!624575) #b00000000000000000000000000000000) (bvsgt (x!127937 lt!624575) #b01111111111111111111111111111110) (bvslt lt!624579 #b00000000000000000000000000000000) (bvsge lt!624579 (size!47225 a!2901)) (bvslt (index!46338 lt!624578) #b00000000000000000000000000000000) (bvsge (index!46338 lt!624578) (size!47225 a!2901)) (bvslt (index!46338 lt!624575) #b00000000000000000000000000000000) (bvsge (index!46338 lt!624575) (size!47225 a!2901)) (not (= lt!624578 (Intermediate!10986 false (index!46338 lt!624578) (x!127937 lt!624578)))) (not (= lt!624575 (Intermediate!10986 false (index!46338 lt!624575) (x!127937 lt!624575))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624576 () SeekEntryResult!10986)

(declare-fun lt!624577 () array!96688)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96688 (_ BitVec 32)) SeekEntryResult!10986)

(assert (=> b!1416022 (= lt!624576 (seekKeyOrZeroReturnVacant!0 (x!127937 lt!624575) (index!46338 lt!624575) (index!46338 lt!624575) (select (arr!46675 a!2901) j!112) lt!624577 mask!2840))))

(declare-fun lt!624573 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96688 (_ BitVec 32)) SeekEntryResult!10986)

(assert (=> b!1416022 (= lt!624576 (seekEntryOrOpen!0 lt!624573 lt!624577 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416022 (and (not (undefined!11798 lt!624575)) (= (index!46338 lt!624575) i!1037) (bvslt (x!127937 lt!624575) (x!127937 lt!624578)) (= (select (store (arr!46675 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46338 lt!624575)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47946 0))(
  ( (Unit!47947) )
))
(declare-fun lt!624574 () Unit!47946)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47946)

(assert (=> b!1416022 (= lt!624574 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624579 (x!127937 lt!624578) (index!46338 lt!624578) (x!127937 lt!624575) (index!46338 lt!624575) (undefined!11798 lt!624575) mask!2840))))

(declare-fun b!1416024 () Bool)

(declare-fun res!952071 () Bool)

(assert (=> b!1416024 (=> (not res!952071) (not e!801451))))

(assert (=> b!1416024 (= res!952071 (validKeyInArray!0 (select (arr!46675 a!2901) i!1037)))))

(declare-fun b!1416025 () Bool)

(declare-fun res!952069 () Bool)

(assert (=> b!1416025 (=> (not res!952069) (not e!801451))))

(declare-datatypes ((List!33194 0))(
  ( (Nil!33191) (Cons!33190 (h!34477 (_ BitVec 64)) (t!47888 List!33194)) )
))
(declare-fun arrayNoDuplicates!0 (array!96688 (_ BitVec 32) List!33194) Bool)

(assert (=> b!1416025 (= res!952069 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33191))))

(declare-fun b!1416026 () Bool)

(assert (=> b!1416026 (= e!801450 true)))

(declare-fun lt!624582 () SeekEntryResult!10986)

(assert (=> b!1416026 (= lt!624582 lt!624576)))

(declare-fun lt!624581 () Unit!47946)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47946)

(assert (=> b!1416026 (= lt!624581 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624579 (x!127937 lt!624578) (index!46338 lt!624578) (x!127937 lt!624575) (index!46338 lt!624575) mask!2840))))

(declare-fun b!1416027 () Bool)

(declare-fun res!952065 () Bool)

(assert (=> b!1416027 (=> (not res!952065) (not e!801451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96688 (_ BitVec 32)) Bool)

(assert (=> b!1416027 (= res!952065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416028 () Bool)

(declare-fun e!801448 () Bool)

(assert (=> b!1416028 (= e!801448 e!801449)))

(declare-fun res!952066 () Bool)

(assert (=> b!1416028 (=> res!952066 e!801449)))

(assert (=> b!1416028 (= res!952066 (or (= lt!624578 lt!624575) (not (is-Intermediate!10986 lt!624575))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96688 (_ BitVec 32)) SeekEntryResult!10986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416028 (= lt!624575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624573 mask!2840) lt!624573 lt!624577 mask!2840))))

(assert (=> b!1416028 (= lt!624573 (select (store (arr!46675 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416028 (= lt!624577 (array!96689 (store (arr!46675 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47225 a!2901)))))

(declare-fun b!1416023 () Bool)

(declare-fun res!952063 () Bool)

(assert (=> b!1416023 (=> (not res!952063) (not e!801451))))

(assert (=> b!1416023 (= res!952063 (and (= (size!47225 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47225 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47225 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952068 () Bool)

(assert (=> start!122002 (=> (not res!952068) (not e!801451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122002 (= res!952068 (validMask!0 mask!2840))))

(assert (=> start!122002 e!801451))

(assert (=> start!122002 true))

(declare-fun array_inv!35703 (array!96688) Bool)

(assert (=> start!122002 (array_inv!35703 a!2901)))

(declare-fun b!1416029 () Bool)

(assert (=> b!1416029 (= e!801451 (not e!801448))))

(declare-fun res!952072 () Bool)

(assert (=> b!1416029 (=> res!952072 e!801448)))

(assert (=> b!1416029 (= res!952072 (or (not (is-Intermediate!10986 lt!624578)) (undefined!11798 lt!624578)))))

(assert (=> b!1416029 (= lt!624582 (Found!10986 j!112))))

(assert (=> b!1416029 (= lt!624582 (seekEntryOrOpen!0 (select (arr!46675 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416029 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624580 () Unit!47946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47946)

(assert (=> b!1416029 (= lt!624580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416029 (= lt!624578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624579 (select (arr!46675 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416029 (= lt!624579 (toIndex!0 (select (arr!46675 a!2901) j!112) mask!2840))))

(declare-fun b!1416030 () Bool)

(declare-fun res!952067 () Bool)

(assert (=> b!1416030 (=> res!952067 e!801450)))

(assert (=> b!1416030 (= res!952067 (not (= lt!624575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624579 lt!624573 lt!624577 mask!2840))))))

(assert (= (and start!122002 res!952068) b!1416023))

(assert (= (and b!1416023 res!952063) b!1416024))

(assert (= (and b!1416024 res!952071) b!1416021))

(assert (= (and b!1416021 res!952064) b!1416027))

(assert (= (and b!1416027 res!952065) b!1416025))

(assert (= (and b!1416025 res!952069) b!1416029))

(assert (= (and b!1416029 (not res!952072)) b!1416028))

(assert (= (and b!1416028 (not res!952066)) b!1416022))

(assert (= (and b!1416022 (not res!952070)) b!1416030))

(assert (= (and b!1416030 (not res!952067)) b!1416026))

(declare-fun m!1306523 () Bool)

(assert (=> b!1416028 m!1306523))

(assert (=> b!1416028 m!1306523))

(declare-fun m!1306525 () Bool)

(assert (=> b!1416028 m!1306525))

(declare-fun m!1306527 () Bool)

(assert (=> b!1416028 m!1306527))

(declare-fun m!1306529 () Bool)

(assert (=> b!1416028 m!1306529))

(declare-fun m!1306531 () Bool)

(assert (=> b!1416024 m!1306531))

(assert (=> b!1416024 m!1306531))

(declare-fun m!1306533 () Bool)

(assert (=> b!1416024 m!1306533))

(declare-fun m!1306535 () Bool)

(assert (=> b!1416029 m!1306535))

(declare-fun m!1306537 () Bool)

(assert (=> b!1416029 m!1306537))

(assert (=> b!1416029 m!1306535))

(declare-fun m!1306539 () Bool)

(assert (=> b!1416029 m!1306539))

(declare-fun m!1306541 () Bool)

(assert (=> b!1416029 m!1306541))

(assert (=> b!1416029 m!1306535))

(declare-fun m!1306543 () Bool)

(assert (=> b!1416029 m!1306543))

(assert (=> b!1416029 m!1306535))

(declare-fun m!1306545 () Bool)

(assert (=> b!1416029 m!1306545))

(declare-fun m!1306547 () Bool)

(assert (=> b!1416022 m!1306547))

(assert (=> b!1416022 m!1306535))

(assert (=> b!1416022 m!1306535))

(declare-fun m!1306549 () Bool)

(assert (=> b!1416022 m!1306549))

(assert (=> b!1416022 m!1306527))

(declare-fun m!1306551 () Bool)

(assert (=> b!1416022 m!1306551))

(declare-fun m!1306553 () Bool)

(assert (=> b!1416022 m!1306553))

(declare-fun m!1306555 () Bool)

(assert (=> b!1416025 m!1306555))

(declare-fun m!1306557 () Bool)

(assert (=> b!1416026 m!1306557))

(declare-fun m!1306559 () Bool)

(assert (=> b!1416027 m!1306559))

(assert (=> b!1416021 m!1306535))

(assert (=> b!1416021 m!1306535))

(declare-fun m!1306561 () Bool)

(assert (=> b!1416021 m!1306561))

(declare-fun m!1306563 () Bool)

(assert (=> start!122002 m!1306563))

(declare-fun m!1306565 () Bool)

(assert (=> start!122002 m!1306565))

(declare-fun m!1306567 () Bool)

(assert (=> b!1416030 m!1306567))

(push 1)

