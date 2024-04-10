; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122902 () Bool)

(assert start!122902)

(declare-fun b!1425529 () Bool)

(declare-fun res!960969 () Bool)

(declare-fun e!805379 () Bool)

(assert (=> b!1425529 (=> (not res!960969) (not e!805379))))

(declare-datatypes ((array!97267 0))(
  ( (array!97268 (arr!46951 (Array (_ BitVec 32) (_ BitVec 64))) (size!47501 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97267)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425529 (= res!960969 (validKeyInArray!0 (select (arr!46951 a!2831) i!982)))))

(declare-fun b!1425530 () Bool)

(declare-fun res!960962 () Bool)

(assert (=> b!1425530 (=> (not res!960962) (not e!805379))))

(declare-datatypes ((List!33461 0))(
  ( (Nil!33458) (Cons!33457 (h!34759 (_ BitVec 64)) (t!48155 List!33461)) )
))
(declare-fun arrayNoDuplicates!0 (array!97267 (_ BitVec 32) List!33461) Bool)

(assert (=> b!1425530 (= res!960962 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33458))))

(declare-fun res!960970 () Bool)

(assert (=> start!122902 (=> (not res!960970) (not e!805379))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122902 (= res!960970 (validMask!0 mask!2608))))

(assert (=> start!122902 e!805379))

(assert (=> start!122902 true))

(declare-fun array_inv!35979 (array!97267) Bool)

(assert (=> start!122902 (array_inv!35979 a!2831)))

(declare-fun b!1425531 () Bool)

(declare-fun res!960964 () Bool)

(assert (=> b!1425531 (=> (not res!960964) (not e!805379))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11230 0))(
  ( (MissingZero!11230 (index!47312 (_ BitVec 32))) (Found!11230 (index!47313 (_ BitVec 32))) (Intermediate!11230 (undefined!12042 Bool) (index!47314 (_ BitVec 32)) (x!128944 (_ BitVec 32))) (Undefined!11230) (MissingVacant!11230 (index!47315 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97267 (_ BitVec 32)) SeekEntryResult!11230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425531 (= res!960964 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608) (Intermediate!11230 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425532 () Bool)

(assert (=> b!1425532 (= e!805379 false)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!627825 () SeekEntryResult!11230)

(assert (=> b!1425532 (= lt!627825 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46951 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425533 () Bool)

(declare-fun res!960963 () Bool)

(assert (=> b!1425533 (=> (not res!960963) (not e!805379))))

(assert (=> b!1425533 (= res!960963 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47501 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47501 a!2831))))))

(declare-fun b!1425534 () Bool)

(declare-fun res!960968 () Bool)

(assert (=> b!1425534 (=> (not res!960968) (not e!805379))))

(assert (=> b!1425534 (= res!960968 (and (= (size!47501 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47501 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47501 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425535 () Bool)

(declare-fun res!960967 () Bool)

(assert (=> b!1425535 (=> (not res!960967) (not e!805379))))

(assert (=> b!1425535 (= res!960967 (validKeyInArray!0 (select (arr!46951 a!2831) j!81)))))

(declare-fun b!1425536 () Bool)

(declare-fun res!960965 () Bool)

(assert (=> b!1425536 (=> (not res!960965) (not e!805379))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425536 (= res!960965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97268 (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47501 a!2831)) mask!2608) (Intermediate!11230 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425537 () Bool)

(declare-fun res!960966 () Bool)

(assert (=> b!1425537 (=> (not res!960966) (not e!805379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97267 (_ BitVec 32)) Bool)

(assert (=> b!1425537 (= res!960966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122902 res!960970) b!1425534))

(assert (= (and b!1425534 res!960968) b!1425529))

(assert (= (and b!1425529 res!960969) b!1425535))

(assert (= (and b!1425535 res!960967) b!1425537))

(assert (= (and b!1425537 res!960966) b!1425530))

(assert (= (and b!1425530 res!960962) b!1425533))

(assert (= (and b!1425533 res!960963) b!1425531))

(assert (= (and b!1425531 res!960964) b!1425536))

(assert (= (and b!1425536 res!960965) b!1425532))

(declare-fun m!1316115 () Bool)

(assert (=> b!1425531 m!1316115))

(assert (=> b!1425531 m!1316115))

(declare-fun m!1316117 () Bool)

(assert (=> b!1425531 m!1316117))

(assert (=> b!1425531 m!1316117))

(assert (=> b!1425531 m!1316115))

(declare-fun m!1316119 () Bool)

(assert (=> b!1425531 m!1316119))

(declare-fun m!1316121 () Bool)

(assert (=> b!1425537 m!1316121))

(declare-fun m!1316123 () Bool)

(assert (=> start!122902 m!1316123))

(declare-fun m!1316125 () Bool)

(assert (=> start!122902 m!1316125))

(declare-fun m!1316127 () Bool)

(assert (=> b!1425530 m!1316127))

(declare-fun m!1316129 () Bool)

(assert (=> b!1425529 m!1316129))

(assert (=> b!1425529 m!1316129))

(declare-fun m!1316131 () Bool)

(assert (=> b!1425529 m!1316131))

(assert (=> b!1425532 m!1316115))

(assert (=> b!1425532 m!1316115))

(declare-fun m!1316133 () Bool)

(assert (=> b!1425532 m!1316133))

(declare-fun m!1316135 () Bool)

(assert (=> b!1425536 m!1316135))

(declare-fun m!1316137 () Bool)

(assert (=> b!1425536 m!1316137))

(assert (=> b!1425536 m!1316137))

(declare-fun m!1316139 () Bool)

(assert (=> b!1425536 m!1316139))

(assert (=> b!1425536 m!1316139))

(assert (=> b!1425536 m!1316137))

(declare-fun m!1316141 () Bool)

(assert (=> b!1425536 m!1316141))

(assert (=> b!1425535 m!1316115))

(assert (=> b!1425535 m!1316115))

(declare-fun m!1316143 () Bool)

(assert (=> b!1425535 m!1316143))

(push 1)

(assert (not b!1425530))

(assert (not b!1425535))

(assert (not b!1425536))

(assert (not start!122902))

(assert (not b!1425529))

(assert (not b!1425532))

(assert (not b!1425531))

(assert (not b!1425537))

(check-sat)

