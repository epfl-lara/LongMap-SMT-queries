; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65534 () Bool)

(assert start!65534)

(declare-fun b!748425 () Bool)

(declare-fun e!417688 () Bool)

(declare-fun e!417693 () Bool)

(assert (=> b!748425 (= e!417688 (not e!417693))))

(declare-fun res!504956 () Bool)

(assert (=> b!748425 (=> res!504956 e!417693)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7573 0))(
  ( (MissingZero!7573 (index!32660 (_ BitVec 32))) (Found!7573 (index!32661 (_ BitVec 32))) (Intermediate!7573 (undefined!8385 Bool) (index!32662 (_ BitVec 32)) (x!63606 (_ BitVec 32))) (Undefined!7573) (MissingVacant!7573 (index!32663 (_ BitVec 32))) )
))
(declare-fun lt!332585 () SeekEntryResult!7573)

(get-info :version)

(assert (=> b!748425 (= res!504956 (or (not ((_ is Intermediate!7573) lt!332585)) (bvslt x!1131 (x!63606 lt!332585)) (not (= x!1131 (x!63606 lt!332585))) (not (= index!1321 (index!32662 lt!332585)))))))

(declare-fun e!417692 () Bool)

(assert (=> b!748425 e!417692))

(declare-fun res!504959 () Bool)

(assert (=> b!748425 (=> (not res!504959) (not e!417692))))

(declare-fun lt!332579 () SeekEntryResult!7573)

(declare-fun lt!332578 () SeekEntryResult!7573)

(assert (=> b!748425 (= res!504959 (= lt!332579 lt!332578))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!748425 (= lt!332578 (Found!7573 j!159))))

