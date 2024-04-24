; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64770 () Bool)

(assert start!64770)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41089 0))(
  ( (array!41090 (arr!19660 (Array (_ BitVec 32) (_ BitVec 64))) (size!20080 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41089)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7216 0))(
  ( (MissingZero!7216 (index!31232 (_ BitVec 32))) (Found!7216 (index!31233 (_ BitVec 32))) (Intermediate!7216 (undefined!8028 Bool) (index!31234 (_ BitVec 32)) (x!62386 (_ BitVec 32))) (Undefined!7216) (MissingVacant!7216 (index!31235 (_ BitVec 32))) )
))
(declare-fun lt!322804 () SeekEntryResult!7216)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!408070 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!728837 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41089 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!728837 (= e!408070 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322804))))

(declare-fun b!728839 () Bool)

(declare-fun res!488957 () Bool)

(declare-fun e!408073 () Bool)

(assert (=> b!728839 (=> (not res!488957) (not e!408073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41089 (_ BitVec 32)) Bool)

(assert (=> b!728839 (= res!488957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728840 () Bool)

(declare-fun res!488965 () Bool)

(declare-fun e!408068 () Bool)

(assert (=> b!728840 (=> (not res!488965) (not e!408068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728840 (= res!488965 (validKeyInArray!0 (select (arr!19660 a!3186) j!159)))))

(declare-fun b!728841 () Bool)

(declare-fun e!408072 () Bool)

(declare-fun e!408074 () Bool)

(assert (=> b!728841 (= e!408072 (not e!408074))))

(declare-fun res!488954 () Bool)

(assert (=> b!728841 (=> res!488954 e!408074)))

(declare-fun lt!322803 () SeekEntryResult!7216)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!728841 (= res!488954 (or (not ((_ is Intermediate!7216) lt!322803)) (bvsge x!1131 (x!62386 lt!322803))))))

(declare-fun e!408067 () Bool)

(assert (=> b!728841 e!408067))

(declare-fun res!488963 () Bool)

(assert (=> b!728841 (=> (not res!488963) (not e!408067))))

(assert (=> b!728841 (= res!488963 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24829 0))(
  ( (Unit!24830) )
))
(declare-fun lt!322802 () Unit!24829)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24829)

(assert (=> b!728841 (= lt!322802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728842 () Bool)

(declare-fun res!488956 () Bool)

(assert (=> b!728842 (=> (not res!488956) (not e!408068))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728842 (= res!488956 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728843 () Bool)

(declare-fun lt!322806 () SeekEntryResult!7216)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408071 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41089 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!728843 (= e!408071 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322806))))

(declare-fun b!728844 () Bool)

(declare-fun res!488958 () Bool)

(assert (=> b!728844 (=> (not res!488958) (not e!408073))))

(assert (=> b!728844 (= res!488958 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20080 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20080 a!3186))))))

(declare-fun b!728845 () Bool)

(declare-fun e!408075 () Bool)

(assert (=> b!728845 (= e!408073 e!408075)))

(declare-fun res!488962 () Bool)

(assert (=> b!728845 (=> (not res!488962) (not e!408075))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728845 (= res!488962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19660 a!3186) j!159) mask!3328) (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322806))))

