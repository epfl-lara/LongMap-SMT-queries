; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127340 () Bool)

(assert start!127340)

(declare-fun lt!652068 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!838108 () Bool)

(declare-fun b!1496331 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99802 0))(
  ( (array!99803 (arr!48165 (Array (_ BitVec 32) (_ BitVec 64))) (size!48715 (_ BitVec 32))) )
))
(declare-fun lt!652063 () array!99802)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12405 0))(
  ( (MissingZero!12405 (index!52012 (_ BitVec 32))) (Found!12405 (index!52013 (_ BitVec 32))) (Intermediate!12405 (undefined!13217 Bool) (index!52014 (_ BitVec 32)) (x!133639 (_ BitVec 32))) (Undefined!12405) (MissingVacant!12405 (index!52015 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99802 (_ BitVec 32)) SeekEntryResult!12405)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99802 (_ BitVec 32)) SeekEntryResult!12405)

(assert (=> b!1496331 (= e!838108 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652068 lt!652063 mask!2687) (seekEntryOrOpen!0 lt!652068 lt!652063 mask!2687)))))

(declare-fun b!1496332 () Bool)

(declare-fun e!838100 () Bool)

(declare-fun e!838099 () Bool)

(assert (=> b!1496332 (= e!838100 e!838099)))

(declare-fun res!1017707 () Bool)

(assert (=> b!1496332 (=> (not res!1017707) (not e!838099))))

