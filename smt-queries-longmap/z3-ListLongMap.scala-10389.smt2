; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122372 () Bool)

(assert start!122372)

(declare-fun b!1418289 () Bool)

(declare-fun e!802636 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418289 (= e!802636 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625382 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96801 0))(
  ( (array!96802 (arr!46723 (Array (_ BitVec 32) (_ BitVec 64))) (size!47275 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418289 (= lt!625382 (toIndex!0 (select (arr!46723 a!2831) j!81) mask!2608))))

(declare-fun b!1418290 () Bool)

(declare-fun res!953980 () Bool)

(assert (=> b!1418290 (=> (not res!953980) (not e!802636))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418290 (= res!953980 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47275 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47275 a!2831))))))

(declare-fun res!953982 () Bool)

(assert (=> start!122372 (=> (not res!953982) (not e!802636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122372 (= res!953982 (validMask!0 mask!2608))))

(assert (=> start!122372 e!802636))

(assert (=> start!122372 true))

(declare-fun array_inv!35956 (array!96801) Bool)

(assert (=> start!122372 (array_inv!35956 a!2831)))

(declare-fun b!1418291 () Bool)

(declare-fun res!953986 () Bool)

(assert (=> b!1418291 (=> (not res!953986) (not e!802636))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418291 (= res!953986 (validKeyInArray!0 (select (arr!46723 a!2831) i!982)))))

(declare-fun b!1418292 () Bool)

(declare-fun res!953981 () Bool)

(assert (=> b!1418292 (=> (not res!953981) (not e!802636))))

(declare-datatypes ((List!33311 0))(
  ( (Nil!33308) (Cons!33307 (h!34600 (_ BitVec 64)) (t!47997 List!33311)) )
))
(declare-fun arrayNoDuplicates!0 (array!96801 (_ BitVec 32) List!33311) Bool)

(assert (=> b!1418292 (= res!953981 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33308))))

(declare-fun b!1418293 () Bool)

(declare-fun res!953983 () Bool)

(assert (=> b!1418293 (=> (not res!953983) (not e!802636))))

(assert (=> b!1418293 (= res!953983 (validKeyInArray!0 (select (arr!46723 a!2831) j!81)))))

(declare-fun b!1418294 () Bool)

(declare-fun res!953984 () Bool)

(assert (=> b!1418294 (=> (not res!953984) (not e!802636))))

(assert (=> b!1418294 (= res!953984 (and (= (size!47275 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47275 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47275 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418295 () Bool)

(declare-fun res!953985 () Bool)

(assert (=> b!1418295 (=> (not res!953985) (not e!802636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96801 (_ BitVec 32)) Bool)

(assert (=> b!1418295 (= res!953985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122372 res!953982) b!1418294))

(assert (= (and b!1418294 res!953984) b!1418291))

(assert (= (and b!1418291 res!953986) b!1418293))

(assert (= (and b!1418293 res!953983) b!1418295))

(assert (= (and b!1418295 res!953985) b!1418292))

(assert (= (and b!1418292 res!953981) b!1418290))

(assert (= (and b!1418290 res!953980) b!1418289))

(declare-fun m!1308521 () Bool)

(assert (=> b!1418289 m!1308521))

(assert (=> b!1418289 m!1308521))

(declare-fun m!1308523 () Bool)

(assert (=> b!1418289 m!1308523))

(declare-fun m!1308525 () Bool)

(assert (=> b!1418292 m!1308525))

(declare-fun m!1308527 () Bool)

(assert (=> b!1418295 m!1308527))

(assert (=> b!1418293 m!1308521))

(assert (=> b!1418293 m!1308521))

(declare-fun m!1308529 () Bool)

(assert (=> b!1418293 m!1308529))

(declare-fun m!1308531 () Bool)

(assert (=> start!122372 m!1308531))

(declare-fun m!1308533 () Bool)

(assert (=> start!122372 m!1308533))

(declare-fun m!1308535 () Bool)

(assert (=> b!1418291 m!1308535))

(assert (=> b!1418291 m!1308535))

(declare-fun m!1308537 () Bool)

(assert (=> b!1418291 m!1308537))

(check-sat (not b!1418292) (not start!122372) (not b!1418293) (not b!1418295) (not b!1418289) (not b!1418291))
(check-sat)
