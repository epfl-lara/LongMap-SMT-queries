; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122656 () Bool)

(assert start!122656)

(declare-fun b!1420803 () Bool)

(declare-fun res!956245 () Bool)

(declare-fun e!803507 () Bool)

(assert (=> b!1420803 (=> (not res!956245) (not e!803507))))

(declare-datatypes ((SeekEntryResult!11113 0))(
  ( (MissingZero!11113 (index!46844 (_ BitVec 32))) (Found!11113 (index!46845 (_ BitVec 32))) (Intermediate!11113 (undefined!11925 Bool) (index!46846 (_ BitVec 32)) (x!128499 (_ BitVec 32))) (Undefined!11113) (MissingVacant!11113 (index!46847 (_ BitVec 32))) )
))
(declare-fun lt!626005 () SeekEntryResult!11113)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97021 0))(
  ( (array!97022 (arr!46828 (Array (_ BitVec 32) (_ BitVec 64))) (size!47378 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97021)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97021 (_ BitVec 32)) SeekEntryResult!11113)

(assert (=> b!1420803 (= res!956245 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46828 a!2831) j!81) a!2831 mask!2608) lt!626005))))

(declare-fun b!1420804 () Bool)

(declare-fun res!956242 () Bool)

(declare-fun e!803506 () Bool)

(assert (=> b!1420804 (=> (not res!956242) (not e!803506))))

(declare-datatypes ((List!33338 0))(
  ( (Nil!33335) (Cons!33334 (h!34636 (_ BitVec 64)) (t!48032 List!33338)) )
))
(declare-fun arrayNoDuplicates!0 (array!97021 (_ BitVec 32) List!33338) Bool)

(assert (=> b!1420804 (= res!956242 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33335))))

(declare-fun b!1420805 () Bool)

(declare-fun res!956240 () Bool)

(assert (=> b!1420805 (=> (not res!956240) (not e!803506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97021 (_ BitVec 32)) Bool)

(assert (=> b!1420805 (= res!956240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420806 () Bool)

(declare-fun res!956236 () Bool)

(assert (=> b!1420806 (=> (not res!956236) (not e!803506))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420806 (= res!956236 (validKeyInArray!0 (select (arr!46828 a!2831) i!982)))))

(declare-fun b!1420808 () Bool)

(declare-fun e!803505 () Bool)

(assert (=> b!1420808 (= e!803506 e!803505)))

(declare-fun res!956243 () Bool)

(assert (=> b!1420808 (=> (not res!956243) (not e!803505))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420808 (= res!956243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46828 a!2831) j!81) mask!2608) (select (arr!46828 a!2831) j!81) a!2831 mask!2608) lt!626005))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420808 (= lt!626005 (Intermediate!11113 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420809 () Bool)

(declare-fun res!956239 () Bool)

(assert (=> b!1420809 (=> (not res!956239) (not e!803506))))

(assert (=> b!1420809 (= res!956239 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47378 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47378 a!2831))))))

(declare-fun b!1420810 () Bool)

(assert (=> b!1420810 (= e!803505 e!803507)))

(declare-fun res!956238 () Bool)

(assert (=> b!1420810 (=> (not res!956238) (not e!803507))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626006 () (_ BitVec 64))

(declare-fun lt!626007 () array!97021)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420810 (= res!956238 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626006 mask!2608) lt!626006 lt!626007 mask!2608) (Intermediate!11113 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420810 (= lt!626006 (select (store (arr!46828 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420810 (= lt!626007 (array!97022 (store (arr!46828 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47378 a!2831)))))

(declare-fun b!1420811 () Bool)

(declare-fun res!956241 () Bool)

(assert (=> b!1420811 (=> (not res!956241) (not e!803506))))

(assert (=> b!1420811 (= res!956241 (and (= (size!47378 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47378 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47378 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420812 () Bool)

(assert (=> b!1420812 (= e!803507 false)))

(declare-fun lt!626004 () SeekEntryResult!11113)

(assert (=> b!1420812 (= lt!626004 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626006 lt!626007 mask!2608))))

(declare-fun res!956244 () Bool)

(assert (=> start!122656 (=> (not res!956244) (not e!803506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122656 (= res!956244 (validMask!0 mask!2608))))

(assert (=> start!122656 e!803506))

(assert (=> start!122656 true))

(declare-fun array_inv!35856 (array!97021) Bool)

(assert (=> start!122656 (array_inv!35856 a!2831)))

(declare-fun b!1420807 () Bool)

(declare-fun res!956237 () Bool)

(assert (=> b!1420807 (=> (not res!956237) (not e!803506))))

(assert (=> b!1420807 (= res!956237 (validKeyInArray!0 (select (arr!46828 a!2831) j!81)))))

(assert (= (and start!122656 res!956244) b!1420811))

(assert (= (and b!1420811 res!956241) b!1420806))

(assert (= (and b!1420806 res!956236) b!1420807))

(assert (= (and b!1420807 res!956237) b!1420805))

(assert (= (and b!1420805 res!956240) b!1420804))

(assert (= (and b!1420804 res!956242) b!1420809))

(assert (= (and b!1420809 res!956239) b!1420808))

(assert (= (and b!1420808 res!956243) b!1420810))

(assert (= (and b!1420810 res!956238) b!1420803))

(assert (= (and b!1420803 res!956245) b!1420812))

(declare-fun m!1311331 () Bool)

(assert (=> b!1420804 m!1311331))

(declare-fun m!1311333 () Bool)

(assert (=> b!1420810 m!1311333))

(assert (=> b!1420810 m!1311333))

(declare-fun m!1311335 () Bool)

(assert (=> b!1420810 m!1311335))

(declare-fun m!1311337 () Bool)

(assert (=> b!1420810 m!1311337))

(declare-fun m!1311339 () Bool)

(assert (=> b!1420810 m!1311339))

(declare-fun m!1311341 () Bool)

(assert (=> b!1420803 m!1311341))

(assert (=> b!1420803 m!1311341))

(declare-fun m!1311343 () Bool)

(assert (=> b!1420803 m!1311343))

(assert (=> b!1420808 m!1311341))

(assert (=> b!1420808 m!1311341))

(declare-fun m!1311345 () Bool)

(assert (=> b!1420808 m!1311345))

(assert (=> b!1420808 m!1311345))

(assert (=> b!1420808 m!1311341))

(declare-fun m!1311347 () Bool)

(assert (=> b!1420808 m!1311347))

(declare-fun m!1311349 () Bool)

(assert (=> b!1420805 m!1311349))

(declare-fun m!1311351 () Bool)

(assert (=> b!1420812 m!1311351))

(declare-fun m!1311353 () Bool)

(assert (=> b!1420806 m!1311353))

(assert (=> b!1420806 m!1311353))

(declare-fun m!1311355 () Bool)

(assert (=> b!1420806 m!1311355))

(assert (=> b!1420807 m!1311341))

(assert (=> b!1420807 m!1311341))

(declare-fun m!1311357 () Bool)

(assert (=> b!1420807 m!1311357))

(declare-fun m!1311359 () Bool)

(assert (=> start!122656 m!1311359))

(declare-fun m!1311361 () Bool)

(assert (=> start!122656 m!1311361))

(push 1)

(assert (not b!1420806))

(assert (not b!1420805))

(assert (not b!1420812))

