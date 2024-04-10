; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65168 () Bool)

(assert start!65168)

(declare-fun b!736828 () Bool)

(declare-datatypes ((Unit!25132 0))(
  ( (Unit!25133) )
))
(declare-fun e!412168 () Unit!25132)

(declare-fun Unit!25134 () Unit!25132)

(assert (=> b!736828 (= e!412168 Unit!25134)))

(declare-datatypes ((array!41341 0))(
  ( (array!41342 (arr!19784 (Array (_ BitVec 32) (_ BitVec 64))) (size!20205 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41341)

(declare-datatypes ((SeekEntryResult!7384 0))(
  ( (MissingZero!7384 (index!31904 (_ BitVec 32))) (Found!7384 (index!31905 (_ BitVec 32))) (Intermediate!7384 (undefined!8196 Bool) (index!31906 (_ BitVec 32)) (x!62902 (_ BitVec 32))) (Undefined!7384) (MissingVacant!7384 (index!31907 (_ BitVec 32))) )
))
(declare-fun lt!326833 () SeekEntryResult!7384)

(declare-fun lt!326828 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41341 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!736828 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326828 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326833)))

(declare-fun b!736829 () Bool)

(declare-fun res!495230 () Bool)

(declare-fun e!412178 () Bool)

(assert (=> b!736829 (=> (not res!495230) (not e!412178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736829 (= res!495230 (validKeyInArray!0 (select (arr!19784 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!736830 () Bool)

(declare-fun lt!326835 () SeekEntryResult!7384)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!412174 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41341 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!736830 (= e!412174 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326835))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!412171 () Bool)

(declare-fun b!736831 () Bool)

(assert (=> b!736831 (= e!412171 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326833))))

(declare-fun res!495232 () Bool)

(assert (=> start!65168 (=> (not res!495232) (not e!412178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65168 (= res!495232 (validMask!0 mask!3328))))

(assert (=> start!65168 e!412178))

(assert (=> start!65168 true))

(declare-fun array_inv!15580 (array!41341) Bool)

(assert (=> start!65168 (array_inv!15580 a!3186)))

(declare-fun b!736832 () Bool)

(declare-fun res!495223 () Bool)

(declare-fun e!412175 () Bool)

(assert (=> b!736832 (=> (not res!495223) (not e!412175))))

(assert (=> b!736832 (= res!495223 e!412171)))

(declare-fun c!81186 () Bool)

(assert (=> b!736832 (= c!81186 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!412169 () Bool)

(declare-fun b!736833 () Bool)

(assert (=> b!736833 (= e!412169 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326828 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326833)))))

(declare-fun b!736834 () Bool)

(declare-fun res!495231 () Bool)

(assert (=> b!736834 (=> (not res!495231) (not e!412175))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736834 (= res!495231 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19784 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736835 () Bool)

(declare-fun e!412167 () Bool)

(assert (=> b!736835 (= e!412175 e!412167)))

(declare-fun res!495236 () Bool)

(assert (=> b!736835 (=> (not res!495236) (not e!412167))))

(declare-fun lt!326826 () SeekEntryResult!7384)

(declare-fun lt!326824 () SeekEntryResult!7384)

(assert (=> b!736835 (= res!495236 (= lt!326826 lt!326824))))

(declare-fun lt!326827 () array!41341)

(declare-fun lt!326832 () (_ BitVec 64))

(assert (=> b!736835 (= lt!326824 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326832 lt!326827 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736835 (= lt!326826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326832 mask!3328) lt!326832 lt!326827 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736835 (= lt!326832 (select (store (arr!19784 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736835 (= lt!326827 (array!41342 (store (arr!19784 a!3186) i!1173 k!2102) (size!20205 a!3186)))))

(declare-fun b!736836 () Bool)

(declare-fun Unit!25135 () Unit!25132)

(assert (=> b!736836 (= e!412168 Unit!25135)))

(declare-fun lt!326825 () SeekEntryResult!7384)

(assert (=> b!736836 (= lt!326825 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326829 () SeekEntryResult!7384)

(assert (=> b!736836 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326828 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326829)))

(declare-fun b!736837 () Bool)

(declare-fun res!495222 () Bool)

(declare-fun e!412173 () Bool)

(assert (=> b!736837 (=> (not res!495222) (not e!412173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41341 (_ BitVec 32)) Bool)

(assert (=> b!736837 (= res!495222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736838 () Bool)

(assert (=> b!736838 (= e!412169 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326828 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326829)))))

(declare-fun b!736839 () Bool)

(declare-fun res!495227 () Bool)

(assert (=> b!736839 (=> (not res!495227) (not e!412178))))

(assert (=> b!736839 (= res!495227 (and (= (size!20205 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20205 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20205 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736840 () Bool)

(assert (=> b!736840 (= e!412173 e!412175)))

(declare-fun res!495221 () Bool)

(assert (=> b!736840 (=> (not res!495221) (not e!412175))))

(assert (=> b!736840 (= res!495221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19784 a!3186) j!159) mask!3328) (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326833))))

(assert (=> b!736840 (= lt!326833 (Intermediate!7384 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736841 () Bool)

(declare-fun res!495224 () Bool)

(assert (=> b!736841 (=> (not res!495224) (not e!412173))))

(assert (=> b!736841 (= res!495224 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20205 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20205 a!3186))))))

(declare-fun b!736842 () Bool)

(declare-fun e!412172 () Bool)

(assert (=> b!736842 (= e!412167 (not e!412172))))

(declare-fun res!495229 () Bool)

(assert (=> b!736842 (=> res!495229 e!412172)))

(assert (=> b!736842 (= res!495229 (or (not (is-Intermediate!7384 lt!326824)) (bvsge x!1131 (x!62902 lt!326824))))))

(assert (=> b!736842 (= lt!326829 (Found!7384 j!159))))

(declare-fun e!412170 () Bool)

(assert (=> b!736842 e!412170))

(declare-fun res!495228 () Bool)

(assert (=> b!736842 (=> (not res!495228) (not e!412170))))

(assert (=> b!736842 (= res!495228 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326830 () Unit!25132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25132)

(assert (=> b!736842 (= lt!326830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736843 () Bool)

(declare-fun res!495219 () Bool)

(assert (=> b!736843 (=> (not res!495219) (not e!412173))))

(declare-datatypes ((List!13786 0))(
  ( (Nil!13783) (Cons!13782 (h!14854 (_ BitVec 64)) (t!20101 List!13786)) )
))
(declare-fun arrayNoDuplicates!0 (array!41341 (_ BitVec 32) List!13786) Bool)

(assert (=> b!736843 (= res!495219 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13783))))

(declare-fun b!736844 () Bool)

(assert (=> b!736844 (= e!412170 e!412174)))

(declare-fun res!495234 () Bool)

(assert (=> b!736844 (=> (not res!495234) (not e!412174))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41341 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!736844 (= res!495234 (= (seekEntryOrOpen!0 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326835))))

(assert (=> b!736844 (= lt!326835 (Found!7384 j!159))))

(declare-fun b!736845 () Bool)

(declare-fun e!412176 () Bool)

(assert (=> b!736845 (= e!412176 true)))

(declare-fun lt!326831 () SeekEntryResult!7384)

(assert (=> b!736845 (= lt!326831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326828 lt!326832 lt!326827 mask!3328))))

(declare-fun b!736846 () Bool)

(declare-fun res!495226 () Bool)

(assert (=> b!736846 (=> (not res!495226) (not e!412178))))

(assert (=> b!736846 (= res!495226 (validKeyInArray!0 k!2102))))

(declare-fun b!736847 () Bool)

(assert (=> b!736847 (= e!412171 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) (Found!7384 j!159)))))

(declare-fun b!736848 () Bool)

(declare-fun res!495233 () Bool)

(assert (=> b!736848 (=> res!495233 e!412176)))

(assert (=> b!736848 (= res!495233 e!412169)))

(declare-fun c!81187 () Bool)

(declare-fun lt!326837 () Bool)

(assert (=> b!736848 (= c!81187 lt!326837)))

(declare-fun b!736849 () Bool)

(assert (=> b!736849 (= e!412172 e!412176)))

(declare-fun res!495225 () Bool)

(assert (=> b!736849 (=> res!495225 e!412176)))

(assert (=> b!736849 (= res!495225 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326828 #b00000000000000000000000000000000) (bvsge lt!326828 (size!20205 a!3186))))))

(declare-fun lt!326836 () Unit!25132)

(assert (=> b!736849 (= lt!326836 e!412168)))

(declare-fun c!81185 () Bool)

(assert (=> b!736849 (= c!81185 lt!326837)))

(assert (=> b!736849 (= lt!326837 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736849 (= lt!326828 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736850 () Bool)

(declare-fun res!495235 () Bool)

(assert (=> b!736850 (=> (not res!495235) (not e!412178))))

(declare-fun arrayContainsKey!0 (array!41341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736850 (= res!495235 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736851 () Bool)

(assert (=> b!736851 (= e!412178 e!412173)))

(declare-fun res!495220 () Bool)

(assert (=> b!736851 (=> (not res!495220) (not e!412173))))

(declare-fun lt!326834 () SeekEntryResult!7384)

(assert (=> b!736851 (= res!495220 (or (= lt!326834 (MissingZero!7384 i!1173)) (= lt!326834 (MissingVacant!7384 i!1173))))))

(assert (=> b!736851 (= lt!326834 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65168 res!495232) b!736839))

(assert (= (and b!736839 res!495227) b!736829))

(assert (= (and b!736829 res!495230) b!736846))

(assert (= (and b!736846 res!495226) b!736850))

(assert (= (and b!736850 res!495235) b!736851))

(assert (= (and b!736851 res!495220) b!736837))

(assert (= (and b!736837 res!495222) b!736843))

(assert (= (and b!736843 res!495219) b!736841))

(assert (= (and b!736841 res!495224) b!736840))

(assert (= (and b!736840 res!495221) b!736834))

(assert (= (and b!736834 res!495231) b!736832))

(assert (= (and b!736832 c!81186) b!736831))

(assert (= (and b!736832 (not c!81186)) b!736847))

(assert (= (and b!736832 res!495223) b!736835))

(assert (= (and b!736835 res!495236) b!736842))

(assert (= (and b!736842 res!495228) b!736844))

(assert (= (and b!736844 res!495234) b!736830))

(assert (= (and b!736842 (not res!495229)) b!736849))

(assert (= (and b!736849 c!81185) b!736828))

(assert (= (and b!736849 (not c!81185)) b!736836))

(assert (= (and b!736849 (not res!495225)) b!736848))

(assert (= (and b!736848 c!81187) b!736833))

(assert (= (and b!736848 (not c!81187)) b!736838))

(assert (= (and b!736848 (not res!495233)) b!736845))

(declare-fun m!688861 () Bool)

(assert (=> b!736845 m!688861))

(declare-fun m!688863 () Bool)

(assert (=> b!736843 m!688863))

(declare-fun m!688865 () Bool)

(assert (=> b!736834 m!688865))

(declare-fun m!688867 () Bool)

(assert (=> b!736851 m!688867))

(declare-fun m!688869 () Bool)

(assert (=> b!736849 m!688869))

(declare-fun m!688871 () Bool)

(assert (=> b!736842 m!688871))

(declare-fun m!688873 () Bool)

(assert (=> b!736842 m!688873))

(declare-fun m!688875 () Bool)

(assert (=> b!736836 m!688875))

(assert (=> b!736836 m!688875))

(declare-fun m!688877 () Bool)

(assert (=> b!736836 m!688877))

(assert (=> b!736836 m!688875))

(declare-fun m!688879 () Bool)

(assert (=> b!736836 m!688879))

(assert (=> b!736833 m!688875))

(assert (=> b!736833 m!688875))

(declare-fun m!688881 () Bool)

(assert (=> b!736833 m!688881))

(assert (=> b!736844 m!688875))

(assert (=> b!736844 m!688875))

(declare-fun m!688883 () Bool)

(assert (=> b!736844 m!688883))

(assert (=> b!736838 m!688875))

(assert (=> b!736838 m!688875))

(assert (=> b!736838 m!688879))

(assert (=> b!736840 m!688875))

(assert (=> b!736840 m!688875))

(declare-fun m!688885 () Bool)

(assert (=> b!736840 m!688885))

(assert (=> b!736840 m!688885))

(assert (=> b!736840 m!688875))

(declare-fun m!688887 () Bool)

(assert (=> b!736840 m!688887))

(assert (=> b!736831 m!688875))

(assert (=> b!736831 m!688875))

(declare-fun m!688889 () Bool)

(assert (=> b!736831 m!688889))

(declare-fun m!688891 () Bool)

(assert (=> b!736850 m!688891))

(assert (=> b!736847 m!688875))

(assert (=> b!736847 m!688875))

(assert (=> b!736847 m!688877))

(declare-fun m!688893 () Bool)

(assert (=> start!65168 m!688893))

(declare-fun m!688895 () Bool)

(assert (=> start!65168 m!688895))

(declare-fun m!688897 () Bool)

(assert (=> b!736846 m!688897))

(declare-fun m!688899 () Bool)

(assert (=> b!736835 m!688899))

(declare-fun m!688901 () Bool)

(assert (=> b!736835 m!688901))

(declare-fun m!688903 () Bool)

(assert (=> b!736835 m!688903))

(declare-fun m!688905 () Bool)

(assert (=> b!736835 m!688905))

(assert (=> b!736835 m!688899))

(declare-fun m!688907 () Bool)

(assert (=> b!736835 m!688907))

(assert (=> b!736830 m!688875))

(assert (=> b!736830 m!688875))

(declare-fun m!688909 () Bool)

(assert (=> b!736830 m!688909))

(declare-fun m!688911 () Bool)

(assert (=> b!736837 m!688911))

(assert (=> b!736828 m!688875))

(assert (=> b!736828 m!688875))

(assert (=> b!736828 m!688881))

(assert (=> b!736829 m!688875))

(assert (=> b!736829 m!688875))

(declare-fun m!688913 () Bool)

(assert (=> b!736829 m!688913))

(push 1)

