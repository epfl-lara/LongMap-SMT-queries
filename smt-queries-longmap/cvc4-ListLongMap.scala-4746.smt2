; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65540 () Bool)

(assert start!65540)

(declare-fun b!748234 () Bool)

(declare-datatypes ((Unit!25660 0))(
  ( (Unit!25661) )
))
(declare-fun e!417656 () Unit!25660)

(declare-fun Unit!25662 () Unit!25660)

(assert (=> b!748234 (= e!417656 Unit!25662)))

(declare-datatypes ((array!41713 0))(
  ( (array!41714 (arr!19970 (Array (_ BitVec 32) (_ BitVec 64))) (size!20391 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41713)

(declare-fun b!748235 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7570 0))(
  ( (MissingZero!7570 (index!32648 (_ BitVec 32))) (Found!7570 (index!32649 (_ BitVec 32))) (Intermediate!7570 (undefined!8382 Bool) (index!32650 (_ BitVec 32)) (x!63584 (_ BitVec 32))) (Undefined!7570) (MissingVacant!7570 (index!32651 (_ BitVec 32))) )
))
(declare-fun lt!332608 () SeekEntryResult!7570)

(declare-fun e!417659 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41713 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!748235 (= e!417659 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332608))))

(declare-fun b!748236 () Bool)

(declare-fun e!417658 () Bool)

(declare-fun e!417657 () Bool)

(assert (=> b!748236 (= e!417658 e!417657)))

(declare-fun res!504703 () Bool)

(assert (=> b!748236 (=> (not res!504703) (not e!417657))))

(declare-fun lt!332611 () SeekEntryResult!7570)

(declare-fun lt!332609 () SeekEntryResult!7570)

(assert (=> b!748236 (= res!504703 (= lt!332611 lt!332609))))

(declare-fun lt!332606 () array!41713)

(declare-fun lt!332607 () (_ BitVec 64))

