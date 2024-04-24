; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131796 () Bool)

(assert start!131796)

(declare-fun b!1542941 () Bool)

(declare-fun res!1058064 () Bool)

(declare-fun e!858279 () Bool)

(assert (=> b!1542941 (=> (not res!1058064) (not e!858279))))

(declare-datatypes ((array!102452 0))(
  ( (array!102453 (arr!49429 (Array (_ BitVec 32) (_ BitVec 64))) (size!49980 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102452)

(declare-datatypes ((List!35890 0))(
  ( (Nil!35887) (Cons!35886 (h!37349 (_ BitVec 64)) (t!50576 List!35890)) )
))
(declare-fun arrayNoDuplicates!0 (array!102452 (_ BitVec 32) List!35890) Bool)

(assert (=> b!1542941 (= res!1058064 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35887))))

(declare-fun lt!666290 () (_ BitVec 64))

(declare-fun lt!666286 () array!102452)

(declare-fun b!1542942 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun e!858277 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13450 0))(
  ( (MissingZero!13450 (index!56195 (_ BitVec 32))) (Found!13450 (index!56196 (_ BitVec 32))) (Intermediate!13450 (undefined!14262 Bool) (index!56197 (_ BitVec 32)) (x!138138 (_ BitVec 32))) (Undefined!13450) (MissingVacant!13450 (index!56198 (_ BitVec 32))) )
))
(declare-fun lt!666287 () SeekEntryResult!13450)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102452 (_ BitVec 32)) SeekEntryResult!13450)

(assert (=> b!1542942 (= e!858277 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!666290 lt!666286 mask!2480) lt!666287)))))

(declare-fun lt!666285 () (_ BitVec 32))

(declare-fun lt!666289 () SeekEntryResult!13450)

