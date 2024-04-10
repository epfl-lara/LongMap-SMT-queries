; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65580 () Bool)

(assert start!65580)

(declare-fun b!749517 () Bool)

(declare-fun res!505741 () Bool)

(declare-fun e!418232 () Bool)

(assert (=> b!749517 (=> (not res!505741) (not e!418232))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41753 0))(
  ( (array!41754 (arr!19990 (Array (_ BitVec 32) (_ BitVec 64))) (size!20411 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41753)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749517 (= res!505741 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20411 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20411 a!3186))))))

(declare-fun b!749518 () Bool)

(declare-fun e!418236 () Bool)

(declare-fun e!418235 () Bool)

(assert (=> b!749518 (= e!418236 (not e!418235))))

(declare-fun res!505744 () Bool)

(assert (=> b!749518 (=> res!505744 e!418235)))

(declare-datatypes ((SeekEntryResult!7590 0))(
  ( (MissingZero!7590 (index!32728 (_ BitVec 32))) (Found!7590 (index!32729 (_ BitVec 32))) (Intermediate!7590 (undefined!8402 Bool) (index!32730 (_ BitVec 32)) (x!63660 (_ BitVec 32))) (Undefined!7590) (MissingVacant!7590 (index!32731 (_ BitVec 32))) )
))
(declare-fun lt!333229 () SeekEntryResult!7590)

(get-info :version)

(assert (=> b!749518 (= res!505744 (or (not ((_ is Intermediate!7590) lt!333229)) (bvslt x!1131 (x!63660 lt!333229)) (not (= x!1131 (x!63660 lt!333229))) (not (= index!1321 (index!32730 lt!333229)))))))

(declare-fun e!418231 () Bool)

(assert (=> b!749518 e!418231))

(declare-fun res!505748 () Bool)

(assert (=> b!749518 (=> (not res!505748) (not e!418231))))

(declare-fun lt!333223 () SeekEntryResult!7590)

(declare-fun lt!333222 () SeekEntryResult!7590)