(declare-fun a!2862 () array!99802)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!652069 () SeekEntryResult!12405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99802 (_ BitVec 32)) SeekEntryResult!12405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496332 (= res!1017707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48165 a!2862) j!93) mask!2687) (select (arr!48165 a!2862) j!93) a!2862 mask!2687) lt!652069))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496332 (= lt!652069 (Intermediate!12405 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496333 () Bool)

(declare-fun res!1017697 () Bool)

(declare-fun e!838105 () Bool)

(assert (=> b!1496333 (=> (not res!1017697) (not e!838105))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496333 (= res!1017697 (validKeyInArray!0 (select (arr!48165 a!2862) i!1006)))))

(declare-fun b!1496334 () Bool)

(declare-fun e!838104 () Bool)

(assert (=> b!1496334 (= e!838104 true)))

(declare-fun lt!652066 () Bool)

(declare-fun e!838101 () Bool)

(assert (=> b!1496334 (= lt!652066 e!838101)))

(declare-fun c!138854 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496334 (= c!138854 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496335 () Bool)

(declare-fun e!838103 () Bool)

(assert (=> b!1496335 (= e!838099 e!838103)))

(declare-fun res!1017693 () Bool)

(assert (=> b!1496335 (=> (not res!1017693) (not e!838103))))

(declare-fun lt!652064 () SeekEntryResult!12405)

(assert (=> b!1496335 (= res!1017693 (= lt!652064 (Intermediate!12405 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496335 (= lt!652064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652068 mask!2687) lt!652068 lt!652063 mask!2687))))

(assert (=> b!1496335 (= lt!652068 (select (store (arr!48165 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496336 () Bool)

(declare-fun res!1017698 () Bool)

(assert (=> b!1496336 (=> (not res!1017698) (not e!838105))))

(assert (=> b!1496336 (= res!1017698 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48715 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48715 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48715 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496337 () Bool)

(assert (=> b!1496337 (= e!838108 (= lt!652064 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652068 lt!652063 mask!2687)))))

(declare-fun b!1496338 () Bool)

(assert (=> b!1496338 (= e!838105 e!838100)))

(declare-fun res!1017704 () Bool)

(assert (=> b!1496338 (=> (not res!1017704) (not e!838100))))

(assert (=> b!1496338 (= res!1017704 (= (select (store (arr!48165 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496338 (= lt!652063 (array!99803 (store (arr!48165 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48715 a!2862)))))

(declare-fun b!1496339 () Bool)

(declare-fun res!1017705 () Bool)

(assert (=> b!1496339 (=> (not res!1017705) (not e!838105))))

(declare-datatypes ((List!34666 0))(
  ( (Nil!34663) (Cons!34662 (h!36059 (_ BitVec 64)) (t!49360 List!34666)) )
))
(declare-fun arrayNoDuplicates!0 (array!99802 (_ BitVec 32) List!34666) Bool)

(assert (=> b!1496339 (= res!1017705 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34663))))

(declare-fun b!1496340 () Bool)

(declare-fun e!838102 () Bool)

(assert (=> b!1496340 (= e!838103 (not e!838102))))

(declare-fun res!1017694 () Bool)

(assert (=> b!1496340 (=> res!1017694 e!838102)))

(assert (=> b!1496340 (= res!1017694 (or (and (= (select (arr!48165 a!2862) index!646) (select (store (arr!48165 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48165 a!2862) index!646) (select (arr!48165 a!2862) j!93))) (= (select (arr!48165 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!838106 () Bool)

(assert (=> b!1496340 e!838106))

(declare-fun res!1017692 () Bool)

(assert (=> b!1496340 (=> (not res!1017692) (not e!838106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99802 (_ BitVec 32)) Bool)

(assert (=> b!1496340 (= res!1017692 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50150 0))(
  ( (Unit!50151) )
))
(declare-fun lt!652065 () Unit!50150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50150)

(assert (=> b!1496340 (= lt!652065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!652067 () (_ BitVec 32))

(declare-fun b!1496330 () Bool)

(assert (=> b!1496330 (= e!838101 (not (= lt!652064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652067 lt!652068 lt!652063 mask!2687))))))

(declare-fun res!1017701 () Bool)

(assert (=> start!127340 (=> (not res!1017701) (not e!838105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127340 (= res!1017701 (validMask!0 mask!2687))))

(assert (=> start!127340 e!838105))

(assert (=> start!127340 true))

(declare-fun array_inv!37193 (array!99802) Bool)

(assert (=> start!127340 (array_inv!37193 a!2862)))

(declare-fun b!1496341 () Bool)

(assert (=> b!1496341 (= e!838102 e!838104)))

(declare-fun res!1017708 () Bool)

(assert (=> b!1496341 (=> res!1017708 e!838104)))

(assert (=> b!1496341 (= res!1017708 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652067 #b00000000000000000000000000000000) (bvsge lt!652067 (size!48715 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496341 (= lt!652067 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496342 () Bool)

(declare-fun res!1017703 () Bool)

(assert (=> b!1496342 (=> (not res!1017703) (not e!838105))))

(assert (=> b!1496342 (= res!1017703 (validKeyInArray!0 (select (arr!48165 a!2862) j!93)))))

(declare-fun b!1496343 () Bool)

(declare-fun res!1017709 () Bool)

(assert (=> b!1496343 (=> (not res!1017709) (not e!838105))))

(assert (=> b!1496343 (= res!1017709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496344 () Bool)

(declare-fun res!1017700 () Bool)

(assert (=> b!1496344 (=> (not res!1017700) (not e!838105))))

(assert (=> b!1496344 (= res!1017700 (and (= (size!48715 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48715 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48715 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496345 () Bool)

(declare-fun res!1017706 () Bool)

(assert (=> b!1496345 (=> res!1017706 e!838104)))

(assert (=> b!1496345 (= res!1017706 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652067 (select (arr!48165 a!2862) j!93) a!2862 mask!2687) lt!652069)))))

(declare-fun b!1496346 () Bool)

(declare-fun res!1017696 () Bool)

(assert (=> b!1496346 (=> (not res!1017696) (not e!838103))))

(assert (=> b!1496346 (= res!1017696 e!838108)))

(declare-fun c!138853 () Bool)

(assert (=> b!1496346 (= c!138853 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496347 () Bool)

(declare-fun res!1017702 () Bool)

(assert (=> b!1496347 (=> (not res!1017702) (not e!838103))))

(assert (=> b!1496347 (= res!1017702 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496348 () Bool)

(assert (=> b!1496348 (= e!838106 (or (= (select (arr!48165 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48165 a!2862) intermediateBeforeIndex!19) (select (arr!48165 a!2862) j!93))))))

(declare-fun b!1496349 () Bool)

(assert (=> b!1496349 (= e!838101 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652067 intermediateAfterIndex!19 lt!652068 lt!652063 mask!2687) (seekEntryOrOpen!0 lt!652068 lt!652063 mask!2687))))))

(declare-fun b!1496350 () Bool)

(declare-fun res!1017695 () Bool)

(assert (=> b!1496350 (=> (not res!1017695) (not e!838099))))

(assert (=> b!1496350 (= res!1017695 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48165 a!2862) j!93) a!2862 mask!2687) lt!652069))))

(declare-fun b!1496351 () Bool)

(declare-fun res!1017699 () Bool)

(assert (=> b!1496351 (=> (not res!1017699) (not e!838106))))

(assert (=> b!1496351 (= res!1017699 (= (seekEntryOrOpen!0 (select (arr!48165 a!2862) j!93) a!2862 mask!2687) (Found!12405 j!93)))))

(assert (= (and start!127340 res!1017701) b!1496344))

(assert (= (and b!1496344 res!1017700) b!1496333))

(assert (= (and b!1496333 res!1017697) b!1496342))

(assert (= (and b!1496342 res!1017703) b!1496343))

(assert (= (and b!1496343 res!1017709) b!1496339))

(assert (= (and b!1496339 res!1017705) b!1496336))

(assert (= (and b!1496336 res!1017698) b!1496338))

(assert (= (and b!1496338 res!1017704) b!1496332))

(assert (= (and b!1496332 res!1017707) b!1496350))

(assert (= (and b!1496350 res!1017695) b!1496335))

(assert (= (and b!1496335 res!1017693) b!1496346))

(assert (= (and b!1496346 c!138853) b!1496337))

(assert (= (and b!1496346 (not c!138853)) b!1496331))

(assert (= (and b!1496346 res!1017696) b!1496347))

(assert (= (and b!1496347 res!1017702) b!1496340))

(assert (= (and b!1496340 res!1017692) b!1496351))

(assert (= (and b!1496351 res!1017699) b!1496348))

(assert (= (and b!1496340 (not res!1017694)) b!1496341))

(assert (= (and b!1496341 (not res!1017708)) b!1496345))

(assert (= (and b!1496345 (not res!1017706)) b!1496334))

(assert (= (and b!1496334 c!138854) b!1496330))

(assert (= (and b!1496334 (not c!138854)) b!1496349))

(declare-fun m!1379525 () Bool)

(assert (=> b!1496333 m!1379525))

(assert (=> b!1496333 m!1379525))

(declare-fun m!1379527 () Bool)

(assert (=> b!1496333 m!1379527))

(declare-fun m!1379529 () Bool)

(assert (=> b!1496341 m!1379529))

(declare-fun m!1379531 () Bool)

(assert (=> b!1496345 m!1379531))

(assert (=> b!1496345 m!1379531))

(declare-fun m!1379533 () Bool)

(assert (=> b!1496345 m!1379533))

(declare-fun m!1379535 () Bool)

(assert (=> b!1496331 m!1379535))

(declare-fun m!1379537 () Bool)

(assert (=> b!1496331 m!1379537))

(declare-fun m!1379539 () Bool)

(assert (=> b!1496338 m!1379539))

(declare-fun m!1379541 () Bool)

(assert (=> b!1496338 m!1379541))

(declare-fun m!1379543 () Bool)

(assert (=> b!1496335 m!1379543))

(assert (=> b!1496335 m!1379543))

(declare-fun m!1379545 () Bool)

(assert (=> b!1496335 m!1379545))

(assert (=> b!1496335 m!1379539))

(declare-fun m!1379547 () Bool)

(assert (=> b!1496335 m!1379547))

(assert (=> b!1496351 m!1379531))

(assert (=> b!1496351 m!1379531))

(declare-fun m!1379549 () Bool)

(assert (=> b!1496351 m!1379549))

(declare-fun m!1379551 () Bool)

(assert (=> b!1496348 m!1379551))

(assert (=> b!1496348 m!1379531))

(declare-fun m!1379553 () Bool)

(assert (=> b!1496343 m!1379553))

(declare-fun m!1379555 () Bool)

(assert (=> b!1496349 m!1379555))

(assert (=> b!1496349 m!1379537))

(declare-fun m!1379557 () Bool)

(assert (=> b!1496340 m!1379557))

(assert (=> b!1496340 m!1379539))

(declare-fun m!1379559 () Bool)

(assert (=> b!1496340 m!1379559))

(declare-fun m!1379561 () Bool)

(assert (=> b!1496340 m!1379561))

(declare-fun m!1379563 () Bool)

(assert (=> b!1496340 m!1379563))

(assert (=> b!1496340 m!1379531))

(declare-fun m!1379565 () Bool)

(assert (=> start!127340 m!1379565))

(declare-fun m!1379567 () Bool)

(assert (=> start!127340 m!1379567))

(declare-fun m!1379569 () Bool)

(assert (=> b!1496330 m!1379569))

(assert (=> b!1496332 m!1379531))

(assert (=> b!1496332 m!1379531))

(declare-fun m!1379571 () Bool)

(assert (=> b!1496332 m!1379571))

(assert (=> b!1496332 m!1379571))

(assert (=> b!1496332 m!1379531))

(declare-fun m!1379573 () Bool)

(assert (=> b!1496332 m!1379573))

(assert (=> b!1496350 m!1379531))

(assert (=> b!1496350 m!1379531))

(declare-fun m!1379575 () Bool)

(assert (=> b!1496350 m!1379575))

(declare-fun m!1379577 () Bool)

(assert (=> b!1496337 m!1379577))

(assert (=> b!1496342 m!1379531))

(assert (=> b!1496342 m!1379531))

(declare-fun m!1379579 () Bool)

(assert (=> b!1496342 m!1379579))

(declare-fun m!1379581 () Bool)

(assert (=> b!1496339 m!1379581))

(check-sat (not b!1496340) (not b!1496331) (not b!1496349) (not b!1496339) (not b!1496351) (not b!1496330) (not start!127340) (not b!1496350) (not b!1496333) (not b!1496332) (not b!1496345) (not b!1496342) (not b!1496343) (not b!1496341) (not b!1496335) (not b!1496337))
(check-sat)
