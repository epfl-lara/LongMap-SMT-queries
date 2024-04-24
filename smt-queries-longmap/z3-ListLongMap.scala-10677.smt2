; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125418 () Bool)

(assert start!125418)

(declare-fun b!1461570 () Bool)

(declare-fun e!821932 () Bool)

(declare-fun e!821931 () Bool)

(assert (=> b!1461570 (= e!821932 e!821931)))

(declare-fun res!990544 () Bool)

(assert (=> b!1461570 (=> (not res!990544) (not e!821931))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98761 0))(
  ( (array!98762 (arr!47665 (Array (_ BitVec 32) (_ BitVec 64))) (size!48216 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98761)

(assert (=> b!1461570 (= res!990544 (= (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640246 () array!98761)

(assert (=> b!1461570 (= lt!640246 (array!98762 (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48216 a!2862)))))

(declare-fun b!1461571 () Bool)

(declare-fun res!990543 () Bool)

(assert (=> b!1461571 (=> (not res!990543) (not e!821932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461571 (= res!990543 (validKeyInArray!0 (select (arr!47665 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1461572 () Bool)

(declare-datatypes ((SeekEntryResult!11814 0))(
  ( (MissingZero!11814 (index!49648 (_ BitVec 32))) (Found!11814 (index!49649 (_ BitVec 32))) (Intermediate!11814 (undefined!12626 Bool) (index!49650 (_ BitVec 32)) (x!131431 (_ BitVec 32))) (Undefined!11814) (MissingVacant!11814 (index!49651 (_ BitVec 32))) )
))
(declare-fun lt!640242 () SeekEntryResult!11814)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!821936 () Bool)

(declare-fun lt!640244 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98761 (_ BitVec 32)) SeekEntryResult!11814)

(assert (=> b!1461572 (= e!821936 (= lt!640242 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640244 lt!640246 mask!2687)))))

(declare-fun b!1461573 () Bool)

(declare-fun res!990553 () Bool)

(assert (=> b!1461573 (=> (not res!990553) (not e!821932))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461573 (= res!990553 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48216 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48216 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48216 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461574 () Bool)

(declare-fun e!821935 () Bool)

(declare-fun e!821933 () Bool)

(assert (=> b!1461574 (= e!821935 e!821933)))

(declare-fun res!990540 () Bool)

(assert (=> b!1461574 (=> (not res!990540) (not e!821933))))

(assert (=> b!1461574 (= res!990540 (= lt!640242 (Intermediate!11814 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461574 (= lt!640242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640244 mask!2687) lt!640244 lt!640246 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461574 (= lt!640244 (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98761 (_ BitVec 32)) SeekEntryResult!11814)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98761 (_ BitVec 32)) SeekEntryResult!11814)

(assert (=> b!1461575 (= e!821936 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640244 lt!640246 mask!2687) (seekEntryOrOpen!0 lt!640244 lt!640246 mask!2687)))))

(declare-fun b!1461576 () Bool)

(declare-fun res!990546 () Bool)

(assert (=> b!1461576 (=> (not res!990546) (not e!821932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98761 (_ BitVec 32)) Bool)

(assert (=> b!1461576 (= res!990546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461577 () Bool)

(declare-fun res!990548 () Bool)

(assert (=> b!1461577 (=> (not res!990548) (not e!821933))))

(assert (=> b!1461577 (= res!990548 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461578 () Bool)

(assert (=> b!1461578 (= e!821931 e!821935)))

(declare-fun res!990551 () Bool)

(assert (=> b!1461578 (=> (not res!990551) (not e!821935))))

(declare-fun lt!640245 () SeekEntryResult!11814)

(assert (=> b!1461578 (= res!990551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47665 a!2862) j!93) mask!2687) (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!640245))))

(assert (=> b!1461578 (= lt!640245 (Intermediate!11814 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!821934 () Bool)

(declare-fun b!1461579 () Bool)

(assert (=> b!1461579 (= e!821934 (or (= (select (arr!47665 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47665 a!2862) intermediateBeforeIndex!19) (select (arr!47665 a!2862) j!93))))))

(declare-fun b!1461580 () Bool)

(declare-fun res!990550 () Bool)

(assert (=> b!1461580 (=> (not res!990550) (not e!821933))))

(assert (=> b!1461580 (= res!990550 e!821936)))

(declare-fun c!135034 () Bool)

(assert (=> b!1461580 (= c!135034 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461581 () Bool)

(declare-fun res!990541 () Bool)

(assert (=> b!1461581 (=> (not res!990541) (not e!821934))))

(assert (=> b!1461581 (= res!990541 (= (seekEntryOrOpen!0 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) (Found!11814 j!93)))))

(declare-fun b!1461582 () Bool)

(declare-fun res!990545 () Bool)

(assert (=> b!1461582 (=> (not res!990545) (not e!821932))))

(assert (=> b!1461582 (= res!990545 (validKeyInArray!0 (select (arr!47665 a!2862) j!93)))))

(declare-fun b!1461583 () Bool)

(declare-fun res!990547 () Bool)

(assert (=> b!1461583 (=> (not res!990547) (not e!821932))))

(declare-datatypes ((List!34153 0))(
  ( (Nil!34150) (Cons!34149 (h!35510 (_ BitVec 64)) (t!48839 List!34153)) )
))
(declare-fun arrayNoDuplicates!0 (array!98761 (_ BitVec 32) List!34153) Bool)

(assert (=> b!1461583 (= res!990547 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34150))))

(declare-fun b!1461584 () Bool)

(declare-fun res!990542 () Bool)

(assert (=> b!1461584 (=> (not res!990542) (not e!821932))))

(assert (=> b!1461584 (= res!990542 (and (= (size!48216 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48216 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48216 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461585 () Bool)

(declare-fun res!990552 () Bool)

(assert (=> b!1461585 (=> (not res!990552) (not e!821935))))

(assert (=> b!1461585 (= res!990552 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!640245))))

(declare-fun b!1461586 () Bool)

(assert (=> b!1461586 (= e!821933 (not true))))

(assert (=> b!1461586 e!821934))

(declare-fun res!990554 () Bool)

(assert (=> b!1461586 (=> (not res!990554) (not e!821934))))

(assert (=> b!1461586 (= res!990554 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49157 0))(
  ( (Unit!49158) )
))
(declare-fun lt!640243 () Unit!49157)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49157)

(assert (=> b!1461586 (= lt!640243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!990549 () Bool)

(assert (=> start!125418 (=> (not res!990549) (not e!821932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125418 (= res!990549 (validMask!0 mask!2687))))

(assert (=> start!125418 e!821932))

(assert (=> start!125418 true))

(declare-fun array_inv!36946 (array!98761) Bool)

(assert (=> start!125418 (array_inv!36946 a!2862)))

(assert (= (and start!125418 res!990549) b!1461584))

(assert (= (and b!1461584 res!990542) b!1461571))

(assert (= (and b!1461571 res!990543) b!1461582))

(assert (= (and b!1461582 res!990545) b!1461576))

(assert (= (and b!1461576 res!990546) b!1461583))

(assert (= (and b!1461583 res!990547) b!1461573))

(assert (= (and b!1461573 res!990553) b!1461570))

(assert (= (and b!1461570 res!990544) b!1461578))

(assert (= (and b!1461578 res!990551) b!1461585))

(assert (= (and b!1461585 res!990552) b!1461574))

(assert (= (and b!1461574 res!990540) b!1461580))

(assert (= (and b!1461580 c!135034) b!1461572))

(assert (= (and b!1461580 (not c!135034)) b!1461575))

(assert (= (and b!1461580 res!990550) b!1461577))

(assert (= (and b!1461577 res!990548) b!1461586))

(assert (= (and b!1461586 res!990554) b!1461581))

(assert (= (and b!1461581 res!990541) b!1461579))

(declare-fun m!1349377 () Bool)

(assert (=> b!1461570 m!1349377))

(declare-fun m!1349379 () Bool)

(assert (=> b!1461570 m!1349379))

(declare-fun m!1349381 () Bool)

(assert (=> start!125418 m!1349381))

(declare-fun m!1349383 () Bool)

(assert (=> start!125418 m!1349383))

(declare-fun m!1349385 () Bool)

(assert (=> b!1461585 m!1349385))

(assert (=> b!1461585 m!1349385))

(declare-fun m!1349387 () Bool)

(assert (=> b!1461585 m!1349387))

(declare-fun m!1349389 () Bool)

(assert (=> b!1461575 m!1349389))

(declare-fun m!1349391 () Bool)

(assert (=> b!1461575 m!1349391))

(declare-fun m!1349393 () Bool)

(assert (=> b!1461576 m!1349393))

(declare-fun m!1349395 () Bool)

(assert (=> b!1461579 m!1349395))

(assert (=> b!1461579 m!1349385))

(declare-fun m!1349397 () Bool)

(assert (=> b!1461571 m!1349397))

(assert (=> b!1461571 m!1349397))

(declare-fun m!1349399 () Bool)

(assert (=> b!1461571 m!1349399))

(declare-fun m!1349401 () Bool)

(assert (=> b!1461586 m!1349401))

(declare-fun m!1349403 () Bool)

(assert (=> b!1461586 m!1349403))

(declare-fun m!1349405 () Bool)

(assert (=> b!1461574 m!1349405))

(assert (=> b!1461574 m!1349405))

(declare-fun m!1349407 () Bool)

(assert (=> b!1461574 m!1349407))

(assert (=> b!1461574 m!1349377))

(declare-fun m!1349409 () Bool)

(assert (=> b!1461574 m!1349409))

(declare-fun m!1349411 () Bool)

(assert (=> b!1461583 m!1349411))

(assert (=> b!1461582 m!1349385))

(assert (=> b!1461582 m!1349385))

(declare-fun m!1349413 () Bool)

(assert (=> b!1461582 m!1349413))

(assert (=> b!1461578 m!1349385))

(assert (=> b!1461578 m!1349385))

(declare-fun m!1349415 () Bool)

(assert (=> b!1461578 m!1349415))

(assert (=> b!1461578 m!1349415))

(assert (=> b!1461578 m!1349385))

(declare-fun m!1349417 () Bool)

(assert (=> b!1461578 m!1349417))

(declare-fun m!1349419 () Bool)

(assert (=> b!1461572 m!1349419))

(assert (=> b!1461581 m!1349385))

(assert (=> b!1461581 m!1349385))

(declare-fun m!1349421 () Bool)

(assert (=> b!1461581 m!1349421))

(check-sat (not start!125418) (not b!1461585) (not b!1461578) (not b!1461575) (not b!1461571) (not b!1461574) (not b!1461576) (not b!1461582) (not b!1461586) (not b!1461572) (not b!1461581) (not b!1461583))
(check-sat)
