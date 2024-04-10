; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124046 () Bool)

(assert start!124046)

(declare-fun b!1436389 () Bool)

(declare-fun res!969305 () Bool)

(declare-fun e!810601 () Bool)

(assert (=> b!1436389 (=> (not res!969305) (not e!810601))))

(declare-datatypes ((array!97683 0))(
  ( (array!97684 (arr!47137 (Array (_ BitVec 32) (_ BitVec 64))) (size!47687 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97683)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436389 (= res!969305 (validKeyInArray!0 (select (arr!47137 a!2862) j!93)))))

(declare-fun b!1436390 () Bool)

(declare-fun res!969308 () Bool)

(assert (=> b!1436390 (=> (not res!969308) (not e!810601))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436390 (= res!969308 (validKeyInArray!0 (select (arr!47137 a!2862) i!1006)))))

(declare-fun b!1436391 () Bool)

(assert (=> b!1436391 (= e!810601 false)))

(declare-fun lt!632121 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436391 (= lt!632121 (toIndex!0 (select (arr!47137 a!2862) j!93) mask!2687))))

(declare-fun b!1436392 () Bool)

(declare-fun res!969307 () Bool)

(assert (=> b!1436392 (=> (not res!969307) (not e!810601))))

(assert (=> b!1436392 (= res!969307 (and (= (size!47687 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47687 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47687 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436393 () Bool)

(declare-fun res!969306 () Bool)

(assert (=> b!1436393 (=> (not res!969306) (not e!810601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97683 (_ BitVec 32)) Bool)

(assert (=> b!1436393 (= res!969306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436394 () Bool)

(declare-fun res!969304 () Bool)

(assert (=> b!1436394 (=> (not res!969304) (not e!810601))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1436394 (= res!969304 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47687 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47687 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47687 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47137 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436388 () Bool)

(declare-fun res!969310 () Bool)

(assert (=> b!1436388 (=> (not res!969310) (not e!810601))))

(declare-datatypes ((List!33638 0))(
  ( (Nil!33635) (Cons!33634 (h!34969 (_ BitVec 64)) (t!48332 List!33638)) )
))
(declare-fun arrayNoDuplicates!0 (array!97683 (_ BitVec 32) List!33638) Bool)

(assert (=> b!1436388 (= res!969310 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33635))))

(declare-fun res!969309 () Bool)

(assert (=> start!124046 (=> (not res!969309) (not e!810601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124046 (= res!969309 (validMask!0 mask!2687))))

(assert (=> start!124046 e!810601))

(assert (=> start!124046 true))

(declare-fun array_inv!36165 (array!97683) Bool)

(assert (=> start!124046 (array_inv!36165 a!2862)))

(assert (= (and start!124046 res!969309) b!1436392))

(assert (= (and b!1436392 res!969307) b!1436390))

(assert (= (and b!1436390 res!969308) b!1436389))

(assert (= (and b!1436389 res!969305) b!1436393))

(assert (= (and b!1436393 res!969306) b!1436388))

(assert (= (and b!1436388 res!969310) b!1436394))

(assert (= (and b!1436394 res!969304) b!1436391))

(declare-fun m!1325697 () Bool)

(assert (=> b!1436388 m!1325697))

(declare-fun m!1325699 () Bool)

(assert (=> start!124046 m!1325699))

(declare-fun m!1325701 () Bool)

(assert (=> start!124046 m!1325701))

(declare-fun m!1325703 () Bool)

(assert (=> b!1436393 m!1325703))

(declare-fun m!1325705 () Bool)

(assert (=> b!1436389 m!1325705))

(assert (=> b!1436389 m!1325705))

(declare-fun m!1325707 () Bool)

(assert (=> b!1436389 m!1325707))

(assert (=> b!1436391 m!1325705))

(assert (=> b!1436391 m!1325705))

(declare-fun m!1325709 () Bool)

(assert (=> b!1436391 m!1325709))

(declare-fun m!1325711 () Bool)

(assert (=> b!1436390 m!1325711))

(assert (=> b!1436390 m!1325711))

(declare-fun m!1325713 () Bool)

(assert (=> b!1436390 m!1325713))

(declare-fun m!1325715 () Bool)

(assert (=> b!1436394 m!1325715))

(declare-fun m!1325717 () Bool)

(assert (=> b!1436394 m!1325717))

(push 1)

(assert (not b!1436391))

(assert (not b!1436390))

(assert (not b!1436388))

(assert (not b!1436393))

(assert (not b!1436389))

(assert (not start!124046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

