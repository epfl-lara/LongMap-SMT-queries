; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122374 () Bool)

(assert start!122374)

(declare-fun b!1418349 () Bool)

(declare-fun res!953992 () Bool)

(declare-fun e!802669 () Bool)

(assert (=> b!1418349 (=> (not res!953992) (not e!802669))))

(declare-datatypes ((array!96850 0))(
  ( (array!96851 (arr!46747 (Array (_ BitVec 32) (_ BitVec 64))) (size!47297 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96850)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418349 (= res!953992 (validKeyInArray!0 (select (arr!46747 a!2831) i!982)))))

(declare-fun b!1418350 () Bool)

(declare-fun res!953994 () Bool)

(assert (=> b!1418350 (=> (not res!953994) (not e!802669))))

(declare-datatypes ((List!33257 0))(
  ( (Nil!33254) (Cons!33253 (h!34546 (_ BitVec 64)) (t!47951 List!33257)) )
))
(declare-fun arrayNoDuplicates!0 (array!96850 (_ BitVec 32) List!33257) Bool)

(assert (=> b!1418350 (= res!953994 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33254))))

(declare-fun b!1418351 () Bool)

(declare-fun res!953991 () Bool)

(assert (=> b!1418351 (=> (not res!953991) (not e!802669))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96850 (_ BitVec 32)) Bool)

(assert (=> b!1418351 (= res!953991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418352 () Bool)

(declare-fun res!953993 () Bool)

(assert (=> b!1418352 (=> (not res!953993) (not e!802669))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418352 (= res!953993 (validKeyInArray!0 (select (arr!46747 a!2831) j!81)))))

(declare-fun b!1418353 () Bool)

(assert (=> b!1418353 (= e!802669 false)))

(declare-fun lt!625569 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418353 (= lt!625569 (toIndex!0 (select (arr!46747 a!2831) j!81) mask!2608))))

(declare-fun res!953989 () Bool)

(assert (=> start!122374 (=> (not res!953989) (not e!802669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122374 (= res!953989 (validMask!0 mask!2608))))

(assert (=> start!122374 e!802669))

(assert (=> start!122374 true))

(declare-fun array_inv!35775 (array!96850) Bool)

(assert (=> start!122374 (array_inv!35775 a!2831)))

(declare-fun b!1418354 () Bool)

(declare-fun res!953995 () Bool)

(assert (=> b!1418354 (=> (not res!953995) (not e!802669))))

(assert (=> b!1418354 (= res!953995 (and (= (size!47297 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47297 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47297 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418355 () Bool)

(declare-fun res!953990 () Bool)

(assert (=> b!1418355 (=> (not res!953990) (not e!802669))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418355 (= res!953990 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47297 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47297 a!2831))))))

(assert (= (and start!122374 res!953989) b!1418354))

(assert (= (and b!1418354 res!953995) b!1418349))

(assert (= (and b!1418349 res!953992) b!1418352))

(assert (= (and b!1418352 res!953993) b!1418351))

(assert (= (and b!1418351 res!953991) b!1418350))

(assert (= (and b!1418350 res!953994) b!1418355))

(assert (= (and b!1418355 res!953990) b!1418353))

(declare-fun m!1309047 () Bool)

(assert (=> b!1418349 m!1309047))

(assert (=> b!1418349 m!1309047))

(declare-fun m!1309049 () Bool)

(assert (=> b!1418349 m!1309049))

(declare-fun m!1309051 () Bool)

(assert (=> b!1418353 m!1309051))

(assert (=> b!1418353 m!1309051))

(declare-fun m!1309053 () Bool)

(assert (=> b!1418353 m!1309053))

(declare-fun m!1309055 () Bool)

(assert (=> b!1418350 m!1309055))

(declare-fun m!1309057 () Bool)

(assert (=> b!1418351 m!1309057))

(declare-fun m!1309059 () Bool)

(assert (=> start!122374 m!1309059))

(declare-fun m!1309061 () Bool)

(assert (=> start!122374 m!1309061))

(assert (=> b!1418352 m!1309051))

(assert (=> b!1418352 m!1309051))

(declare-fun m!1309063 () Bool)

(assert (=> b!1418352 m!1309063))

(push 1)

(assert (not b!1418351))

(assert (not b!1418352))

(assert (not b!1418350))

(assert (not b!1418349))

(assert (not b!1418353))

(assert (not start!122374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

