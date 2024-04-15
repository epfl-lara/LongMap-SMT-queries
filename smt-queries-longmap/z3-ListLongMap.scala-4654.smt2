; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64676 () Bool)

(assert start!64676)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41142 0))(
  ( (array!41143 (arr!19691 (Array (_ BitVec 32) (_ BitVec 64))) (size!20112 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41142)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729300 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!408167 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7288 0))(
  ( (MissingZero!7288 (index!31520 (_ BitVec 32))) (Found!7288 (index!31521 (_ BitVec 32))) (Intermediate!7288 (undefined!8100 Bool) (index!31522 (_ BitVec 32)) (x!62513 (_ BitVec 32))) (Undefined!7288) (MissingVacant!7288 (index!31523 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41142 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!729300 (= e!408167 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) (Found!7288 j!159)))))

(declare-fun b!729301 () Bool)

(declare-fun res!489842 () Bool)

(declare-fun e!408169 () Bool)

(assert (=> b!729301 (=> (not res!489842) (not e!408169))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729301 (= res!489842 (and (= (size!20112 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20112 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20112 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729302 () Bool)

(declare-fun res!489841 () Bool)

(declare-fun e!408172 () Bool)

(assert (=> b!729302 (=> (not res!489841) (not e!408172))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729302 (= res!489841 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20112 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20112 a!3186))))))

(declare-fun b!729303 () Bool)

(declare-fun e!408170 () Bool)

(declare-fun e!408165 () Bool)

(assert (=> b!729303 (= e!408170 e!408165)))

(declare-fun res!489836 () Bool)

(assert (=> b!729303 (=> (not res!489836) (not e!408165))))

(declare-fun lt!322983 () SeekEntryResult!7288)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41142 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!729303 (= res!489836 (= (seekEntryOrOpen!0 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!322983))))

(assert (=> b!729303 (= lt!322983 (Found!7288 j!159))))

(declare-fun b!729304 () Bool)

(declare-fun res!489835 () Bool)

(declare-fun e!408164 () Bool)

(assert (=> b!729304 (=> (not res!489835) (not e!408164))))

(assert (=> b!729304 (= res!489835 e!408167)))

(declare-fun c!80109 () Bool)

(assert (=> b!729304 (= c!80109 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!489843 () Bool)

(assert (=> start!64676 (=> (not res!489843) (not e!408169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64676 (= res!489843 (validMask!0 mask!3328))))

(assert (=> start!64676 e!408169))

(assert (=> start!64676 true))

(declare-fun array_inv!15574 (array!41142) Bool)

(assert (=> start!64676 (array_inv!15574 a!3186)))

(declare-fun b!729305 () Bool)

(declare-fun res!489846 () Bool)

(assert (=> b!729305 (=> (not res!489846) (not e!408164))))

(assert (=> b!729305 (= res!489846 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19691 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729306 () Bool)

(declare-fun e!408168 () Bool)

(assert (=> b!729306 (= e!408164 e!408168)))

(declare-fun res!489844 () Bool)

(assert (=> b!729306 (=> (not res!489844) (not e!408168))))

(declare-fun lt!322978 () SeekEntryResult!7288)

(declare-fun lt!322984 () SeekEntryResult!7288)

(assert (=> b!729306 (= res!489844 (= lt!322978 lt!322984))))

(declare-fun lt!322985 () (_ BitVec 64))

(declare-fun lt!322979 () array!41142)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41142 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!729306 (= lt!322984 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322985 lt!322979 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729306 (= lt!322978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322985 mask!3328) lt!322985 lt!322979 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729306 (= lt!322985 (select (store (arr!19691 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729306 (= lt!322979 (array!41143 (store (arr!19691 a!3186) i!1173 k0!2102) (size!20112 a!3186)))))

(declare-fun lt!322982 () SeekEntryResult!7288)

(declare-fun b!729307 () Bool)

(assert (=> b!729307 (= e!408167 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!322982))))

(declare-fun b!729308 () Bool)

(declare-fun res!489838 () Bool)

(assert (=> b!729308 (=> (not res!489838) (not e!408172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41142 (_ BitVec 32)) Bool)

(assert (=> b!729308 (= res!489838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729309 () Bool)

(declare-fun res!489834 () Bool)

(assert (=> b!729309 (=> (not res!489834) (not e!408169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729309 (= res!489834 (validKeyInArray!0 (select (arr!19691 a!3186) j!159)))))

(declare-fun b!729310 () Bool)

(assert (=> b!729310 (= e!408165 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!322983))))

(declare-fun b!729311 () Bool)

(assert (=> b!729311 (= e!408172 e!408164)))

(declare-fun res!489845 () Bool)

(assert (=> b!729311 (=> (not res!489845) (not e!408164))))

(assert (=> b!729311 (= res!489845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19691 a!3186) j!159) mask!3328) (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!322982))))

(assert (=> b!729311 (= lt!322982 (Intermediate!7288 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729312 () Bool)

(declare-fun res!489840 () Bool)

(assert (=> b!729312 (=> (not res!489840) (not e!408169))))

(declare-fun arrayContainsKey!0 (array!41142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729312 (= res!489840 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729313 () Bool)

(assert (=> b!729313 (= e!408169 e!408172)))

(declare-fun res!489831 () Bool)

(assert (=> b!729313 (=> (not res!489831) (not e!408172))))

(declare-fun lt!322977 () SeekEntryResult!7288)

(assert (=> b!729313 (= res!489831 (or (= lt!322977 (MissingZero!7288 i!1173)) (= lt!322977 (MissingVacant!7288 i!1173))))))

(assert (=> b!729313 (= lt!322977 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729314 () Bool)

(declare-fun res!489832 () Bool)

(assert (=> b!729314 (=> (not res!489832) (not e!408169))))

(assert (=> b!729314 (= res!489832 (validKeyInArray!0 k0!2102))))

(declare-fun e!408166 () Bool)

(declare-fun b!729315 () Bool)

(assert (=> b!729315 (= e!408166 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!322981 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729315 (= lt!322981 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729316 () Bool)

(declare-fun res!489833 () Bool)

(assert (=> b!729316 (=> (not res!489833) (not e!408172))))

(declare-datatypes ((List!13732 0))(
  ( (Nil!13729) (Cons!13728 (h!14788 (_ BitVec 64)) (t!20038 List!13732)) )
))
(declare-fun arrayNoDuplicates!0 (array!41142 (_ BitVec 32) List!13732) Bool)

(assert (=> b!729316 (= res!489833 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13729))))

(declare-fun b!729317 () Bool)

(assert (=> b!729317 (= e!408168 (not e!408166))))

(declare-fun res!489837 () Bool)

(assert (=> b!729317 (=> res!489837 e!408166)))

(get-info :version)

(assert (=> b!729317 (= res!489837 (or (not ((_ is Intermediate!7288) lt!322984)) (bvsge x!1131 (x!62513 lt!322984))))))

(assert (=> b!729317 e!408170))

(declare-fun res!489839 () Bool)

(assert (=> b!729317 (=> (not res!489839) (not e!408170))))

(assert (=> b!729317 (= res!489839 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24866 0))(
  ( (Unit!24867) )
))
(declare-fun lt!322980 () Unit!24866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24866)

(assert (=> b!729317 (= lt!322980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64676 res!489843) b!729301))

(assert (= (and b!729301 res!489842) b!729309))

(assert (= (and b!729309 res!489834) b!729314))

(assert (= (and b!729314 res!489832) b!729312))

(assert (= (and b!729312 res!489840) b!729313))

(assert (= (and b!729313 res!489831) b!729308))

(assert (= (and b!729308 res!489838) b!729316))

(assert (= (and b!729316 res!489833) b!729302))

(assert (= (and b!729302 res!489841) b!729311))

(assert (= (and b!729311 res!489845) b!729305))

(assert (= (and b!729305 res!489846) b!729304))

(assert (= (and b!729304 c!80109) b!729307))

(assert (= (and b!729304 (not c!80109)) b!729300))

(assert (= (and b!729304 res!489835) b!729306))

(assert (= (and b!729306 res!489844) b!729317))

(assert (= (and b!729317 res!489839) b!729303))

(assert (= (and b!729303 res!489836) b!729310))

(assert (= (and b!729317 (not res!489837)) b!729315))

(declare-fun m!682421 () Bool)

(assert (=> b!729305 m!682421))

(declare-fun m!682423 () Bool)

(assert (=> b!729311 m!682423))

(assert (=> b!729311 m!682423))

(declare-fun m!682425 () Bool)

(assert (=> b!729311 m!682425))

(assert (=> b!729311 m!682425))

(assert (=> b!729311 m!682423))

(declare-fun m!682427 () Bool)

(assert (=> b!729311 m!682427))

(declare-fun m!682429 () Bool)

(assert (=> b!729314 m!682429))

(declare-fun m!682431 () Bool)

(assert (=> start!64676 m!682431))

(declare-fun m!682433 () Bool)

(assert (=> start!64676 m!682433))

(declare-fun m!682435 () Bool)

(assert (=> b!729316 m!682435))

(assert (=> b!729310 m!682423))

(assert (=> b!729310 m!682423))

(declare-fun m!682437 () Bool)

(assert (=> b!729310 m!682437))

(assert (=> b!729303 m!682423))

(assert (=> b!729303 m!682423))

(declare-fun m!682439 () Bool)

(assert (=> b!729303 m!682439))

(assert (=> b!729309 m!682423))

(assert (=> b!729309 m!682423))

(declare-fun m!682441 () Bool)

(assert (=> b!729309 m!682441))

(declare-fun m!682443 () Bool)

(assert (=> b!729313 m!682443))

(assert (=> b!729307 m!682423))

(assert (=> b!729307 m!682423))

(declare-fun m!682445 () Bool)

(assert (=> b!729307 m!682445))

(declare-fun m!682447 () Bool)

(assert (=> b!729308 m!682447))

(declare-fun m!682449 () Bool)

(assert (=> b!729306 m!682449))

(declare-fun m!682451 () Bool)

(assert (=> b!729306 m!682451))

(declare-fun m!682453 () Bool)

(assert (=> b!729306 m!682453))

(assert (=> b!729306 m!682449))

(declare-fun m!682455 () Bool)

(assert (=> b!729306 m!682455))

(declare-fun m!682457 () Bool)

(assert (=> b!729306 m!682457))

(declare-fun m!682459 () Bool)

(assert (=> b!729315 m!682459))

(declare-fun m!682461 () Bool)

(assert (=> b!729312 m!682461))

(declare-fun m!682463 () Bool)

(assert (=> b!729317 m!682463))

(declare-fun m!682465 () Bool)

(assert (=> b!729317 m!682465))

(assert (=> b!729300 m!682423))

(assert (=> b!729300 m!682423))

(declare-fun m!682467 () Bool)

(assert (=> b!729300 m!682467))

(check-sat (not b!729314) (not b!729311) (not b!729300) (not b!729313) (not b!729310) (not b!729317) (not b!729307) (not b!729306) (not b!729309) (not b!729308) (not start!64676) (not b!729303) (not b!729315) (not b!729312) (not b!729316))
(check-sat)
