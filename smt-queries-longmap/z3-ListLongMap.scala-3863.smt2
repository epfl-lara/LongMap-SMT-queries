; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53172 () Bool)

(assert start!53172)

(declare-fun b!577887 () Bool)

(declare-fun res!365850 () Bool)

(declare-fun e!332363 () Bool)

(assert (=> b!577887 (=> (not res!365850) (not e!332363))))

(declare-datatypes ((array!36087 0))(
  ( (array!36088 (arr!17318 (Array (_ BitVec 32) (_ BitVec 64))) (size!17683 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36087)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36087 (_ BitVec 32)) Bool)

(assert (=> b!577887 (= res!365850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!365848 () Bool)

(declare-fun e!332362 () Bool)

(assert (=> start!53172 (=> (not res!365848) (not e!332362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53172 (= res!365848 (validMask!0 mask!3053))))

(assert (=> start!53172 e!332362))

(assert (=> start!53172 true))

(declare-fun array_inv!13201 (array!36087) Bool)

(assert (=> start!53172 (array_inv!13201 a!2986)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!577888 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!577888 (= e!332363 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17318 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17318 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!577889 () Bool)

(declare-fun res!365852 () Bool)

(assert (=> b!577889 (=> (not res!365852) (not e!332362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577889 (= res!365852 (validKeyInArray!0 k0!1786))))

(declare-fun b!577890 () Bool)

(declare-fun res!365851 () Bool)

(assert (=> b!577890 (=> (not res!365851) (not e!332362))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577890 (= res!365851 (validKeyInArray!0 (select (arr!17318 a!2986) j!136)))))

(declare-fun b!577891 () Bool)

(declare-fun res!365847 () Bool)

(assert (=> b!577891 (=> (not res!365847) (not e!332363))))

(declare-datatypes ((List!11398 0))(
  ( (Nil!11395) (Cons!11394 (h!12439 (_ BitVec 64)) (t!17617 List!11398)) )
))
(declare-fun arrayNoDuplicates!0 (array!36087 (_ BitVec 32) List!11398) Bool)

(assert (=> b!577891 (= res!365847 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11395))))

(declare-fun b!577892 () Bool)

(declare-fun res!365845 () Bool)

(assert (=> b!577892 (=> (not res!365845) (not e!332362))))

(assert (=> b!577892 (= res!365845 (and (= (size!17683 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17683 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17683 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577893 () Bool)

(declare-fun res!365849 () Bool)

(assert (=> b!577893 (=> (not res!365849) (not e!332362))))

(declare-fun arrayContainsKey!0 (array!36087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577893 (= res!365849 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577894 () Bool)

(assert (=> b!577894 (= e!332362 e!332363)))

(declare-fun res!365846 () Bool)

(assert (=> b!577894 (=> (not res!365846) (not e!332363))))

(declare-datatypes ((SeekEntryResult!5755 0))(
  ( (MissingZero!5755 (index!25247 (_ BitVec 32))) (Found!5755 (index!25248 (_ BitVec 32))) (Intermediate!5755 (undefined!6567 Bool) (index!25249 (_ BitVec 32)) (x!54163 (_ BitVec 32))) (Undefined!5755) (MissingVacant!5755 (index!25250 (_ BitVec 32))) )
))
(declare-fun lt!263956 () SeekEntryResult!5755)

(assert (=> b!577894 (= res!365846 (or (= lt!263956 (MissingZero!5755 i!1108)) (= lt!263956 (MissingVacant!5755 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36087 (_ BitVec 32)) SeekEntryResult!5755)

(assert (=> b!577894 (= lt!263956 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53172 res!365848) b!577892))

(assert (= (and b!577892 res!365845) b!577890))

(assert (= (and b!577890 res!365851) b!577889))

(assert (= (and b!577889 res!365852) b!577893))

(assert (= (and b!577893 res!365849) b!577894))

(assert (= (and b!577894 res!365846) b!577887))

(assert (= (and b!577887 res!365850) b!577891))

(assert (= (and b!577891 res!365847) b!577888))

(declare-fun m!556087 () Bool)

(assert (=> b!577889 m!556087))

(declare-fun m!556089 () Bool)

(assert (=> b!577888 m!556089))

(declare-fun m!556091 () Bool)

(assert (=> b!577888 m!556091))

(declare-fun m!556093 () Bool)

(assert (=> b!577888 m!556093))

(declare-fun m!556095 () Bool)

(assert (=> b!577890 m!556095))

(assert (=> b!577890 m!556095))

(declare-fun m!556097 () Bool)

(assert (=> b!577890 m!556097))

(declare-fun m!556099 () Bool)

(assert (=> b!577891 m!556099))

(declare-fun m!556101 () Bool)

(assert (=> start!53172 m!556101))

(declare-fun m!556103 () Bool)

(assert (=> start!53172 m!556103))

(declare-fun m!556105 () Bool)

(assert (=> b!577893 m!556105))

(declare-fun m!556107 () Bool)

(assert (=> b!577887 m!556107))

(declare-fun m!556109 () Bool)

(assert (=> b!577894 m!556109))

(check-sat (not b!577894) (not b!577893) (not start!53172) (not b!577890) (not b!577887) (not b!577889) (not b!577891))
(check-sat)
