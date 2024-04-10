; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85722 () Bool)

(assert start!85722)

(declare-fun b!994712 () Bool)

(declare-fun res!665221 () Bool)

(declare-fun e!561327 () Bool)

(assert (=> b!994712 (=> (not res!665221) (not e!561327))))

(declare-datatypes ((array!62928 0))(
  ( (array!62929 (arr!30303 (Array (_ BitVec 32) (_ BitVec 64))) (size!30805 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62928)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994712 (= res!665221 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665223 () Bool)

(assert (=> start!85722 (=> (not res!665223) (not e!561327))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85722 (= res!665223 (validMask!0 mask!3464))))

(assert (=> start!85722 e!561327))

(declare-fun array_inv!23427 (array!62928) Bool)

(assert (=> start!85722 (array_inv!23427 a!3219)))

(assert (=> start!85722 true))

(declare-fun b!994713 () Bool)

(declare-fun res!665219 () Bool)

(assert (=> b!994713 (=> (not res!665219) (not e!561327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994713 (= res!665219 (validKeyInArray!0 k!2224))))

(declare-fun b!994714 () Bool)

(declare-fun res!665222 () Bool)

(assert (=> b!994714 (=> (not res!665222) (not e!561327))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994714 (= res!665222 (and (= (size!30805 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30805 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30805 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994715 () Bool)

(assert (=> b!994715 (= e!561327 false)))

(declare-datatypes ((SeekEntryResult!9235 0))(
  ( (MissingZero!9235 (index!39311 (_ BitVec 32))) (Found!9235 (index!39312 (_ BitVec 32))) (Intermediate!9235 (undefined!10047 Bool) (index!39313 (_ BitVec 32)) (x!86756 (_ BitVec 32))) (Undefined!9235) (MissingVacant!9235 (index!39314 (_ BitVec 32))) )
))
(declare-fun lt!440750 () SeekEntryResult!9235)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62928 (_ BitVec 32)) SeekEntryResult!9235)

(assert (=> b!994715 (= lt!440750 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994716 () Bool)

(declare-fun res!665220 () Bool)

(assert (=> b!994716 (=> (not res!665220) (not e!561327))))

(assert (=> b!994716 (= res!665220 (validKeyInArray!0 (select (arr!30303 a!3219) j!170)))))

(assert (= (and start!85722 res!665223) b!994714))

(assert (= (and b!994714 res!665222) b!994716))

(assert (= (and b!994716 res!665220) b!994713))

(assert (= (and b!994713 res!665219) b!994712))

(assert (= (and b!994712 res!665221) b!994715))

(declare-fun m!922263 () Bool)

(assert (=> b!994716 m!922263))

(assert (=> b!994716 m!922263))

(declare-fun m!922265 () Bool)

(assert (=> b!994716 m!922265))

(declare-fun m!922267 () Bool)

(assert (=> start!85722 m!922267))

(declare-fun m!922269 () Bool)

(assert (=> start!85722 m!922269))

(declare-fun m!922271 () Bool)

(assert (=> b!994712 m!922271))

(declare-fun m!922273 () Bool)

(assert (=> b!994715 m!922273))

(declare-fun m!922275 () Bool)

(assert (=> b!994713 m!922275))

(push 1)

(assert (not b!994713))

(assert (not b!994716))

(assert (not b!994715))

(assert (not b!994712))

(assert (not start!85722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

