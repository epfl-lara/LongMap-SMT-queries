; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65102 () Bool)

(assert start!65102)

(declare-fun b!734922 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41292 0))(
  ( (array!41293 (arr!19760 (Array (_ BitVec 32) (_ BitVec 64))) (size!20181 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41292)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7357 0))(
  ( (MissingZero!7357 (index!31796 (_ BitVec 32))) (Found!7357 (index!31797 (_ BitVec 32))) (Intermediate!7357 (undefined!8169 Bool) (index!31798 (_ BitVec 32)) (x!62814 (_ BitVec 32))) (Undefined!7357) (MissingVacant!7357 (index!31799 (_ BitVec 32))) )
))
(declare-fun lt!325625 () SeekEntryResult!7357)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!411188 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41292 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!734922 (= e!411188 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325625))))

(declare-fun b!734923 () Bool)

(declare-fun e!411196 () Bool)

(declare-fun e!411190 () Bool)

(assert (=> b!734923 (= e!411196 e!411190)))

(declare-fun res!493870 () Bool)

(assert (=> b!734923 (=> (not res!493870) (not e!411190))))

(declare-fun lt!325623 () SeekEntryResult!7357)

(declare-fun lt!325628 () SeekEntryResult!7357)

(assert (=> b!734923 (= res!493870 (= lt!325623 lt!325628))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325627 () (_ BitVec 64))

(declare-fun lt!325624 () array!41292)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41292 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!734923 (= lt!325628 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325627 lt!325624 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734923 (= lt!325623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325627 mask!3328) lt!325627 lt!325624 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!734923 (= lt!325627 (select (store (arr!19760 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734923 (= lt!325624 (array!41293 (store (arr!19760 a!3186) i!1173 k0!2102) (size!20181 a!3186)))))

(declare-fun lt!325629 () (_ BitVec 32))

(declare-fun b!734924 () Bool)

(declare-fun e!411194 () Bool)

(declare-fun lt!325626 () SeekEntryResult!7357)

(assert (=> b!734924 (= e!411194 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325629 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325626)))))

(declare-fun b!734925 () Bool)

(declare-fun res!493884 () Bool)

(assert (=> b!734925 (=> (not res!493884) (not e!411196))))

(declare-fun e!411195 () Bool)

(assert (=> b!734925 (= res!493884 e!411195)))

(declare-fun c!80908 () Bool)

(assert (=> b!734925 (= c!80908 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!493883 () Bool)

(declare-fun e!411193 () Bool)

(assert (=> start!65102 (=> (not res!493883) (not e!411193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65102 (= res!493883 (validMask!0 mask!3328))))

(assert (=> start!65102 e!411193))

(assert (=> start!65102 true))

(declare-fun array_inv!15643 (array!41292) Bool)

(assert (=> start!65102 (array_inv!15643 a!3186)))

(declare-fun b!734926 () Bool)

(assert (=> b!734926 (= e!411195 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) (Found!7357 j!159)))))

(declare-fun b!734927 () Bool)

(assert (=> b!734927 (= e!411195 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325626))))

(declare-fun b!734928 () Bool)

(declare-fun e!411185 () Bool)

(declare-fun e!411187 () Bool)

(assert (=> b!734928 (= e!411185 e!411187)))

(declare-fun res!493867 () Bool)

(assert (=> b!734928 (=> res!493867 e!411187)))

(assert (=> b!734928 (= res!493867 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325629 #b00000000000000000000000000000000) (bvsge lt!325629 (size!20181 a!3186))))))

(declare-datatypes ((Unit!25004 0))(
  ( (Unit!25005) )
))
(declare-fun lt!325630 () Unit!25004)

(declare-fun e!411191 () Unit!25004)

(assert (=> b!734928 (= lt!325630 e!411191)))

(declare-fun c!80909 () Bool)

(declare-fun lt!325618 () Bool)

(assert (=> b!734928 (= c!80909 lt!325618)))

(assert (=> b!734928 (= lt!325618 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734928 (= lt!325629 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734929 () Bool)

(declare-fun Unit!25006 () Unit!25004)

(assert (=> b!734929 (= e!411191 Unit!25006)))

(declare-fun lt!325622 () SeekEntryResult!7357)

(assert (=> b!734929 (= lt!325622 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!325621 () SeekEntryResult!7357)

(assert (=> b!734929 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325629 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325621)))

(declare-fun b!734930 () Bool)

(declare-fun res!493869 () Bool)

(assert (=> b!734930 (=> (not res!493869) (not e!411193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734930 (= res!493869 (validKeyInArray!0 (select (arr!19760 a!3186) j!159)))))

(declare-fun b!734931 () Bool)

(declare-fun e!411186 () Bool)

(assert (=> b!734931 (= e!411186 e!411196)))

(declare-fun res!493876 () Bool)

(assert (=> b!734931 (=> (not res!493876) (not e!411196))))

(assert (=> b!734931 (= res!493876 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19760 a!3186) j!159) mask!3328) (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325626))))

(assert (=> b!734931 (= lt!325626 (Intermediate!7357 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734932 () Bool)

(declare-fun res!493868 () Bool)

(assert (=> b!734932 (=> (not res!493868) (not e!411193))))

(assert (=> b!734932 (= res!493868 (validKeyInArray!0 k0!2102))))

(declare-fun b!734933 () Bool)

(declare-fun res!493877 () Bool)

(assert (=> b!734933 (=> (not res!493877) (not e!411186))))

(assert (=> b!734933 (= res!493877 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20181 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20181 a!3186))))))

(declare-fun b!734934 () Bool)

(declare-fun res!493872 () Bool)

(assert (=> b!734934 (=> (not res!493872) (not e!411186))))

(declare-datatypes ((List!13801 0))(
  ( (Nil!13798) (Cons!13797 (h!14869 (_ BitVec 64)) (t!20107 List!13801)) )
))
(declare-fun arrayNoDuplicates!0 (array!41292 (_ BitVec 32) List!13801) Bool)

(assert (=> b!734934 (= res!493872 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13798))))

(declare-fun b!734935 () Bool)

(declare-fun res!493881 () Bool)

(assert (=> b!734935 (=> (not res!493881) (not e!411196))))

(assert (=> b!734935 (= res!493881 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19760 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734936 () Bool)

(assert (=> b!734936 (= e!411190 (not e!411185))))

(declare-fun res!493874 () Bool)

(assert (=> b!734936 (=> res!493874 e!411185)))

(get-info :version)

(assert (=> b!734936 (= res!493874 (or (not ((_ is Intermediate!7357) lt!325628)) (bvsge x!1131 (x!62814 lt!325628))))))

(assert (=> b!734936 (= lt!325621 (Found!7357 j!159))))

(declare-fun e!411189 () Bool)

(assert (=> b!734936 e!411189))

(declare-fun res!493871 () Bool)

(assert (=> b!734936 (=> (not res!493871) (not e!411189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41292 (_ BitVec 32)) Bool)

(assert (=> b!734936 (= res!493871 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!325619 () Unit!25004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25004)

(assert (=> b!734936 (= lt!325619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734937 () Bool)

(declare-fun res!493880 () Bool)

(assert (=> b!734937 (=> (not res!493880) (not e!411193))))

(assert (=> b!734937 (= res!493880 (and (= (size!20181 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20181 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20181 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734938 () Bool)

(assert (=> b!734938 (= e!411194 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325629 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325621)))))

(declare-fun b!734939 () Bool)

(assert (=> b!734939 (= e!411189 e!411188)))

(declare-fun res!493878 () Bool)

(assert (=> b!734939 (=> (not res!493878) (not e!411188))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41292 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!734939 (= res!493878 (= (seekEntryOrOpen!0 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325625))))

(assert (=> b!734939 (= lt!325625 (Found!7357 j!159))))

(declare-fun b!734940 () Bool)

(assert (=> b!734940 (= e!411193 e!411186)))

(declare-fun res!493882 () Bool)

(assert (=> b!734940 (=> (not res!493882) (not e!411186))))

(declare-fun lt!325620 () SeekEntryResult!7357)

(assert (=> b!734940 (= res!493882 (or (= lt!325620 (MissingZero!7357 i!1173)) (= lt!325620 (MissingVacant!7357 i!1173))))))

(assert (=> b!734940 (= lt!325620 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734941 () Bool)

(declare-fun Unit!25007 () Unit!25004)

(assert (=> b!734941 (= e!411191 Unit!25007)))

(assert (=> b!734941 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325629 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325626)))

(declare-fun b!734942 () Bool)

(declare-fun res!493873 () Bool)

(assert (=> b!734942 (=> res!493873 e!411187)))

(assert (=> b!734942 (= res!493873 e!411194)))

(declare-fun c!80910 () Bool)

(assert (=> b!734942 (= c!80910 lt!325618)))

(declare-fun b!734943 () Bool)

(declare-fun res!493875 () Bool)

(assert (=> b!734943 (=> (not res!493875) (not e!411193))))

(declare-fun arrayContainsKey!0 (array!41292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734943 (= res!493875 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734944 () Bool)

(assert (=> b!734944 (= e!411187 true)))

(declare-fun lt!325631 () SeekEntryResult!7357)

(assert (=> b!734944 (= lt!325631 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325629 lt!325627 lt!325624 mask!3328))))

(declare-fun b!734945 () Bool)

(declare-fun res!493879 () Bool)

(assert (=> b!734945 (=> (not res!493879) (not e!411186))))

(assert (=> b!734945 (= res!493879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65102 res!493883) b!734937))

(assert (= (and b!734937 res!493880) b!734930))

(assert (= (and b!734930 res!493869) b!734932))

(assert (= (and b!734932 res!493868) b!734943))

(assert (= (and b!734943 res!493875) b!734940))

(assert (= (and b!734940 res!493882) b!734945))

(assert (= (and b!734945 res!493879) b!734934))

(assert (= (and b!734934 res!493872) b!734933))

(assert (= (and b!734933 res!493877) b!734931))

(assert (= (and b!734931 res!493876) b!734935))

(assert (= (and b!734935 res!493881) b!734925))

(assert (= (and b!734925 c!80908) b!734927))

(assert (= (and b!734925 (not c!80908)) b!734926))

(assert (= (and b!734925 res!493884) b!734923))

(assert (= (and b!734923 res!493870) b!734936))

(assert (= (and b!734936 res!493871) b!734939))

(assert (= (and b!734939 res!493878) b!734922))

(assert (= (and b!734936 (not res!493874)) b!734928))

(assert (= (and b!734928 c!80909) b!734941))

(assert (= (and b!734928 (not c!80909)) b!734929))

(assert (= (and b!734928 (not res!493867)) b!734942))

(assert (= (and b!734942 c!80910) b!734924))

(assert (= (and b!734942 (not c!80910)) b!734938))

(assert (= (and b!734942 (not res!493873)) b!734944))

(declare-fun m!686861 () Bool)

(assert (=> b!734924 m!686861))

(assert (=> b!734924 m!686861))

(declare-fun m!686863 () Bool)

(assert (=> b!734924 m!686863))

(assert (=> b!734941 m!686861))

(assert (=> b!734941 m!686861))

(assert (=> b!734941 m!686863))

(declare-fun m!686865 () Bool)

(assert (=> b!734936 m!686865))

(declare-fun m!686867 () Bool)

(assert (=> b!734936 m!686867))

(assert (=> b!734930 m!686861))

(assert (=> b!734930 m!686861))

(declare-fun m!686869 () Bool)

(assert (=> b!734930 m!686869))

(declare-fun m!686871 () Bool)

(assert (=> b!734945 m!686871))

(declare-fun m!686873 () Bool)

(assert (=> b!734923 m!686873))

(declare-fun m!686875 () Bool)

(assert (=> b!734923 m!686875))

(declare-fun m!686877 () Bool)

(assert (=> b!734923 m!686877))

(assert (=> b!734923 m!686873))

(declare-fun m!686879 () Bool)

(assert (=> b!734923 m!686879))

(declare-fun m!686881 () Bool)

(assert (=> b!734923 m!686881))

(assert (=> b!734931 m!686861))

(assert (=> b!734931 m!686861))

(declare-fun m!686883 () Bool)

(assert (=> b!734931 m!686883))

(assert (=> b!734931 m!686883))

(assert (=> b!734931 m!686861))

(declare-fun m!686885 () Bool)

(assert (=> b!734931 m!686885))

(declare-fun m!686887 () Bool)

(assert (=> start!65102 m!686887))

(declare-fun m!686889 () Bool)

(assert (=> start!65102 m!686889))

(declare-fun m!686891 () Bool)

(assert (=> b!734943 m!686891))

(assert (=> b!734926 m!686861))

(assert (=> b!734926 m!686861))

(declare-fun m!686893 () Bool)

(assert (=> b!734926 m!686893))

(assert (=> b!734939 m!686861))

(assert (=> b!734939 m!686861))

(declare-fun m!686895 () Bool)

(assert (=> b!734939 m!686895))

(assert (=> b!734927 m!686861))

(assert (=> b!734927 m!686861))

(declare-fun m!686897 () Bool)

(assert (=> b!734927 m!686897))

(declare-fun m!686899 () Bool)

(assert (=> b!734934 m!686899))

(assert (=> b!734938 m!686861))

(assert (=> b!734938 m!686861))

(declare-fun m!686901 () Bool)

(assert (=> b!734938 m!686901))

(declare-fun m!686903 () Bool)

(assert (=> b!734944 m!686903))

(declare-fun m!686905 () Bool)

(assert (=> b!734940 m!686905))

(declare-fun m!686907 () Bool)

(assert (=> b!734935 m!686907))

(declare-fun m!686909 () Bool)

(assert (=> b!734928 m!686909))

(declare-fun m!686911 () Bool)

(assert (=> b!734932 m!686911))

(assert (=> b!734922 m!686861))

(assert (=> b!734922 m!686861))

(declare-fun m!686913 () Bool)

(assert (=> b!734922 m!686913))

(assert (=> b!734929 m!686861))

(assert (=> b!734929 m!686861))

(assert (=> b!734929 m!686893))

(assert (=> b!734929 m!686861))

(assert (=> b!734929 m!686901))

(check-sat (not b!734932) (not b!734928) (not b!734930) (not b!734926) (not b!734944) (not b!734938) (not b!734931) (not b!734924) (not b!734923) (not b!734943) (not b!734934) (not b!734939) (not start!65102) (not b!734940) (not b!734929) (not b!734936) (not b!734927) (not b!734945) (not b!734941) (not b!734922))
(check-sat)
