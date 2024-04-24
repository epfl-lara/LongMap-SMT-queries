; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126930 () Bool)

(assert start!126930)

(declare-fun b!1488338 () Bool)

(declare-fun e!834434 () Bool)

(declare-fun e!834426 () Bool)

(assert (=> b!1488338 (= e!834434 (not e!834426))))

(declare-fun res!1011586 () Bool)

(assert (=> b!1488338 (=> res!1011586 e!834426)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99667 0))(
  ( (array!99668 (arr!48103 (Array (_ BitVec 32) (_ BitVec 64))) (size!48654 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99667)

(assert (=> b!1488338 (= res!1011586 (or (and (= (select (arr!48103 a!2862) index!646) (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48103 a!2862) index!646) (select (arr!48103 a!2862) j!93))) (= (select (arr!48103 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!834431 () Bool)

(assert (=> b!1488338 e!834431))

(declare-fun res!1011589 () Bool)

(assert (=> b!1488338 (=> (not res!1011589) (not e!834431))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99667 (_ BitVec 32)) Bool)

(assert (=> b!1488338 (= res!1011589 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49853 0))(
  ( (Unit!49854) )
))
(declare-fun lt!649169 () Unit!49853)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49853)

(assert (=> b!1488338 (= lt!649169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488339 () Bool)

(declare-fun res!1011587 () Bool)

(declare-fun e!834429 () Bool)

(assert (=> b!1488339 (=> (not res!1011587) (not e!834429))))

(declare-datatypes ((List!34591 0))(
  ( (Nil!34588) (Cons!34587 (h!35978 (_ BitVec 64)) (t!49277 List!34591)) )
))
(declare-fun arrayNoDuplicates!0 (array!99667 (_ BitVec 32) List!34591) Bool)

(assert (=> b!1488339 (= res!1011587 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34588))))

(declare-fun b!1488340 () Bool)

(assert (=> b!1488340 (= e!834426 true)))

(declare-fun lt!649168 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488340 (= lt!649168 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!649173 () (_ BitVec 64))

(declare-fun e!834427 () Bool)

(declare-fun lt!649170 () array!99667)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1488342 () Bool)

(declare-datatypes ((SeekEntryResult!12240 0))(
  ( (MissingZero!12240 (index!51352 (_ BitVec 32))) (Found!12240 (index!51353 (_ BitVec 32))) (Intermediate!12240 (undefined!13052 Bool) (index!51354 (_ BitVec 32)) (x!133121 (_ BitVec 32))) (Undefined!12240) (MissingVacant!12240 (index!51355 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99667 (_ BitVec 32)) SeekEntryResult!12240)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99667 (_ BitVec 32)) SeekEntryResult!12240)

(assert (=> b!1488342 (= e!834427 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649173 lt!649170 mask!2687) (seekEntryOrOpen!0 lt!649173 lt!649170 mask!2687)))))

(declare-fun b!1488343 () Bool)

(declare-fun res!1011575 () Bool)

(assert (=> b!1488343 (=> (not res!1011575) (not e!834429))))

(assert (=> b!1488343 (= res!1011575 (and (= (size!48654 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48654 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48654 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488344 () Bool)

(declare-fun e!834428 () Bool)

(declare-fun e!834432 () Bool)

(assert (=> b!1488344 (= e!834428 e!834432)))

(declare-fun res!1011577 () Bool)

(assert (=> b!1488344 (=> (not res!1011577) (not e!834432))))

(declare-fun lt!649172 () SeekEntryResult!12240)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99667 (_ BitVec 32)) SeekEntryResult!12240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488344 (= res!1011577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48103 a!2862) j!93) mask!2687) (select (arr!48103 a!2862) j!93) a!2862 mask!2687) lt!649172))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488344 (= lt!649172 (Intermediate!12240 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488345 () Bool)

(declare-fun res!1011576 () Bool)

(assert (=> b!1488345 (=> (not res!1011576) (not e!834432))))

(assert (=> b!1488345 (= res!1011576 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48103 a!2862) j!93) a!2862 mask!2687) lt!649172))))

(declare-fun b!1488346 () Bool)

(declare-fun res!1011572 () Bool)

(assert (=> b!1488346 (=> (not res!1011572) (not e!834429))))

(assert (=> b!1488346 (= res!1011572 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48654 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48654 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48654 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488347 () Bool)

(declare-fun res!1011578 () Bool)

(assert (=> b!1488347 (=> (not res!1011578) (not e!834434))))

(assert (=> b!1488347 (= res!1011578 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488348 () Bool)

(declare-fun res!1011590 () Bool)

(assert (=> b!1488348 (=> (not res!1011590) (not e!834429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488348 (= res!1011590 (validKeyInArray!0 (select (arr!48103 a!2862) i!1006)))))

(declare-fun b!1488349 () Bool)

(declare-fun res!1011582 () Bool)

(assert (=> b!1488349 (=> (not res!1011582) (not e!834431))))

(assert (=> b!1488349 (= res!1011582 (or (= (select (arr!48103 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48103 a!2862) intermediateBeforeIndex!19) (select (arr!48103 a!2862) j!93))))))

(declare-fun b!1488350 () Bool)

(declare-fun lt!649171 () SeekEntryResult!12240)

(assert (=> b!1488350 (= e!834427 (= lt!649171 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649173 lt!649170 mask!2687)))))

(declare-fun b!1488341 () Bool)

(assert (=> b!1488341 (= e!834429 e!834428)))

(declare-fun res!1011573 () Bool)

(assert (=> b!1488341 (=> (not res!1011573) (not e!834428))))

(assert (=> b!1488341 (= res!1011573 (= (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488341 (= lt!649170 (array!99668 (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48654 a!2862)))))

(declare-fun res!1011574 () Bool)

(assert (=> start!126930 (=> (not res!1011574) (not e!834429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126930 (= res!1011574 (validMask!0 mask!2687))))

(assert (=> start!126930 e!834429))

(assert (=> start!126930 true))

(declare-fun array_inv!37384 (array!99667) Bool)

(assert (=> start!126930 (array_inv!37384 a!2862)))

(declare-fun e!834430 () Bool)

(declare-fun b!1488351 () Bool)

(assert (=> b!1488351 (= e!834430 (= (seekEntryOrOpen!0 lt!649173 lt!649170 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649173 lt!649170 mask!2687)))))

(declare-fun b!1488352 () Bool)

(declare-fun res!1011585 () Bool)

(assert (=> b!1488352 (=> (not res!1011585) (not e!834429))))

(assert (=> b!1488352 (= res!1011585 (validKeyInArray!0 (select (arr!48103 a!2862) j!93)))))

(declare-fun b!1488353 () Bool)

(assert (=> b!1488353 (= e!834432 e!834434)))

(declare-fun res!1011581 () Bool)

(assert (=> b!1488353 (=> (not res!1011581) (not e!834434))))

(assert (=> b!1488353 (= res!1011581 (= lt!649171 (Intermediate!12240 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488353 (= lt!649171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649173 mask!2687) lt!649173 lt!649170 mask!2687))))

(assert (=> b!1488353 (= lt!649173 (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488354 () Bool)

(declare-fun res!1011583 () Bool)

(assert (=> b!1488354 (=> (not res!1011583) (not e!834429))))

(assert (=> b!1488354 (= res!1011583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488355 () Bool)

(declare-fun res!1011584 () Bool)

(assert (=> b!1488355 (=> (not res!1011584) (not e!834431))))

(assert (=> b!1488355 (= res!1011584 (= (seekEntryOrOpen!0 (select (arr!48103 a!2862) j!93) a!2862 mask!2687) (Found!12240 j!93)))))

(declare-fun b!1488356 () Bool)

(declare-fun e!834433 () Bool)

(assert (=> b!1488356 (= e!834431 e!834433)))

(declare-fun res!1011580 () Bool)

(assert (=> b!1488356 (=> res!1011580 e!834433)))

(declare-fun lt!649174 () (_ BitVec 64))

(assert (=> b!1488356 (= res!1011580 (or (and (= (select (arr!48103 a!2862) index!646) lt!649174) (= (select (arr!48103 a!2862) index!646) (select (arr!48103 a!2862) j!93))) (= (select (arr!48103 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488356 (= lt!649174 (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1488357 () Bool)

(assert (=> b!1488357 (= e!834433 e!834430)))

(declare-fun res!1011579 () Bool)

(assert (=> b!1488357 (=> (not res!1011579) (not e!834430))))

(assert (=> b!1488357 (= res!1011579 (and (= index!646 intermediateAfterIndex!19) (= lt!649174 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488358 () Bool)

(declare-fun res!1011588 () Bool)

(assert (=> b!1488358 (=> (not res!1011588) (not e!834434))))

(assert (=> b!1488358 (= res!1011588 e!834427)))

(declare-fun c!137917 () Bool)

(assert (=> b!1488358 (= c!137917 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126930 res!1011574) b!1488343))

(assert (= (and b!1488343 res!1011575) b!1488348))

(assert (= (and b!1488348 res!1011590) b!1488352))

(assert (= (and b!1488352 res!1011585) b!1488354))

(assert (= (and b!1488354 res!1011583) b!1488339))

(assert (= (and b!1488339 res!1011587) b!1488346))

(assert (= (and b!1488346 res!1011572) b!1488341))

(assert (= (and b!1488341 res!1011573) b!1488344))

(assert (= (and b!1488344 res!1011577) b!1488345))

(assert (= (and b!1488345 res!1011576) b!1488353))

(assert (= (and b!1488353 res!1011581) b!1488358))

(assert (= (and b!1488358 c!137917) b!1488350))

(assert (= (and b!1488358 (not c!137917)) b!1488342))

(assert (= (and b!1488358 res!1011588) b!1488347))

(assert (= (and b!1488347 res!1011578) b!1488338))

(assert (= (and b!1488338 res!1011589) b!1488355))

(assert (= (and b!1488355 res!1011584) b!1488349))

(assert (= (and b!1488349 res!1011582) b!1488356))

(assert (= (and b!1488356 (not res!1011580)) b!1488357))

(assert (= (and b!1488357 res!1011579) b!1488351))

(assert (= (and b!1488338 (not res!1011586)) b!1488340))

(declare-fun m!1373167 () Bool)

(assert (=> b!1488353 m!1373167))

(assert (=> b!1488353 m!1373167))

(declare-fun m!1373169 () Bool)

(assert (=> b!1488353 m!1373169))

(declare-fun m!1373171 () Bool)

(assert (=> b!1488353 m!1373171))

(declare-fun m!1373173 () Bool)

(assert (=> b!1488353 m!1373173))

(assert (=> b!1488341 m!1373171))

(declare-fun m!1373175 () Bool)

(assert (=> b!1488341 m!1373175))

(declare-fun m!1373177 () Bool)

(assert (=> b!1488344 m!1373177))

(assert (=> b!1488344 m!1373177))

(declare-fun m!1373179 () Bool)

(assert (=> b!1488344 m!1373179))

(assert (=> b!1488344 m!1373179))

(assert (=> b!1488344 m!1373177))

(declare-fun m!1373181 () Bool)

(assert (=> b!1488344 m!1373181))

(declare-fun m!1373183 () Bool)

(assert (=> b!1488351 m!1373183))

(declare-fun m!1373185 () Bool)

(assert (=> b!1488351 m!1373185))

(declare-fun m!1373187 () Bool)

(assert (=> b!1488354 m!1373187))

(declare-fun m!1373189 () Bool)

(assert (=> b!1488349 m!1373189))

(assert (=> b!1488349 m!1373177))

(assert (=> b!1488345 m!1373177))

(assert (=> b!1488345 m!1373177))

(declare-fun m!1373191 () Bool)

(assert (=> b!1488345 m!1373191))

(declare-fun m!1373193 () Bool)

(assert (=> b!1488339 m!1373193))

(declare-fun m!1373195 () Bool)

(assert (=> b!1488340 m!1373195))

(declare-fun m!1373197 () Bool)

(assert (=> start!126930 m!1373197))

(declare-fun m!1373199 () Bool)

(assert (=> start!126930 m!1373199))

(declare-fun m!1373201 () Bool)

(assert (=> b!1488356 m!1373201))

(assert (=> b!1488356 m!1373177))

(assert (=> b!1488356 m!1373171))

(declare-fun m!1373203 () Bool)

(assert (=> b!1488356 m!1373203))

(assert (=> b!1488352 m!1373177))

(assert (=> b!1488352 m!1373177))

(declare-fun m!1373205 () Bool)

(assert (=> b!1488352 m!1373205))

(assert (=> b!1488342 m!1373185))

(assert (=> b!1488342 m!1373183))

(declare-fun m!1373207 () Bool)

(assert (=> b!1488338 m!1373207))

(assert (=> b!1488338 m!1373171))

(assert (=> b!1488338 m!1373203))

(assert (=> b!1488338 m!1373201))

(declare-fun m!1373209 () Bool)

(assert (=> b!1488338 m!1373209))

(assert (=> b!1488338 m!1373177))

(declare-fun m!1373211 () Bool)

(assert (=> b!1488348 m!1373211))

(assert (=> b!1488348 m!1373211))

(declare-fun m!1373213 () Bool)

(assert (=> b!1488348 m!1373213))

(assert (=> b!1488355 m!1373177))

(assert (=> b!1488355 m!1373177))

(declare-fun m!1373215 () Bool)

(assert (=> b!1488355 m!1373215))

(declare-fun m!1373217 () Bool)

(assert (=> b!1488350 m!1373217))

(check-sat (not b!1488348) (not start!126930) (not b!1488345) (not b!1488342) (not b!1488353) (not b!1488351) (not b!1488352) (not b!1488344) (not b!1488350) (not b!1488355) (not b!1488340) (not b!1488354) (not b!1488339) (not b!1488338))
(check-sat)
