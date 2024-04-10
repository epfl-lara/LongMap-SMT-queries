; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121960 () Bool)

(assert start!121960)

(declare-fun b!1415365 () Bool)

(declare-fun e!801052 () Bool)

(assert (=> b!1415365 (= e!801052 true)))

(declare-fun e!801056 () Bool)

(assert (=> b!1415365 e!801056))

(declare-fun res!951408 () Bool)

(assert (=> b!1415365 (=> (not res!951408) (not e!801056))))

(declare-datatypes ((SeekEntryResult!10965 0))(
  ( (MissingZero!10965 (index!46252 (_ BitVec 32))) (Found!10965 (index!46253 (_ BitVec 32))) (Intermediate!10965 (undefined!11777 Bool) (index!46254 (_ BitVec 32)) (x!127860 (_ BitVec 32))) (Undefined!10965) (MissingVacant!10965 (index!46255 (_ BitVec 32))) )
))
(declare-fun lt!624090 () SeekEntryResult!10965)

(declare-fun lt!624094 () SeekEntryResult!10965)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((array!96646 0))(
  ( (array!96647 (arr!46654 (Array (_ BitVec 32) (_ BitVec 64))) (size!47204 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96646)

(assert (=> b!1415365 (= res!951408 (and (not (undefined!11777 lt!624094)) (= (index!46254 lt!624094) i!1037) (bvslt (x!127860 lt!624094) (x!127860 lt!624090)) (= (select (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46254 lt!624094)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47904 0))(
  ( (Unit!47905) )
))
(declare-fun lt!624092 () Unit!47904)

(declare-fun lt!624095 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47904)

(assert (=> b!1415365 (= lt!624092 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624095 (x!127860 lt!624090) (index!46254 lt!624090) (x!127860 lt!624094) (index!46254 lt!624094) (undefined!11777 lt!624094) mask!2840))))

(declare-fun b!1415366 () Bool)

(declare-fun e!801054 () Bool)

(declare-fun e!801055 () Bool)

(assert (=> b!1415366 (= e!801054 (not e!801055))))

(declare-fun res!951407 () Bool)

(assert (=> b!1415366 (=> res!951407 e!801055)))

(assert (=> b!1415366 (= res!951407 (or (not (is-Intermediate!10965 lt!624090)) (undefined!11777 lt!624090)))))

(declare-fun e!801051 () Bool)

(assert (=> b!1415366 e!801051))

(declare-fun res!951412 () Bool)

(assert (=> b!1415366 (=> (not res!951412) (not e!801051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96646 (_ BitVec 32)) Bool)

(assert (=> b!1415366 (= res!951412 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624093 () Unit!47904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47904)

(assert (=> b!1415366 (= lt!624093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96646 (_ BitVec 32)) SeekEntryResult!10965)

(assert (=> b!1415366 (= lt!624090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624095 (select (arr!46654 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415366 (= lt!624095 (toIndex!0 (select (arr!46654 a!2901) j!112) mask!2840))))

(declare-fun b!1415367 () Bool)

(assert (=> b!1415367 (= e!801055 e!801052)))

(declare-fun res!951406 () Bool)

(assert (=> b!1415367 (=> res!951406 e!801052)))

(assert (=> b!1415367 (= res!951406 (or (= lt!624090 lt!624094) (not (is-Intermediate!10965 lt!624094))))))

(declare-fun lt!624096 () (_ BitVec 64))

(declare-fun lt!624091 () array!96646)

(assert (=> b!1415367 (= lt!624094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624096 mask!2840) lt!624096 lt!624091 mask!2840))))

(assert (=> b!1415367 (= lt!624096 (select (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415367 (= lt!624091 (array!96647 (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47204 a!2901)))))

(declare-fun b!1415368 () Bool)

(declare-fun res!951414 () Bool)

(assert (=> b!1415368 (=> (not res!951414) (not e!801054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415368 (= res!951414 (validKeyInArray!0 (select (arr!46654 a!2901) i!1037)))))

(declare-fun b!1415369 () Bool)

(declare-fun res!951409 () Bool)

(assert (=> b!1415369 (=> (not res!951409) (not e!801054))))

(assert (=> b!1415369 (= res!951409 (and (= (size!47204 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47204 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47204 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415370 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96646 (_ BitVec 32)) SeekEntryResult!10965)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96646 (_ BitVec 32)) SeekEntryResult!10965)

(assert (=> b!1415370 (= e!801056 (= (seekEntryOrOpen!0 lt!624096 lt!624091 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127860 lt!624094) (index!46254 lt!624094) (index!46254 lt!624094) (select (arr!46654 a!2901) j!112) lt!624091 mask!2840)))))

(declare-fun b!1415371 () Bool)

(declare-fun res!951410 () Bool)

(assert (=> b!1415371 (=> (not res!951410) (not e!801054))))

(assert (=> b!1415371 (= res!951410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!951411 () Bool)

(assert (=> start!121960 (=> (not res!951411) (not e!801054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121960 (= res!951411 (validMask!0 mask!2840))))

(assert (=> start!121960 e!801054))

(assert (=> start!121960 true))

(declare-fun array_inv!35682 (array!96646) Bool)

(assert (=> start!121960 (array_inv!35682 a!2901)))

(declare-fun b!1415364 () Bool)

(declare-fun res!951415 () Bool)

(assert (=> b!1415364 (=> (not res!951415) (not e!801054))))

(declare-datatypes ((List!33173 0))(
  ( (Nil!33170) (Cons!33169 (h!34456 (_ BitVec 64)) (t!47867 List!33173)) )
))
(declare-fun arrayNoDuplicates!0 (array!96646 (_ BitVec 32) List!33173) Bool)

(assert (=> b!1415364 (= res!951415 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33170))))

(declare-fun b!1415372 () Bool)

(assert (=> b!1415372 (= e!801051 (= (seekEntryOrOpen!0 (select (arr!46654 a!2901) j!112) a!2901 mask!2840) (Found!10965 j!112)))))

(declare-fun b!1415373 () Bool)

(declare-fun res!951413 () Bool)

(assert (=> b!1415373 (=> (not res!951413) (not e!801054))))

(assert (=> b!1415373 (= res!951413 (validKeyInArray!0 (select (arr!46654 a!2901) j!112)))))

(assert (= (and start!121960 res!951411) b!1415369))

(assert (= (and b!1415369 res!951409) b!1415368))

(assert (= (and b!1415368 res!951414) b!1415373))

(assert (= (and b!1415373 res!951413) b!1415371))

(assert (= (and b!1415371 res!951410) b!1415364))

(assert (= (and b!1415364 res!951415) b!1415366))

(assert (= (and b!1415366 res!951412) b!1415372))

(assert (= (and b!1415366 (not res!951407)) b!1415367))

(assert (= (and b!1415367 (not res!951406)) b!1415365))

(assert (= (and b!1415365 res!951408) b!1415370))

(declare-fun m!1305615 () Bool)

(assert (=> b!1415366 m!1305615))

(declare-fun m!1305617 () Bool)

(assert (=> b!1415366 m!1305617))

(assert (=> b!1415366 m!1305615))

(assert (=> b!1415366 m!1305615))

(declare-fun m!1305619 () Bool)

(assert (=> b!1415366 m!1305619))

(declare-fun m!1305621 () Bool)

(assert (=> b!1415366 m!1305621))

(declare-fun m!1305623 () Bool)

(assert (=> b!1415366 m!1305623))

(declare-fun m!1305625 () Bool)

(assert (=> b!1415365 m!1305625))

(declare-fun m!1305627 () Bool)

(assert (=> b!1415365 m!1305627))

(declare-fun m!1305629 () Bool)

(assert (=> b!1415365 m!1305629))

(declare-fun m!1305631 () Bool)

(assert (=> b!1415364 m!1305631))

(declare-fun m!1305633 () Bool)

(assert (=> b!1415368 m!1305633))

(assert (=> b!1415368 m!1305633))

(declare-fun m!1305635 () Bool)

(assert (=> b!1415368 m!1305635))

(declare-fun m!1305637 () Bool)

(assert (=> b!1415370 m!1305637))

(assert (=> b!1415370 m!1305615))

(assert (=> b!1415370 m!1305615))

(declare-fun m!1305639 () Bool)

(assert (=> b!1415370 m!1305639))

(assert (=> b!1415372 m!1305615))

(assert (=> b!1415372 m!1305615))

(declare-fun m!1305641 () Bool)

(assert (=> b!1415372 m!1305641))

(declare-fun m!1305643 () Bool)

(assert (=> b!1415371 m!1305643))

(assert (=> b!1415373 m!1305615))

(assert (=> b!1415373 m!1305615))

(declare-fun m!1305645 () Bool)

(assert (=> b!1415373 m!1305645))

(declare-fun m!1305647 () Bool)

(assert (=> b!1415367 m!1305647))

(assert (=> b!1415367 m!1305647))

(declare-fun m!1305649 () Bool)

(assert (=> b!1415367 m!1305649))

(assert (=> b!1415367 m!1305625))

(declare-fun m!1305651 () Bool)

(assert (=> b!1415367 m!1305651))

(declare-fun m!1305653 () Bool)

(assert (=> start!121960 m!1305653))

(declare-fun m!1305655 () Bool)

(assert (=> start!121960 m!1305655))

(push 1)

