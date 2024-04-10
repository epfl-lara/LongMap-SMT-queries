; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121998 () Bool)

(assert start!121998)

(declare-fun b!1415961 () Bool)

(declare-fun res!952004 () Bool)

(declare-fun e!801421 () Bool)

(assert (=> b!1415961 (=> res!952004 e!801421)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624521 () (_ BitVec 64))

(declare-datatypes ((array!96684 0))(
  ( (array!96685 (arr!46673 (Array (_ BitVec 32) (_ BitVec 64))) (size!47223 (_ BitVec 32))) )
))
(declare-fun lt!624520 () array!96684)

(declare-fun lt!624514 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10984 0))(
  ( (MissingZero!10984 (index!46328 (_ BitVec 32))) (Found!10984 (index!46329 (_ BitVec 32))) (Intermediate!10984 (undefined!11796 Bool) (index!46330 (_ BitVec 32)) (x!127935 (_ BitVec 32))) (Undefined!10984) (MissingVacant!10984 (index!46331 (_ BitVec 32))) )
))
(declare-fun lt!624517 () SeekEntryResult!10984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96684 (_ BitVec 32)) SeekEntryResult!10984)

(assert (=> b!1415961 (= res!952004 (not (= lt!624517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624514 lt!624521 lt!624520 mask!2840))))))

(declare-fun b!1415962 () Bool)

(declare-fun res!952006 () Bool)

(declare-fun e!801419 () Bool)

(assert (=> b!1415962 (=> (not res!952006) (not e!801419))))

