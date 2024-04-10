; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56640 () Bool)

(assert start!56640)

(declare-fun b!627712 () Bool)

(declare-fun res!405418 () Bool)

(declare-fun e!359330 () Bool)

(assert (=> b!627712 (=> (not res!405418) (not e!359330))))

(declare-datatypes ((array!37932 0))(
  ( (array!37933 (arr!18206 (Array (_ BitVec 32) (_ BitVec 64))) (size!18570 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37932)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627712 (= res!405418 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627713 () Bool)

(declare-fun res!405414 () Bool)

(assert (=> b!627713 (=> (not res!405414) (not e!359330))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627713 (= res!405414 (validKeyInArray!0 (select (arr!18206 a!2986) j!136)))))

(declare-fun b!627714 () Bool)

(declare-fun res!405412 () Bool)

(assert (=> b!627714 (=> (not res!405412) (not e!359330))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627714 (= res!405412 (and (= (size!18570 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18570 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18570 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627715 () Bool)

(declare-fun res!405413 () Bool)

(declare-fun e!359331 () Bool)

(assert (=> b!627715 (=> (not res!405413) (not e!359331))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6646 0))(
  ( (MissingZero!6646 (index!28868 (_ BitVec 32))) (Found!6646 (index!28869 (_ BitVec 32))) (Intermediate!6646 (undefined!7458 Bool) (index!28870 (_ BitVec 32)) (x!57602 (_ BitVec 32))) (Undefined!6646) (MissingVacant!6646 (index!28871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37932 (_ BitVec 32)) SeekEntryResult!6646)

(assert (=> b!627715 (= res!405413 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18206 a!2986) j!136) a!2986 mask!3053) (Found!6646 j!136)))))

(declare-fun b!627716 () Bool)

(declare-fun res!405415 () Bool)

(assert (=> b!627716 (=> (not res!405415) (not e!359331))))

(assert (=> b!627716 (= res!405415 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18206 a!2986) index!984) (select (arr!18206 a!2986) j!136))) (not (= (select (arr!18206 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!405416 () Bool)

(assert (=> start!56640 (=> (not res!405416) (not e!359330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56640 (= res!405416 (validMask!0 mask!3053))))

(assert (=> start!56640 e!359330))

(assert (=> start!56640 true))

(declare-fun array_inv!14002 (array!37932) Bool)

(assert (=> start!56640 (array_inv!14002 a!2986)))

(declare-fun b!627717 () Bool)

(assert (=> b!627717 (= e!359330 e!359331)))

(declare-fun res!405422 () Bool)

(assert (=> b!627717 (=> (not res!405422) (not e!359331))))

(declare-fun lt!290329 () SeekEntryResult!6646)

(assert (=> b!627717 (= res!405422 (or (= lt!290329 (MissingZero!6646 i!1108)) (= lt!290329 (MissingVacant!6646 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37932 (_ BitVec 32)) SeekEntryResult!6646)

(assert (=> b!627717 (= lt!290329 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627718 () Bool)

(declare-fun res!405417 () Bool)

(assert (=> b!627718 (=> (not res!405417) (not e!359331))))

(declare-datatypes ((List!12247 0))(
  ( (Nil!12244) (Cons!12243 (h!13288 (_ BitVec 64)) (t!18475 List!12247)) )
))
(declare-fun arrayNoDuplicates!0 (array!37932 (_ BitVec 32) List!12247) Bool)

(assert (=> b!627718 (= res!405417 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12244))))

(declare-fun b!627719 () Bool)

(assert (=> b!627719 (= e!359331 false)))

(declare-fun lt!290328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627719 (= lt!290328 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627720 () Bool)

(declare-fun res!405421 () Bool)

(assert (=> b!627720 (=> (not res!405421) (not e!359331))))

(assert (=> b!627720 (= res!405421 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18206 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18206 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627721 () Bool)

(declare-fun res!405420 () Bool)

(assert (=> b!627721 (=> (not res!405420) (not e!359331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37932 (_ BitVec 32)) Bool)

(assert (=> b!627721 (= res!405420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627722 () Bool)

(declare-fun res!405419 () Bool)

(assert (=> b!627722 (=> (not res!405419) (not e!359330))))

(assert (=> b!627722 (= res!405419 (validKeyInArray!0 k!1786))))

(assert (= (and start!56640 res!405416) b!627714))

(assert (= (and b!627714 res!405412) b!627713))

(assert (= (and b!627713 res!405414) b!627722))

(assert (= (and b!627722 res!405419) b!627712))

(assert (= (and b!627712 res!405418) b!627717))

(assert (= (and b!627717 res!405422) b!627721))

(assert (= (and b!627721 res!405420) b!627718))

(assert (= (and b!627718 res!405417) b!627720))

(assert (= (and b!627720 res!405421) b!627715))

(assert (= (and b!627715 res!405413) b!627716))

(assert (= (and b!627716 res!405415) b!627719))

(declare-fun m!602997 () Bool)

(assert (=> b!627712 m!602997))

(declare-fun m!602999 () Bool)

(assert (=> b!627721 m!602999))

(declare-fun m!603001 () Bool)

(assert (=> b!627713 m!603001))

(assert (=> b!627713 m!603001))

(declare-fun m!603003 () Bool)

(assert (=> b!627713 m!603003))

(declare-fun m!603005 () Bool)

(assert (=> b!627720 m!603005))

(declare-fun m!603007 () Bool)

(assert (=> b!627720 m!603007))

(declare-fun m!603009 () Bool)

(assert (=> b!627720 m!603009))

(declare-fun m!603011 () Bool)

(assert (=> b!627718 m!603011))

(declare-fun m!603013 () Bool)

(assert (=> b!627722 m!603013))

(declare-fun m!603015 () Bool)

(assert (=> b!627719 m!603015))

(declare-fun m!603017 () Bool)

(assert (=> b!627716 m!603017))

(assert (=> b!627716 m!603001))

(declare-fun m!603019 () Bool)

(assert (=> b!627717 m!603019))

(assert (=> b!627715 m!603001))

(assert (=> b!627715 m!603001))

(declare-fun m!603021 () Bool)

(assert (=> b!627715 m!603021))

(declare-fun m!603023 () Bool)

(assert (=> start!56640 m!603023))

(declare-fun m!603025 () Bool)

(assert (=> start!56640 m!603025))

(push 1)

(assert (not b!627717))

(assert (not b!627722))

(assert (not b!627721))

