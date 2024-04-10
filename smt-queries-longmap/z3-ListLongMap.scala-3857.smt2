; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53028 () Bool)

(assert start!53028)

(declare-fun res!365421 () Bool)

(declare-fun e!332103 () Bool)

(assert (=> start!53028 (=> (not res!365421) (not e!332103))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53028 (= res!365421 (validMask!0 mask!3053))))

(assert (=> start!53028 e!332103))

(assert (=> start!53028 true))

(declare-datatypes ((array!36046 0))(
  ( (array!36047 (arr!17302 (Array (_ BitVec 32) (_ BitVec 64))) (size!17666 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36046)

(declare-fun array_inv!13098 (array!36046) Bool)

(assert (=> start!53028 (array_inv!13098 a!2986)))

(declare-fun b!577387 () Bool)

(declare-fun res!365422 () Bool)

(assert (=> b!577387 (=> (not res!365422) (not e!332103))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577387 (= res!365422 (and (= (size!17666 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17666 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17666 a!2986)) (not (= i!1108 j!136))))))

(declare-datatypes ((SeekEntryResult!5742 0))(
  ( (MissingZero!5742 (index!25195 (_ BitVec 32))) (Found!5742 (index!25196 (_ BitVec 32))) (Intermediate!5742 (undefined!6554 Bool) (index!25197 (_ BitVec 32)) (x!54107 (_ BitVec 32))) (Undefined!5742) (MissingVacant!5742 (index!25198 (_ BitVec 32))) )
))
(declare-fun lt!263956 () SeekEntryResult!5742)

(declare-fun b!577388 () Bool)

(assert (=> b!577388 (= e!332103 (and (or (= lt!263956 (MissingZero!5742 i!1108)) (= lt!263956 (MissingVacant!5742 i!1108))) (bvsgt #b00000000000000000000000000000000 (size!17666 a!2986))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36046 (_ BitVec 32)) SeekEntryResult!5742)

(assert (=> b!577388 (= lt!263956 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577389 () Bool)

(declare-fun res!365423 () Bool)

(assert (=> b!577389 (=> (not res!365423) (not e!332103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577389 (= res!365423 (validKeyInArray!0 k0!1786))))

(declare-fun b!577390 () Bool)

(declare-fun res!365419 () Bool)

(assert (=> b!577390 (=> (not res!365419) (not e!332103))))

(declare-fun arrayContainsKey!0 (array!36046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577390 (= res!365419 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577391 () Bool)

(declare-fun res!365420 () Bool)

(assert (=> b!577391 (=> (not res!365420) (not e!332103))))

(assert (=> b!577391 (= res!365420 (validKeyInArray!0 (select (arr!17302 a!2986) j!136)))))

(assert (= (and start!53028 res!365421) b!577387))

(assert (= (and b!577387 res!365422) b!577391))

(assert (= (and b!577391 res!365420) b!577389))

(assert (= (and b!577389 res!365423) b!577390))

(assert (= (and b!577390 res!365419) b!577388))

(declare-fun m!556283 () Bool)

(assert (=> b!577389 m!556283))

(declare-fun m!556285 () Bool)

(assert (=> start!53028 m!556285))

(declare-fun m!556287 () Bool)

(assert (=> start!53028 m!556287))

(declare-fun m!556289 () Bool)

(assert (=> b!577390 m!556289))

(declare-fun m!556291 () Bool)

(assert (=> b!577388 m!556291))

(declare-fun m!556293 () Bool)

(assert (=> b!577391 m!556293))

(assert (=> b!577391 m!556293))

(declare-fun m!556295 () Bool)

(assert (=> b!577391 m!556295))

(check-sat (not b!577389) (not start!53028) (not b!577388) (not b!577391) (not b!577390))
(check-sat)
