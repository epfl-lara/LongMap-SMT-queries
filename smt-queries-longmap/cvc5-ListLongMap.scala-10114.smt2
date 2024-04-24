; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119370 () Bool)

(assert start!119370)

(declare-fun b!1391427 () Bool)

(declare-fun res!930907 () Bool)

(declare-fun e!788092 () Bool)

(assert (=> b!1391427 (=> (not res!930907) (not e!788092))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95229 0))(
  ( (array!95230 (arr!45978 (Array (_ BitVec 32) (_ BitVec 64))) (size!46529 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95229)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391427 (= res!930907 (and (= (size!46529 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46529 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46529 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391428 () Bool)

(declare-fun e!788093 () Bool)

(declare-datatypes ((SeekEntryResult!10198 0))(
  ( (MissingZero!10198 (index!43163 (_ BitVec 32))) (Found!10198 (index!43164 (_ BitVec 32))) (Intermediate!10198 (undefined!11010 Bool) (index!43165 (_ BitVec 32)) (x!124991 (_ BitVec 32))) (Undefined!10198) (MissingVacant!10198 (index!43166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95229 (_ BitVec 32)) SeekEntryResult!10198)

(assert (=> b!1391428 (= e!788093 (= (seekEntryOrOpen!0 (select (arr!45978 a!2901) j!112) a!2901 mask!2840) (Found!10198 j!112)))))

(declare-fun b!1391429 () Bool)

(declare-fun res!930909 () Bool)

(assert (=> b!1391429 (=> (not res!930909) (not e!788092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391429 (= res!930909 (validKeyInArray!0 (select (arr!45978 a!2901) j!112)))))

(declare-fun b!1391430 () Bool)

(declare-fun res!930910 () Bool)

(assert (=> b!1391430 (=> (not res!930910) (not e!788092))))

(declare-datatypes ((List!32484 0))(
  ( (Nil!32481) (Cons!32480 (h!33706 (_ BitVec 64)) (t!47170 List!32484)) )
))
(declare-fun arrayNoDuplicates!0 (array!95229 (_ BitVec 32) List!32484) Bool)

(assert (=> b!1391430 (= res!930910 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32481))))

(declare-fun b!1391431 () Bool)

(declare-fun res!930906 () Bool)

(assert (=> b!1391431 (=> (not res!930906) (not e!788092))))

(assert (=> b!1391431 (= res!930906 (validKeyInArray!0 (select (arr!45978 a!2901) i!1037)))))

(declare-fun b!1391432 () Bool)

(declare-fun res!930904 () Bool)

(assert (=> b!1391432 (=> (not res!930904) (not e!788092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95229 (_ BitVec 32)) Bool)

(assert (=> b!1391432 (= res!930904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930908 () Bool)

(assert (=> start!119370 (=> (not res!930908) (not e!788092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119370 (= res!930908 (validMask!0 mask!2840))))

(assert (=> start!119370 e!788092))

(assert (=> start!119370 true))

(declare-fun array_inv!35259 (array!95229) Bool)

(assert (=> start!119370 (array_inv!35259 a!2901)))

(declare-fun b!1391433 () Bool)

(assert (=> b!1391433 (= e!788092 (not true))))

(assert (=> b!1391433 e!788093))

(declare-fun res!930905 () Bool)

(assert (=> b!1391433 (=> (not res!930905) (not e!788093))))

(assert (=> b!1391433 (= res!930905 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46427 0))(
  ( (Unit!46428) )
))
(declare-fun lt!611179 () Unit!46427)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46427)

(assert (=> b!1391433 (= lt!611179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611180 () SeekEntryResult!10198)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95229 (_ BitVec 32)) SeekEntryResult!10198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391433 (= lt!611180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45978 a!2901) j!112) mask!2840) (select (arr!45978 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119370 res!930908) b!1391427))

(assert (= (and b!1391427 res!930907) b!1391431))

(assert (= (and b!1391431 res!930906) b!1391429))

(assert (= (and b!1391429 res!930909) b!1391432))

(assert (= (and b!1391432 res!930904) b!1391430))

(assert (= (and b!1391430 res!930910) b!1391433))

(assert (= (and b!1391433 res!930905) b!1391428))

(declare-fun m!1277471 () Bool)

(assert (=> b!1391428 m!1277471))

(assert (=> b!1391428 m!1277471))

(declare-fun m!1277473 () Bool)

(assert (=> b!1391428 m!1277473))

(assert (=> b!1391433 m!1277471))

(declare-fun m!1277475 () Bool)

(assert (=> b!1391433 m!1277475))

(assert (=> b!1391433 m!1277471))

(declare-fun m!1277477 () Bool)

(assert (=> b!1391433 m!1277477))

(assert (=> b!1391433 m!1277475))

(assert (=> b!1391433 m!1277471))

(declare-fun m!1277479 () Bool)

(assert (=> b!1391433 m!1277479))

(declare-fun m!1277481 () Bool)

(assert (=> b!1391433 m!1277481))

(declare-fun m!1277483 () Bool)

(assert (=> b!1391432 m!1277483))

(declare-fun m!1277485 () Bool)

(assert (=> b!1391430 m!1277485))

(declare-fun m!1277487 () Bool)

(assert (=> b!1391431 m!1277487))

(assert (=> b!1391431 m!1277487))

(declare-fun m!1277489 () Bool)

(assert (=> b!1391431 m!1277489))

(assert (=> b!1391429 m!1277471))

(assert (=> b!1391429 m!1277471))

(declare-fun m!1277491 () Bool)

(assert (=> b!1391429 m!1277491))

(declare-fun m!1277493 () Bool)

(assert (=> start!119370 m!1277493))

(declare-fun m!1277495 () Bool)

(assert (=> start!119370 m!1277495))

(push 1)

(assert (not b!1391432))

(assert (not b!1391428))

(assert (not b!1391431))

(assert (not b!1391433))

(assert (not b!1391430))

(assert (not start!119370))

(assert (not b!1391429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