(declare-fun a!2901 () array!96684)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415962 (= res!952006 (and (= (size!47223 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47223 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47223 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952009 () Bool)

(assert (=> start!121998 (=> (not res!952009) (not e!801419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121998 (= res!952009 (validMask!0 mask!2840))))

(assert (=> start!121998 e!801419))

(assert (=> start!121998 true))

(declare-fun array_inv!35701 (array!96684) Bool)

(assert (=> start!121998 (array_inv!35701 a!2901)))

(declare-fun b!1415963 () Bool)

(declare-fun res!952008 () Bool)

(assert (=> b!1415963 (=> (not res!952008) (not e!801419))))

(declare-datatypes ((List!33192 0))(
  ( (Nil!33189) (Cons!33188 (h!34475 (_ BitVec 64)) (t!47886 List!33192)) )
))
(declare-fun arrayNoDuplicates!0 (array!96684 (_ BitVec 32) List!33192) Bool)

(assert (=> b!1415963 (= res!952008 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33189))))

(declare-fun b!1415964 () Bool)

(declare-fun e!801422 () Bool)

(assert (=> b!1415964 (= e!801422 e!801421)))

(declare-fun res!952010 () Bool)

(assert (=> b!1415964 (=> res!952010 e!801421)))

(declare-fun lt!624518 () SeekEntryResult!10984)

(assert (=> b!1415964 (= res!952010 (or (bvslt (x!127935 lt!624518) #b00000000000000000000000000000000) (bvsgt (x!127935 lt!624518) #b01111111111111111111111111111110) (bvslt (x!127935 lt!624517) #b00000000000000000000000000000000) (bvsgt (x!127935 lt!624517) #b01111111111111111111111111111110) (bvslt lt!624514 #b00000000000000000000000000000000) (bvsge lt!624514 (size!47223 a!2901)) (bvslt (index!46330 lt!624518) #b00000000000000000000000000000000) (bvsge (index!46330 lt!624518) (size!47223 a!2901)) (bvslt (index!46330 lt!624517) #b00000000000000000000000000000000) (bvsge (index!46330 lt!624517) (size!47223 a!2901)) (not (= lt!624518 (Intermediate!10984 false (index!46330 lt!624518) (x!127935 lt!624518)))) (not (= lt!624517 (Intermediate!10984 false (index!46330 lt!624517) (x!127935 lt!624517))))))))

(declare-fun lt!624522 () SeekEntryResult!10984)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96684 (_ BitVec 32)) SeekEntryResult!10984)

(assert (=> b!1415964 (= lt!624522 (seekKeyOrZeroReturnVacant!0 (x!127935 lt!624517) (index!46330 lt!624517) (index!46330 lt!624517) (select (arr!46673 a!2901) j!112) lt!624520 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96684 (_ BitVec 32)) SeekEntryResult!10984)

(assert (=> b!1415964 (= lt!624522 (seekEntryOrOpen!0 lt!624521 lt!624520 mask!2840))))

(assert (=> b!1415964 (and (not (undefined!11796 lt!624517)) (= (index!46330 lt!624517) i!1037) (bvslt (x!127935 lt!624517) (x!127935 lt!624518)) (= (select (store (arr!46673 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46330 lt!624517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47942 0))(
  ( (Unit!47943) )
))
(declare-fun lt!624515 () Unit!47942)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47942)

(assert (=> b!1415964 (= lt!624515 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624514 (x!127935 lt!624518) (index!46330 lt!624518) (x!127935 lt!624517) (index!46330 lt!624517) (undefined!11796 lt!624517) mask!2840))))

(declare-fun b!1415965 () Bool)

(declare-fun e!801420 () Bool)

(assert (=> b!1415965 (= e!801419 (not e!801420))))

(declare-fun res!952011 () Bool)

(assert (=> b!1415965 (=> res!952011 e!801420)))

(assert (=> b!1415965 (= res!952011 (or (not (is-Intermediate!10984 lt!624518)) (undefined!11796 lt!624518)))))

(declare-fun lt!624519 () SeekEntryResult!10984)

(assert (=> b!1415965 (= lt!624519 (Found!10984 j!112))))

(assert (=> b!1415965 (= lt!624519 (seekEntryOrOpen!0 (select (arr!46673 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96684 (_ BitVec 32)) Bool)

(assert (=> b!1415965 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624516 () Unit!47942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47942)

(assert (=> b!1415965 (= lt!624516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415965 (= lt!624518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624514 (select (arr!46673 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415965 (= lt!624514 (toIndex!0 (select (arr!46673 a!2901) j!112) mask!2840))))

(declare-fun b!1415966 () Bool)

(declare-fun res!952007 () Bool)

(assert (=> b!1415966 (=> (not res!952007) (not e!801419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415966 (= res!952007 (validKeyInArray!0 (select (arr!46673 a!2901) j!112)))))

(declare-fun b!1415967 () Bool)

(declare-fun res!952005 () Bool)

(assert (=> b!1415967 (=> (not res!952005) (not e!801419))))

(assert (=> b!1415967 (= res!952005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415968 () Bool)

(assert (=> b!1415968 (= e!801420 e!801422)))

(declare-fun res!952012 () Bool)

(assert (=> b!1415968 (=> res!952012 e!801422)))

(assert (=> b!1415968 (= res!952012 (or (= lt!624518 lt!624517) (not (is-Intermediate!10984 lt!624517))))))

(assert (=> b!1415968 (= lt!624517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624521 mask!2840) lt!624521 lt!624520 mask!2840))))

(assert (=> b!1415968 (= lt!624521 (select (store (arr!46673 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415968 (= lt!624520 (array!96685 (store (arr!46673 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47223 a!2901)))))

(declare-fun b!1415969 () Bool)

(assert (=> b!1415969 (= e!801421 true)))

(assert (=> b!1415969 (= lt!624519 lt!624522)))

(declare-fun lt!624513 () Unit!47942)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47942)

(assert (=> b!1415969 (= lt!624513 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624514 (x!127935 lt!624518) (index!46330 lt!624518) (x!127935 lt!624517) (index!46330 lt!624517) mask!2840))))

(declare-fun b!1415970 () Bool)

(declare-fun res!952003 () Bool)

(assert (=> b!1415970 (=> (not res!952003) (not e!801419))))

(assert (=> b!1415970 (= res!952003 (validKeyInArray!0 (select (arr!46673 a!2901) i!1037)))))

(assert (= (and start!121998 res!952009) b!1415962))

(assert (= (and b!1415962 res!952006) b!1415970))

(assert (= (and b!1415970 res!952003) b!1415966))

(assert (= (and b!1415966 res!952007) b!1415967))

(assert (= (and b!1415967 res!952005) b!1415963))

(assert (= (and b!1415963 res!952008) b!1415965))

(assert (= (and b!1415965 (not res!952011)) b!1415968))

(assert (= (and b!1415968 (not res!952012)) b!1415964))

(assert (= (and b!1415964 (not res!952010)) b!1415961))

(assert (= (and b!1415961 (not res!952004)) b!1415969))

(declare-fun m!1306431 () Bool)

(assert (=> start!121998 m!1306431))

(declare-fun m!1306433 () Bool)

(assert (=> start!121998 m!1306433))

(declare-fun m!1306435 () Bool)

(assert (=> b!1415964 m!1306435))

(assert (=> b!1415964 m!1306435))

(declare-fun m!1306437 () Bool)

(assert (=> b!1415964 m!1306437))

(declare-fun m!1306439 () Bool)

(assert (=> b!1415964 m!1306439))

(declare-fun m!1306441 () Bool)

(assert (=> b!1415964 m!1306441))

(declare-fun m!1306443 () Bool)

(assert (=> b!1415964 m!1306443))

(declare-fun m!1306445 () Bool)

(assert (=> b!1415964 m!1306445))

(declare-fun m!1306447 () Bool)

(assert (=> b!1415961 m!1306447))

(declare-fun m!1306449 () Bool)

(assert (=> b!1415968 m!1306449))

(assert (=> b!1415968 m!1306449))

(declare-fun m!1306451 () Bool)

(assert (=> b!1415968 m!1306451))

(assert (=> b!1415968 m!1306445))

(declare-fun m!1306453 () Bool)

(assert (=> b!1415968 m!1306453))

(assert (=> b!1415965 m!1306435))

(declare-fun m!1306455 () Bool)

(assert (=> b!1415965 m!1306455))

(assert (=> b!1415965 m!1306435))

(assert (=> b!1415965 m!1306435))

(declare-fun m!1306457 () Bool)

(assert (=> b!1415965 m!1306457))

(declare-fun m!1306459 () Bool)

(assert (=> b!1415965 m!1306459))

(assert (=> b!1415965 m!1306435))

(declare-fun m!1306461 () Bool)

(assert (=> b!1415965 m!1306461))

(declare-fun m!1306463 () Bool)

(assert (=> b!1415965 m!1306463))

(assert (=> b!1415966 m!1306435))

(assert (=> b!1415966 m!1306435))

(declare-fun m!1306465 () Bool)

(assert (=> b!1415966 m!1306465))

(declare-fun m!1306467 () Bool)

(assert (=> b!1415967 m!1306467))

(declare-fun m!1306469 () Bool)

(assert (=> b!1415963 m!1306469))

(declare-fun m!1306471 () Bool)

(assert (=> b!1415969 m!1306471))

(declare-fun m!1306473 () Bool)

(assert (=> b!1415970 m!1306473))

(assert (=> b!1415970 m!1306473))

(declare-fun m!1306475 () Bool)

(assert (=> b!1415970 m!1306475))

(push 1)

