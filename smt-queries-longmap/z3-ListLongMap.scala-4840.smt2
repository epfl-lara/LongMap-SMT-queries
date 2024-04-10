; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66658 () Bool)

(assert start!66658)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42299 0))(
  ( (array!42300 (arr!20251 (Array (_ BitVec 32) (_ BitVec 64))) (size!20672 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42299)

(declare-fun b!768059 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!427707 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7851 0))(
  ( (MissingZero!7851 (index!33772 (_ BitVec 32))) (Found!7851 (index!33773 (_ BitVec 32))) (Intermediate!7851 (undefined!8663 Bool) (index!33774 (_ BitVec 32)) (x!64697 (_ BitVec 32))) (Undefined!7851) (MissingVacant!7851 (index!33775 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42299 (_ BitVec 32)) SeekEntryResult!7851)

(assert (=> b!768059 (= e!427707 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) (Found!7851 j!159)))))

(declare-fun b!768060 () Bool)

(declare-fun res!519500 () Bool)

(declare-fun e!427704 () Bool)

(assert (=> b!768060 (=> (not res!519500) (not e!427704))))

(assert (=> b!768060 (= res!519500 e!427707)))

(declare-fun c!84676 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768060 (= c!84676 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768061 () Bool)

(declare-fun res!519492 () Bool)

(declare-fun e!427709 () Bool)

(assert (=> b!768061 (=> (not res!519492) (not e!427709))))

(declare-datatypes ((List!14253 0))(
  ( (Nil!14250) (Cons!14249 (h!15345 (_ BitVec 64)) (t!20568 List!14253)) )
))
(declare-fun arrayNoDuplicates!0 (array!42299 (_ BitVec 32) List!14253) Bool)

(assert (=> b!768061 (= res!519492 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14250))))

(declare-fun b!768062 () Bool)

(declare-fun res!519497 () Bool)

(declare-fun e!427712 () Bool)

(assert (=> b!768062 (=> (not res!519497) (not e!427712))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768062 (= res!519497 (validKeyInArray!0 k0!2102))))

(declare-fun b!768063 () Bool)

(declare-fun lt!341674 () SeekEntryResult!7851)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42299 (_ BitVec 32)) SeekEntryResult!7851)

(assert (=> b!768063 (= e!427707 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!341674))))

(declare-fun b!768064 () Bool)

(declare-fun e!427713 () Bool)

(declare-fun e!427706 () Bool)

(assert (=> b!768064 (= e!427713 e!427706)))

(declare-fun res!519504 () Bool)

(assert (=> b!768064 (=> res!519504 e!427706)))

