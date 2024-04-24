; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66940 () Bool)

(assert start!66940)

(declare-fun b!771701 () Bool)

(declare-datatypes ((Unit!26563 0))(
  ( (Unit!26564) )
))
(declare-fun e!429678 () Unit!26563)

(declare-fun Unit!26565 () Unit!26563)

(assert (=> b!771701 (= e!429678 Unit!26565)))

(declare-datatypes ((array!42382 0))(
  ( (array!42383 (arr!20287 (Array (_ BitVec 32) (_ BitVec 64))) (size!20707 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42382)

(declare-datatypes ((SeekEntryResult!7843 0))(
  ( (MissingZero!7843 (index!33740 (_ BitVec 32))) (Found!7843 (index!33741 (_ BitVec 32))) (Intermediate!7843 (undefined!8655 Bool) (index!33742 (_ BitVec 32)) (x!64825 (_ BitVec 32))) (Undefined!7843) (MissingVacant!7843 (index!33743 (_ BitVec 32))) )
))
(declare-fun lt!343508 () SeekEntryResult!7843)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!343507 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42382 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!771701 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343507 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343508)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!429679 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!343511 () SeekEntryResult!7843)

(declare-fun b!771702 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42382 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!771702 (= e!429679 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343511))))

(declare-fun b!771703 () Bool)

(declare-fun res!521922 () Bool)

(declare-fun e!429677 () Bool)

(assert (=> b!771703 (=> (not res!521922) (not e!429677))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771703 (= res!521922 (validKeyInArray!0 k0!2102))))

(declare-fun e!429684 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!771704 () Bool)

(assert (=> b!771704 (= e!429684 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) (Found!7843 j!159)))))

(declare-fun b!771705 () Bool)

(declare-fun e!429685 () Bool)

(assert (=> b!771705 (= e!429677 e!429685)))

(declare-fun res!521930 () Bool)

(assert (=> b!771705 (=> (not res!521930) (not e!429685))))

