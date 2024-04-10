; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56390 () Bool)

(assert start!56390)

(declare-fun res!403004 () Bool)

(declare-fun e!358339 () Bool)

(assert (=> start!56390 (=> (not res!403004) (not e!358339))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56390 (= res!403004 (validMask!0 mask!3053))))

(assert (=> start!56390 e!358339))

(assert (=> start!56390 true))

(declare-datatypes ((array!37770 0))(
  ( (array!37771 (arr!18128 (Array (_ BitVec 32) (_ BitVec 64))) (size!18492 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37770)

(declare-fun array_inv!13924 (array!37770) Bool)

(assert (=> start!56390 (array_inv!13924 a!2986)))

(declare-fun b!624996 () Bool)

(declare-fun res!403008 () Bool)

(assert (=> b!624996 (=> (not res!403008) (not e!358339))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624996 (= res!403008 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624997 () Bool)

(declare-fun res!403002 () Bool)

(assert (=> b!624997 (=> (not res!403002) (not e!358339))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624997 (= res!403002 (validKeyInArray!0 (select (arr!18128 a!2986) j!136)))))

(declare-fun b!624998 () Bool)

(declare-fun res!403010 () Bool)

(declare-fun e!358341 () Bool)

(assert (=> b!624998 (=> (not res!403010) (not e!358341))))

(declare-datatypes ((List!12169 0))(
  ( (Nil!12166) (Cons!12165 (h!13210 (_ BitVec 64)) (t!18397 List!12169)) )
))
(declare-fun arrayNoDuplicates!0 (array!37770 (_ BitVec 32) List!12169) Bool)

(assert (=> b!624998 (= res!403010 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12166))))

(declare-fun b!624999 () Bool)

(assert (=> b!624999 (= e!358339 e!358341)))

(declare-fun res!403005 () Bool)

(assert (=> b!624999 (=> (not res!403005) (not e!358341))))

(declare-datatypes ((SeekEntryResult!6568 0))(
  ( (MissingZero!6568 (index!28556 (_ BitVec 32))) (Found!6568 (index!28557 (_ BitVec 32))) (Intermediate!6568 (undefined!7380 Bool) (index!28558 (_ BitVec 32)) (x!57310 (_ BitVec 32))) (Undefined!6568) (MissingVacant!6568 (index!28559 (_ BitVec 32))) )
))
(declare-fun lt!289738 () SeekEntryResult!6568)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624999 (= res!403005 (or (= lt!289738 (MissingZero!6568 i!1108)) (= lt!289738 (MissingVacant!6568 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37770 (_ BitVec 32)) SeekEntryResult!6568)

(assert (=> b!624999 (= lt!289738 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625000 () Bool)

(declare-fun res!403003 () Bool)

(assert (=> b!625000 (=> (not res!403003) (not e!358339))))

(assert (=> b!625000 (= res!403003 (validKeyInArray!0 k!1786))))

(declare-fun b!625001 () Bool)

(declare-fun res!403009 () Bool)

(assert (=> b!625001 (=> (not res!403009) (not e!358341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37770 (_ BitVec 32)) Bool)

(assert (=> b!625001 (= res!403009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625002 () Bool)

(declare-fun res!403007 () Bool)

(assert (=> b!625002 (=> (not res!403007) (not e!358339))))

(assert (=> b!625002 (= res!403007 (and (= (size!18492 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18492 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18492 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625003 () Bool)

(assert (=> b!625003 (= e!358341 false)))

(declare-fun lt!289737 () SeekEntryResult!6568)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37770 (_ BitVec 32)) SeekEntryResult!6568)

(assert (=> b!625003 (= lt!289737 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18128 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625004 () Bool)

(declare-fun res!403006 () Bool)

(assert (=> b!625004 (=> (not res!403006) (not e!358341))))

(assert (=> b!625004 (= res!403006 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18128 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18128 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56390 res!403004) b!625002))

(assert (= (and b!625002 res!403007) b!624997))

(assert (= (and b!624997 res!403002) b!625000))

(assert (= (and b!625000 res!403003) b!624996))

(assert (= (and b!624996 res!403008) b!624999))

(assert (= (and b!624999 res!403005) b!625001))

(assert (= (and b!625001 res!403009) b!624998))

(assert (= (and b!624998 res!403010) b!625004))

(assert (= (and b!625004 res!403006) b!625003))

(declare-fun m!600591 () Bool)

(assert (=> b!625004 m!600591))

(declare-fun m!600593 () Bool)

(assert (=> b!625004 m!600593))

(declare-fun m!600595 () Bool)

(assert (=> b!625004 m!600595))

(declare-fun m!600597 () Bool)

(assert (=> b!624998 m!600597))

(declare-fun m!600599 () Bool)

(assert (=> b!625003 m!600599))

(assert (=> b!625003 m!600599))

(declare-fun m!600601 () Bool)

(assert (=> b!625003 m!600601))

(declare-fun m!600603 () Bool)

(assert (=> b!624999 m!600603))

(assert (=> b!624997 m!600599))

(assert (=> b!624997 m!600599))

(declare-fun m!600605 () Bool)

(assert (=> b!624997 m!600605))

(declare-fun m!600607 () Bool)

(assert (=> b!625000 m!600607))

(declare-fun m!600609 () Bool)

(assert (=> b!625001 m!600609))

(declare-fun m!600611 () Bool)

(assert (=> start!56390 m!600611))

(declare-fun m!600613 () Bool)

(assert (=> start!56390 m!600613))

(declare-fun m!600615 () Bool)

(assert (=> b!624996 m!600615))

(push 1)

(assert (not b!624998))

(assert (not b!625003))

