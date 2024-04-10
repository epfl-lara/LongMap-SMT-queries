; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122566 () Bool)

(assert start!122566)

(declare-fun b!1419572 () Bool)

(declare-fun res!955008 () Bool)

(declare-fun e!803165 () Bool)

(assert (=> b!1419572 (=> (not res!955008) (not e!803165))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96931 0))(
  ( (array!96932 (arr!46783 (Array (_ BitVec 32) (_ BitVec 64))) (size!47333 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96931)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419572 (= res!955008 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47333 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47333 a!2831))))))

(declare-fun b!1419573 () Bool)

(assert (=> b!1419573 (= e!803165 false)))

(declare-fun lt!625836 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419573 (= lt!625836 (toIndex!0 (select (store (arr!46783 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419574 () Bool)

(declare-fun res!955007 () Bool)

(assert (=> b!1419574 (=> (not res!955007) (not e!803165))))

(assert (=> b!1419574 (= res!955007 (and (= (size!47333 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47333 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47333 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419576 () Bool)

(declare-fun res!955010 () Bool)

(assert (=> b!1419576 (=> (not res!955010) (not e!803165))))

(declare-datatypes ((List!33293 0))(
  ( (Nil!33290) (Cons!33289 (h!34591 (_ BitVec 64)) (t!47987 List!33293)) )
))
(declare-fun arrayNoDuplicates!0 (array!96931 (_ BitVec 32) List!33293) Bool)

(assert (=> b!1419576 (= res!955010 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33290))))

(declare-fun b!1419577 () Bool)

(declare-fun res!955012 () Bool)

(assert (=> b!1419577 (=> (not res!955012) (not e!803165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96931 (_ BitVec 32)) Bool)

(assert (=> b!1419577 (= res!955012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419578 () Bool)

(declare-fun res!955009 () Bool)

(assert (=> b!1419578 (=> (not res!955009) (not e!803165))))

(declare-datatypes ((SeekEntryResult!11068 0))(
  ( (MissingZero!11068 (index!46664 (_ BitVec 32))) (Found!11068 (index!46665 (_ BitVec 32))) (Intermediate!11068 (undefined!11880 Bool) (index!46666 (_ BitVec 32)) (x!128334 (_ BitVec 32))) (Undefined!11068) (MissingVacant!11068 (index!46667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96931 (_ BitVec 32)) SeekEntryResult!11068)

(assert (=> b!1419578 (= res!955009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46783 a!2831) j!81) mask!2608) (select (arr!46783 a!2831) j!81) a!2831 mask!2608) (Intermediate!11068 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419579 () Bool)

(declare-fun res!955006 () Bool)

(assert (=> b!1419579 (=> (not res!955006) (not e!803165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419579 (= res!955006 (validKeyInArray!0 (select (arr!46783 a!2831) i!982)))))

(declare-fun b!1419575 () Bool)

(declare-fun res!955011 () Bool)

(assert (=> b!1419575 (=> (not res!955011) (not e!803165))))

(assert (=> b!1419575 (= res!955011 (validKeyInArray!0 (select (arr!46783 a!2831) j!81)))))

(declare-fun res!955005 () Bool)

(assert (=> start!122566 (=> (not res!955005) (not e!803165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122566 (= res!955005 (validMask!0 mask!2608))))

(assert (=> start!122566 e!803165))

(assert (=> start!122566 true))

(declare-fun array_inv!35811 (array!96931) Bool)

(assert (=> start!122566 (array_inv!35811 a!2831)))

(assert (= (and start!122566 res!955005) b!1419574))

(assert (= (and b!1419574 res!955007) b!1419579))

(assert (= (and b!1419579 res!955006) b!1419575))

(assert (= (and b!1419575 res!955011) b!1419577))

(assert (= (and b!1419577 res!955012) b!1419576))

(assert (= (and b!1419576 res!955010) b!1419572))

(assert (= (and b!1419572 res!955008) b!1419578))

(assert (= (and b!1419578 res!955009) b!1419573))

(declare-fun m!1310011 () Bool)

(assert (=> b!1419576 m!1310011))

(declare-fun m!1310013 () Bool)

(assert (=> b!1419577 m!1310013))

(declare-fun m!1310015 () Bool)

(assert (=> b!1419573 m!1310015))

(declare-fun m!1310017 () Bool)

(assert (=> b!1419573 m!1310017))

(assert (=> b!1419573 m!1310017))

(declare-fun m!1310019 () Bool)

(assert (=> b!1419573 m!1310019))

(declare-fun m!1310021 () Bool)

(assert (=> b!1419578 m!1310021))

(assert (=> b!1419578 m!1310021))

(declare-fun m!1310023 () Bool)

(assert (=> b!1419578 m!1310023))

(assert (=> b!1419578 m!1310023))

(assert (=> b!1419578 m!1310021))

(declare-fun m!1310025 () Bool)

(assert (=> b!1419578 m!1310025))

(declare-fun m!1310027 () Bool)

(assert (=> b!1419579 m!1310027))

(assert (=> b!1419579 m!1310027))

(declare-fun m!1310029 () Bool)

(assert (=> b!1419579 m!1310029))

(declare-fun m!1310031 () Bool)

(assert (=> start!122566 m!1310031))

(declare-fun m!1310033 () Bool)

(assert (=> start!122566 m!1310033))

(assert (=> b!1419575 m!1310021))

(assert (=> b!1419575 m!1310021))

(declare-fun m!1310035 () Bool)

(assert (=> b!1419575 m!1310035))

(push 1)

(assert (not start!122566))

(assert (not b!1419577))

(assert (not b!1419578))

(assert (not b!1419573))

(assert (not b!1419576))

(assert (not b!1419579))

(assert (not b!1419575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

