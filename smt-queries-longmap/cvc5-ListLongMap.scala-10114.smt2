; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119178 () Bool)

(assert start!119178)

(declare-fun b!1390245 () Bool)

(declare-fun res!930411 () Bool)

(declare-fun e!787336 () Bool)

(assert (=> b!1390245 (=> (not res!930411) (not e!787336))))

(declare-datatypes ((array!95115 0))(
  ( (array!95116 (arr!45923 (Array (_ BitVec 32) (_ BitVec 64))) (size!46473 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95115)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390245 (= res!930411 (validKeyInArray!0 (select (arr!45923 a!2901) i!1037)))))

(declare-fun b!1390246 () Bool)

(declare-fun res!930409 () Bool)

(assert (=> b!1390246 (=> (not res!930409) (not e!787336))))

(declare-datatypes ((List!32442 0))(
  ( (Nil!32439) (Cons!32438 (h!33656 (_ BitVec 64)) (t!47136 List!32442)) )
))
(declare-fun arrayNoDuplicates!0 (array!95115 (_ BitVec 32) List!32442) Bool)

(assert (=> b!1390246 (= res!930409 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32439))))

(declare-fun b!1390247 () Bool)

(declare-fun res!930406 () Bool)

(assert (=> b!1390247 (=> (not res!930406) (not e!787336))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390247 (= res!930406 (and (= (size!46473 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46473 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46473 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390248 () Bool)

(assert (=> b!1390248 (= e!787336 (not true))))

(declare-fun e!787335 () Bool)

(assert (=> b!1390248 e!787335))

(declare-fun res!930407 () Bool)

(assert (=> b!1390248 (=> (not res!930407) (not e!787335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95115 (_ BitVec 32)) Bool)

(assert (=> b!1390248 (= res!930407 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46484 0))(
  ( (Unit!46485) )
))
(declare-fun lt!610769 () Unit!46484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46484)

(assert (=> b!1390248 (= lt!610769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10240 0))(
  ( (MissingZero!10240 (index!43331 (_ BitVec 32))) (Found!10240 (index!43332 (_ BitVec 32))) (Intermediate!10240 (undefined!11052 Bool) (index!43333 (_ BitVec 32)) (x!125014 (_ BitVec 32))) (Undefined!10240) (MissingVacant!10240 (index!43334 (_ BitVec 32))) )
))
(declare-fun lt!610770 () SeekEntryResult!10240)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95115 (_ BitVec 32)) SeekEntryResult!10240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390248 (= lt!610770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45923 a!2901) j!112) mask!2840) (select (arr!45923 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390249 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95115 (_ BitVec 32)) SeekEntryResult!10240)

(assert (=> b!1390249 (= e!787335 (= (seekEntryOrOpen!0 (select (arr!45923 a!2901) j!112) a!2901 mask!2840) (Found!10240 j!112)))))

(declare-fun res!930410 () Bool)

(assert (=> start!119178 (=> (not res!930410) (not e!787336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119178 (= res!930410 (validMask!0 mask!2840))))

(assert (=> start!119178 e!787336))

(assert (=> start!119178 true))

(declare-fun array_inv!34951 (array!95115) Bool)

(assert (=> start!119178 (array_inv!34951 a!2901)))

(declare-fun b!1390250 () Bool)

(declare-fun res!930408 () Bool)

(assert (=> b!1390250 (=> (not res!930408) (not e!787336))))

(assert (=> b!1390250 (= res!930408 (validKeyInArray!0 (select (arr!45923 a!2901) j!112)))))

(declare-fun b!1390251 () Bool)

(declare-fun res!930412 () Bool)

(assert (=> b!1390251 (=> (not res!930412) (not e!787336))))

(assert (=> b!1390251 (= res!930412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119178 res!930410) b!1390247))

(assert (= (and b!1390247 res!930406) b!1390245))

(assert (= (and b!1390245 res!930411) b!1390250))

(assert (= (and b!1390250 res!930408) b!1390251))

(assert (= (and b!1390251 res!930412) b!1390246))

(assert (= (and b!1390246 res!930409) b!1390248))

(assert (= (and b!1390248 res!930407) b!1390249))

(declare-fun m!1276047 () Bool)

(assert (=> b!1390246 m!1276047))

(declare-fun m!1276049 () Bool)

(assert (=> start!119178 m!1276049))

(declare-fun m!1276051 () Bool)

(assert (=> start!119178 m!1276051))

(declare-fun m!1276053 () Bool)

(assert (=> b!1390250 m!1276053))

(assert (=> b!1390250 m!1276053))

(declare-fun m!1276055 () Bool)

(assert (=> b!1390250 m!1276055))

(declare-fun m!1276057 () Bool)

(assert (=> b!1390245 m!1276057))

(assert (=> b!1390245 m!1276057))

(declare-fun m!1276059 () Bool)

(assert (=> b!1390245 m!1276059))

(assert (=> b!1390249 m!1276053))

(assert (=> b!1390249 m!1276053))

(declare-fun m!1276061 () Bool)

(assert (=> b!1390249 m!1276061))

(declare-fun m!1276063 () Bool)

(assert (=> b!1390251 m!1276063))

(assert (=> b!1390248 m!1276053))

(declare-fun m!1276065 () Bool)

(assert (=> b!1390248 m!1276065))

(assert (=> b!1390248 m!1276053))

(declare-fun m!1276067 () Bool)

(assert (=> b!1390248 m!1276067))

(assert (=> b!1390248 m!1276065))

(assert (=> b!1390248 m!1276053))

(declare-fun m!1276069 () Bool)

(assert (=> b!1390248 m!1276069))

(declare-fun m!1276071 () Bool)

(assert (=> b!1390248 m!1276071))

(push 1)

(assert (not b!1390250))

(assert (not b!1390248))

(assert (not start!119178))

(assert (not b!1390246))

(assert (not b!1390245))

(assert (not b!1390251))

(assert (not b!1390249))

(check-sat)

