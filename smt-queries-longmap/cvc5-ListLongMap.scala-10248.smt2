; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120540 () Bool)

(assert start!120540)

(declare-fun b!1403556 () Bool)

(declare-fun res!942124 () Bool)

(declare-fun e!794696 () Bool)

(assert (=> b!1403556 (=> (not res!942124) (not e!794696))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95902 0))(
  ( (array!95903 (arr!46302 (Array (_ BitVec 32) (_ BitVec 64))) (size!46854 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95902)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403556 (= res!942124 (and (= (size!46854 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46854 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46854 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403558 () Bool)

(declare-fun e!794695 () Bool)

(declare-datatypes ((SeekEntryResult!10645 0))(
  ( (MissingZero!10645 (index!44957 (_ BitVec 32))) (Found!10645 (index!44958 (_ BitVec 32))) (Intermediate!10645 (undefined!11457 Bool) (index!44959 (_ BitVec 32)) (x!126557 (_ BitVec 32))) (Undefined!10645) (MissingVacant!10645 (index!44960 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95902 (_ BitVec 32)) SeekEntryResult!10645)

(assert (=> b!1403558 (= e!794695 (= (seekEntryOrOpen!0 (select (arr!46302 a!2901) j!112) a!2901 mask!2840) (Found!10645 j!112)))))

(declare-fun b!1403559 () Bool)

(declare-fun res!942121 () Bool)

(assert (=> b!1403559 (=> (not res!942121) (not e!794696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403559 (= res!942121 (validKeyInArray!0 (select (arr!46302 a!2901) j!112)))))

(declare-fun b!1403560 () Bool)

(declare-fun res!942122 () Bool)

(assert (=> b!1403560 (=> (not res!942122) (not e!794696))))

(declare-datatypes ((List!32899 0))(
  ( (Nil!32896) (Cons!32895 (h!34143 (_ BitVec 64)) (t!47585 List!32899)) )
))
(declare-fun arrayNoDuplicates!0 (array!95902 (_ BitVec 32) List!32899) Bool)

(assert (=> b!1403560 (= res!942122 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32896))))

(declare-fun b!1403561 () Bool)

(assert (=> b!1403561 (= e!794696 (not true))))

(assert (=> b!1403561 e!794695))

(declare-fun res!942118 () Bool)

(assert (=> b!1403561 (=> (not res!942118) (not e!794695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95902 (_ BitVec 32)) Bool)

(assert (=> b!1403561 (= res!942118 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47137 0))(
  ( (Unit!47138) )
))
(declare-fun lt!618275 () Unit!47137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47137)

(assert (=> b!1403561 (= lt!618275 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618274 () SeekEntryResult!10645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95902 (_ BitVec 32)) SeekEntryResult!10645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403561 (= lt!618274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46302 a!2901) j!112) mask!2840) (select (arr!46302 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403562 () Bool)

(declare-fun res!942119 () Bool)

(assert (=> b!1403562 (=> (not res!942119) (not e!794696))))

(assert (=> b!1403562 (= res!942119 (validKeyInArray!0 (select (arr!46302 a!2901) i!1037)))))

(declare-fun res!942123 () Bool)

(assert (=> start!120540 (=> (not res!942123) (not e!794696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120540 (= res!942123 (validMask!0 mask!2840))))

(assert (=> start!120540 e!794696))

(assert (=> start!120540 true))

(declare-fun array_inv!35535 (array!95902) Bool)

(assert (=> start!120540 (array_inv!35535 a!2901)))

(declare-fun b!1403557 () Bool)

(declare-fun res!942120 () Bool)

(assert (=> b!1403557 (=> (not res!942120) (not e!794696))))

(assert (=> b!1403557 (= res!942120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120540 res!942123) b!1403556))

(assert (= (and b!1403556 res!942124) b!1403562))

(assert (= (and b!1403562 res!942119) b!1403559))

(assert (= (and b!1403559 res!942121) b!1403557))

(assert (= (and b!1403557 res!942120) b!1403560))

(assert (= (and b!1403560 res!942122) b!1403561))

(assert (= (and b!1403561 res!942118) b!1403558))

(declare-fun m!1291805 () Bool)

(assert (=> start!120540 m!1291805))

(declare-fun m!1291807 () Bool)

(assert (=> start!120540 m!1291807))

(declare-fun m!1291809 () Bool)

(assert (=> b!1403557 m!1291809))

(declare-fun m!1291811 () Bool)

(assert (=> b!1403559 m!1291811))

(assert (=> b!1403559 m!1291811))

(declare-fun m!1291813 () Bool)

(assert (=> b!1403559 m!1291813))

(assert (=> b!1403558 m!1291811))

(assert (=> b!1403558 m!1291811))

(declare-fun m!1291815 () Bool)

(assert (=> b!1403558 m!1291815))

(declare-fun m!1291817 () Bool)

(assert (=> b!1403562 m!1291817))

(assert (=> b!1403562 m!1291817))

(declare-fun m!1291819 () Bool)

(assert (=> b!1403562 m!1291819))

(assert (=> b!1403561 m!1291811))

(declare-fun m!1291821 () Bool)

(assert (=> b!1403561 m!1291821))

(assert (=> b!1403561 m!1291811))

(declare-fun m!1291823 () Bool)

(assert (=> b!1403561 m!1291823))

(assert (=> b!1403561 m!1291821))

(assert (=> b!1403561 m!1291811))

(declare-fun m!1291825 () Bool)

(assert (=> b!1403561 m!1291825))

(declare-fun m!1291827 () Bool)

(assert (=> b!1403561 m!1291827))

(declare-fun m!1291829 () Bool)

(assert (=> b!1403560 m!1291829))

(push 1)

(assert (not b!1403561))

(assert (not start!120540))

(assert (not b!1403557))

(assert (not b!1403559))

(assert (not b!1403558))

(assert (not b!1403560))

(assert (not b!1403562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

