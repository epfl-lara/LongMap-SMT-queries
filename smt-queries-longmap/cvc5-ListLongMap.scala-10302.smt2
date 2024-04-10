; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121134 () Bool)

(assert start!121134)

(declare-fun b!1408454 () Bool)

(declare-fun res!946183 () Bool)

(declare-fun e!797104 () Bool)

(assert (=> b!1408454 (=> (not res!946183) (not e!797104))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96288 0))(
  ( (array!96289 (arr!46487 (Array (_ BitVec 32) (_ BitVec 64))) (size!47037 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96288)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408454 (= res!946183 (and (= (size!47037 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47037 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47037 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408455 () Bool)

(declare-fun e!797103 () Bool)

(assert (=> b!1408455 (= e!797104 (not e!797103))))

(declare-fun res!946179 () Bool)

(assert (=> b!1408455 (=> res!946179 e!797103)))

(declare-datatypes ((SeekEntryResult!10798 0))(
  ( (MissingZero!10798 (index!45569 (_ BitVec 32))) (Found!10798 (index!45570 (_ BitVec 32))) (Intermediate!10798 (undefined!11610 Bool) (index!45571 (_ BitVec 32)) (x!127175 (_ BitVec 32))) (Undefined!10798) (MissingVacant!10798 (index!45572 (_ BitVec 32))) )
))
(declare-fun lt!620355 () SeekEntryResult!10798)

(assert (=> b!1408455 (= res!946179 (or (not (is-Intermediate!10798 lt!620355)) (undefined!11610 lt!620355)))))

(declare-fun e!797102 () Bool)

(assert (=> b!1408455 e!797102))

(declare-fun res!946177 () Bool)

(assert (=> b!1408455 (=> (not res!946177) (not e!797102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96288 (_ BitVec 32)) Bool)

(assert (=> b!1408455 (= res!946177 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47570 0))(
  ( (Unit!47571) )
))
(declare-fun lt!620354 () Unit!47570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47570)

(assert (=> b!1408455 (= lt!620354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96288 (_ BitVec 32)) SeekEntryResult!10798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408455 (= lt!620355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46487 a!2901) j!112) mask!2840) (select (arr!46487 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408456 () Bool)

(declare-fun res!946181 () Bool)

(assert (=> b!1408456 (=> (not res!946181) (not e!797104))))

(declare-datatypes ((List!33006 0))(
  ( (Nil!33003) (Cons!33002 (h!34265 (_ BitVec 64)) (t!47700 List!33006)) )
))
(declare-fun arrayNoDuplicates!0 (array!96288 (_ BitVec 32) List!33006) Bool)

(assert (=> b!1408456 (= res!946181 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33003))))

(declare-fun b!1408457 () Bool)

(assert (=> b!1408457 (= e!797103 true)))

(declare-fun lt!620353 () SeekEntryResult!10798)

(assert (=> b!1408457 (= lt!620353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46487 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46487 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96289 (store (arr!46487 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47037 a!2901)) mask!2840))))

(declare-fun b!1408458 () Bool)

(declare-fun res!946176 () Bool)

(assert (=> b!1408458 (=> (not res!946176) (not e!797104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408458 (= res!946176 (validKeyInArray!0 (select (arr!46487 a!2901) i!1037)))))

(declare-fun b!1408459 () Bool)

(declare-fun res!946182 () Bool)

(assert (=> b!1408459 (=> (not res!946182) (not e!797104))))

(assert (=> b!1408459 (= res!946182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408461 () Bool)

(declare-fun res!946178 () Bool)

(assert (=> b!1408461 (=> (not res!946178) (not e!797104))))

(assert (=> b!1408461 (= res!946178 (validKeyInArray!0 (select (arr!46487 a!2901) j!112)))))

(declare-fun res!946180 () Bool)

(assert (=> start!121134 (=> (not res!946180) (not e!797104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121134 (= res!946180 (validMask!0 mask!2840))))

(assert (=> start!121134 e!797104))

(assert (=> start!121134 true))

(declare-fun array_inv!35515 (array!96288) Bool)

(assert (=> start!121134 (array_inv!35515 a!2901)))

(declare-fun b!1408460 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96288 (_ BitVec 32)) SeekEntryResult!10798)

(assert (=> b!1408460 (= e!797102 (= (seekEntryOrOpen!0 (select (arr!46487 a!2901) j!112) a!2901 mask!2840) (Found!10798 j!112)))))

(assert (= (and start!121134 res!946180) b!1408454))

(assert (= (and b!1408454 res!946183) b!1408458))

(assert (= (and b!1408458 res!946176) b!1408461))

(assert (= (and b!1408461 res!946178) b!1408459))

(assert (= (and b!1408459 res!946182) b!1408456))

(assert (= (and b!1408456 res!946181) b!1408455))

(assert (= (and b!1408455 res!946177) b!1408460))

(assert (= (and b!1408455 (not res!946179)) b!1408457))

(declare-fun m!1297761 () Bool)

(assert (=> start!121134 m!1297761))

(declare-fun m!1297763 () Bool)

(assert (=> start!121134 m!1297763))

(declare-fun m!1297765 () Bool)

(assert (=> b!1408456 m!1297765))

(declare-fun m!1297767 () Bool)

(assert (=> b!1408455 m!1297767))

(declare-fun m!1297769 () Bool)

(assert (=> b!1408455 m!1297769))

(assert (=> b!1408455 m!1297767))

(declare-fun m!1297771 () Bool)

(assert (=> b!1408455 m!1297771))

(assert (=> b!1408455 m!1297769))

(assert (=> b!1408455 m!1297767))

(declare-fun m!1297773 () Bool)

(assert (=> b!1408455 m!1297773))

(declare-fun m!1297775 () Bool)

(assert (=> b!1408455 m!1297775))

(declare-fun m!1297777 () Bool)

(assert (=> b!1408459 m!1297777))

(assert (=> b!1408460 m!1297767))

(assert (=> b!1408460 m!1297767))

(declare-fun m!1297779 () Bool)

(assert (=> b!1408460 m!1297779))

(declare-fun m!1297781 () Bool)

(assert (=> b!1408458 m!1297781))

(assert (=> b!1408458 m!1297781))

(declare-fun m!1297783 () Bool)

(assert (=> b!1408458 m!1297783))

(assert (=> b!1408461 m!1297767))

(assert (=> b!1408461 m!1297767))

(declare-fun m!1297785 () Bool)

(assert (=> b!1408461 m!1297785))

(declare-fun m!1297787 () Bool)

(assert (=> b!1408457 m!1297787))

(declare-fun m!1297789 () Bool)

(assert (=> b!1408457 m!1297789))

(assert (=> b!1408457 m!1297789))

(declare-fun m!1297791 () Bool)

(assert (=> b!1408457 m!1297791))

(assert (=> b!1408457 m!1297791))

(assert (=> b!1408457 m!1297789))

(declare-fun m!1297793 () Bool)

(assert (=> b!1408457 m!1297793))

(push 1)

(assert (not b!1408461))

(assert (not b!1408456))

(assert (not b!1408457))

(assert (not b!1408459))

(assert (not b!1408455))

(assert (not b!1408458))

(assert (not start!121134))

(assert (not b!1408460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

