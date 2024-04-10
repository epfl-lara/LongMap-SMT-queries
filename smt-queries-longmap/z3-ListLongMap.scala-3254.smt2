; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45398 () Bool)

(assert start!45398)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!292393 () Bool)

(declare-datatypes ((array!32223 0))(
  ( (array!32224 (arr!15493 (Array (_ BitVec 32) (_ BitVec 64))) (size!15857 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32223)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!498918 () Bool)

(declare-datatypes ((SeekEntryResult!3960 0))(
  ( (MissingZero!3960 (index!18022 (_ BitVec 32))) (Found!3960 (index!18023 (_ BitVec 32))) (Intermediate!3960 (undefined!4772 Bool) (index!18024 (_ BitVec 32)) (x!47069 (_ BitVec 32))) (Undefined!3960) (MissingVacant!3960 (index!18025 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32223 (_ BitVec 32)) SeekEntryResult!3960)

(assert (=> b!498918 (= e!292393 (= (seekEntryOrOpen!0 (select (arr!15493 a!3235) j!176) a!3235 mask!3524) (Found!3960 j!176)))))

(declare-fun b!498919 () Bool)

(declare-fun e!292395 () Bool)

(assert (=> b!498919 (= e!292395 false)))

(declare-fun b!498920 () Bool)

(declare-fun e!292391 () Bool)

(assert (=> b!498920 (= e!292391 true)))

(declare-fun lt!226108 () (_ BitVec 64))

(declare-fun lt!226106 () array!32223)

(declare-fun lt!226107 () SeekEntryResult!3960)

(declare-fun lt!226103 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32223 (_ BitVec 32)) SeekEntryResult!3960)

(assert (=> b!498920 (= lt!226107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226103 lt!226108 lt!226106 mask!3524))))

(declare-fun b!498921 () Bool)

(declare-fun res!300962 () Bool)

(declare-fun e!292394 () Bool)

(assert (=> b!498921 (=> (not res!300962) (not e!292394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32223 (_ BitVec 32)) Bool)

(assert (=> b!498921 (= res!300962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498922 () Bool)

(declare-fun res!300955 () Bool)

(assert (=> b!498922 (=> (not res!300955) (not e!292394))))

(declare-datatypes ((List!9651 0))(
  ( (Nil!9648) (Cons!9647 (h!10521 (_ BitVec 64)) (t!15879 List!9651)) )
))
(declare-fun arrayNoDuplicates!0 (array!32223 (_ BitVec 32) List!9651) Bool)

(assert (=> b!498922 (= res!300955 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9648))))

(declare-fun b!498923 () Bool)

(declare-fun res!300957 () Bool)

(declare-fun e!292398 () Bool)

(assert (=> b!498923 (=> (not res!300957) (not e!292398))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498923 (= res!300957 (and (= (size!15857 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15857 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15857 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!300958 () Bool)

(assert (=> start!45398 (=> (not res!300958) (not e!292398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45398 (= res!300958 (validMask!0 mask!3524))))

(assert (=> start!45398 e!292398))

(assert (=> start!45398 true))

(declare-fun array_inv!11289 (array!32223) Bool)

(assert (=> start!45398 (array_inv!11289 a!3235)))

(declare-fun b!498924 () Bool)

(declare-datatypes ((Unit!14916 0))(
  ( (Unit!14917) )
))
(declare-fun e!292396 () Unit!14916)

(declare-fun Unit!14918 () Unit!14916)

(assert (=> b!498924 (= e!292396 Unit!14918)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!226105 () Unit!14916)

(declare-fun lt!226102 () SeekEntryResult!3960)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32223 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14916)

(assert (=> b!498924 (= lt!226105 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226103 #b00000000000000000000000000000000 (index!18024 lt!226102) (x!47069 lt!226102) mask!3524))))

(declare-fun res!300961 () Bool)

(assert (=> b!498924 (= res!300961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226103 lt!226108 lt!226106 mask!3524) (Intermediate!3960 false (index!18024 lt!226102) (x!47069 lt!226102))))))

(assert (=> b!498924 (=> (not res!300961) (not e!292395))))

(assert (=> b!498924 e!292395))

(declare-fun b!498925 () Bool)

(declare-fun res!300956 () Bool)

(assert (=> b!498925 (=> (not res!300956) (not e!292398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498925 (= res!300956 (validKeyInArray!0 (select (arr!15493 a!3235) j!176)))))

(declare-fun b!498926 () Bool)

(declare-fun res!300950 () Bool)

(assert (=> b!498926 (=> (not res!300950) (not e!292398))))

(declare-fun arrayContainsKey!0 (array!32223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498926 (= res!300950 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498927 () Bool)

(declare-fun res!300951 () Bool)

(assert (=> b!498927 (=> (not res!300951) (not e!292398))))

(assert (=> b!498927 (= res!300951 (validKeyInArray!0 k0!2280))))

(declare-fun b!498928 () Bool)

(declare-fun res!300952 () Bool)

(declare-fun e!292397 () Bool)

(assert (=> b!498928 (=> res!300952 e!292397)))

(get-info :version)

(assert (=> b!498928 (= res!300952 (or (undefined!4772 lt!226102) (not ((_ is Intermediate!3960) lt!226102))))))

(declare-fun b!498929 () Bool)

(assert (=> b!498929 (= e!292397 e!292391)))

(declare-fun res!300960 () Bool)

(assert (=> b!498929 (=> res!300960 e!292391)))

(assert (=> b!498929 (= res!300960 (or (bvsgt #b00000000000000000000000000000000 (x!47069 lt!226102)) (bvsgt (x!47069 lt!226102) #b01111111111111111111111111111110) (bvslt lt!226103 #b00000000000000000000000000000000) (bvsge lt!226103 (size!15857 a!3235)) (bvslt (index!18024 lt!226102) #b00000000000000000000000000000000) (bvsge (index!18024 lt!226102) (size!15857 a!3235)) (not (= lt!226102 (Intermediate!3960 false (index!18024 lt!226102) (x!47069 lt!226102))))))))

(assert (=> b!498929 (and (or (= (select (arr!15493 a!3235) (index!18024 lt!226102)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15493 a!3235) (index!18024 lt!226102)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15493 a!3235) (index!18024 lt!226102)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15493 a!3235) (index!18024 lt!226102)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226101 () Unit!14916)

(assert (=> b!498929 (= lt!226101 e!292396)))

(declare-fun c!59261 () Bool)

(assert (=> b!498929 (= c!59261 (= (select (arr!15493 a!3235) (index!18024 lt!226102)) (select (arr!15493 a!3235) j!176)))))

(assert (=> b!498929 (and (bvslt (x!47069 lt!226102) #b01111111111111111111111111111110) (or (= (select (arr!15493 a!3235) (index!18024 lt!226102)) (select (arr!15493 a!3235) j!176)) (= (select (arr!15493 a!3235) (index!18024 lt!226102)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15493 a!3235) (index!18024 lt!226102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498930 () Bool)

(declare-fun Unit!14919 () Unit!14916)

(assert (=> b!498930 (= e!292396 Unit!14919)))

(declare-fun b!498931 () Bool)

(assert (=> b!498931 (= e!292398 e!292394)))

(declare-fun res!300953 () Bool)

(assert (=> b!498931 (=> (not res!300953) (not e!292394))))

(declare-fun lt!226100 () SeekEntryResult!3960)

(assert (=> b!498931 (= res!300953 (or (= lt!226100 (MissingZero!3960 i!1204)) (= lt!226100 (MissingVacant!3960 i!1204))))))

(assert (=> b!498931 (= lt!226100 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498932 () Bool)

(assert (=> b!498932 (= e!292394 (not e!292397))))

(declare-fun res!300954 () Bool)

(assert (=> b!498932 (=> res!300954 e!292397)))

(declare-fun lt!226099 () (_ BitVec 32))

(assert (=> b!498932 (= res!300954 (= lt!226102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226099 lt!226108 lt!226106 mask!3524)))))

(assert (=> b!498932 (= lt!226102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226103 (select (arr!15493 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498932 (= lt!226099 (toIndex!0 lt!226108 mask!3524))))

(assert (=> b!498932 (= lt!226108 (select (store (arr!15493 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498932 (= lt!226103 (toIndex!0 (select (arr!15493 a!3235) j!176) mask!3524))))

(assert (=> b!498932 (= lt!226106 (array!32224 (store (arr!15493 a!3235) i!1204 k0!2280) (size!15857 a!3235)))))

(assert (=> b!498932 e!292393))

(declare-fun res!300959 () Bool)

(assert (=> b!498932 (=> (not res!300959) (not e!292393))))

(assert (=> b!498932 (= res!300959 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226104 () Unit!14916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14916)

(assert (=> b!498932 (= lt!226104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45398 res!300958) b!498923))

(assert (= (and b!498923 res!300957) b!498925))

(assert (= (and b!498925 res!300956) b!498927))

(assert (= (and b!498927 res!300951) b!498926))

(assert (= (and b!498926 res!300950) b!498931))

(assert (= (and b!498931 res!300953) b!498921))

(assert (= (and b!498921 res!300962) b!498922))

(assert (= (and b!498922 res!300955) b!498932))

(assert (= (and b!498932 res!300959) b!498918))

(assert (= (and b!498932 (not res!300954)) b!498928))

(assert (= (and b!498928 (not res!300952)) b!498929))

(assert (= (and b!498929 c!59261) b!498924))

(assert (= (and b!498929 (not c!59261)) b!498930))

(assert (= (and b!498924 res!300961) b!498919))

(assert (= (and b!498929 (not res!300960)) b!498920))

(declare-fun m!480153 () Bool)

(assert (=> b!498922 m!480153))

(declare-fun m!480155 () Bool)

(assert (=> b!498921 m!480155))

(declare-fun m!480157 () Bool)

(assert (=> b!498925 m!480157))

(assert (=> b!498925 m!480157))

(declare-fun m!480159 () Bool)

(assert (=> b!498925 m!480159))

(declare-fun m!480161 () Bool)

(assert (=> b!498926 m!480161))

(declare-fun m!480163 () Bool)

(assert (=> start!45398 m!480163))

(declare-fun m!480165 () Bool)

(assert (=> start!45398 m!480165))

(assert (=> b!498918 m!480157))

(assert (=> b!498918 m!480157))

(declare-fun m!480167 () Bool)

(assert (=> b!498918 m!480167))

(declare-fun m!480169 () Bool)

(assert (=> b!498929 m!480169))

(assert (=> b!498929 m!480157))

(declare-fun m!480171 () Bool)

(assert (=> b!498920 m!480171))

(declare-fun m!480173 () Bool)

(assert (=> b!498924 m!480173))

(assert (=> b!498924 m!480171))

(declare-fun m!480175 () Bool)

(assert (=> b!498931 m!480175))

(declare-fun m!480177 () Bool)

(assert (=> b!498932 m!480177))

(declare-fun m!480179 () Bool)

(assert (=> b!498932 m!480179))

(declare-fun m!480181 () Bool)

(assert (=> b!498932 m!480181))

(assert (=> b!498932 m!480157))

(declare-fun m!480183 () Bool)

(assert (=> b!498932 m!480183))

(assert (=> b!498932 m!480157))

(declare-fun m!480185 () Bool)

(assert (=> b!498932 m!480185))

(declare-fun m!480187 () Bool)

(assert (=> b!498932 m!480187))

(declare-fun m!480189 () Bool)

(assert (=> b!498932 m!480189))

(assert (=> b!498932 m!480157))

(declare-fun m!480191 () Bool)

(assert (=> b!498932 m!480191))

(declare-fun m!480193 () Bool)

(assert (=> b!498927 m!480193))

(check-sat (not b!498931) (not b!498924) (not b!498927) (not b!498932) (not b!498926) (not b!498925) (not b!498918) (not b!498922) (not start!45398) (not b!498921) (not b!498920))
(check-sat)
