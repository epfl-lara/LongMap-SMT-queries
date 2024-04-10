; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65706 () Bool)

(assert start!65706)

(declare-fun b!753770 () Bool)

(declare-fun res!509255 () Bool)

(declare-fun e!420404 () Bool)

(assert (=> b!753770 (=> (not res!509255) (not e!420404))))

(declare-datatypes ((array!41879 0))(
  ( (array!41880 (arr!20053 (Array (_ BitVec 32) (_ BitVec 64))) (size!20474 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41879)

(declare-datatypes ((List!14055 0))(
  ( (Nil!14052) (Cons!14051 (h!15123 (_ BitVec 64)) (t!20370 List!14055)) )
))
(declare-fun arrayNoDuplicates!0 (array!41879 (_ BitVec 32) List!14055) Bool)

(assert (=> b!753770 (= res!509255 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14052))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7653 0))(
  ( (MissingZero!7653 (index!32980 (_ BitVec 32))) (Found!7653 (index!32981 (_ BitVec 32))) (Intermediate!7653 (undefined!8465 Bool) (index!32982 (_ BitVec 32)) (x!63891 (_ BitVec 32))) (Undefined!7653) (MissingVacant!7653 (index!32983 (_ BitVec 32))) )
))
(declare-fun lt!335402 () SeekEntryResult!7653)

(declare-fun b!753771 () Bool)

(declare-fun e!420407 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41879 (_ BitVec 32)) SeekEntryResult!7653)

(assert (=> b!753771 (= e!420407 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20053 a!3186) j!159) a!3186 mask!3328) lt!335402))))

(declare-fun b!753772 () Bool)

(declare-fun e!420405 () Bool)

(declare-fun e!420403 () Bool)

(assert (=> b!753772 (= e!420405 (not e!420403))))

(declare-fun res!509250 () Bool)

(assert (=> b!753772 (=> res!509250 e!420403)))

(declare-fun lt!335404 () SeekEntryResult!7653)

(get-info :version)

(assert (=> b!753772 (= res!509250 (or (not ((_ is Intermediate!7653) lt!335404)) (bvslt x!1131 (x!63891 lt!335404)) (not (= x!1131 (x!63891 lt!335404))) (not (= index!1321 (index!32982 lt!335404)))))))

(declare-fun e!420406 () Bool)

(assert (=> b!753772 e!420406))

(declare-fun res!509245 () Bool)

(assert (=> b!753772 (=> (not res!509245) (not e!420406))))

(declare-fun lt!335405 () SeekEntryResult!7653)

(declare-fun lt!335401 () SeekEntryResult!7653)

(assert (=> b!753772 (= res!509245 (= lt!335405 lt!335401))))

