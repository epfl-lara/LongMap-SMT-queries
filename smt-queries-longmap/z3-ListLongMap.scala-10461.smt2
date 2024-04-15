; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122924 () Bool)

(assert start!122924)

(declare-fun b!1425830 () Bool)

(declare-fun res!961320 () Bool)

(declare-fun e!805478 () Bool)

(assert (=> b!1425830 (=> (not res!961320) (not e!805478))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97242 0))(
  ( (array!97243 (arr!46939 (Array (_ BitVec 32) (_ BitVec 64))) (size!47491 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97242)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425830 (= res!961320 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47491 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47491 a!2831))))))

(declare-fun b!1425831 () Bool)

(declare-fun res!961322 () Bool)

(declare-fun e!805477 () Bool)

(assert (=> b!1425831 (=> (not res!961322) (not e!805477))))

(declare-fun lt!627761 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11245 0))(
  ( (MissingZero!11245 (index!47372 (_ BitVec 32))) (Found!11245 (index!47373 (_ BitVec 32))) (Intermediate!11245 (undefined!12057 Bool) (index!47374 (_ BitVec 32)) (x!128996 (_ BitVec 32))) (Undefined!11245) (MissingVacant!11245 (index!47375 (_ BitVec 32))) )
))
(declare-fun lt!627763 () SeekEntryResult!11245)

(declare-fun lt!627764 () array!97242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97242 (_ BitVec 32)) SeekEntryResult!11245)

(assert (=> b!1425831 (= res!961322 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627761 lt!627764 mask!2608) lt!627763))))

(declare-fun b!1425832 () Bool)

(declare-fun res!961319 () Bool)

(assert (=> b!1425832 (=> (not res!961319) (not e!805478))))

(declare-datatypes ((List!33527 0))(
  ( (Nil!33524) (Cons!33523 (h!34825 (_ BitVec 64)) (t!48213 List!33527)) )
))
(declare-fun arrayNoDuplicates!0 (array!97242 (_ BitVec 32) List!33527) Bool)

(assert (=> b!1425832 (= res!961319 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33524))))

(declare-fun b!1425833 () Bool)

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425833 (= e!805477 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsgt #b00000000000000000000000000000000 (size!47491 a!2831))))))

(declare-fun b!1425834 () Bool)

(declare-fun res!961317 () Bool)

(assert (=> b!1425834 (=> (not res!961317) (not e!805478))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425834 (= res!961317 (validKeyInArray!0 (select (arr!46939 a!2831) j!81)))))

(declare-fun b!1425835 () Bool)

(declare-fun res!961314 () Bool)

(assert (=> b!1425835 (=> (not res!961314) (not e!805478))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425835 (= res!961314 (validKeyInArray!0 (select (arr!46939 a!2831) i!982)))))

(declare-fun b!1425837 () Bool)

(declare-fun res!961316 () Bool)

(assert (=> b!1425837 (=> (not res!961316) (not e!805477))))

(declare-fun lt!627762 () SeekEntryResult!11245)

(assert (=> b!1425837 (= res!961316 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46939 a!2831) j!81) a!2831 mask!2608) lt!627762))))

(declare-fun b!1425838 () Bool)

(declare-fun res!961318 () Bool)

(assert (=> b!1425838 (=> (not res!961318) (not e!805478))))

