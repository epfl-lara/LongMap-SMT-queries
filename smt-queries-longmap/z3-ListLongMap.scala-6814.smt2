; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85708 () Bool)

(assert start!85708)

(declare-fun b!994607 () Bool)

(declare-fun res!665116 () Bool)

(declare-fun e!561286 () Bool)

(assert (=> b!994607 (=> (not res!665116) (not e!561286))))

(declare-datatypes ((array!62914 0))(
  ( (array!62915 (arr!30296 (Array (_ BitVec 32) (_ BitVec 64))) (size!30798 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62914)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!994607 (= res!665116 (and (= (size!30798 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30798 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30798 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994608 () Bool)

(declare-fun res!665115 () Bool)

(assert (=> b!994608 (=> (not res!665115) (not e!561286))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994608 (= res!665115 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994609 () Bool)

(declare-fun res!665114 () Bool)

(assert (=> b!994609 (=> (not res!665114) (not e!561286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994609 (= res!665114 (validKeyInArray!0 (select (arr!30296 a!3219) j!170)))))

(declare-fun b!994610 () Bool)

(assert (=> b!994610 (= e!561286 false)))

(declare-datatypes ((SeekEntryResult!9228 0))(
  ( (MissingZero!9228 (index!39283 (_ BitVec 32))) (Found!9228 (index!39284 (_ BitVec 32))) (Intermediate!9228 (undefined!10040 Bool) (index!39285 (_ BitVec 32)) (x!86733 (_ BitVec 32))) (Undefined!9228) (MissingVacant!9228 (index!39286 (_ BitVec 32))) )
))
(declare-fun lt!440729 () SeekEntryResult!9228)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62914 (_ BitVec 32)) SeekEntryResult!9228)

(assert (=> b!994610 (= lt!440729 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!665117 () Bool)

(assert (=> start!85708 (=> (not res!665117) (not e!561286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85708 (= res!665117 (validMask!0 mask!3464))))

(assert (=> start!85708 e!561286))

(declare-fun array_inv!23420 (array!62914) Bool)

(assert (=> start!85708 (array_inv!23420 a!3219)))

(assert (=> start!85708 true))

(declare-fun b!994611 () Bool)

(declare-fun res!665118 () Bool)

(assert (=> b!994611 (=> (not res!665118) (not e!561286))))

(assert (=> b!994611 (= res!665118 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85708 res!665117) b!994607))

(assert (= (and b!994607 res!665116) b!994609))

(assert (= (and b!994609 res!665114) b!994611))

(assert (= (and b!994611 res!665118) b!994608))

(assert (= (and b!994608 res!665115) b!994610))

(declare-fun m!922165 () Bool)

(assert (=> b!994610 m!922165))

(declare-fun m!922167 () Bool)

(assert (=> start!85708 m!922167))

(declare-fun m!922169 () Bool)

(assert (=> start!85708 m!922169))

(declare-fun m!922171 () Bool)

(assert (=> b!994609 m!922171))

(assert (=> b!994609 m!922171))

(declare-fun m!922173 () Bool)

(assert (=> b!994609 m!922173))

(declare-fun m!922175 () Bool)

(assert (=> b!994608 m!922175))

(declare-fun m!922177 () Bool)

(assert (=> b!994611 m!922177))

(check-sat (not b!994609) (not b!994610) (not start!85708) (not b!994608) (not b!994611))
