; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119160 () Bool)

(assert start!119160)

(declare-fun b!1390056 () Bool)

(declare-fun res!930221 () Bool)

(declare-fun e!787254 () Bool)

(assert (=> b!1390056 (=> (not res!930221) (not e!787254))))

(declare-datatypes ((array!95097 0))(
  ( (array!95098 (arr!45914 (Array (_ BitVec 32) (_ BitVec 64))) (size!46464 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95097)

(declare-datatypes ((List!32433 0))(
  ( (Nil!32430) (Cons!32429 (h!33647 (_ BitVec 64)) (t!47127 List!32433)) )
))
(declare-fun arrayNoDuplicates!0 (array!95097 (_ BitVec 32) List!32433) Bool)

(assert (=> b!1390056 (= res!930221 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32430))))

(declare-fun b!1390057 () Bool)

(declare-fun res!930220 () Bool)

(assert (=> b!1390057 (=> (not res!930220) (not e!787254))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390057 (= res!930220 (and (= (size!46464 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46464 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46464 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390058 () Bool)

(declare-fun res!930219 () Bool)

(assert (=> b!1390058 (=> (not res!930219) (not e!787254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390058 (= res!930219 (validKeyInArray!0 (select (arr!45914 a!2901) i!1037)))))

(declare-fun res!930222 () Bool)

(assert (=> start!119160 (=> (not res!930222) (not e!787254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119160 (= res!930222 (validMask!0 mask!2840))))

(assert (=> start!119160 e!787254))

(assert (=> start!119160 true))

(declare-fun array_inv!34942 (array!95097) Bool)

(assert (=> start!119160 (array_inv!34942 a!2901)))

(declare-fun b!1390059 () Bool)

(assert (=> b!1390059 (= e!787254 (not true))))

(declare-fun e!787256 () Bool)

(assert (=> b!1390059 e!787256))

(declare-fun res!930217 () Bool)

(assert (=> b!1390059 (=> (not res!930217) (not e!787256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95097 (_ BitVec 32)) Bool)

(assert (=> b!1390059 (= res!930217 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46466 0))(
  ( (Unit!46467) )
))
(declare-fun lt!610715 () Unit!46466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46466)

(assert (=> b!1390059 (= lt!610715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10231 0))(
  ( (MissingZero!10231 (index!43295 (_ BitVec 32))) (Found!10231 (index!43296 (_ BitVec 32))) (Intermediate!10231 (undefined!11043 Bool) (index!43297 (_ BitVec 32)) (x!124981 (_ BitVec 32))) (Undefined!10231) (MissingVacant!10231 (index!43298 (_ BitVec 32))) )
))
(declare-fun lt!610716 () SeekEntryResult!10231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95097 (_ BitVec 32)) SeekEntryResult!10231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390059 (= lt!610716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45914 a!2901) j!112) mask!2840) (select (arr!45914 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390060 () Bool)

(declare-fun res!930218 () Bool)

(assert (=> b!1390060 (=> (not res!930218) (not e!787254))))

(assert (=> b!1390060 (= res!930218 (validKeyInArray!0 (select (arr!45914 a!2901) j!112)))))

(declare-fun b!1390061 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95097 (_ BitVec 32)) SeekEntryResult!10231)

(assert (=> b!1390061 (= e!787256 (= (seekEntryOrOpen!0 (select (arr!45914 a!2901) j!112) a!2901 mask!2840) (Found!10231 j!112)))))

(declare-fun b!1390062 () Bool)

(declare-fun res!930223 () Bool)

(assert (=> b!1390062 (=> (not res!930223) (not e!787254))))

(assert (=> b!1390062 (= res!930223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119160 res!930222) b!1390057))

(assert (= (and b!1390057 res!930220) b!1390058))

(assert (= (and b!1390058 res!930219) b!1390060))

(assert (= (and b!1390060 res!930218) b!1390062))

(assert (= (and b!1390062 res!930223) b!1390056))

(assert (= (and b!1390056 res!930221) b!1390059))

(assert (= (and b!1390059 res!930217) b!1390061))

(declare-fun m!1275813 () Bool)

(assert (=> b!1390061 m!1275813))

(assert (=> b!1390061 m!1275813))

(declare-fun m!1275815 () Bool)

(assert (=> b!1390061 m!1275815))

(declare-fun m!1275817 () Bool)

(assert (=> start!119160 m!1275817))

(declare-fun m!1275819 () Bool)

(assert (=> start!119160 m!1275819))

(declare-fun m!1275821 () Bool)

(assert (=> b!1390062 m!1275821))

(declare-fun m!1275823 () Bool)

(assert (=> b!1390056 m!1275823))

(declare-fun m!1275825 () Bool)

(assert (=> b!1390058 m!1275825))

(assert (=> b!1390058 m!1275825))

(declare-fun m!1275827 () Bool)

(assert (=> b!1390058 m!1275827))

(assert (=> b!1390059 m!1275813))

(declare-fun m!1275829 () Bool)

(assert (=> b!1390059 m!1275829))

(assert (=> b!1390059 m!1275813))

(declare-fun m!1275831 () Bool)

(assert (=> b!1390059 m!1275831))

(assert (=> b!1390059 m!1275829))

(assert (=> b!1390059 m!1275813))

(declare-fun m!1275833 () Bool)

(assert (=> b!1390059 m!1275833))

(declare-fun m!1275835 () Bool)

(assert (=> b!1390059 m!1275835))

(assert (=> b!1390060 m!1275813))

(assert (=> b!1390060 m!1275813))

(declare-fun m!1275837 () Bool)

(assert (=> b!1390060 m!1275837))

(push 1)

(assert (not b!1390062))

(assert (not start!119160))

(assert (not b!1390058))

(assert (not b!1390056))

(assert (not b!1390060))

(assert (not b!1390061))

(assert (not b!1390059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

