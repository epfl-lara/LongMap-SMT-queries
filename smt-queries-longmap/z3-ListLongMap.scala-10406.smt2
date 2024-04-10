; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122600 () Bool)

(assert start!122600)

(declare-fun b!1420007 () Bool)

(declare-fun res!955446 () Bool)

(declare-fun e!803276 () Bool)

(assert (=> b!1420007 (=> (not res!955446) (not e!803276))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96965 0))(
  ( (array!96966 (arr!46800 (Array (_ BitVec 32) (_ BitVec 64))) (size!47350 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96965)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420007 (= res!955446 (and (= (size!47350 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47350 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47350 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420008 () Bool)

(declare-fun res!955447 () Bool)

(assert (=> b!1420008 (=> (not res!955447) (not e!803276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96965 (_ BitVec 32)) Bool)

(assert (=> b!1420008 (= res!955447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420009 () Bool)

(declare-fun res!955442 () Bool)

(assert (=> b!1420009 (=> (not res!955442) (not e!803276))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11085 0))(
  ( (MissingZero!11085 (index!46732 (_ BitVec 32))) (Found!11085 (index!46733 (_ BitVec 32))) (Intermediate!11085 (undefined!11897 Bool) (index!46734 (_ BitVec 32)) (x!128399 (_ BitVec 32))) (Undefined!11085) (MissingVacant!11085 (index!46735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96965 (_ BitVec 32)) SeekEntryResult!11085)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420009 (= res!955442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46800 a!2831) j!81) mask!2608) (select (arr!46800 a!2831) j!81) a!2831 mask!2608) (Intermediate!11085 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!955443 () Bool)

(assert (=> start!122600 (=> (not res!955443) (not e!803276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122600 (= res!955443 (validMask!0 mask!2608))))

(assert (=> start!122600 e!803276))

(assert (=> start!122600 true))

(declare-fun array_inv!35828 (array!96965) Bool)

(assert (=> start!122600 (array_inv!35828 a!2831)))

(declare-fun b!1420010 () Bool)

(declare-fun res!955440 () Bool)

(assert (=> b!1420010 (=> (not res!955440) (not e!803276))))

(declare-datatypes ((List!33310 0))(
  ( (Nil!33307) (Cons!33306 (h!34608 (_ BitVec 64)) (t!48004 List!33310)) )
))
(declare-fun arrayNoDuplicates!0 (array!96965 (_ BitVec 32) List!33310) Bool)

(assert (=> b!1420010 (= res!955440 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33307))))

(declare-fun b!1420011 () Bool)

(declare-fun res!955441 () Bool)

(assert (=> b!1420011 (=> (not res!955441) (not e!803276))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420011 (= res!955441 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47350 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47350 a!2831))))))

(declare-fun b!1420012 () Bool)

(assert (=> b!1420012 (= e!803276 false)))

(declare-fun lt!625869 () SeekEntryResult!11085)

(assert (=> b!1420012 (= lt!625869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46800 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46800 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96966 (store (arr!46800 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47350 a!2831)) mask!2608))))

(declare-fun b!1420013 () Bool)

(declare-fun res!955444 () Bool)

(assert (=> b!1420013 (=> (not res!955444) (not e!803276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420013 (= res!955444 (validKeyInArray!0 (select (arr!46800 a!2831) i!982)))))

(declare-fun b!1420014 () Bool)

(declare-fun res!955445 () Bool)

(assert (=> b!1420014 (=> (not res!955445) (not e!803276))))

(assert (=> b!1420014 (= res!955445 (validKeyInArray!0 (select (arr!46800 a!2831) j!81)))))

(assert (= (and start!122600 res!955443) b!1420007))

(assert (= (and b!1420007 res!955446) b!1420013))

(assert (= (and b!1420013 res!955444) b!1420014))

(assert (= (and b!1420014 res!955445) b!1420008))

(assert (= (and b!1420008 res!955447) b!1420010))

(assert (= (and b!1420010 res!955440) b!1420011))

(assert (= (and b!1420011 res!955441) b!1420009))

(assert (= (and b!1420009 res!955442) b!1420012))

(declare-fun m!1310485 () Bool)

(assert (=> b!1420014 m!1310485))

(assert (=> b!1420014 m!1310485))

(declare-fun m!1310487 () Bool)

(assert (=> b!1420014 m!1310487))

(declare-fun m!1310489 () Bool)

(assert (=> start!122600 m!1310489))

(declare-fun m!1310491 () Bool)

(assert (=> start!122600 m!1310491))

(assert (=> b!1420009 m!1310485))

(assert (=> b!1420009 m!1310485))

(declare-fun m!1310493 () Bool)

(assert (=> b!1420009 m!1310493))

(assert (=> b!1420009 m!1310493))

(assert (=> b!1420009 m!1310485))

(declare-fun m!1310495 () Bool)

(assert (=> b!1420009 m!1310495))

(declare-fun m!1310497 () Bool)

(assert (=> b!1420010 m!1310497))

(declare-fun m!1310499 () Bool)

(assert (=> b!1420012 m!1310499))

(declare-fun m!1310501 () Bool)

(assert (=> b!1420012 m!1310501))

(assert (=> b!1420012 m!1310501))

(declare-fun m!1310503 () Bool)

(assert (=> b!1420012 m!1310503))

(assert (=> b!1420012 m!1310503))

(assert (=> b!1420012 m!1310501))

(declare-fun m!1310505 () Bool)

(assert (=> b!1420012 m!1310505))

(declare-fun m!1310507 () Bool)

(assert (=> b!1420008 m!1310507))

(declare-fun m!1310509 () Bool)

(assert (=> b!1420013 m!1310509))

(assert (=> b!1420013 m!1310509))

(declare-fun m!1310511 () Bool)

(assert (=> b!1420013 m!1310511))

(check-sat (not b!1420014) (not b!1420012) (not b!1420009) (not b!1420008) (not b!1420013) (not start!122600) (not b!1420010))
