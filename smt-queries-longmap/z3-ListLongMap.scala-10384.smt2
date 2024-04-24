; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122438 () Bool)

(assert start!122438)

(declare-fun res!954026 () Bool)

(declare-fun e!803137 () Bool)

(assert (=> start!122438 (=> (not res!954026) (not e!803137))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122438 (= res!954026 (validMask!0 mask!2608))))

(assert (=> start!122438 e!803137))

(assert (=> start!122438 true))

(declare-datatypes ((array!96923 0))(
  ( (array!96924 (arr!46786 (Array (_ BitVec 32) (_ BitVec 64))) (size!47337 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96923)

(declare-fun array_inv!36067 (array!96923) Bool)

(assert (=> start!122438 (array_inv!36067 a!2831)))

(declare-fun b!1418998 () Bool)

(declare-fun res!954028 () Bool)

(assert (=> b!1418998 (=> (not res!954028) (not e!803137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96923 (_ BitVec 32)) Bool)

(assert (=> b!1418998 (= res!954028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418999 () Bool)

(declare-fun res!954030 () Bool)

(assert (=> b!1418999 (=> (not res!954030) (not e!803137))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418999 (= res!954030 (validKeyInArray!0 (select (arr!46786 a!2831) j!81)))))

(declare-fun b!1419000 () Bool)

(declare-datatypes ((List!33283 0))(
  ( (Nil!33280) (Cons!33279 (h!34580 (_ BitVec 64)) (t!47969 List!33283)) )
))
(declare-fun noDuplicate!2623 (List!33283) Bool)

(assert (=> b!1419000 (= e!803137 (not (noDuplicate!2623 Nil!33280)))))

(declare-fun b!1419001 () Bool)

(declare-fun res!954029 () Bool)

(assert (=> b!1419001 (=> (not res!954029) (not e!803137))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419001 (= res!954029 (and (= (size!47337 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47337 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47337 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419002 () Bool)

(declare-fun res!954031 () Bool)

(assert (=> b!1419002 (=> (not res!954031) (not e!803137))))

(assert (=> b!1419002 (= res!954031 (and (bvsle #b00000000000000000000000000000000 (size!47337 a!2831)) (bvslt (size!47337 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1419003 () Bool)

(declare-fun res!954027 () Bool)

(assert (=> b!1419003 (=> (not res!954027) (not e!803137))))

(assert (=> b!1419003 (= res!954027 (validKeyInArray!0 (select (arr!46786 a!2831) i!982)))))

(assert (= (and start!122438 res!954026) b!1419001))

(assert (= (and b!1419001 res!954029) b!1419003))

(assert (= (and b!1419003 res!954027) b!1418999))

(assert (= (and b!1418999 res!954030) b!1418998))

(assert (= (and b!1418998 res!954028) b!1419002))

(assert (= (and b!1419002 res!954031) b!1419000))

(declare-fun m!1310005 () Bool)

(assert (=> b!1419003 m!1310005))

(assert (=> b!1419003 m!1310005))

(declare-fun m!1310007 () Bool)

(assert (=> b!1419003 m!1310007))

(declare-fun m!1310009 () Bool)

(assert (=> start!122438 m!1310009))

(declare-fun m!1310011 () Bool)

(assert (=> start!122438 m!1310011))

(declare-fun m!1310013 () Bool)

(assert (=> b!1419000 m!1310013))

(declare-fun m!1310015 () Bool)

(assert (=> b!1418999 m!1310015))

(assert (=> b!1418999 m!1310015))

(declare-fun m!1310017 () Bool)

(assert (=> b!1418999 m!1310017))

(declare-fun m!1310019 () Bool)

(assert (=> b!1418998 m!1310019))

(check-sat (not b!1419000) (not b!1418999) (not b!1418998) (not start!122438) (not b!1419003))
(check-sat)
(get-model)

(declare-fun d!153089 () Bool)

(assert (=> d!153089 (= (validKeyInArray!0 (select (arr!46786 a!2831) j!81)) (and (not (= (select (arr!46786 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46786 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418999 d!153089))

(declare-fun b!1419048 () Bool)

(declare-fun e!803159 () Bool)

(declare-fun e!803157 () Bool)

(assert (=> b!1419048 (= e!803159 e!803157)))

(declare-fun lt!625872 () (_ BitVec 64))

(assert (=> b!1419048 (= lt!625872 (select (arr!46786 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47989 0))(
  ( (Unit!47990) )
))
(declare-fun lt!625873 () Unit!47989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96923 (_ BitVec 64) (_ BitVec 32)) Unit!47989)

(assert (=> b!1419048 (= lt!625873 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625872 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419048 (arrayContainsKey!0 a!2831 lt!625872 #b00000000000000000000000000000000)))

(declare-fun lt!625874 () Unit!47989)

(assert (=> b!1419048 (= lt!625874 lt!625873)))

(declare-fun res!954072 () Bool)

(declare-datatypes ((SeekEntryResult!10993 0))(
  ( (MissingZero!10993 (index!46364 (_ BitVec 32))) (Found!10993 (index!46365 (_ BitVec 32))) (Intermediate!10993 (undefined!11805 Bool) (index!46366 (_ BitVec 32)) (x!128135 (_ BitVec 32))) (Undefined!10993) (MissingVacant!10993 (index!46367 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96923 (_ BitVec 32)) SeekEntryResult!10993)

(assert (=> b!1419048 (= res!954072 (= (seekEntryOrOpen!0 (select (arr!46786 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!10993 #b00000000000000000000000000000000)))))

(assert (=> b!1419048 (=> (not res!954072) (not e!803157))))

(declare-fun b!1419049 () Bool)

(declare-fun call!67293 () Bool)

(assert (=> b!1419049 (= e!803157 call!67293)))

(declare-fun b!1419050 () Bool)

(declare-fun e!803158 () Bool)

(assert (=> b!1419050 (= e!803158 e!803159)))

(declare-fun c!131977 () Bool)

(assert (=> b!1419050 (= c!131977 (validKeyInArray!0 (select (arr!46786 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419051 () Bool)

(assert (=> b!1419051 (= e!803159 call!67293)))

(declare-fun bm!67290 () Bool)

(assert (=> bm!67290 (= call!67293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153091 () Bool)

(declare-fun res!954073 () Bool)

(assert (=> d!153091 (=> res!954073 e!803158)))

(assert (=> d!153091 (= res!954073 (bvsge #b00000000000000000000000000000000 (size!47337 a!2831)))))

(assert (=> d!153091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803158)))

(assert (= (and d!153091 (not res!954073)) b!1419050))

(assert (= (and b!1419050 c!131977) b!1419048))

(assert (= (and b!1419050 (not c!131977)) b!1419051))

(assert (= (and b!1419048 res!954072) b!1419049))

(assert (= (or b!1419049 b!1419051) bm!67290))

(declare-fun m!1310053 () Bool)

(assert (=> b!1419048 m!1310053))

(declare-fun m!1310055 () Bool)

(assert (=> b!1419048 m!1310055))

(declare-fun m!1310057 () Bool)

(assert (=> b!1419048 m!1310057))

(assert (=> b!1419048 m!1310053))

(declare-fun m!1310059 () Bool)

(assert (=> b!1419048 m!1310059))

(assert (=> b!1419050 m!1310053))

(assert (=> b!1419050 m!1310053))

(declare-fun m!1310061 () Bool)

(assert (=> b!1419050 m!1310061))

(declare-fun m!1310063 () Bool)

(assert (=> bm!67290 m!1310063))

(assert (=> b!1418998 d!153091))

(declare-fun d!153101 () Bool)

(assert (=> d!153101 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122438 d!153101))

(declare-fun d!153109 () Bool)

(assert (=> d!153109 (= (array_inv!36067 a!2831) (bvsge (size!47337 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122438 d!153109))

(declare-fun d!153113 () Bool)

(assert (=> d!153113 (= (validKeyInArray!0 (select (arr!46786 a!2831) i!982)) (and (not (= (select (arr!46786 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46786 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419003 d!153113))

(declare-fun d!153115 () Bool)

(declare-fun res!954102 () Bool)

(declare-fun e!803194 () Bool)

(assert (=> d!153115 (=> res!954102 e!803194)))

(get-info :version)

(assert (=> d!153115 (= res!954102 ((_ is Nil!33280) Nil!33280))))

(assert (=> d!153115 (= (noDuplicate!2623 Nil!33280) e!803194)))

(declare-fun b!1419092 () Bool)

(declare-fun e!803195 () Bool)

(assert (=> b!1419092 (= e!803194 e!803195)))

(declare-fun res!954103 () Bool)

(assert (=> b!1419092 (=> (not res!954103) (not e!803195))))

(declare-fun contains!9875 (List!33283 (_ BitVec 64)) Bool)

(assert (=> b!1419092 (= res!954103 (not (contains!9875 (t!47969 Nil!33280) (h!34580 Nil!33280))))))

(declare-fun b!1419093 () Bool)

(assert (=> b!1419093 (= e!803195 (noDuplicate!2623 (t!47969 Nil!33280)))))

(assert (= (and d!153115 (not res!954102)) b!1419092))

(assert (= (and b!1419092 res!954103) b!1419093))

(declare-fun m!1310097 () Bool)

(assert (=> b!1419092 m!1310097))

(declare-fun m!1310099 () Bool)

(assert (=> b!1419093 m!1310099))

(assert (=> b!1419000 d!153115))

(check-sat (not bm!67290) (not b!1419093) (not b!1419048) (not b!1419092) (not b!1419050))
(check-sat)
