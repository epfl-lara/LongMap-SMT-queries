; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56654 () Bool)

(assert start!56654)

(declare-fun b!627943 () Bool)

(declare-fun res!405649 () Bool)

(declare-fun e!359392 () Bool)

(assert (=> b!627943 (=> (not res!405649) (not e!359392))))

(declare-datatypes ((array!37946 0))(
  ( (array!37947 (arr!18213 (Array (_ BitVec 32) (_ BitVec 64))) (size!18577 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37946)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627943 (= res!405649 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627944 () Bool)

(declare-fun e!359393 () Bool)

(assert (=> b!627944 (= e!359393 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!290371 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627944 (= lt!290371 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627945 () Bool)

(declare-fun res!405650 () Bool)

(assert (=> b!627945 (=> (not res!405650) (not e!359392))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627945 (= res!405650 (validKeyInArray!0 (select (arr!18213 a!2986) j!136)))))

(declare-fun b!627946 () Bool)

(declare-fun res!405653 () Bool)

(assert (=> b!627946 (=> (not res!405653) (not e!359393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37946 (_ BitVec 32)) Bool)

(assert (=> b!627946 (= res!405653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627948 () Bool)

(declare-fun res!405644 () Bool)

(assert (=> b!627948 (=> (not res!405644) (not e!359392))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627948 (= res!405644 (and (= (size!18577 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18577 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18577 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627949 () Bool)

(assert (=> b!627949 (= e!359392 e!359393)))

(declare-fun res!405645 () Bool)

(assert (=> b!627949 (=> (not res!405645) (not e!359393))))

(declare-datatypes ((SeekEntryResult!6653 0))(
  ( (MissingZero!6653 (index!28896 (_ BitVec 32))) (Found!6653 (index!28897 (_ BitVec 32))) (Intermediate!6653 (undefined!7465 Bool) (index!28898 (_ BitVec 32)) (x!57633 (_ BitVec 32))) (Undefined!6653) (MissingVacant!6653 (index!28899 (_ BitVec 32))) )
))
(declare-fun lt!290370 () SeekEntryResult!6653)

(assert (=> b!627949 (= res!405645 (or (= lt!290370 (MissingZero!6653 i!1108)) (= lt!290370 (MissingVacant!6653 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37946 (_ BitVec 32)) SeekEntryResult!6653)

(assert (=> b!627949 (= lt!290370 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627950 () Bool)

(declare-fun res!405646 () Bool)

(assert (=> b!627950 (=> (not res!405646) (not e!359393))))

(declare-datatypes ((List!12254 0))(
  ( (Nil!12251) (Cons!12250 (h!13295 (_ BitVec 64)) (t!18482 List!12254)) )
))
(declare-fun arrayNoDuplicates!0 (array!37946 (_ BitVec 32) List!12254) Bool)

(assert (=> b!627950 (= res!405646 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12251))))

(declare-fun b!627951 () Bool)

(declare-fun res!405652 () Bool)

(assert (=> b!627951 (=> (not res!405652) (not e!359393))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627951 (= res!405652 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18213 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18213 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627952 () Bool)

(declare-fun res!405647 () Bool)

(assert (=> b!627952 (=> (not res!405647) (not e!359393))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37946 (_ BitVec 32)) SeekEntryResult!6653)

(assert (=> b!627952 (= res!405647 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18213 a!2986) j!136) a!2986 mask!3053) (Found!6653 j!136)))))

(declare-fun b!627953 () Bool)

(declare-fun res!405651 () Bool)

(assert (=> b!627953 (=> (not res!405651) (not e!359392))))

(assert (=> b!627953 (= res!405651 (validKeyInArray!0 k!1786))))

(declare-fun b!627947 () Bool)

(declare-fun res!405648 () Bool)

(assert (=> b!627947 (=> (not res!405648) (not e!359393))))

(assert (=> b!627947 (= res!405648 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18213 a!2986) index!984) (select (arr!18213 a!2986) j!136))) (not (= (select (arr!18213 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!405643 () Bool)

(assert (=> start!56654 (=> (not res!405643) (not e!359392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56654 (= res!405643 (validMask!0 mask!3053))))

(assert (=> start!56654 e!359392))

(assert (=> start!56654 true))

(declare-fun array_inv!14009 (array!37946) Bool)

(assert (=> start!56654 (array_inv!14009 a!2986)))

(assert (= (and start!56654 res!405643) b!627948))

(assert (= (and b!627948 res!405644) b!627945))

(assert (= (and b!627945 res!405650) b!627953))

(assert (= (and b!627953 res!405651) b!627943))

(assert (= (and b!627943 res!405649) b!627949))

(assert (= (and b!627949 res!405645) b!627946))

(assert (= (and b!627946 res!405653) b!627950))

(assert (= (and b!627950 res!405646) b!627951))

(assert (= (and b!627951 res!405652) b!627952))

(assert (= (and b!627952 res!405647) b!627947))

(assert (= (and b!627947 res!405648) b!627944))

(declare-fun m!603207 () Bool)

(assert (=> b!627951 m!603207))

(declare-fun m!603209 () Bool)

(assert (=> b!627951 m!603209))

(declare-fun m!603211 () Bool)

(assert (=> b!627951 m!603211))

(declare-fun m!603213 () Bool)

(assert (=> b!627947 m!603213))

(declare-fun m!603215 () Bool)

(assert (=> b!627947 m!603215))

(declare-fun m!603217 () Bool)

(assert (=> b!627943 m!603217))

(declare-fun m!603219 () Bool)

(assert (=> b!627953 m!603219))

(assert (=> b!627952 m!603215))

(assert (=> b!627952 m!603215))

(declare-fun m!603221 () Bool)

(assert (=> b!627952 m!603221))

(declare-fun m!603223 () Bool)

(assert (=> start!56654 m!603223))

(declare-fun m!603225 () Bool)

(assert (=> start!56654 m!603225))

(assert (=> b!627945 m!603215))

(assert (=> b!627945 m!603215))

(declare-fun m!603227 () Bool)

(assert (=> b!627945 m!603227))

(declare-fun m!603229 () Bool)

(assert (=> b!627946 m!603229))

(declare-fun m!603231 () Bool)

(assert (=> b!627944 m!603231))

(declare-fun m!603233 () Bool)

(assert (=> b!627950 m!603233))

(declare-fun m!603235 () Bool)

(assert (=> b!627949 m!603235))

(push 1)

(assert (not b!627949))

(assert (not b!627950))

(assert (not b!627953))

(assert (not b!627943))

(assert (not b!627945))

(assert (not start!56654))

(assert (not b!627944))

(assert (not b!627952))

(assert (not b!627946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

