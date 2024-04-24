; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119364 () Bool)

(assert start!119364)

(declare-fun b!1391364 () Bool)

(declare-fun res!930841 () Bool)

(declare-fun e!788066 () Bool)

(assert (=> b!1391364 (=> (not res!930841) (not e!788066))))

(declare-datatypes ((array!95223 0))(
  ( (array!95224 (arr!45975 (Array (_ BitVec 32) (_ BitVec 64))) (size!46526 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95223)

(declare-datatypes ((List!32481 0))(
  ( (Nil!32478) (Cons!32477 (h!33703 (_ BitVec 64)) (t!47167 List!32481)) )
))
(declare-fun arrayNoDuplicates!0 (array!95223 (_ BitVec 32) List!32481) Bool)

(assert (=> b!1391364 (= res!930841 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32478))))

(declare-fun b!1391365 () Bool)

(assert (=> b!1391365 (= e!788066 (not true))))

(declare-fun e!788065 () Bool)

(assert (=> b!1391365 e!788065))

(declare-fun res!930844 () Bool)

(assert (=> b!1391365 (=> (not res!930844) (not e!788065))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95223 (_ BitVec 32)) Bool)

(assert (=> b!1391365 (= res!930844 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46421 0))(
  ( (Unit!46422) )
))
(declare-fun lt!611161 () Unit!46421)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46421)

(assert (=> b!1391365 (= lt!611161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10195 0))(
  ( (MissingZero!10195 (index!43151 (_ BitVec 32))) (Found!10195 (index!43152 (_ BitVec 32))) (Intermediate!10195 (undefined!11007 Bool) (index!43153 (_ BitVec 32)) (x!124980 (_ BitVec 32))) (Undefined!10195) (MissingVacant!10195 (index!43154 (_ BitVec 32))) )
))
(declare-fun lt!611162 () SeekEntryResult!10195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95223 (_ BitVec 32)) SeekEntryResult!10195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391365 (= lt!611162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) (select (arr!45975 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391366 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95223 (_ BitVec 32)) SeekEntryResult!10195)

(assert (=> b!1391366 (= e!788065 (= (seekEntryOrOpen!0 (select (arr!45975 a!2901) j!112) a!2901 mask!2840) (Found!10195 j!112)))))

(declare-fun b!1391367 () Bool)

(declare-fun res!930847 () Bool)

(assert (=> b!1391367 (=> (not res!930847) (not e!788066))))

(assert (=> b!1391367 (= res!930847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930846 () Bool)

(assert (=> start!119364 (=> (not res!930846) (not e!788066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119364 (= res!930846 (validMask!0 mask!2840))))

(assert (=> start!119364 e!788066))

(assert (=> start!119364 true))

(declare-fun array_inv!35256 (array!95223) Bool)

(assert (=> start!119364 (array_inv!35256 a!2901)))

(declare-fun b!1391368 () Bool)

(declare-fun res!930842 () Bool)

(assert (=> b!1391368 (=> (not res!930842) (not e!788066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391368 (= res!930842 (validKeyInArray!0 (select (arr!45975 a!2901) j!112)))))

(declare-fun b!1391369 () Bool)

(declare-fun res!930845 () Bool)

(assert (=> b!1391369 (=> (not res!930845) (not e!788066))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391369 (= res!930845 (validKeyInArray!0 (select (arr!45975 a!2901) i!1037)))))

(declare-fun b!1391370 () Bool)

(declare-fun res!930843 () Bool)

(assert (=> b!1391370 (=> (not res!930843) (not e!788066))))

(assert (=> b!1391370 (= res!930843 (and (= (size!46526 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46526 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46526 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119364 res!930846) b!1391370))

(assert (= (and b!1391370 res!930843) b!1391369))

(assert (= (and b!1391369 res!930845) b!1391368))

(assert (= (and b!1391368 res!930842) b!1391367))

(assert (= (and b!1391367 res!930847) b!1391364))

(assert (= (and b!1391364 res!930841) b!1391365))

(assert (= (and b!1391365 res!930844) b!1391366))

(declare-fun m!1277393 () Bool)

(assert (=> start!119364 m!1277393))

(declare-fun m!1277395 () Bool)

(assert (=> start!119364 m!1277395))

(declare-fun m!1277397 () Bool)

(assert (=> b!1391367 m!1277397))

(declare-fun m!1277399 () Bool)

(assert (=> b!1391364 m!1277399))

(declare-fun m!1277401 () Bool)

(assert (=> b!1391368 m!1277401))

(assert (=> b!1391368 m!1277401))

(declare-fun m!1277403 () Bool)

(assert (=> b!1391368 m!1277403))

(declare-fun m!1277405 () Bool)

(assert (=> b!1391369 m!1277405))

(assert (=> b!1391369 m!1277405))

(declare-fun m!1277407 () Bool)

(assert (=> b!1391369 m!1277407))

(assert (=> b!1391365 m!1277401))

(declare-fun m!1277409 () Bool)

(assert (=> b!1391365 m!1277409))

(assert (=> b!1391365 m!1277401))

(declare-fun m!1277411 () Bool)

(assert (=> b!1391365 m!1277411))

(assert (=> b!1391365 m!1277409))

(assert (=> b!1391365 m!1277401))

(declare-fun m!1277413 () Bool)

(assert (=> b!1391365 m!1277413))

(declare-fun m!1277415 () Bool)

(assert (=> b!1391365 m!1277415))

(assert (=> b!1391366 m!1277401))

(assert (=> b!1391366 m!1277401))

(declare-fun m!1277417 () Bool)

(assert (=> b!1391366 m!1277417))

(push 1)

(assert (not b!1391367))

(assert (not b!1391366))

(assert (not b!1391365))

(assert (not b!1391364))

(assert (not b!1391369))

(assert (not start!119364))

(assert (not b!1391368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

