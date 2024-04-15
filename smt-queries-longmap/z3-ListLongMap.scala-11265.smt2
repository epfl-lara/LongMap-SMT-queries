; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131334 () Bool)

(assert start!131334)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun e!856570 () Bool)

(declare-datatypes ((array!102280 0))(
  ( (array!102281 (arr!49351 (Array (_ BitVec 32) (_ BitVec 64))) (size!49903 (_ BitVec 32))) )
))
(declare-fun lt!665095 () array!102280)

(declare-fun lt!665092 () (_ BitVec 64))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13502 0))(
  ( (MissingZero!13502 (index!56403 (_ BitVec 32))) (Found!13502 (index!56404 (_ BitVec 32))) (Intermediate!13502 (undefined!14314 Bool) (index!56405 (_ BitVec 32)) (x!138136 (_ BitVec 32))) (Undefined!13502) (MissingVacant!13502 (index!56406 (_ BitVec 32))) )
))
(declare-fun lt!665097 () SeekEntryResult!13502)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1540192 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102280 (_ BitVec 32)) SeekEntryResult!13502)

(assert (=> b!1540192 (= e!856570 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665092 lt!665095 mask!2480) lt!665097)))))

(declare-fun lt!665096 () SeekEntryResult!13502)

(declare-fun lt!665093 () (_ BitVec 32))

(assert (=> b!1540192 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 lt!665092 lt!665095 mask!2480) lt!665096)))

