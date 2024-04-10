; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122658 () Bool)

(assert start!122658)

(declare-fun b!1420833 () Bool)

(declare-fun res!956269 () Bool)

(declare-fun e!803519 () Bool)

(assert (=> b!1420833 (=> (not res!956269) (not e!803519))))

(declare-datatypes ((SeekEntryResult!11114 0))(
  ( (MissingZero!11114 (index!46848 (_ BitVec 32))) (Found!11114 (index!46849 (_ BitVec 32))) (Intermediate!11114 (undefined!11926 Bool) (index!46850 (_ BitVec 32)) (x!128508 (_ BitVec 32))) (Undefined!11114) (MissingVacant!11114 (index!46851 (_ BitVec 32))) )
))
(declare-fun lt!626017 () SeekEntryResult!11114)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97023 0))(
  ( (array!97024 (arr!46829 (Array (_ BitVec 32) (_ BitVec 64))) (size!47379 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97023)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97023 (_ BitVec 32)) SeekEntryResult!11114)

(assert (=> b!1420833 (= res!956269 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46829 a!2831) j!81) a!2831 mask!2608) lt!626017))))

(declare-fun b!1420834 () Bool)

(declare-fun res!956275 () Bool)

(declare-fun e!803517 () Bool)

(assert (=> b!1420834 (=> (not res!956275) (not e!803517))))

(declare-datatypes ((List!33339 0))(
  ( (Nil!33336) (Cons!33335 (h!34637 (_ BitVec 64)) (t!48033 List!33339)) )
))
(declare-fun arrayNoDuplicates!0 (array!97023 (_ BitVec 32) List!33339) Bool)

(assert (=> b!1420834 (= res!956275 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33336))))

(declare-fun b!1420835 () Bool)

(assert (=> b!1420835 (= e!803519 false)))

(declare-fun lt!626016 () SeekEntryResult!11114)

(declare-fun lt!626019 () array!97023)

(declare-fun lt!626018 () (_ BitVec 64))

(assert (=> b!1420835 (= lt!626016 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626018 lt!626019 mask!2608))))

(declare-fun b!1420836 () Bool)

(declare-fun e!803518 () Bool)

(assert (=> b!1420836 (= e!803518 e!803519)))

(declare-fun res!956274 () Bool)

(assert (=> b!1420836 (=> (not res!956274) (not e!803519))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420836 (= res!956274 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626018 mask!2608) lt!626018 lt!626019 mask!2608) (Intermediate!11114 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420836 (= lt!626018 (select (store (arr!46829 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420836 (= lt!626019 (array!97024 (store (arr!46829 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47379 a!2831)))))

(declare-fun b!1420837 () Bool)

(declare-fun res!956268 () Bool)

(assert (=> b!1420837 (=> (not res!956268) (not e!803517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97023 (_ BitVec 32)) Bool)

(assert (=> b!1420837 (= res!956268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420839 () Bool)

(declare-fun res!956267 () Bool)

(assert (=> b!1420839 (=> (not res!956267) (not e!803517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420839 (= res!956267 (validKeyInArray!0 (select (arr!46829 a!2831) j!81)))))

(declare-fun b!1420840 () Bool)

(declare-fun res!956272 () Bool)

(assert (=> b!1420840 (=> (not res!956272) (not e!803517))))

(assert (=> b!1420840 (= res!956272 (and (= (size!47379 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47379 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47379 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420841 () Bool)

(assert (=> b!1420841 (= e!803517 e!803518)))

(declare-fun res!956270 () Bool)

(assert (=> b!1420841 (=> (not res!956270) (not e!803518))))

(assert (=> b!1420841 (= res!956270 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46829 a!2831) j!81) mask!2608) (select (arr!46829 a!2831) j!81) a!2831 mask!2608) lt!626017))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420841 (= lt!626017 (Intermediate!11114 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420842 () Bool)

(declare-fun res!956266 () Bool)

(assert (=> b!1420842 (=> (not res!956266) (not e!803517))))

(assert (=> b!1420842 (= res!956266 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47379 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47379 a!2831))))))

(declare-fun b!1420838 () Bool)

(declare-fun res!956273 () Bool)

(assert (=> b!1420838 (=> (not res!956273) (not e!803517))))

(assert (=> b!1420838 (= res!956273 (validKeyInArray!0 (select (arr!46829 a!2831) i!982)))))

(declare-fun res!956271 () Bool)

(assert (=> start!122658 (=> (not res!956271) (not e!803517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122658 (= res!956271 (validMask!0 mask!2608))))

(assert (=> start!122658 e!803517))

(assert (=> start!122658 true))

(declare-fun array_inv!35857 (array!97023) Bool)

(assert (=> start!122658 (array_inv!35857 a!2831)))

(assert (= (and start!122658 res!956271) b!1420840))

(assert (= (and b!1420840 res!956272) b!1420838))

(assert (= (and b!1420838 res!956273) b!1420839))

(assert (= (and b!1420839 res!956267) b!1420837))

(assert (= (and b!1420837 res!956268) b!1420834))

(assert (= (and b!1420834 res!956275) b!1420842))

(assert (= (and b!1420842 res!956266) b!1420841))

(assert (= (and b!1420841 res!956270) b!1420836))

(assert (= (and b!1420836 res!956274) b!1420833))

(assert (= (and b!1420833 res!956269) b!1420835))

(declare-fun m!1311363 () Bool)

(assert (=> b!1420833 m!1311363))

(assert (=> b!1420833 m!1311363))

(declare-fun m!1311365 () Bool)

(assert (=> b!1420833 m!1311365))

(declare-fun m!1311367 () Bool)

(assert (=> start!122658 m!1311367))

(declare-fun m!1311369 () Bool)

(assert (=> start!122658 m!1311369))

(declare-fun m!1311371 () Bool)

(assert (=> b!1420836 m!1311371))

(assert (=> b!1420836 m!1311371))

(declare-fun m!1311373 () Bool)

(assert (=> b!1420836 m!1311373))

(declare-fun m!1311375 () Bool)

(assert (=> b!1420836 m!1311375))

(declare-fun m!1311377 () Bool)

(assert (=> b!1420836 m!1311377))

(declare-fun m!1311379 () Bool)

(assert (=> b!1420838 m!1311379))

(assert (=> b!1420838 m!1311379))

(declare-fun m!1311381 () Bool)

(assert (=> b!1420838 m!1311381))

(declare-fun m!1311383 () Bool)

(assert (=> b!1420837 m!1311383))

(assert (=> b!1420839 m!1311363))

(assert (=> b!1420839 m!1311363))

(declare-fun m!1311385 () Bool)

(assert (=> b!1420839 m!1311385))

(assert (=> b!1420841 m!1311363))

(assert (=> b!1420841 m!1311363))

(declare-fun m!1311387 () Bool)

(assert (=> b!1420841 m!1311387))

(assert (=> b!1420841 m!1311387))

(assert (=> b!1420841 m!1311363))

(declare-fun m!1311389 () Bool)

(assert (=> b!1420841 m!1311389))

(declare-fun m!1311391 () Bool)

(assert (=> b!1420834 m!1311391))

(declare-fun m!1311393 () Bool)

(assert (=> b!1420835 m!1311393))

(push 1)

