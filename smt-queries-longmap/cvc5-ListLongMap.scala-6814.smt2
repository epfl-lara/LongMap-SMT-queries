; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85706 () Bool)

(assert start!85706)

(declare-fun b!994592 () Bool)

(declare-fun res!665103 () Bool)

(declare-fun e!561279 () Bool)

(assert (=> b!994592 (=> (not res!665103) (not e!561279))))

(declare-datatypes ((array!62912 0))(
  ( (array!62913 (arr!30295 (Array (_ BitVec 32) (_ BitVec 64))) (size!30797 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62912)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994592 (= res!665103 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994593 () Bool)

(declare-fun res!665102 () Bool)

(assert (=> b!994593 (=> (not res!665102) (not e!561279))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994593 (= res!665102 (and (= (size!30797 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30797 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30797 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994594 () Bool)

(declare-fun res!665101 () Bool)

(assert (=> b!994594 (=> (not res!665101) (not e!561279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994594 (= res!665101 (validKeyInArray!0 (select (arr!30295 a!3219) j!170)))))

(declare-fun b!994595 () Bool)

(declare-fun res!665100 () Bool)

(assert (=> b!994595 (=> (not res!665100) (not e!561279))))

(assert (=> b!994595 (= res!665100 (validKeyInArray!0 k!2224))))

(declare-fun res!665099 () Bool)

(assert (=> start!85706 (=> (not res!665099) (not e!561279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85706 (= res!665099 (validMask!0 mask!3464))))

(assert (=> start!85706 e!561279))

(declare-fun array_inv!23419 (array!62912) Bool)

(assert (=> start!85706 (array_inv!23419 a!3219)))

(assert (=> start!85706 true))

(declare-fun b!994596 () Bool)

(assert (=> b!994596 (= e!561279 false)))

(declare-datatypes ((SeekEntryResult!9227 0))(
  ( (MissingZero!9227 (index!39279 (_ BitVec 32))) (Found!9227 (index!39280 (_ BitVec 32))) (Intermediate!9227 (undefined!10039 Bool) (index!39281 (_ BitVec 32)) (x!86732 (_ BitVec 32))) (Undefined!9227) (MissingVacant!9227 (index!39282 (_ BitVec 32))) )
))
(declare-fun lt!440726 () SeekEntryResult!9227)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62912 (_ BitVec 32)) SeekEntryResult!9227)

(assert (=> b!994596 (= lt!440726 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85706 res!665099) b!994593))

(assert (= (and b!994593 res!665102) b!994594))

(assert (= (and b!994594 res!665101) b!994595))

(assert (= (and b!994595 res!665100) b!994592))

(assert (= (and b!994592 res!665103) b!994596))

(declare-fun m!922151 () Bool)

(assert (=> b!994594 m!922151))

(assert (=> b!994594 m!922151))

(declare-fun m!922153 () Bool)

(assert (=> b!994594 m!922153))

(declare-fun m!922155 () Bool)

(assert (=> b!994592 m!922155))

(declare-fun m!922157 () Bool)

(assert (=> b!994596 m!922157))

(declare-fun m!922159 () Bool)

(assert (=> start!85706 m!922159))

(declare-fun m!922161 () Bool)

(assert (=> start!85706 m!922161))

(declare-fun m!922163 () Bool)

(assert (=> b!994595 m!922163))

(push 1)

(assert (not start!85706))

(assert (not b!994595))

(assert (not b!994594))

(assert (not b!994596))

(assert (not b!994592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

