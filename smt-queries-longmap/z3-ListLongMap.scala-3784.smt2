; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51746 () Bool)

(assert start!51746)

(declare-fun lt!257856 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5527 0))(
  ( (MissingZero!5527 (index!24335 (_ BitVec 32))) (Found!5527 (index!24336 (_ BitVec 32))) (Intermediate!5527 (undefined!6339 Bool) (index!24337 (_ BitVec 32)) (x!53207 (_ BitVec 32))) (Undefined!5527) (MissingVacant!5527 (index!24338 (_ BitVec 32))) )
))
(declare-fun lt!257853 () SeekEntryResult!5527)

(declare-fun e!325758 () Bool)

(declare-fun b!566092 () Bool)

(declare-datatypes ((array!35563 0))(
  ( (array!35564 (arr!17081 (Array (_ BitVec 32) (_ BitVec 64))) (size!17446 (_ BitVec 32))) )
))
(declare-fun lt!257854 () array!35563)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35563 (_ BitVec 32)) SeekEntryResult!5527)

(assert (=> b!566092 (= e!325758 (= lt!257853 (seekEntryOrOpen!0 lt!257856 lt!257854 mask!3119)))))

(declare-fun res!357203 () Bool)

(declare-fun e!325757 () Bool)

(assert (=> start!51746 (=> (not res!357203) (not e!325757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51746 (= res!357203 (validMask!0 mask!3119))))

(assert (=> start!51746 e!325757))

(assert (=> start!51746 true))

(declare-fun a!3118 () array!35563)

(declare-fun array_inv!12964 (array!35563) Bool)

(assert (=> start!51746 (array_inv!12964 a!3118)))

(declare-fun b!566093 () Bool)

(declare-fun res!357212 () Bool)

(assert (=> b!566093 (=> (not res!357212) (not e!325757))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566093 (= res!357212 (validKeyInArray!0 k0!1914))))

(declare-fun b!566094 () Bool)

(declare-fun res!357205 () Bool)

(assert (=> b!566094 (=> (not res!357205) (not e!325757))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!566094 (= res!357205 (validKeyInArray!0 (select (arr!17081 a!3118) j!142)))))

(declare-fun b!566095 () Bool)

(declare-fun res!357209 () Bool)

(assert (=> b!566095 (=> (not res!357209) (not e!325757))))

(declare-fun arrayContainsKey!0 (array!35563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566095 (= res!357209 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566096 () Bool)

(declare-fun res!357204 () Bool)

(declare-fun e!325759 () Bool)

(assert (=> b!566096 (=> (not res!357204) (not e!325759))))

(declare-datatypes ((List!11200 0))(
  ( (Nil!11197) (Cons!11196 (h!12202 (_ BitVec 64)) (t!17419 List!11200)) )
))
(declare-fun arrayNoDuplicates!0 (array!35563 (_ BitVec 32) List!11200) Bool)

(assert (=> b!566096 (= res!357204 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11197))))

(declare-fun b!566097 () Bool)

(declare-fun res!357206 () Bool)

(assert (=> b!566097 (=> (not res!357206) (not e!325757))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566097 (= res!357206 (and (= (size!17446 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17446 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17446 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566098 () Bool)

(declare-fun e!325760 () Bool)

(assert (=> b!566098 (= e!325760 (not e!325758))))

(declare-fun res!357211 () Bool)

(assert (=> b!566098 (=> res!357211 e!325758)))

(declare-fun lt!257857 () SeekEntryResult!5527)

(get-info :version)

(assert (=> b!566098 (= res!357211 (or (not ((_ is Intermediate!5527) lt!257857)) (not (undefined!6339 lt!257857))))))

(assert (=> b!566098 (= lt!257853 (Found!5527 j!142))))

(assert (=> b!566098 (= lt!257853 (seekEntryOrOpen!0 (select (arr!17081 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35563 (_ BitVec 32)) Bool)

(assert (=> b!566098 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17742 0))(
  ( (Unit!17743) )
))
(declare-fun lt!257852 () Unit!17742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17742)

(assert (=> b!566098 (= lt!257852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566099 () Bool)

(declare-fun res!357207 () Bool)

(assert (=> b!566099 (=> (not res!357207) (not e!325759))))

(assert (=> b!566099 (= res!357207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566100 () Bool)

(assert (=> b!566100 (= e!325757 e!325759)))

(declare-fun res!357208 () Bool)

(assert (=> b!566100 (=> (not res!357208) (not e!325759))))

(declare-fun lt!257850 () SeekEntryResult!5527)

(assert (=> b!566100 (= res!357208 (or (= lt!257850 (MissingZero!5527 i!1132)) (= lt!257850 (MissingVacant!5527 i!1132))))))

(assert (=> b!566100 (= lt!257850 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566101 () Bool)

(assert (=> b!566101 (= e!325759 e!325760)))

(declare-fun res!357210 () Bool)

(assert (=> b!566101 (=> (not res!357210) (not e!325760))))

(declare-fun lt!257855 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35563 (_ BitVec 32)) SeekEntryResult!5527)

(assert (=> b!566101 (= res!357210 (= lt!257857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257855 lt!257856 lt!257854 mask!3119)))))

(declare-fun lt!257851 () (_ BitVec 32))

(assert (=> b!566101 (= lt!257857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257851 (select (arr!17081 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566101 (= lt!257855 (toIndex!0 lt!257856 mask!3119))))

(assert (=> b!566101 (= lt!257856 (select (store (arr!17081 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!566101 (= lt!257851 (toIndex!0 (select (arr!17081 a!3118) j!142) mask!3119))))

(assert (=> b!566101 (= lt!257854 (array!35564 (store (arr!17081 a!3118) i!1132 k0!1914) (size!17446 a!3118)))))

(assert (= (and start!51746 res!357203) b!566097))

(assert (= (and b!566097 res!357206) b!566094))

(assert (= (and b!566094 res!357205) b!566093))

(assert (= (and b!566093 res!357212) b!566095))

(assert (= (and b!566095 res!357209) b!566100))

(assert (= (and b!566100 res!357208) b!566099))

(assert (= (and b!566099 res!357207) b!566096))

(assert (= (and b!566096 res!357204) b!566101))

(assert (= (and b!566101 res!357210) b!566098))

(assert (= (and b!566098 (not res!357211)) b!566092))

(declare-fun m!544235 () Bool)

(assert (=> b!566092 m!544235))

(declare-fun m!544237 () Bool)

(assert (=> b!566099 m!544237))

(declare-fun m!544239 () Bool)

(assert (=> b!566101 m!544239))

(declare-fun m!544241 () Bool)

(assert (=> b!566101 m!544241))

(assert (=> b!566101 m!544239))

(declare-fun m!544243 () Bool)

(assert (=> b!566101 m!544243))

(assert (=> b!566101 m!544239))

(declare-fun m!544245 () Bool)

(assert (=> b!566101 m!544245))

(declare-fun m!544247 () Bool)

(assert (=> b!566101 m!544247))

(declare-fun m!544249 () Bool)

(assert (=> b!566101 m!544249))

(declare-fun m!544251 () Bool)

(assert (=> b!566101 m!544251))

(declare-fun m!544253 () Bool)

(assert (=> start!51746 m!544253))

(declare-fun m!544255 () Bool)

(assert (=> start!51746 m!544255))

(declare-fun m!544257 () Bool)

(assert (=> b!566100 m!544257))

(declare-fun m!544259 () Bool)

(assert (=> b!566093 m!544259))

(declare-fun m!544261 () Bool)

(assert (=> b!566096 m!544261))

(declare-fun m!544263 () Bool)

(assert (=> b!566095 m!544263))

(assert (=> b!566094 m!544239))

(assert (=> b!566094 m!544239))

(declare-fun m!544265 () Bool)

(assert (=> b!566094 m!544265))

(assert (=> b!566098 m!544239))

(assert (=> b!566098 m!544239))

(declare-fun m!544267 () Bool)

(assert (=> b!566098 m!544267))

(declare-fun m!544269 () Bool)

(assert (=> b!566098 m!544269))

(declare-fun m!544271 () Bool)

(assert (=> b!566098 m!544271))

(check-sat (not b!566100) (not b!566101) (not b!566095) (not start!51746) (not b!566092) (not b!566098) (not b!566096) (not b!566099) (not b!566093) (not b!566094))
(check-sat)
(get-model)

(declare-fun d!83883 () Bool)

(declare-fun lt!257913 () SeekEntryResult!5527)

(assert (=> d!83883 (and (or ((_ is Undefined!5527) lt!257913) (not ((_ is Found!5527) lt!257913)) (and (bvsge (index!24336 lt!257913) #b00000000000000000000000000000000) (bvslt (index!24336 lt!257913) (size!17446 lt!257854)))) (or ((_ is Undefined!5527) lt!257913) ((_ is Found!5527) lt!257913) (not ((_ is MissingZero!5527) lt!257913)) (and (bvsge (index!24335 lt!257913) #b00000000000000000000000000000000) (bvslt (index!24335 lt!257913) (size!17446 lt!257854)))) (or ((_ is Undefined!5527) lt!257913) ((_ is Found!5527) lt!257913) ((_ is MissingZero!5527) lt!257913) (not ((_ is MissingVacant!5527) lt!257913)) (and (bvsge (index!24338 lt!257913) #b00000000000000000000000000000000) (bvslt (index!24338 lt!257913) (size!17446 lt!257854)))) (or ((_ is Undefined!5527) lt!257913) (ite ((_ is Found!5527) lt!257913) (= (select (arr!17081 lt!257854) (index!24336 lt!257913)) lt!257856) (ite ((_ is MissingZero!5527) lt!257913) (= (select (arr!17081 lt!257854) (index!24335 lt!257913)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5527) lt!257913) (= (select (arr!17081 lt!257854) (index!24338 lt!257913)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325800 () SeekEntryResult!5527)

(assert (=> d!83883 (= lt!257913 e!325800)))

(declare-fun c!64800 () Bool)

(declare-fun lt!257914 () SeekEntryResult!5527)

(assert (=> d!83883 (= c!64800 (and ((_ is Intermediate!5527) lt!257914) (undefined!6339 lt!257914)))))

(assert (=> d!83883 (= lt!257914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!257856 mask!3119) lt!257856 lt!257854 mask!3119))))

(assert (=> d!83883 (validMask!0 mask!3119)))

(assert (=> d!83883 (= (seekEntryOrOpen!0 lt!257856 lt!257854 mask!3119) lt!257913)))

(declare-fun e!325799 () SeekEntryResult!5527)

(declare-fun b!566174 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35563 (_ BitVec 32)) SeekEntryResult!5527)

(assert (=> b!566174 (= e!325799 (seekKeyOrZeroReturnVacant!0 (x!53207 lt!257914) (index!24337 lt!257914) (index!24337 lt!257914) lt!257856 lt!257854 mask!3119))))

(declare-fun b!566175 () Bool)

(declare-fun e!325798 () SeekEntryResult!5527)

(assert (=> b!566175 (= e!325798 (Found!5527 (index!24337 lt!257914)))))

(declare-fun b!566176 () Bool)

(assert (=> b!566176 (= e!325800 Undefined!5527)))

(declare-fun b!566177 () Bool)

(declare-fun c!64798 () Bool)

(declare-fun lt!257912 () (_ BitVec 64))

(assert (=> b!566177 (= c!64798 (= lt!257912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566177 (= e!325798 e!325799)))

(declare-fun b!566178 () Bool)

(assert (=> b!566178 (= e!325800 e!325798)))

(assert (=> b!566178 (= lt!257912 (select (arr!17081 lt!257854) (index!24337 lt!257914)))))

(declare-fun c!64799 () Bool)

(assert (=> b!566178 (= c!64799 (= lt!257912 lt!257856))))

(declare-fun b!566179 () Bool)

(assert (=> b!566179 (= e!325799 (MissingZero!5527 (index!24337 lt!257914)))))

(assert (= (and d!83883 c!64800) b!566176))

(assert (= (and d!83883 (not c!64800)) b!566178))

(assert (= (and b!566178 c!64799) b!566175))

(assert (= (and b!566178 (not c!64799)) b!566177))

(assert (= (and b!566177 c!64798) b!566179))

(assert (= (and b!566177 (not c!64798)) b!566174))

(assert (=> d!83883 m!544253))

(declare-fun m!544349 () Bool)

(assert (=> d!83883 m!544349))

(assert (=> d!83883 m!544247))

(assert (=> d!83883 m!544247))

(declare-fun m!544351 () Bool)

(assert (=> d!83883 m!544351))

(declare-fun m!544353 () Bool)

(assert (=> d!83883 m!544353))

(declare-fun m!544355 () Bool)

(assert (=> d!83883 m!544355))

(declare-fun m!544357 () Bool)

(assert (=> b!566174 m!544357))

(declare-fun m!544359 () Bool)

(assert (=> b!566178 m!544359))

(assert (=> b!566092 d!83883))

(declare-fun d!83887 () Bool)

(assert (=> d!83887 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51746 d!83887))

(declare-fun d!83895 () Bool)

(assert (=> d!83895 (= (array_inv!12964 a!3118) (bvsge (size!17446 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51746 d!83895))

(declare-fun d!83897 () Bool)

(assert (=> d!83897 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566093 d!83897))

(declare-fun d!83899 () Bool)

(declare-fun lt!257916 () SeekEntryResult!5527)

(assert (=> d!83899 (and (or ((_ is Undefined!5527) lt!257916) (not ((_ is Found!5527) lt!257916)) (and (bvsge (index!24336 lt!257916) #b00000000000000000000000000000000) (bvslt (index!24336 lt!257916) (size!17446 a!3118)))) (or ((_ is Undefined!5527) lt!257916) ((_ is Found!5527) lt!257916) (not ((_ is MissingZero!5527) lt!257916)) (and (bvsge (index!24335 lt!257916) #b00000000000000000000000000000000) (bvslt (index!24335 lt!257916) (size!17446 a!3118)))) (or ((_ is Undefined!5527) lt!257916) ((_ is Found!5527) lt!257916) ((_ is MissingZero!5527) lt!257916) (not ((_ is MissingVacant!5527) lt!257916)) (and (bvsge (index!24338 lt!257916) #b00000000000000000000000000000000) (bvslt (index!24338 lt!257916) (size!17446 a!3118)))) (or ((_ is Undefined!5527) lt!257916) (ite ((_ is Found!5527) lt!257916) (= (select (arr!17081 a!3118) (index!24336 lt!257916)) (select (arr!17081 a!3118) j!142)) (ite ((_ is MissingZero!5527) lt!257916) (= (select (arr!17081 a!3118) (index!24335 lt!257916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5527) lt!257916) (= (select (arr!17081 a!3118) (index!24338 lt!257916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325809 () SeekEntryResult!5527)

(assert (=> d!83899 (= lt!257916 e!325809)))

(declare-fun c!64803 () Bool)

(declare-fun lt!257917 () SeekEntryResult!5527)

(assert (=> d!83899 (= c!64803 (and ((_ is Intermediate!5527) lt!257917) (undefined!6339 lt!257917)))))

(assert (=> d!83899 (= lt!257917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17081 a!3118) j!142) mask!3119) (select (arr!17081 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83899 (validMask!0 mask!3119)))

(assert (=> d!83899 (= (seekEntryOrOpen!0 (select (arr!17081 a!3118) j!142) a!3118 mask!3119) lt!257916)))

(declare-fun e!325808 () SeekEntryResult!5527)

(declare-fun b!566186 () Bool)

(assert (=> b!566186 (= e!325808 (seekKeyOrZeroReturnVacant!0 (x!53207 lt!257917) (index!24337 lt!257917) (index!24337 lt!257917) (select (arr!17081 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566187 () Bool)

(declare-fun e!325807 () SeekEntryResult!5527)

(assert (=> b!566187 (= e!325807 (Found!5527 (index!24337 lt!257917)))))

(declare-fun b!566188 () Bool)

(assert (=> b!566188 (= e!325809 Undefined!5527)))

(declare-fun b!566189 () Bool)

(declare-fun c!64801 () Bool)

(declare-fun lt!257915 () (_ BitVec 64))

(assert (=> b!566189 (= c!64801 (= lt!257915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566189 (= e!325807 e!325808)))

(declare-fun b!566190 () Bool)

(assert (=> b!566190 (= e!325809 e!325807)))

(assert (=> b!566190 (= lt!257915 (select (arr!17081 a!3118) (index!24337 lt!257917)))))

(declare-fun c!64802 () Bool)

(assert (=> b!566190 (= c!64802 (= lt!257915 (select (arr!17081 a!3118) j!142)))))

(declare-fun b!566191 () Bool)

(assert (=> b!566191 (= e!325808 (MissingZero!5527 (index!24337 lt!257917)))))

(assert (= (and d!83899 c!64803) b!566188))

(assert (= (and d!83899 (not c!64803)) b!566190))

(assert (= (and b!566190 c!64802) b!566187))

(assert (= (and b!566190 (not c!64802)) b!566189))

(assert (= (and b!566189 c!64801) b!566191))

(assert (= (and b!566189 (not c!64801)) b!566186))

(assert (=> d!83899 m!544253))

(declare-fun m!544365 () Bool)

(assert (=> d!83899 m!544365))

(assert (=> d!83899 m!544239))

(assert (=> d!83899 m!544241))

(assert (=> d!83899 m!544241))

(assert (=> d!83899 m!544239))

(declare-fun m!544367 () Bool)

(assert (=> d!83899 m!544367))

(declare-fun m!544369 () Bool)

(assert (=> d!83899 m!544369))

(declare-fun m!544371 () Bool)

(assert (=> d!83899 m!544371))

(assert (=> b!566186 m!544239))

(declare-fun m!544373 () Bool)

(assert (=> b!566186 m!544373))

(declare-fun m!544375 () Bool)

(assert (=> b!566190 m!544375))

(assert (=> b!566098 d!83899))

(declare-fun b!566218 () Bool)

(declare-fun e!325826 () Bool)

(declare-fun e!325827 () Bool)

(assert (=> b!566218 (= e!325826 e!325827)))

(declare-fun lt!257929 () (_ BitVec 64))

(assert (=> b!566218 (= lt!257929 (select (arr!17081 a!3118) j!142))))

(declare-fun lt!257930 () Unit!17742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35563 (_ BitVec 64) (_ BitVec 32)) Unit!17742)

(assert (=> b!566218 (= lt!257930 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257929 j!142))))

(assert (=> b!566218 (arrayContainsKey!0 a!3118 lt!257929 #b00000000000000000000000000000000)))

(declare-fun lt!257928 () Unit!17742)

(assert (=> b!566218 (= lt!257928 lt!257930)))

(declare-fun res!357290 () Bool)

(assert (=> b!566218 (= res!357290 (= (seekEntryOrOpen!0 (select (arr!17081 a!3118) j!142) a!3118 mask!3119) (Found!5527 j!142)))))

(assert (=> b!566218 (=> (not res!357290) (not e!325827))))

(declare-fun b!566219 () Bool)

(declare-fun call!32455 () Bool)

(assert (=> b!566219 (= e!325826 call!32455)))

(declare-fun bm!32452 () Bool)

(assert (=> bm!32452 (= call!32455 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566220 () Bool)

(assert (=> b!566220 (= e!325827 call!32455)))

(declare-fun b!566221 () Bool)

(declare-fun e!325828 () Bool)

(assert (=> b!566221 (= e!325828 e!325826)))

(declare-fun c!64812 () Bool)

(assert (=> b!566221 (= c!64812 (validKeyInArray!0 (select (arr!17081 a!3118) j!142)))))

(declare-fun d!83901 () Bool)

(declare-fun res!357289 () Bool)

(assert (=> d!83901 (=> res!357289 e!325828)))

(assert (=> d!83901 (= res!357289 (bvsge j!142 (size!17446 a!3118)))))

(assert (=> d!83901 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325828)))

(assert (= (and d!83901 (not res!357289)) b!566221))

(assert (= (and b!566221 c!64812) b!566218))

(assert (= (and b!566221 (not c!64812)) b!566219))

(assert (= (and b!566218 res!357290) b!566220))

(assert (= (or b!566220 b!566219) bm!32452))

(assert (=> b!566218 m!544239))

(declare-fun m!544377 () Bool)

(assert (=> b!566218 m!544377))

(declare-fun m!544379 () Bool)

(assert (=> b!566218 m!544379))

(assert (=> b!566218 m!544239))

(assert (=> b!566218 m!544267))

(declare-fun m!544381 () Bool)

(assert (=> bm!32452 m!544381))

(assert (=> b!566221 m!544239))

(assert (=> b!566221 m!544239))

(assert (=> b!566221 m!544265))

(assert (=> b!566098 d!83901))

(declare-fun d!83903 () Bool)

(assert (=> d!83903 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257943 () Unit!17742)

(declare-fun choose!38 (array!35563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17742)

(assert (=> d!83903 (= lt!257943 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83903 (validMask!0 mask!3119)))

(assert (=> d!83903 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!257943)))

(declare-fun bs!17566 () Bool)

(assert (= bs!17566 d!83903))

(assert (=> bs!17566 m!544269))

(declare-fun m!544399 () Bool)

(assert (=> bs!17566 m!544399))

(assert (=> bs!17566 m!544253))

(assert (=> b!566098 d!83903))

(declare-fun d!83909 () Bool)

(declare-fun lt!257945 () SeekEntryResult!5527)

(assert (=> d!83909 (and (or ((_ is Undefined!5527) lt!257945) (not ((_ is Found!5527) lt!257945)) (and (bvsge (index!24336 lt!257945) #b00000000000000000000000000000000) (bvslt (index!24336 lt!257945) (size!17446 a!3118)))) (or ((_ is Undefined!5527) lt!257945) ((_ is Found!5527) lt!257945) (not ((_ is MissingZero!5527) lt!257945)) (and (bvsge (index!24335 lt!257945) #b00000000000000000000000000000000) (bvslt (index!24335 lt!257945) (size!17446 a!3118)))) (or ((_ is Undefined!5527) lt!257945) ((_ is Found!5527) lt!257945) ((_ is MissingZero!5527) lt!257945) (not ((_ is MissingVacant!5527) lt!257945)) (and (bvsge (index!24338 lt!257945) #b00000000000000000000000000000000) (bvslt (index!24338 lt!257945) (size!17446 a!3118)))) (or ((_ is Undefined!5527) lt!257945) (ite ((_ is Found!5527) lt!257945) (= (select (arr!17081 a!3118) (index!24336 lt!257945)) k0!1914) (ite ((_ is MissingZero!5527) lt!257945) (= (select (arr!17081 a!3118) (index!24335 lt!257945)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5527) lt!257945) (= (select (arr!17081 a!3118) (index!24338 lt!257945)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325847 () SeekEntryResult!5527)

(assert (=> d!83909 (= lt!257945 e!325847)))

(declare-fun c!64827 () Bool)

(declare-fun lt!257946 () SeekEntryResult!5527)

(assert (=> d!83909 (= c!64827 (and ((_ is Intermediate!5527) lt!257946) (undefined!6339 lt!257946)))))

(assert (=> d!83909 (= lt!257946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83909 (validMask!0 mask!3119)))

(assert (=> d!83909 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!257945)))

(declare-fun e!325846 () SeekEntryResult!5527)

(declare-fun b!566252 () Bool)

(assert (=> b!566252 (= e!325846 (seekKeyOrZeroReturnVacant!0 (x!53207 lt!257946) (index!24337 lt!257946) (index!24337 lt!257946) k0!1914 a!3118 mask!3119))))

(declare-fun b!566253 () Bool)

(declare-fun e!325845 () SeekEntryResult!5527)

(assert (=> b!566253 (= e!325845 (Found!5527 (index!24337 lt!257946)))))

(declare-fun b!566254 () Bool)

(assert (=> b!566254 (= e!325847 Undefined!5527)))

(declare-fun b!566255 () Bool)

(declare-fun c!64825 () Bool)

(declare-fun lt!257944 () (_ BitVec 64))

(assert (=> b!566255 (= c!64825 (= lt!257944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566255 (= e!325845 e!325846)))

(declare-fun b!566256 () Bool)

(assert (=> b!566256 (= e!325847 e!325845)))

(assert (=> b!566256 (= lt!257944 (select (arr!17081 a!3118) (index!24337 lt!257946)))))

(declare-fun c!64826 () Bool)

(assert (=> b!566256 (= c!64826 (= lt!257944 k0!1914))))

(declare-fun b!566257 () Bool)

(assert (=> b!566257 (= e!325846 (MissingZero!5527 (index!24337 lt!257946)))))

(assert (= (and d!83909 c!64827) b!566254))

(assert (= (and d!83909 (not c!64827)) b!566256))

(assert (= (and b!566256 c!64826) b!566253))

(assert (= (and b!566256 (not c!64826)) b!566255))

(assert (= (and b!566255 c!64825) b!566257))

(assert (= (and b!566255 (not c!64825)) b!566252))

(assert (=> d!83909 m!544253))

(declare-fun m!544401 () Bool)

(assert (=> d!83909 m!544401))

(declare-fun m!544405 () Bool)

(assert (=> d!83909 m!544405))

(assert (=> d!83909 m!544405))

(declare-fun m!544409 () Bool)

(assert (=> d!83909 m!544409))

(declare-fun m!544411 () Bool)

(assert (=> d!83909 m!544411))

(declare-fun m!544413 () Bool)

(assert (=> d!83909 m!544413))

(declare-fun m!544417 () Bool)

(assert (=> b!566252 m!544417))

(declare-fun m!544421 () Bool)

(assert (=> b!566256 m!544421))

(assert (=> b!566100 d!83909))

(declare-fun d!83911 () Bool)

(assert (=> d!83911 (= (validKeyInArray!0 (select (arr!17081 a!3118) j!142)) (and (not (= (select (arr!17081 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17081 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566094 d!83911))

(declare-fun b!566264 () Bool)

(declare-fun e!325851 () Bool)

(declare-fun e!325852 () Bool)

(assert (=> b!566264 (= e!325851 e!325852)))

(declare-fun lt!257951 () (_ BitVec 64))

(assert (=> b!566264 (= lt!257951 (select (arr!17081 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!257952 () Unit!17742)

(assert (=> b!566264 (= lt!257952 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257951 #b00000000000000000000000000000000))))

(assert (=> b!566264 (arrayContainsKey!0 a!3118 lt!257951 #b00000000000000000000000000000000)))

(declare-fun lt!257950 () Unit!17742)

(assert (=> b!566264 (= lt!257950 lt!257952)))

(declare-fun res!357299 () Bool)

(assert (=> b!566264 (= res!357299 (= (seekEntryOrOpen!0 (select (arr!17081 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5527 #b00000000000000000000000000000000)))))

(assert (=> b!566264 (=> (not res!357299) (not e!325852))))

(declare-fun b!566265 () Bool)

(declare-fun call!32456 () Bool)

(assert (=> b!566265 (= e!325851 call!32456)))

(declare-fun bm!32453 () Bool)

(assert (=> bm!32453 (= call!32456 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566266 () Bool)

(assert (=> b!566266 (= e!325852 call!32456)))

(declare-fun b!566267 () Bool)

(declare-fun e!325853 () Bool)

(assert (=> b!566267 (= e!325853 e!325851)))

(declare-fun c!64831 () Bool)

(assert (=> b!566267 (= c!64831 (validKeyInArray!0 (select (arr!17081 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83915 () Bool)

(declare-fun res!357298 () Bool)

(assert (=> d!83915 (=> res!357298 e!325853)))

(assert (=> d!83915 (= res!357298 (bvsge #b00000000000000000000000000000000 (size!17446 a!3118)))))

(assert (=> d!83915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325853)))

(assert (= (and d!83915 (not res!357298)) b!566267))

(assert (= (and b!566267 c!64831) b!566264))

(assert (= (and b!566267 (not c!64831)) b!566265))

(assert (= (and b!566264 res!357299) b!566266))

(assert (= (or b!566266 b!566265) bm!32453))

(declare-fun m!544427 () Bool)

(assert (=> b!566264 m!544427))

(declare-fun m!544429 () Bool)

(assert (=> b!566264 m!544429))

(declare-fun m!544431 () Bool)

(assert (=> b!566264 m!544431))

(assert (=> b!566264 m!544427))

(declare-fun m!544433 () Bool)

(assert (=> b!566264 m!544433))

(declare-fun m!544435 () Bool)

(assert (=> bm!32453 m!544435))

(assert (=> b!566267 m!544427))

(assert (=> b!566267 m!544427))

(declare-fun m!544437 () Bool)

(assert (=> b!566267 m!544437))

(assert (=> b!566099 d!83915))

(declare-fun b!566296 () Bool)

(declare-fun e!325879 () Bool)

(declare-fun e!325876 () Bool)

(assert (=> b!566296 (= e!325879 e!325876)))

(declare-fun c!64838 () Bool)

(assert (=> b!566296 (= c!64838 (validKeyInArray!0 (select (arr!17081 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32460 () Bool)

(declare-fun call!32463 () Bool)

(assert (=> bm!32460 (= call!32463 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64838 (Cons!11196 (select (arr!17081 a!3118) #b00000000000000000000000000000000) Nil!11197) Nil!11197)))))

(declare-fun b!566298 () Bool)

(declare-fun e!325877 () Bool)

(declare-fun contains!2845 (List!11200 (_ BitVec 64)) Bool)

(assert (=> b!566298 (= e!325877 (contains!2845 Nil!11197 (select (arr!17081 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566299 () Bool)

(assert (=> b!566299 (= e!325876 call!32463)))

(declare-fun b!566300 () Bool)

(assert (=> b!566300 (= e!325876 call!32463)))

(declare-fun b!566297 () Bool)

(declare-fun e!325878 () Bool)

(assert (=> b!566297 (= e!325878 e!325879)))

(declare-fun res!357316 () Bool)

(assert (=> b!566297 (=> (not res!357316) (not e!325879))))

(assert (=> b!566297 (= res!357316 (not e!325877))))

(declare-fun res!357317 () Bool)

(assert (=> b!566297 (=> (not res!357317) (not e!325877))))

(assert (=> b!566297 (= res!357317 (validKeyInArray!0 (select (arr!17081 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83917 () Bool)

(declare-fun res!357318 () Bool)

(assert (=> d!83917 (=> res!357318 e!325878)))

(assert (=> d!83917 (= res!357318 (bvsge #b00000000000000000000000000000000 (size!17446 a!3118)))))

(assert (=> d!83917 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11197) e!325878)))

(assert (= (and d!83917 (not res!357318)) b!566297))

(assert (= (and b!566297 res!357317) b!566298))

(assert (= (and b!566297 res!357316) b!566296))

(assert (= (and b!566296 c!64838) b!566300))

(assert (= (and b!566296 (not c!64838)) b!566299))

(assert (= (or b!566300 b!566299) bm!32460))

(assert (=> b!566296 m!544427))

(assert (=> b!566296 m!544427))

(assert (=> b!566296 m!544437))

(assert (=> bm!32460 m!544427))

(declare-fun m!544439 () Bool)

(assert (=> bm!32460 m!544439))

(assert (=> b!566298 m!544427))

(assert (=> b!566298 m!544427))

(declare-fun m!544441 () Bool)

(assert (=> b!566298 m!544441))

(assert (=> b!566297 m!544427))

(assert (=> b!566297 m!544427))

(assert (=> b!566297 m!544437))

(assert (=> b!566096 d!83917))

(declare-fun b!566346 () Bool)

(declare-fun lt!257986 () SeekEntryResult!5527)

(assert (=> b!566346 (and (bvsge (index!24337 lt!257986) #b00000000000000000000000000000000) (bvslt (index!24337 lt!257986) (size!17446 lt!257854)))))

(declare-fun res!357330 () Bool)

(assert (=> b!566346 (= res!357330 (= (select (arr!17081 lt!257854) (index!24337 lt!257986)) lt!257856))))

(declare-fun e!325908 () Bool)

(assert (=> b!566346 (=> res!357330 e!325908)))

(declare-fun e!325909 () Bool)

(assert (=> b!566346 (= e!325909 e!325908)))

(declare-fun b!566347 () Bool)

(assert (=> b!566347 (and (bvsge (index!24337 lt!257986) #b00000000000000000000000000000000) (bvslt (index!24337 lt!257986) (size!17446 lt!257854)))))

(declare-fun res!357331 () Bool)

(assert (=> b!566347 (= res!357331 (= (select (arr!17081 lt!257854) (index!24337 lt!257986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566347 (=> res!357331 e!325908)))

(declare-fun b!566348 () Bool)

(assert (=> b!566348 (and (bvsge (index!24337 lt!257986) #b00000000000000000000000000000000) (bvslt (index!24337 lt!257986) (size!17446 lt!257854)))))

(assert (=> b!566348 (= e!325908 (= (select (arr!17081 lt!257854) (index!24337 lt!257986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566350 () Bool)

(declare-fun e!325907 () SeekEntryResult!5527)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566350 (= e!325907 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!257855 #b00000000000000000000000000000000 mask!3119) lt!257856 lt!257854 mask!3119))))

(declare-fun b!566351 () Bool)

(assert (=> b!566351 (= e!325907 (Intermediate!5527 false lt!257855 #b00000000000000000000000000000000))))

(declare-fun b!566352 () Bool)

(declare-fun e!325906 () Bool)

(assert (=> b!566352 (= e!325906 e!325909)))

(declare-fun res!357332 () Bool)

(assert (=> b!566352 (= res!357332 (and ((_ is Intermediate!5527) lt!257986) (not (undefined!6339 lt!257986)) (bvslt (x!53207 lt!257986) #b01111111111111111111111111111110) (bvsge (x!53207 lt!257986) #b00000000000000000000000000000000) (bvsge (x!53207 lt!257986) #b00000000000000000000000000000000)))))

(assert (=> b!566352 (=> (not res!357332) (not e!325909))))

(declare-fun b!566353 () Bool)

(assert (=> b!566353 (= e!325906 (bvsge (x!53207 lt!257986) #b01111111111111111111111111111110))))

(declare-fun b!566354 () Bool)

(declare-fun e!325910 () SeekEntryResult!5527)

(assert (=> b!566354 (= e!325910 (Intermediate!5527 true lt!257855 #b00000000000000000000000000000000))))

(declare-fun d!83923 () Bool)

(assert (=> d!83923 e!325906))

(declare-fun c!64857 () Bool)

(assert (=> d!83923 (= c!64857 (and ((_ is Intermediate!5527) lt!257986) (undefined!6339 lt!257986)))))

(assert (=> d!83923 (= lt!257986 e!325910)))

(declare-fun c!64858 () Bool)

(assert (=> d!83923 (= c!64858 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257987 () (_ BitVec 64))

(assert (=> d!83923 (= lt!257987 (select (arr!17081 lt!257854) lt!257855))))

(assert (=> d!83923 (validMask!0 mask!3119)))

(assert (=> d!83923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257855 lt!257856 lt!257854 mask!3119) lt!257986)))

(declare-fun b!566349 () Bool)

(assert (=> b!566349 (= e!325910 e!325907)))

(declare-fun c!64856 () Bool)

(assert (=> b!566349 (= c!64856 (or (= lt!257987 lt!257856) (= (bvadd lt!257987 lt!257987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83923 c!64858) b!566354))

(assert (= (and d!83923 (not c!64858)) b!566349))

(assert (= (and b!566349 c!64856) b!566351))

(assert (= (and b!566349 (not c!64856)) b!566350))

(assert (= (and d!83923 c!64857) b!566353))

(assert (= (and d!83923 (not c!64857)) b!566352))

(assert (= (and b!566352 res!357332) b!566346))

(assert (= (and b!566346 (not res!357330)) b!566347))

(assert (= (and b!566347 (not res!357331)) b!566348))

(declare-fun m!544471 () Bool)

(assert (=> d!83923 m!544471))

(assert (=> d!83923 m!544253))

(declare-fun m!544473 () Bool)

(assert (=> b!566347 m!544473))

(declare-fun m!544475 () Bool)

(assert (=> b!566350 m!544475))

(assert (=> b!566350 m!544475))

(declare-fun m!544477 () Bool)

(assert (=> b!566350 m!544477))

(assert (=> b!566346 m!544473))

(assert (=> b!566348 m!544473))

(assert (=> b!566101 d!83923))

(declare-fun b!566361 () Bool)

(declare-fun lt!257991 () SeekEntryResult!5527)

(assert (=> b!566361 (and (bvsge (index!24337 lt!257991) #b00000000000000000000000000000000) (bvslt (index!24337 lt!257991) (size!17446 a!3118)))))

(declare-fun res!357333 () Bool)

(assert (=> b!566361 (= res!357333 (= (select (arr!17081 a!3118) (index!24337 lt!257991)) (select (arr!17081 a!3118) j!142)))))

(declare-fun e!325916 () Bool)

(assert (=> b!566361 (=> res!357333 e!325916)))

(declare-fun e!325917 () Bool)

(assert (=> b!566361 (= e!325917 e!325916)))

(declare-fun b!566362 () Bool)

(assert (=> b!566362 (and (bvsge (index!24337 lt!257991) #b00000000000000000000000000000000) (bvslt (index!24337 lt!257991) (size!17446 a!3118)))))

(declare-fun res!357334 () Bool)

(assert (=> b!566362 (= res!357334 (= (select (arr!17081 a!3118) (index!24337 lt!257991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566362 (=> res!357334 e!325916)))

(declare-fun b!566363 () Bool)

(assert (=> b!566363 (and (bvsge (index!24337 lt!257991) #b00000000000000000000000000000000) (bvslt (index!24337 lt!257991) (size!17446 a!3118)))))

(assert (=> b!566363 (= e!325916 (= (select (arr!17081 a!3118) (index!24337 lt!257991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566365 () Bool)

(declare-fun e!325915 () SeekEntryResult!5527)

(assert (=> b!566365 (= e!325915 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!257851 #b00000000000000000000000000000000 mask!3119) (select (arr!17081 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566366 () Bool)

(assert (=> b!566366 (= e!325915 (Intermediate!5527 false lt!257851 #b00000000000000000000000000000000))))

(declare-fun b!566367 () Bool)

(declare-fun e!325914 () Bool)

(assert (=> b!566367 (= e!325914 e!325917)))

(declare-fun res!357335 () Bool)

(assert (=> b!566367 (= res!357335 (and ((_ is Intermediate!5527) lt!257991) (not (undefined!6339 lt!257991)) (bvslt (x!53207 lt!257991) #b01111111111111111111111111111110) (bvsge (x!53207 lt!257991) #b00000000000000000000000000000000) (bvsge (x!53207 lt!257991) #b00000000000000000000000000000000)))))

(assert (=> b!566367 (=> (not res!357335) (not e!325917))))

(declare-fun b!566368 () Bool)

(assert (=> b!566368 (= e!325914 (bvsge (x!53207 lt!257991) #b01111111111111111111111111111110))))

(declare-fun b!566369 () Bool)

(declare-fun e!325918 () SeekEntryResult!5527)

(assert (=> b!566369 (= e!325918 (Intermediate!5527 true lt!257851 #b00000000000000000000000000000000))))

(declare-fun d!83937 () Bool)

(assert (=> d!83937 e!325914))

(declare-fun c!64863 () Bool)

(assert (=> d!83937 (= c!64863 (and ((_ is Intermediate!5527) lt!257991) (undefined!6339 lt!257991)))))

(assert (=> d!83937 (= lt!257991 e!325918)))

(declare-fun c!64864 () Bool)

(assert (=> d!83937 (= c!64864 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257992 () (_ BitVec 64))

(assert (=> d!83937 (= lt!257992 (select (arr!17081 a!3118) lt!257851))))

(assert (=> d!83937 (validMask!0 mask!3119)))

(assert (=> d!83937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257851 (select (arr!17081 a!3118) j!142) a!3118 mask!3119) lt!257991)))

(declare-fun b!566364 () Bool)

(assert (=> b!566364 (= e!325918 e!325915)))

(declare-fun c!64862 () Bool)

(assert (=> b!566364 (= c!64862 (or (= lt!257992 (select (arr!17081 a!3118) j!142)) (= (bvadd lt!257992 lt!257992) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83937 c!64864) b!566369))

(assert (= (and d!83937 (not c!64864)) b!566364))

(assert (= (and b!566364 c!64862) b!566366))

(assert (= (and b!566364 (not c!64862)) b!566365))

(assert (= (and d!83937 c!64863) b!566368))

(assert (= (and d!83937 (not c!64863)) b!566367))

(assert (= (and b!566367 res!357335) b!566361))

(assert (= (and b!566361 (not res!357333)) b!566362))

(assert (= (and b!566362 (not res!357334)) b!566363))

(declare-fun m!544493 () Bool)

(assert (=> d!83937 m!544493))

(assert (=> d!83937 m!544253))

(declare-fun m!544495 () Bool)

(assert (=> b!566362 m!544495))

(declare-fun m!544497 () Bool)

(assert (=> b!566365 m!544497))

(assert (=> b!566365 m!544497))

(assert (=> b!566365 m!544239))

(declare-fun m!544499 () Bool)

(assert (=> b!566365 m!544499))

(assert (=> b!566361 m!544495))

(assert (=> b!566363 m!544495))

(assert (=> b!566101 d!83937))

(declare-fun d!83941 () Bool)

(declare-fun lt!258001 () (_ BitVec 32))

(declare-fun lt!258000 () (_ BitVec 32))

(assert (=> d!83941 (= lt!258001 (bvmul (bvxor lt!258000 (bvlshr lt!258000 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83941 (= lt!258000 ((_ extract 31 0) (bvand (bvxor lt!257856 (bvlshr lt!257856 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83941 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357336 (let ((h!12206 ((_ extract 31 0) (bvand (bvxor lt!257856 (bvlshr lt!257856 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53213 (bvmul (bvxor h!12206 (bvlshr h!12206 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53213 (bvlshr x!53213 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357336 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357336 #b00000000000000000000000000000000))))))

(assert (=> d!83941 (= (toIndex!0 lt!257856 mask!3119) (bvand (bvxor lt!258001 (bvlshr lt!258001 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566101 d!83941))

(declare-fun d!83945 () Bool)

(declare-fun lt!258003 () (_ BitVec 32))

(declare-fun lt!258002 () (_ BitVec 32))

(assert (=> d!83945 (= lt!258003 (bvmul (bvxor lt!258002 (bvlshr lt!258002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83945 (= lt!258002 ((_ extract 31 0) (bvand (bvxor (select (arr!17081 a!3118) j!142) (bvlshr (select (arr!17081 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83945 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357336 (let ((h!12206 ((_ extract 31 0) (bvand (bvxor (select (arr!17081 a!3118) j!142) (bvlshr (select (arr!17081 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53213 (bvmul (bvxor h!12206 (bvlshr h!12206 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53213 (bvlshr x!53213 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357336 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357336 #b00000000000000000000000000000000))))))

(assert (=> d!83945 (= (toIndex!0 (select (arr!17081 a!3118) j!142) mask!3119) (bvand (bvxor lt!258003 (bvlshr lt!258003 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566101 d!83945))

(declare-fun d!83947 () Bool)

(declare-fun res!357345 () Bool)

(declare-fun e!325932 () Bool)

(assert (=> d!83947 (=> res!357345 e!325932)))

(assert (=> d!83947 (= res!357345 (= (select (arr!17081 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83947 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!325932)))

(declare-fun b!566388 () Bool)

(declare-fun e!325933 () Bool)

(assert (=> b!566388 (= e!325932 e!325933)))

(declare-fun res!357346 () Bool)

(assert (=> b!566388 (=> (not res!357346) (not e!325933))))

(assert (=> b!566388 (= res!357346 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17446 a!3118)))))

(declare-fun b!566389 () Bool)

(assert (=> b!566389 (= e!325933 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83947 (not res!357345)) b!566388))

(assert (= (and b!566388 res!357346) b!566389))

(assert (=> d!83947 m!544427))

(declare-fun m!544513 () Bool)

(assert (=> b!566389 m!544513))

(assert (=> b!566095 d!83947))

(check-sat (not b!566350) (not b!566296) (not b!566264) (not d!83923) (not b!566186) (not d!83937) (not d!83903) (not b!566298) (not b!566365) (not d!83883) (not bm!32452) (not b!566252) (not d!83899) (not b!566389) (not b!566218) (not bm!32453) (not b!566297) (not b!566267) (not b!566221) (not d!83909) (not bm!32460) (not b!566174))
(check-sat)
