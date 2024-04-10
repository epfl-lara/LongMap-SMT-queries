; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65870 () Bool)

(assert start!65870)

(declare-fun b!759299 () Bool)

(declare-fun res!513820 () Bool)

(declare-fun e!423296 () Bool)

(assert (=> b!759299 (=> (not res!513820) (not e!423296))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759299 (= res!513820 (validKeyInArray!0 k!2102))))

(declare-fun b!759300 () Bool)

(declare-fun res!513821 () Bool)

(declare-fun e!423299 () Bool)

(assert (=> b!759300 (=> (not res!513821) (not e!423299))))

(declare-fun e!423298 () Bool)

(assert (=> b!759300 (= res!513821 e!423298)))

(declare-fun c!83122 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759300 (= c!83122 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759301 () Bool)

(declare-fun res!513819 () Bool)

(assert (=> b!759301 (=> (not res!513819) (not e!423296))))

(declare-datatypes ((array!42043 0))(
  ( (array!42044 (arr!20135 (Array (_ BitVec 32) (_ BitVec 64))) (size!20556 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42043)

(declare-fun arrayContainsKey!0 (array!42043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759301 (= res!513819 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759302 () Bool)

(declare-fun e!423302 () Bool)

(assert (=> b!759302 (= e!423302 e!423299)))

(declare-fun res!513823 () Bool)

(assert (=> b!759302 (=> (not res!513823) (not e!423299))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7735 0))(
  ( (MissingZero!7735 (index!33308 (_ BitVec 32))) (Found!7735 (index!33309 (_ BitVec 32))) (Intermediate!7735 (undefined!8547 Bool) (index!33310 (_ BitVec 32)) (x!64189 (_ BitVec 32))) (Undefined!7735) (MissingVacant!7735 (index!33311 (_ BitVec 32))) )
))
(declare-fun lt!338357 () SeekEntryResult!7735)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42043 (_ BitVec 32)) SeekEntryResult!7735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759302 (= res!513823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20135 a!3186) j!159) mask!3328) (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338357))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!759302 (= lt!338357 (Intermediate!7735 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!759303 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42043 (_ BitVec 32)) SeekEntryResult!7735)

(assert (=> b!759303 (= e!423298 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) (Found!7735 j!159)))))

(declare-fun b!759304 () Bool)

(declare-fun res!513829 () Bool)

