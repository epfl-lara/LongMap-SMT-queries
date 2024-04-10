; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53256 () Bool)

(assert start!53256)

(declare-fun b!578970 () Bool)

(declare-fun res!366792 () Bool)

(declare-fun e!332844 () Bool)

(assert (=> b!578970 (=> (not res!366792) (not e!332844))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36157 0))(
  ( (array!36158 (arr!17353 (Array (_ BitVec 32) (_ BitVec 64))) (size!17717 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36157)

(assert (=> b!578970 (= res!366792 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17353 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17353 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578971 () Bool)

(assert (=> b!578971 (= e!332844 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5793 0))(
  ( (MissingZero!5793 (index!25399 (_ BitVec 32))) (Found!5793 (index!25400 (_ BitVec 32))) (Intermediate!5793 (undefined!6605 Bool) (index!25401 (_ BitVec 32)) (x!54294 (_ BitVec 32))) (Undefined!5793) (MissingVacant!5793 (index!25402 (_ BitVec 32))) )
))
(declare-fun lt!264378 () SeekEntryResult!5793)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36157 (_ BitVec 32)) SeekEntryResult!5793)

(assert (=> b!578971 (= lt!264378 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17353 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578972 () Bool)

(declare-fun res!366787 () Bool)

(declare-fun e!332842 () Bool)

(assert (=> b!578972 (=> (not res!366787) (not e!332842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578972 (= res!366787 (validKeyInArray!0 (select (arr!17353 a!2986) j!136)))))

(declare-fun b!578973 () Bool)

(assert (=> b!578973 (= e!332842 e!332844)))

(declare-fun res!366788 () Bool)

(assert (=> b!578973 (=> (not res!366788) (not e!332844))))

(declare-fun lt!264379 () SeekEntryResult!5793)

(assert (=> b!578973 (= res!366788 (or (= lt!264379 (MissingZero!5793 i!1108)) (= lt!264379 (MissingVacant!5793 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36157 (_ BitVec 32)) SeekEntryResult!5793)

(assert (=> b!578973 (= lt!264379 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578974 () Bool)

(declare-fun res!366794 () Bool)

(assert (=> b!578974 (=> (not res!366794) (not e!332842))))

(assert (=> b!578974 (= res!366794 (and (= (size!17717 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17717 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17717 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578975 () Bool)

(declare-fun res!366790 () Bool)

(assert (=> b!578975 (=> (not res!366790) (not e!332842))))

(assert (=> b!578975 (= res!366790 (validKeyInArray!0 k0!1786))))

(declare-fun b!578976 () Bool)

(declare-fun res!366789 () Bool)

(assert (=> b!578976 (=> (not res!366789) (not e!332844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36157 (_ BitVec 32)) Bool)

(assert (=> b!578976 (= res!366789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366791 () Bool)

(assert (=> start!53256 (=> (not res!366791) (not e!332842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53256 (= res!366791 (validMask!0 mask!3053))))

(assert (=> start!53256 e!332842))

(assert (=> start!53256 true))

(declare-fun array_inv!13149 (array!36157) Bool)

(assert (=> start!53256 (array_inv!13149 a!2986)))

(declare-fun b!578977 () Bool)

(declare-fun res!366793 () Bool)

(assert (=> b!578977 (=> (not res!366793) (not e!332842))))

(declare-fun arrayContainsKey!0 (array!36157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578977 (= res!366793 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578978 () Bool)

(declare-fun res!366786 () Bool)

(assert (=> b!578978 (=> (not res!366786) (not e!332844))))

(declare-datatypes ((List!11394 0))(
  ( (Nil!11391) (Cons!11390 (h!12435 (_ BitVec 64)) (t!17622 List!11394)) )
))
(declare-fun arrayNoDuplicates!0 (array!36157 (_ BitVec 32) List!11394) Bool)

(assert (=> b!578978 (= res!366786 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11391))))

(assert (= (and start!53256 res!366791) b!578974))

(assert (= (and b!578974 res!366794) b!578972))

(assert (= (and b!578972 res!366787) b!578975))

(assert (= (and b!578975 res!366790) b!578977))

(assert (= (and b!578977 res!366793) b!578973))

(assert (= (and b!578973 res!366788) b!578976))

(assert (= (and b!578976 res!366789) b!578978))

(assert (= (and b!578978 res!366786) b!578970))

(assert (= (and b!578970 res!366792) b!578971))

(declare-fun m!557607 () Bool)

(assert (=> b!578978 m!557607))

(declare-fun m!557609 () Bool)

(assert (=> b!578971 m!557609))

(assert (=> b!578971 m!557609))

(declare-fun m!557611 () Bool)

(assert (=> b!578971 m!557611))

(declare-fun m!557613 () Bool)

(assert (=> b!578975 m!557613))

(declare-fun m!557615 () Bool)

(assert (=> b!578977 m!557615))

(declare-fun m!557617 () Bool)

(assert (=> b!578970 m!557617))

(declare-fun m!557619 () Bool)

(assert (=> b!578970 m!557619))

(declare-fun m!557621 () Bool)

(assert (=> b!578970 m!557621))

(assert (=> b!578972 m!557609))

(assert (=> b!578972 m!557609))

(declare-fun m!557623 () Bool)

(assert (=> b!578972 m!557623))

(declare-fun m!557625 () Bool)

(assert (=> b!578973 m!557625))

(declare-fun m!557627 () Bool)

(assert (=> b!578976 m!557627))

(declare-fun m!557629 () Bool)

(assert (=> start!53256 m!557629))

(declare-fun m!557631 () Bool)

(assert (=> start!53256 m!557631))

(check-sat (not b!578978) (not b!578972) (not b!578971) (not b!578973) (not b!578975) (not b!578977) (not b!578976) (not start!53256))
