; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65180 () Bool)

(assert start!65180)

(declare-fun b!737730 () Bool)

(declare-fun res!495985 () Bool)

(declare-fun e!412592 () Bool)

(assert (=> b!737730 (=> (not res!495985) (not e!412592))))

(declare-datatypes ((array!41370 0))(
  ( (array!41371 (arr!19799 (Array (_ BitVec 32) (_ BitVec 64))) (size!20220 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41370)

(declare-datatypes ((List!13840 0))(
  ( (Nil!13837) (Cons!13836 (h!14908 (_ BitVec 64)) (t!20146 List!13840)) )
))
(declare-fun arrayNoDuplicates!0 (array!41370 (_ BitVec 32) List!13840) Bool)

(assert (=> b!737730 (= res!495985 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13837))))

(declare-fun b!737731 () Bool)

(declare-fun res!495990 () Bool)

(declare-fun e!412591 () Bool)

(assert (=> b!737731 (=> (not res!495990) (not e!412591))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737731 (= res!495990 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7396 0))(
  ( (MissingZero!7396 (index!31952 (_ BitVec 32))) (Found!7396 (index!31953 (_ BitVec 32))) (Intermediate!7396 (undefined!8208 Bool) (index!31954 (_ BitVec 32)) (x!62957 (_ BitVec 32))) (Undefined!7396) (MissingVacant!7396 (index!31955 (_ BitVec 32))) )
))
(declare-fun lt!327257 () SeekEntryResult!7396)

(declare-fun b!737732 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!412589 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41370 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!737732 (= e!412589 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327257))))

(declare-fun b!737733 () Bool)

(declare-fun res!495974 () Bool)

(declare-fun e!412596 () Bool)

(assert (=> b!737733 (=> (not res!495974) (not e!412596))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737733 (= res!495974 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19799 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!327266 () (_ BitVec 32))

(declare-fun b!737734 () Bool)

(declare-fun lt!327264 () SeekEntryResult!7396)

(declare-fun e!412599 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41370 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!737734 (= e!412599 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327266 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327264)))))

(declare-fun b!737735 () Bool)

(declare-fun res!495973 () Bool)

(assert (=> b!737735 (=> (not res!495973) (not e!412591))))

(declare-fun arrayContainsKey!0 (array!41370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737735 (= res!495973 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737736 () Bool)

(declare-fun res!495987 () Bool)

(assert (=> b!737736 (=> (not res!495987) (not e!412591))))

(assert (=> b!737736 (= res!495987 (validKeyInArray!0 (select (arr!19799 a!3186) j!159)))))

(declare-fun b!737737 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!412595 () Bool)

(assert (=> b!737737 (= e!412595 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) (Found!7396 j!159)))))

(declare-fun b!737738 () Bool)

(declare-fun res!495982 () Bool)

(declare-fun e!412594 () Bool)

(assert (=> b!737738 (=> res!495982 e!412594)))

(assert (=> b!737738 (= res!495982 e!412599)))

(declare-fun c!81261 () Bool)

(declare-fun lt!327268 () Bool)

(assert (=> b!737738 (= c!81261 lt!327268)))

(declare-fun b!737739 () Bool)

(assert (=> b!737739 (= e!412594 true)))

(declare-fun lt!327258 () SeekEntryResult!7396)

(declare-fun lt!327259 () array!41370)

(declare-fun lt!327260 () (_ BitVec 64))

(assert (=> b!737739 (= lt!327258 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327266 lt!327260 lt!327259 mask!3328))))

(declare-fun b!737740 () Bool)

(declare-fun e!412600 () Bool)

(declare-fun e!412598 () Bool)

(assert (=> b!737740 (= e!412600 (not e!412598))))

(declare-fun res!495976 () Bool)

(assert (=> b!737740 (=> res!495976 e!412598)))

(declare-fun lt!327267 () SeekEntryResult!7396)

(get-info :version)

(assert (=> b!737740 (= res!495976 (or (not ((_ is Intermediate!7396) lt!327267)) (bvsge x!1131 (x!62957 lt!327267))))))

(declare-fun lt!327269 () SeekEntryResult!7396)

(assert (=> b!737740 (= lt!327269 (Found!7396 j!159))))

(declare-fun e!412597 () Bool)

(assert (=> b!737740 e!412597))

(declare-fun res!495975 () Bool)

