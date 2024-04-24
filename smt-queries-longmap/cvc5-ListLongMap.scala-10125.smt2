; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119544 () Bool)

(assert start!119544)

(declare-fun b!1392576 () Bool)

(declare-fun res!931761 () Bool)

(declare-fun e!788676 () Bool)

(assert (=> b!1392576 (=> (not res!931761) (not e!788676))))

(declare-datatypes ((array!95301 0))(
  ( (array!95302 (arr!46011 (Array (_ BitVec 32) (_ BitVec 64))) (size!46562 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95301)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392576 (= res!931761 (validKeyInArray!0 (select (arr!46011 a!2901) j!112)))))

(declare-fun res!931764 () Bool)

(assert (=> start!119544 (=> (not res!931764) (not e!788676))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119544 (= res!931764 (validMask!0 mask!2840))))

(assert (=> start!119544 e!788676))

(assert (=> start!119544 true))

(declare-fun array_inv!35292 (array!95301) Bool)

(assert (=> start!119544 (array_inv!35292 a!2901)))

(declare-fun b!1392577 () Bool)

(assert (=> b!1392577 (= e!788676 (not true))))

(declare-fun e!788677 () Bool)

(assert (=> b!1392577 e!788677))

(declare-fun res!931759 () Bool)

(assert (=> b!1392577 (=> (not res!931759) (not e!788677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95301 (_ BitVec 32)) Bool)

(assert (=> b!1392577 (= res!931759 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46493 0))(
  ( (Unit!46494) )
))
(declare-fun lt!611602 () Unit!46493)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46493)

(assert (=> b!1392577 (= lt!611602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10231 0))(
  ( (MissingZero!10231 (index!43295 (_ BitVec 32))) (Found!10231 (index!43296 (_ BitVec 32))) (Intermediate!10231 (undefined!11043 Bool) (index!43297 (_ BitVec 32)) (x!125124 (_ BitVec 32))) (Undefined!10231) (MissingVacant!10231 (index!43298 (_ BitVec 32))) )
))
(declare-fun lt!611603 () SeekEntryResult!10231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95301 (_ BitVec 32)) SeekEntryResult!10231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392577 (= lt!611603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46011 a!2901) j!112) mask!2840) (select (arr!46011 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392578 () Bool)

(declare-fun res!931765 () Bool)

(assert (=> b!1392578 (=> (not res!931765) (not e!788676))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392578 (= res!931765 (validKeyInArray!0 (select (arr!46011 a!2901) i!1037)))))

(declare-fun b!1392579 () Bool)

(declare-fun res!931760 () Bool)

(assert (=> b!1392579 (=> (not res!931760) (not e!788676))))

(assert (=> b!1392579 (= res!931760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392580 () Bool)

(declare-fun res!931763 () Bool)

(assert (=> b!1392580 (=> (not res!931763) (not e!788676))))

(assert (=> b!1392580 (= res!931763 (and (= (size!46562 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46562 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46562 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392581 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95301 (_ BitVec 32)) SeekEntryResult!10231)

(assert (=> b!1392581 (= e!788677 (= (seekEntryOrOpen!0 (select (arr!46011 a!2901) j!112) a!2901 mask!2840) (Found!10231 j!112)))))

(declare-fun b!1392582 () Bool)

(declare-fun res!931762 () Bool)

(assert (=> b!1392582 (=> (not res!931762) (not e!788676))))

(declare-datatypes ((List!32517 0))(
  ( (Nil!32514) (Cons!32513 (h!33745 (_ BitVec 64)) (t!47203 List!32517)) )
))
(declare-fun arrayNoDuplicates!0 (array!95301 (_ BitVec 32) List!32517) Bool)

(assert (=> b!1392582 (= res!931762 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32514))))

(assert (= (and start!119544 res!931764) b!1392580))

(assert (= (and b!1392580 res!931763) b!1392578))

(assert (= (and b!1392578 res!931765) b!1392576))

(assert (= (and b!1392576 res!931761) b!1392579))

(assert (= (and b!1392579 res!931760) b!1392582))

(assert (= (and b!1392582 res!931762) b!1392577))

(assert (= (and b!1392577 res!931759) b!1392581))

(declare-fun m!1278587 () Bool)

(assert (=> b!1392578 m!1278587))

(assert (=> b!1392578 m!1278587))

(declare-fun m!1278589 () Bool)

(assert (=> b!1392578 m!1278589))

(declare-fun m!1278591 () Bool)

(assert (=> b!1392581 m!1278591))

(assert (=> b!1392581 m!1278591))

(declare-fun m!1278593 () Bool)

(assert (=> b!1392581 m!1278593))

(declare-fun m!1278595 () Bool)

(assert (=> b!1392579 m!1278595))

(assert (=> b!1392576 m!1278591))

(assert (=> b!1392576 m!1278591))

(declare-fun m!1278597 () Bool)

(assert (=> b!1392576 m!1278597))

(assert (=> b!1392577 m!1278591))

(declare-fun m!1278599 () Bool)

(assert (=> b!1392577 m!1278599))

(assert (=> b!1392577 m!1278591))

(declare-fun m!1278601 () Bool)

(assert (=> b!1392577 m!1278601))

(assert (=> b!1392577 m!1278599))

(assert (=> b!1392577 m!1278591))

(declare-fun m!1278603 () Bool)

(assert (=> b!1392577 m!1278603))

(declare-fun m!1278605 () Bool)

(assert (=> b!1392577 m!1278605))

(declare-fun m!1278607 () Bool)

(assert (=> start!119544 m!1278607))

(declare-fun m!1278609 () Bool)

(assert (=> start!119544 m!1278609))

(declare-fun m!1278611 () Bool)

(assert (=> b!1392582 m!1278611))

(push 1)

(assert (not b!1392582))

(assert (not b!1392581))

(assert (not b!1392579))

(assert (not b!1392577))

(assert (not b!1392578))

(assert (not start!119544))

(assert (not b!1392576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