(assert (=> b!1425838 (= res!961318 (and (= (size!47491 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47491 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47491 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425839 () Bool)

(declare-fun e!805476 () Bool)

(assert (=> b!1425839 (= e!805476 e!805477)))

(declare-fun res!961315 () Bool)

(assert (=> b!1425839 (=> (not res!961315) (not e!805477))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425839 (= res!961315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627761 mask!2608) lt!627761 lt!627764 mask!2608) lt!627763))))

(assert (=> b!1425839 (= lt!627763 (Intermediate!11245 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425839 (= lt!627761 (select (store (arr!46939 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425839 (= lt!627764 (array!97243 (store (arr!46939 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47491 a!2831)))))

(declare-fun b!1425840 () Bool)

(declare-fun res!961321 () Bool)

(assert (=> b!1425840 (=> (not res!961321) (not e!805478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97242 (_ BitVec 32)) Bool)

(assert (=> b!1425840 (= res!961321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425836 () Bool)

(assert (=> b!1425836 (= e!805478 e!805476)))

(declare-fun res!961323 () Bool)

(assert (=> b!1425836 (=> (not res!961323) (not e!805476))))

(assert (=> b!1425836 (= res!961323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46939 a!2831) j!81) mask!2608) (select (arr!46939 a!2831) j!81) a!2831 mask!2608) lt!627762))))

(assert (=> b!1425836 (= lt!627762 (Intermediate!11245 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!961324 () Bool)

(assert (=> start!122924 (=> (not res!961324) (not e!805478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122924 (= res!961324 (validMask!0 mask!2608))))

(assert (=> start!122924 e!805478))

(assert (=> start!122924 true))

(declare-fun array_inv!36172 (array!97242) Bool)

(assert (=> start!122924 (array_inv!36172 a!2831)))

(assert (= (and start!122924 res!961324) b!1425838))

(assert (= (and b!1425838 res!961318) b!1425835))

(assert (= (and b!1425835 res!961314) b!1425834))

(assert (= (and b!1425834 res!961317) b!1425840))

(assert (= (and b!1425840 res!961321) b!1425832))

(assert (= (and b!1425832 res!961319) b!1425830))

(assert (= (and b!1425830 res!961320) b!1425836))

(assert (= (and b!1425836 res!961323) b!1425839))

(assert (= (and b!1425839 res!961315) b!1425837))

(assert (= (and b!1425837 res!961316) b!1425831))

(assert (= (and b!1425831 res!961322) b!1425833))

(declare-fun m!1315971 () Bool)

(assert (=> b!1425834 m!1315971))

(assert (=> b!1425834 m!1315971))

(declare-fun m!1315973 () Bool)

(assert (=> b!1425834 m!1315973))

(declare-fun m!1315975 () Bool)

(assert (=> start!122924 m!1315975))

(declare-fun m!1315977 () Bool)

(assert (=> start!122924 m!1315977))

(declare-fun m!1315979 () Bool)

(assert (=> b!1425839 m!1315979))

(assert (=> b!1425839 m!1315979))

(declare-fun m!1315981 () Bool)

(assert (=> b!1425839 m!1315981))

(declare-fun m!1315983 () Bool)

(assert (=> b!1425839 m!1315983))

(declare-fun m!1315985 () Bool)

(assert (=> b!1425839 m!1315985))

(declare-fun m!1315987 () Bool)

(assert (=> b!1425835 m!1315987))

(assert (=> b!1425835 m!1315987))

(declare-fun m!1315989 () Bool)

(assert (=> b!1425835 m!1315989))

(assert (=> b!1425836 m!1315971))

(assert (=> b!1425836 m!1315971))

(declare-fun m!1315991 () Bool)

(assert (=> b!1425836 m!1315991))

(assert (=> b!1425836 m!1315991))

(assert (=> b!1425836 m!1315971))

(declare-fun m!1315993 () Bool)

(assert (=> b!1425836 m!1315993))

(declare-fun m!1315995 () Bool)

(assert (=> b!1425831 m!1315995))

(declare-fun m!1315997 () Bool)

(assert (=> b!1425840 m!1315997))

(declare-fun m!1315999 () Bool)

(assert (=> b!1425832 m!1315999))

(assert (=> b!1425837 m!1315971))

(assert (=> b!1425837 m!1315971))

(declare-fun m!1316001 () Bool)

(assert (=> b!1425837 m!1316001))

(check-sat (not b!1425831) (not start!122924) (not b!1425837) (not b!1425834) (not b!1425840) (not b!1425832) (not b!1425839) (not b!1425835) (not b!1425836))
(check-sat)
