; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122854 () Bool)

(assert start!122854)

(declare-fun b!1424964 () Bool)

(declare-fun res!960400 () Bool)

(declare-fun e!805235 () Bool)

(assert (=> b!1424964 (=> (not res!960400) (not e!805235))))

(declare-datatypes ((array!97219 0))(
  ( (array!97220 (arr!46927 (Array (_ BitVec 32) (_ BitVec 64))) (size!47477 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97219)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97219 (_ BitVec 32)) Bool)

(assert (=> b!1424964 (= res!960400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424965 () Bool)

(declare-fun res!960401 () Bool)

(assert (=> b!1424965 (=> (not res!960401) (not e!805235))))

(declare-datatypes ((List!33437 0))(
  ( (Nil!33434) (Cons!33433 (h!34735 (_ BitVec 64)) (t!48131 List!33437)) )
))
(declare-fun arrayNoDuplicates!0 (array!97219 (_ BitVec 32) List!33437) Bool)

(assert (=> b!1424965 (= res!960401 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33434))))

(declare-fun b!1424966 () Bool)

(declare-fun res!960402 () Bool)

(assert (=> b!1424966 (=> (not res!960402) (not e!805235))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424966 (= res!960402 (validKeyInArray!0 (select (arr!46927 a!2831) i!982)))))

(declare-fun res!960399 () Bool)

(assert (=> start!122854 (=> (not res!960399) (not e!805235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122854 (= res!960399 (validMask!0 mask!2608))))

(assert (=> start!122854 e!805235))

(assert (=> start!122854 true))

(declare-fun array_inv!35955 (array!97219) Bool)

(assert (=> start!122854 (array_inv!35955 a!2831)))

(declare-fun b!1424967 () Bool)

(declare-fun res!960397 () Bool)

(assert (=> b!1424967 (=> (not res!960397) (not e!805235))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1424967 (= res!960397 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47477 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47477 a!2831))))))

(declare-fun b!1424968 () Bool)

(declare-fun res!960403 () Bool)

(assert (=> b!1424968 (=> (not res!960403) (not e!805235))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1424968 (= res!960403 (validKeyInArray!0 (select (arr!46927 a!2831) j!81)))))

(declare-fun b!1424969 () Bool)

(assert (=> b!1424969 (= e!805235 false)))

(declare-fun lt!627753 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424969 (= lt!627753 (toIndex!0 (select (arr!46927 a!2831) j!81) mask!2608))))

(declare-fun b!1424970 () Bool)

(declare-fun res!960398 () Bool)

(assert (=> b!1424970 (=> (not res!960398) (not e!805235))))

(assert (=> b!1424970 (= res!960398 (and (= (size!47477 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47477 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47477 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122854 res!960399) b!1424970))

(assert (= (and b!1424970 res!960398) b!1424966))

(assert (= (and b!1424966 res!960402) b!1424968))

(assert (= (and b!1424968 res!960403) b!1424964))

(assert (= (and b!1424964 res!960400) b!1424965))

(assert (= (and b!1424965 res!960401) b!1424967))

(assert (= (and b!1424967 res!960397) b!1424969))

(declare-fun m!1315527 () Bool)

(assert (=> b!1424966 m!1315527))

(assert (=> b!1424966 m!1315527))

(declare-fun m!1315529 () Bool)

(assert (=> b!1424966 m!1315529))

(declare-fun m!1315531 () Bool)

(assert (=> b!1424964 m!1315531))

(declare-fun m!1315533 () Bool)

(assert (=> start!122854 m!1315533))

(declare-fun m!1315535 () Bool)

(assert (=> start!122854 m!1315535))

(declare-fun m!1315537 () Bool)

(assert (=> b!1424969 m!1315537))

(assert (=> b!1424969 m!1315537))

(declare-fun m!1315539 () Bool)

(assert (=> b!1424969 m!1315539))

(assert (=> b!1424968 m!1315537))

(assert (=> b!1424968 m!1315537))

(declare-fun m!1315541 () Bool)

(assert (=> b!1424968 m!1315541))

(declare-fun m!1315543 () Bool)

(assert (=> b!1424965 m!1315543))

(push 1)

(assert (not b!1424966))

(assert (not b!1424965))

(assert (not start!122854))

(assert (not b!1424968))

(assert (not b!1424969))

(assert (not b!1424964))

(check-sat)

(pop 1)

(push 1)