(declare-fun lt!343513 () SeekEntryResult!7843)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771705 (= res!521930 (or (= lt!343513 (MissingZero!7843 i!1173)) (= lt!343513 (MissingVacant!7843 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42382 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!771705 (= lt!343513 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771706 () Bool)

(declare-fun Unit!26566 () Unit!26563)

(assert (=> b!771706 (= e!429678 Unit!26566)))

(declare-fun lt!343516 () SeekEntryResult!7843)

(assert (=> b!771706 (= lt!343516 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771706 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343507 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) (Found!7843 j!159))))

(declare-fun res!521926 () Bool)

(assert (=> start!66940 (=> (not res!521926) (not e!429677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66940 (= res!521926 (validMask!0 mask!3328))))

(assert (=> start!66940 e!429677))

(assert (=> start!66940 true))

(declare-fun array_inv!16146 (array!42382) Bool)

(assert (=> start!66940 (array_inv!16146 a!3186)))

(declare-fun b!771707 () Bool)

(declare-fun res!521920 () Bool)

(assert (=> b!771707 (=> (not res!521920) (not e!429677))))

(assert (=> b!771707 (= res!521920 (validKeyInArray!0 (select (arr!20287 a!3186) j!159)))))

(declare-fun b!771708 () Bool)

(declare-fun e!429680 () Bool)

(declare-fun e!429683 () Bool)

(assert (=> b!771708 (= e!429680 (not e!429683))))

(declare-fun res!521917 () Bool)

(assert (=> b!771708 (=> res!521917 e!429683)))

(declare-fun lt!343506 () SeekEntryResult!7843)

(get-info :version)

(assert (=> b!771708 (= res!521917 (or (not ((_ is Intermediate!7843) lt!343506)) (bvsge x!1131 (x!64825 lt!343506))))))

(declare-fun e!429682 () Bool)

(assert (=> b!771708 e!429682))

(declare-fun res!521918 () Bool)

(assert (=> b!771708 (=> (not res!521918) (not e!429682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42382 (_ BitVec 32)) Bool)

(assert (=> b!771708 (= res!521918 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343514 () Unit!26563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26563)

(assert (=> b!771708 (= lt!343514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771709 () Bool)

(declare-fun res!521923 () Bool)

(assert (=> b!771709 (=> (not res!521923) (not e!429685))))

(declare-datatypes ((List!14196 0))(
  ( (Nil!14193) (Cons!14192 (h!15297 (_ BitVec 64)) (t!20503 List!14196)) )
))
(declare-fun arrayNoDuplicates!0 (array!42382 (_ BitVec 32) List!14196) Bool)

(assert (=> b!771709 (= res!521923 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14193))))

(declare-fun b!771710 () Bool)

(declare-fun res!521925 () Bool)

(assert (=> b!771710 (=> (not res!521925) (not e!429677))))

(assert (=> b!771710 (= res!521925 (and (= (size!20707 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20707 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20707 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771711 () Bool)

(declare-fun res!521928 () Bool)

(declare-fun e!429681 () Bool)

(assert (=> b!771711 (=> (not res!521928) (not e!429681))))

(assert (=> b!771711 (= res!521928 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20287 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771712 () Bool)

(assert (=> b!771712 (= e!429684 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343508))))

(declare-fun b!771713 () Bool)

(declare-fun res!521924 () Bool)

(assert (=> b!771713 (=> (not res!521924) (not e!429685))))

(assert (=> b!771713 (= res!521924 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20707 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20707 a!3186))))))

(declare-fun b!771714 () Bool)

(declare-fun res!521927 () Bool)

(assert (=> b!771714 (=> (not res!521927) (not e!429681))))

(assert (=> b!771714 (= res!521927 e!429684)))

(declare-fun c!85292 () Bool)

(assert (=> b!771714 (= c!85292 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771715 () Bool)

(assert (=> b!771715 (= e!429682 e!429679)))

(declare-fun res!521919 () Bool)

(assert (=> b!771715 (=> (not res!521919) (not e!429679))))

(assert (=> b!771715 (= res!521919 (= (seekEntryOrOpen!0 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343511))))

(assert (=> b!771715 (= lt!343511 (Found!7843 j!159))))

(declare-fun b!771716 () Bool)

(assert (=> b!771716 (= e!429683 true)))

(declare-fun lt!343510 () Unit!26563)

(assert (=> b!771716 (= lt!343510 e!429678)))

(declare-fun c!85291 () Bool)

(assert (=> b!771716 (= c!85291 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771716 (= lt!343507 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!771717 () Bool)

(assert (=> b!771717 (= e!429681 e!429680)))

(declare-fun res!521921 () Bool)

(assert (=> b!771717 (=> (not res!521921) (not e!429680))))

(declare-fun lt!343512 () SeekEntryResult!7843)

(assert (=> b!771717 (= res!521921 (= lt!343512 lt!343506))))

(declare-fun lt!343509 () array!42382)

(declare-fun lt!343515 () (_ BitVec 64))

(assert (=> b!771717 (= lt!343506 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343515 lt!343509 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771717 (= lt!343512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343515 mask!3328) lt!343515 lt!343509 mask!3328))))

(assert (=> b!771717 (= lt!343515 (select (store (arr!20287 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771717 (= lt!343509 (array!42383 (store (arr!20287 a!3186) i!1173 k0!2102) (size!20707 a!3186)))))

(declare-fun b!771718 () Bool)

(assert (=> b!771718 (= e!429685 e!429681)))

(declare-fun res!521916 () Bool)

(assert (=> b!771718 (=> (not res!521916) (not e!429681))))

(assert (=> b!771718 (= res!521916 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20287 a!3186) j!159) mask!3328) (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343508))))

(assert (=> b!771718 (= lt!343508 (Intermediate!7843 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771719 () Bool)

(declare-fun res!521929 () Bool)

(assert (=> b!771719 (=> (not res!521929) (not e!429685))))

(assert (=> b!771719 (= res!521929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771720 () Bool)

(declare-fun res!521931 () Bool)

(assert (=> b!771720 (=> (not res!521931) (not e!429677))))

(declare-fun arrayContainsKey!0 (array!42382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771720 (= res!521931 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66940 res!521926) b!771710))

(assert (= (and b!771710 res!521925) b!771707))

(assert (= (and b!771707 res!521920) b!771703))

(assert (= (and b!771703 res!521922) b!771720))

(assert (= (and b!771720 res!521931) b!771705))

(assert (= (and b!771705 res!521930) b!771719))

(assert (= (and b!771719 res!521929) b!771709))

(assert (= (and b!771709 res!521923) b!771713))

(assert (= (and b!771713 res!521924) b!771718))

(assert (= (and b!771718 res!521916) b!771711))

(assert (= (and b!771711 res!521928) b!771714))

(assert (= (and b!771714 c!85292) b!771712))

(assert (= (and b!771714 (not c!85292)) b!771704))

(assert (= (and b!771714 res!521927) b!771717))

(assert (= (and b!771717 res!521921) b!771708))

(assert (= (and b!771708 res!521918) b!771715))

(assert (= (and b!771715 res!521919) b!771702))

(assert (= (and b!771708 (not res!521917)) b!771716))

(assert (= (and b!771716 c!85291) b!771701))

(assert (= (and b!771716 (not c!85291)) b!771706))

(declare-fun m!717299 () Bool)

(assert (=> b!771712 m!717299))

(assert (=> b!771712 m!717299))

(declare-fun m!717301 () Bool)

(assert (=> b!771712 m!717301))

(assert (=> b!771704 m!717299))

(assert (=> b!771704 m!717299))

(declare-fun m!717303 () Bool)

(assert (=> b!771704 m!717303))

(assert (=> b!771707 m!717299))

(assert (=> b!771707 m!717299))

(declare-fun m!717305 () Bool)

(assert (=> b!771707 m!717305))

(declare-fun m!717307 () Bool)

(assert (=> b!771717 m!717307))

(declare-fun m!717309 () Bool)

(assert (=> b!771717 m!717309))

(declare-fun m!717311 () Bool)

(assert (=> b!771717 m!717311))

(assert (=> b!771717 m!717309))

(declare-fun m!717313 () Bool)

(assert (=> b!771717 m!717313))

(declare-fun m!717315 () Bool)

(assert (=> b!771717 m!717315))

(assert (=> b!771702 m!717299))

(assert (=> b!771702 m!717299))

(declare-fun m!717317 () Bool)

(assert (=> b!771702 m!717317))

(declare-fun m!717319 () Bool)

(assert (=> b!771720 m!717319))

(assert (=> b!771706 m!717299))

(assert (=> b!771706 m!717299))

(assert (=> b!771706 m!717303))

(assert (=> b!771706 m!717299))

(declare-fun m!717321 () Bool)

(assert (=> b!771706 m!717321))

(assert (=> b!771701 m!717299))

(assert (=> b!771701 m!717299))

(declare-fun m!717323 () Bool)

(assert (=> b!771701 m!717323))

(declare-fun m!717325 () Bool)

(assert (=> b!771709 m!717325))

(declare-fun m!717327 () Bool)

(assert (=> b!771703 m!717327))

(declare-fun m!717329 () Bool)

(assert (=> b!771711 m!717329))

(declare-fun m!717331 () Bool)

(assert (=> start!66940 m!717331))

(declare-fun m!717333 () Bool)

(assert (=> start!66940 m!717333))

(declare-fun m!717335 () Bool)

(assert (=> b!771716 m!717335))

(assert (=> b!771715 m!717299))

(assert (=> b!771715 m!717299))

(declare-fun m!717337 () Bool)

(assert (=> b!771715 m!717337))

(declare-fun m!717339 () Bool)

(assert (=> b!771719 m!717339))

(declare-fun m!717341 () Bool)

(assert (=> b!771708 m!717341))

(declare-fun m!717343 () Bool)

(assert (=> b!771708 m!717343))

(assert (=> b!771718 m!717299))

(assert (=> b!771718 m!717299))

(declare-fun m!717345 () Bool)

(assert (=> b!771718 m!717345))

(assert (=> b!771718 m!717345))

(assert (=> b!771718 m!717299))

(declare-fun m!717347 () Bool)

(assert (=> b!771718 m!717347))

(declare-fun m!717349 () Bool)

(assert (=> b!771705 m!717349))

(check-sat (not b!771704) (not b!771715) (not b!771708) (not b!771716) (not b!771717) (not b!771720) (not b!771712) (not b!771701) (not b!771702) (not b!771707) (not b!771719) (not b!771718) (not start!66940) (not b!771703) (not b!771706) (not b!771709) (not b!771705))
(check-sat)
