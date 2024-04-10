; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64740 () Bool)

(assert start!64740)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41189 0))(
  ( (array!41190 (arr!19714 (Array (_ BitVec 32) (_ BitVec 64))) (size!20135 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41189)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!408921 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!730743 () Bool)

(declare-datatypes ((SeekEntryResult!7314 0))(
  ( (MissingZero!7314 (index!31624 (_ BitVec 32))) (Found!7314 (index!31625 (_ BitVec 32))) (Intermediate!7314 (undefined!8126 Bool) (index!31626 (_ BitVec 32)) (x!62600 (_ BitVec 32))) (Undefined!7314) (MissingVacant!7314 (index!31627 (_ BitVec 32))) )
))
(declare-fun lt!323820 () SeekEntryResult!7314)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41189 (_ BitVec 32)) SeekEntryResult!7314)

(assert (=> b!730743 (= e!408921 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!323820))))

(declare-fun b!730744 () Bool)

(declare-fun res!491018 () Bool)

(declare-fun e!408919 () Bool)

(assert (=> b!730744 (=> (not res!491018) (not e!408919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41189 (_ BitVec 32)) Bool)

(assert (=> b!730744 (= res!491018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730745 () Bool)

(declare-fun e!408917 () Bool)

(assert (=> b!730745 (= e!408917 true)))

(declare-fun lt!323818 () SeekEntryResult!7314)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!730745 (= lt!323818 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19714 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!730746 () Bool)

(declare-fun e!408926 () Bool)

(assert (=> b!730746 (= e!408919 e!408926)))

(declare-fun res!491015 () Bool)

(assert (=> b!730746 (=> (not res!491015) (not e!408926))))

(declare-fun lt!323825 () SeekEntryResult!7314)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41189 (_ BitVec 32)) SeekEntryResult!7314)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730746 (= res!491015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19714 a!3186) j!159) mask!3328) (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!323825))))

