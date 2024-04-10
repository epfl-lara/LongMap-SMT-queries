; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56906 () Bool)

(assert start!56906)

(declare-fun b!630031 () Bool)

(declare-fun e!360281 () Bool)

(declare-fun e!360280 () Bool)

(assert (=> b!630031 (= e!360281 e!360280)))

(declare-fun res!407251 () Bool)

(assert (=> b!630031 (=> (not res!407251) (not e!360280))))

(declare-datatypes ((SeekEntryResult!6695 0))(
  ( (MissingZero!6695 (index!29067 (_ BitVec 32))) (Found!6695 (index!29068 (_ BitVec 32))) (Intermediate!6695 (undefined!7507 Bool) (index!29069 (_ BitVec 32)) (x!57808 (_ BitVec 32))) (Undefined!6695) (MissingVacant!6695 (index!29070 (_ BitVec 32))) )
))
(declare-fun lt!290991 () SeekEntryResult!6695)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630031 (= res!407251 (or (= lt!290991 (MissingZero!6695 i!1108)) (= lt!290991 (MissingVacant!6695 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38039 0))(
  ( (array!38040 (arr!18255 (Array (_ BitVec 32) (_ BitVec 64))) (size!18619 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38039)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38039 (_ BitVec 32)) SeekEntryResult!6695)

(assert (=> b!630031 (= lt!290991 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630032 () Bool)

(declare-fun res!407246 () Bool)

(assert (=> b!630032 (=> (not res!407246) (not e!360281))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630032 (= res!407246 (validKeyInArray!0 (select (arr!18255 a!2986) j!136)))))

(declare-fun b!630033 () Bool)

(declare-fun res!407247 () Bool)

(assert (=> b!630033 (=> (not res!407247) (not e!360280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38039 (_ BitVec 32)) Bool)

(assert (=> b!630033 (= res!407247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630034 () Bool)

(declare-fun res!407249 () Bool)

(assert (=> b!630034 (=> (not res!407249) (not e!360281))))

(assert (=> b!630034 (= res!407249 (and (= (size!18619 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18619 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18619 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630035 () Bool)

(declare-fun res!407248 () Bool)

(assert (=> b!630035 (=> (not res!407248) (not e!360281))))

(assert (=> b!630035 (= res!407248 (validKeyInArray!0 k!1786))))

(declare-fun b!630036 () Bool)

(declare-fun e!360278 () Bool)

(assert (=> b!630036 (= e!360278 (not true))))

(declare-fun e!360282 () Bool)

(assert (=> b!630036 e!360282))

(declare-fun res!407245 () Bool)

(assert (=> b!630036 (=> (not res!407245) (not e!360282))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290988 () (_ BitVec 32))

(declare-fun lt!290990 () SeekEntryResult!6695)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38039 (_ BitVec 32)) SeekEntryResult!6695)

(assert (=> b!630036 (= res!407245 (= lt!290990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290988 vacantSpotIndex!68 (select (store (arr!18255 a!2986) i!1108 k!1786) j!136) (array!38040 (store (arr!18255 a!2986) i!1108 k!1786) (size!18619 a!2986)) mask!3053)))))

(assert (=> b!630036 (= lt!290990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290988 vacantSpotIndex!68 (select (arr!18255 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21132 0))(
  ( (Unit!21133) )
))
(declare-fun lt!290992 () Unit!21132)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38039 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21132)

(assert (=> b!630036 (= lt!290992 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290988 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630036 (= lt!290988 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630037 () Bool)

(declare-fun res!407252 () Bool)

(assert (=> b!630037 (=> (not res!407252) (not e!360281))))

(declare-fun arrayContainsKey!0 (array!38039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630037 (= res!407252 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!407253 () Bool)

(assert (=> start!56906 (=> (not res!407253) (not e!360281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56906 (= res!407253 (validMask!0 mask!3053))))

(assert (=> start!56906 e!360281))

(assert (=> start!56906 true))

(declare-fun array_inv!14051 (array!38039) Bool)

(assert (=> start!56906 (array_inv!14051 a!2986)))

(declare-fun b!630038 () Bool)

(declare-fun res!407250 () Bool)

(assert (=> b!630038 (=> (not res!407250) (not e!360280))))

(assert (=> b!630038 (= res!407250 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18255 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18255 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630039 () Bool)

(assert (=> b!630039 (= e!360280 e!360278)))

(declare-fun res!407255 () Bool)

(assert (=> b!630039 (=> (not res!407255) (not e!360278))))

(declare-fun lt!290989 () SeekEntryResult!6695)

(assert (=> b!630039 (= res!407255 (and (= lt!290989 (Found!6695 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18255 a!2986) index!984) (select (arr!18255 a!2986) j!136))) (not (= (select (arr!18255 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630039 (= lt!290989 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18255 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630040 () Bool)

(assert (=> b!630040 (= e!360282 (= lt!290989 lt!290990))))

(declare-fun b!630041 () Bool)

(declare-fun res!407254 () Bool)

(assert (=> b!630041 (=> (not res!407254) (not e!360280))))

(declare-datatypes ((List!12296 0))(
  ( (Nil!12293) (Cons!12292 (h!13337 (_ BitVec 64)) (t!18524 List!12296)) )
))
(declare-fun arrayNoDuplicates!0 (array!38039 (_ BitVec 32) List!12296) Bool)

(assert (=> b!630041 (= res!407254 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12293))))

(assert (= (and start!56906 res!407253) b!630034))

(assert (= (and b!630034 res!407249) b!630032))

(assert (= (and b!630032 res!407246) b!630035))

(assert (= (and b!630035 res!407248) b!630037))

(assert (= (and b!630037 res!407252) b!630031))

(assert (= (and b!630031 res!407251) b!630033))

(assert (= (and b!630033 res!407247) b!630041))

(assert (= (and b!630041 res!407254) b!630038))

(assert (= (and b!630038 res!407250) b!630039))

(assert (= (and b!630039 res!407255) b!630036))

(assert (= (and b!630036 res!407245) b!630040))

(declare-fun m!605025 () Bool)

(assert (=> b!630036 m!605025))

(declare-fun m!605027 () Bool)

(assert (=> b!630036 m!605027))

(declare-fun m!605029 () Bool)

(assert (=> b!630036 m!605029))

(declare-fun m!605031 () Bool)

(assert (=> b!630036 m!605031))

(assert (=> b!630036 m!605029))

(declare-fun m!605033 () Bool)

(assert (=> b!630036 m!605033))

(declare-fun m!605035 () Bool)

(assert (=> b!630036 m!605035))

(assert (=> b!630036 m!605027))

(declare-fun m!605037 () Bool)

(assert (=> b!630036 m!605037))

(assert (=> b!630032 m!605029))

(assert (=> b!630032 m!605029))

(declare-fun m!605039 () Bool)

(assert (=> b!630032 m!605039))

(declare-fun m!605041 () Bool)

(assert (=> start!56906 m!605041))

(declare-fun m!605043 () Bool)

(assert (=> start!56906 m!605043))

(declare-fun m!605045 () Bool)

(assert (=> b!630033 m!605045))

(declare-fun m!605047 () Bool)

(assert (=> b!630037 m!605047))

(declare-fun m!605049 () Bool)

(assert (=> b!630031 m!605049))

(declare-fun m!605051 () Bool)

(assert (=> b!630039 m!605051))

(assert (=> b!630039 m!605029))

(assert (=> b!630039 m!605029))

(declare-fun m!605053 () Bool)

(assert (=> b!630039 m!605053))

(declare-fun m!605055 () Bool)

(assert (=> b!630035 m!605055))

(declare-fun m!605057 () Bool)

(assert (=> b!630038 m!605057))

(assert (=> b!630038 m!605031))

(declare-fun m!605059 () Bool)

(assert (=> b!630038 m!605059))

(declare-fun m!605061 () Bool)

(assert (=> b!630041 m!605061))

(push 1)

