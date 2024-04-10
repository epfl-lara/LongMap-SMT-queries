; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67748 () Bool)

(assert start!67748)

(declare-datatypes ((array!42788 0))(
  ( (array!42789 (arr!20482 (Array (_ BitVec 32) (_ BitVec 64))) (size!20903 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42788)

(declare-fun b!786518 () Bool)

(declare-fun e!437221 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8082 0))(
  ( (MissingZero!8082 (index!34696 (_ BitVec 32))) (Found!8082 (index!34697 (_ BitVec 32))) (Intermediate!8082 (undefined!8894 Bool) (index!34698 (_ BitVec 32)) (x!65638 (_ BitVec 32))) (Undefined!8082) (MissingVacant!8082 (index!34699 (_ BitVec 32))) )
))
(declare-fun lt!350769 () SeekEntryResult!8082)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42788 (_ BitVec 32)) SeekEntryResult!8082)

(assert (=> b!786518 (= e!437221 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20482 a!3186) j!159) a!3186 mask!3328) lt!350769))))

(declare-fun b!786519 () Bool)

(declare-fun res!532557 () Bool)

(declare-fun e!437218 () Bool)

(assert (=> b!786519 (=> (not res!532557) (not e!437218))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786519 (= res!532557 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20903 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20903 a!3186))))))

(declare-fun b!786520 () Bool)

(declare-fun e!437225 () Bool)

(declare-fun e!437217 () Bool)

(assert (=> b!786520 (= e!437225 e!437217)))

(declare-fun res!532565 () Bool)

(assert (=> b!786520 (=> (not res!532565) (not e!437217))))

(declare-fun lt!350771 () SeekEntryResult!8082)

(declare-fun lt!350775 () SeekEntryResult!8082)

(assert (=> b!786520 (= res!532565 (= lt!350771 lt!350775))))

(declare-fun lt!350772 () (_ BitVec 64))

(declare-fun lt!350770 () array!42788)

(assert (=> b!786520 (= lt!350775 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350772 lt!350770 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786520 (= lt!350771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350772 mask!3328) lt!350772 lt!350770 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!786520 (= lt!350772 (select (store (arr!20482 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786520 (= lt!350770 (array!42789 (store (arr!20482 a!3186) i!1173 k0!2102) (size!20903 a!3186)))))

(declare-fun lt!350773 () SeekEntryResult!8082)

(declare-fun e!437220 () Bool)

(declare-fun b!786521 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42788 (_ BitVec 32)) SeekEntryResult!8082)

(assert (=> b!786521 (= e!437220 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20482 a!3186) j!159) a!3186 mask!3328) lt!350773))))

(declare-fun b!786522 () Bool)

(declare-datatypes ((Unit!27216 0))(
  ( (Unit!27217) )
))
(declare-fun e!437226 () Unit!27216)

(declare-fun Unit!27218 () Unit!27216)

(assert (=> b!786522 (= e!437226 Unit!27218)))

(assert (=> b!786522 false))

(declare-fun b!786523 () Bool)

(declare-fun Unit!27219 () Unit!27216)

(assert (=> b!786523 (= e!437226 Unit!27219)))

(declare-fun b!786524 () Bool)

(assert (=> b!786524 (= e!437221 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20482 a!3186) j!159) a!3186 mask!3328) (Found!8082 j!159)))))

(declare-fun b!786526 () Bool)

(declare-fun res!532554 () Bool)

