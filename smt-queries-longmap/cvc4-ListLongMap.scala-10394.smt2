; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122446 () Bool)

(assert start!122446)

(declare-fun b!1418816 () Bool)

(declare-fun res!954424 () Bool)

(declare-fun e!802840 () Bool)

(assert (=> b!1418816 (=> (not res!954424) (not e!802840))))

(declare-datatypes ((array!96889 0))(
  ( (array!96890 (arr!46765 (Array (_ BitVec 32) (_ BitVec 64))) (size!47315 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96889)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418816 (= res!954424 (validKeyInArray!0 (select (arr!46765 a!2831) i!982)))))

(declare-fun b!1418817 () Bool)

(declare-fun res!954428 () Bool)

(assert (=> b!1418817 (=> (not res!954428) (not e!802840))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11050 0))(
  ( (MissingZero!11050 (index!46592 (_ BitVec 32))) (Found!11050 (index!46593 (_ BitVec 32))) (Intermediate!11050 (undefined!11862 Bool) (index!46594 (_ BitVec 32)) (x!128256 (_ BitVec 32))) (Undefined!11050) (MissingVacant!11050 (index!46595 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96889 (_ BitVec 32)) SeekEntryResult!11050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418817 (= res!954428 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46765 a!2831) j!81) mask!2608) (select (arr!46765 a!2831) j!81) a!2831 mask!2608) (Intermediate!11050 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418818 () Bool)

(declare-fun res!954427 () Bool)

(assert (=> b!1418818 (=> (not res!954427) (not e!802840))))

(declare-datatypes ((List!33275 0))(
  ( (Nil!33272) (Cons!33271 (h!34567 (_ BitVec 64)) (t!47969 List!33275)) )
))
(declare-fun arrayNoDuplicates!0 (array!96889 (_ BitVec 32) List!33275) Bool)

(assert (=> b!1418818 (= res!954427 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33272))))

(declare-fun b!1418819 () Bool)

(declare-fun res!954425 () Bool)

(assert (=> b!1418819 (=> (not res!954425) (not e!802840))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418819 (= res!954425 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47315 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47315 a!2831))))))

(declare-fun b!1418821 () Bool)

(declare-fun res!954429 () Bool)

(assert (=> b!1418821 (=> (not res!954429) (not e!802840))))

(assert (=> b!1418821 (= res!954429 (validKeyInArray!0 (select (arr!46765 a!2831) j!81)))))

(declare-fun b!1418822 () Bool)

(declare-fun res!954423 () Bool)

(assert (=> b!1418822 (=> (not res!954423) (not e!802840))))

(assert (=> b!1418822 (= res!954423 (and (= (size!47315 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47315 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47315 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418823 () Bool)

(assert (=> b!1418823 (= e!802840 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun res!954426 () Bool)

(assert (=> start!122446 (=> (not res!954426) (not e!802840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122446 (= res!954426 (validMask!0 mask!2608))))

(assert (=> start!122446 e!802840))

(assert (=> start!122446 true))

(declare-fun array_inv!35793 (array!96889) Bool)

(assert (=> start!122446 (array_inv!35793 a!2831)))

(declare-fun b!1418820 () Bool)

(declare-fun res!954430 () Bool)

(assert (=> b!1418820 (=> (not res!954430) (not e!802840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96889 (_ BitVec 32)) Bool)

(assert (=> b!1418820 (= res!954430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122446 res!954426) b!1418822))

(assert (= (and b!1418822 res!954423) b!1418816))

(assert (= (and b!1418816 res!954424) b!1418821))

(assert (= (and b!1418821 res!954429) b!1418820))

(assert (= (and b!1418820 res!954430) b!1418818))

(assert (= (and b!1418818 res!954427) b!1418819))

(assert (= (and b!1418819 res!954425) b!1418817))

(assert (= (and b!1418817 res!954428) b!1418823))

(declare-fun m!1309423 () Bool)

(assert (=> b!1418816 m!1309423))

(assert (=> b!1418816 m!1309423))

(declare-fun m!1309425 () Bool)

(assert (=> b!1418816 m!1309425))

(declare-fun m!1309427 () Bool)

(assert (=> b!1418820 m!1309427))

(declare-fun m!1309429 () Bool)

(assert (=> start!122446 m!1309429))

(declare-fun m!1309431 () Bool)

(assert (=> start!122446 m!1309431))

(declare-fun m!1309433 () Bool)

(assert (=> b!1418817 m!1309433))

(assert (=> b!1418817 m!1309433))

(declare-fun m!1309435 () Bool)

(assert (=> b!1418817 m!1309435))

(assert (=> b!1418817 m!1309435))

(assert (=> b!1418817 m!1309433))

(declare-fun m!1309437 () Bool)

(assert (=> b!1418817 m!1309437))

(declare-fun m!1309439 () Bool)

(assert (=> b!1418818 m!1309439))

(assert (=> b!1418821 m!1309433))

(assert (=> b!1418821 m!1309433))

(declare-fun m!1309441 () Bool)

(assert (=> b!1418821 m!1309441))

(push 1)

(assert (not b!1418820))

(assert (not b!1418816))

(assert (not b!1418821))

(assert (not b!1418818))

(assert (not start!122446))

(assert (not b!1418817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

