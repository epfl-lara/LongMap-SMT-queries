; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45270 () Bool)

(assert start!45270)

(declare-fun b!497211 () Bool)

(declare-fun e!291423 () Bool)

(declare-fun e!291428 () Bool)

(assert (=> b!497211 (= e!291423 e!291428)))

(declare-fun res!299741 () Bool)

(assert (=> b!497211 (=> (not res!299741) (not e!291428))))

(declare-datatypes ((SeekEntryResult!3931 0))(
  ( (MissingZero!3931 (index!17903 (_ BitVec 32))) (Found!3931 (index!17904 (_ BitVec 32))) (Intermediate!3931 (undefined!4743 Bool) (index!17905 (_ BitVec 32)) (x!46962 (_ BitVec 32))) (Undefined!3931) (MissingVacant!3931 (index!17906 (_ BitVec 32))) )
))
(declare-fun lt!224990 () SeekEntryResult!3931)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497211 (= res!299741 (or (= lt!224990 (MissingZero!3931 i!1204)) (= lt!224990 (MissingVacant!3931 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((array!32168 0))(
  ( (array!32169 (arr!15467 (Array (_ BitVec 32) (_ BitVec 64))) (size!15832 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32168)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32168 (_ BitVec 32)) SeekEntryResult!3931)

(assert (=> b!497211 (= lt!224990 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497212 () Bool)

(declare-fun res!299746 () Bool)

(assert (=> b!497212 (=> (not res!299746) (not e!291423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497212 (= res!299746 (validKeyInArray!0 k0!2280))))

(declare-fun b!497213 () Bool)

(declare-fun res!299743 () Bool)

(assert (=> b!497213 (=> (not res!299743) (not e!291423))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497213 (= res!299743 (and (= (size!15832 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15832 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15832 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299740 () Bool)

(assert (=> start!45270 (=> (not res!299740) (not e!291423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45270 (= res!299740 (validMask!0 mask!3524))))

(assert (=> start!45270 e!291423))

(assert (=> start!45270 true))

(declare-fun array_inv!11350 (array!32168) Bool)

(assert (=> start!45270 (array_inv!11350 a!3235)))

(declare-fun b!497214 () Bool)

(declare-fun res!299742 () Bool)

(assert (=> b!497214 (=> (not res!299742) (not e!291428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32168 (_ BitVec 32)) Bool)

(assert (=> b!497214 (= res!299742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497215 () Bool)

(declare-fun res!299744 () Bool)

(assert (=> b!497215 (=> (not res!299744) (not e!291428))))

(declare-datatypes ((List!9664 0))(
  ( (Nil!9661) (Cons!9660 (h!10531 (_ BitVec 64)) (t!15883 List!9664)) )
))
(declare-fun arrayNoDuplicates!0 (array!32168 (_ BitVec 32) List!9664) Bool)

(assert (=> b!497215 (= res!299744 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9661))))

(declare-fun b!497216 () Bool)

(declare-fun e!291427 () Bool)

(assert (=> b!497216 (= e!291428 (not e!291427))))

(declare-fun res!299736 () Bool)

(assert (=> b!497216 (=> res!299736 e!291427)))

(declare-fun lt!224993 () (_ BitVec 32))

(declare-fun lt!224995 () (_ BitVec 64))

(declare-fun lt!224988 () array!32168)

(declare-fun lt!224994 () SeekEntryResult!3931)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32168 (_ BitVec 32)) SeekEntryResult!3931)

(assert (=> b!497216 (= res!299736 (= lt!224994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224993 lt!224995 lt!224988 mask!3524)))))

(declare-fun lt!224989 () (_ BitVec 32))

(assert (=> b!497216 (= lt!224994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224989 (select (arr!15467 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497216 (= lt!224993 (toIndex!0 lt!224995 mask!3524))))

(assert (=> b!497216 (= lt!224995 (select (store (arr!15467 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497216 (= lt!224989 (toIndex!0 (select (arr!15467 a!3235) j!176) mask!3524))))

(assert (=> b!497216 (= lt!224988 (array!32169 (store (arr!15467 a!3235) i!1204 k0!2280) (size!15832 a!3235)))))

(declare-fun e!291426 () Bool)

(assert (=> b!497216 e!291426))

(declare-fun res!299737 () Bool)

(assert (=> b!497216 (=> (not res!299737) (not e!291426))))

(assert (=> b!497216 (= res!299737 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14794 0))(
  ( (Unit!14795) )
))
(declare-fun lt!224987 () Unit!14794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14794)

(assert (=> b!497216 (= lt!224987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497217 () Bool)

(declare-fun e!291429 () Unit!14794)

(declare-fun Unit!14796 () Unit!14794)

(assert (=> b!497217 (= e!291429 Unit!14796)))

(declare-fun lt!224992 () Unit!14794)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32168 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14794)

(assert (=> b!497217 (= lt!224992 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!224989 #b00000000000000000000000000000000 (index!17905 lt!224994) (x!46962 lt!224994) mask!3524))))

(declare-fun res!299745 () Bool)

(assert (=> b!497217 (= res!299745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224989 lt!224995 lt!224988 mask!3524) (Intermediate!3931 false (index!17905 lt!224994) (x!46962 lt!224994))))))

(declare-fun e!291425 () Bool)

(assert (=> b!497217 (=> (not res!299745) (not e!291425))))

(assert (=> b!497217 e!291425))

(declare-fun b!497218 () Bool)

(assert (=> b!497218 (= e!291425 false)))

(declare-fun b!497219 () Bool)

(declare-fun Unit!14797 () Unit!14794)

(assert (=> b!497219 (= e!291429 Unit!14797)))

(declare-fun b!497220 () Bool)

(declare-fun res!299738 () Bool)

(assert (=> b!497220 (=> res!299738 e!291427)))

(get-info :version)

(assert (=> b!497220 (= res!299738 (or (undefined!4743 lt!224994) (not ((_ is Intermediate!3931) lt!224994))))))

(declare-fun b!497221 () Bool)

(declare-fun res!299739 () Bool)

(assert (=> b!497221 (=> (not res!299739) (not e!291423))))

(assert (=> b!497221 (= res!299739 (validKeyInArray!0 (select (arr!15467 a!3235) j!176)))))

(declare-fun b!497222 () Bool)

(assert (=> b!497222 (= e!291427 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!497222 (and (or (= (select (arr!15467 a!3235) (index!17905 lt!224994)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15467 a!3235) (index!17905 lt!224994)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15467 a!3235) (index!17905 lt!224994)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15467 a!3235) (index!17905 lt!224994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!224991 () Unit!14794)

(assert (=> b!497222 (= lt!224991 e!291429)))

(declare-fun c!59013 () Bool)

(assert (=> b!497222 (= c!59013 (= (select (arr!15467 a!3235) (index!17905 lt!224994)) (select (arr!15467 a!3235) j!176)))))

(assert (=> b!497222 (and (bvslt (x!46962 lt!224994) #b01111111111111111111111111111110) (or (= (select (arr!15467 a!3235) (index!17905 lt!224994)) (select (arr!15467 a!3235) j!176)) (= (select (arr!15467 a!3235) (index!17905 lt!224994)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15467 a!3235) (index!17905 lt!224994)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497223 () Bool)

(declare-fun res!299747 () Bool)

(assert (=> b!497223 (=> (not res!299747) (not e!291423))))

(declare-fun arrayContainsKey!0 (array!32168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497223 (= res!299747 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497224 () Bool)

(assert (=> b!497224 (= e!291426 (= (seekEntryOrOpen!0 (select (arr!15467 a!3235) j!176) a!3235 mask!3524) (Found!3931 j!176)))))

(assert (= (and start!45270 res!299740) b!497213))

(assert (= (and b!497213 res!299743) b!497221))

(assert (= (and b!497221 res!299739) b!497212))

(assert (= (and b!497212 res!299746) b!497223))

(assert (= (and b!497223 res!299747) b!497211))

(assert (= (and b!497211 res!299741) b!497214))

(assert (= (and b!497214 res!299742) b!497215))

(assert (= (and b!497215 res!299744) b!497216))

(assert (= (and b!497216 res!299737) b!497224))

(assert (= (and b!497216 (not res!299736)) b!497220))

(assert (= (and b!497220 (not res!299738)) b!497222))

(assert (= (and b!497222 c!59013) b!497217))

(assert (= (and b!497222 (not c!59013)) b!497219))

(assert (= (and b!497217 res!299745) b!497218))

(declare-fun m!478117 () Bool)

(assert (=> b!497221 m!478117))

(assert (=> b!497221 m!478117))

(declare-fun m!478119 () Bool)

(assert (=> b!497221 m!478119))

(declare-fun m!478121 () Bool)

(assert (=> b!497216 m!478121))

(declare-fun m!478123 () Bool)

(assert (=> b!497216 m!478123))

(assert (=> b!497216 m!478117))

(declare-fun m!478125 () Bool)

(assert (=> b!497216 m!478125))

(assert (=> b!497216 m!478117))

(assert (=> b!497216 m!478117))

(declare-fun m!478127 () Bool)

(assert (=> b!497216 m!478127))

(declare-fun m!478129 () Bool)

(assert (=> b!497216 m!478129))

(declare-fun m!478131 () Bool)

(assert (=> b!497216 m!478131))

(declare-fun m!478133 () Bool)

(assert (=> b!497216 m!478133))

(declare-fun m!478135 () Bool)

(assert (=> b!497216 m!478135))

(declare-fun m!478137 () Bool)

(assert (=> b!497222 m!478137))

(assert (=> b!497222 m!478117))

(declare-fun m!478139 () Bool)

(assert (=> b!497211 m!478139))

(declare-fun m!478141 () Bool)

(assert (=> b!497217 m!478141))

(declare-fun m!478143 () Bool)

(assert (=> b!497217 m!478143))

(declare-fun m!478145 () Bool)

(assert (=> b!497215 m!478145))

(declare-fun m!478147 () Bool)

(assert (=> start!45270 m!478147))

(declare-fun m!478149 () Bool)

(assert (=> start!45270 m!478149))

(declare-fun m!478151 () Bool)

(assert (=> b!497223 m!478151))

(declare-fun m!478153 () Bool)

(assert (=> b!497214 m!478153))

(declare-fun m!478155 () Bool)

(assert (=> b!497212 m!478155))

(assert (=> b!497224 m!478117))

(assert (=> b!497224 m!478117))

(declare-fun m!478157 () Bool)

(assert (=> b!497224 m!478157))

(check-sat (not b!497212) (not b!497214) (not b!497224) (not start!45270) (not b!497217) (not b!497216) (not b!497223) (not b!497211) (not b!497215) (not b!497221))
(check-sat)
