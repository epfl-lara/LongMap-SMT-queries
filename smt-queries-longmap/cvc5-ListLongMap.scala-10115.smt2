; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119376 () Bool)

(assert start!119376)

(declare-fun b!1391490 () Bool)

(declare-fun res!930971 () Bool)

(declare-fun e!788119 () Bool)

(assert (=> b!1391490 (=> (not res!930971) (not e!788119))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95235 0))(
  ( (array!95236 (arr!45981 (Array (_ BitVec 32) (_ BitVec 64))) (size!46532 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95235)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391490 (= res!930971 (and (= (size!46532 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46532 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46532 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930972 () Bool)

(assert (=> start!119376 (=> (not res!930972) (not e!788119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119376 (= res!930972 (validMask!0 mask!2840))))

(assert (=> start!119376 e!788119))

(assert (=> start!119376 true))

(declare-fun array_inv!35262 (array!95235) Bool)

(assert (=> start!119376 (array_inv!35262 a!2901)))

(declare-fun b!1391491 () Bool)

(declare-fun e!788118 () Bool)

(declare-datatypes ((SeekEntryResult!10201 0))(
  ( (MissingZero!10201 (index!43175 (_ BitVec 32))) (Found!10201 (index!43176 (_ BitVec 32))) (Intermediate!10201 (undefined!11013 Bool) (index!43177 (_ BitVec 32)) (x!125002 (_ BitVec 32))) (Undefined!10201) (MissingVacant!10201 (index!43178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95235 (_ BitVec 32)) SeekEntryResult!10201)

(assert (=> b!1391491 (= e!788118 (= (seekEntryOrOpen!0 (select (arr!45981 a!2901) j!112) a!2901 mask!2840) (Found!10201 j!112)))))

(declare-fun b!1391492 () Bool)

(declare-fun res!930970 () Bool)

(assert (=> b!1391492 (=> (not res!930970) (not e!788119))))

(declare-datatypes ((List!32487 0))(
  ( (Nil!32484) (Cons!32483 (h!33709 (_ BitVec 64)) (t!47173 List!32487)) )
))
(declare-fun arrayNoDuplicates!0 (array!95235 (_ BitVec 32) List!32487) Bool)

(assert (=> b!1391492 (= res!930970 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32484))))

(declare-fun b!1391493 () Bool)

(declare-fun res!930968 () Bool)

(assert (=> b!1391493 (=> (not res!930968) (not e!788119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391493 (= res!930968 (validKeyInArray!0 (select (arr!45981 a!2901) i!1037)))))

(declare-fun b!1391494 () Bool)

(assert (=> b!1391494 (= e!788119 (not true))))

(assert (=> b!1391494 e!788118))

(declare-fun res!930973 () Bool)

(assert (=> b!1391494 (=> (not res!930973) (not e!788118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95235 (_ BitVec 32)) Bool)

(assert (=> b!1391494 (= res!930973 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46433 0))(
  ( (Unit!46434) )
))
(declare-fun lt!611198 () Unit!46433)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46433)

(assert (=> b!1391494 (= lt!611198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611197 () SeekEntryResult!10201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95235 (_ BitVec 32)) SeekEntryResult!10201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391494 (= lt!611197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45981 a!2901) j!112) mask!2840) (select (arr!45981 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391495 () Bool)

(declare-fun res!930967 () Bool)

(assert (=> b!1391495 (=> (not res!930967) (not e!788119))))

(assert (=> b!1391495 (= res!930967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391496 () Bool)

(declare-fun res!930969 () Bool)

(assert (=> b!1391496 (=> (not res!930969) (not e!788119))))

(assert (=> b!1391496 (= res!930969 (validKeyInArray!0 (select (arr!45981 a!2901) j!112)))))

(assert (= (and start!119376 res!930972) b!1391490))

(assert (= (and b!1391490 res!930971) b!1391493))

(assert (= (and b!1391493 res!930968) b!1391496))

(assert (= (and b!1391496 res!930969) b!1391495))

(assert (= (and b!1391495 res!930967) b!1391492))

(assert (= (and b!1391492 res!930970) b!1391494))

(assert (= (and b!1391494 res!930973) b!1391491))

(declare-fun m!1277549 () Bool)

(assert (=> b!1391495 m!1277549))

(declare-fun m!1277551 () Bool)

(assert (=> b!1391496 m!1277551))

(assert (=> b!1391496 m!1277551))

(declare-fun m!1277553 () Bool)

(assert (=> b!1391496 m!1277553))

(declare-fun m!1277555 () Bool)

(assert (=> start!119376 m!1277555))

(declare-fun m!1277557 () Bool)

(assert (=> start!119376 m!1277557))

(assert (=> b!1391491 m!1277551))

(assert (=> b!1391491 m!1277551))

(declare-fun m!1277559 () Bool)

(assert (=> b!1391491 m!1277559))

(declare-fun m!1277561 () Bool)

(assert (=> b!1391493 m!1277561))

(assert (=> b!1391493 m!1277561))

(declare-fun m!1277563 () Bool)

(assert (=> b!1391493 m!1277563))

(assert (=> b!1391494 m!1277551))

(declare-fun m!1277565 () Bool)

(assert (=> b!1391494 m!1277565))

(assert (=> b!1391494 m!1277551))

(declare-fun m!1277567 () Bool)

(assert (=> b!1391494 m!1277567))

(assert (=> b!1391494 m!1277565))

(assert (=> b!1391494 m!1277551))

(declare-fun m!1277569 () Bool)

(assert (=> b!1391494 m!1277569))

(declare-fun m!1277571 () Bool)

(assert (=> b!1391494 m!1277571))

(declare-fun m!1277573 () Bool)

(assert (=> b!1391492 m!1277573))

(push 1)

(assert (not b!1391492))

(assert (not b!1391491))

(assert (not b!1391494))

(assert (not start!119376))

(assert (not b!1391496))

(assert (not b!1391495))

(assert (not b!1391493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

