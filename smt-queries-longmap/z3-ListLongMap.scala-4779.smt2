; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65714 () Bool)

(assert start!65714)

(declare-fun b!754486 () Bool)

(declare-fun res!509928 () Bool)

(declare-fun e!420754 () Bool)

(assert (=> b!754486 (=> (not res!509928) (not e!420754))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41904 0))(
  ( (array!41905 (arr!20066 (Array (_ BitVec 32) (_ BitVec 64))) (size!20487 (_ BitVec 32))) )
))
(declare-fun lt!335663 () array!41904)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335662 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7663 0))(
  ( (MissingZero!7663 (index!33020 (_ BitVec 32))) (Found!7663 (index!33021 (_ BitVec 32))) (Intermediate!7663 (undefined!8475 Bool) (index!33022 (_ BitVec 32)) (x!63936 (_ BitVec 32))) (Undefined!7663) (MissingVacant!7663 (index!33023 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41904 (_ BitVec 32)) SeekEntryResult!7663)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41904 (_ BitVec 32)) SeekEntryResult!7663)

(assert (=> b!754486 (= res!509928 (= (seekEntryOrOpen!0 lt!335662 lt!335663 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335662 lt!335663 mask!3328)))))

(declare-fun res!509943 () Bool)

(declare-fun e!420757 () Bool)

(assert (=> start!65714 (=> (not res!509943) (not e!420757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65714 (= res!509943 (validMask!0 mask!3328))))

(assert (=> start!65714 e!420757))

(assert (=> start!65714 true))

(declare-fun a!3186 () array!41904)

(declare-fun array_inv!15949 (array!41904) Bool)

(assert (=> start!65714 (array_inv!15949 a!3186)))

(declare-fun b!754487 () Bool)

(declare-fun res!509935 () Bool)

(declare-fun e!420758 () Bool)

(assert (=> b!754487 (=> (not res!509935) (not e!420758))))

(declare-fun e!420759 () Bool)

(assert (=> b!754487 (= res!509935 e!420759)))

(declare-fun c!82661 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754487 (= c!82661 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754488 () Bool)

(declare-fun res!509940 () Bool)

(declare-fun e!420761 () Bool)

(assert (=> b!754488 (=> (not res!509940) (not e!420761))))

(declare-datatypes ((List!14107 0))(
  ( (Nil!14104) (Cons!14103 (h!15175 (_ BitVec 64)) (t!20413 List!14107)) )
))
(declare-fun arrayNoDuplicates!0 (array!41904 (_ BitVec 32) List!14107) Bool)

(assert (=> b!754488 (= res!509940 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14104))))

(declare-fun b!754489 () Bool)

(assert (=> b!754489 (= e!420761 e!420758)))

(declare-fun res!509942 () Bool)

(assert (=> b!754489 (=> (not res!509942) (not e!420758))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!335660 () SeekEntryResult!7663)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41904 (_ BitVec 32)) SeekEntryResult!7663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754489 (= res!509942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20066 a!3186) j!159) mask!3328) (select (arr!20066 a!3186) j!159) a!3186 mask!3328) lt!335660))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!754489 (= lt!335660 (Intermediate!7663 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754490 () Bool)

(assert (=> b!754490 (= e!420759 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20066 a!3186) j!159) a!3186 mask!3328) (Found!7663 j!159)))))

(declare-fun b!754491 () Bool)

(declare-fun res!509932 () Bool)

(assert (=> b!754491 (=> (not res!509932) (not e!420761))))

(assert (=> b!754491 (= res!509932 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20487 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20487 a!3186))))))

(declare-fun b!754492 () Bool)

(declare-fun e!420753 () Bool)

(declare-fun e!420763 () Bool)

(assert (=> b!754492 (= e!420753 (not e!420763))))

(declare-fun res!509926 () Bool)

(assert (=> b!754492 (=> res!509926 e!420763)))

(declare-fun lt!335658 () SeekEntryResult!7663)

(get-info :version)

(assert (=> b!754492 (= res!509926 (or (not ((_ is Intermediate!7663) lt!335658)) (bvslt x!1131 (x!63936 lt!335658)) (not (= x!1131 (x!63936 lt!335658))) (not (= index!1321 (index!33022 lt!335658)))))))

(declare-fun e!420756 () Bool)

(assert (=> b!754492 e!420756))

(declare-fun res!509939 () Bool)

(assert (=> b!754492 (=> (not res!509939) (not e!420756))))

(declare-fun lt!335666 () SeekEntryResult!7663)

(declare-fun lt!335659 () SeekEntryResult!7663)

(assert (=> b!754492 (= res!509939 (= lt!335666 lt!335659))))

(assert (=> b!754492 (= lt!335659 (Found!7663 j!159))))

