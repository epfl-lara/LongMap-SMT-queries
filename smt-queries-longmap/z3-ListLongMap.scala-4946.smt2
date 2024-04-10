; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68066 () Bool)

(assert start!68066)

(declare-fun b!791852 () Bool)

(declare-fun e!440012 () Bool)

(assert (=> b!791852 (= e!440012 false)))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!42969 0))(
  ( (array!42970 (arr!20569 (Array (_ BitVec 32) (_ BitVec 64))) (size!20990 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42969)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8160 0))(
  ( (MissingZero!8160 (index!35008 (_ BitVec 32))) (Found!8160 (index!35009 (_ BitVec 32))) (Intermediate!8160 (undefined!8972 Bool) (index!35010 (_ BitVec 32)) (x!65966 (_ BitVec 32))) (Undefined!8160) (MissingVacant!8160 (index!35011 (_ BitVec 32))) )
))
(declare-fun lt!353318 () SeekEntryResult!8160)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42969 (_ BitVec 32)) SeekEntryResult!8160)

(assert (=> b!791852 (= lt!353318 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791853 () Bool)

(declare-fun res!536588 () Bool)

(assert (=> b!791853 (=> (not res!536588) (not e!440012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791853 (= res!536588 (validKeyInArray!0 k0!2044))))

(declare-fun b!791855 () Bool)

(declare-fun res!536590 () Bool)

(assert (=> b!791855 (=> (not res!536590) (not e!440012))))

(declare-fun arrayContainsKey!0 (array!42969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791855 (= res!536590 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791856 () Bool)

(declare-fun res!536589 () Bool)

(assert (=> b!791856 (=> (not res!536589) (not e!440012))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791856 (= res!536589 (validKeyInArray!0 (select (arr!20569 a!3170) j!153)))))

(declare-fun b!791854 () Bool)

(declare-fun res!536591 () Bool)

(assert (=> b!791854 (=> (not res!536591) (not e!440012))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791854 (= res!536591 (and (= (size!20990 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20990 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20990 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536587 () Bool)

(assert (=> start!68066 (=> (not res!536587) (not e!440012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68066 (= res!536587 (validMask!0 mask!3266))))

(assert (=> start!68066 e!440012))

(assert (=> start!68066 true))

(declare-fun array_inv!16365 (array!42969) Bool)

(assert (=> start!68066 (array_inv!16365 a!3170)))

(assert (= (and start!68066 res!536587) b!791854))

(assert (= (and b!791854 res!536591) b!791856))

(assert (= (and b!791856 res!536589) b!791853))

(assert (= (and b!791853 res!536588) b!791855))

(assert (= (and b!791855 res!536590) b!791852))

(declare-fun m!732559 () Bool)

(assert (=> b!791853 m!732559))

(declare-fun m!732561 () Bool)

(assert (=> start!68066 m!732561))

(declare-fun m!732563 () Bool)

(assert (=> start!68066 m!732563))

(declare-fun m!732565 () Bool)

(assert (=> b!791852 m!732565))

(declare-fun m!732567 () Bool)

(assert (=> b!791856 m!732567))

(assert (=> b!791856 m!732567))

(declare-fun m!732569 () Bool)

(assert (=> b!791856 m!732569))

(declare-fun m!732571 () Bool)

(assert (=> b!791855 m!732571))

(check-sat (not b!791852) (not b!791853) (not start!68066) (not b!791855) (not b!791856))
