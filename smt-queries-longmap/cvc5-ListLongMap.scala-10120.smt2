; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119460 () Bool)

(assert start!119460)

(declare-fun res!931363 () Bool)

(declare-fun e!788397 () Bool)

(assert (=> start!119460 (=> (not res!931363) (not e!788397))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119460 (= res!931363 (validMask!0 mask!2840))))

(assert (=> start!119460 e!788397))

(assert (=> start!119460 true))

(declare-datatypes ((array!95268 0))(
  ( (array!95269 (arr!45996 (Array (_ BitVec 32) (_ BitVec 64))) (size!46547 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95268)

(declare-fun array_inv!35277 (array!95268) Bool)

(assert (=> start!119460 (array_inv!35277 a!2901)))

(declare-fun b!1392033 () Bool)

(assert (=> b!1392033 (= e!788397 (not true))))

(declare-fun e!788398 () Bool)

(assert (=> b!1392033 e!788398))

(declare-fun res!931366 () Bool)

(assert (=> b!1392033 (=> (not res!931366) (not e!788398))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95268 (_ BitVec 32)) Bool)

(assert (=> b!1392033 (= res!931366 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46463 0))(
  ( (Unit!46464) )
))
(declare-fun lt!611396 () Unit!46463)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46463)

(assert (=> b!1392033 (= lt!611396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10216 0))(
  ( (MissingZero!10216 (index!43235 (_ BitVec 32))) (Found!10216 (index!43236 (_ BitVec 32))) (Intermediate!10216 (undefined!11028 Bool) (index!43237 (_ BitVec 32)) (x!125063 (_ BitVec 32))) (Undefined!10216) (MissingVacant!10216 (index!43238 (_ BitVec 32))) )
))
(declare-fun lt!611395 () SeekEntryResult!10216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95268 (_ BitVec 32)) SeekEntryResult!10216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392033 (= lt!611395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45996 a!2901) j!112) mask!2840) (select (arr!45996 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392034 () Bool)

(declare-fun res!931368 () Bool)

(assert (=> b!1392034 (=> (not res!931368) (not e!788397))))

(assert (=> b!1392034 (= res!931368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392035 () Bool)

(declare-fun res!931365 () Bool)

(assert (=> b!1392035 (=> (not res!931365) (not e!788397))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392035 (= res!931365 (validKeyInArray!0 (select (arr!45996 a!2901) i!1037)))))

(declare-fun b!1392036 () Bool)

(declare-fun res!931369 () Bool)

(assert (=> b!1392036 (=> (not res!931369) (not e!788397))))

(assert (=> b!1392036 (= res!931369 (validKeyInArray!0 (select (arr!45996 a!2901) j!112)))))

(declare-fun b!1392037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95268 (_ BitVec 32)) SeekEntryResult!10216)

(assert (=> b!1392037 (= e!788398 (= (seekEntryOrOpen!0 (select (arr!45996 a!2901) j!112) a!2901 mask!2840) (Found!10216 j!112)))))

(declare-fun b!1392038 () Bool)

(declare-fun res!931367 () Bool)

(assert (=> b!1392038 (=> (not res!931367) (not e!788397))))

(assert (=> b!1392038 (= res!931367 (and (= (size!46547 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46547 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46547 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392039 () Bool)

(declare-fun res!931364 () Bool)

(assert (=> b!1392039 (=> (not res!931364) (not e!788397))))

(declare-datatypes ((List!32502 0))(
  ( (Nil!32499) (Cons!32498 (h!33727 (_ BitVec 64)) (t!47188 List!32502)) )
))
(declare-fun arrayNoDuplicates!0 (array!95268 (_ BitVec 32) List!32502) Bool)

(assert (=> b!1392039 (= res!931364 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32499))))

(assert (= (and start!119460 res!931363) b!1392038))

(assert (= (and b!1392038 res!931367) b!1392035))

(assert (= (and b!1392035 res!931365) b!1392036))

(assert (= (and b!1392036 res!931369) b!1392034))

(assert (= (and b!1392034 res!931368) b!1392039))

(assert (= (and b!1392039 res!931364) b!1392033))

(assert (= (and b!1392033 res!931366) b!1392037))

(declare-fun m!1278065 () Bool)

(assert (=> b!1392037 m!1278065))

(assert (=> b!1392037 m!1278065))

(declare-fun m!1278067 () Bool)

(assert (=> b!1392037 m!1278067))

(declare-fun m!1278069 () Bool)

(assert (=> b!1392039 m!1278069))

(declare-fun m!1278071 () Bool)

(assert (=> start!119460 m!1278071))

(declare-fun m!1278073 () Bool)

(assert (=> start!119460 m!1278073))

(declare-fun m!1278075 () Bool)

(assert (=> b!1392034 m!1278075))

(assert (=> b!1392033 m!1278065))

(declare-fun m!1278077 () Bool)

(assert (=> b!1392033 m!1278077))

(assert (=> b!1392033 m!1278065))

(declare-fun m!1278079 () Bool)

(assert (=> b!1392033 m!1278079))

(assert (=> b!1392033 m!1278077))

(assert (=> b!1392033 m!1278065))

(declare-fun m!1278081 () Bool)

(assert (=> b!1392033 m!1278081))

(declare-fun m!1278083 () Bool)

(assert (=> b!1392033 m!1278083))

(assert (=> b!1392036 m!1278065))

(assert (=> b!1392036 m!1278065))

(declare-fun m!1278085 () Bool)

(assert (=> b!1392036 m!1278085))

(declare-fun m!1278087 () Bool)

(assert (=> b!1392035 m!1278087))

(assert (=> b!1392035 m!1278087))

(declare-fun m!1278089 () Bool)

(assert (=> b!1392035 m!1278089))

(push 1)

(assert (not b!1392033))

(assert (not b!1392037))

(assert (not b!1392036))

(assert (not start!119460))

(assert (not b!1392034))

(assert (not b!1392039))

(assert (not b!1392035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

