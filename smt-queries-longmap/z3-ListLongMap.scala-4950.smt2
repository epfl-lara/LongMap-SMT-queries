; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68208 () Bool)

(assert start!68208)

(declare-fun b!792666 () Bool)

(declare-fun res!537028 () Bool)

(declare-fun e!440497 () Bool)

(assert (=> b!792666 (=> (not res!537028) (not e!440497))))

(declare-datatypes ((array!42989 0))(
  ( (array!42990 (arr!20575 (Array (_ BitVec 32) (_ BitVec 64))) (size!20995 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42989)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42989 (_ BitVec 32)) Bool)

(assert (=> b!792666 (= res!537028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792668 () Bool)

(declare-fun res!537027 () Bool)

(declare-fun e!440496 () Bool)

(assert (=> b!792668 (=> (not res!537027) (not e!440496))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792668 (= res!537027 (validKeyInArray!0 (select (arr!20575 a!3170) j!153)))))

(declare-fun b!792669 () Bool)

(assert (=> b!792669 (= e!440497 (bvsgt #b00000000000000000000000000000000 (size!20995 a!3170)))))

(declare-fun b!792670 () Bool)

(declare-fun res!537029 () Bool)

(assert (=> b!792670 (=> (not res!537029) (not e!440496))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792670 (= res!537029 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792671 () Bool)

(declare-fun res!537033 () Bool)

(assert (=> b!792671 (=> (not res!537033) (not e!440496))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792671 (= res!537033 (and (= (size!20995 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20995 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20995 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792672 () Bool)

(declare-fun res!537031 () Bool)

(assert (=> b!792672 (=> (not res!537031) (not e!440496))))

(assert (=> b!792672 (= res!537031 (validKeyInArray!0 k0!2044))))

(declare-fun b!792667 () Bool)

(assert (=> b!792667 (= e!440496 e!440497)))

(declare-fun res!537030 () Bool)

(assert (=> b!792667 (=> (not res!537030) (not e!440497))))

(declare-datatypes ((SeekEntryResult!8122 0))(
  ( (MissingZero!8122 (index!34856 (_ BitVec 32))) (Found!8122 (index!34857 (_ BitVec 32))) (Intermediate!8122 (undefined!8934 Bool) (index!34858 (_ BitVec 32)) (x!65971 (_ BitVec 32))) (Undefined!8122) (MissingVacant!8122 (index!34859 (_ BitVec 32))) )
))
(declare-fun lt!353623 () SeekEntryResult!8122)

(assert (=> b!792667 (= res!537030 (or (= lt!353623 (MissingZero!8122 i!1163)) (= lt!353623 (MissingVacant!8122 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42989 (_ BitVec 32)) SeekEntryResult!8122)

(assert (=> b!792667 (= lt!353623 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!537032 () Bool)

(assert (=> start!68208 (=> (not res!537032) (not e!440496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68208 (= res!537032 (validMask!0 mask!3266))))

(assert (=> start!68208 e!440496))

(assert (=> start!68208 true))

(declare-fun array_inv!16434 (array!42989) Bool)

(assert (=> start!68208 (array_inv!16434 a!3170)))

(assert (= (and start!68208 res!537032) b!792671))

(assert (= (and b!792671 res!537033) b!792668))

(assert (= (and b!792668 res!537027) b!792672))

(assert (= (and b!792672 res!537031) b!792670))

(assert (= (and b!792670 res!537029) b!792667))

(assert (= (and b!792667 res!537030) b!792666))

(assert (= (and b!792666 res!537028) b!792669))

(declare-fun m!733775 () Bool)

(assert (=> b!792667 m!733775))

(declare-fun m!733777 () Bool)

(assert (=> start!68208 m!733777))

(declare-fun m!733779 () Bool)

(assert (=> start!68208 m!733779))

(declare-fun m!733781 () Bool)

(assert (=> b!792670 m!733781))

(declare-fun m!733783 () Bool)

(assert (=> b!792666 m!733783))

(declare-fun m!733785 () Bool)

(assert (=> b!792668 m!733785))

(assert (=> b!792668 m!733785))

(declare-fun m!733787 () Bool)

(assert (=> b!792668 m!733787))

(declare-fun m!733789 () Bool)

(assert (=> b!792672 m!733789))

(check-sat (not b!792672) (not b!792668) (not b!792670) (not b!792666) (not b!792667) (not start!68208))
(check-sat)
