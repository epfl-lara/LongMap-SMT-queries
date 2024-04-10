; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53490 () Bool)

(assert start!53490)

(declare-fun b!582165 () Bool)

(declare-fun e!333895 () Bool)

(assert (=> b!582165 (= e!333895 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5910 0))(
  ( (MissingZero!5910 (index!25867 (_ BitVec 32))) (Found!5910 (index!25868 (_ BitVec 32))) (Intermediate!5910 (undefined!6722 Bool) (index!25869 (_ BitVec 32)) (x!54723 (_ BitVec 32))) (Undefined!5910) (MissingVacant!5910 (index!25870 (_ BitVec 32))) )
))
(declare-fun lt!265053 () SeekEntryResult!5910)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36391 0))(
  ( (array!36392 (arr!17470 (Array (_ BitVec 32) (_ BitVec 64))) (size!17834 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36391)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36391 (_ BitVec 32)) SeekEntryResult!5910)

(assert (=> b!582165 (= lt!265053 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17470 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582166 () Bool)

(declare-fun res!369981 () Bool)

(assert (=> b!582166 (=> (not res!369981) (not e!333895))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!582166 (= res!369981 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17470 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17470 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582167 () Bool)

(declare-fun res!369988 () Bool)

(assert (=> b!582167 (=> (not res!369988) (not e!333895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36391 (_ BitVec 32)) Bool)

(assert (=> b!582167 (= res!369988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582168 () Bool)

(declare-fun res!369987 () Bool)

(declare-fun e!333897 () Bool)

(assert (=> b!582168 (=> (not res!369987) (not e!333897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582168 (= res!369987 (validKeyInArray!0 k0!1786))))

(declare-fun b!582170 () Bool)

(assert (=> b!582170 (= e!333897 e!333895)))

(declare-fun res!369984 () Bool)

(assert (=> b!582170 (=> (not res!369984) (not e!333895))))

(declare-fun lt!265054 () SeekEntryResult!5910)

(assert (=> b!582170 (= res!369984 (or (= lt!265054 (MissingZero!5910 i!1108)) (= lt!265054 (MissingVacant!5910 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36391 (_ BitVec 32)) SeekEntryResult!5910)

(assert (=> b!582170 (= lt!265054 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582171 () Bool)

(declare-fun res!369985 () Bool)

(assert (=> b!582171 (=> (not res!369985) (not e!333897))))

(assert (=> b!582171 (= res!369985 (validKeyInArray!0 (select (arr!17470 a!2986) j!136)))))

(declare-fun b!582172 () Bool)

(declare-fun res!369982 () Bool)

(assert (=> b!582172 (=> (not res!369982) (not e!333897))))

(declare-fun arrayContainsKey!0 (array!36391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582172 (= res!369982 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582173 () Bool)

(declare-fun res!369983 () Bool)

(assert (=> b!582173 (=> (not res!369983) (not e!333895))))

(declare-datatypes ((List!11511 0))(
  ( (Nil!11508) (Cons!11507 (h!12552 (_ BitVec 64)) (t!17739 List!11511)) )
))
(declare-fun arrayNoDuplicates!0 (array!36391 (_ BitVec 32) List!11511) Bool)

(assert (=> b!582173 (= res!369983 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11508))))

(declare-fun res!369986 () Bool)

(assert (=> start!53490 (=> (not res!369986) (not e!333897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53490 (= res!369986 (validMask!0 mask!3053))))

(assert (=> start!53490 e!333897))

(assert (=> start!53490 true))

(declare-fun array_inv!13266 (array!36391) Bool)

(assert (=> start!53490 (array_inv!13266 a!2986)))

(declare-fun b!582169 () Bool)

(declare-fun res!369989 () Bool)

(assert (=> b!582169 (=> (not res!369989) (not e!333897))))

(assert (=> b!582169 (= res!369989 (and (= (size!17834 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17834 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17834 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53490 res!369986) b!582169))

(assert (= (and b!582169 res!369989) b!582171))

(assert (= (and b!582171 res!369985) b!582168))

(assert (= (and b!582168 res!369987) b!582172))

(assert (= (and b!582172 res!369982) b!582170))

(assert (= (and b!582170 res!369984) b!582167))

(assert (= (and b!582167 res!369988) b!582173))

(assert (= (and b!582173 res!369983) b!582166))

(assert (= (and b!582166 res!369981) b!582165))

(declare-fun m!560679 () Bool)

(assert (=> b!582165 m!560679))

(assert (=> b!582165 m!560679))

(declare-fun m!560681 () Bool)

(assert (=> b!582165 m!560681))

(declare-fun m!560683 () Bool)

(assert (=> b!582170 m!560683))

(declare-fun m!560685 () Bool)

(assert (=> b!582167 m!560685))

(declare-fun m!560687 () Bool)

(assert (=> start!53490 m!560687))

(declare-fun m!560689 () Bool)

(assert (=> start!53490 m!560689))

(declare-fun m!560691 () Bool)

(assert (=> b!582172 m!560691))

(declare-fun m!560693 () Bool)

(assert (=> b!582168 m!560693))

(declare-fun m!560695 () Bool)

(assert (=> b!582166 m!560695))

(declare-fun m!560697 () Bool)

(assert (=> b!582166 m!560697))

(declare-fun m!560699 () Bool)

(assert (=> b!582166 m!560699))

(assert (=> b!582171 m!560679))

(assert (=> b!582171 m!560679))

(declare-fun m!560701 () Bool)

(assert (=> b!582171 m!560701))

(declare-fun m!560703 () Bool)

(assert (=> b!582173 m!560703))

(check-sat (not b!582172) (not b!582171) (not b!582167) (not b!582170) (not b!582165) (not start!53490) (not b!582173) (not b!582168))
(check-sat)