(declare-fun a!2792 () array!102280)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540192 (= lt!665092 (select (store (arr!49351 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(assert (=> b!1540192 (= lt!665095 (array!102281 (store (arr!49351 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49903 a!2792)))))

(declare-datatypes ((Unit!51275 0))(
  ( (Unit!51276) )
))
(declare-fun lt!665091 () Unit!51275)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51275)

(assert (=> b!1540192 (= lt!665091 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 mask!2480))))

(declare-fun b!1540193 () Bool)

(declare-fun res!1057072 () Bool)

(declare-fun e!856572 () Bool)

(assert (=> b!1540193 (=> (not res!1057072) (not e!856572))))

(assert (=> b!1540193 (= res!1057072 (and (= (size!49903 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49903 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49903 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540194 () Bool)

(declare-fun res!1057074 () Bool)

(assert (=> b!1540194 (=> (not res!1057074) (not e!856572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540194 (= res!1057074 (validKeyInArray!0 (select (arr!49351 a!2792) i!951)))))

(declare-fun b!1540195 () Bool)

(declare-fun res!1057075 () Bool)

(assert (=> b!1540195 (=> (not res!1057075) (not e!856572))))

(assert (=> b!1540195 (= res!1057075 (validKeyInArray!0 (select (arr!49351 a!2792) j!64)))))

(declare-fun b!1540196 () Bool)

(declare-fun res!1057070 () Bool)

(assert (=> b!1540196 (=> (not res!1057070) (not e!856572))))

(declare-datatypes ((List!35903 0))(
  ( (Nil!35900) (Cons!35899 (h!37345 (_ BitVec 64)) (t!50589 List!35903)) )
))
(declare-fun arrayNoDuplicates!0 (array!102280 (_ BitVec 32) List!35903) Bool)

(assert (=> b!1540196 (= res!1057070 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35900))))

(declare-fun res!1057071 () Bool)

(assert (=> start!131334 (=> (not res!1057071) (not e!856572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131334 (= res!1057071 (validMask!0 mask!2480))))

(assert (=> start!131334 e!856572))

(assert (=> start!131334 true))

(declare-fun array_inv!38584 (array!102280) Bool)

(assert (=> start!131334 (array_inv!38584 a!2792)))

(declare-fun b!1540197 () Bool)

(declare-fun e!856573 () Bool)

(declare-fun e!856569 () Bool)

(assert (=> b!1540197 (= e!856573 e!856569)))

(declare-fun res!1057073 () Bool)

(assert (=> b!1540197 (=> (not res!1057073) (not e!856569))))

(assert (=> b!1540197 (= res!1057073 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665093 #b00000000000000000000000000000000) (bvslt lt!665093 (size!49903 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540197 (= lt!665093 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540198 () Bool)

(assert (=> b!1540198 (= e!856569 e!856570)))

(declare-fun res!1057068 () Bool)

(assert (=> b!1540198 (=> (not res!1057068) (not e!856570))))

(declare-fun lt!665094 () SeekEntryResult!13502)

(assert (=> b!1540198 (= res!1057068 (= lt!665096 lt!665094))))

(assert (=> b!1540198 (= lt!665096 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540199 () Bool)

(declare-fun res!1057069 () Bool)

(assert (=> b!1540199 (=> (not res!1057069) (not e!856572))))

(assert (=> b!1540199 (= res!1057069 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49903 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49903 a!2792)) (= (select (arr!49351 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540200 () Bool)

(assert (=> b!1540200 (= e!856572 e!856573)))

(declare-fun res!1057067 () Bool)

(assert (=> b!1540200 (=> (not res!1057067) (not e!856573))))

(assert (=> b!1540200 (= res!1057067 (and (= lt!665097 lt!665094) (not (= (select (arr!49351 a!2792) index!463) (select (arr!49351 a!2792) j!64)))))))

(assert (=> b!1540200 (= lt!665094 (Found!13502 j!64))))

(assert (=> b!1540200 (= lt!665097 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540201 () Bool)

(declare-fun res!1057066 () Bool)

(assert (=> b!1540201 (=> (not res!1057066) (not e!856572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102280 (_ BitVec 32)) Bool)

(assert (=> b!1540201 (= res!1057066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131334 res!1057071) b!1540193))

(assert (= (and b!1540193 res!1057072) b!1540194))

(assert (= (and b!1540194 res!1057074) b!1540195))

(assert (= (and b!1540195 res!1057075) b!1540201))

(assert (= (and b!1540201 res!1057066) b!1540196))

(assert (= (and b!1540196 res!1057070) b!1540199))

(assert (= (and b!1540199 res!1057069) b!1540200))

(assert (= (and b!1540200 res!1057067) b!1540197))

(assert (= (and b!1540197 res!1057073) b!1540198))

(assert (= (and b!1540198 res!1057068) b!1540192))

(declare-fun m!1421729 () Bool)

(assert (=> b!1540192 m!1421729))

(declare-fun m!1421731 () Bool)

(assert (=> b!1540192 m!1421731))

(declare-fun m!1421733 () Bool)

(assert (=> b!1540192 m!1421733))

(declare-fun m!1421735 () Bool)

(assert (=> b!1540192 m!1421735))

(declare-fun m!1421737 () Bool)

(assert (=> b!1540192 m!1421737))

(declare-fun m!1421739 () Bool)

(assert (=> b!1540196 m!1421739))

(declare-fun m!1421741 () Bool)

(assert (=> b!1540198 m!1421741))

(assert (=> b!1540198 m!1421741))

(declare-fun m!1421743 () Bool)

(assert (=> b!1540198 m!1421743))

(declare-fun m!1421745 () Bool)

(assert (=> start!131334 m!1421745))

(declare-fun m!1421747 () Bool)

(assert (=> start!131334 m!1421747))

(declare-fun m!1421749 () Bool)

(assert (=> b!1540199 m!1421749))

(declare-fun m!1421751 () Bool)

(assert (=> b!1540194 m!1421751))

(assert (=> b!1540194 m!1421751))

(declare-fun m!1421753 () Bool)

(assert (=> b!1540194 m!1421753))

(declare-fun m!1421755 () Bool)

(assert (=> b!1540200 m!1421755))

(assert (=> b!1540200 m!1421741))

(assert (=> b!1540200 m!1421741))

(declare-fun m!1421757 () Bool)

(assert (=> b!1540200 m!1421757))

(declare-fun m!1421759 () Bool)

(assert (=> b!1540201 m!1421759))

(declare-fun m!1421761 () Bool)

(assert (=> b!1540197 m!1421761))

(assert (=> b!1540195 m!1421741))

(assert (=> b!1540195 m!1421741))

(declare-fun m!1421763 () Bool)

(assert (=> b!1540195 m!1421763))

(check-sat (not b!1540197) (not b!1540196) (not b!1540201) (not b!1540192) (not b!1540200) (not b!1540194) (not b!1540198) (not b!1540195) (not start!131334))
(check-sat)
(get-model)

(declare-fun d!160289 () Bool)

(assert (=> d!160289 (= (validKeyInArray!0 (select (arr!49351 a!2792) i!951)) (and (not (= (select (arr!49351 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49351 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540194 d!160289))

(declare-fun b!1540274 () Bool)

(declare-fun e!856610 () SeekEntryResult!13502)

(assert (=> b!1540274 (= e!856610 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 lt!665092 lt!665095 mask!2480))))

(declare-fun d!160291 () Bool)

(declare-fun lt!665144 () SeekEntryResult!13502)

(get-info :version)

(assert (=> d!160291 (and (or ((_ is Undefined!13502) lt!665144) (not ((_ is Found!13502) lt!665144)) (and (bvsge (index!56404 lt!665144) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665144) (size!49903 lt!665095)))) (or ((_ is Undefined!13502) lt!665144) ((_ is Found!13502) lt!665144) (not ((_ is MissingVacant!13502) lt!665144)) (not (= (index!56406 lt!665144) vacantIndex!5)) (and (bvsge (index!56406 lt!665144) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665144) (size!49903 lt!665095)))) (or ((_ is Undefined!13502) lt!665144) (ite ((_ is Found!13502) lt!665144) (= (select (arr!49351 lt!665095) (index!56404 lt!665144)) lt!665092) (and ((_ is MissingVacant!13502) lt!665144) (= (index!56406 lt!665144) vacantIndex!5) (= (select (arr!49351 lt!665095) (index!56406 lt!665144)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!856611 () SeekEntryResult!13502)

(assert (=> d!160291 (= lt!665144 e!856611)))

(declare-fun c!141131 () Bool)

(assert (=> d!160291 (= c!141131 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!665145 () (_ BitVec 64))

(assert (=> d!160291 (= lt!665145 (select (arr!49351 lt!665095) index!463))))

(assert (=> d!160291 (validMask!0 mask!2480)))

(assert (=> d!160291 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665092 lt!665095 mask!2480) lt!665144)))

(declare-fun b!1540275 () Bool)

(declare-fun e!856612 () SeekEntryResult!13502)

(assert (=> b!1540275 (= e!856611 e!856612)))

(declare-fun c!141130 () Bool)

(assert (=> b!1540275 (= c!141130 (= lt!665145 lt!665092))))

(declare-fun b!1540276 () Bool)

(declare-fun c!141132 () Bool)

(assert (=> b!1540276 (= c!141132 (= lt!665145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540276 (= e!856612 e!856610)))

(declare-fun b!1540277 () Bool)

(assert (=> b!1540277 (= e!856612 (Found!13502 index!463))))

(declare-fun b!1540278 () Bool)

(assert (=> b!1540278 (= e!856610 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540279 () Bool)

(assert (=> b!1540279 (= e!856611 Undefined!13502)))

(assert (= (and d!160291 c!141131) b!1540279))

(assert (= (and d!160291 (not c!141131)) b!1540275))

(assert (= (and b!1540275 c!141130) b!1540277))

(assert (= (and b!1540275 (not c!141130)) b!1540276))

(assert (= (and b!1540276 c!141132) b!1540278))

(assert (= (and b!1540276 (not c!141132)) b!1540274))

(assert (=> b!1540274 m!1421761))

(assert (=> b!1540274 m!1421761))

(declare-fun m!1421837 () Bool)

(assert (=> b!1540274 m!1421837))

(declare-fun m!1421839 () Bool)

(assert (=> d!160291 m!1421839))

(declare-fun m!1421841 () Bool)

(assert (=> d!160291 m!1421841))

(declare-fun m!1421843 () Bool)

(assert (=> d!160291 m!1421843))

(assert (=> d!160291 m!1421745))

(assert (=> b!1540192 d!160291))

(declare-fun b!1540280 () Bool)

(declare-fun e!856613 () SeekEntryResult!13502)

(assert (=> b!1540280 (= e!856613 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665093 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 lt!665092 lt!665095 mask!2480))))

(declare-fun d!160293 () Bool)

(declare-fun lt!665146 () SeekEntryResult!13502)

(assert (=> d!160293 (and (or ((_ is Undefined!13502) lt!665146) (not ((_ is Found!13502) lt!665146)) (and (bvsge (index!56404 lt!665146) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665146) (size!49903 lt!665095)))) (or ((_ is Undefined!13502) lt!665146) ((_ is Found!13502) lt!665146) (not ((_ is MissingVacant!13502) lt!665146)) (not (= (index!56406 lt!665146) vacantIndex!5)) (and (bvsge (index!56406 lt!665146) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665146) (size!49903 lt!665095)))) (or ((_ is Undefined!13502) lt!665146) (ite ((_ is Found!13502) lt!665146) (= (select (arr!49351 lt!665095) (index!56404 lt!665146)) lt!665092) (and ((_ is MissingVacant!13502) lt!665146) (= (index!56406 lt!665146) vacantIndex!5) (= (select (arr!49351 lt!665095) (index!56406 lt!665146)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!856614 () SeekEntryResult!13502)

(assert (=> d!160293 (= lt!665146 e!856614)))

(declare-fun c!141134 () Bool)

(assert (=> d!160293 (= c!141134 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(declare-fun lt!665147 () (_ BitVec 64))

(assert (=> d!160293 (= lt!665147 (select (arr!49351 lt!665095) lt!665093))))

(assert (=> d!160293 (validMask!0 mask!2480)))

(assert (=> d!160293 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 lt!665092 lt!665095 mask!2480) lt!665146)))

(declare-fun b!1540281 () Bool)

(declare-fun e!856615 () SeekEntryResult!13502)

(assert (=> b!1540281 (= e!856614 e!856615)))

(declare-fun c!141133 () Bool)

(assert (=> b!1540281 (= c!141133 (= lt!665147 lt!665092))))

(declare-fun b!1540282 () Bool)

(declare-fun c!141135 () Bool)

(assert (=> b!1540282 (= c!141135 (= lt!665147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540282 (= e!856615 e!856613)))

(declare-fun b!1540283 () Bool)

(assert (=> b!1540283 (= e!856615 (Found!13502 lt!665093))))

(declare-fun b!1540284 () Bool)

(assert (=> b!1540284 (= e!856613 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540285 () Bool)

(assert (=> b!1540285 (= e!856614 Undefined!13502)))

(assert (= (and d!160293 c!141134) b!1540285))

(assert (= (and d!160293 (not c!141134)) b!1540281))

(assert (= (and b!1540281 c!141133) b!1540283))

(assert (= (and b!1540281 (not c!141133)) b!1540282))

(assert (= (and b!1540282 c!141135) b!1540284))

(assert (= (and b!1540282 (not c!141135)) b!1540280))

(declare-fun m!1421845 () Bool)

(assert (=> b!1540280 m!1421845))

(assert (=> b!1540280 m!1421845))

(declare-fun m!1421847 () Bool)

(assert (=> b!1540280 m!1421847))

(declare-fun m!1421849 () Bool)

(assert (=> d!160293 m!1421849))

(declare-fun m!1421851 () Bool)

(assert (=> d!160293 m!1421851))

(declare-fun m!1421853 () Bool)

(assert (=> d!160293 m!1421853))

(assert (=> d!160293 m!1421745))

(assert (=> b!1540192 d!160293))

(declare-fun d!160295 () Bool)

(declare-fun e!856618 () Bool)

(assert (=> d!160295 e!856618))

(declare-fun res!1057138 () Bool)

(assert (=> d!160295 (=> (not res!1057138) (not e!856618))))

(assert (=> d!160295 (= res!1057138 (and (or (bvslt i!951 #b00000000000000000000000000000000) (bvsge i!951 (size!49903 a!2792)) (and (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49903 a!2792)))) (or (bvslt i!951 #b00000000000000000000000000000000) (bvsge i!951 (size!49903 a!2792)) (and (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49903 a!2792)))) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49903 a!2792))))))

(declare-fun lt!665150 () Unit!51275)

(declare-fun choose!81 (array!102280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51275)

(assert (=> d!160295 (= lt!665150 (choose!81 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 mask!2480))))

(assert (=> d!160295 (validMask!0 mask!2480)))

(assert (=> d!160295 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 mask!2480) lt!665150)))

(declare-fun b!1540288 () Bool)

(assert (=> b!1540288 (= e!856618 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 (select (store (arr!49351 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102281 (store (arr!49351 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49903 a!2792)) mask!2480) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480)))))

(assert (= (and d!160295 res!1057138) b!1540288))

(declare-fun m!1421855 () Bool)

(assert (=> d!160295 m!1421855))

(assert (=> d!160295 m!1421745))

(assert (=> b!1540288 m!1421731))

(assert (=> b!1540288 m!1421729))

(assert (=> b!1540288 m!1421741))

(assert (=> b!1540288 m!1421741))

(assert (=> b!1540288 m!1421743))

(assert (=> b!1540288 m!1421729))

(declare-fun m!1421857 () Bool)

(assert (=> b!1540288 m!1421857))

(assert (=> b!1540192 d!160295))

(declare-fun d!160297 () Bool)

(declare-fun lt!665153 () (_ BitVec 32))

(assert (=> d!160297 (and (bvsge lt!665153 #b00000000000000000000000000000000) (bvslt lt!665153 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160297 (= lt!665153 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160297 (validMask!0 mask!2480)))

(assert (=> d!160297 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665153)))

(declare-fun bs!44181 () Bool)

(assert (= bs!44181 d!160297))

(declare-fun m!1421859 () Bool)

(assert (=> bs!44181 m!1421859))

(assert (=> bs!44181 m!1421745))

(assert (=> b!1540197 d!160297))

(declare-fun b!1540289 () Bool)

(declare-fun e!856619 () SeekEntryResult!13502)

(assert (=> b!1540289 (= e!856619 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665093 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480))))

(declare-fun lt!665154 () SeekEntryResult!13502)

(declare-fun d!160299 () Bool)

(assert (=> d!160299 (and (or ((_ is Undefined!13502) lt!665154) (not ((_ is Found!13502) lt!665154)) (and (bvsge (index!56404 lt!665154) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665154) (size!49903 a!2792)))) (or ((_ is Undefined!13502) lt!665154) ((_ is Found!13502) lt!665154) (not ((_ is MissingVacant!13502) lt!665154)) (not (= (index!56406 lt!665154) vacantIndex!5)) (and (bvsge (index!56406 lt!665154) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665154) (size!49903 a!2792)))) (or ((_ is Undefined!13502) lt!665154) (ite ((_ is Found!13502) lt!665154) (= (select (arr!49351 a!2792) (index!56404 lt!665154)) (select (arr!49351 a!2792) j!64)) (and ((_ is MissingVacant!13502) lt!665154) (= (index!56406 lt!665154) vacantIndex!5) (= (select (arr!49351 a!2792) (index!56406 lt!665154)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!856620 () SeekEntryResult!13502)

(assert (=> d!160299 (= lt!665154 e!856620)))

(declare-fun c!141137 () Bool)

(assert (=> d!160299 (= c!141137 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(declare-fun lt!665155 () (_ BitVec 64))

(assert (=> d!160299 (= lt!665155 (select (arr!49351 a!2792) lt!665093))))

(assert (=> d!160299 (validMask!0 mask!2480)))

(assert (=> d!160299 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665093 vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480) lt!665154)))

(declare-fun b!1540290 () Bool)

(declare-fun e!856621 () SeekEntryResult!13502)

(assert (=> b!1540290 (= e!856620 e!856621)))

(declare-fun c!141136 () Bool)

(assert (=> b!1540290 (= c!141136 (= lt!665155 (select (arr!49351 a!2792) j!64)))))

(declare-fun b!1540291 () Bool)

(declare-fun c!141138 () Bool)

(assert (=> b!1540291 (= c!141138 (= lt!665155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540291 (= e!856621 e!856619)))

(declare-fun b!1540292 () Bool)

(assert (=> b!1540292 (= e!856621 (Found!13502 lt!665093))))

(declare-fun b!1540293 () Bool)

(assert (=> b!1540293 (= e!856619 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540294 () Bool)

(assert (=> b!1540294 (= e!856620 Undefined!13502)))

(assert (= (and d!160299 c!141137) b!1540294))

(assert (= (and d!160299 (not c!141137)) b!1540290))

(assert (= (and b!1540290 c!141136) b!1540292))

(assert (= (and b!1540290 (not c!141136)) b!1540291))

(assert (= (and b!1540291 c!141138) b!1540293))

(assert (= (and b!1540291 (not c!141138)) b!1540289))

(assert (=> b!1540289 m!1421845))

(assert (=> b!1540289 m!1421845))

(assert (=> b!1540289 m!1421741))

(declare-fun m!1421861 () Bool)

(assert (=> b!1540289 m!1421861))

(declare-fun m!1421863 () Bool)

(assert (=> d!160299 m!1421863))

(declare-fun m!1421865 () Bool)

(assert (=> d!160299 m!1421865))

(declare-fun m!1421867 () Bool)

(assert (=> d!160299 m!1421867))

(assert (=> d!160299 m!1421745))

(assert (=> b!1540198 d!160299))

(declare-fun b!1540305 () Bool)

(declare-fun e!856630 () Bool)

(declare-fun e!856633 () Bool)

(assert (=> b!1540305 (= e!856630 e!856633)))

(declare-fun res!1057146 () Bool)

(assert (=> b!1540305 (=> (not res!1057146) (not e!856633))))

(declare-fun e!856632 () Bool)

(assert (=> b!1540305 (= res!1057146 (not e!856632))))

(declare-fun res!1057145 () Bool)

(assert (=> b!1540305 (=> (not res!1057145) (not e!856632))))

(assert (=> b!1540305 (= res!1057145 (validKeyInArray!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540306 () Bool)

(declare-fun contains!9981 (List!35903 (_ BitVec 64)) Bool)

(assert (=> b!1540306 (= e!856632 (contains!9981 Nil!35900 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540307 () Bool)

(declare-fun e!856631 () Bool)

(declare-fun call!68620 () Bool)

(assert (=> b!1540307 (= e!856631 call!68620)))

(declare-fun b!1540309 () Bool)

(assert (=> b!1540309 (= e!856631 call!68620)))

(declare-fun bm!68617 () Bool)

(declare-fun c!141141 () Bool)

(assert (=> bm!68617 (= call!68620 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141141 (Cons!35899 (select (arr!49351 a!2792) #b00000000000000000000000000000000) Nil!35900) Nil!35900)))))

(declare-fun d!160301 () Bool)

(declare-fun res!1057147 () Bool)

(assert (=> d!160301 (=> res!1057147 e!856630)))

(assert (=> d!160301 (= res!1057147 (bvsge #b00000000000000000000000000000000 (size!49903 a!2792)))))

(assert (=> d!160301 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35900) e!856630)))

(declare-fun b!1540308 () Bool)

(assert (=> b!1540308 (= e!856633 e!856631)))

(assert (=> b!1540308 (= c!141141 (validKeyInArray!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160301 (not res!1057147)) b!1540305))

(assert (= (and b!1540305 res!1057145) b!1540306))

(assert (= (and b!1540305 res!1057146) b!1540308))

(assert (= (and b!1540308 c!141141) b!1540309))

(assert (= (and b!1540308 (not c!141141)) b!1540307))

(assert (= (or b!1540309 b!1540307) bm!68617))

(declare-fun m!1421869 () Bool)

(assert (=> b!1540305 m!1421869))

(assert (=> b!1540305 m!1421869))

(declare-fun m!1421871 () Bool)

(assert (=> b!1540305 m!1421871))

(assert (=> b!1540306 m!1421869))

(assert (=> b!1540306 m!1421869))

(declare-fun m!1421873 () Bool)

(assert (=> b!1540306 m!1421873))

(assert (=> bm!68617 m!1421869))

(declare-fun m!1421875 () Bool)

(assert (=> bm!68617 m!1421875))

(assert (=> b!1540308 m!1421869))

(assert (=> b!1540308 m!1421869))

(assert (=> b!1540308 m!1421871))

(assert (=> b!1540196 d!160301))

(declare-fun d!160309 () Bool)

(assert (=> d!160309 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131334 d!160309))

(declare-fun d!160315 () Bool)

(assert (=> d!160315 (= (array_inv!38584 a!2792) (bvsge (size!49903 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131334 d!160315))

(declare-fun b!1540357 () Bool)

(declare-fun e!856666 () Bool)

(declare-fun call!68626 () Bool)

(assert (=> b!1540357 (= e!856666 call!68626)))

(declare-fun b!1540358 () Bool)

(declare-fun e!856665 () Bool)

(assert (=> b!1540358 (= e!856666 e!856665)))

(declare-fun lt!665170 () (_ BitVec 64))

(assert (=> b!1540358 (= lt!665170 (select (arr!49351 a!2792) #b00000000000000000000000000000000))))

(declare-fun lt!665171 () Unit!51275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102280 (_ BitVec 64) (_ BitVec 32)) Unit!51275)

(assert (=> b!1540358 (= lt!665171 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665170 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1540358 (arrayContainsKey!0 a!2792 lt!665170 #b00000000000000000000000000000000)))

(declare-fun lt!665172 () Unit!51275)

(assert (=> b!1540358 (= lt!665172 lt!665171)))

(declare-fun res!1057161 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102280 (_ BitVec 32)) SeekEntryResult!13502)

(assert (=> b!1540358 (= res!1057161 (= (seekEntryOrOpen!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13502 #b00000000000000000000000000000000)))))

(assert (=> b!1540358 (=> (not res!1057161) (not e!856665))))

(declare-fun d!160317 () Bool)

(declare-fun res!1057162 () Bool)

(declare-fun e!856664 () Bool)

(assert (=> d!160317 (=> res!1057162 e!856664)))

(assert (=> d!160317 (= res!1057162 (bvsge #b00000000000000000000000000000000 (size!49903 a!2792)))))

(assert (=> d!160317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856664)))

(declare-fun b!1540359 () Bool)

(assert (=> b!1540359 (= e!856664 e!856666)))

(declare-fun c!141159 () Bool)

(assert (=> b!1540359 (= c!141159 (validKeyInArray!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68623 () Bool)

(assert (=> bm!68623 (= call!68626 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1540360 () Bool)

(assert (=> b!1540360 (= e!856665 call!68626)))

(assert (= (and d!160317 (not res!1057162)) b!1540359))

(assert (= (and b!1540359 c!141159) b!1540358))

(assert (= (and b!1540359 (not c!141159)) b!1540357))

(assert (= (and b!1540358 res!1057161) b!1540360))

(assert (= (or b!1540360 b!1540357) bm!68623))

(assert (=> b!1540358 m!1421869))

(declare-fun m!1421903 () Bool)

(assert (=> b!1540358 m!1421903))

(declare-fun m!1421905 () Bool)

(assert (=> b!1540358 m!1421905))

(assert (=> b!1540358 m!1421869))

(declare-fun m!1421907 () Bool)

(assert (=> b!1540358 m!1421907))

(assert (=> b!1540359 m!1421869))

(assert (=> b!1540359 m!1421869))

(assert (=> b!1540359 m!1421871))

(declare-fun m!1421909 () Bool)

(assert (=> bm!68623 m!1421909))

(assert (=> b!1540201 d!160317))

(declare-fun e!856667 () SeekEntryResult!13502)

(declare-fun b!1540361 () Bool)

(assert (=> b!1540361 (= e!856667 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480))))

(declare-fun lt!665173 () SeekEntryResult!13502)

(declare-fun d!160327 () Bool)

(assert (=> d!160327 (and (or ((_ is Undefined!13502) lt!665173) (not ((_ is Found!13502) lt!665173)) (and (bvsge (index!56404 lt!665173) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665173) (size!49903 a!2792)))) (or ((_ is Undefined!13502) lt!665173) ((_ is Found!13502) lt!665173) (not ((_ is MissingVacant!13502) lt!665173)) (not (= (index!56406 lt!665173) vacantIndex!5)) (and (bvsge (index!56406 lt!665173) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665173) (size!49903 a!2792)))) (or ((_ is Undefined!13502) lt!665173) (ite ((_ is Found!13502) lt!665173) (= (select (arr!49351 a!2792) (index!56404 lt!665173)) (select (arr!49351 a!2792) j!64)) (and ((_ is MissingVacant!13502) lt!665173) (= (index!56406 lt!665173) vacantIndex!5) (= (select (arr!49351 a!2792) (index!56406 lt!665173)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!856668 () SeekEntryResult!13502)

(assert (=> d!160327 (= lt!665173 e!856668)))

(declare-fun c!141161 () Bool)

(assert (=> d!160327 (= c!141161 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!665174 () (_ BitVec 64))

(assert (=> d!160327 (= lt!665174 (select (arr!49351 a!2792) index!463))))

(assert (=> d!160327 (validMask!0 mask!2480)))

(assert (=> d!160327 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480) lt!665173)))

(declare-fun b!1540362 () Bool)

(declare-fun e!856669 () SeekEntryResult!13502)

(assert (=> b!1540362 (= e!856668 e!856669)))

(declare-fun c!141160 () Bool)

(assert (=> b!1540362 (= c!141160 (= lt!665174 (select (arr!49351 a!2792) j!64)))))

(declare-fun b!1540363 () Bool)

(declare-fun c!141162 () Bool)

(assert (=> b!1540363 (= c!141162 (= lt!665174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540363 (= e!856669 e!856667)))

(declare-fun b!1540364 () Bool)

(assert (=> b!1540364 (= e!856669 (Found!13502 index!463))))

(declare-fun b!1540365 () Bool)

(assert (=> b!1540365 (= e!856667 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540366 () Bool)

(assert (=> b!1540366 (= e!856668 Undefined!13502)))

(assert (= (and d!160327 c!141161) b!1540366))

(assert (= (and d!160327 (not c!141161)) b!1540362))

(assert (= (and b!1540362 c!141160) b!1540364))

(assert (= (and b!1540362 (not c!141160)) b!1540363))

(assert (= (and b!1540363 c!141162) b!1540365))

(assert (= (and b!1540363 (not c!141162)) b!1540361))

(assert (=> b!1540361 m!1421761))

(assert (=> b!1540361 m!1421761))

(assert (=> b!1540361 m!1421741))

(declare-fun m!1421911 () Bool)

(assert (=> b!1540361 m!1421911))

(declare-fun m!1421913 () Bool)

(assert (=> d!160327 m!1421913))

(declare-fun m!1421915 () Bool)

(assert (=> d!160327 m!1421915))

(assert (=> d!160327 m!1421755))

(assert (=> d!160327 m!1421745))

(assert (=> b!1540200 d!160327))

(declare-fun d!160329 () Bool)

(assert (=> d!160329 (= (validKeyInArray!0 (select (arr!49351 a!2792) j!64)) (and (not (= (select (arr!49351 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49351 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540195 d!160329))

(check-sat (not d!160293) (not d!160327) (not bm!68617) (not b!1540274) (not bm!68623) (not b!1540361) (not b!1540358) (not b!1540288) (not d!160291) (not b!1540289) (not b!1540308) (not b!1540306) (not b!1540305) (not b!1540359) (not d!160297) (not b!1540280) (not d!160299) (not d!160295))
(check-sat)