(assert (=> b!1542942 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 lt!666290 lt!666286 mask!2480) lt!666289)))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1542942 (= lt!666290 (select (store (arr!49429 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(assert (=> b!1542942 (= lt!666286 (array!102453 (store (arr!49429 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49980 a!2792)))))

(declare-datatypes ((Unit!51373 0))(
  ( (Unit!51374) )
))
(declare-fun lt!666291 () Unit!51373)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51373)

(assert (=> b!1542942 (= lt!666291 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 mask!2480))))

(declare-fun b!1542943 () Bool)

(declare-fun e!858280 () Bool)

(declare-fun e!858276 () Bool)

(assert (=> b!1542943 (= e!858280 e!858276)))

(declare-fun res!1058061 () Bool)

(assert (=> b!1542943 (=> (not res!1058061) (not e!858276))))

(assert (=> b!1542943 (= res!1058061 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666285 #b00000000000000000000000000000000) (bvslt lt!666285 (size!49980 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542943 (= lt!666285 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542944 () Bool)

(declare-fun res!1058062 () Bool)

(assert (=> b!1542944 (=> (not res!1058062) (not e!858279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102452 (_ BitVec 32)) Bool)

(assert (=> b!1542944 (= res!1058062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542945 () Bool)

(declare-fun res!1058063 () Bool)

(assert (=> b!1542945 (=> (not res!1058063) (not e!858279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542945 (= res!1058063 (validKeyInArray!0 (select (arr!49429 a!2792) i!951)))))

(declare-fun b!1542946 () Bool)

(declare-fun res!1058060 () Bool)

(assert (=> b!1542946 (=> (not res!1058060) (not e!858279))))

(assert (=> b!1542946 (= res!1058060 (validKeyInArray!0 (select (arr!49429 a!2792) j!64)))))

(declare-fun b!1542947 () Bool)

(declare-fun res!1058056 () Bool)

(assert (=> b!1542947 (=> (not res!1058056) (not e!858279))))

(assert (=> b!1542947 (= res!1058056 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49980 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49980 a!2792)) (= (select (arr!49429 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542948 () Bool)

(assert (=> b!1542948 (= e!858276 e!858277)))

(declare-fun res!1058055 () Bool)

(assert (=> b!1542948 (=> (not res!1058055) (not e!858277))))

(declare-fun lt!666288 () SeekEntryResult!13450)

(assert (=> b!1542948 (= res!1058055 (= lt!666289 lt!666288))))

(assert (=> b!1542948 (= lt!666289 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1542949 () Bool)

(assert (=> b!1542949 (= e!858279 e!858280)))

(declare-fun res!1058059 () Bool)

(assert (=> b!1542949 (=> (not res!1058059) (not e!858280))))

(assert (=> b!1542949 (= res!1058059 (and (= lt!666287 lt!666288) (not (= (select (arr!49429 a!2792) index!463) (select (arr!49429 a!2792) j!64)))))))

(assert (=> b!1542949 (= lt!666288 (Found!13450 j!64))))

(assert (=> b!1542949 (= lt!666287 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1058058 () Bool)

(assert (=> start!131796 (=> (not res!1058058) (not e!858279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131796 (= res!1058058 (validMask!0 mask!2480))))

(assert (=> start!131796 e!858279))

(assert (=> start!131796 true))

(declare-fun array_inv!38710 (array!102452) Bool)

(assert (=> start!131796 (array_inv!38710 a!2792)))

(declare-fun b!1542950 () Bool)

(declare-fun res!1058057 () Bool)

(assert (=> b!1542950 (=> (not res!1058057) (not e!858279))))

(assert (=> b!1542950 (= res!1058057 (and (= (size!49980 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49980 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49980 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131796 res!1058058) b!1542950))

(assert (= (and b!1542950 res!1058057) b!1542945))

(assert (= (and b!1542945 res!1058063) b!1542946))

(assert (= (and b!1542946 res!1058060) b!1542944))

(assert (= (and b!1542944 res!1058062) b!1542941))

(assert (= (and b!1542941 res!1058064) b!1542947))

(assert (= (and b!1542947 res!1058056) b!1542949))

(assert (= (and b!1542949 res!1058059) b!1542943))

(assert (= (and b!1542943 res!1058061) b!1542948))

(assert (= (and b!1542948 res!1058055) b!1542942))

(declare-fun m!1424873 () Bool)

(assert (=> b!1542949 m!1424873))

(declare-fun m!1424875 () Bool)

(assert (=> b!1542949 m!1424875))

(assert (=> b!1542949 m!1424875))

(declare-fun m!1424877 () Bool)

(assert (=> b!1542949 m!1424877))

(declare-fun m!1424879 () Bool)

(assert (=> b!1542942 m!1424879))

(declare-fun m!1424881 () Bool)

(assert (=> b!1542942 m!1424881))

(declare-fun m!1424883 () Bool)

(assert (=> b!1542942 m!1424883))

(declare-fun m!1424885 () Bool)

(assert (=> b!1542942 m!1424885))

(declare-fun m!1424887 () Bool)

(assert (=> b!1542942 m!1424887))

(declare-fun m!1424889 () Bool)

(assert (=> start!131796 m!1424889))

(declare-fun m!1424891 () Bool)

(assert (=> start!131796 m!1424891))

(declare-fun m!1424893 () Bool)

(assert (=> b!1542941 m!1424893))

(declare-fun m!1424895 () Bool)

(assert (=> b!1542943 m!1424895))

(declare-fun m!1424897 () Bool)

(assert (=> b!1542945 m!1424897))

(assert (=> b!1542945 m!1424897))

(declare-fun m!1424899 () Bool)

(assert (=> b!1542945 m!1424899))

(assert (=> b!1542948 m!1424875))

(assert (=> b!1542948 m!1424875))

(declare-fun m!1424901 () Bool)

(assert (=> b!1542948 m!1424901))

(declare-fun m!1424903 () Bool)

(assert (=> b!1542947 m!1424903))

(assert (=> b!1542946 m!1424875))

(assert (=> b!1542946 m!1424875))

(declare-fun m!1424905 () Bool)

(assert (=> b!1542946 m!1424905))

(declare-fun m!1424907 () Bool)

(assert (=> b!1542944 m!1424907))

(check-sat (not b!1542948) (not b!1542942) (not b!1542946) (not b!1542944) (not b!1542945) (not b!1542949) (not b!1542941) (not b!1542943) (not start!131796))
(check-sat)
(get-model)

(declare-fun d!161243 () Bool)

(assert (=> d!161243 (= (validKeyInArray!0 (select (arr!49429 a!2792) j!64)) (and (not (= (select (arr!49429 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49429 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1542946 d!161243))

(declare-fun bm!68802 () Bool)

(declare-fun call!68805 () Bool)

(declare-fun c!142015 () Bool)

(assert (=> bm!68802 (= call!68805 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142015 (Cons!35886 (select (arr!49429 a!2792) #b00000000000000000000000000000000) Nil!35887) Nil!35887)))))

(declare-fun b!1543021 () Bool)

(declare-fun e!858322 () Bool)

(assert (=> b!1543021 (= e!858322 call!68805)))

(declare-fun b!1543022 () Bool)

(assert (=> b!1543022 (= e!858322 call!68805)))

(declare-fun b!1543023 () Bool)

(declare-fun e!858319 () Bool)

(declare-fun contains!10067 (List!35890 (_ BitVec 64)) Bool)

(assert (=> b!1543023 (= e!858319 (contains!10067 Nil!35887 (select (arr!49429 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1543024 () Bool)

(declare-fun e!858321 () Bool)

(declare-fun e!858320 () Bool)

(assert (=> b!1543024 (= e!858321 e!858320)))

(declare-fun res!1058131 () Bool)

(assert (=> b!1543024 (=> (not res!1058131) (not e!858320))))

(assert (=> b!1543024 (= res!1058131 (not e!858319))))

(declare-fun res!1058133 () Bool)

(assert (=> b!1543024 (=> (not res!1058133) (not e!858319))))

(assert (=> b!1543024 (= res!1058133 (validKeyInArray!0 (select (arr!49429 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1543025 () Bool)

(assert (=> b!1543025 (= e!858320 e!858322)))

(assert (=> b!1543025 (= c!142015 (validKeyInArray!0 (select (arr!49429 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!161245 () Bool)

(declare-fun res!1058132 () Bool)

(assert (=> d!161245 (=> res!1058132 e!858321)))

(assert (=> d!161245 (= res!1058132 (bvsge #b00000000000000000000000000000000 (size!49980 a!2792)))))

(assert (=> d!161245 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35887) e!858321)))

(assert (= (and d!161245 (not res!1058132)) b!1543024))

(assert (= (and b!1543024 res!1058133) b!1543023))

(assert (= (and b!1543024 res!1058131) b!1543025))

(assert (= (and b!1543025 c!142015) b!1543021))

(assert (= (and b!1543025 (not c!142015)) b!1543022))

(assert (= (or b!1543021 b!1543022) bm!68802))

(declare-fun m!1424981 () Bool)

(assert (=> bm!68802 m!1424981))

(declare-fun m!1424983 () Bool)

(assert (=> bm!68802 m!1424983))

(assert (=> b!1543023 m!1424981))

(assert (=> b!1543023 m!1424981))

(declare-fun m!1424985 () Bool)

(assert (=> b!1543023 m!1424985))

(assert (=> b!1543024 m!1424981))

(assert (=> b!1543024 m!1424981))

(declare-fun m!1424987 () Bool)

(assert (=> b!1543024 m!1424987))

(assert (=> b!1543025 m!1424981))

(assert (=> b!1543025 m!1424981))

(assert (=> b!1543025 m!1424987))

(assert (=> b!1542941 d!161245))

(declare-fun e!858331 () SeekEntryResult!13450)

(declare-fun b!1543038 () Bool)

(assert (=> b!1543038 (= e!858331 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 lt!666290 lt!666286 mask!2480))))

(declare-fun b!1543039 () Bool)

(declare-fun e!858329 () SeekEntryResult!13450)

(assert (=> b!1543039 (= e!858329 Undefined!13450)))

(declare-fun b!1543040 () Bool)

(declare-fun e!858330 () SeekEntryResult!13450)

(assert (=> b!1543040 (= e!858330 (Found!13450 index!463))))

(declare-fun b!1543041 () Bool)

(declare-fun c!142022 () Bool)

(declare-fun lt!666339 () (_ BitVec 64))

(assert (=> b!1543041 (= c!142022 (= lt!666339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1543041 (= e!858330 e!858331)))

(declare-fun lt!666338 () SeekEntryResult!13450)

(declare-fun d!161247 () Bool)

(get-info :version)

(assert (=> d!161247 (and (or ((_ is Undefined!13450) lt!666338) (not ((_ is Found!13450) lt!666338)) (and (bvsge (index!56196 lt!666338) #b00000000000000000000000000000000) (bvslt (index!56196 lt!666338) (size!49980 lt!666286)))) (or ((_ is Undefined!13450) lt!666338) ((_ is Found!13450) lt!666338) (not ((_ is MissingVacant!13450) lt!666338)) (not (= (index!56198 lt!666338) vacantIndex!5)) (and (bvsge (index!56198 lt!666338) #b00000000000000000000000000000000) (bvslt (index!56198 lt!666338) (size!49980 lt!666286)))) (or ((_ is Undefined!13450) lt!666338) (ite ((_ is Found!13450) lt!666338) (= (select (arr!49429 lt!666286) (index!56196 lt!666338)) lt!666290) (and ((_ is MissingVacant!13450) lt!666338) (= (index!56198 lt!666338) vacantIndex!5) (= (select (arr!49429 lt!666286) (index!56198 lt!666338)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161247 (= lt!666338 e!858329)))

(declare-fun c!142024 () Bool)

(assert (=> d!161247 (= c!142024 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!161247 (= lt!666339 (select (arr!49429 lt!666286) index!463))))

(assert (=> d!161247 (validMask!0 mask!2480)))

(assert (=> d!161247 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!666290 lt!666286 mask!2480) lt!666338)))

(declare-fun b!1543042 () Bool)

(assert (=> b!1543042 (= e!858331 (MissingVacant!13450 vacantIndex!5))))

(declare-fun b!1543043 () Bool)

(assert (=> b!1543043 (= e!858329 e!858330)))

(declare-fun c!142023 () Bool)

(assert (=> b!1543043 (= c!142023 (= lt!666339 lt!666290))))

(assert (= (and d!161247 c!142024) b!1543039))

(assert (= (and d!161247 (not c!142024)) b!1543043))

(assert (= (and b!1543043 c!142023) b!1543040))

(assert (= (and b!1543043 (not c!142023)) b!1543041))

(assert (= (and b!1543041 c!142022) b!1543042))

(assert (= (and b!1543041 (not c!142022)) b!1543038))

(declare-fun m!1424989 () Bool)

(assert (=> b!1543038 m!1424989))

(assert (=> b!1543038 m!1424989))

(declare-fun m!1424991 () Bool)

(assert (=> b!1543038 m!1424991))

(declare-fun m!1424993 () Bool)

(assert (=> d!161247 m!1424993))

(declare-fun m!1424995 () Bool)

(assert (=> d!161247 m!1424995))

(declare-fun m!1424997 () Bool)

(assert (=> d!161247 m!1424997))

(assert (=> d!161247 m!1424889))

(assert (=> b!1542942 d!161247))

(declare-fun e!858334 () SeekEntryResult!13450)

(declare-fun b!1543044 () Bool)

(assert (=> b!1543044 (= e!858334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!666285 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 lt!666290 lt!666286 mask!2480))))

(declare-fun b!1543045 () Bool)

(declare-fun e!858332 () SeekEntryResult!13450)

(assert (=> b!1543045 (= e!858332 Undefined!13450)))

(declare-fun b!1543046 () Bool)

(declare-fun e!858333 () SeekEntryResult!13450)

(assert (=> b!1543046 (= e!858333 (Found!13450 lt!666285))))

(declare-fun b!1543047 () Bool)

(declare-fun c!142025 () Bool)

(declare-fun lt!666341 () (_ BitVec 64))

(assert (=> b!1543047 (= c!142025 (= lt!666341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1543047 (= e!858333 e!858334)))

(declare-fun lt!666340 () SeekEntryResult!13450)

(declare-fun d!161249 () Bool)

(assert (=> d!161249 (and (or ((_ is Undefined!13450) lt!666340) (not ((_ is Found!13450) lt!666340)) (and (bvsge (index!56196 lt!666340) #b00000000000000000000000000000000) (bvslt (index!56196 lt!666340) (size!49980 lt!666286)))) (or ((_ is Undefined!13450) lt!666340) ((_ is Found!13450) lt!666340) (not ((_ is MissingVacant!13450) lt!666340)) (not (= (index!56198 lt!666340) vacantIndex!5)) (and (bvsge (index!56198 lt!666340) #b00000000000000000000000000000000) (bvslt (index!56198 lt!666340) (size!49980 lt!666286)))) (or ((_ is Undefined!13450) lt!666340) (ite ((_ is Found!13450) lt!666340) (= (select (arr!49429 lt!666286) (index!56196 lt!666340)) lt!666290) (and ((_ is MissingVacant!13450) lt!666340) (= (index!56198 lt!666340) vacantIndex!5) (= (select (arr!49429 lt!666286) (index!56198 lt!666340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161249 (= lt!666340 e!858332)))

(declare-fun c!142027 () Bool)

(assert (=> d!161249 (= c!142027 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!161249 (= lt!666341 (select (arr!49429 lt!666286) lt!666285))))

(assert (=> d!161249 (validMask!0 mask!2480)))

(assert (=> d!161249 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 lt!666290 lt!666286 mask!2480) lt!666340)))

(declare-fun b!1543048 () Bool)

(assert (=> b!1543048 (= e!858334 (MissingVacant!13450 vacantIndex!5))))

(declare-fun b!1543049 () Bool)

(assert (=> b!1543049 (= e!858332 e!858333)))

(declare-fun c!142026 () Bool)

(assert (=> b!1543049 (= c!142026 (= lt!666341 lt!666290))))

(assert (= (and d!161249 c!142027) b!1543045))

(assert (= (and d!161249 (not c!142027)) b!1543049))

(assert (= (and b!1543049 c!142026) b!1543046))

(assert (= (and b!1543049 (not c!142026)) b!1543047))

(assert (= (and b!1543047 c!142025) b!1543048))

(assert (= (and b!1543047 (not c!142025)) b!1543044))

(declare-fun m!1424999 () Bool)

(assert (=> b!1543044 m!1424999))

(assert (=> b!1543044 m!1424999))

(declare-fun m!1425001 () Bool)

(assert (=> b!1543044 m!1425001))

(declare-fun m!1425003 () Bool)

(assert (=> d!161249 m!1425003))

(declare-fun m!1425005 () Bool)

(assert (=> d!161249 m!1425005))

(declare-fun m!1425007 () Bool)

(assert (=> d!161249 m!1425007))

(assert (=> d!161249 m!1424889))

(assert (=> b!1542942 d!161249))

(declare-fun d!161251 () Bool)

(declare-fun e!858346 () Bool)

(assert (=> d!161251 e!858346))

(declare-fun res!1058142 () Bool)

(assert (=> d!161251 (=> (not res!1058142) (not e!858346))))

(assert (=> d!161251 (= res!1058142 (and (or (bvslt i!951 #b00000000000000000000000000000000) (bvsge i!951 (size!49980 a!2792)) (and (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49980 a!2792)))) (or (bvslt i!951 #b00000000000000000000000000000000) (bvsge i!951 (size!49980 a!2792)) (and (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49980 a!2792)))) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49980 a!2792))))))

(declare-fun lt!666353 () Unit!51373)

(declare-fun choose!81 (array!102452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51373)

(assert (=> d!161251 (= lt!666353 (choose!81 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 mask!2480))))

(assert (=> d!161251 (validMask!0 mask!2480)))

(assert (=> d!161251 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 mask!2480) lt!666353)))

(declare-fun b!1543064 () Bool)

(assert (=> b!1543064 (= e!858346 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 (select (store (arr!49429 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102453 (store (arr!49429 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49980 a!2792)) mask!2480) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480)))))

(assert (= (and d!161251 res!1058142) b!1543064))

(declare-fun m!1425021 () Bool)

(assert (=> d!161251 m!1425021))

(assert (=> d!161251 m!1424889))

(assert (=> b!1543064 m!1424875))

(assert (=> b!1543064 m!1424901))

(assert (=> b!1543064 m!1424875))

(assert (=> b!1543064 m!1424883))

(assert (=> b!1543064 m!1424881))

(assert (=> b!1543064 m!1424881))

(declare-fun m!1425023 () Bool)

(assert (=> b!1543064 m!1425023))

(assert (=> b!1542942 d!161251))

(declare-fun e!858349 () SeekEntryResult!13450)

(declare-fun b!1543065 () Bool)

(assert (=> b!1543065 (= e!858349 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!666285 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1543066 () Bool)

(declare-fun e!858347 () SeekEntryResult!13450)

(assert (=> b!1543066 (= e!858347 Undefined!13450)))

(declare-fun b!1543067 () Bool)

(declare-fun e!858348 () SeekEntryResult!13450)

(assert (=> b!1543067 (= e!858348 (Found!13450 lt!666285))))

(declare-fun b!1543068 () Bool)

(declare-fun c!142031 () Bool)

(declare-fun lt!666355 () (_ BitVec 64))

(assert (=> b!1543068 (= c!142031 (= lt!666355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1543068 (= e!858348 e!858349)))

(declare-fun d!161265 () Bool)

(declare-fun lt!666354 () SeekEntryResult!13450)

(assert (=> d!161265 (and (or ((_ is Undefined!13450) lt!666354) (not ((_ is Found!13450) lt!666354)) (and (bvsge (index!56196 lt!666354) #b00000000000000000000000000000000) (bvslt (index!56196 lt!666354) (size!49980 a!2792)))) (or ((_ is Undefined!13450) lt!666354) ((_ is Found!13450) lt!666354) (not ((_ is MissingVacant!13450) lt!666354)) (not (= (index!56198 lt!666354) vacantIndex!5)) (and (bvsge (index!56198 lt!666354) #b00000000000000000000000000000000) (bvslt (index!56198 lt!666354) (size!49980 a!2792)))) (or ((_ is Undefined!13450) lt!666354) (ite ((_ is Found!13450) lt!666354) (= (select (arr!49429 a!2792) (index!56196 lt!666354)) (select (arr!49429 a!2792) j!64)) (and ((_ is MissingVacant!13450) lt!666354) (= (index!56198 lt!666354) vacantIndex!5) (= (select (arr!49429 a!2792) (index!56198 lt!666354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161265 (= lt!666354 e!858347)))

(declare-fun c!142033 () Bool)

(assert (=> d!161265 (= c!142033 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!161265 (= lt!666355 (select (arr!49429 a!2792) lt!666285))))

(assert (=> d!161265 (validMask!0 mask!2480)))

(assert (=> d!161265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666285 vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480) lt!666354)))

(declare-fun b!1543069 () Bool)

(assert (=> b!1543069 (= e!858349 (MissingVacant!13450 vacantIndex!5))))

(declare-fun b!1543070 () Bool)

(assert (=> b!1543070 (= e!858347 e!858348)))

(declare-fun c!142032 () Bool)

(assert (=> b!1543070 (= c!142032 (= lt!666355 (select (arr!49429 a!2792) j!64)))))

(assert (= (and d!161265 c!142033) b!1543066))

(assert (= (and d!161265 (not c!142033)) b!1543070))

(assert (= (and b!1543070 c!142032) b!1543067))

(assert (= (and b!1543070 (not c!142032)) b!1543068))

(assert (= (and b!1543068 c!142031) b!1543069))

(assert (= (and b!1543068 (not c!142031)) b!1543065))

(assert (=> b!1543065 m!1424999))

(assert (=> b!1543065 m!1424999))

(assert (=> b!1543065 m!1424875))

(declare-fun m!1425025 () Bool)

(assert (=> b!1543065 m!1425025))

(declare-fun m!1425027 () Bool)

(assert (=> d!161265 m!1425027))

(declare-fun m!1425029 () Bool)

(assert (=> d!161265 m!1425029))

(declare-fun m!1425031 () Bool)

(assert (=> d!161265 m!1425031))

(assert (=> d!161265 m!1424889))

(assert (=> b!1542948 d!161265))

(declare-fun d!161267 () Bool)

(declare-fun lt!666358 () (_ BitVec 32))

(assert (=> d!161267 (and (bvsge lt!666358 #b00000000000000000000000000000000) (bvslt lt!666358 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!161267 (= lt!666358 (choose!52 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (=> d!161267 (validMask!0 mask!2480)))

(assert (=> d!161267 (= (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) lt!666358)))

(declare-fun bs!44245 () Bool)

(assert (= bs!44245 d!161267))

(declare-fun m!1425037 () Bool)

(assert (=> bs!44245 m!1425037))

(assert (=> bs!44245 m!1424889))

(assert (=> b!1542943 d!161267))

(declare-fun b!1543109 () Bool)

(declare-fun e!858380 () Bool)

(declare-fun call!68817 () Bool)

(assert (=> b!1543109 (= e!858380 call!68817)))

(declare-fun bm!68814 () Bool)

(assert (=> bm!68814 (= call!68817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1543110 () Bool)

(declare-fun e!858381 () Bool)

(assert (=> b!1543110 (= e!858381 call!68817)))

(declare-fun d!161271 () Bool)

(declare-fun res!1058165 () Bool)

(declare-fun e!858382 () Bool)

(assert (=> d!161271 (=> res!1058165 e!858382)))

(assert (=> d!161271 (= res!1058165 (bvsge #b00000000000000000000000000000000 (size!49980 a!2792)))))

(assert (=> d!161271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!858382)))

(declare-fun b!1543111 () Bool)

(assert (=> b!1543111 (= e!858382 e!858380)))

(declare-fun c!142042 () Bool)

(assert (=> b!1543111 (= c!142042 (validKeyInArray!0 (select (arr!49429 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1543112 () Bool)

(assert (=> b!1543112 (= e!858380 e!858381)))

(declare-fun lt!666367 () (_ BitVec 64))

(assert (=> b!1543112 (= lt!666367 (select (arr!49429 a!2792) #b00000000000000000000000000000000))))

(declare-fun lt!666366 () Unit!51373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102452 (_ BitVec 64) (_ BitVec 32)) Unit!51373)

(assert (=> b!1543112 (= lt!666366 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!666367 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1543112 (arrayContainsKey!0 a!2792 lt!666367 #b00000000000000000000000000000000)))

(declare-fun lt!666365 () Unit!51373)

(assert (=> b!1543112 (= lt!666365 lt!666366)))

(declare-fun res!1058166 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102452 (_ BitVec 32)) SeekEntryResult!13450)

(assert (=> b!1543112 (= res!1058166 (= (seekEntryOrOpen!0 (select (arr!49429 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13450 #b00000000000000000000000000000000)))))

(assert (=> b!1543112 (=> (not res!1058166) (not e!858381))))

(assert (= (and d!161271 (not res!1058165)) b!1543111))

(assert (= (and b!1543111 c!142042) b!1543112))

(assert (= (and b!1543111 (not c!142042)) b!1543109))

(assert (= (and b!1543112 res!1058166) b!1543110))

(assert (= (or b!1543110 b!1543109) bm!68814))

(declare-fun m!1425047 () Bool)

(assert (=> bm!68814 m!1425047))

(assert (=> b!1543111 m!1424981))

(assert (=> b!1543111 m!1424981))

(assert (=> b!1543111 m!1424987))

(assert (=> b!1543112 m!1424981))

(declare-fun m!1425049 () Bool)

(assert (=> b!1543112 m!1425049))

(declare-fun m!1425051 () Bool)

(assert (=> b!1543112 m!1425051))

(assert (=> b!1543112 m!1424981))

(declare-fun m!1425053 () Bool)

(assert (=> b!1543112 m!1425053))

(assert (=> b!1542944 d!161271))

(declare-fun b!1543113 () Bool)

(declare-fun e!858385 () SeekEntryResult!13450)

(assert (=> b!1543113 (= e!858385 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1543114 () Bool)

(declare-fun e!858383 () SeekEntryResult!13450)

(assert (=> b!1543114 (= e!858383 Undefined!13450)))

(declare-fun b!1543115 () Bool)

(declare-fun e!858384 () SeekEntryResult!13450)

(assert (=> b!1543115 (= e!858384 (Found!13450 index!463))))

(declare-fun b!1543116 () Bool)

(declare-fun c!142043 () Bool)

(declare-fun lt!666373 () (_ BitVec 64))

(assert (=> b!1543116 (= c!142043 (= lt!666373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1543116 (= e!858384 e!858385)))

(declare-fun d!161277 () Bool)

(declare-fun lt!666372 () SeekEntryResult!13450)

(assert (=> d!161277 (and (or ((_ is Undefined!13450) lt!666372) (not ((_ is Found!13450) lt!666372)) (and (bvsge (index!56196 lt!666372) #b00000000000000000000000000000000) (bvslt (index!56196 lt!666372) (size!49980 a!2792)))) (or ((_ is Undefined!13450) lt!666372) ((_ is Found!13450) lt!666372) (not ((_ is MissingVacant!13450) lt!666372)) (not (= (index!56198 lt!666372) vacantIndex!5)) (and (bvsge (index!56198 lt!666372) #b00000000000000000000000000000000) (bvslt (index!56198 lt!666372) (size!49980 a!2792)))) (or ((_ is Undefined!13450) lt!666372) (ite ((_ is Found!13450) lt!666372) (= (select (arr!49429 a!2792) (index!56196 lt!666372)) (select (arr!49429 a!2792) j!64)) (and ((_ is MissingVacant!13450) lt!666372) (= (index!56198 lt!666372) vacantIndex!5) (= (select (arr!49429 a!2792) (index!56198 lt!666372)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161277 (= lt!666372 e!858383)))

(declare-fun c!142045 () Bool)

(assert (=> d!161277 (= c!142045 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!161277 (= lt!666373 (select (arr!49429 a!2792) index!463))))

(assert (=> d!161277 (validMask!0 mask!2480)))

(assert (=> d!161277 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49429 a!2792) j!64) a!2792 mask!2480) lt!666372)))

(declare-fun b!1543117 () Bool)

(assert (=> b!1543117 (= e!858385 (MissingVacant!13450 vacantIndex!5))))

(declare-fun b!1543118 () Bool)

(assert (=> b!1543118 (= e!858383 e!858384)))

(declare-fun c!142044 () Bool)

(assert (=> b!1543118 (= c!142044 (= lt!666373 (select (arr!49429 a!2792) j!64)))))

(assert (= (and d!161277 c!142045) b!1543114))

(assert (= (and d!161277 (not c!142045)) b!1543118))

(assert (= (and b!1543118 c!142044) b!1543115))

(assert (= (and b!1543118 (not c!142044)) b!1543116))

(assert (= (and b!1543116 c!142043) b!1543117))

(assert (= (and b!1543116 (not c!142043)) b!1543113))

(assert (=> b!1543113 m!1424989))

(assert (=> b!1543113 m!1424989))

(assert (=> b!1543113 m!1424875))

(declare-fun m!1425055 () Bool)

(assert (=> b!1543113 m!1425055))

(declare-fun m!1425057 () Bool)

(assert (=> d!161277 m!1425057))

(declare-fun m!1425059 () Bool)

(assert (=> d!161277 m!1425059))

(assert (=> d!161277 m!1424873))

(assert (=> d!161277 m!1424889))

(assert (=> b!1542949 d!161277))

(declare-fun d!161279 () Bool)

(assert (=> d!161279 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131796 d!161279))

(declare-fun d!161289 () Bool)

(assert (=> d!161289 (= (array_inv!38710 a!2792) (bvsge (size!49980 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131796 d!161289))

(declare-fun d!161291 () Bool)

(assert (=> d!161291 (= (validKeyInArray!0 (select (arr!49429 a!2792) i!951)) (and (not (= (select (arr!49429 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49429 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1542945 d!161291))

(check-sat (not b!1543044) (not d!161277) (not b!1543065) (not b!1543064) (not b!1543111) (not b!1543024) (not b!1543113) (not b!1543112) (not d!161251) (not d!161265) (not d!161267) (not bm!68814) (not d!161247) (not b!1543025) (not bm!68802) (not b!1543038) (not d!161249) (not b!1543023))
(check-sat)
