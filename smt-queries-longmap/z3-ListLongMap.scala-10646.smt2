; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125016 () Bool)

(assert start!125016)

(declare-fun b!1454172 () Bool)

(declare-fun e!818403 () Bool)

(declare-fun e!818406 () Bool)

(assert (=> b!1454172 (= e!818403 e!818406)))

(declare-fun res!985072 () Bool)

(assert (=> b!1454172 (=> (not res!985072) (not e!818406))))

(declare-datatypes ((SeekEntryResult!11772 0))(
  ( (MissingZero!11772 (index!49480 (_ BitVec 32))) (Found!11772 (index!49481 (_ BitVec 32))) (Intermediate!11772 (undefined!12584 Bool) (index!49482 (_ BitVec 32)) (x!131117 (_ BitVec 32))) (Undefined!11772) (MissingVacant!11772 (index!49483 (_ BitVec 32))) )
))
(declare-fun lt!637492 () SeekEntryResult!11772)

(declare-datatypes ((array!98464 0))(
  ( (array!98465 (arr!47520 (Array (_ BitVec 32) (_ BitVec 64))) (size!48070 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98464)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98464 (_ BitVec 32)) SeekEntryResult!11772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454172 (= res!985072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47520 a!2862) j!93) mask!2687) (select (arr!47520 a!2862) j!93) a!2862 mask!2687) lt!637492))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454172 (= lt!637492 (Intermediate!11772 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454173 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637495 () (_ BitVec 32))

(declare-fun lt!637496 () array!98464)

(declare-fun e!818408 () Bool)

(declare-fun lt!637497 () SeekEntryResult!11772)

(declare-fun lt!637494 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98464 (_ BitVec 32)) SeekEntryResult!11772)

(assert (=> b!1454173 (= e!818408 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637495 intermediateAfterIndex!19 lt!637494 lt!637496 mask!2687) lt!637497)))))

(declare-fun b!1454174 () Bool)

(declare-fun res!985071 () Bool)

(declare-fun e!818404 () Bool)

