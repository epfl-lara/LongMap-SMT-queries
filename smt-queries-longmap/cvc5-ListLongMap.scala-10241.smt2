; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120498 () Bool)

(assert start!120498)

(declare-fun b!1403102 () Bool)

(declare-fun res!941618 () Bool)

(declare-fun e!794474 () Bool)

(assert (=> b!1403102 (=> (not res!941618) (not e!794474))))

(declare-datatypes ((array!95907 0))(
  ( (array!95908 (arr!46304 (Array (_ BitVec 32) (_ BitVec 64))) (size!46854 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95907)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403102 (= res!941618 (validKeyInArray!0 (select (arr!46304 a!2901) j!112)))))

(declare-fun b!1403103 () Bool)

(declare-fun e!794476 () Bool)

(assert (=> b!1403103 (= e!794476 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10621 0))(
  ( (MissingZero!10621 (index!44861 (_ BitVec 32))) (Found!10621 (index!44862 (_ BitVec 32))) (Intermediate!10621 (undefined!11433 Bool) (index!44863 (_ BitVec 32)) (x!126480 (_ BitVec 32))) (Undefined!10621) (MissingVacant!10621 (index!44864 (_ BitVec 32))) )
))
(declare-fun lt!618275 () SeekEntryResult!10621)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95907 (_ BitVec 32)) SeekEntryResult!10621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403103 (= lt!618275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46304 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46304 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95908 (store (arr!46304 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46854 a!2901)) mask!2840))))

(declare-fun b!1403104 () Bool)

(declare-fun res!941616 () Bool)

(assert (=> b!1403104 (=> (not res!941616) (not e!794474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95907 (_ BitVec 32)) Bool)

(assert (=> b!1403104 (= res!941616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403105 () Bool)

(declare-fun res!941617 () Bool)

(assert (=> b!1403105 (=> (not res!941617) (not e!794474))))

(declare-datatypes ((List!32823 0))(
  ( (Nil!32820) (Cons!32819 (h!34067 (_ BitVec 64)) (t!47517 List!32823)) )
))
(declare-fun arrayNoDuplicates!0 (array!95907 (_ BitVec 32) List!32823) Bool)

(assert (=> b!1403105 (= res!941617 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32820))))

(declare-fun b!1403106 () Bool)

(declare-fun res!941614 () Bool)

(assert (=> b!1403106 (=> (not res!941614) (not e!794474))))

(assert (=> b!1403106 (= res!941614 (and (= (size!46854 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46854 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46854 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941619 () Bool)

(assert (=> start!120498 (=> (not res!941619) (not e!794474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120498 (= res!941619 (validMask!0 mask!2840))))

(assert (=> start!120498 e!794474))

(assert (=> start!120498 true))

(declare-fun array_inv!35332 (array!95907) Bool)

(assert (=> start!120498 (array_inv!35332 a!2901)))

(declare-fun b!1403107 () Bool)

(declare-fun res!941613 () Bool)

(assert (=> b!1403107 (=> (not res!941613) (not e!794474))))

(assert (=> b!1403107 (= res!941613 (validKeyInArray!0 (select (arr!46304 a!2901) i!1037)))))

(declare-fun b!1403108 () Bool)

(assert (=> b!1403108 (= e!794474 (not e!794476))))

(declare-fun res!941620 () Bool)

(assert (=> b!1403108 (=> res!941620 e!794476)))

(declare-fun lt!618274 () SeekEntryResult!10621)

(assert (=> b!1403108 (= res!941620 (or (not (is-Intermediate!10621 lt!618274)) (undefined!11433 lt!618274)))))

(declare-fun e!794475 () Bool)

(assert (=> b!1403108 e!794475))

(declare-fun res!941615 () Bool)

(assert (=> b!1403108 (=> (not res!941615) (not e!794475))))

(assert (=> b!1403108 (= res!941615 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47246 0))(
  ( (Unit!47247) )
))
(declare-fun lt!618276 () Unit!47246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47246)

(assert (=> b!1403108 (= lt!618276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403108 (= lt!618274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46304 a!2901) j!112) mask!2840) (select (arr!46304 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403109 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95907 (_ BitVec 32)) SeekEntryResult!10621)

(assert (=> b!1403109 (= e!794475 (= (seekEntryOrOpen!0 (select (arr!46304 a!2901) j!112) a!2901 mask!2840) (Found!10621 j!112)))))

(assert (= (and start!120498 res!941619) b!1403106))

(assert (= (and b!1403106 res!941614) b!1403107))

(assert (= (and b!1403107 res!941613) b!1403102))

(assert (= (and b!1403102 res!941618) b!1403104))

(assert (= (and b!1403104 res!941616) b!1403105))

(assert (= (and b!1403105 res!941617) b!1403108))

(assert (= (and b!1403108 res!941615) b!1403109))

(assert (= (and b!1403108 (not res!941620)) b!1403103))

(declare-fun m!1291599 () Bool)

(assert (=> b!1403102 m!1291599))

(assert (=> b!1403102 m!1291599))

(declare-fun m!1291601 () Bool)

(assert (=> b!1403102 m!1291601))

(declare-fun m!1291603 () Bool)

(assert (=> b!1403104 m!1291603))

(assert (=> b!1403108 m!1291599))

(declare-fun m!1291605 () Bool)

(assert (=> b!1403108 m!1291605))

(assert (=> b!1403108 m!1291599))

(declare-fun m!1291607 () Bool)

(assert (=> b!1403108 m!1291607))

(assert (=> b!1403108 m!1291605))

(assert (=> b!1403108 m!1291599))

(declare-fun m!1291609 () Bool)

(assert (=> b!1403108 m!1291609))

(declare-fun m!1291611 () Bool)

(assert (=> b!1403108 m!1291611))

(declare-fun m!1291613 () Bool)

(assert (=> b!1403103 m!1291613))

(declare-fun m!1291615 () Bool)

(assert (=> b!1403103 m!1291615))

(assert (=> b!1403103 m!1291615))

(declare-fun m!1291617 () Bool)

(assert (=> b!1403103 m!1291617))

(assert (=> b!1403103 m!1291617))

(assert (=> b!1403103 m!1291615))

(declare-fun m!1291619 () Bool)

(assert (=> b!1403103 m!1291619))

(declare-fun m!1291621 () Bool)

(assert (=> start!120498 m!1291621))

(declare-fun m!1291623 () Bool)

(assert (=> start!120498 m!1291623))

(assert (=> b!1403109 m!1291599))

(assert (=> b!1403109 m!1291599))

(declare-fun m!1291625 () Bool)

(assert (=> b!1403109 m!1291625))

(declare-fun m!1291627 () Bool)

(assert (=> b!1403107 m!1291627))

(assert (=> b!1403107 m!1291627))

(declare-fun m!1291629 () Bool)

(assert (=> b!1403107 m!1291629))

(declare-fun m!1291631 () Bool)

(assert (=> b!1403105 m!1291631))

(push 1)

(assert (not b!1403104))

(assert (not b!1403103))

(assert (not b!1403109))

(assert (not start!120498))

(assert (not b!1403105))

(assert (not b!1403102))

(assert (not b!1403107))

(assert (not b!1403108))

(check-sat)

