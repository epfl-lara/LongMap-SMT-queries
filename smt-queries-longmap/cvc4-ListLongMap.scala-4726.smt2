; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65420 () Bool)

(assert start!65420)

(declare-fun b!744781 () Bool)

(declare-fun e!416025 () Bool)

(declare-fun e!416030 () Bool)

(assert (=> b!744781 (= e!416025 e!416030)))

(declare-fun res!501729 () Bool)

(assert (=> b!744781 (=> (not res!501729) (not e!416030))))

(declare-datatypes ((SeekEntryResult!7510 0))(
  ( (MissingZero!7510 (index!32408 (_ BitVec 32))) (Found!7510 (index!32409 (_ BitVec 32))) (Intermediate!7510 (undefined!8322 Bool) (index!32410 (_ BitVec 32)) (x!63364 (_ BitVec 32))) (Undefined!7510) (MissingVacant!7510 (index!32411 (_ BitVec 32))) )
))
(declare-fun lt!330873 () SeekEntryResult!7510)

(declare-fun lt!330875 () SeekEntryResult!7510)

(assert (=> b!744781 (= res!501729 (= lt!330873 lt!330875))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41593 0))(
  ( (array!41594 (arr!19910 (Array (_ BitVec 32) (_ BitVec 64))) (size!20331 (_ BitVec 32))) )
))
(declare-fun lt!330870 () array!41593)

(declare-fun lt!330877 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41593 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!744781 (= lt!330875 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330877 lt!330870 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744781 (= lt!330873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330877 mask!3328) lt!330877 lt!330870 mask!3328))))

