; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120758 () Bool)

(assert start!120758)

(declare-fun b!1405077 () Bool)

(declare-fun e!795398 () Bool)

(assert (=> b!1405077 (= e!795398 (not true))))

(declare-fun e!795397 () Bool)

(assert (=> b!1405077 e!795397))

(declare-fun res!943347 () Bool)

(assert (=> b!1405077 (=> (not res!943347) (not e!795397))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96018 0))(
  ( (array!96019 (arr!46357 (Array (_ BitVec 32) (_ BitVec 64))) (size!46909 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96018)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96018 (_ BitVec 32)) Bool)

(assert (=> b!1405077 (= res!943347 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47205 0))(
  ( (Unit!47206) )
))
(declare-fun lt!618758 () Unit!47205)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47205)

(assert (=> b!1405077 (= lt!618758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10694 0))(
  ( (MissingZero!10694 (index!45153 (_ BitVec 32))) (Found!10694 (index!45154 (_ BitVec 32))) (Intermediate!10694 (undefined!11506 Bool) (index!45155 (_ BitVec 32)) (x!126770 (_ BitVec 32))) (Undefined!10694) (MissingVacant!10694 (index!45156 (_ BitVec 32))) )
))
(declare-fun lt!618757 () SeekEntryResult!10694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96018 (_ BitVec 32)) SeekEntryResult!10694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405077 (= lt!618757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46357 a!2901) j!112) mask!2840) (select (arr!46357 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405078 () Bool)

(declare-fun res!943351 () Bool)

(assert (=> b!1405078 (=> (not res!943351) (not e!795398))))

(assert (=> b!1405078 (= res!943351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943346 () Bool)

(assert (=> start!120758 (=> (not res!943346) (not e!795398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120758 (= res!943346 (validMask!0 mask!2840))))

(assert (=> start!120758 e!795398))

(assert (=> start!120758 true))

(declare-fun array_inv!35590 (array!96018) Bool)

(assert (=> start!120758 (array_inv!35590 a!2901)))

(declare-fun b!1405079 () Bool)

(declare-fun res!943349 () Bool)

(assert (=> b!1405079 (=> (not res!943349) (not e!795398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405079 (= res!943349 (validKeyInArray!0 (select (arr!46357 a!2901) j!112)))))

(declare-fun b!1405080 () Bool)

(declare-fun res!943350 () Bool)

(assert (=> b!1405080 (=> (not res!943350) (not e!795398))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405080 (= res!943350 (and (= (size!46909 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46909 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46909 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96018 (_ BitVec 32)) SeekEntryResult!10694)

(assert (=> b!1405081 (= e!795397 (= (seekEntryOrOpen!0 (select (arr!46357 a!2901) j!112) a!2901 mask!2840) (Found!10694 j!112)))))

(declare-fun b!1405082 () Bool)

(declare-fun res!943345 () Bool)

(assert (=> b!1405082 (=> (not res!943345) (not e!795398))))

(assert (=> b!1405082 (= res!943345 (validKeyInArray!0 (select (arr!46357 a!2901) i!1037)))))

(declare-fun b!1405083 () Bool)

(declare-fun res!943348 () Bool)

(assert (=> b!1405083 (=> (not res!943348) (not e!795398))))

(declare-datatypes ((List!32954 0))(
  ( (Nil!32951) (Cons!32950 (h!34204 (_ BitVec 64)) (t!47640 List!32954)) )
))
(declare-fun arrayNoDuplicates!0 (array!96018 (_ BitVec 32) List!32954) Bool)

(assert (=> b!1405083 (= res!943348 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32951))))

(assert (= (and start!120758 res!943346) b!1405080))

(assert (= (and b!1405080 res!943350) b!1405082))

(assert (= (and b!1405082 res!943345) b!1405079))

(assert (= (and b!1405079 res!943349) b!1405078))

(assert (= (and b!1405078 res!943351) b!1405083))

(assert (= (and b!1405083 res!943348) b!1405077))

(assert (= (and b!1405077 res!943347) b!1405081))

(declare-fun m!1293337 () Bool)

(assert (=> b!1405082 m!1293337))

(assert (=> b!1405082 m!1293337))

(declare-fun m!1293339 () Bool)

(assert (=> b!1405082 m!1293339))

(declare-fun m!1293341 () Bool)

(assert (=> b!1405081 m!1293341))

(assert (=> b!1405081 m!1293341))

(declare-fun m!1293343 () Bool)

(assert (=> b!1405081 m!1293343))

(declare-fun m!1293345 () Bool)

(assert (=> start!120758 m!1293345))

(declare-fun m!1293347 () Bool)

(assert (=> start!120758 m!1293347))

(declare-fun m!1293349 () Bool)

(assert (=> b!1405078 m!1293349))

(declare-fun m!1293351 () Bool)

(assert (=> b!1405083 m!1293351))

(assert (=> b!1405079 m!1293341))

(assert (=> b!1405079 m!1293341))

(declare-fun m!1293353 () Bool)

(assert (=> b!1405079 m!1293353))

(assert (=> b!1405077 m!1293341))

(declare-fun m!1293355 () Bool)

(assert (=> b!1405077 m!1293355))

(assert (=> b!1405077 m!1293341))

(declare-fun m!1293357 () Bool)

(assert (=> b!1405077 m!1293357))

(assert (=> b!1405077 m!1293355))

(assert (=> b!1405077 m!1293341))

(declare-fun m!1293359 () Bool)

(assert (=> b!1405077 m!1293359))

(declare-fun m!1293361 () Bool)

(assert (=> b!1405077 m!1293361))

(check-sat (not b!1405082) (not b!1405077) (not b!1405083) (not start!120758) (not b!1405081) (not b!1405079) (not b!1405078))
(check-sat)
