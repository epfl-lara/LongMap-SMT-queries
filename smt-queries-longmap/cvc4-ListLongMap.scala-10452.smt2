; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122878 () Bool)

(assert start!122878)

(declare-fun b!1425224 () Bool)

(declare-fun res!960658 () Bool)

(declare-fun e!805307 () Bool)

(assert (=> b!1425224 (=> (not res!960658) (not e!805307))))

(declare-datatypes ((array!97243 0))(
  ( (array!97244 (arr!46939 (Array (_ BitVec 32) (_ BitVec 64))) (size!47489 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97243)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97243 (_ BitVec 32)) Bool)

(assert (=> b!1425224 (= res!960658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425225 () Bool)

(declare-fun res!960659 () Bool)

(assert (=> b!1425225 (=> (not res!960659) (not e!805307))))

(declare-datatypes ((List!33449 0))(
  ( (Nil!33446) (Cons!33445 (h!34747 (_ BitVec 64)) (t!48143 List!33449)) )
))
(declare-fun arrayNoDuplicates!0 (array!97243 (_ BitVec 32) List!33449) Bool)

(assert (=> b!1425225 (= res!960659 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33446))))

(declare-fun b!1425226 () Bool)

(assert (=> b!1425226 (= e!805307 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun lt!627789 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425226 (= lt!627789 (toIndex!0 (select (store (arr!46939 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425227 () Bool)

(declare-fun res!960663 () Bool)

(assert (=> b!1425227 (=> (not res!960663) (not e!805307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425227 (= res!960663 (validKeyInArray!0 (select (arr!46939 a!2831) j!81)))))

(declare-fun b!1425228 () Bool)

(declare-fun res!960662 () Bool)

(assert (=> b!1425228 (=> (not res!960662) (not e!805307))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425228 (= res!960662 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47489 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47489 a!2831))))))

(declare-fun b!1425229 () Bool)

(declare-fun res!960661 () Bool)

(assert (=> b!1425229 (=> (not res!960661) (not e!805307))))

(declare-datatypes ((SeekEntryResult!11218 0))(
  ( (MissingZero!11218 (index!47264 (_ BitVec 32))) (Found!11218 (index!47265 (_ BitVec 32))) (Intermediate!11218 (undefined!12030 Bool) (index!47266 (_ BitVec 32)) (x!128900 (_ BitVec 32))) (Undefined!11218) (MissingVacant!11218 (index!47267 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97243 (_ BitVec 32)) SeekEntryResult!11218)

(assert (=> b!1425229 (= res!960661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46939 a!2831) j!81) mask!2608) (select (arr!46939 a!2831) j!81) a!2831 mask!2608) (Intermediate!11218 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425230 () Bool)

(declare-fun res!960660 () Bool)

(assert (=> b!1425230 (=> (not res!960660) (not e!805307))))

(assert (=> b!1425230 (= res!960660 (validKeyInArray!0 (select (arr!46939 a!2831) i!982)))))

(declare-fun res!960657 () Bool)

(assert (=> start!122878 (=> (not res!960657) (not e!805307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122878 (= res!960657 (validMask!0 mask!2608))))

(assert (=> start!122878 e!805307))

(assert (=> start!122878 true))

(declare-fun array_inv!35967 (array!97243) Bool)

(assert (=> start!122878 (array_inv!35967 a!2831)))

(declare-fun b!1425231 () Bool)

(declare-fun res!960664 () Bool)

(assert (=> b!1425231 (=> (not res!960664) (not e!805307))))

(assert (=> b!1425231 (= res!960664 (and (= (size!47489 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47489 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47489 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122878 res!960657) b!1425231))

(assert (= (and b!1425231 res!960664) b!1425230))

(assert (= (and b!1425230 res!960660) b!1425227))

(assert (= (and b!1425227 res!960663) b!1425224))

(assert (= (and b!1425224 res!960658) b!1425225))

(assert (= (and b!1425225 res!960659) b!1425228))

(assert (= (and b!1425228 res!960662) b!1425229))

(assert (= (and b!1425229 res!960661) b!1425226))

(declare-fun m!1315777 () Bool)

(assert (=> b!1425230 m!1315777))

(assert (=> b!1425230 m!1315777))

(declare-fun m!1315779 () Bool)

(assert (=> b!1425230 m!1315779))

(declare-fun m!1315781 () Bool)

(assert (=> b!1425226 m!1315781))

(declare-fun m!1315783 () Bool)

(assert (=> b!1425226 m!1315783))

(assert (=> b!1425226 m!1315783))

(declare-fun m!1315785 () Bool)

(assert (=> b!1425226 m!1315785))

(declare-fun m!1315787 () Bool)

(assert (=> b!1425227 m!1315787))

(assert (=> b!1425227 m!1315787))

(declare-fun m!1315789 () Bool)

(assert (=> b!1425227 m!1315789))

(assert (=> b!1425229 m!1315787))

(assert (=> b!1425229 m!1315787))

(declare-fun m!1315791 () Bool)

(assert (=> b!1425229 m!1315791))

(assert (=> b!1425229 m!1315791))

(assert (=> b!1425229 m!1315787))

(declare-fun m!1315793 () Bool)

(assert (=> b!1425229 m!1315793))

(declare-fun m!1315795 () Bool)

(assert (=> b!1425224 m!1315795))

(declare-fun m!1315797 () Bool)

(assert (=> start!122878 m!1315797))

(declare-fun m!1315799 () Bool)

(assert (=> start!122878 m!1315799))

(declare-fun m!1315801 () Bool)

(assert (=> b!1425225 m!1315801))

(push 1)

(assert (not b!1425225))

(assert (not b!1425230))

(assert (not b!1425227))

(assert (not start!122878))

(assert (not b!1425226))

(assert (not b!1425229))

(assert (not b!1425224))

(check-sat)

