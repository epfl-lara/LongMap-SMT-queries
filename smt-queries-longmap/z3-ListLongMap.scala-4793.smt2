; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65820 () Bool)

(assert start!65820)

(declare-fun b!757703 () Bool)

(declare-datatypes ((Unit!26220 0))(
  ( (Unit!26221) )
))
(declare-fun e!422461 () Unit!26220)

(declare-fun Unit!26222 () Unit!26220)

(assert (=> b!757703 (= e!422461 Unit!26222)))

(assert (=> b!757703 false))

(declare-fun b!757705 () Bool)

(declare-fun e!422458 () Bool)

(declare-fun e!422462 () Bool)

(assert (=> b!757705 (= e!422458 e!422462)))

(declare-fun res!512495 () Bool)

(assert (=> b!757705 (=> (not res!512495) (not e!422462))))

(declare-datatypes ((array!41993 0))(
  ( (array!41994 (arr!20110 (Array (_ BitVec 32) (_ BitVec 64))) (size!20531 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41993)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7710 0))(
  ( (MissingZero!7710 (index!33208 (_ BitVec 32))) (Found!7710 (index!33209 (_ BitVec 32))) (Intermediate!7710 (undefined!8522 Bool) (index!33210 (_ BitVec 32)) (x!64100 (_ BitVec 32))) (Undefined!7710) (MissingVacant!7710 (index!33211 (_ BitVec 32))) )
))
(declare-fun lt!337452 () SeekEntryResult!7710)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41993 (_ BitVec 32)) SeekEntryResult!7710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757705 (= res!512495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20110 a!3186) j!159) mask!3328) (select (arr!20110 a!3186) j!159) a!3186 mask!3328) lt!337452))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757705 (= lt!337452 (Intermediate!7710 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757706 () Bool)

(declare-fun e!422457 () Bool)

(assert (=> b!757706 (= e!422462 e!422457)))

(declare-fun res!512492 () Bool)

(assert (=> b!757706 (=> (not res!512492) (not e!422457))))

(declare-fun lt!337453 () SeekEntryResult!7710)

(declare-fun lt!337456 () SeekEntryResult!7710)

(assert (=> b!757706 (= res!512492 (= lt!337453 lt!337456))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337451 () (_ BitVec 64))

(declare-fun lt!337457 () array!41993)

(assert (=> b!757706 (= lt!337456 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337451 lt!337457 mask!3328))))

(assert (=> b!757706 (= lt!337453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337451 mask!3328) lt!337451 lt!337457 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757706 (= lt!337451 (select (store (arr!20110 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757706 (= lt!337457 (array!41994 (store (arr!20110 a!3186) i!1173 k0!2102) (size!20531 a!3186)))))

(declare-fun b!757707 () Bool)

(declare-fun res!512502 () Bool)

(declare-fun e!422456 () Bool)

(assert (=> b!757707 (=> (not res!512502) (not e!422456))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41993 (_ BitVec 32)) SeekEntryResult!7710)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41993 (_ BitVec 32)) SeekEntryResult!7710)

(assert (=> b!757707 (= res!512502 (= (seekEntryOrOpen!0 lt!337451 lt!337457 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337451 lt!337457 mask!3328)))))

(declare-fun b!757708 () Bool)

(declare-fun lt!337450 () SeekEntryResult!7710)

(declare-fun lt!337449 () SeekEntryResult!7710)

(assert (=> b!757708 (= e!422456 (= lt!337450 lt!337449))))

(declare-fun b!757709 () Bool)

(declare-fun e!422464 () Bool)

(assert (=> b!757709 (= e!422464 e!422458)))

(declare-fun res!512499 () Bool)

(assert (=> b!757709 (=> (not res!512499) (not e!422458))))

(declare-fun lt!337454 () SeekEntryResult!7710)

(assert (=> b!757709 (= res!512499 (or (= lt!337454 (MissingZero!7710 i!1173)) (= lt!337454 (MissingVacant!7710 i!1173))))))

(assert (=> b!757709 (= lt!337454 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757710 () Bool)

(declare-fun Unit!26223 () Unit!26220)

(assert (=> b!757710 (= e!422461 Unit!26223)))

(declare-fun b!757711 () Bool)

(declare-fun res!512493 () Bool)

(assert (=> b!757711 (=> (not res!512493) (not e!422464))))

(assert (=> b!757711 (= res!512493 (and (= (size!20531 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20531 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20531 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757712 () Bool)

(declare-fun res!512490 () Bool)

(assert (=> b!757712 (=> (not res!512490) (not e!422464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757712 (= res!512490 (validKeyInArray!0 (select (arr!20110 a!3186) j!159)))))

(declare-fun b!757713 () Bool)

(declare-fun res!512487 () Bool)

(assert (=> b!757713 (=> (not res!512487) (not e!422462))))

(assert (=> b!757713 (= res!512487 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20110 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757714 () Bool)

(declare-fun res!512500 () Bool)

(assert (=> b!757714 (=> (not res!512500) (not e!422464))))

(declare-fun arrayContainsKey!0 (array!41993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757714 (= res!512500 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757715 () Bool)

(declare-fun res!512486 () Bool)

(assert (=> b!757715 (=> (not res!512486) (not e!422462))))

(declare-fun e!422459 () Bool)

(assert (=> b!757715 (= res!512486 e!422459)))

(declare-fun c!82990 () Bool)

(assert (=> b!757715 (= c!82990 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757716 () Bool)

(declare-fun e!422454 () Bool)

(assert (=> b!757716 (= e!422454 true)))

(assert (=> b!757716 e!422456))

(declare-fun res!512494 () Bool)

(assert (=> b!757716 (=> (not res!512494) (not e!422456))))

(declare-fun lt!337447 () (_ BitVec 64))

(assert (=> b!757716 (= res!512494 (= lt!337447 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337446 () Unit!26220)

(assert (=> b!757716 (= lt!337446 e!422461)))

(declare-fun c!82989 () Bool)

(assert (=> b!757716 (= c!82989 (= lt!337447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!512503 () Bool)

(assert (=> start!65820 (=> (not res!512503) (not e!422464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65820 (= res!512503 (validMask!0 mask!3328))))

(assert (=> start!65820 e!422464))

(assert (=> start!65820 true))

(declare-fun array_inv!15906 (array!41993) Bool)

(assert (=> start!65820 (array_inv!15906 a!3186)))

(declare-fun b!757704 () Bool)

(declare-fun e!422455 () Bool)

(assert (=> b!757704 (= e!422455 e!422454)))

(declare-fun res!512504 () Bool)

(assert (=> b!757704 (=> res!512504 e!422454)))

(assert (=> b!757704 (= res!512504 (= lt!337447 lt!337451))))

(assert (=> b!757704 (= lt!337447 (select (store (arr!20110 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757717 () Bool)

(declare-fun res!512497 () Bool)

(assert (=> b!757717 (=> (not res!512497) (not e!422458))))

(declare-datatypes ((List!14112 0))(
  ( (Nil!14109) (Cons!14108 (h!15180 (_ BitVec 64)) (t!20427 List!14112)) )
))
(declare-fun arrayNoDuplicates!0 (array!41993 (_ BitVec 32) List!14112) Bool)

(assert (=> b!757717 (= res!512497 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14109))))

(declare-fun b!757718 () Bool)

(declare-fun res!512498 () Bool)

(assert (=> b!757718 (=> (not res!512498) (not e!422464))))

(assert (=> b!757718 (= res!512498 (validKeyInArray!0 k0!2102))))

(declare-fun b!757719 () Bool)

(declare-fun e!422460 () Bool)

(assert (=> b!757719 (= e!422457 (not e!422460))))

(declare-fun res!512491 () Bool)

(assert (=> b!757719 (=> res!512491 e!422460)))

(get-info :version)

(assert (=> b!757719 (= res!512491 (or (not ((_ is Intermediate!7710) lt!337456)) (bvslt x!1131 (x!64100 lt!337456)) (not (= x!1131 (x!64100 lt!337456))) (not (= index!1321 (index!33210 lt!337456)))))))

(declare-fun e!422465 () Bool)

(assert (=> b!757719 e!422465))

(declare-fun res!512501 () Bool)

(assert (=> b!757719 (=> (not res!512501) (not e!422465))))

(declare-fun lt!337448 () SeekEntryResult!7710)

(assert (=> b!757719 (= res!512501 (= lt!337450 lt!337448))))

(assert (=> b!757719 (= lt!337448 (Found!7710 j!159))))

(assert (=> b!757719 (= lt!337450 (seekEntryOrOpen!0 (select (arr!20110 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41993 (_ BitVec 32)) Bool)

(assert (=> b!757719 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337455 () Unit!26220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26220)

(assert (=> b!757719 (= lt!337455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757720 () Bool)

(assert (=> b!757720 (= e!422459 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20110 a!3186) j!159) a!3186 mask!3328) lt!337452))))

(declare-fun b!757721 () Bool)

(assert (=> b!757721 (= e!422460 e!422455)))

(declare-fun res!512488 () Bool)

(assert (=> b!757721 (=> res!512488 e!422455)))

(assert (=> b!757721 (= res!512488 (not (= lt!337449 lt!337448)))))

(assert (=> b!757721 (= lt!337449 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20110 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757722 () Bool)

(assert (=> b!757722 (= e!422465 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20110 a!3186) j!159) a!3186 mask!3328) lt!337448))))

(declare-fun b!757723 () Bool)

(declare-fun res!512496 () Bool)

(assert (=> b!757723 (=> (not res!512496) (not e!422458))))

(assert (=> b!757723 (= res!512496 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20531 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20531 a!3186))))))

(declare-fun b!757724 () Bool)

(assert (=> b!757724 (= e!422459 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20110 a!3186) j!159) a!3186 mask!3328) (Found!7710 j!159)))))

(declare-fun b!757725 () Bool)

(declare-fun res!512489 () Bool)

(assert (=> b!757725 (=> (not res!512489) (not e!422458))))

(assert (=> b!757725 (= res!512489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65820 res!512503) b!757711))

(assert (= (and b!757711 res!512493) b!757712))

(assert (= (and b!757712 res!512490) b!757718))

(assert (= (and b!757718 res!512498) b!757714))

(assert (= (and b!757714 res!512500) b!757709))

(assert (= (and b!757709 res!512499) b!757725))

(assert (= (and b!757725 res!512489) b!757717))

(assert (= (and b!757717 res!512497) b!757723))

(assert (= (and b!757723 res!512496) b!757705))

(assert (= (and b!757705 res!512495) b!757713))

(assert (= (and b!757713 res!512487) b!757715))

(assert (= (and b!757715 c!82990) b!757720))

(assert (= (and b!757715 (not c!82990)) b!757724))

(assert (= (and b!757715 res!512486) b!757706))

(assert (= (and b!757706 res!512492) b!757719))

(assert (= (and b!757719 res!512501) b!757722))

(assert (= (and b!757719 (not res!512491)) b!757721))

(assert (= (and b!757721 (not res!512488)) b!757704))

(assert (= (and b!757704 (not res!512504)) b!757716))

(assert (= (and b!757716 c!82989) b!757703))

(assert (= (and b!757716 (not c!82989)) b!757710))

(assert (= (and b!757716 res!512494) b!757707))

(assert (= (and b!757707 res!512502) b!757708))

(declare-fun m!705347 () Bool)

(assert (=> b!757704 m!705347))

(declare-fun m!705349 () Bool)

(assert (=> b!757704 m!705349))

(declare-fun m!705351 () Bool)

(assert (=> b!757720 m!705351))

(assert (=> b!757720 m!705351))

(declare-fun m!705353 () Bool)

(assert (=> b!757720 m!705353))

(declare-fun m!705355 () Bool)

(assert (=> b!757717 m!705355))

(declare-fun m!705357 () Bool)

(assert (=> b!757725 m!705357))

(assert (=> b!757722 m!705351))

(assert (=> b!757722 m!705351))

(declare-fun m!705359 () Bool)

(assert (=> b!757722 m!705359))

(declare-fun m!705361 () Bool)

(assert (=> b!757707 m!705361))

(declare-fun m!705363 () Bool)

(assert (=> b!757707 m!705363))

(declare-fun m!705365 () Bool)

(assert (=> b!757706 m!705365))

(declare-fun m!705367 () Bool)

(assert (=> b!757706 m!705367))

(assert (=> b!757706 m!705347))

(declare-fun m!705369 () Bool)

(assert (=> b!757706 m!705369))

(assert (=> b!757706 m!705367))

(declare-fun m!705371 () Bool)

(assert (=> b!757706 m!705371))

(assert (=> b!757705 m!705351))

(assert (=> b!757705 m!705351))

(declare-fun m!705373 () Bool)

(assert (=> b!757705 m!705373))

(assert (=> b!757705 m!705373))

(assert (=> b!757705 m!705351))

(declare-fun m!705375 () Bool)

(assert (=> b!757705 m!705375))

(declare-fun m!705377 () Bool)

(assert (=> b!757713 m!705377))

(assert (=> b!757719 m!705351))

(assert (=> b!757719 m!705351))

(declare-fun m!705379 () Bool)

(assert (=> b!757719 m!705379))

(declare-fun m!705381 () Bool)

(assert (=> b!757719 m!705381))

(declare-fun m!705383 () Bool)

(assert (=> b!757719 m!705383))

(assert (=> b!757712 m!705351))

(assert (=> b!757712 m!705351))

(declare-fun m!705385 () Bool)

(assert (=> b!757712 m!705385))

(declare-fun m!705387 () Bool)

(assert (=> b!757714 m!705387))

(assert (=> b!757721 m!705351))

(assert (=> b!757721 m!705351))

(declare-fun m!705389 () Bool)

(assert (=> b!757721 m!705389))

(declare-fun m!705391 () Bool)

(assert (=> start!65820 m!705391))

(declare-fun m!705393 () Bool)

(assert (=> start!65820 m!705393))

(assert (=> b!757724 m!705351))

(assert (=> b!757724 m!705351))

(assert (=> b!757724 m!705389))

(declare-fun m!705395 () Bool)

(assert (=> b!757709 m!705395))

(declare-fun m!705397 () Bool)

(assert (=> b!757718 m!705397))

(check-sat (not b!757706) (not b!757721) (not b!757705) (not b!757714) (not b!757717) (not b!757724) (not b!757720) (not b!757718) (not start!65820) (not b!757709) (not b!757719) (not b!757725) (not b!757712) (not b!757707) (not b!757722))
(check-sat)
