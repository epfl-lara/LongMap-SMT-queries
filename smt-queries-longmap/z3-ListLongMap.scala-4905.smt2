; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67652 () Bool)

(assert start!67652)

(declare-fun b!783715 () Bool)

(declare-datatypes ((Unit!27032 0))(
  ( (Unit!27033) )
))
(declare-fun e!435735 () Unit!27032)

(declare-fun Unit!27034 () Unit!27032)

(assert (=> b!783715 (= e!435735 Unit!27034)))

(declare-fun b!783716 () Bool)

(declare-fun e!435734 () Bool)

(declare-fun e!435737 () Bool)

(assert (=> b!783716 (= e!435734 e!435737)))

(declare-fun res!530336 () Bool)

(assert (=> b!783716 (=> (not res!530336) (not e!435737))))

(declare-datatypes ((SeekEntryResult!8041 0))(
  ( (MissingZero!8041 (index!34532 (_ BitVec 32))) (Found!8041 (index!34533 (_ BitVec 32))) (Intermediate!8041 (undefined!8853 Bool) (index!34534 (_ BitVec 32)) (x!65496 (_ BitVec 32))) (Undefined!8041) (MissingVacant!8041 (index!34535 (_ BitVec 32))) )
))
(declare-fun lt!349203 () SeekEntryResult!8041)

(declare-fun lt!349205 () SeekEntryResult!8041)

(assert (=> b!783716 (= res!530336 (= lt!349203 lt!349205))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349204 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42711 0))(
  ( (array!42712 (arr!20444 (Array (_ BitVec 32) (_ BitVec 64))) (size!20865 (_ BitVec 32))) )
))
(declare-fun lt!349208 () array!42711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42711 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!783716 (= lt!349205 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349204 lt!349208 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783716 (= lt!349203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349204 mask!3328) lt!349204 lt!349208 mask!3328))))