(assert (=> b!753772 (= lt!335401 (Found!7653 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41879 (_ BitVec 32)) SeekEntryResult!7653)

(assert (=> b!753772 (= lt!335405 (seekEntryOrOpen!0 (select (arr!20053 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41879 (_ BitVec 32)) Bool)

(assert (=> b!753772 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25992 0))(
  ( (Unit!25993) )
))
(declare-fun lt!335395 () Unit!25992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25992)

(assert (=> b!753772 (= lt!335395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753773 () Bool)

(declare-fun res!509252 () Bool)

(declare-fun e!420402 () Bool)

(assert (=> b!753773 (=> (not res!509252) (not e!420402))))

(declare-fun lt!335398 () (_ BitVec 64))

(declare-fun lt!335397 () array!41879)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41879 (_ BitVec 32)) SeekEntryResult!7653)

(assert (=> b!753773 (= res!509252 (= (seekEntryOrOpen!0 lt!335398 lt!335397 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335398 lt!335397 mask!3328)))))

(declare-fun res!509248 () Bool)

(declare-fun e!420413 () Bool)

(assert (=> start!65706 (=> (not res!509248) (not e!420413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65706 (= res!509248 (validMask!0 mask!3328))))

(assert (=> start!65706 e!420413))

(assert (=> start!65706 true))

(declare-fun array_inv!15849 (array!41879) Bool)

(assert (=> start!65706 (array_inv!15849 a!3186)))

(declare-fun b!753774 () Bool)

(declare-fun e!420412 () Bool)

(assert (=> b!753774 (= e!420404 e!420412)))

(declare-fun res!509238 () Bool)

(assert (=> b!753774 (=> (not res!509238) (not e!420412))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753774 (= res!509238 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20053 a!3186) j!159) mask!3328) (select (arr!20053 a!3186) j!159) a!3186 mask!3328) lt!335402))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753774 (= lt!335402 (Intermediate!7653 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753775 () Bool)

(declare-fun e!420411 () Unit!25992)

(declare-fun Unit!25994 () Unit!25992)

(assert (=> b!753775 (= e!420411 Unit!25994)))

(assert (=> b!753775 false))

(declare-fun b!753776 () Bool)

(declare-fun e!420409 () Bool)

(assert (=> b!753776 (= e!420403 e!420409)))

(declare-fun res!509254 () Bool)

(assert (=> b!753776 (=> res!509254 e!420409)))

(declare-fun lt!335403 () SeekEntryResult!7653)

(assert (=> b!753776 (= res!509254 (not (= lt!335403 lt!335401)))))

(assert (=> b!753776 (= lt!335403 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20053 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753777 () Bool)

(assert (=> b!753777 (= e!420413 e!420404)))

(declare-fun res!509247 () Bool)

(assert (=> b!753777 (=> (not res!509247) (not e!420404))))

(declare-fun lt!335400 () SeekEntryResult!7653)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753777 (= res!509247 (or (= lt!335400 (MissingZero!7653 i!1173)) (= lt!335400 (MissingVacant!7653 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!753777 (= lt!335400 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753778 () Bool)

(assert (=> b!753778 (= e!420402 (= lt!335405 lt!335403))))

(declare-fun b!753779 () Bool)

(declare-fun e!420410 () Bool)

(assert (=> b!753779 (= e!420410 true)))

(assert (=> b!753779 e!420402))

(declare-fun res!509237 () Bool)

(assert (=> b!753779 (=> (not res!509237) (not e!420402))))

(declare-fun lt!335396 () (_ BitVec 64))

(assert (=> b!753779 (= res!509237 (= lt!335396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335399 () Unit!25992)

(assert (=> b!753779 (= lt!335399 e!420411)))

(declare-fun c!82648 () Bool)

(assert (=> b!753779 (= c!82648 (= lt!335396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753780 () Bool)

(declare-fun res!509243 () Bool)

(assert (=> b!753780 (=> (not res!509243) (not e!420412))))

(assert (=> b!753780 (= res!509243 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20053 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753781 () Bool)

(declare-fun res!509249 () Bool)

(assert (=> b!753781 (=> (not res!509249) (not e!420413))))

(declare-fun arrayContainsKey!0 (array!41879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753781 (= res!509249 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753782 () Bool)

(declare-fun res!509239 () Bool)

(assert (=> b!753782 (=> (not res!509239) (not e!420412))))

(assert (=> b!753782 (= res!509239 e!420407)))

(declare-fun c!82647 () Bool)

(assert (=> b!753782 (= c!82647 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753783 () Bool)

(assert (=> b!753783 (= e!420412 e!420405)))

(declare-fun res!509242 () Bool)

(assert (=> b!753783 (=> (not res!509242) (not e!420405))))

(declare-fun lt!335394 () SeekEntryResult!7653)

(assert (=> b!753783 (= res!509242 (= lt!335394 lt!335404))))

(assert (=> b!753783 (= lt!335404 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335398 lt!335397 mask!3328))))

(assert (=> b!753783 (= lt!335394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335398 mask!3328) lt!335398 lt!335397 mask!3328))))

(assert (=> b!753783 (= lt!335398 (select (store (arr!20053 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753783 (= lt!335397 (array!41880 (store (arr!20053 a!3186) i!1173 k0!2102) (size!20474 a!3186)))))

(declare-fun b!753784 () Bool)

(declare-fun res!509251 () Bool)

(assert (=> b!753784 (=> (not res!509251) (not e!420413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753784 (= res!509251 (validKeyInArray!0 (select (arr!20053 a!3186) j!159)))))

(declare-fun b!753785 () Bool)

(assert (=> b!753785 (= e!420406 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20053 a!3186) j!159) a!3186 mask!3328) lt!335401))))

(declare-fun b!753786 () Bool)

(declare-fun res!509246 () Bool)

(assert (=> b!753786 (=> (not res!509246) (not e!420413))))

(assert (=> b!753786 (= res!509246 (validKeyInArray!0 k0!2102))))

(declare-fun b!753787 () Bool)

(assert (=> b!753787 (= e!420409 e!420410)))

(declare-fun res!509244 () Bool)

(assert (=> b!753787 (=> res!509244 e!420410)))

(assert (=> b!753787 (= res!509244 (= lt!335396 lt!335398))))

(assert (=> b!753787 (= lt!335396 (select (store (arr!20053 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753788 () Bool)

(assert (=> b!753788 (= e!420407 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20053 a!3186) j!159) a!3186 mask!3328) (Found!7653 j!159)))))

(declare-fun b!753789 () Bool)

(declare-fun Unit!25995 () Unit!25992)

(assert (=> b!753789 (= e!420411 Unit!25995)))

(declare-fun b!753790 () Bool)

(declare-fun res!509253 () Bool)

(assert (=> b!753790 (=> (not res!509253) (not e!420413))))

(assert (=> b!753790 (= res!509253 (and (= (size!20474 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20474 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20474 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753791 () Bool)

(declare-fun res!509240 () Bool)

(assert (=> b!753791 (=> (not res!509240) (not e!420404))))

(assert (=> b!753791 (= res!509240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753792 () Bool)

(declare-fun res!509241 () Bool)

(assert (=> b!753792 (=> (not res!509241) (not e!420404))))

(assert (=> b!753792 (= res!509241 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20474 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20474 a!3186))))))

(assert (= (and start!65706 res!509248) b!753790))

(assert (= (and b!753790 res!509253) b!753784))

(assert (= (and b!753784 res!509251) b!753786))

(assert (= (and b!753786 res!509246) b!753781))

(assert (= (and b!753781 res!509249) b!753777))

(assert (= (and b!753777 res!509247) b!753791))

(assert (= (and b!753791 res!509240) b!753770))

(assert (= (and b!753770 res!509255) b!753792))

(assert (= (and b!753792 res!509241) b!753774))

(assert (= (and b!753774 res!509238) b!753780))

(assert (= (and b!753780 res!509243) b!753782))

(assert (= (and b!753782 c!82647) b!753771))

(assert (= (and b!753782 (not c!82647)) b!753788))

(assert (= (and b!753782 res!509239) b!753783))

(assert (= (and b!753783 res!509242) b!753772))

(assert (= (and b!753772 res!509245) b!753785))

(assert (= (and b!753772 (not res!509250)) b!753776))

(assert (= (and b!753776 (not res!509254)) b!753787))

(assert (= (and b!753787 (not res!509244)) b!753779))

(assert (= (and b!753779 c!82648) b!753775))

(assert (= (and b!753779 (not c!82648)) b!753789))

(assert (= (and b!753779 res!509237) b!753773))

(assert (= (and b!753773 res!509252) b!753778))

(declare-fun m!702383 () Bool)

(assert (=> b!753783 m!702383))

(declare-fun m!702385 () Bool)

(assert (=> b!753783 m!702385))

(declare-fun m!702387 () Bool)

(assert (=> b!753783 m!702387))

(declare-fun m!702389 () Bool)

(assert (=> b!753783 m!702389))

(declare-fun m!702391 () Bool)

(assert (=> b!753783 m!702391))

(assert (=> b!753783 m!702383))

(declare-fun m!702393 () Bool)

(assert (=> b!753785 m!702393))

(assert (=> b!753785 m!702393))

(declare-fun m!702395 () Bool)

(assert (=> b!753785 m!702395))

(declare-fun m!702397 () Bool)

(assert (=> b!753780 m!702397))

(declare-fun m!702399 () Bool)

(assert (=> b!753791 m!702399))

(declare-fun m!702401 () Bool)

(assert (=> b!753770 m!702401))

(assert (=> b!753787 m!702389))

(declare-fun m!702403 () Bool)

(assert (=> b!753787 m!702403))

(declare-fun m!702405 () Bool)

(assert (=> b!753777 m!702405))

(assert (=> b!753784 m!702393))

(assert (=> b!753784 m!702393))

(declare-fun m!702407 () Bool)

(assert (=> b!753784 m!702407))

(assert (=> b!753771 m!702393))

(assert (=> b!753771 m!702393))

(declare-fun m!702409 () Bool)

(assert (=> b!753771 m!702409))

(assert (=> b!753776 m!702393))

(assert (=> b!753776 m!702393))

(declare-fun m!702411 () Bool)

(assert (=> b!753776 m!702411))

(assert (=> b!753788 m!702393))

(assert (=> b!753788 m!702393))

(assert (=> b!753788 m!702411))

(declare-fun m!702413 () Bool)

(assert (=> b!753773 m!702413))

(declare-fun m!702415 () Bool)

(assert (=> b!753773 m!702415))

(assert (=> b!753774 m!702393))

(assert (=> b!753774 m!702393))

(declare-fun m!702417 () Bool)

(assert (=> b!753774 m!702417))

(assert (=> b!753774 m!702417))

(assert (=> b!753774 m!702393))

(declare-fun m!702419 () Bool)

(assert (=> b!753774 m!702419))

(assert (=> b!753772 m!702393))

(assert (=> b!753772 m!702393))

(declare-fun m!702421 () Bool)

(assert (=> b!753772 m!702421))

(declare-fun m!702423 () Bool)

(assert (=> b!753772 m!702423))

(declare-fun m!702425 () Bool)

(assert (=> b!753772 m!702425))

(declare-fun m!702427 () Bool)

(assert (=> b!753786 m!702427))

(declare-fun m!702429 () Bool)

(assert (=> b!753781 m!702429))

(declare-fun m!702431 () Bool)

(assert (=> start!65706 m!702431))

(declare-fun m!702433 () Bool)

(assert (=> start!65706 m!702433))

(check-sat (not b!753771) (not b!753783) (not b!753770) (not b!753772) (not b!753773) (not b!753781) (not b!753776) (not b!753784) (not b!753774) (not start!65706) (not b!753786) (not b!753788) (not b!753785) (not b!753777) (not b!753791))
(check-sat)
