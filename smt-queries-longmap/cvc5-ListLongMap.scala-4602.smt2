; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64186 () Bool)

(assert start!64186)

(declare-fun b!720869 () Bool)

(declare-fun res!482978 () Bool)

(declare-fun e!404274 () Bool)

(assert (=> b!720869 (=> (not res!482978) (not e!404274))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40824 0))(
  ( (array!40825 (arr!19536 (Array (_ BitVec 32) (_ BitVec 64))) (size!19957 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40824)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720869 (= res!482978 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19536 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7136 0))(
  ( (MissingZero!7136 (index!30912 (_ BitVec 32))) (Found!7136 (index!30913 (_ BitVec 32))) (Intermediate!7136 (undefined!7948 Bool) (index!30914 (_ BitVec 32)) (x!61920 (_ BitVec 32))) (Undefined!7136) (MissingVacant!7136 (index!30915 (_ BitVec 32))) )
))
(declare-fun lt!319910 () SeekEntryResult!7136)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!720870 () Bool)

(declare-fun e!404273 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40824 (_ BitVec 32)) SeekEntryResult!7136)

(assert (=> b!720870 (= e!404273 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19536 a!3186) j!159) a!3186 mask!3328) lt!319910))))

(declare-fun b!720871 () Bool)

(declare-fun res!482974 () Bool)

(declare-fun e!404272 () Bool)

(assert (=> b!720871 (=> (not res!482974) (not e!404272))))