(declare-fun a!3186 () array!42711)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!783716 (= lt!349204 (select (store (arr!20444 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783716 (= lt!349208 (array!42712 (store (arr!20444 a!3186) i!1173 k0!2102) (size!20865 a!3186)))))

(declare-fun b!783717 () Bool)

(declare-fun res!530338 () Bool)

(declare-fun e!435742 () Bool)

(assert (=> b!783717 (=> (not res!530338) (not e!435742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783717 (= res!530338 (validKeyInArray!0 k0!2102))))

(declare-fun b!783718 () Bool)

(declare-fun res!530346 () Bool)

(declare-fun e!435738 () Bool)

(assert (=> b!783718 (=> (not res!530346) (not e!435738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42711 (_ BitVec 32)) Bool)

(assert (=> b!783718 (= res!530346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783719 () Bool)

(declare-fun e!435731 () Bool)

(declare-fun lt!349201 () SeekEntryResult!8041)

(declare-fun lt!349200 () SeekEntryResult!8041)

(assert (=> b!783719 (= e!435731 (= lt!349201 lt!349200))))

(declare-fun e!435736 () Bool)

(declare-fun b!783720 () Bool)

(declare-fun lt!349197 () SeekEntryResult!8041)

(assert (=> b!783720 (= e!435736 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20444 a!3186) j!159) a!3186 mask!3328) lt!349197))))

(declare-fun b!783721 () Bool)

(declare-fun res!530337 () Bool)

(assert (=> b!783721 (=> (not res!530337) (not e!435742))))

(assert (=> b!783721 (= res!530337 (validKeyInArray!0 (select (arr!20444 a!3186) j!159)))))

(declare-fun b!783723 () Bool)

(declare-fun e!435740 () Bool)

(assert (=> b!783723 (= e!435737 (not e!435740))))

(declare-fun res!530343 () Bool)

(assert (=> b!783723 (=> res!530343 e!435740)))

(get-info :version)

(assert (=> b!783723 (= res!530343 (or (not ((_ is Intermediate!8041) lt!349205)) (bvslt x!1131 (x!65496 lt!349205)) (not (= x!1131 (x!65496 lt!349205))) (not (= index!1321 (index!34534 lt!349205)))))))

(declare-fun e!435741 () Bool)

(assert (=> b!783723 e!435741))

(declare-fun res!530341 () Bool)

(assert (=> b!783723 (=> (not res!530341) (not e!435741))))

(declare-fun lt!349207 () SeekEntryResult!8041)

(assert (=> b!783723 (= res!530341 (= lt!349201 lt!349207))))

(assert (=> b!783723 (= lt!349207 (Found!8041 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42711 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!783723 (= lt!349201 (seekEntryOrOpen!0 (select (arr!20444 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783723 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349198 () Unit!27032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27032)

(assert (=> b!783723 (= lt!349198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783724 () Bool)

(declare-fun e!435733 () Bool)

(assert (=> b!783724 (= e!435733 true)))

(assert (=> b!783724 e!435731))

(declare-fun res!530352 () Bool)

(assert (=> b!783724 (=> (not res!530352) (not e!435731))))

(declare-fun lt!349206 () (_ BitVec 64))

(assert (=> b!783724 (= res!530352 (= lt!349206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349199 () Unit!27032)

(assert (=> b!783724 (= lt!349199 e!435735)))

(declare-fun c!87098 () Bool)

(assert (=> b!783724 (= c!87098 (= lt!349206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783725 () Bool)

(declare-fun res!530339 () Bool)

(assert (=> b!783725 (=> (not res!530339) (not e!435742))))

(assert (=> b!783725 (= res!530339 (and (= (size!20865 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20865 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20865 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783726 () Bool)

(declare-fun Unit!27035 () Unit!27032)

(assert (=> b!783726 (= e!435735 Unit!27035)))

(assert (=> b!783726 false))

(declare-fun b!783727 () Bool)

(declare-fun res!530334 () Bool)

(assert (=> b!783727 (=> (not res!530334) (not e!435734))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!783727 (= res!530334 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20444 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783728 () Bool)

(declare-fun e!435739 () Bool)

(assert (=> b!783728 (= e!435740 e!435739)))

(declare-fun res!530351 () Bool)

(assert (=> b!783728 (=> res!530351 e!435739)))

(assert (=> b!783728 (= res!530351 (not (= lt!349200 lt!349207)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42711 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!783728 (= lt!349200 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20444 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783729 () Bool)

(assert (=> b!783729 (= e!435739 e!435733)))

(declare-fun res!530342 () Bool)

(assert (=> b!783729 (=> res!530342 e!435733)))

(assert (=> b!783729 (= res!530342 (= lt!349206 lt!349204))))

(assert (=> b!783729 (= lt!349206 (select (store (arr!20444 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783730 () Bool)

(declare-fun res!530340 () Bool)

(assert (=> b!783730 (=> (not res!530340) (not e!435734))))

(assert (=> b!783730 (= res!530340 e!435736)))

(declare-fun c!87099 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783730 (= c!87099 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783731 () Bool)

(declare-fun res!530347 () Bool)

(assert (=> b!783731 (=> (not res!530347) (not e!435742))))

(declare-fun arrayContainsKey!0 (array!42711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783731 (= res!530347 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783722 () Bool)

(assert (=> b!783722 (= e!435738 e!435734)))

(declare-fun res!530348 () Bool)

(assert (=> b!783722 (=> (not res!530348) (not e!435734))))

(assert (=> b!783722 (= res!530348 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20444 a!3186) j!159) mask!3328) (select (arr!20444 a!3186) j!159) a!3186 mask!3328) lt!349197))))

(assert (=> b!783722 (= lt!349197 (Intermediate!8041 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!530344 () Bool)

(assert (=> start!67652 (=> (not res!530344) (not e!435742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67652 (= res!530344 (validMask!0 mask!3328))))

(assert (=> start!67652 e!435742))

(assert (=> start!67652 true))

(declare-fun array_inv!16327 (array!42711) Bool)

(assert (=> start!67652 (array_inv!16327 a!3186)))

(declare-fun b!783732 () Bool)

(assert (=> b!783732 (= e!435742 e!435738)))

(declare-fun res!530335 () Bool)

(assert (=> b!783732 (=> (not res!530335) (not e!435738))))

(declare-fun lt!349202 () SeekEntryResult!8041)

(assert (=> b!783732 (= res!530335 (or (= lt!349202 (MissingZero!8041 i!1173)) (= lt!349202 (MissingVacant!8041 i!1173))))))

(assert (=> b!783732 (= lt!349202 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783733 () Bool)

(declare-fun res!530349 () Bool)

(assert (=> b!783733 (=> (not res!530349) (not e!435738))))

(declare-datatypes ((List!14485 0))(
  ( (Nil!14482) (Cons!14481 (h!15604 (_ BitVec 64)) (t!20791 List!14485)) )
))
(declare-fun arrayNoDuplicates!0 (array!42711 (_ BitVec 32) List!14485) Bool)

(assert (=> b!783733 (= res!530349 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14482))))

(declare-fun b!783734 () Bool)

(assert (=> b!783734 (= e!435741 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20444 a!3186) j!159) a!3186 mask!3328) lt!349207))))

(declare-fun b!783735 () Bool)

(declare-fun res!530350 () Bool)

(assert (=> b!783735 (=> (not res!530350) (not e!435731))))

(assert (=> b!783735 (= res!530350 (= (seekEntryOrOpen!0 lt!349204 lt!349208 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349204 lt!349208 mask!3328)))))

(declare-fun b!783736 () Bool)

(assert (=> b!783736 (= e!435736 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20444 a!3186) j!159) a!3186 mask!3328) (Found!8041 j!159)))))

(declare-fun b!783737 () Bool)

(declare-fun res!530345 () Bool)

(assert (=> b!783737 (=> (not res!530345) (not e!435738))))

(assert (=> b!783737 (= res!530345 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20865 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20865 a!3186))))))

(assert (= (and start!67652 res!530344) b!783725))

(assert (= (and b!783725 res!530339) b!783721))

(assert (= (and b!783721 res!530337) b!783717))

(assert (= (and b!783717 res!530338) b!783731))

(assert (= (and b!783731 res!530347) b!783732))

(assert (= (and b!783732 res!530335) b!783718))

(assert (= (and b!783718 res!530346) b!783733))

(assert (= (and b!783733 res!530349) b!783737))

(assert (= (and b!783737 res!530345) b!783722))

(assert (= (and b!783722 res!530348) b!783727))

(assert (= (and b!783727 res!530334) b!783730))

(assert (= (and b!783730 c!87099) b!783720))

(assert (= (and b!783730 (not c!87099)) b!783736))

(assert (= (and b!783730 res!530340) b!783716))

(assert (= (and b!783716 res!530336) b!783723))

(assert (= (and b!783723 res!530341) b!783734))

(assert (= (and b!783723 (not res!530343)) b!783728))

(assert (= (and b!783728 (not res!530351)) b!783729))

(assert (= (and b!783729 (not res!530342)) b!783724))

(assert (= (and b!783724 c!87098) b!783726))

(assert (= (and b!783724 (not c!87098)) b!783715))

(assert (= (and b!783724 res!530352) b!783735))

(assert (= (and b!783735 res!530350) b!783719))

(declare-fun m!725643 () Bool)

(assert (=> b!783736 m!725643))

(assert (=> b!783736 m!725643))

(declare-fun m!725645 () Bool)

(assert (=> b!783736 m!725645))

(declare-fun m!725647 () Bool)

(assert (=> b!783731 m!725647))

(declare-fun m!725649 () Bool)

(assert (=> b!783717 m!725649))

(assert (=> b!783720 m!725643))

(assert (=> b!783720 m!725643))

(declare-fun m!725651 () Bool)

(assert (=> b!783720 m!725651))

(assert (=> b!783722 m!725643))

(assert (=> b!783722 m!725643))

(declare-fun m!725653 () Bool)

(assert (=> b!783722 m!725653))

(assert (=> b!783722 m!725653))

(assert (=> b!783722 m!725643))

(declare-fun m!725655 () Bool)

(assert (=> b!783722 m!725655))

(declare-fun m!725657 () Bool)

(assert (=> b!783732 m!725657))

(declare-fun m!725659 () Bool)

(assert (=> b!783733 m!725659))

(declare-fun m!725661 () Bool)

(assert (=> b!783727 m!725661))

(assert (=> b!783728 m!725643))

(assert (=> b!783728 m!725643))

(assert (=> b!783728 m!725645))

(declare-fun m!725663 () Bool)

(assert (=> b!783735 m!725663))

(declare-fun m!725665 () Bool)

(assert (=> b!783735 m!725665))

(declare-fun m!725667 () Bool)

(assert (=> b!783716 m!725667))

(declare-fun m!725669 () Bool)

(assert (=> b!783716 m!725669))

(declare-fun m!725671 () Bool)

(assert (=> b!783716 m!725671))

(declare-fun m!725673 () Bool)

(assert (=> b!783716 m!725673))

(declare-fun m!725675 () Bool)

(assert (=> b!783716 m!725675))

(assert (=> b!783716 m!725667))

(assert (=> b!783734 m!725643))

(assert (=> b!783734 m!725643))

(declare-fun m!725677 () Bool)

(assert (=> b!783734 m!725677))

(assert (=> b!783729 m!725671))

(declare-fun m!725679 () Bool)

(assert (=> b!783729 m!725679))

(declare-fun m!725681 () Bool)

(assert (=> start!67652 m!725681))

(declare-fun m!725683 () Bool)

(assert (=> start!67652 m!725683))

(declare-fun m!725685 () Bool)

(assert (=> b!783718 m!725685))

(assert (=> b!783721 m!725643))

(assert (=> b!783721 m!725643))

(declare-fun m!725687 () Bool)

(assert (=> b!783721 m!725687))

(assert (=> b!783723 m!725643))

(assert (=> b!783723 m!725643))

(declare-fun m!725689 () Bool)

(assert (=> b!783723 m!725689))

(declare-fun m!725691 () Bool)

(assert (=> b!783723 m!725691))

(declare-fun m!725693 () Bool)

(assert (=> b!783723 m!725693))

(check-sat (not b!783736) (not b!783735) (not b!783732) (not b!783718) (not b!783723) (not b!783733) (not b!783728) (not b!783721) (not b!783716) (not start!67652) (not b!783717) (not b!783722) (not b!783731) (not b!783720) (not b!783734))
(check-sat)
