; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85728 () Bool)

(assert start!85728)

(declare-fun res!665232 () Bool)

(declare-fun e!561239 () Bool)

(assert (=> start!85728 (=> (not res!665232) (not e!561239))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85728 (= res!665232 (validMask!0 mask!3464))))

(assert (=> start!85728 e!561239))

(declare-datatypes ((array!62881 0))(
  ( (array!62882 (arr!30279 (Array (_ BitVec 32) (_ BitVec 64))) (size!30783 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62881)

(declare-fun array_inv!23422 (array!62881) Bool)

(assert (=> start!85728 (array_inv!23422 a!3219)))

(assert (=> start!85728 true))

(declare-fun b!994599 () Bool)

(declare-fun res!665234 () Bool)

(assert (=> b!994599 (=> (not res!665234) (not e!561239))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994599 (= res!665234 (validKeyInArray!0 (select (arr!30279 a!3219) j!170)))))

(declare-fun b!994600 () Bool)

(declare-fun res!665233 () Bool)

(assert (=> b!994600 (=> (not res!665233) (not e!561239))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994600 (= res!665233 (validKeyInArray!0 k0!2224))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9236 0))(
  ( (MissingZero!9236 (index!39315 (_ BitVec 32))) (Found!9236 (index!39316 (_ BitVec 32))) (Intermediate!9236 (undefined!10048 Bool) (index!39317 (_ BitVec 32)) (x!86776 (_ BitVec 32))) (Undefined!9236) (MissingVacant!9236 (index!39318 (_ BitVec 32))) )
))
(declare-fun lt!440539 () SeekEntryResult!9236)

(declare-fun b!994601 () Bool)

(assert (=> b!994601 (= e!561239 (and (or (= lt!440539 (MissingVacant!9236 i!1194)) (= lt!440539 (MissingZero!9236 i!1194))) (bvsgt #b00000000000000000000000000000000 (size!30783 a!3219))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62881 (_ BitVec 32)) SeekEntryResult!9236)

(assert (=> b!994601 (= lt!440539 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994602 () Bool)

(declare-fun res!665230 () Bool)

(assert (=> b!994602 (=> (not res!665230) (not e!561239))))

(assert (=> b!994602 (= res!665230 (and (= (size!30783 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30783 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30783 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994603 () Bool)

(declare-fun res!665231 () Bool)

(assert (=> b!994603 (=> (not res!665231) (not e!561239))))

(declare-fun arrayContainsKey!0 (array!62881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994603 (= res!665231 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85728 res!665232) b!994602))

(assert (= (and b!994602 res!665230) b!994599))

(assert (= (and b!994599 res!665234) b!994600))

(assert (= (and b!994600 res!665233) b!994603))

(assert (= (and b!994603 res!665231) b!994601))

(declare-fun m!921631 () Bool)

(assert (=> b!994599 m!921631))

(assert (=> b!994599 m!921631))

(declare-fun m!921633 () Bool)

(assert (=> b!994599 m!921633))

(declare-fun m!921635 () Bool)

(assert (=> b!994600 m!921635))

(declare-fun m!921637 () Bool)

(assert (=> b!994601 m!921637))

(declare-fun m!921639 () Bool)

(assert (=> start!85728 m!921639))

(declare-fun m!921641 () Bool)

(assert (=> start!85728 m!921641))

(declare-fun m!921643 () Bool)

(assert (=> b!994603 m!921643))

(check-sat (not b!994603) (not b!994600) (not b!994599) (not b!994601) (not start!85728))
(check-sat)
