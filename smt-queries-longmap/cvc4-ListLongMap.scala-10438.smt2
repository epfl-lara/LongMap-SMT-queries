; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122794 () Bool)

(assert start!122794)

(declare-fun b!1423695 () Bool)

(declare-fun res!959138 () Bool)

(declare-fun e!804689 () Bool)

(assert (=> b!1423695 (=> (not res!959138) (not e!804689))))

(declare-datatypes ((array!97159 0))(
  ( (array!97160 (arr!46897 (Array (_ BitVec 32) (_ BitVec 64))) (size!47447 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97159)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423695 (= res!959138 (validKeyInArray!0 (select (arr!46897 a!2831) i!982)))))

(declare-fun b!1423696 () Bool)

(declare-fun res!959135 () Bool)

(declare-fun e!804694 () Bool)

(assert (=> b!1423696 (=> res!959135 e!804694)))

(declare-datatypes ((SeekEntryResult!11182 0))(
  ( (MissingZero!11182 (index!47120 (_ BitVec 32))) (Found!11182 (index!47121 (_ BitVec 32))) (Intermediate!11182 (undefined!11994 Bool) (index!47122 (_ BitVec 32)) (x!128752 (_ BitVec 32))) (Undefined!11182) (MissingVacant!11182 (index!47123 (_ BitVec 32))) )
))
(declare-fun lt!627230 () SeekEntryResult!11182)

(declare-fun lt!627231 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97159 (_ BitVec 32)) SeekEntryResult!11182)

(assert (=> b!1423696 (= res!959135 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627231 (select (arr!46897 a!2831) j!81) a!2831 mask!2608) lt!627230)))))

(declare-fun b!1423697 () Bool)

(declare-fun e!804691 () Bool)

(declare-fun e!804690 () Bool)

(assert (=> b!1423697 (= e!804691 e!804690)))

(declare-fun res!959137 () Bool)

(assert (=> b!1423697 (=> (not res!959137) (not e!804690))))

(declare-fun lt!627227 () (_ BitVec 64))

(declare-fun lt!627229 () array!97159)

