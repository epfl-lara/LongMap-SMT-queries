; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68012 () Bool)

(assert start!68012)

(declare-fun b!791353 () Bool)

(declare-fun res!536232 () Bool)

(declare-fun e!439762 () Bool)

(assert (=> b!791353 (=> (not res!536232) (not e!439762))))

(declare-datatypes ((array!42934 0))(
  ( (array!42935 (arr!20552 (Array (_ BitVec 32) (_ BitVec 64))) (size!20973 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42934)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791353 (= res!536232 (validKeyInArray!0 (select (arr!20552 a!3170) j!153)))))

(declare-fun b!791354 () Bool)

(declare-fun res!536230 () Bool)

(assert (=> b!791354 (=> (not res!536230) (not e!439762))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791354 (= res!536230 (and (= (size!20973 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20973 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20973 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791356 () Bool)

(assert (=> b!791356 (= e!439762 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!791357 () Bool)

(declare-fun res!536229 () Bool)

(assert (=> b!791357 (=> (not res!536229) (not e!439762))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791357 (= res!536229 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791355 () Bool)

(declare-fun res!536228 () Bool)

(assert (=> b!791355 (=> (not res!536228) (not e!439762))))

(assert (=> b!791355 (= res!536228 (validKeyInArray!0 k0!2044))))

(declare-fun res!536231 () Bool)

(assert (=> start!68012 (=> (not res!536231) (not e!439762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68012 (= res!536231 (validMask!0 mask!3266))))

(assert (=> start!68012 e!439762))

(assert (=> start!68012 true))

(declare-fun array_inv!16435 (array!42934) Bool)

(assert (=> start!68012 (array_inv!16435 a!3170)))

(assert (= (and start!68012 res!536231) b!791354))

(assert (= (and b!791354 res!536230) b!791353))

(assert (= (and b!791353 res!536232) b!791355))

(assert (= (and b!791355 res!536228) b!791357))

(assert (= (and b!791357 res!536229) b!791356))

(declare-fun m!731583 () Bool)

(assert (=> b!791353 m!731583))

(assert (=> b!791353 m!731583))

(declare-fun m!731585 () Bool)

(assert (=> b!791353 m!731585))

(declare-fun m!731587 () Bool)

(assert (=> b!791357 m!731587))

(declare-fun m!731589 () Bool)

(assert (=> b!791355 m!731589))

(declare-fun m!731591 () Bool)

(assert (=> start!68012 m!731591))

(declare-fun m!731593 () Bool)

(assert (=> start!68012 m!731593))

(check-sat (not b!791355) (not b!791357) (not b!791353) (not start!68012))
(check-sat)
