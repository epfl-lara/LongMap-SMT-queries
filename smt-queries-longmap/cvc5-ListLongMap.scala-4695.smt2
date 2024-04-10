; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65230 () Bool)

(assert start!65230)

(declare-fun b!739060 () Bool)

(declare-datatypes ((Unit!25256 0))(
  ( (Unit!25257) )
))
(declare-fun e!413285 () Unit!25256)

(declare-fun Unit!25258 () Unit!25256)

(assert (=> b!739060 (= e!413285 Unit!25258)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41403 0))(
  ( (array!41404 (arr!19815 (Array (_ BitVec 32) (_ BitVec 64))) (size!20236 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41403)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7415 0))(
  ( (MissingZero!7415 (index!32028 (_ BitVec 32))) (Found!7415 (index!32029 (_ BitVec 32))) (Intermediate!7415 (undefined!8227 Bool) (index!32030 (_ BitVec 32)) (x!63021 (_ BitVec 32))) (Undefined!7415) (MissingVacant!7415 (index!32031 (_ BitVec 32))) )
))
(declare-fun lt!328129 () SeekEntryResult!7415)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41403 (_ BitVec 32)) SeekEntryResult!7415)

(assert (=> b!739060 (= lt!328129 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19815 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328135 () SeekEntryResult!7415)

(declare-fun lt!328138 () (_ BitVec 32))

(assert (=> b!739060 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328138 resIntermediateIndex!5 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328135)))

(declare-fun e!413284 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!739061 () Bool)

(declare-fun lt!328134 () SeekEntryResult!7415)

(assert (=> b!739061 (= e!413284 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328134))))

(declare-fun b!739063 () Bool)

(declare-fun e!413291 () Bool)

(assert (=> b!739063 (= e!413291 e!413284)))

(declare-fun res!496909 () Bool)

(assert (=> b!739063 (=> (not res!496909) (not e!413284))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41403 (_ BitVec 32)) SeekEntryResult!7415)

(assert (=> b!739063 (= res!496909 (= (seekEntryOrOpen!0 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328134))))

(assert (=> b!739063 (= lt!328134 (Found!7415 j!159))))

(declare-fun b!739064 () Bool)

(declare-fun e!413292 () Bool)

(assert (=> b!739064 (= e!413292 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) (Found!7415 j!159)))))

(declare-fun b!739065 () Bool)

(declare-fun e!413289 () Bool)

(declare-fun e!413287 () Bool)

(assert (=> b!739065 (= e!413289 (not e!413287))))

(declare-fun res!496898 () Bool)

(assert (=> b!739065 (=> res!496898 e!413287)))

(declare-fun lt!328132 () SeekEntryResult!7415)

(assert (=> b!739065 (= res!496898 (or (not (is-Intermediate!7415 lt!328132)) (bvsge x!1131 (x!63021 lt!328132))))))

(assert (=> b!739065 (= lt!328135 (Found!7415 j!159))))

(assert (=> b!739065 e!413291))

(declare-fun res!496896 () Bool)

