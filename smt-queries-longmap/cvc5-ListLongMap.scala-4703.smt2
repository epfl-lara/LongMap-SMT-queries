; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65278 () Bool)

(assert start!65278)

(declare-fun b!740819 () Bool)

(declare-fun res!498226 () Bool)

(declare-fun e!414151 () Bool)

(assert (=> b!740819 (=> (not res!498226) (not e!414151))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41451 0))(
  ( (array!41452 (arr!19839 (Array (_ BitVec 32) (_ BitVec 64))) (size!20260 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41451)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740819 (= res!498226 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20260 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20260 a!3186))))))

(declare-fun b!740820 () Bool)

(declare-fun e!414161 () Bool)

(declare-fun e!414152 () Bool)

(assert (=> b!740820 (= e!414161 (not e!414152))))

(declare-fun res!498223 () Bool)

(assert (=> b!740820 (=> res!498223 e!414152)))

(declare-datatypes ((SeekEntryResult!7439 0))(
  ( (MissingZero!7439 (index!32124 (_ BitVec 32))) (Found!7439 (index!32125 (_ BitVec 32))) (Intermediate!7439 (undefined!8251 Bool) (index!32126 (_ BitVec 32)) (x!63109 (_ BitVec 32))) (Undefined!7439) (MissingVacant!7439 (index!32127 (_ BitVec 32))) )
))
(declare-fun lt!329144 () SeekEntryResult!7439)

(assert (=> b!740820 (= res!498223 (or (not (is-Intermediate!7439 lt!329144)) (bvsge x!1131 (x!63109 lt!329144))))))

(declare-fun lt!329134 () SeekEntryResult!7439)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!740820 (= lt!329134 (Found!7439 j!159))))

(declare-fun e!414155 () Bool)

(assert (=> b!740820 e!414155))

(declare-fun res!498234 () Bool)

(assert (=> b!740820 (=> (not res!498234) (not e!414155))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41451 (_ BitVec 32)) Bool)

(assert (=> b!740820 (= res!498234 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25352 0))(
  ( (Unit!25353) )
))
(declare-fun lt!329146 () Unit!25352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25352)

(assert (=> b!740820 (= lt!329146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740821 () Bool)

(declare-fun res!498239 () Bool)

(assert (=> b!740821 (=> (not res!498239) (not e!414151))))

(assert (=> b!740821 (= res!498239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740822 () Bool)

(declare-fun res!498220 () Bool)

(declare-fun e!414160 () Bool)

(assert (=> b!740822 (=> res!498220 e!414160)))

(declare-fun e!414154 () Bool)

(assert (=> b!740822 (= res!498220 e!414154)))

(declare-fun c!81681 () Bool)

(declare-fun lt!329145 () Bool)

(assert (=> b!740822 (= c!81681 lt!329145)))

(declare-fun b!740823 () Bool)

(declare-fun res!498231 () Bool)

(assert (=> b!740823 (=> (not res!498231) (not e!414151))))

(declare-datatypes ((List!13841 0))(
  ( (Nil!13838) (Cons!13837 (h!14909 (_ BitVec 64)) (t!20156 List!13841)) )
))
(declare-fun arrayNoDuplicates!0 (array!41451 (_ BitVec 32) List!13841) Bool)

(assert (=> b!740823 (= res!498231 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13838))))

(declare-fun b!740824 () Bool)

(declare-fun e!414159 () Bool)

(assert (=> b!740824 (= e!414151 e!414159)))

(declare-fun res!498224 () Bool)

(assert (=> b!740824 (=> (not res!498224) (not e!414159))))

(declare-fun lt!329139 () SeekEntryResult!7439)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41451 (_ BitVec 32)) SeekEntryResult!7439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740824 (= res!498224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19839 a!3186) j!159) mask!3328) (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329139))))

