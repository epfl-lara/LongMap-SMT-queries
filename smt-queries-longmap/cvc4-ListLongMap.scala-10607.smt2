; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124784 () Bool)

(assert start!124784)

(declare-fun res!979216 () Bool)

(declare-fun e!815264 () Bool)

(assert (=> start!124784 (=> (not res!979216) (not e!815264))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124784 (= res!979216 (validMask!0 mask!2687))))

(assert (=> start!124784 e!815264))

(assert (=> start!124784 true))

(declare-datatypes ((array!98232 0))(
  ( (array!98233 (arr!47404 (Array (_ BitVec 32) (_ BitVec 64))) (size!47954 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98232)

(declare-fun array_inv!36432 (array!98232) Bool)

(assert (=> start!124784 (array_inv!36432 a!2862)))

(declare-fun b!1447572 () Bool)

(declare-fun res!979220 () Bool)

(assert (=> b!1447572 (=> (not res!979220) (not e!815264))))

(declare-datatypes ((List!33905 0))(
  ( (Nil!33902) (Cons!33901 (h!35251 (_ BitVec 64)) (t!48599 List!33905)) )
))
(declare-fun arrayNoDuplicates!0 (array!98232 (_ BitVec 32) List!33905) Bool)

(assert (=> b!1447572 (= res!979220 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33902))))

(declare-fun b!1447573 () Bool)

(declare-fun e!815257 () Bool)

(declare-fun e!815260 () Bool)

(assert (=> b!1447573 (= e!815257 e!815260)))

(declare-fun res!979224 () Bool)

(assert (=> b!1447573 (=> (not res!979224) (not e!815260))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11656 0))(
  ( (MissingZero!11656 (index!49016 (_ BitVec 32))) (Found!11656 (index!49017 (_ BitVec 32))) (Intermediate!11656 (undefined!12468 Bool) (index!49018 (_ BitVec 32)) (x!130689 (_ BitVec 32))) (Undefined!11656) (MissingVacant!11656 (index!49019 (_ BitVec 32))) )
))
(declare-fun lt!635211 () SeekEntryResult!11656)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447573 (= res!979224 (= lt!635211 (Intermediate!11656 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635213 () array!98232)

(declare-fun lt!635212 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98232 (_ BitVec 32)) SeekEntryResult!11656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447573 (= lt!635211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635212 mask!2687) lt!635212 lt!635213 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447573 (= lt!635212 (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447574 () Bool)

(declare-fun res!979218 () Bool)

(assert (=> b!1447574 (=> (not res!979218) (not e!815260))))

(declare-fun e!815255 () Bool)

(assert (=> b!1447574 (= res!979218 e!815255)))

(declare-fun c!133692 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1447574 (= c!133692 (bvsle x!665 intermediateAfterX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1447575 () Bool)

(assert (=> b!1447575 (= e!815255 (= lt!635211 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635212 lt!635213 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1447576 () Bool)

(declare-fun e!815256 () Bool)

(assert (=> b!1447576 (= e!815256 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447577 () Bool)

(declare-fun res!979214 () Bool)

(assert (=> b!1447577 (=> (not res!979214) (not e!815264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98232 (_ BitVec 32)) Bool)

(assert (=> b!1447577 (= res!979214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447578 () Bool)

(declare-fun res!979209 () Bool)

(assert (=> b!1447578 (=> (not res!979209) (not e!815264))))

(assert (=> b!1447578 (= res!979209 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47954 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47954 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47954 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447579 () Bool)

(declare-fun e!815263 () Bool)

(declare-fun e!815261 () Bool)

(assert (=> b!1447579 (= e!815263 e!815261)))

(declare-fun res!979222 () Bool)

(assert (=> b!1447579 (=> res!979222 e!815261)))

(assert (=> b!1447579 (= res!979222 (or (and (= (select (arr!47404 a!2862) index!646) (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47404 a!2862) index!646) (select (arr!47404 a!2862) j!93))) (not (= (select (arr!47404 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447580 () Bool)

(declare-fun res!979210 () Bool)

(assert (=> b!1447580 (=> (not res!979210) (not e!815264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447580 (= res!979210 (validKeyInArray!0 (select (arr!47404 a!2862) j!93)))))

(declare-fun b!1447581 () Bool)

(declare-fun e!815259 () Bool)

(assert (=> b!1447581 (= e!815259 true)))

(declare-fun lt!635216 () SeekEntryResult!11656)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98232 (_ BitVec 32)) SeekEntryResult!11656)

(assert (=> b!1447581 (= lt!635216 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47404 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447582 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98232 (_ BitVec 32)) SeekEntryResult!11656)

(assert (=> b!1447582 (= e!815255 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635212 lt!635213 mask!2687) (seekEntryOrOpen!0 lt!635212 lt!635213 mask!2687)))))

(declare-fun b!1447583 () Bool)

(assert (=> b!1447583 (= e!815261 e!815256)))

(declare-fun res!979211 () Bool)

(assert (=> b!1447583 (=> (not res!979211) (not e!815256))))

(declare-fun lt!635217 () SeekEntryResult!11656)

(assert (=> b!1447583 (= res!979211 (= lt!635217 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47404 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447584 () Bool)

(declare-fun res!979217 () Bool)

(assert (=> b!1447584 (=> (not res!979217) (not e!815257))))

(declare-fun lt!635214 () SeekEntryResult!11656)

(assert (=> b!1447584 (= res!979217 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47404 a!2862) j!93) a!2862 mask!2687) lt!635214))))

(declare-fun b!1447585 () Bool)

(declare-fun res!979219 () Bool)

(assert (=> b!1447585 (=> (not res!979219) (not e!815264))))

(assert (=> b!1447585 (= res!979219 (validKeyInArray!0 (select (arr!47404 a!2862) i!1006)))))

(declare-fun b!1447586 () Bool)

(declare-fun res!979221 () Bool)

(assert (=> b!1447586 (=> (not res!979221) (not e!815260))))

(assert (=> b!1447586 (= res!979221 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447587 () Bool)

(declare-fun e!815262 () Bool)

(assert (=> b!1447587 (= e!815262 e!815257)))

(declare-fun res!979213 () Bool)

(assert (=> b!1447587 (=> (not res!979213) (not e!815257))))

(assert (=> b!1447587 (= res!979213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47404 a!2862) j!93) mask!2687) (select (arr!47404 a!2862) j!93) a!2862 mask!2687) lt!635214))))

(assert (=> b!1447587 (= lt!635214 (Intermediate!11656 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447588 () Bool)

(assert (=> b!1447588 (= e!815260 (not e!815259))))

(declare-fun res!979225 () Bool)

(assert (=> b!1447588 (=> res!979225 e!815259)))

(assert (=> b!1447588 (= res!979225 (or (and (= (select (arr!47404 a!2862) index!646) (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47404 a!2862) index!646) (select (arr!47404 a!2862) j!93))) (not (= (select (arr!47404 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447588 e!815263))

(declare-fun res!979223 () Bool)

(assert (=> b!1447588 (=> (not res!979223) (not e!815263))))

(assert (=> b!1447588 (= res!979223 (and (= lt!635217 (Found!11656 j!93)) (or (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) (select (arr!47404 a!2862) j!93)))))))

(assert (=> b!1447588 (= lt!635217 (seekEntryOrOpen!0 (select (arr!47404 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447588 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48808 0))(
  ( (Unit!48809) )
))
(declare-fun lt!635215 () Unit!48808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48808)

(assert (=> b!1447588 (= lt!635215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447589 () Bool)

(assert (=> b!1447589 (= e!815264 e!815262)))

(declare-fun res!979215 () Bool)

(assert (=> b!1447589 (=> (not res!979215) (not e!815262))))

(assert (=> b!1447589 (= res!979215 (= (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447589 (= lt!635213 (array!98233 (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47954 a!2862)))))

(declare-fun b!1447590 () Bool)

(declare-fun res!979212 () Bool)

(assert (=> b!1447590 (=> (not res!979212) (not e!815264))))

(assert (=> b!1447590 (= res!979212 (and (= (size!47954 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47954 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47954 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124784 res!979216) b!1447590))

(assert (= (and b!1447590 res!979212) b!1447585))

(assert (= (and b!1447585 res!979219) b!1447580))

(assert (= (and b!1447580 res!979210) b!1447577))

(assert (= (and b!1447577 res!979214) b!1447572))

(assert (= (and b!1447572 res!979220) b!1447578))

(assert (= (and b!1447578 res!979209) b!1447589))

(assert (= (and b!1447589 res!979215) b!1447587))

(assert (= (and b!1447587 res!979213) b!1447584))

(assert (= (and b!1447584 res!979217) b!1447573))

(assert (= (and b!1447573 res!979224) b!1447574))

(assert (= (and b!1447574 c!133692) b!1447575))

(assert (= (and b!1447574 (not c!133692)) b!1447582))

(assert (= (and b!1447574 res!979218) b!1447586))

(assert (= (and b!1447586 res!979221) b!1447588))

(assert (= (and b!1447588 res!979223) b!1447579))

(assert (= (and b!1447579 (not res!979222)) b!1447583))

(assert (= (and b!1447583 res!979211) b!1447576))

(assert (= (and b!1447588 (not res!979225)) b!1447581))

(declare-fun m!1336381 () Bool)

(assert (=> b!1447588 m!1336381))

(declare-fun m!1336383 () Bool)

(assert (=> b!1447588 m!1336383))

(declare-fun m!1336385 () Bool)

(assert (=> b!1447588 m!1336385))

(declare-fun m!1336387 () Bool)

(assert (=> b!1447588 m!1336387))

(declare-fun m!1336389 () Bool)

(assert (=> b!1447588 m!1336389))

(declare-fun m!1336391 () Bool)

(assert (=> b!1447588 m!1336391))

(declare-fun m!1336393 () Bool)

(assert (=> b!1447588 m!1336393))

(declare-fun m!1336395 () Bool)

(assert (=> b!1447588 m!1336395))

(assert (=> b!1447588 m!1336391))

(declare-fun m!1336397 () Bool)

(assert (=> b!1447582 m!1336397))

(declare-fun m!1336399 () Bool)

(assert (=> b!1447582 m!1336399))

(assert (=> b!1447584 m!1336391))

(assert (=> b!1447584 m!1336391))

(declare-fun m!1336401 () Bool)

(assert (=> b!1447584 m!1336401))

(assert (=> b!1447587 m!1336391))

(assert (=> b!1447587 m!1336391))

(declare-fun m!1336403 () Bool)

(assert (=> b!1447587 m!1336403))

(assert (=> b!1447587 m!1336403))

(assert (=> b!1447587 m!1336391))

(declare-fun m!1336405 () Bool)

(assert (=> b!1447587 m!1336405))

(assert (=> b!1447579 m!1336389))

(assert (=> b!1447579 m!1336383))

(assert (=> b!1447579 m!1336387))

(assert (=> b!1447579 m!1336391))

(assert (=> b!1447580 m!1336391))

(assert (=> b!1447580 m!1336391))

(declare-fun m!1336407 () Bool)

(assert (=> b!1447580 m!1336407))

(assert (=> b!1447583 m!1336391))

(assert (=> b!1447583 m!1336391))

(declare-fun m!1336409 () Bool)

(assert (=> b!1447583 m!1336409))

(declare-fun m!1336411 () Bool)

(assert (=> b!1447575 m!1336411))

(declare-fun m!1336413 () Bool)

(assert (=> start!124784 m!1336413))

(declare-fun m!1336415 () Bool)

(assert (=> start!124784 m!1336415))

(declare-fun m!1336417 () Bool)

(assert (=> b!1447585 m!1336417))

(assert (=> b!1447585 m!1336417))

(declare-fun m!1336419 () Bool)

(assert (=> b!1447585 m!1336419))

(declare-fun m!1336421 () Bool)

(assert (=> b!1447573 m!1336421))

(assert (=> b!1447573 m!1336421))

(declare-fun m!1336423 () Bool)

(assert (=> b!1447573 m!1336423))

(assert (=> b!1447573 m!1336383))

(declare-fun m!1336425 () Bool)

(assert (=> b!1447573 m!1336425))

(assert (=> b!1447589 m!1336383))

(declare-fun m!1336427 () Bool)

(assert (=> b!1447589 m!1336427))

(declare-fun m!1336429 () Bool)

(assert (=> b!1447577 m!1336429))

(declare-fun m!1336431 () Bool)

(assert (=> b!1447572 m!1336431))

(assert (=> b!1447581 m!1336391))

(assert (=> b!1447581 m!1336391))

(declare-fun m!1336433 () Bool)

(assert (=> b!1447581 m!1336433))

(push 1)

