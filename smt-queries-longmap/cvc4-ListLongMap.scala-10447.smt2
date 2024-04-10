; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122848 () Bool)

(assert start!122848)

(declare-fun b!1424903 () Bool)

(declare-fun res!960337 () Bool)

(declare-fun e!805216 () Bool)

(assert (=> b!1424903 (=> (not res!960337) (not e!805216))))

(declare-datatypes ((array!97213 0))(
  ( (array!97214 (arr!46924 (Array (_ BitVec 32) (_ BitVec 64))) (size!47474 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97213)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424903 (= res!960337 (validKeyInArray!0 (select (arr!46924 a!2831) i!982)))))

(declare-fun b!1424904 () Bool)

(declare-fun res!960340 () Bool)

(assert (=> b!1424904 (=> (not res!960340) (not e!805216))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1424904 (= res!960340 (and (= (size!47474 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47474 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47474 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960336 () Bool)

(assert (=> start!122848 (=> (not res!960336) (not e!805216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122848 (= res!960336 (validMask!0 mask!2608))))

(assert (=> start!122848 e!805216))

(assert (=> start!122848 true))

(declare-fun array_inv!35952 (array!97213) Bool)

(assert (=> start!122848 (array_inv!35952 a!2831)))

(declare-fun b!1424905 () Bool)

(declare-fun res!960339 () Bool)

(assert (=> b!1424905 (=> (not res!960339) (not e!805216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97213 (_ BitVec 32)) Bool)

(assert (=> b!1424905 (= res!960339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424906 () Bool)

(declare-fun res!960338 () Bool)

(assert (=> b!1424906 (=> (not res!960338) (not e!805216))))

(assert (=> b!1424906 (= res!960338 (validKeyInArray!0 (select (arr!46924 a!2831) j!81)))))

(declare-fun b!1424907 () Bool)

(assert (=> b!1424907 (= e!805216 false)))

(declare-fun lt!627744 () Bool)

(declare-datatypes ((List!33434 0))(
  ( (Nil!33431) (Cons!33430 (h!34732 (_ BitVec 64)) (t!48128 List!33434)) )
))
(declare-fun arrayNoDuplicates!0 (array!97213 (_ BitVec 32) List!33434) Bool)

(assert (=> b!1424907 (= lt!627744 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33431))))

(assert (= (and start!122848 res!960336) b!1424904))

(assert (= (and b!1424904 res!960340) b!1424903))

(assert (= (and b!1424903 res!960337) b!1424906))

(assert (= (and b!1424906 res!960338) b!1424905))

(assert (= (and b!1424905 res!960339) b!1424907))

(declare-fun m!1315475 () Bool)

(assert (=> b!1424903 m!1315475))

(assert (=> b!1424903 m!1315475))

(declare-fun m!1315477 () Bool)

(assert (=> b!1424903 m!1315477))

(declare-fun m!1315479 () Bool)

(assert (=> start!122848 m!1315479))

(declare-fun m!1315481 () Bool)

(assert (=> start!122848 m!1315481))

(declare-fun m!1315483 () Bool)

(assert (=> b!1424905 m!1315483))

(declare-fun m!1315485 () Bool)

(assert (=> b!1424906 m!1315485))

(assert (=> b!1424906 m!1315485))

(declare-fun m!1315487 () Bool)

(assert (=> b!1424906 m!1315487))

(declare-fun m!1315489 () Bool)

(assert (=> b!1424907 m!1315489))

(push 1)

(assert (not b!1424903))

(assert (not b!1424906))

(assert (not start!122848))

(assert (not b!1424907))

(assert (not b!1424905))

(check-sat)

