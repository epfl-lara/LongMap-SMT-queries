; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53454 () Bool)

(assert start!53454)

(declare-fun b!581177 () Bool)

(declare-fun res!368894 () Bool)

(declare-fun e!333638 () Bool)

(assert (=> b!581177 (=> (not res!368894) (not e!333638))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36300 0))(
  ( (array!36301 (arr!17422 (Array (_ BitVec 32) (_ BitVec 64))) (size!17786 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36300)

(assert (=> b!581177 (= res!368894 (and (= (size!17786 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17786 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17786 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581178 () Bool)

(declare-fun res!368891 () Bool)

(assert (=> b!581178 (=> (not res!368891) (not e!333638))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581178 (= res!368891 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581179 () Bool)

(declare-fun res!368893 () Bool)

(assert (=> b!581179 (=> (not res!368893) (not e!333638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581179 (= res!368893 (validKeyInArray!0 (select (arr!17422 a!2986) j!136)))))

(declare-fun b!581180 () Bool)

(declare-fun res!368890 () Bool)

(declare-fun e!333637 () Bool)

(assert (=> b!581180 (=> (not res!368890) (not e!333637))))

(declare-datatypes ((List!11370 0))(
  ( (Nil!11367) (Cons!11366 (h!12414 (_ BitVec 64)) (t!17590 List!11370)) )
))
(declare-fun arrayNoDuplicates!0 (array!36300 (_ BitVec 32) List!11370) Bool)

(assert (=> b!581180 (= res!368890 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11367))))

(declare-fun b!581181 () Bool)

(declare-fun res!368895 () Bool)

(assert (=> b!581181 (=> (not res!368895) (not e!333637))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581181 (= res!368895 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17422 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17422 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368896 () Bool)

(assert (=> start!53454 (=> (not res!368896) (not e!333638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53454 (= res!368896 (validMask!0 mask!3053))))

(assert (=> start!53454 e!333638))

(assert (=> start!53454 true))

(declare-fun array_inv!13281 (array!36300) Bool)

(assert (=> start!53454 (array_inv!13281 a!2986)))

(declare-fun b!581182 () Bool)

(assert (=> b!581182 (= e!333637 false)))

(declare-datatypes ((SeekEntryResult!5818 0))(
  ( (MissingZero!5818 (index!25499 (_ BitVec 32))) (Found!5818 (index!25500 (_ BitVec 32))) (Intermediate!5818 (undefined!6630 Bool) (index!25501 (_ BitVec 32)) (x!54522 (_ BitVec 32))) (Undefined!5818) (MissingVacant!5818 (index!25502 (_ BitVec 32))) )
))
(declare-fun lt!264924 () SeekEntryResult!5818)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36300 (_ BitVec 32)) SeekEntryResult!5818)

(assert (=> b!581182 (= lt!264924 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17422 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581183 () Bool)

(assert (=> b!581183 (= e!333638 e!333637)))

(declare-fun res!368889 () Bool)

(assert (=> b!581183 (=> (not res!368889) (not e!333637))))

(declare-fun lt!264925 () SeekEntryResult!5818)

(assert (=> b!581183 (= res!368889 (or (= lt!264925 (MissingZero!5818 i!1108)) (= lt!264925 (MissingVacant!5818 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36300 (_ BitVec 32)) SeekEntryResult!5818)

(assert (=> b!581183 (= lt!264925 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581184 () Bool)

(declare-fun res!368892 () Bool)

(assert (=> b!581184 (=> (not res!368892) (not e!333637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36300 (_ BitVec 32)) Bool)

(assert (=> b!581184 (= res!368892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581185 () Bool)

(declare-fun res!368888 () Bool)

(assert (=> b!581185 (=> (not res!368888) (not e!333638))))

(assert (=> b!581185 (= res!368888 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53454 res!368896) b!581177))

(assert (= (and b!581177 res!368894) b!581179))

(assert (= (and b!581179 res!368893) b!581185))

(assert (= (and b!581185 res!368888) b!581178))

(assert (= (and b!581178 res!368891) b!581183))

(assert (= (and b!581183 res!368889) b!581184))

(assert (= (and b!581184 res!368892) b!581180))

(assert (= (and b!581180 res!368890) b!581181))

(assert (= (and b!581181 res!368895) b!581182))

(declare-fun m!559889 () Bool)

(assert (=> b!581184 m!559889))

(declare-fun m!559891 () Bool)

(assert (=> b!581181 m!559891))

(declare-fun m!559893 () Bool)

(assert (=> b!581181 m!559893))

(declare-fun m!559895 () Bool)

(assert (=> b!581181 m!559895))

(declare-fun m!559897 () Bool)

(assert (=> b!581183 m!559897))

(declare-fun m!559899 () Bool)

(assert (=> b!581179 m!559899))

(assert (=> b!581179 m!559899))

(declare-fun m!559901 () Bool)

(assert (=> b!581179 m!559901))

(declare-fun m!559903 () Bool)

(assert (=> start!53454 m!559903))

(declare-fun m!559905 () Bool)

(assert (=> start!53454 m!559905))

(declare-fun m!559907 () Bool)

(assert (=> b!581178 m!559907))

(declare-fun m!559909 () Bool)

(assert (=> b!581185 m!559909))

(assert (=> b!581182 m!559899))

(assert (=> b!581182 m!559899))

(declare-fun m!559911 () Bool)

(assert (=> b!581182 m!559911))

(declare-fun m!559913 () Bool)

(assert (=> b!581180 m!559913))

(check-sat (not b!581182) (not b!581185) (not b!581184) (not b!581179) (not b!581178) (not b!581180) (not b!581183) (not start!53454))
(check-sat)
