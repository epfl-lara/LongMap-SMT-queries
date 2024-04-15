; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126956 () Bool)

(assert start!126956)

(declare-fun b!1492204 () Bool)

(declare-fun res!1015240 () Bool)

(declare-fun e!835958 () Bool)

(assert (=> b!1492204 (=> (not res!1015240) (not e!835958))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99664 0))(
  ( (array!99665 (arr!48103 (Array (_ BitVec 32) (_ BitVec 64))) (size!48655 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99664)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492204 (= res!1015240 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48655 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48655 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48655 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492205 () Bool)

(declare-fun res!1015246 () Bool)

(assert (=> b!1492205 (=> (not res!1015246) (not e!835958))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492205 (= res!1015246 (validKeyInArray!0 (select (arr!48103 a!2862) i!1006)))))

(declare-fun b!1492206 () Bool)

(declare-fun res!1015252 () Bool)

(declare-fun e!835963 () Bool)

(assert (=> b!1492206 (=> (not res!1015252) (not e!835963))))

(declare-datatypes ((SeekEntryResult!12368 0))(
  ( (MissingZero!12368 (index!51864 (_ BitVec 32))) (Found!12368 (index!51865 (_ BitVec 32))) (Intermediate!12368 (undefined!13180 Bool) (index!51866 (_ BitVec 32)) (x!133453 (_ BitVec 32))) (Undefined!12368) (MissingVacant!12368 (index!51867 (_ BitVec 32))) )
))
(declare-fun lt!650392 () SeekEntryResult!12368)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99664 (_ BitVec 32)) SeekEntryResult!12368)

(assert (=> b!1492206 (= res!1015252 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48103 a!2862) j!93) a!2862 mask!2687) lt!650392))))

(declare-fun b!1492207 () Bool)

(declare-fun e!835962 () Bool)

(assert (=> b!1492207 (= e!835958 e!835962)))

(declare-fun res!1015255 () Bool)

(assert (=> b!1492207 (=> (not res!1015255) (not e!835962))))

