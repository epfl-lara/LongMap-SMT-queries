; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122702 () Bool)

(assert start!122702)

(declare-fun b!1421577 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97020 0))(
  ( (array!97021 (arr!46828 (Array (_ BitVec 32) (_ BitVec 64))) (size!47380 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97020)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun e!803777 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421577 (= e!803777 (not (or (= (select (arr!46828 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46828 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46828 a!2831) index!585) (select (arr!46828 a!2831) j!81)) (= (select (store (arr!46828 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2608 #b00000000000000000000000000000000))))))

(declare-fun e!803776 () Bool)

(assert (=> b!1421577 e!803776))

(declare-fun res!957073 () Bool)

(assert (=> b!1421577 (=> (not res!957073) (not e!803776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97020 (_ BitVec 32)) Bool)

(assert (=> b!1421577 (= res!957073 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47955 0))(
  ( (Unit!47956) )
))
(declare-fun lt!626164 () Unit!47955)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47955)

(assert (=> b!1421577 (= lt!626164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421578 () Bool)

(declare-fun e!803780 () Bool)

(assert (=> b!1421578 (= e!803780 e!803777)))

(declare-fun res!957061 () Bool)

(assert (=> b!1421578 (=> (not res!957061) (not e!803777))))

(declare-fun lt!626163 () array!97020)

(declare-datatypes ((SeekEntryResult!11140 0))(
  ( (MissingZero!11140 (index!46952 (_ BitVec 32))) (Found!11140 (index!46953 (_ BitVec 32))) (Intermediate!11140 (undefined!11952 Bool) (index!46954 (_ BitVec 32)) (x!128595 (_ BitVec 32))) (Undefined!11140) (MissingVacant!11140 (index!46955 (_ BitVec 32))) )
))
(declare-fun lt!626161 () SeekEntryResult!11140)

(declare-fun lt!626165 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97020 (_ BitVec 32)) SeekEntryResult!11140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421578 (= res!957061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626165 mask!2608) lt!626165 lt!626163 mask!2608) lt!626161))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421578 (= lt!626161 (Intermediate!11140 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421578 (= lt!626165 (select (store (arr!46828 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421578 (= lt!626163 (array!97021 (store (arr!46828 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47380 a!2831)))))

(declare-fun b!1421579 () Bool)

(declare-fun res!957063 () Bool)

(declare-fun e!803779 () Bool)

(assert (=> b!1421579 (=> (not res!957063) (not e!803779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421579 (= res!957063 (validKeyInArray!0 (select (arr!46828 a!2831) i!982)))))

(declare-fun b!1421580 () Bool)

(declare-fun res!957066 () Bool)

(assert (=> b!1421580 (=> (not res!957066) (not e!803779))))

(assert (=> b!1421580 (= res!957066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421581 () Bool)

(declare-fun res!957072 () Bool)

(assert (=> b!1421581 (=> (not res!957072) (not e!803779))))

(declare-datatypes ((List!33416 0))(
  ( (Nil!33413) (Cons!33412 (h!34714 (_ BitVec 64)) (t!48102 List!33416)) )
))
(declare-fun arrayNoDuplicates!0 (array!97020 (_ BitVec 32) List!33416) Bool)

(assert (=> b!1421581 (= res!957072 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33413))))

(declare-fun b!1421582 () Bool)

(assert (=> b!1421582 (= e!803779 e!803780)))

(declare-fun res!957068 () Bool)

(assert (=> b!1421582 (=> (not res!957068) (not e!803780))))

(declare-fun lt!626162 () SeekEntryResult!11140)

(assert (=> b!1421582 (= res!957068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46828 a!2831) j!81) mask!2608) (select (arr!46828 a!2831) j!81) a!2831 mask!2608) lt!626162))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421582 (= lt!626162 (Intermediate!11140 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421583 () Bool)

(declare-fun res!957064 () Bool)

(assert (=> b!1421583 (=> (not res!957064) (not e!803779))))

(assert (=> b!1421583 (= res!957064 (and (= (size!47380 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47380 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47380 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421584 () Bool)

(declare-fun res!957070 () Bool)

(assert (=> b!1421584 (=> (not res!957070) (not e!803777))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1421584 (= res!957070 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46828 a!2831) j!81) a!2831 mask!2608) lt!626162))))

(declare-fun b!1421586 () Bool)

(declare-fun res!957067 () Bool)

(assert (=> b!1421586 (=> (not res!957067) (not e!803777))))

(assert (=> b!1421586 (= res!957067 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626165 lt!626163 mask!2608) lt!626161))))

(declare-fun b!1421587 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97020 (_ BitVec 32)) SeekEntryResult!11140)

(assert (=> b!1421587 (= e!803776 (= (seekEntryOrOpen!0 (select (arr!46828 a!2831) j!81) a!2831 mask!2608) (Found!11140 j!81)))))

(declare-fun b!1421585 () Bool)

(declare-fun res!957071 () Bool)

(assert (=> b!1421585 (=> (not res!957071) (not e!803779))))

(assert (=> b!1421585 (= res!957071 (validKeyInArray!0 (select (arr!46828 a!2831) j!81)))))

(declare-fun res!957065 () Bool)

(assert (=> start!122702 (=> (not res!957065) (not e!803779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122702 (= res!957065 (validMask!0 mask!2608))))

(assert (=> start!122702 e!803779))

(assert (=> start!122702 true))

(declare-fun array_inv!36061 (array!97020) Bool)

(assert (=> start!122702 (array_inv!36061 a!2831)))

(declare-fun b!1421588 () Bool)

(declare-fun res!957069 () Bool)

(assert (=> b!1421588 (=> (not res!957069) (not e!803779))))

(assert (=> b!1421588 (= res!957069 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47380 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47380 a!2831))))))

(declare-fun b!1421589 () Bool)

(declare-fun res!957062 () Bool)

(assert (=> b!1421589 (=> (not res!957062) (not e!803777))))

(assert (=> b!1421589 (= res!957062 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122702 res!957065) b!1421583))

(assert (= (and b!1421583 res!957064) b!1421579))

(assert (= (and b!1421579 res!957063) b!1421585))

(assert (= (and b!1421585 res!957071) b!1421580))

(assert (= (and b!1421580 res!957066) b!1421581))

(assert (= (and b!1421581 res!957072) b!1421588))

(assert (= (and b!1421588 res!957069) b!1421582))

(assert (= (and b!1421582 res!957068) b!1421578))

(assert (= (and b!1421578 res!957061) b!1421584))

(assert (= (and b!1421584 res!957070) b!1421586))

(assert (= (and b!1421586 res!957067) b!1421589))

(assert (= (and b!1421589 res!957062) b!1421577))

(assert (= (and b!1421577 res!957073) b!1421587))

(declare-fun m!1311645 () Bool)

(assert (=> b!1421585 m!1311645))

(assert (=> b!1421585 m!1311645))

(declare-fun m!1311647 () Bool)

(assert (=> b!1421585 m!1311647))

(assert (=> b!1421582 m!1311645))

(assert (=> b!1421582 m!1311645))

(declare-fun m!1311649 () Bool)

(assert (=> b!1421582 m!1311649))

(assert (=> b!1421582 m!1311649))

(assert (=> b!1421582 m!1311645))

(declare-fun m!1311651 () Bool)

(assert (=> b!1421582 m!1311651))

(declare-fun m!1311653 () Bool)

(assert (=> b!1421581 m!1311653))

(declare-fun m!1311655 () Bool)

(assert (=> b!1421586 m!1311655))

(declare-fun m!1311657 () Bool)

(assert (=> b!1421580 m!1311657))

(assert (=> b!1421584 m!1311645))

(assert (=> b!1421584 m!1311645))

(declare-fun m!1311659 () Bool)

(assert (=> b!1421584 m!1311659))

(declare-fun m!1311661 () Bool)

(assert (=> b!1421579 m!1311661))

(assert (=> b!1421579 m!1311661))

(declare-fun m!1311663 () Bool)

(assert (=> b!1421579 m!1311663))

(declare-fun m!1311665 () Bool)

(assert (=> start!122702 m!1311665))

(declare-fun m!1311667 () Bool)

(assert (=> start!122702 m!1311667))

(declare-fun m!1311669 () Bool)

(assert (=> b!1421578 m!1311669))

(assert (=> b!1421578 m!1311669))

(declare-fun m!1311671 () Bool)

(assert (=> b!1421578 m!1311671))

(declare-fun m!1311673 () Bool)

(assert (=> b!1421578 m!1311673))

(declare-fun m!1311675 () Bool)

(assert (=> b!1421578 m!1311675))

(assert (=> b!1421587 m!1311645))

(assert (=> b!1421587 m!1311645))

(declare-fun m!1311677 () Bool)

(assert (=> b!1421587 m!1311677))

(assert (=> b!1421577 m!1311673))

(declare-fun m!1311679 () Bool)

(assert (=> b!1421577 m!1311679))

(declare-fun m!1311681 () Bool)

(assert (=> b!1421577 m!1311681))

(declare-fun m!1311683 () Bool)

(assert (=> b!1421577 m!1311683))

(assert (=> b!1421577 m!1311645))

(declare-fun m!1311685 () Bool)

(assert (=> b!1421577 m!1311685))

(check-sat (not b!1421578) (not b!1421582) (not b!1421585) (not b!1421579) (not b!1421587) (not b!1421577) (not b!1421586) (not start!122702) (not b!1421581) (not b!1421584) (not b!1421580))
(check-sat)
