; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122650 () Bool)

(assert start!122650)

(declare-fun b!1420713 () Bool)

(declare-fun res!956155 () Bool)

(declare-fun e!803470 () Bool)

(assert (=> b!1420713 (=> (not res!956155) (not e!803470))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97015 0))(
  ( (array!97016 (arr!46825 (Array (_ BitVec 32) (_ BitVec 64))) (size!47375 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97015)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420713 (= res!956155 (and (= (size!47375 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47375 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47375 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420714 () Bool)

(declare-fun res!956148 () Bool)

(assert (=> b!1420714 (=> (not res!956148) (not e!803470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420714 (= res!956148 (validKeyInArray!0 (select (arr!46825 a!2831) j!81)))))

(declare-fun b!1420715 () Bool)

(declare-fun e!803468 () Bool)

(assert (=> b!1420715 (= e!803468 false)))

(declare-datatypes ((SeekEntryResult!11110 0))(
  ( (MissingZero!11110 (index!46832 (_ BitVec 32))) (Found!11110 (index!46833 (_ BitVec 32))) (Intermediate!11110 (undefined!11922 Bool) (index!46834 (_ BitVec 32)) (x!128488 (_ BitVec 32))) (Undefined!11110) (MissingVacant!11110 (index!46835 (_ BitVec 32))) )
))
(declare-fun lt!625970 () SeekEntryResult!11110)

(declare-fun lt!625969 () (_ BitVec 64))

(declare-fun lt!625968 () array!97015)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97015 (_ BitVec 32)) SeekEntryResult!11110)

(assert (=> b!1420715 (= lt!625970 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625969 lt!625968 mask!2608))))

(declare-fun b!1420716 () Bool)

(declare-fun res!956151 () Bool)

(assert (=> b!1420716 (=> (not res!956151) (not e!803470))))

(assert (=> b!1420716 (= res!956151 (validKeyInArray!0 (select (arr!46825 a!2831) i!982)))))

(declare-fun b!1420717 () Bool)

(declare-fun res!956152 () Bool)

(assert (=> b!1420717 (=> (not res!956152) (not e!803468))))

(declare-fun lt!625971 () SeekEntryResult!11110)

(assert (=> b!1420717 (= res!956152 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46825 a!2831) j!81) a!2831 mask!2608) lt!625971))))

(declare-fun b!1420718 () Bool)

(declare-fun res!956154 () Bool)

(assert (=> b!1420718 (=> (not res!956154) (not e!803470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97015 (_ BitVec 32)) Bool)

(assert (=> b!1420718 (= res!956154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420719 () Bool)

(declare-fun e!803469 () Bool)

(assert (=> b!1420719 (= e!803470 e!803469)))

(declare-fun res!956153 () Bool)

(assert (=> b!1420719 (=> (not res!956153) (not e!803469))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420719 (= res!956153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46825 a!2831) j!81) mask!2608) (select (arr!46825 a!2831) j!81) a!2831 mask!2608) lt!625971))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420719 (= lt!625971 (Intermediate!11110 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420720 () Bool)

(declare-fun res!956149 () Bool)

(assert (=> b!1420720 (=> (not res!956149) (not e!803470))))

(assert (=> b!1420720 (= res!956149 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47375 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47375 a!2831))))))

(declare-fun res!956147 () Bool)

(assert (=> start!122650 (=> (not res!956147) (not e!803470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122650 (= res!956147 (validMask!0 mask!2608))))

(assert (=> start!122650 e!803470))

(assert (=> start!122650 true))

(declare-fun array_inv!35853 (array!97015) Bool)

(assert (=> start!122650 (array_inv!35853 a!2831)))

(declare-fun b!1420721 () Bool)

(assert (=> b!1420721 (= e!803469 e!803468)))

(declare-fun res!956146 () Bool)

(assert (=> b!1420721 (=> (not res!956146) (not e!803468))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420721 (= res!956146 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625969 mask!2608) lt!625969 lt!625968 mask!2608) (Intermediate!11110 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420721 (= lt!625969 (select (store (arr!46825 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420721 (= lt!625968 (array!97016 (store (arr!46825 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47375 a!2831)))))

(declare-fun b!1420722 () Bool)

(declare-fun res!956150 () Bool)

(assert (=> b!1420722 (=> (not res!956150) (not e!803470))))

(declare-datatypes ((List!33335 0))(
  ( (Nil!33332) (Cons!33331 (h!34633 (_ BitVec 64)) (t!48029 List!33335)) )
))
(declare-fun arrayNoDuplicates!0 (array!97015 (_ BitVec 32) List!33335) Bool)

(assert (=> b!1420722 (= res!956150 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33332))))

(assert (= (and start!122650 res!956147) b!1420713))

(assert (= (and b!1420713 res!956155) b!1420716))

(assert (= (and b!1420716 res!956151) b!1420714))

(assert (= (and b!1420714 res!956148) b!1420718))

(assert (= (and b!1420718 res!956154) b!1420722))

(assert (= (and b!1420722 res!956150) b!1420720))

(assert (= (and b!1420720 res!956149) b!1420719))

(assert (= (and b!1420719 res!956153) b!1420721))

(assert (= (and b!1420721 res!956146) b!1420717))

(assert (= (and b!1420717 res!956152) b!1420715))

(declare-fun m!1311235 () Bool)

(assert (=> start!122650 m!1311235))

(declare-fun m!1311237 () Bool)

(assert (=> start!122650 m!1311237))

(declare-fun m!1311239 () Bool)

(assert (=> b!1420718 m!1311239))

(declare-fun m!1311241 () Bool)

(assert (=> b!1420717 m!1311241))

(assert (=> b!1420717 m!1311241))

(declare-fun m!1311243 () Bool)

(assert (=> b!1420717 m!1311243))

(declare-fun m!1311245 () Bool)

(assert (=> b!1420721 m!1311245))

(assert (=> b!1420721 m!1311245))

(declare-fun m!1311247 () Bool)

(assert (=> b!1420721 m!1311247))

(declare-fun m!1311249 () Bool)

(assert (=> b!1420721 m!1311249))

(declare-fun m!1311251 () Bool)

(assert (=> b!1420721 m!1311251))

(declare-fun m!1311253 () Bool)

(assert (=> b!1420722 m!1311253))

(assert (=> b!1420719 m!1311241))

(assert (=> b!1420719 m!1311241))

(declare-fun m!1311255 () Bool)

(assert (=> b!1420719 m!1311255))

(assert (=> b!1420719 m!1311255))

(assert (=> b!1420719 m!1311241))

(declare-fun m!1311257 () Bool)

(assert (=> b!1420719 m!1311257))

(assert (=> b!1420714 m!1311241))

(assert (=> b!1420714 m!1311241))

(declare-fun m!1311259 () Bool)

(assert (=> b!1420714 m!1311259))

(declare-fun m!1311261 () Bool)

(assert (=> b!1420716 m!1311261))

(assert (=> b!1420716 m!1311261))

(declare-fun m!1311263 () Bool)

(assert (=> b!1420716 m!1311263))

(declare-fun m!1311265 () Bool)

(assert (=> b!1420715 m!1311265))

(push 1)

(assert (not b!1420718))

(assert (not start!122650))

(assert (not b!1420715))

(assert (not b!1420714))

