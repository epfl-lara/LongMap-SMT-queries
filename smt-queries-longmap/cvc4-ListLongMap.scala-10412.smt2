; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122638 () Bool)

(assert start!122638)

(declare-fun b!1420525 () Bool)

(declare-fun res!955966 () Bool)

(declare-fun e!803407 () Bool)

(assert (=> b!1420525 (=> (not res!955966) (not e!803407))))

(declare-datatypes ((array!97003 0))(
  ( (array!97004 (arr!46819 (Array (_ BitVec 32) (_ BitVec 64))) (size!47369 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97003)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97003 (_ BitVec 32)) Bool)

(assert (=> b!1420525 (= res!955966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420526 () Bool)

(declare-fun res!955959 () Bool)

(assert (=> b!1420526 (=> (not res!955959) (not e!803407))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420526 (= res!955959 (validKeyInArray!0 (select (arr!46819 a!2831) i!982)))))

(declare-fun b!1420527 () Bool)

(declare-fun res!955961 () Bool)

(assert (=> b!1420527 (=> (not res!955961) (not e!803407))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1420527 (= res!955961 (and (= (size!47369 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47369 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47369 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420528 () Bool)

(declare-fun res!955960 () Bool)

(assert (=> b!1420528 (=> (not res!955960) (not e!803407))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11104 0))(
  ( (MissingZero!11104 (index!46808 (_ BitVec 32))) (Found!11104 (index!46809 (_ BitVec 32))) (Intermediate!11104 (undefined!11916 Bool) (index!46810 (_ BitVec 32)) (x!128466 (_ BitVec 32))) (Undefined!11104) (MissingVacant!11104 (index!46811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97003 (_ BitVec 32)) SeekEntryResult!11104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420528 (= res!955960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46819 a!2831) j!81) mask!2608) (select (arr!46819 a!2831) j!81) a!2831 mask!2608) (Intermediate!11104 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420529 () Bool)

(declare-fun res!955962 () Bool)

(assert (=> b!1420529 (=> (not res!955962) (not e!803407))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420529 (= res!955962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46819 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46819 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97004 (store (arr!46819 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47369 a!2831)) mask!2608) (Intermediate!11104 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun res!955963 () Bool)

(assert (=> start!122638 (=> (not res!955963) (not e!803407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122638 (= res!955963 (validMask!0 mask!2608))))

(assert (=> start!122638 e!803407))

(assert (=> start!122638 true))

(declare-fun array_inv!35847 (array!97003) Bool)

(assert (=> start!122638 (array_inv!35847 a!2831)))

(declare-fun b!1420530 () Bool)

(declare-fun res!955965 () Bool)

(assert (=> b!1420530 (=> (not res!955965) (not e!803407))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420530 (= res!955965 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47369 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47369 a!2831))))))

(declare-fun b!1420531 () Bool)

(declare-fun res!955958 () Bool)

(assert (=> b!1420531 (=> (not res!955958) (not e!803407))))

(declare-datatypes ((List!33329 0))(
  ( (Nil!33326) (Cons!33325 (h!34627 (_ BitVec 64)) (t!48023 List!33329)) )
))
(declare-fun arrayNoDuplicates!0 (array!97003 (_ BitVec 32) List!33329) Bool)

(assert (=> b!1420531 (= res!955958 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33326))))

(declare-fun b!1420532 () Bool)

(declare-fun res!955964 () Bool)

(assert (=> b!1420532 (=> (not res!955964) (not e!803407))))

(assert (=> b!1420532 (= res!955964 (validKeyInArray!0 (select (arr!46819 a!2831) j!81)))))

(declare-fun b!1420533 () Bool)

(assert (=> b!1420533 (= e!803407 false)))

(declare-fun lt!625926 () SeekEntryResult!11104)

(assert (=> b!1420533 (= lt!625926 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46819 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122638 res!955963) b!1420527))

(assert (= (and b!1420527 res!955961) b!1420526))

(assert (= (and b!1420526 res!955959) b!1420532))

(assert (= (and b!1420532 res!955964) b!1420525))

(assert (= (and b!1420525 res!955966) b!1420531))

(assert (= (and b!1420531 res!955958) b!1420530))

(assert (= (and b!1420530 res!955965) b!1420528))

(assert (= (and b!1420528 res!955960) b!1420529))

(assert (= (and b!1420529 res!955962) b!1420533))

(declare-fun m!1311045 () Bool)

(assert (=> b!1420531 m!1311045))

(declare-fun m!1311047 () Bool)

(assert (=> b!1420529 m!1311047))

(declare-fun m!1311049 () Bool)

(assert (=> b!1420529 m!1311049))

(assert (=> b!1420529 m!1311049))

(declare-fun m!1311051 () Bool)

(assert (=> b!1420529 m!1311051))

(assert (=> b!1420529 m!1311051))

(assert (=> b!1420529 m!1311049))

(declare-fun m!1311053 () Bool)

(assert (=> b!1420529 m!1311053))

(declare-fun m!1311055 () Bool)

(assert (=> b!1420526 m!1311055))

(assert (=> b!1420526 m!1311055))

(declare-fun m!1311057 () Bool)

(assert (=> b!1420526 m!1311057))

(declare-fun m!1311059 () Bool)

(assert (=> b!1420532 m!1311059))

(assert (=> b!1420532 m!1311059))

(declare-fun m!1311061 () Bool)

(assert (=> b!1420532 m!1311061))

(assert (=> b!1420533 m!1311059))

(assert (=> b!1420533 m!1311059))

(declare-fun m!1311063 () Bool)

(assert (=> b!1420533 m!1311063))

(assert (=> b!1420528 m!1311059))

(assert (=> b!1420528 m!1311059))

(declare-fun m!1311065 () Bool)

(assert (=> b!1420528 m!1311065))

(assert (=> b!1420528 m!1311065))

(assert (=> b!1420528 m!1311059))

(declare-fun m!1311067 () Bool)

(assert (=> b!1420528 m!1311067))

(declare-fun m!1311069 () Bool)

(assert (=> start!122638 m!1311069))

(declare-fun m!1311071 () Bool)

(assert (=> start!122638 m!1311071))

(declare-fun m!1311073 () Bool)

(assert (=> b!1420525 m!1311073))

(push 1)

(assert (not b!1420525))

(assert (not b!1420533))

(assert (not b!1420526))

(assert (not start!122638))

(assert (not b!1420532))

(assert (not b!1420531))

(assert (not b!1420529))

(assert (not b!1420528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

