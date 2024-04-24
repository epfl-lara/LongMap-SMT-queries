; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65532 () Bool)

(assert start!65532)

(declare-fun b!745085 () Bool)

(declare-fun e!416286 () Bool)

(declare-fun e!416287 () Bool)

(assert (=> b!745085 (= e!416286 e!416287)))

(declare-fun res!501648 () Bool)

(assert (=> b!745085 (=> (not res!501648) (not e!416287))))

(declare-datatypes ((array!41575 0))(
  ( (array!41576 (arr!19897 (Array (_ BitVec 32) (_ BitVec 64))) (size!20317 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41575)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7453 0))(
  ( (MissingZero!7453 (index!32180 (_ BitVec 32))) (Found!7453 (index!32181 (_ BitVec 32))) (Intermediate!7453 (undefined!8265 Bool) (index!32182 (_ BitVec 32)) (x!63303 (_ BitVec 32))) (Undefined!7453) (MissingVacant!7453 (index!32183 (_ BitVec 32))) )
))
(declare-fun lt!330981 () SeekEntryResult!7453)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41575 (_ BitVec 32)) SeekEntryResult!7453)

(assert (=> b!745085 (= res!501648 (= (seekEntryOrOpen!0 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330981))))

(assert (=> b!745085 (= lt!330981 (Found!7453 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745086 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41575 (_ BitVec 32)) SeekEntryResult!7453)

(assert (=> b!745086 (= e!416287 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330981))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!745087 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!416284 () Bool)

(assert (=> b!745087 (= e!416284 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) (Found!7453 j!159)))))

(declare-fun b!745088 () Bool)

(declare-fun res!501644 () Bool)

(declare-fun e!416288 () Bool)

(assert (=> b!745088 (=> (not res!501644) (not e!416288))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745088 (= res!501644 (validKeyInArray!0 k0!2102))))

(declare-fun b!745089 () Bool)

(declare-fun e!416291 () Bool)

(assert (=> b!745089 (= e!416288 e!416291)))

(declare-fun res!501649 () Bool)

(assert (=> b!745089 (=> (not res!501649) (not e!416291))))

(declare-fun lt!330978 () SeekEntryResult!7453)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745089 (= res!501649 (or (= lt!330978 (MissingZero!7453 i!1173)) (= lt!330978 (MissingVacant!7453 i!1173))))))