(assert (=> b!730746 (= lt!323825 (Intermediate!7314 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730747 () Bool)

(declare-fun res!491016 () Bool)

(assert (=> b!730747 (=> (not res!491016) (not e!408926))))

(declare-fun e!408925 () Bool)

(assert (=> b!730747 (= res!491016 e!408925)))

(declare-fun c!80245 () Bool)

(assert (=> b!730747 (= c!80245 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730748 () Bool)

(declare-fun res!491005 () Bool)

(declare-fun e!408924 () Bool)

(assert (=> b!730748 (=> (not res!491005) (not e!408924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730748 (= res!491005 (validKeyInArray!0 (select (arr!19714 a!3186) j!159)))))

(declare-fun b!730749 () Bool)

(declare-fun res!491012 () Bool)

(assert (=> b!730749 (=> (not res!491012) (not e!408926))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730749 (= res!491012 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19714 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730750 () Bool)

(declare-fun res!491010 () Bool)

(assert (=> b!730750 (=> (not res!491010) (not e!408924))))

(assert (=> b!730750 (= res!491010 (and (= (size!20135 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20135 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20135 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730751 () Bool)

(declare-fun res!491006 () Bool)

(assert (=> b!730751 (=> (not res!491006) (not e!408919))))

(declare-datatypes ((List!13716 0))(
  ( (Nil!13713) (Cons!13712 (h!14772 (_ BitVec 64)) (t!20031 List!13716)) )
))
(declare-fun arrayNoDuplicates!0 (array!41189 (_ BitVec 32) List!13716) Bool)

(assert (=> b!730751 (= res!491006 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13713))))

(declare-fun b!730752 () Bool)

(assert (=> b!730752 (= e!408925 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!323825))))

(declare-fun b!730753 () Bool)

(declare-fun res!491009 () Bool)

(assert (=> b!730753 (=> (not res!491009) (not e!408924))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730753 (= res!491009 (validKeyInArray!0 k0!2102))))

(declare-fun res!491014 () Bool)

(assert (=> start!64740 (=> (not res!491014) (not e!408924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64740 (= res!491014 (validMask!0 mask!3328))))

(assert (=> start!64740 e!408924))

(assert (=> start!64740 true))

(declare-fun array_inv!15510 (array!41189) Bool)

(assert (=> start!64740 (array_inv!15510 a!3186)))

(declare-fun b!730754 () Bool)

(assert (=> b!730754 (= e!408925 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) (Found!7314 j!159)))))

(declare-fun b!730755 () Bool)

(declare-fun res!491017 () Bool)

(assert (=> b!730755 (=> (not res!491017) (not e!408924))))

(declare-fun arrayContainsKey!0 (array!41189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730755 (= res!491017 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730756 () Bool)

(declare-fun e!408920 () Bool)

(assert (=> b!730756 (= e!408920 e!408917)))

(declare-fun res!491008 () Bool)

(assert (=> b!730756 (=> res!491008 e!408917)))

(assert (=> b!730756 (= res!491008 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323823 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730756 (= lt!323823 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730757 () Bool)

(assert (=> b!730757 (= e!408924 e!408919)))

(declare-fun res!491011 () Bool)

(assert (=> b!730757 (=> (not res!491011) (not e!408919))))

(declare-fun lt!323821 () SeekEntryResult!7314)

(assert (=> b!730757 (= res!491011 (or (= lt!323821 (MissingZero!7314 i!1173)) (= lt!323821 (MissingVacant!7314 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41189 (_ BitVec 32)) SeekEntryResult!7314)

(assert (=> b!730757 (= lt!323821 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730758 () Bool)

(declare-fun res!491002 () Bool)

(assert (=> b!730758 (=> (not res!491002) (not e!408919))))

(assert (=> b!730758 (= res!491002 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20135 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20135 a!3186))))))

(declare-fun b!730759 () Bool)

(declare-fun e!408918 () Bool)

(assert (=> b!730759 (= e!408918 (not e!408920))))

(declare-fun res!491013 () Bool)

(assert (=> b!730759 (=> res!491013 e!408920)))

(declare-fun lt!323816 () SeekEntryResult!7314)

(get-info :version)

(assert (=> b!730759 (= res!491013 (or (not ((_ is Intermediate!7314) lt!323816)) (bvsge x!1131 (x!62600 lt!323816))))))

(declare-fun e!408923 () Bool)

(assert (=> b!730759 e!408923))

(declare-fun res!491007 () Bool)

(assert (=> b!730759 (=> (not res!491007) (not e!408923))))

(assert (=> b!730759 (= res!491007 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24946 0))(
  ( (Unit!24947) )
))
(declare-fun lt!323822 () Unit!24946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24946)

(assert (=> b!730759 (= lt!323822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730760 () Bool)

(assert (=> b!730760 (= e!408923 e!408921)))

(declare-fun res!491003 () Bool)

(assert (=> b!730760 (=> (not res!491003) (not e!408921))))

(assert (=> b!730760 (= res!491003 (= (seekEntryOrOpen!0 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!323820))))

(assert (=> b!730760 (= lt!323820 (Found!7314 j!159))))

(declare-fun b!730761 () Bool)

(assert (=> b!730761 (= e!408926 e!408918)))

(declare-fun res!491004 () Bool)

(assert (=> b!730761 (=> (not res!491004) (not e!408918))))

(declare-fun lt!323819 () SeekEntryResult!7314)

(assert (=> b!730761 (= res!491004 (= lt!323819 lt!323816))))

(declare-fun lt!323824 () (_ BitVec 64))

(declare-fun lt!323817 () array!41189)

(assert (=> b!730761 (= lt!323816 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323824 lt!323817 mask!3328))))

(assert (=> b!730761 (= lt!323819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323824 mask!3328) lt!323824 lt!323817 mask!3328))))

(assert (=> b!730761 (= lt!323824 (select (store (arr!19714 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730761 (= lt!323817 (array!41190 (store (arr!19714 a!3186) i!1173 k0!2102) (size!20135 a!3186)))))

(assert (= (and start!64740 res!491014) b!730750))

(assert (= (and b!730750 res!491010) b!730748))

(assert (= (and b!730748 res!491005) b!730753))

(assert (= (and b!730753 res!491009) b!730755))

(assert (= (and b!730755 res!491017) b!730757))

(assert (= (and b!730757 res!491011) b!730744))

(assert (= (and b!730744 res!491018) b!730751))

(assert (= (and b!730751 res!491006) b!730758))

(assert (= (and b!730758 res!491002) b!730746))

(assert (= (and b!730746 res!491015) b!730749))

(assert (= (and b!730749 res!491012) b!730747))

(assert (= (and b!730747 c!80245) b!730752))

(assert (= (and b!730747 (not c!80245)) b!730754))

(assert (= (and b!730747 res!491016) b!730761))

(assert (= (and b!730761 res!491004) b!730759))

(assert (= (and b!730759 res!491007) b!730760))

(assert (= (and b!730760 res!491003) b!730743))

(assert (= (and b!730759 (not res!491013)) b!730756))

(assert (= (and b!730756 (not res!491008)) b!730745))

(declare-fun m!684235 () Bool)

(assert (=> b!730751 m!684235))

(declare-fun m!684237 () Bool)

(assert (=> b!730761 m!684237))

(declare-fun m!684239 () Bool)

(assert (=> b!730761 m!684239))

(declare-fun m!684241 () Bool)

(assert (=> b!730761 m!684241))

(declare-fun m!684243 () Bool)

(assert (=> b!730761 m!684243))

(declare-fun m!684245 () Bool)

(assert (=> b!730761 m!684245))

(assert (=> b!730761 m!684237))

(declare-fun m!684247 () Bool)

(assert (=> b!730756 m!684247))

(declare-fun m!684249 () Bool)

(assert (=> b!730754 m!684249))

(assert (=> b!730754 m!684249))

(declare-fun m!684251 () Bool)

(assert (=> b!730754 m!684251))

(assert (=> b!730752 m!684249))

(assert (=> b!730752 m!684249))

(declare-fun m!684253 () Bool)

(assert (=> b!730752 m!684253))

(assert (=> b!730745 m!684249))

(assert (=> b!730745 m!684249))

(assert (=> b!730745 m!684251))

(declare-fun m!684255 () Bool)

(assert (=> b!730757 m!684255))

(assert (=> b!730746 m!684249))

(assert (=> b!730746 m!684249))

(declare-fun m!684257 () Bool)

(assert (=> b!730746 m!684257))

(assert (=> b!730746 m!684257))

(assert (=> b!730746 m!684249))

(declare-fun m!684259 () Bool)

(assert (=> b!730746 m!684259))

(assert (=> b!730748 m!684249))

(assert (=> b!730748 m!684249))

(declare-fun m!684261 () Bool)

(assert (=> b!730748 m!684261))

(declare-fun m!684263 () Bool)

(assert (=> b!730744 m!684263))

(declare-fun m!684265 () Bool)

(assert (=> b!730759 m!684265))

(declare-fun m!684267 () Bool)

(assert (=> b!730759 m!684267))

(assert (=> b!730760 m!684249))

(assert (=> b!730760 m!684249))

(declare-fun m!684269 () Bool)

(assert (=> b!730760 m!684269))

(declare-fun m!684271 () Bool)

(assert (=> b!730749 m!684271))

(assert (=> b!730743 m!684249))

(assert (=> b!730743 m!684249))

(declare-fun m!684273 () Bool)

(assert (=> b!730743 m!684273))

(declare-fun m!684275 () Bool)

(assert (=> b!730755 m!684275))

(declare-fun m!684277 () Bool)

(assert (=> start!64740 m!684277))

(declare-fun m!684279 () Bool)

(assert (=> start!64740 m!684279))

(declare-fun m!684281 () Bool)

(assert (=> b!730753 m!684281))

(check-sat (not b!730746) (not b!730761) (not b!730748) (not b!730753) (not b!730754) (not b!730751) (not b!730760) (not b!730743) (not start!64740) (not b!730755) (not b!730757) (not b!730745) (not b!730756) (not b!730759) (not b!730752) (not b!730744))
(check-sat)
