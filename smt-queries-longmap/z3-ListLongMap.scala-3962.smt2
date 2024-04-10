; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53784 () Bool)

(assert start!53784)

(declare-fun b!586900 () Bool)

(declare-fun res!374726 () Bool)

(declare-fun e!335391 () Bool)

(assert (=> b!586900 (=> (not res!374726) (not e!335391))))

(declare-datatypes ((array!36685 0))(
  ( (array!36686 (arr!17617 (Array (_ BitVec 32) (_ BitVec 64))) (size!17981 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36685)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36685 (_ BitVec 32)) Bool)

(assert (=> b!586900 (= res!374726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586901 () Bool)

(declare-fun res!374723 () Bool)

(declare-fun e!335389 () Bool)

(assert (=> b!586901 (=> (not res!374723) (not e!335389))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586901 (= res!374723 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586902 () Bool)

(declare-fun res!374725 () Bool)

(assert (=> b!586902 (=> (not res!374725) (not e!335391))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586902 (= res!374725 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17617 a!2986) index!984) (select (arr!17617 a!2986) j!136))) (not (= (select (arr!17617 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586903 () Bool)

(declare-fun res!374717 () Bool)

(assert (=> b!586903 (=> (not res!374717) (not e!335389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586903 (= res!374717 (validKeyInArray!0 k0!1786))))

(declare-fun b!586904 () Bool)

(declare-fun res!374718 () Bool)

(assert (=> b!586904 (=> (not res!374718) (not e!335389))))

(assert (=> b!586904 (= res!374718 (validKeyInArray!0 (select (arr!17617 a!2986) j!136)))))

(declare-fun b!586905 () Bool)

(assert (=> b!586905 (= e!335391 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!266221 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6057 0))(
  ( (MissingZero!6057 (index!26455 (_ BitVec 32))) (Found!6057 (index!26456 (_ BitVec 32))) (Intermediate!6057 (undefined!6869 Bool) (index!26457 (_ BitVec 32)) (x!55262 (_ BitVec 32))) (Undefined!6057) (MissingVacant!6057 (index!26458 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36685 (_ BitVec 32)) SeekEntryResult!6057)

(assert (=> b!586905 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266221 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266221 vacantSpotIndex!68 (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136) (array!36686 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18234 0))(
  ( (Unit!18235) )
))
(declare-fun lt!266219 () Unit!18234)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36685 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18234)

(assert (=> b!586905 (= lt!266219 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266221 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586905 (= lt!266221 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586906 () Bool)

(declare-fun res!374720 () Bool)

(assert (=> b!586906 (=> (not res!374720) (not e!335391))))

(declare-datatypes ((List!11658 0))(
  ( (Nil!11655) (Cons!11654 (h!12699 (_ BitVec 64)) (t!17886 List!11658)) )
))
(declare-fun arrayNoDuplicates!0 (array!36685 (_ BitVec 32) List!11658) Bool)

(assert (=> b!586906 (= res!374720 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11655))))

(declare-fun res!374721 () Bool)

(assert (=> start!53784 (=> (not res!374721) (not e!335389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53784 (= res!374721 (validMask!0 mask!3053))))

(assert (=> start!53784 e!335389))

(assert (=> start!53784 true))

(declare-fun array_inv!13413 (array!36685) Bool)

(assert (=> start!53784 (array_inv!13413 a!2986)))

(declare-fun b!586907 () Bool)

(declare-fun res!374716 () Bool)

(assert (=> b!586907 (=> (not res!374716) (not e!335391))))

(assert (=> b!586907 (= res!374716 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) (Found!6057 j!136)))))

(declare-fun b!586908 () Bool)

(declare-fun res!374724 () Bool)

(assert (=> b!586908 (=> (not res!374724) (not e!335391))))

(assert (=> b!586908 (= res!374724 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17617 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17617 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586909 () Bool)

(assert (=> b!586909 (= e!335389 e!335391)))

(declare-fun res!374722 () Bool)

(assert (=> b!586909 (=> (not res!374722) (not e!335391))))

(declare-fun lt!266220 () SeekEntryResult!6057)

(assert (=> b!586909 (= res!374722 (or (= lt!266220 (MissingZero!6057 i!1108)) (= lt!266220 (MissingVacant!6057 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36685 (_ BitVec 32)) SeekEntryResult!6057)

(assert (=> b!586909 (= lt!266220 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586910 () Bool)

(declare-fun res!374719 () Bool)

(assert (=> b!586910 (=> (not res!374719) (not e!335389))))

(assert (=> b!586910 (= res!374719 (and (= (size!17981 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17981 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17981 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53784 res!374721) b!586910))

(assert (= (and b!586910 res!374719) b!586904))

(assert (= (and b!586904 res!374718) b!586903))

(assert (= (and b!586903 res!374717) b!586901))

(assert (= (and b!586901 res!374723) b!586909))

(assert (= (and b!586909 res!374722) b!586900))

(assert (= (and b!586900 res!374726) b!586906))

(assert (= (and b!586906 res!374720) b!586908))

(assert (= (and b!586908 res!374724) b!586907))

(assert (= (and b!586907 res!374716) b!586902))

(assert (= (and b!586902 res!374725) b!586905))

(declare-fun m!565329 () Bool)

(assert (=> b!586900 m!565329))

(declare-fun m!565331 () Bool)

(assert (=> b!586905 m!565331))

(declare-fun m!565333 () Bool)

(assert (=> b!586905 m!565333))

(declare-fun m!565335 () Bool)

(assert (=> b!586905 m!565335))

(assert (=> b!586905 m!565331))

(declare-fun m!565337 () Bool)

(assert (=> b!586905 m!565337))

(declare-fun m!565339 () Bool)

(assert (=> b!586905 m!565339))

(declare-fun m!565341 () Bool)

(assert (=> b!586905 m!565341))

(assert (=> b!586905 m!565337))

(declare-fun m!565343 () Bool)

(assert (=> b!586905 m!565343))

(declare-fun m!565345 () Bool)

(assert (=> b!586908 m!565345))

(assert (=> b!586908 m!565339))

(declare-fun m!565347 () Bool)

(assert (=> b!586908 m!565347))

(declare-fun m!565349 () Bool)

(assert (=> b!586909 m!565349))

(declare-fun m!565351 () Bool)

(assert (=> b!586903 m!565351))

(declare-fun m!565353 () Bool)

(assert (=> start!53784 m!565353))

(declare-fun m!565355 () Bool)

(assert (=> start!53784 m!565355))

(assert (=> b!586907 m!565337))

(assert (=> b!586907 m!565337))

(declare-fun m!565357 () Bool)

(assert (=> b!586907 m!565357))

(declare-fun m!565359 () Bool)

(assert (=> b!586906 m!565359))

(declare-fun m!565361 () Bool)

(assert (=> b!586902 m!565361))

(assert (=> b!586902 m!565337))

(assert (=> b!586904 m!565337))

(assert (=> b!586904 m!565337))

(declare-fun m!565363 () Bool)

(assert (=> b!586904 m!565363))

(declare-fun m!565365 () Bool)

(assert (=> b!586901 m!565365))

(check-sat (not start!53784) (not b!586904) (not b!586907) (not b!586909) (not b!586906) (not b!586901) (not b!586903) (not b!586905) (not b!586900))
(check-sat)
