; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131092 () Bool)

(assert start!131092)

(declare-fun b!1538077 () Bool)

(declare-fun e!855846 () Bool)

(declare-fun e!855845 () Bool)

(assert (=> b!1538077 (= e!855846 e!855845)))

(declare-fun res!1055169 () Bool)

(assert (=> b!1538077 (=> (not res!1055169) (not e!855845))))

(declare-datatypes ((array!102190 0))(
  ( (array!102191 (arr!49311 (Array (_ BitVec 32) (_ BitVec 64))) (size!49861 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102190)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13437 0))(
  ( (MissingZero!13437 (index!56143 (_ BitVec 32))) (Found!13437 (index!56144 (_ BitVec 32))) (Intermediate!13437 (undefined!14249 Bool) (index!56145 (_ BitVec 32)) (x!137879 (_ BitVec 32))) (Undefined!13437) (MissingVacant!13437 (index!56146 (_ BitVec 32))) )
))
(declare-fun lt!664825 () SeekEntryResult!13437)

(assert (=> b!1538077 (= res!1055169 (and (= lt!664825 (Found!13437 j!64)) (= (select (arr!49311 a!2792) index!463) (select (arr!49311 a!2792) j!64))))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102190 (_ BitVec 32)) SeekEntryResult!13437)

(assert (=> b!1538077 (= lt!664825 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49311 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538078 () Bool)

(declare-fun res!1055168 () Bool)

(assert (=> b!1538078 (=> (not res!1055168) (not e!855846))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538078 (= res!1055168 (and (= (size!49861 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49861 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49861 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538079 () Bool)

(declare-fun res!1055166 () Bool)

(assert (=> b!1538079 (=> (not res!1055166) (not e!855846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538079 (= res!1055166 (validKeyInArray!0 (select (arr!49311 a!2792) j!64)))))

(declare-fun b!1538080 () Bool)

(declare-fun res!1055165 () Bool)

(assert (=> b!1538080 (=> (not res!1055165) (not e!855846))))

(assert (=> b!1538080 (= res!1055165 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49861 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49861 a!2792)) (= (select (arr!49311 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538081 () Bool)

(declare-fun res!1055170 () Bool)

(assert (=> b!1538081 (=> (not res!1055170) (not e!855846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102190 (_ BitVec 32)) Bool)

(assert (=> b!1538081 (= res!1055170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538082 () Bool)

(assert (=> b!1538082 (= e!855845 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792)) mask!2480) lt!664825)))))

(declare-fun res!1055164 () Bool)

(assert (=> start!131092 (=> (not res!1055164) (not e!855846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131092 (= res!1055164 (validMask!0 mask!2480))))

(assert (=> start!131092 e!855846))

(assert (=> start!131092 true))

(declare-fun array_inv!38339 (array!102190) Bool)

(assert (=> start!131092 (array_inv!38339 a!2792)))

(declare-fun b!1538083 () Bool)

(declare-fun res!1055167 () Bool)

(assert (=> b!1538083 (=> (not res!1055167) (not e!855846))))

(declare-datatypes ((List!35785 0))(
  ( (Nil!35782) (Cons!35781 (h!37226 (_ BitVec 64)) (t!50479 List!35785)) )
))
(declare-fun arrayNoDuplicates!0 (array!102190 (_ BitVec 32) List!35785) Bool)

(assert (=> b!1538083 (= res!1055167 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35782))))

(declare-fun b!1538084 () Bool)

(declare-fun res!1055163 () Bool)

(assert (=> b!1538084 (=> (not res!1055163) (not e!855846))))

(assert (=> b!1538084 (= res!1055163 (validKeyInArray!0 (select (arr!49311 a!2792) i!951)))))

(assert (= (and start!131092 res!1055164) b!1538078))

(assert (= (and b!1538078 res!1055168) b!1538084))

(assert (= (and b!1538084 res!1055163) b!1538079))

(assert (= (and b!1538079 res!1055166) b!1538081))

(assert (= (and b!1538081 res!1055170) b!1538083))

(assert (= (and b!1538083 res!1055167) b!1538080))

(assert (= (and b!1538080 res!1055165) b!1538077))

(assert (= (and b!1538077 res!1055169) b!1538082))

(declare-fun m!1420579 () Bool)

(assert (=> b!1538082 m!1420579))

(declare-fun m!1420581 () Bool)

(assert (=> b!1538082 m!1420581))

(assert (=> b!1538082 m!1420581))

(declare-fun m!1420583 () Bool)

(assert (=> b!1538082 m!1420583))

(declare-fun m!1420585 () Bool)

(assert (=> start!131092 m!1420585))

(declare-fun m!1420587 () Bool)

(assert (=> start!131092 m!1420587))

(declare-fun m!1420589 () Bool)

(assert (=> b!1538077 m!1420589))

(declare-fun m!1420591 () Bool)

(assert (=> b!1538077 m!1420591))

(assert (=> b!1538077 m!1420591))

(declare-fun m!1420593 () Bool)

(assert (=> b!1538077 m!1420593))

(assert (=> b!1538079 m!1420591))

(assert (=> b!1538079 m!1420591))

(declare-fun m!1420595 () Bool)

(assert (=> b!1538079 m!1420595))

(declare-fun m!1420597 () Bool)

(assert (=> b!1538080 m!1420597))

(declare-fun m!1420599 () Bool)

(assert (=> b!1538084 m!1420599))

(assert (=> b!1538084 m!1420599))

(declare-fun m!1420601 () Bool)

(assert (=> b!1538084 m!1420601))

(declare-fun m!1420603 () Bool)

(assert (=> b!1538081 m!1420603))

(declare-fun m!1420605 () Bool)

(assert (=> b!1538083 m!1420605))

(check-sat (not b!1538081) (not b!1538084) (not b!1538077) (not b!1538083) (not b!1538082) (not start!131092) (not b!1538079))
(check-sat)
(get-model)

(declare-fun d!160301 () Bool)

(assert (=> d!160301 (= (validKeyInArray!0 (select (arr!49311 a!2792) i!951)) (and (not (= (select (arr!49311 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49311 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1538084 d!160301))

(declare-fun d!160303 () Bool)

(assert (=> d!160303 (= (validKeyInArray!0 (select (arr!49311 a!2792) j!64)) (and (not (= (select (arr!49311 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49311 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1538079 d!160303))

(declare-fun b!1538117 () Bool)

(declare-fun e!855863 () Bool)

(declare-fun e!855864 () Bool)

(assert (=> b!1538117 (= e!855863 e!855864)))

(declare-fun c!141017 () Bool)

(assert (=> b!1538117 (= c!141017 (validKeyInArray!0 (select (arr!49311 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160305 () Bool)

(declare-fun res!1055199 () Bool)

(assert (=> d!160305 (=> res!1055199 e!855863)))

(assert (=> d!160305 (= res!1055199 (bvsge #b00000000000000000000000000000000 (size!49861 a!2792)))))

(assert (=> d!160305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!855863)))

(declare-fun b!1538118 () Bool)

(declare-fun e!855865 () Bool)

(declare-fun call!68583 () Bool)

(assert (=> b!1538118 (= e!855865 call!68583)))

(declare-fun bm!68580 () Bool)

(assert (=> bm!68580 (= call!68583 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1538119 () Bool)

(assert (=> b!1538119 (= e!855864 call!68583)))

(declare-fun b!1538120 () Bool)

(assert (=> b!1538120 (= e!855864 e!855865)))

(declare-fun lt!664836 () (_ BitVec 64))

(assert (=> b!1538120 (= lt!664836 (select (arr!49311 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51402 0))(
  ( (Unit!51403) )
))
(declare-fun lt!664837 () Unit!51402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102190 (_ BitVec 64) (_ BitVec 32)) Unit!51402)

(assert (=> b!1538120 (= lt!664837 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664836 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1538120 (arrayContainsKey!0 a!2792 lt!664836 #b00000000000000000000000000000000)))

(declare-fun lt!664835 () Unit!51402)

(assert (=> b!1538120 (= lt!664835 lt!664837)))

(declare-fun res!1055200 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102190 (_ BitVec 32)) SeekEntryResult!13437)

(assert (=> b!1538120 (= res!1055200 (= (seekEntryOrOpen!0 (select (arr!49311 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13437 #b00000000000000000000000000000000)))))

(assert (=> b!1538120 (=> (not res!1055200) (not e!855865))))

(assert (= (and d!160305 (not res!1055199)) b!1538117))

(assert (= (and b!1538117 c!141017) b!1538120))

(assert (= (and b!1538117 (not c!141017)) b!1538119))

(assert (= (and b!1538120 res!1055200) b!1538118))

(assert (= (or b!1538118 b!1538119) bm!68580))

(declare-fun m!1420635 () Bool)

(assert (=> b!1538117 m!1420635))

(assert (=> b!1538117 m!1420635))

(declare-fun m!1420637 () Bool)

(assert (=> b!1538117 m!1420637))

(declare-fun m!1420639 () Bool)

(assert (=> bm!68580 m!1420639))

(assert (=> b!1538120 m!1420635))

(declare-fun m!1420641 () Bool)

(assert (=> b!1538120 m!1420641))

(declare-fun m!1420643 () Bool)

(assert (=> b!1538120 m!1420643))

(assert (=> b!1538120 m!1420635))

(declare-fun m!1420645 () Bool)

(assert (=> b!1538120 m!1420645))

(assert (=> b!1538081 d!160305))

(declare-fun d!160307 () Bool)

(declare-fun lt!664842 () SeekEntryResult!13437)

(get-info :version)

(assert (=> d!160307 (and (or ((_ is Undefined!13437) lt!664842) (not ((_ is Found!13437) lt!664842)) (and (bvsge (index!56144 lt!664842) #b00000000000000000000000000000000) (bvslt (index!56144 lt!664842) (size!49861 (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792)))))) (or ((_ is Undefined!13437) lt!664842) ((_ is Found!13437) lt!664842) (not ((_ is MissingVacant!13437) lt!664842)) (not (= (index!56146 lt!664842) vacantIndex!5)) (and (bvsge (index!56146 lt!664842) #b00000000000000000000000000000000) (bvslt (index!56146 lt!664842) (size!49861 (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792)))))) (or ((_ is Undefined!13437) lt!664842) (ite ((_ is Found!13437) lt!664842) (= (select (arr!49311 (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792))) (index!56144 lt!664842)) (select (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64)) (and ((_ is MissingVacant!13437) lt!664842) (= (index!56146 lt!664842) vacantIndex!5) (= (select (arr!49311 (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792))) (index!56146 lt!664842)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!855874 () SeekEntryResult!13437)

(assert (=> d!160307 (= lt!664842 e!855874)))

(declare-fun c!141025 () Bool)

(assert (=> d!160307 (= c!141025 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!664843 () (_ BitVec 64))

(assert (=> d!160307 (= lt!664843 (select (arr!49311 (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792))) index!463))))

(assert (=> d!160307 (validMask!0 mask!2480)))

(assert (=> d!160307 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792)) mask!2480) lt!664842)))

(declare-fun b!1538133 () Bool)

(assert (=> b!1538133 (= e!855874 Undefined!13437)))

(declare-fun b!1538134 () Bool)

(declare-fun e!855872 () SeekEntryResult!13437)

(assert (=> b!1538134 (= e!855874 e!855872)))

(declare-fun c!141026 () Bool)

(assert (=> b!1538134 (= c!141026 (= lt!664843 (select (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64)))))

(declare-fun b!1538135 () Bool)

(assert (=> b!1538135 (= e!855872 (Found!13437 index!463))))

(declare-fun e!855873 () SeekEntryResult!13437)

(declare-fun b!1538136 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538136 (= e!855873 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102191 (store (arr!49311 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49861 a!2792)) mask!2480))))

(declare-fun b!1538137 () Bool)

(declare-fun c!141024 () Bool)

(assert (=> b!1538137 (= c!141024 (= lt!664843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1538137 (= e!855872 e!855873)))

(declare-fun b!1538138 () Bool)

(assert (=> b!1538138 (= e!855873 (MissingVacant!13437 vacantIndex!5))))

(assert (= (and d!160307 c!141025) b!1538133))

(assert (= (and d!160307 (not c!141025)) b!1538134))

(assert (= (and b!1538134 c!141026) b!1538135))

(assert (= (and b!1538134 (not c!141026)) b!1538137))

(assert (= (and b!1538137 c!141024) b!1538138))

(assert (= (and b!1538137 (not c!141024)) b!1538136))

(declare-fun m!1420647 () Bool)

(assert (=> d!160307 m!1420647))

(declare-fun m!1420649 () Bool)

(assert (=> d!160307 m!1420649))

(declare-fun m!1420651 () Bool)

(assert (=> d!160307 m!1420651))

(assert (=> d!160307 m!1420585))

(declare-fun m!1420653 () Bool)

(assert (=> b!1538136 m!1420653))

(assert (=> b!1538136 m!1420653))

(assert (=> b!1538136 m!1420581))

(declare-fun m!1420655 () Bool)

(assert (=> b!1538136 m!1420655))

(assert (=> b!1538082 d!160307))

(declare-fun d!160309 () Bool)

(declare-fun lt!664844 () SeekEntryResult!13437)

(assert (=> d!160309 (and (or ((_ is Undefined!13437) lt!664844) (not ((_ is Found!13437) lt!664844)) (and (bvsge (index!56144 lt!664844) #b00000000000000000000000000000000) (bvslt (index!56144 lt!664844) (size!49861 a!2792)))) (or ((_ is Undefined!13437) lt!664844) ((_ is Found!13437) lt!664844) (not ((_ is MissingVacant!13437) lt!664844)) (not (= (index!56146 lt!664844) vacantIndex!5)) (and (bvsge (index!56146 lt!664844) #b00000000000000000000000000000000) (bvslt (index!56146 lt!664844) (size!49861 a!2792)))) (or ((_ is Undefined!13437) lt!664844) (ite ((_ is Found!13437) lt!664844) (= (select (arr!49311 a!2792) (index!56144 lt!664844)) (select (arr!49311 a!2792) j!64)) (and ((_ is MissingVacant!13437) lt!664844) (= (index!56146 lt!664844) vacantIndex!5) (= (select (arr!49311 a!2792) (index!56146 lt!664844)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!855877 () SeekEntryResult!13437)

(assert (=> d!160309 (= lt!664844 e!855877)))

(declare-fun c!141028 () Bool)

(assert (=> d!160309 (= c!141028 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!664845 () (_ BitVec 64))

(assert (=> d!160309 (= lt!664845 (select (arr!49311 a!2792) index!463))))

(assert (=> d!160309 (validMask!0 mask!2480)))

(assert (=> d!160309 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49311 a!2792) j!64) a!2792 mask!2480) lt!664844)))

(declare-fun b!1538139 () Bool)

(assert (=> b!1538139 (= e!855877 Undefined!13437)))

(declare-fun b!1538140 () Bool)

(declare-fun e!855875 () SeekEntryResult!13437)

(assert (=> b!1538140 (= e!855877 e!855875)))

(declare-fun c!141029 () Bool)

(assert (=> b!1538140 (= c!141029 (= lt!664845 (select (arr!49311 a!2792) j!64)))))

(declare-fun b!1538141 () Bool)

(assert (=> b!1538141 (= e!855875 (Found!13437 index!463))))

(declare-fun b!1538142 () Bool)

(declare-fun e!855876 () SeekEntryResult!13437)

(assert (=> b!1538142 (= e!855876 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49311 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538143 () Bool)

(declare-fun c!141027 () Bool)

(assert (=> b!1538143 (= c!141027 (= lt!664845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1538143 (= e!855875 e!855876)))

(declare-fun b!1538144 () Bool)

(assert (=> b!1538144 (= e!855876 (MissingVacant!13437 vacantIndex!5))))

(assert (= (and d!160309 c!141028) b!1538139))

(assert (= (and d!160309 (not c!141028)) b!1538140))

(assert (= (and b!1538140 c!141029) b!1538141))

(assert (= (and b!1538140 (not c!141029)) b!1538143))

(assert (= (and b!1538143 c!141027) b!1538144))

(assert (= (and b!1538143 (not c!141027)) b!1538142))

(declare-fun m!1420657 () Bool)

(assert (=> d!160309 m!1420657))

(declare-fun m!1420659 () Bool)

(assert (=> d!160309 m!1420659))

(assert (=> d!160309 m!1420589))

(assert (=> d!160309 m!1420585))

(assert (=> b!1538142 m!1420653))

(assert (=> b!1538142 m!1420653))

(assert (=> b!1538142 m!1420591))

(declare-fun m!1420661 () Bool)

(assert (=> b!1538142 m!1420661))

(assert (=> b!1538077 d!160309))

(declare-fun d!160311 () Bool)

(assert (=> d!160311 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131092 d!160311))

(declare-fun d!160317 () Bool)

(assert (=> d!160317 (= (array_inv!38339 a!2792) (bvsge (size!49861 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131092 d!160317))

(declare-fun b!1538170 () Bool)

(declare-fun e!855901 () Bool)

(declare-fun call!68589 () Bool)

(assert (=> b!1538170 (= e!855901 call!68589)))

(declare-fun bm!68586 () Bool)

(declare-fun c!141035 () Bool)

(assert (=> bm!68586 (= call!68589 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141035 (Cons!35781 (select (arr!49311 a!2792) #b00000000000000000000000000000000) Nil!35782) Nil!35782)))))

(declare-fun b!1538171 () Bool)

(assert (=> b!1538171 (= e!855901 call!68589)))

(declare-fun b!1538172 () Bool)

(declare-fun e!855898 () Bool)

(declare-fun contains!10010 (List!35785 (_ BitVec 64)) Bool)

(assert (=> b!1538172 (= e!855898 (contains!10010 Nil!35782 (select (arr!49311 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1538173 () Bool)

(declare-fun e!855899 () Bool)

(assert (=> b!1538173 (= e!855899 e!855901)))

(assert (=> b!1538173 (= c!141035 (validKeyInArray!0 (select (arr!49311 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1538174 () Bool)

(declare-fun e!855900 () Bool)

(assert (=> b!1538174 (= e!855900 e!855899)))

(declare-fun res!1055217 () Bool)

(assert (=> b!1538174 (=> (not res!1055217) (not e!855899))))

(assert (=> b!1538174 (= res!1055217 (not e!855898))))

(declare-fun res!1055216 () Bool)

(assert (=> b!1538174 (=> (not res!1055216) (not e!855898))))

(assert (=> b!1538174 (= res!1055216 (validKeyInArray!0 (select (arr!49311 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160321 () Bool)

(declare-fun res!1055218 () Bool)

(assert (=> d!160321 (=> res!1055218 e!855900)))

(assert (=> d!160321 (= res!1055218 (bvsge #b00000000000000000000000000000000 (size!49861 a!2792)))))

(assert (=> d!160321 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35782) e!855900)))

(assert (= (and d!160321 (not res!1055218)) b!1538174))

(assert (= (and b!1538174 res!1055216) b!1538172))

(assert (= (and b!1538174 res!1055217) b!1538173))

(assert (= (and b!1538173 c!141035) b!1538171))

(assert (= (and b!1538173 (not c!141035)) b!1538170))

(assert (= (or b!1538171 b!1538170) bm!68586))

(assert (=> bm!68586 m!1420635))

(declare-fun m!1420671 () Bool)

(assert (=> bm!68586 m!1420671))

(assert (=> b!1538172 m!1420635))

(assert (=> b!1538172 m!1420635))

(declare-fun m!1420673 () Bool)

(assert (=> b!1538172 m!1420673))

(assert (=> b!1538173 m!1420635))

(assert (=> b!1538173 m!1420635))

(assert (=> b!1538173 m!1420637))

(assert (=> b!1538174 m!1420635))

(assert (=> b!1538174 m!1420635))

(assert (=> b!1538174 m!1420637))

(assert (=> b!1538083 d!160321))

(check-sat (not bm!68580) (not b!1538172) (not b!1538136) (not bm!68586) (not b!1538117) (not b!1538142) (not b!1538173) (not d!160309) (not d!160307) (not b!1538120) (not b!1538174))
(check-sat)
