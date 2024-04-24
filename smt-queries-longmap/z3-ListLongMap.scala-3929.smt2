; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53634 () Bool)

(assert start!53634)

(declare-fun b!583645 () Bool)

(declare-fun e!334449 () Bool)

(declare-fun e!334448 () Bool)

(assert (=> b!583645 (= e!334449 e!334448)))

(declare-fun res!371356 () Bool)

(assert (=> b!583645 (=> (not res!371356) (not e!334448))))

(declare-datatypes ((SeekEntryResult!5908 0))(
  ( (MissingZero!5908 (index!25859 (_ BitVec 32))) (Found!5908 (index!25860 (_ BitVec 32))) (Intermediate!5908 (undefined!6720 Bool) (index!25861 (_ BitVec 32)) (x!54852 (_ BitVec 32))) (Undefined!5908) (MissingVacant!5908 (index!25862 (_ BitVec 32))) )
))
(declare-fun lt!265435 () SeekEntryResult!5908)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583645 (= res!371356 (or (= lt!265435 (MissingZero!5908 i!1108)) (= lt!265435 (MissingVacant!5908 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36480 0))(
  ( (array!36481 (arr!17512 (Array (_ BitVec 32) (_ BitVec 64))) (size!17876 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36480)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36480 (_ BitVec 32)) SeekEntryResult!5908)

(assert (=> b!583645 (= lt!265435 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583646 () Bool)

(declare-fun res!371362 () Bool)

(assert (=> b!583646 (=> (not res!371362) (not e!334449))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583646 (= res!371362 (validKeyInArray!0 (select (arr!17512 a!2986) j!136)))))

(declare-fun b!583647 () Bool)

(declare-fun res!371361 () Bool)

(assert (=> b!583647 (=> (not res!371361) (not e!334449))))

(assert (=> b!583647 (= res!371361 (and (= (size!17876 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17876 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17876 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583648 () Bool)

(declare-fun res!371358 () Bool)

(assert (=> b!583648 (=> (not res!371358) (not e!334448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36480 (_ BitVec 32)) Bool)

(assert (=> b!583648 (= res!371358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583649 () Bool)

(declare-fun res!371360 () Bool)

(assert (=> b!583649 (=> (not res!371360) (not e!334449))))

(assert (=> b!583649 (= res!371360 (validKeyInArray!0 k0!1786))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!583650 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583650 (= e!334448 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17512 a!2986) index!984) (select (arr!17512 a!2986) j!136))) (not (= (select (arr!17512 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136)) (bvsge mask!3053 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun b!583651 () Bool)

(declare-fun res!371359 () Bool)

(assert (=> b!583651 (=> (not res!371359) (not e!334448))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36480 (_ BitVec 32)) SeekEntryResult!5908)

(assert (=> b!583651 (= res!371359 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17512 a!2986) j!136) a!2986 mask!3053) (Found!5908 j!136)))))

(declare-fun res!371364 () Bool)

(assert (=> start!53634 (=> (not res!371364) (not e!334449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53634 (= res!371364 (validMask!0 mask!3053))))

(assert (=> start!53634 e!334449))

(assert (=> start!53634 true))

(declare-fun array_inv!13371 (array!36480) Bool)

(assert (=> start!53634 (array_inv!13371 a!2986)))

(declare-fun b!583652 () Bool)

(declare-fun res!371357 () Bool)

(assert (=> b!583652 (=> (not res!371357) (not e!334448))))

(declare-datatypes ((List!11460 0))(
  ( (Nil!11457) (Cons!11456 (h!12504 (_ BitVec 64)) (t!17680 List!11460)) )
))
(declare-fun arrayNoDuplicates!0 (array!36480 (_ BitVec 32) List!11460) Bool)

(assert (=> b!583652 (= res!371357 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11457))))

(declare-fun b!583653 () Bool)

(declare-fun res!371365 () Bool)

(assert (=> b!583653 (=> (not res!371365) (not e!334448))))

(assert (=> b!583653 (= res!371365 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17512 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17512 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583654 () Bool)

(declare-fun res!371363 () Bool)

(assert (=> b!583654 (=> (not res!371363) (not e!334449))))

(declare-fun arrayContainsKey!0 (array!36480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583654 (= res!371363 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53634 res!371364) b!583647))

(assert (= (and b!583647 res!371361) b!583646))

(assert (= (and b!583646 res!371362) b!583649))

(assert (= (and b!583649 res!371360) b!583654))

(assert (= (and b!583654 res!371363) b!583645))

(assert (= (and b!583645 res!371356) b!583648))

(assert (= (and b!583648 res!371358) b!583652))

(assert (= (and b!583652 res!371357) b!583653))

(assert (= (and b!583653 res!371365) b!583651))

(assert (= (and b!583651 res!371359) b!583650))

(declare-fun m!562259 () Bool)

(assert (=> b!583645 m!562259))

(declare-fun m!562261 () Bool)

(assert (=> b!583653 m!562261))

(declare-fun m!562263 () Bool)

(assert (=> b!583653 m!562263))

(declare-fun m!562265 () Bool)

(assert (=> b!583653 m!562265))

(declare-fun m!562267 () Bool)

(assert (=> b!583649 m!562267))

(declare-fun m!562269 () Bool)

(assert (=> b!583651 m!562269))

(assert (=> b!583651 m!562269))

(declare-fun m!562271 () Bool)

(assert (=> b!583651 m!562271))

(declare-fun m!562273 () Bool)

(assert (=> start!53634 m!562273))

(declare-fun m!562275 () Bool)

(assert (=> start!53634 m!562275))

(declare-fun m!562277 () Bool)

(assert (=> b!583648 m!562277))

(declare-fun m!562279 () Bool)

(assert (=> b!583652 m!562279))

(assert (=> b!583646 m!562269))

(assert (=> b!583646 m!562269))

(declare-fun m!562281 () Bool)

(assert (=> b!583646 m!562281))

(declare-fun m!562283 () Bool)

(assert (=> b!583650 m!562283))

(assert (=> b!583650 m!562269))

(declare-fun m!562285 () Bool)

(assert (=> b!583654 m!562285))

(check-sat (not b!583654) (not b!583646) (not b!583649) (not start!53634) (not b!583651) (not b!583645) (not b!583652) (not b!583648))
(check-sat)
