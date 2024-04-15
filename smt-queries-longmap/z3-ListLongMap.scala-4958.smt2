; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68238 () Bool)

(assert start!68238)

(declare-fun b!792716 () Bool)

(declare-fun res!537375 () Bool)

(declare-fun e!440420 () Bool)

(assert (=> b!792716 (=> (not res!537375) (not e!440420))))

(declare-datatypes ((array!43045 0))(
  ( (array!43046 (arr!20603 (Array (_ BitVec 32) (_ BitVec 64))) (size!21024 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43045)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792716 (= res!537375 (validKeyInArray!0 (select (arr!20603 a!3170) j!153)))))

(declare-fun b!792717 () Bool)

(declare-fun res!537377 () Bool)

(assert (=> b!792717 (=> (not res!537377) (not e!440420))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792717 (= res!537377 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792718 () Bool)

(declare-fun e!440422 () Bool)

(assert (=> b!792718 (= e!440420 e!440422)))

(declare-fun res!537381 () Bool)

(assert (=> b!792718 (=> (not res!537381) (not e!440422))))

(declare-datatypes ((SeekEntryResult!8191 0))(
  ( (MissingZero!8191 (index!35132 (_ BitVec 32))) (Found!8191 (index!35133 (_ BitVec 32))) (Intermediate!8191 (undefined!9003 Bool) (index!35134 (_ BitVec 32)) (x!66088 (_ BitVec 32))) (Undefined!8191) (MissingVacant!8191 (index!35135 (_ BitVec 32))) )
))
(declare-fun lt!353378 () SeekEntryResult!8191)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792718 (= res!537381 (or (= lt!353378 (MissingZero!8191 i!1163)) (= lt!353378 (MissingVacant!8191 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43045 (_ BitVec 32)) SeekEntryResult!8191)

(assert (=> b!792718 (= lt!353378 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792719 () Bool)

(assert (=> b!792719 (= e!440422 false)))

(declare-fun lt!353377 () Bool)

(declare-datatypes ((List!14605 0))(
  ( (Nil!14602) (Cons!14601 (h!15730 (_ BitVec 64)) (t!20911 List!14605)) )
))
(declare-fun arrayNoDuplicates!0 (array!43045 (_ BitVec 32) List!14605) Bool)

(assert (=> b!792719 (= lt!353377 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14602))))

(declare-fun res!537380 () Bool)

(assert (=> start!68238 (=> (not res!537380) (not e!440420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68238 (= res!537380 (validMask!0 mask!3266))))

(assert (=> start!68238 e!440420))

(assert (=> start!68238 true))

(declare-fun array_inv!16486 (array!43045) Bool)

(assert (=> start!68238 (array_inv!16486 a!3170)))

(declare-fun b!792720 () Bool)

(declare-fun res!537376 () Bool)

(assert (=> b!792720 (=> (not res!537376) (not e!440422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43045 (_ BitVec 32)) Bool)

(assert (=> b!792720 (= res!537376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792721 () Bool)

(declare-fun res!537378 () Bool)

(assert (=> b!792721 (=> (not res!537378) (not e!440420))))

(assert (=> b!792721 (= res!537378 (validKeyInArray!0 k0!2044))))

(declare-fun b!792722 () Bool)

(declare-fun res!537379 () Bool)

(assert (=> b!792722 (=> (not res!537379) (not e!440420))))

(assert (=> b!792722 (= res!537379 (and (= (size!21024 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21024 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21024 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68238 res!537380) b!792722))

(assert (= (and b!792722 res!537379) b!792716))

(assert (= (and b!792716 res!537375) b!792721))

(assert (= (and b!792721 res!537378) b!792717))

(assert (= (and b!792717 res!537377) b!792718))

(assert (= (and b!792718 res!537381) b!792720))

(assert (= (and b!792720 res!537376) b!792719))

(declare-fun m!732733 () Bool)

(assert (=> start!68238 m!732733))

(declare-fun m!732735 () Bool)

(assert (=> start!68238 m!732735))

(declare-fun m!732737 () Bool)

(assert (=> b!792716 m!732737))

(assert (=> b!792716 m!732737))

(declare-fun m!732739 () Bool)

(assert (=> b!792716 m!732739))

(declare-fun m!732741 () Bool)

(assert (=> b!792721 m!732741))

(declare-fun m!732743 () Bool)

(assert (=> b!792719 m!732743))

(declare-fun m!732745 () Bool)

(assert (=> b!792717 m!732745))

(declare-fun m!732747 () Bool)

(assert (=> b!792720 m!732747))

(declare-fun m!732749 () Bool)

(assert (=> b!792718 m!732749))

(check-sat (not b!792719) (not b!792717) (not b!792721) (not b!792720) (not b!792718) (not b!792716) (not start!68238))
(check-sat)
