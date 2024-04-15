; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119586 () Bool)

(assert start!119586)

(declare-fun b!1392938 () Bool)

(declare-fun res!932403 () Bool)

(declare-fun e!788769 () Bool)

(assert (=> b!1392938 (=> (not res!932403) (not e!788769))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95221 0))(
  ( (array!95222 (arr!45969 (Array (_ BitVec 32) (_ BitVec 64))) (size!46521 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95221)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1392938 (= res!932403 (and (= (size!46521 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46521 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46521 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!788771 () Bool)

(declare-fun b!1392939 () Bool)

(declare-datatypes ((SeekEntryResult!10312 0))(
  ( (MissingZero!10312 (index!43619 (_ BitVec 32))) (Found!10312 (index!43620 (_ BitVec 32))) (Intermediate!10312 (undefined!11124 Bool) (index!43621 (_ BitVec 32)) (x!125297 (_ BitVec 32))) (Undefined!10312) (MissingVacant!10312 (index!43622 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95221 (_ BitVec 32)) SeekEntryResult!10312)

(assert (=> b!1392939 (= e!788771 (= (seekEntryOrOpen!0 (select (arr!45969 a!2901) j!112) a!2901 mask!2840) (Found!10312 j!112)))))

(declare-fun b!1392940 () Bool)

(declare-fun res!932402 () Bool)

(assert (=> b!1392940 (=> (not res!932402) (not e!788769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392940 (= res!932402 (validKeyInArray!0 (select (arr!45969 a!2901) i!1037)))))

(declare-fun res!932399 () Bool)

(assert (=> start!119586 (=> (not res!932399) (not e!788769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119586 (= res!932399 (validMask!0 mask!2840))))

(assert (=> start!119586 e!788769))

(assert (=> start!119586 true))

(declare-fun array_inv!35202 (array!95221) Bool)

(assert (=> start!119586 (array_inv!35202 a!2901)))

(declare-fun b!1392941 () Bool)

(declare-fun e!788768 () Bool)

(assert (=> b!1392941 (= e!788769 (not e!788768))))

(declare-fun res!932404 () Bool)

(assert (=> b!1392941 (=> res!932404 e!788768)))

(declare-fun lt!611643 () SeekEntryResult!10312)

(assert (=> b!1392941 (= res!932404 (or (not (is-Intermediate!10312 lt!611643)) (undefined!11124 lt!611643)))))

(assert (=> b!1392941 e!788771))

(declare-fun res!932400 () Bool)

(assert (=> b!1392941 (=> (not res!932400) (not e!788771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95221 (_ BitVec 32)) Bool)

(assert (=> b!1392941 (= res!932400 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46471 0))(
  ( (Unit!46472) )
))
(declare-fun lt!611644 () Unit!46471)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46471)

(assert (=> b!1392941 (= lt!611644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95221 (_ BitVec 32)) SeekEntryResult!10312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392941 (= lt!611643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45969 a!2901) j!112) mask!2840) (select (arr!45969 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392942 () Bool)

(assert (=> b!1392942 (= e!788768 true)))

(declare-fun lt!611645 () SeekEntryResult!10312)

(assert (=> b!1392942 (= lt!611645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45969 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45969 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95222 (store (arr!45969 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46521 a!2901)) mask!2840))))

(declare-fun b!1392943 () Bool)

(declare-fun res!932397 () Bool)

(assert (=> b!1392943 (=> (not res!932397) (not e!788769))))

(assert (=> b!1392943 (= res!932397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392944 () Bool)

(declare-fun res!932398 () Bool)

(assert (=> b!1392944 (=> (not res!932398) (not e!788769))))

(declare-datatypes ((List!32566 0))(
  ( (Nil!32563) (Cons!32562 (h!33795 (_ BitVec 64)) (t!47252 List!32566)) )
))
(declare-fun arrayNoDuplicates!0 (array!95221 (_ BitVec 32) List!32566) Bool)

(assert (=> b!1392944 (= res!932398 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32563))))

(declare-fun b!1392945 () Bool)

(declare-fun res!932401 () Bool)

(assert (=> b!1392945 (=> (not res!932401) (not e!788769))))

(assert (=> b!1392945 (= res!932401 (validKeyInArray!0 (select (arr!45969 a!2901) j!112)))))

(assert (= (and start!119586 res!932399) b!1392938))

(assert (= (and b!1392938 res!932403) b!1392940))

(assert (= (and b!1392940 res!932402) b!1392945))

(assert (= (and b!1392945 res!932401) b!1392943))

(assert (= (and b!1392943 res!932397) b!1392944))

(assert (= (and b!1392944 res!932398) b!1392941))

(assert (= (and b!1392941 res!932400) b!1392939))

(assert (= (and b!1392941 (not res!932404)) b!1392942))

(declare-fun m!1278219 () Bool)

(assert (=> b!1392940 m!1278219))

(assert (=> b!1392940 m!1278219))

(declare-fun m!1278221 () Bool)

(assert (=> b!1392940 m!1278221))

(declare-fun m!1278223 () Bool)

(assert (=> b!1392944 m!1278223))

(declare-fun m!1278225 () Bool)

(assert (=> b!1392941 m!1278225))

(declare-fun m!1278227 () Bool)

(assert (=> b!1392941 m!1278227))

(assert (=> b!1392941 m!1278225))

(declare-fun m!1278229 () Bool)

(assert (=> b!1392941 m!1278229))

(assert (=> b!1392941 m!1278227))

(assert (=> b!1392941 m!1278225))

(declare-fun m!1278231 () Bool)

(assert (=> b!1392941 m!1278231))

(declare-fun m!1278233 () Bool)

(assert (=> b!1392941 m!1278233))

(declare-fun m!1278235 () Bool)

(assert (=> b!1392943 m!1278235))

(declare-fun m!1278237 () Bool)

(assert (=> start!119586 m!1278237))

(declare-fun m!1278239 () Bool)

(assert (=> start!119586 m!1278239))

(assert (=> b!1392945 m!1278225))

(assert (=> b!1392945 m!1278225))

(declare-fun m!1278241 () Bool)

(assert (=> b!1392945 m!1278241))

(assert (=> b!1392939 m!1278225))

(assert (=> b!1392939 m!1278225))

(declare-fun m!1278243 () Bool)

(assert (=> b!1392939 m!1278243))

(declare-fun m!1278245 () Bool)

(assert (=> b!1392942 m!1278245))

(declare-fun m!1278247 () Bool)

(assert (=> b!1392942 m!1278247))

(assert (=> b!1392942 m!1278247))

(declare-fun m!1278249 () Bool)

(assert (=> b!1392942 m!1278249))

(assert (=> b!1392942 m!1278249))

(assert (=> b!1392942 m!1278247))

(declare-fun m!1278251 () Bool)

(assert (=> b!1392942 m!1278251))

(push 1)

(assert (not b!1392940))

(assert (not start!119586))

(assert (not b!1392941))

(assert (not b!1392944))

(assert (not b!1392943))

(assert (not b!1392942))

(assert (not b!1392939))

(assert (not b!1392945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

