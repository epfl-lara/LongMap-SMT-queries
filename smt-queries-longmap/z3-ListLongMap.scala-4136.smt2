; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56394 () Bool)

(assert start!56394)

(declare-fun b!624995 () Bool)

(declare-fun res!403149 () Bool)

(declare-fun e!358256 () Bool)

(assert (=> b!624995 (=> (not res!403149) (not e!358256))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37788 0))(
  ( (array!37789 (arr!18137 (Array (_ BitVec 32) (_ BitVec 64))) (size!18502 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37788)

(assert (=> b!624995 (= res!403149 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18137 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18137 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403145 () Bool)

(declare-fun e!358257 () Bool)

(assert (=> start!56394 (=> (not res!403145) (not e!358257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56394 (= res!403145 (validMask!0 mask!3053))))

(assert (=> start!56394 e!358257))

(assert (=> start!56394 true))

(declare-fun array_inv!14020 (array!37788) Bool)

(assert (=> start!56394 (array_inv!14020 a!2986)))

(declare-fun b!624996 () Bool)

(declare-fun res!403147 () Bool)

(assert (=> b!624996 (=> (not res!403147) (not e!358257))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624996 (= res!403147 (and (= (size!18502 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18502 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18502 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624997 () Bool)

(declare-fun res!403148 () Bool)

(assert (=> b!624997 (=> (not res!403148) (not e!358256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37788 (_ BitVec 32)) Bool)

(assert (=> b!624997 (= res!403148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624998 () Bool)

(declare-fun res!403144 () Bool)

(assert (=> b!624998 (=> (not res!403144) (not e!358256))))

(declare-datatypes ((List!12217 0))(
  ( (Nil!12214) (Cons!12213 (h!13258 (_ BitVec 64)) (t!18436 List!12217)) )
))
(declare-fun arrayNoDuplicates!0 (array!37788 (_ BitVec 32) List!12217) Bool)

(assert (=> b!624998 (= res!403144 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12214))))

(declare-fun b!624999 () Bool)

(declare-fun res!403150 () Bool)

(assert (=> b!624999 (=> (not res!403150) (not e!358257))))

(declare-fun arrayContainsKey!0 (array!37788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624999 (= res!403150 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625000 () Bool)

(declare-fun res!403143 () Bool)

(assert (=> b!625000 (=> (not res!403143) (not e!358257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625000 (= res!403143 (validKeyInArray!0 (select (arr!18137 a!2986) j!136)))))

(declare-fun b!625001 () Bool)

(declare-fun res!403146 () Bool)

(assert (=> b!625001 (=> (not res!403146) (not e!358257))))

(assert (=> b!625001 (= res!403146 (validKeyInArray!0 k0!1786))))

(declare-fun b!625002 () Bool)

(assert (=> b!625002 (= e!358256 false)))

(declare-datatypes ((SeekEntryResult!6574 0))(
  ( (MissingZero!6574 (index!28580 (_ BitVec 32))) (Found!6574 (index!28581 (_ BitVec 32))) (Intermediate!6574 (undefined!7386 Bool) (index!28582 (_ BitVec 32)) (x!57343 (_ BitVec 32))) (Undefined!6574) (MissingVacant!6574 (index!28583 (_ BitVec 32))) )
))
(declare-fun lt!289564 () SeekEntryResult!6574)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37788 (_ BitVec 32)) SeekEntryResult!6574)

(assert (=> b!625002 (= lt!289564 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18137 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625003 () Bool)

(assert (=> b!625003 (= e!358257 e!358256)))

(declare-fun res!403151 () Bool)

(assert (=> b!625003 (=> (not res!403151) (not e!358256))))

(declare-fun lt!289563 () SeekEntryResult!6574)

(assert (=> b!625003 (= res!403151 (or (= lt!289563 (MissingZero!6574 i!1108)) (= lt!289563 (MissingVacant!6574 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37788 (_ BitVec 32)) SeekEntryResult!6574)

(assert (=> b!625003 (= lt!289563 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56394 res!403145) b!624996))

(assert (= (and b!624996 res!403147) b!625000))

(assert (= (and b!625000 res!403143) b!625001))

(assert (= (and b!625001 res!403146) b!624999))

(assert (= (and b!624999 res!403150) b!625003))

(assert (= (and b!625003 res!403151) b!624997))

(assert (= (and b!624997 res!403148) b!624998))

(assert (= (and b!624998 res!403144) b!624995))

(assert (= (and b!624995 res!403149) b!625002))

(declare-fun m!600079 () Bool)

(assert (=> b!624997 m!600079))

(declare-fun m!600081 () Bool)

(assert (=> b!625000 m!600081))

(assert (=> b!625000 m!600081))

(declare-fun m!600083 () Bool)

(assert (=> b!625000 m!600083))

(declare-fun m!600085 () Bool)

(assert (=> b!625003 m!600085))

(declare-fun m!600087 () Bool)

(assert (=> b!624999 m!600087))

(declare-fun m!600089 () Bool)

(assert (=> b!625001 m!600089))

(declare-fun m!600091 () Bool)

(assert (=> b!624995 m!600091))

(declare-fun m!600093 () Bool)

(assert (=> b!624995 m!600093))

(declare-fun m!600095 () Bool)

(assert (=> b!624995 m!600095))

(declare-fun m!600097 () Bool)

(assert (=> start!56394 m!600097))

(declare-fun m!600099 () Bool)

(assert (=> start!56394 m!600099))

(assert (=> b!625002 m!600081))

(assert (=> b!625002 m!600081))

(declare-fun m!600101 () Bool)

(assert (=> b!625002 m!600101))

(declare-fun m!600103 () Bool)

(assert (=> b!624998 m!600103))

(check-sat (not b!624997) (not b!625002) (not b!625003) (not b!624998) (not start!56394) (not b!625000) (not b!624999) (not b!625001))
(check-sat)