(assert (=> b!720871 (= res!482974 (and (= (size!19957 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19957 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19957 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720872 () Bool)

(declare-fun res!482977 () Bool)

(assert (=> b!720872 (=> (not res!482977) (not e!404272))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720872 (= res!482977 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720873 () Bool)

(declare-fun res!482976 () Bool)

(assert (=> b!720873 (=> (not res!482976) (not e!404272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720873 (= res!482976 (validKeyInArray!0 k!2102))))

(declare-fun b!720874 () Bool)

(assert (=> b!720874 (= e!404274 false)))

(declare-fun lt!319908 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720874 (= lt!319908 (toIndex!0 (select (store (arr!19536 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720875 () Bool)

(declare-fun res!482984 () Bool)

(declare-fun e!404276 () Bool)

(assert (=> b!720875 (=> (not res!482984) (not e!404276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40824 (_ BitVec 32)) Bool)

(assert (=> b!720875 (= res!482984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!482982 () Bool)

(assert (=> start!64186 (=> (not res!482982) (not e!404272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64186 (= res!482982 (validMask!0 mask!3328))))

(assert (=> start!64186 e!404272))

(assert (=> start!64186 true))

(declare-fun array_inv!15332 (array!40824) Bool)

(assert (=> start!64186 (array_inv!15332 a!3186)))

(declare-fun b!720876 () Bool)

(declare-fun res!482975 () Bool)

(assert (=> b!720876 (=> (not res!482975) (not e!404276))))

(declare-datatypes ((List!13538 0))(
  ( (Nil!13535) (Cons!13534 (h!14585 (_ BitVec 64)) (t!19853 List!13538)) )
))
(declare-fun arrayNoDuplicates!0 (array!40824 (_ BitVec 32) List!13538) Bool)

(assert (=> b!720876 (= res!482975 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13535))))

(declare-fun b!720877 () Bool)

(assert (=> b!720877 (= e!404272 e!404276)))

(declare-fun res!482979 () Bool)

(assert (=> b!720877 (=> (not res!482979) (not e!404276))))

(declare-fun lt!319909 () SeekEntryResult!7136)

(assert (=> b!720877 (= res!482979 (or (= lt!319909 (MissingZero!7136 i!1173)) (= lt!319909 (MissingVacant!7136 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40824 (_ BitVec 32)) SeekEntryResult!7136)

(assert (=> b!720877 (= lt!319909 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720878 () Bool)

(declare-fun res!482980 () Bool)

(assert (=> b!720878 (=> (not res!482980) (not e!404272))))

(assert (=> b!720878 (= res!482980 (validKeyInArray!0 (select (arr!19536 a!3186) j!159)))))

(declare-fun b!720879 () Bool)

(assert (=> b!720879 (= e!404276 e!404274)))

(declare-fun res!482973 () Bool)

(assert (=> b!720879 (=> (not res!482973) (not e!404274))))

(assert (=> b!720879 (= res!482973 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19536 a!3186) j!159) mask!3328) (select (arr!19536 a!3186) j!159) a!3186 mask!3328) lt!319910))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720879 (= lt!319910 (Intermediate!7136 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720880 () Bool)

(declare-fun res!482981 () Bool)

(assert (=> b!720880 (=> (not res!482981) (not e!404274))))

(assert (=> b!720880 (= res!482981 e!404273)))

(declare-fun c!79318 () Bool)

(assert (=> b!720880 (= c!79318 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720881 () Bool)

(declare-fun res!482983 () Bool)

(assert (=> b!720881 (=> (not res!482983) (not e!404276))))

(assert (=> b!720881 (= res!482983 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19957 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19957 a!3186))))))

(declare-fun b!720882 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40824 (_ BitVec 32)) SeekEntryResult!7136)

(assert (=> b!720882 (= e!404273 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19536 a!3186) j!159) a!3186 mask!3328) (Found!7136 j!159)))))

(assert (= (and start!64186 res!482982) b!720871))

(assert (= (and b!720871 res!482974) b!720878))

(assert (= (and b!720878 res!482980) b!720873))

(assert (= (and b!720873 res!482976) b!720872))

(assert (= (and b!720872 res!482977) b!720877))

(assert (= (and b!720877 res!482979) b!720875))

(assert (= (and b!720875 res!482984) b!720876))

(assert (= (and b!720876 res!482975) b!720881))

(assert (= (and b!720881 res!482983) b!720879))

(assert (= (and b!720879 res!482973) b!720869))

(assert (= (and b!720869 res!482978) b!720880))

(assert (= (and b!720880 c!79318) b!720870))

(assert (= (and b!720880 (not c!79318)) b!720882))

(assert (= (and b!720880 res!482981) b!720874))

(declare-fun m!675865 () Bool)

(assert (=> b!720869 m!675865))

(declare-fun m!675867 () Bool)

(assert (=> start!64186 m!675867))

(declare-fun m!675869 () Bool)

(assert (=> start!64186 m!675869))

(declare-fun m!675871 () Bool)

(assert (=> b!720879 m!675871))

(assert (=> b!720879 m!675871))

(declare-fun m!675873 () Bool)

(assert (=> b!720879 m!675873))

(assert (=> b!720879 m!675873))

(assert (=> b!720879 m!675871))

(declare-fun m!675875 () Bool)

(assert (=> b!720879 m!675875))

(declare-fun m!675877 () Bool)

(assert (=> b!720876 m!675877))

(declare-fun m!675879 () Bool)

(assert (=> b!720872 m!675879))

(assert (=> b!720882 m!675871))

(assert (=> b!720882 m!675871))

(declare-fun m!675881 () Bool)

(assert (=> b!720882 m!675881))

(declare-fun m!675883 () Bool)

(assert (=> b!720873 m!675883))

(declare-fun m!675885 () Bool)

(assert (=> b!720874 m!675885))

(declare-fun m!675887 () Bool)

(assert (=> b!720874 m!675887))

(assert (=> b!720874 m!675887))

(declare-fun m!675889 () Bool)

(assert (=> b!720874 m!675889))

(declare-fun m!675891 () Bool)

(assert (=> b!720875 m!675891))

(assert (=> b!720870 m!675871))

(assert (=> b!720870 m!675871))

(declare-fun m!675893 () Bool)

(assert (=> b!720870 m!675893))

(assert (=> b!720878 m!675871))

(assert (=> b!720878 m!675871))

(declare-fun m!675895 () Bool)

(assert (=> b!720878 m!675895))

(declare-fun m!675897 () Bool)

(assert (=> b!720877 m!675897))

(push 1)

