; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68232 () Bool)

(assert start!68232)

(declare-fun b!792639 () Bool)

(declare-fun res!537298 () Bool)

(declare-fun e!440394 () Bool)

(assert (=> b!792639 (=> (not res!537298) (not e!440394))))

(declare-datatypes ((array!43039 0))(
  ( (array!43040 (arr!20600 (Array (_ BitVec 32) (_ BitVec 64))) (size!21021 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43039)

(declare-datatypes ((List!14602 0))(
  ( (Nil!14599) (Cons!14598 (h!15727 (_ BitVec 64)) (t!20908 List!14602)) )
))
(declare-fun arrayNoDuplicates!0 (array!43039 (_ BitVec 32) List!14602) Bool)

(assert (=> b!792639 (= res!537298 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14599))))

(declare-fun b!792640 () Bool)

(declare-fun e!440393 () Bool)

(assert (=> b!792640 (= e!440393 e!440394)))

(declare-fun res!537300 () Bool)

(assert (=> b!792640 (=> (not res!537300) (not e!440394))))

(declare-datatypes ((SeekEntryResult!8188 0))(
  ( (MissingZero!8188 (index!35120 (_ BitVec 32))) (Found!8188 (index!35121 (_ BitVec 32))) (Intermediate!8188 (undefined!9000 Bool) (index!35122 (_ BitVec 32)) (x!66077 (_ BitVec 32))) (Undefined!8188) (MissingVacant!8188 (index!35123 (_ BitVec 32))) )
))
(declare-fun lt!353366 () SeekEntryResult!8188)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792640 (= res!537300 (or (= lt!353366 (MissingZero!8188 i!1163)) (= lt!353366 (MissingVacant!8188 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43039 (_ BitVec 32)) SeekEntryResult!8188)

(assert (=> b!792640 (= lt!353366 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792641 () Bool)

(declare-fun res!537301 () Bool)

(assert (=> b!792641 (=> (not res!537301) (not e!440393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792641 (= res!537301 (validKeyInArray!0 k0!2044))))

(declare-fun b!792642 () Bool)

(declare-fun res!537304 () Bool)

(assert (=> b!792642 (=> (not res!537304) (not e!440393))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792642 (= res!537304 (and (= (size!21021 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21021 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21021 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!537305 () Bool)

(assert (=> start!68232 (=> (not res!537305) (not e!440393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68232 (= res!537305 (validMask!0 mask!3266))))

(assert (=> start!68232 e!440393))

(assert (=> start!68232 true))

(declare-fun array_inv!16483 (array!43039) Bool)

(assert (=> start!68232 (array_inv!16483 a!3170)))

(declare-fun b!792643 () Bool)

(declare-fun res!537302 () Bool)

(assert (=> b!792643 (=> (not res!537302) (not e!440394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43039 (_ BitVec 32)) Bool)

(assert (=> b!792643 (= res!537302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792644 () Bool)

(declare-fun res!537303 () Bool)

(assert (=> b!792644 (=> (not res!537303) (not e!440394))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792644 (= res!537303 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21021 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20600 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21021 a!3170)) (= (select (arr!20600 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792645 () Bool)

(declare-fun res!537306 () Bool)

(assert (=> b!792645 (=> (not res!537306) (not e!440393))))

(declare-fun arrayContainsKey!0 (array!43039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792645 (= res!537306 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792646 () Bool)

(assert (=> b!792646 (= e!440394 (not (validKeyInArray!0 (select (store (arr!20600 a!3170) i!1163 k0!2044) j!153))))))

(declare-fun b!792647 () Bool)

(declare-fun res!537299 () Bool)

(assert (=> b!792647 (=> (not res!537299) (not e!440393))))

(assert (=> b!792647 (= res!537299 (validKeyInArray!0 (select (arr!20600 a!3170) j!153)))))

(assert (= (and start!68232 res!537305) b!792642))

(assert (= (and b!792642 res!537304) b!792647))

(assert (= (and b!792647 res!537299) b!792641))

(assert (= (and b!792641 res!537301) b!792645))

(assert (= (and b!792645 res!537306) b!792640))

(assert (= (and b!792640 res!537300) b!792643))

(assert (= (and b!792643 res!537302) b!792639))

(assert (= (and b!792639 res!537298) b!792644))

(assert (= (and b!792644 res!537303) b!792646))

(declare-fun m!732649 () Bool)

(assert (=> b!792646 m!732649))

(declare-fun m!732651 () Bool)

(assert (=> b!792646 m!732651))

(assert (=> b!792646 m!732651))

(declare-fun m!732653 () Bool)

(assert (=> b!792646 m!732653))

(declare-fun m!732655 () Bool)

(assert (=> b!792643 m!732655))

(declare-fun m!732657 () Bool)

(assert (=> b!792645 m!732657))

(declare-fun m!732659 () Bool)

(assert (=> b!792640 m!732659))

(declare-fun m!732661 () Bool)

(assert (=> b!792639 m!732661))

(declare-fun m!732663 () Bool)

(assert (=> b!792644 m!732663))

(declare-fun m!732665 () Bool)

(assert (=> b!792644 m!732665))

(declare-fun m!732667 () Bool)

(assert (=> b!792641 m!732667))

(declare-fun m!732669 () Bool)

(assert (=> b!792647 m!732669))

(assert (=> b!792647 m!732669))

(declare-fun m!732671 () Bool)

(assert (=> b!792647 m!732671))

(declare-fun m!732673 () Bool)

(assert (=> start!68232 m!732673))

(declare-fun m!732675 () Bool)

(assert (=> start!68232 m!732675))

(check-sat (not start!68232) (not b!792643) (not b!792640) (not b!792646) (not b!792645) (not b!792641) (not b!792647) (not b!792639))
(check-sat)
