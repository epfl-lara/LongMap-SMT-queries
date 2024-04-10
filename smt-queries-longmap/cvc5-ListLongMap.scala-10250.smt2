; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120552 () Bool)

(assert start!120552)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95961 0))(
  ( (array!95962 (arr!46331 (Array (_ BitVec 32) (_ BitVec 64))) (size!46881 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95961)

(declare-fun b!1403721 () Bool)

(declare-fun e!794771 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10648 0))(
  ( (MissingZero!10648 (index!44969 (_ BitVec 32))) (Found!10648 (index!44970 (_ BitVec 32))) (Intermediate!10648 (undefined!11460 Bool) (index!44971 (_ BitVec 32)) (x!126579 (_ BitVec 32))) (Undefined!10648) (MissingVacant!10648 (index!44972 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95961 (_ BitVec 32)) SeekEntryResult!10648)

(assert (=> b!1403721 (= e!794771 (= (seekEntryOrOpen!0 (select (arr!46331 a!2901) j!112) a!2901 mask!2840) (Found!10648 j!112)))))

(declare-fun b!1403722 () Bool)

(declare-fun res!942236 () Bool)

(declare-fun e!794770 () Bool)

(assert (=> b!1403722 (=> (not res!942236) (not e!794770))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403722 (= res!942236 (validKeyInArray!0 (select (arr!46331 a!2901) i!1037)))))

(declare-fun b!1403723 () Bool)

(declare-fun res!942233 () Bool)

(assert (=> b!1403723 (=> (not res!942233) (not e!794770))))

(assert (=> b!1403723 (= res!942233 (and (= (size!46881 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46881 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46881 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403724 () Bool)

(declare-fun res!942237 () Bool)

(assert (=> b!1403724 (=> (not res!942237) (not e!794770))))

(declare-datatypes ((List!32850 0))(
  ( (Nil!32847) (Cons!32846 (h!34094 (_ BitVec 64)) (t!47544 List!32850)) )
))
(declare-fun arrayNoDuplicates!0 (array!95961 (_ BitVec 32) List!32850) Bool)

(assert (=> b!1403724 (= res!942237 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32847))))

(declare-fun b!1403725 () Bool)

(declare-fun res!942235 () Bool)

(assert (=> b!1403725 (=> (not res!942235) (not e!794770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95961 (_ BitVec 32)) Bool)

(assert (=> b!1403725 (= res!942235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403726 () Bool)

(declare-fun res!942232 () Bool)

(assert (=> b!1403726 (=> (not res!942232) (not e!794770))))

(assert (=> b!1403726 (= res!942232 (validKeyInArray!0 (select (arr!46331 a!2901) j!112)))))

(declare-fun b!1403727 () Bool)

(assert (=> b!1403727 (= e!794770 (not true))))

(assert (=> b!1403727 e!794771))

(declare-fun res!942238 () Bool)

(assert (=> b!1403727 (=> (not res!942238) (not e!794771))))

(assert (=> b!1403727 (= res!942238 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47300 0))(
  ( (Unit!47301) )
))
(declare-fun lt!618488 () Unit!47300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47300)

(assert (=> b!1403727 (= lt!618488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618489 () SeekEntryResult!10648)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95961 (_ BitVec 32)) SeekEntryResult!10648)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403727 (= lt!618489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46331 a!2901) j!112) mask!2840) (select (arr!46331 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942234 () Bool)

(assert (=> start!120552 (=> (not res!942234) (not e!794770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120552 (= res!942234 (validMask!0 mask!2840))))

(assert (=> start!120552 e!794770))

(assert (=> start!120552 true))

(declare-fun array_inv!35359 (array!95961) Bool)

(assert (=> start!120552 (array_inv!35359 a!2901)))

(assert (= (and start!120552 res!942234) b!1403723))

(assert (= (and b!1403723 res!942233) b!1403722))

(assert (= (and b!1403722 res!942236) b!1403726))

(assert (= (and b!1403726 res!942232) b!1403725))

(assert (= (and b!1403725 res!942235) b!1403724))

(assert (= (and b!1403724 res!942237) b!1403727))

(assert (= (and b!1403727 res!942238) b!1403721))

(declare-fun m!1292445 () Bool)

(assert (=> b!1403724 m!1292445))

(declare-fun m!1292447 () Bool)

(assert (=> b!1403721 m!1292447))

(assert (=> b!1403721 m!1292447))

(declare-fun m!1292449 () Bool)

(assert (=> b!1403721 m!1292449))

(declare-fun m!1292451 () Bool)

(assert (=> b!1403722 m!1292451))

(assert (=> b!1403722 m!1292451))

(declare-fun m!1292453 () Bool)

(assert (=> b!1403722 m!1292453))

(declare-fun m!1292455 () Bool)

(assert (=> b!1403725 m!1292455))

(assert (=> b!1403726 m!1292447))

(assert (=> b!1403726 m!1292447))

(declare-fun m!1292457 () Bool)

(assert (=> b!1403726 m!1292457))

(assert (=> b!1403727 m!1292447))

(declare-fun m!1292459 () Bool)

(assert (=> b!1403727 m!1292459))

(assert (=> b!1403727 m!1292447))

(declare-fun m!1292461 () Bool)

(assert (=> b!1403727 m!1292461))

(assert (=> b!1403727 m!1292459))

(assert (=> b!1403727 m!1292447))

(declare-fun m!1292463 () Bool)

(assert (=> b!1403727 m!1292463))

(declare-fun m!1292465 () Bool)

(assert (=> b!1403727 m!1292465))

(declare-fun m!1292467 () Bool)

(assert (=> start!120552 m!1292467))

(declare-fun m!1292469 () Bool)

(assert (=> start!120552 m!1292469))

(push 1)

(assert (not b!1403721))

(assert (not b!1403722))

(assert (not b!1403724))

(assert (not b!1403725))

(assert (not b!1403726))

(assert (not start!120552))

(assert (not b!1403727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