(declare-datatypes ((array!41724 0))(
  ( (array!41725 (arr!19976 (Array (_ BitVec 32) (_ BitVec 64))) (size!20397 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41724)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41724 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!748425 (= lt!332579 (seekEntryOrOpen!0 (select (arr!19976 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41724 (_ BitVec 32)) Bool)

(assert (=> b!748425 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25652 0))(
  ( (Unit!25653) )
))
(declare-fun lt!332577 () Unit!25652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25652)

(assert (=> b!748425 (= lt!332577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748426 () Bool)

(assert (=> b!748426 (= e!417693 true)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748426 (= (select (store (arr!19976 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332582 () Unit!25652)

(declare-fun e!417690 () Unit!25652)

(assert (=> b!748426 (= lt!332582 e!417690)))

(declare-fun c!82122 () Bool)

(assert (=> b!748426 (= c!82122 (= (select (store (arr!19976 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748427 () Bool)

(declare-fun Unit!25654 () Unit!25652)

(assert (=> b!748427 (= e!417690 Unit!25654)))

(assert (=> b!748427 false))

(declare-fun b!748428 () Bool)

(declare-fun e!417686 () Bool)

(assert (=> b!748428 (= e!417686 e!417688)))

(declare-fun res!504948 () Bool)

(assert (=> b!748428 (=> (not res!504948) (not e!417688))))

(declare-fun lt!332580 () SeekEntryResult!7573)

(assert (=> b!748428 (= res!504948 (= lt!332580 lt!332585))))

(declare-fun lt!332576 () array!41724)

(declare-fun lt!332581 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41724 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!748428 (= lt!332585 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332581 lt!332576 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748428 (= lt!332580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332581 mask!3328) lt!332581 lt!332576 mask!3328))))

(assert (=> b!748428 (= lt!332581 (select (store (arr!19976 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748428 (= lt!332576 (array!41725 (store (arr!19976 a!3186) i!1173 k0!2102) (size!20397 a!3186)))))

(declare-fun b!748429 () Bool)

(declare-fun res!504953 () Bool)

(assert (=> b!748429 (=> (not res!504953) (not e!417686))))

(declare-fun e!417687 () Bool)

(assert (=> b!748429 (= res!504953 e!417687)))

(declare-fun c!82121 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748429 (= c!82121 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748430 () Bool)

(declare-fun res!504949 () Bool)

(declare-fun e!417694 () Bool)

(assert (=> b!748430 (=> (not res!504949) (not e!417694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748430 (= res!504949 (validKeyInArray!0 k0!2102))))

(declare-fun b!748431 () Bool)

(declare-fun res!504958 () Bool)

(assert (=> b!748431 (=> (not res!504958) (not e!417694))))

(assert (=> b!748431 (= res!504958 (and (= (size!20397 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20397 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20397 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748432 () Bool)

(declare-fun e!417691 () Bool)

(assert (=> b!748432 (= e!417691 e!417686)))

(declare-fun res!504957 () Bool)

(assert (=> b!748432 (=> (not res!504957) (not e!417686))))

(declare-fun lt!332583 () SeekEntryResult!7573)

(assert (=> b!748432 (= res!504957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19976 a!3186) j!159) mask!3328) (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332583))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!748432 (= lt!332583 (Intermediate!7573 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748433 () Bool)

(declare-fun res!504946 () Bool)

(assert (=> b!748433 (=> (not res!504946) (not e!417691))))

(assert (=> b!748433 (= res!504946 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20397 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20397 a!3186))))))

(declare-fun b!748434 () Bool)

(declare-fun res!504954 () Bool)

(assert (=> b!748434 (=> (not res!504954) (not e!417691))))

(assert (=> b!748434 (= res!504954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!504955 () Bool)

(assert (=> start!65534 (=> (not res!504955) (not e!417694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65534 (= res!504955 (validMask!0 mask!3328))))

(assert (=> start!65534 e!417694))

(assert (=> start!65534 true))

(declare-fun array_inv!15859 (array!41724) Bool)

(assert (=> start!65534 (array_inv!15859 a!3186)))

(declare-fun b!748435 () Bool)

(assert (=> b!748435 (= e!417687 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332583))))

(declare-fun b!748436 () Bool)

(declare-fun Unit!25655 () Unit!25652)

(assert (=> b!748436 (= e!417690 Unit!25655)))

(declare-fun b!748437 () Bool)

(declare-fun res!504952 () Bool)

(assert (=> b!748437 (=> (not res!504952) (not e!417686))))

(assert (=> b!748437 (= res!504952 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19976 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748438 () Bool)

(declare-fun res!504945 () Bool)

(assert (=> b!748438 (=> (not res!504945) (not e!417694))))

(declare-fun arrayContainsKey!0 (array!41724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748438 (= res!504945 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748439 () Bool)

(declare-fun res!504960 () Bool)

(assert (=> b!748439 (=> res!504960 e!417693)))

(assert (=> b!748439 (= res!504960 (= (select (store (arr!19976 a!3186) i!1173 k0!2102) index!1321) lt!332581))))

(declare-fun b!748440 () Bool)

(assert (=> b!748440 (= e!417694 e!417691)))

(declare-fun res!504950 () Bool)

(assert (=> b!748440 (=> (not res!504950) (not e!417691))))

(declare-fun lt!332584 () SeekEntryResult!7573)

(assert (=> b!748440 (= res!504950 (or (= lt!332584 (MissingZero!7573 i!1173)) (= lt!332584 (MissingVacant!7573 i!1173))))))

(assert (=> b!748440 (= lt!332584 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748441 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41724 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!748441 (= e!417692 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332578))))

(declare-fun b!748442 () Bool)

(declare-fun res!504944 () Bool)

(assert (=> b!748442 (=> (not res!504944) (not e!417691))))

(declare-datatypes ((List!14017 0))(
  ( (Nil!14014) (Cons!14013 (h!15085 (_ BitVec 64)) (t!20323 List!14017)) )
))
(declare-fun arrayNoDuplicates!0 (array!41724 (_ BitVec 32) List!14017) Bool)

(assert (=> b!748442 (= res!504944 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14014))))

(declare-fun b!748443 () Bool)

(assert (=> b!748443 (= e!417687 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) (Found!7573 j!159)))))

(declare-fun b!748444 () Bool)

(declare-fun res!504951 () Bool)

(assert (=> b!748444 (=> res!504951 e!417693)))

(assert (=> b!748444 (= res!504951 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332578)))))

(declare-fun b!748445 () Bool)

(declare-fun res!504947 () Bool)

(assert (=> b!748445 (=> (not res!504947) (not e!417694))))

(assert (=> b!748445 (= res!504947 (validKeyInArray!0 (select (arr!19976 a!3186) j!159)))))

(assert (= (and start!65534 res!504955) b!748431))

(assert (= (and b!748431 res!504958) b!748445))

(assert (= (and b!748445 res!504947) b!748430))

(assert (= (and b!748430 res!504949) b!748438))

(assert (= (and b!748438 res!504945) b!748440))

(assert (= (and b!748440 res!504950) b!748434))

(assert (= (and b!748434 res!504954) b!748442))

(assert (= (and b!748442 res!504944) b!748433))

(assert (= (and b!748433 res!504946) b!748432))

(assert (= (and b!748432 res!504957) b!748437))

(assert (= (and b!748437 res!504952) b!748429))

(assert (= (and b!748429 c!82121) b!748435))

(assert (= (and b!748429 (not c!82121)) b!748443))

(assert (= (and b!748429 res!504953) b!748428))

(assert (= (and b!748428 res!504948) b!748425))

(assert (= (and b!748425 res!504959) b!748441))

(assert (= (and b!748425 (not res!504956)) b!748444))

(assert (= (and b!748444 (not res!504951)) b!748439))

(assert (= (and b!748439 (not res!504960)) b!748426))

(assert (= (and b!748426 c!82122) b!748427))

(assert (= (and b!748426 (not c!82122)) b!748436))

(declare-fun m!697703 () Bool)

(assert (=> b!748441 m!697703))

(assert (=> b!748441 m!697703))

(declare-fun m!697705 () Bool)

(assert (=> b!748441 m!697705))

(assert (=> b!748443 m!697703))

(assert (=> b!748443 m!697703))

(declare-fun m!697707 () Bool)

(assert (=> b!748443 m!697707))

(declare-fun m!697709 () Bool)

(assert (=> b!748438 m!697709))

(assert (=> b!748444 m!697703))

(assert (=> b!748444 m!697703))

(assert (=> b!748444 m!697707))

(declare-fun m!697711 () Bool)

(assert (=> b!748439 m!697711))

(declare-fun m!697713 () Bool)

(assert (=> b!748439 m!697713))

(declare-fun m!697715 () Bool)

(assert (=> start!65534 m!697715))

(declare-fun m!697717 () Bool)

(assert (=> start!65534 m!697717))

(declare-fun m!697719 () Bool)

(assert (=> b!748428 m!697719))

(assert (=> b!748428 m!697719))

(declare-fun m!697721 () Bool)

(assert (=> b!748428 m!697721))

(assert (=> b!748428 m!697711))

(declare-fun m!697723 () Bool)

(assert (=> b!748428 m!697723))

(declare-fun m!697725 () Bool)

(assert (=> b!748428 m!697725))

(assert (=> b!748445 m!697703))

(assert (=> b!748445 m!697703))

(declare-fun m!697727 () Bool)

(assert (=> b!748445 m!697727))

(declare-fun m!697729 () Bool)

(assert (=> b!748434 m!697729))

(declare-fun m!697731 () Bool)

(assert (=> b!748430 m!697731))

(assert (=> b!748432 m!697703))

(assert (=> b!748432 m!697703))

(declare-fun m!697733 () Bool)

(assert (=> b!748432 m!697733))

(assert (=> b!748432 m!697733))

(assert (=> b!748432 m!697703))

(declare-fun m!697735 () Bool)

(assert (=> b!748432 m!697735))

(declare-fun m!697737 () Bool)

(assert (=> b!748437 m!697737))

(declare-fun m!697739 () Bool)

(assert (=> b!748442 m!697739))

(assert (=> b!748425 m!697703))

(assert (=> b!748425 m!697703))

(declare-fun m!697741 () Bool)

(assert (=> b!748425 m!697741))

(declare-fun m!697743 () Bool)

(assert (=> b!748425 m!697743))

(declare-fun m!697745 () Bool)

(assert (=> b!748425 m!697745))

(assert (=> b!748426 m!697711))

(assert (=> b!748426 m!697713))

(assert (=> b!748435 m!697703))

(assert (=> b!748435 m!697703))

(declare-fun m!697747 () Bool)

(assert (=> b!748435 m!697747))

(declare-fun m!697749 () Bool)

(assert (=> b!748440 m!697749))

(check-sat (not b!748435) (not b!748434) (not b!748442) (not b!748445) (not b!748443) (not b!748438) (not b!748430) (not b!748441) (not b!748444) (not b!748440) (not b!748432) (not b!748425) (not b!748428) (not start!65534))
(check-sat)