(assert (=> b!740824 (= lt!329139 (Intermediate!7439 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740825 () Bool)

(declare-fun e!414158 () Unit!25352)

(declare-fun Unit!25354 () Unit!25352)

(assert (=> b!740825 (= e!414158 Unit!25354)))

(declare-fun lt!329147 () (_ BitVec 32))

(assert (=> b!740825 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329147 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329139)))

(declare-fun b!740826 () Bool)

(declare-fun res!498230 () Bool)

(assert (=> b!740826 (=> (not res!498230) (not e!414159))))

(declare-fun e!414150 () Bool)

(assert (=> b!740826 (= res!498230 e!414150)))

(declare-fun c!81682 () Bool)

(assert (=> b!740826 (= c!81682 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740828 () Bool)

(declare-fun res!498222 () Bool)

(assert (=> b!740828 (=> (not res!498222) (not e!414159))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740828 (= res!498222 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19839 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740829 () Bool)

(assert (=> b!740829 (= e!414154 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329147 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329139)))))

(declare-fun b!740830 () Bool)

(declare-fun res!498221 () Bool)

(declare-fun e!414157 () Bool)

(assert (=> b!740830 (=> (not res!498221) (not e!414157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740830 (= res!498221 (validKeyInArray!0 (select (arr!19839 a!3186) j!159)))))

(declare-fun b!740831 () Bool)

(assert (=> b!740831 (= e!414150 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329139))))

(declare-fun b!740832 () Bool)

(declare-fun e!414149 () Bool)

(assert (=> b!740832 (= e!414155 e!414149)))

(declare-fun res!498232 () Bool)

(assert (=> b!740832 (=> (not res!498232) (not e!414149))))

(declare-fun lt!329140 () SeekEntryResult!7439)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41451 (_ BitVec 32)) SeekEntryResult!7439)

(assert (=> b!740832 (= res!498232 (= (seekEntryOrOpen!0 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329140))))

(assert (=> b!740832 (= lt!329140 (Found!7439 j!159))))

(declare-fun b!740833 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41451 (_ BitVec 32)) SeekEntryResult!7439)

(assert (=> b!740833 (= e!414149 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329140))))

(declare-fun b!740834 () Bool)

(declare-fun res!498238 () Bool)

(assert (=> b!740834 (=> res!498238 e!414160)))

(declare-fun lt!329141 () array!41451)

(declare-fun lt!329142 () (_ BitVec 64))

(declare-fun lt!329138 () SeekEntryResult!7439)

(assert (=> b!740834 (= res!498238 (not (= lt!329138 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329147 lt!329142 lt!329141 mask!3328))))))

(declare-fun b!740835 () Bool)

(declare-fun res!498233 () Bool)

(assert (=> b!740835 (=> (not res!498233) (not e!414157))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!740835 (= res!498233 (validKeyInArray!0 k!2102))))

(declare-fun b!740836 () Bool)

(declare-fun e!414156 () Bool)

(assert (=> b!740836 (= e!414156 (validKeyInArray!0 lt!329142))))

(declare-fun b!740837 () Bool)

(declare-fun Unit!25355 () Unit!25352)

(assert (=> b!740837 (= e!414158 Unit!25355)))

(declare-fun lt!329137 () SeekEntryResult!7439)

(assert (=> b!740837 (= lt!329137 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19839 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740837 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329147 resIntermediateIndex!5 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329134)))

(declare-fun b!740838 () Bool)

(assert (=> b!740838 (= e!414152 e!414160)))

(declare-fun res!498237 () Bool)

(assert (=> b!740838 (=> res!498237 e!414160)))

(assert (=> b!740838 (= res!498237 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329147 #b00000000000000000000000000000000) (bvsge lt!329147 (size!20260 a!3186))))))

(declare-fun lt!329135 () Unit!25352)

(assert (=> b!740838 (= lt!329135 e!414158)))

(declare-fun c!81680 () Bool)

(assert (=> b!740838 (= c!81680 lt!329145)))

(assert (=> b!740838 (= lt!329145 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740838 (= lt!329147 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740839 () Bool)

(assert (=> b!740839 (= e!414150 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) (Found!7439 j!159)))))

(declare-fun b!740840 () Bool)

(declare-fun res!498235 () Bool)

(assert (=> b!740840 (=> (not res!498235) (not e!414157))))

(declare-fun arrayContainsKey!0 (array!41451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740840 (= res!498235 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740841 () Bool)

(assert (=> b!740841 (= e!414160 e!414156)))

(declare-fun res!498227 () Bool)

(assert (=> b!740841 (=> res!498227 e!414156)))

(assert (=> b!740841 (= res!498227 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!740841 (= (seekEntryOrOpen!0 lt!329142 lt!329141 mask!3328) lt!329134)))

(declare-fun lt!329136 () Unit!25352)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25352)

(assert (=> b!740841 (= lt!329136 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!329147 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740842 () Bool)

(assert (=> b!740842 (= e!414159 e!414161)))

(declare-fun res!498229 () Bool)

(assert (=> b!740842 (=> (not res!498229) (not e!414161))))

(assert (=> b!740842 (= res!498229 (= lt!329138 lt!329144))))

(assert (=> b!740842 (= lt!329144 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329142 lt!329141 mask!3328))))

(assert (=> b!740842 (= lt!329138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329142 mask!3328) lt!329142 lt!329141 mask!3328))))

(assert (=> b!740842 (= lt!329142 (select (store (arr!19839 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740842 (= lt!329141 (array!41452 (store (arr!19839 a!3186) i!1173 k!2102) (size!20260 a!3186)))))

(declare-fun b!740827 () Bool)

(assert (=> b!740827 (= e!414154 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329147 resIntermediateIndex!5 (select (arr!19839 a!3186) j!159) a!3186 mask!3328) lt!329134)))))

(declare-fun res!498225 () Bool)

(assert (=> start!65278 (=> (not res!498225) (not e!414157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65278 (= res!498225 (validMask!0 mask!3328))))

(assert (=> start!65278 e!414157))

(assert (=> start!65278 true))

(declare-fun array_inv!15635 (array!41451) Bool)

(assert (=> start!65278 (array_inv!15635 a!3186)))

(declare-fun b!740843 () Bool)

(declare-fun res!498228 () Bool)

(assert (=> b!740843 (=> (not res!498228) (not e!414157))))

(assert (=> b!740843 (= res!498228 (and (= (size!20260 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20260 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20260 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740844 () Bool)

(assert (=> b!740844 (= e!414157 e!414151)))

(declare-fun res!498236 () Bool)

(assert (=> b!740844 (=> (not res!498236) (not e!414151))))

(declare-fun lt!329143 () SeekEntryResult!7439)

(assert (=> b!740844 (= res!498236 (or (= lt!329143 (MissingZero!7439 i!1173)) (= lt!329143 (MissingVacant!7439 i!1173))))))

(assert (=> b!740844 (= lt!329143 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65278 res!498225) b!740843))

(assert (= (and b!740843 res!498228) b!740830))

(assert (= (and b!740830 res!498221) b!740835))

(assert (= (and b!740835 res!498233) b!740840))

(assert (= (and b!740840 res!498235) b!740844))

(assert (= (and b!740844 res!498236) b!740821))

(assert (= (and b!740821 res!498239) b!740823))

(assert (= (and b!740823 res!498231) b!740819))

(assert (= (and b!740819 res!498226) b!740824))

(assert (= (and b!740824 res!498224) b!740828))

(assert (= (and b!740828 res!498222) b!740826))

(assert (= (and b!740826 c!81682) b!740831))

(assert (= (and b!740826 (not c!81682)) b!740839))

(assert (= (and b!740826 res!498230) b!740842))

(assert (= (and b!740842 res!498229) b!740820))

(assert (= (and b!740820 res!498234) b!740832))

(assert (= (and b!740832 res!498232) b!740833))

(assert (= (and b!740820 (not res!498223)) b!740838))

(assert (= (and b!740838 c!81680) b!740825))

(assert (= (and b!740838 (not c!81680)) b!740837))

(assert (= (and b!740838 (not res!498237)) b!740822))

(assert (= (and b!740822 c!81681) b!740829))

(assert (= (and b!740822 (not c!81681)) b!740827))

(assert (= (and b!740822 (not res!498220)) b!740834))

(assert (= (and b!740834 (not res!498238)) b!740841))

(assert (= (and b!740841 (not res!498227)) b!740836))

(declare-fun m!691867 () Bool)

(assert (=> b!740829 m!691867))

(assert (=> b!740829 m!691867))

(declare-fun m!691869 () Bool)

(assert (=> b!740829 m!691869))

(declare-fun m!691871 () Bool)

(assert (=> b!740821 m!691871))

(declare-fun m!691873 () Bool)

(assert (=> b!740844 m!691873))

(declare-fun m!691875 () Bool)

(assert (=> b!740835 m!691875))

(assert (=> b!740832 m!691867))

(assert (=> b!740832 m!691867))

(declare-fun m!691877 () Bool)

(assert (=> b!740832 m!691877))

(declare-fun m!691879 () Bool)

(assert (=> b!740834 m!691879))

(assert (=> b!740825 m!691867))

(assert (=> b!740825 m!691867))

(assert (=> b!740825 m!691869))

(assert (=> b!740831 m!691867))

(assert (=> b!740831 m!691867))

(declare-fun m!691881 () Bool)

(assert (=> b!740831 m!691881))

(assert (=> b!740830 m!691867))

(assert (=> b!740830 m!691867))

(declare-fun m!691883 () Bool)

(assert (=> b!740830 m!691883))

(declare-fun m!691885 () Bool)

(assert (=> b!740838 m!691885))

(declare-fun m!691887 () Bool)

(assert (=> start!65278 m!691887))

(declare-fun m!691889 () Bool)

(assert (=> start!65278 m!691889))

(assert (=> b!740827 m!691867))

(assert (=> b!740827 m!691867))

(declare-fun m!691891 () Bool)

(assert (=> b!740827 m!691891))

(declare-fun m!691893 () Bool)

(assert (=> b!740823 m!691893))

(declare-fun m!691895 () Bool)

(assert (=> b!740842 m!691895))

(declare-fun m!691897 () Bool)

(assert (=> b!740842 m!691897))

(declare-fun m!691899 () Bool)

(assert (=> b!740842 m!691899))

(declare-fun m!691901 () Bool)

(assert (=> b!740842 m!691901))

(assert (=> b!740842 m!691895))

(declare-fun m!691903 () Bool)

(assert (=> b!740842 m!691903))

(assert (=> b!740833 m!691867))

(assert (=> b!740833 m!691867))

(declare-fun m!691905 () Bool)

(assert (=> b!740833 m!691905))

(declare-fun m!691907 () Bool)

(assert (=> b!740820 m!691907))

(declare-fun m!691909 () Bool)

(assert (=> b!740820 m!691909))

(assert (=> b!740824 m!691867))

(assert (=> b!740824 m!691867))

(declare-fun m!691911 () Bool)

(assert (=> b!740824 m!691911))

(assert (=> b!740824 m!691911))

(assert (=> b!740824 m!691867))

(declare-fun m!691913 () Bool)

(assert (=> b!740824 m!691913))

(declare-fun m!691915 () Bool)

(assert (=> b!740836 m!691915))

(assert (=> b!740839 m!691867))

(assert (=> b!740839 m!691867))

(declare-fun m!691917 () Bool)

(assert (=> b!740839 m!691917))

(declare-fun m!691919 () Bool)

(assert (=> b!740841 m!691919))

(declare-fun m!691921 () Bool)

(assert (=> b!740841 m!691921))

(declare-fun m!691923 () Bool)

(assert (=> b!740840 m!691923))

(assert (=> b!740837 m!691867))

(assert (=> b!740837 m!691867))

(assert (=> b!740837 m!691917))

(assert (=> b!740837 m!691867))

(assert (=> b!740837 m!691891))

(declare-fun m!691925 () Bool)

(assert (=> b!740828 m!691925))

(push 1)

