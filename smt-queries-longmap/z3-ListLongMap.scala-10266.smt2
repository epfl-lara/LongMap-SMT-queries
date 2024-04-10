; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120758 () Bool)

(assert start!120758)

(declare-fun b!1405116 () Bool)

(declare-fun res!943333 () Bool)

(declare-fun e!795417 () Bool)

(assert (=> b!1405116 (=> (not res!943333) (not e!795417))))

(declare-datatypes ((array!96065 0))(
  ( (array!96066 (arr!46380 (Array (_ BitVec 32) (_ BitVec 64))) (size!46930 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96065)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405116 (= res!943333 (validKeyInArray!0 (select (arr!46380 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1405117 () Bool)

(declare-fun e!795418 () Bool)

(declare-datatypes ((SeekEntryResult!10691 0))(
  ( (MissingZero!10691 (index!45141 (_ BitVec 32))) (Found!10691 (index!45142 (_ BitVec 32))) (Intermediate!10691 (undefined!11503 Bool) (index!45143 (_ BitVec 32)) (x!126762 (_ BitVec 32))) (Undefined!10691) (MissingVacant!10691 (index!45144 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96065 (_ BitVec 32)) SeekEntryResult!10691)

(assert (=> b!1405117 (= e!795418 (= (seekEntryOrOpen!0 (select (arr!46380 a!2901) j!112) a!2901 mask!2840) (Found!10691 j!112)))))

(declare-fun b!1405118 () Bool)

(declare-fun res!943334 () Bool)

(assert (=> b!1405118 (=> (not res!943334) (not e!795417))))

(declare-datatypes ((List!32899 0))(
  ( (Nil!32896) (Cons!32895 (h!34149 (_ BitVec 64)) (t!47593 List!32899)) )
))
(declare-fun arrayNoDuplicates!0 (array!96065 (_ BitVec 32) List!32899) Bool)

(assert (=> b!1405118 (= res!943334 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32896))))

(declare-fun res!943336 () Bool)

(assert (=> start!120758 (=> (not res!943336) (not e!795417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120758 (= res!943336 (validMask!0 mask!2840))))

(assert (=> start!120758 e!795417))

(assert (=> start!120758 true))

(declare-fun array_inv!35408 (array!96065) Bool)

(assert (=> start!120758 (array_inv!35408 a!2901)))

(declare-fun b!1405119 () Bool)

(declare-fun res!943337 () Bool)

(assert (=> b!1405119 (=> (not res!943337) (not e!795417))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405119 (= res!943337 (and (= (size!46930 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46930 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46930 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405120 () Bool)

(assert (=> b!1405120 (= e!795417 (not true))))

(assert (=> b!1405120 e!795418))

(declare-fun res!943335 () Bool)

(assert (=> b!1405120 (=> (not res!943335) (not e!795418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96065 (_ BitVec 32)) Bool)

(assert (=> b!1405120 (= res!943335 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47356 0))(
  ( (Unit!47357) )
))
(declare-fun lt!618936 () Unit!47356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47356)

(assert (=> b!1405120 (= lt!618936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618935 () SeekEntryResult!10691)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96065 (_ BitVec 32)) SeekEntryResult!10691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405120 (= lt!618935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46380 a!2901) j!112) mask!2840) (select (arr!46380 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405121 () Bool)

(declare-fun res!943338 () Bool)

(assert (=> b!1405121 (=> (not res!943338) (not e!795417))))

(assert (=> b!1405121 (= res!943338 (validKeyInArray!0 (select (arr!46380 a!2901) i!1037)))))

(declare-fun b!1405122 () Bool)

(declare-fun res!943339 () Bool)

(assert (=> b!1405122 (=> (not res!943339) (not e!795417))))

(assert (=> b!1405122 (= res!943339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120758 res!943336) b!1405119))

(assert (= (and b!1405119 res!943337) b!1405121))

(assert (= (and b!1405121 res!943338) b!1405116))

(assert (= (and b!1405116 res!943333) b!1405122))

(assert (= (and b!1405122 res!943339) b!1405118))

(assert (= (and b!1405118 res!943334) b!1405120))

(assert (= (and b!1405120 res!943335) b!1405117))

(declare-fun m!1293821 () Bool)

(assert (=> b!1405116 m!1293821))

(assert (=> b!1405116 m!1293821))

(declare-fun m!1293823 () Bool)

(assert (=> b!1405116 m!1293823))

(declare-fun m!1293825 () Bool)

(assert (=> start!120758 m!1293825))

(declare-fun m!1293827 () Bool)

(assert (=> start!120758 m!1293827))

(declare-fun m!1293829 () Bool)

(assert (=> b!1405121 m!1293829))

(assert (=> b!1405121 m!1293829))

(declare-fun m!1293831 () Bool)

(assert (=> b!1405121 m!1293831))

(assert (=> b!1405117 m!1293821))

(assert (=> b!1405117 m!1293821))

(declare-fun m!1293833 () Bool)

(assert (=> b!1405117 m!1293833))

(declare-fun m!1293835 () Bool)

(assert (=> b!1405118 m!1293835))

(assert (=> b!1405120 m!1293821))

(declare-fun m!1293837 () Bool)

(assert (=> b!1405120 m!1293837))

(assert (=> b!1405120 m!1293821))

(declare-fun m!1293839 () Bool)

(assert (=> b!1405120 m!1293839))

(assert (=> b!1405120 m!1293837))

(assert (=> b!1405120 m!1293821))

(declare-fun m!1293841 () Bool)

(assert (=> b!1405120 m!1293841))

(declare-fun m!1293843 () Bool)

(assert (=> b!1405120 m!1293843))

(declare-fun m!1293845 () Bool)

(assert (=> b!1405122 m!1293845))

(check-sat (not b!1405118) (not b!1405116) (not b!1405122) (not b!1405120) (not start!120758) (not b!1405117) (not b!1405121))
