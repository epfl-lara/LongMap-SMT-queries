; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65280 () Bool)

(assert start!65280)

(declare-fun res!498281 () Bool)

(declare-fun e!414190 () Bool)

(assert (=> start!65280 (=> (not res!498281) (not e!414190))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65280 (= res!498281 (validMask!0 mask!3328))))

(assert (=> start!65280 e!414190))

(assert (=> start!65280 true))

(declare-datatypes ((array!41453 0))(
  ( (array!41454 (arr!19840 (Array (_ BitVec 32) (_ BitVec 64))) (size!20261 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41453)

(declare-fun array_inv!15636 (array!41453) Bool)

(assert (=> start!65280 (array_inv!15636 a!3186)))

(declare-fun b!740897 () Bool)

(declare-datatypes ((Unit!25356 0))(
  ( (Unit!25357) )
))
(declare-fun e!414199 () Unit!25356)

(declare-fun Unit!25358 () Unit!25356)

(assert (=> b!740897 (= e!414199 Unit!25358)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7440 0))(
  ( (MissingZero!7440 (index!32128 (_ BitVec 32))) (Found!7440 (index!32129 (_ BitVec 32))) (Intermediate!7440 (undefined!8252 Bool) (index!32130 (_ BitVec 32)) (x!63110 (_ BitVec 32))) (Undefined!7440) (MissingVacant!7440 (index!32131 (_ BitVec 32))) )
))
(declare-fun lt!329184 () SeekEntryResult!7440)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41453 (_ BitVec 32)) SeekEntryResult!7440)

(assert (=> b!740897 (= lt!329184 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!329185 () (_ BitVec 32))

(declare-fun lt!329187 () SeekEntryResult!7440)

(assert (=> b!740897 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329185 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329187)))

(declare-fun b!740898 () Bool)

(declare-fun res!498293 () Bool)

(declare-fun e!414196 () Bool)

(assert (=> b!740898 (=> (not res!498293) (not e!414196))))

(declare-fun e!414195 () Bool)

(assert (=> b!740898 (= res!498293 e!414195)))

(declare-fun c!81691 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740898 (= c!81691 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740899 () Bool)

(declare-fun res!498297 () Bool)

(declare-fun e!414191 () Bool)

(assert (=> b!740899 (=> (not res!498297) (not e!414191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41453 (_ BitVec 32)) Bool)

(assert (=> b!740899 (= res!498297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740900 () Bool)

(declare-fun e!414189 () Bool)

(declare-fun e!414197 () Bool)

(assert (=> b!740900 (= e!414189 (not e!414197))))

(declare-fun res!498284 () Bool)

(assert (=> b!740900 (=> res!498284 e!414197)))

(declare-fun lt!329178 () SeekEntryResult!7440)

(get-info :version)

(assert (=> b!740900 (= res!498284 (or (not ((_ is Intermediate!7440) lt!329178)) (bvsge x!1131 (x!63110 lt!329178))))))

(assert (=> b!740900 (= lt!329187 (Found!7440 j!159))))

(declare-fun e!414200 () Bool)

(assert (=> b!740900 e!414200))

(declare-fun res!498290 () Bool)

(assert (=> b!740900 (=> (not res!498290) (not e!414200))))

(assert (=> b!740900 (= res!498290 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!329189 () Unit!25356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25356)

(assert (=> b!740900 (= lt!329189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740901 () Bool)

(declare-fun res!498299 () Bool)

(declare-fun e!414192 () Bool)

(assert (=> b!740901 (=> res!498299 e!414192)))

(declare-fun lt!329182 () SeekEntryResult!7440)

(declare-fun lt!329180 () array!41453)

(declare-fun lt!329177 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41453 (_ BitVec 32)) SeekEntryResult!7440)

(assert (=> b!740901 (= res!498299 (not (= lt!329182 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329185 lt!329177 lt!329180 mask!3328))))))

(declare-fun b!740902 () Bool)

(declare-fun res!498285 () Bool)

(assert (=> b!740902 (=> (not res!498285) (not e!414190))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740902 (= res!498285 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740903 () Bool)

(assert (=> b!740903 (= e!414190 e!414191)))

(declare-fun res!498287 () Bool)

(assert (=> b!740903 (=> (not res!498287) (not e!414191))))

(declare-fun lt!329176 () SeekEntryResult!7440)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740903 (= res!498287 (or (= lt!329176 (MissingZero!7440 i!1173)) (= lt!329176 (MissingVacant!7440 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41453 (_ BitVec 32)) SeekEntryResult!7440)

(assert (=> b!740903 (= lt!329176 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740904 () Bool)

(declare-fun e!414193 () Bool)

(assert (=> b!740904 (= e!414193 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329185 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329187)))))

(declare-fun b!740905 () Bool)

(declare-fun e!414194 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740905 (= e!414194 (validKeyInArray!0 lt!329177))))

(declare-fun lt!329181 () SeekEntryResult!7440)

(declare-fun b!740906 () Bool)

(assert (=> b!740906 (= e!414195 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329181))))

(declare-fun b!740907 () Bool)

(declare-fun e!414188 () Bool)

(assert (=> b!740907 (= e!414200 e!414188)))

(declare-fun res!498286 () Bool)

(assert (=> b!740907 (=> (not res!498286) (not e!414188))))

(declare-fun lt!329188 () SeekEntryResult!7440)

(assert (=> b!740907 (= res!498286 (= (seekEntryOrOpen!0 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329188))))

(assert (=> b!740907 (= lt!329188 (Found!7440 j!159))))

(declare-fun b!740908 () Bool)

(declare-fun res!498289 () Bool)

(assert (=> b!740908 (=> (not res!498289) (not e!414190))))

(assert (=> b!740908 (= res!498289 (validKeyInArray!0 (select (arr!19840 a!3186) j!159)))))

(declare-fun b!740909 () Bool)

(declare-fun Unit!25359 () Unit!25356)

(assert (=> b!740909 (= e!414199 Unit!25359)))

(assert (=> b!740909 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329185 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329181)))

(declare-fun b!740910 () Bool)

(assert (=> b!740910 (= e!414195 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) (Found!7440 j!159)))))

(declare-fun b!740911 () Bool)

(assert (=> b!740911 (= e!414196 e!414189)))

(declare-fun res!498298 () Bool)

(assert (=> b!740911 (=> (not res!498298) (not e!414189))))

(assert (=> b!740911 (= res!498298 (= lt!329182 lt!329178))))

(assert (=> b!740911 (= lt!329178 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329177 lt!329180 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740911 (= lt!329182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329177 mask!3328) lt!329177 lt!329180 mask!3328))))

(assert (=> b!740911 (= lt!329177 (select (store (arr!19840 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740911 (= lt!329180 (array!41454 (store (arr!19840 a!3186) i!1173 k0!2102) (size!20261 a!3186)))))

(declare-fun b!740912 () Bool)

(assert (=> b!740912 (= e!414193 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329185 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329181)))))

(declare-fun b!740913 () Bool)

(declare-fun res!498291 () Bool)

(assert (=> b!740913 (=> (not res!498291) (not e!414190))))

(assert (=> b!740913 (= res!498291 (and (= (size!20261 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20261 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20261 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740914 () Bool)

(declare-fun res!498280 () Bool)

(assert (=> b!740914 (=> (not res!498280) (not e!414196))))

(assert (=> b!740914 (= res!498280 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19840 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740915 () Bool)

(declare-fun res!498295 () Bool)

(assert (=> b!740915 (=> (not res!498295) (not e!414191))))

(declare-datatypes ((List!13842 0))(
  ( (Nil!13839) (Cons!13838 (h!14910 (_ BitVec 64)) (t!20157 List!13842)) )
))
(declare-fun arrayNoDuplicates!0 (array!41453 (_ BitVec 32) List!13842) Bool)

(assert (=> b!740915 (= res!498295 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13839))))

(declare-fun b!740916 () Bool)

(declare-fun res!498292 () Bool)

(assert (=> b!740916 (=> (not res!498292) (not e!414190))))

(assert (=> b!740916 (= res!498292 (validKeyInArray!0 k0!2102))))

(declare-fun b!740917 () Bool)

(assert (=> b!740917 (= e!414188 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329188))))

(declare-fun b!740918 () Bool)

(declare-fun res!498282 () Bool)

(assert (=> b!740918 (=> res!498282 e!414192)))

(assert (=> b!740918 (= res!498282 e!414193)))

(declare-fun c!81690 () Bool)

(declare-fun lt!329186 () Bool)

(assert (=> b!740918 (= c!81690 lt!329186)))

(declare-fun b!740919 () Bool)

(assert (=> b!740919 (= e!414197 e!414192)))

(declare-fun res!498294 () Bool)

(assert (=> b!740919 (=> res!498294 e!414192)))

(assert (=> b!740919 (= res!498294 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329185 #b00000000000000000000000000000000) (bvsge lt!329185 (size!20261 a!3186))))))

(declare-fun lt!329179 () Unit!25356)

(assert (=> b!740919 (= lt!329179 e!414199)))

(declare-fun c!81689 () Bool)

(assert (=> b!740919 (= c!81689 lt!329186)))

(assert (=> b!740919 (= lt!329186 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740919 (= lt!329185 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740920 () Bool)

(assert (=> b!740920 (= e!414192 e!414194)))

(declare-fun res!498296 () Bool)

(assert (=> b!740920 (=> res!498296 e!414194)))

(assert (=> b!740920 (= res!498296 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!740920 (= (seekEntryOrOpen!0 lt!329177 lt!329180 mask!3328) lt!329187)))

(declare-fun lt!329183 () Unit!25356)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25356)

(assert (=> b!740920 (= lt!329183 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!329185 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740921 () Bool)

(declare-fun res!498283 () Bool)

(assert (=> b!740921 (=> (not res!498283) (not e!414191))))

(assert (=> b!740921 (= res!498283 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20261 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20261 a!3186))))))

(declare-fun b!740922 () Bool)

(assert (=> b!740922 (= e!414191 e!414196)))

(declare-fun res!498288 () Bool)

(assert (=> b!740922 (=> (not res!498288) (not e!414196))))

(assert (=> b!740922 (= res!498288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19840 a!3186) j!159) mask!3328) (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329181))))

(assert (=> b!740922 (= lt!329181 (Intermediate!7440 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65280 res!498281) b!740913))

(assert (= (and b!740913 res!498291) b!740908))

(assert (= (and b!740908 res!498289) b!740916))

(assert (= (and b!740916 res!498292) b!740902))

(assert (= (and b!740902 res!498285) b!740903))

(assert (= (and b!740903 res!498287) b!740899))

(assert (= (and b!740899 res!498297) b!740915))

(assert (= (and b!740915 res!498295) b!740921))

(assert (= (and b!740921 res!498283) b!740922))

(assert (= (and b!740922 res!498288) b!740914))

(assert (= (and b!740914 res!498280) b!740898))

(assert (= (and b!740898 c!81691) b!740906))

(assert (= (and b!740898 (not c!81691)) b!740910))

(assert (= (and b!740898 res!498293) b!740911))

(assert (= (and b!740911 res!498298) b!740900))

(assert (= (and b!740900 res!498290) b!740907))

(assert (= (and b!740907 res!498286) b!740917))

(assert (= (and b!740900 (not res!498284)) b!740919))

(assert (= (and b!740919 c!81689) b!740909))

(assert (= (and b!740919 (not c!81689)) b!740897))

(assert (= (and b!740919 (not res!498294)) b!740918))

(assert (= (and b!740918 c!81690) b!740912))

(assert (= (and b!740918 (not c!81690)) b!740904))

(assert (= (and b!740918 (not res!498282)) b!740901))

(assert (= (and b!740901 (not res!498299)) b!740920))

(assert (= (and b!740920 (not res!498296)) b!740905))

(declare-fun m!691927 () Bool)

(assert (=> b!740904 m!691927))

(assert (=> b!740904 m!691927))

(declare-fun m!691929 () Bool)

(assert (=> b!740904 m!691929))

(assert (=> b!740917 m!691927))

(assert (=> b!740917 m!691927))

(declare-fun m!691931 () Bool)

(assert (=> b!740917 m!691931))

(declare-fun m!691933 () Bool)

(assert (=> b!740903 m!691933))

(declare-fun m!691935 () Bool)

(assert (=> start!65280 m!691935))

(declare-fun m!691937 () Bool)

(assert (=> start!65280 m!691937))

(declare-fun m!691939 () Bool)

(assert (=> b!740919 m!691939))

(declare-fun m!691941 () Bool)

(assert (=> b!740905 m!691941))

(assert (=> b!740909 m!691927))

(assert (=> b!740909 m!691927))

(declare-fun m!691943 () Bool)

(assert (=> b!740909 m!691943))

(assert (=> b!740910 m!691927))

(assert (=> b!740910 m!691927))

(declare-fun m!691945 () Bool)

(assert (=> b!740910 m!691945))

(declare-fun m!691947 () Bool)

(assert (=> b!740899 m!691947))

(declare-fun m!691949 () Bool)

(assert (=> b!740911 m!691949))

(declare-fun m!691951 () Bool)

(assert (=> b!740911 m!691951))

(declare-fun m!691953 () Bool)

(assert (=> b!740911 m!691953))

(declare-fun m!691955 () Bool)

(assert (=> b!740911 m!691955))

(assert (=> b!740911 m!691951))

(declare-fun m!691957 () Bool)

(assert (=> b!740911 m!691957))

(declare-fun m!691959 () Bool)

(assert (=> b!740914 m!691959))

(declare-fun m!691961 () Bool)

(assert (=> b!740900 m!691961))

(declare-fun m!691963 () Bool)

(assert (=> b!740900 m!691963))

(declare-fun m!691965 () Bool)

(assert (=> b!740920 m!691965))

(declare-fun m!691967 () Bool)

(assert (=> b!740920 m!691967))

(assert (=> b!740922 m!691927))

(assert (=> b!740922 m!691927))

(declare-fun m!691969 () Bool)

(assert (=> b!740922 m!691969))

(assert (=> b!740922 m!691969))

(assert (=> b!740922 m!691927))

(declare-fun m!691971 () Bool)

(assert (=> b!740922 m!691971))

(assert (=> b!740897 m!691927))

(assert (=> b!740897 m!691927))

(assert (=> b!740897 m!691945))

(assert (=> b!740897 m!691927))

(assert (=> b!740897 m!691929))

(assert (=> b!740908 m!691927))

(assert (=> b!740908 m!691927))

(declare-fun m!691973 () Bool)

(assert (=> b!740908 m!691973))

(assert (=> b!740906 m!691927))

(assert (=> b!740906 m!691927))

(declare-fun m!691975 () Bool)

(assert (=> b!740906 m!691975))

(assert (=> b!740912 m!691927))

(assert (=> b!740912 m!691927))

(assert (=> b!740912 m!691943))

(declare-fun m!691977 () Bool)

(assert (=> b!740902 m!691977))

(declare-fun m!691979 () Bool)

(assert (=> b!740915 m!691979))

(declare-fun m!691981 () Bool)

(assert (=> b!740916 m!691981))

(assert (=> b!740907 m!691927))

(assert (=> b!740907 m!691927))

(declare-fun m!691983 () Bool)

(assert (=> b!740907 m!691983))

(declare-fun m!691985 () Bool)

(assert (=> b!740901 m!691985))

(check-sat (not b!740909) (not b!740904) (not b!740920) (not b!740919) (not b!740902) (not b!740908) (not b!740917) (not b!740910) (not b!740901) (not b!740911) (not start!65280) (not b!740915) (not b!740905) (not b!740899) (not b!740903) (not b!740907) (not b!740906) (not b!740900) (not b!740912) (not b!740916) (not b!740922) (not b!740897))
(check-sat)
