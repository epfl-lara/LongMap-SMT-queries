; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120774 () Bool)

(assert start!120774)

(declare-fun b!1405245 () Bool)

(declare-fun res!943517 () Bool)

(declare-fun e!795468 () Bool)

(assert (=> b!1405245 (=> (not res!943517) (not e!795468))))

(declare-datatypes ((array!96034 0))(
  ( (array!96035 (arr!46365 (Array (_ BitVec 32) (_ BitVec 64))) (size!46917 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96034)

(declare-datatypes ((List!32962 0))(
  ( (Nil!32959) (Cons!32958 (h!34212 (_ BitVec 64)) (t!47648 List!32962)) )
))
(declare-fun arrayNoDuplicates!0 (array!96034 (_ BitVec 32) List!32962) Bool)

(assert (=> b!1405245 (= res!943517 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32959))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795469 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1405246 () Bool)

(declare-datatypes ((SeekEntryResult!10702 0))(
  ( (MissingZero!10702 (index!45185 (_ BitVec 32))) (Found!10702 (index!45186 (_ BitVec 32))) (Intermediate!10702 (undefined!11514 Bool) (index!45187 (_ BitVec 32)) (x!126794 (_ BitVec 32))) (Undefined!10702) (MissingVacant!10702 (index!45188 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96034 (_ BitVec 32)) SeekEntryResult!10702)

(assert (=> b!1405246 (= e!795469 (= (seekEntryOrOpen!0 (select (arr!46365 a!2901) j!112) a!2901 mask!2840) (Found!10702 j!112)))))

(declare-fun b!1405247 () Bool)

(declare-fun res!943516 () Bool)

(assert (=> b!1405247 (=> (not res!943516) (not e!795468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405247 (= res!943516 (validKeyInArray!0 (select (arr!46365 a!2901) j!112)))))

(declare-fun b!1405248 () Bool)

(declare-fun res!943519 () Bool)

(assert (=> b!1405248 (=> (not res!943519) (not e!795468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96034 (_ BitVec 32)) Bool)

(assert (=> b!1405248 (= res!943519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943515 () Bool)

(assert (=> start!120774 (=> (not res!943515) (not e!795468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120774 (= res!943515 (validMask!0 mask!2840))))

(assert (=> start!120774 e!795468))

(assert (=> start!120774 true))

(declare-fun array_inv!35598 (array!96034) Bool)

(assert (=> start!120774 (array_inv!35598 a!2901)))

(declare-fun b!1405249 () Bool)

(declare-fun res!943514 () Bool)

(assert (=> b!1405249 (=> (not res!943514) (not e!795468))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405249 (= res!943514 (validKeyInArray!0 (select (arr!46365 a!2901) i!1037)))))

(declare-fun b!1405250 () Bool)

(assert (=> b!1405250 (= e!795468 (not true))))

(assert (=> b!1405250 e!795469))

(declare-fun res!943518 () Bool)

(assert (=> b!1405250 (=> (not res!943518) (not e!795469))))

(assert (=> b!1405250 (= res!943518 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47221 0))(
  ( (Unit!47222) )
))
(declare-fun lt!618806 () Unit!47221)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47221)

(assert (=> b!1405250 (= lt!618806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618805 () SeekEntryResult!10702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96034 (_ BitVec 32)) SeekEntryResult!10702)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405250 (= lt!618805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46365 a!2901) j!112) mask!2840) (select (arr!46365 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405251 () Bool)

(declare-fun res!943513 () Bool)

(assert (=> b!1405251 (=> (not res!943513) (not e!795468))))

(assert (=> b!1405251 (= res!943513 (and (= (size!46917 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46917 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46917 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120774 res!943515) b!1405251))

(assert (= (and b!1405251 res!943513) b!1405249))

(assert (= (and b!1405249 res!943514) b!1405247))

(assert (= (and b!1405247 res!943516) b!1405248))

(assert (= (and b!1405248 res!943519) b!1405245))

(assert (= (and b!1405245 res!943517) b!1405250))

(assert (= (and b!1405250 res!943518) b!1405246))

(declare-fun m!1293545 () Bool)

(assert (=> b!1405246 m!1293545))

(assert (=> b!1405246 m!1293545))

(declare-fun m!1293547 () Bool)

(assert (=> b!1405246 m!1293547))

(declare-fun m!1293549 () Bool)

(assert (=> start!120774 m!1293549))

(declare-fun m!1293551 () Bool)

(assert (=> start!120774 m!1293551))

(assert (=> b!1405250 m!1293545))

(declare-fun m!1293553 () Bool)

(assert (=> b!1405250 m!1293553))

(assert (=> b!1405250 m!1293545))

(declare-fun m!1293555 () Bool)

(assert (=> b!1405250 m!1293555))

(assert (=> b!1405250 m!1293553))

(assert (=> b!1405250 m!1293545))

(declare-fun m!1293557 () Bool)

(assert (=> b!1405250 m!1293557))

(declare-fun m!1293559 () Bool)

(assert (=> b!1405250 m!1293559))

(declare-fun m!1293561 () Bool)

(assert (=> b!1405248 m!1293561))

(assert (=> b!1405247 m!1293545))

(assert (=> b!1405247 m!1293545))

(declare-fun m!1293563 () Bool)

(assert (=> b!1405247 m!1293563))

(declare-fun m!1293565 () Bool)

(assert (=> b!1405245 m!1293565))

(declare-fun m!1293567 () Bool)

(assert (=> b!1405249 m!1293567))

(assert (=> b!1405249 m!1293567))

(declare-fun m!1293569 () Bool)

(assert (=> b!1405249 m!1293569))

(push 1)

(assert (not b!1405245))

(assert (not start!120774))

(assert (not b!1405250))

(assert (not b!1405249))

(assert (not b!1405247))

(assert (not b!1405248))

(assert (not b!1405246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

