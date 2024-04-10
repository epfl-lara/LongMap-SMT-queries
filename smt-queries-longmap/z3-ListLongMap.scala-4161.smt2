; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56656 () Bool)

(assert start!56656)

(declare-fun b!627976 () Bool)

(declare-fun e!359403 () Bool)

(declare-fun e!359401 () Bool)

(assert (=> b!627976 (= e!359403 e!359401)))

(declare-fun res!405681 () Bool)

(assert (=> b!627976 (=> (not res!405681) (not e!359401))))

(declare-datatypes ((SeekEntryResult!6654 0))(
  ( (MissingZero!6654 (index!28900 (_ BitVec 32))) (Found!6654 (index!28901 (_ BitVec 32))) (Intermediate!6654 (undefined!7466 Bool) (index!28902 (_ BitVec 32)) (x!57634 (_ BitVec 32))) (Undefined!6654) (MissingVacant!6654 (index!28903 (_ BitVec 32))) )
))
(declare-fun lt!290376 () SeekEntryResult!6654)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627976 (= res!405681 (or (= lt!290376 (MissingZero!6654 i!1108)) (= lt!290376 (MissingVacant!6654 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37948 0))(
  ( (array!37949 (arr!18214 (Array (_ BitVec 32) (_ BitVec 64))) (size!18578 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37948)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37948 (_ BitVec 32)) SeekEntryResult!6654)

(assert (=> b!627976 (= lt!290376 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627978 () Bool)

(declare-fun res!405686 () Bool)

(assert (=> b!627978 (=> (not res!405686) (not e!359401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37948 (_ BitVec 32)) Bool)

(assert (=> b!627978 (= res!405686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627979 () Bool)

(declare-fun res!405684 () Bool)

(assert (=> b!627979 (=> (not res!405684) (not e!359401))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627979 (= res!405684 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18214 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18214 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627980 () Bool)

(declare-fun res!405676 () Bool)

(assert (=> b!627980 (=> (not res!405676) (not e!359403))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627980 (= res!405676 (and (= (size!18578 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18578 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18578 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627981 () Bool)

(declare-fun res!405685 () Bool)

(assert (=> b!627981 (=> (not res!405685) (not e!359403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627981 (= res!405685 (validKeyInArray!0 k0!1786))))

(declare-fun res!405677 () Bool)

(assert (=> start!56656 (=> (not res!405677) (not e!359403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56656 (= res!405677 (validMask!0 mask!3053))))

(assert (=> start!56656 e!359403))

(assert (=> start!56656 true))

(declare-fun array_inv!14010 (array!37948) Bool)

(assert (=> start!56656 (array_inv!14010 a!2986)))

(declare-fun b!627977 () Bool)

(declare-fun res!405683 () Bool)

(assert (=> b!627977 (=> (not res!405683) (not e!359401))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37948 (_ BitVec 32)) SeekEntryResult!6654)

(assert (=> b!627977 (= res!405683 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18214 a!2986) j!136) a!2986 mask!3053) (Found!6654 j!136)))))

(declare-fun b!627982 () Bool)

(declare-fun res!405678 () Bool)

(assert (=> b!627982 (=> (not res!405678) (not e!359403))))

(assert (=> b!627982 (= res!405678 (validKeyInArray!0 (select (arr!18214 a!2986) j!136)))))

(declare-fun b!627983 () Bool)

(declare-fun res!405680 () Bool)

(assert (=> b!627983 (=> (not res!405680) (not e!359403))))

(declare-fun arrayContainsKey!0 (array!37948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627983 (= res!405680 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627984 () Bool)

(declare-fun res!405679 () Bool)

(assert (=> b!627984 (=> (not res!405679) (not e!359401))))

(declare-datatypes ((List!12255 0))(
  ( (Nil!12252) (Cons!12251 (h!13296 (_ BitVec 64)) (t!18483 List!12255)) )
))
(declare-fun arrayNoDuplicates!0 (array!37948 (_ BitVec 32) List!12255) Bool)

(assert (=> b!627984 (= res!405679 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12252))))

(declare-fun b!627985 () Bool)

(assert (=> b!627985 (= e!359401 false)))

(declare-fun lt!290377 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627985 (= lt!290377 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627986 () Bool)

(declare-fun res!405682 () Bool)

(assert (=> b!627986 (=> (not res!405682) (not e!359401))))

(assert (=> b!627986 (= res!405682 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18214 a!2986) index!984) (select (arr!18214 a!2986) j!136))) (not (= (select (arr!18214 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56656 res!405677) b!627980))

(assert (= (and b!627980 res!405676) b!627982))

(assert (= (and b!627982 res!405678) b!627981))

(assert (= (and b!627981 res!405685) b!627983))

(assert (= (and b!627983 res!405680) b!627976))

(assert (= (and b!627976 res!405681) b!627978))

(assert (= (and b!627978 res!405686) b!627984))

(assert (= (and b!627984 res!405679) b!627979))

(assert (= (and b!627979 res!405684) b!627977))

(assert (= (and b!627977 res!405683) b!627986))

(assert (= (and b!627986 res!405682) b!627985))

(declare-fun m!603237 () Bool)

(assert (=> b!627978 m!603237))

(declare-fun m!603239 () Bool)

(assert (=> b!627981 m!603239))

(declare-fun m!603241 () Bool)

(assert (=> b!627986 m!603241))

(declare-fun m!603243 () Bool)

(assert (=> b!627986 m!603243))

(assert (=> b!627977 m!603243))

(assert (=> b!627977 m!603243))

(declare-fun m!603245 () Bool)

(assert (=> b!627977 m!603245))

(declare-fun m!603247 () Bool)

(assert (=> b!627983 m!603247))

(assert (=> b!627982 m!603243))

(assert (=> b!627982 m!603243))

(declare-fun m!603249 () Bool)

(assert (=> b!627982 m!603249))

(declare-fun m!603251 () Bool)

(assert (=> b!627985 m!603251))

(declare-fun m!603253 () Bool)

(assert (=> start!56656 m!603253))

(declare-fun m!603255 () Bool)

(assert (=> start!56656 m!603255))

(declare-fun m!603257 () Bool)

(assert (=> b!627976 m!603257))

(declare-fun m!603259 () Bool)

(assert (=> b!627984 m!603259))

(declare-fun m!603261 () Bool)

(assert (=> b!627979 m!603261))

(declare-fun m!603263 () Bool)

(assert (=> b!627979 m!603263))

(declare-fun m!603265 () Bool)

(assert (=> b!627979 m!603265))

(check-sat (not start!56656) (not b!627982) (not b!627985) (not b!627981) (not b!627984) (not b!627977) (not b!627983) (not b!627978) (not b!627976))
