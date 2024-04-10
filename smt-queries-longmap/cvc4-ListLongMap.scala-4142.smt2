; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56450 () Bool)

(assert start!56450)

(declare-fun b!625815 () Bool)

(declare-fun e!358611 () Bool)

(declare-fun e!358610 () Bool)

(assert (=> b!625815 (= e!358611 e!358610)))

(declare-fun res!403826 () Bool)

(assert (=> b!625815 (=> (not res!403826) (not e!358610))))

(declare-datatypes ((SeekEntryResult!6598 0))(
  ( (MissingZero!6598 (index!28676 (_ BitVec 32))) (Found!6598 (index!28677 (_ BitVec 32))) (Intermediate!6598 (undefined!7410 Bool) (index!28678 (_ BitVec 32)) (x!57420 (_ BitVec 32))) (Undefined!6598) (MissingVacant!6598 (index!28679 (_ BitVec 32))) )
))
(declare-fun lt!289909 () SeekEntryResult!6598)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625815 (= res!403826 (or (= lt!289909 (MissingZero!6598 i!1108)) (= lt!289909 (MissingVacant!6598 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37830 0))(
  ( (array!37831 (arr!18158 (Array (_ BitVec 32) (_ BitVec 64))) (size!18522 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37830)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37830 (_ BitVec 32)) SeekEntryResult!6598)

(assert (=> b!625815 (= lt!289909 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625816 () Bool)

(declare-fun res!403823 () Bool)

(assert (=> b!625816 (=> (not res!403823) (not e!358610))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625816 (= res!403823 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18158 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18158 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625817 () Bool)

(declare-fun res!403825 () Bool)

(assert (=> b!625817 (=> (not res!403825) (not e!358611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625817 (= res!403825 (validKeyInArray!0 k!1786))))

(declare-fun b!625818 () Bool)

(declare-fun res!403828 () Bool)

(assert (=> b!625818 (=> (not res!403828) (not e!358611))))

(declare-fun arrayContainsKey!0 (array!37830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625818 (= res!403828 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625819 () Bool)

(assert (=> b!625819 (= e!358610 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!289908 () SeekEntryResult!6598)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37830 (_ BitVec 32)) SeekEntryResult!6598)

(assert (=> b!625819 (= lt!289908 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18158 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625821 () Bool)

(declare-fun res!403822 () Bool)

(assert (=> b!625821 (=> (not res!403822) (not e!358611))))

(assert (=> b!625821 (= res!403822 (validKeyInArray!0 (select (arr!18158 a!2986) j!136)))))

(declare-fun b!625822 () Bool)

(declare-fun res!403824 () Bool)

(assert (=> b!625822 (=> (not res!403824) (not e!358611))))

(assert (=> b!625822 (= res!403824 (and (= (size!18522 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18522 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18522 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625823 () Bool)

(declare-fun res!403827 () Bool)

(assert (=> b!625823 (=> (not res!403827) (not e!358610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37830 (_ BitVec 32)) Bool)

(assert (=> b!625823 (= res!403827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625820 () Bool)

(declare-fun res!403829 () Bool)

(assert (=> b!625820 (=> (not res!403829) (not e!358610))))

(declare-datatypes ((List!12199 0))(
  ( (Nil!12196) (Cons!12195 (h!13240 (_ BitVec 64)) (t!18427 List!12199)) )
))
(declare-fun arrayNoDuplicates!0 (array!37830 (_ BitVec 32) List!12199) Bool)

(assert (=> b!625820 (= res!403829 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12196))))

(declare-fun res!403821 () Bool)

(assert (=> start!56450 (=> (not res!403821) (not e!358611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56450 (= res!403821 (validMask!0 mask!3053))))

(assert (=> start!56450 e!358611))

(assert (=> start!56450 true))

(declare-fun array_inv!13954 (array!37830) Bool)

(assert (=> start!56450 (array_inv!13954 a!2986)))

(assert (= (and start!56450 res!403821) b!625822))

(assert (= (and b!625822 res!403824) b!625821))

(assert (= (and b!625821 res!403822) b!625817))

(assert (= (and b!625817 res!403825) b!625818))

(assert (= (and b!625818 res!403828) b!625815))

(assert (= (and b!625815 res!403826) b!625823))

(assert (= (and b!625823 res!403827) b!625820))

(assert (= (and b!625820 res!403829) b!625816))

(assert (= (and b!625816 res!403823) b!625819))

(declare-fun m!601371 () Bool)

(assert (=> b!625821 m!601371))

(assert (=> b!625821 m!601371))

(declare-fun m!601373 () Bool)

(assert (=> b!625821 m!601373))

(declare-fun m!601375 () Bool)

(assert (=> start!56450 m!601375))

(declare-fun m!601377 () Bool)

(assert (=> start!56450 m!601377))

(declare-fun m!601379 () Bool)

(assert (=> b!625818 m!601379))

(declare-fun m!601381 () Bool)

(assert (=> b!625820 m!601381))

(assert (=> b!625819 m!601371))

(assert (=> b!625819 m!601371))

(declare-fun m!601383 () Bool)

(assert (=> b!625819 m!601383))

(declare-fun m!601385 () Bool)

(assert (=> b!625816 m!601385))

(declare-fun m!601387 () Bool)

(assert (=> b!625816 m!601387))

(declare-fun m!601389 () Bool)

(assert (=> b!625816 m!601389))

(declare-fun m!601391 () Bool)

(assert (=> b!625815 m!601391))

(declare-fun m!601393 () Bool)

(assert (=> b!625817 m!601393))

(declare-fun m!601395 () Bool)

(assert (=> b!625823 m!601395))

(push 1)

(assert (not b!625820))

(assert (not b!625821))

(assert (not start!56450))

(assert (not b!625818))

(assert (not b!625815))

(assert (not b!625817))

