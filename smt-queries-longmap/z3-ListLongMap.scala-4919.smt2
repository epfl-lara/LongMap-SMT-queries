; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67876 () Bool)

(assert start!67876)

(declare-fun b!787508 () Bool)

(declare-datatypes ((Unit!27217 0))(
  ( (Unit!27218) )
))
(declare-fun e!437820 () Unit!27217)

(declare-fun Unit!27219 () Unit!27217)

(assert (=> b!787508 (= e!437820 Unit!27219)))

(declare-fun b!787509 () Bool)

(declare-fun res!533125 () Bool)

(declare-fun e!437816 () Bool)

(assert (=> b!787509 (=> (not res!533125) (not e!437816))))

(declare-datatypes ((array!42796 0))(
  ( (array!42797 (arr!20482 (Array (_ BitVec 32) (_ BitVec 64))) (size!20902 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42796)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787509 (= res!533125 (validKeyInArray!0 (select (arr!20482 a!3186) j!159)))))

(declare-fun b!787510 () Bool)

(declare-fun res!533109 () Bool)

(declare-fun e!437818 () Bool)

(assert (=> b!787510 (=> (not res!533109) (not e!437818))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351224 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!351226 () array!42796)

(declare-datatypes ((SeekEntryResult!8038 0))(
  ( (MissingZero!8038 (index!34520 (_ BitVec 32))) (Found!8038 (index!34521 (_ BitVec 32))) (Intermediate!8038 (undefined!8850 Bool) (index!34522 (_ BitVec 32)) (x!65621 (_ BitVec 32))) (Undefined!8038) (MissingVacant!8038 (index!34523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42796 (_ BitVec 32)) SeekEntryResult!8038)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42796 (_ BitVec 32)) SeekEntryResult!8038)

(assert (=> b!787510 (= res!533109 (= (seekEntryOrOpen!0 lt!351224 lt!351226 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351224 lt!351226 mask!3328)))))

(declare-fun b!787511 () Bool)

(declare-fun res!533127 () Bool)

(assert (=> b!787511 (=> (not res!533127) (not e!437816))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787511 (= res!533127 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787513 () Bool)

(declare-fun e!437814 () Bool)

(declare-fun e!437813 () Bool)

(assert (=> b!787513 (= e!437814 e!437813)))

(declare-fun res!533112 () Bool)

(assert (=> b!787513 (=> res!533112 e!437813)))

(declare-fun lt!351228 () (_ BitVec 64))

(assert (=> b!787513 (= res!533112 (= lt!351228 lt!351224))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787513 (= lt!351228 (select (store (arr!20482 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787514 () Bool)

(declare-fun res!533122 () Bool)

(declare-fun e!437815 () Bool)

(assert (=> b!787514 (=> (not res!533122) (not e!437815))))

(declare-datatypes ((List!14391 0))(
  ( (Nil!14388) (Cons!14387 (h!15516 (_ BitVec 64)) (t!20698 List!14391)) )
))
(declare-fun arrayNoDuplicates!0 (array!42796 (_ BitVec 32) List!14391) Bool)

(assert (=> b!787514 (= res!533122 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14388))))

(declare-fun b!787515 () Bool)

(declare-fun e!437823 () Bool)

(assert (=> b!787515 (= e!437823 e!437814)))

(declare-fun res!533116 () Bool)

(assert (=> b!787515 (=> res!533116 e!437814)))

(declare-fun lt!351225 () SeekEntryResult!8038)

(declare-fun lt!351222 () SeekEntryResult!8038)

(assert (=> b!787515 (= res!533116 (not (= lt!351225 lt!351222)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!787515 (= lt!351225 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20482 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787516 () Bool)

(declare-fun res!533120 () Bool)

(assert (=> b!787516 (=> (not res!533120) (not e!437816))))

(assert (=> b!787516 (= res!533120 (and (= (size!20902 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20902 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20902 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787517 () Bool)

(assert (=> b!787517 (= e!437813 true)))

(assert (=> b!787517 e!437818))

(declare-fun res!533113 () Bool)

(assert (=> b!787517 (=> (not res!533113) (not e!437818))))

(assert (=> b!787517 (= res!533113 (= lt!351228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351227 () Unit!27217)

(assert (=> b!787517 (= lt!351227 e!437820)))

(declare-fun c!87610 () Bool)

(assert (=> b!787517 (= c!87610 (= lt!351228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787518 () Bool)

(assert (=> b!787518 (= e!437816 e!437815)))

(declare-fun res!533114 () Bool)

(assert (=> b!787518 (=> (not res!533114) (not e!437815))))

(declare-fun lt!351231 () SeekEntryResult!8038)

(assert (=> b!787518 (= res!533114 (or (= lt!351231 (MissingZero!8038 i!1173)) (= lt!351231 (MissingVacant!8038 i!1173))))))

(assert (=> b!787518 (= lt!351231 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787519 () Bool)

(declare-fun res!533118 () Bool)

(assert (=> b!787519 (=> (not res!533118) (not e!437816))))

(assert (=> b!787519 (= res!533118 (validKeyInArray!0 k0!2102))))

(declare-fun b!787520 () Bool)

(declare-fun res!533115 () Bool)

(declare-fun e!437822 () Bool)

(assert (=> b!787520 (=> (not res!533115) (not e!437822))))

(assert (=> b!787520 (= res!533115 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20482 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787521 () Bool)

(declare-fun res!533117 () Bool)

(assert (=> b!787521 (=> (not res!533117) (not e!437815))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787521 (= res!533117 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20902 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20902 a!3186))))))

(declare-fun b!787522 () Bool)

(declare-fun res!533111 () Bool)

(assert (=> b!787522 (=> (not res!533111) (not e!437815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42796 (_ BitVec 32)) Bool)

(assert (=> b!787522 (= res!533111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787523 () Bool)

(declare-fun Unit!27220 () Unit!27217)

(assert (=> b!787523 (= e!437820 Unit!27220)))

(assert (=> b!787523 false))

(declare-fun lt!351230 () SeekEntryResult!8038)

(declare-fun b!787524 () Bool)

(declare-fun e!437819 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42796 (_ BitVec 32)) SeekEntryResult!8038)

(assert (=> b!787524 (= e!437819 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20482 a!3186) j!159) a!3186 mask!3328) lt!351230))))

(declare-fun b!787525 () Bool)

(declare-fun lt!351229 () SeekEntryResult!8038)

(assert (=> b!787525 (= e!437818 (= lt!351229 lt!351225))))

(declare-fun b!787526 () Bool)

(assert (=> b!787526 (= e!437815 e!437822)))

(declare-fun res!533126 () Bool)

(assert (=> b!787526 (=> (not res!533126) (not e!437822))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787526 (= res!533126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20482 a!3186) j!159) mask!3328) (select (arr!20482 a!3186) j!159) a!3186 mask!3328) lt!351230))))

(assert (=> b!787526 (= lt!351230 (Intermediate!8038 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!533123 () Bool)

(assert (=> start!67876 (=> (not res!533123) (not e!437816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67876 (= res!533123 (validMask!0 mask!3328))))

(assert (=> start!67876 e!437816))

(assert (=> start!67876 true))

(declare-fun array_inv!16341 (array!42796) Bool)

(assert (=> start!67876 (array_inv!16341 a!3186)))

(declare-fun b!787512 () Bool)

(assert (=> b!787512 (= e!437819 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20482 a!3186) j!159) a!3186 mask!3328) (Found!8038 j!159)))))

(declare-fun b!787527 () Bool)

(declare-fun res!533119 () Bool)

(assert (=> b!787527 (=> (not res!533119) (not e!437822))))

(assert (=> b!787527 (= res!533119 e!437819)))

(declare-fun c!87611 () Bool)

(assert (=> b!787527 (= c!87611 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787528 () Bool)

(declare-fun e!437824 () Bool)

(assert (=> b!787528 (= e!437824 (not e!437823))))

(declare-fun res!533121 () Bool)

(assert (=> b!787528 (=> res!533121 e!437823)))

(declare-fun lt!351232 () SeekEntryResult!8038)

(get-info :version)

(assert (=> b!787528 (= res!533121 (or (not ((_ is Intermediate!8038) lt!351232)) (bvslt x!1131 (x!65621 lt!351232)) (not (= x!1131 (x!65621 lt!351232))) (not (= index!1321 (index!34522 lt!351232)))))))

(declare-fun e!437817 () Bool)

(assert (=> b!787528 e!437817))

(declare-fun res!533110 () Bool)

(assert (=> b!787528 (=> (not res!533110) (not e!437817))))

(assert (=> b!787528 (= res!533110 (= lt!351229 lt!351222))))

(assert (=> b!787528 (= lt!351222 (Found!8038 j!159))))

(assert (=> b!787528 (= lt!351229 (seekEntryOrOpen!0 (select (arr!20482 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787528 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351223 () Unit!27217)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27217)

(assert (=> b!787528 (= lt!351223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787529 () Bool)

(assert (=> b!787529 (= e!437817 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20482 a!3186) j!159) a!3186 mask!3328) lt!351222))))

(declare-fun b!787530 () Bool)

(assert (=> b!787530 (= e!437822 e!437824)))

(declare-fun res!533124 () Bool)

(assert (=> b!787530 (=> (not res!533124) (not e!437824))))

(declare-fun lt!351221 () SeekEntryResult!8038)

(assert (=> b!787530 (= res!533124 (= lt!351221 lt!351232))))

(assert (=> b!787530 (= lt!351232 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351224 lt!351226 mask!3328))))

(assert (=> b!787530 (= lt!351221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351224 mask!3328) lt!351224 lt!351226 mask!3328))))

(assert (=> b!787530 (= lt!351224 (select (store (arr!20482 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787530 (= lt!351226 (array!42797 (store (arr!20482 a!3186) i!1173 k0!2102) (size!20902 a!3186)))))

(assert (= (and start!67876 res!533123) b!787516))

(assert (= (and b!787516 res!533120) b!787509))

(assert (= (and b!787509 res!533125) b!787519))

(assert (= (and b!787519 res!533118) b!787511))

(assert (= (and b!787511 res!533127) b!787518))

(assert (= (and b!787518 res!533114) b!787522))

(assert (= (and b!787522 res!533111) b!787514))

(assert (= (and b!787514 res!533122) b!787521))

(assert (= (and b!787521 res!533117) b!787526))

(assert (= (and b!787526 res!533126) b!787520))

(assert (= (and b!787520 res!533115) b!787527))

(assert (= (and b!787527 c!87611) b!787524))

(assert (= (and b!787527 (not c!87611)) b!787512))

(assert (= (and b!787527 res!533119) b!787530))

(assert (= (and b!787530 res!533124) b!787528))

(assert (= (and b!787528 res!533110) b!787529))

(assert (= (and b!787528 (not res!533121)) b!787515))

(assert (= (and b!787515 (not res!533116)) b!787513))

(assert (= (and b!787513 (not res!533112)) b!787517))

(assert (= (and b!787517 c!87610) b!787523))

(assert (= (and b!787517 (not c!87610)) b!787508))

(assert (= (and b!787517 res!533113) b!787510))

(assert (= (and b!787510 res!533109) b!787525))

(declare-fun m!729647 () Bool)

(assert (=> b!787529 m!729647))

(assert (=> b!787529 m!729647))

(declare-fun m!729649 () Bool)

(assert (=> b!787529 m!729649))

(assert (=> b!787524 m!729647))

(assert (=> b!787524 m!729647))

(declare-fun m!729651 () Bool)

(assert (=> b!787524 m!729651))

(declare-fun m!729653 () Bool)

(assert (=> b!787511 m!729653))

(declare-fun m!729655 () Bool)

(assert (=> b!787520 m!729655))

(assert (=> b!787528 m!729647))

(assert (=> b!787528 m!729647))

(declare-fun m!729657 () Bool)

(assert (=> b!787528 m!729657))

(declare-fun m!729659 () Bool)

(assert (=> b!787528 m!729659))

(declare-fun m!729661 () Bool)

(assert (=> b!787528 m!729661))

(declare-fun m!729663 () Bool)

(assert (=> b!787513 m!729663))

(declare-fun m!729665 () Bool)

(assert (=> b!787513 m!729665))

(declare-fun m!729667 () Bool)

(assert (=> b!787514 m!729667))

(assert (=> b!787526 m!729647))

(assert (=> b!787526 m!729647))

(declare-fun m!729669 () Bool)

(assert (=> b!787526 m!729669))

(assert (=> b!787526 m!729669))

(assert (=> b!787526 m!729647))

(declare-fun m!729671 () Bool)

(assert (=> b!787526 m!729671))

(declare-fun m!729673 () Bool)

(assert (=> b!787530 m!729673))

(assert (=> b!787530 m!729663))

(declare-fun m!729675 () Bool)

(assert (=> b!787530 m!729675))

(declare-fun m!729677 () Bool)

(assert (=> b!787530 m!729677))

(declare-fun m!729679 () Bool)

(assert (=> b!787530 m!729679))

(assert (=> b!787530 m!729675))

(assert (=> b!787509 m!729647))

(assert (=> b!787509 m!729647))

(declare-fun m!729681 () Bool)

(assert (=> b!787509 m!729681))

(declare-fun m!729683 () Bool)

(assert (=> b!787518 m!729683))

(declare-fun m!729685 () Bool)

(assert (=> b!787519 m!729685))

(declare-fun m!729687 () Bool)

(assert (=> start!67876 m!729687))

(declare-fun m!729689 () Bool)

(assert (=> start!67876 m!729689))

(declare-fun m!729691 () Bool)

(assert (=> b!787522 m!729691))

(assert (=> b!787515 m!729647))

(assert (=> b!787515 m!729647))

(declare-fun m!729693 () Bool)

(assert (=> b!787515 m!729693))

(declare-fun m!729695 () Bool)

(assert (=> b!787510 m!729695))

(declare-fun m!729697 () Bool)

(assert (=> b!787510 m!729697))

(assert (=> b!787512 m!729647))

(assert (=> b!787512 m!729647))

(assert (=> b!787512 m!729693))

(check-sat (not b!787524) (not b!787526) (not b!787514) (not b!787530) (not b!787522) (not b!787510) (not b!787509) (not start!67876) (not b!787515) (not b!787519) (not b!787529) (not b!787528) (not b!787511) (not b!787512) (not b!787518))
(check-sat)
