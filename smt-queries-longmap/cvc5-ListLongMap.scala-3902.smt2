; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53422 () Bool)

(assert start!53422)

(declare-fun res!369036 () Bool)

(declare-fun e!333591 () Bool)

(assert (=> start!53422 (=> (not res!369036) (not e!333591))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53422 (= res!369036 (validMask!0 mask!3053))))

(assert (=> start!53422 e!333591))

(assert (=> start!53422 true))

(declare-datatypes ((array!36323 0))(
  ( (array!36324 (arr!17436 (Array (_ BitVec 32) (_ BitVec 64))) (size!17800 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36323)

(declare-fun array_inv!13232 (array!36323) Bool)

(assert (=> start!53422 (array_inv!13232 a!2986)))

(declare-fun b!581220 () Bool)

(declare-fun res!369040 () Bool)

(declare-fun e!333590 () Bool)

(assert (=> b!581220 (=> (not res!369040) (not e!333590))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581220 (= res!369040 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17436 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17436 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581221 () Bool)

(declare-fun res!369044 () Bool)

(assert (=> b!581221 (=> (not res!369044) (not e!333590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36323 (_ BitVec 32)) Bool)

(assert (=> b!581221 (= res!369044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581222 () Bool)

(assert (=> b!581222 (= e!333591 e!333590)))

(declare-fun res!369037 () Bool)

(assert (=> b!581222 (=> (not res!369037) (not e!333590))))

(declare-datatypes ((SeekEntryResult!5876 0))(
  ( (MissingZero!5876 (index!25731 (_ BitVec 32))) (Found!5876 (index!25732 (_ BitVec 32))) (Intermediate!5876 (undefined!6688 Bool) (index!25733 (_ BitVec 32)) (x!54601 (_ BitVec 32))) (Undefined!5876) (MissingVacant!5876 (index!25734 (_ BitVec 32))) )
))
(declare-fun lt!264868 () SeekEntryResult!5876)

(assert (=> b!581222 (= res!369037 (or (= lt!264868 (MissingZero!5876 i!1108)) (= lt!264868 (MissingVacant!5876 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36323 (_ BitVec 32)) SeekEntryResult!5876)

(assert (=> b!581222 (= lt!264868 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581223 () Bool)

(assert (=> b!581223 (= e!333590 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264867 () SeekEntryResult!5876)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36323 (_ BitVec 32)) SeekEntryResult!5876)

(assert (=> b!581223 (= lt!264867 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17436 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581224 () Bool)

(declare-fun res!369039 () Bool)

(assert (=> b!581224 (=> (not res!369039) (not e!333591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581224 (= res!369039 (validKeyInArray!0 k!1786))))

(declare-fun b!581225 () Bool)

(declare-fun res!369038 () Bool)

(assert (=> b!581225 (=> (not res!369038) (not e!333591))))

(declare-fun arrayContainsKey!0 (array!36323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581225 (= res!369038 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581226 () Bool)

(declare-fun res!369043 () Bool)

(assert (=> b!581226 (=> (not res!369043) (not e!333591))))

(assert (=> b!581226 (= res!369043 (and (= (size!17800 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17800 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17800 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581227 () Bool)

(declare-fun res!369042 () Bool)

(assert (=> b!581227 (=> (not res!369042) (not e!333591))))

(assert (=> b!581227 (= res!369042 (validKeyInArray!0 (select (arr!17436 a!2986) j!136)))))

(declare-fun b!581228 () Bool)

(declare-fun res!369041 () Bool)

(assert (=> b!581228 (=> (not res!369041) (not e!333590))))

(declare-datatypes ((List!11477 0))(
  ( (Nil!11474) (Cons!11473 (h!12518 (_ BitVec 64)) (t!17705 List!11477)) )
))
(declare-fun arrayNoDuplicates!0 (array!36323 (_ BitVec 32) List!11477) Bool)

(assert (=> b!581228 (= res!369041 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11474))))

(assert (= (and start!53422 res!369036) b!581226))

(assert (= (and b!581226 res!369043) b!581227))

(assert (= (and b!581227 res!369042) b!581224))

(assert (= (and b!581224 res!369039) b!581225))

(assert (= (and b!581225 res!369038) b!581222))

(assert (= (and b!581222 res!369037) b!581221))

(assert (= (and b!581221 res!369044) b!581228))

(assert (= (and b!581228 res!369041) b!581220))

(assert (= (and b!581220 res!369040) b!581223))

(declare-fun m!559771 () Bool)

(assert (=> b!581223 m!559771))

(assert (=> b!581223 m!559771))

(declare-fun m!559773 () Bool)

(assert (=> b!581223 m!559773))

(declare-fun m!559775 () Bool)

(assert (=> b!581225 m!559775))

(declare-fun m!559777 () Bool)

(assert (=> b!581228 m!559777))

(declare-fun m!559779 () Bool)

(assert (=> b!581224 m!559779))

(declare-fun m!559781 () Bool)

(assert (=> b!581222 m!559781))

(assert (=> b!581227 m!559771))

(assert (=> b!581227 m!559771))

(declare-fun m!559783 () Bool)

(assert (=> b!581227 m!559783))

(declare-fun m!559785 () Bool)

(assert (=> b!581221 m!559785))

(declare-fun m!559787 () Bool)

(assert (=> start!53422 m!559787))

(declare-fun m!559789 () Bool)

(assert (=> start!53422 m!559789))

(declare-fun m!559791 () Bool)

(assert (=> b!581220 m!559791))

(declare-fun m!559793 () Bool)

(assert (=> b!581220 m!559793))

(declare-fun m!559795 () Bool)

(assert (=> b!581220 m!559795))

(push 1)

