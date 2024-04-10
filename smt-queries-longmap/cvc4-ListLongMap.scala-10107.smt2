; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119140 () Bool)

(assert start!119140)

(declare-fun b!1389865 () Bool)

(declare-fun res!930030 () Bool)

(declare-fun e!787183 () Bool)

(assert (=> b!1389865 (=> (not res!930030) (not e!787183))))

(declare-datatypes ((array!95077 0))(
  ( (array!95078 (arr!45904 (Array (_ BitVec 32) (_ BitVec 64))) (size!46454 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95077)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389865 (= res!930030 (validKeyInArray!0 (select (arr!45904 a!2901) j!112)))))

(declare-fun b!1389866 () Bool)

(declare-fun res!930028 () Bool)

(assert (=> b!1389866 (=> (not res!930028) (not e!787183))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95077 (_ BitVec 32)) Bool)

(assert (=> b!1389866 (= res!930028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930029 () Bool)

(assert (=> start!119140 (=> (not res!930029) (not e!787183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119140 (= res!930029 (validMask!0 mask!2840))))

(assert (=> start!119140 e!787183))

(assert (=> start!119140 true))

(declare-fun array_inv!34932 (array!95077) Bool)

(assert (=> start!119140 (array_inv!34932 a!2901)))

(declare-fun b!1389867 () Bool)

(declare-fun res!930031 () Bool)

(assert (=> b!1389867 (=> (not res!930031) (not e!787183))))

(declare-datatypes ((List!32423 0))(
  ( (Nil!32420) (Cons!32419 (h!33637 (_ BitVec 64)) (t!47117 List!32423)) )
))
(declare-fun arrayNoDuplicates!0 (array!95077 (_ BitVec 32) List!32423) Bool)

(assert (=> b!1389867 (= res!930031 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32420))))

(declare-fun b!1389868 () Bool)

(assert (=> b!1389868 (= e!787183 (not (bvsge mask!2840 #b00000000000000000000000000000000)))))

(assert (=> b!1389868 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46446 0))(
  ( (Unit!46447) )
))
(declare-fun lt!610656 () Unit!46446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46446)

(assert (=> b!1389868 (= lt!610656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10221 0))(
  ( (MissingZero!10221 (index!43255 (_ BitVec 32))) (Found!10221 (index!43256 (_ BitVec 32))) (Intermediate!10221 (undefined!11033 Bool) (index!43257 (_ BitVec 32)) (x!124939 (_ BitVec 32))) (Undefined!10221) (MissingVacant!10221 (index!43258 (_ BitVec 32))) )
))
(declare-fun lt!610655 () SeekEntryResult!10221)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95077 (_ BitVec 32)) SeekEntryResult!10221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389868 (= lt!610655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45904 a!2901) j!112) mask!2840) (select (arr!45904 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389869 () Bool)

(declare-fun res!930026 () Bool)

(assert (=> b!1389869 (=> (not res!930026) (not e!787183))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389869 (= res!930026 (validKeyInArray!0 (select (arr!45904 a!2901) i!1037)))))

(declare-fun b!1389870 () Bool)

(declare-fun res!930027 () Bool)

(assert (=> b!1389870 (=> (not res!930027) (not e!787183))))

(assert (=> b!1389870 (= res!930027 (and (= (size!46454 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46454 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46454 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119140 res!930029) b!1389870))

(assert (= (and b!1389870 res!930027) b!1389869))

(assert (= (and b!1389869 res!930026) b!1389865))

(assert (= (and b!1389865 res!930030) b!1389866))

(assert (= (and b!1389866 res!930028) b!1389867))

(assert (= (and b!1389867 res!930031) b!1389868))

(declare-fun m!1275567 () Bool)

(assert (=> b!1389869 m!1275567))

(assert (=> b!1389869 m!1275567))

(declare-fun m!1275569 () Bool)

(assert (=> b!1389869 m!1275569))

(declare-fun m!1275571 () Bool)

(assert (=> b!1389868 m!1275571))

(declare-fun m!1275573 () Bool)

(assert (=> b!1389868 m!1275573))

(assert (=> b!1389868 m!1275571))

(declare-fun m!1275575 () Bool)

(assert (=> b!1389868 m!1275575))

(assert (=> b!1389868 m!1275573))

(assert (=> b!1389868 m!1275571))

(declare-fun m!1275577 () Bool)

(assert (=> b!1389868 m!1275577))

(declare-fun m!1275579 () Bool)

(assert (=> b!1389868 m!1275579))

(declare-fun m!1275581 () Bool)

(assert (=> b!1389866 m!1275581))

(declare-fun m!1275583 () Bool)

(assert (=> start!119140 m!1275583))

(declare-fun m!1275585 () Bool)

(assert (=> start!119140 m!1275585))

(assert (=> b!1389865 m!1275571))

(assert (=> b!1389865 m!1275571))

(declare-fun m!1275587 () Bool)

(assert (=> b!1389865 m!1275587))

(declare-fun m!1275589 () Bool)

(assert (=> b!1389867 m!1275589))

(push 1)

(assert (not start!119140))

(assert (not b!1389865))

(assert (not b!1389867))

(assert (not b!1389866))

(assert (not b!1389868))

(assert (not b!1389869))

(check-sat)

(pop 1)

