; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121194 () Bool)

(assert start!121194)

(declare-fun b!1409174 () Bool)

(declare-fun res!946902 () Bool)

(declare-fun e!797462 () Bool)

(assert (=> b!1409174 (=> (not res!946902) (not e!797462))))

(declare-datatypes ((array!96348 0))(
  ( (array!96349 (arr!46517 (Array (_ BitVec 32) (_ BitVec 64))) (size!47067 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96348)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409174 (= res!946902 (validKeyInArray!0 (select (arr!46517 a!2901) j!112)))))

(declare-fun b!1409175 () Bool)

(declare-fun res!946898 () Bool)

(assert (=> b!1409175 (=> (not res!946898) (not e!797462))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409175 (= res!946898 (and (= (size!47067 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47067 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47067 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409176 () Bool)

(declare-fun e!797465 () Bool)

(assert (=> b!1409176 (= e!797462 (not e!797465))))

(declare-fun res!946903 () Bool)

(assert (=> b!1409176 (=> res!946903 e!797465)))

(declare-datatypes ((SeekEntryResult!10828 0))(
  ( (MissingZero!10828 (index!45689 (_ BitVec 32))) (Found!10828 (index!45690 (_ BitVec 32))) (Intermediate!10828 (undefined!11640 Bool) (index!45691 (_ BitVec 32)) (x!127285 (_ BitVec 32))) (Undefined!10828) (MissingVacant!10828 (index!45692 (_ BitVec 32))) )
))
(declare-fun lt!620623 () SeekEntryResult!10828)

(assert (=> b!1409176 (= res!946903 (or (not (is-Intermediate!10828 lt!620623)) (undefined!11640 lt!620623)))))

(declare-fun e!797464 () Bool)

(assert (=> b!1409176 e!797464))

(declare-fun res!946900 () Bool)

(assert (=> b!1409176 (=> (not res!946900) (not e!797464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96348 (_ BitVec 32)) Bool)

(assert (=> b!1409176 (= res!946900 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47630 0))(
  ( (Unit!47631) )
))
(declare-fun lt!620624 () Unit!47630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47630)

(assert (=> b!1409176 (= lt!620624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96348 (_ BitVec 32)) SeekEntryResult!10828)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409176 (= lt!620623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46517 a!2901) j!112) mask!2840) (select (arr!46517 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409177 () Bool)

(declare-fun res!946897 () Bool)

(assert (=> b!1409177 (=> (not res!946897) (not e!797462))))

(declare-datatypes ((List!33036 0))(
  ( (Nil!33033) (Cons!33032 (h!34295 (_ BitVec 64)) (t!47730 List!33036)) )
))
(declare-fun arrayNoDuplicates!0 (array!96348 (_ BitVec 32) List!33036) Bool)

(assert (=> b!1409177 (= res!946897 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33033))))

(declare-fun b!1409178 () Bool)

(declare-fun res!946899 () Bool)

(assert (=> b!1409178 (=> (not res!946899) (not e!797462))))

(assert (=> b!1409178 (= res!946899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409179 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96348 (_ BitVec 32)) SeekEntryResult!10828)

(assert (=> b!1409179 (= e!797464 (= (seekEntryOrOpen!0 (select (arr!46517 a!2901) j!112) a!2901 mask!2840) (Found!10828 j!112)))))

(declare-fun res!946901 () Bool)

(assert (=> start!121194 (=> (not res!946901) (not e!797462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121194 (= res!946901 (validMask!0 mask!2840))))

(assert (=> start!121194 e!797462))

(assert (=> start!121194 true))

(declare-fun array_inv!35545 (array!96348) Bool)

(assert (=> start!121194 (array_inv!35545 a!2901)))

(declare-fun b!1409180 () Bool)

(assert (=> b!1409180 (= e!797465 true)))

(declare-fun lt!620625 () SeekEntryResult!10828)

(assert (=> b!1409180 (= lt!620625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46517 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46517 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96349 (store (arr!46517 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47067 a!2901)) mask!2840))))

(declare-fun b!1409181 () Bool)

(declare-fun res!946896 () Bool)

(assert (=> b!1409181 (=> (not res!946896) (not e!797462))))

(assert (=> b!1409181 (= res!946896 (validKeyInArray!0 (select (arr!46517 a!2901) i!1037)))))

(assert (= (and start!121194 res!946901) b!1409175))

(assert (= (and b!1409175 res!946898) b!1409181))

(assert (= (and b!1409181 res!946896) b!1409174))

(assert (= (and b!1409174 res!946902) b!1409178))

(assert (= (and b!1409178 res!946899) b!1409177))

(assert (= (and b!1409177 res!946897) b!1409176))

(assert (= (and b!1409176 res!946900) b!1409179))

(assert (= (and b!1409176 (not res!946903)) b!1409180))

(declare-fun m!1298781 () Bool)

(assert (=> start!121194 m!1298781))

(declare-fun m!1298783 () Bool)

(assert (=> start!121194 m!1298783))

(declare-fun m!1298785 () Bool)

(assert (=> b!1409181 m!1298785))

(assert (=> b!1409181 m!1298785))

(declare-fun m!1298787 () Bool)

(assert (=> b!1409181 m!1298787))

(declare-fun m!1298789 () Bool)

(assert (=> b!1409177 m!1298789))

(declare-fun m!1298791 () Bool)

(assert (=> b!1409180 m!1298791))

(declare-fun m!1298793 () Bool)

(assert (=> b!1409180 m!1298793))

(assert (=> b!1409180 m!1298793))

(declare-fun m!1298795 () Bool)

(assert (=> b!1409180 m!1298795))

(assert (=> b!1409180 m!1298795))

(assert (=> b!1409180 m!1298793))

(declare-fun m!1298797 () Bool)

(assert (=> b!1409180 m!1298797))

(declare-fun m!1298799 () Bool)

(assert (=> b!1409179 m!1298799))

(assert (=> b!1409179 m!1298799))

(declare-fun m!1298801 () Bool)

(assert (=> b!1409179 m!1298801))

(assert (=> b!1409174 m!1298799))

(assert (=> b!1409174 m!1298799))

(declare-fun m!1298803 () Bool)

(assert (=> b!1409174 m!1298803))

(declare-fun m!1298805 () Bool)

(assert (=> b!1409178 m!1298805))

(assert (=> b!1409176 m!1298799))

(declare-fun m!1298807 () Bool)

(assert (=> b!1409176 m!1298807))

(assert (=> b!1409176 m!1298799))

(declare-fun m!1298809 () Bool)

(assert (=> b!1409176 m!1298809))

(assert (=> b!1409176 m!1298807))

(assert (=> b!1409176 m!1298799))

(declare-fun m!1298811 () Bool)

(assert (=> b!1409176 m!1298811))

(declare-fun m!1298813 () Bool)

(assert (=> b!1409176 m!1298813))

(push 1)

(assert (not start!121194))

(assert (not b!1409179))

(assert (not b!1409180))

(assert (not b!1409177))

(assert (not b!1409176))

(assert (not b!1409181))

(assert (not b!1409174))

(assert (not b!1409178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

