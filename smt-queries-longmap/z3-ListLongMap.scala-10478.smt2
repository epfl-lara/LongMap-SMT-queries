; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123248 () Bool)

(assert start!123248)

(declare-fun b!1429098 () Bool)

(declare-fun res!963727 () Bool)

(declare-fun e!807008 () Bool)

(assert (=> b!1429098 (=> (not res!963727) (not e!807008))))

(declare-datatypes ((array!97409 0))(
  ( (array!97410 (arr!47016 (Array (_ BitVec 32) (_ BitVec 64))) (size!47566 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97409)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97409 (_ BitVec 32)) Bool)

(assert (=> b!1429098 (= res!963727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429099 () Bool)

(declare-fun res!963728 () Bool)

(declare-fun e!807007 () Bool)

(assert (=> b!1429099 (=> (not res!963728) (not e!807007))))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11295 0))(
  ( (MissingZero!11295 (index!47572 (_ BitVec 32))) (Found!11295 (index!47573 (_ BitVec 32))) (Intermediate!11295 (undefined!12107 Bool) (index!47574 (_ BitVec 32)) (x!129209 (_ BitVec 32))) (Undefined!11295) (MissingVacant!11295 (index!47575 (_ BitVec 32))) )
))
(declare-fun lt!629235 () SeekEntryResult!11295)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97409 (_ BitVec 32)) SeekEntryResult!11295)

(assert (=> b!1429099 (= res!963728 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47016 a!2831) j!81) a!2831 mask!2608) lt!629235))))

(declare-fun b!1429100 () Bool)

(declare-fun res!963730 () Bool)

(assert (=> b!1429100 (=> (not res!963730) (not e!807008))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429100 (= res!963730 (and (= (size!47566 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47566 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47566 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429101 () Bool)

(declare-fun res!963732 () Bool)

(assert (=> b!1429101 (=> (not res!963732) (not e!807008))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429101 (= res!963732 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47566 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47566 a!2831))))))

(declare-fun b!1429102 () Bool)

(declare-fun e!807011 () Bool)

(assert (=> b!1429102 (= e!807008 e!807011)))

(declare-fun res!963736 () Bool)

(assert (=> b!1429102 (=> (not res!963736) (not e!807011))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429102 (= res!963736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47016 a!2831) j!81) mask!2608) (select (arr!47016 a!2831) j!81) a!2831 mask!2608) lt!629235))))

