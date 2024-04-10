; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122900 () Bool)

(assert start!122900)

(declare-fun b!1425502 () Bool)

(declare-fun res!960941 () Bool)

(declare-fun e!805372 () Bool)

(assert (=> b!1425502 (=> (not res!960941) (not e!805372))))

(declare-datatypes ((array!97265 0))(
  ( (array!97266 (arr!46950 (Array (_ BitVec 32) (_ BitVec 64))) (size!47500 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97265)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97265 (_ BitVec 32)) Bool)

(assert (=> b!1425502 (= res!960941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425503 () Bool)

(declare-fun res!960939 () Bool)

(assert (=> b!1425503 (=> (not res!960939) (not e!805372))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425503 (= res!960939 (validKeyInArray!0 (select (arr!46950 a!2831) i!982)))))

(declare-fun b!1425504 () Bool)

(declare-fun res!960935 () Bool)

(assert (=> b!1425504 (=> (not res!960935) (not e!805372))))

(declare-datatypes ((List!33460 0))(
  ( (Nil!33457) (Cons!33456 (h!34758 (_ BitVec 64)) (t!48154 List!33460)) )
))
(declare-fun arrayNoDuplicates!0 (array!97265 (_ BitVec 32) List!33460) Bool)

(assert (=> b!1425504 (= res!960935 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33457))))

(declare-fun b!1425505 () Bool)

(declare-fun res!960936 () Bool)

(assert (=> b!1425505 (=> (not res!960936) (not e!805372))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11229 0))(
  ( (MissingZero!11229 (index!47308 (_ BitVec 32))) (Found!11229 (index!47309 (_ BitVec 32))) (Intermediate!11229 (undefined!12041 Bool) (index!47310 (_ BitVec 32)) (x!128943 (_ BitVec 32))) (Undefined!11229) (MissingVacant!11229 (index!47311 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97265 (_ BitVec 32)) SeekEntryResult!11229)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425505 (= res!960936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46950 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46950 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97266 (store (arr!46950 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47500 a!2831)) mask!2608) (Intermediate!11229 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425506 () Bool)

(declare-fun res!960940 () Bool)

(assert (=> b!1425506 (=> (not res!960940) (not e!805372))))

(assert (=> b!1425506 (= res!960940 (and (= (size!47500 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47500 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47500 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425507 () Bool)

(assert (=> b!1425507 (= e!805372 false)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!627822 () SeekEntryResult!11229)

(assert (=> b!1425507 (= lt!627822 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46950 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425508 () Bool)

(declare-fun res!960942 () Bool)

(assert (=> b!1425508 (=> (not res!960942) (not e!805372))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425508 (= res!960942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46950 a!2831) j!81) mask!2608) (select (arr!46950 a!2831) j!81) a!2831 mask!2608) (Intermediate!11229 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425509 () Bool)

(declare-fun res!960943 () Bool)

(assert (=> b!1425509 (=> (not res!960943) (not e!805372))))

(assert (=> b!1425509 (= res!960943 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47500 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47500 a!2831))))))

(declare-fun res!960937 () Bool)

(assert (=> start!122900 (=> (not res!960937) (not e!805372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122900 (= res!960937 (validMask!0 mask!2608))))

(assert (=> start!122900 e!805372))

(assert (=> start!122900 true))

(declare-fun array_inv!35978 (array!97265) Bool)

(assert (=> start!122900 (array_inv!35978 a!2831)))

(declare-fun b!1425510 () Bool)

(declare-fun res!960938 () Bool)

(assert (=> b!1425510 (=> (not res!960938) (not e!805372))))

(assert (=> b!1425510 (= res!960938 (validKeyInArray!0 (select (arr!46950 a!2831) j!81)))))

(assert (= (and start!122900 res!960937) b!1425506))

(assert (= (and b!1425506 res!960940) b!1425503))

(assert (= (and b!1425503 res!960939) b!1425510))

(assert (= (and b!1425510 res!960938) b!1425502))

(assert (= (and b!1425502 res!960941) b!1425504))

(assert (= (and b!1425504 res!960935) b!1425509))

(assert (= (and b!1425509 res!960943) b!1425508))

(assert (= (and b!1425508 res!960942) b!1425505))

(assert (= (and b!1425505 res!960936) b!1425507))

(declare-fun m!1316085 () Bool)

(assert (=> b!1425510 m!1316085))

(assert (=> b!1425510 m!1316085))

(declare-fun m!1316087 () Bool)

(assert (=> b!1425510 m!1316087))

(assert (=> b!1425507 m!1316085))

(assert (=> b!1425507 m!1316085))

(declare-fun m!1316089 () Bool)

(assert (=> b!1425507 m!1316089))

(declare-fun m!1316091 () Bool)

(assert (=> b!1425502 m!1316091))

(declare-fun m!1316093 () Bool)

(assert (=> start!122900 m!1316093))

(declare-fun m!1316095 () Bool)

(assert (=> start!122900 m!1316095))

(declare-fun m!1316097 () Bool)

(assert (=> b!1425503 m!1316097))

(assert (=> b!1425503 m!1316097))

(declare-fun m!1316099 () Bool)

(assert (=> b!1425503 m!1316099))

(assert (=> b!1425508 m!1316085))

(assert (=> b!1425508 m!1316085))

(declare-fun m!1316101 () Bool)

(assert (=> b!1425508 m!1316101))

(assert (=> b!1425508 m!1316101))

(assert (=> b!1425508 m!1316085))

(declare-fun m!1316103 () Bool)

(assert (=> b!1425508 m!1316103))

(declare-fun m!1316105 () Bool)

(assert (=> b!1425505 m!1316105))

(declare-fun m!1316107 () Bool)

(assert (=> b!1425505 m!1316107))

(assert (=> b!1425505 m!1316107))

(declare-fun m!1316109 () Bool)

(assert (=> b!1425505 m!1316109))

(assert (=> b!1425505 m!1316109))

(assert (=> b!1425505 m!1316107))

(declare-fun m!1316111 () Bool)

(assert (=> b!1425505 m!1316111))

(declare-fun m!1316113 () Bool)

(assert (=> b!1425504 m!1316113))

(check-sat (not b!1425507) (not b!1425505) (not b!1425504) (not start!122900) (not b!1425508) (not b!1425510) (not b!1425502) (not b!1425503))
