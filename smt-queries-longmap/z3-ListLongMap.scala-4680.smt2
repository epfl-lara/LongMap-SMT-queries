; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65142 () Bool)

(assert start!65142)

(declare-fun b!735892 () Bool)

(declare-fun e!411706 () Bool)

(assert (=> b!735892 (= e!411706 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7371 0))(
  ( (MissingZero!7371 (index!31852 (_ BitVec 32))) (Found!7371 (index!31853 (_ BitVec 32))) (Intermediate!7371 (undefined!8183 Bool) (index!31854 (_ BitVec 32)) (x!62857 (_ BitVec 32))) (Undefined!7371) (MissingVacant!7371 (index!31855 (_ BitVec 32))) )
))
(declare-fun lt!326284 () SeekEntryResult!7371)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41315 0))(
  ( (array!41316 (arr!19771 (Array (_ BitVec 32) (_ BitVec 64))) (size!20192 (_ BitVec 32))) )
))
(declare-fun lt!326287 () array!41315)

(declare-fun lt!326288 () (_ BitVec 32))

(declare-fun lt!326280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41315 (_ BitVec 32)) SeekEntryResult!7371)

(assert (=> b!735892 (= lt!326284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326288 lt!326280 lt!326287 mask!3328))))

(declare-fun b!735893 () Bool)

(declare-fun res!494520 () Bool)

(declare-fun e!411701 () Bool)

(assert (=> b!735893 (=> (not res!494520) (not e!411701))))

(declare-fun e!411709 () Bool)

(assert (=> b!735893 (= res!494520 e!411709)))

(declare-fun c!81070 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735893 (= c!81070 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735894 () Bool)

(declare-fun e!411700 () Bool)

(declare-fun e!411699 () Bool)

(assert (=> b!735894 (= e!411700 e!411699)))

(declare-fun res!494523 () Bool)

(assert (=> b!735894 (=> (not res!494523) (not e!411699))))

(declare-fun lt!326291 () SeekEntryResult!7371)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735894 (= res!494523 (or (= lt!326291 (MissingZero!7371 i!1173)) (= lt!326291 (MissingVacant!7371 i!1173))))))

(declare-fun a!3186 () array!41315)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41315 (_ BitVec 32)) SeekEntryResult!7371)

(assert (=> b!735894 (= lt!326291 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735895 () Bool)

(declare-fun res!494531 () Bool)

(assert (=> b!735895 (=> (not res!494531) (not e!411700))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735895 (= res!494531 (validKeyInArray!0 (select (arr!19771 a!3186) j!159)))))

(declare-fun lt!326278 () SeekEntryResult!7371)

(declare-fun e!411704 () Bool)

(declare-fun b!735896 () Bool)

(assert (=> b!735896 (= e!411704 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326288 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326278)))))

(declare-fun b!735897 () Bool)

(declare-fun e!411707 () Bool)

(assert (=> b!735897 (= e!411701 e!411707)))

(declare-fun res!494527 () Bool)

(assert (=> b!735897 (=> (not res!494527) (not e!411707))))

(declare-fun lt!326289 () SeekEntryResult!7371)

(declare-fun lt!326283 () SeekEntryResult!7371)

(assert (=> b!735897 (= res!494527 (= lt!326289 lt!326283))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!735897 (= lt!326283 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326280 lt!326287 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735897 (= lt!326289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326280 mask!3328) lt!326280 lt!326287 mask!3328))))

