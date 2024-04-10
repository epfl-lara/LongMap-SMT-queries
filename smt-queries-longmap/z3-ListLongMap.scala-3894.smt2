; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53376 () Bool)

(assert start!53376)

(declare-fun b!580590 () Bool)

(declare-fun e!333384 () Bool)

(assert (=> b!580590 (= e!333384 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36277 0))(
  ( (array!36278 (arr!17413 (Array (_ BitVec 32) (_ BitVec 64))) (size!17777 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36277)

(declare-datatypes ((SeekEntryResult!5853 0))(
  ( (MissingZero!5853 (index!25639 (_ BitVec 32))) (Found!5853 (index!25640 (_ BitVec 32))) (Intermediate!5853 (undefined!6665 Bool) (index!25641 (_ BitVec 32)) (x!54514 (_ BitVec 32))) (Undefined!5853) (MissingVacant!5853 (index!25642 (_ BitVec 32))) )
))
(declare-fun lt!264738 () SeekEntryResult!5853)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36277 (_ BitVec 32)) SeekEntryResult!5853)

(assert (=> b!580590 (= lt!264738 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17413 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580591 () Bool)

(declare-fun res!368408 () Bool)

(declare-fun e!333383 () Bool)

(assert (=> b!580591 (=> (not res!368408) (not e!333383))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580591 (= res!368408 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580592 () Bool)

(declare-fun res!368411 () Bool)

(assert (=> b!580592 (=> (not res!368411) (not e!333384))))

(declare-datatypes ((List!11454 0))(
  ( (Nil!11451) (Cons!11450 (h!12495 (_ BitVec 64)) (t!17682 List!11454)) )
))
(declare-fun arrayNoDuplicates!0 (array!36277 (_ BitVec 32) List!11454) Bool)

(assert (=> b!580592 (= res!368411 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11451))))

(declare-fun b!580593 () Bool)

(declare-fun res!368412 () Bool)

(assert (=> b!580593 (=> (not res!368412) (not e!333384))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580593 (= res!368412 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17413 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17413 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368410 () Bool)

(assert (=> start!53376 (=> (not res!368410) (not e!333383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53376 (= res!368410 (validMask!0 mask!3053))))

(assert (=> start!53376 e!333383))

(assert (=> start!53376 true))

(declare-fun array_inv!13209 (array!36277) Bool)

(assert (=> start!53376 (array_inv!13209 a!2986)))

(declare-fun b!580594 () Bool)

(declare-fun res!368414 () Bool)

(assert (=> b!580594 (=> (not res!368414) (not e!333384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36277 (_ BitVec 32)) Bool)

(assert (=> b!580594 (= res!368414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580595 () Bool)

(assert (=> b!580595 (= e!333383 e!333384)))

(declare-fun res!368406 () Bool)

(assert (=> b!580595 (=> (not res!368406) (not e!333384))))

(declare-fun lt!264739 () SeekEntryResult!5853)

(assert (=> b!580595 (= res!368406 (or (= lt!264739 (MissingZero!5853 i!1108)) (= lt!264739 (MissingVacant!5853 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36277 (_ BitVec 32)) SeekEntryResult!5853)

(assert (=> b!580595 (= lt!264739 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580596 () Bool)

(declare-fun res!368409 () Bool)

(assert (=> b!580596 (=> (not res!368409) (not e!333383))))

(assert (=> b!580596 (= res!368409 (and (= (size!17777 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17777 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17777 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580597 () Bool)

(declare-fun res!368413 () Bool)

(assert (=> b!580597 (=> (not res!368413) (not e!333383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580597 (= res!368413 (validKeyInArray!0 k0!1786))))

(declare-fun b!580598 () Bool)

(declare-fun res!368407 () Bool)

(assert (=> b!580598 (=> (not res!368407) (not e!333383))))

(assert (=> b!580598 (= res!368407 (validKeyInArray!0 (select (arr!17413 a!2986) j!136)))))

(assert (= (and start!53376 res!368410) b!580596))

(assert (= (and b!580596 res!368409) b!580598))

(assert (= (and b!580598 res!368407) b!580597))

(assert (= (and b!580597 res!368413) b!580591))

(assert (= (and b!580591 res!368408) b!580595))

(assert (= (and b!580595 res!368406) b!580594))

(assert (= (and b!580594 res!368414) b!580592))

(assert (= (and b!580592 res!368411) b!580593))

(assert (= (and b!580593 res!368412) b!580590))

(declare-fun m!559167 () Bool)

(assert (=> start!53376 m!559167))

(declare-fun m!559169 () Bool)

(assert (=> start!53376 m!559169))

(declare-fun m!559171 () Bool)

(assert (=> b!580593 m!559171))

(declare-fun m!559173 () Bool)

(assert (=> b!580593 m!559173))

(declare-fun m!559175 () Bool)

(assert (=> b!580593 m!559175))

(declare-fun m!559177 () Bool)

(assert (=> b!580592 m!559177))

(declare-fun m!559179 () Bool)

(assert (=> b!580591 m!559179))

(declare-fun m!559181 () Bool)

(assert (=> b!580590 m!559181))

(assert (=> b!580590 m!559181))

(declare-fun m!559183 () Bool)

(assert (=> b!580590 m!559183))

(declare-fun m!559185 () Bool)

(assert (=> b!580594 m!559185))

(declare-fun m!559187 () Bool)

(assert (=> b!580595 m!559187))

(declare-fun m!559189 () Bool)

(assert (=> b!580597 m!559189))

(assert (=> b!580598 m!559181))

(assert (=> b!580598 m!559181))

(declare-fun m!559191 () Bool)

(assert (=> b!580598 m!559191))

(check-sat (not b!580594) (not b!580598) (not b!580592) (not b!580590) (not b!580595) (not start!53376) (not b!580591) (not b!580597))
