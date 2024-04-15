; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68380 () Bool)

(assert start!68380)

(declare-fun b!794635 () Bool)

(declare-fun e!441132 () Bool)

(declare-fun e!441131 () Bool)

(assert (=> b!794635 (= e!441132 e!441131)))

(declare-fun res!539302 () Bool)

(assert (=> b!794635 (=> (not res!539302) (not e!441131))))

(declare-fun lt!354083 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43187 0))(
  ( (array!43188 (arr!20674 (Array (_ BitVec 32) (_ BitVec 64))) (size!21095 (_ BitVec 32))) )
))
(declare-fun lt!354082 () array!43187)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8262 0))(
  ( (MissingZero!8262 (index!35416 (_ BitVec 32))) (Found!8262 (index!35417 (_ BitVec 32))) (Intermediate!8262 (undefined!9074 Bool) (index!35418 (_ BitVec 32)) (x!66343 (_ BitVec 32))) (Undefined!8262) (MissingVacant!8262 (index!35419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43187 (_ BitVec 32)) SeekEntryResult!8262)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43187 (_ BitVec 32)) SeekEntryResult!8262)

(assert (=> b!794635 (= res!539302 (= (seekEntryOrOpen!0 lt!354083 lt!354082 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354083 lt!354082 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43187)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!794635 (= lt!354083 (select (store (arr!20674 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794635 (= lt!354082 (array!43188 (store (arr!20674 a!3170) i!1163 k!2044) (size!21095 a!3170)))))

(declare-fun b!794636 () Bool)

(declare-fun res!539301 () Bool)

(assert (=> b!794636 (=> (not res!539301) (not e!441132))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794636 (= res!539301 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21095 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20674 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21095 a!3170)) (= (select (arr!20674 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794637 () Bool)

(declare-fun res!539304 () Bool)

(assert (=> b!794637 (=> (not res!539304) (not e!441131))))

(assert (=> b!794637 (= res!539304 (= (seekEntryOrOpen!0 (select (arr!20674 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20674 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun res!539303 () Bool)

(declare-fun e!441130 () Bool)

(assert (=> start!68380 (=> (not res!539303) (not e!441130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68380 (= res!539303 (validMask!0 mask!3266))))

(assert (=> start!68380 e!441130))

(assert (=> start!68380 true))

(declare-fun array_inv!16557 (array!43187) Bool)

(assert (=> start!68380 (array_inv!16557 a!3170)))

(declare-fun b!794638 () Bool)

(assert (=> b!794638 (= e!441130 e!441132)))

(declare-fun res!539299 () Bool)

(assert (=> b!794638 (=> (not res!539299) (not e!441132))))

(declare-fun lt!354081 () SeekEntryResult!8262)

(assert (=> b!794638 (= res!539299 (or (= lt!354081 (MissingZero!8262 i!1163)) (= lt!354081 (MissingVacant!8262 i!1163))))))

(assert (=> b!794638 (= lt!354081 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794639 () Bool)

(assert (=> b!794639 (= e!441131 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!794640 () Bool)

(declare-fun res!539295 () Bool)

(assert (=> b!794640 (=> (not res!539295) (not e!441130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794640 (= res!539295 (validKeyInArray!0 (select (arr!20674 a!3170) j!153)))))

(declare-fun b!794641 () Bool)

(declare-fun res!539298 () Bool)

(assert (=> b!794641 (=> (not res!539298) (not e!441130))))

(assert (=> b!794641 (= res!539298 (validKeyInArray!0 k!2044))))

(declare-fun b!794642 () Bool)

(declare-fun res!539296 () Bool)

(assert (=> b!794642 (=> (not res!539296) (not e!441132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43187 (_ BitVec 32)) Bool)

(assert (=> b!794642 (= res!539296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794643 () Bool)

(declare-fun res!539297 () Bool)

(assert (=> b!794643 (=> (not res!539297) (not e!441130))))

(assert (=> b!794643 (= res!539297 (and (= (size!21095 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21095 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21095 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794644 () Bool)

(declare-fun res!539300 () Bool)

(assert (=> b!794644 (=> (not res!539300) (not e!441130))))

(declare-fun arrayContainsKey!0 (array!43187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794644 (= res!539300 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794645 () Bool)

(declare-fun res!539294 () Bool)

(assert (=> b!794645 (=> (not res!539294) (not e!441132))))

(declare-datatypes ((List!14676 0))(
  ( (Nil!14673) (Cons!14672 (h!15801 (_ BitVec 64)) (t!20982 List!14676)) )
))
(declare-fun arrayNoDuplicates!0 (array!43187 (_ BitVec 32) List!14676) Bool)

(assert (=> b!794645 (= res!539294 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14673))))

(assert (= (and start!68380 res!539303) b!794643))

(assert (= (and b!794643 res!539297) b!794640))

(assert (= (and b!794640 res!539295) b!794641))

(assert (= (and b!794641 res!539298) b!794644))

(assert (= (and b!794644 res!539300) b!794638))

(assert (= (and b!794638 res!539299) b!794642))

(assert (= (and b!794642 res!539296) b!794645))

(assert (= (and b!794645 res!539294) b!794636))

(assert (= (and b!794636 res!539301) b!794635))

(assert (= (and b!794635 res!539302) b!794637))

(assert (= (and b!794637 res!539304) b!794639))

(declare-fun m!734715 () Bool)

(assert (=> b!794645 m!734715))

(declare-fun m!734717 () Bool)

(assert (=> b!794636 m!734717))

(declare-fun m!734719 () Bool)

(assert (=> b!794636 m!734719))

(declare-fun m!734721 () Bool)

(assert (=> b!794641 m!734721))

(declare-fun m!734723 () Bool)

(assert (=> b!794638 m!734723))

(declare-fun m!734725 () Bool)

(assert (=> start!68380 m!734725))

(declare-fun m!734727 () Bool)

(assert (=> start!68380 m!734727))

(declare-fun m!734729 () Bool)

(assert (=> b!794637 m!734729))

(assert (=> b!794637 m!734729))

(declare-fun m!734731 () Bool)

(assert (=> b!794637 m!734731))

(assert (=> b!794637 m!734729))

(declare-fun m!734733 () Bool)

(assert (=> b!794637 m!734733))

(declare-fun m!734735 () Bool)

(assert (=> b!794635 m!734735))

(declare-fun m!734737 () Bool)

(assert (=> b!794635 m!734737))

(declare-fun m!734739 () Bool)

(assert (=> b!794635 m!734739))

(declare-fun m!734741 () Bool)

(assert (=> b!794635 m!734741))

(declare-fun m!734743 () Bool)

(assert (=> b!794644 m!734743))

(declare-fun m!734745 () Bool)

(assert (=> b!794642 m!734745))

(assert (=> b!794640 m!734729))

(assert (=> b!794640 m!734729))

(declare-fun m!734747 () Bool)

(assert (=> b!794640 m!734747))

(push 1)

(assert (not b!794645))

(assert (not b!794637))

(assert (not b!794638))

(assert (not b!794644))

(assert (not start!68380))

(assert (not b!794642))

(assert (not b!794640))

(assert (not b!794641))

(assert (not b!794635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

