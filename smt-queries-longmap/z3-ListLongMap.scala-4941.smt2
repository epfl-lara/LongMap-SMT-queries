; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68036 () Bool)

(assert start!68036)

(declare-fun b!791618 () Bool)

(declare-fun res!536353 () Bool)

(declare-fun e!439921 () Bool)

(assert (=> b!791618 (=> (not res!536353) (not e!439921))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791618 (= res!536353 (validKeyInArray!0 k0!2044))))

(declare-fun b!791619 () Bool)

(declare-fun res!536355 () Bool)

(assert (=> b!791619 (=> (not res!536355) (not e!439921))))

(declare-datatypes ((array!42939 0))(
  ( (array!42940 (arr!20554 (Array (_ BitVec 32) (_ BitVec 64))) (size!20975 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42939)

(declare-fun arrayContainsKey!0 (array!42939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791619 (= res!536355 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791620 () Bool)

(declare-fun res!536354 () Bool)

(assert (=> b!791620 (=> (not res!536354) (not e!439921))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791620 (= res!536354 (and (= (size!20975 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20975 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20975 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536356 () Bool)

(assert (=> start!68036 (=> (not res!536356) (not e!439921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68036 (= res!536356 (validMask!0 mask!3266))))

(assert (=> start!68036 e!439921))

(assert (=> start!68036 true))

(declare-fun array_inv!16350 (array!42939) Bool)

(assert (=> start!68036 (array_inv!16350 a!3170)))

(declare-fun b!791621 () Bool)

(declare-fun res!536357 () Bool)

(assert (=> b!791621 (=> (not res!536357) (not e!439921))))

(assert (=> b!791621 (= res!536357 (validKeyInArray!0 (select (arr!20554 a!3170) j!153)))))

(declare-fun b!791622 () Bool)

(assert (=> b!791622 (= e!439921 (bvslt mask!3266 #b00000000000000000000000000000000))))

(assert (= (and start!68036 res!536356) b!791620))

(assert (= (and b!791620 res!536354) b!791621))

(assert (= (and b!791621 res!536357) b!791618))

(assert (= (and b!791618 res!536353) b!791619))

(assert (= (and b!791619 res!536355) b!791622))

(declare-fun m!732353 () Bool)

(assert (=> b!791618 m!732353))

(declare-fun m!732355 () Bool)

(assert (=> b!791619 m!732355))

(declare-fun m!732357 () Bool)

(assert (=> start!68036 m!732357))

(declare-fun m!732359 () Bool)

(assert (=> start!68036 m!732359))

(declare-fun m!732361 () Bool)

(assert (=> b!791621 m!732361))

(assert (=> b!791621 m!732361))

(declare-fun m!732363 () Bool)

(assert (=> b!791621 m!732363))

(check-sat (not b!791619) (not b!791621) (not b!791618) (not start!68036))
(check-sat)
