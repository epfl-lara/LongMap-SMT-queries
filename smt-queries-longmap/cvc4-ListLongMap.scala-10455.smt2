; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122890 () Bool)

(assert start!122890)

(declare-fun b!1425340 () Bool)

(declare-fun res!960832 () Bool)

(declare-fun e!805316 () Bool)

(assert (=> b!1425340 (=> (not res!960832) (not e!805316))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97208 0))(
  ( (array!97209 (arr!46922 (Array (_ BitVec 32) (_ BitVec 64))) (size!47474 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97208)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11228 0))(
  ( (MissingZero!11228 (index!47304 (_ BitVec 32))) (Found!11228 (index!47305 (_ BitVec 32))) (Intermediate!11228 (undefined!12040 Bool) (index!47306 (_ BitVec 32)) (x!128931 (_ BitVec 32))) (Undefined!11228) (MissingVacant!11228 (index!47307 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97208 (_ BitVec 32)) SeekEntryResult!11228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425340 (= res!960832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46922 a!2831) j!81) mask!2608) (select (arr!46922 a!2831) j!81) a!2831 mask!2608) (Intermediate!11228 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!960824 () Bool)

(assert (=> start!122890 (=> (not res!960824) (not e!805316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122890 (= res!960824 (validMask!0 mask!2608))))

(assert (=> start!122890 e!805316))

(assert (=> start!122890 true))

(declare-fun array_inv!36155 (array!97208) Bool)

(assert (=> start!122890 (array_inv!36155 a!2831)))

(declare-fun b!1425341 () Bool)

(declare-fun res!960829 () Bool)

(assert (=> b!1425341 (=> (not res!960829) (not e!805316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97208 (_ BitVec 32)) Bool)

(assert (=> b!1425341 (= res!960829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425342 () Bool)

(declare-fun res!960831 () Bool)

(assert (=> b!1425342 (=> (not res!960831) (not e!805316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425342 (= res!960831 (validKeyInArray!0 (select (arr!46922 a!2831) j!81)))))

(declare-fun b!1425343 () Bool)

(declare-fun res!960826 () Bool)

(assert (=> b!1425343 (=> (not res!960826) (not e!805316))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425343 (= res!960826 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47474 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47474 a!2831))))))

(declare-fun b!1425344 () Bool)

(declare-fun res!960828 () Bool)

(assert (=> b!1425344 (=> (not res!960828) (not e!805316))))

(declare-datatypes ((List!33510 0))(
  ( (Nil!33507) (Cons!33506 (h!34808 (_ BitVec 64)) (t!48196 List!33510)) )
))
(declare-fun arrayNoDuplicates!0 (array!97208 (_ BitVec 32) List!33510) Bool)

(assert (=> b!1425344 (= res!960828 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33507))))

(declare-fun b!1425345 () Bool)

(declare-fun res!960825 () Bool)

(assert (=> b!1425345 (=> (not res!960825) (not e!805316))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425345 (= res!960825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46922 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46922 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97209 (store (arr!46922 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47474 a!2831)) mask!2608) (Intermediate!11228 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425346 () Bool)

(declare-fun res!960827 () Bool)

(assert (=> b!1425346 (=> (not res!960827) (not e!805316))))

(assert (=> b!1425346 (= res!960827 (and (= (size!47474 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47474 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47474 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425347 () Bool)

(declare-fun res!960830 () Bool)

(assert (=> b!1425347 (=> (not res!960830) (not e!805316))))

(assert (=> b!1425347 (= res!960830 (validKeyInArray!0 (select (arr!46922 a!2831) i!982)))))

(declare-fun b!1425348 () Bool)

(assert (=> b!1425348 (= e!805316 false)))

(declare-fun lt!627623 () SeekEntryResult!11228)

(assert (=> b!1425348 (= lt!627623 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46922 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122890 res!960824) b!1425346))

(assert (= (and b!1425346 res!960827) b!1425347))

(assert (= (and b!1425347 res!960830) b!1425342))

(assert (= (and b!1425342 res!960831) b!1425341))

(assert (= (and b!1425341 res!960829) b!1425344))

(assert (= (and b!1425344 res!960828) b!1425343))

(assert (= (and b!1425343 res!960826) b!1425340))

(assert (= (and b!1425340 res!960832) b!1425345))

(assert (= (and b!1425345 res!960825) b!1425348))

(declare-fun m!1315443 () Bool)

(assert (=> b!1425345 m!1315443))

(declare-fun m!1315445 () Bool)

(assert (=> b!1425345 m!1315445))

(assert (=> b!1425345 m!1315445))

(declare-fun m!1315447 () Bool)

(assert (=> b!1425345 m!1315447))

(assert (=> b!1425345 m!1315447))

(assert (=> b!1425345 m!1315445))

(declare-fun m!1315449 () Bool)

(assert (=> b!1425345 m!1315449))

(declare-fun m!1315451 () Bool)

(assert (=> b!1425342 m!1315451))

(assert (=> b!1425342 m!1315451))

(declare-fun m!1315453 () Bool)

(assert (=> b!1425342 m!1315453))

(assert (=> b!1425348 m!1315451))

(assert (=> b!1425348 m!1315451))

(declare-fun m!1315455 () Bool)

(assert (=> b!1425348 m!1315455))

(assert (=> b!1425340 m!1315451))

(assert (=> b!1425340 m!1315451))

(declare-fun m!1315457 () Bool)

(assert (=> b!1425340 m!1315457))

(assert (=> b!1425340 m!1315457))

(assert (=> b!1425340 m!1315451))

(declare-fun m!1315459 () Bool)

(assert (=> b!1425340 m!1315459))

(declare-fun m!1315461 () Bool)

(assert (=> start!122890 m!1315461))

(declare-fun m!1315463 () Bool)

(assert (=> start!122890 m!1315463))

(declare-fun m!1315465 () Bool)

(assert (=> b!1425341 m!1315465))

(declare-fun m!1315467 () Bool)

(assert (=> b!1425344 m!1315467))

(declare-fun m!1315469 () Bool)

(assert (=> b!1425347 m!1315469))

(assert (=> b!1425347 m!1315469))

(declare-fun m!1315471 () Bool)

(assert (=> b!1425347 m!1315471))

(push 1)

(assert (not b!1425345))

(assert (not start!122890))

(assert (not b!1425342))

(assert (not b!1425348))

(assert (not b!1425347))

(assert (not b!1425340))

(assert (not b!1425344))

(assert (not b!1425341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

