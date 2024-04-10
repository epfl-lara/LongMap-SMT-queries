; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127096 () Bool)

(assert start!127096)

(declare-fun b!1493602 () Bool)

(declare-fun res!1016072 () Bool)

(declare-fun e!836699 () Bool)

(assert (=> b!1493602 (=> (not res!1016072) (not e!836699))))

(declare-datatypes ((array!99743 0))(
  ( (array!99744 (arr!48140 (Array (_ BitVec 32) (_ BitVec 64))) (size!48690 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99743)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493602 (= res!1016072 (validKeyInArray!0 (select (arr!48140 a!2862) j!93)))))

(declare-fun b!1493603 () Bool)

(declare-fun res!1016083 () Bool)

(declare-fun e!836705 () Bool)

(assert (=> b!1493603 (=> (not res!1016083) (not e!836705))))

(declare-fun e!836702 () Bool)

(assert (=> b!1493603 (= res!1016083 e!836702)))

(declare-fun c!138297 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493603 (= c!138297 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493604 () Bool)

(declare-fun e!836700 () Bool)

(assert (=> b!1493604 (= e!836700 e!836705)))

(declare-fun res!1016078 () Bool)

(assert (=> b!1493604 (=> (not res!1016078) (not e!836705))))

(declare-datatypes ((SeekEntryResult!12380 0))(
  ( (MissingZero!12380 (index!51912 (_ BitVec 32))) (Found!12380 (index!51913 (_ BitVec 32))) (Intermediate!12380 (undefined!13192 Bool) (index!51914 (_ BitVec 32)) (x!133516 (_ BitVec 32))) (Undefined!12380) (MissingVacant!12380 (index!51915 (_ BitVec 32))) )
))
(declare-fun lt!651083 () SeekEntryResult!12380)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493604 (= res!1016078 (= lt!651083 (Intermediate!12380 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651084 () array!99743)

(declare-fun lt!651080 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99743 (_ BitVec 32)) SeekEntryResult!12380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493604 (= lt!651083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651080 mask!2687) lt!651080 lt!651084 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493604 (= lt!651080 (select (store (arr!48140 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493605 () Bool)

(declare-fun res!1016075 () Bool)

(assert (=> b!1493605 (=> (not res!1016075) (not e!836699))))

(declare-datatypes ((List!34641 0))(
  ( (Nil!34638) (Cons!34637 (h!36026 (_ BitVec 64)) (t!49335 List!34641)) )
))
(declare-fun arrayNoDuplicates!0 (array!99743 (_ BitVec 32) List!34641) Bool)

(assert (=> b!1493605 (= res!1016075 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34638))))

(declare-fun b!1493606 () Bool)

(declare-fun res!1016082 () Bool)

(declare-fun e!836698 () Bool)

(assert (=> b!1493606 (=> (not res!1016082) (not e!836698))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99743 (_ BitVec 32)) SeekEntryResult!12380)

(assert (=> b!1493606 (= res!1016082 (= (seekEntryOrOpen!0 (select (arr!48140 a!2862) j!93) a!2862 mask!2687) (Found!12380 j!93)))))

(declare-fun b!1493607 () Bool)

(declare-fun res!1016068 () Bool)

(assert (=> b!1493607 (=> (not res!1016068) (not e!836699))))

(assert (=> b!1493607 (= res!1016068 (and (= (size!48690 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48690 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48690 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493608 () Bool)

(declare-fun e!836701 () Bool)

(assert (=> b!1493608 (= e!836701 true)))

(declare-fun lt!651082 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493608 (= lt!651082 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493609 () Bool)

(declare-fun res!1016073 () Bool)

(assert (=> b!1493609 (=> (not res!1016073) (not e!836700))))

(declare-fun lt!651079 () SeekEntryResult!12380)

(assert (=> b!1493609 (= res!1016073 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48140 a!2862) j!93) a!2862 mask!2687) lt!651079))))

(declare-fun b!1493610 () Bool)

(declare-fun e!836704 () Bool)

(assert (=> b!1493610 (= e!836704 e!836700)))

(declare-fun res!1016071 () Bool)

(assert (=> b!1493610 (=> (not res!1016071) (not e!836700))))

(assert (=> b!1493610 (= res!1016071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48140 a!2862) j!93) mask!2687) (select (arr!48140 a!2862) j!93) a!2862 mask!2687) lt!651079))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493610 (= lt!651079 (Intermediate!12380 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493612 () Bool)

(assert (=> b!1493612 (= e!836698 (or (= (select (arr!48140 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48140 a!2862) intermediateBeforeIndex!19) (select (arr!48140 a!2862) j!93))))))

(declare-fun b!1493613 () Bool)

(assert (=> b!1493613 (= e!836699 e!836704)))

(declare-fun res!1016069 () Bool)

(assert (=> b!1493613 (=> (not res!1016069) (not e!836704))))

(assert (=> b!1493613 (= res!1016069 (= (select (store (arr!48140 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493613 (= lt!651084 (array!99744 (store (arr!48140 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48690 a!2862)))))

(declare-fun b!1493614 () Bool)

(declare-fun res!1016077 () Bool)

(assert (=> b!1493614 (=> (not res!1016077) (not e!836705))))

(assert (=> b!1493614 (= res!1016077 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493615 () Bool)

(declare-fun res!1016080 () Bool)

(assert (=> b!1493615 (=> (not res!1016080) (not e!836699))))

(assert (=> b!1493615 (= res!1016080 (validKeyInArray!0 (select (arr!48140 a!2862) i!1006)))))

(declare-fun b!1493616 () Bool)

(declare-fun res!1016076 () Bool)

(assert (=> b!1493616 (=> (not res!1016076) (not e!836699))))

(assert (=> b!1493616 (= res!1016076 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48690 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48690 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48690 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493617 () Bool)

(assert (=> b!1493617 (= e!836705 (not e!836701))))

(declare-fun res!1016081 () Bool)

(assert (=> b!1493617 (=> res!1016081 e!836701)))

(assert (=> b!1493617 (= res!1016081 (or (and (= (select (arr!48140 a!2862) index!646) (select (store (arr!48140 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48140 a!2862) index!646) (select (arr!48140 a!2862) j!93))) (= (select (arr!48140 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493617 e!836698))

(declare-fun res!1016070 () Bool)

(assert (=> b!1493617 (=> (not res!1016070) (not e!836698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99743 (_ BitVec 32)) Bool)

(assert (=> b!1493617 (= res!1016070 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50100 0))(
  ( (Unit!50101) )
))
(declare-fun lt!651081 () Unit!50100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50100)

(assert (=> b!1493617 (= lt!651081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493618 () Bool)

(declare-fun res!1016074 () Bool)

(assert (=> b!1493618 (=> (not res!1016074) (not e!836699))))

(assert (=> b!1493618 (= res!1016074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493619 () Bool)

(assert (=> b!1493619 (= e!836702 (= lt!651083 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651080 lt!651084 mask!2687)))))

(declare-fun b!1493611 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99743 (_ BitVec 32)) SeekEntryResult!12380)

(assert (=> b!1493611 (= e!836702 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651080 lt!651084 mask!2687) (seekEntryOrOpen!0 lt!651080 lt!651084 mask!2687)))))

(declare-fun res!1016079 () Bool)

(assert (=> start!127096 (=> (not res!1016079) (not e!836699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127096 (= res!1016079 (validMask!0 mask!2687))))

(assert (=> start!127096 e!836699))

(assert (=> start!127096 true))

(declare-fun array_inv!37168 (array!99743) Bool)

(assert (=> start!127096 (array_inv!37168 a!2862)))

(assert (= (and start!127096 res!1016079) b!1493607))

(assert (= (and b!1493607 res!1016068) b!1493615))

(assert (= (and b!1493615 res!1016080) b!1493602))

(assert (= (and b!1493602 res!1016072) b!1493618))

(assert (= (and b!1493618 res!1016074) b!1493605))

(assert (= (and b!1493605 res!1016075) b!1493616))

(assert (= (and b!1493616 res!1016076) b!1493613))

(assert (= (and b!1493613 res!1016069) b!1493610))

(assert (= (and b!1493610 res!1016071) b!1493609))

(assert (= (and b!1493609 res!1016073) b!1493604))

(assert (= (and b!1493604 res!1016078) b!1493603))

(assert (= (and b!1493603 c!138297) b!1493619))

(assert (= (and b!1493603 (not c!138297)) b!1493611))

(assert (= (and b!1493603 res!1016083) b!1493614))

(assert (= (and b!1493614 res!1016077) b!1493617))

(assert (= (and b!1493617 res!1016070) b!1493606))

(assert (= (and b!1493606 res!1016082) b!1493612))

(assert (= (and b!1493617 (not res!1016081)) b!1493608))

(declare-fun m!1377379 () Bool)

(assert (=> b!1493612 m!1377379))

(declare-fun m!1377381 () Bool)

(assert (=> b!1493612 m!1377381))

(assert (=> b!1493609 m!1377381))

(assert (=> b!1493609 m!1377381))

(declare-fun m!1377383 () Bool)

(assert (=> b!1493609 m!1377383))

(assert (=> b!1493602 m!1377381))

(assert (=> b!1493602 m!1377381))

(declare-fun m!1377385 () Bool)

(assert (=> b!1493602 m!1377385))

(declare-fun m!1377387 () Bool)

(assert (=> b!1493611 m!1377387))

(declare-fun m!1377389 () Bool)

(assert (=> b!1493611 m!1377389))

(declare-fun m!1377391 () Bool)

(assert (=> b!1493613 m!1377391))

(declare-fun m!1377393 () Bool)

(assert (=> b!1493613 m!1377393))

(declare-fun m!1377395 () Bool)

(assert (=> start!127096 m!1377395))

(declare-fun m!1377397 () Bool)

(assert (=> start!127096 m!1377397))

(assert (=> b!1493610 m!1377381))

(assert (=> b!1493610 m!1377381))

(declare-fun m!1377399 () Bool)

(assert (=> b!1493610 m!1377399))

(assert (=> b!1493610 m!1377399))

(assert (=> b!1493610 m!1377381))

(declare-fun m!1377401 () Bool)

(assert (=> b!1493610 m!1377401))

(declare-fun m!1377403 () Bool)

(assert (=> b!1493608 m!1377403))

(declare-fun m!1377405 () Bool)

(assert (=> b!1493617 m!1377405))

(assert (=> b!1493617 m!1377391))

(declare-fun m!1377407 () Bool)

(assert (=> b!1493617 m!1377407))

(declare-fun m!1377409 () Bool)

(assert (=> b!1493617 m!1377409))

(declare-fun m!1377411 () Bool)

(assert (=> b!1493617 m!1377411))

(assert (=> b!1493617 m!1377381))

(declare-fun m!1377413 () Bool)

(assert (=> b!1493605 m!1377413))

(declare-fun m!1377415 () Bool)

(assert (=> b!1493619 m!1377415))

(declare-fun m!1377417 () Bool)

(assert (=> b!1493618 m!1377417))

(assert (=> b!1493606 m!1377381))

(assert (=> b!1493606 m!1377381))

(declare-fun m!1377419 () Bool)

(assert (=> b!1493606 m!1377419))

(declare-fun m!1377421 () Bool)

(assert (=> b!1493604 m!1377421))

(assert (=> b!1493604 m!1377421))

(declare-fun m!1377423 () Bool)

(assert (=> b!1493604 m!1377423))

(assert (=> b!1493604 m!1377391))

(declare-fun m!1377425 () Bool)

(assert (=> b!1493604 m!1377425))

(declare-fun m!1377427 () Bool)

(assert (=> b!1493615 m!1377427))

(assert (=> b!1493615 m!1377427))

(declare-fun m!1377429 () Bool)

(assert (=> b!1493615 m!1377429))

(push 1)

