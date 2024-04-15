; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122936 () Bool)

(assert start!122936)

(declare-fun b!1426026 () Bool)

(declare-fun e!805549 () Bool)

(declare-fun e!805550 () Bool)

(assert (=> b!1426026 (= e!805549 e!805550)))

(declare-fun res!961515 () Bool)

(assert (=> b!1426026 (=> (not res!961515) (not e!805550))))

(declare-datatypes ((array!97254 0))(
  ( (array!97255 (arr!46945 (Array (_ BitVec 32) (_ BitVec 64))) (size!47497 (_ BitVec 32))) )
))
(declare-fun lt!627834 () array!97254)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!627833 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11251 0))(
  ( (MissingZero!11251 (index!47396 (_ BitVec 32))) (Found!11251 (index!47397 (_ BitVec 32))) (Intermediate!11251 (undefined!12063 Bool) (index!47398 (_ BitVec 32)) (x!129018 (_ BitVec 32))) (Undefined!11251) (MissingVacant!11251 (index!47399 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97254 (_ BitVec 32)) SeekEntryResult!11251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426026 (= res!961515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627833 mask!2608) lt!627833 lt!627834 mask!2608) (Intermediate!11251 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97254)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426026 (= lt!627833 (select (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426026 (= lt!627834 (array!97255 (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47497 a!2831)))))

(declare-fun b!1426027 () Bool)

(declare-fun e!805547 () Bool)

(assert (=> b!1426027 (= e!805547 e!805549)))

(declare-fun res!961518 () Bool)

(assert (=> b!1426027 (=> (not res!961518) (not e!805549))))

(declare-fun lt!627836 () SeekEntryResult!11251)

(assert (=> b!1426027 (= res!961518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46945 a!2831) j!81) mask!2608) (select (arr!46945 a!2831) j!81) a!2831 mask!2608) lt!627836))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426027 (= lt!627836 (Intermediate!11251 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426028 () Bool)

(declare-fun res!961516 () Bool)

(assert (=> b!1426028 (=> (not res!961516) (not e!805547))))

(declare-datatypes ((List!33533 0))(
  ( (Nil!33530) (Cons!33529 (h!34831 (_ BitVec 64)) (t!48219 List!33533)) )
))
(declare-fun arrayNoDuplicates!0 (array!97254 (_ BitVec 32) List!33533) Bool)

(assert (=> b!1426028 (= res!961516 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33530))))

(declare-fun b!1426029 () Bool)

(declare-fun res!961510 () Bool)

(assert (=> b!1426029 (=> (not res!961510) (not e!805547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97254 (_ BitVec 32)) Bool)

(assert (=> b!1426029 (= res!961510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426030 () Bool)

(assert (=> b!1426030 (= e!805550 false)))

(declare-fun lt!627835 () SeekEntryResult!11251)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426030 (= lt!627835 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627833 lt!627834 mask!2608))))

(declare-fun b!1426031 () Bool)

(declare-fun res!961514 () Bool)

(assert (=> b!1426031 (=> (not res!961514) (not e!805547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426031 (= res!961514 (validKeyInArray!0 (select (arr!46945 a!2831) i!982)))))

(declare-fun res!961512 () Bool)

(assert (=> start!122936 (=> (not res!961512) (not e!805547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122936 (= res!961512 (validMask!0 mask!2608))))

(assert (=> start!122936 e!805547))

(assert (=> start!122936 true))

(declare-fun array_inv!36178 (array!97254) Bool)

(assert (=> start!122936 (array_inv!36178 a!2831)))

(declare-fun b!1426032 () Bool)

(declare-fun res!961519 () Bool)

(assert (=> b!1426032 (=> (not res!961519) (not e!805547))))

(assert (=> b!1426032 (= res!961519 (validKeyInArray!0 (select (arr!46945 a!2831) j!81)))))

(declare-fun b!1426033 () Bool)

(declare-fun res!961511 () Bool)

(assert (=> b!1426033 (=> (not res!961511) (not e!805547))))

(assert (=> b!1426033 (= res!961511 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47497 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47497 a!2831))))))

(declare-fun b!1426034 () Bool)

(declare-fun res!961513 () Bool)

(assert (=> b!1426034 (=> (not res!961513) (not e!805550))))

(assert (=> b!1426034 (= res!961513 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46945 a!2831) j!81) a!2831 mask!2608) lt!627836))))

(declare-fun b!1426035 () Bool)

(declare-fun res!961517 () Bool)

(assert (=> b!1426035 (=> (not res!961517) (not e!805547))))

(assert (=> b!1426035 (= res!961517 (and (= (size!47497 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47497 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47497 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122936 res!961512) b!1426035))

(assert (= (and b!1426035 res!961517) b!1426031))

(assert (= (and b!1426031 res!961514) b!1426032))

(assert (= (and b!1426032 res!961519) b!1426029))

(assert (= (and b!1426029 res!961510) b!1426028))

(assert (= (and b!1426028 res!961516) b!1426033))

(assert (= (and b!1426033 res!961511) b!1426027))

(assert (= (and b!1426027 res!961518) b!1426026))

(assert (= (and b!1426026 res!961515) b!1426034))

(assert (= (and b!1426034 res!961513) b!1426030))

(declare-fun m!1316163 () Bool)

(assert (=> b!1426029 m!1316163))

(declare-fun m!1316165 () Bool)

(assert (=> b!1426031 m!1316165))

(assert (=> b!1426031 m!1316165))

(declare-fun m!1316167 () Bool)

(assert (=> b!1426031 m!1316167))

(declare-fun m!1316169 () Bool)

(assert (=> start!122936 m!1316169))

(declare-fun m!1316171 () Bool)

(assert (=> start!122936 m!1316171))

(declare-fun m!1316173 () Bool)

(assert (=> b!1426034 m!1316173))

(assert (=> b!1426034 m!1316173))

(declare-fun m!1316175 () Bool)

(assert (=> b!1426034 m!1316175))

(declare-fun m!1316177 () Bool)

(assert (=> b!1426026 m!1316177))

(assert (=> b!1426026 m!1316177))

(declare-fun m!1316179 () Bool)

(assert (=> b!1426026 m!1316179))

(declare-fun m!1316181 () Bool)

(assert (=> b!1426026 m!1316181))

(declare-fun m!1316183 () Bool)

(assert (=> b!1426026 m!1316183))

(assert (=> b!1426032 m!1316173))

(assert (=> b!1426032 m!1316173))

(declare-fun m!1316185 () Bool)

(assert (=> b!1426032 m!1316185))

(declare-fun m!1316187 () Bool)

(assert (=> b!1426028 m!1316187))

(declare-fun m!1316189 () Bool)

(assert (=> b!1426030 m!1316189))

(assert (=> b!1426027 m!1316173))

(assert (=> b!1426027 m!1316173))

(declare-fun m!1316191 () Bool)

(assert (=> b!1426027 m!1316191))

(assert (=> b!1426027 m!1316191))

(assert (=> b!1426027 m!1316173))

(declare-fun m!1316193 () Bool)

(assert (=> b!1426027 m!1316193))

(check-sat (not b!1426034) (not b!1426030) (not b!1426028) (not b!1426029) (not b!1426031) (not start!122936) (not b!1426026) (not b!1426032) (not b!1426027))
(check-sat)
