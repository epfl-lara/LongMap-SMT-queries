; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65534 () Bool)

(assert start!65534)

(declare-fun res!504546 () Bool)

(declare-fun e!417575 () Bool)

(assert (=> start!65534 (=> (not res!504546) (not e!417575))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65534 (= res!504546 (validMask!0 mask!3328))))

(assert (=> start!65534 e!417575))

(assert (=> start!65534 true))

(declare-datatypes ((array!41707 0))(
  ( (array!41708 (arr!19967 (Array (_ BitVec 32) (_ BitVec 64))) (size!20388 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41707)

(declare-fun array_inv!15763 (array!41707) Bool)

(assert (=> start!65534 (array_inv!15763 a!3186)))

(declare-fun b!748045 () Bool)

(declare-fun res!504560 () Bool)

(declare-fun e!417574 () Bool)

(assert (=> b!748045 (=> res!504560 e!417574)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!332520 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!748045 (= res!504560 (= (select (store (arr!19967 a!3186) i!1173 k!2102) index!1321) lt!332520))))

(declare-fun b!748046 () Bool)

(declare-fun res!504556 () Bool)

(declare-fun e!417576 () Bool)

(assert (=> b!748046 (=> (not res!504556) (not e!417576))))

(declare-fun e!417571 () Bool)

(assert (=> b!748046 (= res!504556 e!417571)))

(declare-fun c!82132 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748046 (= c!82132 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748047 () Bool)

(declare-fun res!504550 () Bool)

(declare-fun e!417573 () Bool)

(assert (=> b!748047 (=> (not res!504550) (not e!417573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41707 (_ BitVec 32)) Bool)

(assert (=> b!748047 (= res!504550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-datatypes ((SeekEntryResult!7567 0))(
  ( (MissingZero!7567 (index!32636 (_ BitVec 32))) (Found!7567 (index!32637 (_ BitVec 32))) (Intermediate!7567 (undefined!8379 Bool) (index!32638 (_ BitVec 32)) (x!63573 (_ BitVec 32))) (Undefined!7567) (MissingVacant!7567 (index!32639 (_ BitVec 32))) )
))
(declare-fun lt!332521 () SeekEntryResult!7567)

(declare-fun b!748048 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41707 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!748048 (= e!417571 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332521))))

(declare-fun b!748049 () Bool)

(declare-fun res!504555 () Bool)

(assert (=> b!748049 (=> (not res!504555) (not e!417575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748049 (= res!504555 (validKeyInArray!0 (select (arr!19967 a!3186) j!159)))))

(declare-fun b!748050 () Bool)

(declare-fun e!417578 () Bool)

(assert (=> b!748050 (= e!417576 e!417578)))

(declare-fun res!504549 () Bool)

(assert (=> b!748050 (=> (not res!504549) (not e!417578))))

(declare-fun lt!332519 () SeekEntryResult!7567)

(declare-fun lt!332516 () SeekEntryResult!7567)

(assert (=> b!748050 (= res!504549 (= lt!332519 lt!332516))))

(declare-fun lt!332524 () array!41707)

(assert (=> b!748050 (= lt!332516 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332520 lt!332524 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748050 (= lt!332519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332520 mask!3328) lt!332520 lt!332524 mask!3328))))

(assert (=> b!748050 (= lt!332520 (select (store (arr!19967 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748050 (= lt!332524 (array!41708 (store (arr!19967 a!3186) i!1173 k!2102) (size!20388 a!3186)))))

(declare-fun b!748051 () Bool)

(assert (=> b!748051 (= e!417573 e!417576)))

(declare-fun res!504554 () Bool)

(assert (=> b!748051 (=> (not res!504554) (not e!417576))))

(assert (=> b!748051 (= res!504554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19967 a!3186) j!159) mask!3328) (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332521))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!748051 (= lt!332521 (Intermediate!7567 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748052 () Bool)

(declare-fun res!504557 () Bool)

(assert (=> b!748052 (=> (not res!504557) (not e!417575))))

(assert (=> b!748052 (= res!504557 (validKeyInArray!0 k!2102))))

(declare-fun b!748053 () Bool)

(declare-fun res!504559 () Bool)

(assert (=> b!748053 (=> (not res!504559) (not e!417575))))

(declare-fun arrayContainsKey!0 (array!41707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748053 (= res!504559 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748054 () Bool)

(declare-fun res!504548 () Bool)

(assert (=> b!748054 (=> (not res!504548) (not e!417573))))

(declare-datatypes ((List!13969 0))(
  ( (Nil!13966) (Cons!13965 (h!15037 (_ BitVec 64)) (t!20284 List!13969)) )
))
(declare-fun arrayNoDuplicates!0 (array!41707 (_ BitVec 32) List!13969) Bool)

(assert (=> b!748054 (= res!504548 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13966))))

(declare-fun b!748055 () Bool)

(assert (=> b!748055 (= e!417574 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!748055 (= (select (store (arr!19967 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25648 0))(
  ( (Unit!25649) )
))
(declare-fun lt!332523 () Unit!25648)

(declare-fun e!417570 () Unit!25648)

(assert (=> b!748055 (= lt!332523 e!417570)))

(declare-fun c!82131 () Bool)

(assert (=> b!748055 (= c!82131 (= (select (store (arr!19967 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748056 () Bool)

(assert (=> b!748056 (= e!417578 (not e!417574))))

(declare-fun res!504551 () Bool)

(assert (=> b!748056 (=> res!504551 e!417574)))

(assert (=> b!748056 (= res!504551 (or (not (is-Intermediate!7567 lt!332516)) (bvslt x!1131 (x!63573 lt!332516)) (not (= x!1131 (x!63573 lt!332516))) (not (= index!1321 (index!32638 lt!332516)))))))

(declare-fun e!417577 () Bool)

(assert (=> b!748056 e!417577))

(declare-fun res!504558 () Bool)

(assert (=> b!748056 (=> (not res!504558) (not e!417577))))

(declare-fun lt!332525 () SeekEntryResult!7567)

(declare-fun lt!332522 () SeekEntryResult!7567)

(assert (=> b!748056 (= res!504558 (= lt!332525 lt!332522))))

(assert (=> b!748056 (= lt!332522 (Found!7567 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41707 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!748056 (= lt!332525 (seekEntryOrOpen!0 (select (arr!19967 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748056 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332517 () Unit!25648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25648)

(assert (=> b!748056 (= lt!332517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748057 () Bool)

(declare-fun res!504547 () Bool)

(assert (=> b!748057 (=> (not res!504547) (not e!417576))))

(assert (=> b!748057 (= res!504547 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19967 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748058 () Bool)

(assert (=> b!748058 (= e!417575 e!417573)))

(declare-fun res!504553 () Bool)

(assert (=> b!748058 (=> (not res!504553) (not e!417573))))

(declare-fun lt!332518 () SeekEntryResult!7567)

(assert (=> b!748058 (= res!504553 (or (= lt!332518 (MissingZero!7567 i!1173)) (= lt!332518 (MissingVacant!7567 i!1173))))))

(assert (=> b!748058 (= lt!332518 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748059 () Bool)

(declare-fun Unit!25650 () Unit!25648)

(assert (=> b!748059 (= e!417570 Unit!25650)))

(declare-fun b!748060 () Bool)

(declare-fun res!504544 () Bool)

(assert (=> b!748060 (=> (not res!504544) (not e!417573))))

(assert (=> b!748060 (= res!504544 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20388 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20388 a!3186))))))

(declare-fun b!748061 () Bool)

(declare-fun Unit!25651 () Unit!25648)

(assert (=> b!748061 (= e!417570 Unit!25651)))

(assert (=> b!748061 false))

(declare-fun b!748062 () Bool)

(declare-fun res!504552 () Bool)

(assert (=> b!748062 (=> (not res!504552) (not e!417575))))

(assert (=> b!748062 (= res!504552 (and (= (size!20388 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20388 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20388 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748063 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41707 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!748063 (= e!417571 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) (Found!7567 j!159)))))

(declare-fun b!748064 () Bool)

(declare-fun res!504545 () Bool)

(assert (=> b!748064 (=> res!504545 e!417574)))

(assert (=> b!748064 (= res!504545 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332522)))))

(declare-fun b!748065 () Bool)

(assert (=> b!748065 (= e!417577 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332522))))

(assert (= (and start!65534 res!504546) b!748062))

(assert (= (and b!748062 res!504552) b!748049))

(assert (= (and b!748049 res!504555) b!748052))

(assert (= (and b!748052 res!504557) b!748053))

(assert (= (and b!748053 res!504559) b!748058))

(assert (= (and b!748058 res!504553) b!748047))

(assert (= (and b!748047 res!504550) b!748054))

(assert (= (and b!748054 res!504548) b!748060))

(assert (= (and b!748060 res!504544) b!748051))

(assert (= (and b!748051 res!504554) b!748057))

(assert (= (and b!748057 res!504547) b!748046))

(assert (= (and b!748046 c!82132) b!748048))

(assert (= (and b!748046 (not c!82132)) b!748063))

(assert (= (and b!748046 res!504556) b!748050))

(assert (= (and b!748050 res!504549) b!748056))

(assert (= (and b!748056 res!504558) b!748065))

(assert (= (and b!748056 (not res!504551)) b!748064))

(assert (= (and b!748064 (not res!504545)) b!748045))

(assert (= (and b!748045 (not res!504560)) b!748055))

(assert (= (and b!748055 c!82131) b!748061))

(assert (= (and b!748055 (not c!82131)) b!748059))

(declare-fun m!697981 () Bool)

(assert (=> b!748064 m!697981))

(assert (=> b!748064 m!697981))

(declare-fun m!697983 () Bool)

(assert (=> b!748064 m!697983))

(assert (=> b!748049 m!697981))

(assert (=> b!748049 m!697981))

(declare-fun m!697985 () Bool)

(assert (=> b!748049 m!697985))

(declare-fun m!697987 () Bool)

(assert (=> b!748057 m!697987))

(declare-fun m!697989 () Bool)

(assert (=> b!748058 m!697989))

(assert (=> b!748065 m!697981))

(assert (=> b!748065 m!697981))

(declare-fun m!697991 () Bool)

(assert (=> b!748065 m!697991))

(declare-fun m!697993 () Bool)

(assert (=> start!65534 m!697993))

(declare-fun m!697995 () Bool)

(assert (=> start!65534 m!697995))

(assert (=> b!748051 m!697981))

(assert (=> b!748051 m!697981))

(declare-fun m!697997 () Bool)

(assert (=> b!748051 m!697997))

(assert (=> b!748051 m!697997))

(assert (=> b!748051 m!697981))

(declare-fun m!697999 () Bool)

(assert (=> b!748051 m!697999))

(declare-fun m!698001 () Bool)

(assert (=> b!748054 m!698001))

(declare-fun m!698003 () Bool)

(assert (=> b!748047 m!698003))

(assert (=> b!748063 m!697981))

(assert (=> b!748063 m!697981))

(assert (=> b!748063 m!697983))

(declare-fun m!698005 () Bool)

(assert (=> b!748055 m!698005))

(declare-fun m!698007 () Bool)

(assert (=> b!748055 m!698007))

(assert (=> b!748045 m!698005))

(assert (=> b!748045 m!698007))

(assert (=> b!748048 m!697981))

(assert (=> b!748048 m!697981))

(declare-fun m!698009 () Bool)

(assert (=> b!748048 m!698009))

(declare-fun m!698011 () Bool)

(assert (=> b!748050 m!698011))

(assert (=> b!748050 m!698005))

(declare-fun m!698013 () Bool)

(assert (=> b!748050 m!698013))

(assert (=> b!748050 m!698013))

(declare-fun m!698015 () Bool)

(assert (=> b!748050 m!698015))

(declare-fun m!698017 () Bool)

(assert (=> b!748050 m!698017))

(declare-fun m!698019 () Bool)

(assert (=> b!748052 m!698019))

(declare-fun m!698021 () Bool)

(assert (=> b!748053 m!698021))

(assert (=> b!748056 m!697981))

(assert (=> b!748056 m!697981))

(declare-fun m!698023 () Bool)

(assert (=> b!748056 m!698023))

(declare-fun m!698025 () Bool)

(assert (=> b!748056 m!698025))

(declare-fun m!698027 () Bool)

(assert (=> b!748056 m!698027))

(push 1)

