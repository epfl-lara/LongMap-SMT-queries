; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53580 () Bool)

(assert start!53580)

(declare-fun b!583367 () Bool)

(declare-fun res!371330 () Bool)

(declare-fun e!334212 () Bool)

(assert (=> b!583367 (=> (not res!371330) (not e!334212))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36495 0))(
  ( (array!36496 (arr!17522 (Array (_ BitVec 32) (_ BitVec 64))) (size!17887 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36495)

(assert (=> b!583367 (= res!371330 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17522 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17522 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!371334 () Bool)

(declare-fun e!334211 () Bool)

(assert (=> start!53580 (=> (not res!371334) (not e!334211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53580 (= res!371334 (validMask!0 mask!3053))))

(assert (=> start!53580 e!334211))

(assert (=> start!53580 true))

(declare-fun array_inv!13405 (array!36495) Bool)

(assert (=> start!53580 (array_inv!13405 a!2986)))

(declare-fun b!583368 () Bool)

(declare-fun res!371326 () Bool)

(assert (=> b!583368 (=> (not res!371326) (not e!334212))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5959 0))(
  ( (MissingZero!5959 (index!26063 (_ BitVec 32))) (Found!5959 (index!26064 (_ BitVec 32))) (Intermediate!5959 (undefined!6771 Bool) (index!26065 (_ BitVec 32)) (x!54911 (_ BitVec 32))) (Undefined!5959) (MissingVacant!5959 (index!26066 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36495 (_ BitVec 32)) SeekEntryResult!5959)

(assert (=> b!583368 (= res!371326 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17522 a!2986) j!136) a!2986 mask!3053) (Found!5959 j!136)))))

(declare-fun b!583369 () Bool)

(declare-fun res!371325 () Bool)

(assert (=> b!583369 (=> (not res!371325) (not e!334211))))

(declare-fun arrayContainsKey!0 (array!36495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583369 (= res!371325 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583370 () Bool)

(assert (=> b!583370 (= e!334211 e!334212)))

(declare-fun res!371328 () Bool)

(assert (=> b!583370 (=> (not res!371328) (not e!334212))))

(declare-fun lt!265140 () SeekEntryResult!5959)

(assert (=> b!583370 (= res!371328 (or (= lt!265140 (MissingZero!5959 i!1108)) (= lt!265140 (MissingVacant!5959 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36495 (_ BitVec 32)) SeekEntryResult!5959)

(assert (=> b!583370 (= lt!265140 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583371 () Bool)

(declare-fun res!371332 () Bool)

(assert (=> b!583371 (=> (not res!371332) (not e!334211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583371 (= res!371332 (validKeyInArray!0 (select (arr!17522 a!2986) j!136)))))

(declare-fun b!583372 () Bool)

(declare-fun e!334210 () Bool)

(assert (=> b!583372 (= e!334212 e!334210)))

(declare-fun res!371327 () Bool)

(assert (=> b!583372 (=> (not res!371327) (not e!334210))))

(declare-fun lt!265141 () (_ BitVec 32))

(assert (=> b!583372 (= res!371327 (and (bvsge lt!265141 #b00000000000000000000000000000000) (bvslt lt!265141 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583372 (= lt!265141 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583373 () Bool)

(declare-fun res!371331 () Bool)

(assert (=> b!583373 (=> (not res!371331) (not e!334212))))

(declare-datatypes ((List!11602 0))(
  ( (Nil!11599) (Cons!11598 (h!12643 (_ BitVec 64)) (t!17821 List!11602)) )
))
(declare-fun arrayNoDuplicates!0 (array!36495 (_ BitVec 32) List!11602) Bool)

(assert (=> b!583373 (= res!371331 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11599))))

(declare-fun b!583374 () Bool)

(declare-fun res!371335 () Bool)

(assert (=> b!583374 (=> (not res!371335) (not e!334211))))

(assert (=> b!583374 (= res!371335 (validKeyInArray!0 k0!1786))))

(declare-fun b!583375 () Bool)

(assert (=> b!583375 (= e!334210 false)))

(declare-fun lt!265139 () SeekEntryResult!5959)

(assert (=> b!583375 (= lt!265139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265141 vacantSpotIndex!68 (select (arr!17522 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583376 () Bool)

(declare-fun res!371333 () Bool)

(assert (=> b!583376 (=> (not res!371333) (not e!334211))))

(assert (=> b!583376 (= res!371333 (and (= (size!17887 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17887 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17887 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583377 () Bool)

(declare-fun res!371329 () Bool)

(assert (=> b!583377 (=> (not res!371329) (not e!334212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36495 (_ BitVec 32)) Bool)

(assert (=> b!583377 (= res!371329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583378 () Bool)

(declare-fun res!371336 () Bool)

(assert (=> b!583378 (=> (not res!371336) (not e!334212))))

(assert (=> b!583378 (= res!371336 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17522 a!2986) index!984) (select (arr!17522 a!2986) j!136))) (not (= (select (arr!17522 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53580 res!371334) b!583376))

(assert (= (and b!583376 res!371333) b!583371))

(assert (= (and b!583371 res!371332) b!583374))

(assert (= (and b!583374 res!371335) b!583369))

(assert (= (and b!583369 res!371325) b!583370))

(assert (= (and b!583370 res!371328) b!583377))

(assert (= (and b!583377 res!371329) b!583373))

(assert (= (and b!583373 res!371331) b!583367))

(assert (= (and b!583367 res!371330) b!583368))

(assert (= (and b!583368 res!371326) b!583378))

(assert (= (and b!583378 res!371336) b!583372))

(assert (= (and b!583372 res!371327) b!583375))

(declare-fun m!561295 () Bool)

(assert (=> b!583373 m!561295))

(declare-fun m!561297 () Bool)

(assert (=> b!583369 m!561297))

(declare-fun m!561299 () Bool)

(assert (=> b!583367 m!561299))

(declare-fun m!561301 () Bool)

(assert (=> b!583367 m!561301))

(declare-fun m!561303 () Bool)

(assert (=> b!583367 m!561303))

(declare-fun m!561305 () Bool)

(assert (=> b!583375 m!561305))

(assert (=> b!583375 m!561305))

(declare-fun m!561307 () Bool)

(assert (=> b!583375 m!561307))

(declare-fun m!561309 () Bool)

(assert (=> b!583374 m!561309))

(declare-fun m!561311 () Bool)

(assert (=> b!583372 m!561311))

(assert (=> b!583368 m!561305))

(assert (=> b!583368 m!561305))

(declare-fun m!561313 () Bool)

(assert (=> b!583368 m!561313))

(declare-fun m!561315 () Bool)

(assert (=> b!583378 m!561315))

(assert (=> b!583378 m!561305))

(declare-fun m!561317 () Bool)

(assert (=> start!53580 m!561317))

(declare-fun m!561319 () Bool)

(assert (=> start!53580 m!561319))

(assert (=> b!583371 m!561305))

(assert (=> b!583371 m!561305))

(declare-fun m!561321 () Bool)

(assert (=> b!583371 m!561321))

(declare-fun m!561323 () Bool)

(assert (=> b!583377 m!561323))

(declare-fun m!561325 () Bool)

(assert (=> b!583370 m!561325))

(check-sat (not b!583377) (not b!583373) (not b!583372) (not b!583375) (not b!583369) (not start!53580) (not b!583374) (not b!583368) (not b!583370) (not b!583371))
(check-sat)
