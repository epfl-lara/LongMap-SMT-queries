; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121210 () Bool)

(assert start!121210)

(declare-fun b!1409366 () Bool)

(declare-fun res!947089 () Bool)

(declare-fun e!797558 () Bool)

(assert (=> b!1409366 (=> (not res!947089) (not e!797558))))

(declare-datatypes ((array!96364 0))(
  ( (array!96365 (arr!46525 (Array (_ BitVec 32) (_ BitVec 64))) (size!47075 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96364)

(declare-datatypes ((List!33044 0))(
  ( (Nil!33041) (Cons!33040 (h!34303 (_ BitVec 64)) (t!47738 List!33044)) )
))
(declare-fun arrayNoDuplicates!0 (array!96364 (_ BitVec 32) List!33044) Bool)

(assert (=> b!1409366 (= res!947089 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33041))))

(declare-fun b!1409367 () Bool)

(declare-fun res!947094 () Bool)

(assert (=> b!1409367 (=> (not res!947094) (not e!797558))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409367 (= res!947094 (validKeyInArray!0 (select (arr!46525 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1409368 () Bool)

(declare-fun e!797561 () Bool)

(declare-datatypes ((SeekEntryResult!10836 0))(
  ( (MissingZero!10836 (index!45721 (_ BitVec 32))) (Found!10836 (index!45722 (_ BitVec 32))) (Intermediate!10836 (undefined!11648 Bool) (index!45723 (_ BitVec 32)) (x!127309 (_ BitVec 32))) (Undefined!10836) (MissingVacant!10836 (index!45724 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96364 (_ BitVec 32)) SeekEntryResult!10836)

(assert (=> b!1409368 (= e!797561 (= (seekEntryOrOpen!0 (select (arr!46525 a!2901) j!112) a!2901 mask!2840) (Found!10836 j!112)))))

(declare-fun b!1409369 () Bool)

(declare-fun e!797559 () Bool)

(assert (=> b!1409369 (= e!797558 (not e!797559))))

(declare-fun res!947092 () Bool)

(assert (=> b!1409369 (=> res!947092 e!797559)))

(declare-fun lt!620696 () SeekEntryResult!10836)

(assert (=> b!1409369 (= res!947092 (or (not (is-Intermediate!10836 lt!620696)) (undefined!11648 lt!620696)))))

(assert (=> b!1409369 e!797561))

(declare-fun res!947088 () Bool)

(assert (=> b!1409369 (=> (not res!947088) (not e!797561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96364 (_ BitVec 32)) Bool)

(assert (=> b!1409369 (= res!947088 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47646 0))(
  ( (Unit!47647) )
))
(declare-fun lt!620697 () Unit!47646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47646)

(assert (=> b!1409369 (= lt!620697 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96364 (_ BitVec 32)) SeekEntryResult!10836)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409369 (= lt!620696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46525 a!2901) j!112) mask!2840) (select (arr!46525 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409371 () Bool)

(assert (=> b!1409371 (= e!797559 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620695 () SeekEntryResult!10836)

(assert (=> b!1409371 (= lt!620695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96365 (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47075 a!2901)) mask!2840))))

(declare-fun b!1409372 () Bool)

(declare-fun res!947093 () Bool)

(assert (=> b!1409372 (=> (not res!947093) (not e!797558))))

(assert (=> b!1409372 (= res!947093 (and (= (size!47075 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47075 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47075 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409373 () Bool)

(declare-fun res!947090 () Bool)

(assert (=> b!1409373 (=> (not res!947090) (not e!797558))))

(assert (=> b!1409373 (= res!947090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947095 () Bool)

(assert (=> start!121210 (=> (not res!947095) (not e!797558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121210 (= res!947095 (validMask!0 mask!2840))))

(assert (=> start!121210 e!797558))

(assert (=> start!121210 true))

(declare-fun array_inv!35553 (array!96364) Bool)

(assert (=> start!121210 (array_inv!35553 a!2901)))

(declare-fun b!1409370 () Bool)

(declare-fun res!947091 () Bool)

(assert (=> b!1409370 (=> (not res!947091) (not e!797558))))

(assert (=> b!1409370 (= res!947091 (validKeyInArray!0 (select (arr!46525 a!2901) i!1037)))))

(assert (= (and start!121210 res!947095) b!1409372))

(assert (= (and b!1409372 res!947093) b!1409370))

(assert (= (and b!1409370 res!947091) b!1409367))

(assert (= (and b!1409367 res!947094) b!1409373))

(assert (= (and b!1409373 res!947090) b!1409366))

(assert (= (and b!1409366 res!947089) b!1409369))

(assert (= (and b!1409369 res!947088) b!1409368))

(assert (= (and b!1409369 (not res!947092)) b!1409371))

(declare-fun m!1299053 () Bool)

(assert (=> start!121210 m!1299053))

(declare-fun m!1299055 () Bool)

(assert (=> start!121210 m!1299055))

(declare-fun m!1299057 () Bool)

(assert (=> b!1409371 m!1299057))

(declare-fun m!1299059 () Bool)

(assert (=> b!1409371 m!1299059))

(assert (=> b!1409371 m!1299059))

(declare-fun m!1299061 () Bool)

(assert (=> b!1409371 m!1299061))

(assert (=> b!1409371 m!1299061))

(assert (=> b!1409371 m!1299059))

(declare-fun m!1299063 () Bool)

(assert (=> b!1409371 m!1299063))

(declare-fun m!1299065 () Bool)

(assert (=> b!1409368 m!1299065))

(assert (=> b!1409368 m!1299065))

(declare-fun m!1299067 () Bool)

(assert (=> b!1409368 m!1299067))

(assert (=> b!1409367 m!1299065))

(assert (=> b!1409367 m!1299065))

(declare-fun m!1299069 () Bool)

(assert (=> b!1409367 m!1299069))

(declare-fun m!1299071 () Bool)

(assert (=> b!1409373 m!1299071))

(assert (=> b!1409369 m!1299065))

(declare-fun m!1299073 () Bool)

(assert (=> b!1409369 m!1299073))

(assert (=> b!1409369 m!1299065))

(declare-fun m!1299075 () Bool)

(assert (=> b!1409369 m!1299075))

(assert (=> b!1409369 m!1299073))

(assert (=> b!1409369 m!1299065))

(declare-fun m!1299077 () Bool)

(assert (=> b!1409369 m!1299077))

(declare-fun m!1299079 () Bool)

(assert (=> b!1409369 m!1299079))

(declare-fun m!1299081 () Bool)

(assert (=> b!1409366 m!1299081))

(declare-fun m!1299083 () Bool)

(assert (=> b!1409370 m!1299083))

(assert (=> b!1409370 m!1299083))

(declare-fun m!1299085 () Bool)

(assert (=> b!1409370 m!1299085))

(push 1)

(assert (not b!1409367))

(assert (not b!1409370))

(assert (not b!1409373))

(assert (not b!1409368))

(assert (not b!1409366))

(assert (not b!1409369))

(assert (not b!1409371))

(assert (not start!121210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

