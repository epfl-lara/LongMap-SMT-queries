; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64630 () Bool)

(assert start!64630)

(declare-fun res!488367 () Bool)

(declare-fun e!407427 () Bool)

(assert (=> start!64630 (=> (not res!488367) (not e!407427))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64630 (= res!488367 (validMask!0 mask!3328))))

(assert (=> start!64630 e!407427))

(assert (=> start!64630 true))

(declare-datatypes ((array!41079 0))(
  ( (array!41080 (arr!19659 (Array (_ BitVec 32) (_ BitVec 64))) (size!20080 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41079)

(declare-fun array_inv!15455 (array!41079) Bool)

(assert (=> start!64630 (array_inv!15455 a!3186)))

(declare-fun b!727768 () Bool)

(declare-fun res!488361 () Bool)

(declare-fun e!407429 () Bool)

(assert (=> b!727768 (=> (not res!488361) (not e!407429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41079 (_ BitVec 32)) Bool)

(assert (=> b!727768 (= res!488361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727769 () Bool)

(declare-fun res!488366 () Bool)

(assert (=> b!727769 (=> (not res!488366) (not e!407427))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727769 (= res!488366 (validKeyInArray!0 (select (arr!19659 a!3186) j!159)))))

(declare-fun b!727770 () Bool)

(declare-fun e!407428 () Bool)

(declare-fun e!407432 () Bool)

(assert (=> b!727770 (= e!407428 e!407432)))

(declare-fun res!488372 () Bool)

(assert (=> b!727770 (=> (not res!488372) (not e!407432))))

(declare-datatypes ((SeekEntryResult!7259 0))(
  ( (MissingZero!7259 (index!31404 (_ BitVec 32))) (Found!7259 (index!31405 (_ BitVec 32))) (Intermediate!7259 (undefined!8071 Bool) (index!31406 (_ BitVec 32)) (x!62401 (_ BitVec 32))) (Undefined!7259) (MissingVacant!7259 (index!31407 (_ BitVec 32))) )
))
(declare-fun lt!322332 () SeekEntryResult!7259)

(declare-fun lt!322326 () SeekEntryResult!7259)

(assert (=> b!727770 (= res!488372 (= lt!322332 lt!322326))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322330 () array!41079)

(declare-fun lt!322328 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41079 (_ BitVec 32)) SeekEntryResult!7259)

(assert (=> b!727770 (= lt!322326 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322328 lt!322330 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727770 (= lt!322332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322328 mask!3328) lt!322328 lt!322330 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!727770 (= lt!322328 (select (store (arr!19659 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727770 (= lt!322330 (array!41080 (store (arr!19659 a!3186) i!1173 k!2102) (size!20080 a!3186)))))

(declare-fun b!727771 () Bool)

(declare-fun res!488362 () Bool)

(assert (=> b!727771 (=> (not res!488362) (not e!407428))))

(declare-fun e!407431 () Bool)

(assert (=> b!727771 (= res!488362 e!407431)))

(declare-fun c!80080 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727771 (= c!80080 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727772 () Bool)

(declare-fun e!407430 () Bool)

(declare-fun e!407433 () Bool)

(assert (=> b!727772 (= e!407430 e!407433)))

(declare-fun res!488368 () Bool)

(assert (=> b!727772 (=> (not res!488368) (not e!407433))))

(declare-fun lt!322329 () SeekEntryResult!7259)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41079 (_ BitVec 32)) SeekEntryResult!7259)

(assert (=> b!727772 (= res!488368 (= (seekEntryOrOpen!0 (select (arr!19659 a!3186) j!159) a!3186 mask!3328) lt!322329))))

(assert (=> b!727772 (= lt!322329 (Found!7259 j!159))))

(declare-fun b!727773 () Bool)

(declare-fun e!407434 () Bool)

(assert (=> b!727773 (= e!407432 (not e!407434))))

(declare-fun res!488365 () Bool)

(assert (=> b!727773 (=> res!488365 e!407434)))

(assert (=> b!727773 (= res!488365 (or (not (is-Intermediate!7259 lt!322326)) (bvsge x!1131 (x!62401 lt!322326))))))

(assert (=> b!727773 e!407430))

(declare-fun res!488358 () Bool)

(assert (=> b!727773 (=> (not res!488358) (not e!407430))))

(assert (=> b!727773 (= res!488358 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24836 0))(
  ( (Unit!24837) )
))
(declare-fun lt!322333 () Unit!24836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24836)

(assert (=> b!727773 (= lt!322333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727774 () Bool)

(declare-fun lt!322327 () (_ BitVec 32))

(assert (=> b!727774 (= e!407434 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!322327 #b00000000000000000000000000000000) (bvsge lt!322327 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727774 (= lt!322327 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727775 () Bool)

(declare-fun res!488364 () Bool)

(assert (=> b!727775 (=> (not res!488364) (not e!407429))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727775 (= res!488364 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20080 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20080 a!3186))))))

(declare-fun b!727776 () Bool)

(assert (=> b!727776 (= e!407427 e!407429)))

(declare-fun res!488370 () Bool)

(assert (=> b!727776 (=> (not res!488370) (not e!407429))))

(declare-fun lt!322334 () SeekEntryResult!7259)

(assert (=> b!727776 (= res!488370 (or (= lt!322334 (MissingZero!7259 i!1173)) (= lt!322334 (MissingVacant!7259 i!1173))))))

(assert (=> b!727776 (= lt!322334 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!727777 () Bool)

(assert (=> b!727777 (= e!407429 e!407428)))

(declare-fun res!488369 () Bool)

(assert (=> b!727777 (=> (not res!488369) (not e!407428))))

(declare-fun lt!322331 () SeekEntryResult!7259)

(assert (=> b!727777 (= res!488369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19659 a!3186) j!159) mask!3328) (select (arr!19659 a!3186) j!159) a!3186 mask!3328) lt!322331))))

(assert (=> b!727777 (= lt!322331 (Intermediate!7259 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727778 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41079 (_ BitVec 32)) SeekEntryResult!7259)

(assert (=> b!727778 (= e!407431 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19659 a!3186) j!159) a!3186 mask!3328) (Found!7259 j!159)))))

(declare-fun b!727779 () Bool)

(declare-fun res!488371 () Bool)

(assert (=> b!727779 (=> (not res!488371) (not e!407427))))

(assert (=> b!727779 (= res!488371 (validKeyInArray!0 k!2102))))

(declare-fun b!727780 () Bool)

(declare-fun res!488359 () Bool)

(assert (=> b!727780 (=> (not res!488359) (not e!407429))))

(declare-datatypes ((List!13661 0))(
  ( (Nil!13658) (Cons!13657 (h!14717 (_ BitVec 64)) (t!19976 List!13661)) )
))
(declare-fun arrayNoDuplicates!0 (array!41079 (_ BitVec 32) List!13661) Bool)

(assert (=> b!727780 (= res!488359 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13658))))

(declare-fun b!727781 () Bool)

(declare-fun res!488357 () Bool)

(assert (=> b!727781 (=> (not res!488357) (not e!407427))))

(declare-fun arrayContainsKey!0 (array!41079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727781 (= res!488357 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727782 () Bool)

(declare-fun res!488360 () Bool)

(assert (=> b!727782 (=> (not res!488360) (not e!407428))))

(assert (=> b!727782 (= res!488360 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19659 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727783 () Bool)

(assert (=> b!727783 (= e!407433 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19659 a!3186) j!159) a!3186 mask!3328) lt!322329))))

(declare-fun b!727784 () Bool)

(declare-fun res!488363 () Bool)

(assert (=> b!727784 (=> (not res!488363) (not e!407427))))

(assert (=> b!727784 (= res!488363 (and (= (size!20080 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20080 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20080 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727785 () Bool)

(assert (=> b!727785 (= e!407431 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19659 a!3186) j!159) a!3186 mask!3328) lt!322331))))

(assert (= (and start!64630 res!488367) b!727784))

(assert (= (and b!727784 res!488363) b!727769))

(assert (= (and b!727769 res!488366) b!727779))

(assert (= (and b!727779 res!488371) b!727781))

(assert (= (and b!727781 res!488357) b!727776))

(assert (= (and b!727776 res!488370) b!727768))

(assert (= (and b!727768 res!488361) b!727780))

(assert (= (and b!727780 res!488359) b!727775))

(assert (= (and b!727775 res!488364) b!727777))

(assert (= (and b!727777 res!488369) b!727782))

(assert (= (and b!727782 res!488360) b!727771))

(assert (= (and b!727771 c!80080) b!727785))

(assert (= (and b!727771 (not c!80080)) b!727778))

(assert (= (and b!727771 res!488362) b!727770))

(assert (= (and b!727770 res!488372) b!727773))

(assert (= (and b!727773 res!488358) b!727772))

(assert (= (and b!727772 res!488368) b!727783))

(assert (= (and b!727773 (not res!488365)) b!727774))

(declare-fun m!681595 () Bool)

(assert (=> b!727769 m!681595))

(assert (=> b!727769 m!681595))

(declare-fun m!681597 () Bool)

(assert (=> b!727769 m!681597))

(assert (=> b!727778 m!681595))

(assert (=> b!727778 m!681595))

(declare-fun m!681599 () Bool)

(assert (=> b!727778 m!681599))

(declare-fun m!681601 () Bool)

(assert (=> b!727773 m!681601))

(declare-fun m!681603 () Bool)

(assert (=> b!727773 m!681603))

(assert (=> b!727783 m!681595))

(assert (=> b!727783 m!681595))

(declare-fun m!681605 () Bool)

(assert (=> b!727783 m!681605))

(declare-fun m!681607 () Bool)

(assert (=> b!727782 m!681607))

(declare-fun m!681609 () Bool)

(assert (=> b!727770 m!681609))

(declare-fun m!681611 () Bool)

(assert (=> b!727770 m!681611))

(assert (=> b!727770 m!681609))

(declare-fun m!681613 () Bool)

(assert (=> b!727770 m!681613))

(declare-fun m!681615 () Bool)

(assert (=> b!727770 m!681615))

(declare-fun m!681617 () Bool)

(assert (=> b!727770 m!681617))

(assert (=> b!727777 m!681595))

(assert (=> b!727777 m!681595))

(declare-fun m!681619 () Bool)

(assert (=> b!727777 m!681619))

(assert (=> b!727777 m!681619))

(assert (=> b!727777 m!681595))

(declare-fun m!681621 () Bool)

(assert (=> b!727777 m!681621))

(declare-fun m!681623 () Bool)

(assert (=> b!727774 m!681623))

(declare-fun m!681625 () Bool)

(assert (=> b!727768 m!681625))

(declare-fun m!681627 () Bool)

(assert (=> b!727776 m!681627))

(declare-fun m!681629 () Bool)

(assert (=> b!727781 m!681629))

(declare-fun m!681631 () Bool)

(assert (=> start!64630 m!681631))

(declare-fun m!681633 () Bool)

(assert (=> start!64630 m!681633))

(assert (=> b!727772 m!681595))

(assert (=> b!727772 m!681595))

(declare-fun m!681635 () Bool)

(assert (=> b!727772 m!681635))

(declare-fun m!681637 () Bool)

(assert (=> b!727779 m!681637))

(assert (=> b!727785 m!681595))

(assert (=> b!727785 m!681595))

(declare-fun m!681639 () Bool)

(assert (=> b!727785 m!681639))

(declare-fun m!681641 () Bool)

(assert (=> b!727780 m!681641))

(push 1)

