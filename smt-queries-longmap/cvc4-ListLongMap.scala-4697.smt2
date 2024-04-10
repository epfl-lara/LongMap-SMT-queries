; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65246 () Bool)

(assert start!65246)

(declare-fun b!739636 () Bool)

(declare-fun res!497336 () Bool)

(declare-fun e!413578 () Bool)

(assert (=> b!739636 (=> (not res!497336) (not e!413578))))

(declare-datatypes ((array!41419 0))(
  ( (array!41420 (arr!19823 (Array (_ BitVec 32) (_ BitVec 64))) (size!20244 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41419)

(declare-datatypes ((List!13825 0))(
  ( (Nil!13822) (Cons!13821 (h!14893 (_ BitVec 64)) (t!20140 List!13825)) )
))
(declare-fun arrayNoDuplicates!0 (array!41419 (_ BitVec 32) List!13825) Bool)

(assert (=> b!739636 (= res!497336 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13822))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413574 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!739637 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7423 0))(
  ( (MissingZero!7423 (index!32060 (_ BitVec 32))) (Found!7423 (index!32061 (_ BitVec 32))) (Intermediate!7423 (undefined!8235 Bool) (index!32062 (_ BitVec 32)) (x!63045 (_ BitVec 32))) (Undefined!7423) (MissingVacant!7423 (index!32063 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41419 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!739637 (= e!413574 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) (Found!7423 j!159)))))

(declare-fun b!739638 () Bool)

(declare-fun e!413573 () Bool)

(assert (=> b!739638 (= e!413573 e!413578)))

(declare-fun res!497331 () Bool)

(assert (=> b!739638 (=> (not res!497331) (not e!413578))))

(declare-fun lt!328464 () SeekEntryResult!7423)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739638 (= res!497331 (or (= lt!328464 (MissingZero!7423 i!1173)) (= lt!328464 (MissingVacant!7423 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41419 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!739638 (= lt!328464 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739639 () Bool)

(declare-fun res!497330 () Bool)

(assert (=> b!739639 (=> (not res!497330) (not e!413573))))

(declare-fun arrayContainsKey!0 (array!41419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739639 (= res!497330 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!497335 () Bool)

(assert (=> start!65246 (=> (not res!497335) (not e!413573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65246 (= res!497335 (validMask!0 mask!3328))))

(assert (=> start!65246 e!413573))

(assert (=> start!65246 true))

(declare-fun array_inv!15619 (array!41419) Bool)

(assert (=> start!65246 (array_inv!15619 a!3186)))

(declare-fun b!739640 () Bool)

(declare-fun res!497334 () Bool)

(assert (=> b!739640 (=> (not res!497334) (not e!413578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41419 (_ BitVec 32)) Bool)

(assert (=> b!739640 (= res!497334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739641 () Bool)

(declare-fun e!413572 () Bool)

(declare-fun e!413582 () Bool)

(assert (=> b!739641 (= e!413572 e!413582)))

(declare-fun res!497329 () Bool)

(assert (=> b!739641 (=> res!497329 e!413582)))

(declare-fun lt!328466 () (_ BitVec 32))

(assert (=> b!739641 (= res!497329 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328466 #b00000000000000000000000000000000) (bvsge lt!328466 (size!20244 a!3186))))))

(declare-datatypes ((Unit!25288 0))(
  ( (Unit!25289) )
))
(declare-fun lt!328474 () Unit!25288)

(declare-fun e!413580 () Unit!25288)

(assert (=> b!739641 (= lt!328474 e!413580)))

(declare-fun c!81537 () Bool)

(declare-fun lt!328472 () Bool)

(assert (=> b!739641 (= c!81537 lt!328472)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739641 (= lt!328472 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739641 (= lt!328466 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739642 () Bool)

(declare-fun res!497332 () Bool)

(assert (=> b!739642 (=> res!497332 e!413582)))

(declare-fun e!413576 () Bool)

(assert (=> b!739642 (= res!497332 e!413576)))

(declare-fun c!81536 () Bool)

(assert (=> b!739642 (= c!81536 lt!328472)))

(declare-fun lt!328471 () SeekEntryResult!7423)

(declare-fun b!739643 () Bool)

(declare-fun e!413571 () Bool)

(assert (=> b!739643 (= e!413571 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328471))))

(declare-fun b!739644 () Bool)

(declare-fun e!413577 () Bool)

(assert (=> b!739644 (= e!413577 e!413571)))

(declare-fun res!497337 () Bool)

(assert (=> b!739644 (=> (not res!497337) (not e!413571))))

(assert (=> b!739644 (= res!497337 (= (seekEntryOrOpen!0 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328471))))

(assert (=> b!739644 (= lt!328471 (Found!7423 j!159))))

(declare-fun b!739645 () Bool)

(declare-fun Unit!25290 () Unit!25288)

(assert (=> b!739645 (= e!413580 Unit!25290)))

(declare-fun lt!328475 () SeekEntryResult!7423)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41419 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!739645 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328466 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328475)))

(declare-fun b!739646 () Bool)

(declare-fun res!497325 () Bool)

(assert (=> b!739646 (=> (not res!497325) (not e!413573))))

(assert (=> b!739646 (= res!497325 (and (= (size!20244 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20244 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20244 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739647 () Bool)

(assert (=> b!739647 (= e!413576 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328466 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328475)))))

(declare-fun b!739648 () Bool)

(declare-fun lt!328470 () SeekEntryResult!7423)

(assert (=> b!739648 (= e!413576 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328466 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328470)))))

(declare-fun b!739649 () Bool)

(declare-fun e!413581 () Bool)

(declare-fun e!413575 () Bool)

(assert (=> b!739649 (= e!413581 e!413575)))

(declare-fun res!497333 () Bool)

(assert (=> b!739649 (=> (not res!497333) (not e!413575))))

(declare-fun lt!328469 () SeekEntryResult!7423)

(declare-fun lt!328473 () SeekEntryResult!7423)

(assert (=> b!739649 (= res!497333 (= lt!328469 lt!328473))))

(declare-fun lt!328463 () (_ BitVec 64))

(declare-fun lt!328465 () array!41419)

(assert (=> b!739649 (= lt!328473 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328463 lt!328465 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739649 (= lt!328469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328463 mask!3328) lt!328463 lt!328465 mask!3328))))

(assert (=> b!739649 (= lt!328463 (select (store (arr!19823 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739649 (= lt!328465 (array!41420 (store (arr!19823 a!3186) i!1173 k!2102) (size!20244 a!3186)))))

(declare-fun b!739650 () Bool)

(declare-fun res!497342 () Bool)

(assert (=> b!739650 (=> (not res!497342) (not e!413581))))

(assert (=> b!739650 (= res!497342 e!413574)))

(declare-fun c!81538 () Bool)

(assert (=> b!739650 (= c!81538 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739651 () Bool)

(declare-fun Unit!25291 () Unit!25288)

(assert (=> b!739651 (= e!413580 Unit!25291)))

(declare-fun lt!328462 () SeekEntryResult!7423)

(assert (=> b!739651 (= lt!328462 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739651 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328466 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328470)))

(declare-fun b!739652 () Bool)

(assert (=> b!739652 (= e!413582 true)))

(declare-fun lt!328467 () SeekEntryResult!7423)

(assert (=> b!739652 (= lt!328467 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328466 lt!328463 lt!328465 mask!3328))))

(declare-fun b!739653 () Bool)

(declare-fun res!497340 () Bool)

(assert (=> b!739653 (=> (not res!497340) (not e!413573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739653 (= res!497340 (validKeyInArray!0 k!2102))))

(declare-fun b!739654 () Bool)

(assert (=> b!739654 (= e!413574 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328475))))

(declare-fun b!739655 () Bool)

(declare-fun res!497339 () Bool)

(assert (=> b!739655 (=> (not res!497339) (not e!413578))))

(assert (=> b!739655 (= res!497339 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20244 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20244 a!3186))))))

(declare-fun b!739656 () Bool)

(declare-fun res!497341 () Bool)

(assert (=> b!739656 (=> (not res!497341) (not e!413581))))

(assert (=> b!739656 (= res!497341 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19823 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739657 () Bool)

(declare-fun res!497338 () Bool)

(assert (=> b!739657 (=> (not res!497338) (not e!413573))))

(assert (=> b!739657 (= res!497338 (validKeyInArray!0 (select (arr!19823 a!3186) j!159)))))

(declare-fun b!739658 () Bool)

(assert (=> b!739658 (= e!413575 (not e!413572))))

(declare-fun res!497327 () Bool)

(assert (=> b!739658 (=> res!497327 e!413572)))

(assert (=> b!739658 (= res!497327 (or (not (is-Intermediate!7423 lt!328473)) (bvsge x!1131 (x!63045 lt!328473))))))

(assert (=> b!739658 (= lt!328470 (Found!7423 j!159))))

(assert (=> b!739658 e!413577))

(declare-fun res!497328 () Bool)

(assert (=> b!739658 (=> (not res!497328) (not e!413577))))

(assert (=> b!739658 (= res!497328 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328468 () Unit!25288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25288)

(assert (=> b!739658 (= lt!328468 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739659 () Bool)

(assert (=> b!739659 (= e!413578 e!413581)))

(declare-fun res!497326 () Bool)

(assert (=> b!739659 (=> (not res!497326) (not e!413581))))

(assert (=> b!739659 (= res!497326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19823 a!3186) j!159) mask!3328) (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328475))))

(assert (=> b!739659 (= lt!328475 (Intermediate!7423 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65246 res!497335) b!739646))

(assert (= (and b!739646 res!497325) b!739657))

(assert (= (and b!739657 res!497338) b!739653))

(assert (= (and b!739653 res!497340) b!739639))

(assert (= (and b!739639 res!497330) b!739638))

(assert (= (and b!739638 res!497331) b!739640))

(assert (= (and b!739640 res!497334) b!739636))

(assert (= (and b!739636 res!497336) b!739655))

(assert (= (and b!739655 res!497339) b!739659))

(assert (= (and b!739659 res!497326) b!739656))

(assert (= (and b!739656 res!497341) b!739650))

(assert (= (and b!739650 c!81538) b!739654))

(assert (= (and b!739650 (not c!81538)) b!739637))

(assert (= (and b!739650 res!497342) b!739649))

(assert (= (and b!739649 res!497333) b!739658))

(assert (= (and b!739658 res!497328) b!739644))

(assert (= (and b!739644 res!497337) b!739643))

(assert (= (and b!739658 (not res!497327)) b!739641))

(assert (= (and b!739641 c!81537) b!739645))

(assert (= (and b!739641 (not c!81537)) b!739651))

(assert (= (and b!739641 (not res!497329)) b!739642))

(assert (= (and b!739642 c!81536) b!739647))

(assert (= (and b!739642 (not c!81536)) b!739648))

(assert (= (and b!739642 (not res!497332)) b!739652))

(declare-fun m!690967 () Bool)

(assert (=> b!739637 m!690967))

(assert (=> b!739637 m!690967))

(declare-fun m!690969 () Bool)

(assert (=> b!739637 m!690969))

(assert (=> b!739651 m!690967))

(assert (=> b!739651 m!690967))

(assert (=> b!739651 m!690969))

(assert (=> b!739651 m!690967))

(declare-fun m!690971 () Bool)

(assert (=> b!739651 m!690971))

(assert (=> b!739644 m!690967))

(assert (=> b!739644 m!690967))

(declare-fun m!690973 () Bool)

(assert (=> b!739644 m!690973))

(declare-fun m!690975 () Bool)

(assert (=> b!739641 m!690975))

(assert (=> b!739643 m!690967))

(assert (=> b!739643 m!690967))

(declare-fun m!690977 () Bool)

(assert (=> b!739643 m!690977))

(declare-fun m!690979 () Bool)

(assert (=> b!739652 m!690979))

(declare-fun m!690981 () Bool)

(assert (=> b!739640 m!690981))

(declare-fun m!690983 () Bool)

(assert (=> b!739639 m!690983))

(declare-fun m!690985 () Bool)

(assert (=> b!739653 m!690985))

(declare-fun m!690987 () Bool)

(assert (=> b!739658 m!690987))

(declare-fun m!690989 () Bool)

(assert (=> b!739658 m!690989))

(declare-fun m!690991 () Bool)

(assert (=> b!739636 m!690991))

(declare-fun m!690993 () Bool)

(assert (=> b!739656 m!690993))

(assert (=> b!739645 m!690967))

(assert (=> b!739645 m!690967))

(declare-fun m!690995 () Bool)

(assert (=> b!739645 m!690995))

(declare-fun m!690997 () Bool)

(assert (=> start!65246 m!690997))

(declare-fun m!690999 () Bool)

(assert (=> start!65246 m!690999))

(declare-fun m!691001 () Bool)

(assert (=> b!739649 m!691001))

(declare-fun m!691003 () Bool)

(assert (=> b!739649 m!691003))

(declare-fun m!691005 () Bool)

(assert (=> b!739649 m!691005))

(declare-fun m!691007 () Bool)

(assert (=> b!739649 m!691007))

(assert (=> b!739649 m!691001))

(declare-fun m!691009 () Bool)

(assert (=> b!739649 m!691009))

(assert (=> b!739648 m!690967))

(assert (=> b!739648 m!690967))

(assert (=> b!739648 m!690971))

(assert (=> b!739659 m!690967))

(assert (=> b!739659 m!690967))

(declare-fun m!691011 () Bool)

(assert (=> b!739659 m!691011))

(assert (=> b!739659 m!691011))

(assert (=> b!739659 m!690967))

(declare-fun m!691013 () Bool)

(assert (=> b!739659 m!691013))

(declare-fun m!691015 () Bool)

(assert (=> b!739638 m!691015))

(assert (=> b!739654 m!690967))

(assert (=> b!739654 m!690967))

(declare-fun m!691017 () Bool)

(assert (=> b!739654 m!691017))

(assert (=> b!739647 m!690967))

(assert (=> b!739647 m!690967))

(assert (=> b!739647 m!690995))

(assert (=> b!739657 m!690967))

(assert (=> b!739657 m!690967))

(declare-fun m!691019 () Bool)

(assert (=> b!739657 m!691019))

(push 1)

