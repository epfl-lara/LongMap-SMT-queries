; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131148 () Bool)

(assert start!131148)

(declare-fun b!1538858 () Bool)

(declare-fun res!1056020 () Bool)

(declare-fun e!855960 () Bool)

(assert (=> b!1538858 (=> (not res!1056020) (not e!855960))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((array!102211 0))(
  ( (array!102212 (arr!49321 (Array (_ BitVec 32) (_ BitVec 64))) (size!49873 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102211)

(assert (=> b!1538858 (= res!1056020 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49873 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49873 a!2792)) (= (select (arr!49321 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538859 () Bool)

(declare-fun res!1056024 () Bool)

(assert (=> b!1538859 (=> (not res!1056024) (not e!855960))))

(declare-datatypes ((List!35873 0))(
  ( (Nil!35870) (Cons!35869 (h!37315 (_ BitVec 64)) (t!50559 List!35873)) )
))
(declare-fun arrayNoDuplicates!0 (array!102211 (_ BitVec 32) List!35873) Bool)

(assert (=> b!1538859 (= res!1056024 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35870))))

(declare-fun b!1538860 () Bool)

(assert (=> b!1538860 (= e!855960 (or (bvslt (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110)))))

(declare-fun lt!664695 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538860 (= lt!664695 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538861 () Bool)

(declare-fun res!1056025 () Bool)

(assert (=> b!1538861 (=> (not res!1056025) (not e!855960))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13472 0))(
  ( (MissingZero!13472 (index!56283 (_ BitVec 32))) (Found!13472 (index!56284 (_ BitVec 32))) (Intermediate!13472 (undefined!14284 Bool) (index!56285 (_ BitVec 32)) (x!138008 (_ BitVec 32))) (Undefined!13472) (MissingVacant!13472 (index!56286 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102211 (_ BitVec 32)) SeekEntryResult!13472)

(assert (=> b!1538861 (= res!1056025 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49321 a!2792) j!64) a!2792 mask!2480) (Found!13472 j!64)))))

(declare-fun b!1538862 () Bool)

(declare-fun res!1056021 () Bool)

(assert (=> b!1538862 (=> (not res!1056021) (not e!855960))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538862 (= res!1056021 (and (= (size!49873 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49873 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49873 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538863 () Bool)

(declare-fun res!1056027 () Bool)

(assert (=> b!1538863 (=> (not res!1056027) (not e!855960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538863 (= res!1056027 (validKeyInArray!0 (select (arr!49321 a!2792) i!951)))))

(declare-fun b!1538864 () Bool)

(declare-fun res!1056026 () Bool)

(assert (=> b!1538864 (=> (not res!1056026) (not e!855960))))

(assert (=> b!1538864 (= res!1056026 (validKeyInArray!0 (select (arr!49321 a!2792) j!64)))))

(declare-fun b!1538865 () Bool)

(declare-fun res!1056023 () Bool)

(assert (=> b!1538865 (=> (not res!1056023) (not e!855960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102211 (_ BitVec 32)) Bool)

(assert (=> b!1538865 (= res!1056023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1056028 () Bool)

(assert (=> start!131148 (=> (not res!1056028) (not e!855960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131148 (= res!1056028 (validMask!0 mask!2480))))

(assert (=> start!131148 e!855960))

(assert (=> start!131148 true))

(declare-fun array_inv!38554 (array!102211) Bool)

(assert (=> start!131148 (array_inv!38554 a!2792)))

(declare-fun b!1538866 () Bool)

(declare-fun res!1056022 () Bool)

(assert (=> b!1538866 (=> (not res!1056022) (not e!855960))))

(assert (=> b!1538866 (= res!1056022 (not (= (select (arr!49321 a!2792) index!463) (select (arr!49321 a!2792) j!64))))))

(assert (= (and start!131148 res!1056028) b!1538862))

(assert (= (and b!1538862 res!1056021) b!1538863))

(assert (= (and b!1538863 res!1056027) b!1538864))

(assert (= (and b!1538864 res!1056026) b!1538865))

(assert (= (and b!1538865 res!1056023) b!1538859))

(assert (= (and b!1538859 res!1056024) b!1538858))

(assert (= (and b!1538858 res!1056020) b!1538861))

(assert (= (and b!1538861 res!1056025) b!1538866))

(assert (= (and b!1538866 res!1056022) b!1538860))

(declare-fun m!1420631 () Bool)

(assert (=> b!1538861 m!1420631))

(assert (=> b!1538861 m!1420631))

(declare-fun m!1420633 () Bool)

(assert (=> b!1538861 m!1420633))

(declare-fun m!1420635 () Bool)

(assert (=> b!1538865 m!1420635))

(assert (=> b!1538864 m!1420631))

(assert (=> b!1538864 m!1420631))

(declare-fun m!1420637 () Bool)

(assert (=> b!1538864 m!1420637))

(declare-fun m!1420639 () Bool)

(assert (=> b!1538866 m!1420639))

(assert (=> b!1538866 m!1420631))

(declare-fun m!1420641 () Bool)

(assert (=> b!1538858 m!1420641))

(declare-fun m!1420643 () Bool)

(assert (=> start!131148 m!1420643))

(declare-fun m!1420645 () Bool)

(assert (=> start!131148 m!1420645))

(declare-fun m!1420647 () Bool)

(assert (=> b!1538859 m!1420647))

(declare-fun m!1420649 () Bool)

(assert (=> b!1538863 m!1420649))

(assert (=> b!1538863 m!1420649))

(declare-fun m!1420651 () Bool)

(assert (=> b!1538863 m!1420651))

(declare-fun m!1420653 () Bool)

(assert (=> b!1538860 m!1420653))

(check-sat (not b!1538863) (not b!1538864) (not b!1538859) (not b!1538865) (not start!131148) (not b!1538860) (not b!1538861))
(check-sat)
(get-model)

(declare-fun d!160119 () Bool)

(assert (=> d!160119 (= (validKeyInArray!0 (select (arr!49321 a!2792) i!951)) (and (not (= (select (arr!49321 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49321 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1538863 d!160119))

(declare-fun b!1538933 () Bool)

(declare-fun c!140988 () Bool)

(declare-fun lt!664706 () (_ BitVec 64))

(assert (=> b!1538933 (= c!140988 (= lt!664706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!855982 () SeekEntryResult!13472)

(declare-fun e!855980 () SeekEntryResult!13472)

(assert (=> b!1538933 (= e!855982 e!855980)))

(declare-fun b!1538934 () Bool)

(assert (=> b!1538934 (= e!855980 (MissingVacant!13472 vacantIndex!5))))

(declare-fun d!160121 () Bool)

(declare-fun lt!664707 () SeekEntryResult!13472)

(get-info :version)

(assert (=> d!160121 (and (or ((_ is Undefined!13472) lt!664707) (not ((_ is Found!13472) lt!664707)) (and (bvsge (index!56284 lt!664707) #b00000000000000000000000000000000) (bvslt (index!56284 lt!664707) (size!49873 a!2792)))) (or ((_ is Undefined!13472) lt!664707) ((_ is Found!13472) lt!664707) (not ((_ is MissingVacant!13472) lt!664707)) (not (= (index!56286 lt!664707) vacantIndex!5)) (and (bvsge (index!56286 lt!664707) #b00000000000000000000000000000000) (bvslt (index!56286 lt!664707) (size!49873 a!2792)))) (or ((_ is Undefined!13472) lt!664707) (ite ((_ is Found!13472) lt!664707) (= (select (arr!49321 a!2792) (index!56284 lt!664707)) (select (arr!49321 a!2792) j!64)) (and ((_ is MissingVacant!13472) lt!664707) (= (index!56286 lt!664707) vacantIndex!5) (= (select (arr!49321 a!2792) (index!56286 lt!664707)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!855981 () SeekEntryResult!13472)

(assert (=> d!160121 (= lt!664707 e!855981)))

(declare-fun c!140987 () Bool)

(assert (=> d!160121 (= c!140987 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160121 (= lt!664706 (select (arr!49321 a!2792) index!463))))

(assert (=> d!160121 (validMask!0 mask!2480)))

(assert (=> d!160121 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49321 a!2792) j!64) a!2792 mask!2480) lt!664707)))

(declare-fun b!1538935 () Bool)

(assert (=> b!1538935 (= e!855981 e!855982)))

(declare-fun c!140986 () Bool)

(assert (=> b!1538935 (= c!140986 (= lt!664706 (select (arr!49321 a!2792) j!64)))))

(declare-fun b!1538936 () Bool)

(assert (=> b!1538936 (= e!855982 (Found!13472 index!463))))

(declare-fun b!1538937 () Bool)

(assert (=> b!1538937 (= e!855981 Undefined!13472)))

(declare-fun b!1538938 () Bool)

(assert (=> b!1538938 (= e!855980 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49321 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and d!160121 c!140987) b!1538937))

(assert (= (and d!160121 (not c!140987)) b!1538935))

(assert (= (and b!1538935 c!140986) b!1538936))

(assert (= (and b!1538935 (not c!140986)) b!1538933))

(assert (= (and b!1538933 c!140988) b!1538934))

(assert (= (and b!1538933 (not c!140988)) b!1538938))

(declare-fun m!1420703 () Bool)

(assert (=> d!160121 m!1420703))

(declare-fun m!1420705 () Bool)

(assert (=> d!160121 m!1420705))

(assert (=> d!160121 m!1420639))

(assert (=> d!160121 m!1420643))

(assert (=> b!1538938 m!1420653))

(assert (=> b!1538938 m!1420653))

(assert (=> b!1538938 m!1420631))

(declare-fun m!1420707 () Bool)

(assert (=> b!1538938 m!1420707))

(assert (=> b!1538861 d!160121))

(declare-fun d!160125 () Bool)

(assert (=> d!160125 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131148 d!160125))

(declare-fun d!160135 () Bool)

(assert (=> d!160135 (= (array_inv!38554 a!2792) (bvsge (size!49873 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131148 d!160135))

(declare-fun b!1538974 () Bool)

(declare-fun e!856007 () Bool)

(declare-fun call!68569 () Bool)

(assert (=> b!1538974 (= e!856007 call!68569)))

(declare-fun b!1538975 () Bool)

(declare-fun e!856009 () Bool)

(declare-fun e!856008 () Bool)

(assert (=> b!1538975 (= e!856009 e!856008)))

(declare-fun c!141000 () Bool)

(assert (=> b!1538975 (= c!141000 (validKeyInArray!0 (select (arr!49321 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68566 () Bool)

(assert (=> bm!68566 (= call!68569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun d!160137 () Bool)

(declare-fun res!1056096 () Bool)

(assert (=> d!160137 (=> res!1056096 e!856009)))

(assert (=> d!160137 (= res!1056096 (bvsge #b00000000000000000000000000000000 (size!49873 a!2792)))))

(assert (=> d!160137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856009)))

(declare-fun b!1538976 () Bool)

(assert (=> b!1538976 (= e!856008 e!856007)))

(declare-fun lt!664721 () (_ BitVec 64))

(assert (=> b!1538976 (= lt!664721 (select (arr!49321 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51239 0))(
  ( (Unit!51240) )
))
(declare-fun lt!664722 () Unit!51239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102211 (_ BitVec 64) (_ BitVec 32)) Unit!51239)

(assert (=> b!1538976 (= lt!664722 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664721 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1538976 (arrayContainsKey!0 a!2792 lt!664721 #b00000000000000000000000000000000)))

(declare-fun lt!664723 () Unit!51239)

(assert (=> b!1538976 (= lt!664723 lt!664722)))

(declare-fun res!1056097 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102211 (_ BitVec 32)) SeekEntryResult!13472)

(assert (=> b!1538976 (= res!1056097 (= (seekEntryOrOpen!0 (select (arr!49321 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13472 #b00000000000000000000000000000000)))))

(assert (=> b!1538976 (=> (not res!1056097) (not e!856007))))

(declare-fun b!1538977 () Bool)

(assert (=> b!1538977 (= e!856008 call!68569)))

(assert (= (and d!160137 (not res!1056096)) b!1538975))

(assert (= (and b!1538975 c!141000) b!1538976))

(assert (= (and b!1538975 (not c!141000)) b!1538977))

(assert (= (and b!1538976 res!1056097) b!1538974))

(assert (= (or b!1538974 b!1538977) bm!68566))

(declare-fun m!1420719 () Bool)

(assert (=> b!1538975 m!1420719))

(assert (=> b!1538975 m!1420719))

(declare-fun m!1420721 () Bool)

(assert (=> b!1538975 m!1420721))

(declare-fun m!1420723 () Bool)

(assert (=> bm!68566 m!1420723))

(assert (=> b!1538976 m!1420719))

(declare-fun m!1420725 () Bool)

(assert (=> b!1538976 m!1420725))

(declare-fun m!1420727 () Bool)

(assert (=> b!1538976 m!1420727))

(assert (=> b!1538976 m!1420719))

(declare-fun m!1420729 () Bool)

(assert (=> b!1538976 m!1420729))

(assert (=> b!1538865 d!160137))

(declare-fun d!160141 () Bool)

(declare-fun lt!664732 () (_ BitVec 32))

(assert (=> d!160141 (and (bvsge lt!664732 #b00000000000000000000000000000000) (bvslt lt!664732 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160141 (= lt!664732 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160141 (validMask!0 mask!2480)))

(assert (=> d!160141 (= (nextIndex!0 index!463 x!510 mask!2480) lt!664732)))

(declare-fun bs!44143 () Bool)

(assert (= bs!44143 d!160141))

(declare-fun m!1420737 () Bool)

(assert (=> bs!44143 m!1420737))

(assert (=> bs!44143 m!1420643))

(assert (=> b!1538860 d!160141))

(declare-fun d!160145 () Bool)

(assert (=> d!160145 (= (validKeyInArray!0 (select (arr!49321 a!2792) j!64)) (and (not (= (select (arr!49321 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49321 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1538864 d!160145))

(declare-fun b!1539012 () Bool)

(declare-fun e!856030 () Bool)

(declare-fun call!68572 () Bool)

(assert (=> b!1539012 (= e!856030 call!68572)))

(declare-fun b!1539013 () Bool)

(declare-fun e!856033 () Bool)

(declare-fun contains!9974 (List!35873 (_ BitVec 64)) Bool)

(assert (=> b!1539013 (= e!856033 (contains!9974 Nil!35870 (select (arr!49321 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539014 () Bool)

(declare-fun e!856032 () Bool)

(assert (=> b!1539014 (= e!856032 e!856030)))

(declare-fun c!141015 () Bool)

(assert (=> b!1539014 (= c!141015 (validKeyInArray!0 (select (arr!49321 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539015 () Bool)

(declare-fun e!856031 () Bool)

(assert (=> b!1539015 (= e!856031 e!856032)))

(declare-fun res!1056106 () Bool)

(assert (=> b!1539015 (=> (not res!1056106) (not e!856032))))

(assert (=> b!1539015 (= res!1056106 (not e!856033))))

(declare-fun res!1056105 () Bool)

(assert (=> b!1539015 (=> (not res!1056105) (not e!856033))))

(assert (=> b!1539015 (= res!1056105 (validKeyInArray!0 (select (arr!49321 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160147 () Bool)

(declare-fun res!1056104 () Bool)

(assert (=> d!160147 (=> res!1056104 e!856031)))

(assert (=> d!160147 (= res!1056104 (bvsge #b00000000000000000000000000000000 (size!49873 a!2792)))))

(assert (=> d!160147 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35870) e!856031)))

(declare-fun bm!68569 () Bool)

(assert (=> bm!68569 (= call!68572 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141015 (Cons!35869 (select (arr!49321 a!2792) #b00000000000000000000000000000000) Nil!35870) Nil!35870)))))

(declare-fun b!1539016 () Bool)

(assert (=> b!1539016 (= e!856030 call!68572)))

(assert (= (and d!160147 (not res!1056104)) b!1539015))

(assert (= (and b!1539015 res!1056105) b!1539013))

(assert (= (and b!1539015 res!1056106) b!1539014))

(assert (= (and b!1539014 c!141015) b!1539016))

(assert (= (and b!1539014 (not c!141015)) b!1539012))

(assert (= (or b!1539016 b!1539012) bm!68569))

(assert (=> b!1539013 m!1420719))

(assert (=> b!1539013 m!1420719))

(declare-fun m!1420745 () Bool)

(assert (=> b!1539013 m!1420745))

(assert (=> b!1539014 m!1420719))

(assert (=> b!1539014 m!1420719))

(assert (=> b!1539014 m!1420721))

(assert (=> b!1539015 m!1420719))

(assert (=> b!1539015 m!1420719))

(assert (=> b!1539015 m!1420721))

(assert (=> bm!68569 m!1420719))

(declare-fun m!1420747 () Bool)

(assert (=> bm!68569 m!1420747))

(assert (=> b!1538859 d!160147))

(check-sat (not bm!68569) (not d!160141) (not b!1538938) (not b!1539013) (not b!1539014) (not bm!68566) (not b!1538975) (not b!1538976) (not d!160121) (not b!1539015))
(check-sat)
