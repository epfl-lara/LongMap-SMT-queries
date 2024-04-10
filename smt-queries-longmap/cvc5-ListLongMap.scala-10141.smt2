; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119610 () Bool)

(assert start!119610)

(declare-fun res!932671 () Bool)

(declare-fun e!788928 () Bool)

(assert (=> start!119610 (=> (not res!932671) (not e!788928))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119610 (= res!932671 (validMask!0 mask!2840))))

(assert (=> start!119610 e!788928))

(assert (=> start!119610 true))

(declare-datatypes ((array!95292 0))(
  ( (array!95293 (arr!46004 (Array (_ BitVec 32) (_ BitVec 64))) (size!46554 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95292)

(declare-fun array_inv!35032 (array!95292) Bool)

(assert (=> start!119610 (array_inv!35032 a!2901)))

(declare-fun b!1393259 () Bool)

(declare-fun res!932674 () Bool)

(assert (=> b!1393259 (=> (not res!932674) (not e!788928))))

(declare-datatypes ((List!32523 0))(
  ( (Nil!32520) (Cons!32519 (h!33752 (_ BitVec 64)) (t!47217 List!32523)) )
))
(declare-fun arrayNoDuplicates!0 (array!95292 (_ BitVec 32) List!32523) Bool)

(assert (=> b!1393259 (= res!932674 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32520))))

(declare-fun b!1393260 () Bool)

(declare-fun res!932673 () Bool)

(assert (=> b!1393260 (=> (not res!932673) (not e!788928))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393260 (= res!932673 (and (= (size!46554 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46554 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46554 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393261 () Bool)

(declare-fun e!788927 () Bool)

(assert (=> b!1393261 (= e!788927 true)))

(declare-datatypes ((SeekEntryResult!10321 0))(
  ( (MissingZero!10321 (index!43655 (_ BitVec 32))) (Found!10321 (index!43656 (_ BitVec 32))) (Intermediate!10321 (undefined!11133 Bool) (index!43657 (_ BitVec 32)) (x!125341 (_ BitVec 32))) (Undefined!10321) (MissingVacant!10321 (index!43658 (_ BitVec 32))) )
))
(declare-fun lt!611923 () SeekEntryResult!10321)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95292 (_ BitVec 32)) SeekEntryResult!10321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393261 (= lt!611923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46004 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46004 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95293 (store (arr!46004 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46554 a!2901)) mask!2840))))

(declare-fun b!1393262 () Bool)

(declare-fun e!788929 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95292 (_ BitVec 32)) SeekEntryResult!10321)

(assert (=> b!1393262 (= e!788929 (= (seekEntryOrOpen!0 (select (arr!46004 a!2901) j!112) a!2901 mask!2840) (Found!10321 j!112)))))

(declare-fun b!1393263 () Bool)

(assert (=> b!1393263 (= e!788928 (not e!788927))))

(declare-fun res!932672 () Bool)

(assert (=> b!1393263 (=> res!932672 e!788927)))

(declare-fun lt!611925 () SeekEntryResult!10321)

(assert (=> b!1393263 (= res!932672 (or (not (is-Intermediate!10321 lt!611925)) (undefined!11133 lt!611925)))))

(assert (=> b!1393263 e!788929))

(declare-fun res!932668 () Bool)

(assert (=> b!1393263 (=> (not res!932668) (not e!788929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95292 (_ BitVec 32)) Bool)

(assert (=> b!1393263 (= res!932668 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46646 0))(
  ( (Unit!46647) )
))
(declare-fun lt!611924 () Unit!46646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46646)

(assert (=> b!1393263 (= lt!611924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393263 (= lt!611925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46004 a!2901) j!112) mask!2840) (select (arr!46004 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393264 () Bool)

(declare-fun res!932667 () Bool)

(assert (=> b!1393264 (=> (not res!932667) (not e!788928))))

(assert (=> b!1393264 (= res!932667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393265 () Bool)

(declare-fun res!932670 () Bool)

(assert (=> b!1393265 (=> (not res!932670) (not e!788928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393265 (= res!932670 (validKeyInArray!0 (select (arr!46004 a!2901) j!112)))))

(declare-fun b!1393266 () Bool)

(declare-fun res!932669 () Bool)

(assert (=> b!1393266 (=> (not res!932669) (not e!788928))))

(assert (=> b!1393266 (= res!932669 (validKeyInArray!0 (select (arr!46004 a!2901) i!1037)))))

(assert (= (and start!119610 res!932671) b!1393260))

(assert (= (and b!1393260 res!932673) b!1393266))

(assert (= (and b!1393266 res!932669) b!1393265))

(assert (= (and b!1393265 res!932670) b!1393264))

(assert (= (and b!1393264 res!932667) b!1393259))

(assert (= (and b!1393259 res!932674) b!1393263))

(assert (= (and b!1393263 res!932668) b!1393262))

(assert (= (and b!1393263 (not res!932672)) b!1393261))

(declare-fun m!1279095 () Bool)

(assert (=> b!1393262 m!1279095))

(assert (=> b!1393262 m!1279095))

(declare-fun m!1279097 () Bool)

(assert (=> b!1393262 m!1279097))

(declare-fun m!1279099 () Bool)

(assert (=> b!1393259 m!1279099))

(declare-fun m!1279101 () Bool)

(assert (=> start!119610 m!1279101))

(declare-fun m!1279103 () Bool)

(assert (=> start!119610 m!1279103))

(declare-fun m!1279105 () Bool)

(assert (=> b!1393264 m!1279105))

(declare-fun m!1279107 () Bool)

(assert (=> b!1393266 m!1279107))

(assert (=> b!1393266 m!1279107))

(declare-fun m!1279109 () Bool)

(assert (=> b!1393266 m!1279109))

(declare-fun m!1279111 () Bool)

(assert (=> b!1393261 m!1279111))

(declare-fun m!1279113 () Bool)

(assert (=> b!1393261 m!1279113))

(assert (=> b!1393261 m!1279113))

(declare-fun m!1279115 () Bool)

(assert (=> b!1393261 m!1279115))

(assert (=> b!1393261 m!1279115))

(assert (=> b!1393261 m!1279113))

(declare-fun m!1279117 () Bool)

(assert (=> b!1393261 m!1279117))

(assert (=> b!1393265 m!1279095))

(assert (=> b!1393265 m!1279095))

(declare-fun m!1279119 () Bool)

(assert (=> b!1393265 m!1279119))

(assert (=> b!1393263 m!1279095))

(declare-fun m!1279121 () Bool)

(assert (=> b!1393263 m!1279121))

(assert (=> b!1393263 m!1279095))

(declare-fun m!1279123 () Bool)

(assert (=> b!1393263 m!1279123))

(assert (=> b!1393263 m!1279121))

(assert (=> b!1393263 m!1279095))

(declare-fun m!1279125 () Bool)

(assert (=> b!1393263 m!1279125))

(declare-fun m!1279127 () Bool)

(assert (=> b!1393263 m!1279127))

(push 1)

(assert (not start!119610))

(assert (not b!1393262))

(assert (not b!1393263))

(assert (not b!1393264))

(assert (not b!1393266))

(assert (not b!1393259))

(assert (not b!1393261))

(assert (not b!1393265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

