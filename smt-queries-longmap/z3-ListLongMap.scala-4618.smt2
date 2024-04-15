; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64322 () Bool)

(assert start!64322)

(declare-fun b!722952 () Bool)

(declare-fun res!484705 () Bool)

(declare-fun e!405056 () Bool)

(assert (=> b!722952 (=> (not res!484705) (not e!405056))))

(declare-datatypes ((array!40920 0))(
  ( (array!40921 (arr!19583 (Array (_ BitVec 32) (_ BitVec 64))) (size!20004 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40920)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722952 (= res!484705 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722953 () Bool)

(declare-fun res!484703 () Bool)

(declare-fun e!405053 () Bool)

(assert (=> b!722953 (=> (not res!484703) (not e!405053))))

(declare-fun e!405055 () Bool)

(assert (=> b!722953 (= res!484703 e!405055)))

(declare-fun c!79500 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722953 (= c!79500 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722954 () Bool)

(declare-fun e!405057 () Bool)

(assert (=> b!722954 (= e!405053 e!405057)))

(declare-fun res!484707 () Bool)

(assert (=> b!722954 (=> (not res!484707) (not e!405057))))

(declare-fun lt!320352 () array!40920)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!320354 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7180 0))(
  ( (MissingZero!7180 (index!31088 (_ BitVec 32))) (Found!7180 (index!31089 (_ BitVec 32))) (Intermediate!7180 (undefined!7992 Bool) (index!31090 (_ BitVec 32)) (x!62096 (_ BitVec 32))) (Undefined!7180) (MissingVacant!7180 (index!31091 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40920 (_ BitVec 32)) SeekEntryResult!7180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722954 (= res!484707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320354 mask!3328) lt!320354 lt!320352 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320354 lt!320352 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722954 (= lt!320354 (select (store (arr!19583 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722954 (= lt!320352 (array!40921 (store (arr!19583 a!3186) i!1173 k0!2102) (size!20004 a!3186)))))

(declare-fun b!722955 () Bool)

(declare-fun res!484698 () Bool)

(declare-fun e!405054 () Bool)

(assert (=> b!722955 (=> (not res!484698) (not e!405054))))

(declare-datatypes ((List!13624 0))(
  ( (Nil!13621) (Cons!13620 (h!14674 (_ BitVec 64)) (t!19930 List!13624)) )
))
(declare-fun arrayNoDuplicates!0 (array!40920 (_ BitVec 32) List!13624) Bool)

(assert (=> b!722955 (= res!484698 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13621))))

(declare-fun b!722956 () Bool)

(declare-fun res!484701 () Bool)

(assert (=> b!722956 (=> (not res!484701) (not e!405054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40920 (_ BitVec 32)) Bool)

(assert (=> b!722956 (= res!484701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722957 () Bool)

(declare-fun res!484697 () Bool)

(assert (=> b!722957 (=> (not res!484697) (not e!405056))))

(assert (=> b!722957 (= res!484697 (and (= (size!20004 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20004 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20004 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722958 () Bool)

(assert (=> b!722958 (= e!405054 e!405053)))

(declare-fun res!484700 () Bool)

(assert (=> b!722958 (=> (not res!484700) (not e!405053))))

(declare-fun lt!320350 () SeekEntryResult!7180)

(assert (=> b!722958 (= res!484700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19583 a!3186) j!159) mask!3328) (select (arr!19583 a!3186) j!159) a!3186 mask!3328) lt!320350))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!722958 (= lt!320350 (Intermediate!7180 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722959 () Bool)

(declare-fun res!484702 () Bool)

(assert (=> b!722959 (=> (not res!484702) (not e!405054))))

(assert (=> b!722959 (= res!484702 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20004 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20004 a!3186))))))

(declare-fun b!722960 () Bool)

(declare-fun res!484699 () Bool)

(assert (=> b!722960 (=> (not res!484699) (not e!405056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722960 (= res!484699 (validKeyInArray!0 (select (arr!19583 a!3186) j!159)))))

(declare-fun b!722961 () Bool)

(declare-fun res!484706 () Bool)

(assert (=> b!722961 (=> (not res!484706) (not e!405053))))

(assert (=> b!722961 (= res!484706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19583 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!484704 () Bool)

(assert (=> start!64322 (=> (not res!484704) (not e!405056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64322 (= res!484704 (validMask!0 mask!3328))))

(assert (=> start!64322 e!405056))

(assert (=> start!64322 true))

(declare-fun array_inv!15466 (array!40920) Bool)

(assert (=> start!64322 (array_inv!15466 a!3186)))

(declare-fun b!722962 () Bool)

(assert (=> b!722962 (= e!405057 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!722962 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24650 0))(
  ( (Unit!24651) )
))
(declare-fun lt!320353 () Unit!24650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24650)

(assert (=> b!722962 (= lt!320353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!722963 () Bool)

(declare-fun res!484695 () Bool)

(assert (=> b!722963 (=> (not res!484695) (not e!405056))))

(assert (=> b!722963 (= res!484695 (validKeyInArray!0 k0!2102))))

(declare-fun b!722964 () Bool)

(assert (=> b!722964 (= e!405056 e!405054)))

(declare-fun res!484696 () Bool)

(assert (=> b!722964 (=> (not res!484696) (not e!405054))))

(declare-fun lt!320351 () SeekEntryResult!7180)

(assert (=> b!722964 (= res!484696 (or (= lt!320351 (MissingZero!7180 i!1173)) (= lt!320351 (MissingVacant!7180 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40920 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!722964 (= lt!320351 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722965 () Bool)

(assert (=> b!722965 (= e!405055 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19583 a!3186) j!159) a!3186 mask!3328) lt!320350))))

(declare-fun b!722966 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40920 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!722966 (= e!405055 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19583 a!3186) j!159) a!3186 mask!3328) (Found!7180 j!159)))))

(assert (= (and start!64322 res!484704) b!722957))

(assert (= (and b!722957 res!484697) b!722960))

(assert (= (and b!722960 res!484699) b!722963))

(assert (= (and b!722963 res!484695) b!722952))

(assert (= (and b!722952 res!484705) b!722964))

(assert (= (and b!722964 res!484696) b!722956))

(assert (= (and b!722956 res!484701) b!722955))

(assert (= (and b!722955 res!484698) b!722959))

(assert (= (and b!722959 res!484702) b!722958))

(assert (= (and b!722958 res!484700) b!722961))

(assert (= (and b!722961 res!484706) b!722953))

(assert (= (and b!722953 c!79500) b!722965))

(assert (= (and b!722953 (not c!79500)) b!722966))

(assert (= (and b!722953 res!484703) b!722954))

(assert (= (and b!722954 res!484707) b!722962))

(declare-fun m!676901 () Bool)

(assert (=> b!722963 m!676901))

(declare-fun m!676903 () Bool)

(assert (=> b!722956 m!676903))

(declare-fun m!676905 () Bool)

(assert (=> b!722964 m!676905))

(declare-fun m!676907 () Bool)

(assert (=> start!64322 m!676907))

(declare-fun m!676909 () Bool)

(assert (=> start!64322 m!676909))

(declare-fun m!676911 () Bool)

(assert (=> b!722958 m!676911))

(assert (=> b!722958 m!676911))

(declare-fun m!676913 () Bool)

(assert (=> b!722958 m!676913))

(assert (=> b!722958 m!676913))

(assert (=> b!722958 m!676911))

(declare-fun m!676915 () Bool)

(assert (=> b!722958 m!676915))

(assert (=> b!722965 m!676911))

(assert (=> b!722965 m!676911))

(declare-fun m!676917 () Bool)

(assert (=> b!722965 m!676917))

(declare-fun m!676919 () Bool)

(assert (=> b!722954 m!676919))

(assert (=> b!722954 m!676919))

(declare-fun m!676921 () Bool)

(assert (=> b!722954 m!676921))

(declare-fun m!676923 () Bool)

(assert (=> b!722954 m!676923))

(declare-fun m!676925 () Bool)

(assert (=> b!722954 m!676925))

(declare-fun m!676927 () Bool)

(assert (=> b!722954 m!676927))

(declare-fun m!676929 () Bool)

(assert (=> b!722962 m!676929))

(declare-fun m!676931 () Bool)

(assert (=> b!722962 m!676931))

(assert (=> b!722966 m!676911))

(assert (=> b!722966 m!676911))

(declare-fun m!676933 () Bool)

(assert (=> b!722966 m!676933))

(declare-fun m!676935 () Bool)

(assert (=> b!722961 m!676935))

(declare-fun m!676937 () Bool)

(assert (=> b!722955 m!676937))

(assert (=> b!722960 m!676911))

(assert (=> b!722960 m!676911))

(declare-fun m!676939 () Bool)

(assert (=> b!722960 m!676939))

(declare-fun m!676941 () Bool)

(assert (=> b!722952 m!676941))

(check-sat (not b!722958) (not b!722956) (not b!722952) (not b!722963) (not b!722954) (not b!722962) (not b!722964) (not start!64322) (not b!722955) (not b!722965) (not b!722966) (not b!722960))
(check-sat)