(assert (=> b!737740 (=> (not res!495975) (not e!412597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41370 (_ BitVec 32)) Bool)

(assert (=> b!737740 (= res!495975 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25160 0))(
  ( (Unit!25161) )
))
(declare-fun lt!327256 () Unit!25160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25160)

(assert (=> b!737740 (= lt!327256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737741 () Bool)

(declare-fun res!495988 () Bool)

(assert (=> b!737741 (=> (not res!495988) (not e!412591))))

(assert (=> b!737741 (= res!495988 (and (= (size!20220 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20220 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20220 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737742 () Bool)

(assert (=> b!737742 (= e!412596 e!412600)))

(declare-fun res!495989 () Bool)

(assert (=> b!737742 (=> (not res!495989) (not e!412600))))

(declare-fun lt!327261 () SeekEntryResult!7396)

(assert (=> b!737742 (= res!495989 (= lt!327261 lt!327267))))

(assert (=> b!737742 (= lt!327267 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327260 lt!327259 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737742 (= lt!327261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327260 mask!3328) lt!327260 lt!327259 mask!3328))))

(assert (=> b!737742 (= lt!327260 (select (store (arr!19799 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737742 (= lt!327259 (array!41371 (store (arr!19799 a!3186) i!1173 k0!2102) (size!20220 a!3186)))))

(declare-fun b!737743 () Bool)

(declare-fun res!495978 () Bool)

(assert (=> b!737743 (=> (not res!495978) (not e!412592))))

(assert (=> b!737743 (= res!495978 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20220 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20220 a!3186))))))

(declare-fun b!737744 () Bool)

(declare-fun res!495980 () Bool)

(assert (=> b!737744 (=> (not res!495980) (not e!412596))))

(assert (=> b!737744 (= res!495980 e!412595)))

(declare-fun c!81260 () Bool)

(assert (=> b!737744 (= c!81260 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!495986 () Bool)

(assert (=> start!65180 (=> (not res!495986) (not e!412591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65180 (= res!495986 (validMask!0 mask!3328))))

(assert (=> start!65180 e!412591))

(assert (=> start!65180 true))

(declare-fun array_inv!15682 (array!41370) Bool)

(assert (=> start!65180 (array_inv!15682 a!3186)))

(declare-fun b!737745 () Bool)

(declare-fun e!412593 () Unit!25160)

(declare-fun Unit!25162 () Unit!25160)

(assert (=> b!737745 (= e!412593 Unit!25162)))

(assert (=> b!737745 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327266 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327264)))

(declare-fun b!737746 () Bool)

(assert (=> b!737746 (= e!412591 e!412592)))

(declare-fun res!495983 () Bool)

(assert (=> b!737746 (=> (not res!495983) (not e!412592))))

(declare-fun lt!327263 () SeekEntryResult!7396)

(assert (=> b!737746 (= res!495983 (or (= lt!327263 (MissingZero!7396 i!1173)) (= lt!327263 (MissingVacant!7396 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41370 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!737746 (= lt!327263 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737747 () Bool)

(assert (=> b!737747 (= e!412598 e!412594)))

(declare-fun res!495977 () Bool)

(assert (=> b!737747 (=> res!495977 e!412594)))

(assert (=> b!737747 (= res!495977 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327266 #b00000000000000000000000000000000) (bvsge lt!327266 (size!20220 a!3186))))))

(declare-fun lt!327265 () Unit!25160)

(assert (=> b!737747 (= lt!327265 e!412593)))

(declare-fun c!81259 () Bool)

(assert (=> b!737747 (= c!81259 lt!327268)))

(assert (=> b!737747 (= lt!327268 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737747 (= lt!327266 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737748 () Bool)

(declare-fun res!495981 () Bool)

(assert (=> b!737748 (=> (not res!495981) (not e!412592))))

(assert (=> b!737748 (= res!495981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737749 () Bool)

(assert (=> b!737749 (= e!412597 e!412589)))

(declare-fun res!495984 () Bool)

(assert (=> b!737749 (=> (not res!495984) (not e!412589))))

(assert (=> b!737749 (= res!495984 (= (seekEntryOrOpen!0 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327257))))

(assert (=> b!737749 (= lt!327257 (Found!7396 j!159))))

(declare-fun b!737750 () Bool)

(assert (=> b!737750 (= e!412592 e!412596)))

(declare-fun res!495979 () Bool)

(assert (=> b!737750 (=> (not res!495979) (not e!412596))))

(assert (=> b!737750 (= res!495979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19799 a!3186) j!159) mask!3328) (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327264))))

(assert (=> b!737750 (= lt!327264 (Intermediate!7396 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737751 () Bool)

(declare-fun Unit!25163 () Unit!25160)

(assert (=> b!737751 (= e!412593 Unit!25163)))

(declare-fun lt!327262 () SeekEntryResult!7396)

(assert (=> b!737751 (= lt!327262 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737751 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327266 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327269)))

(declare-fun b!737752 () Bool)

(assert (=> b!737752 (= e!412595 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327264))))

(declare-fun b!737753 () Bool)

(assert (=> b!737753 (= e!412599 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327266 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327269)))))

(assert (= (and start!65180 res!495986) b!737741))

(assert (= (and b!737741 res!495988) b!737736))

(assert (= (and b!737736 res!495987) b!737731))

(assert (= (and b!737731 res!495990) b!737735))

(assert (= (and b!737735 res!495973) b!737746))

(assert (= (and b!737746 res!495983) b!737748))

(assert (= (and b!737748 res!495981) b!737730))

(assert (= (and b!737730 res!495985) b!737743))

(assert (= (and b!737743 res!495978) b!737750))

(assert (= (and b!737750 res!495979) b!737733))

(assert (= (and b!737733 res!495974) b!737744))

(assert (= (and b!737744 c!81260) b!737752))

(assert (= (and b!737744 (not c!81260)) b!737737))

(assert (= (and b!737744 res!495980) b!737742))

(assert (= (and b!737742 res!495989) b!737740))

(assert (= (and b!737740 res!495975) b!737749))

(assert (= (and b!737749 res!495984) b!737732))

(assert (= (and b!737740 (not res!495976)) b!737747))

(assert (= (and b!737747 c!81259) b!737745))

(assert (= (and b!737747 (not c!81259)) b!737751))

(assert (= (and b!737747 (not res!495977)) b!737738))

(assert (= (and b!737738 c!81261) b!737734))

(assert (= (and b!737738 (not c!81261)) b!737753))

(assert (= (and b!737738 (not res!495982)) b!737739))

(declare-fun m!688967 () Bool)

(assert (=> b!737732 m!688967))

(assert (=> b!737732 m!688967))

(declare-fun m!688969 () Bool)

(assert (=> b!737732 m!688969))

(assert (=> b!737737 m!688967))

(assert (=> b!737737 m!688967))

(declare-fun m!688971 () Bool)

(assert (=> b!737737 m!688971))

(declare-fun m!688973 () Bool)

(assert (=> b!737731 m!688973))

(declare-fun m!688975 () Bool)

(assert (=> b!737747 m!688975))

(assert (=> b!737752 m!688967))

(assert (=> b!737752 m!688967))

(declare-fun m!688977 () Bool)

(assert (=> b!737752 m!688977))

(declare-fun m!688979 () Bool)

(assert (=> b!737746 m!688979))

(declare-fun m!688981 () Bool)

(assert (=> b!737735 m!688981))

(declare-fun m!688983 () Bool)

(assert (=> b!737730 m!688983))

(declare-fun m!688985 () Bool)

(assert (=> b!737740 m!688985))

(declare-fun m!688987 () Bool)

(assert (=> b!737740 m!688987))

(assert (=> b!737734 m!688967))

(assert (=> b!737734 m!688967))

(declare-fun m!688989 () Bool)

(assert (=> b!737734 m!688989))

(declare-fun m!688991 () Bool)

(assert (=> b!737733 m!688991))

(declare-fun m!688993 () Bool)

(assert (=> b!737748 m!688993))

(assert (=> b!737736 m!688967))

(assert (=> b!737736 m!688967))

(declare-fun m!688995 () Bool)

(assert (=> b!737736 m!688995))

(assert (=> b!737745 m!688967))

(assert (=> b!737745 m!688967))

(assert (=> b!737745 m!688989))

(declare-fun m!688997 () Bool)

(assert (=> b!737739 m!688997))

(assert (=> b!737753 m!688967))

(assert (=> b!737753 m!688967))

(declare-fun m!688999 () Bool)

(assert (=> b!737753 m!688999))

(assert (=> b!737750 m!688967))

(assert (=> b!737750 m!688967))

(declare-fun m!689001 () Bool)

(assert (=> b!737750 m!689001))

(assert (=> b!737750 m!689001))

(assert (=> b!737750 m!688967))

(declare-fun m!689003 () Bool)

(assert (=> b!737750 m!689003))

(declare-fun m!689005 () Bool)

(assert (=> start!65180 m!689005))

(declare-fun m!689007 () Bool)

(assert (=> start!65180 m!689007))

(assert (=> b!737749 m!688967))

(assert (=> b!737749 m!688967))

(declare-fun m!689009 () Bool)

(assert (=> b!737749 m!689009))

(declare-fun m!689011 () Bool)

(assert (=> b!737742 m!689011))

(declare-fun m!689013 () Bool)

(assert (=> b!737742 m!689013))

(assert (=> b!737742 m!689011))

(declare-fun m!689015 () Bool)

(assert (=> b!737742 m!689015))

(declare-fun m!689017 () Bool)

(assert (=> b!737742 m!689017))

(declare-fun m!689019 () Bool)

(assert (=> b!737742 m!689019))

(assert (=> b!737751 m!688967))

(assert (=> b!737751 m!688967))

(assert (=> b!737751 m!688971))

(assert (=> b!737751 m!688967))

(assert (=> b!737751 m!688999))

(check-sat (not b!737734) (not b!737753) (not b!737752) (not b!737732) (not b!737746) (not b!737745) (not b!737739) (not b!737747) (not b!737740) (not b!737736) (not b!737749) (not b!737731) (not b!737742) (not b!737737) (not b!737748) (not b!737751) (not b!737750) (not b!737735) (not start!65180) (not b!737730))
(check-sat)
