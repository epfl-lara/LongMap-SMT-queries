; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120776 () Bool)

(assert start!120776)

(declare-fun b!1405305 () Bool)

(declare-fun res!943526 () Bool)

(declare-fun e!795498 () Bool)

(assert (=> b!1405305 (=> (not res!943526) (not e!795498))))

(declare-datatypes ((array!96083 0))(
  ( (array!96084 (arr!46389 (Array (_ BitVec 32) (_ BitVec 64))) (size!46939 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96083)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405305 (= res!943526 (validKeyInArray!0 (select (arr!46389 a!2901) j!112)))))

(declare-fun b!1405306 () Bool)

(declare-fun res!943522 () Bool)

(assert (=> b!1405306 (=> (not res!943522) (not e!795498))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96083 (_ BitVec 32)) Bool)

(assert (=> b!1405306 (= res!943522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405307 () Bool)

(declare-fun res!943528 () Bool)

(assert (=> b!1405307 (=> (not res!943528) (not e!795498))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405307 (= res!943528 (validKeyInArray!0 (select (arr!46389 a!2901) i!1037)))))

(declare-fun res!943525 () Bool)

(assert (=> start!120776 (=> (not res!943525) (not e!795498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120776 (= res!943525 (validMask!0 mask!2840))))

(assert (=> start!120776 e!795498))

(assert (=> start!120776 true))

(declare-fun array_inv!35417 (array!96083) Bool)

(assert (=> start!120776 (array_inv!35417 a!2901)))

(declare-fun b!1405308 () Bool)

(declare-fun e!795499 () Bool)

(declare-datatypes ((SeekEntryResult!10700 0))(
  ( (MissingZero!10700 (index!45177 (_ BitVec 32))) (Found!10700 (index!45178 (_ BitVec 32))) (Intermediate!10700 (undefined!11512 Bool) (index!45179 (_ BitVec 32)) (x!126795 (_ BitVec 32))) (Undefined!10700) (MissingVacant!10700 (index!45180 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96083 (_ BitVec 32)) SeekEntryResult!10700)

(assert (=> b!1405308 (= e!795499 (= (seekEntryOrOpen!0 (select (arr!46389 a!2901) j!112) a!2901 mask!2840) (Found!10700 j!112)))))

(declare-fun b!1405309 () Bool)

(declare-fun res!943527 () Bool)

(assert (=> b!1405309 (=> (not res!943527) (not e!795498))))

(assert (=> b!1405309 (= res!943527 (and (= (size!46939 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46939 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46939 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405310 () Bool)

(assert (=> b!1405310 (= e!795498 (not true))))

(assert (=> b!1405310 e!795499))

(declare-fun res!943523 () Bool)

(assert (=> b!1405310 (=> (not res!943523) (not e!795499))))

(assert (=> b!1405310 (= res!943523 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47374 0))(
  ( (Unit!47375) )
))
(declare-fun lt!618990 () Unit!47374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47374)

(assert (=> b!1405310 (= lt!618990 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618989 () SeekEntryResult!10700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96083 (_ BitVec 32)) SeekEntryResult!10700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405310 (= lt!618989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46389 a!2901) j!112) mask!2840) (select (arr!46389 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405311 () Bool)

(declare-fun res!943524 () Bool)

(assert (=> b!1405311 (=> (not res!943524) (not e!795498))))

(declare-datatypes ((List!32908 0))(
  ( (Nil!32905) (Cons!32904 (h!34158 (_ BitVec 64)) (t!47602 List!32908)) )
))
(declare-fun arrayNoDuplicates!0 (array!96083 (_ BitVec 32) List!32908) Bool)

(assert (=> b!1405311 (= res!943524 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32905))))

(assert (= (and start!120776 res!943525) b!1405309))

(assert (= (and b!1405309 res!943527) b!1405307))

(assert (= (and b!1405307 res!943528) b!1405305))

(assert (= (and b!1405305 res!943526) b!1405306))

(assert (= (and b!1405306 res!943522) b!1405311))

(assert (= (and b!1405311 res!943524) b!1405310))

(assert (= (and b!1405310 res!943523) b!1405308))

(declare-fun m!1294055 () Bool)

(assert (=> b!1405308 m!1294055))

(assert (=> b!1405308 m!1294055))

(declare-fun m!1294057 () Bool)

(assert (=> b!1405308 m!1294057))

(declare-fun m!1294059 () Bool)

(assert (=> b!1405306 m!1294059))

(assert (=> b!1405305 m!1294055))

(assert (=> b!1405305 m!1294055))

(declare-fun m!1294061 () Bool)

(assert (=> b!1405305 m!1294061))

(assert (=> b!1405310 m!1294055))

(declare-fun m!1294063 () Bool)

(assert (=> b!1405310 m!1294063))

(assert (=> b!1405310 m!1294055))

(declare-fun m!1294065 () Bool)

(assert (=> b!1405310 m!1294065))

(assert (=> b!1405310 m!1294063))

(assert (=> b!1405310 m!1294055))

(declare-fun m!1294067 () Bool)

(assert (=> b!1405310 m!1294067))

(declare-fun m!1294069 () Bool)

(assert (=> b!1405310 m!1294069))

(declare-fun m!1294071 () Bool)

(assert (=> b!1405311 m!1294071))

(declare-fun m!1294073 () Bool)

(assert (=> start!120776 m!1294073))

(declare-fun m!1294075 () Bool)

(assert (=> start!120776 m!1294075))

(declare-fun m!1294077 () Bool)

(assert (=> b!1405307 m!1294077))

(assert (=> b!1405307 m!1294077))

(declare-fun m!1294079 () Bool)

(assert (=> b!1405307 m!1294079))

(check-sat (not b!1405305) (not b!1405308) (not b!1405307) (not b!1405310) (not b!1405311) (not start!120776) (not b!1405306))
