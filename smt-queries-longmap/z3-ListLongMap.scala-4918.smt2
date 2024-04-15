; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67730 () Bool)

(assert start!67730)

(declare-fun b!786406 () Bool)

(declare-datatypes ((Unit!27188 0))(
  ( (Unit!27189) )
))
(declare-fun e!437139 () Unit!27188)

(declare-fun Unit!27190 () Unit!27188)

(assert (=> b!786406 (= e!437139 Unit!27190)))

(declare-fun b!786407 () Bool)

(declare-fun res!532570 () Bool)

(declare-fun e!437138 () Bool)

(assert (=> b!786407 (=> (not res!532570) (not e!437138))))

(declare-datatypes ((array!42789 0))(
  ( (array!42790 (arr!20483 (Array (_ BitVec 32) (_ BitVec 64))) (size!20904 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42789)

(declare-datatypes ((List!14524 0))(
  ( (Nil!14521) (Cons!14520 (h!15643 (_ BitVec 64)) (t!20830 List!14524)) )
))
(declare-fun arrayNoDuplicates!0 (array!42789 (_ BitVec 32) List!14524) Bool)

(assert (=> b!786407 (= res!532570 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14521))))

(declare-fun b!786409 () Bool)

(declare-fun e!437142 () Bool)

(assert (=> b!786409 (= e!437142 e!437138)))

(declare-fun res!532561 () Bool)

(assert (=> b!786409 (=> (not res!532561) (not e!437138))))

(declare-datatypes ((SeekEntryResult!8080 0))(
  ( (MissingZero!8080 (index!34688 (_ BitVec 32))) (Found!8080 (index!34689 (_ BitVec 32))) (Intermediate!8080 (undefined!8892 Bool) (index!34690 (_ BitVec 32)) (x!65639 (_ BitVec 32))) (Undefined!8080) (MissingVacant!8080 (index!34691 (_ BitVec 32))) )
))
(declare-fun lt!350611 () SeekEntryResult!8080)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786409 (= res!532561 (or (= lt!350611 (MissingZero!8080 i!1173)) (= lt!350611 (MissingVacant!8080 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42789 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!786409 (= lt!350611 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786410 () Bool)

(declare-fun res!532574 () Bool)

(assert (=> b!786410 (=> (not res!532574) (not e!437142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786410 (= res!532574 (validKeyInArray!0 k0!2102))))

(declare-fun b!786411 () Bool)

(declare-fun e!437140 () Bool)

(declare-fun e!437141 () Bool)

(assert (=> b!786411 (= e!437140 e!437141)))

(declare-fun res!532558 () Bool)

(assert (=> b!786411 (=> res!532558 e!437141)))

(declare-fun lt!350608 () SeekEntryResult!8080)

(declare-fun lt!350612 () SeekEntryResult!8080)

(assert (=> b!786411 (= res!532558 (not (= lt!350608 lt!350612)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42789 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!786411 (= lt!350608 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20483 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786412 () Bool)

(declare-fun e!437137 () Bool)

(assert (=> b!786412 (= e!437137 (not e!437140))))

(declare-fun res!532562 () Bool)

(assert (=> b!786412 (=> res!532562 e!437140)))

(declare-fun lt!350609 () SeekEntryResult!8080)

(get-info :version)

(assert (=> b!786412 (= res!532562 (or (not ((_ is Intermediate!8080) lt!350609)) (bvslt x!1131 (x!65639 lt!350609)) (not (= x!1131 (x!65639 lt!350609))) (not (= index!1321 (index!34690 lt!350609)))))))

(declare-fun e!437145 () Bool)

(assert (=> b!786412 e!437145))

(declare-fun res!532573 () Bool)

(assert (=> b!786412 (=> (not res!532573) (not e!437145))))

(declare-fun lt!350606 () SeekEntryResult!8080)

(assert (=> b!786412 (= res!532573 (= lt!350606 lt!350612))))

(assert (=> b!786412 (= lt!350612 (Found!8080 j!159))))

(assert (=> b!786412 (= lt!350606 (seekEntryOrOpen!0 (select (arr!20483 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42789 (_ BitVec 32)) Bool)

(assert (=> b!786412 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350602 () Unit!27188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27188)

(assert (=> b!786412 (= lt!350602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786413 () Bool)

(declare-fun res!532575 () Bool)

(declare-fun e!437143 () Bool)

(assert (=> b!786413 (=> (not res!532575) (not e!437143))))

(declare-fun lt!350605 () (_ BitVec 64))

(declare-fun lt!350603 () array!42789)

(assert (=> b!786413 (= res!532575 (= (seekEntryOrOpen!0 lt!350605 lt!350603 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350605 lt!350603 mask!3328)))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!786414 () Bool)

(assert (=> b!786414 (= e!437145 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20483 a!3186) j!159) a!3186 mask!3328) lt!350612))))

(declare-fun b!786415 () Bool)

(declare-fun res!532564 () Bool)

(assert (=> b!786415 (=> (not res!532564) (not e!437142))))

(assert (=> b!786415 (= res!532564 (and (= (size!20904 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20904 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20904 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786416 () Bool)

(declare-fun res!532563 () Bool)

(assert (=> b!786416 (=> (not res!532563) (not e!437142))))

(assert (=> b!786416 (= res!532563 (validKeyInArray!0 (select (arr!20483 a!3186) j!159)))))

(declare-fun b!786417 () Bool)

(declare-fun res!532560 () Bool)

(declare-fun e!437135 () Bool)

(assert (=> b!786417 (=> (not res!532560) (not e!437135))))

(declare-fun e!437146 () Bool)

(assert (=> b!786417 (= res!532560 e!437146)))

(declare-fun c!87332 () Bool)

(assert (=> b!786417 (= c!87332 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786418 () Bool)

(declare-fun res!532557 () Bool)

(assert (=> b!786418 (=> (not res!532557) (not e!437138))))

(assert (=> b!786418 (= res!532557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786419 () Bool)

(declare-fun res!532565 () Bool)

(assert (=> b!786419 (=> (not res!532565) (not e!437138))))

(assert (=> b!786419 (= res!532565 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20904 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20904 a!3186))))))

(declare-fun b!786420 () Bool)

(declare-fun e!437144 () Bool)

(assert (=> b!786420 (= e!437144 true)))

(assert (=> b!786420 e!437143))

(declare-fun res!532567 () Bool)

(assert (=> b!786420 (=> (not res!532567) (not e!437143))))

(declare-fun lt!350607 () (_ BitVec 64))

(assert (=> b!786420 (= res!532567 (= lt!350607 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350601 () Unit!27188)

(assert (=> b!786420 (= lt!350601 e!437139)))

(declare-fun c!87333 () Bool)

(assert (=> b!786420 (= c!87333 (= lt!350607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786421 () Bool)

(assert (=> b!786421 (= e!437146 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20483 a!3186) j!159) a!3186 mask!3328) (Found!8080 j!159)))))

(declare-fun b!786422 () Bool)

(assert (=> b!786422 (= e!437143 (= lt!350606 lt!350608))))

(declare-fun b!786423 () Bool)

(assert (=> b!786423 (= e!437135 e!437137)))

(declare-fun res!532559 () Bool)

(assert (=> b!786423 (=> (not res!532559) (not e!437137))))

(declare-fun lt!350610 () SeekEntryResult!8080)

(assert (=> b!786423 (= res!532559 (= lt!350610 lt!350609))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42789 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!786423 (= lt!350609 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350605 lt!350603 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786423 (= lt!350610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350605 mask!3328) lt!350605 lt!350603 mask!3328))))

(assert (=> b!786423 (= lt!350605 (select (store (arr!20483 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786423 (= lt!350603 (array!42790 (store (arr!20483 a!3186) i!1173 k0!2102) (size!20904 a!3186)))))

(declare-fun res!532568 () Bool)

(assert (=> start!67730 (=> (not res!532568) (not e!437142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67730 (= res!532568 (validMask!0 mask!3328))))

(assert (=> start!67730 e!437142))

(assert (=> start!67730 true))

(declare-fun array_inv!16366 (array!42789) Bool)

(assert (=> start!67730 (array_inv!16366 a!3186)))

(declare-fun b!786408 () Bool)

(declare-fun Unit!27191 () Unit!27188)

(assert (=> b!786408 (= e!437139 Unit!27191)))

(assert (=> b!786408 false))

(declare-fun b!786424 () Bool)

(declare-fun lt!350604 () SeekEntryResult!8080)

(assert (=> b!786424 (= e!437146 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20483 a!3186) j!159) a!3186 mask!3328) lt!350604))))

(declare-fun b!786425 () Bool)

(declare-fun res!532571 () Bool)

(assert (=> b!786425 (=> (not res!532571) (not e!437142))))

(declare-fun arrayContainsKey!0 (array!42789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786425 (= res!532571 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786426 () Bool)

(assert (=> b!786426 (= e!437138 e!437135)))

(declare-fun res!532566 () Bool)

(assert (=> b!786426 (=> (not res!532566) (not e!437135))))

(assert (=> b!786426 (= res!532566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20483 a!3186) j!159) mask!3328) (select (arr!20483 a!3186) j!159) a!3186 mask!3328) lt!350604))))

(assert (=> b!786426 (= lt!350604 (Intermediate!8080 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786427 () Bool)

(declare-fun res!532569 () Bool)

(assert (=> b!786427 (=> (not res!532569) (not e!437135))))

(assert (=> b!786427 (= res!532569 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20483 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786428 () Bool)

(assert (=> b!786428 (= e!437141 e!437144)))

(declare-fun res!532572 () Bool)

(assert (=> b!786428 (=> res!532572 e!437144)))

(assert (=> b!786428 (= res!532572 (= lt!350607 lt!350605))))

(assert (=> b!786428 (= lt!350607 (select (store (arr!20483 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67730 res!532568) b!786415))

(assert (= (and b!786415 res!532564) b!786416))

(assert (= (and b!786416 res!532563) b!786410))

(assert (= (and b!786410 res!532574) b!786425))

(assert (= (and b!786425 res!532571) b!786409))

(assert (= (and b!786409 res!532561) b!786418))

(assert (= (and b!786418 res!532557) b!786407))

(assert (= (and b!786407 res!532570) b!786419))

(assert (= (and b!786419 res!532565) b!786426))

(assert (= (and b!786426 res!532566) b!786427))

(assert (= (and b!786427 res!532569) b!786417))

(assert (= (and b!786417 c!87332) b!786424))

(assert (= (and b!786417 (not c!87332)) b!786421))

(assert (= (and b!786417 res!532560) b!786423))

(assert (= (and b!786423 res!532559) b!786412))

(assert (= (and b!786412 res!532573) b!786414))

(assert (= (and b!786412 (not res!532562)) b!786411))

(assert (= (and b!786411 (not res!532558)) b!786428))

(assert (= (and b!786428 (not res!532572)) b!786420))

(assert (= (and b!786420 c!87333) b!786408))

(assert (= (and b!786420 (not c!87333)) b!786406))

(assert (= (and b!786420 res!532567) b!786413))

(assert (= (and b!786413 res!532575) b!786422))

(declare-fun m!727671 () Bool)

(assert (=> b!786414 m!727671))

(assert (=> b!786414 m!727671))

(declare-fun m!727673 () Bool)

(assert (=> b!786414 m!727673))

(assert (=> b!786424 m!727671))

(assert (=> b!786424 m!727671))

(declare-fun m!727675 () Bool)

(assert (=> b!786424 m!727675))

(assert (=> b!786411 m!727671))

(assert (=> b!786411 m!727671))

(declare-fun m!727677 () Bool)

(assert (=> b!786411 m!727677))

(assert (=> b!786426 m!727671))

(assert (=> b!786426 m!727671))

(declare-fun m!727679 () Bool)

(assert (=> b!786426 m!727679))

(assert (=> b!786426 m!727679))

(assert (=> b!786426 m!727671))

(declare-fun m!727681 () Bool)

(assert (=> b!786426 m!727681))

(assert (=> b!786416 m!727671))

(assert (=> b!786416 m!727671))

(declare-fun m!727683 () Bool)

(assert (=> b!786416 m!727683))

(assert (=> b!786412 m!727671))

(assert (=> b!786412 m!727671))

(declare-fun m!727685 () Bool)

(assert (=> b!786412 m!727685))

(declare-fun m!727687 () Bool)

(assert (=> b!786412 m!727687))

(declare-fun m!727689 () Bool)

(assert (=> b!786412 m!727689))

(declare-fun m!727691 () Bool)

(assert (=> b!786418 m!727691))

(declare-fun m!727693 () Bool)

(assert (=> b!786410 m!727693))

(declare-fun m!727695 () Bool)

(assert (=> b!786425 m!727695))

(declare-fun m!727697 () Bool)

(assert (=> b!786413 m!727697))

(declare-fun m!727699 () Bool)

(assert (=> b!786413 m!727699))

(declare-fun m!727701 () Bool)

(assert (=> start!67730 m!727701))

(declare-fun m!727703 () Bool)

(assert (=> start!67730 m!727703))

(declare-fun m!727705 () Bool)

(assert (=> b!786423 m!727705))

(declare-fun m!727707 () Bool)

(assert (=> b!786423 m!727707))

(declare-fun m!727709 () Bool)

(assert (=> b!786423 m!727709))

(assert (=> b!786423 m!727705))

(declare-fun m!727711 () Bool)

(assert (=> b!786423 m!727711))

(declare-fun m!727713 () Bool)

(assert (=> b!786423 m!727713))

(assert (=> b!786421 m!727671))

(assert (=> b!786421 m!727671))

(assert (=> b!786421 m!727677))

(declare-fun m!727715 () Bool)

(assert (=> b!786409 m!727715))

(assert (=> b!786428 m!727707))

(declare-fun m!727717 () Bool)

(assert (=> b!786428 m!727717))

(declare-fun m!727719 () Bool)

(assert (=> b!786407 m!727719))

(declare-fun m!727721 () Bool)

(assert (=> b!786427 m!727721))

(check-sat (not start!67730) (not b!786411) (not b!786412) (not b!786418) (not b!786414) (not b!786416) (not b!786410) (not b!786424) (not b!786421) (not b!786409) (not b!786423) (not b!786407) (not b!786425) (not b!786413) (not b!786426))
(check-sat)
