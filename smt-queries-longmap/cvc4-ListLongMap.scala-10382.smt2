; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122218 () Bool)

(assert start!122218)

(declare-fun b!1417760 () Bool)

(declare-fun res!953492 () Bool)

(declare-fun e!802348 () Bool)

(assert (=> b!1417760 (=> (not res!953492) (not e!802348))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96802 0))(
  ( (array!96803 (arr!46729 (Array (_ BitVec 32) (_ BitVec 64))) (size!47279 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96802)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417760 (= res!953492 (and (= (size!47279 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47279 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47279 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417762 () Bool)

(declare-fun res!953493 () Bool)

(assert (=> b!1417762 (=> (not res!953493) (not e!802348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96802 (_ BitVec 32)) Bool)

(assert (=> b!1417762 (= res!953493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417763 () Bool)

(declare-fun res!953490 () Bool)

(assert (=> b!1417763 (=> (not res!953490) (not e!802348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417763 (= res!953490 (validKeyInArray!0 (select (arr!46729 a!2831) j!81)))))

(declare-fun b!1417764 () Bool)

(declare-fun res!953494 () Bool)

(assert (=> b!1417764 (=> (not res!953494) (not e!802348))))

(assert (=> b!1417764 (= res!953494 (validKeyInArray!0 (select (arr!46729 a!2831) i!982)))))

(declare-fun b!1417761 () Bool)

(assert (=> b!1417761 (= e!802348 (bvsgt #b00000000000000000000000000000000 (size!47279 a!2831)))))

(declare-fun res!953491 () Bool)

(assert (=> start!122218 (=> (not res!953491) (not e!802348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122218 (= res!953491 (validMask!0 mask!2608))))

(assert (=> start!122218 e!802348))

(assert (=> start!122218 true))

(declare-fun array_inv!35757 (array!96802) Bool)

(assert (=> start!122218 (array_inv!35757 a!2831)))

(assert (= (and start!122218 res!953491) b!1417760))

(assert (= (and b!1417760 res!953492) b!1417764))

(assert (= (and b!1417764 res!953494) b!1417763))

(assert (= (and b!1417763 res!953490) b!1417762))

(assert (= (and b!1417762 res!953493) b!1417761))

(declare-fun m!1308541 () Bool)

(assert (=> b!1417762 m!1308541))

(declare-fun m!1308543 () Bool)

(assert (=> b!1417763 m!1308543))

(assert (=> b!1417763 m!1308543))

(declare-fun m!1308545 () Bool)

(assert (=> b!1417763 m!1308545))

(declare-fun m!1308547 () Bool)

(assert (=> b!1417764 m!1308547))

(assert (=> b!1417764 m!1308547))

(declare-fun m!1308549 () Bool)

(assert (=> b!1417764 m!1308549))

(declare-fun m!1308551 () Bool)

(assert (=> start!122218 m!1308551))

(declare-fun m!1308553 () Bool)

(assert (=> start!122218 m!1308553))

(push 1)

(assert (not b!1417764))

(assert (not b!1417763))

(assert (not b!1417762))

(assert (not start!122218))

(check-sat)

(pop 1)

(push 1)

