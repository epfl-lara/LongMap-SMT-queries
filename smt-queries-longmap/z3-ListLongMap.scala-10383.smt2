; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122408 () Bool)

(assert start!122408)

(declare-fun b!1418915 () Bool)

(declare-fun e!803092 () Bool)

(declare-datatypes ((array!96914 0))(
  ( (array!96915 (arr!46783 (Array (_ BitVec 32) (_ BitVec 64))) (size!47334 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96914)

(assert (=> b!1418915 (= e!803092 (and (bvsle #b00000000000000000000000000000000 (size!47334 a!2831)) (bvsge (size!47334 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1418916 () Bool)

(declare-fun res!953961 () Bool)

(assert (=> b!1418916 (=> (not res!953961) (not e!803092))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418916 (= res!953961 (validKeyInArray!0 (select (arr!46783 a!2831) i!982)))))

(declare-fun b!1418917 () Bool)

(declare-fun res!953964 () Bool)

(assert (=> b!1418917 (=> (not res!953964) (not e!803092))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96914 (_ BitVec 32)) Bool)

(assert (=> b!1418917 (= res!953964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!953963 () Bool)

(assert (=> start!122408 (=> (not res!953963) (not e!803092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122408 (= res!953963 (validMask!0 mask!2608))))

(assert (=> start!122408 e!803092))

(assert (=> start!122408 true))

(declare-fun array_inv!36064 (array!96914) Bool)

(assert (=> start!122408 (array_inv!36064 a!2831)))

(declare-fun b!1418918 () Bool)

(declare-fun res!953965 () Bool)

(assert (=> b!1418918 (=> (not res!953965) (not e!803092))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418918 (= res!953965 (and (= (size!47334 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47334 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47334 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418919 () Bool)

(declare-fun res!953962 () Bool)

(assert (=> b!1418919 (=> (not res!953962) (not e!803092))))

(assert (=> b!1418919 (= res!953962 (validKeyInArray!0 (select (arr!46783 a!2831) j!81)))))

(assert (= (and start!122408 res!953963) b!1418918))

(assert (= (and b!1418918 res!953965) b!1418916))

(assert (= (and b!1418916 res!953961) b!1418919))

(assert (= (and b!1418919 res!953962) b!1418917))

(assert (= (and b!1418917 res!953964) b!1418915))

(declare-fun m!1309927 () Bool)

(assert (=> b!1418916 m!1309927))

(assert (=> b!1418916 m!1309927))

(declare-fun m!1309929 () Bool)

(assert (=> b!1418916 m!1309929))

(declare-fun m!1309931 () Bool)

(assert (=> b!1418917 m!1309931))

(declare-fun m!1309933 () Bool)

(assert (=> start!122408 m!1309933))

(declare-fun m!1309935 () Bool)

(assert (=> start!122408 m!1309935))

(declare-fun m!1309937 () Bool)

(assert (=> b!1418919 m!1309937))

(assert (=> b!1418919 m!1309937))

(declare-fun m!1309939 () Bool)

(assert (=> b!1418919 m!1309939))

(check-sat (not b!1418917) (not b!1418916) (not start!122408) (not b!1418919))
(check-sat)
(get-model)

(declare-fun d!153057 () Bool)

(declare-fun res!954000 () Bool)

(declare-fun e!803113 () Bool)

(assert (=> d!153057 (=> res!954000 e!803113)))

(assert (=> d!153057 (= res!954000 (bvsge #b00000000000000000000000000000000 (size!47334 a!2831)))))

(assert (=> d!153057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803113)))

(declare-fun b!1418958 () Bool)

(declare-fun e!803112 () Bool)

(assert (=> b!1418958 (= e!803113 e!803112)))

(declare-fun c!131968 () Bool)

(assert (=> b!1418958 (= c!131968 (validKeyInArray!0 (select (arr!46783 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418959 () Bool)

(declare-fun call!67284 () Bool)

(assert (=> b!1418959 (= e!803112 call!67284)))

(declare-fun b!1418960 () Bool)

(declare-fun e!803114 () Bool)

(assert (=> b!1418960 (= e!803114 call!67284)))

(declare-fun b!1418961 () Bool)

(assert (=> b!1418961 (= e!803112 e!803114)))

(declare-fun lt!625846 () (_ BitVec 64))

(assert (=> b!1418961 (= lt!625846 (select (arr!46783 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47983 0))(
  ( (Unit!47984) )
))
(declare-fun lt!625847 () Unit!47983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96914 (_ BitVec 64) (_ BitVec 32)) Unit!47983)

(assert (=> b!1418961 (= lt!625847 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625846 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418961 (arrayContainsKey!0 a!2831 lt!625846 #b00000000000000000000000000000000)))

(declare-fun lt!625845 () Unit!47983)

(assert (=> b!1418961 (= lt!625845 lt!625847)))

(declare-fun res!954001 () Bool)

(declare-datatypes ((SeekEntryResult!10991 0))(
  ( (MissingZero!10991 (index!46356 (_ BitVec 32))) (Found!10991 (index!46357 (_ BitVec 32))) (Intermediate!10991 (undefined!11803 Bool) (index!46358 (_ BitVec 32)) (x!128125 (_ BitVec 32))) (Undefined!10991) (MissingVacant!10991 (index!46359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96914 (_ BitVec 32)) SeekEntryResult!10991)

(assert (=> b!1418961 (= res!954001 (= (seekEntryOrOpen!0 (select (arr!46783 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!10991 #b00000000000000000000000000000000)))))

(assert (=> b!1418961 (=> (not res!954001) (not e!803114))))

(declare-fun bm!67281 () Bool)

(assert (=> bm!67281 (= call!67284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153057 (not res!954000)) b!1418958))

(assert (= (and b!1418958 c!131968) b!1418961))

(assert (= (and b!1418958 (not c!131968)) b!1418959))

(assert (= (and b!1418961 res!954001) b!1418960))

(assert (= (or b!1418960 b!1418959) bm!67281))

(declare-fun m!1309969 () Bool)

(assert (=> b!1418958 m!1309969))

(assert (=> b!1418958 m!1309969))

(declare-fun m!1309971 () Bool)

(assert (=> b!1418958 m!1309971))

(assert (=> b!1418961 m!1309969))

(declare-fun m!1309973 () Bool)

(assert (=> b!1418961 m!1309973))

(declare-fun m!1309975 () Bool)

(assert (=> b!1418961 m!1309975))

(assert (=> b!1418961 m!1309969))

(declare-fun m!1309977 () Bool)

(assert (=> b!1418961 m!1309977))

(declare-fun m!1309979 () Bool)

(assert (=> bm!67281 m!1309979))

(assert (=> b!1418917 d!153057))

(declare-fun d!153065 () Bool)

(assert (=> d!153065 (= (validKeyInArray!0 (select (arr!46783 a!2831) i!982)) (and (not (= (select (arr!46783 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46783 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418916 d!153065))

(declare-fun d!153067 () Bool)

(assert (=> d!153067 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122408 d!153067))

(declare-fun d!153077 () Bool)

(assert (=> d!153077 (= (array_inv!36064 a!2831) (bvsge (size!47334 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122408 d!153077))

(declare-fun d!153079 () Bool)

(assert (=> d!153079 (= (validKeyInArray!0 (select (arr!46783 a!2831) j!81)) (and (not (= (select (arr!46783 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46783 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418919 d!153079))

(check-sat (not b!1418958) (not bm!67281) (not b!1418961))
(check-sat)
