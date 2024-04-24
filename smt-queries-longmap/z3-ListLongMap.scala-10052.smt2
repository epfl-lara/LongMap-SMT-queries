; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118628 () Bool)

(assert start!118628)

(declare-fun b!1386476 () Bool)

(declare-fun res!926974 () Bool)

(declare-fun e!785688 () Bool)

(assert (=> b!1386476 (=> (not res!926974) (not e!785688))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94829 0))(
  ( (array!94830 (arr!45790 (Array (_ BitVec 32) (_ BitVec 64))) (size!46341 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94829)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386476 (= res!926974 (and (= (size!46341 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46341 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46341 a!2938))))))

(declare-fun b!1386478 () Bool)

(declare-fun res!926975 () Bool)

(assert (=> b!1386478 (=> (not res!926975) (not e!785688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386478 (= res!926975 (validKeyInArray!0 (select (arr!45790 a!2938) i!1065)))))

(declare-fun b!1386479 () Bool)

(declare-fun res!926973 () Bool)

(assert (=> b!1386479 (=> (not res!926973) (not e!785688))))

(declare-datatypes ((List!32305 0))(
  ( (Nil!32302) (Cons!32301 (h!33519 (_ BitVec 64)) (t!46991 List!32305)) )
))
(declare-fun arrayNoDuplicates!0 (array!94829 (_ BitVec 32) List!32305) Bool)

(assert (=> b!1386479 (= res!926973 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32302))))

(declare-fun b!1386480 () Bool)

(assert (=> b!1386480 (= e!785688 (or (= (select (arr!45790 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45790 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!926977 () Bool)

(assert (=> start!118628 (=> (not res!926977) (not e!785688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118628 (= res!926977 (validMask!0 mask!2987))))

(assert (=> start!118628 e!785688))

(assert (=> start!118628 true))

(declare-fun array_inv!35071 (array!94829) Bool)

(assert (=> start!118628 (array_inv!35071 a!2938)))

(declare-fun b!1386477 () Bool)

(declare-fun res!926976 () Bool)

(assert (=> b!1386477 (=> (not res!926976) (not e!785688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94829 (_ BitVec 32)) Bool)

(assert (=> b!1386477 (= res!926976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118628 res!926977) b!1386476))

(assert (= (and b!1386476 res!926974) b!1386478))

(assert (= (and b!1386478 res!926975) b!1386479))

(assert (= (and b!1386479 res!926973) b!1386477))

(assert (= (and b!1386477 res!926976) b!1386480))

(declare-fun m!1272141 () Bool)

(assert (=> b!1386477 m!1272141))

(declare-fun m!1272143 () Bool)

(assert (=> b!1386480 m!1272143))

(assert (=> b!1386478 m!1272143))

(assert (=> b!1386478 m!1272143))

(declare-fun m!1272145 () Bool)

(assert (=> b!1386478 m!1272145))

(declare-fun m!1272147 () Bool)

(assert (=> start!118628 m!1272147))

(declare-fun m!1272149 () Bool)

(assert (=> start!118628 m!1272149))

(declare-fun m!1272151 () Bool)

(assert (=> b!1386479 m!1272151))

(check-sat (not start!118628) (not b!1386479) (not b!1386478) (not b!1386477))
(check-sat)
(get-model)

(declare-fun d!149795 () Bool)

(assert (=> d!149795 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118628 d!149795))

(declare-fun d!149801 () Bool)

(assert (=> d!149801 (= (array_inv!35071 a!2938) (bvsge (size!46341 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118628 d!149801))

(declare-fun d!149803 () Bool)

(declare-fun res!927031 () Bool)

(declare-fun e!785731 () Bool)

(assert (=> d!149803 (=> res!927031 e!785731)))

(assert (=> d!149803 (= res!927031 (bvsge #b00000000000000000000000000000000 (size!46341 a!2938)))))

(assert (=> d!149803 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32302) e!785731)))

(declare-fun b!1386548 () Bool)

(declare-fun e!785732 () Bool)

(declare-fun contains!9785 (List!32305 (_ BitVec 64)) Bool)

(assert (=> b!1386548 (= e!785732 (contains!9785 Nil!32302 (select (arr!45790 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1386549 () Bool)

(declare-fun e!785733 () Bool)

(assert (=> b!1386549 (= e!785731 e!785733)))

(declare-fun res!927029 () Bool)

(assert (=> b!1386549 (=> (not res!927029) (not e!785733))))

(assert (=> b!1386549 (= res!927029 (not e!785732))))

(declare-fun res!927030 () Bool)

(assert (=> b!1386549 (=> (not res!927030) (not e!785732))))

(assert (=> b!1386549 (= res!927030 (validKeyInArray!0 (select (arr!45790 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1386550 () Bool)

(declare-fun e!785734 () Bool)

(assert (=> b!1386550 (= e!785733 e!785734)))

(declare-fun c!129207 () Bool)

(assert (=> b!1386550 (= c!129207 (validKeyInArray!0 (select (arr!45790 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66608 () Bool)

(declare-fun call!66611 () Bool)

(assert (=> bm!66608 (= call!66611 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129207 (Cons!32301 (select (arr!45790 a!2938) #b00000000000000000000000000000000) Nil!32302) Nil!32302)))))

(declare-fun b!1386551 () Bool)

(assert (=> b!1386551 (= e!785734 call!66611)))

(declare-fun b!1386552 () Bool)

(assert (=> b!1386552 (= e!785734 call!66611)))

(assert (= (and d!149803 (not res!927031)) b!1386549))

(assert (= (and b!1386549 res!927030) b!1386548))

(assert (= (and b!1386549 res!927029) b!1386550))

(assert (= (and b!1386550 c!129207) b!1386551))

(assert (= (and b!1386550 (not c!129207)) b!1386552))

(assert (= (or b!1386551 b!1386552) bm!66608))

(declare-fun m!1272197 () Bool)

(assert (=> b!1386548 m!1272197))

(assert (=> b!1386548 m!1272197))

(declare-fun m!1272199 () Bool)

(assert (=> b!1386548 m!1272199))

(assert (=> b!1386549 m!1272197))

(assert (=> b!1386549 m!1272197))

(declare-fun m!1272201 () Bool)

(assert (=> b!1386549 m!1272201))

(assert (=> b!1386550 m!1272197))

(assert (=> b!1386550 m!1272197))

(assert (=> b!1386550 m!1272201))

(assert (=> bm!66608 m!1272197))

(declare-fun m!1272203 () Bool)

(assert (=> bm!66608 m!1272203))

(assert (=> b!1386479 d!149803))

(declare-fun d!149809 () Bool)

(assert (=> d!149809 (= (validKeyInArray!0 (select (arr!45790 a!2938) i!1065)) (and (not (= (select (arr!45790 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45790 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1386478 d!149809))

(declare-fun b!1386573 () Bool)

(declare-fun e!785752 () Bool)

(declare-fun call!66617 () Bool)

(assert (=> b!1386573 (= e!785752 call!66617)))

(declare-fun d!149813 () Bool)

(declare-fun res!927043 () Bool)

(declare-fun e!785751 () Bool)

(assert (=> d!149813 (=> res!927043 e!785751)))

(assert (=> d!149813 (= res!927043 (bvsge #b00000000000000000000000000000000 (size!46341 a!2938)))))

(assert (=> d!149813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!785751)))

(declare-fun bm!66614 () Bool)

(assert (=> bm!66614 (= call!66617 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1386574 () Bool)

(declare-fun e!785750 () Bool)

(assert (=> b!1386574 (= e!785750 e!785752)))

(declare-fun lt!609695 () (_ BitVec 64))

(assert (=> b!1386574 (= lt!609695 (select (arr!45790 a!2938) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46189 0))(
  ( (Unit!46190) )
))
(declare-fun lt!609696 () Unit!46189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94829 (_ BitVec 64) (_ BitVec 32)) Unit!46189)

(assert (=> b!1386574 (= lt!609696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609695 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1386574 (arrayContainsKey!0 a!2938 lt!609695 #b00000000000000000000000000000000)))

(declare-fun lt!609694 () Unit!46189)

(assert (=> b!1386574 (= lt!609694 lt!609696)))

(declare-fun res!927042 () Bool)

(declare-datatypes ((SeekEntryResult!10087 0))(
  ( (MissingZero!10087 (index!42719 (_ BitVec 32))) (Found!10087 (index!42720 (_ BitVec 32))) (Intermediate!10087 (undefined!10899 Bool) (index!42721 (_ BitVec 32)) (x!124366 (_ BitVec 32))) (Undefined!10087) (MissingVacant!10087 (index!42722 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94829 (_ BitVec 32)) SeekEntryResult!10087)

(assert (=> b!1386574 (= res!927042 (= (seekEntryOrOpen!0 (select (arr!45790 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10087 #b00000000000000000000000000000000)))))

(assert (=> b!1386574 (=> (not res!927042) (not e!785752))))

(declare-fun b!1386575 () Bool)

(assert (=> b!1386575 (= e!785751 e!785750)))

(declare-fun c!129213 () Bool)

(assert (=> b!1386575 (= c!129213 (validKeyInArray!0 (select (arr!45790 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1386576 () Bool)

(assert (=> b!1386576 (= e!785750 call!66617)))

(assert (= (and d!149813 (not res!927043)) b!1386575))

(assert (= (and b!1386575 c!129213) b!1386574))

(assert (= (and b!1386575 (not c!129213)) b!1386576))

(assert (= (and b!1386574 res!927042) b!1386573))

(assert (= (or b!1386573 b!1386576) bm!66614))

(declare-fun m!1272213 () Bool)

(assert (=> bm!66614 m!1272213))

(assert (=> b!1386574 m!1272197))

(declare-fun m!1272215 () Bool)

(assert (=> b!1386574 m!1272215))

(declare-fun m!1272217 () Bool)

(assert (=> b!1386574 m!1272217))

(assert (=> b!1386574 m!1272197))

(declare-fun m!1272219 () Bool)

(assert (=> b!1386574 m!1272219))

(assert (=> b!1386575 m!1272197))

(assert (=> b!1386575 m!1272197))

(assert (=> b!1386575 m!1272201))

(assert (=> b!1386477 d!149813))

(check-sat (not b!1386550) (not b!1386549) (not b!1386548) (not b!1386574) (not bm!66608) (not b!1386575) (not bm!66614))
(check-sat)