(assert (=> b!735897 (= lt!326280 (select (store (arr!19771 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735897 (= lt!326287 (array!41316 (store (arr!19771 a!3186) i!1173 k0!2102) (size!20192 a!3186)))))

(declare-fun b!735898 () Bool)

(declare-fun e!411705 () Bool)

(assert (=> b!735898 (= e!411705 e!411706)))

(declare-fun res!494524 () Bool)

(assert (=> b!735898 (=> res!494524 e!411706)))

(assert (=> b!735898 (= res!494524 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326288 #b00000000000000000000000000000000) (bvsge lt!326288 (size!20192 a!3186))))))

(declare-datatypes ((Unit!25080 0))(
  ( (Unit!25081) )
))
(declare-fun lt!326282 () Unit!25080)

(declare-fun e!411710 () Unit!25080)

(assert (=> b!735898 (= lt!326282 e!411710)))

(declare-fun c!81068 () Bool)

(declare-fun lt!326281 () Bool)

(assert (=> b!735898 (= c!81068 lt!326281)))

(assert (=> b!735898 (= lt!326281 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735898 (= lt!326288 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735899 () Bool)

(assert (=> b!735899 (= e!411699 e!411701)))

(declare-fun res!494521 () Bool)

(assert (=> b!735899 (=> (not res!494521) (not e!411701))))

(assert (=> b!735899 (= res!494521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19771 a!3186) j!159) mask!3328) (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326278))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!735899 (= lt!326278 (Intermediate!7371 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735900 () Bool)

(declare-fun res!494519 () Bool)

(assert (=> b!735900 (=> (not res!494519) (not e!411700))))

(declare-fun arrayContainsKey!0 (array!41315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735900 (= res!494519 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735901 () Bool)

(assert (=> b!735901 (= e!411707 (not e!411705))))

(declare-fun res!494534 () Bool)

(assert (=> b!735901 (=> res!494534 e!411705)))

(get-info :version)

(assert (=> b!735901 (= res!494534 (or (not ((_ is Intermediate!7371) lt!326283)) (bvsge x!1131 (x!62857 lt!326283))))))

(declare-fun lt!326285 () SeekEntryResult!7371)

(assert (=> b!735901 (= lt!326285 (Found!7371 j!159))))

(declare-fun e!411702 () Bool)

(assert (=> b!735901 e!411702))

(declare-fun res!494528 () Bool)

(assert (=> b!735901 (=> (not res!494528) (not e!411702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41315 (_ BitVec 32)) Bool)

(assert (=> b!735901 (= res!494528 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326279 () Unit!25080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25080)

(assert (=> b!735901 (= lt!326279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735902 () Bool)

(declare-fun res!494529 () Bool)

(assert (=> b!735902 (=> (not res!494529) (not e!411701))))

(assert (=> b!735902 (= res!494529 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19771 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735903 () Bool)

(declare-fun res!494518 () Bool)

(assert (=> b!735903 (=> (not res!494518) (not e!411700))))

(assert (=> b!735903 (= res!494518 (and (= (size!20192 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20192 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20192 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735904 () Bool)

(declare-fun res!494525 () Bool)

(assert (=> b!735904 (=> (not res!494525) (not e!411699))))

(assert (=> b!735904 (= res!494525 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20192 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20192 a!3186))))))

(declare-fun b!735905 () Bool)

(assert (=> b!735905 (= e!411709 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326278))))

(declare-fun b!735906 () Bool)

(declare-fun Unit!25082 () Unit!25080)

(assert (=> b!735906 (= e!411710 Unit!25082)))

(assert (=> b!735906 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326288 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326278)))

(declare-fun b!735907 () Bool)

(declare-fun e!411708 () Bool)

(assert (=> b!735907 (= e!411702 e!411708)))

(declare-fun res!494530 () Bool)

(assert (=> b!735907 (=> (not res!494530) (not e!411708))))

(declare-fun lt!326286 () SeekEntryResult!7371)

(assert (=> b!735907 (= res!494530 (= (seekEntryOrOpen!0 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326286))))

(assert (=> b!735907 (= lt!326286 (Found!7371 j!159))))

(declare-fun b!735908 () Bool)

(declare-fun res!494533 () Bool)

(assert (=> b!735908 (=> (not res!494533) (not e!411699))))

(declare-datatypes ((List!13773 0))(
  ( (Nil!13770) (Cons!13769 (h!14841 (_ BitVec 64)) (t!20088 List!13773)) )
))
(declare-fun arrayNoDuplicates!0 (array!41315 (_ BitVec 32) List!13773) Bool)

(assert (=> b!735908 (= res!494533 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13770))))

(declare-fun b!735909 () Bool)

(declare-fun res!494532 () Bool)

(assert (=> b!735909 (=> (not res!494532) (not e!411699))))

(assert (=> b!735909 (= res!494532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735910 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41315 (_ BitVec 32)) SeekEntryResult!7371)

(assert (=> b!735910 (= e!411709 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) (Found!7371 j!159)))))

(declare-fun b!735911 () Bool)

(declare-fun Unit!25083 () Unit!25080)

(assert (=> b!735911 (= e!411710 Unit!25083)))

(declare-fun lt!326290 () SeekEntryResult!7371)

(assert (=> b!735911 (= lt!326290 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326288 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326285)))

(declare-fun res!494517 () Bool)

(assert (=> start!65142 (=> (not res!494517) (not e!411700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65142 (= res!494517 (validMask!0 mask!3328))))

(assert (=> start!65142 e!411700))

(assert (=> start!65142 true))

(declare-fun array_inv!15567 (array!41315) Bool)

(assert (=> start!65142 (array_inv!15567 a!3186)))

(declare-fun b!735912 () Bool)

(assert (=> b!735912 (= e!411704 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326288 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326285)))))

(declare-fun b!735913 () Bool)

(declare-fun res!494522 () Bool)

(assert (=> b!735913 (=> res!494522 e!411706)))

(assert (=> b!735913 (= res!494522 e!411704)))

(declare-fun c!81069 () Bool)

(assert (=> b!735913 (= c!81069 lt!326281)))

(declare-fun b!735914 () Bool)

(assert (=> b!735914 (= e!411708 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326286))))

(declare-fun b!735915 () Bool)

(declare-fun res!494526 () Bool)

(assert (=> b!735915 (=> (not res!494526) (not e!411700))))

(assert (=> b!735915 (= res!494526 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65142 res!494517) b!735903))

(assert (= (and b!735903 res!494518) b!735895))

(assert (= (and b!735895 res!494531) b!735915))

(assert (= (and b!735915 res!494526) b!735900))

(assert (= (and b!735900 res!494519) b!735894))

(assert (= (and b!735894 res!494523) b!735909))

(assert (= (and b!735909 res!494532) b!735908))

(assert (= (and b!735908 res!494533) b!735904))

(assert (= (and b!735904 res!494525) b!735899))

(assert (= (and b!735899 res!494521) b!735902))

(assert (= (and b!735902 res!494529) b!735893))

(assert (= (and b!735893 c!81070) b!735905))

(assert (= (and b!735893 (not c!81070)) b!735910))

(assert (= (and b!735893 res!494520) b!735897))

(assert (= (and b!735897 res!494527) b!735901))

(assert (= (and b!735901 res!494528) b!735907))

(assert (= (and b!735907 res!494530) b!735914))

(assert (= (and b!735901 (not res!494534)) b!735898))

(assert (= (and b!735898 c!81068) b!735906))

(assert (= (and b!735898 (not c!81068)) b!735911))

(assert (= (and b!735898 (not res!494524)) b!735913))

(assert (= (and b!735913 c!81069) b!735896))

(assert (= (and b!735913 (not c!81069)) b!735912))

(assert (= (and b!735913 (not res!494522)) b!735892))

(declare-fun m!688159 () Bool)

(assert (=> b!735906 m!688159))

(assert (=> b!735906 m!688159))

(declare-fun m!688161 () Bool)

(assert (=> b!735906 m!688161))

(declare-fun m!688163 () Bool)

(assert (=> b!735908 m!688163))

(assert (=> b!735911 m!688159))

(assert (=> b!735911 m!688159))

(declare-fun m!688165 () Bool)

(assert (=> b!735911 m!688165))

(assert (=> b!735911 m!688159))

(declare-fun m!688167 () Bool)

(assert (=> b!735911 m!688167))

(declare-fun m!688169 () Bool)

(assert (=> start!65142 m!688169))

(declare-fun m!688171 () Bool)

(assert (=> start!65142 m!688171))

(declare-fun m!688173 () Bool)

(assert (=> b!735892 m!688173))

(assert (=> b!735899 m!688159))

(assert (=> b!735899 m!688159))

(declare-fun m!688175 () Bool)

(assert (=> b!735899 m!688175))

(assert (=> b!735899 m!688175))

(assert (=> b!735899 m!688159))

(declare-fun m!688177 () Bool)

(assert (=> b!735899 m!688177))

(declare-fun m!688179 () Bool)

(assert (=> b!735901 m!688179))

(declare-fun m!688181 () Bool)

(assert (=> b!735901 m!688181))

(declare-fun m!688183 () Bool)

(assert (=> b!735909 m!688183))

(assert (=> b!735896 m!688159))

(assert (=> b!735896 m!688159))

(assert (=> b!735896 m!688161))

(declare-fun m!688185 () Bool)

(assert (=> b!735900 m!688185))

(assert (=> b!735914 m!688159))

(assert (=> b!735914 m!688159))

(declare-fun m!688187 () Bool)

(assert (=> b!735914 m!688187))

(declare-fun m!688189 () Bool)

(assert (=> b!735902 m!688189))

(declare-fun m!688191 () Bool)

(assert (=> b!735894 m!688191))

(declare-fun m!688193 () Bool)

(assert (=> b!735897 m!688193))

(declare-fun m!688195 () Bool)

(assert (=> b!735897 m!688195))

(declare-fun m!688197 () Bool)

(assert (=> b!735897 m!688197))

(declare-fun m!688199 () Bool)

(assert (=> b!735897 m!688199))

(declare-fun m!688201 () Bool)

(assert (=> b!735897 m!688201))

(assert (=> b!735897 m!688193))

(assert (=> b!735907 m!688159))

(assert (=> b!735907 m!688159))

(declare-fun m!688203 () Bool)

(assert (=> b!735907 m!688203))

(declare-fun m!688205 () Bool)

(assert (=> b!735915 m!688205))

(declare-fun m!688207 () Bool)

(assert (=> b!735898 m!688207))

(assert (=> b!735910 m!688159))

(assert (=> b!735910 m!688159))

(assert (=> b!735910 m!688165))

(assert (=> b!735905 m!688159))

(assert (=> b!735905 m!688159))

(declare-fun m!688209 () Bool)

(assert (=> b!735905 m!688209))

(assert (=> b!735912 m!688159))

(assert (=> b!735912 m!688159))

(assert (=> b!735912 m!688167))

(assert (=> b!735895 m!688159))

(assert (=> b!735895 m!688159))

(declare-fun m!688211 () Bool)

(assert (=> b!735895 m!688211))

(check-sat (not b!735909) (not b!735898) (not start!65142) (not b!735901) (not b!735900) (not b!735912) (not b!735894) (not b!735908) (not b!735895) (not b!735905) (not b!735910) (not b!735892) (not b!735914) (not b!735896) (not b!735906) (not b!735915) (not b!735911) (not b!735907) (not b!735899) (not b!735897))
(check-sat)
