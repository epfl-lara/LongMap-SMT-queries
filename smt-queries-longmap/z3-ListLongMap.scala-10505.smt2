; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123958 () Bool)

(assert start!123958)

(declare-fun b!1435568 () Bool)

(declare-fun res!968193 () Bool)

(declare-fun e!810346 () Bool)

(assert (=> b!1435568 (=> (not res!968193) (not e!810346))))

(declare-datatypes ((array!97697 0))(
  ( (array!97698 (arr!47149 (Array (_ BitVec 32) (_ BitVec 64))) (size!47700 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97697)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435568 (= res!968193 (validKeyInArray!0 (select (arr!47149 a!2831) j!81)))))

(declare-fun b!1435569 () Bool)

(declare-fun res!968205 () Bool)

(assert (=> b!1435569 (=> (not res!968205) (not e!810346))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97697 (_ BitVec 32)) Bool)

(assert (=> b!1435569 (= res!968205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435570 () Bool)

(declare-fun res!968198 () Bool)

(declare-fun e!810344 () Bool)

(assert (=> b!1435570 (=> (not res!968198) (not e!810344))))

(declare-datatypes ((SeekEntryResult!11330 0))(
  ( (MissingZero!11330 (index!47712 (_ BitVec 32))) (Found!11330 (index!47713 (_ BitVec 32))) (Intermediate!11330 (undefined!12142 Bool) (index!47714 (_ BitVec 32)) (x!129526 (_ BitVec 32))) (Undefined!11330) (MissingVacant!11330 (index!47715 (_ BitVec 32))) )
))
(declare-fun lt!631867 () SeekEntryResult!11330)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97697 (_ BitVec 32)) SeekEntryResult!11330)

(assert (=> b!1435570 (= res!968198 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47149 a!2831) j!81) a!2831 mask!2608) lt!631867))))

(declare-fun b!1435571 () Bool)

(declare-fun res!968201 () Bool)

(assert (=> b!1435571 (=> (not res!968201) (not e!810346))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435571 (= res!968201 (validKeyInArray!0 (select (arr!47149 a!2831) i!982)))))

(declare-fun b!1435572 () Bool)

(declare-fun res!968195 () Bool)

(assert (=> b!1435572 (=> (not res!968195) (not e!810346))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1435572 (= res!968195 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47700 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47700 a!2831))))))

(declare-fun b!1435573 () Bool)

(declare-fun res!968203 () Bool)

