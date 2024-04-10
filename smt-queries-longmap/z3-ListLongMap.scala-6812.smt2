; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85696 () Bool)

(assert start!85696)

(declare-fun b!994508 () Bool)

(declare-fun res!665016 () Bool)

(declare-fun e!561250 () Bool)

(assert (=> b!994508 (=> (not res!665016) (not e!561250))))

(declare-datatypes ((array!62902 0))(
  ( (array!62903 (arr!30290 (Array (_ BitVec 32) (_ BitVec 64))) (size!30792 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62902)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994508 (= res!665016 (and (= (size!30792 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30792 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30792 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665019 () Bool)

(assert (=> start!85696 (=> (not res!665019) (not e!561250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85696 (= res!665019 (validMask!0 mask!3464))))

(assert (=> start!85696 e!561250))

(declare-fun array_inv!23414 (array!62902) Bool)

(assert (=> start!85696 (array_inv!23414 a!3219)))

(assert (=> start!85696 true))

(declare-fun b!994509 () Bool)

(declare-fun res!665015 () Bool)

(assert (=> b!994509 (=> (not res!665015) (not e!561250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994509 (= res!665015 (validKeyInArray!0 (select (arr!30290 a!3219) j!170)))))

(declare-fun b!994510 () Bool)

(declare-fun res!665018 () Bool)

(assert (=> b!994510 (=> (not res!665018) (not e!561250))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994510 (= res!665018 (validKeyInArray!0 k0!2224))))

(declare-fun b!994511 () Bool)

(assert (=> b!994511 (= e!561250 false)))

(declare-datatypes ((SeekEntryResult!9222 0))(
  ( (MissingZero!9222 (index!39259 (_ BitVec 32))) (Found!9222 (index!39260 (_ BitVec 32))) (Intermediate!9222 (undefined!10034 Bool) (index!39261 (_ BitVec 32)) (x!86711 (_ BitVec 32))) (Undefined!9222) (MissingVacant!9222 (index!39262 (_ BitVec 32))) )
))
(declare-fun lt!440720 () SeekEntryResult!9222)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62902 (_ BitVec 32)) SeekEntryResult!9222)

(assert (=> b!994511 (= lt!440720 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994512 () Bool)

(declare-fun res!665017 () Bool)

(assert (=> b!994512 (=> (not res!665017) (not e!561250))))

(declare-fun arrayContainsKey!0 (array!62902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994512 (= res!665017 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85696 res!665019) b!994508))

(assert (= (and b!994508 res!665016) b!994509))

(assert (= (and b!994509 res!665015) b!994510))

(assert (= (and b!994510 res!665018) b!994512))

(assert (= (and b!994512 res!665017) b!994511))

(declare-fun m!922081 () Bool)

(assert (=> b!994512 m!922081))

(declare-fun m!922083 () Bool)

(assert (=> b!994510 m!922083))

(declare-fun m!922085 () Bool)

(assert (=> start!85696 m!922085))

(declare-fun m!922087 () Bool)

(assert (=> start!85696 m!922087))

(declare-fun m!922089 () Bool)

(assert (=> b!994511 m!922089))

(declare-fun m!922091 () Bool)

(assert (=> b!994509 m!922091))

(assert (=> b!994509 m!922091))

(declare-fun m!922093 () Bool)

(assert (=> b!994509 m!922093))

(check-sat (not start!85696) (not b!994509) (not b!994510) (not b!994512) (not b!994511))
