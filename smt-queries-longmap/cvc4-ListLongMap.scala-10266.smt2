; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120760 () Bool)

(assert start!120760)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96067 0))(
  ( (array!96068 (arr!46381 (Array (_ BitVec 32) (_ BitVec 64))) (size!46931 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96067)

(declare-fun e!795426 () Bool)

(declare-fun b!1405138 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10692 0))(
  ( (MissingZero!10692 (index!45145 (_ BitVec 32))) (Found!10692 (index!45146 (_ BitVec 32))) (Intermediate!10692 (undefined!11504 Bool) (index!45147 (_ BitVec 32)) (x!126763 (_ BitVec 32))) (Undefined!10692) (MissingVacant!10692 (index!45148 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96067 (_ BitVec 32)) SeekEntryResult!10692)

(assert (=> b!1405138 (= e!795426 (= (seekEntryOrOpen!0 (select (arr!46381 a!2901) j!112) a!2901 mask!2840) (Found!10692 j!112)))))

(declare-fun b!1405139 () Bool)

(declare-fun res!943354 () Bool)

(declare-fun e!795428 () Bool)

(assert (=> b!1405139 (=> (not res!943354) (not e!795428))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405139 (= res!943354 (and (= (size!46931 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46931 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46931 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405140 () Bool)

(declare-fun res!943355 () Bool)

(assert (=> b!1405140 (=> (not res!943355) (not e!795428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405140 (= res!943355 (validKeyInArray!0 (select (arr!46381 a!2901) i!1037)))))

(declare-fun b!1405141 () Bool)

(declare-fun res!943360 () Bool)

(assert (=> b!1405141 (=> (not res!943360) (not e!795428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96067 (_ BitVec 32)) Bool)

(assert (=> b!1405141 (= res!943360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405142 () Bool)

(declare-fun res!943356 () Bool)

(assert (=> b!1405142 (=> (not res!943356) (not e!795428))))

(assert (=> b!1405142 (= res!943356 (validKeyInArray!0 (select (arr!46381 a!2901) j!112)))))

(declare-fun b!1405143 () Bool)

(assert (=> b!1405143 (= e!795428 (not true))))

(assert (=> b!1405143 e!795426))

(declare-fun res!943357 () Bool)

(assert (=> b!1405143 (=> (not res!943357) (not e!795426))))

(assert (=> b!1405143 (= res!943357 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47358 0))(
  ( (Unit!47359) )
))
(declare-fun lt!618941 () Unit!47358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47358)

(assert (=> b!1405143 (= lt!618941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618942 () SeekEntryResult!10692)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96067 (_ BitVec 32)) SeekEntryResult!10692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405143 (= lt!618942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46381 a!2901) j!112) mask!2840) (select (arr!46381 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405137 () Bool)

(declare-fun res!943359 () Bool)

(assert (=> b!1405137 (=> (not res!943359) (not e!795428))))

(declare-datatypes ((List!32900 0))(
  ( (Nil!32897) (Cons!32896 (h!34150 (_ BitVec 64)) (t!47594 List!32900)) )
))
(declare-fun arrayNoDuplicates!0 (array!96067 (_ BitVec 32) List!32900) Bool)

(assert (=> b!1405137 (= res!943359 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32897))))

(declare-fun res!943358 () Bool)

(assert (=> start!120760 (=> (not res!943358) (not e!795428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120760 (= res!943358 (validMask!0 mask!2840))))

(assert (=> start!120760 e!795428))

(assert (=> start!120760 true))

(declare-fun array_inv!35409 (array!96067) Bool)

(assert (=> start!120760 (array_inv!35409 a!2901)))

(assert (= (and start!120760 res!943358) b!1405139))

(assert (= (and b!1405139 res!943354) b!1405140))

(assert (= (and b!1405140 res!943355) b!1405142))

(assert (= (and b!1405142 res!943356) b!1405141))

(assert (= (and b!1405141 res!943360) b!1405137))

(assert (= (and b!1405137 res!943359) b!1405143))

(assert (= (and b!1405143 res!943357) b!1405138))

(declare-fun m!1293847 () Bool)

(assert (=> b!1405137 m!1293847))

(declare-fun m!1293849 () Bool)

(assert (=> b!1405142 m!1293849))

(assert (=> b!1405142 m!1293849))

(declare-fun m!1293851 () Bool)

(assert (=> b!1405142 m!1293851))

(declare-fun m!1293853 () Bool)

(assert (=> b!1405140 m!1293853))

(assert (=> b!1405140 m!1293853))

(declare-fun m!1293855 () Bool)

(assert (=> b!1405140 m!1293855))

(assert (=> b!1405138 m!1293849))

(assert (=> b!1405138 m!1293849))

(declare-fun m!1293857 () Bool)

(assert (=> b!1405138 m!1293857))

(declare-fun m!1293859 () Bool)

(assert (=> start!120760 m!1293859))

(declare-fun m!1293861 () Bool)

(assert (=> start!120760 m!1293861))

(declare-fun m!1293863 () Bool)

(assert (=> b!1405141 m!1293863))

(assert (=> b!1405143 m!1293849))

(declare-fun m!1293865 () Bool)

(assert (=> b!1405143 m!1293865))

(assert (=> b!1405143 m!1293849))

(declare-fun m!1293867 () Bool)

(assert (=> b!1405143 m!1293867))

(assert (=> b!1405143 m!1293865))

(assert (=> b!1405143 m!1293849))

(declare-fun m!1293869 () Bool)

(assert (=> b!1405143 m!1293869))

(declare-fun m!1293871 () Bool)

(assert (=> b!1405143 m!1293871))

(push 1)

(assert (not b!1405137))

(assert (not start!120760))

(assert (not b!1405138))

(assert (not b!1405140))

(assert (not b!1405141))

(assert (not b!1405143))

(assert (not b!1405142))

(check-sat)

(pop 1)

(push 1)

