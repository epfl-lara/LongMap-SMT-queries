; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56414 () Bool)

(assert start!56414)

(declare-fun b!625320 () Bool)

(declare-fun res!403329 () Bool)

(declare-fun e!358448 () Bool)

(assert (=> b!625320 (=> (not res!403329) (not e!358448))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37794 0))(
  ( (array!37795 (arr!18140 (Array (_ BitVec 32) (_ BitVec 64))) (size!18504 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37794)

(assert (=> b!625320 (= res!403329 (and (= (size!18504 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18504 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18504 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625321 () Bool)

(declare-fun res!403327 () Bool)

(assert (=> b!625321 (=> (not res!403327) (not e!358448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625321 (= res!403327 (validKeyInArray!0 (select (arr!18140 a!2986) j!136)))))

(declare-fun b!625322 () Bool)

(declare-fun e!358447 () Bool)

(assert (=> b!625322 (= e!358447 false)))

(declare-datatypes ((SeekEntryResult!6580 0))(
  ( (MissingZero!6580 (index!28604 (_ BitVec 32))) (Found!6580 (index!28605 (_ BitVec 32))) (Intermediate!6580 (undefined!7392 Bool) (index!28606 (_ BitVec 32)) (x!57354 (_ BitVec 32))) (Undefined!6580) (MissingVacant!6580 (index!28607 (_ BitVec 32))) )
))
(declare-fun lt!289810 () SeekEntryResult!6580)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37794 (_ BitVec 32)) SeekEntryResult!6580)

(assert (=> b!625322 (= lt!289810 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18140 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625323 () Bool)

(declare-fun res!403333 () Bool)

(assert (=> b!625323 (=> (not res!403333) (not e!358447))))

(declare-datatypes ((List!12181 0))(
  ( (Nil!12178) (Cons!12177 (h!13222 (_ BitVec 64)) (t!18409 List!12181)) )
))
(declare-fun arrayNoDuplicates!0 (array!37794 (_ BitVec 32) List!12181) Bool)

(assert (=> b!625323 (= res!403333 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12178))))

(declare-fun b!625324 () Bool)

(declare-fun res!403326 () Bool)

(assert (=> b!625324 (=> (not res!403326) (not e!358448))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!625324 (= res!403326 (validKeyInArray!0 k!1786))))

(declare-fun b!625325 () Bool)

(declare-fun res!403331 () Bool)

(assert (=> b!625325 (=> (not res!403331) (not e!358447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37794 (_ BitVec 32)) Bool)

(assert (=> b!625325 (= res!403331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625326 () Bool)

(declare-fun res!403334 () Bool)

(assert (=> b!625326 (=> (not res!403334) (not e!358448))))

(declare-fun arrayContainsKey!0 (array!37794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625326 (= res!403334 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!403332 () Bool)

(assert (=> start!56414 (=> (not res!403332) (not e!358448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56414 (= res!403332 (validMask!0 mask!3053))))

(assert (=> start!56414 e!358448))

(assert (=> start!56414 true))

(declare-fun array_inv!13936 (array!37794) Bool)

(assert (=> start!56414 (array_inv!13936 a!2986)))

(declare-fun b!625327 () Bool)

(declare-fun res!403328 () Bool)

(assert (=> b!625327 (=> (not res!403328) (not e!358447))))

(assert (=> b!625327 (= res!403328 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18140 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18140 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625328 () Bool)

(assert (=> b!625328 (= e!358448 e!358447)))

(declare-fun res!403330 () Bool)

(assert (=> b!625328 (=> (not res!403330) (not e!358447))))

(declare-fun lt!289809 () SeekEntryResult!6580)

(assert (=> b!625328 (= res!403330 (or (= lt!289809 (MissingZero!6580 i!1108)) (= lt!289809 (MissingVacant!6580 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37794 (_ BitVec 32)) SeekEntryResult!6580)

(assert (=> b!625328 (= lt!289809 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56414 res!403332) b!625320))

(assert (= (and b!625320 res!403329) b!625321))

(assert (= (and b!625321 res!403327) b!625324))

(assert (= (and b!625324 res!403326) b!625326))

(assert (= (and b!625326 res!403334) b!625328))

(assert (= (and b!625328 res!403330) b!625325))

(assert (= (and b!625325 res!403331) b!625323))

(assert (= (and b!625323 res!403333) b!625327))

(assert (= (and b!625327 res!403328) b!625322))

(declare-fun m!600903 () Bool)

(assert (=> b!625323 m!600903))

(declare-fun m!600905 () Bool)

(assert (=> start!56414 m!600905))

(declare-fun m!600907 () Bool)

(assert (=> start!56414 m!600907))

(declare-fun m!600909 () Bool)

(assert (=> b!625327 m!600909))

(declare-fun m!600911 () Bool)

(assert (=> b!625327 m!600911))

(declare-fun m!600913 () Bool)

(assert (=> b!625327 m!600913))

(declare-fun m!600915 () Bool)

(assert (=> b!625321 m!600915))

(assert (=> b!625321 m!600915))

(declare-fun m!600917 () Bool)

(assert (=> b!625321 m!600917))

(assert (=> b!625322 m!600915))

(assert (=> b!625322 m!600915))

(declare-fun m!600919 () Bool)

(assert (=> b!625322 m!600919))

(declare-fun m!600921 () Bool)

(assert (=> b!625324 m!600921))

(declare-fun m!600923 () Bool)

(assert (=> b!625328 m!600923))

(declare-fun m!600925 () Bool)

(assert (=> b!625326 m!600925))

(declare-fun m!600927 () Bool)

(assert (=> b!625325 m!600927))

(push 1)

(assert (not b!625322))

(assert (not b!625328))

(assert (not b!625326))

(assert (not b!625323))

(assert (not start!56414))

(assert (not b!625324))

(assert (not b!625325))

(assert (not b!625321))

(check-sat)

(pop 1)