(declare-fun a!3186 () array!41593)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744781 (= lt!330877 (select (store (arr!19910 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744781 (= lt!330870 (array!41594 (store (arr!19910 a!3186) i!1173 k!2102) (size!20331 a!3186)))))

(declare-fun lt!330871 () SeekEntryResult!7510)

(declare-fun e!416028 () Bool)

(declare-fun b!744782 () Bool)

(assert (=> b!744782 (= e!416028 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330871))))

(declare-fun b!744783 () Bool)

(declare-fun res!501733 () Bool)

(assert (=> b!744783 (=> (not res!501733) (not e!416025))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!744783 (= res!501733 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19910 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744784 () Bool)

(declare-fun res!501731 () Bool)

(declare-fun e!416022 () Bool)

(assert (=> b!744784 (=> (not res!501731) (not e!416022))))

(declare-datatypes ((List!13912 0))(
  ( (Nil!13909) (Cons!13908 (h!14980 (_ BitVec 64)) (t!20227 List!13912)) )
))
(declare-fun arrayNoDuplicates!0 (array!41593 (_ BitVec 32) List!13912) Bool)

(assert (=> b!744784 (= res!501731 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13909))))

(declare-fun res!501739 () Bool)

(declare-fun e!416026 () Bool)

(assert (=> start!65420 (=> (not res!501739) (not e!416026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65420 (= res!501739 (validMask!0 mask!3328))))

(assert (=> start!65420 e!416026))

(assert (=> start!65420 true))

(declare-fun array_inv!15706 (array!41593) Bool)

(assert (=> start!65420 (array_inv!15706 a!3186)))

(declare-fun b!744785 () Bool)

(declare-fun res!501734 () Bool)

(assert (=> b!744785 (=> (not res!501734) (not e!416026))))

(assert (=> b!744785 (= res!501734 (and (= (size!20331 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20331 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20331 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744786 () Bool)

(declare-fun res!501743 () Bool)

(assert (=> b!744786 (=> (not res!501743) (not e!416022))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744786 (= res!501743 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20331 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20331 a!3186))))))

(declare-fun b!744787 () Bool)

(declare-fun res!501730 () Bool)

(assert (=> b!744787 (=> (not res!501730) (not e!416025))))

(assert (=> b!744787 (= res!501730 e!416028)))

(declare-fun c!81907 () Bool)

(assert (=> b!744787 (= c!81907 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744788 () Bool)

(declare-fun res!501737 () Bool)

(assert (=> b!744788 (=> (not res!501737) (not e!416026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744788 (= res!501737 (validKeyInArray!0 k!2102))))

(declare-fun b!744789 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41593 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!744789 (= e!416028 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) (Found!7510 j!159)))))

(declare-fun b!744790 () Bool)

(declare-fun res!501741 () Bool)

(assert (=> b!744790 (=> (not res!501741) (not e!416026))))

(assert (=> b!744790 (= res!501741 (validKeyInArray!0 (select (arr!19910 a!3186) j!159)))))

(declare-fun b!744791 () Bool)

(declare-fun res!501732 () Bool)

(assert (=> b!744791 (=> (not res!501732) (not e!416026))))

(declare-fun arrayContainsKey!0 (array!41593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744791 (= res!501732 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744792 () Bool)

(declare-fun e!416027 () Bool)

(assert (=> b!744792 (= e!416030 (not e!416027))))

(declare-fun res!501742 () Bool)

(assert (=> b!744792 (=> res!501742 e!416027)))

(assert (=> b!744792 (= res!501742 (or (not (is-Intermediate!7510 lt!330875)) (bvslt x!1131 (x!63364 lt!330875)) (not (= x!1131 (x!63364 lt!330875))) (not (= index!1321 (index!32410 lt!330875)))))))

(declare-fun e!416029 () Bool)

(assert (=> b!744792 e!416029))

(declare-fun res!501735 () Bool)

(assert (=> b!744792 (=> (not res!501735) (not e!416029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41593 (_ BitVec 32)) Bool)

(assert (=> b!744792 (= res!501735 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25500 0))(
  ( (Unit!25501) )
))
(declare-fun lt!330876 () Unit!25500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25500)

(assert (=> b!744792 (= lt!330876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744793 () Bool)

(assert (=> b!744793 (= e!416026 e!416022)))

(declare-fun res!501740 () Bool)

(assert (=> b!744793 (=> (not res!501740) (not e!416022))))

(declare-fun lt!330878 () SeekEntryResult!7510)

(assert (=> b!744793 (= res!501740 (or (= lt!330878 (MissingZero!7510 i!1173)) (= lt!330878 (MissingVacant!7510 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41593 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!744793 (= lt!330878 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744794 () Bool)

(declare-fun res!501728 () Bool)

(assert (=> b!744794 (=> (not res!501728) (not e!416022))))

(assert (=> b!744794 (= res!501728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!330872 () SeekEntryResult!7510)

(declare-fun b!744795 () Bool)

(declare-fun e!416024 () Bool)

(assert (=> b!744795 (= e!416024 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330872))))

(declare-fun b!744796 () Bool)

(assert (=> b!744796 (= e!416022 e!416025)))

(declare-fun res!501736 () Bool)

(assert (=> b!744796 (=> (not res!501736) (not e!416025))))

(assert (=> b!744796 (= res!501736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19910 a!3186) j!159) mask!3328) (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330871))))

(assert (=> b!744796 (= lt!330871 (Intermediate!7510 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744797 () Bool)

(assert (=> b!744797 (= e!416029 e!416024)))

(declare-fun res!501738 () Bool)

(assert (=> b!744797 (=> (not res!501738) (not e!416024))))

(assert (=> b!744797 (= res!501738 (= (seekEntryOrOpen!0 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330872))))

(assert (=> b!744797 (= lt!330872 (Found!7510 j!159))))

(declare-fun b!744798 () Bool)

(assert (=> b!744798 (= e!416027 true)))

(declare-fun lt!330874 () SeekEntryResult!7510)

(assert (=> b!744798 (= lt!330874 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19910 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65420 res!501739) b!744785))

(assert (= (and b!744785 res!501734) b!744790))

(assert (= (and b!744790 res!501741) b!744788))

(assert (= (and b!744788 res!501737) b!744791))

(assert (= (and b!744791 res!501732) b!744793))

(assert (= (and b!744793 res!501740) b!744794))

(assert (= (and b!744794 res!501728) b!744784))

(assert (= (and b!744784 res!501731) b!744786))

(assert (= (and b!744786 res!501743) b!744796))

(assert (= (and b!744796 res!501736) b!744783))

(assert (= (and b!744783 res!501733) b!744787))

(assert (= (and b!744787 c!81907) b!744782))

(assert (= (and b!744787 (not c!81907)) b!744789))

(assert (= (and b!744787 res!501730) b!744781))

(assert (= (and b!744781 res!501729) b!744792))

(assert (= (and b!744792 res!501735) b!744797))

(assert (= (and b!744797 res!501738) b!744795))

(assert (= (and b!744792 (not res!501742)) b!744798))

(declare-fun m!695259 () Bool)

(assert (=> b!744794 m!695259))

(declare-fun m!695261 () Bool)

(assert (=> b!744797 m!695261))

(assert (=> b!744797 m!695261))

(declare-fun m!695263 () Bool)

(assert (=> b!744797 m!695263))

(assert (=> b!744798 m!695261))

(assert (=> b!744798 m!695261))

(declare-fun m!695265 () Bool)

(assert (=> b!744798 m!695265))

(declare-fun m!695267 () Bool)

(assert (=> b!744784 m!695267))

(assert (=> b!744790 m!695261))

(assert (=> b!744790 m!695261))

(declare-fun m!695269 () Bool)

(assert (=> b!744790 m!695269))

(declare-fun m!695271 () Bool)

(assert (=> b!744788 m!695271))

(declare-fun m!695273 () Bool)

(assert (=> start!65420 m!695273))

(declare-fun m!695275 () Bool)

(assert (=> start!65420 m!695275))

(assert (=> b!744789 m!695261))

(assert (=> b!744789 m!695261))

(assert (=> b!744789 m!695265))

(assert (=> b!744795 m!695261))

(assert (=> b!744795 m!695261))

(declare-fun m!695277 () Bool)

(assert (=> b!744795 m!695277))

(declare-fun m!695279 () Bool)

(assert (=> b!744791 m!695279))

(assert (=> b!744782 m!695261))

(assert (=> b!744782 m!695261))

(declare-fun m!695281 () Bool)

(assert (=> b!744782 m!695281))

(assert (=> b!744796 m!695261))

(assert (=> b!744796 m!695261))

(declare-fun m!695283 () Bool)

(assert (=> b!744796 m!695283))

(assert (=> b!744796 m!695283))

(assert (=> b!744796 m!695261))

(declare-fun m!695285 () Bool)

(assert (=> b!744796 m!695285))

(declare-fun m!695287 () Bool)

(assert (=> b!744792 m!695287))

(declare-fun m!695289 () Bool)

(assert (=> b!744792 m!695289))

(declare-fun m!695291 () Bool)

(assert (=> b!744783 m!695291))

(declare-fun m!695293 () Bool)

(assert (=> b!744781 m!695293))

(declare-fun m!695295 () Bool)

(assert (=> b!744781 m!695295))

(declare-fun m!695297 () Bool)

(assert (=> b!744781 m!695297))

(declare-fun m!695299 () Bool)

(assert (=> b!744781 m!695299))

(declare-fun m!695301 () Bool)

(assert (=> b!744781 m!695301))

(assert (=> b!744781 m!695295))

(declare-fun m!695303 () Bool)

(assert (=> b!744793 m!695303))

(push 1)

