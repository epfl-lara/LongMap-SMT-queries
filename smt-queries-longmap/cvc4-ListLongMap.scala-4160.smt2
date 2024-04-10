; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56652 () Bool)

(assert start!56652)

(declare-fun b!627910 () Bool)

(declare-fun e!359384 () Bool)

(assert (=> b!627910 (= e!359384 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!290365 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627910 (= lt!290365 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627911 () Bool)

(declare-fun res!405620 () Bool)

(assert (=> b!627911 (=> (not res!405620) (not e!359384))))

(declare-datatypes ((array!37944 0))(
  ( (array!37945 (arr!18212 (Array (_ BitVec 32) (_ BitVec 64))) (size!18576 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37944)

(declare-datatypes ((List!12253 0))(
  ( (Nil!12250) (Cons!12249 (h!13294 (_ BitVec 64)) (t!18481 List!12253)) )
))
(declare-fun arrayNoDuplicates!0 (array!37944 (_ BitVec 32) List!12253) Bool)

(assert (=> b!627911 (= res!405620 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12250))))

(declare-fun b!627912 () Bool)

(declare-fun res!405613 () Bool)

(assert (=> b!627912 (=> (not res!405613) (not e!359384))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6652 0))(
  ( (MissingZero!6652 (index!28892 (_ BitVec 32))) (Found!6652 (index!28893 (_ BitVec 32))) (Intermediate!6652 (undefined!7464 Bool) (index!28894 (_ BitVec 32)) (x!57624 (_ BitVec 32))) (Undefined!6652) (MissingVacant!6652 (index!28895 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37944 (_ BitVec 32)) SeekEntryResult!6652)

(assert (=> b!627912 (= res!405613 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18212 a!2986) j!136) a!2986 mask!3053) (Found!6652 j!136)))))

(declare-fun b!627913 () Bool)

(declare-fun res!405618 () Bool)

(assert (=> b!627913 (=> (not res!405618) (not e!359384))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!627913 (= res!405618 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18212 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18212 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!405611 () Bool)

(declare-fun e!359385 () Bool)

(assert (=> start!56652 (=> (not res!405611) (not e!359385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56652 (= res!405611 (validMask!0 mask!3053))))

(assert (=> start!56652 e!359385))

(assert (=> start!56652 true))

(declare-fun array_inv!14008 (array!37944) Bool)

(assert (=> start!56652 (array_inv!14008 a!2986)))

(declare-fun b!627914 () Bool)

(declare-fun res!405614 () Bool)

(assert (=> b!627914 (=> (not res!405614) (not e!359385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627914 (= res!405614 (validKeyInArray!0 k!1786))))

(declare-fun b!627915 () Bool)

(declare-fun res!405612 () Bool)

(assert (=> b!627915 (=> (not res!405612) (not e!359384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37944 (_ BitVec 32)) Bool)

(assert (=> b!627915 (= res!405612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627916 () Bool)

(declare-fun res!405617 () Bool)

(assert (=> b!627916 (=> (not res!405617) (not e!359385))))

(declare-fun arrayContainsKey!0 (array!37944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627916 (= res!405617 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627917 () Bool)

(assert (=> b!627917 (= e!359385 e!359384)))

(declare-fun res!405616 () Bool)

(assert (=> b!627917 (=> (not res!405616) (not e!359384))))

(declare-fun lt!290364 () SeekEntryResult!6652)

(assert (=> b!627917 (= res!405616 (or (= lt!290364 (MissingZero!6652 i!1108)) (= lt!290364 (MissingVacant!6652 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37944 (_ BitVec 32)) SeekEntryResult!6652)

(assert (=> b!627917 (= lt!290364 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627918 () Bool)

(declare-fun res!405619 () Bool)

(assert (=> b!627918 (=> (not res!405619) (not e!359385))))

(assert (=> b!627918 (= res!405619 (validKeyInArray!0 (select (arr!18212 a!2986) j!136)))))

(declare-fun b!627919 () Bool)

(declare-fun res!405615 () Bool)

(assert (=> b!627919 (=> (not res!405615) (not e!359385))))

(assert (=> b!627919 (= res!405615 (and (= (size!18576 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18576 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18576 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627920 () Bool)

(declare-fun res!405610 () Bool)

(assert (=> b!627920 (=> (not res!405610) (not e!359384))))

(assert (=> b!627920 (= res!405610 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18212 a!2986) index!984) (select (arr!18212 a!2986) j!136))) (not (= (select (arr!18212 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56652 res!405611) b!627919))

(assert (= (and b!627919 res!405615) b!627918))

(assert (= (and b!627918 res!405619) b!627914))

(assert (= (and b!627914 res!405614) b!627916))

(assert (= (and b!627916 res!405617) b!627917))

(assert (= (and b!627917 res!405616) b!627915))

(assert (= (and b!627915 res!405612) b!627911))

(assert (= (and b!627911 res!405620) b!627913))

(assert (= (and b!627913 res!405618) b!627912))

(assert (= (and b!627912 res!405613) b!627920))

(assert (= (and b!627920 res!405610) b!627910))

(declare-fun m!603177 () Bool)

(assert (=> b!627911 m!603177))

(declare-fun m!603179 () Bool)

(assert (=> b!627918 m!603179))

(assert (=> b!627918 m!603179))

(declare-fun m!603181 () Bool)

(assert (=> b!627918 m!603181))

(declare-fun m!603183 () Bool)

(assert (=> b!627914 m!603183))

(declare-fun m!603185 () Bool)

(assert (=> b!627913 m!603185))

(declare-fun m!603187 () Bool)

(assert (=> b!627913 m!603187))

(declare-fun m!603189 () Bool)

(assert (=> b!627913 m!603189))

(declare-fun m!603191 () Bool)

(assert (=> b!627910 m!603191))

(declare-fun m!603193 () Bool)

(assert (=> start!56652 m!603193))

(declare-fun m!603195 () Bool)

(assert (=> start!56652 m!603195))

(declare-fun m!603197 () Bool)

(assert (=> b!627915 m!603197))

(declare-fun m!603199 () Bool)

(assert (=> b!627917 m!603199))

(declare-fun m!603201 () Bool)

(assert (=> b!627916 m!603201))

(declare-fun m!603203 () Bool)

(assert (=> b!627920 m!603203))

(assert (=> b!627920 m!603179))

(assert (=> b!627912 m!603179))

(assert (=> b!627912 m!603179))

(declare-fun m!603205 () Bool)

(assert (=> b!627912 m!603205))

(push 1)

(assert (not b!627918))

(assert (not b!627915))

(assert (not b!627914))

