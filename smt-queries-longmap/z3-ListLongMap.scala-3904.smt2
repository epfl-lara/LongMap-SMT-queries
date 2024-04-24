; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53484 () Bool)

(assert start!53484)

(declare-fun b!581591 () Bool)

(declare-fun e!333772 () Bool)

(assert (=> b!581591 (= e!333772 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5833 0))(
  ( (MissingZero!5833 (index!25559 (_ BitVec 32))) (Found!5833 (index!25560 (_ BitVec 32))) (Intermediate!5833 (undefined!6645 Bool) (index!25561 (_ BitVec 32)) (x!54577 (_ BitVec 32))) (Undefined!5833) (MissingVacant!5833 (index!25562 (_ BitVec 32))) )
))
(declare-fun lt!265006 () SeekEntryResult!5833)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36330 0))(
  ( (array!36331 (arr!17437 (Array (_ BitVec 32) (_ BitVec 64))) (size!17801 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36330)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36330 (_ BitVec 32)) SeekEntryResult!5833)

(assert (=> b!581591 (= lt!265006 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17437 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581592 () Bool)

(declare-fun res!369309 () Bool)

(declare-fun e!333773 () Bool)

(assert (=> b!581592 (=> (not res!369309) (not e!333773))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581592 (= res!369309 (and (= (size!17801 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17801 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17801 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!369304 () Bool)

(assert (=> start!53484 (=> (not res!369304) (not e!333773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53484 (= res!369304 (validMask!0 mask!3053))))

(assert (=> start!53484 e!333773))

(assert (=> start!53484 true))

(declare-fun array_inv!13296 (array!36330) Bool)

(assert (=> start!53484 (array_inv!13296 a!2986)))

(declare-fun b!581593 () Bool)

(declare-fun res!369305 () Bool)

(assert (=> b!581593 (=> (not res!369305) (not e!333773))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581593 (= res!369305 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581594 () Bool)

(declare-fun res!369302 () Bool)

(assert (=> b!581594 (=> (not res!369302) (not e!333773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581594 (= res!369302 (validKeyInArray!0 k0!1786))))

(declare-fun b!581595 () Bool)

(declare-fun res!369303 () Bool)

(assert (=> b!581595 (=> (not res!369303) (not e!333772))))

(declare-datatypes ((List!11385 0))(
  ( (Nil!11382) (Cons!11381 (h!12429 (_ BitVec 64)) (t!17605 List!11385)) )
))
(declare-fun arrayNoDuplicates!0 (array!36330 (_ BitVec 32) List!11385) Bool)

(assert (=> b!581595 (= res!369303 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11382))))

(declare-fun b!581596 () Bool)

(declare-fun res!369308 () Bool)

(assert (=> b!581596 (=> (not res!369308) (not e!333772))))

(assert (=> b!581596 (= res!369308 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17437 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17437 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581597 () Bool)

(declare-fun res!369307 () Bool)

(assert (=> b!581597 (=> (not res!369307) (not e!333772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36330 (_ BitVec 32)) Bool)

(assert (=> b!581597 (= res!369307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581598 () Bool)

(assert (=> b!581598 (= e!333773 e!333772)))

(declare-fun res!369310 () Bool)

(assert (=> b!581598 (=> (not res!369310) (not e!333772))))

(declare-fun lt!265005 () SeekEntryResult!5833)

(assert (=> b!581598 (= res!369310 (or (= lt!265005 (MissingZero!5833 i!1108)) (= lt!265005 (MissingVacant!5833 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36330 (_ BitVec 32)) SeekEntryResult!5833)

(assert (=> b!581598 (= lt!265005 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581599 () Bool)

(declare-fun res!369306 () Bool)

(assert (=> b!581599 (=> (not res!369306) (not e!333773))))

(assert (=> b!581599 (= res!369306 (validKeyInArray!0 (select (arr!17437 a!2986) j!136)))))

(assert (= (and start!53484 res!369304) b!581592))

(assert (= (and b!581592 res!369309) b!581599))

(assert (= (and b!581599 res!369306) b!581594))

(assert (= (and b!581594 res!369302) b!581593))

(assert (= (and b!581593 res!369305) b!581598))

(assert (= (and b!581598 res!369310) b!581597))

(assert (= (and b!581597 res!369307) b!581595))

(assert (= (and b!581595 res!369303) b!581596))

(assert (= (and b!581596 res!369308) b!581591))

(declare-fun m!560285 () Bool)

(assert (=> start!53484 m!560285))

(declare-fun m!560287 () Bool)

(assert (=> start!53484 m!560287))

(declare-fun m!560289 () Bool)

(assert (=> b!581597 m!560289))

(declare-fun m!560291 () Bool)

(assert (=> b!581596 m!560291))

(declare-fun m!560293 () Bool)

(assert (=> b!581596 m!560293))

(declare-fun m!560295 () Bool)

(assert (=> b!581596 m!560295))

(declare-fun m!560297 () Bool)

(assert (=> b!581595 m!560297))

(declare-fun m!560299 () Bool)

(assert (=> b!581598 m!560299))

(declare-fun m!560301 () Bool)

(assert (=> b!581599 m!560301))

(assert (=> b!581599 m!560301))

(declare-fun m!560303 () Bool)

(assert (=> b!581599 m!560303))

(declare-fun m!560305 () Bool)

(assert (=> b!581593 m!560305))

(declare-fun m!560307 () Bool)

(assert (=> b!581594 m!560307))

(assert (=> b!581591 m!560301))

(assert (=> b!581591 m!560301))

(declare-fun m!560309 () Bool)

(assert (=> b!581591 m!560309))

(check-sat (not b!581595) (not start!53484) (not b!581598) (not b!581591) (not b!581594) (not b!581597) (not b!581599) (not b!581593))
(check-sat)
