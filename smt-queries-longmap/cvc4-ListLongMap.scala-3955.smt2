; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53744 () Bool)

(assert start!53744)

(declare-fun b!586240 () Bool)

(declare-fun e!335211 () Bool)

(assert (=> b!586240 (= e!335211 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36645 0))(
  ( (array!36646 (arr!17597 (Array (_ BitVec 32) (_ BitVec 64))) (size!17961 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36645)

(declare-fun lt!266040 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6037 0))(
  ( (MissingZero!6037 (index!26375 (_ BitVec 32))) (Found!6037 (index!26376 (_ BitVec 32))) (Intermediate!6037 (undefined!6849 Bool) (index!26377 (_ BitVec 32)) (x!55186 (_ BitVec 32))) (Undefined!6037) (MissingVacant!6037 (index!26378 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36645 (_ BitVec 32)) SeekEntryResult!6037)

(assert (=> b!586240 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266040 vacantSpotIndex!68 (select (arr!17597 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266040 vacantSpotIndex!68 (select (store (arr!17597 a!2986) i!1108 k!1786) j!136) (array!36646 (store (arr!17597 a!2986) i!1108 k!1786) (size!17961 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18194 0))(
  ( (Unit!18195) )
))
(declare-fun lt!266041 () Unit!18194)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36645 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18194)

(assert (=> b!586240 (= lt!266041 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266040 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586240 (= lt!266040 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586241 () Bool)

(declare-fun res!374058 () Bool)

(declare-fun e!335209 () Bool)

(assert (=> b!586241 (=> (not res!374058) (not e!335209))))

(assert (=> b!586241 (= res!374058 (and (= (size!17961 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17961 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17961 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586242 () Bool)

(assert (=> b!586242 (= e!335209 e!335211)))

(declare-fun res!374066 () Bool)

(assert (=> b!586242 (=> (not res!374066) (not e!335211))))

(declare-fun lt!266039 () SeekEntryResult!6037)

(assert (=> b!586242 (= res!374066 (or (= lt!266039 (MissingZero!6037 i!1108)) (= lt!266039 (MissingVacant!6037 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36645 (_ BitVec 32)) SeekEntryResult!6037)

(assert (=> b!586242 (= lt!266039 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586244 () Bool)

(declare-fun res!374056 () Bool)

(assert (=> b!586244 (=> (not res!374056) (not e!335211))))

(assert (=> b!586244 (= res!374056 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17597 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17597 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586245 () Bool)

(declare-fun res!374057 () Bool)

(assert (=> b!586245 (=> (not res!374057) (not e!335211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36645 (_ BitVec 32)) Bool)

(assert (=> b!586245 (= res!374057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586246 () Bool)

(declare-fun res!374059 () Bool)

(assert (=> b!586246 (=> (not res!374059) (not e!335211))))

(declare-datatypes ((List!11638 0))(
  ( (Nil!11635) (Cons!11634 (h!12679 (_ BitVec 64)) (t!17866 List!11638)) )
))
(declare-fun arrayNoDuplicates!0 (array!36645 (_ BitVec 32) List!11638) Bool)

(assert (=> b!586246 (= res!374059 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11635))))

(declare-fun b!586243 () Bool)

(declare-fun res!374062 () Bool)

(assert (=> b!586243 (=> (not res!374062) (not e!335209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586243 (= res!374062 (validKeyInArray!0 k!1786))))

(declare-fun res!374063 () Bool)

(assert (=> start!53744 (=> (not res!374063) (not e!335209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53744 (= res!374063 (validMask!0 mask!3053))))

(assert (=> start!53744 e!335209))

(assert (=> start!53744 true))

(declare-fun array_inv!13393 (array!36645) Bool)

(assert (=> start!53744 (array_inv!13393 a!2986)))

(declare-fun b!586247 () Bool)

(declare-fun res!374061 () Bool)

(assert (=> b!586247 (=> (not res!374061) (not e!335209))))

(assert (=> b!586247 (= res!374061 (validKeyInArray!0 (select (arr!17597 a!2986) j!136)))))

(declare-fun b!586248 () Bool)

(declare-fun res!374065 () Bool)

(assert (=> b!586248 (=> (not res!374065) (not e!335211))))

(assert (=> b!586248 (= res!374065 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17597 a!2986) j!136) a!2986 mask!3053) (Found!6037 j!136)))))

(declare-fun b!586249 () Bool)

(declare-fun res!374060 () Bool)

(assert (=> b!586249 (=> (not res!374060) (not e!335209))))

(declare-fun arrayContainsKey!0 (array!36645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586249 (= res!374060 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586250 () Bool)

(declare-fun res!374064 () Bool)

(assert (=> b!586250 (=> (not res!374064) (not e!335211))))

(assert (=> b!586250 (= res!374064 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17597 a!2986) index!984) (select (arr!17597 a!2986) j!136))) (not (= (select (arr!17597 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53744 res!374063) b!586241))

(assert (= (and b!586241 res!374058) b!586247))

(assert (= (and b!586247 res!374061) b!586243))

(assert (= (and b!586243 res!374062) b!586249))

(assert (= (and b!586249 res!374060) b!586242))

(assert (= (and b!586242 res!374066) b!586245))

(assert (= (and b!586245 res!374057) b!586246))

(assert (= (and b!586246 res!374059) b!586244))

(assert (= (and b!586244 res!374056) b!586248))

(assert (= (and b!586248 res!374065) b!586250))

(assert (= (and b!586250 res!374064) b!586240))

(declare-fun m!564569 () Bool)

(assert (=> b!586249 m!564569))

(declare-fun m!564571 () Bool)

(assert (=> b!586244 m!564571))

(declare-fun m!564573 () Bool)

(assert (=> b!586244 m!564573))

(declare-fun m!564575 () Bool)

(assert (=> b!586244 m!564575))

(declare-fun m!564577 () Bool)

(assert (=> b!586245 m!564577))

(declare-fun m!564579 () Bool)

(assert (=> b!586247 m!564579))

(assert (=> b!586247 m!564579))

(declare-fun m!564581 () Bool)

(assert (=> b!586247 m!564581))

(declare-fun m!564583 () Bool)

(assert (=> b!586243 m!564583))

(declare-fun m!564585 () Bool)

(assert (=> b!586242 m!564585))

(declare-fun m!564587 () Bool)

(assert (=> b!586246 m!564587))

(declare-fun m!564589 () Bool)

(assert (=> b!586250 m!564589))

(assert (=> b!586250 m!564579))

(declare-fun m!564591 () Bool)

(assert (=> start!53744 m!564591))

(declare-fun m!564593 () Bool)

(assert (=> start!53744 m!564593))

(declare-fun m!564595 () Bool)

(assert (=> b!586240 m!564595))

(declare-fun m!564597 () Bool)

(assert (=> b!586240 m!564597))

(declare-fun m!564599 () Bool)

(assert (=> b!586240 m!564599))

(assert (=> b!586240 m!564579))

(assert (=> b!586240 m!564573))

(assert (=> b!586240 m!564597))

(declare-fun m!564601 () Bool)

(assert (=> b!586240 m!564601))

(assert (=> b!586240 m!564579))

(declare-fun m!564603 () Bool)

(assert (=> b!586240 m!564603))

(assert (=> b!586248 m!564579))

(assert (=> b!586248 m!564579))

(declare-fun m!564605 () Bool)

(assert (=> b!586248 m!564605))

(push 1)

