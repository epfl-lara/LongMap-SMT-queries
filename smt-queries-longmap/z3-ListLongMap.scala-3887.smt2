; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53382 () Bool)

(assert start!53382)

(declare-fun b!580196 () Bool)

(declare-fun res!367915 () Bool)

(declare-fun e!333313 () Bool)

(assert (=> b!580196 (=> (not res!367915) (not e!333313))))

(declare-datatypes ((array!36228 0))(
  ( (array!36229 (arr!17386 (Array (_ BitVec 32) (_ BitVec 64))) (size!17750 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36228)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36228 (_ BitVec 32)) Bool)

(assert (=> b!580196 (= res!367915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580197 () Bool)

(declare-fun e!333315 () Bool)

(assert (=> b!580197 (= e!333315 e!333313)))

(declare-fun res!367913 () Bool)

(assert (=> b!580197 (=> (not res!367913) (not e!333313))))

(declare-datatypes ((SeekEntryResult!5782 0))(
  ( (MissingZero!5782 (index!25355 (_ BitVec 32))) (Found!5782 (index!25356 (_ BitVec 32))) (Intermediate!5782 (undefined!6594 Bool) (index!25357 (_ BitVec 32)) (x!54390 (_ BitVec 32))) (Undefined!5782) (MissingVacant!5782 (index!25358 (_ BitVec 32))) )
))
(declare-fun lt!264717 () SeekEntryResult!5782)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580197 (= res!367913 (or (= lt!264717 (MissingZero!5782 i!1108)) (= lt!264717 (MissingVacant!5782 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36228 (_ BitVec 32)) SeekEntryResult!5782)

(assert (=> b!580197 (= lt!264717 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580198 () Bool)

(declare-fun res!367914 () Bool)

(assert (=> b!580198 (=> (not res!367914) (not e!333315))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580198 (= res!367914 (and (= (size!17750 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17750 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17750 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580199 () Bool)

(declare-fun res!367910 () Bool)

(assert (=> b!580199 (=> (not res!367910) (not e!333315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580199 (= res!367910 (validKeyInArray!0 k0!1786))))

(declare-fun b!580200 () Bool)

(declare-fun res!367907 () Bool)

(assert (=> b!580200 (=> (not res!367907) (not e!333313))))

(declare-datatypes ((List!11334 0))(
  ( (Nil!11331) (Cons!11330 (h!12378 (_ BitVec 64)) (t!17554 List!11334)) )
))
(declare-fun arrayNoDuplicates!0 (array!36228 (_ BitVec 32) List!11334) Bool)

(assert (=> b!580200 (= res!367907 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11331))))

(declare-fun b!580201 () Bool)

(declare-fun res!367908 () Bool)

(assert (=> b!580201 (=> (not res!367908) (not e!333315))))

(declare-fun arrayContainsKey!0 (array!36228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580201 (= res!367908 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580202 () Bool)

(assert (=> b!580202 (= e!333313 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264718 () SeekEntryResult!5782)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36228 (_ BitVec 32)) SeekEntryResult!5782)

(assert (=> b!580202 (= lt!264718 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17386 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580203 () Bool)

(declare-fun res!367912 () Bool)

(assert (=> b!580203 (=> (not res!367912) (not e!333313))))

(assert (=> b!580203 (= res!367912 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17386 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17386 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367909 () Bool)

(assert (=> start!53382 (=> (not res!367909) (not e!333315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53382 (= res!367909 (validMask!0 mask!3053))))

(assert (=> start!53382 e!333315))

(assert (=> start!53382 true))

(declare-fun array_inv!13245 (array!36228) Bool)

(assert (=> start!53382 (array_inv!13245 a!2986)))

(declare-fun b!580204 () Bool)

(declare-fun res!367911 () Bool)

(assert (=> b!580204 (=> (not res!367911) (not e!333315))))

(assert (=> b!580204 (= res!367911 (validKeyInArray!0 (select (arr!17386 a!2986) j!136)))))

(assert (= (and start!53382 res!367909) b!580198))

(assert (= (and b!580198 res!367914) b!580204))

(assert (= (and b!580204 res!367911) b!580199))

(assert (= (and b!580199 res!367910) b!580201))

(assert (= (and b!580201 res!367908) b!580197))

(assert (= (and b!580197 res!367913) b!580196))

(assert (= (and b!580196 res!367915) b!580200))

(assert (= (and b!580200 res!367907) b!580203))

(assert (= (and b!580203 res!367912) b!580202))

(declare-fun m!558947 () Bool)

(assert (=> b!580200 m!558947))

(declare-fun m!558949 () Bool)

(assert (=> start!53382 m!558949))

(declare-fun m!558951 () Bool)

(assert (=> start!53382 m!558951))

(declare-fun m!558953 () Bool)

(assert (=> b!580197 m!558953))

(declare-fun m!558955 () Bool)

(assert (=> b!580204 m!558955))

(assert (=> b!580204 m!558955))

(declare-fun m!558957 () Bool)

(assert (=> b!580204 m!558957))

(declare-fun m!558959 () Bool)

(assert (=> b!580201 m!558959))

(assert (=> b!580202 m!558955))

(assert (=> b!580202 m!558955))

(declare-fun m!558961 () Bool)

(assert (=> b!580202 m!558961))

(declare-fun m!558963 () Bool)

(assert (=> b!580199 m!558963))

(declare-fun m!558965 () Bool)

(assert (=> b!580203 m!558965))

(declare-fun m!558967 () Bool)

(assert (=> b!580203 m!558967))

(declare-fun m!558969 () Bool)

(assert (=> b!580203 m!558969))

(declare-fun m!558971 () Bool)

(assert (=> b!580196 m!558971))

(check-sat (not b!580204) (not b!580199) (not b!580197) (not b!580202) (not b!580200) (not start!53382) (not b!580201) (not b!580196))
(check-sat)
