; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68254 () Bool)

(assert start!68254)

(declare-fun b!792917 () Bool)

(declare-fun res!537443 () Bool)

(declare-fun e!440557 () Bool)

(assert (=> b!792917 (=> (not res!537443) (not e!440557))))

(declare-datatypes ((array!43044 0))(
  ( (array!43045 (arr!20602 (Array (_ BitVec 32) (_ BitVec 64))) (size!21023 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43044)

(declare-datatypes ((List!14565 0))(
  ( (Nil!14562) (Cons!14561 (h!15690 (_ BitVec 64)) (t!20880 List!14565)) )
))
(declare-fun arrayNoDuplicates!0 (array!43044 (_ BitVec 32) List!14565) Bool)

(assert (=> b!792917 (= res!537443 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14562))))

(declare-fun b!792918 () Bool)

(declare-fun e!440558 () Bool)

(assert (=> b!792918 (= e!440558 e!440557)))

(declare-fun res!537438 () Bool)

(assert (=> b!792918 (=> (not res!537438) (not e!440557))))

(declare-datatypes ((SeekEntryResult!8193 0))(
  ( (MissingZero!8193 (index!35140 (_ BitVec 32))) (Found!8193 (index!35141 (_ BitVec 32))) (Intermediate!8193 (undefined!9005 Bool) (index!35142 (_ BitVec 32)) (x!66087 (_ BitVec 32))) (Undefined!8193) (MissingVacant!8193 (index!35143 (_ BitVec 32))) )
))
(declare-fun lt!353609 () SeekEntryResult!8193)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792918 (= res!537438 (or (= lt!353609 (MissingZero!8193 i!1163)) (= lt!353609 (MissingVacant!8193 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43044 (_ BitVec 32)) SeekEntryResult!8193)

(assert (=> b!792918 (= lt!353609 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun b!792919 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792919 (= e!440557 (not (validKeyInArray!0 (select (store (arr!20602 a!3170) i!1163 k0!2044) j!153))))))

(declare-fun b!792920 () Bool)

(declare-fun res!537440 () Bool)

(assert (=> b!792920 (=> (not res!537440) (not e!440558))))

(assert (=> b!792920 (= res!537440 (validKeyInArray!0 (select (arr!20602 a!3170) j!153)))))

(declare-fun b!792921 () Bool)

(declare-fun res!537435 () Bool)

(assert (=> b!792921 (=> (not res!537435) (not e!440557))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792921 (= res!537435 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21023 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20602 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21023 a!3170)) (= (select (arr!20602 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792922 () Bool)

(declare-fun res!537442 () Bool)

(assert (=> b!792922 (=> (not res!537442) (not e!440558))))

(assert (=> b!792922 (= res!537442 (and (= (size!21023 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21023 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21023 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792923 () Bool)

(declare-fun res!537441 () Bool)

(assert (=> b!792923 (=> (not res!537441) (not e!440558))))

(assert (=> b!792923 (= res!537441 (validKeyInArray!0 k0!2044))))

(declare-fun b!792924 () Bool)

(declare-fun res!537437 () Bool)

(assert (=> b!792924 (=> (not res!537437) (not e!440558))))

(declare-fun arrayContainsKey!0 (array!43044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792924 (= res!537437 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!537436 () Bool)

(assert (=> start!68254 (=> (not res!537436) (not e!440558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68254 (= res!537436 (validMask!0 mask!3266))))

(assert (=> start!68254 e!440558))

(assert (=> start!68254 true))

(declare-fun array_inv!16398 (array!43044) Bool)

(assert (=> start!68254 (array_inv!16398 a!3170)))

(declare-fun b!792916 () Bool)

(declare-fun res!537439 () Bool)

(assert (=> b!792916 (=> (not res!537439) (not e!440557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43044 (_ BitVec 32)) Bool)

(assert (=> b!792916 (= res!537439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68254 res!537436) b!792922))

(assert (= (and b!792922 res!537442) b!792920))

(assert (= (and b!792920 res!537440) b!792923))

(assert (= (and b!792923 res!537441) b!792924))

(assert (= (and b!792924 res!537437) b!792918))

(assert (= (and b!792918 res!537438) b!792916))

(assert (= (and b!792916 res!537439) b!792917))

(assert (= (and b!792917 res!537443) b!792921))

(assert (= (and b!792921 res!537435) b!792919))

(declare-fun m!733419 () Bool)

(assert (=> b!792921 m!733419))

(declare-fun m!733421 () Bool)

(assert (=> b!792921 m!733421))

(declare-fun m!733423 () Bool)

(assert (=> b!792923 m!733423))

(declare-fun m!733425 () Bool)

(assert (=> b!792917 m!733425))

(declare-fun m!733427 () Bool)

(assert (=> start!68254 m!733427))

(declare-fun m!733429 () Bool)

(assert (=> start!68254 m!733429))

(declare-fun m!733431 () Bool)

(assert (=> b!792920 m!733431))

(assert (=> b!792920 m!733431))

(declare-fun m!733433 () Bool)

(assert (=> b!792920 m!733433))

(declare-fun m!733435 () Bool)

(assert (=> b!792918 m!733435))

(declare-fun m!733437 () Bool)

(assert (=> b!792919 m!733437))

(declare-fun m!733439 () Bool)

(assert (=> b!792919 m!733439))

(assert (=> b!792919 m!733439))

(declare-fun m!733441 () Bool)

(assert (=> b!792919 m!733441))

(declare-fun m!733443 () Bool)

(assert (=> b!792924 m!733443))

(declare-fun m!733445 () Bool)

(assert (=> b!792916 m!733445))

(check-sat (not b!792917) (not b!792923) (not b!792920) (not b!792924) (not b!792918) (not start!68254) (not b!792919) (not b!792916))
(check-sat)