(assert (=> b!768064 (= res!519504 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341679 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768064 (= lt!341679 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!341676 () SeekEntryResult!7851)

(declare-fun e!427711 () Bool)

(declare-fun b!768065 () Bool)

(assert (=> b!768065 (= e!427711 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!341676))))

(declare-fun b!768066 () Bool)

(declare-fun res!519498 () Bool)

(assert (=> b!768066 (=> (not res!519498) (not e!427709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42299 (_ BitVec 32)) Bool)

(assert (=> b!768066 (= res!519498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!519493 () Bool)

(assert (=> start!66658 (=> (not res!519493) (not e!427712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66658 (= res!519493 (validMask!0 mask!3328))))

(assert (=> start!66658 e!427712))

(assert (=> start!66658 true))

(declare-fun array_inv!16047 (array!42299) Bool)

(assert (=> start!66658 (array_inv!16047 a!3186)))

(declare-fun b!768067 () Bool)

(assert (=> b!768067 (= e!427712 e!427709)))

(declare-fun res!519494 () Bool)

(assert (=> b!768067 (=> (not res!519494) (not e!427709))))

(declare-fun lt!341672 () SeekEntryResult!7851)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768067 (= res!519494 (or (= lt!341672 (MissingZero!7851 i!1173)) (= lt!341672 (MissingVacant!7851 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42299 (_ BitVec 32)) SeekEntryResult!7851)

(assert (=> b!768067 (= lt!341672 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!768068 () Bool)

(declare-fun e!427705 () Bool)

(assert (=> b!768068 (= e!427705 (not e!427713))))

(declare-fun res!519495 () Bool)

(assert (=> b!768068 (=> res!519495 e!427713)))

(declare-fun lt!341675 () SeekEntryResult!7851)

(get-info :version)

(assert (=> b!768068 (= res!519495 (or (not ((_ is Intermediate!7851) lt!341675)) (bvsge x!1131 (x!64697 lt!341675))))))

(declare-fun e!427708 () Bool)

(assert (=> b!768068 e!427708))

(declare-fun res!519508 () Bool)

(assert (=> b!768068 (=> (not res!519508) (not e!427708))))

(assert (=> b!768068 (= res!519508 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26428 0))(
  ( (Unit!26429) )
))
(declare-fun lt!341678 () Unit!26428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26428)

(assert (=> b!768068 (= lt!341678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768069 () Bool)

(declare-fun res!519499 () Bool)

(assert (=> b!768069 (=> (not res!519499) (not e!427709))))

(assert (=> b!768069 (= res!519499 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20672 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20672 a!3186))))))

(declare-fun b!768070 () Bool)

(assert (=> b!768070 (= e!427704 e!427705)))

(declare-fun res!519505 () Bool)

(assert (=> b!768070 (=> (not res!519505) (not e!427705))))

(declare-fun lt!341681 () SeekEntryResult!7851)

(assert (=> b!768070 (= res!519505 (= lt!341681 lt!341675))))

(declare-fun lt!341680 () (_ BitVec 64))

(declare-fun lt!341677 () array!42299)

(assert (=> b!768070 (= lt!341675 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341680 lt!341677 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768070 (= lt!341681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341680 mask!3328) lt!341680 lt!341677 mask!3328))))

(assert (=> b!768070 (= lt!341680 (select (store (arr!20251 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768070 (= lt!341677 (array!42300 (store (arr!20251 a!3186) i!1173 k0!2102) (size!20672 a!3186)))))

(declare-fun b!768071 () Bool)

(declare-fun res!519506 () Bool)

(assert (=> b!768071 (=> (not res!519506) (not e!427712))))

(assert (=> b!768071 (= res!519506 (and (= (size!20672 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20672 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20672 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768072 () Bool)

(assert (=> b!768072 (= e!427706 true)))

(declare-fun lt!341673 () SeekEntryResult!7851)

(assert (=> b!768072 (= lt!341673 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768073 () Bool)

(declare-fun res!519502 () Bool)

(assert (=> b!768073 (=> (not res!519502) (not e!427712))))

(assert (=> b!768073 (= res!519502 (validKeyInArray!0 (select (arr!20251 a!3186) j!159)))))

(declare-fun b!768074 () Bool)

(declare-fun res!519496 () Bool)

(assert (=> b!768074 (=> (not res!519496) (not e!427712))))

(declare-fun arrayContainsKey!0 (array!42299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768074 (= res!519496 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768075 () Bool)

(declare-fun res!519503 () Bool)

(assert (=> b!768075 (=> (not res!519503) (not e!427704))))

(assert (=> b!768075 (= res!519503 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20251 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768076 () Bool)

(assert (=> b!768076 (= e!427709 e!427704)))

(declare-fun res!519507 () Bool)

(assert (=> b!768076 (=> (not res!519507) (not e!427704))))

(assert (=> b!768076 (= res!519507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20251 a!3186) j!159) mask!3328) (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!341674))))

(assert (=> b!768076 (= lt!341674 (Intermediate!7851 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768077 () Bool)

(assert (=> b!768077 (= e!427708 e!427711)))

(declare-fun res!519501 () Bool)

(assert (=> b!768077 (=> (not res!519501) (not e!427711))))

(assert (=> b!768077 (= res!519501 (= (seekEntryOrOpen!0 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!341676))))

(assert (=> b!768077 (= lt!341676 (Found!7851 j!159))))

(assert (= (and start!66658 res!519493) b!768071))

(assert (= (and b!768071 res!519506) b!768073))

(assert (= (and b!768073 res!519502) b!768062))

(assert (= (and b!768062 res!519497) b!768074))

(assert (= (and b!768074 res!519496) b!768067))

(assert (= (and b!768067 res!519494) b!768066))

(assert (= (and b!768066 res!519498) b!768061))

(assert (= (and b!768061 res!519492) b!768069))

(assert (= (and b!768069 res!519499) b!768076))

(assert (= (and b!768076 res!519507) b!768075))

(assert (= (and b!768075 res!519503) b!768060))

(assert (= (and b!768060 c!84676) b!768063))

(assert (= (and b!768060 (not c!84676)) b!768059))

(assert (= (and b!768060 res!519500) b!768070))

(assert (= (and b!768070 res!519505) b!768068))

(assert (= (and b!768068 res!519508) b!768077))

(assert (= (and b!768077 res!519501) b!768065))

(assert (= (and b!768068 (not res!519495)) b!768064))

(assert (= (and b!768064 (not res!519504)) b!768072))

(declare-fun m!713679 () Bool)

(assert (=> b!768072 m!713679))

(assert (=> b!768072 m!713679))

(declare-fun m!713681 () Bool)

(assert (=> b!768072 m!713681))

(assert (=> b!768059 m!713679))

(assert (=> b!768059 m!713679))

(assert (=> b!768059 m!713681))

(declare-fun m!713683 () Bool)

(assert (=> b!768068 m!713683))

(declare-fun m!713685 () Bool)

(assert (=> b!768068 m!713685))

(assert (=> b!768076 m!713679))

(assert (=> b!768076 m!713679))

(declare-fun m!713687 () Bool)

(assert (=> b!768076 m!713687))

(assert (=> b!768076 m!713687))

(assert (=> b!768076 m!713679))

(declare-fun m!713689 () Bool)

(assert (=> b!768076 m!713689))

(declare-fun m!713691 () Bool)

(assert (=> b!768062 m!713691))

(declare-fun m!713693 () Bool)

(assert (=> b!768074 m!713693))

(declare-fun m!713695 () Bool)

(assert (=> start!66658 m!713695))

(declare-fun m!713697 () Bool)

(assert (=> start!66658 m!713697))

(assert (=> b!768073 m!713679))

(assert (=> b!768073 m!713679))

(declare-fun m!713699 () Bool)

(assert (=> b!768073 m!713699))

(assert (=> b!768077 m!713679))

(assert (=> b!768077 m!713679))

(declare-fun m!713701 () Bool)

(assert (=> b!768077 m!713701))

(declare-fun m!713703 () Bool)

(assert (=> b!768066 m!713703))

(assert (=> b!768063 m!713679))

(assert (=> b!768063 m!713679))

(declare-fun m!713705 () Bool)

(assert (=> b!768063 m!713705))

(assert (=> b!768065 m!713679))

(assert (=> b!768065 m!713679))

(declare-fun m!713707 () Bool)

(assert (=> b!768065 m!713707))

(declare-fun m!713709 () Bool)

(assert (=> b!768061 m!713709))

(declare-fun m!713711 () Bool)

(assert (=> b!768067 m!713711))

(declare-fun m!713713 () Bool)

(assert (=> b!768070 m!713713))

(declare-fun m!713715 () Bool)

(assert (=> b!768070 m!713715))

(declare-fun m!713717 () Bool)

(assert (=> b!768070 m!713717))

(declare-fun m!713719 () Bool)

(assert (=> b!768070 m!713719))

(assert (=> b!768070 m!713717))

(declare-fun m!713721 () Bool)

(assert (=> b!768070 m!713721))

(declare-fun m!713723 () Bool)

(assert (=> b!768075 m!713723))

(declare-fun m!713725 () Bool)

(assert (=> b!768064 m!713725))

(check-sat (not b!768076) (not b!768064) (not b!768068) (not b!768065) (not b!768074) (not b!768066) (not b!768070) (not b!768067) (not b!768073) (not b!768077) (not b!768059) (not start!66658) (not b!768063) (not b!768061) (not b!768072) (not b!768062))
(check-sat)
