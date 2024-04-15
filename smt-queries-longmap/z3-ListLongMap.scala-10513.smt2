; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123878 () Bool)

(assert start!123878)

(declare-fun res!968761 () Bool)

(declare-fun e!810192 () Bool)

(assert (=> start!123878 (=> (not res!968761) (not e!810192))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123878 (= res!968761 (validMask!0 mask!2687))))

(assert (=> start!123878 e!810192))

(assert (=> start!123878 true))

(declare-datatypes ((array!97587 0))(
  ( (array!97588 (arr!47095 (Array (_ BitVec 32) (_ BitVec 64))) (size!47647 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97587)

(declare-fun array_inv!36328 (array!97587) Bool)

(assert (=> start!123878 (array_inv!36328 a!2862)))

(declare-fun b!1435646 () Bool)

(assert (=> b!1435646 (= e!810192 (and (bvsle #b00000000000000000000000000000000 (size!47647 a!2862)) (bvsge (size!47647 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1435647 () Bool)

(declare-fun res!968758 () Bool)

(assert (=> b!1435647 (=> (not res!968758) (not e!810192))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435647 (= res!968758 (and (= (size!47647 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47647 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47647 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435648 () Bool)

(declare-fun res!968760 () Bool)

(assert (=> b!1435648 (=> (not res!968760) (not e!810192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435648 (= res!968760 (validKeyInArray!0 (select (arr!47095 a!2862) i!1006)))))

(declare-fun b!1435649 () Bool)

(declare-fun res!968757 () Bool)

(assert (=> b!1435649 (=> (not res!968757) (not e!810192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97587 (_ BitVec 32)) Bool)

(assert (=> b!1435649 (= res!968757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435650 () Bool)

(declare-fun res!968759 () Bool)

(assert (=> b!1435650 (=> (not res!968759) (not e!810192))))

(assert (=> b!1435650 (= res!968759 (validKeyInArray!0 (select (arr!47095 a!2862) j!93)))))

(assert (= (and start!123878 res!968761) b!1435647))

(assert (= (and b!1435647 res!968758) b!1435648))

(assert (= (and b!1435648 res!968760) b!1435650))

(assert (= (and b!1435650 res!968759) b!1435649))

(assert (= (and b!1435649 res!968757) b!1435646))

(declare-fun m!1324529 () Bool)

(assert (=> start!123878 m!1324529))

(declare-fun m!1324531 () Bool)

(assert (=> start!123878 m!1324531))

(declare-fun m!1324533 () Bool)

(assert (=> b!1435648 m!1324533))

(assert (=> b!1435648 m!1324533))

(declare-fun m!1324535 () Bool)

(assert (=> b!1435648 m!1324535))

(declare-fun m!1324537 () Bool)

(assert (=> b!1435649 m!1324537))

(declare-fun m!1324539 () Bool)

(assert (=> b!1435650 m!1324539))

(assert (=> b!1435650 m!1324539))

(declare-fun m!1324541 () Bool)

(assert (=> b!1435650 m!1324541))

(check-sat (not b!1435650) (not start!123878) (not b!1435649) (not b!1435648))
(check-sat)
(get-model)

(declare-fun d!154247 () Bool)

(assert (=> d!154247 (= (validKeyInArray!0 (select (arr!47095 a!2862) j!93)) (and (not (= (select (arr!47095 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47095 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435650 d!154247))

(declare-fun d!154249 () Bool)

(assert (=> d!154249 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123878 d!154249))

(declare-fun d!154255 () Bool)

(assert (=> d!154255 (= (array_inv!36328 a!2862) (bvsge (size!47647 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123878 d!154255))

(declare-fun bm!67541 () Bool)

(declare-fun call!67544 () Bool)

(assert (=> bm!67541 (= call!67544 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1435701 () Bool)

(declare-fun e!810220 () Bool)

(assert (=> b!1435701 (= e!810220 call!67544)))

(declare-fun b!1435702 () Bool)

(declare-fun e!810221 () Bool)

(assert (=> b!1435702 (= e!810221 e!810220)))

(declare-fun lt!631785 () (_ BitVec 64))

(assert (=> b!1435702 (= lt!631785 (select (arr!47095 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48377 0))(
  ( (Unit!48378) )
))
(declare-fun lt!631783 () Unit!48377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97587 (_ BitVec 64) (_ BitVec 32)) Unit!48377)

(assert (=> b!1435702 (= lt!631783 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!631785 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435702 (arrayContainsKey!0 a!2862 lt!631785 #b00000000000000000000000000000000)))

(declare-fun lt!631784 () Unit!48377)

(assert (=> b!1435702 (= lt!631784 lt!631783)))

(declare-fun res!968803 () Bool)

(declare-datatypes ((SeekEntryResult!11395 0))(
  ( (MissingZero!11395 (index!47972 (_ BitVec 32))) (Found!11395 (index!47973 (_ BitVec 32))) (Intermediate!11395 (undefined!12207 Bool) (index!47974 (_ BitVec 32)) (x!129644 (_ BitVec 32))) (Undefined!11395) (MissingVacant!11395 (index!47975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97587 (_ BitVec 32)) SeekEntryResult!11395)

(assert (=> b!1435702 (= res!968803 (= (seekEntryOrOpen!0 (select (arr!47095 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11395 #b00000000000000000000000000000000)))))

(assert (=> b!1435702 (=> (not res!968803) (not e!810220))))

(declare-fun b!1435703 () Bool)

(assert (=> b!1435703 (= e!810221 call!67544)))

(declare-fun b!1435704 () Bool)

(declare-fun e!810222 () Bool)

(assert (=> b!1435704 (= e!810222 e!810221)))

(declare-fun c!132955 () Bool)

(assert (=> b!1435704 (= c!132955 (validKeyInArray!0 (select (arr!47095 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154259 () Bool)

(declare-fun res!968802 () Bool)

(assert (=> d!154259 (=> res!968802 e!810222)))

(assert (=> d!154259 (= res!968802 (bvsge #b00000000000000000000000000000000 (size!47647 a!2862)))))

(assert (=> d!154259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810222)))

(assert (= (and d!154259 (not res!968802)) b!1435704))

(assert (= (and b!1435704 c!132955) b!1435702))

(assert (= (and b!1435704 (not c!132955)) b!1435703))

(assert (= (and b!1435702 res!968803) b!1435701))

(assert (= (or b!1435701 b!1435703) bm!67541))

(declare-fun m!1324583 () Bool)

(assert (=> bm!67541 m!1324583))

(declare-fun m!1324585 () Bool)

(assert (=> b!1435702 m!1324585))

(declare-fun m!1324587 () Bool)

(assert (=> b!1435702 m!1324587))

(declare-fun m!1324589 () Bool)

(assert (=> b!1435702 m!1324589))

(assert (=> b!1435702 m!1324585))

(declare-fun m!1324591 () Bool)

(assert (=> b!1435702 m!1324591))

(assert (=> b!1435704 m!1324585))

(assert (=> b!1435704 m!1324585))

(declare-fun m!1324593 () Bool)

(assert (=> b!1435704 m!1324593))

(assert (=> b!1435649 d!154259))

(declare-fun d!154271 () Bool)

(assert (=> d!154271 (= (validKeyInArray!0 (select (arr!47095 a!2862) i!1006)) (and (not (= (select (arr!47095 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47095 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435648 d!154271))

(check-sat (not b!1435702) (not b!1435704) (not bm!67541))
(check-sat)
