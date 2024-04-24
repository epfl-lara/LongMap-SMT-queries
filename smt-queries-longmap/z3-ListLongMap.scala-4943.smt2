; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68166 () Bool)

(assert start!68166)

(declare-fun b!792340 () Bool)

(declare-fun res!536701 () Bool)

(declare-fun e!440368 () Bool)

(assert (=> b!792340 (=> (not res!536701) (not e!440368))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792340 (= res!536701 (validKeyInArray!0 k0!2044))))

(declare-fun b!792341 () Bool)

(declare-fun res!536703 () Bool)

(assert (=> b!792341 (=> (not res!536703) (not e!440368))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42947 0))(
  ( (array!42948 (arr!20554 (Array (_ BitVec 32) (_ BitVec 64))) (size!20974 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42947)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8101 0))(
  ( (MissingZero!8101 (index!34772 (_ BitVec 32))) (Found!8101 (index!34773 (_ BitVec 32))) (Intermediate!8101 (undefined!8913 Bool) (index!34774 (_ BitVec 32)) (x!65894 (_ BitVec 32))) (Undefined!8101) (MissingVacant!8101 (index!34775 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42947 (_ BitVec 32)) SeekEntryResult!8101)

(assert (=> b!792341 (= res!536703 (not (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) (MissingZero!8101 i!1163))))))

(declare-fun b!792342 () Bool)

(declare-fun res!536702 () Bool)

(assert (=> b!792342 (=> (not res!536702) (not e!440368))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792342 (= res!536702 (and (= (size!20974 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20974 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20974 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792343 () Bool)

(assert (=> b!792343 (= e!440368 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!792344 () Bool)

(declare-fun res!536706 () Bool)

(assert (=> b!792344 (=> (not res!536706) (not e!440368))))

(declare-fun arrayContainsKey!0 (array!42947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792344 (= res!536706 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792345 () Bool)

(declare-fun res!536704 () Bool)

(assert (=> b!792345 (=> (not res!536704) (not e!440368))))

(assert (=> b!792345 (= res!536704 (validKeyInArray!0 (select (arr!20554 a!3170) j!153)))))

(declare-fun res!536705 () Bool)

(assert (=> start!68166 (=> (not res!536705) (not e!440368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68166 (= res!536705 (validMask!0 mask!3266))))

(assert (=> start!68166 e!440368))

(assert (=> start!68166 true))

(declare-fun array_inv!16413 (array!42947) Bool)

(assert (=> start!68166 (array_inv!16413 a!3170)))

(assert (= (and start!68166 res!536705) b!792342))

(assert (= (and b!792342 res!536702) b!792345))

(assert (= (and b!792345 res!536704) b!792340))

(assert (= (and b!792340 res!536701) b!792344))

(assert (= (and b!792344 res!536706) b!792341))

(assert (= (and b!792341 res!536703) b!792343))

(declare-fun m!733481 () Bool)

(assert (=> b!792344 m!733481))

(declare-fun m!733483 () Bool)

(assert (=> start!68166 m!733483))

(declare-fun m!733485 () Bool)

(assert (=> start!68166 m!733485))

(declare-fun m!733487 () Bool)

(assert (=> b!792345 m!733487))

(assert (=> b!792345 m!733487))

(declare-fun m!733489 () Bool)

(assert (=> b!792345 m!733489))

(declare-fun m!733491 () Bool)

(assert (=> b!792341 m!733491))

(declare-fun m!733493 () Bool)

(assert (=> b!792340 m!733493))

(check-sat (not start!68166) (not b!792341) (not b!792340) (not b!792344) (not b!792345))
(check-sat)
