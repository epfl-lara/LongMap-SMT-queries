; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65522 () Bool)

(assert start!65522)

(declare-fun b!748047 () Bool)

(declare-fun res!504645 () Bool)

(declare-fun e!417527 () Bool)

(assert (=> b!748047 (=> (not res!504645) (not e!417527))))

(declare-datatypes ((array!41712 0))(
  ( (array!41713 (arr!19970 (Array (_ BitVec 32) (_ BitVec 64))) (size!20391 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41712)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41712 (_ BitVec 32)) Bool)

(assert (=> b!748047 (= res!504645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748049 () Bool)

(declare-fun res!504643 () Bool)

(declare-fun e!417525 () Bool)

(assert (=> b!748049 (=> (not res!504643) (not e!417525))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748049 (= res!504643 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19970 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748050 () Bool)

(declare-fun res!504654 () Bool)

(declare-fun e!417530 () Bool)

(assert (=> b!748050 (=> (not res!504654) (not e!417530))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748050 (= res!504654 (validKeyInArray!0 k0!2102))))

(declare-fun b!748051 () Bool)

(declare-fun e!417531 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!748051 (= e!417531 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!748051 (= (select (store (arr!19970 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25628 0))(
  ( (Unit!25629) )
))
(declare-fun lt!332400 () Unit!25628)

(declare-fun e!417524 () Unit!25628)

(assert (=> b!748051 (= lt!332400 e!417524)))

(declare-fun c!82085 () Bool)

(assert (=> b!748051 (= c!82085 (= (select (store (arr!19970 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748052 () Bool)

(declare-fun res!504640 () Bool)

(assert (=> b!748052 (=> (not res!504640) (not e!417530))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!748052 (= res!504640 (validKeyInArray!0 (select (arr!19970 a!3186) j!159)))))

(declare-fun b!748053 () Bool)

(declare-fun res!504641 () Bool)

(assert (=> b!748053 (=> (not res!504641) (not e!417527))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748053 (= res!504641 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20391 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20391 a!3186))))))

(declare-fun b!748054 () Bool)

(declare-fun res!504647 () Bool)

(assert (=> b!748054 (=> (not res!504647) (not e!417527))))

(declare-datatypes ((List!14011 0))(
  ( (Nil!14008) (Cons!14007 (h!15079 (_ BitVec 64)) (t!20317 List!14011)) )
))
(declare-fun arrayNoDuplicates!0 (array!41712 (_ BitVec 32) List!14011) Bool)

(assert (=> b!748054 (= res!504647 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14008))))

(declare-fun b!748055 () Bool)

(assert (=> b!748055 (= e!417530 e!417527)))

(declare-fun res!504642 () Bool)

(assert (=> b!748055 (=> (not res!504642) (not e!417527))))

(declare-datatypes ((SeekEntryResult!7567 0))(
  ( (MissingZero!7567 (index!32636 (_ BitVec 32))) (Found!7567 (index!32637 (_ BitVec 32))) (Intermediate!7567 (undefined!8379 Bool) (index!32638 (_ BitVec 32)) (x!63584 (_ BitVec 32))) (Undefined!7567) (MissingVacant!7567 (index!32639 (_ BitVec 32))) )
))
(declare-fun lt!332405 () SeekEntryResult!7567)

(assert (=> b!748055 (= res!504642 (or (= lt!332405 (MissingZero!7567 i!1173)) (= lt!332405 (MissingVacant!7567 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41712 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!748055 (= lt!332405 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748048 () Bool)

(declare-fun res!504650 () Bool)

(assert (=> b!748048 (=> res!504650 e!417531)))

(declare-fun lt!332401 () (_ BitVec 64))

(assert (=> b!748048 (= res!504650 (= (select (store (arr!19970 a!3186) i!1173 k0!2102) index!1321) lt!332401))))

(declare-fun res!504646 () Bool)

(assert (=> start!65522 (=> (not res!504646) (not e!417530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65522 (= res!504646 (validMask!0 mask!3328))))

(assert (=> start!65522 e!417530))

(assert (=> start!65522 true))

(declare-fun array_inv!15853 (array!41712) Bool)

(assert (=> start!65522 (array_inv!15853 a!3186)))

(declare-fun b!748056 () Bool)

(declare-fun e!417526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41712 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!748056 (= e!417526 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) (Found!7567 j!159)))))

(declare-fun b!748057 () Bool)

(declare-fun Unit!25630 () Unit!25628)

(assert (=> b!748057 (= e!417524 Unit!25630)))

(declare-fun b!748058 () Bool)

(declare-fun Unit!25631 () Unit!25628)

(assert (=> b!748058 (= e!417524 Unit!25631)))

(assert (=> b!748058 false))

(declare-fun b!748059 () Bool)

(declare-fun res!504649 () Bool)

(assert (=> b!748059 (=> (not res!504649) (not e!417525))))

(assert (=> b!748059 (= res!504649 e!417526)))

(declare-fun c!82086 () Bool)

(assert (=> b!748059 (= c!82086 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748060 () Bool)

(declare-fun res!504644 () Bool)

(assert (=> b!748060 (=> (not res!504644) (not e!417530))))

(assert (=> b!748060 (= res!504644 (and (= (size!20391 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20391 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20391 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748061 () Bool)

(assert (=> b!748061 (= e!417527 e!417525)))

(declare-fun res!504651 () Bool)

(assert (=> b!748061 (=> (not res!504651) (not e!417525))))

(declare-fun lt!332404 () SeekEntryResult!7567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41712 (_ BitVec 32)) SeekEntryResult!7567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748061 (= res!504651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19970 a!3186) j!159) mask!3328) (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332404))))

(assert (=> b!748061 (= lt!332404 (Intermediate!7567 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748062 () Bool)

(assert (=> b!748062 (= e!417526 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332404))))

(declare-fun b!748063 () Bool)

(declare-fun res!504653 () Bool)

(assert (=> b!748063 (=> (not res!504653) (not e!417530))))

(declare-fun arrayContainsKey!0 (array!41712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748063 (= res!504653 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748064 () Bool)

(declare-fun res!504638 () Bool)

(assert (=> b!748064 (=> res!504638 e!417531)))

(declare-fun lt!332402 () SeekEntryResult!7567)

(assert (=> b!748064 (= res!504638 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332402)))))

(declare-fun b!748065 () Bool)

(declare-fun e!417532 () Bool)

(assert (=> b!748065 (= e!417532 (not e!417531))))

(declare-fun res!504652 () Bool)

(assert (=> b!748065 (=> res!504652 e!417531)))

(declare-fun lt!332398 () SeekEntryResult!7567)

(get-info :version)

(assert (=> b!748065 (= res!504652 (or (not ((_ is Intermediate!7567) lt!332398)) (bvslt x!1131 (x!63584 lt!332398)) (not (= x!1131 (x!63584 lt!332398))) (not (= index!1321 (index!32638 lt!332398)))))))

(declare-fun e!417528 () Bool)

(assert (=> b!748065 e!417528))

(declare-fun res!504639 () Bool)

(assert (=> b!748065 (=> (not res!504639) (not e!417528))))

(declare-fun lt!332403 () SeekEntryResult!7567)

(assert (=> b!748065 (= res!504639 (= lt!332403 lt!332402))))

(assert (=> b!748065 (= lt!332402 (Found!7567 j!159))))

(assert (=> b!748065 (= lt!332403 (seekEntryOrOpen!0 (select (arr!19970 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748065 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332396 () Unit!25628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25628)

(assert (=> b!748065 (= lt!332396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748066 () Bool)

(assert (=> b!748066 (= e!417528 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332402))))

(declare-fun b!748067 () Bool)

(assert (=> b!748067 (= e!417525 e!417532)))

(declare-fun res!504648 () Bool)

(assert (=> b!748067 (=> (not res!504648) (not e!417532))))

(declare-fun lt!332397 () SeekEntryResult!7567)

(assert (=> b!748067 (= res!504648 (= lt!332397 lt!332398))))

(declare-fun lt!332399 () array!41712)

(assert (=> b!748067 (= lt!332398 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332401 lt!332399 mask!3328))))

(assert (=> b!748067 (= lt!332397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332401 mask!3328) lt!332401 lt!332399 mask!3328))))

(assert (=> b!748067 (= lt!332401 (select (store (arr!19970 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748067 (= lt!332399 (array!41713 (store (arr!19970 a!3186) i!1173 k0!2102) (size!20391 a!3186)))))

(assert (= (and start!65522 res!504646) b!748060))

(assert (= (and b!748060 res!504644) b!748052))

(assert (= (and b!748052 res!504640) b!748050))

(assert (= (and b!748050 res!504654) b!748063))

(assert (= (and b!748063 res!504653) b!748055))

(assert (= (and b!748055 res!504642) b!748047))

(assert (= (and b!748047 res!504645) b!748054))

(assert (= (and b!748054 res!504647) b!748053))

(assert (= (and b!748053 res!504641) b!748061))

(assert (= (and b!748061 res!504651) b!748049))

(assert (= (and b!748049 res!504643) b!748059))

(assert (= (and b!748059 c!82086) b!748062))

(assert (= (and b!748059 (not c!82086)) b!748056))

(assert (= (and b!748059 res!504649) b!748067))

(assert (= (and b!748067 res!504648) b!748065))

(assert (= (and b!748065 res!504639) b!748066))

(assert (= (and b!748065 (not res!504652)) b!748064))

(assert (= (and b!748064 (not res!504638)) b!748048))

(assert (= (and b!748048 (not res!504650)) b!748051))

(assert (= (and b!748051 c!82085) b!748058))

(assert (= (and b!748051 (not c!82085)) b!748057))

(declare-fun m!697415 () Bool)

(assert (=> b!748061 m!697415))

(assert (=> b!748061 m!697415))

(declare-fun m!697417 () Bool)

(assert (=> b!748061 m!697417))

(assert (=> b!748061 m!697417))

(assert (=> b!748061 m!697415))

(declare-fun m!697419 () Bool)

(assert (=> b!748061 m!697419))

(assert (=> b!748065 m!697415))

(assert (=> b!748065 m!697415))

(declare-fun m!697421 () Bool)

(assert (=> b!748065 m!697421))

(declare-fun m!697423 () Bool)

(assert (=> b!748065 m!697423))

(declare-fun m!697425 () Bool)

(assert (=> b!748065 m!697425))

(declare-fun m!697427 () Bool)

(assert (=> b!748067 m!697427))

(declare-fun m!697429 () Bool)

(assert (=> b!748067 m!697429))

(declare-fun m!697431 () Bool)

(assert (=> b!748067 m!697431))

(declare-fun m!697433 () Bool)

(assert (=> b!748067 m!697433))

(declare-fun m!697435 () Bool)

(assert (=> b!748067 m!697435))

(assert (=> b!748067 m!697427))

(declare-fun m!697437 () Bool)

(assert (=> b!748054 m!697437))

(declare-fun m!697439 () Bool)

(assert (=> b!748055 m!697439))

(declare-fun m!697441 () Bool)

(assert (=> b!748063 m!697441))

(assert (=> b!748052 m!697415))

(assert (=> b!748052 m!697415))

(declare-fun m!697443 () Bool)

(assert (=> b!748052 m!697443))

(assert (=> b!748062 m!697415))

(assert (=> b!748062 m!697415))

(declare-fun m!697445 () Bool)

(assert (=> b!748062 m!697445))

(assert (=> b!748048 m!697433))

(declare-fun m!697447 () Bool)

(assert (=> b!748048 m!697447))

(assert (=> b!748066 m!697415))

(assert (=> b!748066 m!697415))

(declare-fun m!697449 () Bool)

(assert (=> b!748066 m!697449))

(assert (=> b!748051 m!697433))

(assert (=> b!748051 m!697447))

(assert (=> b!748056 m!697415))

(assert (=> b!748056 m!697415))

(declare-fun m!697451 () Bool)

(assert (=> b!748056 m!697451))

(declare-fun m!697453 () Bool)

(assert (=> b!748047 m!697453))

(declare-fun m!697455 () Bool)

(assert (=> b!748049 m!697455))

(declare-fun m!697457 () Bool)

(assert (=> b!748050 m!697457))

(declare-fun m!697459 () Bool)

(assert (=> start!65522 m!697459))

(declare-fun m!697461 () Bool)

(assert (=> start!65522 m!697461))

(assert (=> b!748064 m!697415))

(assert (=> b!748064 m!697415))

(assert (=> b!748064 m!697451))

(check-sat (not b!748061) (not b!748067) (not b!748063) (not b!748062) (not start!65522) (not b!748056) (not b!748065) (not b!748050) (not b!748052) (not b!748064) (not b!748066) (not b!748055) (not b!748047) (not b!748054))
(check-sat)
