; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68214 () Bool)

(assert start!68214)

(declare-fun b!792437 () Bool)

(declare-fun res!537097 () Bool)

(declare-fun e!440314 () Bool)

(assert (=> b!792437 (=> (not res!537097) (not e!440314))))

(declare-datatypes ((array!43021 0))(
  ( (array!43022 (arr!20591 (Array (_ BitVec 32) (_ BitVec 64))) (size!21012 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43021)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43021 (_ BitVec 32)) Bool)

(assert (=> b!792437 (= res!537097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792438 () Bool)

(assert (=> b!792438 (= e!440314 false)))

(declare-fun lt!353323 () Bool)

(declare-datatypes ((List!14593 0))(
  ( (Nil!14590) (Cons!14589 (h!15718 (_ BitVec 64)) (t!20899 List!14593)) )
))
(declare-fun arrayNoDuplicates!0 (array!43021 (_ BitVec 32) List!14593) Bool)

(assert (=> b!792438 (= lt!353323 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14590))))

(declare-fun b!792439 () Bool)

(declare-fun res!537102 () Bool)

(declare-fun e!440313 () Bool)

(assert (=> b!792439 (=> (not res!537102) (not e!440313))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792439 (= res!537102 (validKeyInArray!0 k0!2044))))

(declare-fun res!537101 () Bool)

(assert (=> start!68214 (=> (not res!537101) (not e!440313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68214 (= res!537101 (validMask!0 mask!3266))))

(assert (=> start!68214 e!440313))

(assert (=> start!68214 true))

(declare-fun array_inv!16474 (array!43021) Bool)

(assert (=> start!68214 (array_inv!16474 a!3170)))

(declare-fun b!792440 () Bool)

(declare-fun res!537098 () Bool)

(assert (=> b!792440 (=> (not res!537098) (not e!440313))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792440 (= res!537098 (validKeyInArray!0 (select (arr!20591 a!3170) j!153)))))

(declare-fun b!792441 () Bool)

(assert (=> b!792441 (= e!440313 e!440314)))

(declare-fun res!537100 () Bool)

(assert (=> b!792441 (=> (not res!537100) (not e!440314))))

(declare-datatypes ((SeekEntryResult!8179 0))(
  ( (MissingZero!8179 (index!35084 (_ BitVec 32))) (Found!8179 (index!35085 (_ BitVec 32))) (Intermediate!8179 (undefined!8991 Bool) (index!35086 (_ BitVec 32)) (x!66044 (_ BitVec 32))) (Undefined!8179) (MissingVacant!8179 (index!35087 (_ BitVec 32))) )
))
(declare-fun lt!353324 () SeekEntryResult!8179)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792441 (= res!537100 (or (= lt!353324 (MissingZero!8179 i!1163)) (= lt!353324 (MissingVacant!8179 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43021 (_ BitVec 32)) SeekEntryResult!8179)

(assert (=> b!792441 (= lt!353324 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792442 () Bool)

(declare-fun res!537096 () Bool)

(assert (=> b!792442 (=> (not res!537096) (not e!440313))))

(assert (=> b!792442 (= res!537096 (and (= (size!21012 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21012 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21012 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792443 () Bool)

(declare-fun res!537099 () Bool)

(assert (=> b!792443 (=> (not res!537099) (not e!440313))))

(declare-fun arrayContainsKey!0 (array!43021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792443 (= res!537099 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68214 res!537101) b!792442))

(assert (= (and b!792442 res!537096) b!792440))

(assert (= (and b!792440 res!537098) b!792439))

(assert (= (and b!792439 res!537102) b!792443))

(assert (= (and b!792443 res!537099) b!792441))

(assert (= (and b!792441 res!537100) b!792437))

(assert (= (and b!792437 res!537097) b!792438))

(declare-fun m!732475 () Bool)

(assert (=> b!792437 m!732475))

(declare-fun m!732477 () Bool)

(assert (=> b!792441 m!732477))

(declare-fun m!732479 () Bool)

(assert (=> start!68214 m!732479))

(declare-fun m!732481 () Bool)

(assert (=> start!68214 m!732481))

(declare-fun m!732483 () Bool)

(assert (=> b!792440 m!732483))

(assert (=> b!792440 m!732483))

(declare-fun m!732485 () Bool)

(assert (=> b!792440 m!732485))

(declare-fun m!732487 () Bool)

(assert (=> b!792443 m!732487))

(declare-fun m!732489 () Bool)

(assert (=> b!792438 m!732489))

(declare-fun m!732491 () Bool)

(assert (=> b!792439 m!732491))

(check-sat (not b!792438) (not b!792439) (not b!792440) (not start!68214) (not b!792443) (not b!792441) (not b!792437))
(check-sat)
