; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65376 () Bool)

(assert start!65376)

(declare-fun b!743559 () Bool)

(declare-fun res!500653 () Bool)

(declare-fun e!415431 () Bool)

(assert (=> b!743559 (=> (not res!500653) (not e!415431))))

(declare-datatypes ((array!41549 0))(
  ( (array!41550 (arr!19888 (Array (_ BitVec 32) (_ BitVec 64))) (size!20309 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41549)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!743559 (= res!500653 (and (= (size!20309 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20309 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20309 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743560 () Bool)

(declare-fun res!500652 () Bool)

(declare-fun e!415428 () Bool)

(assert (=> b!743560 (=> res!500652 e!415428)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330304 () (_ BitVec 64))

(declare-fun lt!330299 () array!41549)

(declare-datatypes ((SeekEntryResult!7488 0))(
  ( (MissingZero!7488 (index!32320 (_ BitVec 32))) (Found!7488 (index!32321 (_ BitVec 32))) (Intermediate!7488 (undefined!8300 Bool) (index!32322 (_ BitVec 32)) (x!63286 (_ BitVec 32))) (Undefined!7488) (MissingVacant!7488 (index!32323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41549 (_ BitVec 32)) SeekEntryResult!7488)

(assert (=> b!743560 (= res!500652 (not (= (seekEntryOrOpen!0 lt!330304 lt!330299 mask!3328) (Found!7488 index!1321))))))

(declare-fun b!743561 () Bool)

(declare-fun res!500639 () Bool)

(declare-fun e!415435 () Bool)

(assert (=> b!743561 (=> (not res!500639) (not e!415435))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!743561 (= res!500639 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19888 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743563 () Bool)

(declare-fun e!415434 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41549 (_ BitVec 32)) SeekEntryResult!7488)

(assert (=> b!743563 (= e!415434 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) (Found!7488 j!159)))))

(declare-fun b!743564 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743564 (= e!415428 (validKeyInArray!0 lt!330304))))

(declare-fun b!743565 () Bool)

(declare-fun res!500648 () Bool)

(assert (=> b!743565 (=> (not res!500648) (not e!415431))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743565 (= res!500648 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743566 () Bool)

(declare-fun lt!330305 () SeekEntryResult!7488)

(declare-fun e!415429 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743566 (= e!415429 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330305))))

(declare-fun lt!330302 () SeekEntryResult!7488)

(declare-fun b!743567 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41549 (_ BitVec 32)) SeekEntryResult!7488)

(assert (=> b!743567 (= e!415434 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330302))))

(declare-fun b!743568 () Bool)

(declare-fun res!500650 () Bool)

(assert (=> b!743568 (=> (not res!500650) (not e!415431))))

(assert (=> b!743568 (= res!500650 (validKeyInArray!0 (select (arr!19888 a!3186) j!159)))))

(declare-fun b!743569 () Bool)

(declare-fun res!500641 () Bool)

(declare-fun e!415430 () Bool)

(assert (=> b!743569 (=> (not res!500641) (not e!415430))))

(declare-datatypes ((List!13890 0))(
  ( (Nil!13887) (Cons!13886 (h!14958 (_ BitVec 64)) (t!20205 List!13890)) )
))
(declare-fun arrayNoDuplicates!0 (array!41549 (_ BitVec 32) List!13890) Bool)

(assert (=> b!743569 (= res!500641 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13887))))

(declare-fun b!743570 () Bool)

(declare-fun res!500654 () Bool)

(assert (=> b!743570 (=> res!500654 e!415428)))

(assert (=> b!743570 (= res!500654 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743571 () Bool)

(assert (=> b!743571 (= e!415430 e!415435)))

(declare-fun res!500651 () Bool)

(assert (=> b!743571 (=> (not res!500651) (not e!415435))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743571 (= res!500651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19888 a!3186) j!159) mask!3328) (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330302))))

(assert (=> b!743571 (= lt!330302 (Intermediate!7488 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743572 () Bool)

(declare-fun res!500645 () Bool)

(assert (=> b!743572 (=> (not res!500645) (not e!415430))))

(assert (=> b!743572 (= res!500645 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20309 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20309 a!3186))))))

(declare-fun b!743562 () Bool)

(assert (=> b!743562 (= e!415431 e!415430)))

(declare-fun res!500640 () Bool)

(assert (=> b!743562 (=> (not res!500640) (not e!415430))))

(declare-fun lt!330300 () SeekEntryResult!7488)

(assert (=> b!743562 (= res!500640 (or (= lt!330300 (MissingZero!7488 i!1173)) (= lt!330300 (MissingVacant!7488 i!1173))))))

(assert (=> b!743562 (= lt!330300 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!500642 () Bool)

(assert (=> start!65376 (=> (not res!500642) (not e!415431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65376 (= res!500642 (validMask!0 mask!3328))))

(assert (=> start!65376 e!415431))

(assert (=> start!65376 true))

(declare-fun array_inv!15684 (array!41549) Bool)

(assert (=> start!65376 (array_inv!15684 a!3186)))

(declare-fun b!743573 () Bool)

(declare-fun res!500656 () Bool)

(assert (=> b!743573 (=> res!500656 e!415428)))

(declare-fun lt!330303 () SeekEntryResult!7488)

(assert (=> b!743573 (= res!500656 (or (not (= (select (store (arr!19888 a!3186) i!1173 k0!2102) index!1321) lt!330304)) (undefined!8300 lt!330303)))))

(declare-fun b!743574 () Bool)

(declare-fun res!500643 () Bool)

(assert (=> b!743574 (=> (not res!500643) (not e!415430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41549 (_ BitVec 32)) Bool)

(assert (=> b!743574 (= res!500643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743575 () Bool)

(declare-fun res!500638 () Bool)

(assert (=> b!743575 (=> res!500638 e!415428)))

(assert (=> b!743575 (= res!500638 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) (Found!7488 j!159))))))

(declare-fun b!743576 () Bool)

(declare-fun res!500646 () Bool)

(assert (=> b!743576 (=> (not res!500646) (not e!415431))))

(assert (=> b!743576 (= res!500646 (validKeyInArray!0 k0!2102))))

(declare-fun b!743577 () Bool)

(declare-fun e!415436 () Bool)

(assert (=> b!743577 (= e!415436 e!415429)))

(declare-fun res!500657 () Bool)

(assert (=> b!743577 (=> (not res!500657) (not e!415429))))

(assert (=> b!743577 (= res!500657 (= (seekEntryOrOpen!0 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330305))))

(assert (=> b!743577 (= lt!330305 (Found!7488 j!159))))

(declare-fun b!743578 () Bool)

(declare-fun e!415433 () Bool)

(assert (=> b!743578 (= e!415433 (not e!415428))))

(declare-fun res!500644 () Bool)

(assert (=> b!743578 (=> res!500644 e!415428)))

(get-info :version)

(assert (=> b!743578 (= res!500644 (or (not ((_ is Intermediate!7488) lt!330303)) (bvslt x!1131 (x!63286 lt!330303)) (not (= x!1131 (x!63286 lt!330303))) (not (= index!1321 (index!32322 lt!330303)))))))

(assert (=> b!743578 e!415436))

(declare-fun res!500649 () Bool)

(assert (=> b!743578 (=> (not res!500649) (not e!415436))))

(assert (=> b!743578 (= res!500649 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25456 0))(
  ( (Unit!25457) )
))
(declare-fun lt!330298 () Unit!25456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25456)

(assert (=> b!743578 (= lt!330298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743579 () Bool)

(assert (=> b!743579 (= e!415435 e!415433)))

(declare-fun res!500655 () Bool)

(assert (=> b!743579 (=> (not res!500655) (not e!415433))))

(declare-fun lt!330301 () SeekEntryResult!7488)

(assert (=> b!743579 (= res!500655 (= lt!330301 lt!330303))))

(assert (=> b!743579 (= lt!330303 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330304 lt!330299 mask!3328))))

(assert (=> b!743579 (= lt!330301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330304 mask!3328) lt!330304 lt!330299 mask!3328))))

(assert (=> b!743579 (= lt!330304 (select (store (arr!19888 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743579 (= lt!330299 (array!41550 (store (arr!19888 a!3186) i!1173 k0!2102) (size!20309 a!3186)))))

(declare-fun b!743580 () Bool)

(declare-fun res!500647 () Bool)

(assert (=> b!743580 (=> (not res!500647) (not e!415435))))

(assert (=> b!743580 (= res!500647 e!415434)))

(declare-fun c!81841 () Bool)

(assert (=> b!743580 (= c!81841 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65376 res!500642) b!743559))

(assert (= (and b!743559 res!500653) b!743568))

(assert (= (and b!743568 res!500650) b!743576))

(assert (= (and b!743576 res!500646) b!743565))

(assert (= (and b!743565 res!500648) b!743562))

(assert (= (and b!743562 res!500640) b!743574))

(assert (= (and b!743574 res!500643) b!743569))

(assert (= (and b!743569 res!500641) b!743572))

(assert (= (and b!743572 res!500645) b!743571))

(assert (= (and b!743571 res!500651) b!743561))

(assert (= (and b!743561 res!500639) b!743580))

(assert (= (and b!743580 c!81841) b!743567))

(assert (= (and b!743580 (not c!81841)) b!743563))

(assert (= (and b!743580 res!500647) b!743579))

(assert (= (and b!743579 res!500655) b!743578))

(assert (= (and b!743578 res!500649) b!743577))

(assert (= (and b!743577 res!500657) b!743566))

(assert (= (and b!743578 (not res!500644)) b!743575))

(assert (= (and b!743575 (not res!500638)) b!743573))

(assert (= (and b!743573 (not res!500656)) b!743560))

(assert (= (and b!743560 (not res!500652)) b!743570))

(assert (= (and b!743570 (not res!500654)) b!743564))

(declare-fun m!694223 () Bool)

(assert (=> b!743560 m!694223))

(declare-fun m!694225 () Bool)

(assert (=> b!743579 m!694225))

(declare-fun m!694227 () Bool)

(assert (=> b!743579 m!694227))

(declare-fun m!694229 () Bool)

(assert (=> b!743579 m!694229))

(declare-fun m!694231 () Bool)

(assert (=> b!743579 m!694231))

(declare-fun m!694233 () Bool)

(assert (=> b!743579 m!694233))

(assert (=> b!743579 m!694225))

(declare-fun m!694235 () Bool)

(assert (=> b!743574 m!694235))

(declare-fun m!694237 () Bool)

(assert (=> b!743566 m!694237))

(assert (=> b!743566 m!694237))

(declare-fun m!694239 () Bool)

(assert (=> b!743566 m!694239))

(declare-fun m!694241 () Bool)

(assert (=> b!743569 m!694241))

(assert (=> b!743567 m!694237))

(assert (=> b!743567 m!694237))

(declare-fun m!694243 () Bool)

(assert (=> b!743567 m!694243))

(declare-fun m!694245 () Bool)

(assert (=> b!743562 m!694245))

(declare-fun m!694247 () Bool)

(assert (=> b!743564 m!694247))

(declare-fun m!694249 () Bool)

(assert (=> b!743578 m!694249))

(declare-fun m!694251 () Bool)

(assert (=> b!743578 m!694251))

(declare-fun m!694253 () Bool)

(assert (=> b!743565 m!694253))

(assert (=> b!743568 m!694237))

(assert (=> b!743568 m!694237))

(declare-fun m!694255 () Bool)

(assert (=> b!743568 m!694255))

(assert (=> b!743571 m!694237))

(assert (=> b!743571 m!694237))

(declare-fun m!694257 () Bool)

(assert (=> b!743571 m!694257))

(assert (=> b!743571 m!694257))

(assert (=> b!743571 m!694237))

(declare-fun m!694259 () Bool)

(assert (=> b!743571 m!694259))

(assert (=> b!743577 m!694237))

(assert (=> b!743577 m!694237))

(declare-fun m!694261 () Bool)

(assert (=> b!743577 m!694261))

(assert (=> b!743575 m!694237))

(assert (=> b!743575 m!694237))

(declare-fun m!694263 () Bool)

(assert (=> b!743575 m!694263))

(assert (=> b!743563 m!694237))

(assert (=> b!743563 m!694237))

(assert (=> b!743563 m!694263))

(declare-fun m!694265 () Bool)

(assert (=> start!65376 m!694265))

(declare-fun m!694267 () Bool)

(assert (=> start!65376 m!694267))

(declare-fun m!694269 () Bool)

(assert (=> b!743561 m!694269))

(assert (=> b!743573 m!694229))

(declare-fun m!694271 () Bool)

(assert (=> b!743573 m!694271))

(declare-fun m!694273 () Bool)

(assert (=> b!743576 m!694273))

(check-sat (not b!743562) (not b!743578) (not b!743565) (not b!743576) (not b!743575) (not b!743569) (not b!743571) (not start!65376) (not b!743560) (not b!743566) (not b!743577) (not b!743564) (not b!743574) (not b!743567) (not b!743568) (not b!743579) (not b!743563))
(check-sat)
