; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119170 () Bool)

(assert start!119170)

(declare-fun b!1390122 () Bool)

(declare-fun res!930335 () Bool)

(declare-fun e!787280 () Bool)

(assert (=> b!1390122 (=> (not res!930335) (not e!787280))))

(declare-datatypes ((array!95060 0))(
  ( (array!95061 (arr!45896 (Array (_ BitVec 32) (_ BitVec 64))) (size!46448 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95060)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95060 (_ BitVec 32)) Bool)

(assert (=> b!1390122 (= res!930335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390123 () Bool)

(declare-fun res!930340 () Bool)

(assert (=> b!1390123 (=> (not res!930340) (not e!787280))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390123 (= res!930340 (validKeyInArray!0 (select (arr!45896 a!2901) j!112)))))

(declare-fun b!1390124 () Bool)

(declare-fun res!930336 () Bool)

(assert (=> b!1390124 (=> (not res!930336) (not e!787280))))

(declare-datatypes ((List!32493 0))(
  ( (Nil!32490) (Cons!32489 (h!33707 (_ BitVec 64)) (t!47179 List!32493)) )
))
(declare-fun arrayNoDuplicates!0 (array!95060 (_ BitVec 32) List!32493) Bool)

(assert (=> b!1390124 (= res!930336 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32490))))

(declare-fun b!1390125 () Bool)

(declare-fun res!930339 () Bool)

(assert (=> b!1390125 (=> (not res!930339) (not e!787280))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390125 (= res!930339 (and (= (size!46448 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46448 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46448 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390126 () Bool)

(declare-fun res!930338 () Bool)

(assert (=> b!1390126 (=> (not res!930338) (not e!787280))))

(assert (=> b!1390126 (= res!930338 (validKeyInArray!0 (select (arr!45896 a!2901) i!1037)))))

(declare-fun b!1390127 () Bool)

(assert (=> b!1390127 (= e!787280 (not true))))

(declare-fun e!787278 () Bool)

(assert (=> b!1390127 e!787278))

(declare-fun res!930334 () Bool)

(assert (=> b!1390127 (=> (not res!930334) (not e!787278))))

(assert (=> b!1390127 (= res!930334 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46325 0))(
  ( (Unit!46326) )
))
(declare-fun lt!610567 () Unit!46325)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46325)

(assert (=> b!1390127 (= lt!610567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10239 0))(
  ( (MissingZero!10239 (index!43327 (_ BitVec 32))) (Found!10239 (index!43328 (_ BitVec 32))) (Intermediate!10239 (undefined!11051 Bool) (index!43329 (_ BitVec 32)) (x!125002 (_ BitVec 32))) (Undefined!10239) (MissingVacant!10239 (index!43330 (_ BitVec 32))) )
))
(declare-fun lt!610568 () SeekEntryResult!10239)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95060 (_ BitVec 32)) SeekEntryResult!10239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390127 (= lt!610568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45896 a!2901) j!112) mask!2840) (select (arr!45896 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390128 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95060 (_ BitVec 32)) SeekEntryResult!10239)

(assert (=> b!1390128 (= e!787278 (= (seekEntryOrOpen!0 (select (arr!45896 a!2901) j!112) a!2901 mask!2840) (Found!10239 j!112)))))

(declare-fun res!930337 () Bool)

(assert (=> start!119170 (=> (not res!930337) (not e!787280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119170 (= res!930337 (validMask!0 mask!2840))))

(assert (=> start!119170 e!787280))

(assert (=> start!119170 true))

(declare-fun array_inv!35129 (array!95060) Bool)

(assert (=> start!119170 (array_inv!35129 a!2901)))

(assert (= (and start!119170 res!930337) b!1390125))

(assert (= (and b!1390125 res!930339) b!1390126))

(assert (= (and b!1390126 res!930338) b!1390123))

(assert (= (and b!1390123 res!930340) b!1390122))

(assert (= (and b!1390122 res!930335) b!1390124))

(assert (= (and b!1390124 res!930336) b!1390127))

(assert (= (and b!1390127 res!930334) b!1390128))

(declare-fun m!1275459 () Bool)

(assert (=> b!1390126 m!1275459))

(assert (=> b!1390126 m!1275459))

(declare-fun m!1275461 () Bool)

(assert (=> b!1390126 m!1275461))

(declare-fun m!1275463 () Bool)

(assert (=> b!1390127 m!1275463))

(declare-fun m!1275465 () Bool)

(assert (=> b!1390127 m!1275465))

(assert (=> b!1390127 m!1275463))

(declare-fun m!1275467 () Bool)

(assert (=> b!1390127 m!1275467))

(assert (=> b!1390127 m!1275465))

(assert (=> b!1390127 m!1275463))

(declare-fun m!1275469 () Bool)

(assert (=> b!1390127 m!1275469))

(declare-fun m!1275471 () Bool)

(assert (=> b!1390127 m!1275471))

(declare-fun m!1275473 () Bool)

(assert (=> b!1390122 m!1275473))

(assert (=> b!1390123 m!1275463))

(assert (=> b!1390123 m!1275463))

(declare-fun m!1275475 () Bool)

(assert (=> b!1390123 m!1275475))

(declare-fun m!1275477 () Bool)

(assert (=> start!119170 m!1275477))

(declare-fun m!1275479 () Bool)

(assert (=> start!119170 m!1275479))

(assert (=> b!1390128 m!1275463))

(assert (=> b!1390128 m!1275463))

(declare-fun m!1275481 () Bool)

(assert (=> b!1390128 m!1275481))

(declare-fun m!1275483 () Bool)

(assert (=> b!1390124 m!1275483))

(push 1)

(assert (not start!119170))

(assert (not b!1390128))

(assert (not b!1390123))

(assert (not b!1390126))

(assert (not b!1390127))

(assert (not b!1390122))

(assert (not b!1390124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

