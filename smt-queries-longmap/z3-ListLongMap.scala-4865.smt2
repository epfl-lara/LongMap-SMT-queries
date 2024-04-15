; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67082 () Bool)

(assert start!67082)

(declare-fun res!523579 () Bool)

(declare-fun e!430983 () Bool)

(assert (=> start!67082 (=> (not res!523579) (not e!430983))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67082 (= res!523579 (validMask!0 mask!3328))))

(assert (=> start!67082 e!430983))

(assert (=> start!67082 true))

(declare-datatypes ((array!42456 0))(
  ( (array!42457 (arr!20324 (Array (_ BitVec 32) (_ BitVec 64))) (size!20745 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42456)

(declare-fun array_inv!16207 (array!42456) Bool)

(assert (=> start!67082 (array_inv!16207 a!3186)))

(declare-fun b!774272 () Bool)

(declare-fun e!430984 () Bool)

(declare-fun e!430979 () Bool)

(assert (=> b!774272 (= e!430984 e!430979)))

(declare-fun res!523576 () Bool)

(assert (=> b!774272 (=> res!523576 e!430979)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!344692 () (_ BitVec 32))

(assert (=> b!774272 (= res!523576 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344692 #b00000000000000000000000000000000) (bvsge lt!344692 (size!20745 a!3186))))))

(declare-datatypes ((Unit!26678 0))(
  ( (Unit!26679) )
))
(declare-fun lt!344696 () Unit!26678)

(declare-fun e!430980 () Unit!26678)

(assert (=> b!774272 (= lt!344696 e!430980)))

(declare-fun c!85755 () Bool)

(declare-fun lt!344687 () Bool)

(assert (=> b!774272 (= c!85755 lt!344687)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774272 (= lt!344687 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774272 (= lt!344692 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774273 () Bool)

(declare-fun res!523581 () Bool)

(assert (=> b!774273 (=> res!523581 e!430979)))

(declare-fun lt!344697 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7921 0))(
  ( (MissingZero!7921 (index!34052 (_ BitVec 32))) (Found!7921 (index!34053 (_ BitVec 32))) (Intermediate!7921 (undefined!8733 Bool) (index!34054 (_ BitVec 32)) (x!65011 (_ BitVec 32))) (Undefined!7921) (MissingVacant!7921 (index!34055 (_ BitVec 32))) )
))
(declare-fun lt!344689 () SeekEntryResult!7921)

(declare-fun lt!344688 () array!42456)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42456 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!774273 (= res!523581 (not (= lt!344689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344692 lt!344697 lt!344688 mask!3328))))))

(declare-fun b!774274 () Bool)

(declare-fun Unit!26680 () Unit!26678)

(assert (=> b!774274 (= e!430980 Unit!26680)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!344690 () SeekEntryResult!7921)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42456 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!774274 (= lt!344690 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344699 () SeekEntryResult!7921)

(assert (=> b!774274 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344692 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344699)))

(declare-fun b!774275 () Bool)

(declare-fun res!523566 () Bool)

(assert (=> b!774275 (=> (not res!523566) (not e!430983))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774275 (= res!523566 (validKeyInArray!0 k0!2102))))

(declare-fun b!774276 () Bool)

(assert (=> b!774276 (= e!430979 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1131)) (bvsub #b01111111111111111111111111111110 x!1131)))))

(declare-fun b!774277 () Bool)

(declare-fun e!430987 () Bool)

(declare-fun e!430990 () Bool)

(assert (=> b!774277 (= e!430987 e!430990)))

(declare-fun res!523584 () Bool)

(assert (=> b!774277 (=> (not res!523584) (not e!430990))))

(declare-fun lt!344694 () SeekEntryResult!7921)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42456 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!774277 (= res!523584 (= (seekEntryOrOpen!0 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344694))))

(assert (=> b!774277 (= lt!344694 (Found!7921 j!159))))

(declare-fun b!774278 () Bool)

(declare-fun Unit!26681 () Unit!26678)

(assert (=> b!774278 (= e!430980 Unit!26681)))

(declare-fun lt!344695 () SeekEntryResult!7921)

(assert (=> b!774278 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344692 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344695)))

(declare-fun b!774279 () Bool)

(declare-fun res!523572 () Bool)

(declare-fun e!430986 () Bool)

(assert (=> b!774279 (=> (not res!523572) (not e!430986))))

(assert (=> b!774279 (= res!523572 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20745 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20745 a!3186))))))

(declare-fun b!774280 () Bool)

(assert (=> b!774280 (= e!430983 e!430986)))

(declare-fun res!523574 () Bool)

(assert (=> b!774280 (=> (not res!523574) (not e!430986))))

(declare-fun lt!344693 () SeekEntryResult!7921)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774280 (= res!523574 (or (= lt!344693 (MissingZero!7921 i!1173)) (= lt!344693 (MissingVacant!7921 i!1173))))))

(assert (=> b!774280 (= lt!344693 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!430988 () Bool)

(declare-fun b!774281 () Bool)

(assert (=> b!774281 (= e!430988 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344692 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344695)))))

(declare-fun b!774282 () Bool)

(declare-fun res!523580 () Bool)

(assert (=> b!774282 (=> (not res!523580) (not e!430986))))

(declare-datatypes ((List!14365 0))(
  ( (Nil!14362) (Cons!14361 (h!15469 (_ BitVec 64)) (t!20671 List!14365)) )
))
(declare-fun arrayNoDuplicates!0 (array!42456 (_ BitVec 32) List!14365) Bool)

(assert (=> b!774282 (= res!523580 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14362))))

