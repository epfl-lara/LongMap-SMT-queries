; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67474 () Bool)

(assert start!67474)

(declare-fun b!779659 () Bool)

(declare-datatypes ((array!42583 0))(
  ( (array!42584 (arr!20380 (Array (_ BitVec 32) (_ BitVec 64))) (size!20800 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42583)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!433815 () Bool)

(declare-datatypes ((SeekEntryResult!7936 0))(
  ( (MissingZero!7936 (index!34112 (_ BitVec 32))) (Found!7936 (index!34113 (_ BitVec 32))) (Intermediate!7936 (undefined!8748 Bool) (index!34114 (_ BitVec 32)) (x!65220 (_ BitVec 32))) (Undefined!7936) (MissingVacant!7936 (index!34115 (_ BitVec 32))) )
))
(declare-fun lt!347349 () SeekEntryResult!7936)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42583 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!779659 (= e!433815 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!347349))))

(declare-fun b!779660 () Bool)

(declare-fun e!433818 () Bool)

(declare-fun e!433811 () Bool)

(assert (=> b!779660 (= e!433818 e!433811)))

(declare-fun res!527297 () Bool)

(assert (=> b!779660 (=> (not res!527297) (not e!433811))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779660 (= res!527297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20380 a!3186) j!159) mask!3328) (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!347349))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779660 (= lt!347349 (Intermediate!7936 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779661 () Bool)

(declare-fun res!527293 () Bool)

(assert (=> b!779661 (=> (not res!527293) (not e!433818))))

(assert (=> b!779661 (= res!527293 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20800 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20800 a!3186))))))

(declare-fun b!779662 () Bool)

(declare-fun res!527298 () Bool)

(declare-fun e!433812 () Bool)

