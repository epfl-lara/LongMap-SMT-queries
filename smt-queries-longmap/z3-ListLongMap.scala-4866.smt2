; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67112 () Bool)

(assert start!67112)

(declare-fun b!774822 () Bool)

(declare-fun res!523905 () Bool)

(declare-fun e!431283 () Bool)

(assert (=> b!774822 (=> (not res!523905) (not e!431283))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42467 0))(
  ( (array!42468 (arr!20329 (Array (_ BitVec 32) (_ BitVec 64))) (size!20750 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42467)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774822 (= res!523905 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20750 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20750 a!3186))))))

(declare-fun b!774823 () Bool)

(declare-fun e!431282 () Bool)

(assert (=> b!774823 (= e!431282 true)))

(declare-fun lt!345089 () array!42467)

(declare-fun lt!345092 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7929 0))(
  ( (MissingZero!7929 (index!34084 (_ BitVec 32))) (Found!7929 (index!34085 (_ BitVec 32))) (Intermediate!7929 (undefined!8741 Bool) (index!34086 (_ BitVec 32)) (x!65032 (_ BitVec 32))) (Undefined!7929) (MissingVacant!7929 (index!34087 (_ BitVec 32))) )
))
(declare-fun lt!345100 () SeekEntryResult!7929)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42467 (_ BitVec 32)) SeekEntryResult!7929)

(assert (=> b!774823 (= (seekEntryOrOpen!0 lt!345092 lt!345089 mask!3328) lt!345100)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-datatypes ((Unit!26730 0))(
  ( (Unit!26731) )
))
(declare-fun lt!345095 () Unit!26730)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!345101 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26730)

