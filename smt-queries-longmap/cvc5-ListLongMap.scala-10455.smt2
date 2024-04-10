; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122892 () Bool)

(assert start!122892)

(declare-fun b!1425394 () Bool)

(declare-fun res!960834 () Bool)

(declare-fun e!805348 () Bool)

(assert (=> b!1425394 (=> (not res!960834) (not e!805348))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97257 0))(
  ( (array!97258 (arr!46946 (Array (_ BitVec 32) (_ BitVec 64))) (size!47496 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97257)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11225 0))(
  ( (MissingZero!11225 (index!47292 (_ BitVec 32))) (Found!11225 (index!47293 (_ BitVec 32))) (Intermediate!11225 (undefined!12037 Bool) (index!47294 (_ BitVec 32)) (x!128931 (_ BitVec 32))) (Undefined!11225) (MissingVacant!11225 (index!47295 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97257 (_ BitVec 32)) SeekEntryResult!11225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425394 (= res!960834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46946 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46946 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97258 (store (arr!46946 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47496 a!2831)) mask!2608) (Intermediate!11225 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425395 () Bool)

(declare-fun res!960833 () Bool)

(assert (=> b!1425395 (=> (not res!960833) (not e!805348))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425395 (= res!960833 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47496 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47496 a!2831))))))

(declare-fun b!1425396 () Bool)

(declare-fun res!960828 () Bool)

(assert (=> b!1425396 (=> (not res!960828) (not e!805348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97257 (_ BitVec 32)) Bool)

(assert (=> b!1425396 (= res!960828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!960835 () Bool)

(assert (=> start!122892 (=> (not res!960835) (not e!805348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122892 (= res!960835 (validMask!0 mask!2608))))

(assert (=> start!122892 e!805348))

(assert (=> start!122892 true))

(declare-fun array_inv!35974 (array!97257) Bool)

(assert (=> start!122892 (array_inv!35974 a!2831)))

(declare-fun b!1425397 () Bool)

(declare-fun res!960827 () Bool)

(assert (=> b!1425397 (=> (not res!960827) (not e!805348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425397 (= res!960827 (validKeyInArray!0 (select (arr!46946 a!2831) i!982)))))

(declare-fun b!1425398 () Bool)

(assert (=> b!1425398 (= e!805348 false)))

(declare-fun lt!627810 () SeekEntryResult!11225)

(assert (=> b!1425398 (= lt!627810 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46946 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425399 () Bool)

(declare-fun res!960832 () Bool)

(assert (=> b!1425399 (=> (not res!960832) (not e!805348))))

(assert (=> b!1425399 (= res!960832 (and (= (size!47496 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47496 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47496 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425400 () Bool)

(declare-fun res!960830 () Bool)

(assert (=> b!1425400 (=> (not res!960830) (not e!805348))))

(assert (=> b!1425400 (= res!960830 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46946 a!2831) j!81) mask!2608) (select (arr!46946 a!2831) j!81) a!2831 mask!2608) (Intermediate!11225 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425401 () Bool)

(declare-fun res!960831 () Bool)

(assert (=> b!1425401 (=> (not res!960831) (not e!805348))))

(assert (=> b!1425401 (= res!960831 (validKeyInArray!0 (select (arr!46946 a!2831) j!81)))))

(declare-fun b!1425402 () Bool)

(declare-fun res!960829 () Bool)

(assert (=> b!1425402 (=> (not res!960829) (not e!805348))))

(declare-datatypes ((List!33456 0))(
  ( (Nil!33453) (Cons!33452 (h!34754 (_ BitVec 64)) (t!48150 List!33456)) )
))
(declare-fun arrayNoDuplicates!0 (array!97257 (_ BitVec 32) List!33456) Bool)

(assert (=> b!1425402 (= res!960829 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33453))))

(assert (= (and start!122892 res!960835) b!1425399))

(assert (= (and b!1425399 res!960832) b!1425397))

(assert (= (and b!1425397 res!960827) b!1425401))

(assert (= (and b!1425401 res!960831) b!1425396))

(assert (= (and b!1425396 res!960828) b!1425402))

(assert (= (and b!1425402 res!960829) b!1425395))

(assert (= (and b!1425395 res!960833) b!1425400))

(assert (= (and b!1425400 res!960830) b!1425394))

(assert (= (and b!1425394 res!960834) b!1425398))

(declare-fun m!1315965 () Bool)

(assert (=> b!1425394 m!1315965))

(declare-fun m!1315967 () Bool)

(assert (=> b!1425394 m!1315967))

(assert (=> b!1425394 m!1315967))

(declare-fun m!1315969 () Bool)

(assert (=> b!1425394 m!1315969))

(assert (=> b!1425394 m!1315969))

(assert (=> b!1425394 m!1315967))

(declare-fun m!1315971 () Bool)

(assert (=> b!1425394 m!1315971))

(declare-fun m!1315973 () Bool)

(assert (=> start!122892 m!1315973))

(declare-fun m!1315975 () Bool)

(assert (=> start!122892 m!1315975))

(declare-fun m!1315977 () Bool)

(assert (=> b!1425402 m!1315977))

(declare-fun m!1315979 () Bool)

(assert (=> b!1425397 m!1315979))

(assert (=> b!1425397 m!1315979))

(declare-fun m!1315981 () Bool)

(assert (=> b!1425397 m!1315981))

(declare-fun m!1315983 () Bool)

(assert (=> b!1425400 m!1315983))

(assert (=> b!1425400 m!1315983))

(declare-fun m!1315985 () Bool)

(assert (=> b!1425400 m!1315985))

(assert (=> b!1425400 m!1315985))

(assert (=> b!1425400 m!1315983))

(declare-fun m!1315987 () Bool)

(assert (=> b!1425400 m!1315987))

(assert (=> b!1425401 m!1315983))

(assert (=> b!1425401 m!1315983))

(declare-fun m!1315989 () Bool)

(assert (=> b!1425401 m!1315989))

(assert (=> b!1425398 m!1315983))

(assert (=> b!1425398 m!1315983))

(declare-fun m!1315991 () Bool)

(assert (=> b!1425398 m!1315991))

(declare-fun m!1315993 () Bool)

(assert (=> b!1425396 m!1315993))

(push 1)

(assert (not b!1425397))

(assert (not b!1425401))

(assert (not b!1425398))

(assert (not b!1425400))

(assert (not b!1425394))

(assert (not b!1425396))

(assert (not start!122892))

(assert (not b!1425402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

