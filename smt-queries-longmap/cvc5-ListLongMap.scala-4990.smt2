; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68450 () Bool)

(assert start!68450)

(declare-fun b!795645 () Bool)

(declare-fun res!540169 () Bool)

(declare-fun e!441587 () Bool)

(assert (=> b!795645 (=> (not res!540169) (not e!441587))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795645 (= res!540169 (validKeyInArray!0 k!2044))))

(declare-fun b!795646 () Bool)

(declare-fun res!540166 () Bool)

(assert (=> b!795646 (=> (not res!540166) (not e!441587))))

(declare-datatypes ((array!43240 0))(
  ( (array!43241 (arr!20700 (Array (_ BitVec 32) (_ BitVec 64))) (size!21121 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43240)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795646 (= res!540166 (validKeyInArray!0 (select (arr!20700 a!3170) j!153)))))

(declare-fun b!795647 () Bool)

(declare-fun e!441586 () Bool)

(declare-fun e!441584 () Bool)

(assert (=> b!795647 (= e!441586 e!441584)))

(declare-fun res!540173 () Bool)

(assert (=> b!795647 (=> (not res!540173) (not e!441584))))

(declare-fun lt!354679 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354678 () array!43240)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8291 0))(
  ( (MissingZero!8291 (index!35532 (_ BitVec 32))) (Found!8291 (index!35533 (_ BitVec 32))) (Intermediate!8291 (undefined!9103 Bool) (index!35534 (_ BitVec 32)) (x!66449 (_ BitVec 32))) (Undefined!8291) (MissingVacant!8291 (index!35535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43240 (_ BitVec 32)) SeekEntryResult!8291)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43240 (_ BitVec 32)) SeekEntryResult!8291)

(assert (=> b!795647 (= res!540173 (= (seekEntryOrOpen!0 lt!354679 lt!354678 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354679 lt!354678 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795647 (= lt!354679 (select (store (arr!20700 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795647 (= lt!354678 (array!43241 (store (arr!20700 a!3170) i!1163 k!2044) (size!21121 a!3170)))))

(declare-fun b!795648 () Bool)

(declare-fun res!540171 () Bool)

(assert (=> b!795648 (=> (not res!540171) (not e!441587))))

(assert (=> b!795648 (= res!540171 (and (= (size!21121 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21121 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21121 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795649 () Bool)

(declare-fun res!540168 () Bool)

(assert (=> b!795649 (=> (not res!540168) (not e!441586))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795649 (= res!540168 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21121 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20700 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21121 a!3170)) (= (select (arr!20700 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795650 () Bool)

(assert (=> b!795650 (= e!441584 false)))

(declare-fun lt!354676 () SeekEntryResult!8291)

(assert (=> b!795650 (= lt!354676 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20700 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354680 () SeekEntryResult!8291)

(assert (=> b!795650 (= lt!354680 (seekEntryOrOpen!0 (select (arr!20700 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795651 () Bool)

(assert (=> b!795651 (= e!441587 e!441586)))

(declare-fun res!540165 () Bool)

(assert (=> b!795651 (=> (not res!540165) (not e!441586))))

(declare-fun lt!354677 () SeekEntryResult!8291)

(assert (=> b!795651 (= res!540165 (or (= lt!354677 (MissingZero!8291 i!1163)) (= lt!354677 (MissingVacant!8291 i!1163))))))

(assert (=> b!795651 (= lt!354677 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!540170 () Bool)

(assert (=> start!68450 (=> (not res!540170) (not e!441587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68450 (= res!540170 (validMask!0 mask!3266))))

(assert (=> start!68450 e!441587))

(assert (=> start!68450 true))

(declare-fun array_inv!16496 (array!43240) Bool)

(assert (=> start!68450 (array_inv!16496 a!3170)))

(declare-fun b!795652 () Bool)

(declare-fun res!540164 () Bool)

(assert (=> b!795652 (=> (not res!540164) (not e!441586))))

(declare-datatypes ((List!14663 0))(
  ( (Nil!14660) (Cons!14659 (h!15788 (_ BitVec 64)) (t!20978 List!14663)) )
))
(declare-fun arrayNoDuplicates!0 (array!43240 (_ BitVec 32) List!14663) Bool)

(assert (=> b!795652 (= res!540164 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14660))))

(declare-fun b!795653 () Bool)

(declare-fun res!540167 () Bool)

(assert (=> b!795653 (=> (not res!540167) (not e!441586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43240 (_ BitVec 32)) Bool)

(assert (=> b!795653 (= res!540167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795654 () Bool)

(declare-fun res!540172 () Bool)

(assert (=> b!795654 (=> (not res!540172) (not e!441587))))

(declare-fun arrayContainsKey!0 (array!43240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795654 (= res!540172 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68450 res!540170) b!795648))

(assert (= (and b!795648 res!540171) b!795646))

(assert (= (and b!795646 res!540166) b!795645))

(assert (= (and b!795645 res!540169) b!795654))

(assert (= (and b!795654 res!540172) b!795651))

(assert (= (and b!795651 res!540165) b!795653))

(assert (= (and b!795653 res!540167) b!795652))

(assert (= (and b!795652 res!540164) b!795649))

(assert (= (and b!795649 res!540168) b!795647))

(assert (= (and b!795647 res!540173) b!795650))

(declare-fun m!736319 () Bool)

(assert (=> b!795650 m!736319))

(assert (=> b!795650 m!736319))

(declare-fun m!736321 () Bool)

(assert (=> b!795650 m!736321))

(assert (=> b!795650 m!736319))

(declare-fun m!736323 () Bool)

(assert (=> b!795650 m!736323))

(declare-fun m!736325 () Bool)

(assert (=> b!795645 m!736325))

(declare-fun m!736327 () Bool)

(assert (=> start!68450 m!736327))

(declare-fun m!736329 () Bool)

(assert (=> start!68450 m!736329))

(declare-fun m!736331 () Bool)

(assert (=> b!795651 m!736331))

(declare-fun m!736333 () Bool)

(assert (=> b!795653 m!736333))

(declare-fun m!736335 () Bool)

(assert (=> b!795647 m!736335))

(declare-fun m!736337 () Bool)

(assert (=> b!795647 m!736337))

(declare-fun m!736339 () Bool)

(assert (=> b!795647 m!736339))

(declare-fun m!736341 () Bool)

(assert (=> b!795647 m!736341))

(declare-fun m!736343 () Bool)

(assert (=> b!795649 m!736343))

(declare-fun m!736345 () Bool)

(assert (=> b!795649 m!736345))

(declare-fun m!736347 () Bool)

(assert (=> b!795652 m!736347))

(declare-fun m!736349 () Bool)

(assert (=> b!795654 m!736349))

(assert (=> b!795646 m!736319))

(assert (=> b!795646 m!736319))

(declare-fun m!736351 () Bool)

(assert (=> b!795646 m!736351))

(push 1)

