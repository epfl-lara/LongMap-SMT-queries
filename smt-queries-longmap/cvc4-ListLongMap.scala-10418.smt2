; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122668 () Bool)

(assert start!122668)

(declare-fun b!1420962 () Bool)

(declare-fun e!803561 () Bool)

(declare-fun e!803562 () Bool)

(assert (=> b!1420962 (= e!803561 e!803562)))

(declare-fun res!956450 () Bool)

(assert (=> b!1420962 (=> (not res!956450) (not e!803562))))

(declare-datatypes ((SeekEntryResult!11123 0))(
  ( (MissingZero!11123 (index!46884 (_ BitVec 32))) (Found!11123 (index!46885 (_ BitVec 32))) (Intermediate!11123 (undefined!11935 Bool) (index!46886 (_ BitVec 32)) (x!128530 (_ BitVec 32))) (Undefined!11123) (MissingVacant!11123 (index!46887 (_ BitVec 32))) )
))
(declare-fun lt!625911 () SeekEntryResult!11123)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96986 0))(
  ( (array!96987 (arr!46811 (Array (_ BitVec 32) (_ BitVec 64))) (size!47363 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96986)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96986 (_ BitVec 32)) SeekEntryResult!11123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420962 (= res!956450 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46811 a!2831) j!81) mask!2608) (select (arr!46811 a!2831) j!81) a!2831 mask!2608) lt!625911))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420962 (= lt!625911 (Intermediate!11123 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420963 () Bool)

(declare-fun res!956455 () Bool)

(assert (=> b!1420963 (=> (not res!956455) (not e!803561))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420963 (= res!956455 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47363 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47363 a!2831))))))

(declare-fun b!1420964 () Bool)

(declare-fun res!956451 () Bool)

(declare-fun e!803563 () Bool)

(assert (=> b!1420964 (=> (not res!956451) (not e!803563))))

(assert (=> b!1420964 (= res!956451 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46811 a!2831) j!81) a!2831 mask!2608) lt!625911))))

(declare-fun b!1420965 () Bool)

(declare-fun res!956448 () Bool)

(assert (=> b!1420965 (=> (not res!956448) (not e!803561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420965 (= res!956448 (validKeyInArray!0 (select (arr!46811 a!2831) j!81)))))

(declare-fun b!1420966 () Bool)

(declare-fun res!956452 () Bool)

(assert (=> b!1420966 (=> (not res!956452) (not e!803561))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420966 (= res!956452 (validKeyInArray!0 (select (arr!46811 a!2831) i!982)))))

(declare-fun b!1420967 () Bool)

(declare-fun res!956449 () Bool)

(assert (=> b!1420967 (=> (not res!956449) (not e!803561))))

(assert (=> b!1420967 (= res!956449 (and (= (size!47363 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47363 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47363 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420969 () Bool)

(assert (=> b!1420969 (= e!803563 false)))

(declare-fun lt!625910 () SeekEntryResult!11123)

(declare-fun lt!625912 () array!96986)

(declare-fun lt!625913 () (_ BitVec 64))

(assert (=> b!1420969 (= lt!625910 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625913 lt!625912 mask!2608))))

(declare-fun b!1420970 () Bool)

(declare-fun res!956453 () Bool)

(assert (=> b!1420970 (=> (not res!956453) (not e!803561))))

(declare-datatypes ((List!33399 0))(
  ( (Nil!33396) (Cons!33395 (h!34697 (_ BitVec 64)) (t!48085 List!33399)) )
))
(declare-fun arrayNoDuplicates!0 (array!96986 (_ BitVec 32) List!33399) Bool)

(assert (=> b!1420970 (= res!956453 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33396))))

(declare-fun b!1420971 () Bool)

(declare-fun res!956447 () Bool)

(assert (=> b!1420971 (=> (not res!956447) (not e!803561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96986 (_ BitVec 32)) Bool)

(assert (=> b!1420971 (= res!956447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420968 () Bool)

(assert (=> b!1420968 (= e!803562 e!803563)))

(declare-fun res!956446 () Bool)

(assert (=> b!1420968 (=> (not res!956446) (not e!803563))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420968 (= res!956446 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625913 mask!2608) lt!625913 lt!625912 mask!2608) (Intermediate!11123 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420968 (= lt!625913 (select (store (arr!46811 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420968 (= lt!625912 (array!96987 (store (arr!46811 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47363 a!2831)))))

(declare-fun res!956454 () Bool)

(assert (=> start!122668 (=> (not res!956454) (not e!803561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122668 (= res!956454 (validMask!0 mask!2608))))

(assert (=> start!122668 e!803561))

(assert (=> start!122668 true))

(declare-fun array_inv!36044 (array!96986) Bool)

(assert (=> start!122668 (array_inv!36044 a!2831)))

(assert (= (and start!122668 res!956454) b!1420967))

(assert (= (and b!1420967 res!956449) b!1420966))

(assert (= (and b!1420966 res!956452) b!1420965))

(assert (= (and b!1420965 res!956448) b!1420971))

(assert (= (and b!1420971 res!956447) b!1420970))

(assert (= (and b!1420970 res!956453) b!1420963))

(assert (= (and b!1420963 res!956455) b!1420962))

(assert (= (and b!1420962 res!956450) b!1420968))

(assert (= (and b!1420968 res!956446) b!1420964))

(assert (= (and b!1420964 res!956451) b!1420969))

(declare-fun m!1311035 () Bool)

(assert (=> b!1420962 m!1311035))

(assert (=> b!1420962 m!1311035))

(declare-fun m!1311037 () Bool)

(assert (=> b!1420962 m!1311037))

(assert (=> b!1420962 m!1311037))

(assert (=> b!1420962 m!1311035))

(declare-fun m!1311039 () Bool)

(assert (=> b!1420962 m!1311039))

(declare-fun m!1311041 () Bool)

(assert (=> start!122668 m!1311041))

(declare-fun m!1311043 () Bool)

(assert (=> start!122668 m!1311043))

(assert (=> b!1420965 m!1311035))

(assert (=> b!1420965 m!1311035))

(declare-fun m!1311045 () Bool)

(assert (=> b!1420965 m!1311045))

(declare-fun m!1311047 () Bool)

(assert (=> b!1420971 m!1311047))

(declare-fun m!1311049 () Bool)

(assert (=> b!1420966 m!1311049))

(assert (=> b!1420966 m!1311049))

(declare-fun m!1311051 () Bool)

(assert (=> b!1420966 m!1311051))

(assert (=> b!1420964 m!1311035))

(assert (=> b!1420964 m!1311035))

(declare-fun m!1311053 () Bool)

(assert (=> b!1420964 m!1311053))

(declare-fun m!1311055 () Bool)

(assert (=> b!1420969 m!1311055))

(declare-fun m!1311057 () Bool)

(assert (=> b!1420970 m!1311057))

(declare-fun m!1311059 () Bool)

(assert (=> b!1420968 m!1311059))

(assert (=> b!1420968 m!1311059))

(declare-fun m!1311061 () Bool)

(assert (=> b!1420968 m!1311061))

(declare-fun m!1311063 () Bool)

(assert (=> b!1420968 m!1311063))

(declare-fun m!1311065 () Bool)

(assert (=> b!1420968 m!1311065))

(push 1)

(assert (not b!1420968))

(assert (not b!1420964))

(assert (not b!1420962))

(assert (not b!1420965))

(assert (not b!1420966))

(assert (not b!1420969))

(assert (not b!1420971))

(assert (not b!1420970))

(assert (not start!122668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

