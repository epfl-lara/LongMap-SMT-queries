; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122624 () Bool)

(assert start!122624)

(declare-fun b!1420303 () Bool)

(declare-fun res!955786 () Bool)

(declare-fun e!803333 () Bool)

(assert (=> b!1420303 (=> (not res!955786) (not e!803333))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((array!96942 0))(
  ( (array!96943 (arr!46789 (Array (_ BitVec 32) (_ BitVec 64))) (size!47341 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96942)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1420303 (= res!955786 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47341 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47341 a!2831))))))

(declare-fun b!1420304 () Bool)

(declare-fun res!955789 () Bool)

(declare-fun e!803332 () Bool)

(assert (=> b!1420304 (=> (not res!955789) (not e!803332))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11101 0))(
  ( (MissingZero!11101 (index!46796 (_ BitVec 32))) (Found!11101 (index!46797 (_ BitVec 32))) (Intermediate!11101 (undefined!11913 Bool) (index!46798 (_ BitVec 32)) (x!128452 (_ BitVec 32))) (Undefined!11101) (MissingVacant!11101 (index!46799 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96942 (_ BitVec 32)) SeekEntryResult!11101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420304 (= res!955789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46789 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46789 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96943 (store (arr!46789 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47341 a!2831)) mask!2608) (Intermediate!11101 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420305 () Bool)

(declare-fun res!955792 () Bool)

(assert (=> b!1420305 (=> (not res!955792) (not e!803333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96942 (_ BitVec 32)) Bool)

(assert (=> b!1420305 (= res!955792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420306 () Bool)

(declare-fun res!955795 () Bool)

(assert (=> b!1420306 (=> (not res!955795) (not e!803332))))

(declare-fun lt!625721 () SeekEntryResult!11101)

(assert (=> b!1420306 (= res!955795 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46789 a!2831) j!81) a!2831 mask!2608) lt!625721))))

(declare-fun b!1420307 () Bool)

(declare-fun res!955794 () Bool)

(assert (=> b!1420307 (=> (not res!955794) (not e!803333))))

(assert (=> b!1420307 (= res!955794 (and (= (size!47341 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47341 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47341 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420308 () Bool)

(assert (=> b!1420308 (= e!803332 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420309 () Bool)

(declare-fun res!955791 () Bool)

(assert (=> b!1420309 (=> (not res!955791) (not e!803333))))

(declare-datatypes ((List!33377 0))(
  ( (Nil!33374) (Cons!33373 (h!34675 (_ BitVec 64)) (t!48063 List!33377)) )
))
(declare-fun arrayNoDuplicates!0 (array!96942 (_ BitVec 32) List!33377) Bool)

(assert (=> b!1420309 (= res!955791 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33374))))

(declare-fun b!1420302 () Bool)

(declare-fun res!955793 () Bool)

(assert (=> b!1420302 (=> (not res!955793) (not e!803333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420302 (= res!955793 (validKeyInArray!0 (select (arr!46789 a!2831) j!81)))))

(declare-fun res!955790 () Bool)

(assert (=> start!122624 (=> (not res!955790) (not e!803333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122624 (= res!955790 (validMask!0 mask!2608))))

(assert (=> start!122624 e!803333))

(assert (=> start!122624 true))

(declare-fun array_inv!36022 (array!96942) Bool)

(assert (=> start!122624 (array_inv!36022 a!2831)))

(declare-fun b!1420310 () Bool)

(assert (=> b!1420310 (= e!803333 e!803332)))

(declare-fun res!955787 () Bool)

(assert (=> b!1420310 (=> (not res!955787) (not e!803332))))

(assert (=> b!1420310 (= res!955787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46789 a!2831) j!81) mask!2608) (select (arr!46789 a!2831) j!81) a!2831 mask!2608) lt!625721))))

(assert (=> b!1420310 (= lt!625721 (Intermediate!11101 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420311 () Bool)

(declare-fun res!955788 () Bool)

(assert (=> b!1420311 (=> (not res!955788) (not e!803333))))

(assert (=> b!1420311 (= res!955788 (validKeyInArray!0 (select (arr!46789 a!2831) i!982)))))

(assert (= (and start!122624 res!955790) b!1420307))

(assert (= (and b!1420307 res!955794) b!1420311))

(assert (= (and b!1420311 res!955788) b!1420302))

(assert (= (and b!1420302 res!955793) b!1420305))

(assert (= (and b!1420305 res!955792) b!1420309))

(assert (= (and b!1420309 res!955791) b!1420303))

(assert (= (and b!1420303 res!955786) b!1420310))

(assert (= (and b!1420310 res!955787) b!1420304))

(assert (= (and b!1420304 res!955789) b!1420306))

(assert (= (and b!1420306 res!955795) b!1420308))

(declare-fun m!1310343 () Bool)

(assert (=> b!1420304 m!1310343))

(declare-fun m!1310345 () Bool)

(assert (=> b!1420304 m!1310345))

(assert (=> b!1420304 m!1310345))

(declare-fun m!1310347 () Bool)

(assert (=> b!1420304 m!1310347))

(assert (=> b!1420304 m!1310347))

(assert (=> b!1420304 m!1310345))

(declare-fun m!1310349 () Bool)

(assert (=> b!1420304 m!1310349))

(declare-fun m!1310351 () Bool)

(assert (=> b!1420309 m!1310351))

(declare-fun m!1310353 () Bool)

(assert (=> start!122624 m!1310353))

(declare-fun m!1310355 () Bool)

(assert (=> start!122624 m!1310355))

(declare-fun m!1310357 () Bool)

(assert (=> b!1420306 m!1310357))

(assert (=> b!1420306 m!1310357))

(declare-fun m!1310359 () Bool)

(assert (=> b!1420306 m!1310359))

(declare-fun m!1310361 () Bool)

(assert (=> b!1420305 m!1310361))

(assert (=> b!1420310 m!1310357))

(assert (=> b!1420310 m!1310357))

(declare-fun m!1310363 () Bool)

(assert (=> b!1420310 m!1310363))

(assert (=> b!1420310 m!1310363))

(assert (=> b!1420310 m!1310357))

(declare-fun m!1310365 () Bool)

(assert (=> b!1420310 m!1310365))

(assert (=> b!1420302 m!1310357))

(assert (=> b!1420302 m!1310357))

(declare-fun m!1310367 () Bool)

(assert (=> b!1420302 m!1310367))

(declare-fun m!1310369 () Bool)

(assert (=> b!1420311 m!1310369))

(assert (=> b!1420311 m!1310369))

(declare-fun m!1310371 () Bool)

(assert (=> b!1420311 m!1310371))

(check-sat (not b!1420304) (not b!1420306) (not start!122624) (not b!1420311) (not b!1420310) (not b!1420305) (not b!1420302) (not b!1420309))
(check-sat)
