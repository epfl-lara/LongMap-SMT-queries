; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119166 () Bool)

(assert start!119166)

(declare-fun res!930280 () Bool)

(declare-fun e!787283 () Bool)

(assert (=> start!119166 (=> (not res!930280) (not e!787283))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119166 (= res!930280 (validMask!0 mask!2840))))

(assert (=> start!119166 e!787283))

(assert (=> start!119166 true))

(declare-datatypes ((array!95103 0))(
  ( (array!95104 (arr!45917 (Array (_ BitVec 32) (_ BitVec 64))) (size!46467 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95103)

(declare-fun array_inv!34945 (array!95103) Bool)

(assert (=> start!119166 (array_inv!34945 a!2901)))

(declare-fun b!1390119 () Bool)

(declare-fun res!930281 () Bool)

(assert (=> b!1390119 (=> (not res!930281) (not e!787283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95103 (_ BitVec 32)) Bool)

(assert (=> b!1390119 (= res!930281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390120 () Bool)

(declare-fun res!930282 () Bool)

(assert (=> b!1390120 (=> (not res!930282) (not e!787283))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390120 (= res!930282 (validKeyInArray!0 (select (arr!45917 a!2901) i!1037)))))

(declare-fun b!1390121 () Bool)

(declare-fun res!930283 () Bool)

(assert (=> b!1390121 (=> (not res!930283) (not e!787283))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390121 (= res!930283 (validKeyInArray!0 (select (arr!45917 a!2901) j!112)))))

(declare-fun b!1390122 () Bool)

(assert (=> b!1390122 (= e!787283 (not true))))

(declare-fun e!787282 () Bool)

(assert (=> b!1390122 e!787282))

(declare-fun res!930285 () Bool)

(assert (=> b!1390122 (=> (not res!930285) (not e!787282))))

(assert (=> b!1390122 (= res!930285 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46472 0))(
  ( (Unit!46473) )
))
(declare-fun lt!610733 () Unit!46472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46472)

(assert (=> b!1390122 (= lt!610733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10234 0))(
  ( (MissingZero!10234 (index!43307 (_ BitVec 32))) (Found!10234 (index!43308 (_ BitVec 32))) (Intermediate!10234 (undefined!11046 Bool) (index!43309 (_ BitVec 32)) (x!124992 (_ BitVec 32))) (Undefined!10234) (MissingVacant!10234 (index!43310 (_ BitVec 32))) )
))
(declare-fun lt!610734 () SeekEntryResult!10234)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95103 (_ BitVec 32)) SeekEntryResult!10234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390122 (= lt!610734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45917 a!2901) j!112) mask!2840) (select (arr!45917 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390123 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95103 (_ BitVec 32)) SeekEntryResult!10234)

(assert (=> b!1390123 (= e!787282 (= (seekEntryOrOpen!0 (select (arr!45917 a!2901) j!112) a!2901 mask!2840) (Found!10234 j!112)))))

(declare-fun b!1390124 () Bool)

(declare-fun res!930284 () Bool)

(assert (=> b!1390124 (=> (not res!930284) (not e!787283))))

(declare-datatypes ((List!32436 0))(
  ( (Nil!32433) (Cons!32432 (h!33650 (_ BitVec 64)) (t!47130 List!32436)) )
))
(declare-fun arrayNoDuplicates!0 (array!95103 (_ BitVec 32) List!32436) Bool)

(assert (=> b!1390124 (= res!930284 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32433))))

(declare-fun b!1390125 () Bool)

(declare-fun res!930286 () Bool)

(assert (=> b!1390125 (=> (not res!930286) (not e!787283))))

(assert (=> b!1390125 (= res!930286 (and (= (size!46467 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46467 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46467 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119166 res!930280) b!1390125))

(assert (= (and b!1390125 res!930286) b!1390120))

(assert (= (and b!1390120 res!930282) b!1390121))

(assert (= (and b!1390121 res!930283) b!1390119))

(assert (= (and b!1390119 res!930281) b!1390124))

(assert (= (and b!1390124 res!930284) b!1390122))

(assert (= (and b!1390122 res!930285) b!1390123))

(declare-fun m!1275891 () Bool)

(assert (=> b!1390124 m!1275891))

(declare-fun m!1275893 () Bool)

(assert (=> b!1390119 m!1275893))

(declare-fun m!1275895 () Bool)

(assert (=> b!1390122 m!1275895))

(declare-fun m!1275897 () Bool)

(assert (=> b!1390122 m!1275897))

(assert (=> b!1390122 m!1275895))

(declare-fun m!1275899 () Bool)

(assert (=> b!1390122 m!1275899))

(assert (=> b!1390122 m!1275897))

(assert (=> b!1390122 m!1275895))

(declare-fun m!1275901 () Bool)

(assert (=> b!1390122 m!1275901))

(declare-fun m!1275903 () Bool)

(assert (=> b!1390122 m!1275903))

(declare-fun m!1275905 () Bool)

(assert (=> start!119166 m!1275905))

(declare-fun m!1275907 () Bool)

(assert (=> start!119166 m!1275907))

(assert (=> b!1390123 m!1275895))

(assert (=> b!1390123 m!1275895))

(declare-fun m!1275909 () Bool)

(assert (=> b!1390123 m!1275909))

(assert (=> b!1390121 m!1275895))

(assert (=> b!1390121 m!1275895))

(declare-fun m!1275911 () Bool)

(assert (=> b!1390121 m!1275911))

(declare-fun m!1275913 () Bool)

(assert (=> b!1390120 m!1275913))

(assert (=> b!1390120 m!1275913))

(declare-fun m!1275915 () Bool)

(assert (=> b!1390120 m!1275915))

(push 1)

(assert (not b!1390124))

(assert (not b!1390122))

(assert (not b!1390123))

(assert (not b!1390120))

(assert (not start!119166))

(assert (not b!1390119))

(assert (not b!1390121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

