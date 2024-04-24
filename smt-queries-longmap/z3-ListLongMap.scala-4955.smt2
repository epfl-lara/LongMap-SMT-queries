; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68364 () Bool)

(assert start!68364)

(declare-fun b!793403 () Bool)

(declare-fun e!440917 () Bool)

(declare-fun e!440916 () Bool)

(assert (=> b!793403 (= e!440917 e!440916)))

(declare-fun res!537548 () Bool)

(assert (=> b!793403 (=> (not res!537548) (not e!440916))))

(declare-datatypes ((SeekEntryResult!8137 0))(
  ( (MissingZero!8137 (index!34916 (_ BitVec 32))) (Found!8137 (index!34917 (_ BitVec 32))) (Intermediate!8137 (undefined!8949 Bool) (index!34918 (_ BitVec 32)) (x!66026 (_ BitVec 32))) (Undefined!8137) (MissingVacant!8137 (index!34919 (_ BitVec 32))) )
))
(declare-fun lt!353851 () SeekEntryResult!8137)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793403 (= res!537548 (or (= lt!353851 (MissingZero!8137 i!1163)) (= lt!353851 (MissingVacant!8137 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43028 0))(
  ( (array!43029 (arr!20590 (Array (_ BitVec 32) (_ BitVec 64))) (size!21010 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43028)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43028 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!793403 (= lt!353851 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!537554 () Bool)

(assert (=> start!68364 (=> (not res!537554) (not e!440917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68364 (= res!537554 (validMask!0 mask!3266))))

(assert (=> start!68364 e!440917))

(assert (=> start!68364 true))

(declare-fun array_inv!16449 (array!43028) Bool)

(assert (=> start!68364 (array_inv!16449 a!3170)))

(declare-fun b!793404 () Bool)

(declare-fun res!537549 () Bool)

(assert (=> b!793404 (=> (not res!537549) (not e!440917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793404 (= res!537549 (validKeyInArray!0 k0!2044))))

(declare-fun b!793405 () Bool)

(declare-fun res!537551 () Bool)

(assert (=> b!793405 (=> (not res!537551) (not e!440917))))

(declare-fun arrayContainsKey!0 (array!43028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793405 (= res!537551 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793406 () Bool)

(declare-fun res!537553 () Bool)

(assert (=> b!793406 (=> (not res!537553) (not e!440916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43028 (_ BitVec 32)) Bool)

(assert (=> b!793406 (= res!537553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793407 () Bool)

(declare-fun res!537550 () Bool)

(assert (=> b!793407 (=> (not res!537550) (not e!440917))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793407 (= res!537550 (validKeyInArray!0 (select (arr!20590 a!3170) j!153)))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun b!793408 () Bool)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793408 (= e!440916 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21010 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20590 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21010 a!3170)) (= (select (arr!20590 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!793409 () Bool)

(declare-fun res!537555 () Bool)

(assert (=> b!793409 (=> (not res!537555) (not e!440917))))

(assert (=> b!793409 (= res!537555 (and (= (size!21010 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21010 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21010 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793410 () Bool)

(declare-fun res!537552 () Bool)

(assert (=> b!793410 (=> (not res!537552) (not e!440916))))

(declare-datatypes ((List!14460 0))(
  ( (Nil!14457) (Cons!14456 (h!15591 (_ BitVec 64)) (t!20767 List!14460)) )
))
(declare-fun arrayNoDuplicates!0 (array!43028 (_ BitVec 32) List!14460) Bool)

(assert (=> b!793410 (= res!537552 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14457))))

(assert (= (and start!68364 res!537554) b!793409))

(assert (= (and b!793409 res!537555) b!793407))

(assert (= (and b!793407 res!537550) b!793404))

(assert (= (and b!793404 res!537549) b!793405))

(assert (= (and b!793405 res!537551) b!793403))

(assert (= (and b!793403 res!537548) b!793406))

(assert (= (and b!793406 res!537553) b!793410))

(assert (= (and b!793410 res!537552) b!793408))

(declare-fun m!734351 () Bool)

(assert (=> b!793408 m!734351))

(declare-fun m!734353 () Bool)

(assert (=> b!793408 m!734353))

(declare-fun m!734355 () Bool)

(assert (=> b!793406 m!734355))

(declare-fun m!734357 () Bool)

(assert (=> b!793404 m!734357))

(declare-fun m!734359 () Bool)

(assert (=> b!793410 m!734359))

(declare-fun m!734361 () Bool)

(assert (=> b!793407 m!734361))

(assert (=> b!793407 m!734361))

(declare-fun m!734363 () Bool)

(assert (=> b!793407 m!734363))

(declare-fun m!734365 () Bool)

(assert (=> b!793403 m!734365))

(declare-fun m!734367 () Bool)

(assert (=> start!68364 m!734367))

(declare-fun m!734369 () Bool)

(assert (=> start!68364 m!734369))

(declare-fun m!734371 () Bool)

(assert (=> b!793405 m!734371))

(check-sat (not b!793405) (not b!793403) (not b!793407) (not b!793406) (not b!793404) (not b!793410) (not start!68364))
(check-sat)
