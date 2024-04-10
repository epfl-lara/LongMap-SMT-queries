; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120846 () Bool)

(assert start!120846)

(declare-fun b!1406096 () Bool)

(declare-fun res!944313 () Bool)

(declare-fun e!795870 () Bool)

(assert (=> b!1406096 (=> (not res!944313) (not e!795870))))

(declare-datatypes ((array!96153 0))(
  ( (array!96154 (arr!46424 (Array (_ BitVec 32) (_ BitVec 64))) (size!46974 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96153)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96153 (_ BitVec 32)) Bool)

(assert (=> b!1406096 (= res!944313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406097 () Bool)

(declare-fun e!795869 () Bool)

(assert (=> b!1406097 (= e!795869 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10735 0))(
  ( (MissingZero!10735 (index!45317 (_ BitVec 32))) (Found!10735 (index!45318 (_ BitVec 32))) (Intermediate!10735 (undefined!11547 Bool) (index!45319 (_ BitVec 32)) (x!126926 (_ BitVec 32))) (Undefined!10735) (MissingVacant!10735 (index!45320 (_ BitVec 32))) )
))
(declare-fun lt!619255 () SeekEntryResult!10735)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96153 (_ BitVec 32)) SeekEntryResult!10735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406097 (= lt!619255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46424 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46424 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96154 (store (arr!46424 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46974 a!2901)) mask!2840))))

(declare-fun b!1406098 () Bool)

(declare-fun e!795871 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96153 (_ BitVec 32)) SeekEntryResult!10735)

(assert (=> b!1406098 (= e!795871 (= (seekEntryOrOpen!0 (select (arr!46424 a!2901) j!112) a!2901 mask!2840) (Found!10735 j!112)))))

(declare-fun b!1406099 () Bool)

(declare-fun res!944315 () Bool)

(assert (=> b!1406099 (=> (not res!944315) (not e!795870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406099 (= res!944315 (validKeyInArray!0 (select (arr!46424 a!2901) i!1037)))))

(declare-fun b!1406100 () Bool)

(declare-fun res!944319 () Bool)

(assert (=> b!1406100 (=> (not res!944319) (not e!795870))))

(assert (=> b!1406100 (= res!944319 (validKeyInArray!0 (select (arr!46424 a!2901) j!112)))))

(declare-fun res!944318 () Bool)

(assert (=> start!120846 (=> (not res!944318) (not e!795870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120846 (= res!944318 (validMask!0 mask!2840))))

(assert (=> start!120846 e!795870))

(assert (=> start!120846 true))

(declare-fun array_inv!35452 (array!96153) Bool)

(assert (=> start!120846 (array_inv!35452 a!2901)))

(declare-fun b!1406101 () Bool)

(declare-fun res!944317 () Bool)

(assert (=> b!1406101 (=> (not res!944317) (not e!795870))))

(declare-datatypes ((List!32943 0))(
  ( (Nil!32940) (Cons!32939 (h!34193 (_ BitVec 64)) (t!47637 List!32943)) )
))
(declare-fun arrayNoDuplicates!0 (array!96153 (_ BitVec 32) List!32943) Bool)

(assert (=> b!1406101 (= res!944317 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32940))))

(declare-fun b!1406102 () Bool)

(assert (=> b!1406102 (= e!795870 (not e!795869))))

(declare-fun res!944320 () Bool)

(assert (=> b!1406102 (=> res!944320 e!795869)))

(declare-fun lt!619257 () SeekEntryResult!10735)

(assert (=> b!1406102 (= res!944320 (or (not (is-Intermediate!10735 lt!619257)) (undefined!11547 lt!619257)))))

(assert (=> b!1406102 e!795871))

(declare-fun res!944314 () Bool)

(assert (=> b!1406102 (=> (not res!944314) (not e!795871))))

(assert (=> b!1406102 (= res!944314 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47444 0))(
  ( (Unit!47445) )
))
(declare-fun lt!619256 () Unit!47444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47444)

(assert (=> b!1406102 (= lt!619256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406102 (= lt!619257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) (select (arr!46424 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406103 () Bool)

(declare-fun res!944316 () Bool)

(assert (=> b!1406103 (=> (not res!944316) (not e!795870))))

(assert (=> b!1406103 (= res!944316 (and (= (size!46974 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46974 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46974 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120846 res!944318) b!1406103))

(assert (= (and b!1406103 res!944316) b!1406099))

(assert (= (and b!1406099 res!944315) b!1406100))

(assert (= (and b!1406100 res!944319) b!1406096))

(assert (= (and b!1406096 res!944313) b!1406101))

(assert (= (and b!1406101 res!944317) b!1406102))

(assert (= (and b!1406102 res!944314) b!1406098))

(assert (= (and b!1406102 (not res!944320)) b!1406097))

(declare-fun m!1295097 () Bool)

(assert (=> b!1406096 m!1295097))

(declare-fun m!1295099 () Bool)

(assert (=> start!120846 m!1295099))

(declare-fun m!1295101 () Bool)

(assert (=> start!120846 m!1295101))

(declare-fun m!1295103 () Bool)

(assert (=> b!1406099 m!1295103))

(assert (=> b!1406099 m!1295103))

(declare-fun m!1295105 () Bool)

(assert (=> b!1406099 m!1295105))

(declare-fun m!1295107 () Bool)

(assert (=> b!1406097 m!1295107))

(declare-fun m!1295109 () Bool)

(assert (=> b!1406097 m!1295109))

(assert (=> b!1406097 m!1295109))

(declare-fun m!1295111 () Bool)

(assert (=> b!1406097 m!1295111))

(assert (=> b!1406097 m!1295111))

(assert (=> b!1406097 m!1295109))

(declare-fun m!1295113 () Bool)

(assert (=> b!1406097 m!1295113))

(declare-fun m!1295115 () Bool)

(assert (=> b!1406102 m!1295115))

(declare-fun m!1295117 () Bool)

(assert (=> b!1406102 m!1295117))

(assert (=> b!1406102 m!1295115))

(declare-fun m!1295119 () Bool)

(assert (=> b!1406102 m!1295119))

(assert (=> b!1406102 m!1295117))

(assert (=> b!1406102 m!1295115))

(declare-fun m!1295121 () Bool)

(assert (=> b!1406102 m!1295121))

(declare-fun m!1295123 () Bool)

(assert (=> b!1406102 m!1295123))

(assert (=> b!1406098 m!1295115))

(assert (=> b!1406098 m!1295115))

(declare-fun m!1295125 () Bool)

(assert (=> b!1406098 m!1295125))

(declare-fun m!1295127 () Bool)

(assert (=> b!1406101 m!1295127))

(assert (=> b!1406100 m!1295115))

(assert (=> b!1406100 m!1295115))

(declare-fun m!1295129 () Bool)

(assert (=> b!1406100 m!1295129))

(push 1)

(assert (not b!1406097))

(assert (not b!1406101))

(assert (not b!1406099))

(assert (not b!1406100))

(assert (not start!120846))

(assert (not b!1406098))

(assert (not b!1406102))

(assert (not b!1406096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

