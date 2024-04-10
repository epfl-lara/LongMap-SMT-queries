; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120778 () Bool)

(assert start!120778)

(declare-fun b!1405326 () Bool)

(declare-fun res!943548 () Bool)

(declare-fun e!795507 () Bool)

(assert (=> b!1405326 (=> (not res!943548) (not e!795507))))

(declare-datatypes ((array!96085 0))(
  ( (array!96086 (arr!46390 (Array (_ BitVec 32) (_ BitVec 64))) (size!46940 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96085)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405326 (= res!943548 (validKeyInArray!0 (select (arr!46390 a!2901) i!1037)))))

(declare-fun b!1405327 () Bool)

(declare-fun res!943544 () Bool)

(assert (=> b!1405327 (=> (not res!943544) (not e!795507))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405327 (= res!943544 (and (= (size!46940 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46940 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46940 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405328 () Bool)

(assert (=> b!1405328 (= e!795507 (not true))))

(declare-fun e!795509 () Bool)

(assert (=> b!1405328 e!795509))

(declare-fun res!943547 () Bool)

(assert (=> b!1405328 (=> (not res!943547) (not e!795509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96085 (_ BitVec 32)) Bool)

(assert (=> b!1405328 (= res!943547 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47376 0))(
  ( (Unit!47377) )
))
(declare-fun lt!618995 () Unit!47376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47376)

(assert (=> b!1405328 (= lt!618995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10701 0))(
  ( (MissingZero!10701 (index!45181 (_ BitVec 32))) (Found!10701 (index!45182 (_ BitVec 32))) (Intermediate!10701 (undefined!11513 Bool) (index!45183 (_ BitVec 32)) (x!126796 (_ BitVec 32))) (Undefined!10701) (MissingVacant!10701 (index!45184 (_ BitVec 32))) )
))
(declare-fun lt!618996 () SeekEntryResult!10701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96085 (_ BitVec 32)) SeekEntryResult!10701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405328 (= lt!618996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46390 a!2901) j!112) mask!2840) (select (arr!46390 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405329 () Bool)

(declare-fun res!943545 () Bool)

(assert (=> b!1405329 (=> (not res!943545) (not e!795507))))

(assert (=> b!1405329 (= res!943545 (validKeyInArray!0 (select (arr!46390 a!2901) j!112)))))

(declare-fun b!1405330 () Bool)

(declare-fun res!943549 () Bool)

(assert (=> b!1405330 (=> (not res!943549) (not e!795507))))

(declare-datatypes ((List!32909 0))(
  ( (Nil!32906) (Cons!32905 (h!34159 (_ BitVec 64)) (t!47603 List!32909)) )
))
(declare-fun arrayNoDuplicates!0 (array!96085 (_ BitVec 32) List!32909) Bool)

(assert (=> b!1405330 (= res!943549 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32906))))

(declare-fun res!943546 () Bool)

(assert (=> start!120778 (=> (not res!943546) (not e!795507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120778 (= res!943546 (validMask!0 mask!2840))))

(assert (=> start!120778 e!795507))

(assert (=> start!120778 true))

(declare-fun array_inv!35418 (array!96085) Bool)

(assert (=> start!120778 (array_inv!35418 a!2901)))

(declare-fun b!1405331 () Bool)

(declare-fun res!943543 () Bool)

(assert (=> b!1405331 (=> (not res!943543) (not e!795507))))

(assert (=> b!1405331 (= res!943543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405332 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96085 (_ BitVec 32)) SeekEntryResult!10701)

(assert (=> b!1405332 (= e!795509 (= (seekEntryOrOpen!0 (select (arr!46390 a!2901) j!112) a!2901 mask!2840) (Found!10701 j!112)))))

(assert (= (and start!120778 res!943546) b!1405327))

(assert (= (and b!1405327 res!943544) b!1405326))

(assert (= (and b!1405326 res!943548) b!1405329))

(assert (= (and b!1405329 res!943545) b!1405331))

(assert (= (and b!1405331 res!943543) b!1405330))

(assert (= (and b!1405330 res!943549) b!1405328))

(assert (= (and b!1405328 res!943547) b!1405332))

(declare-fun m!1294081 () Bool)

(assert (=> b!1405331 m!1294081))

(declare-fun m!1294083 () Bool)

(assert (=> b!1405328 m!1294083))

(declare-fun m!1294085 () Bool)

(assert (=> b!1405328 m!1294085))

(assert (=> b!1405328 m!1294083))

(declare-fun m!1294087 () Bool)

(assert (=> b!1405328 m!1294087))

(assert (=> b!1405328 m!1294085))

(assert (=> b!1405328 m!1294083))

(declare-fun m!1294089 () Bool)

(assert (=> b!1405328 m!1294089))

(declare-fun m!1294091 () Bool)

(assert (=> b!1405328 m!1294091))

(declare-fun m!1294093 () Bool)

(assert (=> start!120778 m!1294093))

(declare-fun m!1294095 () Bool)

(assert (=> start!120778 m!1294095))

(assert (=> b!1405329 m!1294083))

(assert (=> b!1405329 m!1294083))

(declare-fun m!1294097 () Bool)

(assert (=> b!1405329 m!1294097))

(assert (=> b!1405332 m!1294083))

(assert (=> b!1405332 m!1294083))

(declare-fun m!1294099 () Bool)

(assert (=> b!1405332 m!1294099))

(declare-fun m!1294101 () Bool)

(assert (=> b!1405326 m!1294101))

(assert (=> b!1405326 m!1294101))

(declare-fun m!1294103 () Bool)

(assert (=> b!1405326 m!1294103))

(declare-fun m!1294105 () Bool)

(assert (=> b!1405330 m!1294105))

(push 1)

(assert (not start!120778))

(assert (not b!1405330))

(assert (not b!1405332))

(assert (not b!1405328))

(assert (not b!1405329))

(assert (not b!1405326))

(assert (not b!1405331))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

