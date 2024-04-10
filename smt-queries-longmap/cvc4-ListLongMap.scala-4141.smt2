; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56444 () Bool)

(assert start!56444)

(declare-fun b!625734 () Bool)

(declare-fun res!403740 () Bool)

(declare-fun e!358582 () Bool)

(assert (=> b!625734 (=> (not res!403740) (not e!358582))))

(declare-datatypes ((array!37824 0))(
  ( (array!37825 (arr!18155 (Array (_ BitVec 32) (_ BitVec 64))) (size!18519 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37824)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625734 (= res!403740 (validKeyInArray!0 (select (arr!18155 a!2986) j!136)))))

(declare-fun b!625735 () Bool)

(declare-fun res!403748 () Bool)

(declare-fun e!358583 () Bool)

(assert (=> b!625735 (=> (not res!403748) (not e!358583))))

(declare-datatypes ((List!12196 0))(
  ( (Nil!12193) (Cons!12192 (h!13237 (_ BitVec 64)) (t!18424 List!12196)) )
))
(declare-fun arrayNoDuplicates!0 (array!37824 (_ BitVec 32) List!12196) Bool)

(assert (=> b!625735 (= res!403748 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12193))))

(declare-fun b!625736 () Bool)

(declare-fun res!403743 () Bool)

(assert (=> b!625736 (=> (not res!403743) (not e!358582))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625736 (= res!403743 (and (= (size!18519 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18519 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18519 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625737 () Bool)

(declare-fun res!403744 () Bool)

(assert (=> b!625737 (=> (not res!403744) (not e!358582))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!625737 (= res!403744 (validKeyInArray!0 k!1786))))

(declare-fun b!625738 () Bool)

(declare-fun res!403741 () Bool)

(assert (=> b!625738 (=> (not res!403741) (not e!358582))))

(declare-fun arrayContainsKey!0 (array!37824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625738 (= res!403741 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625739 () Bool)

(assert (=> b!625739 (= e!358582 e!358583)))

(declare-fun res!403742 () Bool)

(assert (=> b!625739 (=> (not res!403742) (not e!358583))))

(declare-datatypes ((SeekEntryResult!6595 0))(
  ( (MissingZero!6595 (index!28664 (_ BitVec 32))) (Found!6595 (index!28665 (_ BitVec 32))) (Intermediate!6595 (undefined!7407 Bool) (index!28666 (_ BitVec 32)) (x!57409 (_ BitVec 32))) (Undefined!6595) (MissingVacant!6595 (index!28667 (_ BitVec 32))) )
))
(declare-fun lt!289890 () SeekEntryResult!6595)

(assert (=> b!625739 (= res!403742 (or (= lt!289890 (MissingZero!6595 i!1108)) (= lt!289890 (MissingVacant!6595 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37824 (_ BitVec 32)) SeekEntryResult!6595)

(assert (=> b!625739 (= lt!289890 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!403745 () Bool)

(assert (=> start!56444 (=> (not res!403745) (not e!358582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56444 (= res!403745 (validMask!0 mask!3053))))

(assert (=> start!56444 e!358582))

(assert (=> start!56444 true))

(declare-fun array_inv!13951 (array!37824) Bool)

(assert (=> start!56444 (array_inv!13951 a!2986)))

(declare-fun b!625740 () Bool)

(declare-fun res!403746 () Bool)

(assert (=> b!625740 (=> (not res!403746) (not e!358583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37824 (_ BitVec 32)) Bool)

(assert (=> b!625740 (= res!403746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625741 () Bool)

(declare-fun res!403747 () Bool)

(assert (=> b!625741 (=> (not res!403747) (not e!358583))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625741 (= res!403747 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18155 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18155 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625742 () Bool)

(assert (=> b!625742 (= e!358583 false)))

(declare-fun lt!289891 () SeekEntryResult!6595)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37824 (_ BitVec 32)) SeekEntryResult!6595)

(assert (=> b!625742 (= lt!289891 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18155 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56444 res!403745) b!625736))

(assert (= (and b!625736 res!403743) b!625734))

(assert (= (and b!625734 res!403740) b!625737))

(assert (= (and b!625737 res!403744) b!625738))

(assert (= (and b!625738 res!403741) b!625739))

(assert (= (and b!625739 res!403742) b!625740))

(assert (= (and b!625740 res!403746) b!625735))

(assert (= (and b!625735 res!403748) b!625741))

(assert (= (and b!625741 res!403747) b!625742))

(declare-fun m!601293 () Bool)

(assert (=> b!625741 m!601293))

(declare-fun m!601295 () Bool)

(assert (=> b!625741 m!601295))

(declare-fun m!601297 () Bool)

(assert (=> b!625741 m!601297))

(declare-fun m!601299 () Bool)

(assert (=> b!625735 m!601299))

(declare-fun m!601301 () Bool)

(assert (=> b!625738 m!601301))

(declare-fun m!601303 () Bool)

(assert (=> b!625742 m!601303))

(assert (=> b!625742 m!601303))

(declare-fun m!601305 () Bool)

(assert (=> b!625742 m!601305))

(declare-fun m!601307 () Bool)

(assert (=> b!625740 m!601307))

(declare-fun m!601309 () Bool)

(assert (=> b!625737 m!601309))

(declare-fun m!601311 () Bool)

(assert (=> b!625739 m!601311))

(declare-fun m!601313 () Bool)

(assert (=> start!56444 m!601313))

(declare-fun m!601315 () Bool)

(assert (=> start!56444 m!601315))

(assert (=> b!625734 m!601303))

(assert (=> b!625734 m!601303))

(declare-fun m!601317 () Bool)

(assert (=> b!625734 m!601317))

(push 1)

(assert (not b!625740))

(assert (not b!625734))

(assert (not b!625742))

(assert (not b!625738))

(assert (not b!625739))

(assert (not b!625737))

(assert (not start!56444))

(assert (not b!625735))

