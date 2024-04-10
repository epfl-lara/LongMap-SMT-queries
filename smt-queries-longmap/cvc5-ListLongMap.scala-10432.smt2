; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122754 () Bool)

(assert start!122754)

(declare-fun res!958176 () Bool)

(declare-fun e!804269 () Bool)

(assert (=> start!122754 (=> (not res!958176) (not e!804269))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122754 (= res!958176 (validMask!0 mask!2608))))

(assert (=> start!122754 e!804269))

(assert (=> start!122754 true))

(declare-datatypes ((array!97119 0))(
  ( (array!97120 (arr!46877 (Array (_ BitVec 32) (_ BitVec 64))) (size!47427 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97119)

(declare-fun array_inv!35905 (array!97119) Bool)

(assert (=> start!122754 (array_inv!35905 a!2831)))

(declare-fun b!1422735 () Bool)

(declare-fun res!958174 () Bool)

(declare-fun e!804271 () Bool)

(assert (=> b!1422735 (=> (not res!958174) (not e!804271))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422735 (= res!958174 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422736 () Bool)

(declare-fun e!804273 () Bool)

(declare-fun e!804274 () Bool)

(assert (=> b!1422736 (= e!804273 e!804274)))

(declare-fun res!958171 () Bool)

(assert (=> b!1422736 (=> res!958171 e!804274)))

(declare-fun lt!626809 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1422736 (= res!958171 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626809 #b00000000000000000000000000000000) (bvsge lt!626809 (size!47427 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422736 (= lt!626809 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422737 () Bool)

(declare-fun res!958181 () Bool)

(assert (=> b!1422737 (=> (not res!958181) (not e!804271))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11162 0))(
  ( (MissingZero!11162 (index!47040 (_ BitVec 32))) (Found!11162 (index!47041 (_ BitVec 32))) (Intermediate!11162 (undefined!11974 Bool) (index!47042 (_ BitVec 32)) (x!128684 (_ BitVec 32))) (Undefined!11162) (MissingVacant!11162 (index!47043 (_ BitVec 32))) )
))
(declare-fun lt!626805 () SeekEntryResult!11162)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97119 (_ BitVec 32)) SeekEntryResult!11162)

(assert (=> b!1422737 (= res!958181 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46877 a!2831) j!81) a!2831 mask!2608) lt!626805))))

(declare-fun b!1422738 () Bool)

(declare-fun e!804270 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97119 (_ BitVec 32)) SeekEntryResult!11162)

(assert (=> b!1422738 (= e!804270 (= (seekEntryOrOpen!0 (select (arr!46877 a!2831) j!81) a!2831 mask!2608) (Found!11162 j!81)))))

(declare-fun b!1422739 () Bool)

(declare-fun res!958169 () Bool)

(assert (=> b!1422739 (=> (not res!958169) (not e!804271))))

(declare-fun lt!626806 () SeekEntryResult!11162)

(declare-fun lt!626811 () (_ BitVec 64))

(declare-fun lt!626807 () array!97119)

(assert (=> b!1422739 (= res!958169 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626811 lt!626807 mask!2608) lt!626806))))

(declare-fun b!1422740 () Bool)

(assert (=> b!1422740 (= e!804274 true)))

(declare-fun lt!626810 () SeekEntryResult!11162)

(assert (=> b!1422740 (= lt!626810 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626809 lt!626811 lt!626807 mask!2608))))

(declare-fun b!1422741 () Bool)

(declare-fun res!958170 () Bool)

(assert (=> b!1422741 (=> (not res!958170) (not e!804269))))

(declare-datatypes ((List!33387 0))(
  ( (Nil!33384) (Cons!33383 (h!34685 (_ BitVec 64)) (t!48081 List!33387)) )
))
(declare-fun arrayNoDuplicates!0 (array!97119 (_ BitVec 32) List!33387) Bool)

(assert (=> b!1422741 (= res!958170 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33384))))

(declare-fun b!1422742 () Bool)

(declare-fun res!958177 () Bool)

(assert (=> b!1422742 (=> (not res!958177) (not e!804269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422742 (= res!958177 (validKeyInArray!0 (select (arr!46877 a!2831) j!81)))))

(declare-fun b!1422743 () Bool)

(declare-fun res!958173 () Bool)

(assert (=> b!1422743 (=> (not res!958173) (not e!804269))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422743 (= res!958173 (validKeyInArray!0 (select (arr!46877 a!2831) i!982)))))

(declare-fun b!1422744 () Bool)

(declare-fun e!804272 () Bool)

(assert (=> b!1422744 (= e!804269 e!804272)))

(declare-fun res!958179 () Bool)

(assert (=> b!1422744 (=> (not res!958179) (not e!804272))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422744 (= res!958179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46877 a!2831) j!81) mask!2608) (select (arr!46877 a!2831) j!81) a!2831 mask!2608) lt!626805))))

(assert (=> b!1422744 (= lt!626805 (Intermediate!11162 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422745 () Bool)

(declare-fun res!958175 () Bool)

(assert (=> b!1422745 (=> (not res!958175) (not e!804269))))

(assert (=> b!1422745 (= res!958175 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47427 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47427 a!2831))))))

(declare-fun b!1422746 () Bool)

(assert (=> b!1422746 (= e!804271 (not e!804273))))

(declare-fun res!958172 () Bool)

(assert (=> b!1422746 (=> res!958172 e!804273)))

