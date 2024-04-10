; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123894 () Bool)

(assert start!123894)

(declare-fun b!1435814 () Bool)

(declare-fun res!968824 () Bool)

(declare-fun e!810287 () Bool)

(assert (=> b!1435814 (=> (not res!968824) (not e!810287))))

(declare-datatypes ((array!97638 0))(
  ( (array!97639 (arr!47120 (Array (_ BitVec 32) (_ BitVec 64))) (size!47670 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97638)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435814 (= res!968824 (validKeyInArray!0 (select (arr!47120 a!2862) j!93)))))

(declare-fun b!1435815 () Bool)

(assert (=> b!1435815 (= e!810287 (and (bvsle #b00000000000000000000000000000000 (size!47670 a!2862)) (bvsge (size!47670 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1435817 () Bool)

(declare-fun res!968822 () Bool)

(assert (=> b!1435817 (=> (not res!968822) (not e!810287))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435817 (= res!968822 (and (= (size!47670 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47670 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47670 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435818 () Bool)

(declare-fun res!968821 () Bool)

(assert (=> b!1435818 (=> (not res!968821) (not e!810287))))

(assert (=> b!1435818 (= res!968821 (validKeyInArray!0 (select (arr!47120 a!2862) i!1006)))))

(declare-fun res!968820 () Bool)

(assert (=> start!123894 (=> (not res!968820) (not e!810287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123894 (= res!968820 (validMask!0 mask!2687))))

(assert (=> start!123894 e!810287))

(assert (=> start!123894 true))

(declare-fun array_inv!36148 (array!97638) Bool)

(assert (=> start!123894 (array_inv!36148 a!2862)))

(declare-fun b!1435816 () Bool)

(declare-fun res!968823 () Bool)

(assert (=> b!1435816 (=> (not res!968823) (not e!810287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97638 (_ BitVec 32)) Bool)

(assert (=> b!1435816 (= res!968823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!123894 res!968820) b!1435817))

(assert (= (and b!1435817 res!968822) b!1435818))

(assert (= (and b!1435818 res!968821) b!1435814))

(assert (= (and b!1435814 res!968824) b!1435816))

(assert (= (and b!1435816 res!968823) b!1435815))

(declare-fun m!1325181 () Bool)

(assert (=> b!1435814 m!1325181))

(assert (=> b!1435814 m!1325181))

(declare-fun m!1325183 () Bool)

(assert (=> b!1435814 m!1325183))

(declare-fun m!1325185 () Bool)

(assert (=> b!1435818 m!1325185))

(assert (=> b!1435818 m!1325185))

(declare-fun m!1325187 () Bool)

(assert (=> b!1435818 m!1325187))

(declare-fun m!1325189 () Bool)

(assert (=> start!123894 m!1325189))

(declare-fun m!1325191 () Bool)

(assert (=> start!123894 m!1325191))

(declare-fun m!1325193 () Bool)

(assert (=> b!1435816 m!1325193))

(push 1)

(assert (not b!1435816))

(assert (not b!1435818))

(assert (not start!123894))

(assert (not b!1435814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154415 () Bool)

(declare-fun res!968866 () Bool)

(declare-fun e!810318 () Bool)

(assert (=> d!154415 (=> res!968866 e!810318)))

(assert (=> d!154415 (= res!968866 (bvsge #b00000000000000000000000000000000 (size!47670 a!2862)))))

(assert (=> d!154415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810318)))

(declare-fun b!1435871 () Bool)

(declare-fun e!810316 () Bool)

(declare-fun call!67566 () Bool)

(assert (=> b!1435871 (= e!810316 call!67566)))

(declare-fun b!1435872 () Bool)

(declare-fun e!810317 () Bool)

(assert (=> b!1435872 (= e!810317 call!67566)))

(declare-fun bm!67563 () Bool)

(assert (=> bm!67563 (= call!67566 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1435873 () Bool)

(assert (=> b!1435873 (= e!810317 e!810316)))

(declare-fun lt!632005 () (_ BitVec 64))

(assert (=> b!1435873 (= lt!632005 (select (arr!47120 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48534 0))(
  ( (Unit!48535) )
))
(declare-fun lt!632006 () Unit!48534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97638 (_ BitVec 64) (_ BitVec 32)) Unit!48534)

(assert (=> b!1435873 (= lt!632006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632005 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435873 (arrayContainsKey!0 a!2862 lt!632005 #b00000000000000000000000000000000)))

(declare-fun lt!632007 () Unit!48534)

(assert (=> b!1435873 (= lt!632007 lt!632006)))

(declare-fun res!968865 () Bool)

(declare-datatypes ((SeekEntryResult!11394 0))(
  ( (MissingZero!11394 (index!47968 (_ BitVec 32))) (Found!11394 (index!47969 (_ BitVec 32))) (Intermediate!11394 (undefined!12206 Bool) (index!47970 (_ BitVec 32)) (x!129648 (_ BitVec 32))) (Undefined!11394) (MissingVacant!11394 (index!47971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97638 (_ BitVec 32)) SeekEntryResult!11394)

(assert (=> b!1435873 (= res!968865 (= (seekEntryOrOpen!0 (select (arr!47120 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11394 #b00000000000000000000000000000000)))))

(assert (=> b!1435873 (=> (not res!968865) (not e!810316))))