(assert (=> b!748236 (= lt!332609 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332607 lt!332606 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748236 (= lt!332611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332607 mask!3328) lt!332607 lt!332606 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!748236 (= lt!332607 (select (store (arr!19970 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748236 (= lt!332606 (array!41714 (store (arr!19970 a!3186) i!1173 k!2102) (size!20391 a!3186)))))

(declare-fun b!748237 () Bool)

(declare-fun res!504698 () Bool)

(declare-fun e!417652 () Bool)

(assert (=> b!748237 (=> (not res!504698) (not e!417652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41713 (_ BitVec 32)) Bool)

(assert (=> b!748237 (= res!504698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748238 () Bool)

(declare-fun res!504706 () Bool)

(declare-fun e!417653 () Bool)

(assert (=> b!748238 (=> (not res!504706) (not e!417653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748238 (= res!504706 (validKeyInArray!0 k!2102))))

(declare-fun b!748239 () Bool)

(declare-fun res!504701 () Bool)

(assert (=> b!748239 (=> (not res!504701) (not e!417653))))

(assert (=> b!748239 (= res!504701 (validKeyInArray!0 (select (arr!19970 a!3186) j!159)))))

(declare-fun b!748240 () Bool)

(assert (=> b!748240 (= e!417652 e!417658)))

(declare-fun res!504710 () Bool)

(assert (=> b!748240 (=> (not res!504710) (not e!417658))))

(assert (=> b!748240 (= res!504710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19970 a!3186) j!159) mask!3328) (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332608))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748240 (= lt!332608 (Intermediate!7570 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748241 () Bool)

(declare-fun res!504707 () Bool)

(assert (=> b!748241 (=> (not res!504707) (not e!417658))))

(assert (=> b!748241 (= res!504707 e!417659)))

(declare-fun c!82150 () Bool)

(assert (=> b!748241 (= c!82150 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748242 () Bool)

(declare-fun res!504699 () Bool)

(assert (=> b!748242 (=> (not res!504699) (not e!417658))))

(assert (=> b!748242 (= res!504699 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19970 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748243 () Bool)

(declare-fun e!417655 () Bool)

(assert (=> b!748243 (= e!417655 true)))

(assert (=> b!748243 (= (select (store (arr!19970 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332610 () Unit!25660)

(assert (=> b!748243 (= lt!332610 e!417656)))

(declare-fun c!82149 () Bool)

(assert (=> b!748243 (= c!82149 (= (select (store (arr!19970 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!504704 () Bool)

(assert (=> start!65540 (=> (not res!504704) (not e!417653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65540 (= res!504704 (validMask!0 mask!3328))))

(assert (=> start!65540 e!417653))

(assert (=> start!65540 true))

(declare-fun array_inv!15766 (array!41713) Bool)

(assert (=> start!65540 (array_inv!15766 a!3186)))

(declare-fun b!748244 () Bool)

(declare-fun res!504712 () Bool)

(assert (=> b!748244 (=> (not res!504712) (not e!417652))))

(assert (=> b!748244 (= res!504712 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20391 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20391 a!3186))))))

(declare-fun b!748245 () Bool)

(declare-fun res!504697 () Bool)

(assert (=> b!748245 (=> res!504697 e!417655)))

(assert (=> b!748245 (= res!504697 (= (select (store (arr!19970 a!3186) i!1173 k!2102) index!1321) lt!332607))))

(declare-fun b!748246 () Bool)

(declare-fun res!504711 () Bool)

(assert (=> b!748246 (=> res!504711 e!417655)))

(declare-fun lt!332613 () SeekEntryResult!7570)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41713 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!748246 (= res!504711 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332613)))))

(declare-fun b!748247 () Bool)

(assert (=> b!748247 (= e!417653 e!417652)))

(declare-fun res!504709 () Bool)

(assert (=> b!748247 (=> (not res!504709) (not e!417652))))

(declare-fun lt!332612 () SeekEntryResult!7570)

(assert (=> b!748247 (= res!504709 (or (= lt!332612 (MissingZero!7570 i!1173)) (= lt!332612 (MissingVacant!7570 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41713 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!748247 (= lt!332612 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748248 () Bool)

(declare-fun Unit!25663 () Unit!25660)

(assert (=> b!748248 (= e!417656 Unit!25663)))

(assert (=> b!748248 false))

(declare-fun b!748249 () Bool)

(declare-fun res!504708 () Bool)

(assert (=> b!748249 (=> (not res!504708) (not e!417652))))

(declare-datatypes ((List!13972 0))(
  ( (Nil!13969) (Cons!13968 (h!15040 (_ BitVec 64)) (t!20287 List!13972)) )
))
(declare-fun arrayNoDuplicates!0 (array!41713 (_ BitVec 32) List!13972) Bool)

(assert (=> b!748249 (= res!504708 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13969))))

(declare-fun b!748250 () Bool)

(assert (=> b!748250 (= e!417657 (not e!417655))))

(declare-fun res!504713 () Bool)

(assert (=> b!748250 (=> res!504713 e!417655)))

(assert (=> b!748250 (= res!504713 (or (not (is-Intermediate!7570 lt!332609)) (bvslt x!1131 (x!63584 lt!332609)) (not (= x!1131 (x!63584 lt!332609))) (not (= index!1321 (index!32650 lt!332609)))))))

(declare-fun e!417651 () Bool)

(assert (=> b!748250 e!417651))

(declare-fun res!504700 () Bool)

(assert (=> b!748250 (=> (not res!504700) (not e!417651))))

(declare-fun lt!332615 () SeekEntryResult!7570)

(assert (=> b!748250 (= res!504700 (= lt!332615 lt!332613))))

(assert (=> b!748250 (= lt!332613 (Found!7570 j!159))))

(assert (=> b!748250 (= lt!332615 (seekEntryOrOpen!0 (select (arr!19970 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748250 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332614 () Unit!25660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25660)

(assert (=> b!748250 (= lt!332614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748251 () Bool)

(assert (=> b!748251 (= e!417651 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) lt!332613))))

(declare-fun b!748252 () Bool)

(declare-fun res!504702 () Bool)

(assert (=> b!748252 (=> (not res!504702) (not e!417653))))

(assert (=> b!748252 (= res!504702 (and (= (size!20391 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20391 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20391 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748253 () Bool)

(assert (=> b!748253 (= e!417659 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19970 a!3186) j!159) a!3186 mask!3328) (Found!7570 j!159)))))

(declare-fun b!748254 () Bool)

(declare-fun res!504705 () Bool)

(assert (=> b!748254 (=> (not res!504705) (not e!417653))))

(declare-fun arrayContainsKey!0 (array!41713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748254 (= res!504705 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65540 res!504704) b!748252))

(assert (= (and b!748252 res!504702) b!748239))

(assert (= (and b!748239 res!504701) b!748238))

(assert (= (and b!748238 res!504706) b!748254))

(assert (= (and b!748254 res!504705) b!748247))

(assert (= (and b!748247 res!504709) b!748237))

(assert (= (and b!748237 res!504698) b!748249))

(assert (= (and b!748249 res!504708) b!748244))

(assert (= (and b!748244 res!504712) b!748240))

(assert (= (and b!748240 res!504710) b!748242))

(assert (= (and b!748242 res!504699) b!748241))

(assert (= (and b!748241 c!82150) b!748235))

(assert (= (and b!748241 (not c!82150)) b!748253))

(assert (= (and b!748241 res!504707) b!748236))

(assert (= (and b!748236 res!504703) b!748250))

(assert (= (and b!748250 res!504700) b!748251))

(assert (= (and b!748250 (not res!504713)) b!748246))

(assert (= (and b!748246 (not res!504711)) b!748245))

(assert (= (and b!748245 (not res!504697)) b!748243))

(assert (= (and b!748243 c!82149) b!748248))

(assert (= (and b!748243 (not c!82149)) b!748234))

(declare-fun m!698125 () Bool)

(assert (=> b!748247 m!698125))

(declare-fun m!698127 () Bool)

(assert (=> b!748239 m!698127))

(assert (=> b!748239 m!698127))

(declare-fun m!698129 () Bool)

(assert (=> b!748239 m!698129))

(assert (=> b!748253 m!698127))

(assert (=> b!748253 m!698127))

(declare-fun m!698131 () Bool)

(assert (=> b!748253 m!698131))

(assert (=> b!748250 m!698127))

(assert (=> b!748250 m!698127))

(declare-fun m!698133 () Bool)

(assert (=> b!748250 m!698133))

(declare-fun m!698135 () Bool)

(assert (=> b!748250 m!698135))

(declare-fun m!698137 () Bool)

(assert (=> b!748250 m!698137))

(assert (=> b!748251 m!698127))

(assert (=> b!748251 m!698127))

(declare-fun m!698139 () Bool)

(assert (=> b!748251 m!698139))

(assert (=> b!748235 m!698127))

(assert (=> b!748235 m!698127))

(declare-fun m!698141 () Bool)

(assert (=> b!748235 m!698141))

(declare-fun m!698143 () Bool)

(assert (=> start!65540 m!698143))

(declare-fun m!698145 () Bool)

(assert (=> start!65540 m!698145))

(declare-fun m!698147 () Bool)

(assert (=> b!748245 m!698147))

(declare-fun m!698149 () Bool)

(assert (=> b!748245 m!698149))

(declare-fun m!698151 () Bool)

(assert (=> b!748238 m!698151))

(declare-fun m!698153 () Bool)

(assert (=> b!748242 m!698153))

(declare-fun m!698155 () Bool)

(assert (=> b!748254 m!698155))

(assert (=> b!748243 m!698147))

(assert (=> b!748243 m!698149))

(assert (=> b!748240 m!698127))

(assert (=> b!748240 m!698127))

(declare-fun m!698157 () Bool)

(assert (=> b!748240 m!698157))

(assert (=> b!748240 m!698157))

(assert (=> b!748240 m!698127))

(declare-fun m!698159 () Bool)

(assert (=> b!748240 m!698159))

(declare-fun m!698161 () Bool)

(assert (=> b!748236 m!698161))

(declare-fun m!698163 () Bool)

(assert (=> b!748236 m!698163))

(assert (=> b!748236 m!698163))

(declare-fun m!698165 () Bool)

(assert (=> b!748236 m!698165))

(assert (=> b!748236 m!698147))

(declare-fun m!698167 () Bool)

(assert (=> b!748236 m!698167))

(declare-fun m!698169 () Bool)

(assert (=> b!748249 m!698169))

(assert (=> b!748246 m!698127))

(assert (=> b!748246 m!698127))

(assert (=> b!748246 m!698131))

(declare-fun m!698171 () Bool)

(assert (=> b!748237 m!698171))

(push 1)

