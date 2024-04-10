; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56748 () Bool)

(assert start!56748)

(declare-fun b!628810 () Bool)

(declare-fun res!406370 () Bool)

(declare-fun e!359708 () Bool)

(assert (=> b!628810 (=> (not res!406370) (not e!359708))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37989 0))(
  ( (array!37990 (arr!18233 (Array (_ BitVec 32) (_ BitVec 64))) (size!18597 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37989)

(assert (=> b!628810 (= res!406370 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18233 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18233 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628811 () Bool)

(declare-fun res!406368 () Bool)

(assert (=> b!628811 (=> (not res!406368) (not e!359708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37989 (_ BitVec 32)) Bool)

(assert (=> b!628811 (= res!406368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!406374 () Bool)

(declare-fun e!359709 () Bool)

(assert (=> start!56748 (=> (not res!406374) (not e!359709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56748 (= res!406374 (validMask!0 mask!3053))))

(assert (=> start!56748 e!359709))

(assert (=> start!56748 true))

(declare-fun array_inv!14029 (array!37989) Bool)

(assert (=> start!56748 (array_inv!14029 a!2986)))

(declare-fun b!628812 () Bool)

(declare-fun res!406371 () Bool)

(assert (=> b!628812 (=> (not res!406371) (not e!359708))))

(declare-datatypes ((List!12274 0))(
  ( (Nil!12271) (Cons!12270 (h!13315 (_ BitVec 64)) (t!18502 List!12274)) )
))
(declare-fun arrayNoDuplicates!0 (array!37989 (_ BitVec 32) List!12274) Bool)

(assert (=> b!628812 (= res!406371 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12271))))

(declare-fun b!628813 () Bool)

(assert (=> b!628813 (= e!359708 false)))

(declare-fun lt!290571 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628813 (= lt!290571 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628814 () Bool)

(declare-fun res!406367 () Bool)

(assert (=> b!628814 (=> (not res!406367) (not e!359708))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628814 (= res!406367 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18233 a!2986) index!984) (select (arr!18233 a!2986) j!136))) (not (= (select (arr!18233 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628815 () Bool)

(declare-fun res!406372 () Bool)

(assert (=> b!628815 (=> (not res!406372) (not e!359709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628815 (= res!406372 (validKeyInArray!0 (select (arr!18233 a!2986) j!136)))))

(declare-fun b!628816 () Bool)

(declare-fun res!406376 () Bool)

(assert (=> b!628816 (=> (not res!406376) (not e!359709))))

(declare-fun arrayContainsKey!0 (array!37989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628816 (= res!406376 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628817 () Bool)

(declare-fun res!406375 () Bool)

(assert (=> b!628817 (=> (not res!406375) (not e!359708))))

(declare-datatypes ((SeekEntryResult!6673 0))(
  ( (MissingZero!6673 (index!28976 (_ BitVec 32))) (Found!6673 (index!28977 (_ BitVec 32))) (Intermediate!6673 (undefined!7485 Bool) (index!28978 (_ BitVec 32)) (x!57707 (_ BitVec 32))) (Undefined!6673) (MissingVacant!6673 (index!28979 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37989 (_ BitVec 32)) SeekEntryResult!6673)

(assert (=> b!628817 (= res!406375 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18233 a!2986) j!136) a!2986 mask!3053) (Found!6673 j!136)))))

(declare-fun b!628818 () Bool)

(declare-fun res!406373 () Bool)

(assert (=> b!628818 (=> (not res!406373) (not e!359709))))

(assert (=> b!628818 (= res!406373 (validKeyInArray!0 k!1786))))

(declare-fun b!628819 () Bool)

(assert (=> b!628819 (= e!359709 e!359708)))

(declare-fun res!406369 () Bool)

(assert (=> b!628819 (=> (not res!406369) (not e!359708))))

(declare-fun lt!290572 () SeekEntryResult!6673)

(assert (=> b!628819 (= res!406369 (or (= lt!290572 (MissingZero!6673 i!1108)) (= lt!290572 (MissingVacant!6673 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37989 (_ BitVec 32)) SeekEntryResult!6673)

(assert (=> b!628819 (= lt!290572 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628820 () Bool)

(declare-fun res!406366 () Bool)

(assert (=> b!628820 (=> (not res!406366) (not e!359709))))

(assert (=> b!628820 (= res!406366 (and (= (size!18597 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18597 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18597 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56748 res!406374) b!628820))

(assert (= (and b!628820 res!406366) b!628815))

(assert (= (and b!628815 res!406372) b!628818))

(assert (= (and b!628818 res!406373) b!628816))

(assert (= (and b!628816 res!406376) b!628819))

(assert (= (and b!628819 res!406369) b!628811))

(assert (= (and b!628811 res!406368) b!628812))

(assert (= (and b!628812 res!406371) b!628810))

(assert (= (and b!628810 res!406370) b!628817))

(assert (= (and b!628817 res!406375) b!628814))

(assert (= (and b!628814 res!406367) b!628813))

(declare-fun m!603927 () Bool)

(assert (=> start!56748 m!603927))

(declare-fun m!603929 () Bool)

(assert (=> start!56748 m!603929))

(declare-fun m!603931 () Bool)

(assert (=> b!628812 m!603931))

(declare-fun m!603933 () Bool)

(assert (=> b!628814 m!603933))

(declare-fun m!603935 () Bool)

(assert (=> b!628814 m!603935))

(declare-fun m!603937 () Bool)

(assert (=> b!628819 m!603937))

(assert (=> b!628815 m!603935))

(assert (=> b!628815 m!603935))

(declare-fun m!603939 () Bool)

(assert (=> b!628815 m!603939))

(declare-fun m!603941 () Bool)

(assert (=> b!628813 m!603941))

(declare-fun m!603943 () Bool)

(assert (=> b!628811 m!603943))

(assert (=> b!628817 m!603935))

(assert (=> b!628817 m!603935))

(declare-fun m!603945 () Bool)

(assert (=> b!628817 m!603945))

(declare-fun m!603947 () Bool)

(assert (=> b!628818 m!603947))

(declare-fun m!603949 () Bool)

(assert (=> b!628810 m!603949))

(declare-fun m!603951 () Bool)

(assert (=> b!628810 m!603951))

(declare-fun m!603953 () Bool)

(assert (=> b!628810 m!603953))

(declare-fun m!603955 () Bool)

(assert (=> b!628816 m!603955))

(push 1)

(assert (not b!628811))

(assert (not b!628817))

(assert (not b!628818))

(assert (not b!628816))

(assert (not b!628812))

(assert (not b!628815))

