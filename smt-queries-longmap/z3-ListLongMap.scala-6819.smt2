; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85912 () Bool)

(assert start!85912)

(declare-fun b!995748 () Bool)

(declare-fun res!665692 () Bool)

(declare-fun e!561974 () Bool)

(assert (=> b!995748 (=> (not res!665692) (not e!561974))))

(declare-datatypes ((array!62988 0))(
  ( (array!62989 (arr!30328 (Array (_ BitVec 32) (_ BitVec 64))) (size!30831 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62988)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995748 (= res!665692 (and (= (size!30831 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30831 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30831 a!3219)) (not (= i!1194 j!170))))))

(declare-datatypes ((SeekEntryResult!9196 0))(
  ( (MissingZero!9196 (index!39155 (_ BitVec 32))) (Found!9196 (index!39156 (_ BitVec 32))) (Intermediate!9196 (undefined!10008 Bool) (index!39157 (_ BitVec 32)) (x!86755 (_ BitVec 32))) (Undefined!9196) (MissingVacant!9196 (index!39158 (_ BitVec 32))) )
))
(declare-fun lt!441137 () SeekEntryResult!9196)

(declare-fun b!995749 () Bool)

(assert (=> b!995749 (= e!561974 (and (or (= lt!441137 (MissingVacant!9196 i!1194)) (= lt!441137 (MissingZero!9196 i!1194))) (bvsgt #b00000000000000000000000000000000 (size!30831 a!3219))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62988 (_ BitVec 32)) SeekEntryResult!9196)

(assert (=> b!995749 (= lt!441137 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995750 () Bool)

(declare-fun res!665689 () Bool)

(assert (=> b!995750 (=> (not res!665689) (not e!561974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995750 (= res!665689 (validKeyInArray!0 k0!2224))))

(declare-fun b!995751 () Bool)

(declare-fun res!665690 () Bool)

(assert (=> b!995751 (=> (not res!665690) (not e!561974))))

(declare-fun arrayContainsKey!0 (array!62988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995751 (= res!665690 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665693 () Bool)

(assert (=> start!85912 (=> (not res!665693) (not e!561974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85912 (= res!665693 (validMask!0 mask!3464))))

(assert (=> start!85912 e!561974))

(declare-fun array_inv!23464 (array!62988) Bool)

(assert (=> start!85912 (array_inv!23464 a!3219)))

(assert (=> start!85912 true))

(declare-fun b!995752 () Bool)

(declare-fun res!665691 () Bool)

(assert (=> b!995752 (=> (not res!665691) (not e!561974))))

(assert (=> b!995752 (= res!665691 (validKeyInArray!0 (select (arr!30328 a!3219) j!170)))))

(assert (= (and start!85912 res!665693) b!995748))

(assert (= (and b!995748 res!665692) b!995752))

(assert (= (and b!995752 res!665691) b!995750))

(assert (= (and b!995750 res!665689) b!995751))

(assert (= (and b!995751 res!665690) b!995749))

(declare-fun m!923699 () Bool)

(assert (=> b!995750 m!923699))

(declare-fun m!923701 () Bool)

(assert (=> start!85912 m!923701))

(declare-fun m!923703 () Bool)

(assert (=> start!85912 m!923703))

(declare-fun m!923705 () Bool)

(assert (=> b!995749 m!923705))

(declare-fun m!923707 () Bool)

(assert (=> b!995752 m!923707))

(assert (=> b!995752 m!923707))

(declare-fun m!923709 () Bool)

(assert (=> b!995752 m!923709))

(declare-fun m!923711 () Bool)

(assert (=> b!995751 m!923711))

(check-sat (not start!85912) (not b!995752) (not b!995750) (not b!995751) (not b!995749))
(check-sat)
