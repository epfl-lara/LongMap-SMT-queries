; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66466 () Bool)

(assert start!66466)

(declare-fun b!765856 () Bool)

(declare-fun res!518058 () Bool)

(declare-fun e!426512 () Bool)

(assert (=> b!765856 (=> (not res!518058) (not e!426512))))

(declare-datatypes ((array!42245 0))(
  ( (array!42246 (arr!20227 (Array (_ BitVec 32) (_ BitVec 64))) (size!20648 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42245)

(declare-datatypes ((List!14229 0))(
  ( (Nil!14226) (Cons!14225 (h!15315 (_ BitVec 64)) (t!20544 List!14229)) )
))
(declare-fun arrayNoDuplicates!0 (array!42245 (_ BitVec 32) List!14229) Bool)

(assert (=> b!765856 (= res!518058 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14226))))

(declare-fun b!765857 () Bool)

(declare-fun res!518059 () Bool)

(declare-fun e!426509 () Bool)

(assert (=> b!765857 (=> (not res!518059) (not e!426509))))

(declare-fun e!426513 () Bool)

(assert (=> b!765857 (= res!518059 e!426513)))

(declare-fun c!84292 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765857 (= c!84292 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765858 () Bool)

(declare-fun res!518055 () Bool)

(assert (=> b!765858 (=> (not res!518055) (not e!426512))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42245 (_ BitVec 32)) Bool)

(assert (=> b!765858 (= res!518055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765860 () Bool)

(declare-fun res!518060 () Bool)

(declare-fun e!426510 () Bool)

(assert (=> b!765860 (=> (not res!518060) (not e!426510))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765860 (= res!518060 (validKeyInArray!0 k0!2102))))

(declare-fun b!765861 () Bool)

(assert (=> b!765861 (= e!426510 e!426512)))

(declare-fun res!518061 () Bool)

(assert (=> b!765861 (=> (not res!518061) (not e!426512))))

(declare-datatypes ((SeekEntryResult!7827 0))(
  ( (MissingZero!7827 (index!33676 (_ BitVec 32))) (Found!7827 (index!33677 (_ BitVec 32))) (Intermediate!7827 (undefined!8639 Bool) (index!33678 (_ BitVec 32)) (x!64585 (_ BitVec 32))) (Undefined!7827) (MissingVacant!7827 (index!33679 (_ BitVec 32))) )
))
(declare-fun lt!340680 () SeekEntryResult!7827)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765861 (= res!518061 (or (= lt!340680 (MissingZero!7827 i!1173)) (= lt!340680 (MissingVacant!7827 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42245 (_ BitVec 32)) SeekEntryResult!7827)

(assert (=> b!765861 (= lt!340680 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765862 () Bool)

(declare-fun res!518062 () Bool)

(assert (=> b!765862 (=> (not res!518062) (not e!426510))))

(declare-fun arrayContainsKey!0 (array!42245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765862 (= res!518062 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765863 () Bool)

(declare-fun res!518064 () Bool)

(assert (=> b!765863 (=> (not res!518064) (not e!426509))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!765863 (= res!518064 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20227 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765864 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42245 (_ BitVec 32)) SeekEntryResult!7827)

(assert (=> b!765864 (= e!426513 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) (Found!7827 j!159)))))

(declare-fun b!765865 () Bool)

(declare-fun res!518057 () Bool)

(assert (=> b!765865 (=> (not res!518057) (not e!426510))))

(assert (=> b!765865 (= res!518057 (and (= (size!20648 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20648 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20648 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765866 () Bool)

(declare-fun res!518056 () Bool)

(assert (=> b!765866 (=> (not res!518056) (not e!426512))))

(assert (=> b!765866 (= res!518056 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20648 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20648 a!3186))))))

(declare-fun b!765867 () Bool)

(declare-fun e!426511 () Bool)

(declare-fun e!426514 () Bool)

(assert (=> b!765867 (= e!426511 e!426514)))

(declare-fun res!518054 () Bool)

(assert (=> b!765867 (=> (not res!518054) (not e!426514))))

(declare-fun lt!340685 () SeekEntryResult!7827)

(assert (=> b!765867 (= res!518054 (= (seekEntryOrOpen!0 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!340685))))

(assert (=> b!765867 (= lt!340685 (Found!7827 j!159))))

(declare-fun b!765868 () Bool)

(declare-fun e!426515 () Bool)

(assert (=> b!765868 (= e!426509 e!426515)))

(declare-fun res!518051 () Bool)

(assert (=> b!765868 (=> (not res!518051) (not e!426515))))

(declare-fun lt!340683 () (_ BitVec 64))

(declare-fun lt!340684 () array!42245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42245 (_ BitVec 32)) SeekEntryResult!7827)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765868 (= res!518051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340683 mask!3328) lt!340683 lt!340684 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340683 lt!340684 mask!3328)))))

(assert (=> b!765868 (= lt!340683 (select (store (arr!20227 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765868 (= lt!340684 (array!42246 (store (arr!20227 a!3186) i!1173 k0!2102) (size!20648 a!3186)))))

(declare-fun res!518053 () Bool)

(assert (=> start!66466 (=> (not res!518053) (not e!426510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66466 (= res!518053 (validMask!0 mask!3328))))

(assert (=> start!66466 e!426510))

(assert (=> start!66466 true))

(declare-fun array_inv!16023 (array!42245) Bool)

(assert (=> start!66466 (array_inv!16023 a!3186)))

(declare-fun b!765859 () Bool)

(declare-fun lt!340682 () SeekEntryResult!7827)

(assert (=> b!765859 (= e!426513 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!340682))))

(declare-fun b!765869 () Bool)

(assert (=> b!765869 (= e!426515 (not true))))

(assert (=> b!765869 e!426511))

(declare-fun res!518063 () Bool)

(assert (=> b!765869 (=> (not res!518063) (not e!426511))))

(assert (=> b!765869 (= res!518063 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26380 0))(
  ( (Unit!26381) )
))
(declare-fun lt!340681 () Unit!26380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26380)

(assert (=> b!765869 (= lt!340681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765870 () Bool)

(declare-fun res!518065 () Bool)

(assert (=> b!765870 (=> (not res!518065) (not e!426510))))

(assert (=> b!765870 (= res!518065 (validKeyInArray!0 (select (arr!20227 a!3186) j!159)))))

(declare-fun b!765871 () Bool)

(assert (=> b!765871 (= e!426512 e!426509)))

(declare-fun res!518052 () Bool)

(assert (=> b!765871 (=> (not res!518052) (not e!426509))))

(assert (=> b!765871 (= res!518052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20227 a!3186) j!159) mask!3328) (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!340682))))

(assert (=> b!765871 (= lt!340682 (Intermediate!7827 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765872 () Bool)

(assert (=> b!765872 (= e!426514 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!340685))))

(assert (= (and start!66466 res!518053) b!765865))

(assert (= (and b!765865 res!518057) b!765870))

(assert (= (and b!765870 res!518065) b!765860))

(assert (= (and b!765860 res!518060) b!765862))

(assert (= (and b!765862 res!518062) b!765861))

(assert (= (and b!765861 res!518061) b!765858))

(assert (= (and b!765858 res!518055) b!765856))

(assert (= (and b!765856 res!518058) b!765866))

(assert (= (and b!765866 res!518056) b!765871))

(assert (= (and b!765871 res!518052) b!765863))

(assert (= (and b!765863 res!518064) b!765857))

(assert (= (and b!765857 c!84292) b!765859))

(assert (= (and b!765857 (not c!84292)) b!765864))

(assert (= (and b!765857 res!518059) b!765868))

(assert (= (and b!765868 res!518051) b!765869))

(assert (= (and b!765869 res!518063) b!765867))

(assert (= (and b!765867 res!518054) b!765872))

(declare-fun m!711907 () Bool)

(assert (=> b!765863 m!711907))

(declare-fun m!711909 () Bool)

(assert (=> b!765871 m!711909))

(assert (=> b!765871 m!711909))

(declare-fun m!711911 () Bool)

(assert (=> b!765871 m!711911))

(assert (=> b!765871 m!711911))

(assert (=> b!765871 m!711909))

(declare-fun m!711913 () Bool)

(assert (=> b!765871 m!711913))

(declare-fun m!711915 () Bool)

(assert (=> b!765858 m!711915))

(declare-fun m!711917 () Bool)

(assert (=> b!765860 m!711917))

(declare-fun m!711919 () Bool)

(assert (=> b!765856 m!711919))

(assert (=> b!765859 m!711909))

(assert (=> b!765859 m!711909))

(declare-fun m!711921 () Bool)

(assert (=> b!765859 m!711921))

(declare-fun m!711923 () Bool)

(assert (=> b!765862 m!711923))

(assert (=> b!765864 m!711909))

(assert (=> b!765864 m!711909))

(declare-fun m!711925 () Bool)

(assert (=> b!765864 m!711925))

(assert (=> b!765872 m!711909))

(assert (=> b!765872 m!711909))

(declare-fun m!711927 () Bool)

(assert (=> b!765872 m!711927))

(declare-fun m!711929 () Bool)

(assert (=> b!765861 m!711929))

(declare-fun m!711931 () Bool)

(assert (=> b!765869 m!711931))

(declare-fun m!711933 () Bool)

(assert (=> b!765869 m!711933))

(declare-fun m!711935 () Bool)

(assert (=> b!765868 m!711935))

(declare-fun m!711937 () Bool)

(assert (=> b!765868 m!711937))

(declare-fun m!711939 () Bool)

(assert (=> b!765868 m!711939))

(assert (=> b!765868 m!711935))

(declare-fun m!711941 () Bool)

(assert (=> b!765868 m!711941))

(declare-fun m!711943 () Bool)

(assert (=> b!765868 m!711943))

(declare-fun m!711945 () Bool)

(assert (=> start!66466 m!711945))

(declare-fun m!711947 () Bool)

(assert (=> start!66466 m!711947))

(assert (=> b!765867 m!711909))

(assert (=> b!765867 m!711909))

(declare-fun m!711949 () Bool)

(assert (=> b!765867 m!711949))

(assert (=> b!765870 m!711909))

(assert (=> b!765870 m!711909))

(declare-fun m!711951 () Bool)

(assert (=> b!765870 m!711951))

(check-sat (not b!765872) (not b!765870) (not b!765867) (not b!765860) (not b!765869) (not b!765862) (not b!765871) (not start!66466) (not b!765864) (not b!765858) (not b!765861) (not b!765868) (not b!765859) (not b!765856))
(check-sat)
