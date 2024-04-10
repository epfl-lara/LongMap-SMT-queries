; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121654 () Bool)

(assert start!121654)

(declare-fun b!1413426 () Bool)

(declare-fun res!950418 () Bool)

(declare-fun e!799897 () Bool)

(assert (=> b!1413426 (=> (not res!950418) (not e!799897))))

(declare-datatypes ((array!96592 0))(
  ( (array!96593 (arr!46633 (Array (_ BitVec 32) (_ BitVec 64))) (size!47183 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96592)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413426 (= res!950418 (validKeyInArray!0 (select (arr!46633 a!2901) j!112)))))

(declare-fun b!1413427 () Bool)

(declare-fun res!950421 () Bool)

(assert (=> b!1413427 (=> (not res!950421) (not e!799897))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96592 (_ BitVec 32)) Bool)

(assert (=> b!1413427 (= res!950421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413428 () Bool)

(declare-fun res!950417 () Bool)

(assert (=> b!1413428 (=> (not res!950417) (not e!799897))))

(declare-datatypes ((List!33152 0))(
  ( (Nil!33149) (Cons!33148 (h!34423 (_ BitVec 64)) (t!47846 List!33152)) )
))
(declare-fun arrayNoDuplicates!0 (array!96592 (_ BitVec 32) List!33152) Bool)

(assert (=> b!1413428 (= res!950417 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33149))))

(declare-fun b!1413429 () Bool)

(declare-fun e!799894 () Bool)

(assert (=> b!1413429 (= e!799897 (not e!799894))))

(declare-fun res!950422 () Bool)

(assert (=> b!1413429 (=> res!950422 e!799894)))

(declare-datatypes ((SeekEntryResult!10944 0))(
  ( (MissingZero!10944 (index!46156 (_ BitVec 32))) (Found!10944 (index!46157 (_ BitVec 32))) (Intermediate!10944 (undefined!11756 Bool) (index!46158 (_ BitVec 32)) (x!127735 (_ BitVec 32))) (Undefined!10944) (MissingVacant!10944 (index!46159 (_ BitVec 32))) )
))
(declare-fun lt!623030 () SeekEntryResult!10944)

(assert (=> b!1413429 (= res!950422 (or (not (is-Intermediate!10944 lt!623030)) (undefined!11756 lt!623030)))))

(declare-fun e!799893 () Bool)

(assert (=> b!1413429 e!799893))

(declare-fun res!950419 () Bool)

(assert (=> b!1413429 (=> (not res!950419) (not e!799893))))

(assert (=> b!1413429 (= res!950419 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47862 0))(
  ( (Unit!47863) )
))
(declare-fun lt!623026 () Unit!47862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47862)

(assert (=> b!1413429 (= lt!623026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623029 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96592 (_ BitVec 32)) SeekEntryResult!10944)

(assert (=> b!1413429 (= lt!623030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623029 (select (arr!46633 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413429 (= lt!623029 (toIndex!0 (select (arr!46633 a!2901) j!112) mask!2840))))

(declare-fun b!1413430 () Bool)

(declare-fun e!799896 () Bool)

(assert (=> b!1413430 (= e!799896 true)))

(declare-fun e!799895 () Bool)

(assert (=> b!1413430 e!799895))

(declare-fun res!950423 () Bool)

(assert (=> b!1413430 (=> (not res!950423) (not e!799895))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!623025 () SeekEntryResult!10944)

(assert (=> b!1413430 (= res!950423 (and (not (undefined!11756 lt!623025)) (= (index!46158 lt!623025) i!1037) (bvslt (x!127735 lt!623025) (x!127735 lt!623030)) (= (select (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46158 lt!623025)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623027 () Unit!47862)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47862)

(assert (=> b!1413430 (= lt!623027 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623029 (x!127735 lt!623030) (index!46158 lt!623030) (x!127735 lt!623025) (index!46158 lt!623025) (undefined!11756 lt!623025) mask!2840))))

(declare-fun res!950420 () Bool)

(assert (=> start!121654 (=> (not res!950420) (not e!799897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121654 (= res!950420 (validMask!0 mask!2840))))

(assert (=> start!121654 e!799897))

(assert (=> start!121654 true))

(declare-fun array_inv!35661 (array!96592) Bool)

(assert (=> start!121654 (array_inv!35661 a!2901)))

(declare-fun b!1413431 () Bool)

(assert (=> b!1413431 (= e!799894 e!799896)))

(declare-fun res!950425 () Bool)

(assert (=> b!1413431 (=> res!950425 e!799896)))

(assert (=> b!1413431 (= res!950425 (or (= lt!623030 lt!623025) (not (is-Intermediate!10944 lt!623025))))))

(declare-fun lt!623031 () (_ BitVec 64))

(declare-fun lt!623028 () array!96592)

(assert (=> b!1413431 (= lt!623025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623031 mask!2840) lt!623031 lt!623028 mask!2840))))

(assert (=> b!1413431 (= lt!623031 (select (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413431 (= lt!623028 (array!96593 (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47183 a!2901)))))

(declare-fun b!1413432 () Bool)

(declare-fun res!950416 () Bool)

(assert (=> b!1413432 (=> (not res!950416) (not e!799897))))

(assert (=> b!1413432 (= res!950416 (and (= (size!47183 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47183 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47183 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413433 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96592 (_ BitVec 32)) SeekEntryResult!10944)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96592 (_ BitVec 32)) SeekEntryResult!10944)

(assert (=> b!1413433 (= e!799895 (= (seekEntryOrOpen!0 lt!623031 lt!623028 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127735 lt!623025) (index!46158 lt!623025) (index!46158 lt!623025) (select (arr!46633 a!2901) j!112) lt!623028 mask!2840)))))

(declare-fun b!1413434 () Bool)

(assert (=> b!1413434 (= e!799893 (= (seekEntryOrOpen!0 (select (arr!46633 a!2901) j!112) a!2901 mask!2840) (Found!10944 j!112)))))

(declare-fun b!1413435 () Bool)

(declare-fun res!950424 () Bool)

(assert (=> b!1413435 (=> (not res!950424) (not e!799897))))

(assert (=> b!1413435 (= res!950424 (validKeyInArray!0 (select (arr!46633 a!2901) i!1037)))))

(assert (= (and start!121654 res!950420) b!1413432))

(assert (= (and b!1413432 res!950416) b!1413435))

(assert (= (and b!1413435 res!950424) b!1413426))

(assert (= (and b!1413426 res!950418) b!1413427))

(assert (= (and b!1413427 res!950421) b!1413428))

(assert (= (and b!1413428 res!950417) b!1413429))

(assert (= (and b!1413429 res!950419) b!1413434))

(assert (= (and b!1413429 (not res!950422)) b!1413431))

(assert (= (and b!1413431 (not res!950425)) b!1413430))

(assert (= (and b!1413430 res!950423) b!1413433))

(declare-fun m!1303845 () Bool)

(assert (=> b!1413427 m!1303845))

(declare-fun m!1303847 () Bool)

(assert (=> b!1413426 m!1303847))

(assert (=> b!1413426 m!1303847))

(declare-fun m!1303849 () Bool)

(assert (=> b!1413426 m!1303849))

(declare-fun m!1303851 () Bool)

(assert (=> b!1413435 m!1303851))

(assert (=> b!1413435 m!1303851))

(declare-fun m!1303853 () Bool)

(assert (=> b!1413435 m!1303853))

(assert (=> b!1413434 m!1303847))

(assert (=> b!1413434 m!1303847))

(declare-fun m!1303855 () Bool)

(assert (=> b!1413434 m!1303855))

(declare-fun m!1303857 () Bool)

(assert (=> start!121654 m!1303857))

(declare-fun m!1303859 () Bool)

(assert (=> start!121654 m!1303859))

(declare-fun m!1303861 () Bool)

(assert (=> b!1413430 m!1303861))

(declare-fun m!1303863 () Bool)

(assert (=> b!1413430 m!1303863))

(declare-fun m!1303865 () Bool)

(assert (=> b!1413430 m!1303865))

(declare-fun m!1303867 () Bool)

(assert (=> b!1413433 m!1303867))

(assert (=> b!1413433 m!1303847))

(assert (=> b!1413433 m!1303847))

(declare-fun m!1303869 () Bool)

(assert (=> b!1413433 m!1303869))

(assert (=> b!1413429 m!1303847))

(declare-fun m!1303871 () Bool)

(assert (=> b!1413429 m!1303871))

(assert (=> b!1413429 m!1303847))

(assert (=> b!1413429 m!1303847))

(declare-fun m!1303873 () Bool)

(assert (=> b!1413429 m!1303873))

(declare-fun m!1303875 () Bool)

(assert (=> b!1413429 m!1303875))

(declare-fun m!1303877 () Bool)

(assert (=> b!1413429 m!1303877))

(declare-fun m!1303879 () Bool)

(assert (=> b!1413428 m!1303879))

(declare-fun m!1303881 () Bool)

(assert (=> b!1413431 m!1303881))

(assert (=> b!1413431 m!1303881))

(declare-fun m!1303883 () Bool)

(assert (=> b!1413431 m!1303883))

(assert (=> b!1413431 m!1303861))

(declare-fun m!1303885 () Bool)

(assert (=> b!1413431 m!1303885))

(push 1)

