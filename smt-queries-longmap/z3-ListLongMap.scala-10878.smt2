; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127484 () Bool)

(assert start!127484)

(declare-fun b!1497974 () Bool)

(declare-fun res!1019243 () Bool)

(declare-fun e!838769 () Bool)

(assert (=> b!1497974 (=> (not res!1019243) (not e!838769))))

(declare-datatypes ((array!99859 0))(
  ( (array!99860 (arr!48190 (Array (_ BitVec 32) (_ BitVec 64))) (size!48742 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99859)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497974 (= res!1019243 (validKeyInArray!0 (select (arr!48190 a!2850) j!87)))))

(declare-fun b!1497975 () Bool)

(declare-fun res!1019240 () Bool)

(assert (=> b!1497975 (=> (not res!1019240) (not e!838769))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497975 (= res!1019240 (and (= (size!48742 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48742 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48742 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497976 () Bool)

(declare-fun res!1019238 () Bool)

(assert (=> b!1497976 (=> (not res!1019238) (not e!838769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99859 (_ BitVec 32)) Bool)

(assert (=> b!1497976 (= res!1019238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1497977 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1497977 (= e!838769 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48742 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48742 a!2850)) (= (select (arr!48190 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48190 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48742 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantBefore!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun res!1019242 () Bool)

(assert (=> start!127484 (=> (not res!1019242) (not e!838769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127484 (= res!1019242 (validMask!0 mask!2661))))

(assert (=> start!127484 e!838769))

(assert (=> start!127484 true))

(declare-fun array_inv!37423 (array!99859) Bool)

(assert (=> start!127484 (array_inv!37423 a!2850)))

(declare-fun b!1497978 () Bool)

(declare-fun res!1019241 () Bool)

(assert (=> b!1497978 (=> (not res!1019241) (not e!838769))))

(declare-datatypes ((List!34760 0))(
  ( (Nil!34757) (Cons!34756 (h!36154 (_ BitVec 64)) (t!49446 List!34760)) )
))
(declare-fun arrayNoDuplicates!0 (array!99859 (_ BitVec 32) List!34760) Bool)

(assert (=> b!1497978 (= res!1019241 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34757))))

(declare-fun b!1497979 () Bool)

(declare-fun res!1019239 () Bool)

(assert (=> b!1497979 (=> (not res!1019239) (not e!838769))))

(assert (=> b!1497979 (= res!1019239 (validKeyInArray!0 (select (arr!48190 a!2850) i!996)))))

(assert (= (and start!127484 res!1019242) b!1497975))

(assert (= (and b!1497975 res!1019240) b!1497979))

(assert (= (and b!1497979 res!1019239) b!1497974))

(assert (= (and b!1497974 res!1019243) b!1497976))

(assert (= (and b!1497976 res!1019238) b!1497978))

(assert (= (and b!1497978 res!1019241) b!1497977))

(declare-fun m!1380511 () Bool)

(assert (=> b!1497977 m!1380511))

(declare-fun m!1380513 () Bool)

(assert (=> b!1497977 m!1380513))

(declare-fun m!1380515 () Bool)

(assert (=> b!1497977 m!1380515))

(declare-fun m!1380517 () Bool)

(assert (=> b!1497976 m!1380517))

(declare-fun m!1380519 () Bool)

(assert (=> b!1497978 m!1380519))

(declare-fun m!1380521 () Bool)

(assert (=> start!127484 m!1380521))

(declare-fun m!1380523 () Bool)

(assert (=> start!127484 m!1380523))

(declare-fun m!1380525 () Bool)

(assert (=> b!1497974 m!1380525))

(assert (=> b!1497974 m!1380525))

(declare-fun m!1380527 () Bool)

(assert (=> b!1497974 m!1380527))

(declare-fun m!1380529 () Bool)

(assert (=> b!1497979 m!1380529))

(assert (=> b!1497979 m!1380529))

(declare-fun m!1380531 () Bool)

(assert (=> b!1497979 m!1380531))

(check-sat (not b!1497976) (not b!1497979) (not start!127484) (not b!1497974) (not b!1497978))
(check-sat)
