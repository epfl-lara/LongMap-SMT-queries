; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124346 () Bool)

(assert start!124346)

(declare-fun b!1438288 () Bool)

(declare-fun res!970348 () Bool)

(declare-fun e!811640 () Bool)

(assert (=> b!1438288 (=> (not res!970348) (not e!811640))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97845 0))(
  ( (array!97846 (arr!47213 (Array (_ BitVec 32) (_ BitVec 64))) (size!47764 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97845)

(assert (=> b!1438288 (= res!970348 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47764 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47764 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47764 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47213 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438289 () Bool)

(declare-fun res!970346 () Bool)

(assert (=> b!1438289 (=> (not res!970346) (not e!811640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438289 (= res!970346 (validKeyInArray!0 (select (arr!47213 a!2862) i!1006)))))

(declare-fun b!1438290 () Bool)

(declare-fun res!970349 () Bool)

(assert (=> b!1438290 (=> (not res!970349) (not e!811640))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1438290 (= res!970349 (validKeyInArray!0 (select (arr!47213 a!2862) j!93)))))

(declare-fun res!970351 () Bool)

(assert (=> start!124346 (=> (not res!970351) (not e!811640))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124346 (= res!970351 (validMask!0 mask!2687))))

(assert (=> start!124346 e!811640))

(assert (=> start!124346 true))

(declare-fun array_inv!36494 (array!97845) Bool)

(assert (=> start!124346 (array_inv!36494 a!2862)))

(declare-fun b!1438291 () Bool)

(declare-fun res!970352 () Bool)

(assert (=> b!1438291 (=> (not res!970352) (not e!811640))))

(declare-datatypes ((List!33701 0))(
  ( (Nil!33698) (Cons!33697 (h!35046 (_ BitVec 64)) (t!48387 List!33701)) )
))
(declare-fun arrayNoDuplicates!0 (array!97845 (_ BitVec 32) List!33701) Bool)

(assert (=> b!1438291 (= res!970352 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33698))))

(declare-fun b!1438292 () Bool)

(declare-fun res!970350 () Bool)

(assert (=> b!1438292 (=> (not res!970350) (not e!811640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97845 (_ BitVec 32)) Bool)

(assert (=> b!1438292 (= res!970350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438293 () Bool)

(assert (=> b!1438293 (= e!811640 false)))

(declare-datatypes ((SeekEntryResult!11362 0))(
  ( (MissingZero!11362 (index!47840 (_ BitVec 32))) (Found!11362 (index!47841 (_ BitVec 32))) (Intermediate!11362 (undefined!12174 Bool) (index!47842 (_ BitVec 32)) (x!129747 (_ BitVec 32))) (Undefined!11362) (MissingVacant!11362 (index!47843 (_ BitVec 32))) )
))
(declare-fun lt!632704 () SeekEntryResult!11362)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97845 (_ BitVec 32)) SeekEntryResult!11362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438293 (= lt!632704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47213 a!2862) j!93) mask!2687) (select (arr!47213 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438294 () Bool)

(declare-fun res!970347 () Bool)

(assert (=> b!1438294 (=> (not res!970347) (not e!811640))))

(assert (=> b!1438294 (= res!970347 (and (= (size!47764 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47764 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47764 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124346 res!970351) b!1438294))

(assert (= (and b!1438294 res!970347) b!1438289))

(assert (= (and b!1438289 res!970346) b!1438290))

(assert (= (and b!1438290 res!970349) b!1438292))

(assert (= (and b!1438292 res!970350) b!1438291))

(assert (= (and b!1438291 res!970352) b!1438288))

(assert (= (and b!1438288 res!970348) b!1438293))

(declare-fun m!1327705 () Bool)

(assert (=> b!1438288 m!1327705))

(declare-fun m!1327707 () Bool)

(assert (=> b!1438288 m!1327707))

(declare-fun m!1327709 () Bool)

(assert (=> b!1438292 m!1327709))

(declare-fun m!1327711 () Bool)

(assert (=> start!124346 m!1327711))

(declare-fun m!1327713 () Bool)

(assert (=> start!124346 m!1327713))

(declare-fun m!1327715 () Bool)

(assert (=> b!1438293 m!1327715))

(assert (=> b!1438293 m!1327715))

(declare-fun m!1327717 () Bool)

(assert (=> b!1438293 m!1327717))

(assert (=> b!1438293 m!1327717))

(assert (=> b!1438293 m!1327715))

(declare-fun m!1327719 () Bool)

(assert (=> b!1438293 m!1327719))

(declare-fun m!1327721 () Bool)

(assert (=> b!1438289 m!1327721))

(assert (=> b!1438289 m!1327721))

(declare-fun m!1327723 () Bool)

(assert (=> b!1438289 m!1327723))

(declare-fun m!1327725 () Bool)

(assert (=> b!1438291 m!1327725))

(assert (=> b!1438290 m!1327715))

(assert (=> b!1438290 m!1327715))

(declare-fun m!1327727 () Bool)

(assert (=> b!1438290 m!1327727))

(push 1)

(assert (not b!1438291))

(assert (not b!1438289))

(assert (not b!1438293))

(assert (not b!1438292))

(assert (not start!124346))

(assert (not b!1438290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

