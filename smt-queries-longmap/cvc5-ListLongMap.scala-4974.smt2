; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68354 () Bool)

(assert start!68354)

(declare-fun b!794204 () Bool)

(declare-fun e!441035 () Bool)

(declare-fun e!441034 () Bool)

(assert (=> b!794204 (= e!441035 e!441034)))

(declare-fun res!538726 () Bool)

(assert (=> b!794204 (=> (not res!538726) (not e!441034))))

(declare-datatypes ((SeekEntryResult!8243 0))(
  ( (MissingZero!8243 (index!35340 (_ BitVec 32))) (Found!8243 (index!35341 (_ BitVec 32))) (Intermediate!8243 (undefined!9055 Bool) (index!35342 (_ BitVec 32)) (x!66273 (_ BitVec 32))) (Undefined!8243) (MissingVacant!8243 (index!35343 (_ BitVec 32))) )
))
(declare-fun lt!354031 () SeekEntryResult!8243)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794204 (= res!538726 (or (= lt!354031 (MissingZero!8243 i!1163)) (= lt!354031 (MissingVacant!8243 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43144 0))(
  ( (array!43145 (arr!20652 (Array (_ BitVec 32) (_ BitVec 64))) (size!21073 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43144)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43144 (_ BitVec 32)) SeekEntryResult!8243)

(assert (=> b!794204 (= lt!354031 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794205 () Bool)

(declare-fun res!538723 () Bool)

(assert (=> b!794205 (=> (not res!538723) (not e!441035))))

(declare-fun arrayContainsKey!0 (array!43144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794205 (= res!538723 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794206 () Bool)

(assert (=> b!794206 (= e!441034 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354032 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354029 () SeekEntryResult!8243)

(declare-fun lt!354028 () array!43144)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43144 (_ BitVec 32)) SeekEntryResult!8243)

(assert (=> b!794206 (= lt!354029 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354032 lt!354028 mask!3266))))

(declare-fun lt!354030 () SeekEntryResult!8243)

(assert (=> b!794206 (= lt!354030 (seekEntryOrOpen!0 lt!354032 lt!354028 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794206 (= lt!354032 (select (store (arr!20652 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794206 (= lt!354028 (array!43145 (store (arr!20652 a!3170) i!1163 k!2044) (size!21073 a!3170)))))

(declare-fun b!794207 () Bool)

(declare-fun res!538730 () Bool)

(assert (=> b!794207 (=> (not res!538730) (not e!441035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794207 (= res!538730 (validKeyInArray!0 (select (arr!20652 a!3170) j!153)))))

(declare-fun b!794208 () Bool)

(declare-fun res!538728 () Bool)

(assert (=> b!794208 (=> (not res!538728) (not e!441034))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794208 (= res!538728 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21073 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20652 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21073 a!3170)) (= (select (arr!20652 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794209 () Bool)

(declare-fun res!538729 () Bool)

(assert (=> b!794209 (=> (not res!538729) (not e!441034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43144 (_ BitVec 32)) Bool)

(assert (=> b!794209 (= res!538729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794203 () Bool)

(declare-fun res!538727 () Bool)

(assert (=> b!794203 (=> (not res!538727) (not e!441034))))

(declare-datatypes ((List!14615 0))(
  ( (Nil!14612) (Cons!14611 (h!15740 (_ BitVec 64)) (t!20930 List!14615)) )
))
(declare-fun arrayNoDuplicates!0 (array!43144 (_ BitVec 32) List!14615) Bool)

(assert (=> b!794203 (= res!538727 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14612))))

(declare-fun res!538722 () Bool)

(assert (=> start!68354 (=> (not res!538722) (not e!441035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68354 (= res!538722 (validMask!0 mask!3266))))

(assert (=> start!68354 e!441035))

(assert (=> start!68354 true))

(declare-fun array_inv!16448 (array!43144) Bool)

(assert (=> start!68354 (array_inv!16448 a!3170)))

(declare-fun b!794210 () Bool)

(declare-fun res!538725 () Bool)

(assert (=> b!794210 (=> (not res!538725) (not e!441035))))

(assert (=> b!794210 (= res!538725 (validKeyInArray!0 k!2044))))

(declare-fun b!794211 () Bool)

(declare-fun res!538724 () Bool)

(assert (=> b!794211 (=> (not res!538724) (not e!441035))))

(assert (=> b!794211 (= res!538724 (and (= (size!21073 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21073 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21073 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68354 res!538722) b!794211))

(assert (= (and b!794211 res!538724) b!794207))

(assert (= (and b!794207 res!538730) b!794210))

(assert (= (and b!794210 res!538725) b!794205))

(assert (= (and b!794205 res!538723) b!794204))

(assert (= (and b!794204 res!538726) b!794209))

(assert (= (and b!794209 res!538729) b!794203))

(assert (= (and b!794203 res!538727) b!794208))

(assert (= (and b!794208 res!538728) b!794206))

(declare-fun m!734723 () Bool)

(assert (=> b!794209 m!734723))

(declare-fun m!734725 () Bool)

(assert (=> b!794205 m!734725))

(declare-fun m!734727 () Bool)

(assert (=> b!794208 m!734727))

(declare-fun m!734729 () Bool)

(assert (=> b!794208 m!734729))

(declare-fun m!734731 () Bool)

(assert (=> b!794203 m!734731))

(declare-fun m!734733 () Bool)

(assert (=> b!794206 m!734733))

(declare-fun m!734735 () Bool)

(assert (=> b!794206 m!734735))

(declare-fun m!734737 () Bool)

(assert (=> b!794206 m!734737))

(declare-fun m!734739 () Bool)

(assert (=> b!794206 m!734739))

(declare-fun m!734741 () Bool)

(assert (=> start!68354 m!734741))

(declare-fun m!734743 () Bool)

(assert (=> start!68354 m!734743))

(declare-fun m!734745 () Bool)

(assert (=> b!794210 m!734745))

(declare-fun m!734747 () Bool)

(assert (=> b!794207 m!734747))

(assert (=> b!794207 m!734747))

(declare-fun m!734749 () Bool)

(assert (=> b!794207 m!734749))

(declare-fun m!734751 () Bool)

(assert (=> b!794204 m!734751))

(push 1)

