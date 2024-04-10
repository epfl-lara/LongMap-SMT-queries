; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66752 () Bool)

(assert start!66752)

(declare-datatypes ((array!42314 0))(
  ( (array!42315 (arr!20257 (Array (_ BitVec 32) (_ BitVec 64))) (size!20678 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42314)

(declare-fun e!428215 () Bool)

(declare-fun b!768956 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7857 0))(
  ( (MissingZero!7857 (index!33796 (_ BitVec 32))) (Found!7857 (index!33797 (_ BitVec 32))) (Intermediate!7857 (undefined!8669 Bool) (index!33798 (_ BitVec 32)) (x!64732 (_ BitVec 32))) (Undefined!7857) (MissingVacant!7857 (index!33799 (_ BitVec 32))) )
))
(declare-fun lt!342080 () SeekEntryResult!7857)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42314 (_ BitVec 32)) SeekEntryResult!7857)

(assert (=> b!768956 (= e!428215 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342080))))

(declare-fun b!768957 () Bool)

(declare-fun res!519967 () Bool)

(declare-fun e!428214 () Bool)

(assert (=> b!768957 (=> (not res!519967) (not e!428214))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768957 (= res!519967 (validKeyInArray!0 k0!2102))))

(declare-fun b!768958 () Bool)

(declare-fun res!519979 () Bool)

(declare-fun e!428212 () Bool)

(assert (=> b!768958 (=> (not res!519979) (not e!428212))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768958 (= res!519979 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20257 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768959 () Bool)

(declare-fun e!428219 () Bool)

(declare-fun e!428213 () Bool)

(assert (=> b!768959 (= e!428219 e!428213)))

(declare-fun res!519974 () Bool)

(assert (=> b!768959 (=> (not res!519974) (not e!428213))))

(declare-fun lt!342081 () SeekEntryResult!7857)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42314 (_ BitVec 32)) SeekEntryResult!7857)

