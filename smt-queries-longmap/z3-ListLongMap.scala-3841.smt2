; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52798 () Bool)

(assert start!52798)

(declare-fun b!575831 () Bool)

(declare-fun e!331324 () Bool)

(declare-fun e!331322 () Bool)

(assert (=> b!575831 (= e!331324 e!331322)))

(declare-fun res!364251 () Bool)

(assert (=> b!575831 (=> (not res!364251) (not e!331322))))

(declare-datatypes ((SeekEntryResult!5703 0))(
  ( (MissingZero!5703 (index!25039 (_ BitVec 32))) (Found!5703 (index!25040 (_ BitVec 32))) (Intermediate!5703 (undefined!6515 Bool) (index!25041 (_ BitVec 32)) (x!53928 (_ BitVec 32))) (Undefined!5703) (MissingVacant!5703 (index!25042 (_ BitVec 32))) )
))
(declare-fun lt!263453 () SeekEntryResult!5703)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575831 (= res!364251 (or (= lt!263453 (MissingZero!5703 i!1132)) (= lt!263453 (MissingVacant!5703 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35943 0))(
  ( (array!35944 (arr!17254 (Array (_ BitVec 32) (_ BitVec 64))) (size!17618 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35943)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35943 (_ BitVec 32)) SeekEntryResult!5703)

(assert (=> b!575831 (= lt!263453 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575832 () Bool)

(declare-fun res!364255 () Bool)

(assert (=> b!575832 (=> (not res!364255) (not e!331322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35943 (_ BitVec 32)) Bool)

(assert (=> b!575832 (= res!364255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575833 () Bool)

(declare-fun e!331325 () Bool)

(assert (=> b!575833 (= e!331322 e!331325)))

(declare-fun res!364253 () Bool)

(assert (=> b!575833 (=> (not res!364253) (not e!331325))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!263457 () (_ BitVec 32))

(declare-fun lt!263455 () SeekEntryResult!5703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35943 (_ BitVec 32)) SeekEntryResult!5703)

(assert (=> b!575833 (= res!364253 (= lt!263455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263457 (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)) mask!3119)))))

(declare-fun lt!263458 () (_ BitVec 32))

(assert (=> b!575833 (= lt!263455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263458 (select (arr!17254 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575833 (= lt!263457 (toIndex!0 (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!575833 (= lt!263458 (toIndex!0 (select (arr!17254 a!3118) j!142) mask!3119))))

(declare-fun b!575834 () Bool)

(declare-fun res!364256 () Bool)

(assert (=> b!575834 (=> (not res!364256) (not e!331324))))

(declare-fun arrayContainsKey!0 (array!35943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575834 (= res!364256 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!331326 () Bool)

(declare-fun b!575835 () Bool)

(assert (=> b!575835 (= e!331326 (= (seekEntryOrOpen!0 (select (arr!17254 a!3118) j!142) a!3118 mask!3119) (Found!5703 j!142)))))

(declare-fun res!364247 () Bool)

(assert (=> start!52798 (=> (not res!364247) (not e!331324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52798 (= res!364247 (validMask!0 mask!3119))))

(assert (=> start!52798 e!331324))

(assert (=> start!52798 true))

(declare-fun array_inv!13050 (array!35943) Bool)

(assert (=> start!52798 (array_inv!13050 a!3118)))

(declare-fun b!575836 () Bool)

(declare-fun res!364250 () Bool)

(assert (=> b!575836 (=> (not res!364250) (not e!331322))))

(declare-datatypes ((List!11334 0))(
  ( (Nil!11331) (Cons!11330 (h!12369 (_ BitVec 64)) (t!17562 List!11334)) )
))
(declare-fun arrayNoDuplicates!0 (array!35943 (_ BitVec 32) List!11334) Bool)

(assert (=> b!575836 (= res!364250 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11331))))

(declare-fun b!575837 () Bool)

(declare-fun res!364252 () Bool)

(assert (=> b!575837 (=> (not res!364252) (not e!331324))))

(assert (=> b!575837 (= res!364252 (and (= (size!17618 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17618 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17618 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575838 () Bool)

(declare-fun res!364249 () Bool)

(assert (=> b!575838 (=> (not res!364249) (not e!331324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575838 (= res!364249 (validKeyInArray!0 k0!1914))))

(declare-fun b!575839 () Bool)

(declare-fun lt!263454 () Bool)

(assert (=> b!575839 (= e!331325 (not (or (and (not lt!263454) (undefined!6515 lt!263455)) (and (not lt!263454) (not (undefined!6515 lt!263455))))))))

(get-info :version)

(assert (=> b!575839 (= lt!263454 (not ((_ is Intermediate!5703) lt!263455)))))

(assert (=> b!575839 e!331326))

(declare-fun res!364254 () Bool)

(assert (=> b!575839 (=> (not res!364254) (not e!331326))))

(assert (=> b!575839 (= res!364254 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18108 0))(
  ( (Unit!18109) )
))
(declare-fun lt!263456 () Unit!18108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18108)

(assert (=> b!575839 (= lt!263456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575840 () Bool)

(declare-fun res!364248 () Bool)

(assert (=> b!575840 (=> (not res!364248) (not e!331324))))

(assert (=> b!575840 (= res!364248 (validKeyInArray!0 (select (arr!17254 a!3118) j!142)))))

(assert (= (and start!52798 res!364247) b!575837))

(assert (= (and b!575837 res!364252) b!575840))

(assert (= (and b!575840 res!364248) b!575838))

(assert (= (and b!575838 res!364249) b!575834))

(assert (= (and b!575834 res!364256) b!575831))

(assert (= (and b!575831 res!364251) b!575832))

(assert (= (and b!575832 res!364255) b!575836))

(assert (= (and b!575836 res!364250) b!575833))

(assert (= (and b!575833 res!364253) b!575839))

(assert (= (and b!575839 res!364254) b!575835))

(declare-fun m!554817 () Bool)

(assert (=> b!575839 m!554817))

(declare-fun m!554819 () Bool)

(assert (=> b!575839 m!554819))

(declare-fun m!554821 () Bool)

(assert (=> b!575840 m!554821))

(assert (=> b!575840 m!554821))

(declare-fun m!554823 () Bool)

(assert (=> b!575840 m!554823))

(declare-fun m!554825 () Bool)

(assert (=> b!575834 m!554825))

(assert (=> b!575835 m!554821))

(assert (=> b!575835 m!554821))

(declare-fun m!554827 () Bool)

(assert (=> b!575835 m!554827))

(declare-fun m!554829 () Bool)

(assert (=> b!575832 m!554829))

(declare-fun m!554831 () Bool)

(assert (=> b!575836 m!554831))

(declare-fun m!554833 () Bool)

(assert (=> start!52798 m!554833))

(declare-fun m!554835 () Bool)

(assert (=> start!52798 m!554835))

(declare-fun m!554837 () Bool)

(assert (=> b!575838 m!554837))

(declare-fun m!554839 () Bool)

(assert (=> b!575831 m!554839))

(assert (=> b!575833 m!554821))

(declare-fun m!554841 () Bool)

(assert (=> b!575833 m!554841))

(assert (=> b!575833 m!554821))

(declare-fun m!554843 () Bool)

(assert (=> b!575833 m!554843))

(assert (=> b!575833 m!554821))

(declare-fun m!554845 () Bool)

(assert (=> b!575833 m!554845))

(assert (=> b!575833 m!554843))

(declare-fun m!554847 () Bool)

(assert (=> b!575833 m!554847))

(declare-fun m!554849 () Bool)

(assert (=> b!575833 m!554849))

(assert (=> b!575833 m!554843))

(declare-fun m!554851 () Bool)

(assert (=> b!575833 m!554851))

(check-sat (not b!575840) (not b!575834) (not b!575832) (not b!575838) (not b!575831) (not start!52798) (not b!575839) (not b!575835) (not b!575833) (not b!575836))
(check-sat)
(get-model)

(declare-fun e!331370 () SeekEntryResult!5703)

(declare-fun b!575910 () Bool)

(declare-fun lt!263494 () SeekEntryResult!5703)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35943 (_ BitVec 32)) SeekEntryResult!5703)

(assert (=> b!575910 (= e!331370 (seekKeyOrZeroReturnVacant!0 (x!53928 lt!263494) (index!25041 lt!263494) (index!25041 lt!263494) k0!1914 a!3118 mask!3119))))

(declare-fun b!575911 () Bool)

(assert (=> b!575911 (= e!331370 (MissingZero!5703 (index!25041 lt!263494)))))

(declare-fun b!575913 () Bool)

(declare-fun e!331369 () SeekEntryResult!5703)

(assert (=> b!575913 (= e!331369 Undefined!5703)))

(declare-fun b!575914 () Bool)

(declare-fun e!331371 () SeekEntryResult!5703)

(assert (=> b!575914 (= e!331369 e!331371)))

(declare-fun lt!263493 () (_ BitVec 64))

(assert (=> b!575914 (= lt!263493 (select (arr!17254 a!3118) (index!25041 lt!263494)))))

(declare-fun c!66168 () Bool)

(assert (=> b!575914 (= c!66168 (= lt!263493 k0!1914))))

(declare-fun b!575915 () Bool)

(declare-fun c!66169 () Bool)

(assert (=> b!575915 (= c!66169 (= lt!263493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575915 (= e!331371 e!331370)))

(declare-fun b!575912 () Bool)

(assert (=> b!575912 (= e!331371 (Found!5703 (index!25041 lt!263494)))))

(declare-fun d!85303 () Bool)

(declare-fun lt!263492 () SeekEntryResult!5703)

(assert (=> d!85303 (and (or ((_ is Undefined!5703) lt!263492) (not ((_ is Found!5703) lt!263492)) (and (bvsge (index!25040 lt!263492) #b00000000000000000000000000000000) (bvslt (index!25040 lt!263492) (size!17618 a!3118)))) (or ((_ is Undefined!5703) lt!263492) ((_ is Found!5703) lt!263492) (not ((_ is MissingZero!5703) lt!263492)) (and (bvsge (index!25039 lt!263492) #b00000000000000000000000000000000) (bvslt (index!25039 lt!263492) (size!17618 a!3118)))) (or ((_ is Undefined!5703) lt!263492) ((_ is Found!5703) lt!263492) ((_ is MissingZero!5703) lt!263492) (not ((_ is MissingVacant!5703) lt!263492)) (and (bvsge (index!25042 lt!263492) #b00000000000000000000000000000000) (bvslt (index!25042 lt!263492) (size!17618 a!3118)))) (or ((_ is Undefined!5703) lt!263492) (ite ((_ is Found!5703) lt!263492) (= (select (arr!17254 a!3118) (index!25040 lt!263492)) k0!1914) (ite ((_ is MissingZero!5703) lt!263492) (= (select (arr!17254 a!3118) (index!25039 lt!263492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5703) lt!263492) (= (select (arr!17254 a!3118) (index!25042 lt!263492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85303 (= lt!263492 e!331369)))

(declare-fun c!66170 () Bool)

(assert (=> d!85303 (= c!66170 (and ((_ is Intermediate!5703) lt!263494) (undefined!6515 lt!263494)))))

(assert (=> d!85303 (= lt!263494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85303 (validMask!0 mask!3119)))

(assert (=> d!85303 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!263492)))

(assert (= (and d!85303 c!66170) b!575913))

(assert (= (and d!85303 (not c!66170)) b!575914))

(assert (= (and b!575914 c!66168) b!575912))

(assert (= (and b!575914 (not c!66168)) b!575915))

(assert (= (and b!575915 c!66169) b!575911))

(assert (= (and b!575915 (not c!66169)) b!575910))

(declare-fun m!554903 () Bool)

(assert (=> b!575910 m!554903))

(declare-fun m!554905 () Bool)

(assert (=> b!575914 m!554905))

(declare-fun m!554907 () Bool)

(assert (=> d!85303 m!554907))

(declare-fun m!554909 () Bool)

(assert (=> d!85303 m!554909))

(assert (=> d!85303 m!554907))

(assert (=> d!85303 m!554833))

(declare-fun m!554911 () Bool)

(assert (=> d!85303 m!554911))

(declare-fun m!554913 () Bool)

(assert (=> d!85303 m!554913))

(declare-fun m!554915 () Bool)

(assert (=> d!85303 m!554915))

(assert (=> b!575831 d!85303))

(declare-fun b!575926 () Bool)

(declare-fun e!331381 () Bool)

(declare-fun contains!2894 (List!11334 (_ BitVec 64)) Bool)

(assert (=> b!575926 (= e!331381 (contains!2894 Nil!11331 (select (arr!17254 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575927 () Bool)

(declare-fun e!331380 () Bool)

(declare-fun call!32717 () Bool)

(assert (=> b!575927 (= e!331380 call!32717)))

(declare-fun d!85313 () Bool)

(declare-fun res!364310 () Bool)

(declare-fun e!331383 () Bool)

(assert (=> d!85313 (=> res!364310 e!331383)))

(assert (=> d!85313 (= res!364310 (bvsge #b00000000000000000000000000000000 (size!17618 a!3118)))))

(assert (=> d!85313 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11331) e!331383)))

(declare-fun b!575928 () Bool)

(declare-fun e!331382 () Bool)

(assert (=> b!575928 (= e!331383 e!331382)))

(declare-fun res!364309 () Bool)

(assert (=> b!575928 (=> (not res!364309) (not e!331382))))

(assert (=> b!575928 (= res!364309 (not e!331381))))

(declare-fun res!364308 () Bool)

(assert (=> b!575928 (=> (not res!364308) (not e!331381))))

(assert (=> b!575928 (= res!364308 (validKeyInArray!0 (select (arr!17254 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575929 () Bool)

(assert (=> b!575929 (= e!331382 e!331380)))

(declare-fun c!66173 () Bool)

(assert (=> b!575929 (= c!66173 (validKeyInArray!0 (select (arr!17254 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575930 () Bool)

(assert (=> b!575930 (= e!331380 call!32717)))

(declare-fun bm!32714 () Bool)

(assert (=> bm!32714 (= call!32717 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66173 (Cons!11330 (select (arr!17254 a!3118) #b00000000000000000000000000000000) Nil!11331) Nil!11331)))))

(assert (= (and d!85313 (not res!364310)) b!575928))

(assert (= (and b!575928 res!364308) b!575926))

(assert (= (and b!575928 res!364309) b!575929))

(assert (= (and b!575929 c!66173) b!575927))

(assert (= (and b!575929 (not c!66173)) b!575930))

(assert (= (or b!575927 b!575930) bm!32714))

(declare-fun m!554919 () Bool)

(assert (=> b!575926 m!554919))

(assert (=> b!575926 m!554919))

(declare-fun m!554921 () Bool)

(assert (=> b!575926 m!554921))

(assert (=> b!575928 m!554919))

(assert (=> b!575928 m!554919))

(declare-fun m!554923 () Bool)

(assert (=> b!575928 m!554923))

(assert (=> b!575929 m!554919))

(assert (=> b!575929 m!554919))

(assert (=> b!575929 m!554923))

(assert (=> bm!32714 m!554919))

(declare-fun m!554925 () Bool)

(assert (=> bm!32714 m!554925))

(assert (=> b!575836 d!85313))

(declare-fun b!575931 () Bool)

(declare-fun lt!263500 () SeekEntryResult!5703)

(declare-fun e!331385 () SeekEntryResult!5703)

(assert (=> b!575931 (= e!331385 (seekKeyOrZeroReturnVacant!0 (x!53928 lt!263500) (index!25041 lt!263500) (index!25041 lt!263500) (select (arr!17254 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575932 () Bool)

(assert (=> b!575932 (= e!331385 (MissingZero!5703 (index!25041 lt!263500)))))

(declare-fun b!575934 () Bool)

(declare-fun e!331384 () SeekEntryResult!5703)

(assert (=> b!575934 (= e!331384 Undefined!5703)))

(declare-fun b!575935 () Bool)

(declare-fun e!331386 () SeekEntryResult!5703)

(assert (=> b!575935 (= e!331384 e!331386)))

(declare-fun lt!263499 () (_ BitVec 64))

(assert (=> b!575935 (= lt!263499 (select (arr!17254 a!3118) (index!25041 lt!263500)))))

(declare-fun c!66174 () Bool)

(assert (=> b!575935 (= c!66174 (= lt!263499 (select (arr!17254 a!3118) j!142)))))

(declare-fun b!575936 () Bool)

(declare-fun c!66175 () Bool)

(assert (=> b!575936 (= c!66175 (= lt!263499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575936 (= e!331386 e!331385)))

(declare-fun b!575933 () Bool)

(assert (=> b!575933 (= e!331386 (Found!5703 (index!25041 lt!263500)))))

(declare-fun d!85317 () Bool)

(declare-fun lt!263498 () SeekEntryResult!5703)

(assert (=> d!85317 (and (or ((_ is Undefined!5703) lt!263498) (not ((_ is Found!5703) lt!263498)) (and (bvsge (index!25040 lt!263498) #b00000000000000000000000000000000) (bvslt (index!25040 lt!263498) (size!17618 a!3118)))) (or ((_ is Undefined!5703) lt!263498) ((_ is Found!5703) lt!263498) (not ((_ is MissingZero!5703) lt!263498)) (and (bvsge (index!25039 lt!263498) #b00000000000000000000000000000000) (bvslt (index!25039 lt!263498) (size!17618 a!3118)))) (or ((_ is Undefined!5703) lt!263498) ((_ is Found!5703) lt!263498) ((_ is MissingZero!5703) lt!263498) (not ((_ is MissingVacant!5703) lt!263498)) (and (bvsge (index!25042 lt!263498) #b00000000000000000000000000000000) (bvslt (index!25042 lt!263498) (size!17618 a!3118)))) (or ((_ is Undefined!5703) lt!263498) (ite ((_ is Found!5703) lt!263498) (= (select (arr!17254 a!3118) (index!25040 lt!263498)) (select (arr!17254 a!3118) j!142)) (ite ((_ is MissingZero!5703) lt!263498) (= (select (arr!17254 a!3118) (index!25039 lt!263498)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5703) lt!263498) (= (select (arr!17254 a!3118) (index!25042 lt!263498)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85317 (= lt!263498 e!331384)))

(declare-fun c!66176 () Bool)

(assert (=> d!85317 (= c!66176 (and ((_ is Intermediate!5703) lt!263500) (undefined!6515 lt!263500)))))

(assert (=> d!85317 (= lt!263500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17254 a!3118) j!142) mask!3119) (select (arr!17254 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85317 (validMask!0 mask!3119)))

(assert (=> d!85317 (= (seekEntryOrOpen!0 (select (arr!17254 a!3118) j!142) a!3118 mask!3119) lt!263498)))

(assert (= (and d!85317 c!66176) b!575934))

(assert (= (and d!85317 (not c!66176)) b!575935))

(assert (= (and b!575935 c!66174) b!575933))

(assert (= (and b!575935 (not c!66174)) b!575936))

(assert (= (and b!575936 c!66175) b!575932))

(assert (= (and b!575936 (not c!66175)) b!575931))

(assert (=> b!575931 m!554821))

(declare-fun m!554927 () Bool)

(assert (=> b!575931 m!554927))

(declare-fun m!554929 () Bool)

(assert (=> b!575935 m!554929))

(assert (=> d!85317 m!554841))

(assert (=> d!85317 m!554821))

(declare-fun m!554931 () Bool)

(assert (=> d!85317 m!554931))

(assert (=> d!85317 m!554821))

(assert (=> d!85317 m!554841))

(assert (=> d!85317 m!554833))

(declare-fun m!554933 () Bool)

(assert (=> d!85317 m!554933))

(declare-fun m!554935 () Bool)

(assert (=> d!85317 m!554935))

(declare-fun m!554937 () Bool)

(assert (=> d!85317 m!554937))

(assert (=> b!575835 d!85317))

(declare-fun d!85319 () Bool)

(assert (=> d!85319 (= (validKeyInArray!0 (select (arr!17254 a!3118) j!142)) (and (not (= (select (arr!17254 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17254 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!575840 d!85319))

(declare-fun d!85321 () Bool)

(declare-fun res!364315 () Bool)

(declare-fun e!331397 () Bool)

(assert (=> d!85321 (=> res!364315 e!331397)))

(assert (=> d!85321 (= res!364315 (= (select (arr!17254 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85321 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!331397)))

(declare-fun b!575953 () Bool)

(declare-fun e!331398 () Bool)

(assert (=> b!575953 (= e!331397 e!331398)))

(declare-fun res!364316 () Bool)

(assert (=> b!575953 (=> (not res!364316) (not e!331398))))

(assert (=> b!575953 (= res!364316 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17618 a!3118)))))

(declare-fun b!575954 () Bool)

(assert (=> b!575954 (= e!331398 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85321 (not res!364315)) b!575953))

(assert (= (and b!575953 res!364316) b!575954))

(assert (=> d!85321 m!554919))

(declare-fun m!554939 () Bool)

(assert (=> b!575954 m!554939))

(assert (=> b!575834 d!85321))

(declare-fun d!85323 () Bool)

(declare-fun res!364333 () Bool)

(declare-fun e!331433 () Bool)

(assert (=> d!85323 (=> res!364333 e!331433)))

(assert (=> d!85323 (= res!364333 (bvsge j!142 (size!17618 a!3118)))))

(assert (=> d!85323 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331433)))

(declare-fun bm!32717 () Bool)

(declare-fun call!32720 () Bool)

(assert (=> bm!32717 (= call!32720 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576011 () Bool)

(declare-fun e!331431 () Bool)

(declare-fun e!331432 () Bool)

(assert (=> b!576011 (= e!331431 e!331432)))

(declare-fun lt!263528 () (_ BitVec 64))

(assert (=> b!576011 (= lt!263528 (select (arr!17254 a!3118) j!142))))

(declare-fun lt!263527 () Unit!18108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35943 (_ BitVec 64) (_ BitVec 32)) Unit!18108)

(assert (=> b!576011 (= lt!263527 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263528 j!142))))

(assert (=> b!576011 (arrayContainsKey!0 a!3118 lt!263528 #b00000000000000000000000000000000)))

(declare-fun lt!263529 () Unit!18108)

(assert (=> b!576011 (= lt!263529 lt!263527)))

(declare-fun res!364334 () Bool)

(assert (=> b!576011 (= res!364334 (= (seekEntryOrOpen!0 (select (arr!17254 a!3118) j!142) a!3118 mask!3119) (Found!5703 j!142)))))

(assert (=> b!576011 (=> (not res!364334) (not e!331432))))

(declare-fun b!576012 () Bool)

(assert (=> b!576012 (= e!331431 call!32720)))

(declare-fun b!576013 () Bool)

(assert (=> b!576013 (= e!331432 call!32720)))

(declare-fun b!576014 () Bool)

(assert (=> b!576014 (= e!331433 e!331431)))

(declare-fun c!66203 () Bool)

(assert (=> b!576014 (= c!66203 (validKeyInArray!0 (select (arr!17254 a!3118) j!142)))))

(assert (= (and d!85323 (not res!364333)) b!576014))

(assert (= (and b!576014 c!66203) b!576011))

(assert (= (and b!576014 (not c!66203)) b!576012))

(assert (= (and b!576011 res!364334) b!576013))

(assert (= (or b!576013 b!576012) bm!32717))

(declare-fun m!554983 () Bool)

(assert (=> bm!32717 m!554983))

(assert (=> b!576011 m!554821))

(declare-fun m!554985 () Bool)

(assert (=> b!576011 m!554985))

(declare-fun m!554987 () Bool)

(assert (=> b!576011 m!554987))

(assert (=> b!576011 m!554821))

(assert (=> b!576011 m!554827))

(assert (=> b!576014 m!554821))

(assert (=> b!576014 m!554821))

(assert (=> b!576014 m!554823))

(assert (=> b!575839 d!85323))

(declare-fun d!85335 () Bool)

(assert (=> d!85335 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263546 () Unit!18108)

(declare-fun choose!38 (array!35943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18108)

(assert (=> d!85335 (= lt!263546 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85335 (validMask!0 mask!3119)))

(assert (=> d!85335 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263546)))

(declare-fun bs!17801 () Bool)

(assert (= bs!17801 d!85335))

(assert (=> bs!17801 m!554817))

(declare-fun m!554989 () Bool)

(assert (=> bs!17801 m!554989))

(assert (=> bs!17801 m!554833))

(assert (=> b!575839 d!85335))

(declare-fun b!576073 () Bool)

(declare-fun e!331474 () SeekEntryResult!5703)

(declare-fun e!331473 () SeekEntryResult!5703)

(assert (=> b!576073 (= e!331474 e!331473)))

(declare-fun lt!263569 () (_ BitVec 64))

(declare-fun c!66223 () Bool)

(assert (=> b!576073 (= c!66223 (or (= lt!263569 (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!263569 lt!263569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!85341 () Bool)

(declare-fun e!331472 () Bool)

(assert (=> d!85341 e!331472))

(declare-fun c!66224 () Bool)

(declare-fun lt!263570 () SeekEntryResult!5703)

(assert (=> d!85341 (= c!66224 (and ((_ is Intermediate!5703) lt!263570) (undefined!6515 lt!263570)))))

(assert (=> d!85341 (= lt!263570 e!331474)))

(declare-fun c!66225 () Bool)

(assert (=> d!85341 (= c!66225 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85341 (= lt!263569 (select (arr!17254 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118))) lt!263457))))

(assert (=> d!85341 (validMask!0 mask!3119)))

(assert (=> d!85341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263457 (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)) mask!3119) lt!263570)))

(declare-fun b!576074 () Bool)

(declare-fun e!331475 () Bool)

(assert (=> b!576074 (= e!331472 e!331475)))

(declare-fun res!364357 () Bool)

(assert (=> b!576074 (= res!364357 (and ((_ is Intermediate!5703) lt!263570) (not (undefined!6515 lt!263570)) (bvslt (x!53928 lt!263570) #b01111111111111111111111111111110) (bvsge (x!53928 lt!263570) #b00000000000000000000000000000000) (bvsge (x!53928 lt!263570) #b00000000000000000000000000000000)))))

(assert (=> b!576074 (=> (not res!364357) (not e!331475))))

(declare-fun b!576075 () Bool)

(assert (=> b!576075 (and (bvsge (index!25041 lt!263570) #b00000000000000000000000000000000) (bvslt (index!25041 lt!263570) (size!17618 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)))))))

(declare-fun e!331471 () Bool)

(assert (=> b!576075 (= e!331471 (= (select (arr!17254 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118))) (index!25041 lt!263570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576076 () Bool)

(assert (=> b!576076 (= e!331472 (bvsge (x!53928 lt!263570) #b01111111111111111111111111111110))))

(declare-fun b!576077 () Bool)

(assert (=> b!576077 (= e!331474 (Intermediate!5703 true lt!263457 #b00000000000000000000000000000000))))

(declare-fun b!576078 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576078 (= e!331473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263457 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)) mask!3119))))

(declare-fun b!576079 () Bool)

(assert (=> b!576079 (and (bvsge (index!25041 lt!263570) #b00000000000000000000000000000000) (bvslt (index!25041 lt!263570) (size!17618 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)))))))

(declare-fun res!364358 () Bool)

(assert (=> b!576079 (= res!364358 (= (select (arr!17254 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118))) (index!25041 lt!263570)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576079 (=> res!364358 e!331471)))

(declare-fun b!576080 () Bool)

(assert (=> b!576080 (= e!331473 (Intermediate!5703 false lt!263457 #b00000000000000000000000000000000))))

(declare-fun b!576081 () Bool)

(assert (=> b!576081 (and (bvsge (index!25041 lt!263570) #b00000000000000000000000000000000) (bvslt (index!25041 lt!263570) (size!17618 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)))))))

(declare-fun res!364356 () Bool)

(assert (=> b!576081 (= res!364356 (= (select (arr!17254 (array!35944 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118))) (index!25041 lt!263570)) (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!576081 (=> res!364356 e!331471)))

(assert (=> b!576081 (= e!331475 e!331471)))

(assert (= (and d!85341 c!66225) b!576077))

(assert (= (and d!85341 (not c!66225)) b!576073))

(assert (= (and b!576073 c!66223) b!576080))

(assert (= (and b!576073 (not c!66223)) b!576078))

(assert (= (and d!85341 c!66224) b!576076))

(assert (= (and d!85341 (not c!66224)) b!576074))

(assert (= (and b!576074 res!364357) b!576081))

(assert (= (and b!576081 (not res!364356)) b!576079))

(assert (= (and b!576079 (not res!364358)) b!576075))

(declare-fun m!555021 () Bool)

(assert (=> b!576075 m!555021))

(declare-fun m!555023 () Bool)

(assert (=> d!85341 m!555023))

(assert (=> d!85341 m!554833))

(assert (=> b!576081 m!555021))

(declare-fun m!555025 () Bool)

(assert (=> b!576078 m!555025))

(assert (=> b!576078 m!555025))

(assert (=> b!576078 m!554843))

(declare-fun m!555027 () Bool)

(assert (=> b!576078 m!555027))

(assert (=> b!576079 m!555021))

(assert (=> b!575833 d!85341))

(declare-fun b!576082 () Bool)

(declare-fun e!331479 () SeekEntryResult!5703)

(declare-fun e!331478 () SeekEntryResult!5703)

(assert (=> b!576082 (= e!331479 e!331478)))

(declare-fun lt!263571 () (_ BitVec 64))

(declare-fun c!66226 () Bool)

(assert (=> b!576082 (= c!66226 (or (= lt!263571 (select (arr!17254 a!3118) j!142)) (= (bvadd lt!263571 lt!263571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!85353 () Bool)

(declare-fun e!331477 () Bool)

(assert (=> d!85353 e!331477))

(declare-fun c!66227 () Bool)

(declare-fun lt!263572 () SeekEntryResult!5703)

(assert (=> d!85353 (= c!66227 (and ((_ is Intermediate!5703) lt!263572) (undefined!6515 lt!263572)))))

(assert (=> d!85353 (= lt!263572 e!331479)))

(declare-fun c!66228 () Bool)

(assert (=> d!85353 (= c!66228 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85353 (= lt!263571 (select (arr!17254 a!3118) lt!263458))))

(assert (=> d!85353 (validMask!0 mask!3119)))

(assert (=> d!85353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263458 (select (arr!17254 a!3118) j!142) a!3118 mask!3119) lt!263572)))

(declare-fun b!576083 () Bool)

(declare-fun e!331480 () Bool)

(assert (=> b!576083 (= e!331477 e!331480)))

(declare-fun res!364360 () Bool)

(assert (=> b!576083 (= res!364360 (and ((_ is Intermediate!5703) lt!263572) (not (undefined!6515 lt!263572)) (bvslt (x!53928 lt!263572) #b01111111111111111111111111111110) (bvsge (x!53928 lt!263572) #b00000000000000000000000000000000) (bvsge (x!53928 lt!263572) #b00000000000000000000000000000000)))))

(assert (=> b!576083 (=> (not res!364360) (not e!331480))))

(declare-fun b!576084 () Bool)

(assert (=> b!576084 (and (bvsge (index!25041 lt!263572) #b00000000000000000000000000000000) (bvslt (index!25041 lt!263572) (size!17618 a!3118)))))

(declare-fun e!331476 () Bool)

(assert (=> b!576084 (= e!331476 (= (select (arr!17254 a!3118) (index!25041 lt!263572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576085 () Bool)

(assert (=> b!576085 (= e!331477 (bvsge (x!53928 lt!263572) #b01111111111111111111111111111110))))

(declare-fun b!576086 () Bool)

(assert (=> b!576086 (= e!331479 (Intermediate!5703 true lt!263458 #b00000000000000000000000000000000))))

(declare-fun b!576087 () Bool)

(assert (=> b!576087 (= e!331478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263458 #b00000000000000000000000000000000 mask!3119) (select (arr!17254 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576088 () Bool)

(assert (=> b!576088 (and (bvsge (index!25041 lt!263572) #b00000000000000000000000000000000) (bvslt (index!25041 lt!263572) (size!17618 a!3118)))))

(declare-fun res!364361 () Bool)

(assert (=> b!576088 (= res!364361 (= (select (arr!17254 a!3118) (index!25041 lt!263572)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576088 (=> res!364361 e!331476)))

(declare-fun b!576089 () Bool)

(assert (=> b!576089 (= e!331478 (Intermediate!5703 false lt!263458 #b00000000000000000000000000000000))))

(declare-fun b!576090 () Bool)

(assert (=> b!576090 (and (bvsge (index!25041 lt!263572) #b00000000000000000000000000000000) (bvslt (index!25041 lt!263572) (size!17618 a!3118)))))

(declare-fun res!364359 () Bool)

(assert (=> b!576090 (= res!364359 (= (select (arr!17254 a!3118) (index!25041 lt!263572)) (select (arr!17254 a!3118) j!142)))))

(assert (=> b!576090 (=> res!364359 e!331476)))

(assert (=> b!576090 (= e!331480 e!331476)))

(assert (= (and d!85353 c!66228) b!576086))

(assert (= (and d!85353 (not c!66228)) b!576082))

(assert (= (and b!576082 c!66226) b!576089))

(assert (= (and b!576082 (not c!66226)) b!576087))

(assert (= (and d!85353 c!66227) b!576085))

(assert (= (and d!85353 (not c!66227)) b!576083))

(assert (= (and b!576083 res!364360) b!576090))

(assert (= (and b!576090 (not res!364359)) b!576088))

(assert (= (and b!576088 (not res!364361)) b!576084))

(declare-fun m!555031 () Bool)

(assert (=> b!576084 m!555031))

(declare-fun m!555035 () Bool)

(assert (=> d!85353 m!555035))

(assert (=> d!85353 m!554833))

(assert (=> b!576090 m!555031))

(declare-fun m!555039 () Bool)

(assert (=> b!576087 m!555039))

(assert (=> b!576087 m!555039))

(assert (=> b!576087 m!554821))

(declare-fun m!555045 () Bool)

(assert (=> b!576087 m!555045))

(assert (=> b!576088 m!555031))

(assert (=> b!575833 d!85353))

(declare-fun d!85359 () Bool)

(declare-fun lt!263588 () (_ BitVec 32))

(declare-fun lt!263587 () (_ BitVec 32))

(assert (=> d!85359 (= lt!263588 (bvmul (bvxor lt!263587 (bvlshr lt!263587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85359 (= lt!263587 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85359 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364364 (let ((h!12372 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53933 (bvmul (bvxor h!12372 (bvlshr h!12372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53933 (bvlshr x!53933 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364364 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364364 #b00000000000000000000000000000000))))))

(assert (=> d!85359 (= (toIndex!0 (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!263588 (bvlshr lt!263588 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!575833 d!85359))

(declare-fun d!85365 () Bool)

(declare-fun lt!263590 () (_ BitVec 32))

(declare-fun lt!263589 () (_ BitVec 32))

(assert (=> d!85365 (= lt!263590 (bvmul (bvxor lt!263589 (bvlshr lt!263589 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85365 (= lt!263589 ((_ extract 31 0) (bvand (bvxor (select (arr!17254 a!3118) j!142) (bvlshr (select (arr!17254 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85365 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364364 (let ((h!12372 ((_ extract 31 0) (bvand (bvxor (select (arr!17254 a!3118) j!142) (bvlshr (select (arr!17254 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53933 (bvmul (bvxor h!12372 (bvlshr h!12372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53933 (bvlshr x!53933 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364364 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364364 #b00000000000000000000000000000000))))))

(assert (=> d!85365 (= (toIndex!0 (select (arr!17254 a!3118) j!142) mask!3119) (bvand (bvxor lt!263590 (bvlshr lt!263590 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!575833 d!85365))

(declare-fun d!85367 () Bool)

(assert (=> d!85367 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!575838 d!85367))

(declare-fun d!85369 () Bool)

(assert (=> d!85369 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52798 d!85369))

(declare-fun d!85387 () Bool)

(assert (=> d!85387 (= (array_inv!13050 a!3118) (bvsge (size!17618 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52798 d!85387))

(declare-fun d!85389 () Bool)

(declare-fun res!364384 () Bool)

(declare-fun e!331515 () Bool)

(assert (=> d!85389 (=> res!364384 e!331515)))

(assert (=> d!85389 (= res!364384 (bvsge #b00000000000000000000000000000000 (size!17618 a!3118)))))

(assert (=> d!85389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331515)))

(declare-fun bm!32723 () Bool)

(declare-fun call!32726 () Bool)

(assert (=> bm!32723 (= call!32726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576143 () Bool)

(declare-fun e!331513 () Bool)

(declare-fun e!331514 () Bool)

(assert (=> b!576143 (= e!331513 e!331514)))

(declare-fun lt!263604 () (_ BitVec 64))

(assert (=> b!576143 (= lt!263604 (select (arr!17254 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263603 () Unit!18108)

(assert (=> b!576143 (= lt!263603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263604 #b00000000000000000000000000000000))))

(assert (=> b!576143 (arrayContainsKey!0 a!3118 lt!263604 #b00000000000000000000000000000000)))

(declare-fun lt!263605 () Unit!18108)

(assert (=> b!576143 (= lt!263605 lt!263603)))

(declare-fun res!364385 () Bool)

(assert (=> b!576143 (= res!364385 (= (seekEntryOrOpen!0 (select (arr!17254 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5703 #b00000000000000000000000000000000)))))

(assert (=> b!576143 (=> (not res!364385) (not e!331514))))

(declare-fun b!576144 () Bool)

(assert (=> b!576144 (= e!331513 call!32726)))

(declare-fun b!576145 () Bool)

(assert (=> b!576145 (= e!331514 call!32726)))

(declare-fun b!576146 () Bool)

(assert (=> b!576146 (= e!331515 e!331513)))

(declare-fun c!66245 () Bool)

(assert (=> b!576146 (= c!66245 (validKeyInArray!0 (select (arr!17254 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85389 (not res!364384)) b!576146))

(assert (= (and b!576146 c!66245) b!576143))

(assert (= (and b!576146 (not c!66245)) b!576144))

(assert (= (and b!576143 res!364385) b!576145))

(assert (= (or b!576145 b!576144) bm!32723))

(declare-fun m!555081 () Bool)

(assert (=> bm!32723 m!555081))

(assert (=> b!576143 m!554919))

(declare-fun m!555083 () Bool)

(assert (=> b!576143 m!555083))

(declare-fun m!555085 () Bool)

(assert (=> b!576143 m!555085))

(assert (=> b!576143 m!554919))

(declare-fun m!555087 () Bool)

(assert (=> b!576143 m!555087))

(assert (=> b!576146 m!554919))

(assert (=> b!576146 m!554919))

(assert (=> b!576146 m!554923))

(assert (=> b!575832 d!85389))

(check-sat (not b!576014) (not bm!32714) (not b!575954) (not bm!32717) (not b!575910) (not b!575931) (not b!576011) (not d!85341) (not b!576087) (not bm!32723) (not d!85353) (not b!576146) (not b!576078) (not b!575929) (not b!576143) (not d!85303) (not b!575926) (not d!85317) (not d!85335) (not b!575928))
(check-sat)
