; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56572 () Bool)

(assert start!56572)

(declare-fun b!626652 () Bool)

(declare-fun res!404358 () Bool)

(declare-fun e!359025 () Bool)

(assert (=> b!626652 (=> (not res!404358) (not e!359025))))

(declare-datatypes ((array!37864 0))(
  ( (array!37865 (arr!18172 (Array (_ BitVec 32) (_ BitVec 64))) (size!18536 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37864)

(declare-datatypes ((List!12213 0))(
  ( (Nil!12210) (Cons!12209 (h!13254 (_ BitVec 64)) (t!18441 List!12213)) )
))
(declare-fun arrayNoDuplicates!0 (array!37864 (_ BitVec 32) List!12213) Bool)

(assert (=> b!626652 (= res!404358 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12210))))

(declare-fun b!626653 () Bool)

(declare-fun res!404352 () Bool)

(declare-fun e!359024 () Bool)

(assert (=> b!626653 (=> (not res!404352) (not e!359024))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626653 (= res!404352 (and (= (size!18536 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18536 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18536 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626654 () Bool)

(declare-fun res!404355 () Bool)

(assert (=> b!626654 (=> (not res!404355) (not e!359025))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626654 (= res!404355 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18172 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18172 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626655 () Bool)

(declare-fun res!404356 () Bool)

(assert (=> b!626655 (=> (not res!404356) (not e!359024))))

(declare-fun arrayContainsKey!0 (array!37864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626655 (= res!404356 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626656 () Bool)

(assert (=> b!626656 (= e!359024 e!359025)))

(declare-fun res!404357 () Bool)

(assert (=> b!626656 (=> (not res!404357) (not e!359025))))

(declare-datatypes ((SeekEntryResult!6612 0))(
  ( (MissingZero!6612 (index!28732 (_ BitVec 32))) (Found!6612 (index!28733 (_ BitVec 32))) (Intermediate!6612 (undefined!7424 Bool) (index!28734 (_ BitVec 32)) (x!57480 (_ BitVec 32))) (Undefined!6612) (MissingVacant!6612 (index!28735 (_ BitVec 32))) )
))
(declare-fun lt!290125 () SeekEntryResult!6612)

(assert (=> b!626656 (= res!404357 (or (= lt!290125 (MissingZero!6612 i!1108)) (= lt!290125 (MissingVacant!6612 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37864 (_ BitVec 32)) SeekEntryResult!6612)

(assert (=> b!626656 (= lt!290125 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626657 () Bool)

(declare-fun res!404353 () Bool)

(assert (=> b!626657 (=> (not res!404353) (not e!359024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626657 (= res!404353 (validKeyInArray!0 k0!1786))))

(declare-fun b!626658 () Bool)

(declare-fun res!404359 () Bool)

(assert (=> b!626658 (=> (not res!404359) (not e!359025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37864 (_ BitVec 32)) Bool)

(assert (=> b!626658 (= res!404359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404360 () Bool)

(assert (=> start!56572 (=> (not res!404360) (not e!359024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56572 (= res!404360 (validMask!0 mask!3053))))

(assert (=> start!56572 e!359024))

(assert (=> start!56572 true))

(declare-fun array_inv!13968 (array!37864) Bool)

(assert (=> start!56572 (array_inv!13968 a!2986)))

(declare-fun b!626659 () Bool)

(declare-fun res!404354 () Bool)

(assert (=> b!626659 (=> (not res!404354) (not e!359024))))

(assert (=> b!626659 (= res!404354 (validKeyInArray!0 (select (arr!18172 a!2986) j!136)))))

(declare-fun b!626660 () Bool)

(assert (=> b!626660 (= e!359025 false)))

(declare-fun lt!290124 () SeekEntryResult!6612)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37864 (_ BitVec 32)) SeekEntryResult!6612)

(assert (=> b!626660 (= lt!290124 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18172 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56572 res!404360) b!626653))

(assert (= (and b!626653 res!404352) b!626659))

(assert (= (and b!626659 res!404354) b!626657))

(assert (= (and b!626657 res!404353) b!626655))

(assert (= (and b!626655 res!404356) b!626656))

(assert (= (and b!626656 res!404357) b!626658))

(assert (= (and b!626658 res!404359) b!626652))

(assert (= (and b!626652 res!404358) b!626654))

(assert (= (and b!626654 res!404355) b!626660))

(declare-fun m!602021 () Bool)

(assert (=> b!626654 m!602021))

(declare-fun m!602023 () Bool)

(assert (=> b!626654 m!602023))

(declare-fun m!602025 () Bool)

(assert (=> b!626654 m!602025))

(declare-fun m!602027 () Bool)

(assert (=> b!626658 m!602027))

(declare-fun m!602029 () Bool)

(assert (=> b!626659 m!602029))

(assert (=> b!626659 m!602029))

(declare-fun m!602031 () Bool)

(assert (=> b!626659 m!602031))

(declare-fun m!602033 () Bool)

(assert (=> b!626652 m!602033))

(assert (=> b!626660 m!602029))

(assert (=> b!626660 m!602029))

(declare-fun m!602035 () Bool)

(assert (=> b!626660 m!602035))

(declare-fun m!602037 () Bool)

(assert (=> b!626656 m!602037))

(declare-fun m!602039 () Bool)

(assert (=> start!56572 m!602039))

(declare-fun m!602041 () Bool)

(assert (=> start!56572 m!602041))

(declare-fun m!602043 () Bool)

(assert (=> b!626655 m!602043))

(declare-fun m!602045 () Bool)

(assert (=> b!626657 m!602045))

(check-sat (not b!626660) (not b!626655) (not b!626656) (not b!626657) (not b!626652) (not start!56572) (not b!626659) (not b!626658))
(check-sat)