(declare-fun b!774283 () Bool)

(declare-fun res!523582 () Bool)

(assert (=> b!774283 (=> (not res!523582) (not e!430986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42456 (_ BitVec 32)) Bool)

(assert (=> b!774283 (= res!523582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774284 () Bool)

(assert (=> b!774284 (= e!430988 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344692 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344699)))))

(declare-fun b!774285 () Bool)

(declare-fun e!430981 () Bool)

(declare-fun e!430982 () Bool)

(assert (=> b!774285 (= e!430981 e!430982)))

(declare-fun res!523569 () Bool)

(assert (=> b!774285 (=> (not res!523569) (not e!430982))))

(declare-fun lt!344691 () SeekEntryResult!7921)

(assert (=> b!774285 (= res!523569 (= lt!344689 lt!344691))))

(assert (=> b!774285 (= lt!344691 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344697 lt!344688 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774285 (= lt!344689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344697 mask!3328) lt!344697 lt!344688 mask!3328))))

(assert (=> b!774285 (= lt!344697 (select (store (arr!20324 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774285 (= lt!344688 (array!42457 (store (arr!20324 a!3186) i!1173 k0!2102) (size!20745 a!3186)))))

(declare-fun b!774286 () Bool)

(declare-fun res!523568 () Bool)

(assert (=> b!774286 (=> (not res!523568) (not e!430983))))

(assert (=> b!774286 (= res!523568 (validKeyInArray!0 (select (arr!20324 a!3186) j!159)))))

(declare-fun b!774287 () Bool)

(assert (=> b!774287 (= e!430990 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344694))))

(declare-fun e!430989 () Bool)

(declare-fun b!774288 () Bool)

(assert (=> b!774288 (= e!430989 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344695))))

(declare-fun b!774289 () Bool)

(declare-fun res!523578 () Bool)

(assert (=> b!774289 (=> (not res!523578) (not e!430983))))

(declare-fun arrayContainsKey!0 (array!42456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774289 (= res!523578 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774290 () Bool)

(assert (=> b!774290 (= e!430986 e!430981)))

(declare-fun res!523567 () Bool)

(assert (=> b!774290 (=> (not res!523567) (not e!430981))))

(assert (=> b!774290 (= res!523567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344695))))

(assert (=> b!774290 (= lt!344695 (Intermediate!7921 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774291 () Bool)

(assert (=> b!774291 (= e!430989 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) (Found!7921 j!159)))))

(declare-fun b!774292 () Bool)

(assert (=> b!774292 (= e!430982 (not e!430984))))

(declare-fun res!523570 () Bool)

(assert (=> b!774292 (=> res!523570 e!430984)))

(get-info :version)

(assert (=> b!774292 (= res!523570 (or (not ((_ is Intermediate!7921) lt!344691)) (bvsge x!1131 (x!65011 lt!344691))))))

(assert (=> b!774292 (= lt!344699 (Found!7921 j!159))))

(assert (=> b!774292 e!430987))

(declare-fun res!523577 () Bool)

(assert (=> b!774292 (=> (not res!523577) (not e!430987))))

(assert (=> b!774292 (= res!523577 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344698 () Unit!26678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26678)

(assert (=> b!774292 (= lt!344698 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774293 () Bool)

(declare-fun res!523575 () Bool)

(assert (=> b!774293 (=> (not res!523575) (not e!430981))))

(assert (=> b!774293 (= res!523575 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20324 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774294 () Bool)

(declare-fun res!523583 () Bool)

(assert (=> b!774294 (=> (not res!523583) (not e!430981))))

(assert (=> b!774294 (= res!523583 e!430989)))

(declare-fun c!85753 () Bool)

(assert (=> b!774294 (= c!85753 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774295 () Bool)

(declare-fun res!523573 () Bool)

(assert (=> b!774295 (=> res!523573 e!430979)))

(assert (=> b!774295 (= res!523573 e!430988)))

(declare-fun c!85754 () Bool)

(assert (=> b!774295 (= c!85754 lt!344687)))

(declare-fun b!774296 () Bool)

(declare-fun res!523571 () Bool)

(assert (=> b!774296 (=> (not res!523571) (not e!430983))))

(assert (=> b!774296 (= res!523571 (and (= (size!20745 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20745 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20745 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67082 res!523579) b!774296))

(assert (= (and b!774296 res!523571) b!774286))

(assert (= (and b!774286 res!523568) b!774275))

(assert (= (and b!774275 res!523566) b!774289))

(assert (= (and b!774289 res!523578) b!774280))

(assert (= (and b!774280 res!523574) b!774283))

(assert (= (and b!774283 res!523582) b!774282))

(assert (= (and b!774282 res!523580) b!774279))

(assert (= (and b!774279 res!523572) b!774290))

(assert (= (and b!774290 res!523567) b!774293))

(assert (= (and b!774293 res!523575) b!774294))

(assert (= (and b!774294 c!85753) b!774288))

(assert (= (and b!774294 (not c!85753)) b!774291))

(assert (= (and b!774294 res!523583) b!774285))

(assert (= (and b!774285 res!523569) b!774292))

(assert (= (and b!774292 res!523577) b!774277))

(assert (= (and b!774277 res!523584) b!774287))

(assert (= (and b!774292 (not res!523570)) b!774272))

(assert (= (and b!774272 c!85755) b!774278))

(assert (= (and b!774272 (not c!85755)) b!774274))

(assert (= (and b!774272 (not res!523576)) b!774295))

(assert (= (and b!774295 c!85754) b!774281))

(assert (= (and b!774295 (not c!85754)) b!774284))

(assert (= (and b!774295 (not res!523573)) b!774273))

(assert (= (and b!774273 (not res!523581)) b!774276))

(declare-fun m!718209 () Bool)

(assert (=> b!774284 m!718209))

(assert (=> b!774284 m!718209))

(declare-fun m!718211 () Bool)

(assert (=> b!774284 m!718211))

(assert (=> b!774290 m!718209))

(assert (=> b!774290 m!718209))

(declare-fun m!718213 () Bool)

(assert (=> b!774290 m!718213))

(assert (=> b!774290 m!718213))

(assert (=> b!774290 m!718209))

(declare-fun m!718215 () Bool)

(assert (=> b!774290 m!718215))

(declare-fun m!718217 () Bool)

(assert (=> start!67082 m!718217))

(declare-fun m!718219 () Bool)

(assert (=> start!67082 m!718219))

(assert (=> b!774277 m!718209))

(assert (=> b!774277 m!718209))

(declare-fun m!718221 () Bool)

(assert (=> b!774277 m!718221))

(assert (=> b!774287 m!718209))

(assert (=> b!774287 m!718209))

(declare-fun m!718223 () Bool)

(assert (=> b!774287 m!718223))

(declare-fun m!718225 () Bool)

(assert (=> b!774272 m!718225))

(assert (=> b!774288 m!718209))

(assert (=> b!774288 m!718209))

(declare-fun m!718227 () Bool)

(assert (=> b!774288 m!718227))

(declare-fun m!718229 () Bool)

(assert (=> b!774285 m!718229))

(declare-fun m!718231 () Bool)

(assert (=> b!774285 m!718231))

(declare-fun m!718233 () Bool)

(assert (=> b!774285 m!718233))

(declare-fun m!718235 () Bool)

(assert (=> b!774285 m!718235))

(assert (=> b!774285 m!718229))

(declare-fun m!718237 () Bool)

(assert (=> b!774285 m!718237))

(declare-fun m!718239 () Bool)

(assert (=> b!774292 m!718239))

(declare-fun m!718241 () Bool)

(assert (=> b!774292 m!718241))

(declare-fun m!718243 () Bool)

(assert (=> b!774289 m!718243))

(assert (=> b!774274 m!718209))

(assert (=> b!774274 m!718209))

(declare-fun m!718245 () Bool)

(assert (=> b!774274 m!718245))

(assert (=> b!774274 m!718209))

(assert (=> b!774274 m!718211))

(assert (=> b!774286 m!718209))

(assert (=> b!774286 m!718209))

(declare-fun m!718247 () Bool)

(assert (=> b!774286 m!718247))

(assert (=> b!774278 m!718209))

(assert (=> b!774278 m!718209))

(declare-fun m!718249 () Bool)

(assert (=> b!774278 m!718249))

(declare-fun m!718251 () Bool)

(assert (=> b!774280 m!718251))

(declare-fun m!718253 () Bool)

(assert (=> b!774273 m!718253))

(declare-fun m!718255 () Bool)

(assert (=> b!774283 m!718255))

(assert (=> b!774281 m!718209))

(assert (=> b!774281 m!718209))

(assert (=> b!774281 m!718249))

(declare-fun m!718257 () Bool)

(assert (=> b!774275 m!718257))

(assert (=> b!774291 m!718209))

(assert (=> b!774291 m!718209))

(assert (=> b!774291 m!718245))

(declare-fun m!718259 () Bool)

(assert (=> b!774282 m!718259))

(declare-fun m!718261 () Bool)

(assert (=> b!774293 m!718261))

(check-sat (not b!774274) (not b!774281) (not b!774283) (not start!67082) (not b!774277) (not b!774278) (not b!774292) (not b!774290) (not b!774284) (not b!774282) (not b!774273) (not b!774287) (not b!774272) (not b!774280) (not b!774285) (not b!774275) (not b!774286) (not b!774289) (not b!774291) (not b!774288))
(check-sat)