(assert (=> b!1435573 (=> (not res!968203) (not e!810344))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435573 (= res!968203 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435574 () Bool)

(declare-fun res!968202 () Bool)

(assert (=> b!1435574 (=> (not res!968202) (not e!810346))))

(declare-datatypes ((List!33646 0))(
  ( (Nil!33643) (Cons!33642 (h!34982 (_ BitVec 64)) (t!48332 List!33646)) )
))
(declare-fun arrayNoDuplicates!0 (array!97697 (_ BitVec 32) List!33646) Bool)

(assert (=> b!1435574 (= res!968202 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33643))))

(declare-fun b!1435575 () Bool)

(declare-fun e!810347 () Bool)

(assert (=> b!1435575 (= e!810347 true)))

(declare-fun lt!631864 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435575 (= lt!631864 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1435576 () Bool)

(assert (=> b!1435576 (= e!810344 (not e!810347))))

(declare-fun res!968206 () Bool)

(assert (=> b!1435576 (=> res!968206 e!810347)))

(assert (=> b!1435576 (= res!968206 (or (= (select (arr!47149 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47149 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47149 a!2831) index!585) (select (arr!47149 a!2831) j!81)) (= (select (store (arr!47149 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810345 () Bool)

(assert (=> b!1435576 e!810345))

(declare-fun res!968200 () Bool)

(assert (=> b!1435576 (=> (not res!968200) (not e!810345))))

(assert (=> b!1435576 (= res!968200 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48437 0))(
  ( (Unit!48438) )
))
(declare-fun lt!631868 () Unit!48437)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48437)

(assert (=> b!1435576 (= lt!631868 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435578 () Bool)

(declare-fun e!810343 () Bool)

(assert (=> b!1435578 (= e!810343 e!810344)))

(declare-fun res!968194 () Bool)

(assert (=> b!1435578 (=> (not res!968194) (not e!810344))))

(declare-fun lt!631863 () SeekEntryResult!11330)

(declare-fun lt!631865 () array!97697)

(declare-fun lt!631866 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435578 (= res!968194 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631866 mask!2608) lt!631866 lt!631865 mask!2608) lt!631863))))

(assert (=> b!1435578 (= lt!631863 (Intermediate!11330 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435578 (= lt!631866 (select (store (arr!47149 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435578 (= lt!631865 (array!97698 (store (arr!47149 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47700 a!2831)))))

(declare-fun b!1435579 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97697 (_ BitVec 32)) SeekEntryResult!11330)

(assert (=> b!1435579 (= e!810345 (= (seekEntryOrOpen!0 (select (arr!47149 a!2831) j!81) a!2831 mask!2608) (Found!11330 j!81)))))

(declare-fun b!1435580 () Bool)

(assert (=> b!1435580 (= e!810346 e!810343)))

(declare-fun res!968196 () Bool)

(assert (=> b!1435580 (=> (not res!968196) (not e!810343))))

(assert (=> b!1435580 (= res!968196 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47149 a!2831) j!81) mask!2608) (select (arr!47149 a!2831) j!81) a!2831 mask!2608) lt!631867))))

(assert (=> b!1435580 (= lt!631867 (Intermediate!11330 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435581 () Bool)

(declare-fun res!968204 () Bool)

(assert (=> b!1435581 (=> (not res!968204) (not e!810344))))

(assert (=> b!1435581 (= res!968204 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631866 lt!631865 mask!2608) lt!631863))))

(declare-fun b!1435577 () Bool)

(declare-fun res!968197 () Bool)

(assert (=> b!1435577 (=> (not res!968197) (not e!810346))))

(assert (=> b!1435577 (= res!968197 (and (= (size!47700 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47700 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47700 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!968199 () Bool)

(assert (=> start!123958 (=> (not res!968199) (not e!810346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123958 (= res!968199 (validMask!0 mask!2608))))

(assert (=> start!123958 e!810346))

(assert (=> start!123958 true))

(declare-fun array_inv!36430 (array!97697) Bool)

(assert (=> start!123958 (array_inv!36430 a!2831)))

(assert (= (and start!123958 res!968199) b!1435577))

(assert (= (and b!1435577 res!968197) b!1435571))

(assert (= (and b!1435571 res!968201) b!1435568))

(assert (= (and b!1435568 res!968193) b!1435569))

(assert (= (and b!1435569 res!968205) b!1435574))

(assert (= (and b!1435574 res!968202) b!1435572))

(assert (= (and b!1435572 res!968195) b!1435580))

(assert (= (and b!1435580 res!968196) b!1435578))

(assert (= (and b!1435578 res!968194) b!1435570))

(assert (= (and b!1435570 res!968198) b!1435581))

(assert (= (and b!1435581 res!968204) b!1435573))

(assert (= (and b!1435573 res!968203) b!1435576))

(assert (= (and b!1435576 res!968200) b!1435579))

(assert (= (and b!1435576 (not res!968206)) b!1435575))

(declare-fun m!1325299 () Bool)

(assert (=> b!1435575 m!1325299))

(declare-fun m!1325301 () Bool)

(assert (=> b!1435578 m!1325301))

(assert (=> b!1435578 m!1325301))

(declare-fun m!1325303 () Bool)

(assert (=> b!1435578 m!1325303))

(declare-fun m!1325305 () Bool)

(assert (=> b!1435578 m!1325305))

(declare-fun m!1325307 () Bool)

(assert (=> b!1435578 m!1325307))

(declare-fun m!1325309 () Bool)

(assert (=> b!1435568 m!1325309))

(assert (=> b!1435568 m!1325309))

(declare-fun m!1325311 () Bool)

(assert (=> b!1435568 m!1325311))

(assert (=> b!1435570 m!1325309))

(assert (=> b!1435570 m!1325309))

(declare-fun m!1325313 () Bool)

(assert (=> b!1435570 m!1325313))

(declare-fun m!1325315 () Bool)

(assert (=> b!1435569 m!1325315))

(assert (=> b!1435580 m!1325309))

(assert (=> b!1435580 m!1325309))

(declare-fun m!1325317 () Bool)

(assert (=> b!1435580 m!1325317))

(assert (=> b!1435580 m!1325317))

(assert (=> b!1435580 m!1325309))

(declare-fun m!1325319 () Bool)

(assert (=> b!1435580 m!1325319))

(declare-fun m!1325321 () Bool)

(assert (=> b!1435581 m!1325321))

(declare-fun m!1325323 () Bool)

(assert (=> start!123958 m!1325323))

(declare-fun m!1325325 () Bool)

(assert (=> start!123958 m!1325325))

(declare-fun m!1325327 () Bool)

(assert (=> b!1435574 m!1325327))

(assert (=> b!1435576 m!1325305))

(declare-fun m!1325329 () Bool)

(assert (=> b!1435576 m!1325329))

(declare-fun m!1325331 () Bool)

(assert (=> b!1435576 m!1325331))

(declare-fun m!1325333 () Bool)

(assert (=> b!1435576 m!1325333))

(assert (=> b!1435576 m!1325309))

(declare-fun m!1325335 () Bool)

(assert (=> b!1435576 m!1325335))

(assert (=> b!1435579 m!1325309))

(assert (=> b!1435579 m!1325309))

(declare-fun m!1325337 () Bool)

(assert (=> b!1435579 m!1325337))

(declare-fun m!1325339 () Bool)

(assert (=> b!1435571 m!1325339))

(assert (=> b!1435571 m!1325339))

(declare-fun m!1325341 () Bool)

(assert (=> b!1435571 m!1325341))

(check-sat (not start!123958) (not b!1435571) (not b!1435578) (not b!1435576) (not b!1435570) (not b!1435569) (not b!1435574) (not b!1435581) (not b!1435580) (not b!1435575) (not b!1435579) (not b!1435568))
(check-sat)
