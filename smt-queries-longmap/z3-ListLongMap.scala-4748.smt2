; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65550 () Bool)

(assert start!65550)

(declare-fun b!748549 () Bool)

(declare-fun res!504966 () Bool)

(declare-fun e!417793 () Bool)

(assert (=> b!748549 (=> (not res!504966) (not e!417793))))

(declare-datatypes ((array!41723 0))(
  ( (array!41724 (arr!19975 (Array (_ BitVec 32) (_ BitVec 64))) (size!20396 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41723)

(declare-datatypes ((List!13977 0))(
  ( (Nil!13974) (Cons!13973 (h!15045 (_ BitVec 64)) (t!20292 List!13977)) )
))
(declare-fun arrayNoDuplicates!0 (array!41723 (_ BitVec 32) List!13977) Bool)

(assert (=> b!748549 (= res!504966 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13974))))

(declare-fun b!748550 () Bool)

(declare-fun e!417787 () Bool)

(declare-fun e!417790 () Bool)

(assert (=> b!748550 (= e!417787 e!417790)))

(declare-fun res!504968 () Bool)

(assert (=> b!748550 (=> (not res!504968) (not e!417790))))

(declare-datatypes ((SeekEntryResult!7575 0))(
  ( (MissingZero!7575 (index!32668 (_ BitVec 32))) (Found!7575 (index!32669 (_ BitVec 32))) (Intermediate!7575 (undefined!8387 Bool) (index!32670 (_ BitVec 32)) (x!63605 (_ BitVec 32))) (Undefined!7575) (MissingVacant!7575 (index!32671 (_ BitVec 32))) )
))
(declare-fun lt!332764 () SeekEntryResult!7575)

(declare-fun lt!332756 () SeekEntryResult!7575)

(assert (=> b!748550 (= res!504968 (= lt!332764 lt!332756))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!332757 () array!41723)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!332758 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41723 (_ BitVec 32)) SeekEntryResult!7575)

(assert (=> b!748550 (= lt!332756 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332758 lt!332757 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748550 (= lt!332764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332758 mask!3328) lt!332758 lt!332757 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748550 (= lt!332758 (select (store (arr!19975 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748550 (= lt!332757 (array!41724 (store (arr!19975 a!3186) i!1173 k0!2102) (size!20396 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!417791 () Bool)

(declare-fun b!748551 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41723 (_ BitVec 32)) SeekEntryResult!7575)

(assert (=> b!748551 (= e!417791 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) (Found!7575 j!159)))))

(declare-fun b!748552 () Bool)

(declare-fun res!504963 () Bool)

(declare-fun e!417788 () Bool)

(assert (=> b!748552 (=> (not res!504963) (not e!417788))))

(declare-fun arrayContainsKey!0 (array!41723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748552 (= res!504963 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748553 () Bool)

(declare-fun res!504957 () Bool)

(assert (=> b!748553 (=> (not res!504957) (not e!417793))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748553 (= res!504957 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20396 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20396 a!3186))))))

(declare-fun b!748554 () Bool)

(declare-fun res!504965 () Bool)

(assert (=> b!748554 (=> (not res!504965) (not e!417793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41723 (_ BitVec 32)) Bool)

(assert (=> b!748554 (= res!504965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!332761 () SeekEntryResult!7575)

(declare-fun e!417789 () Bool)

(declare-fun b!748555 () Bool)

(assert (=> b!748555 (= e!417789 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!332761))))

(declare-fun b!748557 () Bool)

(declare-fun e!417786 () Bool)

(assert (=> b!748557 (= e!417790 (not e!417786))))

(declare-fun res!504955 () Bool)

(assert (=> b!748557 (=> res!504955 e!417786)))

(get-info :version)

(assert (=> b!748557 (= res!504955 (or (not ((_ is Intermediate!7575) lt!332756)) (bvslt x!1131 (x!63605 lt!332756)) (not (= x!1131 (x!63605 lt!332756))) (not (= index!1321 (index!32670 lt!332756)))))))

(assert (=> b!748557 e!417789))

(declare-fun res!504962 () Bool)

(assert (=> b!748557 (=> (not res!504962) (not e!417789))))

(declare-fun lt!332760 () SeekEntryResult!7575)

(assert (=> b!748557 (= res!504962 (= lt!332760 lt!332761))))

(assert (=> b!748557 (= lt!332761 (Found!7575 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41723 (_ BitVec 32)) SeekEntryResult!7575)

(assert (=> b!748557 (= lt!332760 (seekEntryOrOpen!0 (select (arr!19975 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748557 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25680 0))(
  ( (Unit!25681) )
))
(declare-fun lt!332759 () Unit!25680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25680)

(assert (=> b!748557 (= lt!332759 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748558 () Bool)

(declare-fun e!417792 () Unit!25680)

(declare-fun Unit!25682 () Unit!25680)

(assert (=> b!748558 (= e!417792 Unit!25682)))

(assert (=> b!748558 false))

(declare-fun b!748559 () Bool)

(declare-fun res!504956 () Bool)

(assert (=> b!748559 (=> (not res!504956) (not e!417788))))

(assert (=> b!748559 (= res!504956 (and (= (size!20396 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20396 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20396 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748560 () Bool)

(declare-fun Unit!25683 () Unit!25680)

(assert (=> b!748560 (= e!417792 Unit!25683)))

(declare-fun b!748561 () Bool)

(declare-fun res!504960 () Bool)

(assert (=> b!748561 (=> res!504960 e!417786)))

(assert (=> b!748561 (= res!504960 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!332761)))))

(declare-fun b!748562 () Bool)

(declare-fun res!504964 () Bool)

(assert (=> b!748562 (=> (not res!504964) (not e!417787))))

(assert (=> b!748562 (= res!504964 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19975 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748563 () Bool)

(assert (=> b!748563 (= e!417793 e!417787)))

(declare-fun res!504952 () Bool)

(assert (=> b!748563 (=> (not res!504952) (not e!417787))))

(declare-fun lt!332765 () SeekEntryResult!7575)

(assert (=> b!748563 (= res!504952 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19975 a!3186) j!159) mask!3328) (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!332765))))

(assert (=> b!748563 (= lt!332765 (Intermediate!7575 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748564 () Bool)

(declare-fun res!504961 () Bool)

(assert (=> b!748564 (=> (not res!504961) (not e!417788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748564 (= res!504961 (validKeyInArray!0 (select (arr!19975 a!3186) j!159)))))

(declare-fun b!748565 () Bool)

(declare-fun res!504958 () Bool)

(assert (=> b!748565 (=> (not res!504958) (not e!417787))))

(assert (=> b!748565 (= res!504958 e!417791)))

(declare-fun c!82180 () Bool)

(assert (=> b!748565 (= c!82180 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748566 () Bool)

(declare-fun res!504967 () Bool)

(assert (=> b!748566 (=> (not res!504967) (not e!417788))))

(assert (=> b!748566 (= res!504967 (validKeyInArray!0 k0!2102))))

(declare-fun b!748567 () Bool)

(assert (=> b!748567 (= e!417791 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!332765))))

(declare-fun res!504953 () Bool)

(assert (=> start!65550 (=> (not res!504953) (not e!417788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65550 (= res!504953 (validMask!0 mask!3328))))

(assert (=> start!65550 e!417788))

(assert (=> start!65550 true))

(declare-fun array_inv!15771 (array!41723) Bool)

(assert (=> start!65550 (array_inv!15771 a!3186)))

(declare-fun b!748556 () Bool)

(declare-fun res!504954 () Bool)

(assert (=> b!748556 (=> res!504954 e!417786)))

(assert (=> b!748556 (= res!504954 (= (select (store (arr!19975 a!3186) i!1173 k0!2102) index!1321) lt!332758))))

(declare-fun b!748568 () Bool)

(assert (=> b!748568 (= e!417786 true)))

(assert (=> b!748568 (= (select (store (arr!19975 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332762 () Unit!25680)

(assert (=> b!748568 (= lt!332762 e!417792)))

(declare-fun c!82179 () Bool)

(assert (=> b!748568 (= c!82179 (= (select (store (arr!19975 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748569 () Bool)

(assert (=> b!748569 (= e!417788 e!417793)))

(declare-fun res!504959 () Bool)

(assert (=> b!748569 (=> (not res!504959) (not e!417793))))

(declare-fun lt!332763 () SeekEntryResult!7575)

(assert (=> b!748569 (= res!504959 (or (= lt!332763 (MissingZero!7575 i!1173)) (= lt!332763 (MissingVacant!7575 i!1173))))))

(assert (=> b!748569 (= lt!332763 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65550 res!504953) b!748559))

(assert (= (and b!748559 res!504956) b!748564))

(assert (= (and b!748564 res!504961) b!748566))

(assert (= (and b!748566 res!504967) b!748552))

(assert (= (and b!748552 res!504963) b!748569))

(assert (= (and b!748569 res!504959) b!748554))

(assert (= (and b!748554 res!504965) b!748549))

(assert (= (and b!748549 res!504966) b!748553))

(assert (= (and b!748553 res!504957) b!748563))

(assert (= (and b!748563 res!504952) b!748562))

(assert (= (and b!748562 res!504964) b!748565))

(assert (= (and b!748565 c!82180) b!748567))

(assert (= (and b!748565 (not c!82180)) b!748551))

(assert (= (and b!748565 res!504958) b!748550))

(assert (= (and b!748550 res!504968) b!748557))

(assert (= (and b!748557 res!504962) b!748555))

(assert (= (and b!748557 (not res!504955)) b!748561))

(assert (= (and b!748561 (not res!504960)) b!748556))

(assert (= (and b!748556 (not res!504954)) b!748568))

(assert (= (and b!748568 c!82179) b!748558))

(assert (= (and b!748568 (not c!82179)) b!748560))

(declare-fun m!698365 () Bool)

(assert (=> b!748550 m!698365))

(declare-fun m!698367 () Bool)

(assert (=> b!748550 m!698367))

(declare-fun m!698369 () Bool)

(assert (=> b!748550 m!698369))

(declare-fun m!698371 () Bool)

(assert (=> b!748550 m!698371))

(assert (=> b!748550 m!698365))

(declare-fun m!698373 () Bool)

(assert (=> b!748550 m!698373))

(assert (=> b!748568 m!698369))

(declare-fun m!698375 () Bool)

(assert (=> b!748568 m!698375))

(assert (=> b!748556 m!698369))

(assert (=> b!748556 m!698375))

(declare-fun m!698377 () Bool)

(assert (=> b!748567 m!698377))

(assert (=> b!748567 m!698377))

(declare-fun m!698379 () Bool)

(assert (=> b!748567 m!698379))

(assert (=> b!748564 m!698377))

(assert (=> b!748564 m!698377))

(declare-fun m!698381 () Bool)

(assert (=> b!748564 m!698381))

(assert (=> b!748557 m!698377))

(assert (=> b!748557 m!698377))

(declare-fun m!698383 () Bool)

(assert (=> b!748557 m!698383))

(declare-fun m!698385 () Bool)

(assert (=> b!748557 m!698385))

(declare-fun m!698387 () Bool)

(assert (=> b!748557 m!698387))

(declare-fun m!698389 () Bool)

(assert (=> b!748554 m!698389))

(declare-fun m!698391 () Bool)

(assert (=> b!748552 m!698391))

(assert (=> b!748555 m!698377))

(assert (=> b!748555 m!698377))

(declare-fun m!698393 () Bool)

(assert (=> b!748555 m!698393))

(assert (=> b!748563 m!698377))

(assert (=> b!748563 m!698377))

(declare-fun m!698395 () Bool)

(assert (=> b!748563 m!698395))

(assert (=> b!748563 m!698395))

(assert (=> b!748563 m!698377))

(declare-fun m!698397 () Bool)

(assert (=> b!748563 m!698397))

(declare-fun m!698399 () Bool)

(assert (=> b!748569 m!698399))

(assert (=> b!748561 m!698377))

(assert (=> b!748561 m!698377))

(declare-fun m!698401 () Bool)

(assert (=> b!748561 m!698401))

(declare-fun m!698403 () Bool)

(assert (=> b!748562 m!698403))

(declare-fun m!698405 () Bool)

(assert (=> start!65550 m!698405))

(declare-fun m!698407 () Bool)

(assert (=> start!65550 m!698407))

(assert (=> b!748551 m!698377))

(assert (=> b!748551 m!698377))

(assert (=> b!748551 m!698401))

(declare-fun m!698409 () Bool)

(assert (=> b!748566 m!698409))

(declare-fun m!698411 () Bool)

(assert (=> b!748549 m!698411))

(check-sat (not b!748561) (not b!748567) (not b!748557) (not b!748569) (not b!748563) (not b!748554) (not b!748564) (not b!748555) (not b!748552) (not b!748551) (not start!65550) (not b!748549) (not b!748550) (not b!748566))
(check-sat)
