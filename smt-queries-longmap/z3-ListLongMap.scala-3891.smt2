; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53358 () Bool)

(assert start!53358)

(declare-fun b!580347 () Bool)

(declare-fun res!368163 () Bool)

(declare-fun e!333303 () Bool)

(assert (=> b!580347 (=> (not res!368163) (not e!333303))))

(declare-datatypes ((array!36259 0))(
  ( (array!36260 (arr!17404 (Array (_ BitVec 32) (_ BitVec 64))) (size!17768 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36259)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580347 (= res!368163 (validKeyInArray!0 (select (arr!17404 a!2986) j!136)))))

(declare-fun b!580348 () Bool)

(declare-fun res!368164 () Bool)

(assert (=> b!580348 (=> (not res!368164) (not e!333303))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580348 (= res!368164 (and (= (size!17768 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17768 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17768 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580349 () Bool)

(declare-fun e!333302 () Bool)

(assert (=> b!580349 (= e!333302 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5844 0))(
  ( (MissingZero!5844 (index!25603 (_ BitVec 32))) (Found!5844 (index!25604 (_ BitVec 32))) (Intermediate!5844 (undefined!6656 Bool) (index!25605 (_ BitVec 32)) (x!54481 (_ BitVec 32))) (Undefined!5844) (MissingVacant!5844 (index!25606 (_ BitVec 32))) )
))
(declare-fun lt!264685 () SeekEntryResult!5844)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36259 (_ BitVec 32)) SeekEntryResult!5844)

(assert (=> b!580349 (= lt!264685 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17404 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580350 () Bool)

(declare-fun res!368170 () Bool)

(assert (=> b!580350 (=> (not res!368170) (not e!333302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36259 (_ BitVec 32)) Bool)

(assert (=> b!580350 (= res!368170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580351 () Bool)

(declare-fun res!368165 () Bool)

(assert (=> b!580351 (=> (not res!368165) (not e!333302))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!580351 (= res!368165 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17404 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17404 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368168 () Bool)

(assert (=> start!53358 (=> (not res!368168) (not e!333303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53358 (= res!368168 (validMask!0 mask!3053))))

(assert (=> start!53358 e!333303))

(assert (=> start!53358 true))

(declare-fun array_inv!13200 (array!36259) Bool)

(assert (=> start!53358 (array_inv!13200 a!2986)))

(declare-fun b!580352 () Bool)

(assert (=> b!580352 (= e!333303 e!333302)))

(declare-fun res!368167 () Bool)

(assert (=> b!580352 (=> (not res!368167) (not e!333302))))

(declare-fun lt!264684 () SeekEntryResult!5844)

(assert (=> b!580352 (= res!368167 (or (= lt!264684 (MissingZero!5844 i!1108)) (= lt!264684 (MissingVacant!5844 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36259 (_ BitVec 32)) SeekEntryResult!5844)

(assert (=> b!580352 (= lt!264684 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580353 () Bool)

(declare-fun res!368169 () Bool)

(assert (=> b!580353 (=> (not res!368169) (not e!333302))))

(declare-datatypes ((List!11445 0))(
  ( (Nil!11442) (Cons!11441 (h!12486 (_ BitVec 64)) (t!17673 List!11445)) )
))
(declare-fun arrayNoDuplicates!0 (array!36259 (_ BitVec 32) List!11445) Bool)

(assert (=> b!580353 (= res!368169 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11442))))

(declare-fun b!580354 () Bool)

(declare-fun res!368166 () Bool)

(assert (=> b!580354 (=> (not res!368166) (not e!333303))))

(declare-fun arrayContainsKey!0 (array!36259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580354 (= res!368166 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580355 () Bool)

(declare-fun res!368171 () Bool)

(assert (=> b!580355 (=> (not res!368171) (not e!333303))))

(assert (=> b!580355 (= res!368171 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53358 res!368168) b!580348))

(assert (= (and b!580348 res!368164) b!580347))

(assert (= (and b!580347 res!368163) b!580355))

(assert (= (and b!580355 res!368171) b!580354))

(assert (= (and b!580354 res!368166) b!580352))

(assert (= (and b!580352 res!368167) b!580350))

(assert (= (and b!580350 res!368170) b!580353))

(assert (= (and b!580353 res!368169) b!580351))

(assert (= (and b!580351 res!368165) b!580349))

(declare-fun m!558933 () Bool)

(assert (=> b!580350 m!558933))

(declare-fun m!558935 () Bool)

(assert (=> b!580347 m!558935))

(assert (=> b!580347 m!558935))

(declare-fun m!558937 () Bool)

(assert (=> b!580347 m!558937))

(declare-fun m!558939 () Bool)

(assert (=> b!580351 m!558939))

(declare-fun m!558941 () Bool)

(assert (=> b!580351 m!558941))

(declare-fun m!558943 () Bool)

(assert (=> b!580351 m!558943))

(assert (=> b!580349 m!558935))

(assert (=> b!580349 m!558935))

(declare-fun m!558945 () Bool)

(assert (=> b!580349 m!558945))

(declare-fun m!558947 () Bool)

(assert (=> b!580352 m!558947))

(declare-fun m!558949 () Bool)

(assert (=> b!580353 m!558949))

(declare-fun m!558951 () Bool)

(assert (=> b!580354 m!558951))

(declare-fun m!558953 () Bool)

(assert (=> b!580355 m!558953))

(declare-fun m!558955 () Bool)

(assert (=> start!53358 m!558955))

(declare-fun m!558957 () Bool)

(assert (=> start!53358 m!558957))

(check-sat (not b!580355) (not b!580352) (not start!53358) (not b!580349) (not b!580353) (not b!580350) (not b!580354) (not b!580347))
