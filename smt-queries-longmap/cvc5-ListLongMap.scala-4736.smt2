; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65476 () Bool)

(assert start!65476)

(declare-fun b!746312 () Bool)

(declare-fun res!503103 () Bool)

(declare-fun e!416783 () Bool)

(assert (=> b!746312 (=> (not res!503103) (not e!416783))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746312 (= res!503103 (validKeyInArray!0 k!2102))))

(declare-fun b!746313 () Bool)

(declare-fun res!503102 () Bool)

(declare-fun e!416785 () Bool)

(assert (=> b!746313 (=> (not res!503102) (not e!416785))))

(declare-fun e!416779 () Bool)

(assert (=> b!746313 (= res!503102 e!416779)))

(declare-fun c!81991 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746313 (= c!81991 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746314 () Bool)

(declare-fun res!503093 () Bool)

(declare-fun e!416786 () Bool)

(assert (=> b!746314 (=> (not res!503093) (not e!416786))))

(declare-datatypes ((array!41649 0))(
  ( (array!41650 (arr!19938 (Array (_ BitVec 32) (_ BitVec 64))) (size!20359 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41649)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41649 (_ BitVec 32)) Bool)

(assert (=> b!746314 (= res!503093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!746315 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7538 0))(
  ( (MissingZero!7538 (index!32520 (_ BitVec 32))) (Found!7538 (index!32521 (_ BitVec 32))) (Intermediate!7538 (undefined!8350 Bool) (index!32522 (_ BitVec 32)) (x!63472 (_ BitVec 32))) (Undefined!7538) (MissingVacant!7538 (index!32523 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41649 (_ BitVec 32)) SeekEntryResult!7538)

(assert (=> b!746315 (= e!416779 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19938 a!3186) j!159) a!3186 mask!3328) (Found!7538 j!159)))))

(declare-fun b!746316 () Bool)

(declare-fun res!503104 () Bool)

(assert (=> b!746316 (=> (not res!503104) (not e!416785))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746316 (= res!503104 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19938 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746317 () Bool)

(declare-fun e!416780 () Bool)

(declare-fun e!416784 () Bool)

(assert (=> b!746317 (= e!416780 e!416784)))

(declare-fun res!503105 () Bool)

(assert (=> b!746317 (=> res!503105 e!416784)))

(declare-fun lt!331646 () (_ BitVec 64))

(declare-fun lt!331652 () SeekEntryResult!7538)

(declare-fun lt!331649 () SeekEntryResult!7538)

(assert (=> b!746317 (= res!503105 (or (not (= lt!331652 lt!331649)) (= (select (store (arr!19938 a!3186) i!1173 k!2102) index!1321) lt!331646) (not (= (select (store (arr!19938 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746317 (= lt!331652 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19938 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!503101 () Bool)

(assert (=> start!65476 (=> (not res!503101) (not e!416783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65476 (= res!503101 (validMask!0 mask!3328))))

(assert (=> start!65476 e!416783))

(assert (=> start!65476 true))

(declare-fun array_inv!15734 (array!41649) Bool)

(assert (=> start!65476 (array_inv!15734 a!3186)))

(declare-fun b!746311 () Bool)

(assert (=> b!746311 (= e!416784 true)))

(declare-fun lt!331655 () SeekEntryResult!7538)

(assert (=> b!746311 (= lt!331655 lt!331652)))

(declare-fun e!416782 () Bool)

(declare-fun b!746318 () Bool)

(assert (=> b!746318 (= e!416782 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19938 a!3186) j!159) a!3186 mask!3328) lt!331649))))

(declare-fun b!746319 () Bool)

(declare-fun e!416781 () Bool)

(assert (=> b!746319 (= e!416785 e!416781)))

(declare-fun res!503095 () Bool)

(assert (=> b!746319 (=> (not res!503095) (not e!416781))))

(declare-fun lt!331650 () SeekEntryResult!7538)

(declare-fun lt!331651 () SeekEntryResult!7538)

(assert (=> b!746319 (= res!503095 (= lt!331650 lt!331651))))

(declare-fun lt!331648 () array!41649)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41649 (_ BitVec 32)) SeekEntryResult!7538)

(assert (=> b!746319 (= lt!331651 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331646 lt!331648 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746319 (= lt!331650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331646 mask!3328) lt!331646 lt!331648 mask!3328))))

(assert (=> b!746319 (= lt!331646 (select (store (arr!19938 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746319 (= lt!331648 (array!41650 (store (arr!19938 a!3186) i!1173 k!2102) (size!20359 a!3186)))))

(declare-fun b!746320 () Bool)

(declare-fun res!503097 () Bool)

(assert (=> b!746320 (=> (not res!503097) (not e!416786))))

(assert (=> b!746320 (= res!503097 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20359 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20359 a!3186))))))

(declare-fun b!746321 () Bool)

(declare-fun res!503094 () Bool)

(assert (=> b!746321 (=> (not res!503094) (not e!416783))))

(assert (=> b!746321 (= res!503094 (validKeyInArray!0 (select (arr!19938 a!3186) j!159)))))

(declare-fun b!746322 () Bool)

(declare-fun res!503099 () Bool)

(assert (=> b!746322 (=> (not res!503099) (not e!416786))))

(declare-datatypes ((List!13940 0))(
  ( (Nil!13937) (Cons!13936 (h!15008 (_ BitVec 64)) (t!20255 List!13940)) )
))
(declare-fun arrayNoDuplicates!0 (array!41649 (_ BitVec 32) List!13940) Bool)

(assert (=> b!746322 (= res!503099 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13937))))

(declare-fun b!746323 () Bool)

(assert (=> b!746323 (= e!416786 e!416785)))

(declare-fun res!503092 () Bool)

(assert (=> b!746323 (=> (not res!503092) (not e!416785))))

(declare-fun lt!331653 () SeekEntryResult!7538)

(assert (=> b!746323 (= res!503092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19938 a!3186) j!159) mask!3328) (select (arr!19938 a!3186) j!159) a!3186 mask!3328) lt!331653))))

(assert (=> b!746323 (= lt!331653 (Intermediate!7538 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746324 () Bool)

(declare-fun res!503100 () Bool)

(assert (=> b!746324 (=> (not res!503100) (not e!416783))))

(declare-fun arrayContainsKey!0 (array!41649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746324 (= res!503100 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746325 () Bool)

(assert (=> b!746325 (= e!416783 e!416786)))

(declare-fun res!503096 () Bool)

(assert (=> b!746325 (=> (not res!503096) (not e!416786))))

(declare-fun lt!331654 () SeekEntryResult!7538)

(assert (=> b!746325 (= res!503096 (or (= lt!331654 (MissingZero!7538 i!1173)) (= lt!331654 (MissingVacant!7538 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41649 (_ BitVec 32)) SeekEntryResult!7538)

(assert (=> b!746325 (= lt!331654 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746326 () Bool)

(assert (=> b!746326 (= e!416781 (not e!416780))))

(declare-fun res!503091 () Bool)

(assert (=> b!746326 (=> res!503091 e!416780)))

(assert (=> b!746326 (= res!503091 (or (not (is-Intermediate!7538 lt!331651)) (bvslt x!1131 (x!63472 lt!331651)) (not (= x!1131 (x!63472 lt!331651))) (not (= index!1321 (index!32522 lt!331651)))))))

(assert (=> b!746326 e!416782))

(declare-fun res!503090 () Bool)

(assert (=> b!746326 (=> (not res!503090) (not e!416782))))

(assert (=> b!746326 (= res!503090 (= lt!331655 lt!331649))))

(assert (=> b!746326 (= lt!331649 (Found!7538 j!159))))

(assert (=> b!746326 (= lt!331655 (seekEntryOrOpen!0 (select (arr!19938 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746326 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25556 0))(
  ( (Unit!25557) )
))
(declare-fun lt!331647 () Unit!25556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25556)

(assert (=> b!746326 (= lt!331647 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746327 () Bool)

(assert (=> b!746327 (= e!416779 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19938 a!3186) j!159) a!3186 mask!3328) lt!331653))))

(declare-fun b!746328 () Bool)

(declare-fun res!503098 () Bool)

(assert (=> b!746328 (=> (not res!503098) (not e!416783))))

(assert (=> b!746328 (= res!503098 (and (= (size!20359 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20359 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20359 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65476 res!503101) b!746328))

(assert (= (and b!746328 res!503098) b!746321))

(assert (= (and b!746321 res!503094) b!746312))

(assert (= (and b!746312 res!503103) b!746324))

(assert (= (and b!746324 res!503100) b!746325))

(assert (= (and b!746325 res!503096) b!746314))

(assert (= (and b!746314 res!503093) b!746322))

(assert (= (and b!746322 res!503099) b!746320))

(assert (= (and b!746320 res!503097) b!746323))

(assert (= (and b!746323 res!503092) b!746316))

(assert (= (and b!746316 res!503104) b!746313))

(assert (= (and b!746313 c!81991) b!746327))

(assert (= (and b!746313 (not c!81991)) b!746315))

(assert (= (and b!746313 res!503102) b!746319))

(assert (= (and b!746319 res!503095) b!746326))

(assert (= (and b!746326 res!503090) b!746318))

(assert (= (and b!746326 (not res!503091)) b!746317))

(assert (= (and b!746317 (not res!503105)) b!746311))

(declare-fun m!696583 () Bool)

(assert (=> b!746325 m!696583))

(declare-fun m!696585 () Bool)

(assert (=> b!746318 m!696585))

(assert (=> b!746318 m!696585))

(declare-fun m!696587 () Bool)

(assert (=> b!746318 m!696587))

(assert (=> b!746327 m!696585))

(assert (=> b!746327 m!696585))

(declare-fun m!696589 () Bool)

(assert (=> b!746327 m!696589))

(declare-fun m!696591 () Bool)

(assert (=> b!746317 m!696591))

(declare-fun m!696593 () Bool)

(assert (=> b!746317 m!696593))

(assert (=> b!746317 m!696585))

(assert (=> b!746317 m!696585))

(declare-fun m!696595 () Bool)

(assert (=> b!746317 m!696595))

(declare-fun m!696597 () Bool)

(assert (=> b!746319 m!696597))

(assert (=> b!746319 m!696591))

(declare-fun m!696599 () Bool)

(assert (=> b!746319 m!696599))

(assert (=> b!746319 m!696599))

(declare-fun m!696601 () Bool)

(assert (=> b!746319 m!696601))

(declare-fun m!696603 () Bool)

(assert (=> b!746319 m!696603))

(declare-fun m!696605 () Bool)

(assert (=> b!746322 m!696605))

(declare-fun m!696607 () Bool)

(assert (=> b!746316 m!696607))

(assert (=> b!746323 m!696585))

(assert (=> b!746323 m!696585))

(declare-fun m!696609 () Bool)

(assert (=> b!746323 m!696609))

(assert (=> b!746323 m!696609))

(assert (=> b!746323 m!696585))

(declare-fun m!696611 () Bool)

(assert (=> b!746323 m!696611))

(declare-fun m!696613 () Bool)

(assert (=> start!65476 m!696613))

(declare-fun m!696615 () Bool)

(assert (=> start!65476 m!696615))

(assert (=> b!746315 m!696585))

(assert (=> b!746315 m!696585))

(assert (=> b!746315 m!696595))

(assert (=> b!746326 m!696585))

(assert (=> b!746326 m!696585))

(declare-fun m!696617 () Bool)

(assert (=> b!746326 m!696617))

(declare-fun m!696619 () Bool)

(assert (=> b!746326 m!696619))

(declare-fun m!696621 () Bool)

(assert (=> b!746326 m!696621))

(declare-fun m!696623 () Bool)

(assert (=> b!746324 m!696623))

(declare-fun m!696625 () Bool)

(assert (=> b!746312 m!696625))

(assert (=> b!746321 m!696585))

(assert (=> b!746321 m!696585))

(declare-fun m!696627 () Bool)

(assert (=> b!746321 m!696627))

(declare-fun m!696629 () Bool)

(assert (=> b!746314 m!696629))

(push 1)

