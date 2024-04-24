; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68154 () Bool)

(assert start!68154)

(declare-fun b!792248 () Bool)

(declare-fun res!536613 () Bool)

(declare-fun e!440332 () Bool)

(assert (=> b!792248 (=> (not res!536613) (not e!440332))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792248 (= res!536613 (validKeyInArray!0 k0!2044))))

(declare-fun b!792249 () Bool)

(declare-fun res!536609 () Bool)

(assert (=> b!792249 (=> (not res!536609) (not e!440332))))

(declare-datatypes ((array!42935 0))(
  ( (array!42936 (arr!20548 (Array (_ BitVec 32) (_ BitVec 64))) (size!20968 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42935)

(declare-fun arrayContainsKey!0 (array!42935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792249 (= res!536609 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792250 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!792250 (= e!440332 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!792251 () Bool)

(declare-fun res!536611 () Bool)

(assert (=> b!792251 (=> (not res!536611) (not e!440332))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792251 (= res!536611 (and (= (size!20968 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20968 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20968 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792252 () Bool)

(declare-fun res!536612 () Bool)

(assert (=> b!792252 (=> (not res!536612) (not e!440332))))

(assert (=> b!792252 (= res!536612 (validKeyInArray!0 (select (arr!20548 a!3170) j!153)))))

(declare-fun res!536610 () Bool)

(assert (=> start!68154 (=> (not res!536610) (not e!440332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68154 (= res!536610 (validMask!0 mask!3266))))

(assert (=> start!68154 e!440332))

(assert (=> start!68154 true))

(declare-fun array_inv!16407 (array!42935) Bool)

(assert (=> start!68154 (array_inv!16407 a!3170)))

(assert (= (and start!68154 res!536610) b!792251))

(assert (= (and b!792251 res!536611) b!792252))

(assert (= (and b!792252 res!536612) b!792248))

(assert (= (and b!792248 res!536613) b!792249))

(assert (= (and b!792249 res!536609) b!792250))

(declare-fun m!733403 () Bool)

(assert (=> b!792248 m!733403))

(declare-fun m!733405 () Bool)

(assert (=> b!792249 m!733405))

(declare-fun m!733407 () Bool)

(assert (=> b!792252 m!733407))

(assert (=> b!792252 m!733407))

(declare-fun m!733409 () Bool)

(assert (=> b!792252 m!733409))

(declare-fun m!733411 () Bool)

(assert (=> start!68154 m!733411))

(declare-fun m!733413 () Bool)

(assert (=> start!68154 m!733413))

(check-sat (not b!792249) (not b!792248) (not start!68154) (not b!792252))
(check-sat)
