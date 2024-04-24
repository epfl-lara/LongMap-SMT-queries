; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125166 () Bool)

(assert start!125166)

(declare-fun b!1453533 () Bool)

(declare-fun res!983857 () Bool)

(declare-fun e!818380 () Bool)

(assert (=> b!1453533 (=> (not res!983857) (not e!818380))))

(declare-datatypes ((array!98509 0))(
  ( (array!98510 (arr!47539 (Array (_ BitVec 32) (_ BitVec 64))) (size!48090 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98509)

(declare-datatypes ((List!34027 0))(
  ( (Nil!34024) (Cons!34023 (h!35384 (_ BitVec 64)) (t!48713 List!34027)) )
))
(declare-fun arrayNoDuplicates!0 (array!98509 (_ BitVec 32) List!34027) Bool)

(assert (=> b!1453533 (= res!983857 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34024))))

(declare-fun b!1453534 () Bool)

(declare-fun res!983854 () Bool)

(assert (=> b!1453534 (=> (not res!983854) (not e!818380))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98509 (_ BitVec 32)) Bool)

(assert (=> b!1453534 (= res!983854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453535 () Bool)

(declare-fun res!983858 () Bool)

(assert (=> b!1453535 (=> (not res!983858) (not e!818380))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453535 (= res!983858 (and (= (size!48090 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48090 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48090 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818379 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1453536 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453536 (= e!818379 (and (or (= (select (arr!47539 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47539 a!2862) intermediateBeforeIndex!19) (select (arr!47539 a!2862) j!93))) (or (and (= (select (arr!47539 a!2862) index!646) (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47539 a!2862) index!646) (select (arr!47539 a!2862) j!93))) (= (select (arr!47539 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!637356 () (_ BitVec 64))

(declare-fun e!818382 () Bool)

(declare-fun lt!637357 () array!98509)

(declare-fun b!1453537 () Bool)

(declare-datatypes ((SeekEntryResult!11688 0))(
  ( (MissingZero!11688 (index!49144 (_ BitVec 32))) (Found!11688 (index!49145 (_ BitVec 32))) (Intermediate!11688 (undefined!12500 Bool) (index!49146 (_ BitVec 32)) (x!130969 (_ BitVec 32))) (Undefined!11688) (MissingVacant!11688 (index!49147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98509 (_ BitVec 32)) SeekEntryResult!11688)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98509 (_ BitVec 32)) SeekEntryResult!11688)

(assert (=> b!1453537 (= e!818382 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637356 lt!637357 mask!2687) (seekEntryOrOpen!0 lt!637356 lt!637357 mask!2687)))))

(declare-fun b!1453538 () Bool)

(declare-fun res!983867 () Bool)

(declare-fun e!818376 () Bool)

(assert (=> b!1453538 (=> (not res!983867) (not e!818376))))

(assert (=> b!1453538 (= res!983867 e!818382)))

(declare-fun c!134359 () Bool)

(assert (=> b!1453538 (= c!134359 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453539 () Bool)

(declare-fun lt!637354 () SeekEntryResult!11688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98509 (_ BitVec 32)) SeekEntryResult!11688)

(assert (=> b!1453539 (= e!818382 (= lt!637354 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637356 lt!637357 mask!2687)))))

(declare-fun b!1453540 () Bool)

(declare-fun e!818381 () Bool)

(assert (=> b!1453540 (= e!818380 e!818381)))

(declare-fun res!983856 () Bool)

(assert (=> b!1453540 (=> (not res!983856) (not e!818381))))

(assert (=> b!1453540 (= res!983856 (= (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453540 (= lt!637357 (array!98510 (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48090 a!2862)))))

(declare-fun b!1453541 () Bool)

(declare-fun res!983862 () Bool)

(declare-fun e!818377 () Bool)

(assert (=> b!1453541 (=> (not res!983862) (not e!818377))))

(declare-fun lt!637353 () SeekEntryResult!11688)

(assert (=> b!1453541 (= res!983862 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!637353))))

(declare-fun b!1453542 () Bool)

(declare-fun res!983860 () Bool)

(assert (=> b!1453542 (=> (not res!983860) (not e!818376))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453542 (= res!983860 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453543 () Bool)

(declare-fun res!983866 () Bool)

(assert (=> b!1453543 (=> (not res!983866) (not e!818380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453543 (= res!983866 (validKeyInArray!0 (select (arr!47539 a!2862) j!93)))))

(declare-fun b!1453544 () Bool)

(declare-fun res!983853 () Bool)

(assert (=> b!1453544 (=> (not res!983853) (not e!818380))))

(assert (=> b!1453544 (= res!983853 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48090 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48090 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48090 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453545 () Bool)

(assert (=> b!1453545 (= e!818377 e!818376)))

(declare-fun res!983864 () Bool)

(assert (=> b!1453545 (=> (not res!983864) (not e!818376))))

(assert (=> b!1453545 (= res!983864 (= lt!637354 (Intermediate!11688 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453545 (= lt!637354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637356 mask!2687) lt!637356 lt!637357 mask!2687))))

(assert (=> b!1453545 (= lt!637356 (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!983863 () Bool)

(assert (=> start!125166 (=> (not res!983863) (not e!818380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125166 (= res!983863 (validMask!0 mask!2687))))

(assert (=> start!125166 e!818380))

(assert (=> start!125166 true))

(declare-fun array_inv!36820 (array!98509) Bool)

(assert (=> start!125166 (array_inv!36820 a!2862)))

(declare-fun b!1453546 () Bool)

(declare-fun res!983865 () Bool)

(assert (=> b!1453546 (=> (not res!983865) (not e!818379))))

(assert (=> b!1453546 (= res!983865 (= (seekEntryOrOpen!0 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) (Found!11688 j!93)))))

(declare-fun b!1453547 () Bool)

(assert (=> b!1453547 (= e!818376 (not (or (and (= (select (arr!47539 a!2862) index!646) (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47539 a!2862) index!646) (select (arr!47539 a!2862) j!93))) (= (select (arr!47539 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1453547 e!818379))

(declare-fun res!983855 () Bool)

(assert (=> b!1453547 (=> (not res!983855) (not e!818379))))

(assert (=> b!1453547 (= res!983855 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48905 0))(
  ( (Unit!48906) )
))
(declare-fun lt!637355 () Unit!48905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48905)

(assert (=> b!1453547 (= lt!637355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453548 () Bool)

(assert (=> b!1453548 (= e!818381 e!818377)))

(declare-fun res!983859 () Bool)

(assert (=> b!1453548 (=> (not res!983859) (not e!818377))))

(assert (=> b!1453548 (= res!983859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47539 a!2862) j!93) mask!2687) (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!637353))))

(assert (=> b!1453548 (= lt!637353 (Intermediate!11688 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453549 () Bool)

(declare-fun res!983861 () Bool)

(assert (=> b!1453549 (=> (not res!983861) (not e!818380))))

(assert (=> b!1453549 (= res!983861 (validKeyInArray!0 (select (arr!47539 a!2862) i!1006)))))

(assert (= (and start!125166 res!983863) b!1453535))

(assert (= (and b!1453535 res!983858) b!1453549))

(assert (= (and b!1453549 res!983861) b!1453543))

(assert (= (and b!1453543 res!983866) b!1453534))

(assert (= (and b!1453534 res!983854) b!1453533))

(assert (= (and b!1453533 res!983857) b!1453544))

(assert (= (and b!1453544 res!983853) b!1453540))

(assert (= (and b!1453540 res!983856) b!1453548))

(assert (= (and b!1453548 res!983859) b!1453541))

(assert (= (and b!1453541 res!983862) b!1453545))

(assert (= (and b!1453545 res!983864) b!1453538))

(assert (= (and b!1453538 c!134359) b!1453539))

(assert (= (and b!1453538 (not c!134359)) b!1453537))

(assert (= (and b!1453538 res!983867) b!1453542))

(assert (= (and b!1453542 res!983860) b!1453547))

(assert (= (and b!1453547 res!983855) b!1453546))

(assert (= (and b!1453546 res!983865) b!1453536))

(declare-fun m!1342225 () Bool)

(assert (=> b!1453534 m!1342225))

(declare-fun m!1342227 () Bool)

(assert (=> b!1453546 m!1342227))

(assert (=> b!1453546 m!1342227))

(declare-fun m!1342229 () Bool)

(assert (=> b!1453546 m!1342229))

(declare-fun m!1342231 () Bool)

(assert (=> start!125166 m!1342231))

(declare-fun m!1342233 () Bool)

(assert (=> start!125166 m!1342233))

(declare-fun m!1342235 () Bool)

(assert (=> b!1453537 m!1342235))

(declare-fun m!1342237 () Bool)

(assert (=> b!1453537 m!1342237))

(assert (=> b!1453541 m!1342227))

(assert (=> b!1453541 m!1342227))

(declare-fun m!1342239 () Bool)

(assert (=> b!1453541 m!1342239))

(assert (=> b!1453543 m!1342227))

(assert (=> b!1453543 m!1342227))

(declare-fun m!1342241 () Bool)

(assert (=> b!1453543 m!1342241))

(declare-fun m!1342243 () Bool)

(assert (=> b!1453539 m!1342243))

(assert (=> b!1453548 m!1342227))

(assert (=> b!1453548 m!1342227))

(declare-fun m!1342245 () Bool)

(assert (=> b!1453548 m!1342245))

(assert (=> b!1453548 m!1342245))

(assert (=> b!1453548 m!1342227))

(declare-fun m!1342247 () Bool)

(assert (=> b!1453548 m!1342247))

(declare-fun m!1342249 () Bool)

(assert (=> b!1453536 m!1342249))

(declare-fun m!1342251 () Bool)

(assert (=> b!1453536 m!1342251))

(declare-fun m!1342253 () Bool)

(assert (=> b!1453536 m!1342253))

(declare-fun m!1342255 () Bool)

(assert (=> b!1453536 m!1342255))

(assert (=> b!1453536 m!1342227))

(declare-fun m!1342257 () Bool)

(assert (=> b!1453545 m!1342257))

(assert (=> b!1453545 m!1342257))

(declare-fun m!1342259 () Bool)

(assert (=> b!1453545 m!1342259))

(assert (=> b!1453545 m!1342249))

(declare-fun m!1342261 () Bool)

(assert (=> b!1453545 m!1342261))

(declare-fun m!1342263 () Bool)

(assert (=> b!1453549 m!1342263))

(assert (=> b!1453549 m!1342263))

(declare-fun m!1342265 () Bool)

(assert (=> b!1453549 m!1342265))

(declare-fun m!1342267 () Bool)

(assert (=> b!1453533 m!1342267))

(declare-fun m!1342269 () Bool)

(assert (=> b!1453547 m!1342269))

(assert (=> b!1453547 m!1342249))

(assert (=> b!1453547 m!1342253))

(assert (=> b!1453547 m!1342255))

(declare-fun m!1342271 () Bool)

(assert (=> b!1453547 m!1342271))

(assert (=> b!1453547 m!1342227))

(assert (=> b!1453540 m!1342249))

(declare-fun m!1342273 () Bool)

(assert (=> b!1453540 m!1342273))

(check-sat (not b!1453548) (not b!1453539) (not b!1453545) (not b!1453549) (not b!1453537) (not b!1453533) (not b!1453543) (not start!125166) (not b!1453534) (not b!1453546) (not b!1453541) (not b!1453547))
(check-sat)
