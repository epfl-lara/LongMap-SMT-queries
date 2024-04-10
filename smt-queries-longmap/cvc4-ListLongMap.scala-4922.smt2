; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67780 () Bool)

(assert start!67780)

(declare-fun b!787622 () Bool)

(declare-fun res!533474 () Bool)

(declare-fun e!437801 () Bool)

(assert (=> b!787622 (=> (not res!533474) (not e!437801))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42820 0))(
  ( (array!42821 (arr!20498 (Array (_ BitVec 32) (_ BitVec 64))) (size!20919 (_ BitVec 32))) )
))
(declare-fun lt!351355 () array!42820)

(declare-fun lt!351349 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8098 0))(
  ( (MissingZero!8098 (index!34760 (_ BitVec 32))) (Found!8098 (index!34761 (_ BitVec 32))) (Intermediate!8098 (undefined!8910 Bool) (index!34762 (_ BitVec 32)) (x!65694 (_ BitVec 32))) (Undefined!8098) (MissingVacant!8098 (index!34763 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42820 (_ BitVec 32)) SeekEntryResult!8098)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42820 (_ BitVec 32)) SeekEntryResult!8098)

(assert (=> b!787622 (= res!533474 (= (seekEntryOrOpen!0 lt!351349 lt!351355 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351349 lt!351355 mask!3328)))))

(declare-fun b!787623 () Bool)

(declare-fun e!437794 () Bool)

(declare-fun e!437803 () Bool)

(assert (=> b!787623 (= e!437794 e!437803)))

(declare-fun res!533480 () Bool)

(assert (=> b!787623 (=> res!533480 e!437803)))

(declare-fun lt!351356 () SeekEntryResult!8098)

(declare-fun lt!351348 () SeekEntryResult!8098)

(assert (=> b!787623 (= res!533480 (not (= lt!351356 lt!351348)))))

(declare-fun a!3186 () array!42820)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787623 (= lt!351356 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20498 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787624 () Bool)

(declare-fun res!533478 () Bool)

(declare-fun e!437799 () Bool)

(assert (=> b!787624 (=> (not res!533478) (not e!437799))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787624 (= res!533478 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787625 () Bool)

(declare-fun e!437797 () Bool)

(assert (=> b!787625 (= e!437803 e!437797)))

(declare-fun res!533465 () Bool)

(assert (=> b!787625 (=> res!533465 e!437797)))

(declare-fun lt!351347 () (_ BitVec 64))

(assert (=> b!787625 (= res!533465 (= lt!351347 lt!351349))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787625 (= lt!351347 (select (store (arr!20498 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787626 () Bool)

(declare-fun lt!351353 () SeekEntryResult!8098)

(assert (=> b!787626 (= e!437801 (= lt!351353 lt!351356))))

(declare-fun b!787627 () Bool)

(declare-fun res!533479 () Bool)

(declare-fun e!437796 () Bool)

(assert (=> b!787627 (=> (not res!533479) (not e!437796))))

(assert (=> b!787627 (= res!533479 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20498 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787628 () Bool)

(declare-datatypes ((Unit!27280 0))(
  ( (Unit!27281) )
))
(declare-fun e!437795 () Unit!27280)

(declare-fun Unit!27282 () Unit!27280)

(assert (=> b!787628 (= e!437795 Unit!27282)))

(assert (=> b!787628 false))

(declare-fun b!787629 () Bool)

(declare-fun e!437802 () Bool)

(assert (=> b!787629 (= e!437802 e!437796)))

(declare-fun res!533470 () Bool)

(assert (=> b!787629 (=> (not res!533470) (not e!437796))))

(declare-fun lt!351345 () SeekEntryResult!8098)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42820 (_ BitVec 32)) SeekEntryResult!8098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787629 (= res!533470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20498 a!3186) j!159) mask!3328) (select (arr!20498 a!3186) j!159) a!3186 mask!3328) lt!351345))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787629 (= lt!351345 (Intermediate!8098 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787630 () Bool)

(declare-fun res!533468 () Bool)

(assert (=> b!787630 (=> (not res!533468) (not e!437802))))

(declare-datatypes ((List!14500 0))(
  ( (Nil!14497) (Cons!14496 (h!15619 (_ BitVec 64)) (t!20815 List!14500)) )
))
(declare-fun arrayNoDuplicates!0 (array!42820 (_ BitVec 32) List!14500) Bool)

(assert (=> b!787630 (= res!533468 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14497))))

(declare-fun e!437800 () Bool)

(declare-fun b!787631 () Bool)

(assert (=> b!787631 (= e!437800 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20498 a!3186) j!159) a!3186 mask!3328) lt!351348))))

(declare-fun b!787632 () Bool)

(declare-fun res!533471 () Bool)

