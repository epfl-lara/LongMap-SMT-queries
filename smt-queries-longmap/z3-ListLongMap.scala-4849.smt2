; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66770 () Bool)

(assert start!66770)

(declare-fun b!769906 () Bool)

(declare-fun e!428658 () Bool)

(assert (=> b!769906 (= e!428658 true)))

(declare-datatypes ((Unit!26486 0))(
  ( (Unit!26487) )
))
(declare-fun lt!342499 () Unit!26486)

(declare-fun e!428660 () Unit!26486)

(assert (=> b!769906 (= lt!342499 e!428660)))

(declare-fun c!84941 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769906 (= c!84941 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342506 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769906 (= lt!342506 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769907 () Bool)

(declare-fun res!520823 () Bool)

(declare-fun e!428663 () Bool)

(assert (=> b!769907 (=> (not res!520823) (not e!428663))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769907 (= res!520823 (validKeyInArray!0 k0!2102))))

(declare-fun b!769909 () Bool)

(declare-fun e!428665 () Bool)

(declare-fun e!428662 () Bool)

(assert (=> b!769909 (= e!428665 e!428662)))

(declare-fun res!520818 () Bool)

(assert (=> b!769909 (=> (not res!520818) (not e!428662))))

(declare-datatypes ((array!42351 0))(
  ( (array!42352 (arr!20276 (Array (_ BitVec 32) (_ BitVec 64))) (size!20697 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42351)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7873 0))(
  ( (MissingZero!7873 (index!33860 (_ BitVec 32))) (Found!7873 (index!33861 (_ BitVec 32))) (Intermediate!7873 (undefined!8685 Bool) (index!33862 (_ BitVec 32)) (x!64799 (_ BitVec 32))) (Undefined!7873) (MissingVacant!7873 (index!33863 (_ BitVec 32))) )
))
(declare-fun lt!342503 () SeekEntryResult!7873)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42351 (_ BitVec 32)) SeekEntryResult!7873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769909 (= res!520818 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20276 a!3186) j!159) mask!3328) (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342503))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!769909 (= lt!342503 (Intermediate!7873 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769910 () Bool)

(declare-fun res!520830 () Bool)

(assert (=> b!769910 (=> (not res!520830) (not e!428665))))

(declare-datatypes ((List!14317 0))(
  ( (Nil!14314) (Cons!14313 (h!15412 (_ BitVec 64)) (t!20623 List!14317)) )
))
(declare-fun arrayNoDuplicates!0 (array!42351 (_ BitVec 32) List!14317) Bool)

(assert (=> b!769910 (= res!520830 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14314))))

(declare-fun b!769911 () Bool)

(declare-fun res!520822 () Bool)

(assert (=> b!769911 (=> (not res!520822) (not e!428662))))

(declare-fun e!428656 () Bool)

(assert (=> b!769911 (= res!520822 e!428656)))

(declare-fun c!84942 () Bool)

