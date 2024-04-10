; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56750 () Bool)

(assert start!56750)

(declare-fun res!406400 () Bool)

(declare-fun e!359716 () Bool)

(assert (=> start!56750 (=> (not res!406400) (not e!359716))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56750 (= res!406400 (validMask!0 mask!3053))))

(assert (=> start!56750 e!359716))

(assert (=> start!56750 true))

(declare-datatypes ((array!37991 0))(
  ( (array!37992 (arr!18234 (Array (_ BitVec 32) (_ BitVec 64))) (size!18598 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37991)

(declare-fun array_inv!14030 (array!37991) Bool)

(assert (=> start!56750 (array_inv!14030 a!2986)))

(declare-fun b!628843 () Bool)

(declare-fun res!406407 () Bool)

(declare-fun e!359718 () Bool)

(assert (=> b!628843 (=> (not res!406407) (not e!359718))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628843 (= res!406407 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18234 a!2986) index!984) (select (arr!18234 a!2986) j!136))) (not (= (select (arr!18234 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628844 () Bool)

(assert (=> b!628844 (= e!359716 e!359718)))

(declare-fun res!406405 () Bool)

(assert (=> b!628844 (=> (not res!406405) (not e!359718))))

(declare-datatypes ((SeekEntryResult!6674 0))(
  ( (MissingZero!6674 (index!28980 (_ BitVec 32))) (Found!6674 (index!28981 (_ BitVec 32))) (Intermediate!6674 (undefined!7486 Bool) (index!28982 (_ BitVec 32)) (x!57716 (_ BitVec 32))) (Undefined!6674) (MissingVacant!6674 (index!28983 (_ BitVec 32))) )
))
(declare-fun lt!290578 () SeekEntryResult!6674)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628844 (= res!406405 (or (= lt!290578 (MissingZero!6674 i!1108)) (= lt!290578 (MissingVacant!6674 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37991 (_ BitVec 32)) SeekEntryResult!6674)

(assert (=> b!628844 (= lt!290578 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628845 () Bool)

(assert (=> b!628845 (= e!359718 false)))

(declare-fun lt!290577 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628845 (= lt!290577 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628846 () Bool)

(declare-fun res!406401 () Bool)

(assert (=> b!628846 (=> (not res!406401) (not e!359718))))

(declare-datatypes ((List!12275 0))(
  ( (Nil!12272) (Cons!12271 (h!13316 (_ BitVec 64)) (t!18503 List!12275)) )
))
(declare-fun arrayNoDuplicates!0 (array!37991 (_ BitVec 32) List!12275) Bool)

(assert (=> b!628846 (= res!406401 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12272))))

(declare-fun b!628847 () Bool)

(declare-fun res!406409 () Bool)

(assert (=> b!628847 (=> (not res!406409) (not e!359718))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37991 (_ BitVec 32)) SeekEntryResult!6674)

(assert (=> b!628847 (= res!406409 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18234 a!2986) j!136) a!2986 mask!3053) (Found!6674 j!136)))))

(declare-fun b!628848 () Bool)

(declare-fun res!406403 () Bool)

(assert (=> b!628848 (=> (not res!406403) (not e!359718))))

(assert (=> b!628848 (= res!406403 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18234 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18234 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628849 () Bool)

(declare-fun res!406408 () Bool)

(assert (=> b!628849 (=> (not res!406408) (not e!359718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37991 (_ BitVec 32)) Bool)

(assert (=> b!628849 (= res!406408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628850 () Bool)

(declare-fun res!406402 () Bool)

(assert (=> b!628850 (=> (not res!406402) (not e!359716))))

(declare-fun arrayContainsKey!0 (array!37991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628850 (= res!406402 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628851 () Bool)

(declare-fun res!406404 () Bool)

(assert (=> b!628851 (=> (not res!406404) (not e!359716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628851 (= res!406404 (validKeyInArray!0 k!1786))))

(declare-fun b!628852 () Bool)

(declare-fun res!406399 () Bool)

(assert (=> b!628852 (=> (not res!406399) (not e!359716))))

(assert (=> b!628852 (= res!406399 (and (= (size!18598 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18598 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18598 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628853 () Bool)

(declare-fun res!406406 () Bool)

(assert (=> b!628853 (=> (not res!406406) (not e!359716))))

(assert (=> b!628853 (= res!406406 (validKeyInArray!0 (select (arr!18234 a!2986) j!136)))))

(assert (= (and start!56750 res!406400) b!628852))

(assert (= (and b!628852 res!406399) b!628853))

(assert (= (and b!628853 res!406406) b!628851))

(assert (= (and b!628851 res!406404) b!628850))

(assert (= (and b!628850 res!406402) b!628844))

(assert (= (and b!628844 res!406405) b!628849))

(assert (= (and b!628849 res!406408) b!628846))

(assert (= (and b!628846 res!406401) b!628848))

(assert (= (and b!628848 res!406403) b!628847))

(assert (= (and b!628847 res!406409) b!628843))

(assert (= (and b!628843 res!406407) b!628845))

(declare-fun m!603957 () Bool)

(assert (=> b!628848 m!603957))

(declare-fun m!603959 () Bool)

(assert (=> b!628848 m!603959))

(declare-fun m!603961 () Bool)

(assert (=> b!628848 m!603961))

(declare-fun m!603963 () Bool)

(assert (=> b!628845 m!603963))

(declare-fun m!603965 () Bool)

(assert (=> b!628844 m!603965))

(declare-fun m!603967 () Bool)

(assert (=> b!628846 m!603967))

(declare-fun m!603969 () Bool)

(assert (=> b!628849 m!603969))

(declare-fun m!603971 () Bool)

(assert (=> b!628853 m!603971))

(assert (=> b!628853 m!603971))

(declare-fun m!603973 () Bool)

(assert (=> b!628853 m!603973))

(declare-fun m!603975 () Bool)

(assert (=> b!628850 m!603975))

(declare-fun m!603977 () Bool)

(assert (=> start!56750 m!603977))

(declare-fun m!603979 () Bool)

(assert (=> start!56750 m!603979))

(declare-fun m!603981 () Bool)

(assert (=> b!628843 m!603981))

(assert (=> b!628843 m!603971))

(declare-fun m!603983 () Bool)

(assert (=> b!628851 m!603983))

(assert (=> b!628847 m!603971))

(assert (=> b!628847 m!603971))

(declare-fun m!603985 () Bool)

(assert (=> b!628847 m!603985))

(push 1)