(assert (=> b!1429102 (= lt!629235 (Intermediate!11295 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429103 () Bool)

(declare-fun res!963731 () Bool)

(assert (=> b!1429103 (=> (not res!963731) (not e!807008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429103 (= res!963731 (validKeyInArray!0 (select (arr!47016 a!2831) i!982)))))

(declare-fun b!1429104 () Bool)

(declare-fun res!963739 () Bool)

(assert (=> b!1429104 (=> (not res!963739) (not e!807007))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429104 (= res!963739 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun e!807010 () Bool)

(declare-fun b!1429105 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97409 (_ BitVec 32)) SeekEntryResult!11295)

(assert (=> b!1429105 (= e!807010 (= (seekEntryOrOpen!0 (select (arr!47016 a!2831) j!81) a!2831 mask!2608) (Found!11295 j!81)))))

(declare-fun b!1429106 () Bool)

(declare-fun res!963738 () Bool)

(assert (=> b!1429106 (=> (not res!963738) (not e!807008))))

(assert (=> b!1429106 (= res!963738 (validKeyInArray!0 (select (arr!47016 a!2831) j!81)))))

(declare-fun res!963729 () Bool)

(assert (=> start!123248 (=> (not res!963729) (not e!807008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123248 (= res!963729 (validMask!0 mask!2608))))

(assert (=> start!123248 e!807008))

(assert (=> start!123248 true))

(declare-fun array_inv!36044 (array!97409) Bool)

(assert (=> start!123248 (array_inv!36044 a!2831)))

(declare-fun b!1429107 () Bool)

(assert (=> b!1429107 (= e!807011 e!807007)))

(declare-fun res!963737 () Bool)

(assert (=> b!1429107 (=> (not res!963737) (not e!807007))))

(declare-fun lt!629237 () (_ BitVec 64))

(declare-fun lt!629236 () SeekEntryResult!11295)

(declare-fun lt!629238 () array!97409)

(assert (=> b!1429107 (= res!963737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629237 mask!2608) lt!629237 lt!629238 mask!2608) lt!629236))))

(assert (=> b!1429107 (= lt!629236 (Intermediate!11295 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429107 (= lt!629237 (select (store (arr!47016 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429107 (= lt!629238 (array!97410 (store (arr!47016 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47566 a!2831)))))

(declare-fun b!1429108 () Bool)

(declare-fun res!963735 () Bool)

(assert (=> b!1429108 (=> (not res!963735) (not e!807008))))

(declare-datatypes ((List!33526 0))(
  ( (Nil!33523) (Cons!33522 (h!34836 (_ BitVec 64)) (t!48220 List!33526)) )
))
(declare-fun arrayNoDuplicates!0 (array!97409 (_ BitVec 32) List!33526) Bool)

(assert (=> b!1429108 (= res!963735 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33523))))

(declare-fun b!1429109 () Bool)

(declare-fun res!963733 () Bool)

(assert (=> b!1429109 (=> (not res!963733) (not e!807007))))

(assert (=> b!1429109 (= res!963733 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629237 lt!629238 mask!2608) lt!629236))))

(declare-fun b!1429110 () Bool)

(assert (=> b!1429110 (= e!807007 (not true))))

(assert (=> b!1429110 e!807010))

(declare-fun res!963734 () Bool)

(assert (=> b!1429110 (=> (not res!963734) (not e!807010))))

(assert (=> b!1429110 (= res!963734 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48336 0))(
  ( (Unit!48337) )
))
(declare-fun lt!629234 () Unit!48336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48336)

(assert (=> b!1429110 (= lt!629234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123248 res!963729) b!1429100))

(assert (= (and b!1429100 res!963730) b!1429103))

(assert (= (and b!1429103 res!963731) b!1429106))

(assert (= (and b!1429106 res!963738) b!1429098))

(assert (= (and b!1429098 res!963727) b!1429108))

(assert (= (and b!1429108 res!963735) b!1429101))

(assert (= (and b!1429101 res!963732) b!1429102))

(assert (= (and b!1429102 res!963736) b!1429107))

(assert (= (and b!1429107 res!963737) b!1429099))

(assert (= (and b!1429099 res!963728) b!1429109))

(assert (= (and b!1429109 res!963733) b!1429104))

(assert (= (and b!1429104 res!963739) b!1429110))

(assert (= (and b!1429110 res!963734) b!1429105))

(declare-fun m!1319207 () Bool)

(assert (=> b!1429109 m!1319207))

(declare-fun m!1319209 () Bool)

(assert (=> start!123248 m!1319209))

(declare-fun m!1319211 () Bool)

(assert (=> start!123248 m!1319211))

(declare-fun m!1319213 () Bool)

(assert (=> b!1429108 m!1319213))

(declare-fun m!1319215 () Bool)

(assert (=> b!1429110 m!1319215))

(declare-fun m!1319217 () Bool)

(assert (=> b!1429110 m!1319217))

(declare-fun m!1319219 () Bool)

(assert (=> b!1429105 m!1319219))

(assert (=> b!1429105 m!1319219))

(declare-fun m!1319221 () Bool)

(assert (=> b!1429105 m!1319221))

(assert (=> b!1429102 m!1319219))

(assert (=> b!1429102 m!1319219))

(declare-fun m!1319223 () Bool)

(assert (=> b!1429102 m!1319223))

(assert (=> b!1429102 m!1319223))

(assert (=> b!1429102 m!1319219))

(declare-fun m!1319225 () Bool)

(assert (=> b!1429102 m!1319225))

(assert (=> b!1429106 m!1319219))

(assert (=> b!1429106 m!1319219))

(declare-fun m!1319227 () Bool)

(assert (=> b!1429106 m!1319227))

(assert (=> b!1429099 m!1319219))

(assert (=> b!1429099 m!1319219))

(declare-fun m!1319229 () Bool)

(assert (=> b!1429099 m!1319229))

(declare-fun m!1319231 () Bool)

(assert (=> b!1429103 m!1319231))

(assert (=> b!1429103 m!1319231))

(declare-fun m!1319233 () Bool)

(assert (=> b!1429103 m!1319233))

(declare-fun m!1319235 () Bool)

(assert (=> b!1429107 m!1319235))

(assert (=> b!1429107 m!1319235))

(declare-fun m!1319237 () Bool)

(assert (=> b!1429107 m!1319237))

(declare-fun m!1319239 () Bool)

(assert (=> b!1429107 m!1319239))

(declare-fun m!1319241 () Bool)

(assert (=> b!1429107 m!1319241))

(declare-fun m!1319243 () Bool)

(assert (=> b!1429098 m!1319243))

(check-sat (not b!1429106) (not b!1429103) (not b!1429109) (not b!1429099) (not b!1429102) (not b!1429110) (not start!123248) (not b!1429098) (not b!1429105) (not b!1429108) (not b!1429107))
(check-sat)
