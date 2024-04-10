; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121648 () Bool)

(assert start!121648)

(declare-fun b!1413336 () Bool)

(declare-fun e!799839 () Bool)

(assert (=> b!1413336 (= e!799839 true)))

(declare-fun e!799841 () Bool)

(assert (=> b!1413336 e!799841))

(declare-fun res!950332 () Bool)

(assert (=> b!1413336 (=> (not res!950332) (not e!799841))))

(declare-datatypes ((array!96586 0))(
  ( (array!96587 (arr!46630 (Array (_ BitVec 32) (_ BitVec 64))) (size!47180 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96586)

(declare-datatypes ((SeekEntryResult!10941 0))(
  ( (MissingZero!10941 (index!46144 (_ BitVec 32))) (Found!10941 (index!46145 (_ BitVec 32))) (Intermediate!10941 (undefined!11753 Bool) (index!46146 (_ BitVec 32)) (x!127724 (_ BitVec 32))) (Undefined!10941) (MissingVacant!10941 (index!46147 (_ BitVec 32))) )
))
(declare-fun lt!622963 () SeekEntryResult!10941)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!622965 () SeekEntryResult!10941)

(assert (=> b!1413336 (= res!950332 (and (not (undefined!11753 lt!622963)) (= (index!46146 lt!622963) i!1037) (bvslt (x!127724 lt!622963) (x!127724 lt!622965)) (= (select (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46146 lt!622963)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622962 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47856 0))(
  ( (Unit!47857) )
))
(declare-fun lt!622964 () Unit!47856)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47856)

(assert (=> b!1413336 (= lt!622964 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622962 (x!127724 lt!622965) (index!46146 lt!622965) (x!127724 lt!622963) (index!46146 lt!622963) (undefined!11753 lt!622963) mask!2840))))

(declare-fun res!950330 () Bool)

(declare-fun e!799840 () Bool)

(assert (=> start!121648 (=> (not res!950330) (not e!799840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121648 (= res!950330 (validMask!0 mask!2840))))

(assert (=> start!121648 e!799840))

(assert (=> start!121648 true))

(declare-fun array_inv!35658 (array!96586) Bool)

(assert (=> start!121648 (array_inv!35658 a!2901)))

(declare-fun lt!622966 () (_ BitVec 64))

(declare-fun lt!622968 () array!96586)

(declare-fun b!1413337 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96586 (_ BitVec 32)) SeekEntryResult!10941)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96586 (_ BitVec 32)) SeekEntryResult!10941)

(assert (=> b!1413337 (= e!799841 (= (seekEntryOrOpen!0 lt!622966 lt!622968 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127724 lt!622963) (index!46146 lt!622963) (index!46146 lt!622963) (select (arr!46630 a!2901) j!112) lt!622968 mask!2840)))))

(declare-fun b!1413338 () Bool)

(declare-fun e!799843 () Bool)

(assert (=> b!1413338 (= e!799840 (not e!799843))))

(declare-fun res!950334 () Bool)

(assert (=> b!1413338 (=> res!950334 e!799843)))

(assert (=> b!1413338 (= res!950334 (or (not (is-Intermediate!10941 lt!622965)) (undefined!11753 lt!622965)))))

(declare-fun e!799844 () Bool)

(assert (=> b!1413338 e!799844))

(declare-fun res!950331 () Bool)

(assert (=> b!1413338 (=> (not res!950331) (not e!799844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96586 (_ BitVec 32)) Bool)

(assert (=> b!1413338 (= res!950331 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622967 () Unit!47856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47856)

(assert (=> b!1413338 (= lt!622967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96586 (_ BitVec 32)) SeekEntryResult!10941)

(assert (=> b!1413338 (= lt!622965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622962 (select (arr!46630 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413338 (= lt!622962 (toIndex!0 (select (arr!46630 a!2901) j!112) mask!2840))))

(declare-fun b!1413339 () Bool)

(declare-fun res!950333 () Bool)

(assert (=> b!1413339 (=> (not res!950333) (not e!799840))))

(assert (=> b!1413339 (= res!950333 (and (= (size!47180 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47180 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47180 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413340 () Bool)

(assert (=> b!1413340 (= e!799844 (= (seekEntryOrOpen!0 (select (arr!46630 a!2901) j!112) a!2901 mask!2840) (Found!10941 j!112)))))

(declare-fun b!1413341 () Bool)

(declare-fun res!950326 () Bool)

(assert (=> b!1413341 (=> (not res!950326) (not e!799840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413341 (= res!950326 (validKeyInArray!0 (select (arr!46630 a!2901) i!1037)))))

(declare-fun b!1413342 () Bool)

(declare-fun res!950328 () Bool)

(assert (=> b!1413342 (=> (not res!950328) (not e!799840))))

(declare-datatypes ((List!33149 0))(
  ( (Nil!33146) (Cons!33145 (h!34420 (_ BitVec 64)) (t!47843 List!33149)) )
))
(declare-fun arrayNoDuplicates!0 (array!96586 (_ BitVec 32) List!33149) Bool)

(assert (=> b!1413342 (= res!950328 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33146))))

(declare-fun b!1413343 () Bool)

(declare-fun res!950327 () Bool)

(assert (=> b!1413343 (=> (not res!950327) (not e!799840))))

(assert (=> b!1413343 (= res!950327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413344 () Bool)

(assert (=> b!1413344 (= e!799843 e!799839)))

(declare-fun res!950335 () Bool)

(assert (=> b!1413344 (=> res!950335 e!799839)))

(assert (=> b!1413344 (= res!950335 (or (= lt!622965 lt!622963) (not (is-Intermediate!10941 lt!622963))))))

(assert (=> b!1413344 (= lt!622963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622966 mask!2840) lt!622966 lt!622968 mask!2840))))

(assert (=> b!1413344 (= lt!622966 (select (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413344 (= lt!622968 (array!96587 (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47180 a!2901)))))

(declare-fun b!1413345 () Bool)

(declare-fun res!950329 () Bool)

(assert (=> b!1413345 (=> (not res!950329) (not e!799840))))

(assert (=> b!1413345 (= res!950329 (validKeyInArray!0 (select (arr!46630 a!2901) j!112)))))

(assert (= (and start!121648 res!950330) b!1413339))

(assert (= (and b!1413339 res!950333) b!1413341))

(assert (= (and b!1413341 res!950326) b!1413345))

(assert (= (and b!1413345 res!950329) b!1413343))

(assert (= (and b!1413343 res!950327) b!1413342))

(assert (= (and b!1413342 res!950328) b!1413338))

(assert (= (and b!1413338 res!950331) b!1413340))

(assert (= (and b!1413338 (not res!950334)) b!1413344))

(assert (= (and b!1413344 (not res!950335)) b!1413336))

(assert (= (and b!1413336 res!950332) b!1413337))

(declare-fun m!1303719 () Bool)

(assert (=> b!1413345 m!1303719))

(assert (=> b!1413345 m!1303719))

(declare-fun m!1303721 () Bool)

(assert (=> b!1413345 m!1303721))

(declare-fun m!1303723 () Bool)

(assert (=> b!1413337 m!1303723))

(assert (=> b!1413337 m!1303719))

(assert (=> b!1413337 m!1303719))

(declare-fun m!1303725 () Bool)

(assert (=> b!1413337 m!1303725))

(assert (=> b!1413338 m!1303719))

(declare-fun m!1303727 () Bool)

(assert (=> b!1413338 m!1303727))

(declare-fun m!1303729 () Bool)

(assert (=> b!1413338 m!1303729))

(assert (=> b!1413338 m!1303719))

(declare-fun m!1303731 () Bool)

(assert (=> b!1413338 m!1303731))

(assert (=> b!1413338 m!1303719))

(declare-fun m!1303733 () Bool)

(assert (=> b!1413338 m!1303733))

(declare-fun m!1303735 () Bool)

(assert (=> b!1413343 m!1303735))

(assert (=> b!1413340 m!1303719))

(assert (=> b!1413340 m!1303719))

(declare-fun m!1303737 () Bool)

(assert (=> b!1413340 m!1303737))

(declare-fun m!1303739 () Bool)

(assert (=> b!1413344 m!1303739))

(assert (=> b!1413344 m!1303739))

(declare-fun m!1303741 () Bool)

(assert (=> b!1413344 m!1303741))

(declare-fun m!1303743 () Bool)

(assert (=> b!1413344 m!1303743))

(declare-fun m!1303745 () Bool)

(assert (=> b!1413344 m!1303745))

(assert (=> b!1413336 m!1303743))

(declare-fun m!1303747 () Bool)

(assert (=> b!1413336 m!1303747))

(declare-fun m!1303749 () Bool)

(assert (=> b!1413336 m!1303749))

(declare-fun m!1303751 () Bool)

(assert (=> start!121648 m!1303751))

(declare-fun m!1303753 () Bool)

(assert (=> start!121648 m!1303753))

(declare-fun m!1303755 () Bool)

(assert (=> b!1413341 m!1303755))

(assert (=> b!1413341 m!1303755))

(declare-fun m!1303757 () Bool)

(assert (=> b!1413341 m!1303757))

(declare-fun m!1303759 () Bool)

(assert (=> b!1413342 m!1303759))

(push 1)

