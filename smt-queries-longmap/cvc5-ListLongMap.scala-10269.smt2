; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120774 () Bool)

(assert start!120774)

(declare-fun b!1405284 () Bool)

(declare-fun res!943503 () Bool)

(declare-fun e!795489 () Bool)

(assert (=> b!1405284 (=> (not res!943503) (not e!795489))))

(declare-datatypes ((array!96081 0))(
  ( (array!96082 (arr!46388 (Array (_ BitVec 32) (_ BitVec 64))) (size!46938 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96081)

(declare-datatypes ((List!32907 0))(
  ( (Nil!32904) (Cons!32903 (h!34157 (_ BitVec 64)) (t!47601 List!32907)) )
))
(declare-fun arrayNoDuplicates!0 (array!96081 (_ BitVec 32) List!32907) Bool)

(assert (=> b!1405284 (= res!943503 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32904))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795490 () Bool)

(declare-fun b!1405285 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10699 0))(
  ( (MissingZero!10699 (index!45173 (_ BitVec 32))) (Found!10699 (index!45174 (_ BitVec 32))) (Intermediate!10699 (undefined!11511 Bool) (index!45175 (_ BitVec 32)) (x!126794 (_ BitVec 32))) (Undefined!10699) (MissingVacant!10699 (index!45176 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96081 (_ BitVec 32)) SeekEntryResult!10699)

(assert (=> b!1405285 (= e!795490 (= (seekEntryOrOpen!0 (select (arr!46388 a!2901) j!112) a!2901 mask!2840) (Found!10699 j!112)))))

(declare-fun b!1405286 () Bool)

(declare-fun res!943507 () Bool)

(assert (=> b!1405286 (=> (not res!943507) (not e!795489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96081 (_ BitVec 32)) Bool)

(assert (=> b!1405286 (= res!943507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405287 () Bool)

(assert (=> b!1405287 (= e!795489 (not true))))

(assert (=> b!1405287 e!795490))

(declare-fun res!943506 () Bool)

(assert (=> b!1405287 (=> (not res!943506) (not e!795490))))

(assert (=> b!1405287 (= res!943506 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47372 0))(
  ( (Unit!47373) )
))
(declare-fun lt!618983 () Unit!47372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47372)

(assert (=> b!1405287 (= lt!618983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618984 () SeekEntryResult!10699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96081 (_ BitVec 32)) SeekEntryResult!10699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405287 (= lt!618984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46388 a!2901) j!112) mask!2840) (select (arr!46388 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943504 () Bool)

(assert (=> start!120774 (=> (not res!943504) (not e!795489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120774 (= res!943504 (validMask!0 mask!2840))))

(assert (=> start!120774 e!795489))

(assert (=> start!120774 true))

(declare-fun array_inv!35416 (array!96081) Bool)

(assert (=> start!120774 (array_inv!35416 a!2901)))

(declare-fun b!1405288 () Bool)

(declare-fun res!943501 () Bool)

(assert (=> b!1405288 (=> (not res!943501) (not e!795489))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405288 (= res!943501 (and (= (size!46938 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46938 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46938 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405289 () Bool)

(declare-fun res!943502 () Bool)

(assert (=> b!1405289 (=> (not res!943502) (not e!795489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405289 (= res!943502 (validKeyInArray!0 (select (arr!46388 a!2901) i!1037)))))

(declare-fun b!1405290 () Bool)

(declare-fun res!943505 () Bool)

(assert (=> b!1405290 (=> (not res!943505) (not e!795489))))

(assert (=> b!1405290 (= res!943505 (validKeyInArray!0 (select (arr!46388 a!2901) j!112)))))

(assert (= (and start!120774 res!943504) b!1405288))

(assert (= (and b!1405288 res!943501) b!1405289))

(assert (= (and b!1405289 res!943502) b!1405290))

(assert (= (and b!1405290 res!943505) b!1405286))

(assert (= (and b!1405286 res!943507) b!1405284))

(assert (= (and b!1405284 res!943503) b!1405287))

(assert (= (and b!1405287 res!943506) b!1405285))

(declare-fun m!1294029 () Bool)

(assert (=> b!1405285 m!1294029))

(assert (=> b!1405285 m!1294029))

(declare-fun m!1294031 () Bool)

(assert (=> b!1405285 m!1294031))

(assert (=> b!1405290 m!1294029))

(assert (=> b!1405290 m!1294029))

(declare-fun m!1294033 () Bool)

(assert (=> b!1405290 m!1294033))

(declare-fun m!1294035 () Bool)

(assert (=> b!1405289 m!1294035))

(assert (=> b!1405289 m!1294035))

(declare-fun m!1294037 () Bool)

(assert (=> b!1405289 m!1294037))

(declare-fun m!1294039 () Bool)

(assert (=> b!1405284 m!1294039))

(declare-fun m!1294041 () Bool)

(assert (=> b!1405286 m!1294041))

(declare-fun m!1294043 () Bool)

(assert (=> start!120774 m!1294043))

(declare-fun m!1294045 () Bool)

(assert (=> start!120774 m!1294045))

(assert (=> b!1405287 m!1294029))

(declare-fun m!1294047 () Bool)

(assert (=> b!1405287 m!1294047))

(assert (=> b!1405287 m!1294029))

(declare-fun m!1294049 () Bool)

(assert (=> b!1405287 m!1294049))

(assert (=> b!1405287 m!1294047))

(assert (=> b!1405287 m!1294029))

(declare-fun m!1294051 () Bool)

(assert (=> b!1405287 m!1294051))

(declare-fun m!1294053 () Bool)

(assert (=> b!1405287 m!1294053))

(push 1)

(assert (not b!1405290))

(assert (not start!120774))

(assert (not b!1405287))

(assert (not b!1405284))

(assert (not b!1405285))

(assert (not b!1405286))

(assert (not b!1405289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

