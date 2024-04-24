; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68376 () Bool)

(assert start!68376)

(declare-fun b!793540 () Bool)

(declare-fun res!537691 () Bool)

(declare-fun e!440969 () Bool)

(assert (=> b!793540 (=> (not res!537691) (not e!440969))))

(declare-datatypes ((array!43040 0))(
  ( (array!43041 (arr!20596 (Array (_ BitVec 32) (_ BitVec 64))) (size!21016 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43040)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43040 (_ BitVec 32)) Bool)

(assert (=> b!793540 (= res!537691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537693 () Bool)

(declare-fun e!440970 () Bool)

(assert (=> start!68376 (=> (not res!537693) (not e!440970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68376 (= res!537693 (validMask!0 mask!3266))))

(assert (=> start!68376 e!440970))

(assert (=> start!68376 true))

(declare-fun array_inv!16455 (array!43040) Bool)

(assert (=> start!68376 (array_inv!16455 a!3170)))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun b!793541 () Bool)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793541 (= e!440969 (not (validKeyInArray!0 (select (store (arr!20596 a!3170) i!1163 k0!2044) j!153))))))

(declare-fun b!793542 () Bool)

(declare-fun res!537690 () Bool)

(assert (=> b!793542 (=> (not res!537690) (not e!440969))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793542 (= res!537690 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21016 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20596 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21016 a!3170)) (= (select (arr!20596 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!793543 () Bool)

(declare-fun res!537687 () Bool)

(assert (=> b!793543 (=> (not res!537687) (not e!440970))))

(assert (=> b!793543 (= res!537687 (validKeyInArray!0 (select (arr!20596 a!3170) j!153)))))

(declare-fun b!793544 () Bool)

(assert (=> b!793544 (= e!440970 e!440969)))

(declare-fun res!537692 () Bool)

(assert (=> b!793544 (=> (not res!537692) (not e!440969))))

(declare-datatypes ((SeekEntryResult!8143 0))(
  ( (MissingZero!8143 (index!34940 (_ BitVec 32))) (Found!8143 (index!34941 (_ BitVec 32))) (Intermediate!8143 (undefined!8955 Bool) (index!34942 (_ BitVec 32)) (x!66048 (_ BitVec 32))) (Undefined!8143) (MissingVacant!8143 (index!34943 (_ BitVec 32))) )
))
(declare-fun lt!353878 () SeekEntryResult!8143)

(assert (=> b!793544 (= res!537692 (or (= lt!353878 (MissingZero!8143 i!1163)) (= lt!353878 (MissingVacant!8143 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43040 (_ BitVec 32)) SeekEntryResult!8143)

(assert (=> b!793544 (= lt!353878 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793545 () Bool)

(declare-fun res!537685 () Bool)

(assert (=> b!793545 (=> (not res!537685) (not e!440970))))

(assert (=> b!793545 (= res!537685 (validKeyInArray!0 k0!2044))))

(declare-fun b!793546 () Bool)

(declare-fun res!537688 () Bool)

(assert (=> b!793546 (=> (not res!537688) (not e!440970))))

(assert (=> b!793546 (= res!537688 (and (= (size!21016 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21016 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21016 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793547 () Bool)

(declare-fun res!537686 () Bool)

(assert (=> b!793547 (=> (not res!537686) (not e!440970))))

(declare-fun arrayContainsKey!0 (array!43040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793547 (= res!537686 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793548 () Bool)

(declare-fun res!537689 () Bool)

(assert (=> b!793548 (=> (not res!537689) (not e!440969))))

(declare-datatypes ((List!14466 0))(
  ( (Nil!14463) (Cons!14462 (h!15597 (_ BitVec 64)) (t!20773 List!14466)) )
))
(declare-fun arrayNoDuplicates!0 (array!43040 (_ BitVec 32) List!14466) Bool)

(assert (=> b!793548 (= res!537689 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14463))))

(assert (= (and start!68376 res!537693) b!793546))

(assert (= (and b!793546 res!537688) b!793543))

(assert (= (and b!793543 res!537687) b!793545))

(assert (= (and b!793545 res!537685) b!793547))

(assert (= (and b!793547 res!537686) b!793544))

(assert (= (and b!793544 res!537692) b!793540))

(assert (= (and b!793540 res!537691) b!793548))

(assert (= (and b!793548 res!537689) b!793542))

(assert (= (and b!793542 res!537690) b!793541))

(declare-fun m!734471 () Bool)

(assert (=> b!793548 m!734471))

(declare-fun m!734473 () Bool)

(assert (=> b!793545 m!734473))

(declare-fun m!734475 () Bool)

(assert (=> b!793547 m!734475))

(declare-fun m!734477 () Bool)

(assert (=> b!793542 m!734477))

(declare-fun m!734479 () Bool)

(assert (=> b!793542 m!734479))

(declare-fun m!734481 () Bool)

(assert (=> b!793541 m!734481))

(declare-fun m!734483 () Bool)

(assert (=> b!793541 m!734483))

(assert (=> b!793541 m!734483))

(declare-fun m!734485 () Bool)

(assert (=> b!793541 m!734485))

(declare-fun m!734487 () Bool)

(assert (=> start!68376 m!734487))

(declare-fun m!734489 () Bool)

(assert (=> start!68376 m!734489))

(declare-fun m!734491 () Bool)

(assert (=> b!793540 m!734491))

(declare-fun m!734493 () Bool)

(assert (=> b!793543 m!734493))

(assert (=> b!793543 m!734493))

(declare-fun m!734495 () Bool)

(assert (=> b!793543 m!734495))

(declare-fun m!734497 () Bool)

(assert (=> b!793544 m!734497))

(check-sat (not start!68376) (not b!793540) (not b!793548) (not b!793547) (not b!793544) (not b!793543) (not b!793545) (not b!793541))
(check-sat)
