; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45624 () Bool)

(assert start!45624)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!294511 () Bool)

(declare-datatypes ((array!32380 0))(
  ( (array!32381 (arr!15570 (Array (_ BitVec 32) (_ BitVec 64))) (size!15934 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32380)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!502840 () Bool)

(declare-datatypes ((SeekEntryResult!4037 0))(
  ( (MissingZero!4037 (index!18336 (_ BitVec 32))) (Found!4037 (index!18337 (_ BitVec 32))) (Intermediate!4037 (undefined!4849 Bool) (index!18338 (_ BitVec 32)) (x!47366 (_ BitVec 32))) (Undefined!4037) (MissingVacant!4037 (index!18339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32380 (_ BitVec 32)) SeekEntryResult!4037)

(assert (=> b!502840 (= e!294511 (= (seekEntryOrOpen!0 (select (arr!15570 a!3235) j!176) a!3235 mask!3524) (Found!4037 j!176)))))

(declare-fun b!502841 () Bool)

(declare-fun res!304222 () Bool)

(declare-fun e!294508 () Bool)

(assert (=> b!502841 (=> (not res!304222) (not e!294508))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502841 (= res!304222 (validKeyInArray!0 k!2280))))

(declare-fun b!502842 () Bool)

(declare-datatypes ((Unit!15224 0))(
  ( (Unit!15225) )
))
(declare-fun e!294513 () Unit!15224)

(declare-fun Unit!15226 () Unit!15224)

(assert (=> b!502842 (= e!294513 Unit!15226)))

(declare-fun b!502843 () Bool)

(declare-fun e!294509 () Bool)

(assert (=> b!502843 (= e!294508 e!294509)))

(declare-fun res!304211 () Bool)

(assert (=> b!502843 (=> (not res!304211) (not e!294509))))

(declare-fun lt!228638 () SeekEntryResult!4037)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502843 (= res!304211 (or (= lt!228638 (MissingZero!4037 i!1204)) (= lt!228638 (MissingVacant!4037 i!1204))))))

(assert (=> b!502843 (= lt!228638 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502844 () Bool)

(declare-fun res!304209 () Bool)

(assert (=> b!502844 (=> (not res!304209) (not e!294508))))

(assert (=> b!502844 (= res!304209 (validKeyInArray!0 (select (arr!15570 a!3235) j!176)))))

(declare-fun b!502845 () Bool)

(declare-fun e!294506 () Bool)

(assert (=> b!502845 (= e!294506 false)))

(declare-fun b!502846 () Bool)

(declare-fun res!304214 () Bool)

(assert (=> b!502846 (=> (not res!304214) (not e!294508))))

(assert (=> b!502846 (= res!304214 (and (= (size!15934 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15934 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15934 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502847 () Bool)

(declare-fun e!294512 () Bool)

(assert (=> b!502847 (= e!294509 (not e!294512))))

(declare-fun res!304220 () Bool)

(assert (=> b!502847 (=> res!304220 e!294512)))

(declare-fun lt!228640 () (_ BitVec 32))

(declare-fun lt!228644 () SeekEntryResult!4037)

(declare-fun lt!228636 () array!32380)

(declare-fun lt!228639 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32380 (_ BitVec 32)) SeekEntryResult!4037)

(assert (=> b!502847 (= res!304220 (= lt!228644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228640 lt!228639 lt!228636 mask!3524)))))

(declare-fun lt!228645 () (_ BitVec 32))

(assert (=> b!502847 (= lt!228644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228645 (select (arr!15570 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502847 (= lt!228640 (toIndex!0 lt!228639 mask!3524))))

(assert (=> b!502847 (= lt!228639 (select (store (arr!15570 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502847 (= lt!228645 (toIndex!0 (select (arr!15570 a!3235) j!176) mask!3524))))

(assert (=> b!502847 (= lt!228636 (array!32381 (store (arr!15570 a!3235) i!1204 k!2280) (size!15934 a!3235)))))

(assert (=> b!502847 e!294511))

(declare-fun res!304218 () Bool)

(assert (=> b!502847 (=> (not res!304218) (not e!294511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32380 (_ BitVec 32)) Bool)

(assert (=> b!502847 (= res!304218 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228646 () Unit!15224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15224)

(assert (=> b!502847 (= lt!228646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun e!294505 () Bool)

(declare-fun b!502848 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32380 (_ BitVec 32)) SeekEntryResult!4037)

(assert (=> b!502848 (= e!294505 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228645 (index!18338 lt!228644) (select (arr!15570 a!3235) j!176) a!3235 mask!3524) (Found!4037 j!176))))))

(declare-fun b!502849 () Bool)

(declare-fun e!294507 () Bool)

(assert (=> b!502849 (= e!294512 e!294507)))

(declare-fun res!304219 () Bool)

(assert (=> b!502849 (=> res!304219 e!294507)))

(assert (=> b!502849 (= res!304219 (or (bvsgt (x!47366 lt!228644) #b01111111111111111111111111111110) (bvslt lt!228645 #b00000000000000000000000000000000) (bvsge lt!228645 (size!15934 a!3235)) (bvslt (index!18338 lt!228644) #b00000000000000000000000000000000) (bvsge (index!18338 lt!228644) (size!15934 a!3235)) (not (= lt!228644 (Intermediate!4037 false (index!18338 lt!228644) (x!47366 lt!228644))))))))

(assert (=> b!502849 (= (index!18338 lt!228644) i!1204)))

(declare-fun lt!228643 () Unit!15224)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32380 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15224)

(assert (=> b!502849 (= lt!228643 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228645 #b00000000000000000000000000000000 (index!18338 lt!228644) (x!47366 lt!228644) mask!3524))))

(assert (=> b!502849 (and (or (= (select (arr!15570 a!3235) (index!18338 lt!228644)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15570 a!3235) (index!18338 lt!228644)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15570 a!3235) (index!18338 lt!228644)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15570 a!3235) (index!18338 lt!228644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228642 () Unit!15224)

(assert (=> b!502849 (= lt!228642 e!294513)))

(declare-fun c!59594 () Bool)

(assert (=> b!502849 (= c!59594 (= (select (arr!15570 a!3235) (index!18338 lt!228644)) (select (arr!15570 a!3235) j!176)))))

(assert (=> b!502849 (and (bvslt (x!47366 lt!228644) #b01111111111111111111111111111110) (or (= (select (arr!15570 a!3235) (index!18338 lt!228644)) (select (arr!15570 a!3235) j!176)) (= (select (arr!15570 a!3235) (index!18338 lt!228644)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15570 a!3235) (index!18338 lt!228644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502850 () Bool)

(declare-fun res!304217 () Bool)

(assert (=> b!502850 (=> (not res!304217) (not e!294508))))

(declare-fun arrayContainsKey!0 (array!32380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502850 (= res!304217 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502852 () Bool)

(declare-fun res!304215 () Bool)

(assert (=> b!502852 (=> res!304215 e!294507)))

(assert (=> b!502852 (= res!304215 e!294505)))

(declare-fun res!304210 () Bool)

(assert (=> b!502852 (=> (not res!304210) (not e!294505))))

(assert (=> b!502852 (= res!304210 (bvsgt #b00000000000000000000000000000000 (x!47366 lt!228644)))))

(declare-fun b!502851 () Bool)

(declare-fun Unit!15227 () Unit!15224)

(assert (=> b!502851 (= e!294513 Unit!15227)))

(declare-fun lt!228637 () Unit!15224)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32380 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15224)

(assert (=> b!502851 (= lt!228637 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228645 #b00000000000000000000000000000000 (index!18338 lt!228644) (x!47366 lt!228644) mask!3524))))

(declare-fun res!304216 () Bool)

(assert (=> b!502851 (= res!304216 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228645 lt!228639 lt!228636 mask!3524) (Intermediate!4037 false (index!18338 lt!228644) (x!47366 lt!228644))))))

(assert (=> b!502851 (=> (not res!304216) (not e!294506))))

(assert (=> b!502851 e!294506))

(declare-fun res!304221 () Bool)

(assert (=> start!45624 (=> (not res!304221) (not e!294508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45624 (= res!304221 (validMask!0 mask!3524))))

(assert (=> start!45624 e!294508))

(assert (=> start!45624 true))

(declare-fun array_inv!11366 (array!32380) Bool)

(assert (=> start!45624 (array_inv!11366 a!3235)))

(declare-fun b!502853 () Bool)

(declare-fun res!304213 () Bool)

(assert (=> b!502853 (=> (not res!304213) (not e!294509))))

(assert (=> b!502853 (= res!304213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502854 () Bool)

(declare-fun res!304223 () Bool)

(assert (=> b!502854 (=> res!304223 e!294512)))

(assert (=> b!502854 (= res!304223 (or (undefined!4849 lt!228644) (not (is-Intermediate!4037 lt!228644))))))

(declare-fun b!502855 () Bool)

(assert (=> b!502855 (= e!294507 true)))

(declare-fun lt!228641 () SeekEntryResult!4037)

(assert (=> b!502855 (= lt!228641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228645 lt!228639 lt!228636 mask!3524))))

(declare-fun b!502856 () Bool)

(declare-fun res!304212 () Bool)

(assert (=> b!502856 (=> (not res!304212) (not e!294509))))

(declare-datatypes ((List!9728 0))(
  ( (Nil!9725) (Cons!9724 (h!10601 (_ BitVec 64)) (t!15956 List!9728)) )
))
(declare-fun arrayNoDuplicates!0 (array!32380 (_ BitVec 32) List!9728) Bool)

(assert (=> b!502856 (= res!304212 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9725))))

(assert (= (and start!45624 res!304221) b!502846))

(assert (= (and b!502846 res!304214) b!502844))

(assert (= (and b!502844 res!304209) b!502841))

(assert (= (and b!502841 res!304222) b!502850))

(assert (= (and b!502850 res!304217) b!502843))

(assert (= (and b!502843 res!304211) b!502853))

(assert (= (and b!502853 res!304213) b!502856))

(assert (= (and b!502856 res!304212) b!502847))

(assert (= (and b!502847 res!304218) b!502840))

(assert (= (and b!502847 (not res!304220)) b!502854))

(assert (= (and b!502854 (not res!304223)) b!502849))

(assert (= (and b!502849 c!59594) b!502851))

(assert (= (and b!502849 (not c!59594)) b!502842))

(assert (= (and b!502851 res!304216) b!502845))

(assert (= (and b!502849 (not res!304219)) b!502852))

(assert (= (and b!502852 res!304210) b!502848))

(assert (= (and b!502852 (not res!304215)) b!502855))

(declare-fun m!483735 () Bool)

(assert (=> b!502843 m!483735))

(declare-fun m!483737 () Bool)

(assert (=> b!502856 m!483737))

(declare-fun m!483739 () Bool)

(assert (=> b!502850 m!483739))

(declare-fun m!483741 () Bool)

(assert (=> b!502855 m!483741))

(declare-fun m!483743 () Bool)

(assert (=> b!502847 m!483743))

(declare-fun m!483745 () Bool)

(assert (=> b!502847 m!483745))

(declare-fun m!483747 () Bool)

(assert (=> b!502847 m!483747))

(declare-fun m!483749 () Bool)

(assert (=> b!502847 m!483749))

(declare-fun m!483751 () Bool)

(assert (=> b!502847 m!483751))

(declare-fun m!483753 () Bool)

(assert (=> b!502847 m!483753))

(declare-fun m!483755 () Bool)

(assert (=> b!502847 m!483755))

(assert (=> b!502847 m!483751))

(declare-fun m!483757 () Bool)

(assert (=> b!502847 m!483757))

(assert (=> b!502847 m!483751))

(declare-fun m!483759 () Bool)

(assert (=> b!502847 m!483759))

(assert (=> b!502840 m!483751))

(assert (=> b!502840 m!483751))

(declare-fun m!483761 () Bool)

(assert (=> b!502840 m!483761))

(assert (=> b!502848 m!483751))

(assert (=> b!502848 m!483751))

(declare-fun m!483763 () Bool)

(assert (=> b!502848 m!483763))

(declare-fun m!483765 () Bool)

(assert (=> b!502853 m!483765))

(assert (=> b!502844 m!483751))

(assert (=> b!502844 m!483751))

(declare-fun m!483767 () Bool)

(assert (=> b!502844 m!483767))

(declare-fun m!483769 () Bool)

(assert (=> b!502841 m!483769))

(declare-fun m!483771 () Bool)

(assert (=> b!502851 m!483771))

(assert (=> b!502851 m!483741))

(declare-fun m!483773 () Bool)

(assert (=> start!45624 m!483773))

(declare-fun m!483775 () Bool)

(assert (=> start!45624 m!483775))

(declare-fun m!483777 () Bool)

(assert (=> b!502849 m!483777))

(declare-fun m!483779 () Bool)

(assert (=> b!502849 m!483779))

(assert (=> b!502849 m!483751))

(push 1)

