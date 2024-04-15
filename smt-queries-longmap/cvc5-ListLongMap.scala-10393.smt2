; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122436 () Bool)

(assert start!122436)

(declare-fun b!1418664 () Bool)

(declare-fun res!954325 () Bool)

(declare-fun e!802784 () Bool)

(assert (=> b!1418664 (=> (not res!954325) (not e!802784))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96832 0))(
  ( (array!96833 (arr!46737 (Array (_ BitVec 32) (_ BitVec 64))) (size!47289 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96832)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418664 (= res!954325 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47289 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47289 a!2831))))))

(declare-fun b!1418666 () Bool)

(declare-fun res!954326 () Bool)

(assert (=> b!1418666 (=> (not res!954326) (not e!802784))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418666 (= res!954326 (and (= (size!47289 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47289 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47289 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418667 () Bool)

(declare-fun res!954328 () Bool)

(assert (=> b!1418667 (=> (not res!954328) (not e!802784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418667 (= res!954328 (validKeyInArray!0 (select (arr!46737 a!2831) j!81)))))

(declare-fun b!1418668 () Bool)

(declare-fun res!954322 () Bool)

(assert (=> b!1418668 (=> (not res!954322) (not e!802784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96832 (_ BitVec 32)) Bool)

(assert (=> b!1418668 (= res!954322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418669 () Bool)

(assert (=> b!1418669 (= e!802784 false)))

(declare-fun lt!625469 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418669 (= lt!625469 (toIndex!0 (select (arr!46737 a!2831) j!81) mask!2608))))

(declare-fun b!1418670 () Bool)

(declare-fun res!954327 () Bool)

(assert (=> b!1418670 (=> (not res!954327) (not e!802784))))

(assert (=> b!1418670 (= res!954327 (validKeyInArray!0 (select (arr!46737 a!2831) i!982)))))

(declare-fun b!1418665 () Bool)

(declare-fun res!954324 () Bool)

(assert (=> b!1418665 (=> (not res!954324) (not e!802784))))

(declare-datatypes ((List!33325 0))(
  ( (Nil!33322) (Cons!33321 (h!34617 (_ BitVec 64)) (t!48011 List!33325)) )
))
(declare-fun arrayNoDuplicates!0 (array!96832 (_ BitVec 32) List!33325) Bool)

(assert (=> b!1418665 (= res!954324 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33322))))

(declare-fun res!954323 () Bool)

(assert (=> start!122436 (=> (not res!954323) (not e!802784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122436 (= res!954323 (validMask!0 mask!2608))))

(assert (=> start!122436 e!802784))

(assert (=> start!122436 true))

(declare-fun array_inv!35970 (array!96832) Bool)

(assert (=> start!122436 (array_inv!35970 a!2831)))

(assert (= (and start!122436 res!954323) b!1418666))

(assert (= (and b!1418666 res!954326) b!1418670))

(assert (= (and b!1418670 res!954327) b!1418667))

(assert (= (and b!1418667 res!954328) b!1418668))

(assert (= (and b!1418668 res!954322) b!1418665))

(assert (= (and b!1418665 res!954324) b!1418664))

(assert (= (and b!1418664 res!954325) b!1418669))

(declare-fun m!1308821 () Bool)

(assert (=> b!1418667 m!1308821))

(assert (=> b!1418667 m!1308821))

(declare-fun m!1308823 () Bool)

(assert (=> b!1418667 m!1308823))

(assert (=> b!1418669 m!1308821))

(assert (=> b!1418669 m!1308821))

(declare-fun m!1308825 () Bool)

(assert (=> b!1418669 m!1308825))

(declare-fun m!1308827 () Bool)

(assert (=> start!122436 m!1308827))

(declare-fun m!1308829 () Bool)

(assert (=> start!122436 m!1308829))

(declare-fun m!1308831 () Bool)

(assert (=> b!1418670 m!1308831))

(assert (=> b!1418670 m!1308831))

(declare-fun m!1308833 () Bool)

(assert (=> b!1418670 m!1308833))

(declare-fun m!1308835 () Bool)

(assert (=> b!1418668 m!1308835))

(declare-fun m!1308837 () Bool)

(assert (=> b!1418665 m!1308837))

(push 1)

(assert (not b!1418668))

(assert (not b!1418665))

(assert (not start!122436))

(assert (not b!1418669))

(assert (not b!1418667))

(assert (not b!1418670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