(assert (=> b!774823 (= lt!345095 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345101 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774824 () Bool)

(declare-fun res!523921 () Bool)

(declare-fun e!431279 () Bool)

(assert (=> b!774824 (=> (not res!523921) (not e!431279))))

(declare-fun e!431284 () Bool)

(assert (=> b!774824 (= res!523921 e!431284)))

(declare-fun c!85860 () Bool)

(assert (=> b!774824 (= c!85860 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774825 () Bool)

(declare-fun res!523911 () Bool)

(assert (=> b!774825 (=> (not res!523911) (not e!431283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42467 (_ BitVec 32)) Bool)

(assert (=> b!774825 (= res!523911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774826 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42467 (_ BitVec 32)) SeekEntryResult!7929)

(assert (=> b!774826 (= e!431284 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) (Found!7929 j!159)))))

(declare-fun b!774827 () Bool)

(declare-fun res!523914 () Bool)

(declare-fun e!431280 () Bool)

(assert (=> b!774827 (=> (not res!523914) (not e!431280))))

(declare-fun arrayContainsKey!0 (array!42467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774827 (= res!523914 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774828 () Bool)

(declare-fun e!431278 () Bool)

(assert (=> b!774828 (= e!431278 e!431282)))

(declare-fun res!523918 () Bool)

(assert (=> b!774828 (=> res!523918 e!431282)))

(assert (=> b!774828 (= res!523918 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345101 #b00000000000000000000000000000000) (bvsge lt!345101 (size!20750 a!3186))))))

(declare-fun lt!345088 () Unit!26730)

(declare-fun e!431287 () Unit!26730)

(assert (=> b!774828 (= lt!345088 e!431287)))

(declare-fun c!85861 () Bool)

(declare-fun lt!345097 () Bool)

(assert (=> b!774828 (= c!85861 lt!345097)))

(assert (=> b!774828 (= lt!345097 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774828 (= lt!345101 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774829 () Bool)

(declare-fun lt!345093 () SeekEntryResult!7929)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42467 (_ BitVec 32)) SeekEntryResult!7929)

(assert (=> b!774829 (= e!431284 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345093))))

(declare-fun b!774830 () Bool)

(declare-fun res!523912 () Bool)

(assert (=> b!774830 (=> (not res!523912) (not e!431280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774830 (= res!523912 (validKeyInArray!0 k0!2102))))

(declare-fun b!774831 () Bool)

(declare-fun e!431281 () Bool)

(assert (=> b!774831 (= e!431279 e!431281)))

(declare-fun res!523907 () Bool)

(assert (=> b!774831 (=> (not res!523907) (not e!431281))))

(declare-fun lt!345090 () SeekEntryResult!7929)

(declare-fun lt!345091 () SeekEntryResult!7929)

(assert (=> b!774831 (= res!523907 (= lt!345090 lt!345091))))

(assert (=> b!774831 (= lt!345091 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345092 lt!345089 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774831 (= lt!345090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345092 mask!3328) lt!345092 lt!345089 mask!3328))))

(assert (=> b!774831 (= lt!345092 (select (store (arr!20329 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774831 (= lt!345089 (array!42468 (store (arr!20329 a!3186) i!1173 k0!2102) (size!20750 a!3186)))))

(declare-fun b!774832 () Bool)

(declare-fun Unit!26732 () Unit!26730)

(assert (=> b!774832 (= e!431287 Unit!26732)))

(declare-fun lt!345098 () SeekEntryResult!7929)

(assert (=> b!774832 (= lt!345098 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774832 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345101 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345100)))

(declare-fun b!774833 () Bool)

(assert (=> b!774833 (= e!431281 (not e!431278))))

(declare-fun res!523915 () Bool)

(assert (=> b!774833 (=> res!523915 e!431278)))

(get-info :version)

(assert (=> b!774833 (= res!523915 (or (not ((_ is Intermediate!7929) lt!345091)) (bvsge x!1131 (x!65032 lt!345091))))))

(assert (=> b!774833 (= lt!345100 (Found!7929 j!159))))

(declare-fun e!431285 () Bool)

(assert (=> b!774833 e!431285))

(declare-fun res!523916 () Bool)

(assert (=> b!774833 (=> (not res!523916) (not e!431285))))

(assert (=> b!774833 (= res!523916 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345096 () Unit!26730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26730)

(assert (=> b!774833 (= lt!345096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774834 () Bool)

(declare-fun e!431286 () Bool)

(assert (=> b!774834 (= e!431286 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345101 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345100)))))

(declare-fun b!774835 () Bool)

(assert (=> b!774835 (= e!431280 e!431283)))

(declare-fun res!523904 () Bool)

(assert (=> b!774835 (=> (not res!523904) (not e!431283))))

(declare-fun lt!345099 () SeekEntryResult!7929)

(assert (=> b!774835 (= res!523904 (or (= lt!345099 (MissingZero!7929 i!1173)) (= lt!345099 (MissingVacant!7929 i!1173))))))

(assert (=> b!774835 (= lt!345099 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774836 () Bool)

(declare-fun res!523922 () Bool)

(assert (=> b!774836 (=> res!523922 e!431282)))

(assert (=> b!774836 (= res!523922 e!431286)))

(declare-fun c!85859 () Bool)

(assert (=> b!774836 (= c!85859 lt!345097)))

(declare-fun b!774837 () Bool)

(declare-fun Unit!26733 () Unit!26730)

(assert (=> b!774837 (= e!431287 Unit!26733)))

(assert (=> b!774837 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345101 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345093)))

(declare-fun res!523917 () Bool)

(assert (=> start!67112 (=> (not res!523917) (not e!431280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67112 (= res!523917 (validMask!0 mask!3328))))

(assert (=> start!67112 e!431280))

(assert (=> start!67112 true))

(declare-fun array_inv!16125 (array!42467) Bool)

(assert (=> start!67112 (array_inv!16125 a!3186)))

(declare-fun b!774838 () Bool)

(declare-fun res!523910 () Bool)

(assert (=> b!774838 (=> (not res!523910) (not e!431280))))

(assert (=> b!774838 (= res!523910 (validKeyInArray!0 (select (arr!20329 a!3186) j!159)))))

(declare-fun b!774839 () Bool)

(declare-fun res!523908 () Bool)

(assert (=> b!774839 (=> res!523908 e!431282)))

(assert (=> b!774839 (= res!523908 (not (= lt!345090 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345101 lt!345092 lt!345089 mask!3328))))))

(declare-fun b!774840 () Bool)

(declare-fun res!523913 () Bool)

(assert (=> b!774840 (=> (not res!523913) (not e!431280))))

(assert (=> b!774840 (= res!523913 (and (= (size!20750 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20750 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20750 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774841 () Bool)

(declare-fun e!431288 () Bool)

(assert (=> b!774841 (= e!431285 e!431288)))

(declare-fun res!523919 () Bool)

(assert (=> b!774841 (=> (not res!523919) (not e!431288))))

(declare-fun lt!345094 () SeekEntryResult!7929)

(assert (=> b!774841 (= res!523919 (= (seekEntryOrOpen!0 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345094))))

(assert (=> b!774841 (= lt!345094 (Found!7929 j!159))))

(declare-fun b!774842 () Bool)

(declare-fun res!523906 () Bool)

(assert (=> b!774842 (=> (not res!523906) (not e!431283))))

(declare-datatypes ((List!14331 0))(
  ( (Nil!14328) (Cons!14327 (h!15435 (_ BitVec 64)) (t!20646 List!14331)) )
))
(declare-fun arrayNoDuplicates!0 (array!42467 (_ BitVec 32) List!14331) Bool)

(assert (=> b!774842 (= res!523906 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14328))))

(declare-fun b!774843 () Bool)

(assert (=> b!774843 (= e!431283 e!431279)))

(declare-fun res!523909 () Bool)

(assert (=> b!774843 (=> (not res!523909) (not e!431279))))

(assert (=> b!774843 (= res!523909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20329 a!3186) j!159) mask!3328) (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345093))))

(assert (=> b!774843 (= lt!345093 (Intermediate!7929 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774844 () Bool)

(assert (=> b!774844 (= e!431288 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345094))))

(declare-fun b!774845 () Bool)

(assert (=> b!774845 (= e!431286 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345101 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345093)))))

(declare-fun b!774846 () Bool)

(declare-fun res!523920 () Bool)

(assert (=> b!774846 (=> (not res!523920) (not e!431279))))

(assert (=> b!774846 (= res!523920 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20329 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67112 res!523917) b!774840))

(assert (= (and b!774840 res!523913) b!774838))

(assert (= (and b!774838 res!523910) b!774830))

(assert (= (and b!774830 res!523912) b!774827))

(assert (= (and b!774827 res!523914) b!774835))

(assert (= (and b!774835 res!523904) b!774825))

(assert (= (and b!774825 res!523911) b!774842))

(assert (= (and b!774842 res!523906) b!774822))

(assert (= (and b!774822 res!523905) b!774843))

(assert (= (and b!774843 res!523909) b!774846))

(assert (= (and b!774846 res!523920) b!774824))

(assert (= (and b!774824 c!85860) b!774829))

(assert (= (and b!774824 (not c!85860)) b!774826))

(assert (= (and b!774824 res!523921) b!774831))

(assert (= (and b!774831 res!523907) b!774833))

(assert (= (and b!774833 res!523916) b!774841))

(assert (= (and b!774841 res!523919) b!774844))

(assert (= (and b!774833 (not res!523915)) b!774828))

(assert (= (and b!774828 c!85861) b!774837))

(assert (= (and b!774828 (not c!85861)) b!774832))

(assert (= (and b!774828 (not res!523918)) b!774836))

(assert (= (and b!774836 c!85859) b!774845))

(assert (= (and b!774836 (not c!85859)) b!774834))

(assert (= (and b!774836 (not res!523922)) b!774839))

(assert (= (and b!774839 (not res!523908)) b!774823))

(declare-fun m!719187 () Bool)

(assert (=> b!774827 m!719187))

(declare-fun m!719189 () Bool)

(assert (=> b!774823 m!719189))

(declare-fun m!719191 () Bool)

(assert (=> b!774823 m!719191))

(declare-fun m!719193 () Bool)

(assert (=> b!774832 m!719193))

(assert (=> b!774832 m!719193))

(declare-fun m!719195 () Bool)

(assert (=> b!774832 m!719195))

(assert (=> b!774832 m!719193))

(declare-fun m!719197 () Bool)

(assert (=> b!774832 m!719197))

(assert (=> b!774834 m!719193))

(assert (=> b!774834 m!719193))

(assert (=> b!774834 m!719197))

(declare-fun m!719199 () Bool)

(assert (=> b!774842 m!719199))

(declare-fun m!719201 () Bool)

(assert (=> b!774825 m!719201))

(assert (=> b!774829 m!719193))

(assert (=> b!774829 m!719193))

(declare-fun m!719203 () Bool)

(assert (=> b!774829 m!719203))

(declare-fun m!719205 () Bool)

(assert (=> b!774831 m!719205))

(declare-fun m!719207 () Bool)

(assert (=> b!774831 m!719207))

(declare-fun m!719209 () Bool)

(assert (=> b!774831 m!719209))

(declare-fun m!719211 () Bool)

(assert (=> b!774831 m!719211))

(assert (=> b!774831 m!719209))

(declare-fun m!719213 () Bool)

(assert (=> b!774831 m!719213))

(declare-fun m!719215 () Bool)

(assert (=> start!67112 m!719215))

(declare-fun m!719217 () Bool)

(assert (=> start!67112 m!719217))

(assert (=> b!774826 m!719193))

(assert (=> b!774826 m!719193))

(assert (=> b!774826 m!719195))

(assert (=> b!774838 m!719193))

(assert (=> b!774838 m!719193))

(declare-fun m!719219 () Bool)

(assert (=> b!774838 m!719219))

(assert (=> b!774841 m!719193))

(assert (=> b!774841 m!719193))

(declare-fun m!719221 () Bool)

(assert (=> b!774841 m!719221))

(assert (=> b!774843 m!719193))

(assert (=> b!774843 m!719193))

(declare-fun m!719223 () Bool)

(assert (=> b!774843 m!719223))

(assert (=> b!774843 m!719223))

(assert (=> b!774843 m!719193))

(declare-fun m!719225 () Bool)

(assert (=> b!774843 m!719225))

(assert (=> b!774845 m!719193))

(assert (=> b!774845 m!719193))

(declare-fun m!719227 () Bool)

(assert (=> b!774845 m!719227))

(declare-fun m!719229 () Bool)

(assert (=> b!774846 m!719229))

(declare-fun m!719231 () Bool)

(assert (=> b!774828 m!719231))

(assert (=> b!774844 m!719193))

(assert (=> b!774844 m!719193))

(declare-fun m!719233 () Bool)

(assert (=> b!774844 m!719233))

(declare-fun m!719235 () Bool)

(assert (=> b!774835 m!719235))

(declare-fun m!719237 () Bool)

(assert (=> b!774830 m!719237))

(declare-fun m!719239 () Bool)

(assert (=> b!774833 m!719239))

(declare-fun m!719241 () Bool)

(assert (=> b!774833 m!719241))

(declare-fun m!719243 () Bool)

(assert (=> b!774839 m!719243))

(assert (=> b!774837 m!719193))

(assert (=> b!774837 m!719193))

(assert (=> b!774837 m!719227))

(check-sat (not b!774829) (not b!774832) (not b!774843) (not b!774837) (not b!774838) (not b!774828) (not b!774845) (not b!774825) (not start!67112) (not b!774842) (not b!774841) (not b!774844) (not b!774839) (not b!774823) (not b!774834) (not b!774833) (not b!774830) (not b!774835) (not b!774831) (not b!774827) (not b!774826))
(check-sat)