(assert (=> b!754492 (= lt!335666 (seekEntryOrOpen!0 (select (arr!20066 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41904 (_ BitVec 32)) Bool)

(assert (=> b!754492 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26012 0))(
  ( (Unit!26013) )
))
(declare-fun lt!335665 () Unit!26012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26012)

(assert (=> b!754492 (= lt!335665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754493 () Bool)

(declare-fun e!420755 () Bool)

(assert (=> b!754493 (= e!420755 true)))

(assert (=> b!754493 e!420754))

(declare-fun res!509937 () Bool)

(assert (=> b!754493 (=> (not res!509937) (not e!420754))))

(declare-fun lt!335664 () (_ BitVec 64))

(assert (=> b!754493 (= res!509937 (= lt!335664 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335668 () Unit!26012)

(declare-fun e!420760 () Unit!26012)

(assert (=> b!754493 (= lt!335668 e!420760)))

(declare-fun c!82662 () Bool)

(assert (=> b!754493 (= c!82662 (= lt!335664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754494 () Bool)

(declare-fun res!509929 () Bool)

(assert (=> b!754494 (=> (not res!509929) (not e!420761))))

(assert (=> b!754494 (= res!509929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754495 () Bool)

(declare-fun e!420752 () Bool)

(assert (=> b!754495 (= e!420763 e!420752)))

(declare-fun res!509925 () Bool)

(assert (=> b!754495 (=> res!509925 e!420752)))

(declare-fun lt!335667 () SeekEntryResult!7663)

(assert (=> b!754495 (= res!509925 (not (= lt!335667 lt!335659)))))

(assert (=> b!754495 (= lt!335667 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20066 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754496 () Bool)

(declare-fun res!509938 () Bool)

(assert (=> b!754496 (=> (not res!509938) (not e!420757))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754496 (= res!509938 (and (= (size!20487 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20487 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20487 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754497 () Bool)

(assert (=> b!754497 (= e!420752 e!420755)))

(declare-fun res!509941 () Bool)

(assert (=> b!754497 (=> res!509941 e!420755)))

(assert (=> b!754497 (= res!509941 (= lt!335664 lt!335662))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!754497 (= lt!335664 (select (store (arr!20066 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754498 () Bool)

(assert (=> b!754498 (= e!420754 (= lt!335666 lt!335667))))

(declare-fun b!754499 () Bool)

(declare-fun res!509927 () Bool)

(assert (=> b!754499 (=> (not res!509927) (not e!420757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754499 (= res!509927 (validKeyInArray!0 (select (arr!20066 a!3186) j!159)))))

(declare-fun b!754500 () Bool)

(declare-fun res!509934 () Bool)

(assert (=> b!754500 (=> (not res!509934) (not e!420757))))

(assert (=> b!754500 (= res!509934 (validKeyInArray!0 k0!2102))))

(declare-fun b!754501 () Bool)

(declare-fun Unit!26014 () Unit!26012)

(assert (=> b!754501 (= e!420760 Unit!26014)))

(assert (=> b!754501 false))

(declare-fun b!754502 () Bool)

(declare-fun res!509931 () Bool)

(assert (=> b!754502 (=> (not res!509931) (not e!420758))))

(assert (=> b!754502 (= res!509931 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20066 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754503 () Bool)

(declare-fun Unit!26015 () Unit!26012)

(assert (=> b!754503 (= e!420760 Unit!26015)))

(declare-fun b!754504 () Bool)

(assert (=> b!754504 (= e!420756 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20066 a!3186) j!159) a!3186 mask!3328) lt!335659))))

(declare-fun b!754505 () Bool)

(assert (=> b!754505 (= e!420759 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20066 a!3186) j!159) a!3186 mask!3328) lt!335660))))

(declare-fun b!754506 () Bool)

(assert (=> b!754506 (= e!420757 e!420761)))

(declare-fun res!509933 () Bool)

(assert (=> b!754506 (=> (not res!509933) (not e!420761))))

(declare-fun lt!335669 () SeekEntryResult!7663)

(assert (=> b!754506 (= res!509933 (or (= lt!335669 (MissingZero!7663 i!1173)) (= lt!335669 (MissingVacant!7663 i!1173))))))

(assert (=> b!754506 (= lt!335669 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754507 () Bool)

(declare-fun res!509936 () Bool)

(assert (=> b!754507 (=> (not res!509936) (not e!420757))))

(declare-fun arrayContainsKey!0 (array!41904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754507 (= res!509936 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754508 () Bool)

(assert (=> b!754508 (= e!420758 e!420753)))

(declare-fun res!509930 () Bool)

(assert (=> b!754508 (=> (not res!509930) (not e!420753))))

(declare-fun lt!335661 () SeekEntryResult!7663)

(assert (=> b!754508 (= res!509930 (= lt!335661 lt!335658))))

(assert (=> b!754508 (= lt!335658 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335662 lt!335663 mask!3328))))

(assert (=> b!754508 (= lt!335661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335662 mask!3328) lt!335662 lt!335663 mask!3328))))

(assert (=> b!754508 (= lt!335662 (select (store (arr!20066 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754508 (= lt!335663 (array!41905 (store (arr!20066 a!3186) i!1173 k0!2102) (size!20487 a!3186)))))

(assert (= (and start!65714 res!509943) b!754496))

(assert (= (and b!754496 res!509938) b!754499))

(assert (= (and b!754499 res!509927) b!754500))

(assert (= (and b!754500 res!509934) b!754507))

(assert (= (and b!754507 res!509936) b!754506))

(assert (= (and b!754506 res!509933) b!754494))

(assert (= (and b!754494 res!509929) b!754488))

(assert (= (and b!754488 res!509940) b!754491))

(assert (= (and b!754491 res!509932) b!754489))

(assert (= (and b!754489 res!509942) b!754502))

(assert (= (and b!754502 res!509931) b!754487))

(assert (= (and b!754487 c!82661) b!754505))

(assert (= (and b!754487 (not c!82661)) b!754490))

(assert (= (and b!754487 res!509935) b!754508))

(assert (= (and b!754508 res!509930) b!754492))

(assert (= (and b!754492 res!509939) b!754504))

(assert (= (and b!754492 (not res!509926)) b!754495))

(assert (= (and b!754495 (not res!509925)) b!754497))

(assert (= (and b!754497 (not res!509941)) b!754493))

(assert (= (and b!754493 c!82662) b!754501))

(assert (= (and b!754493 (not c!82662)) b!754503))

(assert (= (and b!754493 res!509937) b!754486))

(assert (= (and b!754486 res!509928) b!754498))

(declare-fun m!702353 () Bool)

(assert (=> b!754492 m!702353))

(assert (=> b!754492 m!702353))

(declare-fun m!702355 () Bool)

(assert (=> b!754492 m!702355))

(declare-fun m!702357 () Bool)

(assert (=> b!754492 m!702357))

(declare-fun m!702359 () Bool)

(assert (=> b!754492 m!702359))

(assert (=> b!754499 m!702353))

(assert (=> b!754499 m!702353))

(declare-fun m!702361 () Bool)

(assert (=> b!754499 m!702361))

(assert (=> b!754490 m!702353))

(assert (=> b!754490 m!702353))

(declare-fun m!702363 () Bool)

(assert (=> b!754490 m!702363))

(assert (=> b!754489 m!702353))

(assert (=> b!754489 m!702353))

(declare-fun m!702365 () Bool)

(assert (=> b!754489 m!702365))

(assert (=> b!754489 m!702365))

(assert (=> b!754489 m!702353))

(declare-fun m!702367 () Bool)

(assert (=> b!754489 m!702367))

(declare-fun m!702369 () Bool)

(assert (=> b!754502 m!702369))

(assert (=> b!754495 m!702353))

(assert (=> b!754495 m!702353))

(assert (=> b!754495 m!702363))

(declare-fun m!702371 () Bool)

(assert (=> start!65714 m!702371))

(declare-fun m!702373 () Bool)

(assert (=> start!65714 m!702373))

(declare-fun m!702375 () Bool)

(assert (=> b!754507 m!702375))

(declare-fun m!702377 () Bool)

(assert (=> b!754508 m!702377))

(declare-fun m!702379 () Bool)

(assert (=> b!754508 m!702379))

(assert (=> b!754508 m!702377))

(declare-fun m!702381 () Bool)

(assert (=> b!754508 m!702381))

(declare-fun m!702383 () Bool)

(assert (=> b!754508 m!702383))

(declare-fun m!702385 () Bool)

(assert (=> b!754508 m!702385))

(declare-fun m!702387 () Bool)

(assert (=> b!754506 m!702387))

(declare-fun m!702389 () Bool)

(assert (=> b!754500 m!702389))

(declare-fun m!702391 () Bool)

(assert (=> b!754486 m!702391))

(declare-fun m!702393 () Bool)

(assert (=> b!754486 m!702393))

(assert (=> b!754497 m!702381))

(declare-fun m!702395 () Bool)

(assert (=> b!754497 m!702395))

(assert (=> b!754504 m!702353))

(assert (=> b!754504 m!702353))

(declare-fun m!702397 () Bool)

(assert (=> b!754504 m!702397))

(assert (=> b!754505 m!702353))

(assert (=> b!754505 m!702353))

(declare-fun m!702399 () Bool)

(assert (=> b!754505 m!702399))

(declare-fun m!702401 () Bool)

(assert (=> b!754488 m!702401))

(declare-fun m!702403 () Bool)

(assert (=> b!754494 m!702403))

(check-sat (not b!754490) (not b!754492) (not b!754506) (not b!754494) (not b!754505) (not b!754499) (not b!754495) (not start!65714) (not b!754489) (not b!754486) (not b!754508) (not b!754504) (not b!754500) (not b!754507) (not b!754488))
(check-sat)
