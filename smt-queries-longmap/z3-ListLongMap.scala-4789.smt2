; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65796 () Bool)

(assert start!65796)

(declare-fun b!756875 () Bool)

(declare-fun res!511820 () Bool)

(declare-fun e!422026 () Bool)

(assert (=> b!756875 (=> (not res!511820) (not e!422026))))

(declare-datatypes ((array!41969 0))(
  ( (array!41970 (arr!20098 (Array (_ BitVec 32) (_ BitVec 64))) (size!20519 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41969)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756875 (= res!511820 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756876 () Bool)

(declare-fun e!422024 () Bool)

(declare-fun e!422031 () Bool)

(assert (=> b!756876 (= e!422024 e!422031)))

(declare-fun res!511807 () Bool)

(assert (=> b!756876 (=> res!511807 e!422031)))

(declare-fun lt!337021 () (_ BitVec 64))

(declare-fun lt!337020 () (_ BitVec 64))

(assert (=> b!756876 (= res!511807 (= lt!337021 lt!337020))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!756876 (= lt!337021 (select (store (arr!20098 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756877 () Bool)

(declare-fun res!511812 () Bool)

(assert (=> b!756877 (=> (not res!511812) (not e!422026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756877 (= res!511812 (validKeyInArray!0 k0!2102))))

(declare-fun b!756878 () Bool)

(declare-fun e!422033 () Bool)

(declare-datatypes ((SeekEntryResult!7698 0))(
  ( (MissingZero!7698 (index!33160 (_ BitVec 32))) (Found!7698 (index!33161 (_ BitVec 32))) (Intermediate!7698 (undefined!8510 Bool) (index!33162 (_ BitVec 32)) (x!64056 (_ BitVec 32))) (Undefined!7698) (MissingVacant!7698 (index!33163 (_ BitVec 32))) )
))
(declare-fun lt!337014 () SeekEntryResult!7698)

(declare-fun lt!337015 () SeekEntryResult!7698)

(assert (=> b!756878 (= e!422033 (= lt!337014 lt!337015))))

(declare-fun b!756879 () Bool)

(declare-fun e!422028 () Bool)

(declare-fun e!422025 () Bool)

(assert (=> b!756879 (= e!422028 (not e!422025))))

(declare-fun res!511813 () Bool)

(assert (=> b!756879 (=> res!511813 e!422025)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337023 () SeekEntryResult!7698)

(get-info :version)

(assert (=> b!756879 (= res!511813 (or (not ((_ is Intermediate!7698) lt!337023)) (bvslt x!1131 (x!64056 lt!337023)) (not (= x!1131 (x!64056 lt!337023))) (not (= index!1321 (index!33162 lt!337023)))))))

(declare-fun e!422032 () Bool)

(assert (=> b!756879 e!422032))

(declare-fun res!511808 () Bool)

(assert (=> b!756879 (=> (not res!511808) (not e!422032))))

(declare-fun lt!337025 () SeekEntryResult!7698)

(assert (=> b!756879 (= res!511808 (= lt!337014 lt!337025))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756879 (= lt!337025 (Found!7698 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41969 (_ BitVec 32)) SeekEntryResult!7698)

(assert (=> b!756879 (= lt!337014 (seekEntryOrOpen!0 (select (arr!20098 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41969 (_ BitVec 32)) Bool)

(assert (=> b!756879 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26172 0))(
  ( (Unit!26173) )
))
(declare-fun lt!337018 () Unit!26172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26172)

(assert (=> b!756879 (= lt!337018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756880 () Bool)

(declare-fun e!422029 () Bool)

(declare-fun e!422030 () Bool)

(assert (=> b!756880 (= e!422029 e!422030)))

(declare-fun res!511803 () Bool)

(assert (=> b!756880 (=> (not res!511803) (not e!422030))))

(declare-fun lt!337019 () SeekEntryResult!7698)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41969 (_ BitVec 32)) SeekEntryResult!7698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756880 (= res!511803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20098 a!3186) j!159) mask!3328) (select (arr!20098 a!3186) j!159) a!3186 mask!3328) lt!337019))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756880 (= lt!337019 (Intermediate!7698 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756881 () Bool)

(declare-fun res!511802 () Bool)

(assert (=> b!756881 (=> (not res!511802) (not e!422026))))

(assert (=> b!756881 (= res!511802 (validKeyInArray!0 (select (arr!20098 a!3186) j!159)))))

(declare-fun b!756882 () Bool)

(declare-fun e!422027 () Unit!26172)

(declare-fun Unit!26174 () Unit!26172)

(assert (=> b!756882 (= e!422027 Unit!26174)))

(assert (=> b!756882 false))

(declare-fun res!511817 () Bool)

(assert (=> start!65796 (=> (not res!511817) (not e!422026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65796 (= res!511817 (validMask!0 mask!3328))))

(assert (=> start!65796 e!422026))

(assert (=> start!65796 true))

(declare-fun array_inv!15894 (array!41969) Bool)

(assert (=> start!65796 (array_inv!15894 a!3186)))

(declare-fun b!756883 () Bool)

(declare-fun res!511810 () Bool)

(assert (=> b!756883 (=> (not res!511810) (not e!422033))))

(declare-fun lt!337017 () array!41969)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41969 (_ BitVec 32)) SeekEntryResult!7698)

(assert (=> b!756883 (= res!511810 (= (seekEntryOrOpen!0 lt!337020 lt!337017 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337020 lt!337017 mask!3328)))))

(declare-fun b!756884 () Bool)

(declare-fun res!511818 () Bool)

(assert (=> b!756884 (=> (not res!511818) (not e!422029))))

(assert (=> b!756884 (= res!511818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756885 () Bool)

(declare-fun res!511811 () Bool)

(assert (=> b!756885 (=> (not res!511811) (not e!422026))))

(assert (=> b!756885 (= res!511811 (and (= (size!20519 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20519 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20519 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756886 () Bool)

(assert (=> b!756886 (= e!422025 e!422024)))

(declare-fun res!511809 () Bool)

(assert (=> b!756886 (=> res!511809 e!422024)))

(assert (=> b!756886 (= res!511809 (not (= lt!337015 lt!337025)))))

(assert (=> b!756886 (= lt!337015 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20098 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756887 () Bool)

(assert (=> b!756887 (= e!422030 e!422028)))

(declare-fun res!511804 () Bool)

(assert (=> b!756887 (=> (not res!511804) (not e!422028))))

(declare-fun lt!337016 () SeekEntryResult!7698)

(assert (=> b!756887 (= res!511804 (= lt!337016 lt!337023))))

(assert (=> b!756887 (= lt!337023 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337020 lt!337017 mask!3328))))

(assert (=> b!756887 (= lt!337016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337020 mask!3328) lt!337020 lt!337017 mask!3328))))

(assert (=> b!756887 (= lt!337020 (select (store (arr!20098 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756887 (= lt!337017 (array!41970 (store (arr!20098 a!3186) i!1173 k0!2102) (size!20519 a!3186)))))

(declare-fun e!422022 () Bool)

(declare-fun b!756888 () Bool)

(assert (=> b!756888 (= e!422022 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20098 a!3186) j!159) a!3186 mask!3328) lt!337019))))

(declare-fun b!756889 () Bool)

(declare-fun Unit!26175 () Unit!26172)

(assert (=> b!756889 (= e!422027 Unit!26175)))

(declare-fun b!756890 () Bool)

(assert (=> b!756890 (= e!422032 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20098 a!3186) j!159) a!3186 mask!3328) lt!337025))))

(declare-fun b!756891 () Bool)

(assert (=> b!756891 (= e!422022 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20098 a!3186) j!159) a!3186 mask!3328) (Found!7698 j!159)))))

(declare-fun b!756892 () Bool)

(declare-fun res!511819 () Bool)

(assert (=> b!756892 (=> (not res!511819) (not e!422030))))

(assert (=> b!756892 (= res!511819 e!422022)))

(declare-fun c!82918 () Bool)

(assert (=> b!756892 (= c!82918 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756893 () Bool)

(declare-fun res!511814 () Bool)

(assert (=> b!756893 (=> (not res!511814) (not e!422030))))

(assert (=> b!756893 (= res!511814 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20098 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756894 () Bool)

(assert (=> b!756894 (= e!422031 true)))

(assert (=> b!756894 e!422033))

(declare-fun res!511815 () Bool)

(assert (=> b!756894 (=> (not res!511815) (not e!422033))))

(assert (=> b!756894 (= res!511815 (= lt!337021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337022 () Unit!26172)

(assert (=> b!756894 (= lt!337022 e!422027)))

(declare-fun c!82917 () Bool)

(assert (=> b!756894 (= c!82917 (= lt!337021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756895 () Bool)

(declare-fun res!511805 () Bool)

(assert (=> b!756895 (=> (not res!511805) (not e!422029))))

(declare-datatypes ((List!14100 0))(
  ( (Nil!14097) (Cons!14096 (h!15168 (_ BitVec 64)) (t!20415 List!14100)) )
))
(declare-fun arrayNoDuplicates!0 (array!41969 (_ BitVec 32) List!14100) Bool)

(assert (=> b!756895 (= res!511805 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14097))))

(declare-fun b!756896 () Bool)

(declare-fun res!511806 () Bool)

(assert (=> b!756896 (=> (not res!511806) (not e!422029))))

(assert (=> b!756896 (= res!511806 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20519 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20519 a!3186))))))

(declare-fun b!756897 () Bool)

(assert (=> b!756897 (= e!422026 e!422029)))

(declare-fun res!511816 () Bool)

(assert (=> b!756897 (=> (not res!511816) (not e!422029))))

(declare-fun lt!337024 () SeekEntryResult!7698)

(assert (=> b!756897 (= res!511816 (or (= lt!337024 (MissingZero!7698 i!1173)) (= lt!337024 (MissingVacant!7698 i!1173))))))

(assert (=> b!756897 (= lt!337024 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65796 res!511817) b!756885))

(assert (= (and b!756885 res!511811) b!756881))

(assert (= (and b!756881 res!511802) b!756877))

(assert (= (and b!756877 res!511812) b!756875))

(assert (= (and b!756875 res!511820) b!756897))

(assert (= (and b!756897 res!511816) b!756884))

(assert (= (and b!756884 res!511818) b!756895))

(assert (= (and b!756895 res!511805) b!756896))

(assert (= (and b!756896 res!511806) b!756880))

(assert (= (and b!756880 res!511803) b!756893))

(assert (= (and b!756893 res!511814) b!756892))

(assert (= (and b!756892 c!82918) b!756888))

(assert (= (and b!756892 (not c!82918)) b!756891))

(assert (= (and b!756892 res!511819) b!756887))

(assert (= (and b!756887 res!511804) b!756879))

(assert (= (and b!756879 res!511808) b!756890))

(assert (= (and b!756879 (not res!511813)) b!756886))

(assert (= (and b!756886 (not res!511809)) b!756876))

(assert (= (and b!756876 (not res!511807)) b!756894))

(assert (= (and b!756894 c!82917) b!756882))

(assert (= (and b!756894 (not c!82917)) b!756889))

(assert (= (and b!756894 res!511815) b!756883))

(assert (= (and b!756883 res!511810) b!756878))

(declare-fun m!704723 () Bool)

(assert (=> b!756891 m!704723))

(assert (=> b!756891 m!704723))

(declare-fun m!704725 () Bool)

(assert (=> b!756891 m!704725))

(declare-fun m!704727 () Bool)

(assert (=> b!756897 m!704727))

(declare-fun m!704729 () Bool)

(assert (=> b!756875 m!704729))

(declare-fun m!704731 () Bool)

(assert (=> b!756877 m!704731))

(declare-fun m!704733 () Bool)

(assert (=> b!756884 m!704733))

(declare-fun m!704735 () Bool)

(assert (=> b!756895 m!704735))

(declare-fun m!704737 () Bool)

(assert (=> b!756883 m!704737))

(declare-fun m!704739 () Bool)

(assert (=> b!756883 m!704739))

(assert (=> b!756888 m!704723))

(assert (=> b!756888 m!704723))

(declare-fun m!704741 () Bool)

(assert (=> b!756888 m!704741))

(declare-fun m!704743 () Bool)

(assert (=> b!756876 m!704743))

(declare-fun m!704745 () Bool)

(assert (=> b!756876 m!704745))

(declare-fun m!704747 () Bool)

(assert (=> start!65796 m!704747))

(declare-fun m!704749 () Bool)

(assert (=> start!65796 m!704749))

(assert (=> b!756880 m!704723))

(assert (=> b!756880 m!704723))

(declare-fun m!704751 () Bool)

(assert (=> b!756880 m!704751))

(assert (=> b!756880 m!704751))

(assert (=> b!756880 m!704723))

(declare-fun m!704753 () Bool)

(assert (=> b!756880 m!704753))

(assert (=> b!756881 m!704723))

(assert (=> b!756881 m!704723))

(declare-fun m!704755 () Bool)

(assert (=> b!756881 m!704755))

(assert (=> b!756879 m!704723))

(assert (=> b!756879 m!704723))

(declare-fun m!704757 () Bool)

(assert (=> b!756879 m!704757))

(declare-fun m!704759 () Bool)

(assert (=> b!756879 m!704759))

(declare-fun m!704761 () Bool)

(assert (=> b!756879 m!704761))

(assert (=> b!756890 m!704723))

(assert (=> b!756890 m!704723))

(declare-fun m!704763 () Bool)

(assert (=> b!756890 m!704763))

(assert (=> b!756886 m!704723))

(assert (=> b!756886 m!704723))

(assert (=> b!756886 m!704725))

(declare-fun m!704765 () Bool)

(assert (=> b!756887 m!704765))

(declare-fun m!704767 () Bool)

(assert (=> b!756887 m!704767))

(assert (=> b!756887 m!704765))

(assert (=> b!756887 m!704743))

(declare-fun m!704769 () Bool)

(assert (=> b!756887 m!704769))

(declare-fun m!704771 () Bool)

(assert (=> b!756887 m!704771))

(declare-fun m!704773 () Bool)

(assert (=> b!756893 m!704773))

(check-sat (not b!756879) (not b!756895) (not b!756891) (not b!756887) (not start!65796) (not b!756884) (not b!756880) (not b!756886) (not b!756890) (not b!756877) (not b!756888) (not b!756875) (not b!756897) (not b!756883) (not b!756881))
(check-sat)
