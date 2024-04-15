; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119196 () Bool)

(assert start!119196)

(declare-fun b!1390395 () Bool)

(declare-fun res!930611 () Bool)

(declare-fun e!787396 () Bool)

(assert (=> b!1390395 (=> (not res!930611) (not e!787396))))

(declare-datatypes ((array!95086 0))(
  ( (array!95087 (arr!45909 (Array (_ BitVec 32) (_ BitVec 64))) (size!46461 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95086)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95086 (_ BitVec 32)) Bool)

(assert (=> b!1390395 (= res!930611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!787397 () Bool)

(declare-fun b!1390396 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10252 0))(
  ( (MissingZero!10252 (index!43379 (_ BitVec 32))) (Found!10252 (index!43380 (_ BitVec 32))) (Intermediate!10252 (undefined!11064 Bool) (index!43381 (_ BitVec 32)) (x!125047 (_ BitVec 32))) (Undefined!10252) (MissingVacant!10252 (index!43382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95086 (_ BitVec 32)) SeekEntryResult!10252)

(assert (=> b!1390396 (= e!787397 (= (seekEntryOrOpen!0 (select (arr!45909 a!2901) j!112) a!2901 mask!2840) (Found!10252 j!112)))))

(declare-fun res!930608 () Bool)

(assert (=> start!119196 (=> (not res!930608) (not e!787396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119196 (= res!930608 (validMask!0 mask!2840))))

(assert (=> start!119196 e!787396))

(assert (=> start!119196 true))

(declare-fun array_inv!35142 (array!95086) Bool)

(assert (=> start!119196 (array_inv!35142 a!2901)))

(declare-fun b!1390397 () Bool)

(declare-fun res!930609 () Bool)

(assert (=> b!1390397 (=> (not res!930609) (not e!787396))))

(declare-datatypes ((List!32506 0))(
  ( (Nil!32503) (Cons!32502 (h!33720 (_ BitVec 64)) (t!47192 List!32506)) )
))
(declare-fun arrayNoDuplicates!0 (array!95086 (_ BitVec 32) List!32506) Bool)

(assert (=> b!1390397 (= res!930609 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32503))))

(declare-fun b!1390398 () Bool)

(declare-fun res!930612 () Bool)

(assert (=> b!1390398 (=> (not res!930612) (not e!787396))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390398 (= res!930612 (validKeyInArray!0 (select (arr!45909 a!2901) i!1037)))))

(declare-fun b!1390399 () Bool)

(declare-fun res!930613 () Bool)

(assert (=> b!1390399 (=> (not res!930613) (not e!787396))))

(assert (=> b!1390399 (= res!930613 (and (= (size!46461 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46461 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46461 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390400 () Bool)

(assert (=> b!1390400 (= e!787396 (not true))))

(assert (=> b!1390400 e!787397))

(declare-fun res!930610 () Bool)

(assert (=> b!1390400 (=> (not res!930610) (not e!787397))))

(assert (=> b!1390400 (= res!930610 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46351 0))(
  ( (Unit!46352) )
))
(declare-fun lt!610646 () Unit!46351)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46351)

(assert (=> b!1390400 (= lt!610646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610645 () SeekEntryResult!10252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95086 (_ BitVec 32)) SeekEntryResult!10252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390400 (= lt!610645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45909 a!2901) j!112) mask!2840) (select (arr!45909 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390401 () Bool)

(declare-fun res!930607 () Bool)

(assert (=> b!1390401 (=> (not res!930607) (not e!787396))))

(assert (=> b!1390401 (= res!930607 (validKeyInArray!0 (select (arr!45909 a!2901) j!112)))))

(assert (= (and start!119196 res!930608) b!1390399))

(assert (= (and b!1390399 res!930613) b!1390398))

(assert (= (and b!1390398 res!930612) b!1390401))

(assert (= (and b!1390401 res!930607) b!1390395))

(assert (= (and b!1390395 res!930611) b!1390397))

(assert (= (and b!1390397 res!930609) b!1390400))

(assert (= (and b!1390400 res!930610) b!1390396))

(declare-fun m!1275797 () Bool)

(assert (=> b!1390398 m!1275797))

(assert (=> b!1390398 m!1275797))

(declare-fun m!1275799 () Bool)

(assert (=> b!1390398 m!1275799))

(declare-fun m!1275801 () Bool)

(assert (=> b!1390401 m!1275801))

(assert (=> b!1390401 m!1275801))

(declare-fun m!1275803 () Bool)

(assert (=> b!1390401 m!1275803))

(assert (=> b!1390400 m!1275801))

(declare-fun m!1275805 () Bool)

(assert (=> b!1390400 m!1275805))

(assert (=> b!1390400 m!1275801))

(declare-fun m!1275807 () Bool)

(assert (=> b!1390400 m!1275807))

(assert (=> b!1390400 m!1275805))

(assert (=> b!1390400 m!1275801))

(declare-fun m!1275809 () Bool)

(assert (=> b!1390400 m!1275809))

(declare-fun m!1275811 () Bool)

(assert (=> b!1390400 m!1275811))

(assert (=> b!1390396 m!1275801))

(assert (=> b!1390396 m!1275801))

(declare-fun m!1275813 () Bool)

(assert (=> b!1390396 m!1275813))

(declare-fun m!1275815 () Bool)

(assert (=> b!1390397 m!1275815))

(declare-fun m!1275817 () Bool)

(assert (=> start!119196 m!1275817))

(declare-fun m!1275819 () Bool)

(assert (=> start!119196 m!1275819))

(declare-fun m!1275821 () Bool)

(assert (=> b!1390395 m!1275821))

(push 1)

(assert (not b!1390395))

(assert (not b!1390397))

(assert (not b!1390401))

(assert (not b!1390398))

(assert (not b!1390400))

(assert (not start!119196))

(assert (not b!1390396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