(assert (=> b!1422746 (= res!958172 (or (= (select (arr!46877 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46877 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46877 a!2831) index!585) (select (arr!46877 a!2831) j!81)) (= (select (store (arr!46877 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422746 e!804270))

(declare-fun res!958183 () Bool)

(assert (=> b!1422746 (=> (not res!958183) (not e!804270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97119 (_ BitVec 32)) Bool)

(assert (=> b!1422746 (= res!958183 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48160 0))(
  ( (Unit!48161) )
))
(declare-fun lt!626808 () Unit!48160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48160)

(assert (=> b!1422746 (= lt!626808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422747 () Bool)

(declare-fun res!958178 () Bool)

(assert (=> b!1422747 (=> res!958178 e!804274)))

(assert (=> b!1422747 (= res!958178 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626809 (select (arr!46877 a!2831) j!81) a!2831 mask!2608) lt!626805)))))

(declare-fun b!1422748 () Bool)

(declare-fun res!958180 () Bool)

(assert (=> b!1422748 (=> (not res!958180) (not e!804269))))

(assert (=> b!1422748 (= res!958180 (and (= (size!47427 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47427 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47427 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422749 () Bool)

(assert (=> b!1422749 (= e!804272 e!804271)))

(declare-fun res!958168 () Bool)

(assert (=> b!1422749 (=> (not res!958168) (not e!804271))))

(assert (=> b!1422749 (= res!958168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626811 mask!2608) lt!626811 lt!626807 mask!2608) lt!626806))))

(assert (=> b!1422749 (= lt!626806 (Intermediate!11162 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422749 (= lt!626811 (select (store (arr!46877 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422749 (= lt!626807 (array!97120 (store (arr!46877 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47427 a!2831)))))

(declare-fun b!1422750 () Bool)

(declare-fun res!958182 () Bool)

(assert (=> b!1422750 (=> (not res!958182) (not e!804269))))

(assert (=> b!1422750 (= res!958182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122754 res!958176) b!1422748))

(assert (= (and b!1422748 res!958180) b!1422743))

(assert (= (and b!1422743 res!958173) b!1422742))

(assert (= (and b!1422742 res!958177) b!1422750))

(assert (= (and b!1422750 res!958182) b!1422741))

(assert (= (and b!1422741 res!958170) b!1422745))

(assert (= (and b!1422745 res!958175) b!1422744))

(assert (= (and b!1422744 res!958179) b!1422749))

(assert (= (and b!1422749 res!958168) b!1422737))

(assert (= (and b!1422737 res!958181) b!1422739))

(assert (= (and b!1422739 res!958169) b!1422735))

(assert (= (and b!1422735 res!958174) b!1422746))

(assert (= (and b!1422746 res!958183) b!1422738))

(assert (= (and b!1422746 (not res!958172)) b!1422736))

(assert (= (and b!1422736 (not res!958171)) b!1422747))

(assert (= (and b!1422747 (not res!958178)) b!1422740))

(declare-fun m!1313283 () Bool)

(assert (=> b!1422740 m!1313283))

(declare-fun m!1313285 () Bool)

(assert (=> b!1422742 m!1313285))

(assert (=> b!1422742 m!1313285))

(declare-fun m!1313287 () Bool)

(assert (=> b!1422742 m!1313287))

(declare-fun m!1313289 () Bool)

(assert (=> b!1422743 m!1313289))

(assert (=> b!1422743 m!1313289))

(declare-fun m!1313291 () Bool)

(assert (=> b!1422743 m!1313291))

(declare-fun m!1313293 () Bool)

(assert (=> b!1422741 m!1313293))

(declare-fun m!1313295 () Bool)

(assert (=> start!122754 m!1313295))

(declare-fun m!1313297 () Bool)

(assert (=> start!122754 m!1313297))

(declare-fun m!1313299 () Bool)

(assert (=> b!1422750 m!1313299))

(declare-fun m!1313301 () Bool)

(assert (=> b!1422736 m!1313301))

(declare-fun m!1313303 () Bool)

(assert (=> b!1422746 m!1313303))

(declare-fun m!1313305 () Bool)

(assert (=> b!1422746 m!1313305))

(declare-fun m!1313307 () Bool)

(assert (=> b!1422746 m!1313307))

(declare-fun m!1313309 () Bool)

(assert (=> b!1422746 m!1313309))

(assert (=> b!1422746 m!1313285))

(declare-fun m!1313311 () Bool)

(assert (=> b!1422746 m!1313311))

(declare-fun m!1313313 () Bool)

(assert (=> b!1422749 m!1313313))

(assert (=> b!1422749 m!1313313))

(declare-fun m!1313315 () Bool)

(assert (=> b!1422749 m!1313315))

(assert (=> b!1422749 m!1313303))

(declare-fun m!1313317 () Bool)

(assert (=> b!1422749 m!1313317))

(declare-fun m!1313319 () Bool)

(assert (=> b!1422739 m!1313319))

(assert (=> b!1422747 m!1313285))

(assert (=> b!1422747 m!1313285))

(declare-fun m!1313321 () Bool)

(assert (=> b!1422747 m!1313321))

(assert (=> b!1422738 m!1313285))

(assert (=> b!1422738 m!1313285))

(declare-fun m!1313323 () Bool)

(assert (=> b!1422738 m!1313323))

(assert (=> b!1422737 m!1313285))

(assert (=> b!1422737 m!1313285))

(declare-fun m!1313325 () Bool)

(assert (=> b!1422737 m!1313325))

(assert (=> b!1422744 m!1313285))

(assert (=> b!1422744 m!1313285))

(declare-fun m!1313327 () Bool)

(assert (=> b!1422744 m!1313327))

(assert (=> b!1422744 m!1313327))

(assert (=> b!1422744 m!1313285))

(declare-fun m!1313329 () Bool)

(assert (=> b!1422744 m!1313329))

(push 1)