(assert (=> b!1454174 (=> (not res!985071) (not e!818404))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1454174 (= res!985071 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48070 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48070 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48070 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454175 () Bool)

(declare-fun res!985074 () Bool)

(declare-fun e!818407 () Bool)

(assert (=> b!1454175 (=> (not res!985074) (not e!818407))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454175 (= res!985074 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454176 () Bool)

(declare-fun lt!637491 () SeekEntryResult!11772)

(assert (=> b!1454176 (= e!818408 (not (= lt!637491 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637495 lt!637494 lt!637496 mask!2687))))))

(declare-fun b!1454177 () Bool)

(declare-fun res!985080 () Bool)

(assert (=> b!1454177 (=> (not res!985080) (not e!818404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454177 (= res!985080 (validKeyInArray!0 (select (arr!47520 a!2862) i!1006)))))

(declare-fun b!1454178 () Bool)

(declare-fun res!985077 () Bool)

(assert (=> b!1454178 (=> (not res!985077) (not e!818407))))

(declare-fun e!818411 () Bool)

(assert (=> b!1454178 (= res!985077 e!818411)))

(declare-fun c!134064 () Bool)

(assert (=> b!1454178 (= c!134064 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454180 () Bool)

(declare-fun res!985068 () Bool)

(assert (=> b!1454180 (=> (not res!985068) (not e!818404))))

(assert (=> b!1454180 (= res!985068 (and (= (size!48070 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48070 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48070 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454181 () Bool)

(declare-fun res!985082 () Bool)

(declare-fun e!818402 () Bool)

(assert (=> b!1454181 (=> res!985082 e!818402)))

(assert (=> b!1454181 (= res!985082 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637495 (select (arr!47520 a!2862) j!93) a!2862 mask!2687) lt!637492)))))

(declare-fun b!1454182 () Bool)

(assert (=> b!1454182 (= e!818402 true)))

(declare-fun lt!637490 () Bool)

(assert (=> b!1454182 (= lt!637490 e!818408)))

(declare-fun c!134063 () Bool)

(assert (=> b!1454182 (= c!134063 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454183 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98464 (_ BitVec 32)) SeekEntryResult!11772)

(assert (=> b!1454183 (= e!818411 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637494 lt!637496 mask!2687) (seekEntryOrOpen!0 lt!637494 lt!637496 mask!2687)))))

(declare-fun b!1454184 () Bool)

(declare-fun e!818409 () Bool)

(assert (=> b!1454184 (= e!818407 (not e!818409))))

(declare-fun res!985075 () Bool)

(assert (=> b!1454184 (=> res!985075 e!818409)))

(assert (=> b!1454184 (= res!985075 (or (and (= (select (arr!47520 a!2862) index!646) (select (store (arr!47520 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47520 a!2862) index!646) (select (arr!47520 a!2862) j!93))) (= (select (arr!47520 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818410 () Bool)

(assert (=> b!1454184 e!818410))

(declare-fun res!985079 () Bool)

(assert (=> b!1454184 (=> (not res!985079) (not e!818410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98464 (_ BitVec 32)) Bool)

(assert (=> b!1454184 (= res!985079 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49040 0))(
  ( (Unit!49041) )
))
(declare-fun lt!637493 () Unit!49040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49040)

(assert (=> b!1454184 (= lt!637493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454185 () Bool)

(declare-fun res!985073 () Bool)

(assert (=> b!1454185 (=> (not res!985073) (not e!818404))))

(assert (=> b!1454185 (= res!985073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454186 () Bool)

(assert (=> b!1454186 (= e!818409 e!818402)))

(declare-fun res!985069 () Bool)

(assert (=> b!1454186 (=> res!985069 e!818402)))

(assert (=> b!1454186 (= res!985069 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637495 #b00000000000000000000000000000000) (bvsge lt!637495 (size!48070 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454186 (= lt!637495 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454186 (= lt!637497 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637494 lt!637496 mask!2687))))

(assert (=> b!1454186 (= lt!637497 (seekEntryOrOpen!0 lt!637494 lt!637496 mask!2687))))

(declare-fun b!1454187 () Bool)

(assert (=> b!1454187 (= e!818410 (and (or (= (select (arr!47520 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47520 a!2862) intermediateBeforeIndex!19) (select (arr!47520 a!2862) j!93))) (let ((bdg!53038 (select (store (arr!47520 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47520 a!2862) index!646) bdg!53038) (= (select (arr!47520 a!2862) index!646) (select (arr!47520 a!2862) j!93))) (= (select (arr!47520 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53038 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454188 () Bool)

(assert (=> b!1454188 (= e!818404 e!818403)))

(declare-fun res!985081 () Bool)

(assert (=> b!1454188 (=> (not res!985081) (not e!818403))))

(assert (=> b!1454188 (= res!985081 (= (select (store (arr!47520 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454188 (= lt!637496 (array!98465 (store (arr!47520 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48070 a!2862)))))

(declare-fun b!1454189 () Bool)

(assert (=> b!1454189 (= e!818411 (= lt!637491 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637494 lt!637496 mask!2687)))))

(declare-fun b!1454190 () Bool)

(declare-fun res!985083 () Bool)

(assert (=> b!1454190 (=> (not res!985083) (not e!818406))))

(assert (=> b!1454190 (= res!985083 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47520 a!2862) j!93) a!2862 mask!2687) lt!637492))))

(declare-fun res!985084 () Bool)

(assert (=> start!125016 (=> (not res!985084) (not e!818404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125016 (= res!985084 (validMask!0 mask!2687))))

(assert (=> start!125016 e!818404))

(assert (=> start!125016 true))

(declare-fun array_inv!36548 (array!98464) Bool)

(assert (=> start!125016 (array_inv!36548 a!2862)))

(declare-fun b!1454179 () Bool)

(declare-fun res!985078 () Bool)

(assert (=> b!1454179 (=> (not res!985078) (not e!818410))))

(assert (=> b!1454179 (= res!985078 (= (seekEntryOrOpen!0 (select (arr!47520 a!2862) j!93) a!2862 mask!2687) (Found!11772 j!93)))))

(declare-fun b!1454191 () Bool)

(declare-fun res!985070 () Bool)

(assert (=> b!1454191 (=> (not res!985070) (not e!818404))))

(assert (=> b!1454191 (= res!985070 (validKeyInArray!0 (select (arr!47520 a!2862) j!93)))))

(declare-fun b!1454192 () Bool)

(declare-fun res!985067 () Bool)

(assert (=> b!1454192 (=> (not res!985067) (not e!818404))))

(declare-datatypes ((List!34021 0))(
  ( (Nil!34018) (Cons!34017 (h!35367 (_ BitVec 64)) (t!48715 List!34021)) )
))
(declare-fun arrayNoDuplicates!0 (array!98464 (_ BitVec 32) List!34021) Bool)

(assert (=> b!1454192 (= res!985067 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34018))))

(declare-fun b!1454193 () Bool)

(assert (=> b!1454193 (= e!818406 e!818407)))

(declare-fun res!985076 () Bool)

(assert (=> b!1454193 (=> (not res!985076) (not e!818407))))

(assert (=> b!1454193 (= res!985076 (= lt!637491 (Intermediate!11772 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454193 (= lt!637491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637494 mask!2687) lt!637494 lt!637496 mask!2687))))

(assert (=> b!1454193 (= lt!637494 (select (store (arr!47520 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125016 res!985084) b!1454180))

(assert (= (and b!1454180 res!985068) b!1454177))

(assert (= (and b!1454177 res!985080) b!1454191))

(assert (= (and b!1454191 res!985070) b!1454185))

(assert (= (and b!1454185 res!985073) b!1454192))

(assert (= (and b!1454192 res!985067) b!1454174))

(assert (= (and b!1454174 res!985071) b!1454188))

(assert (= (and b!1454188 res!985081) b!1454172))

(assert (= (and b!1454172 res!985072) b!1454190))

(assert (= (and b!1454190 res!985083) b!1454193))

(assert (= (and b!1454193 res!985076) b!1454178))

(assert (= (and b!1454178 c!134064) b!1454189))

(assert (= (and b!1454178 (not c!134064)) b!1454183))

(assert (= (and b!1454178 res!985077) b!1454175))

(assert (= (and b!1454175 res!985074) b!1454184))

(assert (= (and b!1454184 res!985079) b!1454179))

(assert (= (and b!1454179 res!985078) b!1454187))

(assert (= (and b!1454184 (not res!985075)) b!1454186))

(assert (= (and b!1454186 (not res!985069)) b!1454181))

(assert (= (and b!1454181 (not res!985082)) b!1454182))

(assert (= (and b!1454182 c!134063) b!1454176))

(assert (= (and b!1454182 (not c!134063)) b!1454173))

(declare-fun m!1342547 () Bool)

(assert (=> b!1454185 m!1342547))

(declare-fun m!1342549 () Bool)

(assert (=> start!125016 m!1342549))

(declare-fun m!1342551 () Bool)

(assert (=> start!125016 m!1342551))

(declare-fun m!1342553 () Bool)

(assert (=> b!1454176 m!1342553))

(declare-fun m!1342555 () Bool)

(assert (=> b!1454192 m!1342555))

(declare-fun m!1342557 () Bool)

(assert (=> b!1454188 m!1342557))

(declare-fun m!1342559 () Bool)

(assert (=> b!1454188 m!1342559))

(declare-fun m!1342561 () Bool)

(assert (=> b!1454173 m!1342561))

(declare-fun m!1342563 () Bool)

(assert (=> b!1454179 m!1342563))

(assert (=> b!1454179 m!1342563))

(declare-fun m!1342565 () Bool)

(assert (=> b!1454179 m!1342565))

(declare-fun m!1342567 () Bool)

(assert (=> b!1454177 m!1342567))

(assert (=> b!1454177 m!1342567))

(declare-fun m!1342569 () Bool)

(assert (=> b!1454177 m!1342569))

(declare-fun m!1342571 () Bool)

(assert (=> b!1454193 m!1342571))

(assert (=> b!1454193 m!1342571))

(declare-fun m!1342573 () Bool)

(assert (=> b!1454193 m!1342573))

(assert (=> b!1454193 m!1342557))

(declare-fun m!1342575 () Bool)

(assert (=> b!1454193 m!1342575))

(declare-fun m!1342577 () Bool)

(assert (=> b!1454186 m!1342577))

(declare-fun m!1342579 () Bool)

(assert (=> b!1454186 m!1342579))

(declare-fun m!1342581 () Bool)

(assert (=> b!1454186 m!1342581))

(assert (=> b!1454190 m!1342563))

(assert (=> b!1454190 m!1342563))

(declare-fun m!1342583 () Bool)

(assert (=> b!1454190 m!1342583))

(assert (=> b!1454191 m!1342563))

(assert (=> b!1454191 m!1342563))

(declare-fun m!1342585 () Bool)

(assert (=> b!1454191 m!1342585))

(assert (=> b!1454187 m!1342557))

(declare-fun m!1342587 () Bool)

(assert (=> b!1454187 m!1342587))

(declare-fun m!1342589 () Bool)

(assert (=> b!1454187 m!1342589))

(declare-fun m!1342591 () Bool)

(assert (=> b!1454187 m!1342591))

(assert (=> b!1454187 m!1342563))

(declare-fun m!1342593 () Bool)

(assert (=> b!1454184 m!1342593))

(assert (=> b!1454184 m!1342557))

(assert (=> b!1454184 m!1342589))

(assert (=> b!1454184 m!1342591))

(declare-fun m!1342595 () Bool)

(assert (=> b!1454184 m!1342595))

(assert (=> b!1454184 m!1342563))

(assert (=> b!1454172 m!1342563))

(assert (=> b!1454172 m!1342563))

(declare-fun m!1342597 () Bool)

(assert (=> b!1454172 m!1342597))

(assert (=> b!1454172 m!1342597))

(assert (=> b!1454172 m!1342563))

(declare-fun m!1342599 () Bool)

(assert (=> b!1454172 m!1342599))

(declare-fun m!1342601 () Bool)

(assert (=> b!1454189 m!1342601))

(assert (=> b!1454183 m!1342579))

(assert (=> b!1454183 m!1342581))

(assert (=> b!1454181 m!1342563))

(assert (=> b!1454181 m!1342563))

(declare-fun m!1342603 () Bool)

(assert (=> b!1454181 m!1342603))

(check-sat (not b!1454179) (not b!1454181) (not b!1454184) (not b!1454186) (not start!125016) (not b!1454190) (not b!1454176) (not b!1454193) (not b!1454177) (not b!1454173) (not b!1454183) (not b!1454192) (not b!1454172) (not b!1454185) (not b!1454189) (not b!1454191))
(check-sat)
