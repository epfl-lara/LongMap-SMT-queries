; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85728 () Bool)

(assert start!85728)

(declare-fun b!994757 () Bool)

(declare-fun e!561346 () Bool)

(assert (=> b!994757 (= e!561346 false)))

(declare-datatypes ((array!62934 0))(
  ( (array!62935 (arr!30306 (Array (_ BitVec 32) (_ BitVec 64))) (size!30808 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62934)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9238 0))(
  ( (MissingZero!9238 (index!39323 (_ BitVec 32))) (Found!9238 (index!39324 (_ BitVec 32))) (Intermediate!9238 (undefined!10050 Bool) (index!39325 (_ BitVec 32)) (x!86767 (_ BitVec 32))) (Undefined!9238) (MissingVacant!9238 (index!39326 (_ BitVec 32))) )
))
(declare-fun lt!440759 () SeekEntryResult!9238)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62934 (_ BitVec 32)) SeekEntryResult!9238)

(assert (=> b!994757 (= lt!440759 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994758 () Bool)

(declare-fun res!665265 () Bool)

(assert (=> b!994758 (=> (not res!665265) (not e!561346))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994758 (= res!665265 (validKeyInArray!0 (select (arr!30306 a!3219) j!170)))))

(declare-fun res!665264 () Bool)

(assert (=> start!85728 (=> (not res!665264) (not e!561346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85728 (= res!665264 (validMask!0 mask!3464))))

(assert (=> start!85728 e!561346))

(declare-fun array_inv!23430 (array!62934) Bool)

(assert (=> start!85728 (array_inv!23430 a!3219)))

(assert (=> start!85728 true))

(declare-fun b!994759 () Bool)

(declare-fun res!665266 () Bool)

(assert (=> b!994759 (=> (not res!665266) (not e!561346))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994759 (= res!665266 (and (= (size!30808 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30808 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30808 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994760 () Bool)

(declare-fun res!665268 () Bool)

(assert (=> b!994760 (=> (not res!665268) (not e!561346))))

(declare-fun arrayContainsKey!0 (array!62934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994760 (= res!665268 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994761 () Bool)

(declare-fun res!665267 () Bool)

(assert (=> b!994761 (=> (not res!665267) (not e!561346))))

(assert (=> b!994761 (= res!665267 (validKeyInArray!0 k!2224))))

(assert (= (and start!85728 res!665264) b!994759))

(assert (= (and b!994759 res!665266) b!994758))

(assert (= (and b!994758 res!665265) b!994761))

(assert (= (and b!994761 res!665267) b!994760))

(assert (= (and b!994760 res!665268) b!994757))

(declare-fun m!922305 () Bool)

(assert (=> b!994761 m!922305))

(declare-fun m!922307 () Bool)

(assert (=> b!994757 m!922307))

(declare-fun m!922309 () Bool)

(assert (=> b!994760 m!922309))

(declare-fun m!922311 () Bool)

(assert (=> start!85728 m!922311))

(declare-fun m!922313 () Bool)

(assert (=> start!85728 m!922313))

(declare-fun m!922315 () Bool)

(assert (=> b!994758 m!922315))

(assert (=> b!994758 m!922315))

(declare-fun m!922317 () Bool)

(assert (=> b!994758 m!922317))

(push 1)

(assert (not b!994761))

(assert (not start!85728))

(assert (not b!994760))

(assert (not b!994757))

(assert (not b!994758))

(check-sat)

