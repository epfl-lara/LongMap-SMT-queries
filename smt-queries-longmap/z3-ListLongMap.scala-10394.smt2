; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122444 () Bool)

(assert start!122444)

(declare-fun b!1418792 () Bool)

(declare-fun res!954405 () Bool)

(declare-fun e!802834 () Bool)

(assert (=> b!1418792 (=> (not res!954405) (not e!802834))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96887 0))(
  ( (array!96888 (arr!46764 (Array (_ BitVec 32) (_ BitVec 64))) (size!47314 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96887)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11049 0))(
  ( (MissingZero!11049 (index!46588 (_ BitVec 32))) (Found!11049 (index!46589 (_ BitVec 32))) (Intermediate!11049 (undefined!11861 Bool) (index!46590 (_ BitVec 32)) (x!128255 (_ BitVec 32))) (Undefined!11049) (MissingVacant!11049 (index!46591 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96887 (_ BitVec 32)) SeekEntryResult!11049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418792 (= res!954405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46764 a!2831) j!81) mask!2608) (select (arr!46764 a!2831) j!81) a!2831 mask!2608) (Intermediate!11049 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418793 () Bool)

(declare-fun res!954399 () Bool)

(assert (=> b!1418793 (=> (not res!954399) (not e!802834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418793 (= res!954399 (validKeyInArray!0 (select (arr!46764 a!2831) j!81)))))

(declare-fun b!1418794 () Bool)

(declare-fun res!954406 () Bool)

(assert (=> b!1418794 (=> (not res!954406) (not e!802834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96887 (_ BitVec 32)) Bool)

(assert (=> b!1418794 (= res!954406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418795 () Bool)

(declare-fun res!954404 () Bool)

(assert (=> b!1418795 (=> (not res!954404) (not e!802834))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418795 (= res!954404 (and (= (size!47314 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47314 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47314 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418796 () Bool)

(assert (=> b!1418796 (= e!802834 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1418797 () Bool)

(declare-fun res!954402 () Bool)

(assert (=> b!1418797 (=> (not res!954402) (not e!802834))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418797 (= res!954402 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47314 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47314 a!2831))))))

(declare-fun res!954401 () Bool)

(assert (=> start!122444 (=> (not res!954401) (not e!802834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122444 (= res!954401 (validMask!0 mask!2608))))

(assert (=> start!122444 e!802834))

(assert (=> start!122444 true))

(declare-fun array_inv!35792 (array!96887) Bool)

(assert (=> start!122444 (array_inv!35792 a!2831)))

(declare-fun b!1418798 () Bool)

(declare-fun res!954400 () Bool)

(assert (=> b!1418798 (=> (not res!954400) (not e!802834))))

(assert (=> b!1418798 (= res!954400 (validKeyInArray!0 (select (arr!46764 a!2831) i!982)))))

(declare-fun b!1418799 () Bool)

(declare-fun res!954403 () Bool)

(assert (=> b!1418799 (=> (not res!954403) (not e!802834))))

(declare-datatypes ((List!33274 0))(
  ( (Nil!33271) (Cons!33270 (h!34566 (_ BitVec 64)) (t!47968 List!33274)) )
))
(declare-fun arrayNoDuplicates!0 (array!96887 (_ BitVec 32) List!33274) Bool)

(assert (=> b!1418799 (= res!954403 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33271))))

(assert (= (and start!122444 res!954401) b!1418795))

(assert (= (and b!1418795 res!954404) b!1418798))

(assert (= (and b!1418798 res!954400) b!1418793))

(assert (= (and b!1418793 res!954399) b!1418794))

(assert (= (and b!1418794 res!954406) b!1418799))

(assert (= (and b!1418799 res!954403) b!1418797))

(assert (= (and b!1418797 res!954402) b!1418792))

(assert (= (and b!1418792 res!954405) b!1418796))

(declare-fun m!1309403 () Bool)

(assert (=> b!1418798 m!1309403))

(assert (=> b!1418798 m!1309403))

(declare-fun m!1309405 () Bool)

(assert (=> b!1418798 m!1309405))

(declare-fun m!1309407 () Bool)

(assert (=> b!1418794 m!1309407))

(declare-fun m!1309409 () Bool)

(assert (=> b!1418799 m!1309409))

(declare-fun m!1309411 () Bool)

(assert (=> b!1418792 m!1309411))

(assert (=> b!1418792 m!1309411))

(declare-fun m!1309413 () Bool)

(assert (=> b!1418792 m!1309413))

(assert (=> b!1418792 m!1309413))

(assert (=> b!1418792 m!1309411))

(declare-fun m!1309415 () Bool)

(assert (=> b!1418792 m!1309415))

(assert (=> b!1418793 m!1309411))

(assert (=> b!1418793 m!1309411))

(declare-fun m!1309417 () Bool)

(assert (=> b!1418793 m!1309417))

(declare-fun m!1309419 () Bool)

(assert (=> start!122444 m!1309419))

(declare-fun m!1309421 () Bool)

(assert (=> start!122444 m!1309421))

(check-sat (not b!1418799) (not start!122444) (not b!1418792) (not b!1418798) (not b!1418793) (not b!1418794))
(check-sat)
