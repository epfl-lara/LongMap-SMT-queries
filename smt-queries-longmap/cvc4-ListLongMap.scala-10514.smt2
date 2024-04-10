; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123928 () Bool)

(assert start!123928)

(declare-fun res!968924 () Bool)

(declare-fun e!810344 () Bool)

(assert (=> start!123928 (=> (not res!968924) (not e!810344))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123928 (= res!968924 (validMask!0 mask!2687))))

(assert (=> start!123928 e!810344))

(assert (=> start!123928 true))

(declare-datatypes ((array!97651 0))(
  ( (array!97652 (arr!47125 (Array (_ BitVec 32) (_ BitVec 64))) (size!47675 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97651)

(declare-fun array_inv!36153 (array!97651) Bool)

(assert (=> start!123928 (array_inv!36153 a!2862)))

(declare-fun b!1435933 () Bool)

(declare-fun res!968923 () Bool)

(assert (=> b!1435933 (=> (not res!968923) (not e!810344))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435933 (= res!968923 (and (= (size!47675 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47675 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47675 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435934 () Bool)

(declare-fun res!968922 () Bool)

(assert (=> b!1435934 (=> (not res!968922) (not e!810344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435934 (= res!968922 (validKeyInArray!0 (select (arr!47125 a!2862) i!1006)))))

(declare-fun b!1435935 () Bool)

(declare-fun res!968921 () Bool)

(assert (=> b!1435935 (=> (not res!968921) (not e!810344))))

(assert (=> b!1435935 (= res!968921 (validKeyInArray!0 (select (arr!47125 a!2862) j!93)))))

(declare-fun b!1435936 () Bool)

(declare-fun res!968925 () Bool)

(assert (=> b!1435936 (=> (not res!968925) (not e!810344))))

(assert (=> b!1435936 (= res!968925 (and (bvsle #b00000000000000000000000000000000 (size!47675 a!2862)) (bvslt (size!47675 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1435937 () Bool)

(declare-datatypes ((List!33626 0))(
  ( (Nil!33623) (Cons!33622 (h!34957 (_ BitVec 64)) (t!48320 List!33626)) )
))
(declare-fun noDuplicate!2614 (List!33626) Bool)

(assert (=> b!1435937 (= e!810344 (not (noDuplicate!2614 Nil!33623)))))

(declare-fun b!1435938 () Bool)

(declare-fun res!968926 () Bool)

(assert (=> b!1435938 (=> (not res!968926) (not e!810344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97651 (_ BitVec 32)) Bool)

(assert (=> b!1435938 (= res!968926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!123928 res!968924) b!1435933))

(assert (= (and b!1435933 res!968923) b!1435934))

(assert (= (and b!1435934 res!968922) b!1435935))

(assert (= (and b!1435935 res!968921) b!1435938))

(assert (= (and b!1435938 res!968926) b!1435936))

(assert (= (and b!1435936 res!968925) b!1435937))

(declare-fun m!1325291 () Bool)

(assert (=> b!1435934 m!1325291))

(assert (=> b!1435934 m!1325291))

(declare-fun m!1325293 () Bool)

(assert (=> b!1435934 m!1325293))

(declare-fun m!1325295 () Bool)

(assert (=> b!1435937 m!1325295))

(declare-fun m!1325297 () Bool)

(assert (=> b!1435938 m!1325297))

(declare-fun m!1325299 () Bool)

(assert (=> start!123928 m!1325299))

(declare-fun m!1325301 () Bool)

(assert (=> start!123928 m!1325301))

(declare-fun m!1325303 () Bool)

(assert (=> b!1435935 m!1325303))

(assert (=> b!1435935 m!1325303))

(declare-fun m!1325305 () Bool)

(assert (=> b!1435935 m!1325305))

(push 1)

(assert (not start!123928))

(assert (not b!1435935))

(assert (not b!1435934))

(assert (not b!1435937))

(assert (not b!1435938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154447 () Bool)

(assert (=> d!154447 (= (validKeyInArray!0 (select (arr!47125 a!2862) j!93)) (and (not (= (select (arr!47125 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47125 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435935 d!154447))

(declare-fun d!154449 () Bool)

(declare-fun res!968935 () Bool)

(declare-fun e!810355 () Bool)

(assert (=> d!154449 (=> res!968935 e!810355)))

(assert (=> d!154449 (= res!968935 (is-Nil!33623 Nil!33623))))

(assert (=> d!154449 (= (noDuplicate!2614 Nil!33623) e!810355)))

(declare-fun b!1435951 () Bool)

(declare-fun e!810356 () Bool)

(assert (=> b!1435951 (= e!810355 e!810356)))

(declare-fun res!968936 () Bool)

(assert (=> b!1435951 (=> (not res!968936) (not e!810356))))

(declare-fun contains!9877 (List!33626 (_ BitVec 64)) Bool)

(assert (=> b!1435951 (= res!968936 (not (contains!9877 (t!48320 Nil!33623) (h!34957 Nil!33623))))))

(declare-fun b!1435952 () Bool)

(assert (=> b!1435952 (= e!810356 (noDuplicate!2614 (t!48320 Nil!33623)))))

(assert (= (and d!154449 (not res!968935)) b!1435951))

(assert (= (and b!1435951 res!968936) b!1435952))

(declare-fun m!1325307 () Bool)

(assert (=> b!1435951 m!1325307))

(declare-fun m!1325309 () Bool)

(assert (=> b!1435952 m!1325309))

(assert (=> b!1435937 d!154449))

(declare-fun b!1435977 () Bool)

(declare-fun e!810380 () Bool)

(declare-fun e!810378 () Bool)

(assert (=> b!1435977 (= e!810380 e!810378)))

(declare-fun c!133014 () Bool)

(assert (=> b!1435977 (= c!133014 (validKeyInArray!0 (select (arr!47125 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67573 () Bool)

(declare-fun call!67576 () Bool)

(assert (=> bm!67573 (= call!67576 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1435978 () Bool)

(assert (=> b!1435978 (= e!810378 call!67576)))

(declare-fun d!154451 () Bool)

(declare-fun res!968955 () Bool)

(assert (=> d!154451 (=> res!968955 e!810380)))

(assert (=> d!154451 (= res!968955 (bvsge #b00000000000000000000000000000000 (size!47675 a!2862)))))

(assert (=> d!154451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810380)))

(declare-fun b!1435979 () Bool)

(declare-fun e!810379 () Bool)

(assert (=> b!1435979 (= e!810378 e!810379)))

(declare-fun lt!632036 () (_ BitVec 64))

(assert (=> b!1435979 (= lt!632036 (select (arr!47125 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48540 0))(
  ( (Unit!48541) )
))
(declare-fun lt!632035 () Unit!48540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97651 (_ BitVec 64) (_ BitVec 32)) Unit!48540)

(assert (=> b!1435979 (= lt!632035 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632036 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435979 (arrayContainsKey!0 a!2862 lt!632036 #b00000000000000000000000000000000)))

(declare-fun lt!632037 () Unit!48540)

(assert (=> b!1435979 (= lt!632037 lt!632035)))

(declare-fun res!968956 () Bool)

(declare-datatypes ((SeekEntryResult!11397 0))(
  ( (MissingZero!11397 (index!47980 (_ BitVec 32))) (Found!11397 (index!47981 (_ BitVec 32))) (Intermediate!11397 (undefined!12209 Bool) (index!47982 (_ BitVec 32)) (x!129659 (_ BitVec 32))) (Undefined!11397) (MissingVacant!11397 (index!47983 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97651 (_ BitVec 32)) SeekEntryResult!11397)

(assert (=> b!1435979 (= res!968956 (= (seekEntryOrOpen!0 (select (arr!47125 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11397 #b00000000000000000000000000000000)))))

(assert (=> b!1435979 (=> (not res!968956) (not e!810379))))

(declare-fun b!1435980 () Bool)

(assert (=> b!1435980 (= e!810379 call!67576)))

(assert (= (and d!154451 (not res!968955)) b!1435977))

(assert (= (and b!1435977 c!133014) b!1435979))

(assert (= (and b!1435977 (not c!133014)) b!1435978))

(assert (= (and b!1435979 res!968956) b!1435980))

(assert (= (or b!1435980 b!1435978) bm!67573))

