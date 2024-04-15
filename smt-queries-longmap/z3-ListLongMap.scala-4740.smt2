; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65480 () Bool)

(assert start!65480)

(declare-fun b!746715 () Bool)

(declare-fun res!503566 () Bool)

(declare-fun e!416949 () Bool)

(assert (=> b!746715 (=> (not res!503566) (not e!416949))))

(declare-fun e!416952 () Bool)

(assert (=> b!746715 (= res!503566 e!416952)))

(declare-fun c!81959 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746715 (= c!81959 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746716 () Bool)

(declare-fun res!503564 () Bool)

(assert (=> b!746716 (=> (not res!503564) (not e!416949))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41670 0))(
  ( (array!41671 (arr!19949 (Array (_ BitVec 32) (_ BitVec 64))) (size!20370 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41670)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746716 (= res!503564 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19949 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746717 () Bool)

(declare-fun res!503572 () Bool)

(declare-fun e!416953 () Bool)

(assert (=> b!746717 (=> res!503572 e!416953)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7546 0))(
  ( (MissingZero!7546 (index!32552 (_ BitVec 32))) (Found!7546 (index!32553 (_ BitVec 32))) (Intermediate!7546 (undefined!8358 Bool) (index!32554 (_ BitVec 32)) (x!63507 (_ BitVec 32))) (Undefined!7546) (MissingVacant!7546 (index!32555 (_ BitVec 32))) )
))
(declare-fun lt!331767 () SeekEntryResult!7546)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41670 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!746717 (= res!503572 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331767)))))

(declare-fun b!746718 () Bool)

(declare-fun e!416955 () Bool)

(assert (=> b!746718 (= e!416955 (not e!416953))))

(declare-fun res!503571 () Bool)

(assert (=> b!746718 (=> res!503571 e!416953)))

(declare-fun lt!331774 () SeekEntryResult!7546)

(get-info :version)

(assert (=> b!746718 (= res!503571 (or (not ((_ is Intermediate!7546) lt!331774)) (bvslt x!1131 (x!63507 lt!331774)) (not (= x!1131 (x!63507 lt!331774))) (not (= index!1321 (index!32554 lt!331774)))))))

(declare-fun e!416954 () Bool)

(assert (=> b!746718 e!416954))

(declare-fun res!503559 () Bool)

(assert (=> b!746718 (=> (not res!503559) (not e!416954))))

(declare-fun lt!331768 () SeekEntryResult!7546)

(assert (=> b!746718 (= res!503559 (= lt!331768 lt!331767))))

