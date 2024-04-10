; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65160 () Bool)

(assert start!65160)

(declare-fun res!495007 () Bool)

(declare-fun e!412028 () Bool)

(assert (=> start!65160 (=> (not res!495007) (not e!412028))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65160 (= res!495007 (validMask!0 mask!3328))))

(assert (=> start!65160 e!412028))

(assert (=> start!65160 true))

(declare-datatypes ((array!41333 0))(
  ( (array!41334 (arr!19780 (Array (_ BitVec 32) (_ BitVec 64))) (size!20201 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41333)

(declare-fun array_inv!15576 (array!41333) Bool)

(assert (=> start!65160 (array_inv!15576 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!412033 () Bool)

(declare-fun b!736540 () Bool)

(declare-datatypes ((SeekEntryResult!7380 0))(
  ( (MissingZero!7380 (index!31888 (_ BitVec 32))) (Found!7380 (index!31889 (_ BitVec 32))) (Intermediate!7380 (undefined!8192 Bool) (index!31890 (_ BitVec 32)) (x!62890 (_ BitVec 32))) (Undefined!7380) (MissingVacant!7380 (index!31891 (_ BitVec 32))) )
))
(declare-fun lt!326667 () SeekEntryResult!7380)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!326656 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41333 (_ BitVec 32)) SeekEntryResult!7380)

(assert (=> b!736540 (= e!412033 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326656 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326667)))))

(declare-fun b!736541 () Bool)

(declare-fun res!495006 () Bool)

(assert (=> b!736541 (=> (not res!495006) (not e!412028))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736541 (= res!495006 (and (= (size!20201 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20201 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20201 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!326668 () SeekEntryResult!7380)

(declare-fun b!736542 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41333 (_ BitVec 32)) SeekEntryResult!7380)

(assert (=> b!736542 (= e!412033 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326656 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326668)))))

(declare-fun b!736543 () Bool)

(declare-fun e!412025 () Bool)

(declare-fun e!412026 () Bool)

(assert (=> b!736543 (= e!412025 e!412026)))

(declare-fun res!495013 () Bool)

(assert (=> b!736543 (=> (not res!495013) (not e!412026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736543 (= res!495013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19780 a!3186) j!159) mask!3328) (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326668))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736543 (= lt!326668 (Intermediate!7380 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736544 () Bool)

(declare-fun res!495014 () Bool)

(assert (=> b!736544 (=> (not res!495014) (not e!412026))))

(declare-fun e!412030 () Bool)

(assert (=> b!736544 (= res!495014 e!412030)))

(declare-fun c!81150 () Bool)

(assert (=> b!736544 (= c!81150 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!736545 () Bool)

(assert (=> b!736545 (= e!412030 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326668))))

(declare-fun b!736546 () Bool)

(declare-fun res!495017 () Bool)

(assert (=> b!736546 (=> (not res!495017) (not e!412025))))

(declare-datatypes ((List!13782 0))(
  ( (Nil!13779) (Cons!13778 (h!14850 (_ BitVec 64)) (t!20097 List!13782)) )
))
(declare-fun arrayNoDuplicates!0 (array!41333 (_ BitVec 32) List!13782) Bool)

(assert (=> b!736546 (= res!495017 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13779))))

(declare-fun b!736547 () Bool)

(declare-fun e!412034 () Bool)

(declare-fun e!412029 () Bool)

(assert (=> b!736547 (= e!412034 (not e!412029))))

(declare-fun res!495015 () Bool)

(assert (=> b!736547 (=> res!495015 e!412029)))

(declare-fun lt!326663 () SeekEntryResult!7380)

(get-info :version)

(assert (=> b!736547 (= res!495015 (or (not ((_ is Intermediate!7380) lt!326663)) (bvsge x!1131 (x!62890 lt!326663))))))

(assert (=> b!736547 (= lt!326667 (Found!7380 j!159))))

(declare-fun e!412032 () Bool)

(assert (=> b!736547 e!412032))

(declare-fun res!495004 () Bool)

(assert (=> b!736547 (=> (not res!495004) (not e!412032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41333 (_ BitVec 32)) Bool)

(assert (=> b!736547 (= res!495004 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25116 0))(
  ( (Unit!25117) )
))
(declare-fun lt!326657 () Unit!25116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25116)

(assert (=> b!736547 (= lt!326657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736548 () Bool)

(declare-fun e!412024 () Bool)

(assert (=> b!736548 (= e!412024 true)))

(declare-fun lt!326665 () SeekEntryResult!7380)

(declare-fun lt!326666 () (_ BitVec 64))

(declare-fun lt!326661 () array!41333)

(assert (=> b!736548 (= lt!326665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326656 lt!326666 lt!326661 mask!3328))))

(declare-fun b!736549 () Bool)

(declare-fun res!495011 () Bool)

(assert (=> b!736549 (=> (not res!495011) (not e!412025))))

(assert (=> b!736549 (= res!495011 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20201 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20201 a!3186))))))

(declare-fun b!736550 () Bool)

(declare-fun res!495009 () Bool)

(assert (=> b!736550 (=> res!495009 e!412024)))

(assert (=> b!736550 (= res!495009 e!412033)))

(declare-fun c!81151 () Bool)

(declare-fun lt!326664 () Bool)

(assert (=> b!736550 (= c!81151 lt!326664)))

(declare-fun b!736551 () Bool)

(declare-fun res!495008 () Bool)

(assert (=> b!736551 (=> (not res!495008) (not e!412028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736551 (= res!495008 (validKeyInArray!0 (select (arr!19780 a!3186) j!159)))))

(declare-fun b!736552 () Bool)

(declare-fun e!412027 () Unit!25116)

(declare-fun Unit!25118 () Unit!25116)

(assert (=> b!736552 (= e!412027 Unit!25118)))

(assert (=> b!736552 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326656 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326668)))

(declare-fun b!736553 () Bool)

(declare-fun Unit!25119 () Unit!25116)

(assert (=> b!736553 (= e!412027 Unit!25119)))

(declare-fun lt!326662 () SeekEntryResult!7380)

(assert (=> b!736553 (= lt!326662 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326656 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326667)))

(declare-fun b!736554 () Bool)

(declare-fun res!495018 () Bool)

(assert (=> b!736554 (=> (not res!495018) (not e!412028))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736554 (= res!495018 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736555 () Bool)

(declare-fun lt!326669 () SeekEntryResult!7380)

(declare-fun e!412023 () Bool)

(assert (=> b!736555 (= e!412023 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326669))))

(declare-fun b!736556 () Bool)

(assert (=> b!736556 (= e!412032 e!412023)))

(declare-fun res!495016 () Bool)

(assert (=> b!736556 (=> (not res!495016) (not e!412023))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41333 (_ BitVec 32)) SeekEntryResult!7380)

(assert (=> b!736556 (= res!495016 (= (seekEntryOrOpen!0 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!326669))))

(assert (=> b!736556 (= lt!326669 (Found!7380 j!159))))

(declare-fun b!736557 () Bool)

(assert (=> b!736557 (= e!412030 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) (Found!7380 j!159)))))

(declare-fun b!736558 () Bool)

(declare-fun res!495005 () Bool)

(assert (=> b!736558 (=> (not res!495005) (not e!412025))))

(assert (=> b!736558 (= res!495005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736559 () Bool)

(declare-fun res!495019 () Bool)

(assert (=> b!736559 (=> (not res!495019) (not e!412026))))

(assert (=> b!736559 (= res!495019 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19780 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736560 () Bool)

(declare-fun res!495010 () Bool)

(assert (=> b!736560 (=> (not res!495010) (not e!412028))))

(assert (=> b!736560 (= res!495010 (validKeyInArray!0 k0!2102))))

(declare-fun b!736561 () Bool)

(assert (=> b!736561 (= e!412029 e!412024)))

(declare-fun res!495012 () Bool)

(assert (=> b!736561 (=> res!495012 e!412024)))

(assert (=> b!736561 (= res!495012 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326656 #b00000000000000000000000000000000) (bvsge lt!326656 (size!20201 a!3186))))))

(declare-fun lt!326659 () Unit!25116)

(assert (=> b!736561 (= lt!326659 e!412027)))

(declare-fun c!81149 () Bool)

(assert (=> b!736561 (= c!81149 lt!326664)))

(assert (=> b!736561 (= lt!326664 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736561 (= lt!326656 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736562 () Bool)

(assert (=> b!736562 (= e!412026 e!412034)))

(declare-fun res!495020 () Bool)

(assert (=> b!736562 (=> (not res!495020) (not e!412034))))

(declare-fun lt!326660 () SeekEntryResult!7380)

(assert (=> b!736562 (= res!495020 (= lt!326660 lt!326663))))

(assert (=> b!736562 (= lt!326663 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326666 lt!326661 mask!3328))))

(assert (=> b!736562 (= lt!326660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326666 mask!3328) lt!326666 lt!326661 mask!3328))))

(assert (=> b!736562 (= lt!326666 (select (store (arr!19780 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736562 (= lt!326661 (array!41334 (store (arr!19780 a!3186) i!1173 k0!2102) (size!20201 a!3186)))))

(declare-fun b!736563 () Bool)

(assert (=> b!736563 (= e!412028 e!412025)))

(declare-fun res!495003 () Bool)

(assert (=> b!736563 (=> (not res!495003) (not e!412025))))

(declare-fun lt!326658 () SeekEntryResult!7380)

(assert (=> b!736563 (= res!495003 (or (= lt!326658 (MissingZero!7380 i!1173)) (= lt!326658 (MissingVacant!7380 i!1173))))))

(assert (=> b!736563 (= lt!326658 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65160 res!495007) b!736541))

(assert (= (and b!736541 res!495006) b!736551))

(assert (= (and b!736551 res!495008) b!736560))

(assert (= (and b!736560 res!495010) b!736554))

(assert (= (and b!736554 res!495018) b!736563))

(assert (= (and b!736563 res!495003) b!736558))

(assert (= (and b!736558 res!495005) b!736546))

(assert (= (and b!736546 res!495017) b!736549))

(assert (= (and b!736549 res!495011) b!736543))

(assert (= (and b!736543 res!495013) b!736559))

(assert (= (and b!736559 res!495019) b!736544))

(assert (= (and b!736544 c!81150) b!736545))

(assert (= (and b!736544 (not c!81150)) b!736557))

(assert (= (and b!736544 res!495014) b!736562))

(assert (= (and b!736562 res!495020) b!736547))

(assert (= (and b!736547 res!495004) b!736556))

(assert (= (and b!736556 res!495016) b!736555))

(assert (= (and b!736547 (not res!495015)) b!736561))

(assert (= (and b!736561 c!81149) b!736552))

(assert (= (and b!736561 (not c!81149)) b!736553))

(assert (= (and b!736561 (not res!495012)) b!736550))

(assert (= (and b!736550 c!81151) b!736542))

(assert (= (and b!736550 (not c!81151)) b!736540))

(assert (= (and b!736550 (not res!495009)) b!736548))

(declare-fun m!688645 () Bool)

(assert (=> b!736547 m!688645))

(declare-fun m!688647 () Bool)

(assert (=> b!736547 m!688647))

(declare-fun m!688649 () Bool)

(assert (=> b!736555 m!688649))

(assert (=> b!736555 m!688649))

(declare-fun m!688651 () Bool)

(assert (=> b!736555 m!688651))

(declare-fun m!688653 () Bool)

(assert (=> b!736561 m!688653))

(declare-fun m!688655 () Bool)

(assert (=> b!736562 m!688655))

(declare-fun m!688657 () Bool)

(assert (=> b!736562 m!688657))

(declare-fun m!688659 () Bool)

(assert (=> b!736562 m!688659))

(declare-fun m!688661 () Bool)

(assert (=> b!736562 m!688661))

(declare-fun m!688663 () Bool)

(assert (=> b!736562 m!688663))

(assert (=> b!736562 m!688655))

(declare-fun m!688665 () Bool)

(assert (=> b!736554 m!688665))

(declare-fun m!688667 () Bool)

(assert (=> b!736546 m!688667))

(declare-fun m!688669 () Bool)

(assert (=> b!736559 m!688669))

(assert (=> b!736552 m!688649))

(assert (=> b!736552 m!688649))

(declare-fun m!688671 () Bool)

(assert (=> b!736552 m!688671))

(assert (=> b!736556 m!688649))

(assert (=> b!736556 m!688649))

(declare-fun m!688673 () Bool)

(assert (=> b!736556 m!688673))

(assert (=> b!736540 m!688649))

(assert (=> b!736540 m!688649))

(declare-fun m!688675 () Bool)

(assert (=> b!736540 m!688675))

(assert (=> b!736542 m!688649))

(assert (=> b!736542 m!688649))

(assert (=> b!736542 m!688671))

(assert (=> b!736553 m!688649))

(assert (=> b!736553 m!688649))

(declare-fun m!688677 () Bool)

(assert (=> b!736553 m!688677))

(assert (=> b!736553 m!688649))

(assert (=> b!736553 m!688675))

(assert (=> b!736543 m!688649))

(assert (=> b!736543 m!688649))

(declare-fun m!688679 () Bool)

(assert (=> b!736543 m!688679))

(assert (=> b!736543 m!688679))

(assert (=> b!736543 m!688649))

(declare-fun m!688681 () Bool)

(assert (=> b!736543 m!688681))

(assert (=> b!736557 m!688649))

(assert (=> b!736557 m!688649))

(assert (=> b!736557 m!688677))

(declare-fun m!688683 () Bool)

(assert (=> b!736558 m!688683))

(assert (=> b!736551 m!688649))

(assert (=> b!736551 m!688649))

(declare-fun m!688685 () Bool)

(assert (=> b!736551 m!688685))

(declare-fun m!688687 () Bool)

(assert (=> b!736560 m!688687))

(declare-fun m!688689 () Bool)

(assert (=> start!65160 m!688689))

(declare-fun m!688691 () Bool)

(assert (=> start!65160 m!688691))

(declare-fun m!688693 () Bool)

(assert (=> b!736563 m!688693))

(declare-fun m!688695 () Bool)

(assert (=> b!736548 m!688695))

(assert (=> b!736545 m!688649))

(assert (=> b!736545 m!688649))

(declare-fun m!688697 () Bool)

(assert (=> b!736545 m!688697))

(check-sat (not b!736553) (not b!736542) (not b!736552) (not b!736543) (not b!736554) (not b!736556) (not b!736562) (not b!736551) (not b!736547) (not b!736548) (not b!736561) (not b!736546) (not b!736558) (not b!736555) (not b!736563) (not b!736560) (not start!65160) (not b!736557) (not b!736545) (not b!736540))
(check-sat)
