; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65210 () Bool)

(assert start!65210)

(declare-fun b!738810 () Bool)

(declare-fun e!413136 () Bool)

(declare-fun e!413130 () Bool)

(assert (=> b!738810 (= e!413136 e!413130)))

(declare-fun res!496798 () Bool)

(assert (=> b!738810 (=> (not res!496798) (not e!413130))))

(declare-datatypes ((array!41400 0))(
  ( (array!41401 (arr!19814 (Array (_ BitVec 32) (_ BitVec 64))) (size!20235 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41400)

(declare-datatypes ((SeekEntryResult!7411 0))(
  ( (MissingZero!7411 (index!32012 (_ BitVec 32))) (Found!7411 (index!32013 (_ BitVec 32))) (Intermediate!7411 (undefined!8223 Bool) (index!32014 (_ BitVec 32)) (x!63012 (_ BitVec 32))) (Undefined!7411) (MissingVacant!7411 (index!32015 (_ BitVec 32))) )
))
(declare-fun lt!327886 () SeekEntryResult!7411)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41400 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!738810 (= res!496798 (= (seekEntryOrOpen!0 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327886))))

(assert (=> b!738810 (= lt!327886 (Found!7411 j!159))))

(declare-fun b!738811 () Bool)

(declare-fun res!496788 () Bool)

(declare-fun e!413133 () Bool)

(assert (=> b!738811 (=> (not res!496788) (not e!413133))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738811 (= res!496788 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19814 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!496799 () Bool)

(declare-fun e!413134 () Bool)

(assert (=> start!65210 (=> (not res!496799) (not e!413134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65210 (= res!496799 (validMask!0 mask!3328))))

(assert (=> start!65210 e!413134))

(assert (=> start!65210 true))

(declare-fun array_inv!15697 (array!41400) Bool)

(assert (=> start!65210 (array_inv!15697 a!3186)))

(declare-fun b!738812 () Bool)

(declare-fun e!413132 () Bool)

(declare-fun e!413131 () Bool)

(assert (=> b!738812 (= e!413132 e!413131)))

(declare-fun res!496796 () Bool)

(assert (=> b!738812 (=> res!496796 e!413131)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327899 () (_ BitVec 32))

(assert (=> b!738812 (= res!496796 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327899 #b00000000000000000000000000000000) (bvsge lt!327899 (size!20235 a!3186))))))

(declare-datatypes ((Unit!25220 0))(
  ( (Unit!25221) )
))
(declare-fun lt!327898 () Unit!25220)

(declare-fun e!413129 () Unit!25220)

(assert (=> b!738812 (= lt!327898 e!413129)))

(declare-fun c!81394 () Bool)

(declare-fun lt!327897 () Bool)

(assert (=> b!738812 (= c!81394 lt!327897)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738812 (= lt!327897 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738812 (= lt!327899 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738813 () Bool)

(declare-fun e!413138 () Bool)

(declare-fun lt!327891 () SeekEntryResult!7411)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41400 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!738813 (= e!413138 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327891))))

(declare-fun b!738814 () Bool)

(declare-fun res!496785 () Bool)

(declare-fun e!413139 () Bool)

(assert (=> b!738814 (=> (not res!496785) (not e!413139))))

(declare-datatypes ((List!13855 0))(
  ( (Nil!13852) (Cons!13851 (h!14923 (_ BitVec 64)) (t!20161 List!13855)) )
))
(declare-fun arrayNoDuplicates!0 (array!41400 (_ BitVec 32) List!13855) Bool)

(assert (=> b!738814 (= res!496785 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13852))))

(declare-fun b!738815 () Bool)

(declare-fun Unit!25222 () Unit!25220)

(assert (=> b!738815 (= e!413129 Unit!25222)))

(declare-fun lt!327888 () SeekEntryResult!7411)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41400 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!738815 (= lt!327888 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327893 () SeekEntryResult!7411)

(assert (=> b!738815 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327899 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327893)))

(declare-fun b!738816 () Bool)

(declare-fun res!496800 () Bool)

(assert (=> b!738816 (=> (not res!496800) (not e!413134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738816 (= res!496800 (validKeyInArray!0 (select (arr!19814 a!3186) j!159)))))

(declare-fun b!738817 () Bool)

(declare-fun e!413135 () Bool)

(assert (=> b!738817 (= e!413135 (not e!413132))))

(declare-fun res!496783 () Bool)

(assert (=> b!738817 (=> res!496783 e!413132)))

(declare-fun lt!327894 () SeekEntryResult!7411)

(get-info :version)

(assert (=> b!738817 (= res!496783 (or (not ((_ is Intermediate!7411) lt!327894)) (bvsge x!1131 (x!63012 lt!327894))))))

(assert (=> b!738817 (= lt!327893 (Found!7411 j!159))))

(assert (=> b!738817 e!413136))

(declare-fun res!496793 () Bool)

(assert (=> b!738817 (=> (not res!496793) (not e!413136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41400 (_ BitVec 32)) Bool)

(assert (=> b!738817 (= res!496793 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327896 () Unit!25220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25220)

(assert (=> b!738817 (= lt!327896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738818 () Bool)

(declare-fun res!496786 () Bool)

(assert (=> b!738818 (=> (not res!496786) (not e!413139))))

(assert (=> b!738818 (= res!496786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!413140 () Bool)

(declare-fun b!738819 () Bool)

(assert (=> b!738819 (= e!413140 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327899 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327891)))))

(declare-fun b!738820 () Bool)

(declare-fun res!496794 () Bool)

(assert (=> b!738820 (=> res!496794 e!413131)))

(assert (=> b!738820 (= res!496794 e!413140)))

(declare-fun c!81396 () Bool)

(assert (=> b!738820 (= c!81396 lt!327897)))

(declare-fun b!738821 () Bool)

(declare-fun res!496795 () Bool)

(assert (=> b!738821 (=> (not res!496795) (not e!413134))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!738821 (= res!496795 (validKeyInArray!0 k0!2102))))

(declare-fun b!738822 () Bool)

(assert (=> b!738822 (= e!413130 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327886))))

(declare-fun b!738823 () Bool)

(assert (=> b!738823 (= e!413138 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) (Found!7411 j!159)))))

(declare-fun b!738824 () Bool)

(declare-fun res!496791 () Bool)

(assert (=> b!738824 (=> (not res!496791) (not e!413133))))

(assert (=> b!738824 (= res!496791 e!413138)))

(declare-fun c!81395 () Bool)

(assert (=> b!738824 (= c!81395 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738825 () Bool)

(assert (=> b!738825 (= e!413139 e!413133)))

(declare-fun res!496789 () Bool)

(assert (=> b!738825 (=> (not res!496789) (not e!413133))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738825 (= res!496789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19814 a!3186) j!159) mask!3328) (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327891))))

(assert (=> b!738825 (= lt!327891 (Intermediate!7411 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738826 () Bool)

(declare-fun res!496792 () Bool)

(assert (=> b!738826 (=> (not res!496792) (not e!413134))))

(declare-fun arrayContainsKey!0 (array!41400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738826 (= res!496792 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738827 () Bool)

(assert (=> b!738827 (= e!413140 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327899 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327893)))))

(declare-fun b!738828 () Bool)

(assert (=> b!738828 (= e!413134 e!413139)))

(declare-fun res!496787 () Bool)

(assert (=> b!738828 (=> (not res!496787) (not e!413139))))

(declare-fun lt!327890 () SeekEntryResult!7411)

(assert (=> b!738828 (= res!496787 (or (= lt!327890 (MissingZero!7411 i!1173)) (= lt!327890 (MissingVacant!7411 i!1173))))))

(assert (=> b!738828 (= lt!327890 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738829 () Bool)

(assert (=> b!738829 (= e!413131 true)))

(declare-fun lt!327895 () SeekEntryResult!7411)

(declare-fun lt!327887 () (_ BitVec 64))

(declare-fun lt!327889 () array!41400)

(assert (=> b!738829 (= lt!327895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327899 lt!327887 lt!327889 mask!3328))))

(declare-fun b!738830 () Bool)

(declare-fun Unit!25223 () Unit!25220)

(assert (=> b!738830 (= e!413129 Unit!25223)))

(assert (=> b!738830 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327899 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!327891)))

(declare-fun b!738831 () Bool)

(assert (=> b!738831 (= e!413133 e!413135)))

(declare-fun res!496797 () Bool)

(assert (=> b!738831 (=> (not res!496797) (not e!413135))))

(declare-fun lt!327892 () SeekEntryResult!7411)

(assert (=> b!738831 (= res!496797 (= lt!327892 lt!327894))))

(assert (=> b!738831 (= lt!327894 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327887 lt!327889 mask!3328))))

(assert (=> b!738831 (= lt!327892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327887 mask!3328) lt!327887 lt!327889 mask!3328))))

(assert (=> b!738831 (= lt!327887 (select (store (arr!19814 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738831 (= lt!327889 (array!41401 (store (arr!19814 a!3186) i!1173 k0!2102) (size!20235 a!3186)))))

(declare-fun b!738832 () Bool)

(declare-fun res!496790 () Bool)

(assert (=> b!738832 (=> (not res!496790) (not e!413134))))

(assert (=> b!738832 (= res!496790 (and (= (size!20235 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20235 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20235 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738833 () Bool)

(declare-fun res!496784 () Bool)

(assert (=> b!738833 (=> (not res!496784) (not e!413139))))

(assert (=> b!738833 (= res!496784 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20235 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20235 a!3186))))))

(assert (= (and start!65210 res!496799) b!738832))

(assert (= (and b!738832 res!496790) b!738816))

(assert (= (and b!738816 res!496800) b!738821))

(assert (= (and b!738821 res!496795) b!738826))

(assert (= (and b!738826 res!496792) b!738828))

(assert (= (and b!738828 res!496787) b!738818))

(assert (= (and b!738818 res!496786) b!738814))

(assert (= (and b!738814 res!496785) b!738833))

(assert (= (and b!738833 res!496784) b!738825))

(assert (= (and b!738825 res!496789) b!738811))

(assert (= (and b!738811 res!496788) b!738824))

(assert (= (and b!738824 c!81395) b!738813))

(assert (= (and b!738824 (not c!81395)) b!738823))

(assert (= (and b!738824 res!496791) b!738831))

(assert (= (and b!738831 res!496797) b!738817))

(assert (= (and b!738817 res!496793) b!738810))

(assert (= (and b!738810 res!496798) b!738822))

(assert (= (and b!738817 (not res!496783)) b!738812))

(assert (= (and b!738812 c!81394) b!738830))

(assert (= (and b!738812 (not c!81394)) b!738815))

(assert (= (and b!738812 (not res!496796)) b!738820))

(assert (= (and b!738820 c!81396) b!738819))

(assert (= (and b!738820 (not c!81396)) b!738827))

(assert (= (and b!738820 (not res!496794)) b!738829))

(declare-fun m!689777 () Bool)

(assert (=> b!738817 m!689777))

(declare-fun m!689779 () Bool)

(assert (=> b!738817 m!689779))

(declare-fun m!689781 () Bool)

(assert (=> b!738815 m!689781))

(assert (=> b!738815 m!689781))

(declare-fun m!689783 () Bool)

(assert (=> b!738815 m!689783))

(assert (=> b!738815 m!689781))

(declare-fun m!689785 () Bool)

(assert (=> b!738815 m!689785))

(assert (=> b!738816 m!689781))

(assert (=> b!738816 m!689781))

(declare-fun m!689787 () Bool)

(assert (=> b!738816 m!689787))

(declare-fun m!689789 () Bool)

(assert (=> b!738812 m!689789))

(assert (=> b!738810 m!689781))

(assert (=> b!738810 m!689781))

(declare-fun m!689791 () Bool)

(assert (=> b!738810 m!689791))

(declare-fun m!689793 () Bool)

(assert (=> b!738828 m!689793))

(declare-fun m!689795 () Bool)

(assert (=> start!65210 m!689795))

(declare-fun m!689797 () Bool)

(assert (=> start!65210 m!689797))

(assert (=> b!738813 m!689781))

(assert (=> b!738813 m!689781))

(declare-fun m!689799 () Bool)

(assert (=> b!738813 m!689799))

(assert (=> b!738827 m!689781))

(assert (=> b!738827 m!689781))

(assert (=> b!738827 m!689785))

(assert (=> b!738822 m!689781))

(assert (=> b!738822 m!689781))

(declare-fun m!689801 () Bool)

(assert (=> b!738822 m!689801))

(declare-fun m!689803 () Bool)

(assert (=> b!738811 m!689803))

(declare-fun m!689805 () Bool)

(assert (=> b!738821 m!689805))

(declare-fun m!689807 () Bool)

(assert (=> b!738831 m!689807))

(declare-fun m!689809 () Bool)

(assert (=> b!738831 m!689809))

(declare-fun m!689811 () Bool)

(assert (=> b!738831 m!689811))

(declare-fun m!689813 () Bool)

(assert (=> b!738831 m!689813))

(declare-fun m!689815 () Bool)

(assert (=> b!738831 m!689815))

(assert (=> b!738831 m!689807))

(assert (=> b!738830 m!689781))

(assert (=> b!738830 m!689781))

(declare-fun m!689817 () Bool)

(assert (=> b!738830 m!689817))

(declare-fun m!689819 () Bool)

(assert (=> b!738818 m!689819))

(declare-fun m!689821 () Bool)

(assert (=> b!738814 m!689821))

(assert (=> b!738819 m!689781))

(assert (=> b!738819 m!689781))

(assert (=> b!738819 m!689817))

(declare-fun m!689823 () Bool)

(assert (=> b!738829 m!689823))

(assert (=> b!738825 m!689781))

(assert (=> b!738825 m!689781))

(declare-fun m!689825 () Bool)

(assert (=> b!738825 m!689825))

(assert (=> b!738825 m!689825))

(assert (=> b!738825 m!689781))

(declare-fun m!689827 () Bool)

(assert (=> b!738825 m!689827))

(assert (=> b!738823 m!689781))

(assert (=> b!738823 m!689781))

(assert (=> b!738823 m!689783))

(declare-fun m!689829 () Bool)

(assert (=> b!738826 m!689829))

(check-sat (not b!738829) (not b!738817) (not b!738815) (not b!738830) (not b!738814) (not b!738823) (not b!738819) (not b!738827) (not b!738831) (not b!738812) (not b!738825) (not start!65210) (not b!738828) (not b!738818) (not b!738810) (not b!738816) (not b!738821) (not b!738826) (not b!738813) (not b!738822))
(check-sat)
