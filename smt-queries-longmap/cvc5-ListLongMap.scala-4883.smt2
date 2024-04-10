; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67344 () Bool)

(assert start!67344)

(declare-fun b!778690 () Bool)

(declare-fun res!526733 () Bool)

(declare-fun e!433233 () Bool)

(assert (=> b!778690 (=> (not res!526733) (not e!433233))))

(declare-datatypes ((array!42573 0))(
  ( (array!42574 (arr!20379 (Array (_ BitVec 32) (_ BitVec 64))) (size!20800 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42573)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778690 (= res!526733 (validKeyInArray!0 (select (arr!20379 a!3186) j!159)))))

(declare-fun b!778691 () Bool)

(declare-fun res!526741 () Bool)

(declare-fun e!433238 () Bool)

(assert (=> b!778691 (=> (not res!526741) (not e!433238))))

(declare-datatypes ((List!14381 0))(
  ( (Nil!14378) (Cons!14377 (h!15491 (_ BitVec 64)) (t!20696 List!14381)) )
))
(declare-fun arrayNoDuplicates!0 (array!42573 (_ BitVec 32) List!14381) Bool)

(assert (=> b!778691 (= res!526741 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14378))))

(declare-fun b!778692 () Bool)

(assert (=> b!778692 (= e!433233 e!433238)))

(declare-fun res!526738 () Bool)

(assert (=> b!778692 (=> (not res!526738) (not e!433238))))

(declare-datatypes ((SeekEntryResult!7979 0))(
  ( (MissingZero!7979 (index!34284 (_ BitVec 32))) (Found!7979 (index!34285 (_ BitVec 32))) (Intermediate!7979 (undefined!8791 Bool) (index!34286 (_ BitVec 32)) (x!65236 (_ BitVec 32))) (Undefined!7979) (MissingVacant!7979 (index!34287 (_ BitVec 32))) )
))
(declare-fun lt!346922 () SeekEntryResult!7979)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778692 (= res!526738 (or (= lt!346922 (MissingZero!7979 i!1173)) (= lt!346922 (MissingVacant!7979 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42573 (_ BitVec 32)) SeekEntryResult!7979)

(assert (=> b!778692 (= lt!346922 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!526735 () Bool)

(assert (=> start!67344 (=> (not res!526735) (not e!433233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67344 (= res!526735 (validMask!0 mask!3328))))

(assert (=> start!67344 e!433233))

(assert (=> start!67344 true))

(declare-fun array_inv!16175 (array!42573) Bool)

(assert (=> start!67344 (array_inv!16175 a!3186)))

(declare-fun b!778693 () Bool)

(declare-fun res!526731 () Bool)

(assert (=> b!778693 (=> (not res!526731) (not e!433233))))

(assert (=> b!778693 (= res!526731 (and (= (size!20800 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20800 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20800 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778694 () Bool)

(declare-fun e!433241 () Bool)

(declare-fun e!433239 () Bool)

(assert (=> b!778694 (= e!433241 e!433239)))

(declare-fun res!526732 () Bool)

(assert (=> b!778694 (=> (not res!526732) (not e!433239))))

(declare-fun lt!346917 () SeekEntryResult!7979)

(assert (=> b!778694 (= res!526732 (= (seekEntryOrOpen!0 (select (arr!20379 a!3186) j!159) a!3186 mask!3328) lt!346917))))

(assert (=> b!778694 (= lt!346917 (Found!7979 j!159))))

(declare-fun b!778695 () Bool)

(declare-fun e!433237 () Bool)

(assert (=> b!778695 (= e!433238 e!433237)))

(declare-fun res!526740 () Bool)

(assert (=> b!778695 (=> (not res!526740) (not e!433237))))

(declare-fun lt!346918 () SeekEntryResult!7979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42573 (_ BitVec 32)) SeekEntryResult!7979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778695 (= res!526740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20379 a!3186) j!159) mask!3328) (select (arr!20379 a!3186) j!159) a!3186 mask!3328) lt!346918))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778695 (= lt!346918 (Intermediate!7979 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!433240 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!778696 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42573 (_ BitVec 32)) SeekEntryResult!7979)

(assert (=> b!778696 (= e!433240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20379 a!3186) j!159) a!3186 mask!3328) (Found!7979 j!159)))))

(declare-fun b!778697 () Bool)

(assert (=> b!778697 (= e!433239 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20379 a!3186) j!159) a!3186 mask!3328) lt!346917))))

