; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120604 () Bool)

(assert start!120604)

(declare-fun b!1404223 () Bool)

(declare-fun res!942735 () Bool)

(declare-fun e!794968 () Bool)

(assert (=> b!1404223 (=> (not res!942735) (not e!794968))))

(declare-datatypes ((array!96013 0))(
  ( (array!96014 (arr!46357 (Array (_ BitVec 32) (_ BitVec 64))) (size!46907 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96013)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404223 (= res!942735 (validKeyInArray!0 (select (arr!46357 a!2901) i!1037)))))

(declare-fun b!1404224 () Bool)

(declare-fun res!942739 () Bool)

(assert (=> b!1404224 (=> (not res!942739) (not e!794968))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96013 (_ BitVec 32)) Bool)

(assert (=> b!1404224 (= res!942739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404225 () Bool)

(declare-fun res!942734 () Bool)

(assert (=> b!1404225 (=> (not res!942734) (not e!794968))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404225 (= res!942734 (validKeyInArray!0 (select (arr!46357 a!2901) j!112)))))

(declare-fun b!1404226 () Bool)

(declare-fun res!942738 () Bool)

(assert (=> b!1404226 (=> (not res!942738) (not e!794968))))

(declare-datatypes ((List!32876 0))(
  ( (Nil!32873) (Cons!32872 (h!34120 (_ BitVec 64)) (t!47570 List!32876)) )
))
(declare-fun arrayNoDuplicates!0 (array!96013 (_ BitVec 32) List!32876) Bool)

(assert (=> b!1404226 (= res!942738 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32873))))

(declare-fun res!942736 () Bool)

(assert (=> start!120604 (=> (not res!942736) (not e!794968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120604 (= res!942736 (validMask!0 mask!2840))))

(assert (=> start!120604 e!794968))

(assert (=> start!120604 true))

(declare-fun array_inv!35385 (array!96013) Bool)

(assert (=> start!120604 (array_inv!35385 a!2901)))

(declare-fun b!1404227 () Bool)

(declare-fun res!942737 () Bool)

(assert (=> b!1404227 (=> (not res!942737) (not e!794968))))

(assert (=> b!1404227 (= res!942737 (and (= (size!46907 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46907 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46907 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404228 () Bool)

(assert (=> b!1404228 (= e!794968 false)))

(declare-datatypes ((SeekEntryResult!10668 0))(
  ( (MissingZero!10668 (index!45049 (_ BitVec 32))) (Found!10668 (index!45050 (_ BitVec 32))) (Intermediate!10668 (undefined!11480 Bool) (index!45051 (_ BitVec 32)) (x!126663 (_ BitVec 32))) (Undefined!10668) (MissingVacant!10668 (index!45052 (_ BitVec 32))) )
))
(declare-fun lt!618609 () SeekEntryResult!10668)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96013 (_ BitVec 32)) SeekEntryResult!10668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404228 (= lt!618609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46357 a!2901) j!112) mask!2840) (select (arr!46357 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120604 res!942736) b!1404227))

(assert (= (and b!1404227 res!942737) b!1404223))

(assert (= (and b!1404223 res!942735) b!1404225))

(assert (= (and b!1404225 res!942734) b!1404224))

(assert (= (and b!1404224 res!942739) b!1404226))

(assert (= (and b!1404226 res!942738) b!1404228))

(declare-fun m!1293037 () Bool)

(assert (=> b!1404223 m!1293037))

(assert (=> b!1404223 m!1293037))

(declare-fun m!1293039 () Bool)

(assert (=> b!1404223 m!1293039))

(declare-fun m!1293041 () Bool)

(assert (=> b!1404224 m!1293041))

(declare-fun m!1293043 () Bool)

(assert (=> b!1404226 m!1293043))

(declare-fun m!1293045 () Bool)

(assert (=> start!120604 m!1293045))

(declare-fun m!1293047 () Bool)

(assert (=> start!120604 m!1293047))

(declare-fun m!1293049 () Bool)

(assert (=> b!1404225 m!1293049))

(assert (=> b!1404225 m!1293049))

(declare-fun m!1293051 () Bool)

(assert (=> b!1404225 m!1293051))

(assert (=> b!1404228 m!1293049))

(assert (=> b!1404228 m!1293049))

(declare-fun m!1293053 () Bool)

(assert (=> b!1404228 m!1293053))

(assert (=> b!1404228 m!1293053))

(assert (=> b!1404228 m!1293049))

(declare-fun m!1293055 () Bool)

(assert (=> b!1404228 m!1293055))

(push 1)

(assert (not b!1404225))

(assert (not b!1404228))

(assert (not b!1404223))

(assert (not start!120604))

(assert (not b!1404224))

(assert (not b!1404226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

