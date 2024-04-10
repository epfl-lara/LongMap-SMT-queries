; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120538 () Bool)

(assert start!120538)

(declare-fun b!1403575 () Bool)

(declare-fun res!942091 () Bool)

(declare-fun e!794706 () Bool)

(assert (=> b!1403575 (=> (not res!942091) (not e!794706))))

(declare-datatypes ((array!95947 0))(
  ( (array!95948 (arr!46324 (Array (_ BitVec 32) (_ BitVec 64))) (size!46874 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95947)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403575 (= res!942091 (validKeyInArray!0 (select (arr!46324 a!2901) j!112)))))

(declare-fun b!1403576 () Bool)

(declare-fun res!942090 () Bool)

(assert (=> b!1403576 (=> (not res!942090) (not e!794706))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403576 (= res!942090 (and (= (size!46874 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46874 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46874 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403577 () Bool)

(assert (=> b!1403577 (= e!794706 (not true))))

(declare-fun e!794708 () Bool)

(assert (=> b!1403577 e!794708))

(declare-fun res!942085 () Bool)

(assert (=> b!1403577 (=> (not res!942085) (not e!794708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95947 (_ BitVec 32)) Bool)

(assert (=> b!1403577 (= res!942085 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47286 0))(
  ( (Unit!47287) )
))
(declare-fun lt!618446 () Unit!47286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47286)

(assert (=> b!1403577 (= lt!618446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10641 0))(
  ( (MissingZero!10641 (index!44941 (_ BitVec 32))) (Found!10641 (index!44942 (_ BitVec 32))) (Intermediate!10641 (undefined!11453 Bool) (index!44943 (_ BitVec 32)) (x!126548 (_ BitVec 32))) (Undefined!10641) (MissingVacant!10641 (index!44944 (_ BitVec 32))) )
))
(declare-fun lt!618447 () SeekEntryResult!10641)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95947 (_ BitVec 32)) SeekEntryResult!10641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403577 (= lt!618447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46324 a!2901) j!112) mask!2840) (select (arr!46324 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403578 () Bool)

(declare-fun res!942089 () Bool)

(assert (=> b!1403578 (=> (not res!942089) (not e!794706))))

(assert (=> b!1403578 (= res!942089 (validKeyInArray!0 (select (arr!46324 a!2901) i!1037)))))

(declare-fun b!1403579 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95947 (_ BitVec 32)) SeekEntryResult!10641)

(assert (=> b!1403579 (= e!794708 (= (seekEntryOrOpen!0 (select (arr!46324 a!2901) j!112) a!2901 mask!2840) (Found!10641 j!112)))))

(declare-fun b!1403580 () Bool)

(declare-fun res!942088 () Bool)

(assert (=> b!1403580 (=> (not res!942088) (not e!794706))))

(declare-datatypes ((List!32843 0))(
  ( (Nil!32840) (Cons!32839 (h!34087 (_ BitVec 64)) (t!47537 List!32843)) )
))
(declare-fun arrayNoDuplicates!0 (array!95947 (_ BitVec 32) List!32843) Bool)

(assert (=> b!1403580 (= res!942088 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32840))))

(declare-fun res!942087 () Bool)

(assert (=> start!120538 (=> (not res!942087) (not e!794706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120538 (= res!942087 (validMask!0 mask!2840))))

(assert (=> start!120538 e!794706))

(assert (=> start!120538 true))

(declare-fun array_inv!35352 (array!95947) Bool)

(assert (=> start!120538 (array_inv!35352 a!2901)))

(declare-fun b!1403574 () Bool)

(declare-fun res!942086 () Bool)

(assert (=> b!1403574 (=> (not res!942086) (not e!794706))))

(assert (=> b!1403574 (= res!942086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120538 res!942087) b!1403576))

(assert (= (and b!1403576 res!942090) b!1403578))

(assert (= (and b!1403578 res!942089) b!1403575))

(assert (= (and b!1403575 res!942091) b!1403574))

(assert (= (and b!1403574 res!942086) b!1403580))

(assert (= (and b!1403580 res!942088) b!1403577))

(assert (= (and b!1403577 res!942085) b!1403579))

(declare-fun m!1292263 () Bool)

(assert (=> b!1403574 m!1292263))

(declare-fun m!1292265 () Bool)

(assert (=> b!1403578 m!1292265))

(assert (=> b!1403578 m!1292265))

(declare-fun m!1292267 () Bool)

(assert (=> b!1403578 m!1292267))

(declare-fun m!1292269 () Bool)

(assert (=> b!1403575 m!1292269))

(assert (=> b!1403575 m!1292269))

(declare-fun m!1292271 () Bool)

(assert (=> b!1403575 m!1292271))

(assert (=> b!1403579 m!1292269))

(assert (=> b!1403579 m!1292269))

(declare-fun m!1292273 () Bool)

(assert (=> b!1403579 m!1292273))

(declare-fun m!1292275 () Bool)

(assert (=> b!1403580 m!1292275))

(assert (=> b!1403577 m!1292269))

(declare-fun m!1292277 () Bool)

(assert (=> b!1403577 m!1292277))

(assert (=> b!1403577 m!1292269))

(declare-fun m!1292279 () Bool)

(assert (=> b!1403577 m!1292279))

(assert (=> b!1403577 m!1292277))

(assert (=> b!1403577 m!1292269))

(declare-fun m!1292281 () Bool)

(assert (=> b!1403577 m!1292281))

(declare-fun m!1292283 () Bool)

(assert (=> b!1403577 m!1292283))

(declare-fun m!1292285 () Bool)

(assert (=> start!120538 m!1292285))

(declare-fun m!1292287 () Bool)

(assert (=> start!120538 m!1292287))

(push 1)

(assert (not b!1403577))

(assert (not b!1403580))

(assert (not b!1403579))

(assert (not start!120538))

(assert (not b!1403574))

(assert (not b!1403578))

(assert (not b!1403575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

