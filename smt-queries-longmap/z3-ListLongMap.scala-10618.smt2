; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124816 () Bool)

(assert start!124816)

(declare-fun b!1449144 () Bool)

(declare-fun e!816070 () Bool)

(declare-fun e!816078 () Bool)

(assert (=> b!1449144 (= e!816070 (not e!816078))))

(declare-fun res!980718 () Bool)

(assert (=> b!1449144 (=> res!980718 e!816078)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98242 0))(
  ( (array!98243 (arr!47410 (Array (_ BitVec 32) (_ BitVec 64))) (size!47962 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98242)

(assert (=> b!1449144 (= res!980718 (or (and (= (select (arr!47410 a!2862) index!646) (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47410 a!2862) index!646) (select (arr!47410 a!2862) j!93))) (not (= (select (arr!47410 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816075 () Bool)

(assert (=> b!1449144 e!816075))

(declare-fun res!980723 () Bool)

(assert (=> b!1449144 (=> (not res!980723) (not e!816075))))

(declare-datatypes ((SeekEntryResult!11687 0))(
  ( (MissingZero!11687 (index!49140 (_ BitVec 32))) (Found!11687 (index!49141 (_ BitVec 32))) (Intermediate!11687 (undefined!12499 Bool) (index!49142 (_ BitVec 32)) (x!130803 (_ BitVec 32))) (Undefined!11687) (MissingVacant!11687 (index!49143 (_ BitVec 32))) )
))
(declare-fun lt!635633 () SeekEntryResult!11687)

(assert (=> b!1449144 (= res!980723 (and (= lt!635633 (Found!11687 j!93)) (or (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) (select (arr!47410 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98242 (_ BitVec 32)) SeekEntryResult!11687)

(assert (=> b!1449144 (= lt!635633 (seekEntryOrOpen!0 (select (arr!47410 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98242 (_ BitVec 32)) Bool)

(assert (=> b!1449144 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48711 0))(
  ( (Unit!48712) )
))
(declare-fun lt!635629 () Unit!48711)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48711)

(assert (=> b!1449144 (= lt!635629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449145 () Bool)

(declare-fun res!980721 () Bool)

(declare-fun e!816069 () Bool)

(assert (=> b!1449145 (=> (not res!980721) (not e!816069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449145 (= res!980721 (validKeyInArray!0 (select (arr!47410 a!2862) i!1006)))))

(declare-fun lt!635632 () array!98242)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635631 () (_ BitVec 64))

(declare-fun b!1449146 () Bool)

(declare-fun lt!635628 () SeekEntryResult!11687)

(declare-fun e!816071 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98242 (_ BitVec 32)) SeekEntryResult!11687)

(assert (=> b!1449146 (= e!816071 (= lt!635628 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635631 lt!635632 mask!2687)))))

(declare-fun b!1449147 () Bool)

(declare-fun e!816072 () Bool)

(assert (=> b!1449147 (= e!816075 e!816072)))

(declare-fun res!980719 () Bool)

(assert (=> b!1449147 (=> res!980719 e!816072)))

(assert (=> b!1449147 (= res!980719 (or (and (= (select (arr!47410 a!2862) index!646) (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47410 a!2862) index!646) (select (arr!47410 a!2862) j!93))) (not (= (select (arr!47410 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449148 () Bool)

(declare-fun e!816077 () Bool)

(declare-fun e!816074 () Bool)

(assert (=> b!1449148 (= e!816077 e!816074)))

(declare-fun res!980717 () Bool)

(assert (=> b!1449148 (=> (not res!980717) (not e!816074))))

(declare-fun lt!635634 () SeekEntryResult!11687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449148 (= res!980717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47410 a!2862) j!93) mask!2687) (select (arr!47410 a!2862) j!93) a!2862 mask!2687) lt!635634))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449148 (= lt!635634 (Intermediate!11687 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449149 () Bool)

(declare-fun res!980727 () Bool)

(assert (=> b!1449149 (=> (not res!980727) (not e!816069))))

(assert (=> b!1449149 (= res!980727 (and (= (size!47962 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47962 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47962 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449150 () Bool)

(declare-fun res!980712 () Bool)

(assert (=> b!1449150 (=> (not res!980712) (not e!816069))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449150 (= res!980712 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47962 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47962 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47962 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449151 () Bool)

(declare-fun res!980715 () Bool)

(assert (=> b!1449151 (=> (not res!980715) (not e!816069))))

(assert (=> b!1449151 (= res!980715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449152 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98242 (_ BitVec 32)) SeekEntryResult!11687)

(assert (=> b!1449152 (= e!816071 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635631 lt!635632 mask!2687) (seekEntryOrOpen!0 lt!635631 lt!635632 mask!2687)))))

(declare-fun b!1449153 () Bool)

(assert (=> b!1449153 (= e!816078 true)))

(declare-fun lt!635630 () SeekEntryResult!11687)

(assert (=> b!1449153 (= lt!635630 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47410 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449154 () Bool)

(declare-fun res!980728 () Bool)

(assert (=> b!1449154 (=> (not res!980728) (not e!816070))))

(assert (=> b!1449154 (= res!980728 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449155 () Bool)

(declare-fun res!980726 () Bool)

(assert (=> b!1449155 (=> (not res!980726) (not e!816069))))

(declare-datatypes ((List!33989 0))(
  ( (Nil!33986) (Cons!33985 (h!35335 (_ BitVec 64)) (t!48675 List!33989)) )
))
(declare-fun arrayNoDuplicates!0 (array!98242 (_ BitVec 32) List!33989) Bool)

(assert (=> b!1449155 (= res!980726 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33986))))

(declare-fun b!1449156 () Bool)

(assert (=> b!1449156 (= e!816074 e!816070)))

(declare-fun res!980716 () Bool)

(assert (=> b!1449156 (=> (not res!980716) (not e!816070))))

(assert (=> b!1449156 (= res!980716 (= lt!635628 (Intermediate!11687 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449156 (= lt!635628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635631 mask!2687) lt!635631 lt!635632 mask!2687))))

(assert (=> b!1449156 (= lt!635631 (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449157 () Bool)

(declare-fun res!980720 () Bool)

(assert (=> b!1449157 (=> (not res!980720) (not e!816074))))

(assert (=> b!1449157 (= res!980720 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47410 a!2862) j!93) a!2862 mask!2687) lt!635634))))

(declare-fun b!1449158 () Bool)

(declare-fun e!816076 () Bool)

(assert (=> b!1449158 (= e!816072 e!816076)))

(declare-fun res!980714 () Bool)

(assert (=> b!1449158 (=> (not res!980714) (not e!816076))))

(assert (=> b!1449158 (= res!980714 (= lt!635633 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47410 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449159 () Bool)

(declare-fun res!980713 () Bool)

(assert (=> b!1449159 (=> (not res!980713) (not e!816069))))

(assert (=> b!1449159 (= res!980713 (validKeyInArray!0 (select (arr!47410 a!2862) j!93)))))

(declare-fun b!1449160 () Bool)

(assert (=> b!1449160 (= e!816069 e!816077)))

(declare-fun res!980722 () Bool)

(assert (=> b!1449160 (=> (not res!980722) (not e!816077))))

(assert (=> b!1449160 (= res!980722 (= (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449160 (= lt!635632 (array!98243 (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47962 a!2862)))))

(declare-fun res!980725 () Bool)

(assert (=> start!124816 (=> (not res!980725) (not e!816069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124816 (= res!980725 (validMask!0 mask!2687))))

(assert (=> start!124816 e!816069))

(assert (=> start!124816 true))

(declare-fun array_inv!36643 (array!98242) Bool)

(assert (=> start!124816 (array_inv!36643 a!2862)))

(declare-fun b!1449161 () Bool)

(declare-fun res!980724 () Bool)

(assert (=> b!1449161 (=> (not res!980724) (not e!816070))))

(assert (=> b!1449161 (= res!980724 e!816071)))

(declare-fun c!133729 () Bool)

(assert (=> b!1449161 (= c!133729 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449162 () Bool)

(assert (=> b!1449162 (= e!816076 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124816 res!980725) b!1449149))

(assert (= (and b!1449149 res!980727) b!1449145))

(assert (= (and b!1449145 res!980721) b!1449159))

(assert (= (and b!1449159 res!980713) b!1449151))

(assert (= (and b!1449151 res!980715) b!1449155))

(assert (= (and b!1449155 res!980726) b!1449150))

(assert (= (and b!1449150 res!980712) b!1449160))

(assert (= (and b!1449160 res!980722) b!1449148))

(assert (= (and b!1449148 res!980717) b!1449157))

(assert (= (and b!1449157 res!980720) b!1449156))

(assert (= (and b!1449156 res!980716) b!1449161))

(assert (= (and b!1449161 c!133729) b!1449146))

(assert (= (and b!1449161 (not c!133729)) b!1449152))

(assert (= (and b!1449161 res!980724) b!1449154))

(assert (= (and b!1449154 res!980728) b!1449144))

(assert (= (and b!1449144 res!980723) b!1449147))

(assert (= (and b!1449147 (not res!980719)) b!1449158))

(assert (= (and b!1449158 res!980714) b!1449162))

(assert (= (and b!1449144 (not res!980718)) b!1449153))

(declare-fun m!1337379 () Bool)

(assert (=> b!1449160 m!1337379))

(declare-fun m!1337381 () Bool)

(assert (=> b!1449160 m!1337381))

(declare-fun m!1337383 () Bool)

(assert (=> b!1449148 m!1337383))

(assert (=> b!1449148 m!1337383))

(declare-fun m!1337385 () Bool)

(assert (=> b!1449148 m!1337385))

(assert (=> b!1449148 m!1337385))

(assert (=> b!1449148 m!1337383))

(declare-fun m!1337387 () Bool)

(assert (=> b!1449148 m!1337387))

(assert (=> b!1449153 m!1337383))

(assert (=> b!1449153 m!1337383))

(declare-fun m!1337389 () Bool)

(assert (=> b!1449153 m!1337389))

(declare-fun m!1337391 () Bool)

(assert (=> b!1449156 m!1337391))

(assert (=> b!1449156 m!1337391))

(declare-fun m!1337393 () Bool)

(assert (=> b!1449156 m!1337393))

(assert (=> b!1449156 m!1337379))

(declare-fun m!1337395 () Bool)

(assert (=> b!1449156 m!1337395))

(declare-fun m!1337397 () Bool)

(assert (=> b!1449155 m!1337397))

(assert (=> b!1449158 m!1337383))

(assert (=> b!1449158 m!1337383))

(declare-fun m!1337399 () Bool)

(assert (=> b!1449158 m!1337399))

(declare-fun m!1337401 () Bool)

(assert (=> b!1449146 m!1337401))

(declare-fun m!1337403 () Bool)

(assert (=> b!1449147 m!1337403))

(assert (=> b!1449147 m!1337379))

(declare-fun m!1337405 () Bool)

(assert (=> b!1449147 m!1337405))

(assert (=> b!1449147 m!1337383))

(declare-fun m!1337407 () Bool)

(assert (=> start!124816 m!1337407))

(declare-fun m!1337409 () Bool)

(assert (=> start!124816 m!1337409))

(declare-fun m!1337411 () Bool)

(assert (=> b!1449145 m!1337411))

(assert (=> b!1449145 m!1337411))

(declare-fun m!1337413 () Bool)

(assert (=> b!1449145 m!1337413))

(declare-fun m!1337415 () Bool)

(assert (=> b!1449152 m!1337415))

(declare-fun m!1337417 () Bool)

(assert (=> b!1449152 m!1337417))

(declare-fun m!1337419 () Bool)

(assert (=> b!1449144 m!1337419))

(assert (=> b!1449144 m!1337379))

(declare-fun m!1337421 () Bool)

(assert (=> b!1449144 m!1337421))

(assert (=> b!1449144 m!1337405))

(assert (=> b!1449144 m!1337403))

(assert (=> b!1449144 m!1337383))

(declare-fun m!1337423 () Bool)

(assert (=> b!1449144 m!1337423))

(declare-fun m!1337425 () Bool)

(assert (=> b!1449144 m!1337425))

(assert (=> b!1449144 m!1337383))

(assert (=> b!1449157 m!1337383))

(assert (=> b!1449157 m!1337383))

(declare-fun m!1337427 () Bool)

(assert (=> b!1449157 m!1337427))

(assert (=> b!1449159 m!1337383))

(assert (=> b!1449159 m!1337383))

(declare-fun m!1337429 () Bool)

(assert (=> b!1449159 m!1337429))

(declare-fun m!1337431 () Bool)

(assert (=> b!1449151 m!1337431))

(check-sat (not b!1449156) (not b!1449151) (not b!1449146) (not b!1449152) (not b!1449148) (not b!1449155) (not b!1449144) (not b!1449159) (not b!1449157) (not b!1449145) (not b!1449153) (not start!124816) (not b!1449158))
(check-sat)
