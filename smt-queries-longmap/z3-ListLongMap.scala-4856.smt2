; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66884 () Bool)

(assert start!66884)

(declare-fun b!771628 () Bool)

(declare-fun res!521968 () Bool)

(declare-fun e!429569 () Bool)

(assert (=> b!771628 (=> (not res!521968) (not e!429569))))

(declare-datatypes ((array!42396 0))(
  ( (array!42397 (arr!20297 (Array (_ BitVec 32) (_ BitVec 64))) (size!20718 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42396)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!771628 (= res!521968 (and (= (size!20718 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20718 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20718 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771629 () Bool)

(declare-fun e!429564 () Bool)

(declare-fun e!429570 () Bool)

(assert (=> b!771629 (= e!429564 (not e!429570))))

(declare-fun res!521961 () Bool)

(assert (=> b!771629 (=> res!521961 e!429570)))

(declare-datatypes ((SeekEntryResult!7894 0))(
  ( (MissingZero!7894 (index!33944 (_ BitVec 32))) (Found!7894 (index!33945 (_ BitVec 32))) (Intermediate!7894 (undefined!8706 Bool) (index!33946 (_ BitVec 32)) (x!64888 (_ BitVec 32))) (Undefined!7894) (MissingVacant!7894 (index!33947 (_ BitVec 32))) )
))
(declare-fun lt!343380 () SeekEntryResult!7894)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!771629 (= res!521961 (or (not ((_ is Intermediate!7894) lt!343380)) (bvsge x!1131 (x!64888 lt!343380))))))

(declare-fun e!429571 () Bool)

(assert (=> b!771629 e!429571))

(declare-fun res!521970 () Bool)

(assert (=> b!771629 (=> (not res!521970) (not e!429571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42396 (_ BitVec 32)) Bool)

(assert (=> b!771629 (= res!521970 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26570 0))(
  ( (Unit!26571) )
))
(declare-fun lt!343378 () Unit!26570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26570)

(assert (=> b!771629 (= lt!343378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!343385 () SeekEntryResult!7894)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!429566 () Bool)

(declare-fun b!771630 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42396 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!771630 (= e!429566 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343385))))

(declare-fun e!429567 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343381 () SeekEntryResult!7894)

(declare-fun b!771631 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42396 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!771631 (= e!429567 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343381))))

(declare-fun b!771632 () Bool)

(declare-fun res!521965 () Bool)

(declare-fun e!429568 () Bool)

(assert (=> b!771632 (=> (not res!521965) (not e!429568))))

(assert (=> b!771632 (= res!521965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771633 () Bool)

(assert (=> b!771633 (= e!429567 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) (Found!7894 j!159)))))

(declare-fun b!771634 () Bool)

(declare-fun e!429563 () Bool)

(assert (=> b!771634 (= e!429568 e!429563)))

(declare-fun res!521967 () Bool)

(assert (=> b!771634 (=> (not res!521967) (not e!429563))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771634 (= res!521967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343381))))

(assert (=> b!771634 (= lt!343381 (Intermediate!7894 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771635 () Bool)

(declare-fun res!521962 () Bool)

(assert (=> b!771635 (=> (not res!521962) (not e!429563))))

(assert (=> b!771635 (= res!521962 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20297 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771636 () Bool)

(assert (=> b!771636 (= e!429569 e!429568)))

(declare-fun res!521971 () Bool)

(assert (=> b!771636 (=> (not res!521971) (not e!429568))))

(declare-fun lt!343386 () SeekEntryResult!7894)

(assert (=> b!771636 (= res!521971 (or (= lt!343386 (MissingZero!7894 i!1173)) (= lt!343386 (MissingVacant!7894 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42396 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!771636 (= lt!343386 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771637 () Bool)

(declare-fun res!521958 () Bool)

(assert (=> b!771637 (=> (not res!521958) (not e!429568))))

(declare-datatypes ((List!14338 0))(
  ( (Nil!14335) (Cons!14334 (h!15436 (_ BitVec 64)) (t!20644 List!14338)) )
))
(declare-fun arrayNoDuplicates!0 (array!42396 (_ BitVec 32) List!14338) Bool)

(assert (=> b!771637 (= res!521958 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14335))))

(declare-fun b!771638 () Bool)

(declare-fun res!521972 () Bool)

(assert (=> b!771638 (=> (not res!521972) (not e!429569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771638 (= res!521972 (validKeyInArray!0 (select (arr!20297 a!3186) j!159)))))

(declare-fun b!771639 () Bool)

(declare-fun res!521963 () Bool)

(assert (=> b!771639 (=> (not res!521963) (not e!429569))))

(assert (=> b!771639 (= res!521963 (validKeyInArray!0 k0!2102))))

(declare-fun b!771640 () Bool)

(assert (=> b!771640 (= e!429570 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000)))))

(declare-fun lt!343387 () Unit!26570)

(declare-fun e!429565 () Unit!26570)

(assert (=> b!771640 (= lt!343387 e!429565)))

(declare-fun c!85232 () Bool)

(assert (=> b!771640 (= c!85232 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343383 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771640 (= lt!343383 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771641 () Bool)

(declare-fun Unit!26572 () Unit!26570)

(assert (=> b!771641 (= e!429565 Unit!26572)))

(declare-fun lt!343379 () SeekEntryResult!7894)

(assert (=> b!771641 (= lt!343379 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771641 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343383 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) (Found!7894 j!159))))

(declare-fun b!771642 () Bool)

(declare-fun Unit!26573 () Unit!26570)

(assert (=> b!771642 (= e!429565 Unit!26573)))

(assert (=> b!771642 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343383 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343381)))

(declare-fun b!771643 () Bool)

(declare-fun res!521966 () Bool)

(assert (=> b!771643 (=> (not res!521966) (not e!429569))))

(declare-fun arrayContainsKey!0 (array!42396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771643 (= res!521966 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771644 () Bool)

(declare-fun res!521964 () Bool)

(assert (=> b!771644 (=> (not res!521964) (not e!429568))))

(assert (=> b!771644 (= res!521964 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20718 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20718 a!3186))))))

(declare-fun b!771645 () Bool)

(assert (=> b!771645 (= e!429563 e!429564)))

(declare-fun res!521969 () Bool)

(assert (=> b!771645 (=> (not res!521969) (not e!429564))))

(declare-fun lt!343388 () SeekEntryResult!7894)

(assert (=> b!771645 (= res!521969 (= lt!343388 lt!343380))))

(declare-fun lt!343382 () array!42396)

(declare-fun lt!343384 () (_ BitVec 64))

(assert (=> b!771645 (= lt!343380 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343384 lt!343382 mask!3328))))

(assert (=> b!771645 (= lt!343388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343384 mask!3328) lt!343384 lt!343382 mask!3328))))

(assert (=> b!771645 (= lt!343384 (select (store (arr!20297 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771645 (= lt!343382 (array!42397 (store (arr!20297 a!3186) i!1173 k0!2102) (size!20718 a!3186)))))

(declare-fun res!521959 () Bool)

(assert (=> start!66884 (=> (not res!521959) (not e!429569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66884 (= res!521959 (validMask!0 mask!3328))))

(assert (=> start!66884 e!429569))

(assert (=> start!66884 true))

(declare-fun array_inv!16180 (array!42396) Bool)

(assert (=> start!66884 (array_inv!16180 a!3186)))

(declare-fun b!771646 () Bool)

(assert (=> b!771646 (= e!429571 e!429566)))

(declare-fun res!521973 () Bool)

(assert (=> b!771646 (=> (not res!521973) (not e!429566))))

(assert (=> b!771646 (= res!521973 (= (seekEntryOrOpen!0 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343385))))

(assert (=> b!771646 (= lt!343385 (Found!7894 j!159))))

(declare-fun b!771647 () Bool)

(declare-fun res!521960 () Bool)

(assert (=> b!771647 (=> (not res!521960) (not e!429563))))

(assert (=> b!771647 (= res!521960 e!429567)))

(declare-fun c!85233 () Bool)

(assert (=> b!771647 (= c!85233 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66884 res!521959) b!771628))

(assert (= (and b!771628 res!521968) b!771638))

(assert (= (and b!771638 res!521972) b!771639))

(assert (= (and b!771639 res!521963) b!771643))

(assert (= (and b!771643 res!521966) b!771636))

(assert (= (and b!771636 res!521971) b!771632))

(assert (= (and b!771632 res!521965) b!771637))

(assert (= (and b!771637 res!521958) b!771644))

(assert (= (and b!771644 res!521964) b!771634))

(assert (= (and b!771634 res!521967) b!771635))

(assert (= (and b!771635 res!521962) b!771647))

(assert (= (and b!771647 c!85233) b!771631))

(assert (= (and b!771647 (not c!85233)) b!771633))

(assert (= (and b!771647 res!521960) b!771645))

(assert (= (and b!771645 res!521969) b!771629))

(assert (= (and b!771629 res!521970) b!771646))

(assert (= (and b!771646 res!521973) b!771630))

(assert (= (and b!771629 (not res!521961)) b!771640))

(assert (= (and b!771640 c!85232) b!771642))

(assert (= (and b!771640 (not c!85232)) b!771641))

(declare-fun m!716133 () Bool)

(assert (=> b!771641 m!716133))

(assert (=> b!771641 m!716133))

(declare-fun m!716135 () Bool)

(assert (=> b!771641 m!716135))

(assert (=> b!771641 m!716133))

(declare-fun m!716137 () Bool)

(assert (=> b!771641 m!716137))

(assert (=> b!771630 m!716133))

(assert (=> b!771630 m!716133))

(declare-fun m!716139 () Bool)

(assert (=> b!771630 m!716139))

(assert (=> b!771638 m!716133))

(assert (=> b!771638 m!716133))

(declare-fun m!716141 () Bool)

(assert (=> b!771638 m!716141))

(declare-fun m!716143 () Bool)

(assert (=> b!771632 m!716143))

(declare-fun m!716145 () Bool)

(assert (=> b!771635 m!716145))

(declare-fun m!716147 () Bool)

(assert (=> b!771629 m!716147))

(declare-fun m!716149 () Bool)

(assert (=> b!771629 m!716149))

(declare-fun m!716151 () Bool)

(assert (=> start!66884 m!716151))

(declare-fun m!716153 () Bool)

(assert (=> start!66884 m!716153))

(declare-fun m!716155 () Bool)

(assert (=> b!771637 m!716155))

(assert (=> b!771646 m!716133))

(assert (=> b!771646 m!716133))

(declare-fun m!716157 () Bool)

(assert (=> b!771646 m!716157))

(assert (=> b!771631 m!716133))

(assert (=> b!771631 m!716133))

(declare-fun m!716159 () Bool)

(assert (=> b!771631 m!716159))

(assert (=> b!771634 m!716133))

(assert (=> b!771634 m!716133))

(declare-fun m!716161 () Bool)

(assert (=> b!771634 m!716161))

(assert (=> b!771634 m!716161))

(assert (=> b!771634 m!716133))

(declare-fun m!716163 () Bool)

(assert (=> b!771634 m!716163))

(declare-fun m!716165 () Bool)

(assert (=> b!771640 m!716165))

(declare-fun m!716167 () Bool)

(assert (=> b!771645 m!716167))

(declare-fun m!716169 () Bool)

(assert (=> b!771645 m!716169))

(declare-fun m!716171 () Bool)

(assert (=> b!771645 m!716171))

(declare-fun m!716173 () Bool)

(assert (=> b!771645 m!716173))

(assert (=> b!771645 m!716167))

(declare-fun m!716175 () Bool)

(assert (=> b!771645 m!716175))

(declare-fun m!716177 () Bool)

(assert (=> b!771636 m!716177))

(assert (=> b!771642 m!716133))

(assert (=> b!771642 m!716133))

(declare-fun m!716179 () Bool)

(assert (=> b!771642 m!716179))

(assert (=> b!771633 m!716133))

(assert (=> b!771633 m!716133))

(assert (=> b!771633 m!716135))

(declare-fun m!716181 () Bool)

(assert (=> b!771639 m!716181))

(declare-fun m!716183 () Bool)

(assert (=> b!771643 m!716183))

(check-sat (not b!771637) (not b!771646) (not b!771633) (not b!771642) (not b!771631) (not b!771643) (not b!771632) (not b!771640) (not b!771638) (not start!66884) (not b!771630) (not b!771629) (not b!771645) (not b!771641) (not b!771636) (not b!771639) (not b!771634))
(check-sat)