(assert (=> b!728845 (= lt!322806 (Intermediate!7216 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728846 () Bool)

(assert (=> b!728846 (= e!408068 e!408073)))

(declare-fun res!488951 () Bool)

(assert (=> b!728846 (=> (not res!488951) (not e!408073))))

(declare-fun lt!322808 () SeekEntryResult!7216)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728846 (= res!488951 (or (= lt!322808 (MissingZero!7216 i!1173)) (= lt!322808 (MissingVacant!7216 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41089 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!728846 (= lt!322808 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728847 () Bool)

(assert (=> b!728847 (= e!408067 e!408070)))

(declare-fun res!488961 () Bool)

(assert (=> b!728847 (=> (not res!488961) (not e!408070))))

(assert (=> b!728847 (= res!488961 (= (seekEntryOrOpen!0 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322804))))

(assert (=> b!728847 (= lt!322804 (Found!7216 j!159))))

(declare-fun b!728848 () Bool)

(declare-fun res!488950 () Bool)

(assert (=> b!728848 (=> (not res!488950) (not e!408073))))

(declare-datatypes ((List!13569 0))(
  ( (Nil!13566) (Cons!13565 (h!14631 (_ BitVec 64)) (t!19876 List!13569)) )
))
(declare-fun arrayNoDuplicates!0 (array!41089 (_ BitVec 32) List!13569) Bool)

(assert (=> b!728848 (= res!488950 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13566))))

(declare-fun b!728838 () Bool)

(assert (=> b!728838 (= e!408075 e!408072)))

(declare-fun res!488964 () Bool)

(assert (=> b!728838 (=> (not res!488964) (not e!408072))))

(declare-fun lt!322809 () SeekEntryResult!7216)

(assert (=> b!728838 (= res!488964 (= lt!322809 lt!322803))))

(declare-fun lt!322807 () array!41089)

(declare-fun lt!322801 () (_ BitVec 64))

(assert (=> b!728838 (= lt!322803 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322801 lt!322807 mask!3328))))

(assert (=> b!728838 (= lt!322809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322801 mask!3328) lt!322801 lt!322807 mask!3328))))

(assert (=> b!728838 (= lt!322801 (select (store (arr!19660 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728838 (= lt!322807 (array!41090 (store (arr!19660 a!3186) i!1173 k0!2102) (size!20080 a!3186)))))

(declare-fun res!488959 () Bool)

(assert (=> start!64770 (=> (not res!488959) (not e!408068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64770 (= res!488959 (validMask!0 mask!3328))))

(assert (=> start!64770 e!408068))

(assert (=> start!64770 true))

(declare-fun array_inv!15519 (array!41089) Bool)

(assert (=> start!64770 (array_inv!15519 a!3186)))

(declare-fun b!728849 () Bool)

(declare-fun res!488953 () Bool)

(assert (=> b!728849 (=> (not res!488953) (not e!408068))))

(assert (=> b!728849 (= res!488953 (validKeyInArray!0 k0!2102))))

(declare-fun b!728850 () Bool)

(assert (=> b!728850 (= e!408071 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) (Found!7216 j!159)))))

(declare-fun b!728851 () Bool)

(assert (=> b!728851 (= e!408074 true)))

(declare-fun lt!322805 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728851 (= lt!322805 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!728852 () Bool)

(declare-fun res!488960 () Bool)

(assert (=> b!728852 (=> (not res!488960) (not e!408068))))

(assert (=> b!728852 (= res!488960 (and (= (size!20080 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20080 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20080 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728853 () Bool)

(declare-fun res!488952 () Bool)

(assert (=> b!728853 (=> (not res!488952) (not e!408075))))

(assert (=> b!728853 (= res!488952 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19660 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728854 () Bool)

(declare-fun res!488955 () Bool)

(assert (=> b!728854 (=> (not res!488955) (not e!408075))))

(assert (=> b!728854 (= res!488955 e!408071)))

(declare-fun c!80321 () Bool)

(assert (=> b!728854 (= c!80321 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64770 res!488959) b!728852))

(assert (= (and b!728852 res!488960) b!728840))

(assert (= (and b!728840 res!488965) b!728849))

(assert (= (and b!728849 res!488953) b!728842))

(assert (= (and b!728842 res!488956) b!728846))

(assert (= (and b!728846 res!488951) b!728839))

(assert (= (and b!728839 res!488957) b!728848))

(assert (= (and b!728848 res!488950) b!728844))

(assert (= (and b!728844 res!488958) b!728845))

(assert (= (and b!728845 res!488962) b!728853))

(assert (= (and b!728853 res!488952) b!728854))

(assert (= (and b!728854 c!80321) b!728843))

(assert (= (and b!728854 (not c!80321)) b!728850))

(assert (= (and b!728854 res!488955) b!728838))

(assert (= (and b!728838 res!488964) b!728841))

(assert (= (and b!728841 res!488963) b!728847))

(assert (= (and b!728847 res!488961) b!728837))

(assert (= (and b!728841 (not res!488954)) b!728851))

(declare-fun m!683019 () Bool)

(assert (=> b!728842 m!683019))

(declare-fun m!683021 () Bool)

(assert (=> b!728843 m!683021))

(assert (=> b!728843 m!683021))

(declare-fun m!683023 () Bool)

(assert (=> b!728843 m!683023))

(declare-fun m!683025 () Bool)

(assert (=> b!728848 m!683025))

(assert (=> b!728847 m!683021))

(assert (=> b!728847 m!683021))

(declare-fun m!683027 () Bool)

(assert (=> b!728847 m!683027))

(declare-fun m!683029 () Bool)

(assert (=> start!64770 m!683029))

(declare-fun m!683031 () Bool)

(assert (=> start!64770 m!683031))

(declare-fun m!683033 () Bool)

(assert (=> b!728838 m!683033))

(declare-fun m!683035 () Bool)

(assert (=> b!728838 m!683035))

(declare-fun m!683037 () Bool)

(assert (=> b!728838 m!683037))

(declare-fun m!683039 () Bool)

(assert (=> b!728838 m!683039))

(declare-fun m!683041 () Bool)

(assert (=> b!728838 m!683041))

(assert (=> b!728838 m!683033))

(declare-fun m!683043 () Bool)

(assert (=> b!728839 m!683043))

(declare-fun m!683045 () Bool)

(assert (=> b!728846 m!683045))

(assert (=> b!728837 m!683021))

(assert (=> b!728837 m!683021))

(declare-fun m!683047 () Bool)

(assert (=> b!728837 m!683047))

(assert (=> b!728840 m!683021))

(assert (=> b!728840 m!683021))

(declare-fun m!683049 () Bool)

(assert (=> b!728840 m!683049))

(declare-fun m!683051 () Bool)

(assert (=> b!728841 m!683051))

(declare-fun m!683053 () Bool)

(assert (=> b!728841 m!683053))

(declare-fun m!683055 () Bool)

(assert (=> b!728851 m!683055))

(declare-fun m!683057 () Bool)

(assert (=> b!728853 m!683057))

(assert (=> b!728850 m!683021))

(assert (=> b!728850 m!683021))

(declare-fun m!683059 () Bool)

(assert (=> b!728850 m!683059))

(assert (=> b!728845 m!683021))

(assert (=> b!728845 m!683021))

(declare-fun m!683061 () Bool)

(assert (=> b!728845 m!683061))

(assert (=> b!728845 m!683061))

(assert (=> b!728845 m!683021))

(declare-fun m!683063 () Bool)

(assert (=> b!728845 m!683063))

(declare-fun m!683065 () Bool)

(assert (=> b!728849 m!683065))

(check-sat (not b!728839) (not b!728850) (not b!728837) (not b!728843) (not b!728848) (not b!728849) (not b!728838) (not b!728845) (not b!728841) (not start!64770) (not b!728842) (not b!728847) (not b!728851) (not b!728840) (not b!728846))
(check-sat)
