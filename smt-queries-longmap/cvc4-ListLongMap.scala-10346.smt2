; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121630 () Bool)

(assert start!121630)

(declare-fun b!1413066 () Bool)

(declare-fun res!950059 () Bool)

(declare-fun e!799680 () Bool)

(assert (=> b!1413066 (=> (not res!950059) (not e!799680))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96568 0))(
  ( (array!96569 (arr!46621 (Array (_ BitVec 32) (_ BitVec 64))) (size!47171 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96568)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413066 (= res!950059 (and (= (size!47171 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47171 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47171 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413067 () Bool)

(declare-fun res!950056 () Bool)

(assert (=> b!1413067 (=> (not res!950056) (not e!799680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96568 (_ BitVec 32)) Bool)

(assert (=> b!1413067 (= res!950056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413068 () Bool)

(declare-fun lt!622777 () (_ BitVec 64))

(declare-fun lt!622774 () array!96568)

(declare-fun e!799678 () Bool)

(declare-datatypes ((SeekEntryResult!10932 0))(
  ( (MissingZero!10932 (index!46108 (_ BitVec 32))) (Found!10932 (index!46109 (_ BitVec 32))) (Intermediate!10932 (undefined!11744 Bool) (index!46110 (_ BitVec 32)) (x!127691 (_ BitVec 32))) (Undefined!10932) (MissingVacant!10932 (index!46111 (_ BitVec 32))) )
))
(declare-fun lt!622773 () SeekEntryResult!10932)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96568 (_ BitVec 32)) SeekEntryResult!10932)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96568 (_ BitVec 32)) SeekEntryResult!10932)

(assert (=> b!1413068 (= e!799678 (= (seekEntryOrOpen!0 lt!622777 lt!622774 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127691 lt!622773) (index!46110 lt!622773) (index!46110 lt!622773) (select (arr!46621 a!2901) j!112) lt!622774 mask!2840)))))

(declare-fun res!950060 () Bool)

(assert (=> start!121630 (=> (not res!950060) (not e!799680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121630 (= res!950060 (validMask!0 mask!2840))))

(assert (=> start!121630 e!799680))

(assert (=> start!121630 true))

(declare-fun array_inv!35649 (array!96568) Bool)

(assert (=> start!121630 (array_inv!35649 a!2901)))

(declare-fun b!1413069 () Bool)

(declare-fun e!799677 () Bool)

(assert (=> b!1413069 (= e!799677 true)))

(assert (=> b!1413069 e!799678))

(declare-fun res!950057 () Bool)

(assert (=> b!1413069 (=> (not res!950057) (not e!799678))))

(declare-fun lt!622776 () SeekEntryResult!10932)

(assert (=> b!1413069 (= res!950057 (and (not (undefined!11744 lt!622773)) (= (index!46110 lt!622773) i!1037) (bvslt (x!127691 lt!622773) (x!127691 lt!622776)) (= (select (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46110 lt!622773)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47838 0))(
  ( (Unit!47839) )
))
(declare-fun lt!622778 () Unit!47838)

(declare-fun lt!622779 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47838)

(assert (=> b!1413069 (= lt!622778 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622779 (x!127691 lt!622776) (index!46110 lt!622776) (x!127691 lt!622773) (index!46110 lt!622773) (undefined!11744 lt!622773) mask!2840))))

(declare-fun b!1413070 () Bool)

(declare-fun res!950058 () Bool)

(assert (=> b!1413070 (=> (not res!950058) (not e!799680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413070 (= res!950058 (validKeyInArray!0 (select (arr!46621 a!2901) j!112)))))

(declare-fun b!1413071 () Bool)

(declare-fun res!950065 () Bool)

(assert (=> b!1413071 (=> (not res!950065) (not e!799680))))

(declare-datatypes ((List!33140 0))(
  ( (Nil!33137) (Cons!33136 (h!34411 (_ BitVec 64)) (t!47834 List!33140)) )
))
(declare-fun arrayNoDuplicates!0 (array!96568 (_ BitVec 32) List!33140) Bool)

(assert (=> b!1413071 (= res!950065 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33137))))

(declare-fun b!1413072 () Bool)

(declare-fun e!799679 () Bool)

(assert (=> b!1413072 (= e!799679 (= (seekEntryOrOpen!0 (select (arr!46621 a!2901) j!112) a!2901 mask!2840) (Found!10932 j!112)))))

(declare-fun b!1413073 () Bool)

(declare-fun e!799681 () Bool)

(assert (=> b!1413073 (= e!799680 (not e!799681))))

(declare-fun res!950063 () Bool)

(assert (=> b!1413073 (=> res!950063 e!799681)))

(assert (=> b!1413073 (= res!950063 (or (not (is-Intermediate!10932 lt!622776)) (undefined!11744 lt!622776)))))

(assert (=> b!1413073 e!799679))

(declare-fun res!950061 () Bool)

(assert (=> b!1413073 (=> (not res!950061) (not e!799679))))

(assert (=> b!1413073 (= res!950061 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622775 () Unit!47838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47838)

(assert (=> b!1413073 (= lt!622775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96568 (_ BitVec 32)) SeekEntryResult!10932)

(assert (=> b!1413073 (= lt!622776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622779 (select (arr!46621 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413073 (= lt!622779 (toIndex!0 (select (arr!46621 a!2901) j!112) mask!2840))))

(declare-fun b!1413074 () Bool)

(declare-fun res!950062 () Bool)

(assert (=> b!1413074 (=> (not res!950062) (not e!799680))))

(assert (=> b!1413074 (= res!950062 (validKeyInArray!0 (select (arr!46621 a!2901) i!1037)))))

(declare-fun b!1413075 () Bool)

(assert (=> b!1413075 (= e!799681 e!799677)))

(declare-fun res!950064 () Bool)

(assert (=> b!1413075 (=> res!950064 e!799677)))

(assert (=> b!1413075 (= res!950064 (or (= lt!622776 lt!622773) (not (is-Intermediate!10932 lt!622773))))))

(assert (=> b!1413075 (= lt!622773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622777 mask!2840) lt!622777 lt!622774 mask!2840))))

(assert (=> b!1413075 (= lt!622777 (select (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413075 (= lt!622774 (array!96569 (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47171 a!2901)))))

(assert (= (and start!121630 res!950060) b!1413066))

(assert (= (and b!1413066 res!950059) b!1413074))

(assert (= (and b!1413074 res!950062) b!1413070))

(assert (= (and b!1413070 res!950058) b!1413067))

(assert (= (and b!1413067 res!950056) b!1413071))

(assert (= (and b!1413071 res!950065) b!1413073))

(assert (= (and b!1413073 res!950061) b!1413072))

(assert (= (and b!1413073 (not res!950063)) b!1413075))

(assert (= (and b!1413075 (not res!950064)) b!1413069))

(assert (= (and b!1413069 res!950057) b!1413068))

(declare-fun m!1303341 () Bool)

(assert (=> b!1413069 m!1303341))

(declare-fun m!1303343 () Bool)

(assert (=> b!1413069 m!1303343))

(declare-fun m!1303345 () Bool)

(assert (=> b!1413069 m!1303345))

(declare-fun m!1303347 () Bool)

(assert (=> b!1413068 m!1303347))

(declare-fun m!1303349 () Bool)

(assert (=> b!1413068 m!1303349))

(assert (=> b!1413068 m!1303349))

(declare-fun m!1303351 () Bool)

(assert (=> b!1413068 m!1303351))

(declare-fun m!1303353 () Bool)

(assert (=> b!1413074 m!1303353))

(assert (=> b!1413074 m!1303353))

(declare-fun m!1303355 () Bool)

(assert (=> b!1413074 m!1303355))

(assert (=> b!1413070 m!1303349))

(assert (=> b!1413070 m!1303349))

(declare-fun m!1303357 () Bool)

(assert (=> b!1413070 m!1303357))

(assert (=> b!1413073 m!1303349))

(declare-fun m!1303359 () Bool)

(assert (=> b!1413073 m!1303359))

(assert (=> b!1413073 m!1303349))

(assert (=> b!1413073 m!1303349))

(declare-fun m!1303361 () Bool)

(assert (=> b!1413073 m!1303361))

(declare-fun m!1303363 () Bool)

(assert (=> b!1413073 m!1303363))

(declare-fun m!1303365 () Bool)

(assert (=> b!1413073 m!1303365))

(declare-fun m!1303367 () Bool)

(assert (=> b!1413067 m!1303367))

(declare-fun m!1303369 () Bool)

(assert (=> start!121630 m!1303369))

(declare-fun m!1303371 () Bool)

(assert (=> start!121630 m!1303371))

(declare-fun m!1303373 () Bool)

(assert (=> b!1413071 m!1303373))

(declare-fun m!1303375 () Bool)

(assert (=> b!1413075 m!1303375))

(assert (=> b!1413075 m!1303375))

(declare-fun m!1303377 () Bool)

(assert (=> b!1413075 m!1303377))

(assert (=> b!1413075 m!1303341))

(declare-fun m!1303379 () Bool)

(assert (=> b!1413075 m!1303379))

(assert (=> b!1413072 m!1303349))

(assert (=> b!1413072 m!1303349))

(declare-fun m!1303381 () Bool)

(assert (=> b!1413072 m!1303381))

(push 1)

