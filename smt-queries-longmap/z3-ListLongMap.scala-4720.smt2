; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65360 () Bool)

(assert start!65360)

(declare-fun b!743433 () Bool)

(declare-fun e!415330 () Bool)

(declare-fun e!415336 () Bool)

(assert (=> b!743433 (= e!415330 e!415336)))

(declare-fun res!500655 () Bool)

(assert (=> b!743433 (=> (not res!500655) (not e!415336))))

(declare-datatypes ((array!41550 0))(
  ( (array!41551 (arr!19889 (Array (_ BitVec 32) (_ BitVec 64))) (size!20310 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41550)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7486 0))(
  ( (MissingZero!7486 (index!32312 (_ BitVec 32))) (Found!7486 (index!32313 (_ BitVec 32))) (Intermediate!7486 (undefined!8298 Bool) (index!32314 (_ BitVec 32)) (x!63287 (_ BitVec 32))) (Undefined!7486) (MissingVacant!7486 (index!32315 (_ BitVec 32))) )
))
(declare-fun lt!330110 () SeekEntryResult!7486)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41550 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!743433 (= res!500655 (= (seekEntryOrOpen!0 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330110))))

(assert (=> b!743433 (= lt!330110 (Found!7486 j!159))))

(declare-fun b!743434 () Bool)

(declare-fun res!500645 () Bool)

(declare-fun e!415328 () Bool)

(assert (=> b!743434 (=> (not res!500645) (not e!415328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743434 (= res!500645 (validKeyInArray!0 (select (arr!19889 a!3186) j!159)))))

(declare-fun b!743435 () Bool)

(declare-fun res!500647 () Bool)

(declare-fun e!415331 () Bool)

(assert (=> b!743435 (=> (not res!500647) (not e!415331))))

(declare-datatypes ((List!13930 0))(
  ( (Nil!13927) (Cons!13926 (h!14998 (_ BitVec 64)) (t!20236 List!13930)) )
))
(declare-fun arrayNoDuplicates!0 (array!41550 (_ BitVec 32) List!13930) Bool)

(assert (=> b!743435 (= res!500647 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13927))))

(declare-fun b!743436 () Bool)

(declare-fun res!500651 () Bool)

(assert (=> b!743436 (=> (not res!500651) (not e!415331))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743436 (= res!500651 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20310 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20310 a!3186))))))

(declare-fun b!743437 () Bool)

(declare-fun e!415334 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41550 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!743437 (= e!415334 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) (Found!7486 j!159)))))

(declare-fun b!743438 () Bool)

(declare-fun res!500640 () Bool)

