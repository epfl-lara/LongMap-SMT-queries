; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66546 () Bool)

(assert start!66546)

(declare-fun b!766802 () Bool)

(declare-fun res!518746 () Bool)

(declare-fun e!427000 () Bool)

(assert (=> b!766802 (=> (not res!518746) (not e!427000))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766802 (= res!518746 (validKeyInArray!0 k0!2102))))

(declare-fun b!766803 () Bool)

(declare-fun res!518755 () Bool)

(assert (=> b!766803 (=> (not res!518755) (not e!427000))))

(declare-datatypes ((array!42273 0))(
  ( (array!42274 (arr!20240 (Array (_ BitVec 32) (_ BitVec 64))) (size!20661 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42273)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!766803 (= res!518755 (and (= (size!20661 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20661 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20661 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766804 () Bool)

(declare-fun res!518744 () Bool)

(declare-fun e!426998 () Bool)

(assert (=> b!766804 (=> (not res!518744) (not e!426998))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!766804 (= res!518744 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20661 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20661 a!3186))))))

(declare-fun res!518751 () Bool)

(assert (=> start!66546 (=> (not res!518751) (not e!427000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66546 (= res!518751 (validMask!0 mask!3328))))

(assert (=> start!66546 e!427000))

(assert (=> start!66546 true))

(declare-fun array_inv!16123 (array!42273) Bool)

(assert (=> start!66546 (array_inv!16123 a!3186)))

(declare-fun e!427004 () Bool)

(declare-fun b!766805 () Bool)

(declare-datatypes ((SeekEntryResult!7837 0))(
  ( (MissingZero!7837 (index!33716 (_ BitVec 32))) (Found!7837 (index!33717 (_ BitVec 32))) (Intermediate!7837 (undefined!8649 Bool) (index!33718 (_ BitVec 32)) (x!64642 (_ BitVec 32))) (Undefined!7837) (MissingVacant!7837 (index!33719 (_ BitVec 32))) )
))
(declare-fun lt!340965 () SeekEntryResult!7837)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42273 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!766805 (= e!427004 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340965))))

(declare-fun b!766806 () Bool)

(declare-fun res!518750 () Bool)

(assert (=> b!766806 (=> (not res!518750) (not e!427000))))

(assert (=> b!766806 (= res!518750 (validKeyInArray!0 (select (arr!20240 a!3186) j!159)))))

(declare-fun b!766807 () Bool)

(declare-fun e!426996 () Bool)

(declare-fun e!426997 () Bool)

(assert (=> b!766807 (= e!426996 e!426997)))

(declare-fun res!518753 () Bool)

(assert (=> b!766807 (=> (not res!518753) (not e!426997))))

(declare-fun lt!340959 () SeekEntryResult!7837)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42273 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!766807 (= res!518753 (= (seekEntryOrOpen!0 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340959))))

(assert (=> b!766807 (= lt!340959 (Found!7837 j!159))))

(declare-fun b!766808 () Bool)

(declare-fun res!518745 () Bool)

(assert (=> b!766808 (=> (not res!518745) (not e!426998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42273 (_ BitVec 32)) Bool)

(assert (=> b!766808 (= res!518745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766809 () Bool)

(declare-fun res!518758 () Bool)

(assert (=> b!766809 (=> (not res!518758) (not e!426998))))

(declare-datatypes ((List!14281 0))(
  ( (Nil!14278) (Cons!14277 (h!15370 (_ BitVec 64)) (t!20587 List!14281)) )
))
(declare-fun arrayNoDuplicates!0 (array!42273 (_ BitVec 32) List!14281) Bool)

(assert (=> b!766809 (= res!518758 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14278))))

(declare-fun b!766810 () Bool)

(declare-fun res!518754 () Bool)

(declare-fun e!426999 () Bool)

(assert (=> b!766810 (=> (not res!518754) (not e!426999))))

(assert (=> b!766810 (= res!518754 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20240 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766811 () Bool)

(assert (=> b!766811 (= e!426998 e!426999)))

(declare-fun res!518748 () Bool)

(assert (=> b!766811 (=> (not res!518748) (not e!426999))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766811 (= res!518748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340965))))

(assert (=> b!766811 (= lt!340965 (Intermediate!7837 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766812 () Bool)

(declare-fun res!518749 () Bool)

(assert (=> b!766812 (=> (not res!518749) (not e!427000))))

(declare-fun arrayContainsKey!0 (array!42273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766812 (= res!518749 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42273 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!766813 (= e!427004 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) (Found!7837 j!159)))))

(declare-fun b!766814 () Bool)

(declare-fun e!427003 () Bool)

(declare-fun e!427001 () Bool)

(assert (=> b!766814 (= e!427003 (not e!427001))))

(declare-fun res!518752 () Bool)

(assert (=> b!766814 (=> res!518752 e!427001)))

(declare-fun lt!340967 () SeekEntryResult!7837)

(get-info :version)

(assert (=> b!766814 (= res!518752 (or (not ((_ is Intermediate!7837) lt!340967)) (bvsge x!1131 (x!64642 lt!340967))))))

(assert (=> b!766814 e!426996))

(declare-fun res!518756 () Bool)

(assert (=> b!766814 (=> (not res!518756) (not e!426996))))

(assert (=> b!766814 (= res!518756 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26372 0))(
  ( (Unit!26373) )
))
(declare-fun lt!340966 () Unit!26372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26372)

(assert (=> b!766814 (= lt!340966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766815 () Bool)

(assert (=> b!766815 (= e!427000 e!426998)))

(declare-fun res!518759 () Bool)

(assert (=> b!766815 (=> (not res!518759) (not e!426998))))

(declare-fun lt!340962 () SeekEntryResult!7837)

(assert (=> b!766815 (= res!518759 (or (= lt!340962 (MissingZero!7837 i!1173)) (= lt!340962 (MissingVacant!7837 i!1173))))))

(assert (=> b!766815 (= lt!340962 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766816 () Bool)

(declare-fun res!518747 () Bool)

(assert (=> b!766816 (=> (not res!518747) (not e!426999))))

(assert (=> b!766816 (= res!518747 e!427004)))

(declare-fun c!84420 () Bool)

(assert (=> b!766816 (= c!84420 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766817 () Bool)

(assert (=> b!766817 (= e!427001 true)))

(declare-fun lt!340960 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766817 (= lt!340960 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766818 () Bool)

(assert (=> b!766818 (= e!426997 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340959))))

(declare-fun b!766819 () Bool)

(assert (=> b!766819 (= e!426999 e!427003)))

(declare-fun res!518757 () Bool)

(assert (=> b!766819 (=> (not res!518757) (not e!427003))))

(declare-fun lt!340963 () SeekEntryResult!7837)

(assert (=> b!766819 (= res!518757 (= lt!340963 lt!340967))))

(declare-fun lt!340961 () array!42273)

(declare-fun lt!340964 () (_ BitVec 64))

(assert (=> b!766819 (= lt!340967 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340964 lt!340961 mask!3328))))

(assert (=> b!766819 (= lt!340963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340964 mask!3328) lt!340964 lt!340961 mask!3328))))

(assert (=> b!766819 (= lt!340964 (select (store (arr!20240 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766819 (= lt!340961 (array!42274 (store (arr!20240 a!3186) i!1173 k0!2102) (size!20661 a!3186)))))

(assert (= (and start!66546 res!518751) b!766803))

(assert (= (and b!766803 res!518755) b!766806))

(assert (= (and b!766806 res!518750) b!766802))

(assert (= (and b!766802 res!518746) b!766812))

(assert (= (and b!766812 res!518749) b!766815))

(assert (= (and b!766815 res!518759) b!766808))

(assert (= (and b!766808 res!518745) b!766809))

(assert (= (and b!766809 res!518758) b!766804))

(assert (= (and b!766804 res!518744) b!766811))

(assert (= (and b!766811 res!518748) b!766810))

(assert (= (and b!766810 res!518754) b!766816))

(assert (= (and b!766816 c!84420) b!766805))

(assert (= (and b!766816 (not c!84420)) b!766813))

(assert (= (and b!766816 res!518747) b!766819))

(assert (= (and b!766819 res!518757) b!766814))

(assert (= (and b!766814 res!518756) b!766807))

(assert (= (and b!766807 res!518753) b!766818))

(assert (= (and b!766814 (not res!518752)) b!766817))

(declare-fun m!712123 () Bool)

(assert (=> start!66546 m!712123))

(declare-fun m!712125 () Bool)

(assert (=> start!66546 m!712125))

(declare-fun m!712127 () Bool)

(assert (=> b!766808 m!712127))

(declare-fun m!712129 () Bool)

(assert (=> b!766802 m!712129))

(declare-fun m!712131 () Bool)

(assert (=> b!766818 m!712131))

(assert (=> b!766818 m!712131))

(declare-fun m!712133 () Bool)

(assert (=> b!766818 m!712133))

(declare-fun m!712135 () Bool)

(assert (=> b!766815 m!712135))

(assert (=> b!766813 m!712131))

(assert (=> b!766813 m!712131))

(declare-fun m!712137 () Bool)

(assert (=> b!766813 m!712137))

(declare-fun m!712139 () Bool)

(assert (=> b!766812 m!712139))

(assert (=> b!766807 m!712131))

(assert (=> b!766807 m!712131))

(declare-fun m!712141 () Bool)

(assert (=> b!766807 m!712141))

(declare-fun m!712143 () Bool)

(assert (=> b!766814 m!712143))

(declare-fun m!712145 () Bool)

(assert (=> b!766814 m!712145))

(declare-fun m!712147 () Bool)

(assert (=> b!766809 m!712147))

(assert (=> b!766806 m!712131))

(assert (=> b!766806 m!712131))

(declare-fun m!712149 () Bool)

(assert (=> b!766806 m!712149))

(assert (=> b!766811 m!712131))

(assert (=> b!766811 m!712131))

(declare-fun m!712151 () Bool)

(assert (=> b!766811 m!712151))

(assert (=> b!766811 m!712151))

(assert (=> b!766811 m!712131))

(declare-fun m!712153 () Bool)

(assert (=> b!766811 m!712153))

(declare-fun m!712155 () Bool)

(assert (=> b!766810 m!712155))

(declare-fun m!712157 () Bool)

(assert (=> b!766817 m!712157))

(assert (=> b!766805 m!712131))

(assert (=> b!766805 m!712131))

(declare-fun m!712159 () Bool)

(assert (=> b!766805 m!712159))

(declare-fun m!712161 () Bool)

(assert (=> b!766819 m!712161))

(declare-fun m!712163 () Bool)

(assert (=> b!766819 m!712163))

(declare-fun m!712165 () Bool)

(assert (=> b!766819 m!712165))

(assert (=> b!766819 m!712161))

(declare-fun m!712167 () Bool)

(assert (=> b!766819 m!712167))

(declare-fun m!712169 () Bool)

(assert (=> b!766819 m!712169))

(check-sat (not b!766813) (not b!766815) (not b!766818) (not b!766819) (not b!766808) (not b!766807) (not b!766811) (not b!766802) (not b!766805) (not start!66546) (not b!766806) (not b!766817) (not b!766809) (not b!766812) (not b!766814))
(check-sat)
