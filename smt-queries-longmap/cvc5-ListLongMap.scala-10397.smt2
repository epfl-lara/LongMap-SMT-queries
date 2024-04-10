; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122502 () Bool)

(assert start!122502)

(declare-fun b!1419146 () Bool)

(declare-fun res!954671 () Bool)

(declare-fun e!802990 () Bool)

(assert (=> b!1419146 (=> (not res!954671) (not e!802990))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96906 0))(
  ( (array!96907 (arr!46772 (Array (_ BitVec 32) (_ BitVec 64))) (size!47322 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96906)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11057 0))(
  ( (MissingZero!11057 (index!46620 (_ BitVec 32))) (Found!11057 (index!46621 (_ BitVec 32))) (Intermediate!11057 (undefined!11869 Bool) (index!46622 (_ BitVec 32)) (x!128293 (_ BitVec 32))) (Undefined!11057) (MissingVacant!11057 (index!46623 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96906 (_ BitVec 32)) SeekEntryResult!11057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419146 (= res!954671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46772 a!2831) j!81) mask!2608) (select (arr!46772 a!2831) j!81) a!2831 mask!2608) (Intermediate!11057 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419147 () Bool)

(declare-fun res!954668 () Bool)

(assert (=> b!1419147 (=> (not res!954668) (not e!802990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96906 (_ BitVec 32)) Bool)

(assert (=> b!1419147 (= res!954668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419148 () Bool)

(declare-fun res!954667 () Bool)

(assert (=> b!1419148 (=> (not res!954667) (not e!802990))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419148 (= res!954667 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47322 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47322 a!2831))))))

(declare-fun b!1419149 () Bool)

(declare-fun res!954666 () Bool)

(assert (=> b!1419149 (=> (not res!954666) (not e!802990))))

(declare-datatypes ((List!33282 0))(
  ( (Nil!33279) (Cons!33278 (h!34577 (_ BitVec 64)) (t!47976 List!33282)) )
))
(declare-fun arrayNoDuplicates!0 (array!96906 (_ BitVec 32) List!33282) Bool)

(assert (=> b!1419149 (= res!954666 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33279))))

(declare-fun b!1419151 () Bool)

(assert (=> b!1419151 (= e!802990 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625734 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419151 (= lt!625734 (toIndex!0 (select (store (arr!46772 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419152 () Bool)

(declare-fun res!954673 () Bool)

(assert (=> b!1419152 (=> (not res!954673) (not e!802990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419152 (= res!954673 (validKeyInArray!0 (select (arr!46772 a!2831) i!982)))))

(declare-fun b!1419153 () Bool)

(declare-fun res!954669 () Bool)

(assert (=> b!1419153 (=> (not res!954669) (not e!802990))))

(assert (=> b!1419153 (= res!954669 (and (= (size!47322 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47322 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47322 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!954672 () Bool)

(assert (=> start!122502 (=> (not res!954672) (not e!802990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122502 (= res!954672 (validMask!0 mask!2608))))

(assert (=> start!122502 e!802990))

(assert (=> start!122502 true))

(declare-fun array_inv!35800 (array!96906) Bool)

(assert (=> start!122502 (array_inv!35800 a!2831)))

(declare-fun b!1419150 () Bool)

(declare-fun res!954670 () Bool)

(assert (=> b!1419150 (=> (not res!954670) (not e!802990))))

(assert (=> b!1419150 (= res!954670 (validKeyInArray!0 (select (arr!46772 a!2831) j!81)))))

(assert (= (and start!122502 res!954672) b!1419153))

(assert (= (and b!1419153 res!954669) b!1419152))

(assert (= (and b!1419152 res!954673) b!1419150))

(assert (= (and b!1419150 res!954670) b!1419147))

(assert (= (and b!1419147 res!954668) b!1419149))

(assert (= (and b!1419149 res!954666) b!1419148))

(assert (= (and b!1419148 res!954667) b!1419146))

(assert (= (and b!1419146 res!954671) b!1419151))

(declare-fun m!1309653 () Bool)

(assert (=> b!1419152 m!1309653))

(assert (=> b!1419152 m!1309653))

(declare-fun m!1309655 () Bool)

(assert (=> b!1419152 m!1309655))

(declare-fun m!1309657 () Bool)

(assert (=> start!122502 m!1309657))

(declare-fun m!1309659 () Bool)

(assert (=> start!122502 m!1309659))

(declare-fun m!1309661 () Bool)

(assert (=> b!1419147 m!1309661))

(declare-fun m!1309663 () Bool)

(assert (=> b!1419146 m!1309663))

(assert (=> b!1419146 m!1309663))

(declare-fun m!1309665 () Bool)

(assert (=> b!1419146 m!1309665))

(assert (=> b!1419146 m!1309665))

(assert (=> b!1419146 m!1309663))

(declare-fun m!1309667 () Bool)

(assert (=> b!1419146 m!1309667))

(declare-fun m!1309669 () Bool)

(assert (=> b!1419151 m!1309669))

(declare-fun m!1309671 () Bool)

(assert (=> b!1419151 m!1309671))

(assert (=> b!1419151 m!1309671))

(declare-fun m!1309673 () Bool)

(assert (=> b!1419151 m!1309673))

(assert (=> b!1419150 m!1309663))

(assert (=> b!1419150 m!1309663))

(declare-fun m!1309675 () Bool)

(assert (=> b!1419150 m!1309675))

(declare-fun m!1309677 () Bool)

(assert (=> b!1419149 m!1309677))

(push 1)

(assert (not b!1419149))

(assert (not b!1419147))

(assert (not b!1419150))

(assert (not b!1419146))

(assert (not b!1419152))

(assert (not start!122502))

(assert (not b!1419151))

(check-sat)