(assert (=> b!743438 (=> (not res!500640) (not e!415328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743438 (= res!500640 (and (= (size!20310 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20310 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20310 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743439 () Bool)

(declare-fun res!500652 () Bool)

(declare-fun e!415329 () Bool)

(assert (=> b!743439 (=> (not res!500652) (not e!415329))))

(assert (=> b!743439 (= res!500652 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19889 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743441 () Bool)

(declare-fun res!500642 () Bool)

(assert (=> b!743441 (=> (not res!500642) (not e!415328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!743441 (= res!500642 (validKeyInArray!0 k0!2102))))

(declare-fun b!743442 () Bool)

(assert (=> b!743442 (= e!415336 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330110))))

(declare-fun b!743443 () Bool)

(declare-fun res!500641 () Bool)

(assert (=> b!743443 (=> (not res!500641) (not e!415331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41550 (_ BitVec 32)) Bool)

(assert (=> b!743443 (= res!500641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743444 () Bool)

(assert (=> b!743444 (= e!415331 e!415329)))

(declare-fun res!500648 () Bool)

(assert (=> b!743444 (=> (not res!500648) (not e!415329))))

(declare-fun lt!330112 () SeekEntryResult!7486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41550 (_ BitVec 32)) SeekEntryResult!7486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743444 (= res!500648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19889 a!3186) j!159) mask!3328) (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330112))))

(assert (=> b!743444 (= lt!330112 (Intermediate!7486 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743445 () Bool)

(declare-fun res!500649 () Bool)

(assert (=> b!743445 (=> (not res!500649) (not e!415329))))

(assert (=> b!743445 (= res!500649 e!415334)))

(declare-fun c!81777 () Bool)

(assert (=> b!743445 (= c!81777 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743446 () Bool)

(assert (=> b!743446 (= e!415328 e!415331)))

(declare-fun res!500646 () Bool)

(assert (=> b!743446 (=> (not res!500646) (not e!415331))))

(declare-fun lt!330115 () SeekEntryResult!7486)

(assert (=> b!743446 (= res!500646 (or (= lt!330115 (MissingZero!7486 i!1173)) (= lt!330115 (MissingVacant!7486 i!1173))))))

(assert (=> b!743446 (= lt!330115 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743447 () Bool)

(declare-fun e!415335 () Bool)

(assert (=> b!743447 (= e!415335 true)))

(declare-fun lt!330109 () SeekEntryResult!7486)

(assert (=> b!743447 (= lt!330109 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19889 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743448 () Bool)

(declare-fun e!415333 () Bool)

(assert (=> b!743448 (= e!415333 (not e!415335))))

(declare-fun res!500653 () Bool)

(assert (=> b!743448 (=> res!500653 e!415335)))

(declare-fun lt!330113 () SeekEntryResult!7486)

(get-info :version)

(assert (=> b!743448 (= res!500653 (or (not ((_ is Intermediate!7486) lt!330113)) (bvslt x!1131 (x!63287 lt!330113)) (not (= x!1131 (x!63287 lt!330113))) (not (= index!1321 (index!32314 lt!330113)))))))

(assert (=> b!743448 e!415330))

(declare-fun res!500654 () Bool)

(assert (=> b!743448 (=> (not res!500654) (not e!415330))))

(assert (=> b!743448 (= res!500654 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25424 0))(
  ( (Unit!25425) )
))
(declare-fun lt!330114 () Unit!25424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25424)

(assert (=> b!743448 (= lt!330114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743449 () Bool)

(assert (=> b!743449 (= e!415329 e!415333)))

(declare-fun res!500650 () Bool)

(assert (=> b!743449 (=> (not res!500650) (not e!415333))))

(declare-fun lt!330108 () SeekEntryResult!7486)

(assert (=> b!743449 (= res!500650 (= lt!330108 lt!330113))))

(declare-fun lt!330116 () array!41550)

(declare-fun lt!330111 () (_ BitVec 64))

(assert (=> b!743449 (= lt!330113 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330111 lt!330116 mask!3328))))

(assert (=> b!743449 (= lt!330108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330111 mask!3328) lt!330111 lt!330116 mask!3328))))

(assert (=> b!743449 (= lt!330111 (select (store (arr!19889 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743449 (= lt!330116 (array!41551 (store (arr!19889 a!3186) i!1173 k0!2102) (size!20310 a!3186)))))

(declare-fun b!743450 () Bool)

(assert (=> b!743450 (= e!415334 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330112))))

(declare-fun b!743440 () Bool)

(declare-fun res!500644 () Bool)

(assert (=> b!743440 (=> (not res!500644) (not e!415328))))

(declare-fun arrayContainsKey!0 (array!41550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743440 (= res!500644 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!500643 () Bool)

(assert (=> start!65360 (=> (not res!500643) (not e!415328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65360 (= res!500643 (validMask!0 mask!3328))))

(assert (=> start!65360 e!415328))

(assert (=> start!65360 true))

(declare-fun array_inv!15772 (array!41550) Bool)

(assert (=> start!65360 (array_inv!15772 a!3186)))

(assert (= (and start!65360 res!500643) b!743438))

(assert (= (and b!743438 res!500640) b!743434))

(assert (= (and b!743434 res!500645) b!743441))

(assert (= (and b!743441 res!500642) b!743440))

(assert (= (and b!743440 res!500644) b!743446))

(assert (= (and b!743446 res!500646) b!743443))

(assert (= (and b!743443 res!500641) b!743435))

(assert (= (and b!743435 res!500647) b!743436))

(assert (= (and b!743436 res!500651) b!743444))

(assert (= (and b!743444 res!500648) b!743439))

(assert (= (and b!743439 res!500652) b!743445))

(assert (= (and b!743445 c!81777) b!743450))

(assert (= (and b!743445 (not c!81777)) b!743437))

(assert (= (and b!743445 res!500649) b!743449))

(assert (= (and b!743449 res!500650) b!743448))

(assert (= (and b!743448 res!500654) b!743433))

(assert (= (and b!743433 res!500655) b!743442))

(assert (= (and b!743448 (not res!500653)) b!743447))

(declare-fun m!693569 () Bool)

(assert (=> b!743444 m!693569))

(assert (=> b!743444 m!693569))

(declare-fun m!693571 () Bool)

(assert (=> b!743444 m!693571))

(assert (=> b!743444 m!693571))

(assert (=> b!743444 m!693569))

(declare-fun m!693573 () Bool)

(assert (=> b!743444 m!693573))

(declare-fun m!693575 () Bool)

(assert (=> start!65360 m!693575))

(declare-fun m!693577 () Bool)

(assert (=> start!65360 m!693577))

(declare-fun m!693579 () Bool)

(assert (=> b!743440 m!693579))

(assert (=> b!743434 m!693569))

(assert (=> b!743434 m!693569))

(declare-fun m!693581 () Bool)

(assert (=> b!743434 m!693581))

(declare-fun m!693583 () Bool)

(assert (=> b!743435 m!693583))

(declare-fun m!693585 () Bool)

(assert (=> b!743439 m!693585))

(assert (=> b!743433 m!693569))

(assert (=> b!743433 m!693569))

(declare-fun m!693587 () Bool)

(assert (=> b!743433 m!693587))

(declare-fun m!693589 () Bool)

(assert (=> b!743448 m!693589))

(declare-fun m!693591 () Bool)

(assert (=> b!743448 m!693591))

(assert (=> b!743450 m!693569))

(assert (=> b!743450 m!693569))

(declare-fun m!693593 () Bool)

(assert (=> b!743450 m!693593))

(assert (=> b!743447 m!693569))

(assert (=> b!743447 m!693569))

(declare-fun m!693595 () Bool)

(assert (=> b!743447 m!693595))

(declare-fun m!693597 () Bool)

(assert (=> b!743449 m!693597))

(declare-fun m!693599 () Bool)

(assert (=> b!743449 m!693599))

(declare-fun m!693601 () Bool)

(assert (=> b!743449 m!693601))

(declare-fun m!693603 () Bool)

(assert (=> b!743449 m!693603))

(declare-fun m!693605 () Bool)

(assert (=> b!743449 m!693605))

(assert (=> b!743449 m!693597))

(declare-fun m!693607 () Bool)

(assert (=> b!743446 m!693607))

(assert (=> b!743442 m!693569))

(assert (=> b!743442 m!693569))

(declare-fun m!693609 () Bool)

(assert (=> b!743442 m!693609))

(assert (=> b!743437 m!693569))

(assert (=> b!743437 m!693569))

(assert (=> b!743437 m!693595))

(declare-fun m!693611 () Bool)

(assert (=> b!743441 m!693611))

(declare-fun m!693613 () Bool)

(assert (=> b!743443 m!693613))

(check-sat (not b!743441) (not b!743437) (not b!743447) (not b!743434) (not start!65360) (not b!743449) (not b!743444) (not b!743448) (not b!743443) (not b!743440) (not b!743450) (not b!743446) (not b!743442) (not b!743435) (not b!743433))
(check-sat)
