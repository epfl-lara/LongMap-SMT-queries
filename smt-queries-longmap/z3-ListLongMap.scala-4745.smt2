; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65510 () Bool)

(assert start!65510)

(declare-fun b!747669 () Bool)

(declare-fun e!417362 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!747669 (= e!417362 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((array!41700 0))(
  ( (array!41701 (arr!19964 (Array (_ BitVec 32) (_ BitVec 64))) (size!20385 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41700)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!747669 (= (select (store (arr!19964 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25604 0))(
  ( (Unit!25605) )
))
(declare-fun lt!332218 () Unit!25604)

(declare-fun e!417364 () Unit!25604)

(assert (=> b!747669 (= lt!332218 e!417364)))

(declare-fun c!82049 () Bool)

(assert (=> b!747669 (= c!82049 (= (select (store (arr!19964 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747670 () Bool)

(declare-fun Unit!25606 () Unit!25604)

(assert (=> b!747670 (= e!417364 Unit!25606)))

(assert (=> b!747670 false))

(declare-fun b!747671 () Bool)

(declare-fun e!417363 () Bool)

(assert (=> b!747671 (= e!417363 (not e!417362))))

(declare-fun res!504335 () Bool)

(assert (=> b!747671 (=> res!504335 e!417362)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7561 0))(
  ( (MissingZero!7561 (index!32612 (_ BitVec 32))) (Found!7561 (index!32613 (_ BitVec 32))) (Intermediate!7561 (undefined!8373 Bool) (index!32614 (_ BitVec 32)) (x!63562 (_ BitVec 32))) (Undefined!7561) (MissingVacant!7561 (index!32615 (_ BitVec 32))) )
))
(declare-fun lt!332217 () SeekEntryResult!7561)

(get-info :version)

(assert (=> b!747671 (= res!504335 (or (not ((_ is Intermediate!7561) lt!332217)) (bvslt x!1131 (x!63562 lt!332217)) (not (= x!1131 (x!63562 lt!332217))) (not (= index!1321 (index!32614 lt!332217)))))))

(declare-fun e!417368 () Bool)

(assert (=> b!747671 e!417368))

(declare-fun res!504334 () Bool)

(assert (=> b!747671 (=> (not res!504334) (not e!417368))))

(declare-fun lt!332223 () SeekEntryResult!7561)

(declare-fun lt!332219 () SeekEntryResult!7561)

(assert (=> b!747671 (= res!504334 (= lt!332223 lt!332219))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747671 (= lt!332219 (Found!7561 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41700 (_ BitVec 32)) SeekEntryResult!7561)

(assert (=> b!747671 (= lt!332223 (seekEntryOrOpen!0 (select (arr!19964 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41700 (_ BitVec 32)) Bool)

(assert (=> b!747671 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332225 () Unit!25604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25604)

(assert (=> b!747671 (= lt!332225 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747672 () Bool)

(declare-fun res!504345 () Bool)

(declare-fun e!417367 () Bool)

(assert (=> b!747672 (=> (not res!504345) (not e!417367))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747672 (= res!504345 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20385 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20385 a!3186))))))

(declare-fun e!417370 () Bool)

(declare-fun b!747673 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41700 (_ BitVec 32)) SeekEntryResult!7561)

(assert (=> b!747673 (= e!417370 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) (Found!7561 j!159)))))

(declare-fun b!747674 () Bool)

(declare-fun res!504339 () Bool)

(declare-fun e!417365 () Bool)

(assert (=> b!747674 (=> (not res!504339) (not e!417365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747674 (= res!504339 (validKeyInArray!0 k0!2102))))

(declare-fun b!747675 () Bool)

(declare-fun res!504346 () Bool)

(declare-fun e!417366 () Bool)

(assert (=> b!747675 (=> (not res!504346) (not e!417366))))

(assert (=> b!747675 (= res!504346 e!417370)))

(declare-fun c!82050 () Bool)

(assert (=> b!747675 (= c!82050 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747676 () Bool)

(declare-fun res!504336 () Bool)

(assert (=> b!747676 (=> res!504336 e!417362)))

(declare-fun lt!332221 () (_ BitVec 64))

(assert (=> b!747676 (= res!504336 (= (select (store (arr!19964 a!3186) i!1173 k0!2102) index!1321) lt!332221))))

(declare-fun b!747678 () Bool)

(declare-fun res!504333 () Bool)

(assert (=> b!747678 (=> (not res!504333) (not e!417365))))

(declare-fun arrayContainsKey!0 (array!41700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747678 (= res!504333 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747679 () Bool)

(declare-fun res!504338 () Bool)

(assert (=> b!747679 (=> (not res!504338) (not e!417367))))

(declare-datatypes ((List!14005 0))(
  ( (Nil!14002) (Cons!14001 (h!15073 (_ BitVec 64)) (t!20311 List!14005)) )
))
(declare-fun arrayNoDuplicates!0 (array!41700 (_ BitVec 32) List!14005) Bool)

(assert (=> b!747679 (= res!504338 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14002))))

(declare-fun b!747680 () Bool)

(assert (=> b!747680 (= e!417367 e!417366)))

(declare-fun res!504341 () Bool)

(assert (=> b!747680 (=> (not res!504341) (not e!417366))))

(declare-fun lt!332222 () SeekEntryResult!7561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41700 (_ BitVec 32)) SeekEntryResult!7561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747680 (= res!504341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19964 a!3186) j!159) mask!3328) (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332222))))

(assert (=> b!747680 (= lt!332222 (Intermediate!7561 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747681 () Bool)

(assert (=> b!747681 (= e!417366 e!417363)))

(declare-fun res!504342 () Bool)

(assert (=> b!747681 (=> (not res!504342) (not e!417363))))

(declare-fun lt!332216 () SeekEntryResult!7561)

(assert (=> b!747681 (= res!504342 (= lt!332216 lt!332217))))

(declare-fun lt!332224 () array!41700)

(assert (=> b!747681 (= lt!332217 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332221 lt!332224 mask!3328))))

(assert (=> b!747681 (= lt!332216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332221 mask!3328) lt!332221 lt!332224 mask!3328))))

(assert (=> b!747681 (= lt!332221 (select (store (arr!19964 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747681 (= lt!332224 (array!41701 (store (arr!19964 a!3186) i!1173 k0!2102) (size!20385 a!3186)))))

(declare-fun b!747682 () Bool)

(declare-fun res!504344 () Bool)

(assert (=> b!747682 (=> (not res!504344) (not e!417366))))

(assert (=> b!747682 (= res!504344 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19964 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747683 () Bool)

(assert (=> b!747683 (= e!417368 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332219))))

(declare-fun b!747684 () Bool)

(assert (=> b!747684 (= e!417370 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332222))))

(declare-fun b!747685 () Bool)

(assert (=> b!747685 (= e!417365 e!417367)))

(declare-fun res!504337 () Bool)

(assert (=> b!747685 (=> (not res!504337) (not e!417367))))

(declare-fun lt!332220 () SeekEntryResult!7561)

(assert (=> b!747685 (= res!504337 (or (= lt!332220 (MissingZero!7561 i!1173)) (= lt!332220 (MissingVacant!7561 i!1173))))))

(assert (=> b!747685 (= lt!332220 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747686 () Bool)

(declare-fun res!504347 () Bool)

(assert (=> b!747686 (=> (not res!504347) (not e!417365))))

(assert (=> b!747686 (= res!504347 (validKeyInArray!0 (select (arr!19964 a!3186) j!159)))))

(declare-fun b!747677 () Bool)

(declare-fun res!504343 () Bool)

(assert (=> b!747677 (=> res!504343 e!417362)))

(assert (=> b!747677 (= res!504343 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332219)))))

(declare-fun res!504332 () Bool)

(assert (=> start!65510 (=> (not res!504332) (not e!417365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65510 (= res!504332 (validMask!0 mask!3328))))

(assert (=> start!65510 e!417365))

(assert (=> start!65510 true))

(declare-fun array_inv!15847 (array!41700) Bool)

(assert (=> start!65510 (array_inv!15847 a!3186)))

(declare-fun b!747687 () Bool)

(declare-fun Unit!25607 () Unit!25604)

(assert (=> b!747687 (= e!417364 Unit!25607)))

(declare-fun b!747688 () Bool)

(declare-fun res!504340 () Bool)

(assert (=> b!747688 (=> (not res!504340) (not e!417365))))

(assert (=> b!747688 (= res!504340 (and (= (size!20385 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20385 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20385 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747689 () Bool)

(declare-fun res!504348 () Bool)

(assert (=> b!747689 (=> (not res!504348) (not e!417367))))

(assert (=> b!747689 (= res!504348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65510 res!504332) b!747688))

(assert (= (and b!747688 res!504340) b!747686))

(assert (= (and b!747686 res!504347) b!747674))

(assert (= (and b!747674 res!504339) b!747678))

(assert (= (and b!747678 res!504333) b!747685))

(assert (= (and b!747685 res!504337) b!747689))

(assert (= (and b!747689 res!504348) b!747679))

(assert (= (and b!747679 res!504338) b!747672))

(assert (= (and b!747672 res!504345) b!747680))

(assert (= (and b!747680 res!504341) b!747682))

(assert (= (and b!747682 res!504344) b!747675))

(assert (= (and b!747675 c!82050) b!747684))

(assert (= (and b!747675 (not c!82050)) b!747673))

(assert (= (and b!747675 res!504346) b!747681))

(assert (= (and b!747681 res!504342) b!747671))

(assert (= (and b!747671 res!504334) b!747683))

(assert (= (and b!747671 (not res!504335)) b!747677))

(assert (= (and b!747677 (not res!504343)) b!747676))

(assert (= (and b!747676 (not res!504336)) b!747669))

(assert (= (and b!747669 c!82049) b!747670))

(assert (= (and b!747669 (not c!82049)) b!747687))

(declare-fun m!697127 () Bool)

(assert (=> b!747681 m!697127))

(declare-fun m!697129 () Bool)

(assert (=> b!747681 m!697129))

(declare-fun m!697131 () Bool)

(assert (=> b!747681 m!697131))

(assert (=> b!747681 m!697131))

(declare-fun m!697133 () Bool)

(assert (=> b!747681 m!697133))

(declare-fun m!697135 () Bool)

(assert (=> b!747681 m!697135))

(declare-fun m!697137 () Bool)

(assert (=> start!65510 m!697137))

(declare-fun m!697139 () Bool)

(assert (=> start!65510 m!697139))

(declare-fun m!697141 () Bool)

(assert (=> b!747678 m!697141))

(assert (=> b!747669 m!697127))

(declare-fun m!697143 () Bool)

(assert (=> b!747669 m!697143))

(declare-fun m!697145 () Bool)

(assert (=> b!747671 m!697145))

(assert (=> b!747671 m!697145))

(declare-fun m!697147 () Bool)

(assert (=> b!747671 m!697147))

(declare-fun m!697149 () Bool)

(assert (=> b!747671 m!697149))

(declare-fun m!697151 () Bool)

(assert (=> b!747671 m!697151))

(declare-fun m!697153 () Bool)

(assert (=> b!747689 m!697153))

(declare-fun m!697155 () Bool)

(assert (=> b!747685 m!697155))

(assert (=> b!747673 m!697145))

(assert (=> b!747673 m!697145))

(declare-fun m!697157 () Bool)

(assert (=> b!747673 m!697157))

(declare-fun m!697159 () Bool)

(assert (=> b!747674 m!697159))

(assert (=> b!747676 m!697127))

(assert (=> b!747676 m!697143))

(assert (=> b!747684 m!697145))

(assert (=> b!747684 m!697145))

(declare-fun m!697161 () Bool)

(assert (=> b!747684 m!697161))

(assert (=> b!747686 m!697145))

(assert (=> b!747686 m!697145))

(declare-fun m!697163 () Bool)

(assert (=> b!747686 m!697163))

(declare-fun m!697165 () Bool)

(assert (=> b!747682 m!697165))

(declare-fun m!697167 () Bool)

(assert (=> b!747679 m!697167))

(assert (=> b!747677 m!697145))

(assert (=> b!747677 m!697145))

(assert (=> b!747677 m!697157))

(assert (=> b!747680 m!697145))

(assert (=> b!747680 m!697145))

(declare-fun m!697169 () Bool)

(assert (=> b!747680 m!697169))

(assert (=> b!747680 m!697169))

(assert (=> b!747680 m!697145))

(declare-fun m!697171 () Bool)

(assert (=> b!747680 m!697171))

(assert (=> b!747683 m!697145))

(assert (=> b!747683 m!697145))

(declare-fun m!697173 () Bool)

(assert (=> b!747683 m!697173))

(check-sat (not b!747689) (not b!747677) (not b!747683) (not b!747671) (not b!747679) (not start!65510) (not b!747686) (not b!747681) (not b!747678) (not b!747680) (not b!747684) (not b!747673) (not b!747685) (not b!747674))
(check-sat)
