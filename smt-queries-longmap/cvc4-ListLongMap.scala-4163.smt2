; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56670 () Bool)

(assert start!56670)

(declare-fun b!628207 () Bool)

(declare-fun e!359464 () Bool)

(declare-fun e!359465 () Bool)

(assert (=> b!628207 (= e!359464 e!359465)))

(declare-fun res!405907 () Bool)

(assert (=> b!628207 (=> (not res!405907) (not e!359465))))

(declare-datatypes ((SeekEntryResult!6661 0))(
  ( (MissingZero!6661 (index!28928 (_ BitVec 32))) (Found!6661 (index!28929 (_ BitVec 32))) (Intermediate!6661 (undefined!7473 Bool) (index!28930 (_ BitVec 32)) (x!57657 (_ BitVec 32))) (Undefined!6661) (MissingVacant!6661 (index!28931 (_ BitVec 32))) )
))
(declare-fun lt!290418 () SeekEntryResult!6661)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628207 (= res!405907 (or (= lt!290418 (MissingZero!6661 i!1108)) (= lt!290418 (MissingVacant!6661 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37962 0))(
  ( (array!37963 (arr!18221 (Array (_ BitVec 32) (_ BitVec 64))) (size!18585 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37962)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37962 (_ BitVec 32)) SeekEntryResult!6661)

(assert (=> b!628207 (= lt!290418 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628208 () Bool)

(declare-fun res!405917 () Bool)

(assert (=> b!628208 (=> (not res!405917) (not e!359464))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628208 (= res!405917 (and (= (size!18585 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18585 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18585 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628209 () Bool)

(declare-fun res!405909 () Bool)

(assert (=> b!628209 (=> (not res!405909) (not e!359465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37962 (_ BitVec 32)) Bool)

(assert (=> b!628209 (= res!405909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628210 () Bool)

(declare-fun res!405912 () Bool)

(assert (=> b!628210 (=> (not res!405912) (not e!359465))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37962 (_ BitVec 32)) SeekEntryResult!6661)

(assert (=> b!628210 (= res!405912 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18221 a!2986) j!136) a!2986 mask!3053) (Found!6661 j!136)))))

(declare-fun b!628211 () Bool)

(declare-fun res!405914 () Bool)

(assert (=> b!628211 (=> (not res!405914) (not e!359465))))

(assert (=> b!628211 (= res!405914 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18221 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18221 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628212 () Bool)

(declare-fun res!405911 () Bool)

(assert (=> b!628212 (=> (not res!405911) (not e!359464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628212 (= res!405911 (validKeyInArray!0 (select (arr!18221 a!2986) j!136)))))

(declare-fun res!405908 () Bool)

(assert (=> start!56670 (=> (not res!405908) (not e!359464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56670 (= res!405908 (validMask!0 mask!3053))))

(assert (=> start!56670 e!359464))

(assert (=> start!56670 true))

(declare-fun array_inv!14017 (array!37962) Bool)

(assert (=> start!56670 (array_inv!14017 a!2986)))

(declare-fun b!628213 () Bool)

(declare-fun res!405916 () Bool)

(assert (=> b!628213 (=> (not res!405916) (not e!359464))))

(declare-fun arrayContainsKey!0 (array!37962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628213 (= res!405916 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628214 () Bool)

(declare-fun res!405913 () Bool)

(assert (=> b!628214 (=> (not res!405913) (not e!359465))))

(declare-datatypes ((List!12262 0))(
  ( (Nil!12259) (Cons!12258 (h!13303 (_ BitVec 64)) (t!18490 List!12262)) )
))
(declare-fun arrayNoDuplicates!0 (array!37962 (_ BitVec 32) List!12262) Bool)

(assert (=> b!628214 (= res!405913 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12259))))

(declare-fun b!628215 () Bool)

(assert (=> b!628215 (= e!359465 false)))

(declare-fun lt!290419 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628215 (= lt!290419 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628216 () Bool)

(declare-fun res!405915 () Bool)

(assert (=> b!628216 (=> (not res!405915) (not e!359465))))

(assert (=> b!628216 (= res!405915 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18221 a!2986) index!984) (select (arr!18221 a!2986) j!136))) (not (= (select (arr!18221 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628217 () Bool)

(declare-fun res!405910 () Bool)

(assert (=> b!628217 (=> (not res!405910) (not e!359464))))

(assert (=> b!628217 (= res!405910 (validKeyInArray!0 k!1786))))

(assert (= (and start!56670 res!405908) b!628208))

(assert (= (and b!628208 res!405917) b!628212))

(assert (= (and b!628212 res!405911) b!628217))

(assert (= (and b!628217 res!405910) b!628213))

(assert (= (and b!628213 res!405916) b!628207))

(assert (= (and b!628207 res!405907) b!628209))

(assert (= (and b!628209 res!405909) b!628214))

(assert (= (and b!628214 res!405913) b!628211))

(assert (= (and b!628211 res!405914) b!628210))

(assert (= (and b!628210 res!405912) b!628216))

(assert (= (and b!628216 res!405915) b!628215))

(declare-fun m!603447 () Bool)

(assert (=> b!628213 m!603447))

(declare-fun m!603449 () Bool)

(assert (=> b!628216 m!603449))

(declare-fun m!603451 () Bool)

(assert (=> b!628216 m!603451))

(assert (=> b!628210 m!603451))

(assert (=> b!628210 m!603451))

(declare-fun m!603453 () Bool)

(assert (=> b!628210 m!603453))

(declare-fun m!603455 () Bool)

(assert (=> b!628215 m!603455))

(declare-fun m!603457 () Bool)

(assert (=> b!628209 m!603457))

(declare-fun m!603459 () Bool)

(assert (=> b!628214 m!603459))

(declare-fun m!603461 () Bool)

(assert (=> b!628217 m!603461))

(declare-fun m!603463 () Bool)

(assert (=> start!56670 m!603463))

(declare-fun m!603465 () Bool)

(assert (=> start!56670 m!603465))

(assert (=> b!628212 m!603451))

(assert (=> b!628212 m!603451))

(declare-fun m!603467 () Bool)

(assert (=> b!628212 m!603467))

(declare-fun m!603469 () Bool)

(assert (=> b!628207 m!603469))

(declare-fun m!603471 () Bool)

(assert (=> b!628211 m!603471))

(declare-fun m!603473 () Bool)

(assert (=> b!628211 m!603473))

(declare-fun m!603475 () Bool)

(assert (=> b!628211 m!603475))

(push 1)

(assert (not b!628212))

