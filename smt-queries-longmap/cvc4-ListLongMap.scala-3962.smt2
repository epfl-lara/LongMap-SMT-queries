; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53786 () Bool)

(assert start!53786)

(declare-fun b!586933 () Bool)

(declare-fun res!374759 () Bool)

(declare-fun e!335399 () Bool)

(assert (=> b!586933 (=> (not res!374759) (not e!335399))))

(declare-datatypes ((array!36687 0))(
  ( (array!36688 (arr!17618 (Array (_ BitVec 32) (_ BitVec 64))) (size!17982 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36687)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586933 (= res!374759 (validKeyInArray!0 (select (arr!17618 a!2986) j!136)))))

(declare-fun b!586934 () Bool)

(declare-fun res!374758 () Bool)

(declare-fun e!335400 () Bool)

(assert (=> b!586934 (=> (not res!374758) (not e!335400))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586934 (= res!374758 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17618 a!2986) index!984) (select (arr!17618 a!2986) j!136))) (not (= (select (arr!17618 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586935 () Bool)

(declare-fun res!374756 () Bool)

(assert (=> b!586935 (=> (not res!374756) (not e!335399))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!586935 (= res!374756 (validKeyInArray!0 k!1786))))

(declare-fun res!374749 () Bool)

(assert (=> start!53786 (=> (not res!374749) (not e!335399))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53786 (= res!374749 (validMask!0 mask!3053))))

(assert (=> start!53786 e!335399))

(assert (=> start!53786 true))

(declare-fun array_inv!13414 (array!36687) Bool)

(assert (=> start!53786 (array_inv!13414 a!2986)))

(declare-fun b!586936 () Bool)

(declare-fun res!374751 () Bool)

(assert (=> b!586936 (=> (not res!374751) (not e!335400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36687 (_ BitVec 32)) Bool)

(assert (=> b!586936 (= res!374751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586937 () Bool)

(declare-fun res!374752 () Bool)

(assert (=> b!586937 (=> (not res!374752) (not e!335400))))

(declare-datatypes ((List!11659 0))(
  ( (Nil!11656) (Cons!11655 (h!12700 (_ BitVec 64)) (t!17887 List!11659)) )
))
(declare-fun arrayNoDuplicates!0 (array!36687 (_ BitVec 32) List!11659) Bool)

(assert (=> b!586937 (= res!374752 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11656))))

(declare-fun b!586938 () Bool)

(assert (=> b!586938 (= e!335399 e!335400)))

(declare-fun res!374754 () Bool)

(assert (=> b!586938 (=> (not res!374754) (not e!335400))))

(declare-datatypes ((SeekEntryResult!6058 0))(
  ( (MissingZero!6058 (index!26459 (_ BitVec 32))) (Found!6058 (index!26460 (_ BitVec 32))) (Intermediate!6058 (undefined!6870 Bool) (index!26461 (_ BitVec 32)) (x!55263 (_ BitVec 32))) (Undefined!6058) (MissingVacant!6058 (index!26462 (_ BitVec 32))) )
))
(declare-fun lt!266229 () SeekEntryResult!6058)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586938 (= res!374754 (or (= lt!266229 (MissingZero!6058 i!1108)) (= lt!266229 (MissingVacant!6058 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36687 (_ BitVec 32)) SeekEntryResult!6058)

(assert (=> b!586938 (= lt!266229 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586939 () Bool)

(declare-fun res!374757 () Bool)

(assert (=> b!586939 (=> (not res!374757) (not e!335399))))

(assert (=> b!586939 (= res!374757 (and (= (size!17982 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17982 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17982 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586940 () Bool)

(assert (=> b!586940 (= e!335400 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!266228 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36687 (_ BitVec 32)) SeekEntryResult!6058)

(assert (=> b!586940 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266228 vacantSpotIndex!68 (select (arr!17618 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266228 vacantSpotIndex!68 (select (store (arr!17618 a!2986) i!1108 k!1786) j!136) (array!36688 (store (arr!17618 a!2986) i!1108 k!1786) (size!17982 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18236 0))(
  ( (Unit!18237) )
))
(declare-fun lt!266230 () Unit!18236)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36687 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18236)

(assert (=> b!586940 (= lt!266230 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266228 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586940 (= lt!266228 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586941 () Bool)

(declare-fun res!374753 () Bool)

(assert (=> b!586941 (=> (not res!374753) (not e!335400))))

(assert (=> b!586941 (= res!374753 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17618 a!2986) j!136) a!2986 mask!3053) (Found!6058 j!136)))))

(declare-fun b!586942 () Bool)

(declare-fun res!374750 () Bool)

(assert (=> b!586942 (=> (not res!374750) (not e!335400))))

(assert (=> b!586942 (= res!374750 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17618 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17618 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586943 () Bool)

(declare-fun res!374755 () Bool)

(assert (=> b!586943 (=> (not res!374755) (not e!335399))))

(declare-fun arrayContainsKey!0 (array!36687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586943 (= res!374755 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53786 res!374749) b!586939))

(assert (= (and b!586939 res!374757) b!586933))

(assert (= (and b!586933 res!374759) b!586935))

(assert (= (and b!586935 res!374756) b!586943))

(assert (= (and b!586943 res!374755) b!586938))

(assert (= (and b!586938 res!374754) b!586936))

(assert (= (and b!586936 res!374751) b!586937))

(assert (= (and b!586937 res!374752) b!586942))

(assert (= (and b!586942 res!374750) b!586941))

(assert (= (and b!586941 res!374753) b!586934))

(assert (= (and b!586934 res!374758) b!586940))

(declare-fun m!565367 () Bool)

(assert (=> b!586933 m!565367))

(assert (=> b!586933 m!565367))

(declare-fun m!565369 () Bool)

(assert (=> b!586933 m!565369))

(declare-fun m!565371 () Bool)

(assert (=> b!586935 m!565371))

(declare-fun m!565373 () Bool)

(assert (=> b!586943 m!565373))

(declare-fun m!565375 () Bool)

(assert (=> b!586937 m!565375))

(declare-fun m!565377 () Bool)

(assert (=> b!586936 m!565377))

(declare-fun m!565379 () Bool)

(assert (=> b!586940 m!565379))

(declare-fun m!565381 () Bool)

(assert (=> b!586940 m!565381))

(assert (=> b!586940 m!565367))

(declare-fun m!565383 () Bool)

(assert (=> b!586940 m!565383))

(assert (=> b!586940 m!565367))

(declare-fun m!565385 () Bool)

(assert (=> b!586940 m!565385))

(declare-fun m!565387 () Bool)

(assert (=> b!586940 m!565387))

(assert (=> b!586940 m!565381))

(declare-fun m!565389 () Bool)

(assert (=> b!586940 m!565389))

(declare-fun m!565391 () Bool)

(assert (=> b!586934 m!565391))

(assert (=> b!586934 m!565367))

(declare-fun m!565393 () Bool)

(assert (=> b!586942 m!565393))

(assert (=> b!586942 m!565383))

(declare-fun m!565395 () Bool)

(assert (=> b!586942 m!565395))

(assert (=> b!586941 m!565367))

(assert (=> b!586941 m!565367))

(declare-fun m!565397 () Bool)

(assert (=> b!586941 m!565397))

(declare-fun m!565399 () Bool)

(assert (=> b!586938 m!565399))

(declare-fun m!565401 () Bool)

(assert (=> start!53786 m!565401))

(declare-fun m!565403 () Bool)

(assert (=> start!53786 m!565403))

(push 1)