(assert (=> b!749518 (= res!505748 (= lt!333223 lt!333222))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!749518 (= lt!333222 (Found!7590 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41753 (_ BitVec 32)) SeekEntryResult!7590)

(assert (=> b!749518 (= lt!333223 (seekEntryOrOpen!0 (select (arr!19990 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41753 (_ BitVec 32)) Bool)

(assert (=> b!749518 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25740 0))(
  ( (Unit!25741) )
))
(declare-fun lt!333220 () Unit!25740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25740)

(assert (=> b!749518 (= lt!333220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41753 (_ BitVec 32)) SeekEntryResult!7590)

(assert (=> b!749519 (= e!418231 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333222))))

(declare-fun res!505755 () Bool)

(declare-fun e!418233 () Bool)

(assert (=> start!65580 (=> (not res!505755) (not e!418233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65580 (= res!505755 (validMask!0 mask!3328))))

(assert (=> start!65580 e!418233))

(assert (=> start!65580 true))

(declare-fun array_inv!15786 (array!41753) Bool)

(assert (=> start!65580 (array_inv!15786 a!3186)))

(declare-fun b!749520 () Bool)

(declare-fun res!505752 () Bool)

(declare-fun e!418234 () Bool)

(assert (=> b!749520 (=> (not res!505752) (not e!418234))))

(declare-fun e!418230 () Bool)

(assert (=> b!749520 (= res!505752 e!418230)))

(declare-fun c!82270 () Bool)

(assert (=> b!749520 (= c!82270 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749521 () Bool)

(assert (=> b!749521 (= e!418232 e!418234)))

(declare-fun res!505757 () Bool)

(assert (=> b!749521 (=> (not res!505757) (not e!418234))))

(declare-fun lt!333221 () SeekEntryResult!7590)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41753 (_ BitVec 32)) SeekEntryResult!7590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749521 (= res!505757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19990 a!3186) j!159) mask!3328) (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333221))))

(assert (=> b!749521 (= lt!333221 (Intermediate!7590 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749522 () Bool)

(declare-fun res!505746 () Bool)

(assert (=> b!749522 (=> (not res!505746) (not e!418233))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749522 (= res!505746 (and (= (size!20411 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20411 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20411 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749523 () Bool)

(declare-fun e!418229 () Bool)

(assert (=> b!749523 (= e!418235 e!418229)))

(declare-fun res!505747 () Bool)

(assert (=> b!749523 (=> res!505747 e!418229)))

(declare-fun lt!333226 () (_ BitVec 64))

(declare-fun lt!333228 () (_ BitVec 64))

(assert (=> b!749523 (= res!505747 (= lt!333226 lt!333228))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749523 (= lt!333226 (select (store (arr!19990 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749524 () Bool)

(assert (=> b!749524 (= e!418230 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333221))))

(declare-fun b!749525 () Bool)

(assert (=> b!749525 (= e!418234 e!418236)))

(declare-fun res!505751 () Bool)

(assert (=> b!749525 (=> (not res!505751) (not e!418236))))

(declare-fun lt!333225 () SeekEntryResult!7590)

(assert (=> b!749525 (= res!505751 (= lt!333225 lt!333229))))

(declare-fun lt!333230 () array!41753)

(assert (=> b!749525 (= lt!333229 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333228 lt!333230 mask!3328))))

(assert (=> b!749525 (= lt!333225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333228 mask!3328) lt!333228 lt!333230 mask!3328))))

(assert (=> b!749525 (= lt!333228 (select (store (arr!19990 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749525 (= lt!333230 (array!41754 (store (arr!19990 a!3186) i!1173 k0!2102) (size!20411 a!3186)))))

(declare-fun b!749526 () Bool)

(declare-fun e!418238 () Unit!25740)

(declare-fun Unit!25742 () Unit!25740)

(assert (=> b!749526 (= e!418238 Unit!25742)))

(declare-fun b!749527 () Bool)

(declare-fun res!505745 () Bool)

(assert (=> b!749527 (=> (not res!505745) (not e!418233))))

(declare-fun arrayContainsKey!0 (array!41753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749527 (= res!505745 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749528 () Bool)

(declare-fun res!505749 () Bool)

(assert (=> b!749528 (=> (not res!505749) (not e!418234))))

(assert (=> b!749528 (= res!505749 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19990 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749529 () Bool)

(declare-fun res!505750 () Bool)

(assert (=> b!749529 (=> (not res!505750) (not e!418233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749529 (= res!505750 (validKeyInArray!0 (select (arr!19990 a!3186) j!159)))))

(declare-fun b!749530 () Bool)

(assert (=> b!749530 (= e!418230 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) (Found!7590 j!159)))))

(declare-fun b!749531 () Bool)

(declare-fun res!505743 () Bool)

(assert (=> b!749531 (=> (not res!505743) (not e!418233))))

(assert (=> b!749531 (= res!505743 (validKeyInArray!0 k0!2102))))

(declare-fun b!749532 () Bool)

(declare-fun Unit!25743 () Unit!25740)

(assert (=> b!749532 (= e!418238 Unit!25743)))

(assert (=> b!749532 false))

(declare-fun e!418237 () Bool)

(declare-fun b!749533 () Bool)

(assert (=> b!749533 (= e!418237 (= (seekEntryOrOpen!0 lt!333228 lt!333230 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333228 lt!333230 mask!3328)))))

(declare-fun b!749534 () Bool)

(declare-fun res!505742 () Bool)

(assert (=> b!749534 (=> (not res!505742) (not e!418232))))

(assert (=> b!749534 (= res!505742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749535 () Bool)

(declare-fun res!505740 () Bool)

(assert (=> b!749535 (=> res!505740 e!418235)))

(assert (=> b!749535 (= res!505740 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333222)))))

(declare-fun b!749536 () Bool)

(assert (=> b!749536 (= e!418233 e!418232)))

(declare-fun res!505754 () Bool)

(assert (=> b!749536 (=> (not res!505754) (not e!418232))))

(declare-fun lt!333224 () SeekEntryResult!7590)

(assert (=> b!749536 (= res!505754 (or (= lt!333224 (MissingZero!7590 i!1173)) (= lt!333224 (MissingVacant!7590 i!1173))))))

(assert (=> b!749536 (= lt!333224 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749537 () Bool)

(assert (=> b!749537 (= e!418229 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!749537 e!418237))

(declare-fun res!505756 () Bool)

(assert (=> b!749537 (=> (not res!505756) (not e!418237))))

(assert (=> b!749537 (= res!505756 (= lt!333226 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333227 () Unit!25740)

(assert (=> b!749537 (= lt!333227 e!418238)))

(declare-fun c!82269 () Bool)

(assert (=> b!749537 (= c!82269 (= lt!333226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749538 () Bool)

(declare-fun res!505753 () Bool)

(assert (=> b!749538 (=> (not res!505753) (not e!418232))))

(declare-datatypes ((List!13992 0))(
  ( (Nil!13989) (Cons!13988 (h!15060 (_ BitVec 64)) (t!20307 List!13992)) )
))
(declare-fun arrayNoDuplicates!0 (array!41753 (_ BitVec 32) List!13992) Bool)

(assert (=> b!749538 (= res!505753 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13989))))

(assert (= (and start!65580 res!505755) b!749522))

(assert (= (and b!749522 res!505746) b!749529))

(assert (= (and b!749529 res!505750) b!749531))

(assert (= (and b!749531 res!505743) b!749527))

(assert (= (and b!749527 res!505745) b!749536))

(assert (= (and b!749536 res!505754) b!749534))

(assert (= (and b!749534 res!505742) b!749538))

(assert (= (and b!749538 res!505753) b!749517))

(assert (= (and b!749517 res!505741) b!749521))

(assert (= (and b!749521 res!505757) b!749528))

(assert (= (and b!749528 res!505749) b!749520))

(assert (= (and b!749520 c!82270) b!749524))

(assert (= (and b!749520 (not c!82270)) b!749530))

(assert (= (and b!749520 res!505752) b!749525))

(assert (= (and b!749525 res!505751) b!749518))

(assert (= (and b!749518 res!505748) b!749519))

(assert (= (and b!749518 (not res!505744)) b!749535))

(assert (= (and b!749535 (not res!505740)) b!749523))

(assert (= (and b!749523 (not res!505747)) b!749537))

(assert (= (and b!749537 c!82269) b!749532))

(assert (= (and b!749537 (not c!82269)) b!749526))

(assert (= (and b!749537 res!505756) b!749533))

(declare-fun m!699107 () Bool)

(assert (=> b!749521 m!699107))

(assert (=> b!749521 m!699107))

(declare-fun m!699109 () Bool)

(assert (=> b!749521 m!699109))

(assert (=> b!749521 m!699109))

(assert (=> b!749521 m!699107))

(declare-fun m!699111 () Bool)

(assert (=> b!749521 m!699111))

(declare-fun m!699113 () Bool)

(assert (=> b!749527 m!699113))

(assert (=> b!749530 m!699107))

(assert (=> b!749530 m!699107))

(declare-fun m!699115 () Bool)

(assert (=> b!749530 m!699115))

(declare-fun m!699117 () Bool)

(assert (=> b!749533 m!699117))

(declare-fun m!699119 () Bool)

(assert (=> b!749533 m!699119))

(assert (=> b!749518 m!699107))

(assert (=> b!749518 m!699107))

(declare-fun m!699121 () Bool)

(assert (=> b!749518 m!699121))

(declare-fun m!699123 () Bool)

(assert (=> b!749518 m!699123))

(declare-fun m!699125 () Bool)

(assert (=> b!749518 m!699125))

(declare-fun m!699127 () Bool)

(assert (=> b!749534 m!699127))

(declare-fun m!699129 () Bool)

(assert (=> b!749528 m!699129))

(declare-fun m!699131 () Bool)

(assert (=> b!749538 m!699131))

(declare-fun m!699133 () Bool)

(assert (=> start!65580 m!699133))

(declare-fun m!699135 () Bool)

(assert (=> start!65580 m!699135))

(assert (=> b!749519 m!699107))

(assert (=> b!749519 m!699107))

(declare-fun m!699137 () Bool)

(assert (=> b!749519 m!699137))

(assert (=> b!749524 m!699107))

(assert (=> b!749524 m!699107))

(declare-fun m!699139 () Bool)

(assert (=> b!749524 m!699139))

(assert (=> b!749535 m!699107))

(assert (=> b!749535 m!699107))

(assert (=> b!749535 m!699115))

(declare-fun m!699141 () Bool)

(assert (=> b!749523 m!699141))

(declare-fun m!699143 () Bool)

(assert (=> b!749523 m!699143))

(declare-fun m!699145 () Bool)

(assert (=> b!749525 m!699145))

(assert (=> b!749525 m!699141))

(declare-fun m!699147 () Bool)

(assert (=> b!749525 m!699147))

(declare-fun m!699149 () Bool)

(assert (=> b!749525 m!699149))

(assert (=> b!749525 m!699145))

(declare-fun m!699151 () Bool)

(assert (=> b!749525 m!699151))

(assert (=> b!749529 m!699107))

(assert (=> b!749529 m!699107))

(declare-fun m!699153 () Bool)

(assert (=> b!749529 m!699153))

(declare-fun m!699155 () Bool)

(assert (=> b!749531 m!699155))

(declare-fun m!699157 () Bool)

(assert (=> b!749536 m!699157))

(check-sat (not b!749529) (not b!749531) (not b!749538) (not b!749536) (not b!749527) (not b!749519) (not start!65580) (not b!749521) (not b!749518) (not b!749530) (not b!749525) (not b!749535) (not b!749524) (not b!749534) (not b!749533))
(check-sat)