(assert (=> b!786526 (=> (not res!532554) (not e!437218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42788 (_ BitVec 32)) Bool)

(assert (=> b!786526 (= res!532554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786527 () Bool)

(declare-fun e!437223 () Bool)

(declare-fun lt!350780 () SeekEntryResult!8082)

(declare-fun lt!350778 () SeekEntryResult!8082)

(assert (=> b!786527 (= e!437223 (= lt!350780 lt!350778))))

(declare-fun b!786528 () Bool)

(declare-fun res!532564 () Bool)

(assert (=> b!786528 (=> (not res!532564) (not e!437223))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42788 (_ BitVec 32)) SeekEntryResult!8082)

(assert (=> b!786528 (= res!532564 (= (seekEntryOrOpen!0 lt!350772 lt!350770 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350772 lt!350770 mask!3328)))))

(declare-fun b!786529 () Bool)

(declare-fun res!532568 () Bool)

(declare-fun e!437224 () Bool)

(assert (=> b!786529 (=> (not res!532568) (not e!437224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786529 (= res!532568 (validKeyInArray!0 k0!2102))))

(declare-fun b!786530 () Bool)

(declare-fun res!532566 () Bool)

(assert (=> b!786530 (=> (not res!532566) (not e!437225))))

(assert (=> b!786530 (= res!532566 e!437221)))

(declare-fun c!87391 () Bool)

(assert (=> b!786530 (= c!87391 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786531 () Bool)

(assert (=> b!786531 (= e!437218 e!437225)))

(declare-fun res!532570 () Bool)

(assert (=> b!786531 (=> (not res!532570) (not e!437225))))

(assert (=> b!786531 (= res!532570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20482 a!3186) j!159) mask!3328) (select (arr!20482 a!3186) j!159) a!3186 mask!3328) lt!350769))))

(assert (=> b!786531 (= lt!350769 (Intermediate!8082 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786532 () Bool)

(declare-fun res!532555 () Bool)

(assert (=> b!786532 (=> (not res!532555) (not e!437224))))

(assert (=> b!786532 (= res!532555 (validKeyInArray!0 (select (arr!20482 a!3186) j!159)))))

(declare-fun b!786533 () Bool)

(declare-fun res!532569 () Bool)

(assert (=> b!786533 (=> (not res!532569) (not e!437224))))

(assert (=> b!786533 (= res!532569 (and (= (size!20903 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20903 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20903 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786534 () Bool)

(declare-fun e!437219 () Bool)

(declare-fun e!437228 () Bool)

(assert (=> b!786534 (= e!437219 e!437228)))

(declare-fun res!532561 () Bool)

(assert (=> b!786534 (=> res!532561 e!437228)))

(declare-fun lt!350774 () (_ BitVec 64))

(assert (=> b!786534 (= res!532561 (= lt!350774 lt!350772))))

(assert (=> b!786534 (= lt!350774 (select (store (arr!20482 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786535 () Bool)

(declare-fun res!532571 () Bool)

(assert (=> b!786535 (=> (not res!532571) (not e!437218))))

(declare-datatypes ((List!14484 0))(
  ( (Nil!14481) (Cons!14480 (h!15603 (_ BitVec 64)) (t!20799 List!14484)) )
))
(declare-fun arrayNoDuplicates!0 (array!42788 (_ BitVec 32) List!14484) Bool)

(assert (=> b!786535 (= res!532571 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14481))))

(declare-fun b!786536 () Bool)

(declare-fun e!437222 () Bool)

(assert (=> b!786536 (= e!437222 e!437219)))

(declare-fun res!532553 () Bool)

(assert (=> b!786536 (=> res!532553 e!437219)))

(assert (=> b!786536 (= res!532553 (not (= lt!350778 lt!350773)))))

(assert (=> b!786536 (= lt!350778 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20482 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786537 () Bool)

(assert (=> b!786537 (= e!437217 (not e!437222))))

(declare-fun res!532562 () Bool)

(assert (=> b!786537 (=> res!532562 e!437222)))

(get-info :version)

(assert (=> b!786537 (= res!532562 (or (not ((_ is Intermediate!8082) lt!350775)) (bvslt x!1131 (x!65638 lt!350775)) (not (= x!1131 (x!65638 lt!350775))) (not (= index!1321 (index!34698 lt!350775)))))))

(assert (=> b!786537 e!437220))

(declare-fun res!532559 () Bool)

(assert (=> b!786537 (=> (not res!532559) (not e!437220))))

(assert (=> b!786537 (= res!532559 (= lt!350780 lt!350773))))

(assert (=> b!786537 (= lt!350773 (Found!8082 j!159))))

(assert (=> b!786537 (= lt!350780 (seekEntryOrOpen!0 (select (arr!20482 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786537 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350779 () Unit!27216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27216)

(assert (=> b!786537 (= lt!350779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786538 () Bool)

(assert (=> b!786538 (= e!437224 e!437218)))

(declare-fun res!532560 () Bool)

(assert (=> b!786538 (=> (not res!532560) (not e!437218))))

(declare-fun lt!350776 () SeekEntryResult!8082)

(assert (=> b!786538 (= res!532560 (or (= lt!350776 (MissingZero!8082 i!1173)) (= lt!350776 (MissingVacant!8082 i!1173))))))

(assert (=> b!786538 (= lt!350776 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786539 () Bool)

(declare-fun res!532558 () Bool)

(assert (=> b!786539 (=> (not res!532558) (not e!437225))))

(assert (=> b!786539 (= res!532558 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20482 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786540 () Bool)

(assert (=> b!786540 (= e!437228 true)))

(assert (=> b!786540 e!437223))

(declare-fun res!532563 () Bool)

(assert (=> b!786540 (=> (not res!532563) (not e!437223))))

(assert (=> b!786540 (= res!532563 (= lt!350774 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350777 () Unit!27216)

(assert (=> b!786540 (= lt!350777 e!437226)))

(declare-fun c!87390 () Bool)

(assert (=> b!786540 (= c!87390 (= lt!350774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786525 () Bool)

(declare-fun res!532556 () Bool)

(assert (=> b!786525 (=> (not res!532556) (not e!437224))))

(declare-fun arrayContainsKey!0 (array!42788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786525 (= res!532556 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!532567 () Bool)

(assert (=> start!67748 (=> (not res!532567) (not e!437224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67748 (= res!532567 (validMask!0 mask!3328))))

(assert (=> start!67748 e!437224))

(assert (=> start!67748 true))

(declare-fun array_inv!16278 (array!42788) Bool)

(assert (=> start!67748 (array_inv!16278 a!3186)))

(assert (= (and start!67748 res!532567) b!786533))

(assert (= (and b!786533 res!532569) b!786532))

(assert (= (and b!786532 res!532555) b!786529))

(assert (= (and b!786529 res!532568) b!786525))

(assert (= (and b!786525 res!532556) b!786538))

(assert (= (and b!786538 res!532560) b!786526))

(assert (= (and b!786526 res!532554) b!786535))

(assert (= (and b!786535 res!532571) b!786519))

(assert (= (and b!786519 res!532557) b!786531))

(assert (= (and b!786531 res!532570) b!786539))

(assert (= (and b!786539 res!532558) b!786530))

(assert (= (and b!786530 c!87391) b!786518))

(assert (= (and b!786530 (not c!87391)) b!786524))

(assert (= (and b!786530 res!532566) b!786520))

(assert (= (and b!786520 res!532565) b!786537))

(assert (= (and b!786537 res!532559) b!786521))

(assert (= (and b!786537 (not res!532562)) b!786536))

(assert (= (and b!786536 (not res!532553)) b!786534))

(assert (= (and b!786534 (not res!532561)) b!786540))

(assert (= (and b!786540 c!87390) b!786522))

(assert (= (and b!786540 (not c!87390)) b!786523))

(assert (= (and b!786540 res!532563) b!786528))

(assert (= (and b!786528 res!532564) b!786527))

(declare-fun m!728325 () Bool)

(assert (=> b!786536 m!728325))

(assert (=> b!786536 m!728325))

(declare-fun m!728327 () Bool)

(assert (=> b!786536 m!728327))

(assert (=> b!786531 m!728325))

(assert (=> b!786531 m!728325))

(declare-fun m!728329 () Bool)

(assert (=> b!786531 m!728329))

(assert (=> b!786531 m!728329))

(assert (=> b!786531 m!728325))

(declare-fun m!728331 () Bool)

(assert (=> b!786531 m!728331))

(assert (=> b!786524 m!728325))

(assert (=> b!786524 m!728325))

(assert (=> b!786524 m!728327))

(declare-fun m!728333 () Bool)

(assert (=> b!786529 m!728333))

(declare-fun m!728335 () Bool)

(assert (=> b!786535 m!728335))

(assert (=> b!786518 m!728325))

(assert (=> b!786518 m!728325))

(declare-fun m!728337 () Bool)

(assert (=> b!786518 m!728337))

(assert (=> b!786521 m!728325))

(assert (=> b!786521 m!728325))

(declare-fun m!728339 () Bool)

(assert (=> b!786521 m!728339))

(declare-fun m!728341 () Bool)

(assert (=> b!786534 m!728341))

(declare-fun m!728343 () Bool)

(assert (=> b!786534 m!728343))

(assert (=> b!786537 m!728325))

(assert (=> b!786537 m!728325))

(declare-fun m!728345 () Bool)

(assert (=> b!786537 m!728345))

(declare-fun m!728347 () Bool)

(assert (=> b!786537 m!728347))

(declare-fun m!728349 () Bool)

(assert (=> b!786537 m!728349))

(declare-fun m!728351 () Bool)

(assert (=> b!786525 m!728351))

(declare-fun m!728353 () Bool)

(assert (=> b!786526 m!728353))

(declare-fun m!728355 () Bool)

(assert (=> b!786539 m!728355))

(declare-fun m!728357 () Bool)

(assert (=> start!67748 m!728357))

(declare-fun m!728359 () Bool)

(assert (=> start!67748 m!728359))

(assert (=> b!786532 m!728325))

(assert (=> b!786532 m!728325))

(declare-fun m!728361 () Bool)

(assert (=> b!786532 m!728361))

(declare-fun m!728363 () Bool)

(assert (=> b!786538 m!728363))

(declare-fun m!728365 () Bool)

(assert (=> b!786520 m!728365))

(assert (=> b!786520 m!728341))

(declare-fun m!728367 () Bool)

(assert (=> b!786520 m!728367))

(declare-fun m!728369 () Bool)

(assert (=> b!786520 m!728369))

(assert (=> b!786520 m!728369))

(declare-fun m!728371 () Bool)

(assert (=> b!786520 m!728371))

(declare-fun m!728373 () Bool)

(assert (=> b!786528 m!728373))

(declare-fun m!728375 () Bool)

(assert (=> b!786528 m!728375))

(check-sat (not b!786529) (not b!786538) (not b!786535) (not b!786521) (not b!786528) (not b!786532) (not b!786537) (not b!786524) (not b!786520) (not b!786525) (not start!67748) (not b!786531) (not b!786518) (not b!786536) (not b!786526))
(check-sat)
