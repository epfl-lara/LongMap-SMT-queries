; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53612 () Bool)

(assert start!53612)

(declare-fun b!583926 () Bool)

(declare-fun res!371750 () Bool)

(declare-fun e!334479 () Bool)

(assert (=> b!583926 (=> (not res!371750) (not e!334479))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36513 0))(
  ( (array!36514 (arr!17531 (Array (_ BitVec 32) (_ BitVec 64))) (size!17895 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36513)

(assert (=> b!583926 (= res!371750 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17531 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17531 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583927 () Bool)

(declare-fun res!371742 () Bool)

(declare-fun e!334480 () Bool)

(assert (=> b!583927 (=> (not res!371742) (not e!334480))))

(declare-fun arrayContainsKey!0 (array!36513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583927 (= res!371742 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583928 () Bool)

(declare-fun e!334482 () Bool)

(assert (=> b!583928 (= e!334479 e!334482)))

(declare-fun res!371749 () Bool)

(assert (=> b!583928 (=> (not res!371749) (not e!334482))))

(declare-fun lt!265446 () (_ BitVec 32))

(assert (=> b!583928 (= res!371749 (and (bvsge lt!265446 #b00000000000000000000000000000000) (bvslt lt!265446 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583928 (= lt!265446 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583929 () Bool)

(declare-fun res!371753 () Bool)

(assert (=> b!583929 (=> (not res!371753) (not e!334480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583929 (= res!371753 (validKeyInArray!0 k!1786))))

(declare-fun b!583930 () Bool)

(declare-fun res!371752 () Bool)

(assert (=> b!583930 (=> (not res!371752) (not e!334479))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583930 (= res!371752 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17531 a!2986) index!984) (select (arr!17531 a!2986) j!136))) (not (= (select (arr!17531 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583931 () Bool)

(declare-fun res!371744 () Bool)

(assert (=> b!583931 (=> (not res!371744) (not e!334480))))

(assert (=> b!583931 (= res!371744 (validKeyInArray!0 (select (arr!17531 a!2986) j!136)))))

(declare-fun b!583932 () Bool)

(declare-fun res!371743 () Bool)

(assert (=> b!583932 (=> (not res!371743) (not e!334480))))

(assert (=> b!583932 (= res!371743 (and (= (size!17895 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17895 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17895 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583934 () Bool)

(declare-fun res!371746 () Bool)

(assert (=> b!583934 (=> (not res!371746) (not e!334479))))

(declare-datatypes ((List!11572 0))(
  ( (Nil!11569) (Cons!11568 (h!12613 (_ BitVec 64)) (t!17800 List!11572)) )
))
(declare-fun arrayNoDuplicates!0 (array!36513 (_ BitVec 32) List!11572) Bool)

(assert (=> b!583934 (= res!371746 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11569))))

(declare-fun b!583935 () Bool)

(assert (=> b!583935 (= e!334482 false)))

(declare-datatypes ((SeekEntryResult!5971 0))(
  ( (MissingZero!5971 (index!26111 (_ BitVec 32))) (Found!5971 (index!26112 (_ BitVec 32))) (Intermediate!5971 (undefined!6783 Bool) (index!26113 (_ BitVec 32)) (x!54944 (_ BitVec 32))) (Undefined!5971) (MissingVacant!5971 (index!26114 (_ BitVec 32))) )
))
(declare-fun lt!265445 () SeekEntryResult!5971)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36513 (_ BitVec 32)) SeekEntryResult!5971)

(assert (=> b!583935 (= lt!265445 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265446 vacantSpotIndex!68 (select (arr!17531 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!371745 () Bool)

(assert (=> start!53612 (=> (not res!371745) (not e!334480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53612 (= res!371745 (validMask!0 mask!3053))))

(assert (=> start!53612 e!334480))

(assert (=> start!53612 true))

(declare-fun array_inv!13327 (array!36513) Bool)

(assert (=> start!53612 (array_inv!13327 a!2986)))

(declare-fun b!583933 () Bool)

(declare-fun res!371747 () Bool)

(assert (=> b!583933 (=> (not res!371747) (not e!334479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36513 (_ BitVec 32)) Bool)

(assert (=> b!583933 (= res!371747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583936 () Bool)

(declare-fun res!371748 () Bool)

(assert (=> b!583936 (=> (not res!371748) (not e!334479))))

(assert (=> b!583936 (= res!371748 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17531 a!2986) j!136) a!2986 mask!3053) (Found!5971 j!136)))))

(declare-fun b!583937 () Bool)

(assert (=> b!583937 (= e!334480 e!334479)))

(declare-fun res!371751 () Bool)

(assert (=> b!583937 (=> (not res!371751) (not e!334479))))

(declare-fun lt!265447 () SeekEntryResult!5971)

(assert (=> b!583937 (= res!371751 (or (= lt!265447 (MissingZero!5971 i!1108)) (= lt!265447 (MissingVacant!5971 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36513 (_ BitVec 32)) SeekEntryResult!5971)

(assert (=> b!583937 (= lt!265447 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53612 res!371745) b!583932))

(assert (= (and b!583932 res!371743) b!583931))

(assert (= (and b!583931 res!371744) b!583929))

(assert (= (and b!583929 res!371753) b!583927))

(assert (= (and b!583927 res!371742) b!583937))

(assert (= (and b!583937 res!371751) b!583933))

(assert (= (and b!583933 res!371747) b!583934))

(assert (= (and b!583934 res!371746) b!583926))

(assert (= (and b!583926 res!371750) b!583936))

(assert (= (and b!583936 res!371748) b!583930))

(assert (= (and b!583930 res!371752) b!583928))

(assert (= (and b!583928 res!371749) b!583935))

(declare-fun m!562337 () Bool)

(assert (=> start!53612 m!562337))

(declare-fun m!562339 () Bool)

(assert (=> start!53612 m!562339))

(declare-fun m!562341 () Bool)

(assert (=> b!583936 m!562341))

(assert (=> b!583936 m!562341))

(declare-fun m!562343 () Bool)

(assert (=> b!583936 m!562343))

(declare-fun m!562345 () Bool)

(assert (=> b!583933 m!562345))

(declare-fun m!562347 () Bool)

(assert (=> b!583937 m!562347))

(declare-fun m!562349 () Bool)

(assert (=> b!583930 m!562349))

(assert (=> b!583930 m!562341))

(declare-fun m!562351 () Bool)

(assert (=> b!583926 m!562351))

(declare-fun m!562353 () Bool)

(assert (=> b!583926 m!562353))

(declare-fun m!562355 () Bool)

(assert (=> b!583926 m!562355))

(assert (=> b!583935 m!562341))

(assert (=> b!583935 m!562341))

(declare-fun m!562357 () Bool)

(assert (=> b!583935 m!562357))

(assert (=> b!583931 m!562341))

(assert (=> b!583931 m!562341))

(declare-fun m!562359 () Bool)

(assert (=> b!583931 m!562359))

(declare-fun m!562361 () Bool)

(assert (=> b!583927 m!562361))

(declare-fun m!562363 () Bool)

(assert (=> b!583928 m!562363))

(declare-fun m!562365 () Bool)

(assert (=> b!583934 m!562365))

(declare-fun m!562367 () Bool)

(assert (=> b!583929 m!562367))

(push 1)

