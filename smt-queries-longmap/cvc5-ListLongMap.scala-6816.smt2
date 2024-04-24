; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85898 () Bool)

(assert start!85898)

(declare-fun res!665585 () Bool)

(declare-fun e!561933 () Bool)

(assert (=> start!85898 (=> (not res!665585) (not e!561933))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85898 (= res!665585 (validMask!0 mask!3464))))

(assert (=> start!85898 e!561933))

(declare-datatypes ((array!62974 0))(
  ( (array!62975 (arr!30321 (Array (_ BitVec 32) (_ BitVec 64))) (size!30824 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62974)

(declare-fun array_inv!23457 (array!62974) Bool)

(assert (=> start!85898 (array_inv!23457 a!3219)))

(assert (=> start!85898 true))

(declare-fun b!995643 () Bool)

(assert (=> b!995643 (= e!561933 false)))

(declare-datatypes ((SeekEntryResult!9189 0))(
  ( (MissingZero!9189 (index!39127 (_ BitVec 32))) (Found!9189 (index!39128 (_ BitVec 32))) (Intermediate!9189 (undefined!10001 Bool) (index!39129 (_ BitVec 32)) (x!86724 (_ BitVec 32))) (Undefined!9189) (MissingVacant!9189 (index!39130 (_ BitVec 32))) )
))
(declare-fun lt!441116 () SeekEntryResult!9189)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62974 (_ BitVec 32)) SeekEntryResult!9189)

(assert (=> b!995643 (= lt!441116 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995644 () Bool)

(declare-fun res!665586 () Bool)

(assert (=> b!995644 (=> (not res!665586) (not e!561933))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995644 (= res!665586 (validKeyInArray!0 (select (arr!30321 a!3219) j!170)))))

(declare-fun b!995645 () Bool)

(declare-fun res!665587 () Bool)

(assert (=> b!995645 (=> (not res!665587) (not e!561933))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995645 (= res!665587 (and (= (size!30824 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30824 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30824 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995646 () Bool)

(declare-fun res!665588 () Bool)

(assert (=> b!995646 (=> (not res!665588) (not e!561933))))

(assert (=> b!995646 (= res!665588 (validKeyInArray!0 k!2224))))

(declare-fun b!995647 () Bool)

(declare-fun res!665584 () Bool)

(assert (=> b!995647 (=> (not res!665584) (not e!561933))))

(declare-fun arrayContainsKey!0 (array!62974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995647 (= res!665584 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85898 res!665585) b!995645))

(assert (= (and b!995645 res!665587) b!995644))

(assert (= (and b!995644 res!665586) b!995646))

(assert (= (and b!995646 res!665588) b!995647))

(assert (= (and b!995647 res!665584) b!995643))

(declare-fun m!923601 () Bool)

(assert (=> b!995644 m!923601))

(assert (=> b!995644 m!923601))

(declare-fun m!923603 () Bool)

(assert (=> b!995644 m!923603))

(declare-fun m!923605 () Bool)

(assert (=> b!995643 m!923605))

(declare-fun m!923607 () Bool)

(assert (=> b!995646 m!923607))

(declare-fun m!923609 () Bool)

(assert (=> b!995647 m!923609))

(declare-fun m!923611 () Bool)

(assert (=> start!85898 m!923611))

(declare-fun m!923613 () Bool)

(assert (=> start!85898 m!923613))

(push 1)

(assert (not b!995643))

(assert (not b!995647))

(assert (not start!85898))

(assert (not b!995646))

(assert (not b!995644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