(declare-fun b!778698 () Bool)

(declare-fun e!433236 () Bool)

(assert (=> b!778698 (= e!433236 true)))

(declare-fun lt!346914 () SeekEntryResult!7979)

(assert (=> b!778698 (= lt!346914 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20379 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778699 () Bool)

(declare-fun e!433234 () Bool)

(assert (=> b!778699 (= e!433237 e!433234)))

(declare-fun res!526744 () Bool)

(assert (=> b!778699 (=> (not res!526744) (not e!433234))))

(declare-fun lt!346921 () SeekEntryResult!7979)

(declare-fun lt!346919 () SeekEntryResult!7979)

(assert (=> b!778699 (= res!526744 (= lt!346921 lt!346919))))

(declare-fun lt!346915 () (_ BitVec 64))

(declare-fun lt!346916 () array!42573)

(assert (=> b!778699 (= lt!346919 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346915 lt!346916 mask!3328))))

(assert (=> b!778699 (= lt!346921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346915 mask!3328) lt!346915 lt!346916 mask!3328))))

(assert (=> b!778699 (= lt!346915 (select (store (arr!20379 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778699 (= lt!346916 (array!42574 (store (arr!20379 a!3186) i!1173 k!2102) (size!20800 a!3186)))))

(declare-fun b!778700 () Bool)

(declare-fun res!526730 () Bool)

(assert (=> b!778700 (=> (not res!526730) (not e!433238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42573 (_ BitVec 32)) Bool)

(assert (=> b!778700 (= res!526730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778701 () Bool)

(assert (=> b!778701 (= e!433240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20379 a!3186) j!159) a!3186 mask!3328) lt!346918))))

(declare-fun b!778702 () Bool)

(declare-fun res!526737 () Bool)

(assert (=> b!778702 (=> (not res!526737) (not e!433237))))

(assert (=> b!778702 (= res!526737 e!433240)))

(declare-fun c!86383 () Bool)

(assert (=> b!778702 (= c!86383 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778703 () Bool)

(declare-fun res!526742 () Bool)

(assert (=> b!778703 (=> (not res!526742) (not e!433233))))

(declare-fun arrayContainsKey!0 (array!42573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778703 (= res!526742 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778704 () Bool)

(declare-fun res!526745 () Bool)

(assert (=> b!778704 (=> (not res!526745) (not e!433237))))

(assert (=> b!778704 (= res!526745 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20379 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778705 () Bool)

(declare-fun res!526734 () Bool)

(assert (=> b!778705 (=> (not res!526734) (not e!433238))))

(assert (=> b!778705 (= res!526734 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20800 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20800 a!3186))))))

(declare-fun b!778706 () Bool)

(declare-fun res!526743 () Bool)

(assert (=> b!778706 (=> (not res!526743) (not e!433233))))

(assert (=> b!778706 (= res!526743 (validKeyInArray!0 k!2102))))

(declare-fun b!778707 () Bool)

(assert (=> b!778707 (= e!433234 (not e!433236))))

(declare-fun res!526736 () Bool)

(assert (=> b!778707 (=> res!526736 e!433236)))

(assert (=> b!778707 (= res!526736 (or (not (is-Intermediate!7979 lt!346919)) (bvslt x!1131 (x!65236 lt!346919)) (not (= x!1131 (x!65236 lt!346919))) (not (= index!1321 (index!34286 lt!346919)))))))

(assert (=> b!778707 e!433241))

(declare-fun res!526739 () Bool)

(assert (=> b!778707 (=> (not res!526739) (not e!433241))))

(assert (=> b!778707 (= res!526739 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26852 0))(
  ( (Unit!26853) )
))
(declare-fun lt!346920 () Unit!26852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26852)

(assert (=> b!778707 (= lt!346920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67344 res!526735) b!778693))

(assert (= (and b!778693 res!526731) b!778690))

(assert (= (and b!778690 res!526733) b!778706))

(assert (= (and b!778706 res!526743) b!778703))

(assert (= (and b!778703 res!526742) b!778692))

(assert (= (and b!778692 res!526738) b!778700))

(assert (= (and b!778700 res!526730) b!778691))

(assert (= (and b!778691 res!526741) b!778705))

(assert (= (and b!778705 res!526734) b!778695))

(assert (= (and b!778695 res!526740) b!778704))

(assert (= (and b!778704 res!526745) b!778702))

(assert (= (and b!778702 c!86383) b!778701))

(assert (= (and b!778702 (not c!86383)) b!778696))

(assert (= (and b!778702 res!526737) b!778699))

(assert (= (and b!778699 res!526744) b!778707))

(assert (= (and b!778707 res!526739) b!778694))

(assert (= (and b!778694 res!526732) b!778697))

(assert (= (and b!778707 (not res!526736)) b!778698))

(declare-fun m!722303 () Bool)

(assert (=> b!778690 m!722303))

(assert (=> b!778690 m!722303))

(declare-fun m!722305 () Bool)

(assert (=> b!778690 m!722305))

(declare-fun m!722307 () Bool)

(assert (=> b!778699 m!722307))

(declare-fun m!722309 () Bool)

(assert (=> b!778699 m!722309))

(declare-fun m!722311 () Bool)

(assert (=> b!778699 m!722311))

(declare-fun m!722313 () Bool)

(assert (=> b!778699 m!722313))

(declare-fun m!722315 () Bool)

(assert (=> b!778699 m!722315))

(assert (=> b!778699 m!722307))

(declare-fun m!722317 () Bool)

(assert (=> b!778706 m!722317))

(declare-fun m!722319 () Bool)

(assert (=> b!778692 m!722319))

(declare-fun m!722321 () Bool)

(assert (=> start!67344 m!722321))

(declare-fun m!722323 () Bool)

(assert (=> start!67344 m!722323))

(declare-fun m!722325 () Bool)

(assert (=> b!778707 m!722325))

(declare-fun m!722327 () Bool)

(assert (=> b!778707 m!722327))

(assert (=> b!778697 m!722303))

(assert (=> b!778697 m!722303))

(declare-fun m!722329 () Bool)

(assert (=> b!778697 m!722329))

(assert (=> b!778701 m!722303))

(assert (=> b!778701 m!722303))

(declare-fun m!722331 () Bool)

(assert (=> b!778701 m!722331))

(assert (=> b!778694 m!722303))

(assert (=> b!778694 m!722303))

(declare-fun m!722333 () Bool)

(assert (=> b!778694 m!722333))

(declare-fun m!722335 () Bool)

(assert (=> b!778691 m!722335))

(assert (=> b!778696 m!722303))

(assert (=> b!778696 m!722303))

(declare-fun m!722337 () Bool)

(assert (=> b!778696 m!722337))

(declare-fun m!722339 () Bool)

(assert (=> b!778700 m!722339))

(declare-fun m!722341 () Bool)

(assert (=> b!778703 m!722341))

(assert (=> b!778698 m!722303))

(assert (=> b!778698 m!722303))

(assert (=> b!778698 m!722337))

(assert (=> b!778695 m!722303))

(assert (=> b!778695 m!722303))

(declare-fun m!722343 () Bool)

(assert (=> b!778695 m!722343))

(assert (=> b!778695 m!722343))

(assert (=> b!778695 m!722303))

(declare-fun m!722345 () Bool)

(assert (=> b!778695 m!722345))

(declare-fun m!722347 () Bool)

(assert (=> b!778704 m!722347))

(push 1)

