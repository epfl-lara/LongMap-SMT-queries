; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131196 () Bool)

(assert start!131196)

(declare-fun lt!664758 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102220 0))(
  ( (array!102221 (arr!49324 (Array (_ BitVec 32) (_ BitVec 64))) (size!49876 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102220)

(declare-fun e!856068 () Bool)

(declare-fun b!1539074 () Bool)

(assert (=> b!1539074 (= e!856068 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (or (bvslt lt!664758 #b00000000000000000000000000000000) (bvsge lt!664758 (size!49876 a!2792)))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539074 (= lt!664758 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539075 () Bool)

(declare-fun res!1056150 () Bool)

(assert (=> b!1539075 (=> (not res!1056150) (not e!856068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102220 (_ BitVec 32)) Bool)

(assert (=> b!1539075 (= res!1056150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539076 () Bool)

(declare-fun res!1056146 () Bool)

(assert (=> b!1539076 (=> (not res!1056146) (not e!856068))))

(declare-datatypes ((List!35876 0))(
  ( (Nil!35873) (Cons!35872 (h!37318 (_ BitVec 64)) (t!50562 List!35876)) )
))
(declare-fun arrayNoDuplicates!0 (array!102220 (_ BitVec 32) List!35876) Bool)

(assert (=> b!1539076 (= res!1056146 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35873))))

(declare-fun b!1539078 () Bool)

(declare-fun res!1056149 () Bool)

(assert (=> b!1539078 (=> (not res!1056149) (not e!856068))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13475 0))(
  ( (MissingZero!13475 (index!56295 (_ BitVec 32))) (Found!13475 (index!56296 (_ BitVec 32))) (Intermediate!13475 (undefined!14287 Bool) (index!56297 (_ BitVec 32)) (x!138025 (_ BitVec 32))) (Undefined!13475) (MissingVacant!13475 (index!56298 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102220 (_ BitVec 32)) SeekEntryResult!13475)

(assert (=> b!1539078 (= res!1056149 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49324 a!2792) j!64) a!2792 mask!2480) (Found!13475 j!64)))))

(declare-fun b!1539079 () Bool)

(declare-fun res!1056151 () Bool)

(assert (=> b!1539079 (=> (not res!1056151) (not e!856068))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539079 (= res!1056151 (validKeyInArray!0 (select (arr!49324 a!2792) i!951)))))

(declare-fun res!1056152 () Bool)

(assert (=> start!131196 (=> (not res!1056152) (not e!856068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131196 (= res!1056152 (validMask!0 mask!2480))))

(assert (=> start!131196 e!856068))

(assert (=> start!131196 true))

(declare-fun array_inv!38557 (array!102220) Bool)

(assert (=> start!131196 (array_inv!38557 a!2792)))

(declare-fun b!1539077 () Bool)

(declare-fun res!1056154 () Bool)

(assert (=> b!1539077 (=> (not res!1056154) (not e!856068))))

(assert (=> b!1539077 (= res!1056154 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49876 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49876 a!2792)) (= (select (arr!49324 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539080 () Bool)

(declare-fun res!1056148 () Bool)

(assert (=> b!1539080 (=> (not res!1056148) (not e!856068))))

(assert (=> b!1539080 (= res!1056148 (validKeyInArray!0 (select (arr!49324 a!2792) j!64)))))

(declare-fun b!1539081 () Bool)

(declare-fun res!1056147 () Bool)

(assert (=> b!1539081 (=> (not res!1056147) (not e!856068))))

(assert (=> b!1539081 (= res!1056147 (not (= (select (arr!49324 a!2792) index!463) (select (arr!49324 a!2792) j!64))))))

(declare-fun b!1539082 () Bool)

(declare-fun res!1056153 () Bool)

(assert (=> b!1539082 (=> (not res!1056153) (not e!856068))))

(assert (=> b!1539082 (= res!1056153 (and (= (size!49876 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49876 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49876 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131196 res!1056152) b!1539082))

(assert (= (and b!1539082 res!1056153) b!1539079))

(assert (= (and b!1539079 res!1056151) b!1539080))

(assert (= (and b!1539080 res!1056148) b!1539075))

(assert (= (and b!1539075 res!1056150) b!1539076))

(assert (= (and b!1539076 res!1056146) b!1539077))

(assert (= (and b!1539077 res!1056154) b!1539078))

(assert (= (and b!1539078 res!1056149) b!1539081))

(assert (= (and b!1539081 res!1056147) b!1539074))

(declare-fun m!1420775 () Bool)

(assert (=> b!1539075 m!1420775))

(declare-fun m!1420777 () Bool)

(assert (=> b!1539078 m!1420777))

(assert (=> b!1539078 m!1420777))

(declare-fun m!1420779 () Bool)

(assert (=> b!1539078 m!1420779))

(declare-fun m!1420781 () Bool)

(assert (=> b!1539077 m!1420781))

(declare-fun m!1420783 () Bool)

(assert (=> b!1539074 m!1420783))

(declare-fun m!1420785 () Bool)

(assert (=> start!131196 m!1420785))

(declare-fun m!1420787 () Bool)

(assert (=> start!131196 m!1420787))

(declare-fun m!1420789 () Bool)

(assert (=> b!1539076 m!1420789))

(declare-fun m!1420791 () Bool)

(assert (=> b!1539079 m!1420791))

(assert (=> b!1539079 m!1420791))

(declare-fun m!1420793 () Bool)

(assert (=> b!1539079 m!1420793))

(declare-fun m!1420795 () Bool)

(assert (=> b!1539081 m!1420795))

(assert (=> b!1539081 m!1420777))

(assert (=> b!1539080 m!1420777))

(assert (=> b!1539080 m!1420777))

(declare-fun m!1420797 () Bool)

(assert (=> b!1539080 m!1420797))

(check-sat (not b!1539076) (not b!1539078) (not b!1539075) (not b!1539079) (not b!1539074) (not start!131196) (not b!1539080))
(check-sat)
(get-model)

(declare-fun b!1539145 () Bool)

(declare-fun e!856090 () Bool)

(declare-fun e!856088 () Bool)

(assert (=> b!1539145 (= e!856090 e!856088)))

(declare-fun lt!664772 () (_ BitVec 64))

(assert (=> b!1539145 (= lt!664772 (select (arr!49324 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51241 0))(
  ( (Unit!51242) )
))
(declare-fun lt!664773 () Unit!51241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102220 (_ BitVec 64) (_ BitVec 32)) Unit!51241)

(assert (=> b!1539145 (= lt!664773 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664772 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539145 (arrayContainsKey!0 a!2792 lt!664772 #b00000000000000000000000000000000)))

(declare-fun lt!664771 () Unit!51241)

(assert (=> b!1539145 (= lt!664771 lt!664773)))

(declare-fun res!1056213 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102220 (_ BitVec 32)) SeekEntryResult!13475)

(assert (=> b!1539145 (= res!1056213 (= (seekEntryOrOpen!0 (select (arr!49324 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13475 #b00000000000000000000000000000000)))))

(assert (=> b!1539145 (=> (not res!1056213) (not e!856088))))

(declare-fun b!1539146 () Bool)

(declare-fun call!68584 () Bool)

(assert (=> b!1539146 (= e!856090 call!68584)))

(declare-fun bm!68581 () Bool)

(assert (=> bm!68581 (= call!68584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1539147 () Bool)

(assert (=> b!1539147 (= e!856088 call!68584)))

(declare-fun b!1539148 () Bool)

(declare-fun e!856089 () Bool)

(assert (=> b!1539148 (= e!856089 e!856090)))

(declare-fun c!141027 () Bool)

(assert (=> b!1539148 (= c!141027 (validKeyInArray!0 (select (arr!49324 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160169 () Bool)

(declare-fun res!1056214 () Bool)

(assert (=> d!160169 (=> res!1056214 e!856089)))

(assert (=> d!160169 (= res!1056214 (bvsge #b00000000000000000000000000000000 (size!49876 a!2792)))))

(assert (=> d!160169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856089)))

(assert (= (and d!160169 (not res!1056214)) b!1539148))

(assert (= (and b!1539148 c!141027) b!1539145))

(assert (= (and b!1539148 (not c!141027)) b!1539146))

(assert (= (and b!1539145 res!1056213) b!1539147))

(assert (= (or b!1539147 b!1539146) bm!68581))

(declare-fun m!1420847 () Bool)

(assert (=> b!1539145 m!1420847))

(declare-fun m!1420849 () Bool)

(assert (=> b!1539145 m!1420849))

(declare-fun m!1420851 () Bool)

(assert (=> b!1539145 m!1420851))

(assert (=> b!1539145 m!1420847))

(declare-fun m!1420853 () Bool)

(assert (=> b!1539145 m!1420853))

(declare-fun m!1420855 () Bool)

(assert (=> bm!68581 m!1420855))

(assert (=> b!1539148 m!1420847))

(assert (=> b!1539148 m!1420847))

(declare-fun m!1420857 () Bool)

(assert (=> b!1539148 m!1420857))

(assert (=> b!1539075 d!160169))

(declare-fun d!160171 () Bool)

(assert (=> d!160171 (= (validKeyInArray!0 (select (arr!49324 a!2792) j!64)) (and (not (= (select (arr!49324 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49324 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539080 d!160171))

(declare-fun b!1539159 () Bool)

(declare-fun e!856102 () Bool)

(declare-fun call!68587 () Bool)

(assert (=> b!1539159 (= e!856102 call!68587)))

(declare-fun b!1539160 () Bool)

(declare-fun e!856101 () Bool)

(declare-fun contains!9976 (List!35876 (_ BitVec 64)) Bool)

(assert (=> b!1539160 (= e!856101 (contains!9976 Nil!35873 (select (arr!49324 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539161 () Bool)

(assert (=> b!1539161 (= e!856102 call!68587)))

(declare-fun b!1539162 () Bool)

(declare-fun e!856100 () Bool)

(declare-fun e!856099 () Bool)

(assert (=> b!1539162 (= e!856100 e!856099)))

(declare-fun res!1056223 () Bool)

(assert (=> b!1539162 (=> (not res!1056223) (not e!856099))))

(assert (=> b!1539162 (= res!1056223 (not e!856101))))

(declare-fun res!1056222 () Bool)

(assert (=> b!1539162 (=> (not res!1056222) (not e!856101))))

(assert (=> b!1539162 (= res!1056222 (validKeyInArray!0 (select (arr!49324 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539163 () Bool)

(assert (=> b!1539163 (= e!856099 e!856102)))

(declare-fun c!141030 () Bool)

(assert (=> b!1539163 (= c!141030 (validKeyInArray!0 (select (arr!49324 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68584 () Bool)

(assert (=> bm!68584 (= call!68587 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141030 (Cons!35872 (select (arr!49324 a!2792) #b00000000000000000000000000000000) Nil!35873) Nil!35873)))))

(declare-fun d!160173 () Bool)

(declare-fun res!1056221 () Bool)

(assert (=> d!160173 (=> res!1056221 e!856100)))

(assert (=> d!160173 (= res!1056221 (bvsge #b00000000000000000000000000000000 (size!49876 a!2792)))))

(assert (=> d!160173 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35873) e!856100)))

(assert (= (and d!160173 (not res!1056221)) b!1539162))

(assert (= (and b!1539162 res!1056222) b!1539160))

(assert (= (and b!1539162 res!1056223) b!1539163))

(assert (= (and b!1539163 c!141030) b!1539161))

(assert (= (and b!1539163 (not c!141030)) b!1539159))

(assert (= (or b!1539161 b!1539159) bm!68584))

(assert (=> b!1539160 m!1420847))

(assert (=> b!1539160 m!1420847))

(declare-fun m!1420859 () Bool)

(assert (=> b!1539160 m!1420859))

(assert (=> b!1539162 m!1420847))

(assert (=> b!1539162 m!1420847))

(assert (=> b!1539162 m!1420857))

(assert (=> b!1539163 m!1420847))

(assert (=> b!1539163 m!1420847))

(assert (=> b!1539163 m!1420857))

(assert (=> bm!68584 m!1420847))

(declare-fun m!1420861 () Bool)

(assert (=> bm!68584 m!1420861))

(assert (=> b!1539076 d!160173))

(declare-fun b!1539188 () Bool)

(declare-fun c!141041 () Bool)

(declare-fun lt!664791 () (_ BitVec 64))

(assert (=> b!1539188 (= c!141041 (= lt!664791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!856118 () SeekEntryResult!13475)

(declare-fun e!856119 () SeekEntryResult!13475)

(assert (=> b!1539188 (= e!856118 e!856119)))

(declare-fun b!1539189 () Bool)

(assert (=> b!1539189 (= e!856118 (Found!13475 index!463))))

(declare-fun b!1539190 () Bool)

(declare-fun e!856120 () SeekEntryResult!13475)

(assert (=> b!1539190 (= e!856120 Undefined!13475)))

(declare-fun b!1539191 () Bool)

(assert (=> b!1539191 (= e!856119 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49324 a!2792) j!64) a!2792 mask!2480))))

(declare-fun d!160175 () Bool)

(declare-fun lt!664790 () SeekEntryResult!13475)

(get-info :version)

(assert (=> d!160175 (and (or ((_ is Undefined!13475) lt!664790) (not ((_ is Found!13475) lt!664790)) (and (bvsge (index!56296 lt!664790) #b00000000000000000000000000000000) (bvslt (index!56296 lt!664790) (size!49876 a!2792)))) (or ((_ is Undefined!13475) lt!664790) ((_ is Found!13475) lt!664790) (not ((_ is MissingVacant!13475) lt!664790)) (not (= (index!56298 lt!664790) vacantIndex!5)) (and (bvsge (index!56298 lt!664790) #b00000000000000000000000000000000) (bvslt (index!56298 lt!664790) (size!49876 a!2792)))) (or ((_ is Undefined!13475) lt!664790) (ite ((_ is Found!13475) lt!664790) (= (select (arr!49324 a!2792) (index!56296 lt!664790)) (select (arr!49324 a!2792) j!64)) (and ((_ is MissingVacant!13475) lt!664790) (= (index!56298 lt!664790) vacantIndex!5) (= (select (arr!49324 a!2792) (index!56298 lt!664790)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160175 (= lt!664790 e!856120)))

(declare-fun c!141042 () Bool)

(assert (=> d!160175 (= c!141042 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160175 (= lt!664791 (select (arr!49324 a!2792) index!463))))

(assert (=> d!160175 (validMask!0 mask!2480)))

(assert (=> d!160175 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49324 a!2792) j!64) a!2792 mask!2480) lt!664790)))

(declare-fun b!1539192 () Bool)

(assert (=> b!1539192 (= e!856119 (MissingVacant!13475 vacantIndex!5))))

(declare-fun b!1539193 () Bool)

(assert (=> b!1539193 (= e!856120 e!856118)))

(declare-fun c!141040 () Bool)

(assert (=> b!1539193 (= c!141040 (= lt!664791 (select (arr!49324 a!2792) j!64)))))

(assert (= (and d!160175 c!141042) b!1539190))

(assert (= (and d!160175 (not c!141042)) b!1539193))

(assert (= (and b!1539193 c!141040) b!1539189))

(assert (= (and b!1539193 (not c!141040)) b!1539188))

(assert (= (and b!1539188 c!141041) b!1539192))

(assert (= (and b!1539188 (not c!141041)) b!1539191))

(assert (=> b!1539191 m!1420783))

(assert (=> b!1539191 m!1420783))

(assert (=> b!1539191 m!1420777))

(declare-fun m!1420877 () Bool)

(assert (=> b!1539191 m!1420877))

(declare-fun m!1420879 () Bool)

(assert (=> d!160175 m!1420879))

(declare-fun m!1420881 () Bool)

(assert (=> d!160175 m!1420881))

(assert (=> d!160175 m!1420795))

(assert (=> d!160175 m!1420785))

(assert (=> b!1539078 d!160175))

(declare-fun d!160191 () Bool)

(assert (=> d!160191 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131196 d!160191))

(declare-fun d!160199 () Bool)

(assert (=> d!160199 (= (array_inv!38557 a!2792) (bvsge (size!49876 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131196 d!160199))

(declare-fun d!160201 () Bool)

(declare-fun lt!664809 () (_ BitVec 32))

(assert (=> d!160201 (and (bvsge lt!664809 #b00000000000000000000000000000000) (bvslt lt!664809 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160201 (= lt!664809 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160201 (validMask!0 mask!2480)))

(assert (=> d!160201 (= (nextIndex!0 index!463 x!510 mask!2480) lt!664809)))

(declare-fun bs!44150 () Bool)

(assert (= bs!44150 d!160201))

(declare-fun m!1420899 () Bool)

(assert (=> bs!44150 m!1420899))

(assert (=> bs!44150 m!1420785))

(assert (=> b!1539074 d!160201))

(declare-fun d!160209 () Bool)

(assert (=> d!160209 (= (validKeyInArray!0 (select (arr!49324 a!2792) i!951)) (and (not (= (select (arr!49324 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49324 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539079 d!160209))

(check-sat (not bm!68584) (not b!1539145) (not b!1539160) (not bm!68581) (not b!1539148) (not b!1539162) (not d!160175) (not d!160201) (not b!1539191) (not b!1539163))
(check-sat)
