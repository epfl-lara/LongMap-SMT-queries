; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125080 () Bool)

(assert start!125080)

(declare-fun b!1456284 () Bool)

(declare-fun e!819368 () Bool)

(declare-fun e!819369 () Bool)

(assert (=> b!1456284 (= e!819368 e!819369)))

(declare-fun res!986801 () Bool)

(assert (=> b!1456284 (=> (not res!986801) (not e!819369))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98528 0))(
  ( (array!98529 (arr!47552 (Array (_ BitVec 32) (_ BitVec 64))) (size!48102 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98528)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1456284 (= res!986801 (= (select (store (arr!47552 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638258 () array!98528)

(assert (=> b!1456284 (= lt!638258 (array!98529 (store (arr!47552 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48102 a!2862)))))

(declare-fun b!1456285 () Bool)

(declare-fun e!819371 () Bool)

(declare-fun e!819364 () Bool)

(assert (=> b!1456285 (= e!819371 e!819364)))

(declare-fun res!986804 () Bool)

(assert (=> b!1456285 (=> res!986804 e!819364)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638261 () (_ BitVec 32))

(assert (=> b!1456285 (= res!986804 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638261 #b00000000000000000000000000000000) (bvsge lt!638261 (size!48102 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456285 (= lt!638261 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-datatypes ((SeekEntryResult!11804 0))(
  ( (MissingZero!11804 (index!49608 (_ BitVec 32))) (Found!11804 (index!49609 (_ BitVec 32))) (Intermediate!11804 (undefined!12616 Bool) (index!49610 (_ BitVec 32)) (x!131237 (_ BitVec 32))) (Undefined!11804) (MissingVacant!11804 (index!49611 (_ BitVec 32))) )
))
(declare-fun lt!638262 () SeekEntryResult!11804)

(declare-fun lt!638260 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98528 (_ BitVec 32)) SeekEntryResult!11804)

(assert (=> b!1456285 (= lt!638262 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638260 lt!638258 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98528 (_ BitVec 32)) SeekEntryResult!11804)

(assert (=> b!1456285 (= lt!638262 (seekEntryOrOpen!0 lt!638260 lt!638258 mask!2687))))

(declare-fun b!1456286 () Bool)

(declare-fun res!986803 () Bool)

(assert (=> b!1456286 (=> (not res!986803) (not e!819368))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1456286 (= res!986803 (and (= (size!48102 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48102 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48102 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456287 () Bool)

(assert (=> b!1456287 (= e!819364 true)))

(declare-fun lt!638263 () Bool)

(declare-fun e!819363 () Bool)

(assert (=> b!1456287 (= lt!638263 e!819363)))

(declare-fun c!134255 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456287 (= c!134255 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!986796 () Bool)

(assert (=> start!125080 (=> (not res!986796) (not e!819368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125080 (= res!986796 (validMask!0 mask!2687))))

(assert (=> start!125080 e!819368))

(assert (=> start!125080 true))

(declare-fun array_inv!36580 (array!98528) Bool)

(assert (=> start!125080 (array_inv!36580 a!2862)))

(declare-fun b!1456288 () Bool)

(declare-fun e!819370 () Bool)

(declare-fun e!819366 () Bool)

(assert (=> b!1456288 (= e!819370 e!819366)))

(declare-fun res!986805 () Bool)

(assert (=> b!1456288 (=> (not res!986805) (not e!819366))))

(declare-fun lt!638264 () SeekEntryResult!11804)

(assert (=> b!1456288 (= res!986805 (= lt!638264 (Intermediate!11804 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98528 (_ BitVec 32)) SeekEntryResult!11804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456288 (= lt!638264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638260 mask!2687) lt!638260 lt!638258 mask!2687))))

(assert (=> b!1456288 (= lt!638260 (select (store (arr!47552 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456289 () Bool)

(declare-fun res!986806 () Bool)

(assert (=> b!1456289 (=> (not res!986806) (not e!819368))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456289 (= res!986806 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48102 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48102 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48102 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456290 () Bool)

(declare-fun res!986810 () Bool)

(assert (=> b!1456290 (=> (not res!986810) (not e!819366))))

(assert (=> b!1456290 (= res!986810 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456291 () Bool)

(declare-fun res!986812 () Bool)

(assert (=> b!1456291 (=> (not res!986812) (not e!819368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456291 (= res!986812 (validKeyInArray!0 (select (arr!47552 a!2862) i!1006)))))

(declare-fun b!1456292 () Bool)

(declare-fun e!819367 () Bool)

(assert (=> b!1456292 (= e!819367 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638260 lt!638258 mask!2687) (seekEntryOrOpen!0 lt!638260 lt!638258 mask!2687)))))

(declare-fun b!1456293 () Bool)

(declare-fun res!986807 () Bool)

(declare-fun e!819365 () Bool)

(assert (=> b!1456293 (=> (not res!986807) (not e!819365))))

(assert (=> b!1456293 (= res!986807 (= (seekEntryOrOpen!0 (select (arr!47552 a!2862) j!93) a!2862 mask!2687) (Found!11804 j!93)))))

(declare-fun b!1456294 () Bool)

(assert (=> b!1456294 (= e!819363 (not (= lt!638264 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638261 lt!638260 lt!638258 mask!2687))))))

(declare-fun b!1456295 () Bool)

(declare-fun res!986798 () Bool)

(assert (=> b!1456295 (=> (not res!986798) (not e!819368))))

(declare-datatypes ((List!34053 0))(
  ( (Nil!34050) (Cons!34049 (h!35399 (_ BitVec 64)) (t!48747 List!34053)) )
))
(declare-fun arrayNoDuplicates!0 (array!98528 (_ BitVec 32) List!34053) Bool)

(assert (=> b!1456295 (= res!986798 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34050))))

(declare-fun b!1456296 () Bool)

(assert (=> b!1456296 (= e!819367 (= lt!638264 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638260 lt!638258 mask!2687)))))

(declare-fun b!1456297 () Bool)

(assert (=> b!1456297 (= e!819365 (and (or (= (select (arr!47552 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47552 a!2862) intermediateBeforeIndex!19) (select (arr!47552 a!2862) j!93))) (let ((bdg!53233 (select (store (arr!47552 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47552 a!2862) index!646) bdg!53233) (= (select (arr!47552 a!2862) index!646) (select (arr!47552 a!2862) j!93))) (= (select (arr!47552 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53233 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456298 () Bool)

(declare-fun res!986800 () Bool)

(assert (=> b!1456298 (=> (not res!986800) (not e!819368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98528 (_ BitVec 32)) Bool)

(assert (=> b!1456298 (= res!986800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456299 () Bool)

(assert (=> b!1456299 (= e!819363 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638261 intermediateAfterIndex!19 lt!638260 lt!638258 mask!2687) lt!638262)))))

(declare-fun b!1456300 () Bool)

(declare-fun res!986808 () Bool)

(assert (=> b!1456300 (=> res!986808 e!819364)))

(declare-fun lt!638265 () SeekEntryResult!11804)

(assert (=> b!1456300 (= res!986808 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638261 (select (arr!47552 a!2862) j!93) a!2862 mask!2687) lt!638265)))))

(declare-fun b!1456301 () Bool)

(assert (=> b!1456301 (= e!819369 e!819370)))

(declare-fun res!986802 () Bool)

(assert (=> b!1456301 (=> (not res!986802) (not e!819370))))

(assert (=> b!1456301 (= res!986802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47552 a!2862) j!93) mask!2687) (select (arr!47552 a!2862) j!93) a!2862 mask!2687) lt!638265))))

(assert (=> b!1456301 (= lt!638265 (Intermediate!11804 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456302 () Bool)

(declare-fun res!986795 () Bool)

(assert (=> b!1456302 (=> (not res!986795) (not e!819366))))

(assert (=> b!1456302 (= res!986795 e!819367)))

(declare-fun c!134256 () Bool)

(assert (=> b!1456302 (= c!134256 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456303 () Bool)

(assert (=> b!1456303 (= e!819366 (not e!819371))))

(declare-fun res!986811 () Bool)

(assert (=> b!1456303 (=> res!986811 e!819371)))

(assert (=> b!1456303 (= res!986811 (or (and (= (select (arr!47552 a!2862) index!646) (select (store (arr!47552 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47552 a!2862) index!646) (select (arr!47552 a!2862) j!93))) (= (select (arr!47552 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456303 e!819365))

(declare-fun res!986797 () Bool)

(assert (=> b!1456303 (=> (not res!986797) (not e!819365))))

(assert (=> b!1456303 (= res!986797 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49104 0))(
  ( (Unit!49105) )
))
(declare-fun lt!638259 () Unit!49104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49104)

(assert (=> b!1456303 (= lt!638259 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456304 () Bool)

(declare-fun res!986809 () Bool)

(assert (=> b!1456304 (=> (not res!986809) (not e!819370))))

(assert (=> b!1456304 (= res!986809 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47552 a!2862) j!93) a!2862 mask!2687) lt!638265))))

(declare-fun b!1456305 () Bool)

(declare-fun res!986799 () Bool)

(assert (=> b!1456305 (=> (not res!986799) (not e!819368))))

(assert (=> b!1456305 (= res!986799 (validKeyInArray!0 (select (arr!47552 a!2862) j!93)))))

(assert (= (and start!125080 res!986796) b!1456286))

(assert (= (and b!1456286 res!986803) b!1456291))

(assert (= (and b!1456291 res!986812) b!1456305))

(assert (= (and b!1456305 res!986799) b!1456298))

(assert (= (and b!1456298 res!986800) b!1456295))

(assert (= (and b!1456295 res!986798) b!1456289))

(assert (= (and b!1456289 res!986806) b!1456284))

(assert (= (and b!1456284 res!986801) b!1456301))

(assert (= (and b!1456301 res!986802) b!1456304))

(assert (= (and b!1456304 res!986809) b!1456288))

(assert (= (and b!1456288 res!986805) b!1456302))

(assert (= (and b!1456302 c!134256) b!1456296))

(assert (= (and b!1456302 (not c!134256)) b!1456292))

(assert (= (and b!1456302 res!986795) b!1456290))

(assert (= (and b!1456290 res!986810) b!1456303))

(assert (= (and b!1456303 res!986797) b!1456293))

(assert (= (and b!1456293 res!986807) b!1456297))

(assert (= (and b!1456303 (not res!986811)) b!1456285))

(assert (= (and b!1456285 (not res!986804)) b!1456300))

(assert (= (and b!1456300 (not res!986808)) b!1456287))

(assert (= (and b!1456287 c!134255) b!1456294))

(assert (= (and b!1456287 (not c!134255)) b!1456299))

(declare-fun m!1344403 () Bool)

(assert (=> start!125080 m!1344403))

(declare-fun m!1344405 () Bool)

(assert (=> start!125080 m!1344405))

(declare-fun m!1344407 () Bool)

(assert (=> b!1456300 m!1344407))

(assert (=> b!1456300 m!1344407))

(declare-fun m!1344409 () Bool)

(assert (=> b!1456300 m!1344409))

(assert (=> b!1456304 m!1344407))

(assert (=> b!1456304 m!1344407))

(declare-fun m!1344411 () Bool)

(assert (=> b!1456304 m!1344411))

(declare-fun m!1344413 () Bool)

(assert (=> b!1456303 m!1344413))

(declare-fun m!1344415 () Bool)

(assert (=> b!1456303 m!1344415))

(declare-fun m!1344417 () Bool)

(assert (=> b!1456303 m!1344417))

(declare-fun m!1344419 () Bool)

(assert (=> b!1456303 m!1344419))

(declare-fun m!1344421 () Bool)

(assert (=> b!1456303 m!1344421))

(assert (=> b!1456303 m!1344407))

(declare-fun m!1344423 () Bool)

(assert (=> b!1456298 m!1344423))

(declare-fun m!1344425 () Bool)

(assert (=> b!1456288 m!1344425))

(assert (=> b!1456288 m!1344425))

(declare-fun m!1344427 () Bool)

(assert (=> b!1456288 m!1344427))

(assert (=> b!1456288 m!1344415))

(declare-fun m!1344429 () Bool)

(assert (=> b!1456288 m!1344429))

(declare-fun m!1344431 () Bool)

(assert (=> b!1456299 m!1344431))

(assert (=> b!1456297 m!1344415))

(declare-fun m!1344433 () Bool)

(assert (=> b!1456297 m!1344433))

(assert (=> b!1456297 m!1344417))

(assert (=> b!1456297 m!1344419))

(assert (=> b!1456297 m!1344407))

(declare-fun m!1344435 () Bool)

(assert (=> b!1456295 m!1344435))

(assert (=> b!1456301 m!1344407))

(assert (=> b!1456301 m!1344407))

(declare-fun m!1344437 () Bool)

(assert (=> b!1456301 m!1344437))

(assert (=> b!1456301 m!1344437))

(assert (=> b!1456301 m!1344407))

(declare-fun m!1344439 () Bool)

(assert (=> b!1456301 m!1344439))

(declare-fun m!1344441 () Bool)

(assert (=> b!1456285 m!1344441))

(declare-fun m!1344443 () Bool)

(assert (=> b!1456285 m!1344443))

(declare-fun m!1344445 () Bool)

(assert (=> b!1456285 m!1344445))

(assert (=> b!1456292 m!1344443))

(assert (=> b!1456292 m!1344445))

(assert (=> b!1456284 m!1344415))

(declare-fun m!1344447 () Bool)

(assert (=> b!1456284 m!1344447))

(assert (=> b!1456305 m!1344407))

(assert (=> b!1456305 m!1344407))

(declare-fun m!1344449 () Bool)

(assert (=> b!1456305 m!1344449))

(declare-fun m!1344451 () Bool)

(assert (=> b!1456296 m!1344451))

(assert (=> b!1456293 m!1344407))

(assert (=> b!1456293 m!1344407))

(declare-fun m!1344453 () Bool)

(assert (=> b!1456293 m!1344453))

(declare-fun m!1344455 () Bool)

(assert (=> b!1456291 m!1344455))

(assert (=> b!1456291 m!1344455))

(declare-fun m!1344457 () Bool)

(assert (=> b!1456291 m!1344457))

(declare-fun m!1344459 () Bool)

(assert (=> b!1456294 m!1344459))

(push 1)

