; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120550 () Bool)

(assert start!120550)

(declare-fun b!1403700 () Bool)

(declare-fun res!942211 () Bool)

(declare-fun e!794762 () Bool)

(assert (=> b!1403700 (=> (not res!942211) (not e!794762))))

(declare-datatypes ((array!95959 0))(
  ( (array!95960 (arr!46330 (Array (_ BitVec 32) (_ BitVec 64))) (size!46880 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95959)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95959 (_ BitVec 32)) Bool)

(assert (=> b!1403700 (= res!942211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403701 () Bool)

(declare-fun res!942215 () Bool)

(assert (=> b!1403701 (=> (not res!942215) (not e!794762))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403701 (= res!942215 (validKeyInArray!0 (select (arr!46330 a!2901) i!1037)))))

(declare-fun res!942213 () Bool)

(assert (=> start!120550 (=> (not res!942213) (not e!794762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120550 (= res!942213 (validMask!0 mask!2840))))

(assert (=> start!120550 e!794762))

(assert (=> start!120550 true))

(declare-fun array_inv!35358 (array!95959) Bool)

(assert (=> start!120550 (array_inv!35358 a!2901)))

(declare-fun b!1403702 () Bool)

(declare-fun res!942216 () Bool)

(assert (=> b!1403702 (=> (not res!942216) (not e!794762))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403702 (= res!942216 (and (= (size!46880 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46880 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46880 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403703 () Bool)

(declare-fun e!794760 () Bool)

(declare-datatypes ((SeekEntryResult!10647 0))(
  ( (MissingZero!10647 (index!44965 (_ BitVec 32))) (Found!10647 (index!44966 (_ BitVec 32))) (Intermediate!10647 (undefined!11459 Bool) (index!44967 (_ BitVec 32)) (x!126570 (_ BitVec 32))) (Undefined!10647) (MissingVacant!10647 (index!44968 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95959 (_ BitVec 32)) SeekEntryResult!10647)

(assert (=> b!1403703 (= e!794760 (= (seekEntryOrOpen!0 (select (arr!46330 a!2901) j!112) a!2901 mask!2840) (Found!10647 j!112)))))

(declare-fun b!1403704 () Bool)

(assert (=> b!1403704 (= e!794762 (not true))))

(assert (=> b!1403704 e!794760))

(declare-fun res!942217 () Bool)

(assert (=> b!1403704 (=> (not res!942217) (not e!794760))))

(assert (=> b!1403704 (= res!942217 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47298 0))(
  ( (Unit!47299) )
))
(declare-fun lt!618483 () Unit!47298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47298)

(assert (=> b!1403704 (= lt!618483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618482 () SeekEntryResult!10647)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95959 (_ BitVec 32)) SeekEntryResult!10647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403704 (= lt!618482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46330 a!2901) j!112) mask!2840) (select (arr!46330 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403705 () Bool)

(declare-fun res!942214 () Bool)

(assert (=> b!1403705 (=> (not res!942214) (not e!794762))))

(declare-datatypes ((List!32849 0))(
  ( (Nil!32846) (Cons!32845 (h!34093 (_ BitVec 64)) (t!47543 List!32849)) )
))
(declare-fun arrayNoDuplicates!0 (array!95959 (_ BitVec 32) List!32849) Bool)

(assert (=> b!1403705 (= res!942214 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32846))))

(declare-fun b!1403706 () Bool)

(declare-fun res!942212 () Bool)

(assert (=> b!1403706 (=> (not res!942212) (not e!794762))))

(assert (=> b!1403706 (= res!942212 (validKeyInArray!0 (select (arr!46330 a!2901) j!112)))))

(assert (= (and start!120550 res!942213) b!1403702))

(assert (= (and b!1403702 res!942216) b!1403701))

(assert (= (and b!1403701 res!942215) b!1403706))

(assert (= (and b!1403706 res!942212) b!1403700))

(assert (= (and b!1403700 res!942211) b!1403705))

(assert (= (and b!1403705 res!942214) b!1403704))

(assert (= (and b!1403704 res!942217) b!1403703))

(declare-fun m!1292419 () Bool)

(assert (=> b!1403705 m!1292419))

(declare-fun m!1292421 () Bool)

(assert (=> b!1403706 m!1292421))

(assert (=> b!1403706 m!1292421))

(declare-fun m!1292423 () Bool)

(assert (=> b!1403706 m!1292423))

(assert (=> b!1403704 m!1292421))

(declare-fun m!1292425 () Bool)

(assert (=> b!1403704 m!1292425))

(assert (=> b!1403704 m!1292421))

(declare-fun m!1292427 () Bool)

(assert (=> b!1403704 m!1292427))

(assert (=> b!1403704 m!1292425))

(assert (=> b!1403704 m!1292421))

(declare-fun m!1292429 () Bool)

(assert (=> b!1403704 m!1292429))

(declare-fun m!1292431 () Bool)

(assert (=> b!1403704 m!1292431))

(declare-fun m!1292433 () Bool)

(assert (=> b!1403701 m!1292433))

(assert (=> b!1403701 m!1292433))

(declare-fun m!1292435 () Bool)

(assert (=> b!1403701 m!1292435))

(declare-fun m!1292437 () Bool)

(assert (=> start!120550 m!1292437))

(declare-fun m!1292439 () Bool)

(assert (=> start!120550 m!1292439))

(declare-fun m!1292441 () Bool)

(assert (=> b!1403700 m!1292441))

(assert (=> b!1403703 m!1292421))

(assert (=> b!1403703 m!1292421))

(declare-fun m!1292443 () Bool)

(assert (=> b!1403703 m!1292443))

(push 1)

(assert (not b!1403703))

(assert (not start!120550))

(assert (not b!1403700))

(assert (not b!1403705))

(assert (not b!1403704))

(assert (not b!1403701))

(assert (not b!1403706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

