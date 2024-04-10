; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119142 () Bool)

(assert start!119142)

(declare-fun b!1389883 () Bool)

(declare-fun res!930045 () Bool)

(declare-fun e!787189 () Bool)

(assert (=> b!1389883 (=> (not res!930045) (not e!787189))))

(declare-datatypes ((array!95079 0))(
  ( (array!95080 (arr!45905 (Array (_ BitVec 32) (_ BitVec 64))) (size!46455 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95079)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389883 (= res!930045 (validKeyInArray!0 (select (arr!45905 a!2901) j!112)))))

(declare-fun b!1389884 () Bool)

(declare-fun res!930049 () Bool)

(assert (=> b!1389884 (=> (not res!930049) (not e!787189))))

(declare-datatypes ((List!32424 0))(
  ( (Nil!32421) (Cons!32420 (h!33638 (_ BitVec 64)) (t!47118 List!32424)) )
))
(declare-fun arrayNoDuplicates!0 (array!95079 (_ BitVec 32) List!32424) Bool)

(assert (=> b!1389884 (= res!930049 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32421))))

(declare-fun b!1389885 () Bool)

(declare-fun res!930044 () Bool)

(assert (=> b!1389885 (=> (not res!930044) (not e!787189))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389885 (= res!930044 (and (= (size!46455 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46455 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46455 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389886 () Bool)

(assert (=> b!1389886 (= e!787189 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95079 (_ BitVec 32)) Bool)

(assert (=> b!1389886 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46448 0))(
  ( (Unit!46449) )
))
(declare-fun lt!610661 () Unit!46448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46448)

(assert (=> b!1389886 (= lt!610661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10222 0))(
  ( (MissingZero!10222 (index!43259 (_ BitVec 32))) (Found!10222 (index!43260 (_ BitVec 32))) (Intermediate!10222 (undefined!11034 Bool) (index!43261 (_ BitVec 32)) (x!124948 (_ BitVec 32))) (Undefined!10222) (MissingVacant!10222 (index!43262 (_ BitVec 32))) )
))
(declare-fun lt!610662 () SeekEntryResult!10222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95079 (_ BitVec 32)) SeekEntryResult!10222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389886 (= lt!610662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45905 a!2901) j!112) mask!2840) (select (arr!45905 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389887 () Bool)

(declare-fun res!930047 () Bool)

(assert (=> b!1389887 (=> (not res!930047) (not e!787189))))

(assert (=> b!1389887 (= res!930047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389888 () Bool)

(declare-fun res!930046 () Bool)

(assert (=> b!1389888 (=> (not res!930046) (not e!787189))))

(assert (=> b!1389888 (= res!930046 (validKeyInArray!0 (select (arr!45905 a!2901) i!1037)))))

(declare-fun res!930048 () Bool)

(assert (=> start!119142 (=> (not res!930048) (not e!787189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119142 (= res!930048 (validMask!0 mask!2840))))

(assert (=> start!119142 e!787189))

(assert (=> start!119142 true))

(declare-fun array_inv!34933 (array!95079) Bool)

(assert (=> start!119142 (array_inv!34933 a!2901)))

(assert (= (and start!119142 res!930048) b!1389885))

(assert (= (and b!1389885 res!930044) b!1389888))

(assert (= (and b!1389888 res!930046) b!1389883))

(assert (= (and b!1389883 res!930045) b!1389887))

(assert (= (and b!1389887 res!930047) b!1389884))

(assert (= (and b!1389884 res!930049) b!1389886))

(declare-fun m!1275591 () Bool)

(assert (=> b!1389884 m!1275591))

(declare-fun m!1275593 () Bool)

(assert (=> b!1389887 m!1275593))

(declare-fun m!1275595 () Bool)

(assert (=> b!1389883 m!1275595))

(assert (=> b!1389883 m!1275595))

(declare-fun m!1275597 () Bool)

(assert (=> b!1389883 m!1275597))

(declare-fun m!1275599 () Bool)

(assert (=> start!119142 m!1275599))

(declare-fun m!1275601 () Bool)

(assert (=> start!119142 m!1275601))

(declare-fun m!1275603 () Bool)

(assert (=> b!1389888 m!1275603))

(assert (=> b!1389888 m!1275603))

(declare-fun m!1275605 () Bool)

(assert (=> b!1389888 m!1275605))

(assert (=> b!1389886 m!1275595))

(declare-fun m!1275607 () Bool)

(assert (=> b!1389886 m!1275607))

(assert (=> b!1389886 m!1275595))

(declare-fun m!1275609 () Bool)

(assert (=> b!1389886 m!1275609))

(assert (=> b!1389886 m!1275607))

(assert (=> b!1389886 m!1275595))

(declare-fun m!1275611 () Bool)

(assert (=> b!1389886 m!1275611))

(declare-fun m!1275613 () Bool)

(assert (=> b!1389886 m!1275613))

(push 1)

(assert (not b!1389888))

(assert (not b!1389883))

(assert (not b!1389884))

(assert (not b!1389886))

(assert (not start!119142))

(assert (not b!1389887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