(assert (=> b!746718 (= lt!331767 (Found!7546 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41670 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!746718 (= lt!331768 (seekEntryOrOpen!0 (select (arr!19949 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41670 (_ BitVec 32)) Bool)

(assert (=> b!746718 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25544 0))(
  ( (Unit!25545) )
))
(declare-fun lt!331770 () Unit!25544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25544)

(assert (=> b!746718 (= lt!331770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746719 () Bool)

(declare-fun res!503561 () Bool)

(declare-fun e!416956 () Bool)

(assert (=> b!746719 (=> (not res!503561) (not e!416956))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746719 (= res!503561 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!331775 () SeekEntryResult!7546)

(declare-fun b!746721 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41670 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!746721 (= e!416952 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331775))))

(declare-fun b!746722 () Bool)

(declare-fun e!416948 () Unit!25544)

(declare-fun Unit!25546 () Unit!25544)

(assert (=> b!746722 (= e!416948 Unit!25546)))

(assert (=> b!746722 false))

(declare-fun b!746723 () Bool)

(declare-fun e!416950 () Bool)

(assert (=> b!746723 (= e!416950 e!416949)))

(declare-fun res!503562 () Bool)

(assert (=> b!746723 (=> (not res!503562) (not e!416949))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746723 (= res!503562 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19949 a!3186) j!159) mask!3328) (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331775))))

(assert (=> b!746723 (= lt!331775 (Intermediate!7546 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746724 () Bool)

(declare-fun res!503574 () Bool)

(assert (=> b!746724 (=> (not res!503574) (not e!416956))))

(assert (=> b!746724 (= res!503574 (and (= (size!20370 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20370 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20370 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746725 () Bool)

(declare-fun res!503573 () Bool)

(assert (=> b!746725 (=> (not res!503573) (not e!416956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746725 (= res!503573 (validKeyInArray!0 (select (arr!19949 a!3186) j!159)))))

(declare-fun b!746726 () Bool)

(declare-fun res!503568 () Bool)

(assert (=> b!746726 (=> (not res!503568) (not e!416950))))

(assert (=> b!746726 (= res!503568 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20370 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20370 a!3186))))))

(declare-fun res!503569 () Bool)

(assert (=> start!65480 (=> (not res!503569) (not e!416956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65480 (= res!503569 (validMask!0 mask!3328))))

(assert (=> start!65480 e!416956))

(assert (=> start!65480 true))

(declare-fun array_inv!15832 (array!41670) Bool)

(assert (=> start!65480 (array_inv!15832 a!3186)))

(declare-fun b!746720 () Bool)

(declare-fun Unit!25547 () Unit!25544)

(assert (=> b!746720 (= e!416948 Unit!25547)))

(declare-fun b!746727 () Bool)

(declare-fun res!503565 () Bool)

(assert (=> b!746727 (=> (not res!503565) (not e!416950))))

(assert (=> b!746727 (= res!503565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746728 () Bool)

(declare-fun res!503570 () Bool)

(assert (=> b!746728 (=> (not res!503570) (not e!416950))))

(declare-datatypes ((List!13990 0))(
  ( (Nil!13987) (Cons!13986 (h!15058 (_ BitVec 64)) (t!20296 List!13990)) )
))
(declare-fun arrayNoDuplicates!0 (array!41670 (_ BitVec 32) List!13990) Bool)

(assert (=> b!746728 (= res!503570 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13987))))

(declare-fun b!746729 () Bool)

(assert (=> b!746729 (= e!416956 e!416950)))

(declare-fun res!503567 () Bool)

(assert (=> b!746729 (=> (not res!503567) (not e!416950))))

(declare-fun lt!331769 () SeekEntryResult!7546)

(assert (=> b!746729 (= res!503567 (or (= lt!331769 (MissingZero!7546 i!1173)) (= lt!331769 (MissingVacant!7546 i!1173))))))

(assert (=> b!746729 (= lt!331769 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746730 () Bool)

(declare-fun res!503560 () Bool)

(assert (=> b!746730 (=> res!503560 e!416953)))

(declare-fun lt!331766 () (_ BitVec 64))

(assert (=> b!746730 (= res!503560 (= (select (store (arr!19949 a!3186) i!1173 k0!2102) index!1321) lt!331766))))

(declare-fun b!746731 () Bool)

(assert (=> b!746731 (= e!416954 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331767))))

(declare-fun b!746732 () Bool)

(declare-fun res!503558 () Bool)

(assert (=> b!746732 (=> (not res!503558) (not e!416956))))

(assert (=> b!746732 (= res!503558 (validKeyInArray!0 k0!2102))))

(declare-fun b!746733 () Bool)

(assert (=> b!746733 (= e!416953 true)))

(assert (=> b!746733 (= (select (store (arr!19949 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331772 () Unit!25544)

(assert (=> b!746733 (= lt!331772 e!416948)))

(declare-fun c!81960 () Bool)

(assert (=> b!746733 (= c!81960 (= (select (store (arr!19949 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!746734 () Bool)

(assert (=> b!746734 (= e!416952 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) (Found!7546 j!159)))))

(declare-fun b!746735 () Bool)

(assert (=> b!746735 (= e!416949 e!416955)))

(declare-fun res!503563 () Bool)

(assert (=> b!746735 (=> (not res!503563) (not e!416955))))

(declare-fun lt!331771 () SeekEntryResult!7546)

(assert (=> b!746735 (= res!503563 (= lt!331771 lt!331774))))

(declare-fun lt!331773 () array!41670)

(assert (=> b!746735 (= lt!331774 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331766 lt!331773 mask!3328))))

(assert (=> b!746735 (= lt!331771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331766 mask!3328) lt!331766 lt!331773 mask!3328))))

(assert (=> b!746735 (= lt!331766 (select (store (arr!19949 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746735 (= lt!331773 (array!41671 (store (arr!19949 a!3186) i!1173 k0!2102) (size!20370 a!3186)))))

(assert (= (and start!65480 res!503569) b!746724))

(assert (= (and b!746724 res!503574) b!746725))

(assert (= (and b!746725 res!503573) b!746732))

(assert (= (and b!746732 res!503558) b!746719))

(assert (= (and b!746719 res!503561) b!746729))

(assert (= (and b!746729 res!503567) b!746727))

(assert (= (and b!746727 res!503565) b!746728))

(assert (= (and b!746728 res!503570) b!746726))

(assert (= (and b!746726 res!503568) b!746723))

(assert (= (and b!746723 res!503562) b!746716))

(assert (= (and b!746716 res!503564) b!746715))

(assert (= (and b!746715 c!81959) b!746721))

(assert (= (and b!746715 (not c!81959)) b!746734))

(assert (= (and b!746715 res!503566) b!746735))

(assert (= (and b!746735 res!503563) b!746718))

(assert (= (and b!746718 res!503559) b!746731))

(assert (= (and b!746718 (not res!503571)) b!746717))

(assert (= (and b!746717 (not res!503572)) b!746730))

(assert (= (and b!746730 (not res!503560)) b!746733))

(assert (= (and b!746733 c!81960) b!746722))

(assert (= (and b!746733 (not c!81960)) b!746720))

(declare-fun m!696401 () Bool)

(assert (=> b!746717 m!696401))

(assert (=> b!746717 m!696401))

(declare-fun m!696403 () Bool)

(assert (=> b!746717 m!696403))

(declare-fun m!696405 () Bool)

(assert (=> b!746733 m!696405))

(declare-fun m!696407 () Bool)

(assert (=> b!746733 m!696407))

(declare-fun m!696409 () Bool)

(assert (=> b!746729 m!696409))

(declare-fun m!696411 () Bool)

(assert (=> b!746728 m!696411))

(assert (=> b!746723 m!696401))

(assert (=> b!746723 m!696401))

(declare-fun m!696413 () Bool)

(assert (=> b!746723 m!696413))

(assert (=> b!746723 m!696413))

(assert (=> b!746723 m!696401))

(declare-fun m!696415 () Bool)

(assert (=> b!746723 m!696415))

(assert (=> b!746718 m!696401))

(assert (=> b!746718 m!696401))

(declare-fun m!696417 () Bool)

(assert (=> b!746718 m!696417))

(declare-fun m!696419 () Bool)

(assert (=> b!746718 m!696419))

(declare-fun m!696421 () Bool)

(assert (=> b!746718 m!696421))

(declare-fun m!696423 () Bool)

(assert (=> b!746735 m!696423))

(assert (=> b!746735 m!696423))

(declare-fun m!696425 () Bool)

(assert (=> b!746735 m!696425))

(assert (=> b!746735 m!696405))

(declare-fun m!696427 () Bool)

(assert (=> b!746735 m!696427))

(declare-fun m!696429 () Bool)

(assert (=> b!746735 m!696429))

(assert (=> b!746721 m!696401))

(assert (=> b!746721 m!696401))

(declare-fun m!696431 () Bool)

(assert (=> b!746721 m!696431))

(declare-fun m!696433 () Bool)

(assert (=> b!746716 m!696433))

(declare-fun m!696435 () Bool)

(assert (=> b!746727 m!696435))

(assert (=> b!746734 m!696401))

(assert (=> b!746734 m!696401))

(assert (=> b!746734 m!696403))

(assert (=> b!746730 m!696405))

(assert (=> b!746730 m!696407))

(declare-fun m!696437 () Bool)

(assert (=> b!746719 m!696437))

(declare-fun m!696439 () Bool)

(assert (=> start!65480 m!696439))

(declare-fun m!696441 () Bool)

(assert (=> start!65480 m!696441))

(declare-fun m!696443 () Bool)

(assert (=> b!746732 m!696443))

(assert (=> b!746725 m!696401))

(assert (=> b!746725 m!696401))

(declare-fun m!696445 () Bool)

(assert (=> b!746725 m!696445))

(assert (=> b!746731 m!696401))

(assert (=> b!746731 m!696401))

(declare-fun m!696447 () Bool)

(assert (=> b!746731 m!696447))

(check-sat (not b!746723) (not b!746721) (not b!746729) (not b!746718) (not b!746717) (not start!65480) (not b!746728) (not b!746719) (not b!746725) (not b!746727) (not b!746732) (not b!746735) (not b!746731) (not b!746734))
(check-sat)
