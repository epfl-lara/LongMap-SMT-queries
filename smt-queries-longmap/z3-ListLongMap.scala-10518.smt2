; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124044 () Bool)

(assert start!124044)

(declare-fun b!1436367 () Bool)

(declare-fun res!969286 () Bool)

(declare-fun e!810595 () Bool)

(assert (=> b!1436367 (=> (not res!969286) (not e!810595))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97681 0))(
  ( (array!97682 (arr!47136 (Array (_ BitVec 32) (_ BitVec 64))) (size!47686 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97681)

(assert (=> b!1436367 (= res!969286 (and (= (size!47686 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47686 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47686 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436368 () Bool)

(assert (=> b!1436368 (= e!810595 false)))

(declare-fun lt!632118 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436368 (= lt!632118 (toIndex!0 (select (arr!47136 a!2862) j!93) mask!2687))))

(declare-fun b!1436370 () Bool)

(declare-fun res!969288 () Bool)

(assert (=> b!1436370 (=> (not res!969288) (not e!810595))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1436370 (= res!969288 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47686 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47686 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47686 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436371 () Bool)

(declare-fun res!969285 () Bool)

(assert (=> b!1436371 (=> (not res!969285) (not e!810595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436371 (= res!969285 (validKeyInArray!0 (select (arr!47136 a!2862) i!1006)))))

(declare-fun b!1436372 () Bool)

(declare-fun res!969287 () Bool)

(assert (=> b!1436372 (=> (not res!969287) (not e!810595))))

(assert (=> b!1436372 (= res!969287 (validKeyInArray!0 (select (arr!47136 a!2862) j!93)))))

(declare-fun b!1436373 () Bool)

(declare-fun res!969283 () Bool)

(assert (=> b!1436373 (=> (not res!969283) (not e!810595))))

(declare-datatypes ((List!33637 0))(
  ( (Nil!33634) (Cons!33633 (h!34968 (_ BitVec 64)) (t!48331 List!33637)) )
))
(declare-fun arrayNoDuplicates!0 (array!97681 (_ BitVec 32) List!33637) Bool)

(assert (=> b!1436373 (= res!969283 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33634))))

(declare-fun b!1436369 () Bool)

(declare-fun res!969284 () Bool)

(assert (=> b!1436369 (=> (not res!969284) (not e!810595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97681 (_ BitVec 32)) Bool)

(assert (=> b!1436369 (= res!969284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969289 () Bool)

(assert (=> start!124044 (=> (not res!969289) (not e!810595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124044 (= res!969289 (validMask!0 mask!2687))))

(assert (=> start!124044 e!810595))

(assert (=> start!124044 true))

(declare-fun array_inv!36164 (array!97681) Bool)

(assert (=> start!124044 (array_inv!36164 a!2862)))

(assert (= (and start!124044 res!969289) b!1436367))

(assert (= (and b!1436367 res!969286) b!1436371))

(assert (= (and b!1436371 res!969285) b!1436372))

(assert (= (and b!1436372 res!969287) b!1436369))

(assert (= (and b!1436369 res!969284) b!1436373))

(assert (= (and b!1436373 res!969283) b!1436370))

(assert (= (and b!1436370 res!969288) b!1436368))

(declare-fun m!1325675 () Bool)

(assert (=> start!124044 m!1325675))

(declare-fun m!1325677 () Bool)

(assert (=> start!124044 m!1325677))

(declare-fun m!1325679 () Bool)

(assert (=> b!1436368 m!1325679))

(assert (=> b!1436368 m!1325679))

(declare-fun m!1325681 () Bool)

(assert (=> b!1436368 m!1325681))

(declare-fun m!1325683 () Bool)

(assert (=> b!1436369 m!1325683))

(assert (=> b!1436372 m!1325679))

(assert (=> b!1436372 m!1325679))

(declare-fun m!1325685 () Bool)

(assert (=> b!1436372 m!1325685))

(declare-fun m!1325687 () Bool)

(assert (=> b!1436370 m!1325687))

(declare-fun m!1325689 () Bool)

(assert (=> b!1436370 m!1325689))

(declare-fun m!1325691 () Bool)

(assert (=> b!1436373 m!1325691))

(declare-fun m!1325693 () Bool)

(assert (=> b!1436371 m!1325693))

(assert (=> b!1436371 m!1325693))

(declare-fun m!1325695 () Bool)

(assert (=> b!1436371 m!1325695))

(check-sat (not b!1436371) (not b!1436372) (not b!1436369) (not b!1436368) (not b!1436373) (not start!124044))
