; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65620 () Bool)

(assert start!65620)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41793 0))(
  ( (array!41794 (arr!20010 (Array (_ BitVec 32) (_ BitVec 64))) (size!20431 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41793)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!750837 () Bool)

(declare-fun e!418890 () Bool)

(declare-datatypes ((SeekEntryResult!7610 0))(
  ( (MissingZero!7610 (index!32808 (_ BitVec 32))) (Found!7610 (index!32809 (_ BitVec 32))) (Intermediate!7610 (undefined!8422 Bool) (index!32810 (_ BitVec 32)) (x!63736 (_ BitVec 32))) (Undefined!7610) (MissingVacant!7610 (index!32811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41793 (_ BitVec 32)) SeekEntryResult!7610)

(assert (=> b!750837 (= e!418890 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20010 a!3186) j!159) a!3186 mask!3328) (Found!7610 j!159)))))

(declare-fun b!750838 () Bool)

(declare-fun e!418897 () Bool)

(declare-fun lt!333884 () (_ BitVec 64))

(declare-fun lt!333889 () array!41793)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41793 (_ BitVec 32)) SeekEntryResult!7610)

(assert (=> b!750838 (= e!418897 (= (seekEntryOrOpen!0 lt!333884 lt!333889 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333884 lt!333889 mask!3328)))))

(declare-fun b!750839 () Bool)

(declare-fun res!506833 () Bool)

(declare-fun e!418893 () Bool)

(assert (=> b!750839 (=> (not res!506833) (not e!418893))))

(declare-datatypes ((List!14012 0))(
  ( (Nil!14009) (Cons!14008 (h!15080 (_ BitVec 64)) (t!20327 List!14012)) )
))
(declare-fun arrayNoDuplicates!0 (array!41793 (_ BitVec 32) List!14012) Bool)

(assert (=> b!750839 (= res!506833 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14009))))

(declare-fun b!750840 () Bool)

(declare-fun e!418895 () Bool)

(declare-fun e!418888 () Bool)

(assert (=> b!750840 (= e!418895 (not e!418888))))

(declare-fun res!506824 () Bool)

(assert (=> b!750840 (=> res!506824 e!418888)))

(declare-fun lt!333890 () SeekEntryResult!7610)

(assert (=> b!750840 (= res!506824 (or (not (is-Intermediate!7610 lt!333890)) (bvslt x!1131 (x!63736 lt!333890)) (not (= x!1131 (x!63736 lt!333890))) (not (= index!1321 (index!32810 lt!333890)))))))

(declare-fun e!418894 () Bool)

(assert (=> b!750840 e!418894))

(declare-fun res!506822 () Bool)

(assert (=> b!750840 (=> (not res!506822) (not e!418894))))

(declare-fun lt!333880 () SeekEntryResult!7610)

(declare-fun lt!333881 () SeekEntryResult!7610)

(assert (=> b!750840 (= res!506822 (= lt!333880 lt!333881))))

(assert (=> b!750840 (= lt!333881 (Found!7610 j!159))))