(assert (=> b!1492207 (= res!1015255 (= (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650391 () array!99664)

(assert (=> b!1492207 (= lt!650391 (array!99665 (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48655 a!2862)))))

(declare-fun b!1492208 () Bool)

(declare-fun res!1015247 () Bool)

(assert (=> b!1492208 (=> (not res!1015247) (not e!835958))))

(declare-datatypes ((List!34682 0))(
  ( (Nil!34679) (Cons!34678 (h!36064 (_ BitVec 64)) (t!49368 List!34682)) )
))
(declare-fun arrayNoDuplicates!0 (array!99664 (_ BitVec 32) List!34682) Bool)

(assert (=> b!1492208 (= res!1015247 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34679))))

(declare-fun b!1492209 () Bool)

(declare-fun e!835957 () Bool)

(assert (=> b!1492209 (= e!835963 e!835957)))

(declare-fun res!1015248 () Bool)

(assert (=> b!1492209 (=> (not res!1015248) (not e!835957))))

(declare-fun lt!650395 () SeekEntryResult!12368)

(assert (=> b!1492209 (= res!1015248 (= lt!650395 (Intermediate!12368 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650394 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492209 (= lt!650395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650394 mask!2687) lt!650394 lt!650391 mask!2687))))

(assert (=> b!1492209 (= lt!650394 (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1015245 () Bool)

(assert (=> start!126956 (=> (not res!1015245) (not e!835958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126956 (= res!1015245 (validMask!0 mask!2687))))

(assert (=> start!126956 e!835958))

(assert (=> start!126956 true))

(declare-fun array_inv!37336 (array!99664) Bool)

(assert (=> start!126956 (array_inv!37336 a!2862)))

(declare-fun b!1492210 () Bool)

(declare-fun e!835960 () Bool)

(assert (=> b!1492210 (= e!835957 (not e!835960))))

(declare-fun res!1015242 () Bool)

(assert (=> b!1492210 (=> res!1015242 e!835960)))

(assert (=> b!1492210 (= res!1015242 (or (and (= (select (arr!48103 a!2862) index!646) (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48103 a!2862) index!646) (select (arr!48103 a!2862) j!93))) (= (select (arr!48103 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835961 () Bool)

(assert (=> b!1492210 e!835961))

(declare-fun res!1015241 () Bool)

(assert (=> b!1492210 (=> (not res!1015241) (not e!835961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99664 (_ BitVec 32)) Bool)

(assert (=> b!1492210 (= res!1015241 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49917 0))(
  ( (Unit!49918) )
))
(declare-fun lt!650393 () Unit!49917)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49917)

(assert (=> b!1492210 (= lt!650393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492211 () Bool)

(declare-fun res!1015253 () Bool)

(assert (=> b!1492211 (=> (not res!1015253) (not e!835958))))

(assert (=> b!1492211 (= res!1015253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492212 () Bool)

(assert (=> b!1492212 (= e!835961 (or (= (select (arr!48103 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48103 a!2862) intermediateBeforeIndex!19) (select (arr!48103 a!2862) j!93))))))

(declare-fun b!1492213 () Bool)

(assert (=> b!1492213 (= e!835962 e!835963)))

(declare-fun res!1015244 () Bool)

(assert (=> b!1492213 (=> (not res!1015244) (not e!835963))))

(assert (=> b!1492213 (= res!1015244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48103 a!2862) j!93) mask!2687) (select (arr!48103 a!2862) j!93) a!2862 mask!2687) lt!650392))))

(assert (=> b!1492213 (= lt!650392 (Intermediate!12368 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492214 () Bool)

(declare-fun e!835959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99664 (_ BitVec 32)) SeekEntryResult!12368)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99664 (_ BitVec 32)) SeekEntryResult!12368)

(assert (=> b!1492214 (= e!835959 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650394 lt!650391 mask!2687) (seekEntryOrOpen!0 lt!650394 lt!650391 mask!2687)))))

(declare-fun b!1492215 () Bool)

(assert (=> b!1492215 (= e!835960 true)))

(declare-fun lt!650396 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492215 (= lt!650396 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492216 () Bool)

(assert (=> b!1492216 (= e!835959 (= lt!650395 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650394 lt!650391 mask!2687)))))

(declare-fun b!1492217 () Bool)

(declare-fun res!1015249 () Bool)

(assert (=> b!1492217 (=> (not res!1015249) (not e!835958))))

(assert (=> b!1492217 (= res!1015249 (and (= (size!48655 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48655 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48655 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492218 () Bool)

(declare-fun res!1015254 () Bool)

(assert (=> b!1492218 (=> (not res!1015254) (not e!835957))))

(assert (=> b!1492218 (= res!1015254 e!835959)))

(declare-fun c!138013 () Bool)

(assert (=> b!1492218 (= c!138013 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492219 () Bool)

(declare-fun res!1015251 () Bool)

(assert (=> b!1492219 (=> (not res!1015251) (not e!835957))))

(assert (=> b!1492219 (= res!1015251 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492220 () Bool)

(declare-fun res!1015243 () Bool)

(assert (=> b!1492220 (=> (not res!1015243) (not e!835961))))

(assert (=> b!1492220 (= res!1015243 (= (seekEntryOrOpen!0 (select (arr!48103 a!2862) j!93) a!2862 mask!2687) (Found!12368 j!93)))))

(declare-fun b!1492221 () Bool)

(declare-fun res!1015250 () Bool)

(assert (=> b!1492221 (=> (not res!1015250) (not e!835958))))

(assert (=> b!1492221 (= res!1015250 (validKeyInArray!0 (select (arr!48103 a!2862) j!93)))))

(assert (= (and start!126956 res!1015245) b!1492217))

(assert (= (and b!1492217 res!1015249) b!1492205))

(assert (= (and b!1492205 res!1015246) b!1492221))

(assert (= (and b!1492221 res!1015250) b!1492211))

(assert (= (and b!1492211 res!1015253) b!1492208))

(assert (= (and b!1492208 res!1015247) b!1492204))

(assert (= (and b!1492204 res!1015240) b!1492207))

(assert (= (and b!1492207 res!1015255) b!1492213))

(assert (= (and b!1492213 res!1015244) b!1492206))

(assert (= (and b!1492206 res!1015252) b!1492209))

(assert (= (and b!1492209 res!1015248) b!1492218))

(assert (= (and b!1492218 c!138013) b!1492216))

(assert (= (and b!1492218 (not c!138013)) b!1492214))

(assert (= (and b!1492218 res!1015254) b!1492219))

(assert (= (and b!1492219 res!1015251) b!1492210))

(assert (= (and b!1492210 res!1015241) b!1492220))

(assert (= (and b!1492220 res!1015243) b!1492212))

(assert (= (and b!1492210 (not res!1015242)) b!1492215))

(declare-fun m!1375617 () Bool)

(assert (=> b!1492216 m!1375617))

(declare-fun m!1375619 () Bool)

(assert (=> b!1492209 m!1375619))

(assert (=> b!1492209 m!1375619))

(declare-fun m!1375621 () Bool)

(assert (=> b!1492209 m!1375621))

(declare-fun m!1375623 () Bool)

(assert (=> b!1492209 m!1375623))

(declare-fun m!1375625 () Bool)

(assert (=> b!1492209 m!1375625))

(declare-fun m!1375627 () Bool)

(assert (=> b!1492208 m!1375627))

(declare-fun m!1375629 () Bool)

(assert (=> b!1492211 m!1375629))

(declare-fun m!1375631 () Bool)

(assert (=> b!1492206 m!1375631))

(assert (=> b!1492206 m!1375631))

(declare-fun m!1375633 () Bool)

(assert (=> b!1492206 m!1375633))

(declare-fun m!1375635 () Bool)

(assert (=> b!1492205 m!1375635))

(assert (=> b!1492205 m!1375635))

(declare-fun m!1375637 () Bool)

(assert (=> b!1492205 m!1375637))

(declare-fun m!1375639 () Bool)

(assert (=> b!1492210 m!1375639))

(assert (=> b!1492210 m!1375623))

(declare-fun m!1375641 () Bool)

(assert (=> b!1492210 m!1375641))

(declare-fun m!1375643 () Bool)

(assert (=> b!1492210 m!1375643))

(declare-fun m!1375645 () Bool)

(assert (=> b!1492210 m!1375645))

(assert (=> b!1492210 m!1375631))

(declare-fun m!1375647 () Bool)

(assert (=> start!126956 m!1375647))

(declare-fun m!1375649 () Bool)

(assert (=> start!126956 m!1375649))

(assert (=> b!1492213 m!1375631))

(assert (=> b!1492213 m!1375631))

(declare-fun m!1375651 () Bool)

(assert (=> b!1492213 m!1375651))

(assert (=> b!1492213 m!1375651))

(assert (=> b!1492213 m!1375631))

(declare-fun m!1375653 () Bool)

(assert (=> b!1492213 m!1375653))

(assert (=> b!1492207 m!1375623))

(declare-fun m!1375655 () Bool)

(assert (=> b!1492207 m!1375655))

(declare-fun m!1375657 () Bool)

(assert (=> b!1492214 m!1375657))

(declare-fun m!1375659 () Bool)

(assert (=> b!1492214 m!1375659))

(assert (=> b!1492221 m!1375631))

(assert (=> b!1492221 m!1375631))

(declare-fun m!1375661 () Bool)

(assert (=> b!1492221 m!1375661))

(declare-fun m!1375663 () Bool)

(assert (=> b!1492212 m!1375663))

(assert (=> b!1492212 m!1375631))

(declare-fun m!1375665 () Bool)

(assert (=> b!1492215 m!1375665))

(assert (=> b!1492220 m!1375631))

(assert (=> b!1492220 m!1375631))

(declare-fun m!1375667 () Bool)

(assert (=> b!1492220 m!1375667))

(check-sat (not b!1492221) (not b!1492220) (not b!1492213) (not start!126956) (not b!1492210) (not b!1492208) (not b!1492216) (not b!1492214) (not b!1492215) (not b!1492205) (not b!1492206) (not b!1492211) (not b!1492209))
(check-sat)