(assert (=> b!745089 (= lt!330978 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745090 () Bool)

(declare-fun res!501640 () Bool)

(assert (=> b!745090 (=> (not res!501640) (not e!416288))))

(assert (=> b!745090 (= res!501640 (validKeyInArray!0 (select (arr!19897 a!3186) j!159)))))

(declare-fun b!745091 () Bool)

(declare-fun res!501652 () Bool)

(assert (=> b!745091 (=> (not res!501652) (not e!416291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41575 (_ BitVec 32)) Bool)

(assert (=> b!745091 (= res!501652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745092 () Bool)

(declare-fun res!501643 () Bool)

(declare-fun e!416290 () Bool)

(assert (=> b!745092 (=> (not res!501643) (not e!416290))))

(assert (=> b!745092 (= res!501643 e!416284)))

(declare-fun c!82106 () Bool)

(assert (=> b!745092 (= c!82106 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745093 () Bool)

(assert (=> b!745093 (= e!416291 e!416290)))

(declare-fun res!501651 () Bool)

(assert (=> b!745093 (=> (not res!501651) (not e!416290))))

(declare-fun lt!330984 () SeekEntryResult!7453)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41575 (_ BitVec 32)) SeekEntryResult!7453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745093 (= res!501651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19897 a!3186) j!159) mask!3328) (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330984))))

(assert (=> b!745093 (= lt!330984 (Intermediate!7453 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745094 () Bool)

(declare-fun res!501646 () Bool)

(assert (=> b!745094 (=> (not res!501646) (not e!416288))))

(declare-fun arrayContainsKey!0 (array!41575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745094 (= res!501646 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!501641 () Bool)

(assert (=> start!65532 (=> (not res!501641) (not e!416288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65532 (= res!501641 (validMask!0 mask!3328))))

(assert (=> start!65532 e!416288))

(assert (=> start!65532 true))

(declare-fun array_inv!15756 (array!41575) Bool)

(assert (=> start!65532 (array_inv!15756 a!3186)))

(declare-fun b!745095 () Bool)

(declare-fun res!501653 () Bool)

(assert (=> b!745095 (=> (not res!501653) (not e!416288))))

(assert (=> b!745095 (= res!501653 (and (= (size!20317 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20317 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20317 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745096 () Bool)

(assert (=> b!745096 (= e!416284 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330984))))

(declare-fun b!745097 () Bool)

(declare-fun res!501647 () Bool)

(assert (=> b!745097 (=> (not res!501647) (not e!416291))))

(declare-datatypes ((List!13806 0))(
  ( (Nil!13803) (Cons!13802 (h!14880 (_ BitVec 64)) (t!20113 List!13806)) )
))
(declare-fun arrayNoDuplicates!0 (array!41575 (_ BitVec 32) List!13806) Bool)

(assert (=> b!745097 (= res!501647 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13803))))

(declare-fun b!745098 () Bool)

(declare-fun e!416289 () Bool)

(assert (=> b!745098 (= e!416289 true)))

(declare-fun lt!330983 () SeekEntryResult!7453)

(assert (=> b!745098 (= lt!330983 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19897 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745099 () Bool)

(declare-fun res!501655 () Bool)

(assert (=> b!745099 (=> (not res!501655) (not e!416290))))

(assert (=> b!745099 (= res!501655 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19897 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745100 () Bool)

(declare-fun e!416292 () Bool)

(assert (=> b!745100 (= e!416292 (not e!416289))))

(declare-fun res!501642 () Bool)

(assert (=> b!745100 (=> res!501642 e!416289)))

(declare-fun lt!330980 () SeekEntryResult!7453)

(get-info :version)

(assert (=> b!745100 (= res!501642 (or (not ((_ is Intermediate!7453) lt!330980)) (bvslt x!1131 (x!63303 lt!330980)) (not (= x!1131 (x!63303 lt!330980))) (not (= index!1321 (index!32182 lt!330980)))))))

(assert (=> b!745100 e!416286))

(declare-fun res!501650 () Bool)

(assert (=> b!745100 (=> (not res!501650) (not e!416286))))

(assert (=> b!745100 (= res!501650 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25465 0))(
  ( (Unit!25466) )
))
(declare-fun lt!330982 () Unit!25465)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25465)

(assert (=> b!745100 (= lt!330982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745101 () Bool)

(declare-fun res!501645 () Bool)

(assert (=> b!745101 (=> (not res!501645) (not e!416291))))

(assert (=> b!745101 (= res!501645 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20317 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20317 a!3186))))))

(declare-fun b!745102 () Bool)

(assert (=> b!745102 (= e!416290 e!416292)))

(declare-fun res!501654 () Bool)

(assert (=> b!745102 (=> (not res!501654) (not e!416292))))

(declare-fun lt!330976 () SeekEntryResult!7453)

(assert (=> b!745102 (= res!501654 (= lt!330976 lt!330980))))

(declare-fun lt!330979 () (_ BitVec 64))

(declare-fun lt!330977 () array!41575)

(assert (=> b!745102 (= lt!330980 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330979 lt!330977 mask!3328))))

(assert (=> b!745102 (= lt!330976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330979 mask!3328) lt!330979 lt!330977 mask!3328))))

(assert (=> b!745102 (= lt!330979 (select (store (arr!19897 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745102 (= lt!330977 (array!41576 (store (arr!19897 a!3186) i!1173 k0!2102) (size!20317 a!3186)))))

(assert (= (and start!65532 res!501641) b!745095))

(assert (= (and b!745095 res!501653) b!745090))

(assert (= (and b!745090 res!501640) b!745088))

(assert (= (and b!745088 res!501644) b!745094))

(assert (= (and b!745094 res!501646) b!745089))

(assert (= (and b!745089 res!501649) b!745091))

(assert (= (and b!745091 res!501652) b!745097))

(assert (= (and b!745097 res!501647) b!745101))

(assert (= (and b!745101 res!501645) b!745093))

(assert (= (and b!745093 res!501651) b!745099))

(assert (= (and b!745099 res!501655) b!745092))

(assert (= (and b!745092 c!82106) b!745096))

(assert (= (and b!745092 (not c!82106)) b!745087))

(assert (= (and b!745092 res!501643) b!745102))

(assert (= (and b!745102 res!501654) b!745100))

(assert (= (and b!745100 res!501650) b!745085))

(assert (= (and b!745085 res!501648) b!745086))

(assert (= (and b!745100 (not res!501642)) b!745098))

(declare-fun m!696045 () Bool)

(assert (=> start!65532 m!696045))

(declare-fun m!696047 () Bool)

(assert (=> start!65532 m!696047))

(declare-fun m!696049 () Bool)

(assert (=> b!745096 m!696049))

(assert (=> b!745096 m!696049))

(declare-fun m!696051 () Bool)

(assert (=> b!745096 m!696051))

(assert (=> b!745098 m!696049))

(assert (=> b!745098 m!696049))

(declare-fun m!696053 () Bool)

(assert (=> b!745098 m!696053))

(assert (=> b!745086 m!696049))

(assert (=> b!745086 m!696049))

(declare-fun m!696055 () Bool)

(assert (=> b!745086 m!696055))

(assert (=> b!745085 m!696049))

(assert (=> b!745085 m!696049))

(declare-fun m!696057 () Bool)

(assert (=> b!745085 m!696057))

(declare-fun m!696059 () Bool)

(assert (=> b!745089 m!696059))

(declare-fun m!696061 () Bool)

(assert (=> b!745088 m!696061))

(declare-fun m!696063 () Bool)

(assert (=> b!745091 m!696063))

(declare-fun m!696065 () Bool)

(assert (=> b!745097 m!696065))

(declare-fun m!696067 () Bool)

(assert (=> b!745094 m!696067))

(declare-fun m!696069 () Bool)

(assert (=> b!745102 m!696069))

(declare-fun m!696071 () Bool)

(assert (=> b!745102 m!696071))

(declare-fun m!696073 () Bool)

(assert (=> b!745102 m!696073))

(declare-fun m!696075 () Bool)

(assert (=> b!745102 m!696075))

(declare-fun m!696077 () Bool)

(assert (=> b!745102 m!696077))

(assert (=> b!745102 m!696069))

(assert (=> b!745087 m!696049))

(assert (=> b!745087 m!696049))

(assert (=> b!745087 m!696053))

(declare-fun m!696079 () Bool)

(assert (=> b!745099 m!696079))

(assert (=> b!745090 m!696049))

(assert (=> b!745090 m!696049))

(declare-fun m!696081 () Bool)

(assert (=> b!745090 m!696081))

(assert (=> b!745093 m!696049))

(assert (=> b!745093 m!696049))

(declare-fun m!696083 () Bool)

(assert (=> b!745093 m!696083))

(assert (=> b!745093 m!696083))

(assert (=> b!745093 m!696049))

(declare-fun m!696085 () Bool)

(assert (=> b!745093 m!696085))

(declare-fun m!696087 () Bool)

(assert (=> b!745100 m!696087))

(declare-fun m!696089 () Bool)

(assert (=> b!745100 m!696089))

(check-sat (not b!745100) (not b!745090) (not b!745093) (not b!745085) (not b!745087) (not start!65532) (not b!745091) (not b!745098) (not b!745088) (not b!745096) (not b!745102) (not b!745086) (not b!745097) (not b!745089) (not b!745094))
(check-sat)
