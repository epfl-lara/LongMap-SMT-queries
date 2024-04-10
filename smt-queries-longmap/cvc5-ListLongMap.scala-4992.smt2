; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68462 () Bool)

(assert start!68462)

(declare-fun b!795825 () Bool)

(declare-fun res!540352 () Bool)

(declare-fun e!441659 () Bool)

(assert (=> b!795825 (=> (not res!540352) (not e!441659))))

(declare-datatypes ((array!43252 0))(
  ( (array!43253 (arr!20706 (Array (_ BitVec 32) (_ BitVec 64))) (size!21127 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43252)

(declare-datatypes ((List!14669 0))(
  ( (Nil!14666) (Cons!14665 (h!15794 (_ BitVec 64)) (t!20984 List!14669)) )
))
(declare-fun arrayNoDuplicates!0 (array!43252 (_ BitVec 32) List!14669) Bool)

(assert (=> b!795825 (= res!540352 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14666))))

(declare-fun b!795826 () Bool)

(declare-fun res!540345 () Bool)

(declare-fun e!441658 () Bool)

(assert (=> b!795826 (=> (not res!540345) (not e!441658))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795826 (= res!540345 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795827 () Bool)

(declare-fun e!441656 () Bool)

(assert (=> b!795827 (= e!441659 e!441656)))

(declare-fun res!540344 () Bool)

(assert (=> b!795827 (=> (not res!540344) (not e!441656))))

(declare-fun lt!354770 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354766 () array!43252)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8297 0))(
  ( (MissingZero!8297 (index!35556 (_ BitVec 32))) (Found!8297 (index!35557 (_ BitVec 32))) (Intermediate!8297 (undefined!9109 Bool) (index!35558 (_ BitVec 32)) (x!66471 (_ BitVec 32))) (Undefined!8297) (MissingVacant!8297 (index!35559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43252 (_ BitVec 32)) SeekEntryResult!8297)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43252 (_ BitVec 32)) SeekEntryResult!8297)

(assert (=> b!795827 (= res!540344 (= (seekEntryOrOpen!0 lt!354770 lt!354766 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354770 lt!354766 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795827 (= lt!354770 (select (store (arr!20706 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795827 (= lt!354766 (array!43253 (store (arr!20706 a!3170) i!1163 k!2044) (size!21127 a!3170)))))

(declare-fun b!795828 () Bool)

(declare-fun res!540353 () Bool)

(assert (=> b!795828 (=> (not res!540353) (not e!441658))))

(assert (=> b!795828 (= res!540353 (and (= (size!21127 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21127 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21127 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795829 () Bool)

(declare-fun res!540350 () Bool)

(assert (=> b!795829 (=> (not res!540350) (not e!441658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795829 (= res!540350 (validKeyInArray!0 k!2044))))

(declare-fun b!795830 () Bool)

(declare-fun lt!354769 () SeekEntryResult!8297)

(declare-fun lt!354767 () SeekEntryResult!8297)

(assert (=> b!795830 (= e!441656 (and (= lt!354769 lt!354767) (= lt!354767 (Found!8297 j!153)) (= (select (arr!20706 a!3170) index!1236) (select (arr!20706 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20706 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795830 (= lt!354767 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20706 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795830 (= lt!354769 (seekEntryOrOpen!0 (select (arr!20706 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795831 () Bool)

(declare-fun res!540347 () Bool)

(assert (=> b!795831 (=> (not res!540347) (not e!441659))))

(assert (=> b!795831 (= res!540347 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21127 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20706 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21127 a!3170)) (= (select (arr!20706 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795832 () Bool)

(declare-fun res!540351 () Bool)

(assert (=> b!795832 (=> (not res!540351) (not e!441659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43252 (_ BitVec 32)) Bool)

(assert (=> b!795832 (= res!540351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795834 () Bool)

(declare-fun res!540348 () Bool)

(assert (=> b!795834 (=> (not res!540348) (not e!441658))))

(assert (=> b!795834 (= res!540348 (validKeyInArray!0 (select (arr!20706 a!3170) j!153)))))

(declare-fun b!795833 () Bool)

(assert (=> b!795833 (= e!441658 e!441659)))

(declare-fun res!540349 () Bool)

(assert (=> b!795833 (=> (not res!540349) (not e!441659))))

(declare-fun lt!354768 () SeekEntryResult!8297)

(assert (=> b!795833 (= res!540349 (or (= lt!354768 (MissingZero!8297 i!1163)) (= lt!354768 (MissingVacant!8297 i!1163))))))

(assert (=> b!795833 (= lt!354768 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!540346 () Bool)

(assert (=> start!68462 (=> (not res!540346) (not e!441658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68462 (= res!540346 (validMask!0 mask!3266))))

(assert (=> start!68462 e!441658))

(assert (=> start!68462 true))

(declare-fun array_inv!16502 (array!43252) Bool)

(assert (=> start!68462 (array_inv!16502 a!3170)))

(assert (= (and start!68462 res!540346) b!795828))

(assert (= (and b!795828 res!540353) b!795834))

(assert (= (and b!795834 res!540348) b!795829))

(assert (= (and b!795829 res!540350) b!795826))

(assert (= (and b!795826 res!540345) b!795833))

(assert (= (and b!795833 res!540349) b!795832))

(assert (= (and b!795832 res!540351) b!795825))

(assert (= (and b!795825 res!540352) b!795831))

(assert (= (and b!795831 res!540347) b!795827))

(assert (= (and b!795827 res!540344) b!795830))

(declare-fun m!736529 () Bool)

(assert (=> b!795833 m!736529))

(declare-fun m!736531 () Bool)

(assert (=> b!795829 m!736531))

(declare-fun m!736533 () Bool)

(assert (=> b!795827 m!736533))

(declare-fun m!736535 () Bool)

(assert (=> b!795827 m!736535))

(declare-fun m!736537 () Bool)

(assert (=> b!795827 m!736537))

(declare-fun m!736539 () Bool)

(assert (=> b!795827 m!736539))

(declare-fun m!736541 () Bool)

(assert (=> b!795825 m!736541))

(declare-fun m!736543 () Bool)

(assert (=> b!795826 m!736543))

(declare-fun m!736545 () Bool)

(assert (=> b!795830 m!736545))

(declare-fun m!736547 () Bool)

(assert (=> b!795830 m!736547))

(declare-fun m!736549 () Bool)

(assert (=> b!795830 m!736549))

(assert (=> b!795830 m!736545))

(declare-fun m!736551 () Bool)

(assert (=> b!795830 m!736551))

(assert (=> b!795830 m!736545))

(declare-fun m!736553 () Bool)

(assert (=> b!795830 m!736553))

(assert (=> b!795830 m!736537))

(declare-fun m!736555 () Bool)

(assert (=> b!795831 m!736555))

(declare-fun m!736557 () Bool)

(assert (=> b!795831 m!736557))

(assert (=> b!795834 m!736545))

(assert (=> b!795834 m!736545))

(declare-fun m!736559 () Bool)

(assert (=> b!795834 m!736559))

(declare-fun m!736561 () Bool)

(assert (=> start!68462 m!736561))

(declare-fun m!736563 () Bool)

(assert (=> start!68462 m!736563))

(declare-fun m!736565 () Bool)

(assert (=> b!795832 m!736565))

(push 1)

