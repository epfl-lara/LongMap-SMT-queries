; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65828 () Bool)

(assert start!65828)

(declare-fun b!758399 () Bool)

(declare-fun res!513161 () Bool)

(declare-fun e!422809 () Bool)

(assert (=> b!758399 (=> (not res!513161) (not e!422809))))

(declare-datatypes ((array!42018 0))(
  ( (array!42019 (arr!20123 (Array (_ BitVec 32) (_ BitVec 64))) (size!20544 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42018)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!758399 (= res!513161 (and (= (size!20544 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20544 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20544 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758400 () Bool)

(declare-fun res!513154 () Bool)

(declare-fun e!422806 () Bool)

(assert (=> b!758400 (=> (not res!513154) (not e!422806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42018 (_ BitVec 32)) Bool)

(assert (=> b!758400 (= res!513154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758401 () Bool)

(declare-fun res!513162 () Bool)

(assert (=> b!758401 (=> (not res!513162) (not e!422809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758401 (= res!513162 (validKeyInArray!0 (select (arr!20123 a!3186) j!159)))))

(declare-fun b!758402 () Bool)

(declare-fun res!513168 () Bool)

(assert (=> b!758402 (=> (not res!513168) (not e!422809))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758402 (= res!513168 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758403 () Bool)

(declare-fun e!422811 () Bool)

(declare-fun e!422804 () Bool)

(assert (=> b!758403 (= e!422811 e!422804)))

(declare-fun res!513159 () Bool)

(assert (=> b!758403 (=> res!513159 e!422804)))

(declare-datatypes ((SeekEntryResult!7720 0))(
  ( (MissingZero!7720 (index!33248 (_ BitVec 32))) (Found!7720 (index!33249 (_ BitVec 32))) (Intermediate!7720 (undefined!8532 Bool) (index!33250 (_ BitVec 32)) (x!64145 (_ BitVec 32))) (Undefined!7720) (MissingVacant!7720 (index!33251 (_ BitVec 32))) )
))
(declare-fun lt!337783 () SeekEntryResult!7720)

(declare-fun lt!337784 () SeekEntryResult!7720)

(assert (=> b!758403 (= res!513159 (not (= lt!337783 lt!337784)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42018 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!758403 (= lt!337783 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20123 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758404 () Bool)

(declare-fun e!422815 () Bool)

(declare-fun e!422810 () Bool)

(assert (=> b!758404 (= e!422815 e!422810)))

(declare-fun res!513160 () Bool)

(assert (=> b!758404 (=> (not res!513160) (not e!422810))))

(declare-fun lt!337772 () SeekEntryResult!7720)

(declare-fun lt!337781 () SeekEntryResult!7720)

(assert (=> b!758404 (= res!513160 (= lt!337772 lt!337781))))

(declare-fun lt!337778 () array!42018)

(declare-fun lt!337776 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42018 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!758404 (= lt!337781 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337776 lt!337778 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758404 (= lt!337772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337776 mask!3328) lt!337776 lt!337778 mask!3328))))

(assert (=> b!758404 (= lt!337776 (select (store (arr!20123 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758404 (= lt!337778 (array!42019 (store (arr!20123 a!3186) i!1173 k0!2102) (size!20544 a!3186)))))

(declare-fun b!758405 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!422812 () Bool)

(assert (=> b!758405 (= e!422812 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20123 a!3186) j!159) a!3186 mask!3328) lt!337784))))

(declare-fun b!758406 () Bool)

(declare-fun res!513171 () Bool)

(assert (=> b!758406 (=> (not res!513171) (not e!422806))))

(assert (=> b!758406 (= res!513171 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20544 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20544 a!3186))))))

(declare-fun b!758407 () Bool)

(declare-fun e!422813 () Bool)

(assert (=> b!758407 (= e!422804 e!422813)))

(declare-fun res!513166 () Bool)

(assert (=> b!758407 (=> res!513166 e!422813)))

(declare-fun lt!337777 () (_ BitVec 64))

(assert (=> b!758407 (= res!513166 (= lt!337777 lt!337776))))

(assert (=> b!758407 (= lt!337777 (select (store (arr!20123 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758408 () Bool)

(declare-fun e!422807 () Bool)

(assert (=> b!758408 (= e!422807 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20123 a!3186) j!159) a!3186 mask!3328) (Found!7720 j!159)))))

(declare-fun b!758409 () Bool)

(assert (=> b!758409 (= e!422810 (not e!422811))))

(declare-fun res!513155 () Bool)

(assert (=> b!758409 (=> res!513155 e!422811)))

(get-info :version)

(assert (=> b!758409 (= res!513155 (or (not ((_ is Intermediate!7720) lt!337781)) (bvslt x!1131 (x!64145 lt!337781)) (not (= x!1131 (x!64145 lt!337781))) (not (= index!1321 (index!33250 lt!337781)))))))

(assert (=> b!758409 e!422812))

(declare-fun res!513165 () Bool)

(assert (=> b!758409 (=> (not res!513165) (not e!422812))))

(declare-fun lt!337773 () SeekEntryResult!7720)

(assert (=> b!758409 (= res!513165 (= lt!337773 lt!337784))))

(assert (=> b!758409 (= lt!337784 (Found!7720 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42018 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!758409 (= lt!337773 (seekEntryOrOpen!0 (select (arr!20123 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758409 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26240 0))(
  ( (Unit!26241) )
))
(declare-fun lt!337774 () Unit!26240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26240)

(assert (=> b!758409 (= lt!337774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758410 () Bool)

(declare-fun res!513169 () Bool)

(assert (=> b!758410 (=> (not res!513169) (not e!422809))))

(assert (=> b!758410 (= res!513169 (validKeyInArray!0 k0!2102))))

(declare-fun b!758411 () Bool)

(declare-fun res!513167 () Bool)

(assert (=> b!758411 (=> (not res!513167) (not e!422815))))

(assert (=> b!758411 (= res!513167 e!422807)))

(declare-fun c!83004 () Bool)

(assert (=> b!758411 (= c!83004 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758413 () Bool)

(assert (=> b!758413 (= e!422806 e!422815)))

(declare-fun res!513156 () Bool)

(assert (=> b!758413 (=> (not res!513156) (not e!422815))))

(declare-fun lt!337782 () SeekEntryResult!7720)

(assert (=> b!758413 (= res!513156 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20123 a!3186) j!159) mask!3328) (select (arr!20123 a!3186) j!159) a!3186 mask!3328) lt!337782))))

(assert (=> b!758413 (= lt!337782 (Intermediate!7720 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758414 () Bool)

(declare-fun e!422814 () Bool)

(assert (=> b!758414 (= e!422814 true)))

(declare-fun lt!337771 () SeekEntryResult!7720)

(assert (=> b!758414 (= lt!337771 lt!337783)))

(declare-fun lt!337775 () Unit!26240)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42018 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26240)

(assert (=> b!758414 (= lt!337775 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758415 () Bool)

(assert (=> b!758415 (= e!422809 e!422806)))

(declare-fun res!513157 () Bool)

(assert (=> b!758415 (=> (not res!513157) (not e!422806))))

(declare-fun lt!337780 () SeekEntryResult!7720)

(assert (=> b!758415 (= res!513157 (or (= lt!337780 (MissingZero!7720 i!1173)) (= lt!337780 (MissingVacant!7720 i!1173))))))

(assert (=> b!758415 (= lt!337780 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758416 () Bool)

(assert (=> b!758416 (= e!422813 e!422814)))

(declare-fun res!513170 () Bool)

(assert (=> b!758416 (=> res!513170 e!422814)))

(assert (=> b!758416 (= res!513170 (or (not (= (select (arr!20123 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337770 () SeekEntryResult!7720)

(assert (=> b!758416 (and (= lt!337770 lt!337771) (= lt!337773 lt!337783))))

(assert (=> b!758416 (= lt!337771 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337776 lt!337778 mask!3328))))

(assert (=> b!758416 (= lt!337770 (seekEntryOrOpen!0 lt!337776 lt!337778 mask!3328))))

(assert (=> b!758416 (= lt!337777 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337779 () Unit!26240)

(declare-fun e!422805 () Unit!26240)

(assert (=> b!758416 (= lt!337779 e!422805)))

(declare-fun c!83003 () Bool)

(assert (=> b!758416 (= c!83003 (= lt!337777 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758417 () Bool)

(assert (=> b!758417 (= e!422807 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20123 a!3186) j!159) a!3186 mask!3328) lt!337782))))

(declare-fun b!758418 () Bool)

(declare-fun res!513164 () Bool)

(assert (=> b!758418 (=> (not res!513164) (not e!422806))))

(declare-datatypes ((List!14164 0))(
  ( (Nil!14161) (Cons!14160 (h!15232 (_ BitVec 64)) (t!20470 List!14164)) )
))
(declare-fun arrayNoDuplicates!0 (array!42018 (_ BitVec 32) List!14164) Bool)

(assert (=> b!758418 (= res!513164 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14161))))

(declare-fun b!758419 () Bool)

(declare-fun Unit!26242 () Unit!26240)

(assert (=> b!758419 (= e!422805 Unit!26242)))

(declare-fun b!758420 () Bool)

(declare-fun res!513158 () Bool)

(assert (=> b!758420 (=> (not res!513158) (not e!422815))))

(assert (=> b!758420 (= res!513158 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20123 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!513163 () Bool)

(assert (=> start!65828 (=> (not res!513163) (not e!422809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65828 (= res!513163 (validMask!0 mask!3328))))

(assert (=> start!65828 e!422809))

(assert (=> start!65828 true))

(declare-fun array_inv!16006 (array!42018) Bool)

(assert (=> start!65828 (array_inv!16006 a!3186)))

(declare-fun b!758412 () Bool)

(declare-fun Unit!26243 () Unit!26240)

(assert (=> b!758412 (= e!422805 Unit!26243)))

(assert (=> b!758412 false))

(assert (= (and start!65828 res!513163) b!758399))

(assert (= (and b!758399 res!513161) b!758401))

(assert (= (and b!758401 res!513162) b!758410))

(assert (= (and b!758410 res!513169) b!758402))

(assert (= (and b!758402 res!513168) b!758415))

(assert (= (and b!758415 res!513157) b!758400))

(assert (= (and b!758400 res!513154) b!758418))

(assert (= (and b!758418 res!513164) b!758406))

(assert (= (and b!758406 res!513171) b!758413))

(assert (= (and b!758413 res!513156) b!758420))

(assert (= (and b!758420 res!513158) b!758411))

(assert (= (and b!758411 c!83004) b!758417))

(assert (= (and b!758411 (not c!83004)) b!758408))

(assert (= (and b!758411 res!513167) b!758404))

(assert (= (and b!758404 res!513160) b!758409))

(assert (= (and b!758409 res!513165) b!758405))

(assert (= (and b!758409 (not res!513155)) b!758403))

(assert (= (and b!758403 (not res!513159)) b!758407))

(assert (= (and b!758407 (not res!513166)) b!758416))

(assert (= (and b!758416 c!83003) b!758412))

(assert (= (and b!758416 (not c!83003)) b!758419))

(assert (= (and b!758416 (not res!513170)) b!758414))

(declare-fun m!705341 () Bool)

(assert (=> b!758410 m!705341))

(declare-fun m!705343 () Bool)

(assert (=> b!758416 m!705343))

(declare-fun m!705345 () Bool)

(assert (=> b!758416 m!705345))

(declare-fun m!705347 () Bool)

(assert (=> b!758416 m!705347))

(declare-fun m!705349 () Bool)

(assert (=> b!758408 m!705349))

(assert (=> b!758408 m!705349))

(declare-fun m!705351 () Bool)

(assert (=> b!758408 m!705351))

(declare-fun m!705353 () Bool)

(assert (=> b!758418 m!705353))

(declare-fun m!705355 () Bool)

(assert (=> start!65828 m!705355))

(declare-fun m!705357 () Bool)

(assert (=> start!65828 m!705357))

(assert (=> b!758403 m!705349))

(assert (=> b!758403 m!705349))

(assert (=> b!758403 m!705351))

(declare-fun m!705359 () Bool)

(assert (=> b!758400 m!705359))

(assert (=> b!758401 m!705349))

(assert (=> b!758401 m!705349))

(declare-fun m!705361 () Bool)

(assert (=> b!758401 m!705361))

(declare-fun m!705363 () Bool)

(assert (=> b!758420 m!705363))

(declare-fun m!705365 () Bool)

(assert (=> b!758407 m!705365))

(declare-fun m!705367 () Bool)

(assert (=> b!758407 m!705367))

(assert (=> b!758405 m!705349))

(assert (=> b!758405 m!705349))

(declare-fun m!705369 () Bool)

(assert (=> b!758405 m!705369))

(declare-fun m!705371 () Bool)

(assert (=> b!758414 m!705371))

(declare-fun m!705373 () Bool)

(assert (=> b!758404 m!705373))

(declare-fun m!705375 () Bool)

(assert (=> b!758404 m!705375))

(assert (=> b!758404 m!705365))

(declare-fun m!705377 () Bool)

(assert (=> b!758404 m!705377))

(assert (=> b!758404 m!705373))

(declare-fun m!705379 () Bool)

(assert (=> b!758404 m!705379))

(assert (=> b!758409 m!705349))

(assert (=> b!758409 m!705349))

(declare-fun m!705381 () Bool)

(assert (=> b!758409 m!705381))

(declare-fun m!705383 () Bool)

(assert (=> b!758409 m!705383))

(declare-fun m!705385 () Bool)

(assert (=> b!758409 m!705385))

(assert (=> b!758417 m!705349))

(assert (=> b!758417 m!705349))

(declare-fun m!705387 () Bool)

(assert (=> b!758417 m!705387))

(declare-fun m!705389 () Bool)

(assert (=> b!758415 m!705389))

(declare-fun m!705391 () Bool)

(assert (=> b!758402 m!705391))

(assert (=> b!758413 m!705349))

(assert (=> b!758413 m!705349))

(declare-fun m!705393 () Bool)

(assert (=> b!758413 m!705393))

(assert (=> b!758413 m!705393))

(assert (=> b!758413 m!705349))

(declare-fun m!705395 () Bool)

(assert (=> b!758413 m!705395))

(check-sat (not b!758415) (not b!758408) (not b!758404) (not b!758417) (not b!758401) (not b!758402) (not b!758405) (not b!758403) (not b!758414) (not b!758413) (not b!758416) (not start!65828) (not b!758410) (not b!758400) (not b!758409) (not b!758418))
(check-sat)
