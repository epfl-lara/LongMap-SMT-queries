; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53508 () Bool)

(assert start!53508)

(declare-fun b!582353 () Bool)

(declare-fun res!370312 () Bool)

(declare-fun e!333874 () Bool)

(assert (=> b!582353 (=> (not res!370312) (not e!333874))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582353 (= res!370312 (validKeyInArray!0 k0!1786))))

(declare-fun b!582354 () Bool)

(declare-fun res!370313 () Bool)

(assert (=> b!582354 (=> (not res!370313) (not e!333874))))

(declare-datatypes ((array!36423 0))(
  ( (array!36424 (arr!17486 (Array (_ BitVec 32) (_ BitVec 64))) (size!17851 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36423)

(declare-fun arrayContainsKey!0 (array!36423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582354 (= res!370313 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582355 () Bool)

(declare-fun res!370315 () Bool)

(assert (=> b!582355 (=> (not res!370315) (not e!333874))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582355 (= res!370315 (validKeyInArray!0 (select (arr!17486 a!2986) j!136)))))

(declare-fun b!582356 () Bool)

(declare-fun res!370318 () Bool)

(declare-fun e!333875 () Bool)

(assert (=> b!582356 (=> (not res!370318) (not e!333875))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582356 (= res!370318 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17486 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17486 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582357 () Bool)

(assert (=> b!582357 (= e!333874 e!333875)))

(declare-fun res!370319 () Bool)

(assert (=> b!582357 (=> (not res!370319) (not e!333875))))

(declare-datatypes ((SeekEntryResult!5923 0))(
  ( (MissingZero!5923 (index!25919 (_ BitVec 32))) (Found!5923 (index!25920 (_ BitVec 32))) (Intermediate!5923 (undefined!6735 Bool) (index!25921 (_ BitVec 32)) (x!54779 (_ BitVec 32))) (Undefined!5923) (MissingVacant!5923 (index!25922 (_ BitVec 32))) )
))
(declare-fun lt!264921 () SeekEntryResult!5923)

(assert (=> b!582357 (= res!370319 (or (= lt!264921 (MissingZero!5923 i!1108)) (= lt!264921 (MissingVacant!5923 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36423 (_ BitVec 32)) SeekEntryResult!5923)

(assert (=> b!582357 (= lt!264921 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!370314 () Bool)

(assert (=> start!53508 (=> (not res!370314) (not e!333874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53508 (= res!370314 (validMask!0 mask!3053))))

(assert (=> start!53508 e!333874))

(assert (=> start!53508 true))

(declare-fun array_inv!13369 (array!36423) Bool)

(assert (=> start!53508 (array_inv!13369 a!2986)))

(declare-fun b!582358 () Bool)

(assert (=> b!582358 (= e!333875 false)))

(declare-fun lt!264922 () SeekEntryResult!5923)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36423 (_ BitVec 32)) SeekEntryResult!5923)

(assert (=> b!582358 (= lt!264922 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17486 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582359 () Bool)

(declare-fun res!370317 () Bool)

(assert (=> b!582359 (=> (not res!370317) (not e!333875))))

(declare-datatypes ((List!11566 0))(
  ( (Nil!11563) (Cons!11562 (h!12607 (_ BitVec 64)) (t!17785 List!11566)) )
))
(declare-fun arrayNoDuplicates!0 (array!36423 (_ BitVec 32) List!11566) Bool)

(assert (=> b!582359 (= res!370317 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11563))))

(declare-fun b!582360 () Bool)

(declare-fun res!370316 () Bool)

(assert (=> b!582360 (=> (not res!370316) (not e!333875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36423 (_ BitVec 32)) Bool)

(assert (=> b!582360 (= res!370316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582361 () Bool)

(declare-fun res!370311 () Bool)

(assert (=> b!582361 (=> (not res!370311) (not e!333874))))

(assert (=> b!582361 (= res!370311 (and (= (size!17851 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17851 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17851 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53508 res!370314) b!582361))

(assert (= (and b!582361 res!370311) b!582355))

(assert (= (and b!582355 res!370315) b!582353))

(assert (= (and b!582353 res!370312) b!582354))

(assert (= (and b!582354 res!370313) b!582357))

(assert (= (and b!582357 res!370319) b!582360))

(assert (= (and b!582360 res!370316) b!582359))

(assert (= (and b!582359 res!370317) b!582356))

(assert (= (and b!582356 res!370318) b!582358))

(declare-fun m!560335 () Bool)

(assert (=> b!582357 m!560335))

(declare-fun m!560337 () Bool)

(assert (=> start!53508 m!560337))

(declare-fun m!560339 () Bool)

(assert (=> start!53508 m!560339))

(declare-fun m!560341 () Bool)

(assert (=> b!582359 m!560341))

(declare-fun m!560343 () Bool)

(assert (=> b!582354 m!560343))

(declare-fun m!560345 () Bool)

(assert (=> b!582360 m!560345))

(declare-fun m!560347 () Bool)

(assert (=> b!582353 m!560347))

(declare-fun m!560349 () Bool)

(assert (=> b!582356 m!560349))

(declare-fun m!560351 () Bool)

(assert (=> b!582356 m!560351))

(declare-fun m!560353 () Bool)

(assert (=> b!582356 m!560353))

(declare-fun m!560355 () Bool)

(assert (=> b!582355 m!560355))

(assert (=> b!582355 m!560355))

(declare-fun m!560357 () Bool)

(assert (=> b!582355 m!560357))

(assert (=> b!582358 m!560355))

(assert (=> b!582358 m!560355))

(declare-fun m!560359 () Bool)

(assert (=> b!582358 m!560359))

(check-sat (not b!582360) (not b!582354) (not b!582357) (not b!582358) (not b!582359) (not b!582355) (not b!582353) (not start!53508))
(check-sat)
