; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68382 () Bool)

(assert start!68382)

(declare-fun b!794666 () Bool)

(declare-fun res!539327 () Bool)

(declare-fun e!441142 () Bool)

(assert (=> b!794666 (=> (not res!539327) (not e!441142))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43189 0))(
  ( (array!43190 (arr!20675 (Array (_ BitVec 32) (_ BitVec 64))) (size!21096 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43189)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794666 (= res!539327 (and (= (size!21096 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21096 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21096 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!539333 () Bool)

(assert (=> start!68382 (=> (not res!539333) (not e!441142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68382 (= res!539333 (validMask!0 mask!3266))))

(assert (=> start!68382 e!441142))

(assert (=> start!68382 true))

(declare-fun array_inv!16558 (array!43189) Bool)

(assert (=> start!68382 (array_inv!16558 a!3170)))

(declare-fun b!794667 () Bool)

(declare-fun res!539325 () Bool)

(declare-fun e!441144 () Bool)

(assert (=> b!794667 (=> (not res!539325) (not e!441144))))

(declare-datatypes ((List!14677 0))(
  ( (Nil!14674) (Cons!14673 (h!15802 (_ BitVec 64)) (t!20983 List!14677)) )
))
(declare-fun arrayNoDuplicates!0 (array!43189 (_ BitVec 32) List!14677) Bool)

(assert (=> b!794667 (= res!539325 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14674))))

(declare-fun b!794668 () Bool)

(declare-fun res!539331 () Bool)

(assert (=> b!794668 (=> (not res!539331) (not e!441142))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794668 (= res!539331 (validKeyInArray!0 k0!2044))))

(declare-fun b!794669 () Bool)

(declare-fun res!539326 () Bool)

(assert (=> b!794669 (=> (not res!539326) (not e!441142))))

(declare-fun arrayContainsKey!0 (array!43189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794669 (= res!539326 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794670 () Bool)

(declare-fun res!539329 () Bool)

(assert (=> b!794670 (=> (not res!539329) (not e!441142))))

(assert (=> b!794670 (= res!539329 (validKeyInArray!0 (select (arr!20675 a!3170) j!153)))))

(declare-fun b!794671 () Bool)

(assert (=> b!794671 (= e!441142 e!441144)))

(declare-fun res!539328 () Bool)

(assert (=> b!794671 (=> (not res!539328) (not e!441144))))

(declare-datatypes ((SeekEntryResult!8263 0))(
  ( (MissingZero!8263 (index!35420 (_ BitVec 32))) (Found!8263 (index!35421 (_ BitVec 32))) (Intermediate!8263 (undefined!9075 Bool) (index!35422 (_ BitVec 32)) (x!66352 (_ BitVec 32))) (Undefined!8263) (MissingVacant!8263 (index!35423 (_ BitVec 32))) )
))
(declare-fun lt!354094 () SeekEntryResult!8263)

(assert (=> b!794671 (= res!539328 (or (= lt!354094 (MissingZero!8263 i!1163)) (= lt!354094 (MissingVacant!8263 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43189 (_ BitVec 32)) SeekEntryResult!8263)

(assert (=> b!794671 (= lt!354094 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794672 () Bool)

(declare-fun res!539332 () Bool)

(assert (=> b!794672 (=> (not res!539332) (not e!441144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43189 (_ BitVec 32)) Bool)

(assert (=> b!794672 (= res!539332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794673 () Bool)

(declare-fun res!539334 () Bool)

(assert (=> b!794673 (=> (not res!539334) (not e!441144))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794673 (= res!539334 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21096 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20675 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21096 a!3170)) (= (select (arr!20675 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794674 () Bool)

(declare-fun e!441145 () Bool)

(assert (=> b!794674 (= e!441144 e!441145)))

(declare-fun res!539330 () Bool)

(assert (=> b!794674 (=> (not res!539330) (not e!441145))))

(declare-fun lt!354098 () (_ BitVec 64))

(declare-fun lt!354097 () array!43189)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43189 (_ BitVec 32)) SeekEntryResult!8263)

(assert (=> b!794674 (= res!539330 (= (seekEntryOrOpen!0 lt!354098 lt!354097 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354098 lt!354097 mask!3266)))))

(assert (=> b!794674 (= lt!354098 (select (store (arr!20675 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794674 (= lt!354097 (array!43190 (store (arr!20675 a!3170) i!1163 k0!2044) (size!21096 a!3170)))))

(declare-fun b!794675 () Bool)

(assert (=> b!794675 (= e!441145 false)))

(declare-fun lt!354096 () SeekEntryResult!8263)

(assert (=> b!794675 (= lt!354096 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20675 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354095 () SeekEntryResult!8263)

(assert (=> b!794675 (= lt!354095 (seekEntryOrOpen!0 (select (arr!20675 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68382 res!539333) b!794666))

(assert (= (and b!794666 res!539327) b!794670))

(assert (= (and b!794670 res!539329) b!794668))

(assert (= (and b!794668 res!539331) b!794669))

(assert (= (and b!794669 res!539326) b!794671))

(assert (= (and b!794671 res!539328) b!794672))

(assert (= (and b!794672 res!539332) b!794667))

(assert (= (and b!794667 res!539325) b!794673))

(assert (= (and b!794673 res!539334) b!794674))

(assert (= (and b!794674 res!539330) b!794675))

(declare-fun m!734749 () Bool)

(assert (=> b!794668 m!734749))

(declare-fun m!734751 () Bool)

(assert (=> b!794675 m!734751))

(assert (=> b!794675 m!734751))

(declare-fun m!734753 () Bool)

(assert (=> b!794675 m!734753))

(assert (=> b!794675 m!734751))

(declare-fun m!734755 () Bool)

(assert (=> b!794675 m!734755))

(declare-fun m!734757 () Bool)

(assert (=> b!794667 m!734757))

(declare-fun m!734759 () Bool)

(assert (=> b!794671 m!734759))

(declare-fun m!734761 () Bool)

(assert (=> b!794674 m!734761))

(declare-fun m!734763 () Bool)

(assert (=> b!794674 m!734763))

(declare-fun m!734765 () Bool)

(assert (=> b!794674 m!734765))

(declare-fun m!734767 () Bool)

(assert (=> b!794674 m!734767))

(declare-fun m!734769 () Bool)

(assert (=> b!794669 m!734769))

(declare-fun m!734771 () Bool)

(assert (=> b!794673 m!734771))

(declare-fun m!734773 () Bool)

(assert (=> b!794673 m!734773))

(declare-fun m!734775 () Bool)

(assert (=> b!794672 m!734775))

(assert (=> b!794670 m!734751))

(assert (=> b!794670 m!734751))

(declare-fun m!734777 () Bool)

(assert (=> b!794670 m!734777))

(declare-fun m!734779 () Bool)

(assert (=> start!68382 m!734779))

(declare-fun m!734781 () Bool)

(assert (=> start!68382 m!734781))

(check-sat (not b!794668) (not b!794672) (not start!68382) (not b!794674) (not b!794670) (not b!794675) (not b!794667) (not b!794671) (not b!794669))
(check-sat)
