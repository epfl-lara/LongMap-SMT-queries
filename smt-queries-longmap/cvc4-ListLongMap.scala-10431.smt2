; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122752 () Bool)

(assert start!122752)

(declare-fun b!1422687 () Bool)

(declare-fun res!958128 () Bool)

(declare-fun e!804252 () Bool)

(assert (=> b!1422687 (=> (not res!958128) (not e!804252))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97117 0))(
  ( (array!97118 (arr!46876 (Array (_ BitVec 32) (_ BitVec 64))) (size!47426 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97117)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422687 (= res!958128 (and (= (size!47426 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47426 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47426 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!958129 () Bool)

(assert (=> start!122752 (=> (not res!958129) (not e!804252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122752 (= res!958129 (validMask!0 mask!2608))))

(assert (=> start!122752 e!804252))

(assert (=> start!122752 true))

(declare-fun array_inv!35904 (array!97117) Bool)

(assert (=> start!122752 (array_inv!35904 a!2831)))

(declare-fun b!1422688 () Bool)

(declare-fun res!958120 () Bool)

(assert (=> b!1422688 (=> (not res!958120) (not e!804252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97117 (_ BitVec 32)) Bool)

(assert (=> b!1422688 (= res!958120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422689 () Bool)

(declare-fun res!958125 () Bool)

(declare-fun e!804251 () Bool)

(assert (=> b!1422689 (=> res!958125 e!804251)))

(declare-datatypes ((SeekEntryResult!11161 0))(
  ( (MissingZero!11161 (index!47036 (_ BitVec 32))) (Found!11161 (index!47037 (_ BitVec 32))) (Intermediate!11161 (undefined!11973 Bool) (index!47038 (_ BitVec 32)) (x!128675 (_ BitVec 32))) (Undefined!11161) (MissingVacant!11161 (index!47039 (_ BitVec 32))) )
))
(declare-fun lt!626786 () SeekEntryResult!11161)

(declare-fun lt!626790 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97117 (_ BitVec 32)) SeekEntryResult!11161)

(assert (=> b!1422689 (= res!958125 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626790 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!626786)))))

(declare-fun b!1422690 () Bool)

(declare-fun res!958122 () Bool)

(assert (=> b!1422690 (=> (not res!958122) (not e!804252))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422690 (= res!958122 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47426 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47426 a!2831))))))

(declare-fun b!1422691 () Bool)

(declare-fun res!958123 () Bool)

(assert (=> b!1422691 (=> (not res!958123) (not e!804252))))

(declare-datatypes ((List!33386 0))(
  ( (Nil!33383) (Cons!33382 (h!34684 (_ BitVec 64)) (t!48080 List!33386)) )
))
(declare-fun arrayNoDuplicates!0 (array!97117 (_ BitVec 32) List!33386) Bool)

(assert (=> b!1422691 (= res!958123 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33383))))

(declare-fun b!1422692 () Bool)

(declare-fun res!958135 () Bool)

(declare-fun e!804250 () Bool)

(assert (=> b!1422692 (=> (not res!958135) (not e!804250))))

(declare-fun lt!626785 () array!97117)

(declare-fun lt!626789 () SeekEntryResult!11161)

(declare-fun lt!626784 () (_ BitVec 64))

(assert (=> b!1422692 (= res!958135 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626784 lt!626785 mask!2608) lt!626789))))

(declare-fun b!1422693 () Bool)

(declare-fun res!958127 () Bool)

(assert (=> b!1422693 (=> (not res!958127) (not e!804250))))

(assert (=> b!1422693 (= res!958127 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!626786))))

(declare-fun b!1422694 () Bool)

(declare-fun res!958121 () Bool)

(assert (=> b!1422694 (=> (not res!958121) (not e!804252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422694 (= res!958121 (validKeyInArray!0 (select (arr!46876 a!2831) i!982)))))

(declare-fun b!1422695 () Bool)

(assert (=> b!1422695 (= e!804251 true)))

(declare-fun lt!626787 () SeekEntryResult!11161)

(assert (=> b!1422695 (= lt!626787 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626790 lt!626784 lt!626785 mask!2608))))

(declare-fun b!1422696 () Bool)

(declare-fun e!804253 () Bool)

(assert (=> b!1422696 (= e!804253 e!804250)))

(declare-fun res!958126 () Bool)

(assert (=> b!1422696 (=> (not res!958126) (not e!804250))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422696 (= res!958126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626784 mask!2608) lt!626784 lt!626785 mask!2608) lt!626789))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422696 (= lt!626789 (Intermediate!11161 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422696 (= lt!626784 (select (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422696 (= lt!626785 (array!97118 (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47426 a!2831)))))

(declare-fun b!1422697 () Bool)

(declare-fun e!804254 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97117 (_ BitVec 32)) SeekEntryResult!11161)

(assert (=> b!1422697 (= e!804254 (= (seekEntryOrOpen!0 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) (Found!11161 j!81)))))

(declare-fun b!1422698 () Bool)

(assert (=> b!1422698 (= e!804252 e!804253)))

(declare-fun res!958124 () Bool)

(assert (=> b!1422698 (=> (not res!958124) (not e!804253))))

(assert (=> b!1422698 (= res!958124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46876 a!2831) j!81) mask!2608) (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!626786))))

(assert (=> b!1422698 (= lt!626786 (Intermediate!11161 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422699 () Bool)

(declare-fun res!958134 () Bool)

(assert (=> b!1422699 (=> (not res!958134) (not e!804250))))

(assert (=> b!1422699 (= res!958134 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422700 () Bool)

(declare-fun e!804249 () Bool)

(assert (=> b!1422700 (= e!804249 e!804251)))

(declare-fun res!958131 () Bool)

(assert (=> b!1422700 (=> res!958131 e!804251)))

(assert (=> b!1422700 (= res!958131 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626790 #b00000000000000000000000000000000) (bvsge lt!626790 (size!47426 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422700 (= lt!626790 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422701 () Bool)

(assert (=> b!1422701 (= e!804250 (not e!804249))))

(declare-fun res!958133 () Bool)

(assert (=> b!1422701 (=> res!958133 e!804249)))

(assert (=> b!1422701 (= res!958133 (or (= (select (arr!46876 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46876 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46876 a!2831) index!585) (select (arr!46876 a!2831) j!81)) (= (select (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422701 e!804254))

(declare-fun res!958132 () Bool)

(assert (=> b!1422701 (=> (not res!958132) (not e!804254))))

(assert (=> b!1422701 (= res!958132 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48158 0))(
  ( (Unit!48159) )
))
(declare-fun lt!626788 () Unit!48158)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48158)

(assert (=> b!1422701 (= lt!626788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422702 () Bool)

(declare-fun res!958130 () Bool)

(assert (=> b!1422702 (=> (not res!958130) (not e!804252))))

(assert (=> b!1422702 (= res!958130 (validKeyInArray!0 (select (arr!46876 a!2831) j!81)))))

(assert (= (and start!122752 res!958129) b!1422687))

(assert (= (and b!1422687 res!958128) b!1422694))

(assert (= (and b!1422694 res!958121) b!1422702))

(assert (= (and b!1422702 res!958130) b!1422688))

(assert (= (and b!1422688 res!958120) b!1422691))

(assert (= (and b!1422691 res!958123) b!1422690))

(assert (= (and b!1422690 res!958122) b!1422698))

(assert (= (and b!1422698 res!958124) b!1422696))

(assert (= (and b!1422696 res!958126) b!1422693))

(assert (= (and b!1422693 res!958127) b!1422692))

(assert (= (and b!1422692 res!958135) b!1422699))

(assert (= (and b!1422699 res!958134) b!1422701))

(assert (= (and b!1422701 res!958132) b!1422697))

(assert (= (and b!1422701 (not res!958133)) b!1422700))

(assert (= (and b!1422700 (not res!958131)) b!1422689))

(assert (= (and b!1422689 (not res!958125)) b!1422695))

(declare-fun m!1313235 () Bool)

(assert (=> b!1422691 m!1313235))

(declare-fun m!1313237 () Bool)

(assert (=> b!1422701 m!1313237))

(declare-fun m!1313239 () Bool)

(assert (=> b!1422701 m!1313239))

(declare-fun m!1313241 () Bool)

(assert (=> b!1422701 m!1313241))

(declare-fun m!1313243 () Bool)

(assert (=> b!1422701 m!1313243))

(declare-fun m!1313245 () Bool)

(assert (=> b!1422701 m!1313245))

(declare-fun m!1313247 () Bool)

(assert (=> b!1422701 m!1313247))

(assert (=> b!1422702 m!1313245))

(assert (=> b!1422702 m!1313245))

(declare-fun m!1313249 () Bool)

(assert (=> b!1422702 m!1313249))

(declare-fun m!1313251 () Bool)

(assert (=> b!1422700 m!1313251))

(declare-fun m!1313253 () Bool)

(assert (=> b!1422695 m!1313253))

(declare-fun m!1313255 () Bool)

(assert (=> b!1422688 m!1313255))

(assert (=> b!1422697 m!1313245))

(assert (=> b!1422697 m!1313245))

(declare-fun m!1313257 () Bool)

(assert (=> b!1422697 m!1313257))

(declare-fun m!1313259 () Bool)

(assert (=> start!122752 m!1313259))

(declare-fun m!1313261 () Bool)

(assert (=> start!122752 m!1313261))

(declare-fun m!1313263 () Bool)

(assert (=> b!1422694 m!1313263))

(assert (=> b!1422694 m!1313263))

(declare-fun m!1313265 () Bool)

(assert (=> b!1422694 m!1313265))

(assert (=> b!1422693 m!1313245))

(assert (=> b!1422693 m!1313245))

(declare-fun m!1313267 () Bool)

(assert (=> b!1422693 m!1313267))

(declare-fun m!1313269 () Bool)

(assert (=> b!1422696 m!1313269))

(assert (=> b!1422696 m!1313269))

(declare-fun m!1313271 () Bool)

(assert (=> b!1422696 m!1313271))

(assert (=> b!1422696 m!1313237))

(declare-fun m!1313273 () Bool)

(assert (=> b!1422696 m!1313273))

(assert (=> b!1422698 m!1313245))

(assert (=> b!1422698 m!1313245))

(declare-fun m!1313275 () Bool)

(assert (=> b!1422698 m!1313275))

(assert (=> b!1422698 m!1313275))

(assert (=> b!1422698 m!1313245))

(declare-fun m!1313277 () Bool)

(assert (=> b!1422698 m!1313277))

(declare-fun m!1313279 () Bool)

(assert (=> b!1422692 m!1313279))

(assert (=> b!1422689 m!1313245))

(assert (=> b!1422689 m!1313245))

(declare-fun m!1313281 () Bool)

(assert (=> b!1422689 m!1313281))

(push 1)

