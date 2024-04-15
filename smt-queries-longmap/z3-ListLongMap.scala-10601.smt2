; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124714 () Bool)

(assert start!124714)

(declare-fun b!1446237 () Bool)

(declare-fun res!978116 () Bool)

(declare-fun e!814545 () Bool)

(assert (=> b!1446237 (=> (not res!978116) (not e!814545))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446237 (= res!978116 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446238 () Bool)

(declare-fun e!814543 () Bool)

(declare-fun e!814548 () Bool)

(assert (=> b!1446238 (= e!814543 e!814548)))

(declare-fun res!978125 () Bool)

(assert (=> b!1446238 (=> (not res!978125) (not e!814548))))

(declare-datatypes ((array!98140 0))(
  ( (array!98141 (arr!47359 (Array (_ BitVec 32) (_ BitVec 64))) (size!47911 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98140)

(assert (=> b!1446238 (= res!978125 (= (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634563 () array!98140)

(assert (=> b!1446238 (= lt!634563 (array!98141 (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47911 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1446239 () Bool)

(declare-fun e!814541 () Bool)

(assert (=> b!1446239 (= e!814541 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446240 () Bool)

(declare-fun res!978111 () Bool)

(assert (=> b!1446240 (=> (not res!978111) (not e!814543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446240 (= res!978111 (validKeyInArray!0 (select (arr!47359 a!2862) i!1006)))))

(declare-fun b!1446241 () Bool)

(declare-fun res!978114 () Bool)

(assert (=> b!1446241 (=> (not res!978114) (not e!814543))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1446241 (= res!978114 (validKeyInArray!0 (select (arr!47359 a!2862) j!93)))))

(declare-fun b!1446242 () Bool)

(declare-fun res!978112 () Bool)

(assert (=> b!1446242 (=> (not res!978112) (not e!814543))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1446242 (= res!978112 (and (= (size!47911 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47911 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47911 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!978120 () Bool)

(assert (=> start!124714 (=> (not res!978120) (not e!814543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124714 (= res!978120 (validMask!0 mask!2687))))

(assert (=> start!124714 e!814543))

(assert (=> start!124714 true))

(declare-fun array_inv!36592 (array!98140) Bool)

(assert (=> start!124714 (array_inv!36592 a!2862)))

(declare-fun b!1446243 () Bool)

(declare-fun e!814546 () Bool)

(declare-fun lt!634559 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11636 0))(
  ( (MissingZero!11636 (index!48936 (_ BitVec 32))) (Found!11636 (index!48937 (_ BitVec 32))) (Intermediate!11636 (undefined!12448 Bool) (index!48938 (_ BitVec 32)) (x!130616 (_ BitVec 32))) (Undefined!11636) (MissingVacant!11636 (index!48939 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98140 (_ BitVec 32)) SeekEntryResult!11636)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98140 (_ BitVec 32)) SeekEntryResult!11636)

(assert (=> b!1446243 (= e!814546 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634559 lt!634563 mask!2687) (seekEntryOrOpen!0 lt!634559 lt!634563 mask!2687)))))

(declare-fun b!1446244 () Bool)

(declare-fun res!978119 () Bool)

(assert (=> b!1446244 (=> (not res!978119) (not e!814543))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446244 (= res!978119 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47911 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47911 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47911 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446245 () Bool)

(declare-fun e!814547 () Bool)

(assert (=> b!1446245 (= e!814547 e!814545)))

(declare-fun res!978126 () Bool)

(assert (=> b!1446245 (=> (not res!978126) (not e!814545))))

(declare-fun lt!634558 () SeekEntryResult!11636)

(assert (=> b!1446245 (= res!978126 (= lt!634558 (Intermediate!11636 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98140 (_ BitVec 32)) SeekEntryResult!11636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446245 (= lt!634558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634559 mask!2687) lt!634559 lt!634563 mask!2687))))

(assert (=> b!1446245 (= lt!634559 (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446246 () Bool)

(declare-fun e!814540 () Bool)

(assert (=> b!1446246 (= e!814540 true)))

(declare-fun lt!634560 () SeekEntryResult!11636)

(assert (=> b!1446246 (= lt!634560 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47359 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446247 () Bool)

(assert (=> b!1446247 (= e!814546 (= lt!634558 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634559 lt!634563 mask!2687)))))

(declare-fun b!1446248 () Bool)

(declare-fun res!978113 () Bool)

(assert (=> b!1446248 (=> (not res!978113) (not e!814543))))

(declare-datatypes ((List!33938 0))(
  ( (Nil!33935) (Cons!33934 (h!35284 (_ BitVec 64)) (t!48624 List!33938)) )
))
(declare-fun arrayNoDuplicates!0 (array!98140 (_ BitVec 32) List!33938) Bool)

(assert (=> b!1446248 (= res!978113 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33935))))

(declare-fun b!1446249 () Bool)

(assert (=> b!1446249 (= e!814548 e!814547)))

(declare-fun res!978118 () Bool)

(assert (=> b!1446249 (=> (not res!978118) (not e!814547))))

(declare-fun lt!634557 () SeekEntryResult!11636)

(assert (=> b!1446249 (= res!978118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47359 a!2862) j!93) mask!2687) (select (arr!47359 a!2862) j!93) a!2862 mask!2687) lt!634557))))

(assert (=> b!1446249 (= lt!634557 (Intermediate!11636 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446250 () Bool)

(assert (=> b!1446250 (= e!814545 (not e!814540))))

(declare-fun res!978124 () Bool)

(assert (=> b!1446250 (=> res!978124 e!814540)))

(assert (=> b!1446250 (= res!978124 (or (and (= (select (arr!47359 a!2862) index!646) (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47359 a!2862) index!646) (select (arr!47359 a!2862) j!93))) (not (= (select (arr!47359 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814542 () Bool)

(assert (=> b!1446250 e!814542))

(declare-fun res!978121 () Bool)

(assert (=> b!1446250 (=> (not res!978121) (not e!814542))))

(declare-fun lt!634562 () SeekEntryResult!11636)

(assert (=> b!1446250 (= res!978121 (and (= lt!634562 (Found!11636 j!93)) (or (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) (select (arr!47359 a!2862) j!93)))))))

(assert (=> b!1446250 (= lt!634562 (seekEntryOrOpen!0 (select (arr!47359 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98140 (_ BitVec 32)) Bool)

(assert (=> b!1446250 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48609 0))(
  ( (Unit!48610) )
))
(declare-fun lt!634561 () Unit!48609)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48609)

(assert (=> b!1446250 (= lt!634561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446251 () Bool)

(declare-fun res!978123 () Bool)

(assert (=> b!1446251 (=> (not res!978123) (not e!814547))))

(assert (=> b!1446251 (= res!978123 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47359 a!2862) j!93) a!2862 mask!2687) lt!634557))))

(declare-fun b!1446252 () Bool)

(declare-fun res!978117 () Bool)

(assert (=> b!1446252 (=> (not res!978117) (not e!814545))))

(assert (=> b!1446252 (= res!978117 e!814546)))

(declare-fun c!133576 () Bool)

(assert (=> b!1446252 (= c!133576 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446253 () Bool)

(declare-fun res!978127 () Bool)

(assert (=> b!1446253 (=> (not res!978127) (not e!814543))))

(assert (=> b!1446253 (= res!978127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446254 () Bool)

(declare-fun e!814544 () Bool)

(assert (=> b!1446254 (= e!814542 e!814544)))

(declare-fun res!978115 () Bool)

(assert (=> b!1446254 (=> res!978115 e!814544)))

(assert (=> b!1446254 (= res!978115 (or (and (= (select (arr!47359 a!2862) index!646) (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47359 a!2862) index!646) (select (arr!47359 a!2862) j!93))) (not (= (select (arr!47359 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446255 () Bool)

(assert (=> b!1446255 (= e!814544 e!814541)))

(declare-fun res!978122 () Bool)

(assert (=> b!1446255 (=> (not res!978122) (not e!814541))))

(assert (=> b!1446255 (= res!978122 (= lt!634562 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47359 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!124714 res!978120) b!1446242))

(assert (= (and b!1446242 res!978112) b!1446240))

(assert (= (and b!1446240 res!978111) b!1446241))

(assert (= (and b!1446241 res!978114) b!1446253))

(assert (= (and b!1446253 res!978127) b!1446248))

(assert (= (and b!1446248 res!978113) b!1446244))

(assert (= (and b!1446244 res!978119) b!1446238))

(assert (= (and b!1446238 res!978125) b!1446249))

(assert (= (and b!1446249 res!978118) b!1446251))

(assert (= (and b!1446251 res!978123) b!1446245))

(assert (= (and b!1446245 res!978126) b!1446252))

(assert (= (and b!1446252 c!133576) b!1446247))

(assert (= (and b!1446252 (not c!133576)) b!1446243))

(assert (= (and b!1446252 res!978117) b!1446237))

(assert (= (and b!1446237 res!978116) b!1446250))

(assert (= (and b!1446250 res!978121) b!1446254))

(assert (= (and b!1446254 (not res!978115)) b!1446255))

(assert (= (and b!1446255 res!978122) b!1446239))

(assert (= (and b!1446250 (not res!978124)) b!1446246))

(declare-fun m!1334625 () Bool)

(assert (=> b!1446243 m!1334625))

(declare-fun m!1334627 () Bool)

(assert (=> b!1446243 m!1334627))

(declare-fun m!1334629 () Bool)

(assert (=> b!1446240 m!1334629))

(assert (=> b!1446240 m!1334629))

(declare-fun m!1334631 () Bool)

(assert (=> b!1446240 m!1334631))

(declare-fun m!1334633 () Bool)

(assert (=> b!1446251 m!1334633))

(assert (=> b!1446251 m!1334633))

(declare-fun m!1334635 () Bool)

(assert (=> b!1446251 m!1334635))

(declare-fun m!1334637 () Bool)

(assert (=> b!1446248 m!1334637))

(assert (=> b!1446249 m!1334633))

(assert (=> b!1446249 m!1334633))

(declare-fun m!1334639 () Bool)

(assert (=> b!1446249 m!1334639))

(assert (=> b!1446249 m!1334639))

(assert (=> b!1446249 m!1334633))

(declare-fun m!1334641 () Bool)

(assert (=> b!1446249 m!1334641))

(declare-fun m!1334643 () Bool)

(assert (=> b!1446254 m!1334643))

(declare-fun m!1334645 () Bool)

(assert (=> b!1446254 m!1334645))

(declare-fun m!1334647 () Bool)

(assert (=> b!1446254 m!1334647))

(assert (=> b!1446254 m!1334633))

(declare-fun m!1334649 () Bool)

(assert (=> start!124714 m!1334649))

(declare-fun m!1334651 () Bool)

(assert (=> start!124714 m!1334651))

(assert (=> b!1446238 m!1334645))

(declare-fun m!1334653 () Bool)

(assert (=> b!1446238 m!1334653))

(declare-fun m!1334655 () Bool)

(assert (=> b!1446245 m!1334655))

(assert (=> b!1446245 m!1334655))

(declare-fun m!1334657 () Bool)

(assert (=> b!1446245 m!1334657))

(assert (=> b!1446245 m!1334645))

(declare-fun m!1334659 () Bool)

(assert (=> b!1446245 m!1334659))

(assert (=> b!1446246 m!1334633))

(assert (=> b!1446246 m!1334633))

(declare-fun m!1334661 () Bool)

(assert (=> b!1446246 m!1334661))

(declare-fun m!1334663 () Bool)

(assert (=> b!1446247 m!1334663))

(assert (=> b!1446241 m!1334633))

(assert (=> b!1446241 m!1334633))

(declare-fun m!1334665 () Bool)

(assert (=> b!1446241 m!1334665))

(declare-fun m!1334667 () Bool)

(assert (=> b!1446253 m!1334667))

(assert (=> b!1446255 m!1334633))

(assert (=> b!1446255 m!1334633))

(declare-fun m!1334669 () Bool)

(assert (=> b!1446255 m!1334669))

(declare-fun m!1334671 () Bool)

(assert (=> b!1446250 m!1334671))

(assert (=> b!1446250 m!1334645))

(declare-fun m!1334673 () Bool)

(assert (=> b!1446250 m!1334673))

(assert (=> b!1446250 m!1334647))

(assert (=> b!1446250 m!1334643))

(assert (=> b!1446250 m!1334633))

(declare-fun m!1334675 () Bool)

(assert (=> b!1446250 m!1334675))

(declare-fun m!1334677 () Bool)

(assert (=> b!1446250 m!1334677))

(assert (=> b!1446250 m!1334633))

(check-sat (not start!124714) (not b!1446251) (not b!1446250) (not b!1446245) (not b!1446243) (not b!1446255) (not b!1446253) (not b!1446241) (not b!1446246) (not b!1446247) (not b!1446240) (not b!1446249) (not b!1446248))
(check-sat)