(assert (=> b!750840 (= lt!333880 (seekEntryOrOpen!0 (select (arr!20010 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41793 (_ BitVec 32)) Bool)

(assert (=> b!750840 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25820 0))(
  ( (Unit!25821) )
))
(declare-fun lt!333887 () Unit!25820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25820)

(assert (=> b!750840 (= lt!333887 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750841 () Bool)

(declare-fun res!506831 () Bool)

(declare-fun e!418896 () Bool)

(assert (=> b!750841 (=> (not res!506831) (not e!418896))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750841 (= res!506831 (validKeyInArray!0 k!2102))))

(declare-fun res!506823 () Bool)

(assert (=> start!65620 (=> (not res!506823) (not e!418896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65620 (= res!506823 (validMask!0 mask!3328))))

(assert (=> start!65620 e!418896))

(assert (=> start!65620 true))

(declare-fun array_inv!15806 (array!41793) Bool)

(assert (=> start!65620 (array_inv!15806 a!3186)))

(declare-fun b!750842 () Bool)

(declare-fun res!506821 () Bool)

(assert (=> b!750842 (=> (not res!506821) (not e!418896))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750842 (= res!506821 (and (= (size!20431 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20431 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20431 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750843 () Bool)

(declare-fun e!418891 () Bool)

(assert (=> b!750843 (= e!418893 e!418891)))

(declare-fun res!506832 () Bool)

(assert (=> b!750843 (=> (not res!506832) (not e!418891))))

(declare-fun lt!333883 () SeekEntryResult!7610)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41793 (_ BitVec 32)) SeekEntryResult!7610)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750843 (= res!506832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20010 a!3186) j!159) mask!3328) (select (arr!20010 a!3186) j!159) a!3186 mask!3328) lt!333883))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750843 (= lt!333883 (Intermediate!7610 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750844 () Bool)

(declare-fun e!418892 () Unit!25820)

(declare-fun Unit!25822 () Unit!25820)

(assert (=> b!750844 (= e!418892 Unit!25822)))

(declare-fun b!750845 () Bool)

(declare-fun res!506826 () Bool)

(assert (=> b!750845 (=> res!506826 e!418888)))

(assert (=> b!750845 (= res!506826 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20010 a!3186) j!159) a!3186 mask!3328) lt!333881)))))

(declare-fun b!750846 () Bool)

(declare-fun e!418889 () Bool)

(assert (=> b!750846 (= e!418889 true)))

(assert (=> b!750846 e!418897))

(declare-fun res!506825 () Bool)

(assert (=> b!750846 (=> (not res!506825) (not e!418897))))

(declare-fun lt!333886 () (_ BitVec 64))

(assert (=> b!750846 (= res!506825 (= lt!333886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333882 () Unit!25820)

(assert (=> b!750846 (= lt!333882 e!418892)))

(declare-fun c!82390 () Bool)

(assert (=> b!750846 (= c!82390 (= lt!333886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750847 () Bool)

(assert (=> b!750847 (= e!418890 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20010 a!3186) j!159) a!3186 mask!3328) lt!333883))))

(declare-fun b!750848 () Bool)

(declare-fun res!506820 () Bool)

(assert (=> b!750848 (=> (not res!506820) (not e!418891))))

(assert (=> b!750848 (= res!506820 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20010 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750849 () Bool)

(declare-fun res!506827 () Bool)

(assert (=> b!750849 (=> (not res!506827) (not e!418896))))

(declare-fun arrayContainsKey!0 (array!41793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750849 (= res!506827 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750850 () Bool)

(assert (=> b!750850 (= e!418894 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20010 a!3186) j!159) a!3186 mask!3328) lt!333881))))

(declare-fun b!750851 () Bool)

(assert (=> b!750851 (= e!418888 e!418889)))

(declare-fun res!506837 () Bool)

(assert (=> b!750851 (=> res!506837 e!418889)))

(assert (=> b!750851 (= res!506837 (= lt!333886 lt!333884))))

(assert (=> b!750851 (= lt!333886 (select (store (arr!20010 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750852 () Bool)

(declare-fun res!506835 () Bool)

(assert (=> b!750852 (=> (not res!506835) (not e!418891))))

(assert (=> b!750852 (= res!506835 e!418890)))

(declare-fun c!82389 () Bool)

(assert (=> b!750852 (= c!82389 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750853 () Bool)

(assert (=> b!750853 (= e!418896 e!418893)))

(declare-fun res!506828 () Bool)

(assert (=> b!750853 (=> (not res!506828) (not e!418893))))

(declare-fun lt!333888 () SeekEntryResult!7610)

(assert (=> b!750853 (= res!506828 (or (= lt!333888 (MissingZero!7610 i!1173)) (= lt!333888 (MissingVacant!7610 i!1173))))))

(assert (=> b!750853 (= lt!333888 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750854 () Bool)

(declare-fun res!506829 () Bool)

(assert (=> b!750854 (=> (not res!506829) (not e!418893))))

(assert (=> b!750854 (= res!506829 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20431 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20431 a!3186))))))

(declare-fun b!750855 () Bool)

(declare-fun Unit!25823 () Unit!25820)

(assert (=> b!750855 (= e!418892 Unit!25823)))

(assert (=> b!750855 false))

(declare-fun b!750856 () Bool)

(assert (=> b!750856 (= e!418891 e!418895)))

(declare-fun res!506836 () Bool)

(assert (=> b!750856 (=> (not res!506836) (not e!418895))))

(declare-fun lt!333885 () SeekEntryResult!7610)

(assert (=> b!750856 (= res!506836 (= lt!333885 lt!333890))))

(assert (=> b!750856 (= lt!333890 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333884 lt!333889 mask!3328))))

(assert (=> b!750856 (= lt!333885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333884 mask!3328) lt!333884 lt!333889 mask!3328))))

(assert (=> b!750856 (= lt!333884 (select (store (arr!20010 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750856 (= lt!333889 (array!41794 (store (arr!20010 a!3186) i!1173 k!2102) (size!20431 a!3186)))))

(declare-fun b!750857 () Bool)

(declare-fun res!506830 () Bool)

(assert (=> b!750857 (=> (not res!506830) (not e!418896))))

(assert (=> b!750857 (= res!506830 (validKeyInArray!0 (select (arr!20010 a!3186) j!159)))))

(declare-fun b!750858 () Bool)

(declare-fun res!506834 () Bool)

(assert (=> b!750858 (=> (not res!506834) (not e!418893))))

(assert (=> b!750858 (= res!506834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65620 res!506823) b!750842))

(assert (= (and b!750842 res!506821) b!750857))

(assert (= (and b!750857 res!506830) b!750841))

(assert (= (and b!750841 res!506831) b!750849))

(assert (= (and b!750849 res!506827) b!750853))

(assert (= (and b!750853 res!506828) b!750858))

(assert (= (and b!750858 res!506834) b!750839))

(assert (= (and b!750839 res!506833) b!750854))

(assert (= (and b!750854 res!506829) b!750843))

(assert (= (and b!750843 res!506832) b!750848))

(assert (= (and b!750848 res!506820) b!750852))

(assert (= (and b!750852 c!82389) b!750847))

(assert (= (and b!750852 (not c!82389)) b!750837))

(assert (= (and b!750852 res!506835) b!750856))

(assert (= (and b!750856 res!506836) b!750840))

(assert (= (and b!750840 res!506822) b!750850))

(assert (= (and b!750840 (not res!506824)) b!750845))

(assert (= (and b!750845 (not res!506826)) b!750851))

(assert (= (and b!750851 (not res!506837)) b!750846))

(assert (= (and b!750846 c!82390) b!750855))

(assert (= (and b!750846 (not c!82390)) b!750844))

(assert (= (and b!750846 res!506825) b!750838))

(declare-fun m!700147 () Bool)

(assert (=> b!750838 m!700147))

(declare-fun m!700149 () Bool)

(assert (=> b!750838 m!700149))

(declare-fun m!700151 () Bool)

(assert (=> b!750845 m!700151))

(assert (=> b!750845 m!700151))

(declare-fun m!700153 () Bool)

(assert (=> b!750845 m!700153))

(assert (=> b!750850 m!700151))

(assert (=> b!750850 m!700151))

(declare-fun m!700155 () Bool)

(assert (=> b!750850 m!700155))

(declare-fun m!700157 () Bool)

(assert (=> b!750839 m!700157))

(declare-fun m!700159 () Bool)

(assert (=> b!750848 m!700159))

(assert (=> b!750840 m!700151))

(assert (=> b!750840 m!700151))

(declare-fun m!700161 () Bool)

(assert (=> b!750840 m!700161))

(declare-fun m!700163 () Bool)

(assert (=> b!750840 m!700163))

(declare-fun m!700165 () Bool)

(assert (=> b!750840 m!700165))

(assert (=> b!750857 m!700151))

(assert (=> b!750857 m!700151))

(declare-fun m!700167 () Bool)

(assert (=> b!750857 m!700167))

(assert (=> b!750843 m!700151))

(assert (=> b!750843 m!700151))

(declare-fun m!700169 () Bool)

(assert (=> b!750843 m!700169))

(assert (=> b!750843 m!700169))

(assert (=> b!750843 m!700151))

(declare-fun m!700171 () Bool)

(assert (=> b!750843 m!700171))

(assert (=> b!750837 m!700151))

(assert (=> b!750837 m!700151))

(assert (=> b!750837 m!700153))

(declare-fun m!700173 () Bool)

(assert (=> b!750849 m!700173))

(declare-fun m!700175 () Bool)

(assert (=> b!750858 m!700175))

(declare-fun m!700177 () Bool)

(assert (=> b!750856 m!700177))

(declare-fun m!700179 () Bool)

(assert (=> b!750856 m!700179))

(declare-fun m!700181 () Bool)

(assert (=> b!750856 m!700181))

(declare-fun m!700183 () Bool)

(assert (=> b!750856 m!700183))

(assert (=> b!750856 m!700177))

(declare-fun m!700185 () Bool)

(assert (=> b!750856 m!700185))

(declare-fun m!700187 () Bool)

(assert (=> start!65620 m!700187))

(declare-fun m!700189 () Bool)

(assert (=> start!65620 m!700189))

(declare-fun m!700191 () Bool)

(assert (=> b!750853 m!700191))

(declare-fun m!700193 () Bool)

(assert (=> b!750841 m!700193))

(assert (=> b!750847 m!700151))

(assert (=> b!750847 m!700151))

(declare-fun m!700195 () Bool)

(assert (=> b!750847 m!700195))

(assert (=> b!750851 m!700181))

(declare-fun m!700197 () Bool)

(assert (=> b!750851 m!700197))

(push 1)

