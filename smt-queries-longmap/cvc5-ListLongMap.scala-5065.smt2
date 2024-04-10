; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68900 () Bool)

(assert start!68900)

(declare-fun b!803605 () Bool)

(declare-fun res!548132 () Bool)

(declare-fun e!445283 () Bool)

(assert (=> b!803605 (=> (not res!548132) (not e!445283))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43690 0))(
  ( (array!43691 (arr!20925 (Array (_ BitVec 32) (_ BitVec 64))) (size!21346 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43690)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803605 (= res!548132 (and (= (size!21346 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21346 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21346 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803606 () Bool)

(declare-fun e!445281 () Bool)

(declare-fun e!445279 () Bool)

(assert (=> b!803606 (= e!445281 e!445279)))

(declare-fun res!548130 () Bool)

(assert (=> b!803606 (=> (not res!548130) (not e!445279))))

(declare-datatypes ((SeekEntryResult!8516 0))(
  ( (MissingZero!8516 (index!36432 (_ BitVec 32))) (Found!8516 (index!36433 (_ BitVec 32))) (Intermediate!8516 (undefined!9328 Bool) (index!36434 (_ BitVec 32)) (x!67274 (_ BitVec 32))) (Undefined!8516) (MissingVacant!8516 (index!36435 (_ BitVec 32))) )
))
(declare-fun lt!359722 () SeekEntryResult!8516)

(declare-fun lt!359717 () SeekEntryResult!8516)

(assert (=> b!803606 (= res!548130 (= lt!359722 lt!359717))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359719 () (_ BitVec 64))

(declare-fun lt!359724 () array!43690)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43690 (_ BitVec 32)) SeekEntryResult!8516)

(assert (=> b!803606 (= lt!359717 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359719 lt!359724 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43690 (_ BitVec 32)) SeekEntryResult!8516)

(assert (=> b!803606 (= lt!359722 (seekEntryOrOpen!0 lt!359719 lt!359724 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!803606 (= lt!359719 (select (store (arr!20925 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803606 (= lt!359724 (array!43691 (store (arr!20925 a!3170) i!1163 k!2044) (size!21346 a!3170)))))

(declare-fun b!803608 () Bool)

(assert (=> b!803608 (= e!445283 e!445281)))

(declare-fun res!548133 () Bool)

(assert (=> b!803608 (=> (not res!548133) (not e!445281))))

(declare-fun lt!359720 () SeekEntryResult!8516)

(assert (=> b!803608 (= res!548133 (or (= lt!359720 (MissingZero!8516 i!1163)) (= lt!359720 (MissingVacant!8516 i!1163))))))

(assert (=> b!803608 (= lt!359720 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803609 () Bool)

(declare-fun res!548127 () Bool)

(assert (=> b!803609 (=> (not res!548127) (not e!445283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803609 (= res!548127 (validKeyInArray!0 k!2044))))

(declare-fun b!803610 () Bool)

(declare-fun res!548126 () Bool)

(assert (=> b!803610 (=> (not res!548126) (not e!445283))))

(declare-fun arrayContainsKey!0 (array!43690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803610 (= res!548126 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803611 () Bool)

(declare-fun e!445280 () Bool)

(assert (=> b!803611 (= e!445279 e!445280)))

(declare-fun res!548128 () Bool)

(assert (=> b!803611 (=> (not res!548128) (not e!445280))))

(declare-fun lt!359726 () SeekEntryResult!8516)

(declare-fun lt!359721 () SeekEntryResult!8516)

(assert (=> b!803611 (= res!548128 (= lt!359726 lt!359721))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803611 (= lt!359721 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20925 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803611 (= lt!359726 (seekEntryOrOpen!0 (select (arr!20925 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803612 () Bool)

(declare-fun res!548124 () Bool)

(assert (=> b!803612 (=> (not res!548124) (not e!445281))))

(declare-datatypes ((List!14888 0))(
  ( (Nil!14885) (Cons!14884 (h!16013 (_ BitVec 64)) (t!21203 List!14888)) )
))
(declare-fun arrayNoDuplicates!0 (array!43690 (_ BitVec 32) List!14888) Bool)

(assert (=> b!803612 (= res!548124 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14885))))

(declare-fun e!445282 () Bool)

(declare-fun b!803613 () Bool)

(declare-fun lt!359725 () SeekEntryResult!8516)

(assert (=> b!803613 (= e!445282 (not (or (not (= lt!359717 lt!359725)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359718 () (_ BitVec 32))

(assert (=> b!803613 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359718 vacantAfter!23 lt!359719 lt!359724 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359718 vacantBefore!23 (select (arr!20925 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27572 0))(
  ( (Unit!27573) )
))
(declare-fun lt!359723 () Unit!27572)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43690 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27572)

(assert (=> b!803613 (= lt!359723 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359718 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803613 (= lt!359718 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!548135 () Bool)

(assert (=> start!68900 (=> (not res!548135) (not e!445283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68900 (= res!548135 (validMask!0 mask!3266))))

(assert (=> start!68900 e!445283))

(assert (=> start!68900 true))

(declare-fun array_inv!16721 (array!43690) Bool)

(assert (=> start!68900 (array_inv!16721 a!3170)))

(declare-fun b!803607 () Bool)

(declare-fun res!548125 () Bool)

(assert (=> b!803607 (=> (not res!548125) (not e!445283))))

(assert (=> b!803607 (= res!548125 (validKeyInArray!0 (select (arr!20925 a!3170) j!153)))))

(declare-fun b!803614 () Bool)

(assert (=> b!803614 (= e!445280 e!445282)))

(declare-fun res!548131 () Bool)

(assert (=> b!803614 (=> (not res!548131) (not e!445282))))

(assert (=> b!803614 (= res!548131 (and (= lt!359721 lt!359725) (not (= (select (arr!20925 a!3170) index!1236) (select (arr!20925 a!3170) j!153)))))))

(assert (=> b!803614 (= lt!359725 (Found!8516 j!153))))

(declare-fun b!803615 () Bool)

(declare-fun res!548134 () Bool)

(assert (=> b!803615 (=> (not res!548134) (not e!445281))))

(assert (=> b!803615 (= res!548134 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21346 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20925 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21346 a!3170)) (= (select (arr!20925 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803616 () Bool)

(declare-fun res!548129 () Bool)

(assert (=> b!803616 (=> (not res!548129) (not e!445281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43690 (_ BitVec 32)) Bool)

(assert (=> b!803616 (= res!548129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68900 res!548135) b!803605))

(assert (= (and b!803605 res!548132) b!803607))

(assert (= (and b!803607 res!548125) b!803609))

(assert (= (and b!803609 res!548127) b!803610))

(assert (= (and b!803610 res!548126) b!803608))

(assert (= (and b!803608 res!548133) b!803616))

(assert (= (and b!803616 res!548129) b!803612))

(assert (= (and b!803612 res!548124) b!803615))

(assert (= (and b!803615 res!548134) b!803606))

(assert (= (and b!803606 res!548130) b!803611))

(assert (= (and b!803611 res!548128) b!803614))

(assert (= (and b!803614 res!548131) b!803613))

(declare-fun m!745379 () Bool)

(assert (=> b!803610 m!745379))

(declare-fun m!745381 () Bool)

(assert (=> b!803613 m!745381))

(declare-fun m!745383 () Bool)

(assert (=> b!803613 m!745383))

(declare-fun m!745385 () Bool)

(assert (=> b!803613 m!745385))

(assert (=> b!803613 m!745381))

(declare-fun m!745387 () Bool)

(assert (=> b!803613 m!745387))

(declare-fun m!745389 () Bool)

(assert (=> b!803613 m!745389))

(declare-fun m!745391 () Bool)

(assert (=> b!803608 m!745391))

(declare-fun m!745393 () Bool)

(assert (=> b!803614 m!745393))

(assert (=> b!803614 m!745381))

(declare-fun m!745395 () Bool)

(assert (=> b!803615 m!745395))

(declare-fun m!745397 () Bool)

(assert (=> b!803615 m!745397))

(assert (=> b!803611 m!745381))

(assert (=> b!803611 m!745381))

(declare-fun m!745399 () Bool)

(assert (=> b!803611 m!745399))

(assert (=> b!803611 m!745381))

(declare-fun m!745401 () Bool)

(assert (=> b!803611 m!745401))

(assert (=> b!803607 m!745381))

(assert (=> b!803607 m!745381))

(declare-fun m!745403 () Bool)

(assert (=> b!803607 m!745403))

(declare-fun m!745405 () Bool)

(assert (=> start!68900 m!745405))

(declare-fun m!745407 () Bool)

(assert (=> start!68900 m!745407))

(declare-fun m!745409 () Bool)

(assert (=> b!803612 m!745409))

(declare-fun m!745411 () Bool)

(assert (=> b!803606 m!745411))

(declare-fun m!745413 () Bool)

(assert (=> b!803606 m!745413))

(declare-fun m!745415 () Bool)

(assert (=> b!803606 m!745415))

(declare-fun m!745417 () Bool)

(assert (=> b!803606 m!745417))

(declare-fun m!745419 () Bool)

(assert (=> b!803609 m!745419))

(declare-fun m!745421 () Bool)

(assert (=> b!803616 m!745421))

(push 1)

(assert (not b!803608))

(assert (not b!803609))

(assert (not b!803616))

(assert (not b!803607))

(assert (not b!803606))

(assert (not b!803612))

(assert (not b!803611))

(assert (not b!803610))

(assert (not b!803613))

(assert (not start!68900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

