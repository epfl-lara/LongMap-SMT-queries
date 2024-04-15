; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68024 () Bool)

(assert start!68024)

(declare-fun b!791445 () Bool)

(declare-fun res!536320 () Bool)

(declare-fun e!439797 () Bool)

(assert (=> b!791445 (=> (not res!536320) (not e!439797))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791445 (= res!536320 (validKeyInArray!0 k0!2044))))

(declare-fun b!791446 () Bool)

(declare-fun res!536322 () Bool)

(assert (=> b!791446 (=> (not res!536322) (not e!439797))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42946 0))(
  ( (array!42947 (arr!20558 (Array (_ BitVec 32) (_ BitVec 64))) (size!20979 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42946)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791446 (= res!536322 (and (= (size!20979 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20979 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20979 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791447 () Bool)

(assert (=> b!791447 (= e!439797 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!791448 () Bool)

(declare-fun res!536325 () Bool)

(assert (=> b!791448 (=> (not res!536325) (not e!439797))))

(declare-fun arrayContainsKey!0 (array!42946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791448 (= res!536325 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536323 () Bool)

(assert (=> start!68024 (=> (not res!536323) (not e!439797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68024 (= res!536323 (validMask!0 mask!3266))))

(assert (=> start!68024 e!439797))

(assert (=> start!68024 true))

(declare-fun array_inv!16441 (array!42946) Bool)

(assert (=> start!68024 (array_inv!16441 a!3170)))

(declare-fun b!791449 () Bool)

(declare-fun res!536321 () Bool)

(assert (=> b!791449 (=> (not res!536321) (not e!439797))))

(declare-datatypes ((SeekEntryResult!8146 0))(
  ( (MissingZero!8146 (index!34952 (_ BitVec 32))) (Found!8146 (index!34953 (_ BitVec 32))) (Intermediate!8146 (undefined!8958 Bool) (index!34954 (_ BitVec 32)) (x!65923 (_ BitVec 32))) (Undefined!8146) (MissingVacant!8146 (index!34955 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42946 (_ BitVec 32)) SeekEntryResult!8146)

(assert (=> b!791449 (= res!536321 (not (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) (MissingZero!8146 i!1163))))))

(declare-fun b!791450 () Bool)

(declare-fun res!536324 () Bool)

(assert (=> b!791450 (=> (not res!536324) (not e!439797))))

(assert (=> b!791450 (= res!536324 (validKeyInArray!0 (select (arr!20558 a!3170) j!153)))))

(assert (= (and start!68024 res!536323) b!791446))

(assert (= (and b!791446 res!536322) b!791450))

(assert (= (and b!791450 res!536324) b!791445))

(assert (= (and b!791445 res!536320) b!791448))

(assert (= (and b!791448 res!536325) b!791449))

(assert (= (and b!791449 res!536321) b!791447))

(declare-fun m!731661 () Bool)

(assert (=> b!791450 m!731661))

(assert (=> b!791450 m!731661))

(declare-fun m!731663 () Bool)

(assert (=> b!791450 m!731663))

(declare-fun m!731665 () Bool)

(assert (=> b!791448 m!731665))

(declare-fun m!731667 () Bool)

(assert (=> b!791449 m!731667))

(declare-fun m!731669 () Bool)

(assert (=> start!68024 m!731669))

(declare-fun m!731671 () Bool)

(assert (=> start!68024 m!731671))

(declare-fun m!731673 () Bool)

(assert (=> b!791445 m!731673))

(check-sat (not b!791445) (not b!791448) (not b!791450) (not start!68024) (not b!791449))
(check-sat)
