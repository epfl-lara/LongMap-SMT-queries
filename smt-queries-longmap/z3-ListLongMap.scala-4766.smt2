; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65784 () Bool)

(assert start!65784)

(declare-fun b!752790 () Bool)

(declare-fun e!419985 () Bool)

(declare-fun e!419989 () Bool)

(assert (=> b!752790 (= e!419985 e!419989)))

(declare-fun res!508125 () Bool)

(assert (=> b!752790 (=> (not res!508125) (not e!419989))))

(declare-datatypes ((SeekEntryResult!7579 0))(
  ( (MissingZero!7579 (index!32684 (_ BitVec 32))) (Found!7579 (index!32685 (_ BitVec 32))) (Intermediate!7579 (undefined!8391 Bool) (index!32686 (_ BitVec 32)) (x!63765 (_ BitVec 32))) (Undefined!7579) (MissingVacant!7579 (index!32687 (_ BitVec 32))) )
))
(declare-fun lt!334818 () SeekEntryResult!7579)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752790 (= res!508125 (or (= lt!334818 (MissingZero!7579 i!1173)) (= lt!334818 (MissingVacant!7579 i!1173))))))

(declare-datatypes ((array!41827 0))(
  ( (array!41828 (arr!20023 (Array (_ BitVec 32) (_ BitVec 64))) (size!20443 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41827)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41827 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!752790 (= lt!334818 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752791 () Bool)

(declare-datatypes ((Unit!25873 0))(
  ( (Unit!25874) )
))
(declare-fun e!419990 () Unit!25873)

(declare-fun Unit!25875 () Unit!25873)

(assert (=> b!752791 (= e!419990 Unit!25875)))

(assert (=> b!752791 false))

(declare-fun b!752792 () Bool)

(declare-fun e!419982 () Bool)

(declare-fun e!419988 () Bool)

(assert (=> b!752792 (= e!419982 e!419988)))

(declare-fun res!508130 () Bool)

(assert (=> b!752792 (=> res!508130 e!419988)))

(declare-fun lt!334811 () (_ BitVec 64))

(declare-fun lt!334816 () (_ BitVec 64))

(assert (=> b!752792 (= res!508130 (= lt!334811 lt!334816))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!752792 (= lt!334811 (select (store (arr!20023 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752793 () Bool)

(assert (=> b!752793 (= e!419988 true)))

(declare-fun e!419987 () Bool)

(assert (=> b!752793 e!419987))

(declare-fun res!508117 () Bool)

(assert (=> b!752793 (=> (not res!508117) (not e!419987))))

(assert (=> b!752793 (= res!508117 (= lt!334811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334815 () Unit!25873)

(assert (=> b!752793 (= lt!334815 e!419990)))

(declare-fun c!82720 () Bool)

(assert (=> b!752793 (= c!82720 (= lt!334811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752794 () Bool)

(declare-fun Unit!25876 () Unit!25873)

(assert (=> b!752794 (= e!419990 Unit!25876)))

(declare-fun res!508124 () Bool)

(assert (=> start!65784 (=> (not res!508124) (not e!419985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65784 (= res!508124 (validMask!0 mask!3328))))

(assert (=> start!65784 e!419985))

(assert (=> start!65784 true))

(declare-fun array_inv!15882 (array!41827) Bool)

(assert (=> start!65784 (array_inv!15882 a!3186)))

(declare-fun b!752795 () Bool)

(declare-fun e!419984 () Bool)

(declare-fun e!419991 () Bool)

(assert (=> b!752795 (= e!419984 e!419991)))

(declare-fun res!508126 () Bool)

(assert (=> b!752795 (=> (not res!508126) (not e!419991))))

(declare-fun lt!334813 () SeekEntryResult!7579)

(declare-fun lt!334817 () SeekEntryResult!7579)

(assert (=> b!752795 (= res!508126 (= lt!334813 lt!334817))))

(declare-fun lt!334809 () array!41827)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41827 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!752795 (= lt!334817 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334816 lt!334809 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752795 (= lt!334813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334816 mask!3328) lt!334816 lt!334809 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!752795 (= lt!334816 (select (store (arr!20023 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752795 (= lt!334809 (array!41828 (store (arr!20023 a!3186) i!1173 k0!2102) (size!20443 a!3186)))))

(declare-fun b!752796 () Bool)

(declare-fun e!419983 () Bool)

(assert (=> b!752796 (= e!419991 (not e!419983))))

(declare-fun res!508127 () Bool)

(assert (=> b!752796 (=> res!508127 e!419983)))

(get-info :version)

(assert (=> b!752796 (= res!508127 (or (not ((_ is Intermediate!7579) lt!334817)) (bvslt x!1131 (x!63765 lt!334817)) (not (= x!1131 (x!63765 lt!334817))) (not (= index!1321 (index!32686 lt!334817)))))))

(declare-fun e!419986 () Bool)

(assert (=> b!752796 e!419986))

(declare-fun res!508134 () Bool)

(assert (=> b!752796 (=> (not res!508134) (not e!419986))))

(declare-fun lt!334814 () SeekEntryResult!7579)

(declare-fun lt!334810 () SeekEntryResult!7579)

(assert (=> b!752796 (= res!508134 (= lt!334814 lt!334810))))

(assert (=> b!752796 (= lt!334810 (Found!7579 j!159))))

(assert (=> b!752796 (= lt!334814 (seekEntryOrOpen!0 (select (arr!20023 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41827 (_ BitVec 32)) Bool)

(assert (=> b!752796 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334807 () Unit!25873)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25873)

(assert (=> b!752796 (= lt!334807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752797 () Bool)

(declare-fun res!508135 () Bool)

(assert (=> b!752797 (=> (not res!508135) (not e!419984))))

(declare-fun e!419981 () Bool)

(assert (=> b!752797 (= res!508135 e!419981)))

(declare-fun c!82721 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752797 (= c!82721 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752798 () Bool)

(declare-fun res!508120 () Bool)

(assert (=> b!752798 (=> (not res!508120) (not e!419984))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!752798 (= res!508120 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20023 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752799 () Bool)

(declare-fun res!508122 () Bool)

(assert (=> b!752799 (=> (not res!508122) (not e!419987))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41827 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!752799 (= res!508122 (= (seekEntryOrOpen!0 lt!334816 lt!334809 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334816 lt!334809 mask!3328)))))

(declare-fun lt!334812 () SeekEntryResult!7579)

(declare-fun b!752800 () Bool)

(assert (=> b!752800 (= e!419981 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20023 a!3186) j!159) a!3186 mask!3328) lt!334812))))

(declare-fun b!752801 () Bool)

(declare-fun res!508119 () Bool)

(assert (=> b!752801 (=> (not res!508119) (not e!419989))))

(assert (=> b!752801 (= res!508119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752802 () Bool)

(declare-fun res!508123 () Bool)

(assert (=> b!752802 (=> (not res!508123) (not e!419985))))

(declare-fun arrayContainsKey!0 (array!41827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752802 (= res!508123 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752803 () Bool)

(assert (=> b!752803 (= e!419986 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20023 a!3186) j!159) a!3186 mask!3328) lt!334810))))

(declare-fun b!752804 () Bool)

(assert (=> b!752804 (= e!419989 e!419984)))

(declare-fun res!508128 () Bool)

(assert (=> b!752804 (=> (not res!508128) (not e!419984))))

(assert (=> b!752804 (= res!508128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20023 a!3186) j!159) mask!3328) (select (arr!20023 a!3186) j!159) a!3186 mask!3328) lt!334812))))

(assert (=> b!752804 (= lt!334812 (Intermediate!7579 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752805 () Bool)

(declare-fun lt!334808 () SeekEntryResult!7579)

(assert (=> b!752805 (= e!419987 (= lt!334814 lt!334808))))

(declare-fun b!752806 () Bool)

(declare-fun res!508121 () Bool)

(assert (=> b!752806 (=> (not res!508121) (not e!419989))))

(declare-datatypes ((List!13932 0))(
  ( (Nil!13929) (Cons!13928 (h!15006 (_ BitVec 64)) (t!20239 List!13932)) )
))
(declare-fun arrayNoDuplicates!0 (array!41827 (_ BitVec 32) List!13932) Bool)

(assert (=> b!752806 (= res!508121 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13929))))

(declare-fun b!752807 () Bool)

(assert (=> b!752807 (= e!419981 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20023 a!3186) j!159) a!3186 mask!3328) (Found!7579 j!159)))))

(declare-fun b!752808 () Bool)

(declare-fun res!508132 () Bool)

(assert (=> b!752808 (=> (not res!508132) (not e!419985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752808 (= res!508132 (validKeyInArray!0 k0!2102))))

(declare-fun b!752809 () Bool)

(declare-fun res!508129 () Bool)

(assert (=> b!752809 (=> (not res!508129) (not e!419985))))

(assert (=> b!752809 (= res!508129 (and (= (size!20443 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20443 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20443 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752810 () Bool)

(declare-fun res!508133 () Bool)

(assert (=> b!752810 (=> (not res!508133) (not e!419989))))

(assert (=> b!752810 (= res!508133 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20443 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20443 a!3186))))))

(declare-fun b!752811 () Bool)

(declare-fun res!508118 () Bool)

(assert (=> b!752811 (=> (not res!508118) (not e!419985))))

(assert (=> b!752811 (= res!508118 (validKeyInArray!0 (select (arr!20023 a!3186) j!159)))))

(declare-fun b!752812 () Bool)

(assert (=> b!752812 (= e!419983 e!419982)))

(declare-fun res!508131 () Bool)

(assert (=> b!752812 (=> res!508131 e!419982)))

(assert (=> b!752812 (= res!508131 (not (= lt!334808 lt!334810)))))

(assert (=> b!752812 (= lt!334808 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20023 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65784 res!508124) b!752809))

(assert (= (and b!752809 res!508129) b!752811))

(assert (= (and b!752811 res!508118) b!752808))

(assert (= (and b!752808 res!508132) b!752802))

(assert (= (and b!752802 res!508123) b!752790))

(assert (= (and b!752790 res!508125) b!752801))

(assert (= (and b!752801 res!508119) b!752806))

(assert (= (and b!752806 res!508121) b!752810))

(assert (= (and b!752810 res!508133) b!752804))

(assert (= (and b!752804 res!508128) b!752798))

(assert (= (and b!752798 res!508120) b!752797))

(assert (= (and b!752797 c!82721) b!752800))

(assert (= (and b!752797 (not c!82721)) b!752807))

(assert (= (and b!752797 res!508135) b!752795))

(assert (= (and b!752795 res!508126) b!752796))

(assert (= (and b!752796 res!508134) b!752803))

(assert (= (and b!752796 (not res!508127)) b!752812))

(assert (= (and b!752812 (not res!508131)) b!752792))

(assert (= (and b!752792 (not res!508130)) b!752793))

(assert (= (and b!752793 c!82720) b!752791))

(assert (= (and b!752793 (not c!82720)) b!752794))

(assert (= (and b!752793 res!508117) b!752799))

(assert (= (and b!752799 res!508122) b!752805))

(declare-fun m!702243 () Bool)

(assert (=> b!752807 m!702243))

(assert (=> b!752807 m!702243))

(declare-fun m!702245 () Bool)

(assert (=> b!752807 m!702245))

(assert (=> b!752812 m!702243))

(assert (=> b!752812 m!702243))

(assert (=> b!752812 m!702245))

(assert (=> b!752800 m!702243))

(assert (=> b!752800 m!702243))

(declare-fun m!702247 () Bool)

(assert (=> b!752800 m!702247))

(declare-fun m!702249 () Bool)

(assert (=> b!752802 m!702249))

(declare-fun m!702251 () Bool)

(assert (=> b!752795 m!702251))

(declare-fun m!702253 () Bool)

(assert (=> b!752795 m!702253))

(declare-fun m!702255 () Bool)

(assert (=> b!752795 m!702255))

(assert (=> b!752795 m!702253))

(declare-fun m!702257 () Bool)

(assert (=> b!752795 m!702257))

(declare-fun m!702259 () Bool)

(assert (=> b!752795 m!702259))

(declare-fun m!702261 () Bool)

(assert (=> start!65784 m!702261))

(declare-fun m!702263 () Bool)

(assert (=> start!65784 m!702263))

(assert (=> b!752803 m!702243))

(assert (=> b!752803 m!702243))

(declare-fun m!702265 () Bool)

(assert (=> b!752803 m!702265))

(assert (=> b!752796 m!702243))

(assert (=> b!752796 m!702243))

(declare-fun m!702267 () Bool)

(assert (=> b!752796 m!702267))

(declare-fun m!702269 () Bool)

(assert (=> b!752796 m!702269))

(declare-fun m!702271 () Bool)

(assert (=> b!752796 m!702271))

(declare-fun m!702273 () Bool)

(assert (=> b!752798 m!702273))

(declare-fun m!702275 () Bool)

(assert (=> b!752801 m!702275))

(assert (=> b!752804 m!702243))

(assert (=> b!752804 m!702243))

(declare-fun m!702277 () Bool)

(assert (=> b!752804 m!702277))

(assert (=> b!752804 m!702277))

(assert (=> b!752804 m!702243))

(declare-fun m!702279 () Bool)

(assert (=> b!752804 m!702279))

(assert (=> b!752792 m!702257))

(declare-fun m!702281 () Bool)

(assert (=> b!752792 m!702281))

(declare-fun m!702283 () Bool)

(assert (=> b!752790 m!702283))

(declare-fun m!702285 () Bool)

(assert (=> b!752799 m!702285))

(declare-fun m!702287 () Bool)

(assert (=> b!752799 m!702287))

(assert (=> b!752811 m!702243))

(assert (=> b!752811 m!702243))

(declare-fun m!702289 () Bool)

(assert (=> b!752811 m!702289))

(declare-fun m!702291 () Bool)

(assert (=> b!752806 m!702291))

(declare-fun m!702293 () Bool)

(assert (=> b!752808 m!702293))

(check-sat (not b!752795) (not b!752790) (not b!752807) (not b!752800) (not b!752799) (not b!752806) (not b!752808) (not b!752812) (not b!752811) (not b!752802) (not start!65784) (not b!752803) (not b!752804) (not b!752801) (not b!752796))
(check-sat)
