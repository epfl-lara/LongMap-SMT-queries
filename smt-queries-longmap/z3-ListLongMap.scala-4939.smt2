; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68128 () Bool)

(assert start!68128)

(declare-fun b!792176 () Bool)

(declare-fun res!536535 () Bool)

(declare-fun e!440295 () Bool)

(assert (=> b!792176 (=> (not res!536535) (not e!440295))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792176 (= res!536535 (validKeyInArray!0 k0!2044))))

(declare-fun b!792177 () Bool)

(declare-datatypes ((array!42922 0))(
  ( (array!42923 (arr!20542 (Array (_ BitVec 32) (_ BitVec 64))) (size!20962 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42922)

(assert (=> b!792177 (= e!440295 (bvsge #b00000000000000000000000000000000 (size!20962 a!3170)))))

(declare-fun res!536538 () Bool)

(assert (=> start!68128 (=> (not res!536538) (not e!440295))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68128 (= res!536538 (validMask!0 mask!3266))))

(assert (=> start!68128 e!440295))

(assert (=> start!68128 true))

(declare-fun array_inv!16401 (array!42922) Bool)

(assert (=> start!68128 (array_inv!16401 a!3170)))

(declare-fun b!792174 () Bool)

(declare-fun res!536537 () Bool)

(assert (=> b!792174 (=> (not res!536537) (not e!440295))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792174 (= res!536537 (and (= (size!20962 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20962 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20962 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792175 () Bool)

(declare-fun res!536536 () Bool)

(assert (=> b!792175 (=> (not res!536536) (not e!440295))))

(assert (=> b!792175 (= res!536536 (validKeyInArray!0 (select (arr!20542 a!3170) j!153)))))

(assert (= (and start!68128 res!536538) b!792174))

(assert (= (and b!792174 res!536537) b!792175))

(assert (= (and b!792175 res!536536) b!792176))

(assert (= (and b!792176 res!536535) b!792177))

(declare-fun m!733343 () Bool)

(assert (=> b!792176 m!733343))

(declare-fun m!733345 () Bool)

(assert (=> start!68128 m!733345))

(declare-fun m!733347 () Bool)

(assert (=> start!68128 m!733347))

(declare-fun m!733349 () Bool)

(assert (=> b!792175 m!733349))

(assert (=> b!792175 m!733349))

(declare-fun m!733351 () Bool)

(assert (=> b!792175 m!733351))

(check-sat (not start!68128) (not b!792175) (not b!792176))
(check-sat)
