; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68012 () Bool)

(assert start!68012)

(declare-fun res!536276 () Bool)

(declare-fun e!439886 () Bool)

(assert (=> start!68012 (=> (not res!536276) (not e!439886))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68012 (= res!536276 (validMask!0 mask!3266))))

(assert (=> start!68012 e!439886))

(assert (=> start!68012 true))

(declare-datatypes ((array!42926 0))(
  ( (array!42927 (arr!20548 (Array (_ BitVec 32) (_ BitVec 64))) (size!20969 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42926)

(declare-fun array_inv!16344 (array!42926) Bool)

(assert (=> start!68012 (array_inv!16344 a!3170)))

(declare-fun b!791542 () Bool)

(declare-fun res!536278 () Bool)

(assert (=> b!791542 (=> (not res!536278) (not e!439886))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791542 (= res!536278 (validKeyInArray!0 (select (arr!20548 a!3170) j!153)))))

(declare-fun b!791543 () Bool)

(declare-fun res!536277 () Bool)

(assert (=> b!791543 (=> (not res!536277) (not e!439886))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!791543 (= res!536277 (validKeyInArray!0 k0!2044))))

(declare-fun b!791544 () Bool)

(assert (=> b!791544 (= e!439886 (bvsge #b00000000000000000000000000000000 (size!20969 a!3170)))))

(declare-fun b!791541 () Bool)

(declare-fun res!536279 () Bool)

(assert (=> b!791541 (=> (not res!536279) (not e!439886))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791541 (= res!536279 (and (= (size!20969 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20969 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20969 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68012 res!536276) b!791541))

(assert (= (and b!791541 res!536279) b!791542))

(assert (= (and b!791542 res!536278) b!791543))

(assert (= (and b!791543 res!536277) b!791544))

(declare-fun m!732291 () Bool)

(assert (=> start!68012 m!732291))

(declare-fun m!732293 () Bool)

(assert (=> start!68012 m!732293))

(declare-fun m!732295 () Bool)

(assert (=> b!791542 m!732295))

(assert (=> b!791542 m!732295))

(declare-fun m!732297 () Bool)

(assert (=> b!791542 m!732297))

(declare-fun m!732299 () Bool)

(assert (=> b!791543 m!732299))

(check-sat (not start!68012) (not b!791542) (not b!791543))
(check-sat)
