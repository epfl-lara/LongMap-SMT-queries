; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53352 () Bool)

(assert start!53352)

(declare-fun b!580211 () Bool)

(declare-fun res!368171 () Bool)

(declare-fun e!333172 () Bool)

(assert (=> b!580211 (=> (not res!368171) (not e!333172))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580211 (= res!368171 (validKeyInArray!0 k0!1786))))

(declare-fun b!580212 () Bool)

(declare-fun res!368173 () Bool)

(assert (=> b!580212 (=> (not res!368173) (not e!333172))))

(declare-datatypes ((array!36267 0))(
  ( (array!36268 (arr!17408 (Array (_ BitVec 32) (_ BitVec 64))) (size!17773 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36267)

(declare-fun arrayContainsKey!0 (array!36267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580212 (= res!368173 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368177 () Bool)

(assert (=> start!53352 (=> (not res!368177) (not e!333172))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53352 (= res!368177 (validMask!0 mask!3053))))

(assert (=> start!53352 e!333172))

(assert (=> start!53352 true))

(declare-fun array_inv!13291 (array!36267) Bool)

(assert (=> start!53352 (array_inv!13291 a!2986)))

(declare-fun b!580213 () Bool)

(declare-fun res!368169 () Bool)

(declare-fun e!333174 () Bool)

(assert (=> b!580213 (=> (not res!368169) (not e!333174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36267 (_ BitVec 32)) Bool)

(assert (=> b!580213 (= res!368169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580214 () Bool)

(assert (=> b!580214 (= e!333174 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5845 0))(
  ( (MissingZero!5845 (index!25607 (_ BitVec 32))) (Found!5845 (index!25608 (_ BitVec 32))) (Intermediate!5845 (undefined!6657 Bool) (index!25609 (_ BitVec 32)) (x!54493 (_ BitVec 32))) (Undefined!5845) (MissingVacant!5845 (index!25610 (_ BitVec 32))) )
))
(declare-fun lt!264480 () SeekEntryResult!5845)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36267 (_ BitVec 32)) SeekEntryResult!5845)

(assert (=> b!580214 (= lt!264480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17408 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580215 () Bool)

(declare-fun res!368175 () Bool)

(assert (=> b!580215 (=> (not res!368175) (not e!333174))))

(declare-datatypes ((List!11488 0))(
  ( (Nil!11485) (Cons!11484 (h!12529 (_ BitVec 64)) (t!17707 List!11488)) )
))
(declare-fun arrayNoDuplicates!0 (array!36267 (_ BitVec 32) List!11488) Bool)

(assert (=> b!580215 (= res!368175 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11485))))

(declare-fun b!580216 () Bool)

(assert (=> b!580216 (= e!333172 e!333174)))

(declare-fun res!368172 () Bool)

(assert (=> b!580216 (=> (not res!368172) (not e!333174))))

(declare-fun lt!264481 () SeekEntryResult!5845)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580216 (= res!368172 (or (= lt!264481 (MissingZero!5845 i!1108)) (= lt!264481 (MissingVacant!5845 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36267 (_ BitVec 32)) SeekEntryResult!5845)

(assert (=> b!580216 (= lt!264481 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580217 () Bool)

(declare-fun res!368174 () Bool)

(assert (=> b!580217 (=> (not res!368174) (not e!333172))))

(assert (=> b!580217 (= res!368174 (validKeyInArray!0 (select (arr!17408 a!2986) j!136)))))

(declare-fun b!580218 () Bool)

(declare-fun res!368176 () Bool)

(assert (=> b!580218 (=> (not res!368176) (not e!333172))))

(assert (=> b!580218 (= res!368176 (and (= (size!17773 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17773 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17773 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580219 () Bool)

(declare-fun res!368170 () Bool)

(assert (=> b!580219 (=> (not res!368170) (not e!333174))))

(assert (=> b!580219 (= res!368170 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17408 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17408 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53352 res!368177) b!580218))

(assert (= (and b!580218 res!368176) b!580217))

(assert (= (and b!580217 res!368174) b!580211))

(assert (= (and b!580211 res!368171) b!580212))

(assert (= (and b!580212 res!368173) b!580216))

(assert (= (and b!580216 res!368172) b!580213))

(assert (= (and b!580213 res!368169) b!580215))

(assert (= (and b!580215 res!368175) b!580219))

(assert (= (and b!580219 res!368170) b!580214))

(declare-fun m!558277 () Bool)

(assert (=> b!580212 m!558277))

(declare-fun m!558279 () Bool)

(assert (=> b!580214 m!558279))

(assert (=> b!580214 m!558279))

(declare-fun m!558281 () Bool)

(assert (=> b!580214 m!558281))

(declare-fun m!558283 () Bool)

(assert (=> start!53352 m!558283))

(declare-fun m!558285 () Bool)

(assert (=> start!53352 m!558285))

(declare-fun m!558287 () Bool)

(assert (=> b!580216 m!558287))

(declare-fun m!558289 () Bool)

(assert (=> b!580211 m!558289))

(declare-fun m!558291 () Bool)

(assert (=> b!580219 m!558291))

(declare-fun m!558293 () Bool)

(assert (=> b!580219 m!558293))

(declare-fun m!558295 () Bool)

(assert (=> b!580219 m!558295))

(assert (=> b!580217 m!558279))

(assert (=> b!580217 m!558279))

(declare-fun m!558297 () Bool)

(assert (=> b!580217 m!558297))

(declare-fun m!558299 () Bool)

(assert (=> b!580215 m!558299))

(declare-fun m!558301 () Bool)

(assert (=> b!580213 m!558301))

(check-sat (not start!53352) (not b!580214) (not b!580217) (not b!580211) (not b!580213) (not b!580216) (not b!580215) (not b!580212))
(check-sat)