(assert (=> b!769911 (= c!84942 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769912 () Bool)

(declare-fun Unit!26488 () Unit!26486)

(assert (=> b!769912 (= e!428660 Unit!26488)))

(assert (=> b!769912 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342506 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342503)))

(declare-fun b!769913 () Bool)

(declare-fun res!520817 () Bool)

(assert (=> b!769913 (=> (not res!520817) (not e!428663))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769913 (= res!520817 (and (= (size!20697 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20697 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20697 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769908 () Bool)

(declare-fun res!520820 () Bool)

(assert (=> b!769908 (=> (not res!520820) (not e!428665))))

(assert (=> b!769908 (= res!520820 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20697 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20697 a!3186))))))

(declare-fun res!520816 () Bool)

(assert (=> start!66770 (=> (not res!520816) (not e!428663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66770 (= res!520816 (validMask!0 mask!3328))))

(assert (=> start!66770 e!428663))

(assert (=> start!66770 true))

(declare-fun array_inv!16159 (array!42351) Bool)

(assert (=> start!66770 (array_inv!16159 a!3186)))

(declare-fun b!769914 () Bool)

(declare-fun res!520825 () Bool)

(assert (=> b!769914 (=> (not res!520825) (not e!428665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42351 (_ BitVec 32)) Bool)

(assert (=> b!769914 (= res!520825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769915 () Bool)

(assert (=> b!769915 (= e!428663 e!428665)))

(declare-fun res!520829 () Bool)

(assert (=> b!769915 (=> (not res!520829) (not e!428665))))

(declare-fun lt!342504 () SeekEntryResult!7873)

(assert (=> b!769915 (= res!520829 (or (= lt!342504 (MissingZero!7873 i!1173)) (= lt!342504 (MissingVacant!7873 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42351 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!769915 (= lt!342504 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769916 () Bool)

(declare-fun e!428664 () Bool)

(assert (=> b!769916 (= e!428662 e!428664)))

(declare-fun res!520821 () Bool)

(assert (=> b!769916 (=> (not res!520821) (not e!428664))))

(declare-fun lt!342501 () SeekEntryResult!7873)

(declare-fun lt!342505 () SeekEntryResult!7873)

(assert (=> b!769916 (= res!520821 (= lt!342501 lt!342505))))

(declare-fun lt!342507 () (_ BitVec 64))

(declare-fun lt!342502 () array!42351)

(assert (=> b!769916 (= lt!342505 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342507 lt!342502 mask!3328))))

(assert (=> b!769916 (= lt!342501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342507 mask!3328) lt!342507 lt!342502 mask!3328))))

(assert (=> b!769916 (= lt!342507 (select (store (arr!20276 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769916 (= lt!342502 (array!42352 (store (arr!20276 a!3186) i!1173 k0!2102) (size!20697 a!3186)))))

(declare-fun b!769917 () Bool)

(declare-fun Unit!26489 () Unit!26486)

(assert (=> b!769917 (= e!428660 Unit!26489)))

(declare-fun lt!342509 () SeekEntryResult!7873)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42351 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!769917 (= lt!342509 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769917 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342506 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) (Found!7873 j!159))))

(declare-fun b!769918 () Bool)

(assert (=> b!769918 (= e!428656 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) (Found!7873 j!159)))))

(declare-fun b!769919 () Bool)

(declare-fun e!428661 () Bool)

(declare-fun lt!342500 () SeekEntryResult!7873)

(assert (=> b!769919 (= e!428661 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342500))))

(declare-fun b!769920 () Bool)

(declare-fun res!520824 () Bool)

(assert (=> b!769920 (=> (not res!520824) (not e!428663))))

(declare-fun arrayContainsKey!0 (array!42351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769920 (= res!520824 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769921 () Bool)

(declare-fun res!520827 () Bool)

(assert (=> b!769921 (=> (not res!520827) (not e!428663))))

(assert (=> b!769921 (= res!520827 (validKeyInArray!0 (select (arr!20276 a!3186) j!159)))))

(declare-fun b!769922 () Bool)

(assert (=> b!769922 (= e!428656 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342503))))

(declare-fun b!769923 () Bool)

(assert (=> b!769923 (= e!428664 (not e!428658))))

(declare-fun res!520826 () Bool)

(assert (=> b!769923 (=> res!520826 e!428658)))

(get-info :version)

(assert (=> b!769923 (= res!520826 (or (not ((_ is Intermediate!7873) lt!342505)) (bvsge x!1131 (x!64799 lt!342505))))))

(declare-fun e!428659 () Bool)

(assert (=> b!769923 e!428659))

(declare-fun res!520828 () Bool)

(assert (=> b!769923 (=> (not res!520828) (not e!428659))))

(assert (=> b!769923 (= res!520828 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342508 () Unit!26486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26486)

(assert (=> b!769923 (= lt!342508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769924 () Bool)

(declare-fun res!520815 () Bool)

(assert (=> b!769924 (=> (not res!520815) (not e!428662))))

(assert (=> b!769924 (= res!520815 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20276 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769925 () Bool)

(assert (=> b!769925 (= e!428659 e!428661)))

(declare-fun res!520819 () Bool)

(assert (=> b!769925 (=> (not res!520819) (not e!428661))))

(assert (=> b!769925 (= res!520819 (= (seekEntryOrOpen!0 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342500))))

(assert (=> b!769925 (= lt!342500 (Found!7873 j!159))))

(assert (= (and start!66770 res!520816) b!769913))

(assert (= (and b!769913 res!520817) b!769921))

(assert (= (and b!769921 res!520827) b!769907))

(assert (= (and b!769907 res!520823) b!769920))

(assert (= (and b!769920 res!520824) b!769915))

(assert (= (and b!769915 res!520829) b!769914))

(assert (= (and b!769914 res!520825) b!769910))

(assert (= (and b!769910 res!520830) b!769908))

(assert (= (and b!769908 res!520820) b!769909))

(assert (= (and b!769909 res!520818) b!769924))

(assert (= (and b!769924 res!520815) b!769911))

(assert (= (and b!769911 c!84942) b!769922))

(assert (= (and b!769911 (not c!84942)) b!769918))

(assert (= (and b!769911 res!520822) b!769916))

(assert (= (and b!769916 res!520821) b!769923))

(assert (= (and b!769923 res!520828) b!769925))

(assert (= (and b!769925 res!520819) b!769919))

(assert (= (and b!769923 (not res!520826)) b!769906))

(assert (= (and b!769906 c!84941) b!769912))

(assert (= (and b!769906 (not c!84941)) b!769917))

(declare-fun m!714717 () Bool)

(assert (=> b!769925 m!714717))

(assert (=> b!769925 m!714717))

(declare-fun m!714719 () Bool)

(assert (=> b!769925 m!714719))

(assert (=> b!769921 m!714717))

(assert (=> b!769921 m!714717))

(declare-fun m!714721 () Bool)

(assert (=> b!769921 m!714721))

(assert (=> b!769918 m!714717))

(assert (=> b!769918 m!714717))

(declare-fun m!714723 () Bool)

(assert (=> b!769918 m!714723))

(declare-fun m!714725 () Bool)

(assert (=> b!769920 m!714725))

(declare-fun m!714727 () Bool)

(assert (=> b!769907 m!714727))

(declare-fun m!714729 () Bool)

(assert (=> b!769915 m!714729))

(assert (=> b!769922 m!714717))

(assert (=> b!769922 m!714717))

(declare-fun m!714731 () Bool)

(assert (=> b!769922 m!714731))

(declare-fun m!714733 () Bool)

(assert (=> b!769916 m!714733))

(declare-fun m!714735 () Bool)

(assert (=> b!769916 m!714735))

(assert (=> b!769916 m!714733))

(declare-fun m!714737 () Bool)

(assert (=> b!769916 m!714737))

(declare-fun m!714739 () Bool)

(assert (=> b!769916 m!714739))

(declare-fun m!714741 () Bool)

(assert (=> b!769916 m!714741))

(assert (=> b!769919 m!714717))

(assert (=> b!769919 m!714717))

(declare-fun m!714743 () Bool)

(assert (=> b!769919 m!714743))

(assert (=> b!769912 m!714717))

(assert (=> b!769912 m!714717))

(declare-fun m!714745 () Bool)

(assert (=> b!769912 m!714745))

(declare-fun m!714747 () Bool)

(assert (=> b!769910 m!714747))

(assert (=> b!769917 m!714717))

(assert (=> b!769917 m!714717))

(assert (=> b!769917 m!714723))

(assert (=> b!769917 m!714717))

(declare-fun m!714749 () Bool)

(assert (=> b!769917 m!714749))

(declare-fun m!714751 () Bool)

(assert (=> b!769924 m!714751))

(declare-fun m!714753 () Bool)

(assert (=> b!769906 m!714753))

(declare-fun m!714755 () Bool)

(assert (=> start!66770 m!714755))

(declare-fun m!714757 () Bool)

(assert (=> start!66770 m!714757))

(declare-fun m!714759 () Bool)

(assert (=> b!769923 m!714759))

(declare-fun m!714761 () Bool)

(assert (=> b!769923 m!714761))

(declare-fun m!714763 () Bool)

(assert (=> b!769914 m!714763))

(assert (=> b!769909 m!714717))

(assert (=> b!769909 m!714717))

(declare-fun m!714765 () Bool)

(assert (=> b!769909 m!714765))

(assert (=> b!769909 m!714765))

(assert (=> b!769909 m!714717))

(declare-fun m!714767 () Bool)

(assert (=> b!769909 m!714767))

(check-sat (not b!769920) (not b!769917) (not b!769907) (not b!769914) (not b!769909) (not b!769919) (not b!769925) (not b!769923) (not b!769912) (not b!769918) (not b!769915) (not start!66770) (not b!769922) (not b!769910) (not b!769906) (not b!769921) (not b!769916))
(check-sat)