(assert (=> b!739065 (=> (not res!496896) (not e!413291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41403 (_ BitVec 32)) Bool)

(assert (=> b!739065 (= res!496896 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328128 () Unit!25256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25256)

(assert (=> b!739065 (= lt!328128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739066 () Bool)

(declare-fun res!496906 () Bool)

(declare-fun e!413293 () Bool)

(assert (=> b!739066 (=> res!496906 e!413293)))

(declare-fun e!413294 () Bool)

(assert (=> b!739066 (= res!496906 e!413294)))

(declare-fun c!81464 () Bool)

(declare-fun lt!328133 () Bool)

(assert (=> b!739066 (= c!81464 lt!328133)))

(declare-fun b!739067 () Bool)

(declare-fun res!496894 () Bool)

(declare-fun e!413288 () Bool)

(assert (=> b!739067 (=> (not res!496894) (not e!413288))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739067 (= res!496894 (validKeyInArray!0 k!2102))))

(declare-fun b!739068 () Bool)

(declare-fun res!496902 () Bool)

(declare-fun e!413283 () Bool)

(assert (=> b!739068 (=> (not res!496902) (not e!413283))))

(assert (=> b!739068 (= res!496902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739069 () Bool)

(declare-fun res!496903 () Bool)

(declare-fun e!413290 () Bool)

(assert (=> b!739069 (=> (not res!496903) (not e!413290))))

(assert (=> b!739069 (= res!496903 e!413292)))

(declare-fun c!81465 () Bool)

(assert (=> b!739069 (= c!81465 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739062 () Bool)

(assert (=> b!739062 (= e!413288 e!413283)))

(declare-fun res!496897 () Bool)

(assert (=> b!739062 (=> (not res!496897) (not e!413283))))

(declare-fun lt!328139 () SeekEntryResult!7415)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739062 (= res!496897 (or (= lt!328139 (MissingZero!7415 i!1173)) (= lt!328139 (MissingVacant!7415 i!1173))))))

(assert (=> b!739062 (= lt!328139 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!496907 () Bool)

(assert (=> start!65230 (=> (not res!496907) (not e!413288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65230 (= res!496907 (validMask!0 mask!3328))))

(assert (=> start!65230 e!413288))

(assert (=> start!65230 true))

(declare-fun array_inv!15611 (array!41403) Bool)

(assert (=> start!65230 (array_inv!15611 a!3186)))

(declare-fun b!739070 () Bool)

(declare-fun res!496905 () Bool)

(assert (=> b!739070 (=> (not res!496905) (not e!413283))))

(declare-datatypes ((List!13817 0))(
  ( (Nil!13814) (Cons!13813 (h!14885 (_ BitVec 64)) (t!20132 List!13817)) )
))
(declare-fun arrayNoDuplicates!0 (array!41403 (_ BitVec 32) List!13817) Bool)

(assert (=> b!739070 (= res!496905 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13814))))

(declare-fun b!739071 () Bool)

(assert (=> b!739071 (= e!413290 e!413289)))

(declare-fun res!496893 () Bool)

(assert (=> b!739071 (=> (not res!496893) (not e!413289))))

(declare-fun lt!328127 () SeekEntryResult!7415)

(assert (=> b!739071 (= res!496893 (= lt!328127 lt!328132))))

(declare-fun lt!328130 () (_ BitVec 64))

(declare-fun lt!328126 () array!41403)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41403 (_ BitVec 32)) SeekEntryResult!7415)

(assert (=> b!739071 (= lt!328132 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328130 lt!328126 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739071 (= lt!328127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328130 mask!3328) lt!328130 lt!328126 mask!3328))))

(assert (=> b!739071 (= lt!328130 (select (store (arr!19815 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739071 (= lt!328126 (array!41404 (store (arr!19815 a!3186) i!1173 k!2102) (size!20236 a!3186)))))

(declare-fun b!739072 () Bool)

(declare-fun Unit!25259 () Unit!25256)

(assert (=> b!739072 (= e!413285 Unit!25259)))

(declare-fun lt!328136 () SeekEntryResult!7415)

(assert (=> b!739072 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328138 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328136)))

(declare-fun b!739073 () Bool)

(assert (=> b!739073 (= e!413293 true)))

(declare-fun lt!328131 () SeekEntryResult!7415)

(assert (=> b!739073 (= lt!328131 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328138 lt!328130 lt!328126 mask!3328))))

(declare-fun b!739074 () Bool)

(assert (=> b!739074 (= e!413292 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328136))))

(declare-fun b!739075 () Bool)

(declare-fun res!496901 () Bool)

(assert (=> b!739075 (=> (not res!496901) (not e!413288))))

(assert (=> b!739075 (= res!496901 (validKeyInArray!0 (select (arr!19815 a!3186) j!159)))))

(declare-fun b!739076 () Bool)

(assert (=> b!739076 (= e!413287 e!413293)))

(declare-fun res!496899 () Bool)

(assert (=> b!739076 (=> res!496899 e!413293)))

(assert (=> b!739076 (= res!496899 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328138 #b00000000000000000000000000000000) (bvsge lt!328138 (size!20236 a!3186))))))

(declare-fun lt!328137 () Unit!25256)

(assert (=> b!739076 (= lt!328137 e!413285)))

(declare-fun c!81466 () Bool)

(assert (=> b!739076 (= c!81466 lt!328133)))

(assert (=> b!739076 (= lt!328133 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739076 (= lt!328138 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739077 () Bool)

(declare-fun res!496910 () Bool)

(assert (=> b!739077 (=> (not res!496910) (not e!413290))))

(assert (=> b!739077 (= res!496910 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19815 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739078 () Bool)

(declare-fun res!496904 () Bool)

(assert (=> b!739078 (=> (not res!496904) (not e!413288))))

(declare-fun arrayContainsKey!0 (array!41403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739078 (= res!496904 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739079 () Bool)

(assert (=> b!739079 (= e!413294 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328138 resIntermediateIndex!5 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328135)))))

(declare-fun b!739080 () Bool)

(assert (=> b!739080 (= e!413294 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328138 (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328136)))))

(declare-fun b!739081 () Bool)

(assert (=> b!739081 (= e!413283 e!413290)))

(declare-fun res!496908 () Bool)

(assert (=> b!739081 (=> (not res!496908) (not e!413290))))

(assert (=> b!739081 (= res!496908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19815 a!3186) j!159) mask!3328) (select (arr!19815 a!3186) j!159) a!3186 mask!3328) lt!328136))))

(assert (=> b!739081 (= lt!328136 (Intermediate!7415 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739082 () Bool)

(declare-fun res!496900 () Bool)

(assert (=> b!739082 (=> (not res!496900) (not e!413288))))

(assert (=> b!739082 (= res!496900 (and (= (size!20236 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20236 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20236 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739083 () Bool)

(declare-fun res!496895 () Bool)

(assert (=> b!739083 (=> (not res!496895) (not e!413283))))

(assert (=> b!739083 (= res!496895 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20236 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20236 a!3186))))))

(assert (= (and start!65230 res!496907) b!739082))

(assert (= (and b!739082 res!496900) b!739075))

(assert (= (and b!739075 res!496901) b!739067))

(assert (= (and b!739067 res!496894) b!739078))

(assert (= (and b!739078 res!496904) b!739062))

(assert (= (and b!739062 res!496897) b!739068))

(assert (= (and b!739068 res!496902) b!739070))

(assert (= (and b!739070 res!496905) b!739083))

(assert (= (and b!739083 res!496895) b!739081))

(assert (= (and b!739081 res!496908) b!739077))

(assert (= (and b!739077 res!496910) b!739069))

(assert (= (and b!739069 c!81465) b!739074))

(assert (= (and b!739069 (not c!81465)) b!739064))

(assert (= (and b!739069 res!496903) b!739071))

(assert (= (and b!739071 res!496893) b!739065))

(assert (= (and b!739065 res!496896) b!739063))

(assert (= (and b!739063 res!496909) b!739061))

(assert (= (and b!739065 (not res!496898)) b!739076))

(assert (= (and b!739076 c!81466) b!739072))

(assert (= (and b!739076 (not c!81466)) b!739060))

(assert (= (and b!739076 (not res!496899)) b!739066))

(assert (= (and b!739066 c!81464) b!739080))

(assert (= (and b!739066 (not c!81464)) b!739079))

(assert (= (and b!739066 (not res!496906)) b!739073))

(declare-fun m!690535 () Bool)

(assert (=> b!739067 m!690535))

(declare-fun m!690537 () Bool)

(assert (=> b!739070 m!690537))

(declare-fun m!690539 () Bool)

(assert (=> b!739074 m!690539))

(assert (=> b!739074 m!690539))

(declare-fun m!690541 () Bool)

(assert (=> b!739074 m!690541))

(assert (=> b!739081 m!690539))

(assert (=> b!739081 m!690539))

(declare-fun m!690543 () Bool)

(assert (=> b!739081 m!690543))

(assert (=> b!739081 m!690543))

(assert (=> b!739081 m!690539))

(declare-fun m!690545 () Bool)

(assert (=> b!739081 m!690545))

(declare-fun m!690547 () Bool)

(assert (=> b!739071 m!690547))

(declare-fun m!690549 () Bool)

(assert (=> b!739071 m!690549))

(assert (=> b!739071 m!690547))

(declare-fun m!690551 () Bool)

(assert (=> b!739071 m!690551))

(declare-fun m!690553 () Bool)

(assert (=> b!739071 m!690553))

(declare-fun m!690555 () Bool)

(assert (=> b!739071 m!690555))

(declare-fun m!690557 () Bool)

(assert (=> b!739065 m!690557))

(declare-fun m!690559 () Bool)

(assert (=> b!739065 m!690559))

(assert (=> b!739063 m!690539))

(assert (=> b!739063 m!690539))

(declare-fun m!690561 () Bool)

(assert (=> b!739063 m!690561))

(assert (=> b!739072 m!690539))

(assert (=> b!739072 m!690539))

(declare-fun m!690563 () Bool)

(assert (=> b!739072 m!690563))

(declare-fun m!690565 () Bool)

(assert (=> start!65230 m!690565))

(declare-fun m!690567 () Bool)

(assert (=> start!65230 m!690567))

(assert (=> b!739060 m!690539))

(assert (=> b!739060 m!690539))

(declare-fun m!690569 () Bool)

(assert (=> b!739060 m!690569))

(assert (=> b!739060 m!690539))

(declare-fun m!690571 () Bool)

(assert (=> b!739060 m!690571))

(declare-fun m!690573 () Bool)

(assert (=> b!739078 m!690573))

(assert (=> b!739061 m!690539))

(assert (=> b!739061 m!690539))

(declare-fun m!690575 () Bool)

(assert (=> b!739061 m!690575))

(declare-fun m!690577 () Bool)

(assert (=> b!739073 m!690577))

(declare-fun m!690579 () Bool)

(assert (=> b!739068 m!690579))

(assert (=> b!739079 m!690539))

(assert (=> b!739079 m!690539))

(assert (=> b!739079 m!690571))

(declare-fun m!690581 () Bool)

(assert (=> b!739077 m!690581))

(declare-fun m!690583 () Bool)

(assert (=> b!739062 m!690583))

(assert (=> b!739064 m!690539))

(assert (=> b!739064 m!690539))

(assert (=> b!739064 m!690569))

(declare-fun m!690585 () Bool)

(assert (=> b!739076 m!690585))

(assert (=> b!739080 m!690539))

(assert (=> b!739080 m!690539))

(assert (=> b!739080 m!690563))

(assert (=> b!739075 m!690539))

(assert (=> b!739075 m!690539))

(declare-fun m!690587 () Bool)

(assert (=> b!739075 m!690587))

(push 1)

