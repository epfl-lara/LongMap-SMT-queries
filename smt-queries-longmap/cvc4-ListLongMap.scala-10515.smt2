; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123964 () Bool)

(assert start!123964)

(declare-fun b!1436057 () Bool)

(declare-fun e!810416 () Bool)

(declare-fun e!810414 () Bool)

(assert (=> b!1436057 (= e!810416 e!810414)))

(declare-fun res!969034 () Bool)

(assert (=> b!1436057 (=> res!969034 e!810414)))

(declare-datatypes ((List!33629 0))(
  ( (Nil!33626) (Cons!33625 (h!34960 (_ BitVec 64)) (t!48323 List!33629)) )
))
(declare-fun contains!9882 (List!33629 (_ BitVec 64)) Bool)

(assert (=> b!1436057 (= res!969034 (contains!9882 Nil!33626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436058 () Bool)

(assert (=> b!1436058 (= e!810414 (contains!9882 Nil!33626 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436060 () Bool)

(declare-fun res!969033 () Bool)

(assert (=> b!1436060 (=> (not res!969033) (not e!810416))))

(declare-datatypes ((array!97660 0))(
  ( (array!97661 (arr!47128 (Array (_ BitVec 32) (_ BitVec 64))) (size!47678 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97660)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436060 (= res!969033 (validKeyInArray!0 (select (arr!47128 a!2862) i!1006)))))

(declare-fun b!1436061 () Bool)

(declare-fun res!969028 () Bool)

(assert (=> b!1436061 (=> (not res!969028) (not e!810416))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97660 (_ BitVec 32)) Bool)

(assert (=> b!1436061 (= res!969028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436062 () Bool)

(declare-fun res!969031 () Bool)

(assert (=> b!1436062 (=> (not res!969031) (not e!810416))))

(assert (=> b!1436062 (= res!969031 (and (bvsle #b00000000000000000000000000000000 (size!47678 a!2862)) (bvslt (size!47678 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1436063 () Bool)

(declare-fun res!969032 () Bool)

(assert (=> b!1436063 (=> (not res!969032) (not e!810416))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436063 (= res!969032 (validKeyInArray!0 (select (arr!47128 a!2862) j!93)))))

(declare-fun b!1436064 () Bool)

(declare-fun res!969029 () Bool)

(assert (=> b!1436064 (=> (not res!969029) (not e!810416))))

(declare-fun noDuplicate!2617 (List!33629) Bool)

(assert (=> b!1436064 (= res!969029 (noDuplicate!2617 Nil!33626))))

(declare-fun res!969030 () Bool)

(assert (=> start!123964 (=> (not res!969030) (not e!810416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123964 (= res!969030 (validMask!0 mask!2687))))

(assert (=> start!123964 e!810416))

(assert (=> start!123964 true))

(declare-fun array_inv!36156 (array!97660) Bool)

(assert (=> start!123964 (array_inv!36156 a!2862)))

(declare-fun b!1436059 () Bool)

(declare-fun res!969027 () Bool)

(assert (=> b!1436059 (=> (not res!969027) (not e!810416))))

(assert (=> b!1436059 (= res!969027 (and (= (size!47678 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47678 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47678 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!123964 res!969030) b!1436059))

(assert (= (and b!1436059 res!969027) b!1436060))

(assert (= (and b!1436060 res!969033) b!1436063))

(assert (= (and b!1436063 res!969032) b!1436061))

(assert (= (and b!1436061 res!969028) b!1436062))

(assert (= (and b!1436062 res!969031) b!1436064))

(assert (= (and b!1436064 res!969029) b!1436057))

(assert (= (and b!1436057 (not res!969034)) b!1436058))

(declare-fun m!1325395 () Bool)

(assert (=> b!1436058 m!1325395))

(declare-fun m!1325397 () Bool)

(assert (=> b!1436057 m!1325397))

(declare-fun m!1325399 () Bool)

(assert (=> b!1436064 m!1325399))

(declare-fun m!1325401 () Bool)

(assert (=> start!123964 m!1325401))

(declare-fun m!1325403 () Bool)

(assert (=> start!123964 m!1325403))

(declare-fun m!1325405 () Bool)

(assert (=> b!1436063 m!1325405))

(assert (=> b!1436063 m!1325405))

(declare-fun m!1325407 () Bool)

(assert (=> b!1436063 m!1325407))

(declare-fun m!1325409 () Bool)

(assert (=> b!1436060 m!1325409))

(assert (=> b!1436060 m!1325409))

(declare-fun m!1325411 () Bool)

(assert (=> b!1436060 m!1325411))

(declare-fun m!1325413 () Bool)

(assert (=> b!1436061 m!1325413))

(push 1)

(assert (not b!1436057))

(assert (not b!1436063))

(assert (not start!123964))

(assert (not b!1436060))

(assert (not b!1436061))

(assert (not b!1436064))

(assert (not b!1436058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154489 () Bool)

(declare-fun lt!632056 () Bool)

(declare-fun content!777 (List!33629) (Set (_ BitVec 64)))

(assert (=> d!154489 (= lt!632056 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!777 Nil!33626)))))

(declare-fun e!810435 () Bool)

(assert (=> d!154489 (= lt!632056 e!810435)))

(declare-fun res!969053 () Bool)

(assert (=> d!154489 (=> (not res!969053) (not e!810435))))

(assert (=> d!154489 (= res!969053 (is-Cons!33625 Nil!33626))))

(assert (=> d!154489 (= (contains!9882 Nil!33626 #b0000000000000000000000000000000000000000000000000000000000000000) lt!632056)))

(declare-fun b!1436083 () Bool)

(declare-fun e!810436 () Bool)

(assert (=> b!1436083 (= e!810435 e!810436)))

(declare-fun res!969054 () Bool)

(assert (=> b!1436083 (=> res!969054 e!810436)))

(assert (=> b!1436083 (= res!969054 (= (h!34960 Nil!33626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436084 () Bool)

(assert (=> b!1436084 (= e!810436 (contains!9882 (t!48323 Nil!33626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154489 res!969053) b!1436083))

(assert (= (and b!1436083 (not res!969054)) b!1436084))

(declare-fun m!1325431 () Bool)

(assert (=> d!154489 m!1325431))

(declare-fun m!1325433 () Bool)

(assert (=> d!154489 m!1325433))

(declare-fun m!1325435 () Bool)

(assert (=> b!1436084 m!1325435))

(assert (=> b!1436057 d!154489))

(declare-fun b!1436099 () Bool)

(declare-fun e!810451 () Bool)

(declare-fun call!67582 () Bool)

(assert (=> b!1436099 (= e!810451 call!67582)))

(declare-fun bm!67579 () Bool)

(assert (=> bm!67579 (= call!67582 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154497 () Bool)

(declare-fun res!969065 () Bool)

(declare-fun e!810449 () Bool)

(assert (=> d!154497 (=> res!969065 e!810449)))

(assert (=> d!154497 (= res!969065 (bvsge #b00000000000000000000000000000000 (size!47678 a!2862)))))

(assert (=> d!154497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810449)))

(declare-fun b!1436100 () Bool)

(declare-fun e!810450 () Bool)

(assert (=> b!1436100 (= e!810449 e!810450)))

(declare-fun c!133020 () Bool)

(assert (=> b!1436100 (= c!133020 (validKeyInArray!0 (select (arr!47128 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436101 () Bool)

(assert (=> b!1436101 (= e!810450 e!810451)))

(declare-fun lt!632064 () (_ BitVec 64))

(assert (=> b!1436101 (= lt!632064 (select (arr!47128 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48546 0))(
  ( (Unit!48547) )
))
(declare-fun lt!632063 () Unit!48546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97660 (_ BitVec 64) (_ BitVec 32)) Unit!48546)

(assert (=> b!1436101 (= lt!632063 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632064 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436101 (arrayContainsKey!0 a!2862 lt!632064 #b00000000000000000000000000000000)))

(declare-fun lt!632065 () Unit!48546)

(assert (=> b!1436101 (= lt!632065 lt!632063)))

(declare-fun res!969066 () Bool)

(declare-datatypes ((SeekEntryResult!11400 0))(
  ( (MissingZero!11400 (index!47992 (_ BitVec 32))) (Found!11400 (index!47993 (_ BitVec 32))) (Intermediate!11400 (undefined!12212 Bool) (index!47994 (_ BitVec 32)) (x!129670 (_ BitVec 32))) (Undefined!11400) (MissingVacant!11400 (index!47995 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97660 (_ BitVec 32)) SeekEntryResult!11400)

(assert (=> b!1436101 (= res!969066 (= (seekEntryOrOpen!0 (select (arr!47128 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11400 #b00000000000000000000000000000000)))))

(assert (=> b!1436101 (=> (not res!969066) (not e!810451))))

(declare-fun b!1436102 () Bool)

(assert (=> b!1436102 (= e!810450 call!67582)))

(assert (= (and d!154497 (not res!969065)) b!1436100))

(assert (= (and b!1436100 c!133020) b!1436101))

(assert (= (and b!1436100 (not c!133020)) b!1436102))

(assert (= (and b!1436101 res!969066) b!1436099))

(assert (= (or b!1436099 b!1436102) bm!67579))

(declare-fun m!1325441 () Bool)

(assert (=> bm!67579 m!1325441))

(declare-fun m!1325443 () Bool)

(assert (=> b!1436100 m!1325443))

(assert (=> b!1436100 m!1325443))

(declare-fun m!1325445 () Bool)

(assert (=> b!1436100 m!1325445))

(assert (=> b!1436101 m!1325443))

(declare-fun m!1325447 () Bool)

(assert (=> b!1436101 m!1325447))

(declare-fun m!1325449 () Bool)

(assert (=> b!1436101 m!1325449))

(assert (=> b!1436101 m!1325443))

(declare-fun m!1325451 () Bool)

(assert (=> b!1436101 m!1325451))

(assert (=> b!1436061 d!154497))

(declare-fun d!154507 () Bool)

(assert (=> d!154507 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123964 d!154507))

(declare-fun d!154515 () Bool)

