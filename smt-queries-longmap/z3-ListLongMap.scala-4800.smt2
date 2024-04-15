; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65840 () Bool)

(assert start!65840)

(declare-fun b!758794 () Bool)

(declare-fun res!513483 () Bool)

(declare-fun e!423022 () Bool)

(assert (=> b!758794 (=> (not res!513483) (not e!423022))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42030 0))(
  ( (array!42031 (arr!20129 (Array (_ BitVec 32) (_ BitVec 64))) (size!20550 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42030)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758794 (= res!513483 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20129 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758795 () Bool)

(declare-fun e!423028 () Bool)

(assert (=> b!758795 (= e!423028 (not true))))

(declare-fun e!423026 () Bool)

(assert (=> b!758795 e!423026))

(declare-fun res!513495 () Bool)

(assert (=> b!758795 (=> (not res!513495) (not e!423026))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42030 (_ BitVec 32)) Bool)

(assert (=> b!758795 (= res!513495 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26264 0))(
  ( (Unit!26265) )
))
(declare-fun lt!338024 () Unit!26264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26264)

(assert (=> b!758795 (= lt!338024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758796 () Bool)

(declare-fun res!513487 () Bool)

(declare-fun e!423021 () Bool)

(assert (=> b!758796 (=> (not res!513487) (not e!423021))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758796 (= res!513487 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758797 () Bool)

(declare-fun res!513491 () Bool)

(declare-fun e!423027 () Bool)

(assert (=> b!758797 (=> (not res!513491) (not e!423027))))

(assert (=> b!758797 (= res!513491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758798 () Bool)

(declare-fun res!513492 () Bool)

(assert (=> b!758798 (=> (not res!513492) (not e!423022))))

(declare-fun e!423024 () Bool)

(assert (=> b!758798 (= res!513492 e!423024)))

(declare-fun c!83037 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758798 (= c!83037 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758799 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7726 0))(
  ( (MissingZero!7726 (index!33272 (_ BitVec 32))) (Found!7726 (index!33273 (_ BitVec 32))) (Intermediate!7726 (undefined!8538 Bool) (index!33274 (_ BitVec 32)) (x!64167 (_ BitVec 32))) (Undefined!7726) (MissingVacant!7726 (index!33275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42030 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!758799 (= e!423024 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) (Found!7726 j!159)))))

(declare-fun b!758800 () Bool)

(assert (=> b!758800 (= e!423021 e!423027)))

(declare-fun res!513484 () Bool)

(assert (=> b!758800 (=> (not res!513484) (not e!423027))))

(declare-fun lt!338027 () SeekEntryResult!7726)

(assert (=> b!758800 (= res!513484 (or (= lt!338027 (MissingZero!7726 i!1173)) (= lt!338027 (MissingVacant!7726 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42030 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!758800 (= lt!338027 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758801 () Bool)

(declare-fun res!513485 () Bool)

(assert (=> b!758801 (=> (not res!513485) (not e!423027))))

(assert (=> b!758801 (= res!513485 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20550 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20550 a!3186))))))

(declare-fun b!758802 () Bool)

(declare-fun res!513490 () Bool)

(assert (=> b!758802 (=> (not res!513490) (not e!423027))))

(declare-datatypes ((List!14170 0))(
  ( (Nil!14167) (Cons!14166 (h!15238 (_ BitVec 64)) (t!20476 List!14170)) )
))
(declare-fun arrayNoDuplicates!0 (array!42030 (_ BitVec 32) List!14170) Bool)

(assert (=> b!758802 (= res!513490 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14167))))

(declare-fun e!423025 () Bool)

(declare-fun lt!338022 () SeekEntryResult!7726)

(declare-fun b!758804 () Bool)

(assert (=> b!758804 (= e!423025 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338022))))

(declare-fun b!758805 () Bool)

(assert (=> b!758805 (= e!423022 e!423028)))

(declare-fun res!513493 () Bool)

(assert (=> b!758805 (=> (not res!513493) (not e!423028))))

(declare-fun lt!338026 () array!42030)

(declare-fun lt!338023 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42030 (_ BitVec 32)) SeekEntryResult!7726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758805 (= res!513493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338023 mask!3328) lt!338023 lt!338026 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338023 lt!338026 mask!3328)))))

(assert (=> b!758805 (= lt!338023 (select (store (arr!20129 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758805 (= lt!338026 (array!42031 (store (arr!20129 a!3186) i!1173 k0!2102) (size!20550 a!3186)))))

(declare-fun b!758806 () Bool)

(assert (=> b!758806 (= e!423027 e!423022)))

(declare-fun res!513486 () Bool)

(assert (=> b!758806 (=> (not res!513486) (not e!423022))))

(declare-fun lt!338025 () SeekEntryResult!7726)

(assert (=> b!758806 (= res!513486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20129 a!3186) j!159) mask!3328) (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338025))))

(assert (=> b!758806 (= lt!338025 (Intermediate!7726 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758807 () Bool)

(declare-fun res!513494 () Bool)

(assert (=> b!758807 (=> (not res!513494) (not e!423021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758807 (= res!513494 (validKeyInArray!0 (select (arr!20129 a!3186) j!159)))))

(declare-fun b!758808 () Bool)

(assert (=> b!758808 (= e!423024 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338025))))

(declare-fun b!758809 () Bool)

(assert (=> b!758809 (= e!423026 e!423025)))

(declare-fun res!513481 () Bool)

(assert (=> b!758809 (=> (not res!513481) (not e!423025))))

(assert (=> b!758809 (= res!513481 (= (seekEntryOrOpen!0 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338022))))

(assert (=> b!758809 (= lt!338022 (Found!7726 j!159))))

(declare-fun b!758810 () Bool)

(declare-fun res!513482 () Bool)

(assert (=> b!758810 (=> (not res!513482) (not e!423021))))

(assert (=> b!758810 (= res!513482 (validKeyInArray!0 k0!2102))))

(declare-fun res!513489 () Bool)

(assert (=> start!65840 (=> (not res!513489) (not e!423021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65840 (= res!513489 (validMask!0 mask!3328))))

(assert (=> start!65840 e!423021))

(assert (=> start!65840 true))

(declare-fun array_inv!16012 (array!42030) Bool)

(assert (=> start!65840 (array_inv!16012 a!3186)))

(declare-fun b!758803 () Bool)

(declare-fun res!513488 () Bool)

(assert (=> b!758803 (=> (not res!513488) (not e!423021))))

(assert (=> b!758803 (= res!513488 (and (= (size!20550 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20550 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20550 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65840 res!513489) b!758803))

(assert (= (and b!758803 res!513488) b!758807))

(assert (= (and b!758807 res!513494) b!758810))

(assert (= (and b!758810 res!513482) b!758796))

(assert (= (and b!758796 res!513487) b!758800))

(assert (= (and b!758800 res!513484) b!758797))

(assert (= (and b!758797 res!513491) b!758802))

(assert (= (and b!758802 res!513490) b!758801))

(assert (= (and b!758801 res!513485) b!758806))

(assert (= (and b!758806 res!513486) b!758794))

(assert (= (and b!758794 res!513483) b!758798))

(assert (= (and b!758798 c!83037) b!758808))

(assert (= (and b!758798 (not c!83037)) b!758799))

(assert (= (and b!758798 res!513492) b!758805))

(assert (= (and b!758805 res!513493) b!758795))

(assert (= (and b!758795 res!513495) b!758809))

(assert (= (and b!758809 res!513481) b!758804))

(declare-fun m!705683 () Bool)

(assert (=> b!758809 m!705683))

(assert (=> b!758809 m!705683))

(declare-fun m!705685 () Bool)

(assert (=> b!758809 m!705685))

(declare-fun m!705687 () Bool)

(assert (=> b!758795 m!705687))

(declare-fun m!705689 () Bool)

(assert (=> b!758795 m!705689))

(declare-fun m!705691 () Bool)

(assert (=> b!758810 m!705691))

(assert (=> b!758807 m!705683))

(assert (=> b!758807 m!705683))

(declare-fun m!705693 () Bool)

(assert (=> b!758807 m!705693))

(assert (=> b!758808 m!705683))

(assert (=> b!758808 m!705683))

(declare-fun m!705695 () Bool)

(assert (=> b!758808 m!705695))

(declare-fun m!705697 () Bool)

(assert (=> b!758794 m!705697))

(declare-fun m!705699 () Bool)

(assert (=> b!758805 m!705699))

(declare-fun m!705701 () Bool)

(assert (=> b!758805 m!705701))

(declare-fun m!705703 () Bool)

(assert (=> b!758805 m!705703))

(declare-fun m!705705 () Bool)

(assert (=> b!758805 m!705705))

(assert (=> b!758805 m!705699))

(declare-fun m!705707 () Bool)

(assert (=> b!758805 m!705707))

(assert (=> b!758804 m!705683))

(assert (=> b!758804 m!705683))

(declare-fun m!705709 () Bool)

(assert (=> b!758804 m!705709))

(declare-fun m!705711 () Bool)

(assert (=> b!758802 m!705711))

(assert (=> b!758799 m!705683))

(assert (=> b!758799 m!705683))

(declare-fun m!705713 () Bool)

(assert (=> b!758799 m!705713))

(declare-fun m!705715 () Bool)

(assert (=> b!758800 m!705715))

(assert (=> b!758806 m!705683))

(assert (=> b!758806 m!705683))

(declare-fun m!705717 () Bool)

(assert (=> b!758806 m!705717))

(assert (=> b!758806 m!705717))

(assert (=> b!758806 m!705683))

(declare-fun m!705719 () Bool)

(assert (=> b!758806 m!705719))

(declare-fun m!705721 () Bool)

(assert (=> start!65840 m!705721))

(declare-fun m!705723 () Bool)

(assert (=> start!65840 m!705723))

(declare-fun m!705725 () Bool)

(assert (=> b!758796 m!705725))

(declare-fun m!705727 () Bool)

(assert (=> b!758797 m!705727))

(check-sat (not b!758807) (not b!758799) (not b!758809) (not b!758795) (not b!758800) (not b!758810) (not b!758808) (not b!758804) (not b!758796) (not start!65840) (not b!758802) (not b!758805) (not b!758797) (not b!758806))
(check-sat)
