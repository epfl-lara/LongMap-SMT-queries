; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122802 () Bool)

(assert start!122802)

(declare-fun b!1421323 () Bool)

(declare-fun res!956072 () Bool)

(declare-fun e!804055 () Bool)

(assert (=> b!1421323 (=> (not res!956072) (not e!804055))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97089 0))(
  ( (array!97090 (arr!46860 (Array (_ BitVec 32) (_ BitVec 64))) (size!47411 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97089)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421323 (= res!956072 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47411 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47411 a!2831))))))

(declare-fun b!1421324 () Bool)

(declare-fun res!956076 () Bool)

(assert (=> b!1421324 (=> (not res!956076) (not e!804055))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421324 (= res!956076 (validKeyInArray!0 (select (arr!46860 a!2831) j!81)))))

(declare-fun b!1421325 () Bool)

(assert (=> b!1421325 (= e!804055 false)))

(declare-datatypes ((SeekEntryResult!11047 0))(
  ( (MissingZero!11047 (index!46580 (_ BitVec 32))) (Found!11047 (index!46581 (_ BitVec 32))) (Intermediate!11047 (undefined!11859 Bool) (index!46582 (_ BitVec 32)) (x!128396 (_ BitVec 32))) (Undefined!11047) (MissingVacant!11047 (index!46583 (_ BitVec 32))) )
))
(declare-fun lt!626288 () SeekEntryResult!11047)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97089 (_ BitVec 32)) SeekEntryResult!11047)

(assert (=> b!1421325 (= lt!626288 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46860 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1421326 () Bool)

(declare-fun res!956080 () Bool)

(assert (=> b!1421326 (=> (not res!956080) (not e!804055))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421326 (= res!956080 (and (= (size!47411 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47411 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47411 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!956075 () Bool)

(assert (=> start!122802 (=> (not res!956075) (not e!804055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122802 (= res!956075 (validMask!0 mask!2608))))

(assert (=> start!122802 e!804055))

(assert (=> start!122802 true))

(declare-fun array_inv!36141 (array!97089) Bool)

(assert (=> start!122802 (array_inv!36141 a!2831)))

(declare-fun b!1421327 () Bool)

(declare-fun res!956079 () Bool)

(assert (=> b!1421327 (=> (not res!956079) (not e!804055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421327 (= res!956079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46860 a!2831) j!81) mask!2608) (select (arr!46860 a!2831) j!81) a!2831 mask!2608) (Intermediate!11047 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1421328 () Bool)

(declare-fun res!956074 () Bool)

(assert (=> b!1421328 (=> (not res!956074) (not e!804055))))

(declare-datatypes ((List!33357 0))(
  ( (Nil!33354) (Cons!33353 (h!34663 (_ BitVec 64)) (t!48043 List!33357)) )
))
(declare-fun arrayNoDuplicates!0 (array!97089 (_ BitVec 32) List!33357) Bool)

(assert (=> b!1421328 (= res!956074 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33354))))

(declare-fun b!1421329 () Bool)

(declare-fun res!956078 () Bool)

(assert (=> b!1421329 (=> (not res!956078) (not e!804055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97089 (_ BitVec 32)) Bool)

(assert (=> b!1421329 (= res!956078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421330 () Bool)

(declare-fun res!956073 () Bool)

(assert (=> b!1421330 (=> (not res!956073) (not e!804055))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1421330 (= res!956073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46860 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46860 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97090 (store (arr!46860 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47411 a!2831)) mask!2608) (Intermediate!11047 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1421331 () Bool)

(declare-fun res!956077 () Bool)

(assert (=> b!1421331 (=> (not res!956077) (not e!804055))))

(assert (=> b!1421331 (= res!956077 (validKeyInArray!0 (select (arr!46860 a!2831) i!982)))))

(assert (= (and start!122802 res!956075) b!1421326))

(assert (= (and b!1421326 res!956080) b!1421331))

(assert (= (and b!1421331 res!956077) b!1421324))

(assert (= (and b!1421324 res!956076) b!1421329))

(assert (= (and b!1421329 res!956078) b!1421328))

(assert (= (and b!1421328 res!956074) b!1421323))

(assert (= (and b!1421323 res!956072) b!1421327))

(assert (= (and b!1421327 res!956079) b!1421330))

(assert (= (and b!1421330 res!956073) b!1421325))

(declare-fun m!1312053 () Bool)

(assert (=> b!1421328 m!1312053))

(declare-fun m!1312055 () Bool)

(assert (=> b!1421325 m!1312055))

(assert (=> b!1421325 m!1312055))

(declare-fun m!1312057 () Bool)

(assert (=> b!1421325 m!1312057))

(declare-fun m!1312059 () Bool)

(assert (=> start!122802 m!1312059))

(declare-fun m!1312061 () Bool)

(assert (=> start!122802 m!1312061))

(declare-fun m!1312063 () Bool)

(assert (=> b!1421331 m!1312063))

(assert (=> b!1421331 m!1312063))

(declare-fun m!1312065 () Bool)

(assert (=> b!1421331 m!1312065))

(assert (=> b!1421327 m!1312055))

(assert (=> b!1421327 m!1312055))

(declare-fun m!1312067 () Bool)

(assert (=> b!1421327 m!1312067))

(assert (=> b!1421327 m!1312067))

(assert (=> b!1421327 m!1312055))

(declare-fun m!1312069 () Bool)

(assert (=> b!1421327 m!1312069))

(assert (=> b!1421324 m!1312055))

(assert (=> b!1421324 m!1312055))

(declare-fun m!1312071 () Bool)

(assert (=> b!1421324 m!1312071))

(declare-fun m!1312073 () Bool)

(assert (=> b!1421330 m!1312073))

(declare-fun m!1312075 () Bool)

(assert (=> b!1421330 m!1312075))

(assert (=> b!1421330 m!1312075))

(declare-fun m!1312077 () Bool)

(assert (=> b!1421330 m!1312077))

(assert (=> b!1421330 m!1312077))

(assert (=> b!1421330 m!1312075))

(declare-fun m!1312079 () Bool)

(assert (=> b!1421330 m!1312079))

(declare-fun m!1312081 () Bool)

(assert (=> b!1421329 m!1312081))

(push 1)

(assert (not b!1421330))

(assert (not b!1421329))

(assert (not b!1421324))

(assert (not b!1421328))

(assert (not b!1421325))

(assert (not start!122802))

(assert (not b!1421327))

(assert (not b!1421331))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