(assert (=> b!768959 (= res!519974 (= (seekEntryOrOpen!0 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342081))))

(assert (=> b!768959 (= lt!342081 (Found!7857 j!159))))

(declare-fun b!768960 () Bool)

(declare-fun res!519971 () Bool)

(declare-fun e!428210 () Bool)

(assert (=> b!768960 (=> (not res!519971) (not e!428210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42314 (_ BitVec 32)) Bool)

(assert (=> b!768960 (= res!519971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768961 () Bool)

(declare-fun res!519978 () Bool)

(assert (=> b!768961 (=> (not res!519978) (not e!428214))))

(assert (=> b!768961 (= res!519978 (and (= (size!20678 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20678 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20678 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768962 () Bool)

(declare-datatypes ((Unit!26442 0))(
  ( (Unit!26443) )
))
(declare-fun e!428218 () Unit!26442)

(declare-fun Unit!26444 () Unit!26442)

(assert (=> b!768962 (= e!428218 Unit!26444)))

(declare-fun lt!342082 () (_ BitVec 32))

(assert (=> b!768962 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342082 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342080)))

(declare-fun b!768963 () Bool)

(assert (=> b!768963 (= e!428214 e!428210)))

(declare-fun res!519970 () Bool)

(assert (=> b!768963 (=> (not res!519970) (not e!428210))))

(declare-fun lt!342089 () SeekEntryResult!7857)

(assert (=> b!768963 (= res!519970 (or (= lt!342089 (MissingZero!7857 i!1173)) (= lt!342089 (MissingVacant!7857 i!1173))))))

(assert (=> b!768963 (= lt!342089 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!768964 () Bool)

(declare-fun e!428216 () Bool)

(assert (=> b!768964 (= e!428216 true)))

(declare-fun lt!342085 () Unit!26442)

(assert (=> b!768964 (= lt!342085 e!428218)))

(declare-fun c!84891 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768964 (= c!84891 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768964 (= lt!342082 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768965 () Bool)

(declare-fun res!519966 () Bool)

(assert (=> b!768965 (=> (not res!519966) (not e!428212))))

(assert (=> b!768965 (= res!519966 e!428215)))

(declare-fun c!84892 () Bool)

(assert (=> b!768965 (= c!84892 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!519977 () Bool)

(assert (=> start!66752 (=> (not res!519977) (not e!428214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66752 (= res!519977 (validMask!0 mask!3328))))

(assert (=> start!66752 e!428214))

(assert (=> start!66752 true))

(declare-fun array_inv!16053 (array!42314) Bool)

(assert (=> start!66752 (array_inv!16053 a!3186)))

(declare-fun b!768966 () Bool)

(declare-fun res!519980 () Bool)

(assert (=> b!768966 (=> (not res!519980) (not e!428210))))

(assert (=> b!768966 (= res!519980 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20678 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20678 a!3186))))))

(declare-fun b!768967 () Bool)

(assert (=> b!768967 (= e!428210 e!428212)))

(declare-fun res!519973 () Bool)

(assert (=> b!768967 (=> (not res!519973) (not e!428212))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768967 (= res!519973 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20257 a!3186) j!159) mask!3328) (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342080))))

(assert (=> b!768967 (= lt!342080 (Intermediate!7857 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768968 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42314 (_ BitVec 32)) SeekEntryResult!7857)

(assert (=> b!768968 (= e!428215 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) (Found!7857 j!159)))))

(declare-fun b!768969 () Bool)

(declare-fun e!428211 () Bool)

(assert (=> b!768969 (= e!428212 e!428211)))

(declare-fun res!519976 () Bool)

(assert (=> b!768969 (=> (not res!519976) (not e!428211))))

(declare-fun lt!342083 () SeekEntryResult!7857)

(declare-fun lt!342086 () SeekEntryResult!7857)

(assert (=> b!768969 (= res!519976 (= lt!342083 lt!342086))))

(declare-fun lt!342084 () (_ BitVec 64))

(declare-fun lt!342088 () array!42314)

(assert (=> b!768969 (= lt!342086 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342084 lt!342088 mask!3328))))

(assert (=> b!768969 (= lt!342083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342084 mask!3328) lt!342084 lt!342088 mask!3328))))

(assert (=> b!768969 (= lt!342084 (select (store (arr!20257 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768969 (= lt!342088 (array!42315 (store (arr!20257 a!3186) i!1173 k0!2102) (size!20678 a!3186)))))

(declare-fun b!768970 () Bool)

(declare-fun res!519968 () Bool)

(assert (=> b!768970 (=> (not res!519968) (not e!428214))))

(assert (=> b!768970 (= res!519968 (validKeyInArray!0 (select (arr!20257 a!3186) j!159)))))

(declare-fun b!768971 () Bool)

(assert (=> b!768971 (= e!428213 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342081))))

(declare-fun b!768972 () Bool)

(declare-fun res!519965 () Bool)

(assert (=> b!768972 (=> (not res!519965) (not e!428210))))

(declare-datatypes ((List!14259 0))(
  ( (Nil!14256) (Cons!14255 (h!15354 (_ BitVec 64)) (t!20574 List!14259)) )
))
(declare-fun arrayNoDuplicates!0 (array!42314 (_ BitVec 32) List!14259) Bool)

(assert (=> b!768972 (= res!519965 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14256))))

(declare-fun b!768973 () Bool)

(declare-fun res!519969 () Bool)

(assert (=> b!768973 (=> (not res!519969) (not e!428214))))

(declare-fun arrayContainsKey!0 (array!42314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768973 (= res!519969 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768974 () Bool)

(assert (=> b!768974 (= e!428211 (not e!428216))))

(declare-fun res!519975 () Bool)

(assert (=> b!768974 (=> res!519975 e!428216)))

(get-info :version)

(assert (=> b!768974 (= res!519975 (or (not ((_ is Intermediate!7857) lt!342086)) (bvsge x!1131 (x!64732 lt!342086))))))

(assert (=> b!768974 e!428219))

(declare-fun res!519972 () Bool)

(assert (=> b!768974 (=> (not res!519972) (not e!428219))))

(assert (=> b!768974 (= res!519972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342087 () Unit!26442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26442)

(assert (=> b!768974 (= lt!342087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768975 () Bool)

(declare-fun Unit!26445 () Unit!26442)

(assert (=> b!768975 (= e!428218 Unit!26445)))

(declare-fun lt!342079 () SeekEntryResult!7857)

(assert (=> b!768975 (= lt!342079 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!768975 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342082 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) (Found!7857 j!159))))

(assert (= (and start!66752 res!519977) b!768961))

(assert (= (and b!768961 res!519978) b!768970))

(assert (= (and b!768970 res!519968) b!768957))

(assert (= (and b!768957 res!519967) b!768973))

(assert (= (and b!768973 res!519969) b!768963))

(assert (= (and b!768963 res!519970) b!768960))

(assert (= (and b!768960 res!519971) b!768972))

(assert (= (and b!768972 res!519965) b!768966))

(assert (= (and b!768966 res!519980) b!768967))

(assert (= (and b!768967 res!519973) b!768958))

(assert (= (and b!768958 res!519979) b!768965))

(assert (= (and b!768965 c!84892) b!768956))

(assert (= (and b!768965 (not c!84892)) b!768968))

(assert (= (and b!768965 res!519966) b!768969))

(assert (= (and b!768969 res!519976) b!768974))

(assert (= (and b!768974 res!519972) b!768959))

(assert (= (and b!768959 res!519974) b!768971))

(assert (= (and b!768974 (not res!519975)) b!768964))

(assert (= (and b!768964 c!84891) b!768962))

(assert (= (and b!768964 (not c!84891)) b!768975))

(declare-fun m!714435 () Bool)

(assert (=> start!66752 m!714435))

(declare-fun m!714437 () Bool)

(assert (=> start!66752 m!714437))

(declare-fun m!714439 () Bool)

(assert (=> b!768959 m!714439))

(assert (=> b!768959 m!714439))

(declare-fun m!714441 () Bool)

(assert (=> b!768959 m!714441))

(declare-fun m!714443 () Bool)

(assert (=> b!768964 m!714443))

(declare-fun m!714445 () Bool)

(assert (=> b!768957 m!714445))

(declare-fun m!714447 () Bool)

(assert (=> b!768963 m!714447))

(assert (=> b!768975 m!714439))

(assert (=> b!768975 m!714439))

(declare-fun m!714449 () Bool)

(assert (=> b!768975 m!714449))

(assert (=> b!768975 m!714439))

(declare-fun m!714451 () Bool)

(assert (=> b!768975 m!714451))

(assert (=> b!768970 m!714439))

(assert (=> b!768970 m!714439))

(declare-fun m!714453 () Bool)

(assert (=> b!768970 m!714453))

(declare-fun m!714455 () Bool)

(assert (=> b!768960 m!714455))

(declare-fun m!714457 () Bool)

(assert (=> b!768969 m!714457))

(declare-fun m!714459 () Bool)

(assert (=> b!768969 m!714459))

(declare-fun m!714461 () Bool)

(assert (=> b!768969 m!714461))

(declare-fun m!714463 () Bool)

(assert (=> b!768969 m!714463))

(declare-fun m!714465 () Bool)

(assert (=> b!768969 m!714465))

(assert (=> b!768969 m!714459))

(assert (=> b!768971 m!714439))

(assert (=> b!768971 m!714439))

(declare-fun m!714467 () Bool)

(assert (=> b!768971 m!714467))

(declare-fun m!714469 () Bool)

(assert (=> b!768972 m!714469))

(declare-fun m!714471 () Bool)

(assert (=> b!768974 m!714471))

(declare-fun m!714473 () Bool)

(assert (=> b!768974 m!714473))

(declare-fun m!714475 () Bool)

(assert (=> b!768973 m!714475))

(assert (=> b!768962 m!714439))

(assert (=> b!768962 m!714439))

(declare-fun m!714477 () Bool)

(assert (=> b!768962 m!714477))

(assert (=> b!768967 m!714439))

(assert (=> b!768967 m!714439))

(declare-fun m!714479 () Bool)

(assert (=> b!768967 m!714479))

(assert (=> b!768967 m!714479))

(assert (=> b!768967 m!714439))

(declare-fun m!714481 () Bool)

(assert (=> b!768967 m!714481))

(assert (=> b!768968 m!714439))

(assert (=> b!768968 m!714439))

(assert (=> b!768968 m!714449))

(declare-fun m!714483 () Bool)

(assert (=> b!768958 m!714483))

(assert (=> b!768956 m!714439))

(assert (=> b!768956 m!714439))

(declare-fun m!714485 () Bool)

(assert (=> b!768956 m!714485))

(check-sat (not b!768971) (not b!768968) (not b!768973) (not b!768975) (not b!768962) (not b!768967) (not b!768972) (not b!768969) (not b!768964) (not b!768974) (not b!768963) (not b!768970) (not b!768960) (not b!768959) (not b!768956) (not start!66752) (not b!768957))
(check-sat)