(assert (=> b!787632 (=> (not res!533471) (not e!437799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787632 (= res!533471 (validKeyInArray!0 (select (arr!20498 a!3186) j!159)))))

(declare-fun res!533466 () Bool)

(assert (=> start!67780 (=> (not res!533466) (not e!437799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67780 (= res!533466 (validMask!0 mask!3328))))

(assert (=> start!67780 e!437799))

(assert (=> start!67780 true))

(declare-fun array_inv!16294 (array!42820) Bool)

(assert (=> start!67780 (array_inv!16294 a!3186)))

(declare-fun b!787633 () Bool)

(declare-fun res!533482 () Bool)

(assert (=> b!787633 (=> (not res!533482) (not e!437796))))

(declare-fun e!437798 () Bool)

(assert (=> b!787633 (= res!533482 e!437798)))

(declare-fun c!87486 () Bool)

(assert (=> b!787633 (= c!87486 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787634 () Bool)

(declare-fun res!533467 () Bool)

(assert (=> b!787634 (=> (not res!533467) (not e!437799))))

(assert (=> b!787634 (= res!533467 (validKeyInArray!0 k!2102))))

(declare-fun b!787635 () Bool)

(assert (=> b!787635 (= e!437798 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20498 a!3186) j!159) a!3186 mask!3328) lt!351345))))

(declare-fun b!787636 () Bool)

(declare-fun res!533469 () Bool)

(assert (=> b!787636 (=> (not res!533469) (not e!437802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42820 (_ BitVec 32)) Bool)

(assert (=> b!787636 (= res!533469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787637 () Bool)

(declare-fun e!437793 () Bool)

(assert (=> b!787637 (= e!437796 e!437793)))

(declare-fun res!533472 () Bool)

(assert (=> b!787637 (=> (not res!533472) (not e!437793))))

(declare-fun lt!351351 () SeekEntryResult!8098)

(declare-fun lt!351346 () SeekEntryResult!8098)

(assert (=> b!787637 (= res!533472 (= lt!351351 lt!351346))))

(assert (=> b!787637 (= lt!351346 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351349 lt!351355 mask!3328))))

(assert (=> b!787637 (= lt!351351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351349 mask!3328) lt!351349 lt!351355 mask!3328))))

(assert (=> b!787637 (= lt!351349 (select (store (arr!20498 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787637 (= lt!351355 (array!42821 (store (arr!20498 a!3186) i!1173 k!2102) (size!20919 a!3186)))))

(declare-fun b!787638 () Bool)

(assert (=> b!787638 (= e!437798 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20498 a!3186) j!159) a!3186 mask!3328) (Found!8098 j!159)))))

(declare-fun b!787639 () Bool)

(assert (=> b!787639 (= e!437799 e!437802)))

(declare-fun res!533476 () Bool)

(assert (=> b!787639 (=> (not res!533476) (not e!437802))))

(declare-fun lt!351354 () SeekEntryResult!8098)

(assert (=> b!787639 (= res!533476 (or (= lt!351354 (MissingZero!8098 i!1173)) (= lt!351354 (MissingVacant!8098 i!1173))))))

(assert (=> b!787639 (= lt!351354 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787640 () Bool)

(declare-fun Unit!27283 () Unit!27280)

(assert (=> b!787640 (= e!437795 Unit!27283)))

(declare-fun b!787641 () Bool)

(declare-fun res!533477 () Bool)

(assert (=> b!787641 (=> (not res!533477) (not e!437802))))

(assert (=> b!787641 (= res!533477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20919 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20919 a!3186))))))

(declare-fun b!787642 () Bool)

(assert (=> b!787642 (= e!437797 true)))

(assert (=> b!787642 e!437801))

(declare-fun res!533483 () Bool)

(assert (=> b!787642 (=> (not res!533483) (not e!437801))))

(assert (=> b!787642 (= res!533483 (= lt!351347 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351352 () Unit!27280)

(assert (=> b!787642 (= lt!351352 e!437795)))

(declare-fun c!87487 () Bool)

(assert (=> b!787642 (= c!87487 (= lt!351347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787643 () Bool)

(assert (=> b!787643 (= e!437793 (not e!437794))))

(declare-fun res!533475 () Bool)

(assert (=> b!787643 (=> res!533475 e!437794)))

(assert (=> b!787643 (= res!533475 (or (not (is-Intermediate!8098 lt!351346)) (bvslt x!1131 (x!65694 lt!351346)) (not (= x!1131 (x!65694 lt!351346))) (not (= index!1321 (index!34762 lt!351346)))))))

(assert (=> b!787643 e!437800))

(declare-fun res!533481 () Bool)

(assert (=> b!787643 (=> (not res!533481) (not e!437800))))

(assert (=> b!787643 (= res!533481 (= lt!351353 lt!351348))))

(assert (=> b!787643 (= lt!351348 (Found!8098 j!159))))

(assert (=> b!787643 (= lt!351353 (seekEntryOrOpen!0 (select (arr!20498 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787643 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351350 () Unit!27280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27280)

(assert (=> b!787643 (= lt!351350 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787644 () Bool)

(declare-fun res!533473 () Bool)

(assert (=> b!787644 (=> (not res!533473) (not e!437799))))

(assert (=> b!787644 (= res!533473 (and (= (size!20919 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20919 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20919 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67780 res!533466) b!787644))

(assert (= (and b!787644 res!533473) b!787632))

(assert (= (and b!787632 res!533471) b!787634))

(assert (= (and b!787634 res!533467) b!787624))

(assert (= (and b!787624 res!533478) b!787639))

(assert (= (and b!787639 res!533476) b!787636))

(assert (= (and b!787636 res!533469) b!787630))

(assert (= (and b!787630 res!533468) b!787641))

(assert (= (and b!787641 res!533477) b!787629))

(assert (= (and b!787629 res!533470) b!787627))

(assert (= (and b!787627 res!533479) b!787633))

(assert (= (and b!787633 c!87486) b!787635))

(assert (= (and b!787633 (not c!87486)) b!787638))

(assert (= (and b!787633 res!533482) b!787637))

(assert (= (and b!787637 res!533472) b!787643))

(assert (= (and b!787643 res!533481) b!787631))

(assert (= (and b!787643 (not res!533475)) b!787623))

(assert (= (and b!787623 (not res!533480)) b!787625))

(assert (= (and b!787625 (not res!533465)) b!787642))

(assert (= (and b!787642 c!87487) b!787628))

(assert (= (and b!787642 (not c!87487)) b!787640))

(assert (= (and b!787642 res!533483) b!787622))

(assert (= (and b!787622 res!533474) b!787626))

(declare-fun m!729157 () Bool)

(assert (=> b!787637 m!729157))

(declare-fun m!729159 () Bool)

(assert (=> b!787637 m!729159))

(declare-fun m!729161 () Bool)

(assert (=> b!787637 m!729161))

(assert (=> b!787637 m!729161))

(declare-fun m!729163 () Bool)

(assert (=> b!787637 m!729163))

(declare-fun m!729165 () Bool)

(assert (=> b!787637 m!729165))

(declare-fun m!729167 () Bool)

(assert (=> b!787622 m!729167))

(declare-fun m!729169 () Bool)

(assert (=> b!787622 m!729169))

(declare-fun m!729171 () Bool)

(assert (=> b!787627 m!729171))

(declare-fun m!729173 () Bool)

(assert (=> b!787630 m!729173))

(declare-fun m!729175 () Bool)

(assert (=> b!787632 m!729175))

(assert (=> b!787632 m!729175))

(declare-fun m!729177 () Bool)

(assert (=> b!787632 m!729177))

(assert (=> b!787638 m!729175))

(assert (=> b!787638 m!729175))

(declare-fun m!729179 () Bool)

(assert (=> b!787638 m!729179))

(assert (=> b!787625 m!729165))

(declare-fun m!729181 () Bool)

(assert (=> b!787625 m!729181))

(declare-fun m!729183 () Bool)

(assert (=> b!787636 m!729183))

(declare-fun m!729185 () Bool)

(assert (=> b!787624 m!729185))

(assert (=> b!787631 m!729175))

(assert (=> b!787631 m!729175))

(declare-fun m!729187 () Bool)

(assert (=> b!787631 m!729187))

(assert (=> b!787623 m!729175))

(assert (=> b!787623 m!729175))

(assert (=> b!787623 m!729179))

(declare-fun m!729189 () Bool)

(assert (=> b!787639 m!729189))

(assert (=> b!787643 m!729175))

(assert (=> b!787643 m!729175))

(declare-fun m!729191 () Bool)

(assert (=> b!787643 m!729191))

(declare-fun m!729193 () Bool)

(assert (=> b!787643 m!729193))

(declare-fun m!729195 () Bool)

(assert (=> b!787643 m!729195))

(assert (=> b!787635 m!729175))

(assert (=> b!787635 m!729175))

(declare-fun m!729197 () Bool)

(assert (=> b!787635 m!729197))

(declare-fun m!729199 () Bool)

(assert (=> start!67780 m!729199))

(declare-fun m!729201 () Bool)

(assert (=> start!67780 m!729201))

(assert (=> b!787629 m!729175))

(assert (=> b!787629 m!729175))

(declare-fun m!729203 () Bool)

(assert (=> b!787629 m!729203))

(assert (=> b!787629 m!729203))

(assert (=> b!787629 m!729175))

(declare-fun m!729205 () Bool)

(assert (=> b!787629 m!729205))

(declare-fun m!729207 () Bool)

(assert (=> b!787634 m!729207))

(push 1)

