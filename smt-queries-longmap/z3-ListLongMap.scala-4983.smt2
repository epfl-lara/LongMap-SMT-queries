; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68410 () Bool)

(assert start!68410)

(declare-fun b!795041 () Bool)

(declare-fun res!539566 () Bool)

(declare-fun e!441345 () Bool)

(assert (=> b!795041 (=> (not res!539566) (not e!441345))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43200 0))(
  ( (array!43201 (arr!20680 (Array (_ BitVec 32) (_ BitVec 64))) (size!21101 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43200)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795041 (= res!539566 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21101 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20680 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21101 a!3170)) (= (select (arr!20680 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795042 () Bool)

(declare-fun res!539570 () Bool)

(assert (=> b!795042 (=> (not res!539570) (not e!441345))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43200 (_ BitVec 32)) Bool)

(assert (=> b!795042 (= res!539570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795043 () Bool)

(declare-fun res!539562 () Bool)

(declare-fun e!441346 () Bool)

(assert (=> b!795043 (=> (not res!539562) (not e!441346))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795043 (= res!539562 (validKeyInArray!0 k0!2044))))

(declare-fun b!795044 () Bool)

(declare-fun res!539569 () Bool)

(assert (=> b!795044 (=> (not res!539569) (not e!441345))))

(declare-datatypes ((List!14643 0))(
  ( (Nil!14640) (Cons!14639 (h!15768 (_ BitVec 64)) (t!20958 List!14643)) )
))
(declare-fun arrayNoDuplicates!0 (array!43200 (_ BitVec 32) List!14643) Bool)

(assert (=> b!795044 (= res!539569 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14640))))

(declare-fun b!795045 () Bool)

(declare-fun res!539567 () Bool)

(assert (=> b!795045 (=> (not res!539567) (not e!441346))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795045 (= res!539567 (and (= (size!21101 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21101 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21101 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795046 () Bool)

(declare-fun res!539564 () Bool)

(declare-fun e!441347 () Bool)

(assert (=> b!795046 (=> (not res!539564) (not e!441347))))

(declare-datatypes ((SeekEntryResult!8271 0))(
  ( (MissingZero!8271 (index!35452 (_ BitVec 32))) (Found!8271 (index!35453 (_ BitVec 32))) (Intermediate!8271 (undefined!9083 Bool) (index!35454 (_ BitVec 32)) (x!66373 (_ BitVec 32))) (Undefined!8271) (MissingVacant!8271 (index!35455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43200 (_ BitVec 32)) SeekEntryResult!8271)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43200 (_ BitVec 32)) SeekEntryResult!8271)

(assert (=> b!795046 (= res!539564 (= (seekEntryOrOpen!0 (select (arr!20680 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20680 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!795048 () Bool)

(declare-fun res!539563 () Bool)

(assert (=> b!795048 (=> (not res!539563) (not e!441346))))

(assert (=> b!795048 (= res!539563 (validKeyInArray!0 (select (arr!20680 a!3170) j!153)))))

(declare-fun b!795049 () Bool)

(declare-fun res!539560 () Bool)

(assert (=> b!795049 (=> (not res!539560) (not e!441346))))

(declare-fun arrayContainsKey!0 (array!43200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795049 (= res!539560 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795050 () Bool)

(assert (=> b!795050 (= e!441346 e!441345)))

(declare-fun res!539561 () Bool)

(assert (=> b!795050 (=> (not res!539561) (not e!441345))))

(declare-fun lt!354385 () SeekEntryResult!8271)

(assert (=> b!795050 (= res!539561 (or (= lt!354385 (MissingZero!8271 i!1163)) (= lt!354385 (MissingVacant!8271 i!1163))))))

(assert (=> b!795050 (= lt!354385 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795051 () Bool)

(assert (=> b!795051 (= e!441347 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun res!539568 () Bool)

(assert (=> start!68410 (=> (not res!539568) (not e!441346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68410 (= res!539568 (validMask!0 mask!3266))))

(assert (=> start!68410 e!441346))

(assert (=> start!68410 true))

(declare-fun array_inv!16476 (array!43200) Bool)

(assert (=> start!68410 (array_inv!16476 a!3170)))

(declare-fun b!795047 () Bool)

(assert (=> b!795047 (= e!441345 e!441347)))

(declare-fun res!539565 () Bool)

(assert (=> b!795047 (=> (not res!539565) (not e!441347))))

(declare-fun lt!354384 () array!43200)

(declare-fun lt!354386 () (_ BitVec 64))

(assert (=> b!795047 (= res!539565 (= (seekEntryOrOpen!0 lt!354386 lt!354384 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354386 lt!354384 mask!3266)))))

(assert (=> b!795047 (= lt!354386 (select (store (arr!20680 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795047 (= lt!354384 (array!43201 (store (arr!20680 a!3170) i!1163 k0!2044) (size!21101 a!3170)))))

(assert (= (and start!68410 res!539568) b!795045))

(assert (= (and b!795045 res!539567) b!795048))

(assert (= (and b!795048 res!539563) b!795043))

(assert (= (and b!795043 res!539562) b!795049))

(assert (= (and b!795049 res!539560) b!795050))

(assert (= (and b!795050 res!539561) b!795042))

(assert (= (and b!795042 res!539570) b!795044))

(assert (= (and b!795044 res!539569) b!795041))

(assert (= (and b!795041 res!539566) b!795047))

(assert (= (and b!795047 res!539565) b!795046))

(assert (= (and b!795046 res!539564) b!795051))

(declare-fun m!735627 () Bool)

(assert (=> b!795046 m!735627))

(assert (=> b!795046 m!735627))

(declare-fun m!735629 () Bool)

(assert (=> b!795046 m!735629))

(assert (=> b!795046 m!735627))

(declare-fun m!735631 () Bool)

(assert (=> b!795046 m!735631))

(declare-fun m!735633 () Bool)

(assert (=> b!795044 m!735633))

(declare-fun m!735635 () Bool)

(assert (=> start!68410 m!735635))

(declare-fun m!735637 () Bool)

(assert (=> start!68410 m!735637))

(declare-fun m!735639 () Bool)

(assert (=> b!795043 m!735639))

(declare-fun m!735641 () Bool)

(assert (=> b!795042 m!735641))

(declare-fun m!735643 () Bool)

(assert (=> b!795050 m!735643))

(declare-fun m!735645 () Bool)

(assert (=> b!795041 m!735645))

(declare-fun m!735647 () Bool)

(assert (=> b!795041 m!735647))

(declare-fun m!735649 () Bool)

(assert (=> b!795047 m!735649))

(declare-fun m!735651 () Bool)

(assert (=> b!795047 m!735651))

(declare-fun m!735653 () Bool)

(assert (=> b!795047 m!735653))

(declare-fun m!735655 () Bool)

(assert (=> b!795047 m!735655))

(declare-fun m!735657 () Bool)

(assert (=> b!795049 m!735657))

(assert (=> b!795048 m!735627))

(assert (=> b!795048 m!735627))

(declare-fun m!735659 () Bool)

(assert (=> b!795048 m!735659))

(check-sat (not start!68410) (not b!795043) (not b!795049) (not b!795046) (not b!795044) (not b!795042) (not b!795048) (not b!795047) (not b!795050))
(check-sat)
