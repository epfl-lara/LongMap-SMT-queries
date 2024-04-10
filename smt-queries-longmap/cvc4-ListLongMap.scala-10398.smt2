; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122512 () Bool)

(assert start!122512)

(declare-fun b!1419266 () Bool)

(declare-fun res!954790 () Bool)

(declare-fun e!803021 () Bool)

(assert (=> b!1419266 (=> (not res!954790) (not e!803021))))

(declare-datatypes ((array!96916 0))(
  ( (array!96917 (arr!46777 (Array (_ BitVec 32) (_ BitVec 64))) (size!47327 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96916)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96916 (_ BitVec 32)) Bool)

(assert (=> b!1419266 (= res!954790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419267 () Bool)

(declare-fun res!954788 () Bool)

(assert (=> b!1419267 (=> (not res!954788) (not e!803021))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419267 (= res!954788 (validKeyInArray!0 (select (arr!46777 a!2831) j!81)))))

(declare-fun b!1419268 () Bool)

(declare-fun res!954793 () Bool)

(assert (=> b!1419268 (=> (not res!954793) (not e!803021))))

(declare-datatypes ((List!33287 0))(
  ( (Nil!33284) (Cons!33283 (h!34582 (_ BitVec 64)) (t!47981 List!33287)) )
))
(declare-fun arrayNoDuplicates!0 (array!96916 (_ BitVec 32) List!33287) Bool)

(assert (=> b!1419268 (= res!954793 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33284))))

(declare-fun res!954786 () Bool)

(assert (=> start!122512 (=> (not res!954786) (not e!803021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122512 (= res!954786 (validMask!0 mask!2608))))

(assert (=> start!122512 e!803021))

(assert (=> start!122512 true))

(declare-fun array_inv!35805 (array!96916) Bool)

(assert (=> start!122512 (array_inv!35805 a!2831)))

(declare-fun b!1419269 () Bool)

(declare-fun res!954792 () Bool)

(assert (=> b!1419269 (=> (not res!954792) (not e!803021))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419269 (= res!954792 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47327 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47327 a!2831))))))

(declare-fun b!1419270 () Bool)

(assert (=> b!1419270 (= e!803021 false)))

(declare-fun lt!625749 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419270 (= lt!625749 (toIndex!0 (select (store (arr!46777 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419271 () Bool)

(declare-fun res!954789 () Bool)

(assert (=> b!1419271 (=> (not res!954789) (not e!803021))))

(declare-datatypes ((SeekEntryResult!11062 0))(
  ( (MissingZero!11062 (index!46640 (_ BitVec 32))) (Found!11062 (index!46641 (_ BitVec 32))) (Intermediate!11062 (undefined!11874 Bool) (index!46642 (_ BitVec 32)) (x!128306 (_ BitVec 32))) (Undefined!11062) (MissingVacant!11062 (index!46643 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96916 (_ BitVec 32)) SeekEntryResult!11062)

(assert (=> b!1419271 (= res!954789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46777 a!2831) j!81) mask!2608) (select (arr!46777 a!2831) j!81) a!2831 mask!2608) (Intermediate!11062 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419272 () Bool)

(declare-fun res!954791 () Bool)

(assert (=> b!1419272 (=> (not res!954791) (not e!803021))))

(assert (=> b!1419272 (= res!954791 (validKeyInArray!0 (select (arr!46777 a!2831) i!982)))))

(declare-fun b!1419273 () Bool)

(declare-fun res!954787 () Bool)

(assert (=> b!1419273 (=> (not res!954787) (not e!803021))))

(assert (=> b!1419273 (= res!954787 (and (= (size!47327 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47327 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47327 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122512 res!954786) b!1419273))

(assert (= (and b!1419273 res!954787) b!1419272))

(assert (= (and b!1419272 res!954791) b!1419267))

(assert (= (and b!1419267 res!954788) b!1419266))

(assert (= (and b!1419266 res!954790) b!1419268))

(assert (= (and b!1419268 res!954793) b!1419269))

(assert (= (and b!1419269 res!954792) b!1419271))

(assert (= (and b!1419271 res!954789) b!1419270))

(declare-fun m!1309783 () Bool)

(assert (=> start!122512 m!1309783))

(declare-fun m!1309785 () Bool)

(assert (=> start!122512 m!1309785))

(declare-fun m!1309787 () Bool)

(assert (=> b!1419267 m!1309787))

(assert (=> b!1419267 m!1309787))

(declare-fun m!1309789 () Bool)

(assert (=> b!1419267 m!1309789))

(declare-fun m!1309791 () Bool)

(assert (=> b!1419272 m!1309791))

(assert (=> b!1419272 m!1309791))

(declare-fun m!1309793 () Bool)

(assert (=> b!1419272 m!1309793))

(declare-fun m!1309795 () Bool)

(assert (=> b!1419268 m!1309795))

(assert (=> b!1419271 m!1309787))

(assert (=> b!1419271 m!1309787))

(declare-fun m!1309797 () Bool)

(assert (=> b!1419271 m!1309797))

(assert (=> b!1419271 m!1309797))

(assert (=> b!1419271 m!1309787))

(declare-fun m!1309799 () Bool)

(assert (=> b!1419271 m!1309799))

(declare-fun m!1309801 () Bool)

(assert (=> b!1419266 m!1309801))

(declare-fun m!1309803 () Bool)

(assert (=> b!1419270 m!1309803))

(declare-fun m!1309805 () Bool)

(assert (=> b!1419270 m!1309805))

(assert (=> b!1419270 m!1309805))

(declare-fun m!1309807 () Bool)

(assert (=> b!1419270 m!1309807))

(push 1)

(assert (not b!1419271))

(assert (not b!1419266))

(assert (not b!1419270))

(assert (not b!1419267))

(assert (not b!1419268))

(assert (not start!122512))

(assert (not b!1419272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

