; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122924 () Bool)

(assert start!122924)

(declare-fun b!1425849 () Bool)

(declare-fun res!961286 () Bool)

(declare-fun e!805492 () Bool)

(assert (=> b!1425849 (=> (not res!961286) (not e!805492))))

(declare-datatypes ((array!97289 0))(
  ( (array!97290 (arr!46962 (Array (_ BitVec 32) (_ BitVec 64))) (size!47512 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97289)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97289 (_ BitVec 32)) Bool)

(assert (=> b!1425849 (= res!961286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425850 () Bool)

(declare-fun res!961289 () Bool)

(assert (=> b!1425850 (=> (not res!961289) (not e!805492))))

(declare-datatypes ((List!33472 0))(
  ( (Nil!33469) (Cons!33468 (h!34770 (_ BitVec 64)) (t!48166 List!33472)) )
))
(declare-fun arrayNoDuplicates!0 (array!97289 (_ BitVec 32) List!33472) Bool)

(assert (=> b!1425850 (= res!961289 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33469))))

(declare-fun b!1425851 () Bool)

(declare-fun res!961287 () Bool)

(assert (=> b!1425851 (=> (not res!961287) (not e!805492))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425851 (= res!961287 (and (= (size!47512 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47512 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47512 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425852 () Bool)

(declare-fun res!961288 () Bool)

(assert (=> b!1425852 (=> (not res!961288) (not e!805492))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425852 (= res!961288 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47512 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47512 a!2831))))))

(declare-fun b!1425853 () Bool)

(declare-fun res!961290 () Bool)

(assert (=> b!1425853 (=> (not res!961290) (not e!805492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425853 (= res!961290 (validKeyInArray!0 (select (arr!46962 a!2831) j!81)))))

(declare-fun b!1425854 () Bool)

(declare-fun e!805491 () Bool)

(assert (=> b!1425854 (= e!805492 e!805491)))

(declare-fun res!961285 () Bool)

(assert (=> b!1425854 (=> (not res!961285) (not e!805491))))

(declare-datatypes ((SeekEntryResult!11241 0))(
  ( (MissingZero!11241 (index!47356 (_ BitVec 32))) (Found!11241 (index!47357 (_ BitVec 32))) (Intermediate!11241 (undefined!12053 Bool) (index!47358 (_ BitVec 32)) (x!128987 (_ BitVec 32))) (Undefined!11241) (MissingVacant!11241 (index!47359 (_ BitVec 32))) )
))
(declare-fun lt!627930 () SeekEntryResult!11241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97289 (_ BitVec 32)) SeekEntryResult!11241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425854 (= res!961285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46962 a!2831) j!81) mask!2608) (select (arr!46962 a!2831) j!81) a!2831 mask!2608) lt!627930))))

(assert (=> b!1425854 (= lt!627930 (Intermediate!11241 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425855 () Bool)

(declare-fun e!805490 () Bool)

(assert (=> b!1425855 (= e!805491 e!805490)))

(declare-fun res!961283 () Bool)

(assert (=> b!1425855 (=> (not res!961283) (not e!805490))))

(declare-fun lt!627929 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun lt!627927 () array!97289)

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1425855 (= res!961283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627929 mask!2608) lt!627929 lt!627927 mask!2608) (Intermediate!11241 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425855 (= lt!627929 (select (store (arr!46962 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425855 (= lt!627927 (array!97290 (store (arr!46962 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47512 a!2831)))))

(declare-fun b!1425856 () Bool)

(declare-fun res!961282 () Bool)

(assert (=> b!1425856 (=> (not res!961282) (not e!805490))))

(assert (=> b!1425856 (= res!961282 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46962 a!2831) j!81) a!2831 mask!2608) lt!627930))))

(declare-fun b!1425857 () Bool)

(assert (=> b!1425857 (= e!805490 false)))

(declare-fun lt!627928 () SeekEntryResult!11241)

(assert (=> b!1425857 (= lt!627928 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627929 lt!627927 mask!2608))))

(declare-fun res!961291 () Bool)

(assert (=> start!122924 (=> (not res!961291) (not e!805492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122924 (= res!961291 (validMask!0 mask!2608))))

(assert (=> start!122924 e!805492))

(assert (=> start!122924 true))

(declare-fun array_inv!35990 (array!97289) Bool)

(assert (=> start!122924 (array_inv!35990 a!2831)))

(declare-fun b!1425858 () Bool)

(declare-fun res!961284 () Bool)

(assert (=> b!1425858 (=> (not res!961284) (not e!805492))))

(assert (=> b!1425858 (= res!961284 (validKeyInArray!0 (select (arr!46962 a!2831) i!982)))))

(assert (= (and start!122924 res!961291) b!1425851))

(assert (= (and b!1425851 res!961287) b!1425858))

(assert (= (and b!1425858 res!961284) b!1425853))

(assert (= (and b!1425853 res!961290) b!1425849))

(assert (= (and b!1425849 res!961286) b!1425850))

(assert (= (and b!1425850 res!961289) b!1425852))

(assert (= (and b!1425852 res!961288) b!1425854))

(assert (= (and b!1425854 res!961285) b!1425855))

(assert (= (and b!1425855 res!961283) b!1425856))

(assert (= (and b!1425856 res!961282) b!1425857))

(declare-fun m!1316459 () Bool)

(assert (=> b!1425858 m!1316459))

(assert (=> b!1425858 m!1316459))

(declare-fun m!1316461 () Bool)

(assert (=> b!1425858 m!1316461))

(declare-fun m!1316463 () Bool)

(assert (=> b!1425850 m!1316463))

(declare-fun m!1316465 () Bool)

(assert (=> b!1425853 m!1316465))

(assert (=> b!1425853 m!1316465))

(declare-fun m!1316467 () Bool)

(assert (=> b!1425853 m!1316467))

(declare-fun m!1316469 () Bool)

(assert (=> b!1425849 m!1316469))

(assert (=> b!1425854 m!1316465))

(assert (=> b!1425854 m!1316465))

(declare-fun m!1316471 () Bool)

(assert (=> b!1425854 m!1316471))

(assert (=> b!1425854 m!1316471))

(assert (=> b!1425854 m!1316465))

(declare-fun m!1316473 () Bool)

(assert (=> b!1425854 m!1316473))

(declare-fun m!1316475 () Bool)

(assert (=> b!1425855 m!1316475))

(assert (=> b!1425855 m!1316475))

(declare-fun m!1316477 () Bool)

(assert (=> b!1425855 m!1316477))

(declare-fun m!1316479 () Bool)

(assert (=> b!1425855 m!1316479))

(declare-fun m!1316481 () Bool)

(assert (=> b!1425855 m!1316481))

(assert (=> b!1425856 m!1316465))

(assert (=> b!1425856 m!1316465))

(declare-fun m!1316483 () Bool)

(assert (=> b!1425856 m!1316483))

(declare-fun m!1316485 () Bool)

(assert (=> start!122924 m!1316485))

(declare-fun m!1316487 () Bool)

(assert (=> start!122924 m!1316487))

(declare-fun m!1316489 () Bool)

(assert (=> b!1425857 m!1316489))

(check-sat (not b!1425850) (not b!1425856) (not start!122924) (not b!1425849) (not b!1425858) (not b!1425854) (not b!1425853) (not b!1425857) (not b!1425855))
(check-sat)
