; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56422 () Bool)

(assert start!56422)

(declare-fun b!625437 () Bool)

(declare-fun res!403444 () Bool)

(declare-fun e!358485 () Bool)

(assert (=> b!625437 (=> (not res!403444) (not e!358485))))

(declare-datatypes ((array!37802 0))(
  ( (array!37803 (arr!18144 (Array (_ BitVec 32) (_ BitVec 64))) (size!18508 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37802)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37802 (_ BitVec 32)) Bool)

(assert (=> b!625437 (= res!403444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625438 () Bool)

(declare-fun res!403447 () Bool)

(assert (=> b!625438 (=> (not res!403447) (not e!358485))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625438 (= res!403447 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18144 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18144 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625439 () Bool)

(assert (=> b!625439 (= e!358485 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6584 0))(
  ( (MissingZero!6584 (index!28620 (_ BitVec 32))) (Found!6584 (index!28621 (_ BitVec 32))) (Intermediate!6584 (undefined!7396 Bool) (index!28622 (_ BitVec 32)) (x!57374 (_ BitVec 32))) (Undefined!6584) (MissingVacant!6584 (index!28623 (_ BitVec 32))) )
))
(declare-fun lt!289824 () SeekEntryResult!6584)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37802 (_ BitVec 32)) SeekEntryResult!6584)

(assert (=> b!625439 (= lt!289824 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18144 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625440 () Bool)

(declare-fun res!403450 () Bool)

(declare-fun e!358483 () Bool)

(assert (=> b!625440 (=> (not res!403450) (not e!358483))))

(declare-fun arrayContainsKey!0 (array!37802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625440 (= res!403450 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625441 () Bool)

(assert (=> b!625441 (= e!358483 e!358485)))

(declare-fun res!403445 () Bool)

(assert (=> b!625441 (=> (not res!403445) (not e!358485))))

(declare-fun lt!289825 () SeekEntryResult!6584)

(assert (=> b!625441 (= res!403445 (or (= lt!289825 (MissingZero!6584 i!1108)) (= lt!289825 (MissingVacant!6584 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37802 (_ BitVec 32)) SeekEntryResult!6584)

(assert (=> b!625441 (= lt!289825 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625442 () Bool)

(declare-fun res!403449 () Bool)

(assert (=> b!625442 (=> (not res!403449) (not e!358483))))

(assert (=> b!625442 (= res!403449 (and (= (size!18508 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18508 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18508 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625443 () Bool)

(declare-fun res!403443 () Bool)

(assert (=> b!625443 (=> (not res!403443) (not e!358485))))

(declare-datatypes ((List!12185 0))(
  ( (Nil!12182) (Cons!12181 (h!13226 (_ BitVec 64)) (t!18413 List!12185)) )
))
(declare-fun arrayNoDuplicates!0 (array!37802 (_ BitVec 32) List!12185) Bool)

(assert (=> b!625443 (= res!403443 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12182))))

(declare-fun res!403448 () Bool)

(assert (=> start!56422 (=> (not res!403448) (not e!358483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56422 (= res!403448 (validMask!0 mask!3053))))

(assert (=> start!56422 e!358483))

(assert (=> start!56422 true))

(declare-fun array_inv!13940 (array!37802) Bool)

(assert (=> start!56422 (array_inv!13940 a!2986)))

(declare-fun b!625444 () Bool)

(declare-fun res!403451 () Bool)

(assert (=> b!625444 (=> (not res!403451) (not e!358483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625444 (= res!403451 (validKeyInArray!0 k!1786))))

(declare-fun b!625445 () Bool)

(declare-fun res!403446 () Bool)

(assert (=> b!625445 (=> (not res!403446) (not e!358483))))

(assert (=> b!625445 (= res!403446 (validKeyInArray!0 (select (arr!18144 a!2986) j!136)))))

(assert (= (and start!56422 res!403448) b!625442))

(assert (= (and b!625442 res!403449) b!625445))

(assert (= (and b!625445 res!403446) b!625444))

(assert (= (and b!625444 res!403451) b!625440))

(assert (= (and b!625440 res!403450) b!625441))

(assert (= (and b!625441 res!403445) b!625437))

(assert (= (and b!625437 res!403444) b!625443))

(assert (= (and b!625443 res!403443) b!625438))

(assert (= (and b!625438 res!403447) b!625439))

(declare-fun m!601007 () Bool)

(assert (=> b!625439 m!601007))

(assert (=> b!625439 m!601007))

(declare-fun m!601009 () Bool)

(assert (=> b!625439 m!601009))

(declare-fun m!601011 () Bool)

(assert (=> b!625437 m!601011))

(declare-fun m!601013 () Bool)

(assert (=> b!625438 m!601013))

(declare-fun m!601015 () Bool)

(assert (=> b!625438 m!601015))

(declare-fun m!601017 () Bool)

(assert (=> b!625438 m!601017))

(declare-fun m!601019 () Bool)

(assert (=> start!56422 m!601019))

(declare-fun m!601021 () Bool)

(assert (=> start!56422 m!601021))

(declare-fun m!601023 () Bool)

(assert (=> b!625441 m!601023))

(declare-fun m!601025 () Bool)

(assert (=> b!625444 m!601025))

(declare-fun m!601027 () Bool)

(assert (=> b!625443 m!601027))

(assert (=> b!625445 m!601007))

(assert (=> b!625445 m!601007))

(declare-fun m!601029 () Bool)

(assert (=> b!625445 m!601029))

(declare-fun m!601031 () Bool)

(assert (=> b!625440 m!601031))

(push 1)