(assert (=> b!759304 (=> (not res!513829) (not e!423296))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759304 (= res!513829 (and (= (size!20556 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20556 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20556 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759305 () Bool)

(declare-fun res!513817 () Bool)

(assert (=> b!759305 (=> (not res!513817) (not e!423302))))

(declare-datatypes ((List!14137 0))(
  ( (Nil!14134) (Cons!14133 (h!15205 (_ BitVec 64)) (t!20452 List!14137)) )
))
(declare-fun arrayNoDuplicates!0 (array!42043 (_ BitVec 32) List!14137) Bool)

(assert (=> b!759305 (= res!513817 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14134))))

(declare-fun b!759306 () Bool)

(assert (=> b!759306 (= e!423298 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338357))))

(declare-fun b!759307 () Bool)

(declare-fun e!423295 () Bool)

(assert (=> b!759307 (= e!423295 (not true))))

(declare-fun e!423300 () Bool)

(assert (=> b!759307 e!423300))

(declare-fun res!513826 () Bool)

(assert (=> b!759307 (=> (not res!513826) (not e!423300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42043 (_ BitVec 32)) Bool)

(assert (=> b!759307 (= res!513826 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26310 0))(
  ( (Unit!26311) )
))
(declare-fun lt!338355 () Unit!26310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26310)

(assert (=> b!759307 (= lt!338355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759308 () Bool)

(assert (=> b!759308 (= e!423299 e!423295)))

(declare-fun res!513827 () Bool)

(assert (=> b!759308 (=> (not res!513827) (not e!423295))))

(declare-fun lt!338354 () array!42043)

(declare-fun lt!338356 () (_ BitVec 64))

(assert (=> b!759308 (= res!513827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338356 mask!3328) lt!338356 lt!338354 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338356 lt!338354 mask!3328)))))

(assert (=> b!759308 (= lt!338356 (select (store (arr!20135 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759308 (= lt!338354 (array!42044 (store (arr!20135 a!3186) i!1173 k!2102) (size!20556 a!3186)))))

(declare-fun res!513825 () Bool)

(assert (=> start!65870 (=> (not res!513825) (not e!423296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65870 (= res!513825 (validMask!0 mask!3328))))

(assert (=> start!65870 e!423296))

(assert (=> start!65870 true))

(declare-fun array_inv!15931 (array!42043) Bool)

(assert (=> start!65870 (array_inv!15931 a!3186)))

(declare-fun b!759309 () Bool)

(declare-fun res!513816 () Bool)

(assert (=> b!759309 (=> (not res!513816) (not e!423296))))

(assert (=> b!759309 (= res!513816 (validKeyInArray!0 (select (arr!20135 a!3186) j!159)))))

(declare-fun b!759310 () Bool)

(declare-fun res!513818 () Bool)

(assert (=> b!759310 (=> (not res!513818) (not e!423299))))

(assert (=> b!759310 (= res!513818 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20135 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759311 () Bool)

(assert (=> b!759311 (= e!423296 e!423302)))

(declare-fun res!513822 () Bool)

(assert (=> b!759311 (=> (not res!513822) (not e!423302))))

(declare-fun lt!338353 () SeekEntryResult!7735)

(assert (=> b!759311 (= res!513822 (or (= lt!338353 (MissingZero!7735 i!1173)) (= lt!338353 (MissingVacant!7735 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42043 (_ BitVec 32)) SeekEntryResult!7735)

(assert (=> b!759311 (= lt!338353 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759312 () Bool)

(declare-fun e!423297 () Bool)

(declare-fun lt!338352 () SeekEntryResult!7735)

(assert (=> b!759312 (= e!423297 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338352))))

(declare-fun b!759313 () Bool)

(declare-fun res!513828 () Bool)

(assert (=> b!759313 (=> (not res!513828) (not e!423302))))

(assert (=> b!759313 (= res!513828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759314 () Bool)

(assert (=> b!759314 (= e!423300 e!423297)))

(declare-fun res!513830 () Bool)

(assert (=> b!759314 (=> (not res!513830) (not e!423297))))

(assert (=> b!759314 (= res!513830 (= (seekEntryOrOpen!0 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338352))))

(assert (=> b!759314 (= lt!338352 (Found!7735 j!159))))

(declare-fun b!759315 () Bool)

(declare-fun res!513824 () Bool)

(assert (=> b!759315 (=> (not res!513824) (not e!423302))))

(assert (=> b!759315 (= res!513824 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20556 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20556 a!3186))))))

(assert (= (and start!65870 res!513825) b!759304))

(assert (= (and b!759304 res!513829) b!759309))

(assert (= (and b!759309 res!513816) b!759299))

(assert (= (and b!759299 res!513820) b!759301))

(assert (= (and b!759301 res!513819) b!759311))

(assert (= (and b!759311 res!513822) b!759313))

(assert (= (and b!759313 res!513828) b!759305))

(assert (= (and b!759305 res!513817) b!759315))

(assert (= (and b!759315 res!513824) b!759302))

(assert (= (and b!759302 res!513823) b!759310))

(assert (= (and b!759310 res!513818) b!759300))

(assert (= (and b!759300 c!83122) b!759306))

(assert (= (and b!759300 (not c!83122)) b!759303))

(assert (= (and b!759300 res!513821) b!759308))

(assert (= (and b!759308 res!513827) b!759307))

(assert (= (and b!759307 res!513826) b!759314))

(assert (= (and b!759314 res!513830) b!759312))

(declare-fun m!706671 () Bool)

(assert (=> b!759311 m!706671))

(declare-fun m!706673 () Bool)

(assert (=> b!759301 m!706673))

(declare-fun m!706675 () Bool)

(assert (=> start!65870 m!706675))

(declare-fun m!706677 () Bool)

(assert (=> start!65870 m!706677))

(declare-fun m!706679 () Bool)

(assert (=> b!759306 m!706679))

(assert (=> b!759306 m!706679))

(declare-fun m!706681 () Bool)

(assert (=> b!759306 m!706681))

(declare-fun m!706683 () Bool)

(assert (=> b!759299 m!706683))

(declare-fun m!706685 () Bool)

(assert (=> b!759310 m!706685))

(declare-fun m!706687 () Bool)

(assert (=> b!759307 m!706687))

(declare-fun m!706689 () Bool)

(assert (=> b!759307 m!706689))

(assert (=> b!759314 m!706679))

(assert (=> b!759314 m!706679))

(declare-fun m!706691 () Bool)

(assert (=> b!759314 m!706691))

(declare-fun m!706693 () Bool)

(assert (=> b!759313 m!706693))

(assert (=> b!759309 m!706679))

(assert (=> b!759309 m!706679))

(declare-fun m!706695 () Bool)

(assert (=> b!759309 m!706695))

(declare-fun m!706697 () Bool)

(assert (=> b!759305 m!706697))

(assert (=> b!759302 m!706679))

(assert (=> b!759302 m!706679))

(declare-fun m!706699 () Bool)

(assert (=> b!759302 m!706699))

(assert (=> b!759302 m!706699))

(assert (=> b!759302 m!706679))

(declare-fun m!706701 () Bool)

(assert (=> b!759302 m!706701))

(declare-fun m!706703 () Bool)

(assert (=> b!759308 m!706703))

(declare-fun m!706705 () Bool)

(assert (=> b!759308 m!706705))

(declare-fun m!706707 () Bool)

(assert (=> b!759308 m!706707))

(assert (=> b!759308 m!706705))

(declare-fun m!706709 () Bool)

(assert (=> b!759308 m!706709))

(declare-fun m!706711 () Bool)

(assert (=> b!759308 m!706711))

(assert (=> b!759312 m!706679))

(assert (=> b!759312 m!706679))

(declare-fun m!706713 () Bool)

(assert (=> b!759312 m!706713))

(assert (=> b!759303 m!706679))

(assert (=> b!759303 m!706679))

(declare-fun m!706715 () Bool)

(assert (=> b!759303 m!706715))

(push 1)

