; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122516 () Bool)

(assert start!122516)

(declare-fun b!1419256 () Bool)

(declare-fun res!954249 () Bool)

(declare-fun e!803296 () Bool)

(assert (=> b!1419256 (=> (not res!954249) (not e!803296))))

(declare-datatypes ((array!96941 0))(
  ( (array!96942 (arr!46792 (Array (_ BitVec 32) (_ BitVec 64))) (size!47343 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96941)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96941 (_ BitVec 32)) Bool)

(assert (=> b!1419256 (= res!954249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419257 () Bool)

(declare-fun res!954250 () Bool)

(assert (=> b!1419257 (=> (not res!954250) (not e!803296))))

(declare-datatypes ((List!33289 0))(
  ( (Nil!33286) (Cons!33285 (h!34586 (_ BitVec 64)) (t!47975 List!33289)) )
))
(declare-fun arrayNoDuplicates!0 (array!96941 (_ BitVec 32) List!33289) Bool)

(assert (=> b!1419257 (= res!954250 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33286))))

(declare-fun b!1419258 () Bool)

(declare-fun res!954251 () Bool)

(assert (=> b!1419258 (=> (not res!954251) (not e!803296))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419258 (= res!954251 (and (= (size!47343 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47343 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47343 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419259 () Bool)

(declare-fun res!954252 () Bool)

(assert (=> b!1419259 (=> (not res!954252) (not e!803296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419259 (= res!954252 (validKeyInArray!0 (select (arr!46792 a!2831) i!982)))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1419260 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419260 (= e!803296 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47343 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47343 a!2831)) (bvslt mask!2608 #b00000000000000000000000000000000)))))

(declare-fun b!1419261 () Bool)

(declare-fun res!954248 () Bool)

(assert (=> b!1419261 (=> (not res!954248) (not e!803296))))

(assert (=> b!1419261 (= res!954248 (validKeyInArray!0 (select (arr!46792 a!2831) j!81)))))

(declare-fun res!954253 () Bool)

(assert (=> start!122516 (=> (not res!954253) (not e!803296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122516 (= res!954253 (validMask!0 mask!2608))))

(assert (=> start!122516 e!803296))

(assert (=> start!122516 true))

(declare-fun array_inv!36073 (array!96941) Bool)

(assert (=> start!122516 (array_inv!36073 a!2831)))

(assert (= (and start!122516 res!954253) b!1419258))

(assert (= (and b!1419258 res!954251) b!1419259))

(assert (= (and b!1419259 res!954252) b!1419261))

(assert (= (and b!1419261 res!954248) b!1419256))

(assert (= (and b!1419256 res!954249) b!1419257))

(assert (= (and b!1419257 res!954250) b!1419260))

(declare-fun m!1310239 () Bool)

(assert (=> b!1419256 m!1310239))

(declare-fun m!1310241 () Bool)

(assert (=> b!1419261 m!1310241))

(assert (=> b!1419261 m!1310241))

(declare-fun m!1310243 () Bool)

(assert (=> b!1419261 m!1310243))

(declare-fun m!1310245 () Bool)

(assert (=> b!1419257 m!1310245))

(declare-fun m!1310247 () Bool)

(assert (=> start!122516 m!1310247))

(declare-fun m!1310249 () Bool)

(assert (=> start!122516 m!1310249))

(declare-fun m!1310251 () Bool)

(assert (=> b!1419259 m!1310251))

(assert (=> b!1419259 m!1310251))

(declare-fun m!1310253 () Bool)

(assert (=> b!1419259 m!1310253))

(check-sat (not b!1419261) (not start!122516) (not b!1419257) (not b!1419259) (not b!1419256))
(check-sat)
