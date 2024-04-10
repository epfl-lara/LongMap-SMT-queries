; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120046 () Bool)

(assert start!120046)

(declare-fun b!1397581 () Bool)

(declare-fun res!936502 () Bool)

(declare-fun e!791211 () Bool)

(assert (=> b!1397581 (=> (not res!936502) (not e!791211))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95575 0))(
  ( (array!95576 (arr!46141 (Array (_ BitVec 32) (_ BitVec 64))) (size!46691 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95575)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397581 (= res!936502 (and (= (size!46691 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46691 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46691 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397582 () Bool)

(declare-fun e!791213 () Bool)

(declare-fun e!791209 () Bool)

(assert (=> b!1397582 (= e!791213 e!791209)))

(declare-fun res!936496 () Bool)

(assert (=> b!1397582 (=> res!936496 e!791209)))

(declare-datatypes ((SeekEntryResult!10458 0))(
  ( (MissingZero!10458 (index!44203 (_ BitVec 32))) (Found!10458 (index!44204 (_ BitVec 32))) (Intermediate!10458 (undefined!11270 Bool) (index!44205 (_ BitVec 32)) (x!125856 (_ BitVec 32))) (Undefined!10458) (MissingVacant!10458 (index!44206 (_ BitVec 32))) )
))
(declare-fun lt!614316 () SeekEntryResult!10458)

(declare-fun lt!614319 () SeekEntryResult!10458)

(declare-fun lt!614313 () (_ BitVec 32))

(assert (=> b!1397582 (= res!936496 (or (= lt!614316 lt!614319) (not (is-Intermediate!10458 lt!614319)) (bvslt (x!125856 lt!614316) #b00000000000000000000000000000000) (bvsgt (x!125856 lt!614316) #b01111111111111111111111111111110) (bvslt lt!614313 #b00000000000000000000000000000000) (bvsge lt!614313 (size!46691 a!2901)) (bvslt (index!44205 lt!614316) #b00000000000000000000000000000000) (bvsge (index!44205 lt!614316) (size!46691 a!2901)) (not (= lt!614316 (Intermediate!10458 false (index!44205 lt!614316) (x!125856 lt!614316)))) (not (= lt!614319 (Intermediate!10458 (undefined!11270 lt!614319) (index!44205 lt!614319) (x!125856 lt!614319))))))))

(declare-fun lt!614318 () array!95575)

(declare-fun lt!614317 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95575 (_ BitVec 32)) SeekEntryResult!10458)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397582 (= lt!614319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614317 mask!2840) lt!614317 lt!614318 mask!2840))))

(assert (=> b!1397582 (= lt!614317 (select (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397582 (= lt!614318 (array!95576 (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46691 a!2901)))))

(declare-fun b!1397583 () Bool)

(declare-fun res!936501 () Bool)

(assert (=> b!1397583 (=> (not res!936501) (not e!791211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397583 (= res!936501 (validKeyInArray!0 (select (arr!46141 a!2901) j!112)))))

(declare-fun b!1397584 () Bool)

(declare-fun res!936497 () Bool)

(assert (=> b!1397584 (=> (not res!936497) (not e!791211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95575 (_ BitVec 32)) Bool)

(assert (=> b!1397584 (= res!936497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397585 () Bool)

(assert (=> b!1397585 (= e!791209 true)))

(declare-fun lt!614314 () SeekEntryResult!10458)

(assert (=> b!1397585 (= lt!614314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614313 lt!614317 lt!614318 mask!2840))))

(declare-fun b!1397586 () Bool)

(declare-fun res!936495 () Bool)

(assert (=> b!1397586 (=> (not res!936495) (not e!791211))))

(declare-datatypes ((List!32660 0))(
  ( (Nil!32657) (Cons!32656 (h!33898 (_ BitVec 64)) (t!47354 List!32660)) )
))
(declare-fun arrayNoDuplicates!0 (array!95575 (_ BitVec 32) List!32660) Bool)

(assert (=> b!1397586 (= res!936495 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32657))))

(declare-fun b!1397587 () Bool)

(assert (=> b!1397587 (= e!791211 (not e!791213))))

(declare-fun res!936500 () Bool)

(assert (=> b!1397587 (=> res!936500 e!791213)))

(assert (=> b!1397587 (= res!936500 (or (not (is-Intermediate!10458 lt!614316)) (undefined!11270 lt!614316)))))

(declare-fun e!791212 () Bool)

(assert (=> b!1397587 e!791212))

(declare-fun res!936494 () Bool)

(assert (=> b!1397587 (=> (not res!936494) (not e!791212))))

(assert (=> b!1397587 (= res!936494 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46920 0))(
  ( (Unit!46921) )
))
(declare-fun lt!614315 () Unit!46920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46920)

(assert (=> b!1397587 (= lt!614315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397587 (= lt!614316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614313 (select (arr!46141 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397587 (= lt!614313 (toIndex!0 (select (arr!46141 a!2901) j!112) mask!2840))))

(declare-fun b!1397588 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95575 (_ BitVec 32)) SeekEntryResult!10458)

(assert (=> b!1397588 (= e!791212 (= (seekEntryOrOpen!0 (select (arr!46141 a!2901) j!112) a!2901 mask!2840) (Found!10458 j!112)))))

(declare-fun b!1397589 () Bool)

(declare-fun res!936499 () Bool)

(assert (=> b!1397589 (=> (not res!936499) (not e!791211))))

(assert (=> b!1397589 (= res!936499 (validKeyInArray!0 (select (arr!46141 a!2901) i!1037)))))

(declare-fun res!936498 () Bool)

(assert (=> start!120046 (=> (not res!936498) (not e!791211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120046 (= res!936498 (validMask!0 mask!2840))))

(assert (=> start!120046 e!791211))

(assert (=> start!120046 true))

(declare-fun array_inv!35169 (array!95575) Bool)

(assert (=> start!120046 (array_inv!35169 a!2901)))

(assert (= (and start!120046 res!936498) b!1397581))

(assert (= (and b!1397581 res!936502) b!1397589))

(assert (= (and b!1397589 res!936499) b!1397583))

(assert (= (and b!1397583 res!936501) b!1397584))

(assert (= (and b!1397584 res!936497) b!1397586))

(assert (= (and b!1397586 res!936495) b!1397587))

(assert (= (and b!1397587 res!936494) b!1397588))

(assert (= (and b!1397587 (not res!936500)) b!1397582))

(assert (= (and b!1397582 (not res!936496)) b!1397585))

(declare-fun m!1284399 () Bool)

(assert (=> b!1397585 m!1284399))

(declare-fun m!1284401 () Bool)

(assert (=> b!1397582 m!1284401))

(assert (=> b!1397582 m!1284401))

(declare-fun m!1284403 () Bool)

(assert (=> b!1397582 m!1284403))

(declare-fun m!1284405 () Bool)

(assert (=> b!1397582 m!1284405))

(declare-fun m!1284407 () Bool)

(assert (=> b!1397582 m!1284407))

(declare-fun m!1284409 () Bool)

(assert (=> b!1397587 m!1284409))

(declare-fun m!1284411 () Bool)

(assert (=> b!1397587 m!1284411))

(declare-fun m!1284413 () Bool)

(assert (=> b!1397587 m!1284413))

(assert (=> b!1397587 m!1284409))

(declare-fun m!1284415 () Bool)

(assert (=> b!1397587 m!1284415))

(assert (=> b!1397587 m!1284409))

(declare-fun m!1284417 () Bool)

(assert (=> b!1397587 m!1284417))

(assert (=> b!1397583 m!1284409))

(assert (=> b!1397583 m!1284409))

(declare-fun m!1284419 () Bool)

(assert (=> b!1397583 m!1284419))

(declare-fun m!1284421 () Bool)

(assert (=> b!1397589 m!1284421))

(assert (=> b!1397589 m!1284421))

(declare-fun m!1284423 () Bool)

(assert (=> b!1397589 m!1284423))

(declare-fun m!1284425 () Bool)

(assert (=> b!1397584 m!1284425))

(assert (=> b!1397588 m!1284409))

(assert (=> b!1397588 m!1284409))

(declare-fun m!1284427 () Bool)

(assert (=> b!1397588 m!1284427))

(declare-fun m!1284429 () Bool)

(assert (=> start!120046 m!1284429))

(declare-fun m!1284431 () Bool)

(assert (=> start!120046 m!1284431))

(declare-fun m!1284433 () Bool)

(assert (=> b!1397586 m!1284433))

(push 1)

