; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56504 () Bool)

(assert start!56504)

(declare-fun b!626159 () Bool)

(declare-fun res!404011 () Bool)

(declare-fun e!358800 () Bool)

(assert (=> b!626159 (=> (not res!404011) (not e!358800))))

(declare-datatypes ((array!37841 0))(
  ( (array!37842 (arr!18162 (Array (_ BitVec 32) (_ BitVec 64))) (size!18526 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37841)

(declare-datatypes ((List!12203 0))(
  ( (Nil!12200) (Cons!12199 (h!13244 (_ BitVec 64)) (t!18431 List!12203)) )
))
(declare-fun arrayNoDuplicates!0 (array!37841 (_ BitVec 32) List!12203) Bool)

(assert (=> b!626159 (= res!404011 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12200))))

(declare-fun b!626160 () Bool)

(declare-fun res!404004 () Bool)

(assert (=> b!626160 (=> (not res!404004) (not e!358800))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37841 (_ BitVec 32)) Bool)

(assert (=> b!626160 (= res!404004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626161 () Bool)

(declare-fun res!404003 () Bool)

(declare-fun e!358799 () Bool)

(assert (=> b!626161 (=> (not res!404003) (not e!358799))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626161 (= res!404003 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626162 () Bool)

(declare-fun res!404007 () Bool)

(assert (=> b!626162 (=> (not res!404007) (not e!358800))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6602 0))(
  ( (MissingZero!6602 (index!28692 (_ BitVec 32))) (Found!6602 (index!28693 (_ BitVec 32))) (Intermediate!6602 (undefined!7414 Bool) (index!28694 (_ BitVec 32)) (x!57443 (_ BitVec 32))) (Undefined!6602) (MissingVacant!6602 (index!28695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37841 (_ BitVec 32)) SeekEntryResult!6602)

(assert (=> b!626162 (= res!404007 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18162 a!2986) j!136) a!2986 mask!3053) (Found!6602 j!136)))))

(declare-fun b!626163 () Bool)

(declare-fun res!404012 () Bool)

(assert (=> b!626163 (=> (not res!404012) (not e!358799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626163 (= res!404012 (validKeyInArray!0 (select (arr!18162 a!2986) j!136)))))

(declare-fun res!404008 () Bool)

(assert (=> start!56504 (=> (not res!404008) (not e!358799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56504 (= res!404008 (validMask!0 mask!3053))))

(assert (=> start!56504 e!358799))

(assert (=> start!56504 true))

(declare-fun array_inv!13958 (array!37841) Bool)

(assert (=> start!56504 (array_inv!13958 a!2986)))

(declare-fun b!626164 () Bool)

(declare-fun res!404010 () Bool)

(assert (=> b!626164 (=> (not res!404010) (not e!358800))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626164 (= res!404010 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18162 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18162 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626165 () Bool)

(declare-fun res!404009 () Bool)

(assert (=> b!626165 (=> (not res!404009) (not e!358799))))

(assert (=> b!626165 (= res!404009 (and (= (size!18526 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18526 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18526 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626166 () Bool)

(assert (=> b!626166 (= e!358800 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18162 a!2986) index!984) (select (arr!18162 a!2986) j!136))) (bvsge index!984 (size!18526 a!2986))))))

(declare-fun b!626167 () Bool)

(declare-fun res!404005 () Bool)

(assert (=> b!626167 (=> (not res!404005) (not e!358799))))

(assert (=> b!626167 (= res!404005 (validKeyInArray!0 k!1786))))

(declare-fun b!626168 () Bool)

(assert (=> b!626168 (= e!358799 e!358800)))

(declare-fun res!404006 () Bool)

(assert (=> b!626168 (=> (not res!404006) (not e!358800))))

(declare-fun lt!290008 () SeekEntryResult!6602)

(assert (=> b!626168 (= res!404006 (or (= lt!290008 (MissingZero!6602 i!1108)) (= lt!290008 (MissingVacant!6602 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37841 (_ BitVec 32)) SeekEntryResult!6602)

(assert (=> b!626168 (= lt!290008 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56504 res!404008) b!626165))

(assert (= (and b!626165 res!404009) b!626163))

(assert (= (and b!626163 res!404012) b!626167))

(assert (= (and b!626167 res!404005) b!626161))

(assert (= (and b!626161 res!404003) b!626168))

(assert (= (and b!626168 res!404006) b!626160))

(assert (= (and b!626160 res!404004) b!626159))

(assert (= (and b!626159 res!404011) b!626164))

(assert (= (and b!626164 res!404010) b!626162))

(assert (= (and b!626162 res!404007) b!626166))

(declare-fun m!601629 () Bool)

(assert (=> b!626163 m!601629))

(assert (=> b!626163 m!601629))

(declare-fun m!601631 () Bool)

(assert (=> b!626163 m!601631))

(declare-fun m!601633 () Bool)

(assert (=> b!626168 m!601633))

(declare-fun m!601635 () Bool)

(assert (=> b!626166 m!601635))

(assert (=> b!626166 m!601629))

(declare-fun m!601637 () Bool)

(assert (=> b!626161 m!601637))

(declare-fun m!601639 () Bool)

(assert (=> start!56504 m!601639))

(declare-fun m!601641 () Bool)

(assert (=> start!56504 m!601641))

(declare-fun m!601643 () Bool)

(assert (=> b!626160 m!601643))

(assert (=> b!626162 m!601629))

(assert (=> b!626162 m!601629))

(declare-fun m!601645 () Bool)

(assert (=> b!626162 m!601645))

(declare-fun m!601647 () Bool)

(assert (=> b!626159 m!601647))

(declare-fun m!601649 () Bool)

(assert (=> b!626167 m!601649))

(declare-fun m!601651 () Bool)

(assert (=> b!626164 m!601651))

(declare-fun m!601653 () Bool)

(assert (=> b!626164 m!601653))

(declare-fun m!601655 () Bool)

(assert (=> b!626164 m!601655))

(push 1)

(assert (not b!626161))

(assert (not b!626168))

(assert (not start!56504))

(assert (not b!626167))

(assert (not b!626163))

(assert (not b!626159))

(assert (not b!626160))

(assert (not b!626162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

