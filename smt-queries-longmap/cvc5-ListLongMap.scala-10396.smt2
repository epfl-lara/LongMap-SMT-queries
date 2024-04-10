; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122496 () Bool)

(assert start!122496)

(declare-fun b!1419074 () Bool)

(declare-fun res!954597 () Bool)

(declare-fun e!802973 () Bool)

(assert (=> b!1419074 (=> (not res!954597) (not e!802973))))

(declare-datatypes ((array!96900 0))(
  ( (array!96901 (arr!46769 (Array (_ BitVec 32) (_ BitVec 64))) (size!47319 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96900)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96900 (_ BitVec 32)) Bool)

(assert (=> b!1419074 (= res!954597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419076 () Bool)

(declare-fun res!954599 () Bool)

(assert (=> b!1419076 (=> (not res!954599) (not e!802973))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419076 (= res!954599 (and (= (size!47319 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47319 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47319 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419077 () Bool)

(declare-fun res!954596 () Bool)

(assert (=> b!1419077 (=> (not res!954596) (not e!802973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419077 (= res!954596 (validKeyInArray!0 (select (arr!46769 a!2831) i!982)))))

(declare-fun b!1419078 () Bool)

(assert (=> b!1419078 (= e!802973 false)))

(declare-fun lt!625725 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419078 (= lt!625725 (toIndex!0 (select (store (arr!46769 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419079 () Bool)

(declare-fun res!954594 () Bool)

(assert (=> b!1419079 (=> (not res!954594) (not e!802973))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11054 0))(
  ( (MissingZero!11054 (index!46608 (_ BitVec 32))) (Found!11054 (index!46609 (_ BitVec 32))) (Intermediate!11054 (undefined!11866 Bool) (index!46610 (_ BitVec 32)) (x!128282 (_ BitVec 32))) (Undefined!11054) (MissingVacant!11054 (index!46611 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96900 (_ BitVec 32)) SeekEntryResult!11054)

(assert (=> b!1419079 (= res!954594 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46769 a!2831) j!81) mask!2608) (select (arr!46769 a!2831) j!81) a!2831 mask!2608) (Intermediate!11054 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!954598 () Bool)

(assert (=> start!122496 (=> (not res!954598) (not e!802973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122496 (= res!954598 (validMask!0 mask!2608))))

(assert (=> start!122496 e!802973))

(assert (=> start!122496 true))

(declare-fun array_inv!35797 (array!96900) Bool)

(assert (=> start!122496 (array_inv!35797 a!2831)))

(declare-fun b!1419075 () Bool)

(declare-fun res!954600 () Bool)

(assert (=> b!1419075 (=> (not res!954600) (not e!802973))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419075 (= res!954600 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47319 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47319 a!2831))))))

(declare-fun b!1419080 () Bool)

(declare-fun res!954595 () Bool)

(assert (=> b!1419080 (=> (not res!954595) (not e!802973))))

(assert (=> b!1419080 (= res!954595 (validKeyInArray!0 (select (arr!46769 a!2831) j!81)))))

(declare-fun b!1419081 () Bool)

(declare-fun res!954601 () Bool)

(assert (=> b!1419081 (=> (not res!954601) (not e!802973))))

(declare-datatypes ((List!33279 0))(
  ( (Nil!33276) (Cons!33275 (h!34574 (_ BitVec 64)) (t!47973 List!33279)) )
))
(declare-fun arrayNoDuplicates!0 (array!96900 (_ BitVec 32) List!33279) Bool)

(assert (=> b!1419081 (= res!954601 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33276))))

(assert (= (and start!122496 res!954598) b!1419076))

(assert (= (and b!1419076 res!954599) b!1419077))

(assert (= (and b!1419077 res!954596) b!1419080))

(assert (= (and b!1419080 res!954595) b!1419074))

(assert (= (and b!1419074 res!954597) b!1419081))

(assert (= (and b!1419081 res!954601) b!1419075))

(assert (= (and b!1419075 res!954600) b!1419079))

(assert (= (and b!1419079 res!954594) b!1419078))

(declare-fun m!1309575 () Bool)

(assert (=> b!1419079 m!1309575))

(assert (=> b!1419079 m!1309575))

(declare-fun m!1309577 () Bool)

(assert (=> b!1419079 m!1309577))

(assert (=> b!1419079 m!1309577))

(assert (=> b!1419079 m!1309575))

(declare-fun m!1309579 () Bool)

(assert (=> b!1419079 m!1309579))

(declare-fun m!1309581 () Bool)

(assert (=> b!1419081 m!1309581))

(declare-fun m!1309583 () Bool)

(assert (=> b!1419078 m!1309583))

(declare-fun m!1309585 () Bool)

(assert (=> b!1419078 m!1309585))

(assert (=> b!1419078 m!1309585))

(declare-fun m!1309587 () Bool)

(assert (=> b!1419078 m!1309587))

(assert (=> b!1419080 m!1309575))

(assert (=> b!1419080 m!1309575))

(declare-fun m!1309589 () Bool)

(assert (=> b!1419080 m!1309589))

(declare-fun m!1309591 () Bool)

(assert (=> b!1419077 m!1309591))

(assert (=> b!1419077 m!1309591))

(declare-fun m!1309593 () Bool)

(assert (=> b!1419077 m!1309593))

(declare-fun m!1309595 () Bool)

(assert (=> start!122496 m!1309595))

(declare-fun m!1309597 () Bool)

(assert (=> start!122496 m!1309597))

(declare-fun m!1309599 () Bool)

(assert (=> b!1419074 m!1309599))

(push 1)

(assert (not b!1419078))

(assert (not b!1419080))

(assert (not b!1419074))

(assert (not start!122496))

(assert (not b!1419079))

(assert (not b!1419081))

(assert (not b!1419077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

