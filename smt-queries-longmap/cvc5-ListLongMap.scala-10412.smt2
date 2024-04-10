; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122634 () Bool)

(assert start!122634)

(declare-fun b!1420471 () Bool)

(declare-fun res!955905 () Bool)

(declare-fun e!803395 () Bool)

(assert (=> b!1420471 (=> (not res!955905) (not e!803395))))

(declare-datatypes ((array!96999 0))(
  ( (array!97000 (arr!46817 (Array (_ BitVec 32) (_ BitVec 64))) (size!47367 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96999)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96999 (_ BitVec 32)) Bool)

(assert (=> b!1420471 (= res!955905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955908 () Bool)

(assert (=> start!122634 (=> (not res!955908) (not e!803395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122634 (= res!955908 (validMask!0 mask!2608))))

(assert (=> start!122634 e!803395))

(assert (=> start!122634 true))

(declare-fun array_inv!35845 (array!96999) Bool)

(assert (=> start!122634 (array_inv!35845 a!2831)))

(declare-fun b!1420472 () Bool)

(declare-fun res!955907 () Bool)

(assert (=> b!1420472 (=> (not res!955907) (not e!803395))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420472 (= res!955907 (and (= (size!47367 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47367 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47367 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420473 () Bool)

(declare-fun res!955904 () Bool)

(assert (=> b!1420473 (=> (not res!955904) (not e!803395))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11102 0))(
  ( (MissingZero!11102 (index!46800 (_ BitVec 32))) (Found!11102 (index!46801 (_ BitVec 32))) (Intermediate!11102 (undefined!11914 Bool) (index!46802 (_ BitVec 32)) (x!128464 (_ BitVec 32))) (Undefined!11102) (MissingVacant!11102 (index!46803 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96999 (_ BitVec 32)) SeekEntryResult!11102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420473 (= res!955904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46817 a!2831) j!81) mask!2608) (select (arr!46817 a!2831) j!81) a!2831 mask!2608) (Intermediate!11102 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420474 () Bool)

(declare-fun res!955906 () Bool)

(assert (=> b!1420474 (=> (not res!955906) (not e!803395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420474 (= res!955906 (validKeyInArray!0 (select (arr!46817 a!2831) j!81)))))

(declare-fun b!1420475 () Bool)

(declare-fun res!955911 () Bool)

(assert (=> b!1420475 (=> (not res!955911) (not e!803395))))

(assert (=> b!1420475 (= res!955911 (validKeyInArray!0 (select (arr!46817 a!2831) i!982)))))

(declare-fun b!1420476 () Bool)

(declare-fun res!955912 () Bool)

(assert (=> b!1420476 (=> (not res!955912) (not e!803395))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420476 (= res!955912 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47367 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47367 a!2831))))))

(declare-fun b!1420477 () Bool)

(assert (=> b!1420477 (= e!803395 false)))

(declare-fun lt!625920 () SeekEntryResult!11102)

(assert (=> b!1420477 (= lt!625920 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46817 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420478 () Bool)

(declare-fun res!955910 () Bool)

(assert (=> b!1420478 (=> (not res!955910) (not e!803395))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420478 (= res!955910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46817 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46817 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97000 (store (arr!46817 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47367 a!2831)) mask!2608) (Intermediate!11102 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420479 () Bool)

(declare-fun res!955909 () Bool)

(assert (=> b!1420479 (=> (not res!955909) (not e!803395))))

(declare-datatypes ((List!33327 0))(
  ( (Nil!33324) (Cons!33323 (h!34625 (_ BitVec 64)) (t!48021 List!33327)) )
))
(declare-fun arrayNoDuplicates!0 (array!96999 (_ BitVec 32) List!33327) Bool)

(assert (=> b!1420479 (= res!955909 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33324))))

(assert (= (and start!122634 res!955908) b!1420472))

(assert (= (and b!1420472 res!955907) b!1420475))

(assert (= (and b!1420475 res!955911) b!1420474))

(assert (= (and b!1420474 res!955906) b!1420471))

(assert (= (and b!1420471 res!955905) b!1420479))

(assert (= (and b!1420479 res!955909) b!1420476))

(assert (= (and b!1420476 res!955912) b!1420473))

(assert (= (and b!1420473 res!955904) b!1420478))

(assert (= (and b!1420478 res!955910) b!1420477))

(declare-fun m!1310985 () Bool)

(assert (=> b!1420475 m!1310985))

(assert (=> b!1420475 m!1310985))

(declare-fun m!1310987 () Bool)

(assert (=> b!1420475 m!1310987))

(declare-fun m!1310989 () Bool)

(assert (=> b!1420477 m!1310989))

(assert (=> b!1420477 m!1310989))

(declare-fun m!1310991 () Bool)

(assert (=> b!1420477 m!1310991))

(assert (=> b!1420473 m!1310989))

(assert (=> b!1420473 m!1310989))

(declare-fun m!1310993 () Bool)

(assert (=> b!1420473 m!1310993))

(assert (=> b!1420473 m!1310993))

(assert (=> b!1420473 m!1310989))

(declare-fun m!1310995 () Bool)

(assert (=> b!1420473 m!1310995))

(declare-fun m!1310997 () Bool)

(assert (=> b!1420479 m!1310997))

(declare-fun m!1310999 () Bool)

(assert (=> b!1420478 m!1310999))

(declare-fun m!1311001 () Bool)

(assert (=> b!1420478 m!1311001))

(assert (=> b!1420478 m!1311001))

(declare-fun m!1311003 () Bool)

(assert (=> b!1420478 m!1311003))

(assert (=> b!1420478 m!1311003))

(assert (=> b!1420478 m!1311001))

(declare-fun m!1311005 () Bool)

(assert (=> b!1420478 m!1311005))

(declare-fun m!1311007 () Bool)

(assert (=> b!1420471 m!1311007))

(declare-fun m!1311009 () Bool)

(assert (=> start!122634 m!1311009))

(declare-fun m!1311011 () Bool)

(assert (=> start!122634 m!1311011))

(assert (=> b!1420474 m!1310989))

(assert (=> b!1420474 m!1310989))

(declare-fun m!1311013 () Bool)

(assert (=> b!1420474 m!1311013))

(push 1)

(assert (not start!122634))

(assert (not b!1420474))

(assert (not b!1420471))

(assert (not b!1420479))

(assert (not b!1420473))

(assert (not b!1420478))

(assert (not b!1420475))

(assert (not b!1420477))

(check-sat)

