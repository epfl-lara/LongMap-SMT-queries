; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68048 () Bool)

(assert start!68048)

(declare-fun b!791713 () Bool)

(declare-fun res!536453 () Bool)

(declare-fun e!439958 () Bool)

(assert (=> b!791713 (=> (not res!536453) (not e!439958))))

(declare-datatypes ((array!42951 0))(
  ( (array!42952 (arr!20560 (Array (_ BitVec 32) (_ BitVec 64))) (size!20981 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42951)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791713 (= res!536453 (validKeyInArray!0 (select (arr!20560 a!3170) j!153)))))

(declare-fun b!791714 () Bool)

(declare-fun res!536450 () Bool)

(assert (=> b!791714 (=> (not res!536450) (not e!439958))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!791714 (= res!536450 (validKeyInArray!0 k0!2044))))

(declare-fun b!791716 () Bool)

(declare-fun res!536452 () Bool)

(assert (=> b!791716 (=> (not res!536452) (not e!439958))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8151 0))(
  ( (MissingZero!8151 (index!34972 (_ BitVec 32))) (Found!8151 (index!34973 (_ BitVec 32))) (Intermediate!8151 (undefined!8963 Bool) (index!34974 (_ BitVec 32)) (x!65933 (_ BitVec 32))) (Undefined!8151) (MissingVacant!8151 (index!34975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42951 (_ BitVec 32)) SeekEntryResult!8151)

(assert (=> b!791716 (= res!536452 (not (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) (MissingZero!8151 i!1163))))))

(declare-fun b!791717 () Bool)

(assert (=> b!791717 (= e!439958 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!791718 () Bool)

(declare-fun res!536451 () Bool)

(assert (=> b!791718 (=> (not res!536451) (not e!439958))))

(assert (=> b!791718 (= res!536451 (and (= (size!20981 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20981 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20981 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791715 () Bool)

(declare-fun res!536449 () Bool)

(assert (=> b!791715 (=> (not res!536449) (not e!439958))))

(declare-fun arrayContainsKey!0 (array!42951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791715 (= res!536449 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536448 () Bool)

(assert (=> start!68048 (=> (not res!536448) (not e!439958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68048 (= res!536448 (validMask!0 mask!3266))))

(assert (=> start!68048 e!439958))

(assert (=> start!68048 true))

(declare-fun array_inv!16356 (array!42951) Bool)

(assert (=> start!68048 (array_inv!16356 a!3170)))

(assert (= (and start!68048 res!536448) b!791718))

(assert (= (and b!791718 res!536451) b!791713))

(assert (= (and b!791713 res!536453) b!791714))

(assert (= (and b!791714 res!536450) b!791715))

(assert (= (and b!791715 res!536449) b!791716))

(assert (= (and b!791716 res!536452) b!791717))

(declare-fun m!732433 () Bool)

(assert (=> b!791715 m!732433))

(declare-fun m!732435 () Bool)

(assert (=> b!791713 m!732435))

(assert (=> b!791713 m!732435))

(declare-fun m!732437 () Bool)

(assert (=> b!791713 m!732437))

(declare-fun m!732439 () Bool)

(assert (=> b!791716 m!732439))

(declare-fun m!732441 () Bool)

(assert (=> start!68048 m!732441))

(declare-fun m!732443 () Bool)

(assert (=> start!68048 m!732443))

(declare-fun m!732445 () Bool)

(assert (=> b!791714 m!732445))

(check-sat (not b!791715) (not b!791713) (not b!791714) (not b!791716) (not start!68048))
(check-sat)
