; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67988 () Bool)

(assert start!67988)

(declare-fun b!791279 () Bool)

(declare-fun res!536155 () Bool)

(declare-fun e!439725 () Bool)

(assert (=> b!791279 (=> (not res!536155) (not e!439725))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42921 0))(
  ( (array!42922 (arr!20546 (Array (_ BitVec 32) (_ BitVec 64))) (size!20967 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42921)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791279 (= res!536155 (and (= (size!20967 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20967 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20967 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536156 () Bool)

(assert (=> start!67988 (=> (not res!536156) (not e!439725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67988 (= res!536156 (validMask!0 mask!3266))))

(assert (=> start!67988 e!439725))

(assert (=> start!67988 true))

(declare-fun array_inv!16429 (array!42921) Bool)

(assert (=> start!67988 (array_inv!16429 a!3170)))

(declare-fun b!791281 () Bool)

(declare-fun res!536154 () Bool)

(assert (=> b!791281 (=> (not res!536154) (not e!439725))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791281 (= res!536154 (validKeyInArray!0 k0!2044))))

(declare-fun b!791280 () Bool)

(declare-fun res!536157 () Bool)

(assert (=> b!791280 (=> (not res!536157) (not e!439725))))

(assert (=> b!791280 (= res!536157 (validKeyInArray!0 (select (arr!20546 a!3170) j!153)))))

(declare-fun b!791282 () Bool)

(assert (=> b!791282 (= e!439725 (bvsge #b00000000000000000000000000000000 (size!20967 a!3170)))))

(assert (= (and start!67988 res!536156) b!791279))

(assert (= (and b!791279 res!536155) b!791280))

(assert (= (and b!791280 res!536157) b!791281))

(assert (= (and b!791281 res!536154) b!791282))

(declare-fun m!731523 () Bool)

(assert (=> start!67988 m!731523))

(declare-fun m!731525 () Bool)

(assert (=> start!67988 m!731525))

(declare-fun m!731527 () Bool)

(assert (=> b!791281 m!731527))

(declare-fun m!731529 () Bool)

(assert (=> b!791280 m!731529))

(assert (=> b!791280 m!731529))

(declare-fun m!731531 () Bool)

(assert (=> b!791280 m!731531))

(check-sat (not b!791280) (not b!791281) (not start!67988))
(check-sat)
