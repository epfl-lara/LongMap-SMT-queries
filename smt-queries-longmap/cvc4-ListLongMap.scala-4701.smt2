; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65270 () Bool)

(assert start!65270)

(declare-fun b!740517 () Bool)

(declare-fun res!498008 () Bool)

(declare-fun e!414005 () Bool)

(assert (=> b!740517 (=> (not res!498008) (not e!414005))))

(declare-datatypes ((array!41443 0))(
  ( (array!41444 (arr!19835 (Array (_ BitVec 32) (_ BitVec 64))) (size!20256 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41443)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!740517 (= res!498008 (and (= (size!20256 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20256 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20256 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740518 () Bool)

(declare-fun res!498002 () Bool)

(assert (=> b!740518 (=> (not res!498002) (not e!414005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740518 (= res!498002 (validKeyInArray!0 (select (arr!19835 a!3186) j!159)))))

(declare-fun b!740519 () Bool)

(declare-fun e!414013 () Bool)

(assert (=> b!740519 (= e!414005 e!414013)))

(declare-fun res!498003 () Bool)

(assert (=> b!740519 (=> (not res!498003) (not e!414013))))

(declare-datatypes ((SeekEntryResult!7435 0))(
  ( (MissingZero!7435 (index!32108 (_ BitVec 32))) (Found!7435 (index!32109 (_ BitVec 32))) (Intermediate!7435 (undefined!8247 Bool) (index!32110 (_ BitVec 32)) (x!63089 (_ BitVec 32))) (Undefined!7435) (MissingVacant!7435 (index!32111 (_ BitVec 32))) )
))
(declare-fun lt!328979 () SeekEntryResult!7435)

(assert (=> b!740519 (= res!498003 (or (= lt!328979 (MissingZero!7435 i!1173)) (= lt!328979 (MissingVacant!7435 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41443 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!740519 (= lt!328979 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740520 () Bool)

(declare-fun e!414004 () Bool)

(assert (=> b!740520 (= e!414013 e!414004)))

(declare-fun res!498001 () Bool)

(assert (=> b!740520 (=> (not res!498001) (not e!414004))))

(declare-fun lt!328976 () SeekEntryResult!7435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41443 (_ BitVec 32)) SeekEntryResult!7435)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740520 (= res!498001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19835 a!3186) j!159) mask!3328) (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328976))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740520 (= lt!328976 (Intermediate!7435 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!328978 () SeekEntryResult!7435)

(declare-fun b!740521 () Bool)

(declare-fun lt!328974 () (_ BitVec 32))

(declare-fun e!414010 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41443 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!740521 (= e!414010 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328974 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328978)))))

(declare-fun b!740522 () Bool)

(declare-fun res!498005 () Bool)

(assert (=> b!740522 (=> (not res!498005) (not e!414004))))

(declare-fun e!414006 () Bool)

(assert (=> b!740522 (= res!498005 e!414006)))

(declare-fun c!81644 () Bool)

(assert (=> b!740522 (= c!81644 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740523 () Bool)

(declare-fun res!497990 () Bool)

(assert (=> b!740523 (=> (not res!497990) (not e!414013))))

(declare-datatypes ((List!13837 0))(
  ( (Nil!13834) (Cons!13833 (h!14905 (_ BitVec 64)) (t!20152 List!13837)) )
))
(declare-fun arrayNoDuplicates!0 (array!41443 (_ BitVec 32) List!13837) Bool)

(assert (=> b!740523 (= res!497990 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13834))))

(declare-fun b!740524 () Bool)

(declare-fun e!414003 () Bool)

(declare-fun e!414007 () Bool)

(assert (=> b!740524 (= e!414003 (not e!414007))))

(declare-fun res!498006 () Bool)

(assert (=> b!740524 (=> res!498006 e!414007)))

(declare-fun lt!328973 () SeekEntryResult!7435)

(assert (=> b!740524 (= res!498006 (or (not (is-Intermediate!7435 lt!328973)) (bvsge x!1131 (x!63089 lt!328973))))))

(assert (=> b!740524 (= lt!328978 (Found!7435 j!159))))

(declare-fun e!414011 () Bool)

(assert (=> b!740524 e!414011))

(declare-fun res!497997 () Bool)

(assert (=> b!740524 (=> (not res!497997) (not e!414011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41443 (_ BitVec 32)) Bool)

(assert (=> b!740524 (= res!497997 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25336 0))(
  ( (Unit!25337) )
))
(declare-fun lt!328969 () Unit!25336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25336)

(assert (=> b!740524 (= lt!328969 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740525 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!740525 (= e!414006 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328976))))

(declare-fun b!740526 () Bool)

(declare-fun res!497996 () Bool)

(assert (=> b!740526 (=> (not res!497996) (not e!414005))))

(assert (=> b!740526 (= res!497996 (validKeyInArray!0 k!2102))))

(declare-fun b!740527 () Bool)

(declare-fun res!497993 () Bool)

(assert (=> b!740527 (=> (not res!497993) (not e!414013))))

(assert (=> b!740527 (= res!497993 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20256 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20256 a!3186))))))

(declare-fun b!740528 () Bool)

(assert (=> b!740528 (= e!414006 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) (Found!7435 j!159)))))

(declare-fun b!740529 () Bool)

(declare-fun res!497994 () Bool)

(declare-fun e!414008 () Bool)

(assert (=> b!740529 (=> res!497994 e!414008)))

(declare-fun lt!328971 () array!41443)

(declare-fun lt!328966 () (_ BitVec 64))

(declare-fun lt!328975 () SeekEntryResult!7435)

(assert (=> b!740529 (= res!497994 (not (= lt!328975 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328974 lt!328966 lt!328971 mask!3328))))))

(declare-fun b!740530 () Bool)

(declare-fun e!414012 () Unit!25336)

(declare-fun Unit!25338 () Unit!25336)

(assert (=> b!740530 (= e!414012 Unit!25338)))

(declare-fun lt!328967 () SeekEntryResult!7435)

(assert (=> b!740530 (= lt!328967 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740530 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328974 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328978)))

(declare-fun b!740531 () Bool)

(declare-fun e!414014 () Bool)

(assert (=> b!740531 (= e!414011 e!414014)))

(declare-fun res!497991 () Bool)

(assert (=> b!740531 (=> (not res!497991) (not e!414014))))

(declare-fun lt!328970 () SeekEntryResult!7435)

(assert (=> b!740531 (= res!497991 (= (seekEntryOrOpen!0 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328970))))

(assert (=> b!740531 (= lt!328970 (Found!7435 j!159))))

(declare-fun res!498000 () Bool)

(assert (=> start!65270 (=> (not res!498000) (not e!414005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65270 (= res!498000 (validMask!0 mask!3328))))

(assert (=> start!65270 e!414005))

(assert (=> start!65270 true))

(declare-fun array_inv!15631 (array!41443) Bool)

(assert (=> start!65270 (array_inv!15631 a!3186)))

(declare-fun b!740532 () Bool)

(declare-fun Unit!25339 () Unit!25336)

(assert (=> b!740532 (= e!414012 Unit!25339)))

(assert (=> b!740532 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328974 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328976)))

(declare-fun b!740533 () Bool)

(assert (=> b!740533 (= e!414010 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328974 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328976)))))

(declare-fun b!740534 () Bool)

(declare-fun res!497998 () Bool)

(assert (=> b!740534 (=> (not res!497998) (not e!414005))))

(declare-fun arrayContainsKey!0 (array!41443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740534 (= res!497998 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740535 () Bool)

(assert (=> b!740535 (= e!414004 e!414003)))

(declare-fun res!498007 () Bool)

(assert (=> b!740535 (=> (not res!498007) (not e!414003))))

(assert (=> b!740535 (= res!498007 (= lt!328975 lt!328973))))

(assert (=> b!740535 (= lt!328973 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328966 lt!328971 mask!3328))))

(assert (=> b!740535 (= lt!328975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328966 mask!3328) lt!328966 lt!328971 mask!3328))))

(assert (=> b!740535 (= lt!328966 (select (store (arr!19835 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740535 (= lt!328971 (array!41444 (store (arr!19835 a!3186) i!1173 k!2102) (size!20256 a!3186)))))

(declare-fun b!740536 () Bool)

(declare-fun res!497995 () Bool)

(assert (=> b!740536 (=> (not res!497995) (not e!414013))))

(assert (=> b!740536 (= res!497995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740537 () Bool)

(assert (=> b!740537 (= e!414008 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!740537 (= (seekEntryOrOpen!0 lt!328966 lt!328971 mask!3328) lt!328978)))

(declare-fun lt!328972 () Unit!25336)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25336)

(assert (=> b!740537 (= lt!328972 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!328974 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740538 () Bool)

(assert (=> b!740538 (= e!414007 e!414008)))

(declare-fun res!497999 () Bool)

(assert (=> b!740538 (=> res!497999 e!414008)))

(assert (=> b!740538 (= res!497999 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328974 #b00000000000000000000000000000000) (bvsge lt!328974 (size!20256 a!3186))))))

(declare-fun lt!328977 () Unit!25336)

(assert (=> b!740538 (= lt!328977 e!414012)))

(declare-fun c!81645 () Bool)

(declare-fun lt!328968 () Bool)

(assert (=> b!740538 (= c!81645 lt!328968)))

(assert (=> b!740538 (= lt!328968 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740538 (= lt!328974 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740539 () Bool)

(declare-fun res!498004 () Bool)

(assert (=> b!740539 (=> res!498004 e!414008)))

(assert (=> b!740539 (= res!498004 e!414010)))

(declare-fun c!81646 () Bool)

(assert (=> b!740539 (= c!81646 lt!328968)))

(declare-fun b!740540 () Bool)

(assert (=> b!740540 (= e!414014 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328970))))

(declare-fun b!740541 () Bool)

(declare-fun res!497992 () Bool)

(assert (=> b!740541 (=> (not res!497992) (not e!414004))))

(assert (=> b!740541 (= res!497992 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19835 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65270 res!498000) b!740517))

(assert (= (and b!740517 res!498008) b!740518))

(assert (= (and b!740518 res!498002) b!740526))

(assert (= (and b!740526 res!497996) b!740534))

(assert (= (and b!740534 res!497998) b!740519))

(assert (= (and b!740519 res!498003) b!740536))

(assert (= (and b!740536 res!497995) b!740523))

(assert (= (and b!740523 res!497990) b!740527))

(assert (= (and b!740527 res!497993) b!740520))

(assert (= (and b!740520 res!498001) b!740541))

(assert (= (and b!740541 res!497992) b!740522))

(assert (= (and b!740522 c!81644) b!740525))

(assert (= (and b!740522 (not c!81644)) b!740528))

(assert (= (and b!740522 res!498005) b!740535))

(assert (= (and b!740535 res!498007) b!740524))

(assert (= (and b!740524 res!497997) b!740531))

(assert (= (and b!740531 res!497991) b!740540))

(assert (= (and b!740524 (not res!498006)) b!740538))

(assert (= (and b!740538 c!81645) b!740532))

(assert (= (and b!740538 (not c!81645)) b!740530))

(assert (= (and b!740538 (not res!497999)) b!740539))

(assert (= (and b!740539 c!81646) b!740533))

(assert (= (and b!740539 (not c!81646)) b!740521))

(assert (= (and b!740539 (not res!498004)) b!740529))

(assert (= (and b!740529 (not res!497994)) b!740537))

(declare-fun m!691635 () Bool)

(assert (=> b!740518 m!691635))

(assert (=> b!740518 m!691635))

(declare-fun m!691637 () Bool)

(assert (=> b!740518 m!691637))

(assert (=> b!740532 m!691635))

(assert (=> b!740532 m!691635))

(declare-fun m!691639 () Bool)

(assert (=> b!740532 m!691639))

(declare-fun m!691641 () Bool)

(assert (=> b!740519 m!691641))

(assert (=> b!740521 m!691635))

(assert (=> b!740521 m!691635))

(declare-fun m!691643 () Bool)

(assert (=> b!740521 m!691643))

(declare-fun m!691645 () Bool)

(assert (=> b!740535 m!691645))

(declare-fun m!691647 () Bool)

(assert (=> b!740535 m!691647))

(declare-fun m!691649 () Bool)

(assert (=> b!740535 m!691649))

(assert (=> b!740535 m!691645))

(declare-fun m!691651 () Bool)

(assert (=> b!740535 m!691651))

(declare-fun m!691653 () Bool)

(assert (=> b!740535 m!691653))

(declare-fun m!691655 () Bool)

(assert (=> start!65270 m!691655))

(declare-fun m!691657 () Bool)

(assert (=> start!65270 m!691657))

(declare-fun m!691659 () Bool)

(assert (=> b!740536 m!691659))

(declare-fun m!691661 () Bool)

(assert (=> b!740537 m!691661))

(declare-fun m!691663 () Bool)

(assert (=> b!740537 m!691663))

(assert (=> b!740520 m!691635))

(assert (=> b!740520 m!691635))

(declare-fun m!691665 () Bool)

(assert (=> b!740520 m!691665))

(assert (=> b!740520 m!691665))

(assert (=> b!740520 m!691635))

(declare-fun m!691667 () Bool)

(assert (=> b!740520 m!691667))

(declare-fun m!691669 () Bool)

(assert (=> b!740523 m!691669))

(declare-fun m!691671 () Bool)

(assert (=> b!740534 m!691671))

(assert (=> b!740525 m!691635))

(assert (=> b!740525 m!691635))

(declare-fun m!691673 () Bool)

(assert (=> b!740525 m!691673))

(assert (=> b!740531 m!691635))

(assert (=> b!740531 m!691635))

(declare-fun m!691675 () Bool)

(assert (=> b!740531 m!691675))

(assert (=> b!740533 m!691635))

(assert (=> b!740533 m!691635))

(assert (=> b!740533 m!691639))

(declare-fun m!691677 () Bool)

(assert (=> b!740538 m!691677))

(declare-fun m!691679 () Bool)

(assert (=> b!740529 m!691679))

(assert (=> b!740528 m!691635))

(assert (=> b!740528 m!691635))

(declare-fun m!691681 () Bool)

(assert (=> b!740528 m!691681))

(declare-fun m!691683 () Bool)

(assert (=> b!740524 m!691683))

(declare-fun m!691685 () Bool)

(assert (=> b!740524 m!691685))

(declare-fun m!691687 () Bool)

(assert (=> b!740541 m!691687))

(declare-fun m!691689 () Bool)

(assert (=> b!740526 m!691689))

(assert (=> b!740530 m!691635))

(assert (=> b!740530 m!691635))

(assert (=> b!740530 m!691681))

(assert (=> b!740530 m!691635))

(assert (=> b!740530 m!691643))

(assert (=> b!740540 m!691635))

(assert (=> b!740540 m!691635))

(declare-fun m!691691 () Bool)

(assert (=> b!740540 m!691691))

(push 1)

