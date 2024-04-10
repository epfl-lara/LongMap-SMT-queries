; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56610 () Bool)

(assert start!56610)

(declare-fun b!627217 () Bool)

(declare-fun res!404922 () Bool)

(declare-fun e!359194 () Bool)

(assert (=> b!627217 (=> (not res!404922) (not e!359194))))

(declare-datatypes ((array!37902 0))(
  ( (array!37903 (arr!18191 (Array (_ BitVec 32) (_ BitVec 64))) (size!18555 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37902)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627217 (= res!404922 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627218 () Bool)

(declare-fun res!404917 () Bool)

(declare-fun e!359196 () Bool)

(assert (=> b!627218 (=> (not res!404917) (not e!359196))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6631 0))(
  ( (MissingZero!6631 (index!28808 (_ BitVec 32))) (Found!6631 (index!28809 (_ BitVec 32))) (Intermediate!6631 (undefined!7443 Bool) (index!28810 (_ BitVec 32)) (x!57547 (_ BitVec 32))) (Undefined!6631) (MissingVacant!6631 (index!28811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37902 (_ BitVec 32)) SeekEntryResult!6631)

(assert (=> b!627218 (= res!404917 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18191 a!2986) j!136) a!2986 mask!3053) (Found!6631 j!136)))))

(declare-fun b!627219 () Bool)

(declare-fun res!404920 () Bool)

(assert (=> b!627219 (=> (not res!404920) (not e!359194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627219 (= res!404920 (validKeyInArray!0 (select (arr!18191 a!2986) j!136)))))

(declare-fun b!627220 () Bool)

(declare-fun res!404926 () Bool)

(assert (=> b!627220 (=> (not res!404926) (not e!359196))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627220 (= res!404926 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18191 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18191 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627221 () Bool)

(assert (=> b!627221 (= e!359196 false)))

(declare-fun lt!290238 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627221 (= lt!290238 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627222 () Bool)

(assert (=> b!627222 (= e!359194 e!359196)))

(declare-fun res!404925 () Bool)

(assert (=> b!627222 (=> (not res!404925) (not e!359196))))

(declare-fun lt!290239 () SeekEntryResult!6631)

(assert (=> b!627222 (= res!404925 (or (= lt!290239 (MissingZero!6631 i!1108)) (= lt!290239 (MissingVacant!6631 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37902 (_ BitVec 32)) SeekEntryResult!6631)

(assert (=> b!627222 (= lt!290239 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627223 () Bool)

(declare-fun res!404924 () Bool)

(assert (=> b!627223 (=> (not res!404924) (not e!359196))))

(assert (=> b!627223 (= res!404924 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18191 a!2986) index!984) (select (arr!18191 a!2986) j!136))) (not (= (select (arr!18191 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627224 () Bool)

(declare-fun res!404923 () Bool)

(assert (=> b!627224 (=> (not res!404923) (not e!359194))))

(assert (=> b!627224 (= res!404923 (validKeyInArray!0 k!1786))))

(declare-fun b!627226 () Bool)

(declare-fun res!404927 () Bool)

(assert (=> b!627226 (=> (not res!404927) (not e!359194))))

(assert (=> b!627226 (= res!404927 (and (= (size!18555 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18555 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18555 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627227 () Bool)

(declare-fun res!404918 () Bool)

(assert (=> b!627227 (=> (not res!404918) (not e!359196))))

(declare-datatypes ((List!12232 0))(
  ( (Nil!12229) (Cons!12228 (h!13273 (_ BitVec 64)) (t!18460 List!12232)) )
))
(declare-fun arrayNoDuplicates!0 (array!37902 (_ BitVec 32) List!12232) Bool)

(assert (=> b!627227 (= res!404918 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12229))))

(declare-fun b!627225 () Bool)

(declare-fun res!404921 () Bool)

(assert (=> b!627225 (=> (not res!404921) (not e!359196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37902 (_ BitVec 32)) Bool)

(assert (=> b!627225 (= res!404921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404919 () Bool)

(assert (=> start!56610 (=> (not res!404919) (not e!359194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56610 (= res!404919 (validMask!0 mask!3053))))

(assert (=> start!56610 e!359194))

(assert (=> start!56610 true))

(declare-fun array_inv!13987 (array!37902) Bool)

(assert (=> start!56610 (array_inv!13987 a!2986)))

(assert (= (and start!56610 res!404919) b!627226))

(assert (= (and b!627226 res!404927) b!627219))

(assert (= (and b!627219 res!404920) b!627224))

(assert (= (and b!627224 res!404923) b!627217))

(assert (= (and b!627217 res!404922) b!627222))

(assert (= (and b!627222 res!404925) b!627225))

(assert (= (and b!627225 res!404921) b!627227))

(assert (= (and b!627227 res!404918) b!627220))

(assert (= (and b!627220 res!404926) b!627218))

(assert (= (and b!627218 res!404917) b!627223))

(assert (= (and b!627223 res!404924) b!627221))

(declare-fun m!602547 () Bool)

(assert (=> b!627217 m!602547))

(declare-fun m!602549 () Bool)

(assert (=> b!627227 m!602549))

(declare-fun m!602551 () Bool)

(assert (=> start!56610 m!602551))

(declare-fun m!602553 () Bool)

(assert (=> start!56610 m!602553))

(declare-fun m!602555 () Bool)

(assert (=> b!627224 m!602555))

(declare-fun m!602557 () Bool)

(assert (=> b!627219 m!602557))

(assert (=> b!627219 m!602557))

(declare-fun m!602559 () Bool)

(assert (=> b!627219 m!602559))

(declare-fun m!602561 () Bool)

(assert (=> b!627220 m!602561))

(declare-fun m!602563 () Bool)

(assert (=> b!627220 m!602563))

(declare-fun m!602565 () Bool)

(assert (=> b!627220 m!602565))

(declare-fun m!602567 () Bool)

(assert (=> b!627221 m!602567))

(declare-fun m!602569 () Bool)

(assert (=> b!627225 m!602569))

(declare-fun m!602571 () Bool)

(assert (=> b!627222 m!602571))

(assert (=> b!627218 m!602557))

(assert (=> b!627218 m!602557))

(declare-fun m!602573 () Bool)

(assert (=> b!627218 m!602573))

(declare-fun m!602575 () Bool)

(assert (=> b!627223 m!602575))

(assert (=> b!627223 m!602557))

(push 1)

(assert (not b!627227))

(assert (not b!627225))

(assert (not b!627222))

(assert (not start!56610))

(assert (not b!627217))

(assert (not b!627221))

(assert (not b!627219))

(assert (not b!627224))

(assert (not b!627218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

