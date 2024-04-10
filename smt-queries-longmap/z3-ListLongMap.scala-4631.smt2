; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64488 () Bool)

(assert start!64488)

(declare-datatypes ((array!41006 0))(
  ( (array!41007 (arr!19624 (Array (_ BitVec 32) (_ BitVec 64))) (size!20045 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41006)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!725519 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!406288 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7224 0))(
  ( (MissingZero!7224 (index!31264 (_ BitVec 32))) (Found!7224 (index!31265 (_ BitVec 32))) (Intermediate!7224 (undefined!8036 Bool) (index!31266 (_ BitVec 32)) (x!62258 (_ BitVec 32))) (Undefined!7224) (MissingVacant!7224 (index!31267 (_ BitVec 32))) )
))
(declare-fun lt!321376 () SeekEntryResult!7224)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41006 (_ BitVec 32)) SeekEntryResult!7224)

(assert (=> b!725519 (= e!406288 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321376))))

(declare-fun b!725520 () Bool)

(declare-fun res!486618 () Bool)

(declare-fun e!406292 () Bool)

(assert (=> b!725520 (=> (not res!486618) (not e!406292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725520 (= res!486618 (validKeyInArray!0 (select (arr!19624 a!3186) j!159)))))

(declare-fun b!725521 () Bool)

(declare-fun res!486620 () Bool)

(declare-fun e!406291 () Bool)

(assert (=> b!725521 (=> (not res!486620) (not e!406291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41006 (_ BitVec 32)) Bool)

(assert (=> b!725521 (= res!486620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725522 () Bool)

(assert (=> b!725522 (= e!406292 e!406291)))

(declare-fun res!486616 () Bool)

(assert (=> b!725522 (=> (not res!486616) (not e!406291))))

(declare-fun lt!321372 () SeekEntryResult!7224)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725522 (= res!486616 (or (= lt!321372 (MissingZero!7224 i!1173)) (= lt!321372 (MissingVacant!7224 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41006 (_ BitVec 32)) SeekEntryResult!7224)

(assert (=> b!725522 (= lt!321372 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!486612 () Bool)

(assert (=> start!64488 (=> (not res!486612) (not e!406292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64488 (= res!486612 (validMask!0 mask!3328))))

(assert (=> start!64488 e!406292))

(assert (=> start!64488 true))

(declare-fun array_inv!15420 (array!41006) Bool)

(assert (=> start!64488 (array_inv!15420 a!3186)))

(declare-fun b!725523 () Bool)

(declare-fun res!486615 () Bool)

(assert (=> b!725523 (=> (not res!486615) (not e!406291))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725523 (= res!486615 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20045 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20045 a!3186))))))

(declare-fun b!725524 () Bool)

(declare-fun e!406295 () Bool)

(declare-fun e!406289 () Bool)

(assert (=> b!725524 (= e!406295 e!406289)))

(declare-fun res!486609 () Bool)

(assert (=> b!725524 (=> (not res!486609) (not e!406289))))

(declare-fun lt!321374 () array!41006)

(declare-fun lt!321377 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41006 (_ BitVec 32)) SeekEntryResult!7224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725524 (= res!486609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321377 mask!3328) lt!321377 lt!321374 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321377 lt!321374 mask!3328)))))

(assert (=> b!725524 (= lt!321377 (select (store (arr!19624 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725524 (= lt!321374 (array!41007 (store (arr!19624 a!3186) i!1173 k0!2102) (size!20045 a!3186)))))

(declare-fun b!725525 () Bool)

(declare-fun res!486623 () Bool)

(assert (=> b!725525 (=> (not res!486623) (not e!406292))))

(assert (=> b!725525 (= res!486623 (and (= (size!20045 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20045 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20045 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725526 () Bool)

(assert (=> b!725526 (= e!406289 (not true))))

(declare-fun e!406290 () Bool)

(assert (=> b!725526 e!406290))

(declare-fun res!486622 () Bool)

(assert (=> b!725526 (=> (not res!486622) (not e!406290))))

(assert (=> b!725526 (= res!486622 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24766 0))(
  ( (Unit!24767) )
))
(declare-fun lt!321375 () Unit!24766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24766)

(assert (=> b!725526 (= lt!321375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725527 () Bool)

(assert (=> b!725527 (= e!406291 e!406295)))

(declare-fun res!486617 () Bool)

(assert (=> b!725527 (=> (not res!486617) (not e!406295))))

(declare-fun lt!321373 () SeekEntryResult!7224)

(assert (=> b!725527 (= res!486617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19624 a!3186) j!159) mask!3328) (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321373))))

(assert (=> b!725527 (= lt!321373 (Intermediate!7224 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!406293 () Bool)

(declare-fun b!725528 () Bool)

(assert (=> b!725528 (= e!406293 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321373))))

(declare-fun b!725529 () Bool)

(assert (=> b!725529 (= e!406293 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) (Found!7224 j!159)))))

(declare-fun b!725530 () Bool)

(declare-fun res!486611 () Bool)

(assert (=> b!725530 (=> (not res!486611) (not e!406291))))

(declare-datatypes ((List!13626 0))(
  ( (Nil!13623) (Cons!13622 (h!14679 (_ BitVec 64)) (t!19941 List!13626)) )
))
(declare-fun arrayNoDuplicates!0 (array!41006 (_ BitVec 32) List!13626) Bool)

(assert (=> b!725530 (= res!486611 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13623))))

(declare-fun b!725531 () Bool)

(declare-fun res!486621 () Bool)

(assert (=> b!725531 (=> (not res!486621) (not e!406292))))

(declare-fun arrayContainsKey!0 (array!41006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725531 (= res!486621 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725532 () Bool)

(declare-fun res!486619 () Bool)

(assert (=> b!725532 (=> (not res!486619) (not e!406295))))

(assert (=> b!725532 (= res!486619 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19624 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725533 () Bool)

(declare-fun res!486610 () Bool)

(assert (=> b!725533 (=> (not res!486610) (not e!406292))))

(assert (=> b!725533 (= res!486610 (validKeyInArray!0 k0!2102))))

(declare-fun b!725534 () Bool)

(declare-fun res!486613 () Bool)

(assert (=> b!725534 (=> (not res!486613) (not e!406295))))

(assert (=> b!725534 (= res!486613 e!406293)))

(declare-fun c!79828 () Bool)

(assert (=> b!725534 (= c!79828 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725535 () Bool)

(assert (=> b!725535 (= e!406290 e!406288)))

(declare-fun res!486614 () Bool)

(assert (=> b!725535 (=> (not res!486614) (not e!406288))))

(assert (=> b!725535 (= res!486614 (= (seekEntryOrOpen!0 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321376))))

(assert (=> b!725535 (= lt!321376 (Found!7224 j!159))))

(assert (= (and start!64488 res!486612) b!725525))

(assert (= (and b!725525 res!486623) b!725520))

(assert (= (and b!725520 res!486618) b!725533))

(assert (= (and b!725533 res!486610) b!725531))

(assert (= (and b!725531 res!486621) b!725522))

(assert (= (and b!725522 res!486616) b!725521))

(assert (= (and b!725521 res!486620) b!725530))

(assert (= (and b!725530 res!486611) b!725523))

(assert (= (and b!725523 res!486615) b!725527))

(assert (= (and b!725527 res!486617) b!725532))

(assert (= (and b!725532 res!486619) b!725534))

(assert (= (and b!725534 c!79828) b!725528))

(assert (= (and b!725534 (not c!79828)) b!725529))

(assert (= (and b!725534 res!486613) b!725524))

(assert (= (and b!725524 res!486609) b!725526))

(assert (= (and b!725526 res!486622) b!725535))

(assert (= (and b!725535 res!486614) b!725519))

(declare-fun m!679673 () Bool)

(assert (=> b!725531 m!679673))

(declare-fun m!679675 () Bool)

(assert (=> b!725529 m!679675))

(assert (=> b!725529 m!679675))

(declare-fun m!679677 () Bool)

(assert (=> b!725529 m!679677))

(declare-fun m!679679 () Bool)

(assert (=> b!725533 m!679679))

(declare-fun m!679681 () Bool)

(assert (=> b!725530 m!679681))

(assert (=> b!725535 m!679675))

(assert (=> b!725535 m!679675))

(declare-fun m!679683 () Bool)

(assert (=> b!725535 m!679683))

(assert (=> b!725527 m!679675))

(assert (=> b!725527 m!679675))

(declare-fun m!679685 () Bool)

(assert (=> b!725527 m!679685))

(assert (=> b!725527 m!679685))

(assert (=> b!725527 m!679675))

(declare-fun m!679687 () Bool)

(assert (=> b!725527 m!679687))

(assert (=> b!725528 m!679675))

(assert (=> b!725528 m!679675))

(declare-fun m!679689 () Bool)

(assert (=> b!725528 m!679689))

(assert (=> b!725520 m!679675))

(assert (=> b!725520 m!679675))

(declare-fun m!679691 () Bool)

(assert (=> b!725520 m!679691))

(declare-fun m!679693 () Bool)

(assert (=> b!725532 m!679693))

(declare-fun m!679695 () Bool)

(assert (=> b!725522 m!679695))

(declare-fun m!679697 () Bool)

(assert (=> start!64488 m!679697))

(declare-fun m!679699 () Bool)

(assert (=> start!64488 m!679699))

(declare-fun m!679701 () Bool)

(assert (=> b!725521 m!679701))

(declare-fun m!679703 () Bool)

(assert (=> b!725524 m!679703))

(declare-fun m!679705 () Bool)

(assert (=> b!725524 m!679705))

(declare-fun m!679707 () Bool)

(assert (=> b!725524 m!679707))

(declare-fun m!679709 () Bool)

(assert (=> b!725524 m!679709))

(assert (=> b!725524 m!679709))

(declare-fun m!679711 () Bool)

(assert (=> b!725524 m!679711))

(assert (=> b!725519 m!679675))

(assert (=> b!725519 m!679675))

(declare-fun m!679713 () Bool)

(assert (=> b!725519 m!679713))

(declare-fun m!679715 () Bool)

(assert (=> b!725526 m!679715))

(declare-fun m!679717 () Bool)

(assert (=> b!725526 m!679717))

(check-sat (not b!725535) (not b!725531) (not start!64488) (not b!725519) (not b!725530) (not b!725522) (not b!725524) (not b!725521) (not b!725526) (not b!725529) (not b!725527) (not b!725528) (not b!725533) (not b!725520))
(check-sat)
