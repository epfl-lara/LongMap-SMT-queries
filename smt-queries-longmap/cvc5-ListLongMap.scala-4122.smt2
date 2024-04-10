; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56278 () Bool)

(assert start!56278)

(declare-fun b!623855 () Bool)

(declare-fun res!402042 () Bool)

(declare-fun e!357827 () Bool)

(assert (=> b!623855 (=> (not res!402042) (not e!357827))))

(declare-datatypes ((array!37703 0))(
  ( (array!37704 (arr!18096 (Array (_ BitVec 32) (_ BitVec 64))) (size!18460 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37703)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37703 (_ BitVec 32)) Bool)

(assert (=> b!623855 (= res!402042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623856 () Bool)

(declare-fun res!402045 () Bool)

(assert (=> b!623856 (=> (not res!402045) (not e!357827))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623856 (= res!402045 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18096 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18096 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!623857 () Bool)

(assert (=> b!623857 (= e!357827 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18096 a!2986) index!984) (select (arr!18096 a!2986) j!136))) (not (= (select (arr!18096 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (= index!984 j!136)))))

(declare-fun b!623858 () Bool)

(declare-fun res!402041 () Bool)

(declare-fun e!357826 () Bool)

(assert (=> b!623858 (=> (not res!402041) (not e!357826))))

(declare-fun arrayContainsKey!0 (array!37703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623858 (= res!402041 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623859 () Bool)

(assert (=> b!623859 (= e!357826 e!357827)))

(declare-fun res!402046 () Bool)

(assert (=> b!623859 (=> (not res!402046) (not e!357827))))

(declare-datatypes ((SeekEntryResult!6536 0))(
  ( (MissingZero!6536 (index!28428 (_ BitVec 32))) (Found!6536 (index!28429 (_ BitVec 32))) (Intermediate!6536 (undefined!7348 Bool) (index!28430 (_ BitVec 32)) (x!57195 (_ BitVec 32))) (Undefined!6536) (MissingVacant!6536 (index!28431 (_ BitVec 32))) )
))
(declare-fun lt!289381 () SeekEntryResult!6536)

(assert (=> b!623859 (= res!402046 (or (= lt!289381 (MissingZero!6536 i!1108)) (= lt!289381 (MissingVacant!6536 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37703 (_ BitVec 32)) SeekEntryResult!6536)

(assert (=> b!623859 (= lt!289381 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623860 () Bool)

(declare-fun res!402044 () Bool)

(assert (=> b!623860 (=> (not res!402044) (not e!357826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623860 (= res!402044 (validKeyInArray!0 (select (arr!18096 a!2986) j!136)))))

(declare-fun res!402050 () Bool)

(assert (=> start!56278 (=> (not res!402050) (not e!357826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56278 (= res!402050 (validMask!0 mask!3053))))

(assert (=> start!56278 e!357826))

(assert (=> start!56278 true))

(declare-fun array_inv!13892 (array!37703) Bool)

(assert (=> start!56278 (array_inv!13892 a!2986)))

(declare-fun b!623861 () Bool)

(declare-fun res!402049 () Bool)

(assert (=> b!623861 (=> (not res!402049) (not e!357826))))

(assert (=> b!623861 (= res!402049 (validKeyInArray!0 k!1786))))

(declare-fun b!623862 () Bool)

(declare-fun res!402048 () Bool)

(assert (=> b!623862 (=> (not res!402048) (not e!357827))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37703 (_ BitVec 32)) SeekEntryResult!6536)

(assert (=> b!623862 (= res!402048 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18096 a!2986) j!136) a!2986 mask!3053) (Found!6536 j!136)))))

(declare-fun b!623863 () Bool)

(declare-fun res!402043 () Bool)

(assert (=> b!623863 (=> (not res!402043) (not e!357827))))

(declare-datatypes ((List!12137 0))(
  ( (Nil!12134) (Cons!12133 (h!13178 (_ BitVec 64)) (t!18365 List!12137)) )
))
(declare-fun arrayNoDuplicates!0 (array!37703 (_ BitVec 32) List!12137) Bool)

(assert (=> b!623863 (= res!402043 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12134))))

(declare-fun b!623864 () Bool)

(declare-fun res!402047 () Bool)

(assert (=> b!623864 (=> (not res!402047) (not e!357826))))

(assert (=> b!623864 (= res!402047 (and (= (size!18460 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18460 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18460 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56278 res!402050) b!623864))

(assert (= (and b!623864 res!402047) b!623860))

(assert (= (and b!623860 res!402044) b!623861))

(assert (= (and b!623861 res!402049) b!623858))

(assert (= (and b!623858 res!402041) b!623859))

(assert (= (and b!623859 res!402046) b!623855))

(assert (= (and b!623855 res!402042) b!623863))

(assert (= (and b!623863 res!402043) b!623856))

(assert (= (and b!623856 res!402045) b!623862))

(assert (= (and b!623862 res!402048) b!623857))

(declare-fun m!599621 () Bool)

(assert (=> b!623855 m!599621))

(declare-fun m!599623 () Bool)

(assert (=> b!623856 m!599623))

(declare-fun m!599625 () Bool)

(assert (=> b!623856 m!599625))

(declare-fun m!599627 () Bool)

(assert (=> b!623856 m!599627))

(declare-fun m!599629 () Bool)

(assert (=> b!623862 m!599629))

(assert (=> b!623862 m!599629))

(declare-fun m!599631 () Bool)

(assert (=> b!623862 m!599631))

(declare-fun m!599633 () Bool)

(assert (=> b!623859 m!599633))

(declare-fun m!599635 () Bool)

(assert (=> b!623857 m!599635))

(assert (=> b!623857 m!599629))

(assert (=> b!623860 m!599629))

(assert (=> b!623860 m!599629))

(declare-fun m!599637 () Bool)

(assert (=> b!623860 m!599637))

(declare-fun m!599639 () Bool)

(assert (=> b!623863 m!599639))

(declare-fun m!599641 () Bool)

(assert (=> start!56278 m!599641))

(declare-fun m!599643 () Bool)

(assert (=> start!56278 m!599643))

(declare-fun m!599645 () Bool)

(assert (=> b!623861 m!599645))

(declare-fun m!599647 () Bool)

(assert (=> b!623858 m!599647))

(push 1)