(assert (=> b!779662 (=> (not res!527298) (not e!433812))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779662 (= res!527298 (and (= (size!20800 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20800 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20800 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!347355 () SeekEntryResult!7936)

(declare-fun e!433814 () Bool)

(declare-fun b!779663 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42583 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!779663 (= e!433814 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!347355))))

(declare-fun b!779664 () Bool)

(declare-fun res!527303 () Bool)

(assert (=> b!779664 (=> (not res!527303) (not e!433818))))

(declare-datatypes ((List!14289 0))(
  ( (Nil!14286) (Cons!14285 (h!15405 (_ BitVec 64)) (t!20596 List!14289)) )
))
(declare-fun arrayNoDuplicates!0 (array!42583 (_ BitVec 32) List!14289) Bool)

(assert (=> b!779664 (= res!527303 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14286))))

(declare-fun b!779666 () Bool)

(declare-fun res!527292 () Bool)

(assert (=> b!779666 (=> (not res!527292) (not e!433811))))

(assert (=> b!779666 (= res!527292 e!433815)))

(declare-fun c!86591 () Bool)

(assert (=> b!779666 (= c!86591 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779667 () Bool)

(declare-fun res!527289 () Bool)

(assert (=> b!779667 (=> (not res!527289) (not e!433812))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779667 (= res!527289 (validKeyInArray!0 k0!2102))))

(declare-fun b!779668 () Bool)

(assert (=> b!779668 (= e!433812 e!433818)))

(declare-fun res!527296 () Bool)

(assert (=> b!779668 (=> (not res!527296) (not e!433818))))

(declare-fun lt!347352 () SeekEntryResult!7936)

(assert (=> b!779668 (= res!527296 (or (= lt!347352 (MissingZero!7936 i!1173)) (= lt!347352 (MissingVacant!7936 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42583 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!779668 (= lt!347352 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779669 () Bool)

(declare-fun e!433816 () Bool)

(assert (=> b!779669 (= e!433816 e!433814)))

(declare-fun res!527295 () Bool)

(assert (=> b!779669 (=> (not res!527295) (not e!433814))))

(assert (=> b!779669 (= res!527295 (= (seekEntryOrOpen!0 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!347355))))

(assert (=> b!779669 (= lt!347355 (Found!7936 j!159))))

(declare-fun b!779670 () Bool)

(declare-fun res!527299 () Bool)

(assert (=> b!779670 (=> (not res!527299) (not e!433812))))

(assert (=> b!779670 (= res!527299 (validKeyInArray!0 (select (arr!20380 a!3186) j!159)))))

(declare-fun b!779671 () Bool)

(declare-fun e!433817 () Bool)

(declare-fun e!433813 () Bool)

(assert (=> b!779671 (= e!433817 (not e!433813))))

(declare-fun res!527294 () Bool)

(assert (=> b!779671 (=> res!527294 e!433813)))

(declare-fun lt!347354 () SeekEntryResult!7936)

(get-info :version)

(assert (=> b!779671 (= res!527294 (or (not ((_ is Intermediate!7936) lt!347354)) (bvslt x!1131 (x!65220 lt!347354)) (not (= x!1131 (x!65220 lt!347354))) (not (= index!1321 (index!34114 lt!347354)))))))

(assert (=> b!779671 e!433816))

(declare-fun res!527291 () Bool)

(assert (=> b!779671 (=> (not res!527291) (not e!433816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42583 (_ BitVec 32)) Bool)

(assert (=> b!779671 (= res!527291 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26845 0))(
  ( (Unit!26846) )
))
(declare-fun lt!347351 () Unit!26845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26845)

(assert (=> b!779671 (= lt!347351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779672 () Bool)

(assert (=> b!779672 (= e!433815 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) (Found!7936 j!159)))))

(declare-fun b!779665 () Bool)

(declare-fun res!527302 () Bool)

(assert (=> b!779665 (=> (not res!527302) (not e!433812))))

(declare-fun arrayContainsKey!0 (array!42583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779665 (= res!527302 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!527290 () Bool)

(assert (=> start!67474 (=> (not res!527290) (not e!433812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67474 (= res!527290 (validMask!0 mask!3328))))

(assert (=> start!67474 e!433812))

(assert (=> start!67474 true))

(declare-fun array_inv!16239 (array!42583) Bool)

(assert (=> start!67474 (array_inv!16239 a!3186)))

(declare-fun b!779673 () Bool)

(assert (=> b!779673 (= e!433813 true)))

(declare-fun lt!347353 () SeekEntryResult!7936)

(assert (=> b!779673 (= lt!347353 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20380 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779674 () Bool)

(assert (=> b!779674 (= e!433811 e!433817)))

(declare-fun res!527304 () Bool)

(assert (=> b!779674 (=> (not res!527304) (not e!433817))))

(declare-fun lt!347348 () SeekEntryResult!7936)

(assert (=> b!779674 (= res!527304 (= lt!347348 lt!347354))))

(declare-fun lt!347350 () (_ BitVec 64))

(declare-fun lt!347356 () array!42583)

(assert (=> b!779674 (= lt!347354 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347350 lt!347356 mask!3328))))

(assert (=> b!779674 (= lt!347348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347350 mask!3328) lt!347350 lt!347356 mask!3328))))

(assert (=> b!779674 (= lt!347350 (select (store (arr!20380 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779674 (= lt!347356 (array!42584 (store (arr!20380 a!3186) i!1173 k0!2102) (size!20800 a!3186)))))

(declare-fun b!779675 () Bool)

(declare-fun res!527300 () Bool)

(assert (=> b!779675 (=> (not res!527300) (not e!433811))))

(assert (=> b!779675 (= res!527300 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20380 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779676 () Bool)

(declare-fun res!527301 () Bool)

(assert (=> b!779676 (=> (not res!527301) (not e!433818))))

(assert (=> b!779676 (= res!527301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67474 res!527290) b!779662))

(assert (= (and b!779662 res!527298) b!779670))

(assert (= (and b!779670 res!527299) b!779667))

(assert (= (and b!779667 res!527289) b!779665))

(assert (= (and b!779665 res!527302) b!779668))

(assert (= (and b!779668 res!527296) b!779676))

(assert (= (and b!779676 res!527301) b!779664))

(assert (= (and b!779664 res!527303) b!779661))

(assert (= (and b!779661 res!527293) b!779660))

(assert (= (and b!779660 res!527297) b!779675))

(assert (= (and b!779675 res!527300) b!779666))

(assert (= (and b!779666 c!86591) b!779659))

(assert (= (and b!779666 (not c!86591)) b!779672))

(assert (= (and b!779666 res!527292) b!779674))

(assert (= (and b!779674 res!527304) b!779671))

(assert (= (and b!779671 res!527291) b!779669))

(assert (= (and b!779669 res!527295) b!779663))

(assert (= (and b!779671 (not res!527294)) b!779673))

(declare-fun m!723641 () Bool)

(assert (=> b!779663 m!723641))

(assert (=> b!779663 m!723641))

(declare-fun m!723643 () Bool)

(assert (=> b!779663 m!723643))

(declare-fun m!723645 () Bool)

(assert (=> b!779667 m!723645))

(declare-fun m!723647 () Bool)

(assert (=> b!779668 m!723647))

(assert (=> b!779660 m!723641))

(assert (=> b!779660 m!723641))

(declare-fun m!723649 () Bool)

(assert (=> b!779660 m!723649))

(assert (=> b!779660 m!723649))

(assert (=> b!779660 m!723641))

(declare-fun m!723651 () Bool)

(assert (=> b!779660 m!723651))

(assert (=> b!779669 m!723641))

(assert (=> b!779669 m!723641))

(declare-fun m!723653 () Bool)

(assert (=> b!779669 m!723653))

(declare-fun m!723655 () Bool)

(assert (=> b!779675 m!723655))

(assert (=> b!779670 m!723641))

(assert (=> b!779670 m!723641))

(declare-fun m!723657 () Bool)

(assert (=> b!779670 m!723657))

(assert (=> b!779659 m!723641))

(assert (=> b!779659 m!723641))

(declare-fun m!723659 () Bool)

(assert (=> b!779659 m!723659))

(assert (=> b!779673 m!723641))

(assert (=> b!779673 m!723641))

(declare-fun m!723661 () Bool)

(assert (=> b!779673 m!723661))

(declare-fun m!723663 () Bool)

(assert (=> b!779676 m!723663))

(declare-fun m!723665 () Bool)

(assert (=> b!779671 m!723665))

(declare-fun m!723667 () Bool)

(assert (=> b!779671 m!723667))

(declare-fun m!723669 () Bool)

(assert (=> b!779665 m!723669))

(declare-fun m!723671 () Bool)

(assert (=> start!67474 m!723671))

(declare-fun m!723673 () Bool)

(assert (=> start!67474 m!723673))

(assert (=> b!779672 m!723641))

(assert (=> b!779672 m!723641))

(assert (=> b!779672 m!723661))

(declare-fun m!723675 () Bool)

(assert (=> b!779664 m!723675))

(declare-fun m!723677 () Bool)

(assert (=> b!779674 m!723677))

(declare-fun m!723679 () Bool)

(assert (=> b!779674 m!723679))

(declare-fun m!723681 () Bool)

(assert (=> b!779674 m!723681))

(assert (=> b!779674 m!723677))

(declare-fun m!723683 () Bool)

(assert (=> b!779674 m!723683))

(declare-fun m!723685 () Bool)

(assert (=> b!779674 m!723685))

(check-sat (not b!779670) (not b!779663) (not b!779667) (not b!779672) (not b!779660) (not start!67474) (not b!779664) (not b!779665) (not b!779659) (not b!779674) (not b!779676) (not b!779669) (not b!779671) (not b!779668) (not b!779673))
(check-sat)