(declare-fun lt!627226 () SeekEntryResult!11182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423697 (= res!959137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627227 mask!2608) lt!627227 lt!627229 mask!2608) lt!627226))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423697 (= lt!627226 (Intermediate!11182 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423697 (= lt!627227 (select (store (arr!46897 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423697 (= lt!627229 (array!97160 (store (arr!46897 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47447 a!2831)))))

(declare-fun b!1423698 () Bool)

(declare-fun res!959129 () Bool)

(assert (=> b!1423698 (=> (not res!959129) (not e!804690))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423698 (= res!959129 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46897 a!2831) j!81) a!2831 mask!2608) lt!627230))))

(declare-fun b!1423699 () Bool)

(declare-fun res!959130 () Bool)

(assert (=> b!1423699 (=> (not res!959130) (not e!804689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97159 (_ BitVec 32)) Bool)

(assert (=> b!1423699 (= res!959130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423700 () Bool)

(declare-fun e!804695 () Bool)

(assert (=> b!1423700 (= e!804690 (not e!804695))))

(declare-fun res!959140 () Bool)

(assert (=> b!1423700 (=> res!959140 e!804695)))

(assert (=> b!1423700 (= res!959140 (or (= (select (arr!46897 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46897 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46897 a!2831) index!585) (select (arr!46897 a!2831) j!81)) (= (select (store (arr!46897 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804692 () Bool)

(assert (=> b!1423700 e!804692))

(declare-fun res!959133 () Bool)

(assert (=> b!1423700 (=> (not res!959133) (not e!804692))))

(assert (=> b!1423700 (= res!959133 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48200 0))(
  ( (Unit!48201) )
))
(declare-fun lt!627228 () Unit!48200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48200)

(assert (=> b!1423700 (= lt!627228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423701 () Bool)

(assert (=> b!1423701 (= e!804689 e!804691)))

(declare-fun res!959136 () Bool)

(assert (=> b!1423701 (=> (not res!959136) (not e!804691))))

(assert (=> b!1423701 (= res!959136 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46897 a!2831) j!81) mask!2608) (select (arr!46897 a!2831) j!81) a!2831 mask!2608) lt!627230))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1423701 (= lt!627230 (Intermediate!11182 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423703 () Bool)

(declare-fun res!959131 () Bool)

(assert (=> b!1423703 (=> (not res!959131) (not e!804689))))

(assert (=> b!1423703 (= res!959131 (validKeyInArray!0 (select (arr!46897 a!2831) j!81)))))

(declare-fun b!1423704 () Bool)

(declare-fun res!959132 () Bool)

(assert (=> b!1423704 (=> (not res!959132) (not e!804690))))

(assert (=> b!1423704 (= res!959132 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627227 lt!627229 mask!2608) lt!627226))))

(declare-fun b!1423705 () Bool)

(declare-fun res!959143 () Bool)

(assert (=> b!1423705 (=> (not res!959143) (not e!804689))))

(assert (=> b!1423705 (= res!959143 (and (= (size!47447 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47447 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47447 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423706 () Bool)

(declare-fun res!959139 () Bool)

(assert (=> b!1423706 (=> (not res!959139) (not e!804689))))

(declare-datatypes ((List!33407 0))(
  ( (Nil!33404) (Cons!33403 (h!34705 (_ BitVec 64)) (t!48101 List!33407)) )
))
(declare-fun arrayNoDuplicates!0 (array!97159 (_ BitVec 32) List!33407) Bool)

(assert (=> b!1423706 (= res!959139 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33404))))

(declare-fun b!1423707 () Bool)

(assert (=> b!1423707 (= e!804695 e!804694)))

(declare-fun res!959141 () Bool)

(assert (=> b!1423707 (=> res!959141 e!804694)))

(assert (=> b!1423707 (= res!959141 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627231 #b00000000000000000000000000000000) (bvsge lt!627231 (size!47447 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423707 (= lt!627231 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423708 () Bool)

(assert (=> b!1423708 (= e!804694 true)))

(declare-fun lt!627225 () SeekEntryResult!11182)

(assert (=> b!1423708 (= lt!627225 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627231 lt!627227 lt!627229 mask!2608))))

(declare-fun b!1423702 () Bool)

(declare-fun res!959134 () Bool)

(assert (=> b!1423702 (=> (not res!959134) (not e!804690))))

(assert (=> b!1423702 (= res!959134 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!959128 () Bool)

(assert (=> start!122794 (=> (not res!959128) (not e!804689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122794 (= res!959128 (validMask!0 mask!2608))))

(assert (=> start!122794 e!804689))

(assert (=> start!122794 true))

(declare-fun array_inv!35925 (array!97159) Bool)

(assert (=> start!122794 (array_inv!35925 a!2831)))

(declare-fun b!1423709 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97159 (_ BitVec 32)) SeekEntryResult!11182)

(assert (=> b!1423709 (= e!804692 (= (seekEntryOrOpen!0 (select (arr!46897 a!2831) j!81) a!2831 mask!2608) (Found!11182 j!81)))))

(declare-fun b!1423710 () Bool)

(declare-fun res!959142 () Bool)

(assert (=> b!1423710 (=> (not res!959142) (not e!804689))))

(assert (=> b!1423710 (= res!959142 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47447 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47447 a!2831))))))

(assert (= (and start!122794 res!959128) b!1423705))

(assert (= (and b!1423705 res!959143) b!1423695))

(assert (= (and b!1423695 res!959138) b!1423703))

(assert (= (and b!1423703 res!959131) b!1423699))

(assert (= (and b!1423699 res!959130) b!1423706))

(assert (= (and b!1423706 res!959139) b!1423710))

(assert (= (and b!1423710 res!959142) b!1423701))

(assert (= (and b!1423701 res!959136) b!1423697))

(assert (= (and b!1423697 res!959137) b!1423698))

(assert (= (and b!1423698 res!959129) b!1423704))

(assert (= (and b!1423704 res!959132) b!1423702))

(assert (= (and b!1423702 res!959134) b!1423700))

(assert (= (and b!1423700 res!959133) b!1423709))

(assert (= (and b!1423700 (not res!959140)) b!1423707))

(assert (= (and b!1423707 (not res!959141)) b!1423696))

(assert (= (and b!1423696 (not res!959135)) b!1423708))

(declare-fun m!1314243 () Bool)

(assert (=> b!1423699 m!1314243))

(declare-fun m!1314245 () Bool)

(assert (=> b!1423704 m!1314245))

(declare-fun m!1314247 () Bool)

(assert (=> b!1423698 m!1314247))

(assert (=> b!1423698 m!1314247))

(declare-fun m!1314249 () Bool)

(assert (=> b!1423698 m!1314249))

(assert (=> b!1423701 m!1314247))

(assert (=> b!1423701 m!1314247))

(declare-fun m!1314251 () Bool)

(assert (=> b!1423701 m!1314251))

(assert (=> b!1423701 m!1314251))

(assert (=> b!1423701 m!1314247))

(declare-fun m!1314253 () Bool)

(assert (=> b!1423701 m!1314253))

(declare-fun m!1314255 () Bool)

(assert (=> b!1423700 m!1314255))

(declare-fun m!1314257 () Bool)

(assert (=> b!1423700 m!1314257))

(declare-fun m!1314259 () Bool)

(assert (=> b!1423700 m!1314259))

(declare-fun m!1314261 () Bool)

(assert (=> b!1423700 m!1314261))

(assert (=> b!1423700 m!1314247))

(declare-fun m!1314263 () Bool)

(assert (=> b!1423700 m!1314263))

(declare-fun m!1314265 () Bool)

(assert (=> b!1423708 m!1314265))

(declare-fun m!1314267 () Bool)

(assert (=> b!1423706 m!1314267))

(declare-fun m!1314269 () Bool)

(assert (=> b!1423707 m!1314269))

(assert (=> b!1423696 m!1314247))

(assert (=> b!1423696 m!1314247))

(declare-fun m!1314271 () Bool)

(assert (=> b!1423696 m!1314271))

(assert (=> b!1423703 m!1314247))

(assert (=> b!1423703 m!1314247))

(declare-fun m!1314273 () Bool)

(assert (=> b!1423703 m!1314273))

(declare-fun m!1314275 () Bool)

(assert (=> start!122794 m!1314275))

(declare-fun m!1314277 () Bool)

(assert (=> start!122794 m!1314277))

(assert (=> b!1423709 m!1314247))

(assert (=> b!1423709 m!1314247))

(declare-fun m!1314279 () Bool)

(assert (=> b!1423709 m!1314279))

(declare-fun m!1314281 () Bool)

(assert (=> b!1423697 m!1314281))

(assert (=> b!1423697 m!1314281))

(declare-fun m!1314283 () Bool)

(assert (=> b!1423697 m!1314283))

(assert (=> b!1423697 m!1314255))

(declare-fun m!1314285 () Bool)

(assert (=> b!1423697 m!1314285))

(declare-fun m!1314287 () Bool)

(assert (=> b!1423695 m!1314287))

(assert (=> b!1423695 m!1314287))

(declare-fun m!1314289 () Bool)

(assert (=> b!1423695 m!1314289))

(push 1)

