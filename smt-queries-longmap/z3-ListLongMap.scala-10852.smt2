; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127040 () Bool)

(assert start!127040)

(declare-fun b!1493071 () Bool)

(declare-fun res!1015793 () Bool)

(declare-fun e!836399 () Bool)

(assert (=> b!1493071 (=> (not res!1015793) (not e!836399))))

(declare-datatypes ((SeekEntryResult!12377 0))(
  ( (MissingZero!12377 (index!51900 (_ BitVec 32))) (Found!12377 (index!51901 (_ BitVec 32))) (Intermediate!12377 (undefined!13189 Bool) (index!51902 (_ BitVec 32)) (x!133498 (_ BitVec 32))) (Undefined!12377) (MissingVacant!12377 (index!51903 (_ BitVec 32))) )
))
(declare-fun lt!650724 () SeekEntryResult!12377)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99685 0))(
  ( (array!99686 (arr!48112 (Array (_ BitVec 32) (_ BitVec 64))) (size!48664 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99685)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12377)

(assert (=> b!1493071 (= res!1015793 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!650724))))

(declare-fun b!1493072 () Bool)

(declare-fun res!1015782 () Bool)

(declare-fun e!836398 () Bool)

(assert (=> b!1493072 (=> (not res!1015782) (not e!836398))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493072 (= res!1015782 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48664 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48664 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48664 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493073 () Bool)

(declare-fun res!1015780 () Bool)

(assert (=> b!1493073 (=> (not res!1015780) (not e!836398))))

(declare-datatypes ((List!34691 0))(
  ( (Nil!34688) (Cons!34687 (h!36076 (_ BitVec 64)) (t!49377 List!34691)) )
))
(declare-fun arrayNoDuplicates!0 (array!99685 (_ BitVec 32) List!34691) Bool)

(assert (=> b!1493073 (= res!1015780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34688))))

(declare-fun b!1493074 () Bool)

(declare-fun res!1015794 () Bool)

(assert (=> b!1493074 (=> (not res!1015794) (not e!836398))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493074 (= res!1015794 (validKeyInArray!0 (select (arr!48112 a!2862) i!1006)))))

(declare-fun b!1493075 () Bool)

(declare-fun e!836404 () Bool)

(assert (=> b!1493075 (= e!836404 e!836399)))

(declare-fun res!1015795 () Bool)

(assert (=> b!1493075 (=> (not res!1015795) (not e!836399))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493075 (= res!1015795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!650724))))

(assert (=> b!1493075 (= lt!650724 (Intermediate!12377 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493076 () Bool)

(declare-fun res!1015790 () Bool)

(assert (=> b!1493076 (=> (not res!1015790) (not e!836398))))

(assert (=> b!1493076 (= res!1015790 (validKeyInArray!0 (select (arr!48112 a!2862) j!93)))))

(declare-fun b!1493077 () Bool)

(declare-fun res!1015789 () Bool)

(declare-fun e!836403 () Bool)

(assert (=> b!1493077 (=> (not res!1015789) (not e!836403))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12377)

(assert (=> b!1493077 (= res!1015789 (= (seekEntryOrOpen!0 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) (Found!12377 j!93)))))

(declare-fun b!1493078 () Bool)

(declare-fun res!1015784 () Bool)

(assert (=> b!1493078 (=> (not res!1015784) (not e!836398))))

(assert (=> b!1493078 (= res!1015784 (and (= (size!48664 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48664 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48664 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493079 () Bool)

(assert (=> b!1493079 (= e!836403 (or (= (select (arr!48112 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48112 a!2862) intermediateBeforeIndex!19) (select (arr!48112 a!2862) j!93))))))

(declare-fun b!1493080 () Bool)

(declare-fun res!1015791 () Bool)

(assert (=> b!1493080 (=> (not res!1015791) (not e!836398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99685 (_ BitVec 32)) Bool)

(assert (=> b!1493080 (= res!1015791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!650725 () SeekEntryResult!12377)

(declare-fun lt!650723 () array!99685)

(declare-fun lt!650722 () (_ BitVec 64))

(declare-fun b!1493081 () Bool)

(declare-fun e!836405 () Bool)

(assert (=> b!1493081 (= e!836405 (= lt!650725 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650722 lt!650723 mask!2687)))))

(declare-fun b!1493082 () Bool)

(declare-fun res!1015792 () Bool)

(declare-fun e!836400 () Bool)

(assert (=> b!1493082 (=> (not res!1015792) (not e!836400))))

(assert (=> b!1493082 (= res!1015792 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493083 () Bool)

(declare-fun e!836402 () Bool)

(assert (=> b!1493083 (= e!836400 (not e!836402))))

(declare-fun res!1015783 () Bool)

(assert (=> b!1493083 (=> res!1015783 e!836402)))

(assert (=> b!1493083 (= res!1015783 (or (and (= (select (arr!48112 a!2862) index!646) (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48112 a!2862) index!646) (select (arr!48112 a!2862) j!93))) (= (select (arr!48112 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493083 e!836403))

(declare-fun res!1015781 () Bool)

(assert (=> b!1493083 (=> (not res!1015781) (not e!836403))))

(assert (=> b!1493083 (= res!1015781 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49935 0))(
  ( (Unit!49936) )
))
(declare-fun lt!650721 () Unit!49935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49935)

(assert (=> b!1493083 (= lt!650721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493084 () Bool)

(assert (=> b!1493084 (= e!836398 e!836404)))

(declare-fun res!1015786 () Bool)

(assert (=> b!1493084 (=> (not res!1015786) (not e!836404))))

(assert (=> b!1493084 (= res!1015786 (= (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493084 (= lt!650723 (array!99686 (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48664 a!2862)))))

(declare-fun b!1493085 () Bool)

(assert (=> b!1493085 (= e!836402 true)))

(declare-fun lt!650726 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493085 (= lt!650726 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493086 () Bool)

(assert (=> b!1493086 (= e!836399 e!836400)))

(declare-fun res!1015788 () Bool)

(assert (=> b!1493086 (=> (not res!1015788) (not e!836400))))

(assert (=> b!1493086 (= res!1015788 (= lt!650725 (Intermediate!12377 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493086 (= lt!650725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650722 mask!2687) lt!650722 lt!650723 mask!2687))))

(assert (=> b!1493086 (= lt!650722 (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493087 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12377)

(assert (=> b!1493087 (= e!836405 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650722 lt!650723 mask!2687) (seekEntryOrOpen!0 lt!650722 lt!650723 mask!2687)))))

(declare-fun b!1493088 () Bool)

(declare-fun res!1015787 () Bool)

(assert (=> b!1493088 (=> (not res!1015787) (not e!836400))))

(assert (=> b!1493088 (= res!1015787 e!836405)))

(declare-fun c!138178 () Bool)

(assert (=> b!1493088 (= c!138178 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1015785 () Bool)

(assert (=> start!127040 (=> (not res!1015785) (not e!836398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127040 (= res!1015785 (validMask!0 mask!2687))))

(assert (=> start!127040 e!836398))

(assert (=> start!127040 true))

(declare-fun array_inv!37345 (array!99685) Bool)

(assert (=> start!127040 (array_inv!37345 a!2862)))

(assert (= (and start!127040 res!1015785) b!1493078))

(assert (= (and b!1493078 res!1015784) b!1493074))

(assert (= (and b!1493074 res!1015794) b!1493076))

(assert (= (and b!1493076 res!1015790) b!1493080))

(assert (= (and b!1493080 res!1015791) b!1493073))

(assert (= (and b!1493073 res!1015780) b!1493072))

(assert (= (and b!1493072 res!1015782) b!1493084))

(assert (= (and b!1493084 res!1015786) b!1493075))

(assert (= (and b!1493075 res!1015795) b!1493071))

(assert (= (and b!1493071 res!1015793) b!1493086))

(assert (= (and b!1493086 res!1015788) b!1493088))

(assert (= (and b!1493088 c!138178) b!1493081))

(assert (= (and b!1493088 (not c!138178)) b!1493087))

(assert (= (and b!1493088 res!1015787) b!1493082))

(assert (= (and b!1493082 res!1015792) b!1493083))

(assert (= (and b!1493083 res!1015781) b!1493077))

(assert (= (and b!1493077 res!1015789) b!1493079))

(assert (= (and b!1493083 (not res!1015783)) b!1493085))

(declare-fun m!1376319 () Bool)

(assert (=> b!1493085 m!1376319))

(declare-fun m!1376321 () Bool)

(assert (=> b!1493071 m!1376321))

(assert (=> b!1493071 m!1376321))

(declare-fun m!1376323 () Bool)

(assert (=> b!1493071 m!1376323))

(declare-fun m!1376325 () Bool)

(assert (=> b!1493074 m!1376325))

(assert (=> b!1493074 m!1376325))

(declare-fun m!1376327 () Bool)

(assert (=> b!1493074 m!1376327))

(declare-fun m!1376329 () Bool)

(assert (=> b!1493086 m!1376329))

(assert (=> b!1493086 m!1376329))

(declare-fun m!1376331 () Bool)

(assert (=> b!1493086 m!1376331))

(declare-fun m!1376333 () Bool)

(assert (=> b!1493086 m!1376333))

(declare-fun m!1376335 () Bool)

(assert (=> b!1493086 m!1376335))

(assert (=> b!1493077 m!1376321))

(assert (=> b!1493077 m!1376321))

(declare-fun m!1376337 () Bool)

(assert (=> b!1493077 m!1376337))

(assert (=> b!1493075 m!1376321))

(assert (=> b!1493075 m!1376321))

(declare-fun m!1376339 () Bool)

(assert (=> b!1493075 m!1376339))

(assert (=> b!1493075 m!1376339))

(assert (=> b!1493075 m!1376321))

(declare-fun m!1376341 () Bool)

(assert (=> b!1493075 m!1376341))

(declare-fun m!1376343 () Bool)

(assert (=> b!1493080 m!1376343))

(declare-fun m!1376345 () Bool)

(assert (=> b!1493083 m!1376345))

(assert (=> b!1493083 m!1376333))

(declare-fun m!1376347 () Bool)

(assert (=> b!1493083 m!1376347))

(declare-fun m!1376349 () Bool)

(assert (=> b!1493083 m!1376349))

(declare-fun m!1376351 () Bool)

(assert (=> b!1493083 m!1376351))

(assert (=> b!1493083 m!1376321))

(declare-fun m!1376353 () Bool)

(assert (=> start!127040 m!1376353))

(declare-fun m!1376355 () Bool)

(assert (=> start!127040 m!1376355))

(assert (=> b!1493076 m!1376321))

(assert (=> b!1493076 m!1376321))

(declare-fun m!1376357 () Bool)

(assert (=> b!1493076 m!1376357))

(declare-fun m!1376359 () Bool)

(assert (=> b!1493081 m!1376359))

(assert (=> b!1493084 m!1376333))

(declare-fun m!1376361 () Bool)

(assert (=> b!1493084 m!1376361))

(declare-fun m!1376363 () Bool)

(assert (=> b!1493079 m!1376363))

(assert (=> b!1493079 m!1376321))

(declare-fun m!1376365 () Bool)

(assert (=> b!1493087 m!1376365))

(declare-fun m!1376367 () Bool)

(assert (=> b!1493087 m!1376367))

(declare-fun m!1376369 () Bool)

(assert (=> b!1493073 m!1376369))

(check-sat (not b!1493077) (not start!127040) (not b!1493075) (not b!1493087) (not b!1493076) (not b!1493086) (not b!1493081) (not b!1493080) (not b!1493074) (not b!1493085) (not b!1493073) (not b!1493083) (not b!1493071))
(check-sat)
