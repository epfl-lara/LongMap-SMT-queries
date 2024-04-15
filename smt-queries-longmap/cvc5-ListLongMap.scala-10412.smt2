; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122634 () Bool)

(assert start!122634)

(declare-fun res!955931 () Bool)

(declare-fun e!803368 () Bool)

(assert (=> start!122634 (=> (not res!955931) (not e!803368))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122634 (= res!955931 (validMask!0 mask!2608))))

(assert (=> start!122634 e!803368))

(assert (=> start!122634 true))

(declare-datatypes ((array!96952 0))(
  ( (array!96953 (arr!46794 (Array (_ BitVec 32) (_ BitVec 64))) (size!47346 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96952)

(declare-fun array_inv!36027 (array!96952) Bool)

(assert (=> start!122634 (array_inv!36027 a!2831)))

(declare-fun b!1420444 () Bool)

(declare-fun res!955930 () Bool)

(assert (=> b!1420444 (=> (not res!955930) (not e!803368))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420444 (= res!955930 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47346 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47346 a!2831))))))

(declare-fun b!1420445 () Bool)

(declare-fun res!955934 () Bool)

(assert (=> b!1420445 (=> (not res!955934) (not e!803368))))

(declare-datatypes ((List!33382 0))(
  ( (Nil!33379) (Cons!33378 (h!34680 (_ BitVec 64)) (t!48068 List!33382)) )
))
(declare-fun arrayNoDuplicates!0 (array!96952 (_ BitVec 32) List!33382) Bool)

(assert (=> b!1420445 (= res!955934 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33379))))

(declare-fun b!1420446 () Bool)

(declare-fun res!955928 () Bool)

(assert (=> b!1420446 (=> (not res!955928) (not e!803368))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420446 (= res!955928 (validKeyInArray!0 (select (arr!46794 a!2831) j!81)))))

(declare-fun b!1420447 () Bool)

(declare-fun res!955933 () Bool)

(assert (=> b!1420447 (=> (not res!955933) (not e!803368))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420447 (= res!955933 (and (= (size!47346 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47346 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47346 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420448 () Bool)

(assert (=> b!1420448 (= e!803368 false)))

(declare-datatypes ((SeekEntryResult!11106 0))(
  ( (MissingZero!11106 (index!46816 (_ BitVec 32))) (Found!11106 (index!46817 (_ BitVec 32))) (Intermediate!11106 (undefined!11918 Bool) (index!46818 (_ BitVec 32)) (x!128465 (_ BitVec 32))) (Undefined!11106) (MissingVacant!11106 (index!46819 (_ BitVec 32))) )
))
(declare-fun lt!625736 () SeekEntryResult!11106)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96952 (_ BitVec 32)) SeekEntryResult!11106)

(assert (=> b!1420448 (= lt!625736 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46794 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420449 () Bool)

(declare-fun res!955929 () Bool)

(assert (=> b!1420449 (=> (not res!955929) (not e!803368))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420449 (= res!955929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46794 a!2831) j!81) mask!2608) (select (arr!46794 a!2831) j!81) a!2831 mask!2608) (Intermediate!11106 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420450 () Bool)

(declare-fun res!955932 () Bool)

(assert (=> b!1420450 (=> (not res!955932) (not e!803368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96952 (_ BitVec 32)) Bool)

(assert (=> b!1420450 (= res!955932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420451 () Bool)

(declare-fun res!955936 () Bool)

(assert (=> b!1420451 (=> (not res!955936) (not e!803368))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420451 (= res!955936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46794 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46794 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96953 (store (arr!46794 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47346 a!2831)) mask!2608) (Intermediate!11106 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420452 () Bool)

(declare-fun res!955935 () Bool)

(assert (=> b!1420452 (=> (not res!955935) (not e!803368))))

(assert (=> b!1420452 (= res!955935 (validKeyInArray!0 (select (arr!46794 a!2831) i!982)))))

(assert (= (and start!122634 res!955931) b!1420447))

(assert (= (and b!1420447 res!955933) b!1420452))

(assert (= (and b!1420452 res!955935) b!1420446))

(assert (= (and b!1420446 res!955928) b!1420450))

(assert (= (and b!1420450 res!955932) b!1420445))

(assert (= (and b!1420445 res!955934) b!1420444))

(assert (= (and b!1420444 res!955930) b!1420449))

(assert (= (and b!1420449 res!955929) b!1420451))

(assert (= (and b!1420451 res!955936) b!1420448))

(declare-fun m!1310493 () Bool)

(assert (=> start!122634 m!1310493))

(declare-fun m!1310495 () Bool)

(assert (=> start!122634 m!1310495))

(declare-fun m!1310497 () Bool)

(assert (=> b!1420452 m!1310497))

(assert (=> b!1420452 m!1310497))

(declare-fun m!1310499 () Bool)

(assert (=> b!1420452 m!1310499))

(declare-fun m!1310501 () Bool)

(assert (=> b!1420448 m!1310501))

(assert (=> b!1420448 m!1310501))

(declare-fun m!1310503 () Bool)

(assert (=> b!1420448 m!1310503))

(declare-fun m!1310505 () Bool)

(assert (=> b!1420451 m!1310505))

(declare-fun m!1310507 () Bool)

(assert (=> b!1420451 m!1310507))

(assert (=> b!1420451 m!1310507))

(declare-fun m!1310509 () Bool)

(assert (=> b!1420451 m!1310509))

(assert (=> b!1420451 m!1310509))

(assert (=> b!1420451 m!1310507))

(declare-fun m!1310511 () Bool)

(assert (=> b!1420451 m!1310511))

(declare-fun m!1310513 () Bool)

(assert (=> b!1420450 m!1310513))

(assert (=> b!1420449 m!1310501))

(assert (=> b!1420449 m!1310501))

(declare-fun m!1310515 () Bool)

(assert (=> b!1420449 m!1310515))

(assert (=> b!1420449 m!1310515))

(assert (=> b!1420449 m!1310501))

(declare-fun m!1310517 () Bool)

(assert (=> b!1420449 m!1310517))

(assert (=> b!1420446 m!1310501))

(assert (=> b!1420446 m!1310501))

(declare-fun m!1310519 () Bool)

(assert (=> b!1420446 m!1310519))

(declare-fun m!1310521 () Bool)

(assert (=> b!1420445 m!1310521))

(push 1)

(assert (not b!1420446))

(assert (not b!1420448))

(assert (not start!122634))

(assert (not b!1420445))

(assert (not b!1420451))

(assert (not b!1420449))

(assert (not b!1420452))

(assert (not b!1420450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

