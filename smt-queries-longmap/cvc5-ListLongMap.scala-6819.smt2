; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85736 () Bool)

(assert start!85736)

(declare-fun b!994817 () Bool)

(declare-fun res!665327 () Bool)

(declare-fun e!561370 () Bool)

(assert (=> b!994817 (=> (not res!665327) (not e!561370))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994817 (= res!665327 (validKeyInArray!0 k!2224))))

(declare-fun res!665326 () Bool)

(assert (=> start!85736 (=> (not res!665326) (not e!561370))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85736 (= res!665326 (validMask!0 mask!3464))))

(assert (=> start!85736 e!561370))

(declare-datatypes ((array!62942 0))(
  ( (array!62943 (arr!30310 (Array (_ BitVec 32) (_ BitVec 64))) (size!30812 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62942)

(declare-fun array_inv!23434 (array!62942) Bool)

(assert (=> start!85736 (array_inv!23434 a!3219)))

(assert (=> start!85736 true))

(declare-fun b!994818 () Bool)

(declare-fun res!665325 () Bool)

(assert (=> b!994818 (=> (not res!665325) (not e!561370))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994818 (= res!665325 (validKeyInArray!0 (select (arr!30310 a!3219) j!170)))))

(declare-fun b!994819 () Bool)

(declare-fun res!665328 () Bool)

(assert (=> b!994819 (=> (not res!665328) (not e!561370))))

(declare-fun arrayContainsKey!0 (array!62942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994819 (= res!665328 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994820 () Bool)

(declare-fun res!665324 () Bool)

(assert (=> b!994820 (=> (not res!665324) (not e!561370))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994820 (= res!665324 (and (= (size!30812 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30812 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30812 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994821 () Bool)

(declare-datatypes ((SeekEntryResult!9242 0))(
  ( (MissingZero!9242 (index!39339 (_ BitVec 32))) (Found!9242 (index!39340 (_ BitVec 32))) (Intermediate!9242 (undefined!10054 Bool) (index!39341 (_ BitVec 32)) (x!86787 (_ BitVec 32))) (Undefined!9242) (MissingVacant!9242 (index!39342 (_ BitVec 32))) )
))
(declare-fun lt!440771 () SeekEntryResult!9242)

(assert (=> b!994821 (= e!561370 (and (or (= lt!440771 (MissingVacant!9242 i!1194)) (= lt!440771 (MissingZero!9242 i!1194))) (bvsgt #b00000000000000000000000000000000 (size!30812 a!3219))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62942 (_ BitVec 32)) SeekEntryResult!9242)

(assert (=> b!994821 (= lt!440771 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85736 res!665326) b!994820))

(assert (= (and b!994820 res!665324) b!994818))

(assert (= (and b!994818 res!665325) b!994817))

(assert (= (and b!994817 res!665327) b!994819))

(assert (= (and b!994819 res!665328) b!994821))

(declare-fun m!922361 () Bool)

(assert (=> b!994817 m!922361))

(declare-fun m!922363 () Bool)

(assert (=> b!994821 m!922363))

(declare-fun m!922365 () Bool)

(assert (=> start!85736 m!922365))

(declare-fun m!922367 () Bool)

(assert (=> start!85736 m!922367))

(declare-fun m!922369 () Bool)

(assert (=> b!994818 m!922369))

(assert (=> b!994818 m!922369))

(declare-fun m!922371 () Bool)

(assert (=> b!994818 m!922371))

(declare-fun m!922373 () Bool)

(assert (=> b!994819 m!922373))

(push 1)

