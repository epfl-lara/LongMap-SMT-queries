; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46980 () Bool)

(assert start!46980)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!517936 () Bool)

(declare-datatypes ((array!33121 0))(
  ( (array!33122 (arr!15924 (Array (_ BitVec 32) (_ BitVec 64))) (size!16288 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33121)

(declare-fun e!302244 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4391 0))(
  ( (MissingZero!4391 (index!19752 (_ BitVec 32))) (Found!4391 (index!19753 (_ BitVec 32))) (Intermediate!4391 (undefined!5203 Bool) (index!19754 (_ BitVec 32)) (x!48724 (_ BitVec 32))) (Undefined!4391) (MissingVacant!4391 (index!19755 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33121 (_ BitVec 32)) SeekEntryResult!4391)

(assert (=> b!517936 (= e!302244 (= (seekEntryOrOpen!0 (select (arr!15924 a!3235) j!176) a!3235 mask!3524) (Found!4391 j!176)))))

(declare-fun res!316953 () Bool)

(declare-fun e!302246 () Bool)

(assert (=> start!46980 (=> (not res!316953) (not e!302246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46980 (= res!316953 (validMask!0 mask!3524))))

(assert (=> start!46980 e!302246))

(assert (=> start!46980 true))

(declare-fun array_inv!11720 (array!33121) Bool)

(assert (=> start!46980 (array_inv!11720 a!3235)))

(declare-fun b!517937 () Bool)

(declare-fun res!316954 () Bool)

(declare-fun e!302243 () Bool)

(assert (=> b!517937 (=> (not res!316954) (not e!302243))))

(declare-datatypes ((List!10082 0))(
  ( (Nil!10079) (Cons!10078 (h!10985 (_ BitVec 64)) (t!16310 List!10082)) )
))
(declare-fun arrayNoDuplicates!0 (array!33121 (_ BitVec 32) List!10082) Bool)

(assert (=> b!517937 (= res!316954 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10079))))

(declare-fun b!517938 () Bool)

(declare-fun res!316961 () Bool)

(declare-fun e!302245 () Bool)

(assert (=> b!517938 (=> res!316961 e!302245)))

(declare-fun lt!237090 () SeekEntryResult!4391)

(assert (=> b!517938 (= res!316961 (or (undefined!5203 lt!237090) (not (is-Intermediate!4391 lt!237090))))))

(declare-fun b!517939 () Bool)

(declare-fun res!316952 () Bool)

(assert (=> b!517939 (=> (not res!316952) (not e!302246))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517939 (= res!316952 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517940 () Bool)

(assert (=> b!517940 (= e!302246 e!302243)))

(declare-fun res!316956 () Bool)

(assert (=> b!517940 (=> (not res!316956) (not e!302243))))

(declare-fun lt!237087 () SeekEntryResult!4391)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517940 (= res!316956 (or (= lt!237087 (MissingZero!4391 i!1204)) (= lt!237087 (MissingVacant!4391 i!1204))))))

(assert (=> b!517940 (= lt!237087 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!517941 () Bool)

(declare-fun res!316951 () Bool)

(assert (=> b!517941 (=> (not res!316951) (not e!302246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517941 (= res!316951 (validKeyInArray!0 (select (arr!15924 a!3235) j!176)))))

(declare-fun b!517942 () Bool)

(declare-fun res!316957 () Bool)

(assert (=> b!517942 (=> (not res!316957) (not e!302246))))

(assert (=> b!517942 (= res!316957 (and (= (size!16288 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16288 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16288 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517943 () Bool)

(declare-fun res!316955 () Bool)

(assert (=> b!517943 (=> (not res!316955) (not e!302246))))

(assert (=> b!517943 (= res!316955 (validKeyInArray!0 k!2280))))

(declare-fun b!517944 () Bool)

(assert (=> b!517944 (= e!302243 (not e!302245))))

(declare-fun res!316960 () Bool)

(assert (=> b!517944 (=> res!316960 e!302245)))

(declare-fun lt!237091 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33121 (_ BitVec 32)) SeekEntryResult!4391)

(assert (=> b!517944 (= res!316960 (= lt!237090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237091 (select (store (arr!15924 a!3235) i!1204 k!2280) j!176) (array!33122 (store (arr!15924 a!3235) i!1204 k!2280) (size!16288 a!3235)) mask!3524)))))

(declare-fun lt!237089 () (_ BitVec 32))

(assert (=> b!517944 (= lt!237090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237089 (select (arr!15924 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517944 (= lt!237091 (toIndex!0 (select (store (arr!15924 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517944 (= lt!237089 (toIndex!0 (select (arr!15924 a!3235) j!176) mask!3524))))

(assert (=> b!517944 e!302244))

(declare-fun res!316958 () Bool)

(assert (=> b!517944 (=> (not res!316958) (not e!302244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33121 (_ BitVec 32)) Bool)

(assert (=> b!517944 (= res!316958 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16040 0))(
  ( (Unit!16041) )
))
(declare-fun lt!237088 () Unit!16040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16040)

(assert (=> b!517944 (= lt!237088 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517945 () Bool)

(assert (=> b!517945 (= e!302245 true)))

(assert (=> b!517945 (and (bvslt (x!48724 lt!237090) #b01111111111111111111111111111110) (or (= (select (arr!15924 a!3235) (index!19754 lt!237090)) (select (arr!15924 a!3235) j!176)) (= (select (arr!15924 a!3235) (index!19754 lt!237090)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15924 a!3235) (index!19754 lt!237090)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517946 () Bool)

(declare-fun res!316959 () Bool)

(assert (=> b!517946 (=> (not res!316959) (not e!302243))))

(assert (=> b!517946 (= res!316959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46980 res!316953) b!517942))

(assert (= (and b!517942 res!316957) b!517941))

(assert (= (and b!517941 res!316951) b!517943))

(assert (= (and b!517943 res!316955) b!517939))

(assert (= (and b!517939 res!316952) b!517940))

(assert (= (and b!517940 res!316956) b!517946))

(assert (= (and b!517946 res!316959) b!517937))

(assert (= (and b!517937 res!316954) b!517944))

(assert (= (and b!517944 res!316958) b!517936))

(assert (= (and b!517944 (not res!316960)) b!517938))

(assert (= (and b!517938 (not res!316961)) b!517945))

(declare-fun m!499257 () Bool)

(assert (=> b!517936 m!499257))

(assert (=> b!517936 m!499257))

(declare-fun m!499259 () Bool)

(assert (=> b!517936 m!499259))

(declare-fun m!499261 () Bool)

(assert (=> b!517943 m!499261))

(declare-fun m!499263 () Bool)

(assert (=> start!46980 m!499263))

(declare-fun m!499265 () Bool)

(assert (=> start!46980 m!499265))

(declare-fun m!499267 () Bool)

(assert (=> b!517946 m!499267))

(declare-fun m!499269 () Bool)

(assert (=> b!517939 m!499269))

(assert (=> b!517941 m!499257))

(assert (=> b!517941 m!499257))

(declare-fun m!499271 () Bool)

(assert (=> b!517941 m!499271))

(declare-fun m!499273 () Bool)

(assert (=> b!517945 m!499273))

(assert (=> b!517945 m!499257))

(declare-fun m!499275 () Bool)

(assert (=> b!517944 m!499275))

(declare-fun m!499277 () Bool)

(assert (=> b!517944 m!499277))

(declare-fun m!499279 () Bool)

(assert (=> b!517944 m!499279))

(assert (=> b!517944 m!499257))

(declare-fun m!499281 () Bool)

(assert (=> b!517944 m!499281))

(assert (=> b!517944 m!499279))

(declare-fun m!499283 () Bool)

(assert (=> b!517944 m!499283))

(assert (=> b!517944 m!499257))

(declare-fun m!499285 () Bool)

(assert (=> b!517944 m!499285))

(assert (=> b!517944 m!499257))

(declare-fun m!499287 () Bool)

(assert (=> b!517944 m!499287))

(assert (=> b!517944 m!499279))

(declare-fun m!499289 () Bool)

(assert (=> b!517944 m!499289))

(declare-fun m!499291 () Bool)

(assert (=> b!517940 m!499291))

(declare-fun m!499293 () Bool)

(assert (=> b!517937 m!499293))

(push 1)

