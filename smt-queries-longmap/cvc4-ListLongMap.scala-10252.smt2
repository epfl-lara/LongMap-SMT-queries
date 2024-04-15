; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120562 () Bool)

(assert start!120562)

(declare-fun b!1403787 () Bool)

(declare-fun res!942349 () Bool)

(declare-fun e!794793 () Bool)

(assert (=> b!1403787 (=> (not res!942349) (not e!794793))))

(declare-datatypes ((array!95924 0))(
  ( (array!95925 (arr!46313 (Array (_ BitVec 32) (_ BitVec 64))) (size!46865 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95924)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403787 (= res!942349 (validKeyInArray!0 (select (arr!46313 a!2901) i!1037)))))

(declare-fun b!1403788 () Bool)

(declare-fun res!942353 () Bool)

(assert (=> b!1403788 (=> (not res!942353) (not e!794793))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95924 (_ BitVec 32)) Bool)

(assert (=> b!1403788 (= res!942353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403789 () Bool)

(declare-fun res!942352 () Bool)

(assert (=> b!1403789 (=> (not res!942352) (not e!794793))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403789 (= res!942352 (and (= (size!46865 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46865 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46865 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403790 () Bool)

(declare-fun res!942351 () Bool)

(assert (=> b!1403790 (=> (not res!942351) (not e!794793))))

(declare-datatypes ((List!32910 0))(
  ( (Nil!32907) (Cons!32906 (h!34154 (_ BitVec 64)) (t!47596 List!32910)) )
))
(declare-fun arrayNoDuplicates!0 (array!95924 (_ BitVec 32) List!32910) Bool)

(assert (=> b!1403790 (= res!942351 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32907))))

(declare-fun b!1403792 () Bool)

(declare-fun e!794795 () Bool)

(declare-datatypes ((SeekEntryResult!10656 0))(
  ( (MissingZero!10656 (index!45001 (_ BitVec 32))) (Found!10656 (index!45002 (_ BitVec 32))) (Intermediate!10656 (undefined!11468 Bool) (index!45003 (_ BitVec 32)) (x!126600 (_ BitVec 32))) (Undefined!10656) (MissingVacant!10656 (index!45004 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95924 (_ BitVec 32)) SeekEntryResult!10656)

(assert (=> b!1403792 (= e!794795 (= (seekEntryOrOpen!0 (select (arr!46313 a!2901) j!112) a!2901 mask!2840) (Found!10656 j!112)))))

(declare-fun b!1403793 () Bool)

(assert (=> b!1403793 (= e!794793 (not true))))

(assert (=> b!1403793 e!794795))

(declare-fun res!942355 () Bool)

(assert (=> b!1403793 (=> (not res!942355) (not e!794795))))

(assert (=> b!1403793 (= res!942355 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47159 0))(
  ( (Unit!47160) )
))
(declare-fun lt!618341 () Unit!47159)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47159)

(assert (=> b!1403793 (= lt!618341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618340 () SeekEntryResult!10656)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95924 (_ BitVec 32)) SeekEntryResult!10656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403793 (= lt!618340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46313 a!2901) j!112) mask!2840) (select (arr!46313 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942354 () Bool)

(assert (=> start!120562 (=> (not res!942354) (not e!794793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120562 (= res!942354 (validMask!0 mask!2840))))

(assert (=> start!120562 e!794793))

(assert (=> start!120562 true))

(declare-fun array_inv!35546 (array!95924) Bool)

(assert (=> start!120562 (array_inv!35546 a!2901)))

(declare-fun b!1403791 () Bool)

(declare-fun res!942350 () Bool)

(assert (=> b!1403791 (=> (not res!942350) (not e!794793))))

(assert (=> b!1403791 (= res!942350 (validKeyInArray!0 (select (arr!46313 a!2901) j!112)))))

(assert (= (and start!120562 res!942354) b!1403789))

(assert (= (and b!1403789 res!942352) b!1403787))

(assert (= (and b!1403787 res!942349) b!1403791))

(assert (= (and b!1403791 res!942350) b!1403788))

(assert (= (and b!1403788 res!942353) b!1403790))

(assert (= (and b!1403790 res!942351) b!1403793))

(assert (= (and b!1403793 res!942355) b!1403792))

(declare-fun m!1292091 () Bool)

(assert (=> b!1403788 m!1292091))

(declare-fun m!1292093 () Bool)

(assert (=> b!1403787 m!1292093))

(assert (=> b!1403787 m!1292093))

(declare-fun m!1292095 () Bool)

(assert (=> b!1403787 m!1292095))

(declare-fun m!1292097 () Bool)

(assert (=> b!1403791 m!1292097))

(assert (=> b!1403791 m!1292097))

(declare-fun m!1292099 () Bool)

(assert (=> b!1403791 m!1292099))

(assert (=> b!1403793 m!1292097))

(declare-fun m!1292101 () Bool)

(assert (=> b!1403793 m!1292101))

(assert (=> b!1403793 m!1292097))

(declare-fun m!1292103 () Bool)

(assert (=> b!1403793 m!1292103))

(assert (=> b!1403793 m!1292101))

(assert (=> b!1403793 m!1292097))

(declare-fun m!1292105 () Bool)

(assert (=> b!1403793 m!1292105))

(declare-fun m!1292107 () Bool)

(assert (=> b!1403793 m!1292107))

(assert (=> b!1403792 m!1292097))

(assert (=> b!1403792 m!1292097))

(declare-fun m!1292109 () Bool)

(assert (=> b!1403792 m!1292109))

(declare-fun m!1292111 () Bool)

(assert (=> b!1403790 m!1292111))

(declare-fun m!1292113 () Bool)

(assert (=> start!120562 m!1292113))

(declare-fun m!1292115 () Bool)

(assert (=> start!120562 m!1292115))

(push 1)

(assert (not b!1403788))

(assert (not b!1403792))

(assert (not b!1403787))

(assert (not b!1403793))

(assert (not b!1403790))

(assert (not start!120562))

(assert (not b!1403791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

