; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56456 () Bool)

(assert start!56456)

(declare-fun b!625904 () Bool)

(declare-fun e!358644 () Bool)

(declare-fun e!358645 () Bool)

(assert (=> b!625904 (= e!358644 e!358645)))

(declare-fun res!403914 () Bool)

(assert (=> b!625904 (=> (not res!403914) (not e!358645))))

(declare-datatypes ((SeekEntryResult!6601 0))(
  ( (MissingZero!6601 (index!28688 (_ BitVec 32))) (Found!6601 (index!28689 (_ BitVec 32))) (Intermediate!6601 (undefined!7413 Bool) (index!28690 (_ BitVec 32)) (x!57431 (_ BitVec 32))) (Undefined!6601) (MissingVacant!6601 (index!28691 (_ BitVec 32))) )
))
(declare-fun lt!289926 () SeekEntryResult!6601)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37836 0))(
  ( (array!37837 (arr!18161 (Array (_ BitVec 32) (_ BitVec 64))) (size!18525 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37836)

(assert (=> b!625904 (= res!403914 (and (= lt!289926 (Found!6601 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18161 a!2986) index!984) (select (arr!18161 a!2986) j!136)) (= index!984 j!136)))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37836 (_ BitVec 32)) SeekEntryResult!6601)

(assert (=> b!625904 (= lt!289926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18161 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625905 () Bool)

(declare-fun res!403911 () Bool)

(assert (=> b!625905 (=> (not res!403911) (not e!358644))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!625905 (= res!403911 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18161 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18161 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403912 () Bool)

(declare-fun e!358646 () Bool)

(assert (=> start!56456 (=> (not res!403912) (not e!358646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56456 (= res!403912 (validMask!0 mask!3053))))

(assert (=> start!56456 e!358646))

(assert (=> start!56456 true))

(declare-fun array_inv!13957 (array!37836) Bool)

(assert (=> start!56456 (array_inv!13957 a!2986)))

(declare-fun b!625906 () Bool)

(assert (=> b!625906 (= e!358646 e!358644)))

(declare-fun res!403913 () Bool)

(assert (=> b!625906 (=> (not res!403913) (not e!358644))))

(declare-fun lt!289927 () SeekEntryResult!6601)

(assert (=> b!625906 (= res!403913 (or (= lt!289927 (MissingZero!6601 i!1108)) (= lt!289927 (MissingVacant!6601 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37836 (_ BitVec 32)) SeekEntryResult!6601)

(assert (=> b!625906 (= lt!289927 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625907 () Bool)

(declare-fun res!403919 () Bool)

(assert (=> b!625907 (=> (not res!403919) (not e!358644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37836 (_ BitVec 32)) Bool)

(assert (=> b!625907 (= res!403919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625908 () Bool)

(declare-fun res!403910 () Bool)

(assert (=> b!625908 (=> (not res!403910) (not e!358646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625908 (= res!403910 (validKeyInArray!0 k!1786))))

(declare-fun b!625909 () Bool)

(assert (=> b!625909 (= e!358645 (not (= lt!289926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18161 a!2986) i!1108 k!1786) j!136) (array!37837 (store (arr!18161 a!2986) i!1108 k!1786) (size!18525 a!2986)) mask!3053))))))

(declare-fun b!625910 () Bool)

(declare-fun res!403915 () Bool)

(assert (=> b!625910 (=> (not res!403915) (not e!358644))))

(declare-datatypes ((List!12202 0))(
  ( (Nil!12199) (Cons!12198 (h!13243 (_ BitVec 64)) (t!18430 List!12202)) )
))
(declare-fun arrayNoDuplicates!0 (array!37836 (_ BitVec 32) List!12202) Bool)

(assert (=> b!625910 (= res!403915 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12199))))

(declare-fun b!625911 () Bool)

(declare-fun res!403917 () Bool)

(assert (=> b!625911 (=> (not res!403917) (not e!358646))))

(assert (=> b!625911 (= res!403917 (and (= (size!18525 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18525 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18525 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625912 () Bool)

(declare-fun res!403918 () Bool)

(assert (=> b!625912 (=> (not res!403918) (not e!358646))))

(declare-fun arrayContainsKey!0 (array!37836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625912 (= res!403918 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625913 () Bool)

(declare-fun res!403916 () Bool)

(assert (=> b!625913 (=> (not res!403916) (not e!358646))))

(assert (=> b!625913 (= res!403916 (validKeyInArray!0 (select (arr!18161 a!2986) j!136)))))

(assert (= (and start!56456 res!403912) b!625911))

(assert (= (and b!625911 res!403917) b!625913))

(assert (= (and b!625913 res!403916) b!625908))

(assert (= (and b!625908 res!403910) b!625912))

(assert (= (and b!625912 res!403918) b!625906))

(assert (= (and b!625906 res!403913) b!625907))

(assert (= (and b!625907 res!403919) b!625910))

(assert (= (and b!625910 res!403915) b!625905))

(assert (= (and b!625905 res!403911) b!625904))

(assert (= (and b!625904 res!403914) b!625909))

(declare-fun m!601461 () Bool)

(assert (=> b!625910 m!601461))

(declare-fun m!601463 () Bool)

(assert (=> b!625907 m!601463))

(declare-fun m!601465 () Bool)

(assert (=> b!625908 m!601465))

(declare-fun m!601467 () Bool)

(assert (=> start!56456 m!601467))

(declare-fun m!601469 () Bool)

(assert (=> start!56456 m!601469))

(declare-fun m!601471 () Bool)

(assert (=> b!625909 m!601471))

(declare-fun m!601473 () Bool)

(assert (=> b!625909 m!601473))

(assert (=> b!625909 m!601473))

(declare-fun m!601475 () Bool)

(assert (=> b!625909 m!601475))

(declare-fun m!601477 () Bool)

(assert (=> b!625905 m!601477))

(assert (=> b!625905 m!601471))

(declare-fun m!601479 () Bool)

(assert (=> b!625905 m!601479))

(declare-fun m!601481 () Bool)

(assert (=> b!625904 m!601481))

(declare-fun m!601483 () Bool)

(assert (=> b!625904 m!601483))

(assert (=> b!625904 m!601483))

(declare-fun m!601485 () Bool)

(assert (=> b!625904 m!601485))

(declare-fun m!601487 () Bool)

(assert (=> b!625906 m!601487))

(assert (=> b!625913 m!601483))

(assert (=> b!625913 m!601483))

(declare-fun m!601489 () Bool)

(assert (=> b!625913 m!601489))

(declare-fun m!601491 () Bool)

(assert (=> b!625912 m!601491))

(push 1)

(assert (not b!625906))

(assert (not b!625909))

(assert (not b!625904))

(assert (not b!625907))

(assert (not start!56456))

(assert (not b!625913))

(assert (not b!625912))

(assert (not b!625908))

(assert (not b!625910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

