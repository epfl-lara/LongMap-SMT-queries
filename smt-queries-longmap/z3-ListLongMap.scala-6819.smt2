; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85738 () Bool)

(assert start!85738)

(declare-fun b!994832 () Bool)

(declare-fun res!665340 () Bool)

(declare-fun e!561375 () Bool)

(assert (=> b!994832 (=> (not res!665340) (not e!561375))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994832 (= res!665340 (validKeyInArray!0 k0!2224))))

(declare-fun b!994833 () Bool)

(declare-fun res!665343 () Bool)

(assert (=> b!994833 (=> (not res!665343) (not e!561375))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((array!62944 0))(
  ( (array!62945 (arr!30311 (Array (_ BitVec 32) (_ BitVec 64))) (size!30813 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62944)

(assert (=> b!994833 (= res!665343 (and (= (size!30813 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30813 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30813 a!3219)) (not (= i!1194 j!170))))))

(declare-datatypes ((SeekEntryResult!9243 0))(
  ( (MissingZero!9243 (index!39343 (_ BitVec 32))) (Found!9243 (index!39344 (_ BitVec 32))) (Intermediate!9243 (undefined!10055 Bool) (index!39345 (_ BitVec 32)) (x!86788 (_ BitVec 32))) (Undefined!9243) (MissingVacant!9243 (index!39346 (_ BitVec 32))) )
))
(declare-fun lt!440774 () SeekEntryResult!9243)

(declare-fun b!994834 () Bool)

(assert (=> b!994834 (= e!561375 (and (or (= lt!440774 (MissingVacant!9243 i!1194)) (= lt!440774 (MissingZero!9243 i!1194))) (bvsgt #b00000000000000000000000000000000 (size!30813 a!3219))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62944 (_ BitVec 32)) SeekEntryResult!9243)

(assert (=> b!994834 (= lt!440774 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!665341 () Bool)

(assert (=> start!85738 (=> (not res!665341) (not e!561375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85738 (= res!665341 (validMask!0 mask!3464))))

(assert (=> start!85738 e!561375))

(declare-fun array_inv!23435 (array!62944) Bool)

(assert (=> start!85738 (array_inv!23435 a!3219)))

(assert (=> start!85738 true))

(declare-fun b!994835 () Bool)

(declare-fun res!665342 () Bool)

(assert (=> b!994835 (=> (not res!665342) (not e!561375))))

(declare-fun arrayContainsKey!0 (array!62944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994835 (= res!665342 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994836 () Bool)

(declare-fun res!665339 () Bool)

(assert (=> b!994836 (=> (not res!665339) (not e!561375))))

(assert (=> b!994836 (= res!665339 (validKeyInArray!0 (select (arr!30311 a!3219) j!170)))))

(assert (= (and start!85738 res!665341) b!994833))

(assert (= (and b!994833 res!665343) b!994836))

(assert (= (and b!994836 res!665339) b!994832))

(assert (= (and b!994832 res!665340) b!994835))

(assert (= (and b!994835 res!665342) b!994834))

(declare-fun m!922375 () Bool)

(assert (=> b!994832 m!922375))

(declare-fun m!922377 () Bool)

(assert (=> start!85738 m!922377))

(declare-fun m!922379 () Bool)

(assert (=> start!85738 m!922379))

(declare-fun m!922381 () Bool)

(assert (=> b!994836 m!922381))

(assert (=> b!994836 m!922381))

(declare-fun m!922383 () Bool)

(assert (=> b!994836 m!922383))

(declare-fun m!922385 () Bool)

(assert (=> b!994834 m!922385))

(declare-fun m!922387 () Bool)

(assert (=> b!994835 m!922387))

(check-sat (not b!994832) (not start!85738) (not b!994835) (not b!994834) (not b!994836))
(check-sat)
