; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53878 () Bool)

(assert start!53878)

(declare-fun b!587713 () Bool)

(declare-fun res!375353 () Bool)

(declare-fun e!335706 () Bool)

(assert (=> b!587713 (=> (not res!375353) (not e!335706))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36722 0))(
  ( (array!36723 (arr!17634 (Array (_ BitVec 32) (_ BitVec 64))) (size!17998 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36722)

(assert (=> b!587713 (= res!375353 (and (= (size!17998 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17998 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17998 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587714 () Bool)

(declare-fun e!335705 () Bool)

(assert (=> b!587714 (= e!335705 (not true))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266474 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6074 0))(
  ( (MissingZero!6074 (index!26526 (_ BitVec 32))) (Found!6074 (index!26527 (_ BitVec 32))) (Intermediate!6074 (undefined!6886 Bool) (index!26528 (_ BitVec 32)) (x!55336 (_ BitVec 32))) (Undefined!6074) (MissingVacant!6074 (index!26529 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36722 (_ BitVec 32)) SeekEntryResult!6074)

(assert (=> b!587714 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266474 vacantSpotIndex!68 (select (arr!17634 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266474 vacantSpotIndex!68 (select (store (arr!17634 a!2986) i!1108 k!1786) j!136) (array!36723 (store (arr!17634 a!2986) i!1108 k!1786) (size!17998 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18268 0))(
  ( (Unit!18269) )
))
(declare-fun lt!266476 () Unit!18268)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36722 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18268)

(assert (=> b!587714 (= lt!266476 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266474 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587714 (= lt!266474 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587715 () Bool)

(declare-fun res!375352 () Bool)

(assert (=> b!587715 (=> (not res!375352) (not e!335706))))

(declare-fun arrayContainsKey!0 (array!36722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587715 (= res!375352 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587716 () Bool)

(declare-fun res!375357 () Bool)

(assert (=> b!587716 (=> (not res!375357) (not e!335705))))

(assert (=> b!587716 (= res!375357 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17634 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17634 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587717 () Bool)

(assert (=> b!587717 (= e!335706 e!335705)))

(declare-fun res!375355 () Bool)

(assert (=> b!587717 (=> (not res!375355) (not e!335705))))

(declare-fun lt!266475 () SeekEntryResult!6074)

(assert (=> b!587717 (= res!375355 (or (= lt!266475 (MissingZero!6074 i!1108)) (= lt!266475 (MissingVacant!6074 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36722 (_ BitVec 32)) SeekEntryResult!6074)

(assert (=> b!587717 (= lt!266475 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587718 () Bool)

(declare-fun res!375349 () Bool)

(assert (=> b!587718 (=> (not res!375349) (not e!335705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36722 (_ BitVec 32)) Bool)

(assert (=> b!587718 (= res!375349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587719 () Bool)

(declare-fun res!375359 () Bool)

(assert (=> b!587719 (=> (not res!375359) (not e!335705))))

(declare-datatypes ((List!11675 0))(
  ( (Nil!11672) (Cons!11671 (h!12716 (_ BitVec 64)) (t!17903 List!11675)) )
))
(declare-fun arrayNoDuplicates!0 (array!36722 (_ BitVec 32) List!11675) Bool)

(assert (=> b!587719 (= res!375359 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11672))))

(declare-fun b!587720 () Bool)

(declare-fun res!375356 () Bool)

(assert (=> b!587720 (=> (not res!375356) (not e!335705))))

(assert (=> b!587720 (= res!375356 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17634 a!2986) index!984) (select (arr!17634 a!2986) j!136))) (not (= (select (arr!17634 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587722 () Bool)

(declare-fun res!375354 () Bool)

(assert (=> b!587722 (=> (not res!375354) (not e!335706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587722 (= res!375354 (validKeyInArray!0 (select (arr!17634 a!2986) j!136)))))

(declare-fun b!587723 () Bool)

(declare-fun res!375351 () Bool)

(assert (=> b!587723 (=> (not res!375351) (not e!335705))))

(assert (=> b!587723 (= res!375351 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17634 a!2986) j!136) a!2986 mask!3053) (Found!6074 j!136)))))

(declare-fun res!375358 () Bool)

(assert (=> start!53878 (=> (not res!375358) (not e!335706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53878 (= res!375358 (validMask!0 mask!3053))))

(assert (=> start!53878 e!335706))

(assert (=> start!53878 true))

(declare-fun array_inv!13430 (array!36722) Bool)

(assert (=> start!53878 (array_inv!13430 a!2986)))

(declare-fun b!587721 () Bool)

(declare-fun res!375350 () Bool)

(assert (=> b!587721 (=> (not res!375350) (not e!335706))))

(assert (=> b!587721 (= res!375350 (validKeyInArray!0 k!1786))))

(assert (= (and start!53878 res!375358) b!587713))

(assert (= (and b!587713 res!375353) b!587722))

(assert (= (and b!587722 res!375354) b!587721))

(assert (= (and b!587721 res!375350) b!587715))

(assert (= (and b!587715 res!375352) b!587717))

(assert (= (and b!587717 res!375355) b!587718))

(assert (= (and b!587718 res!375349) b!587719))

(assert (= (and b!587719 res!375359) b!587716))

(assert (= (and b!587716 res!375357) b!587723))

(assert (= (and b!587723 res!375351) b!587720))

(assert (= (and b!587720 res!375356) b!587714))

(declare-fun m!566155 () Bool)

(assert (=> b!587715 m!566155))

(declare-fun m!566157 () Bool)

(assert (=> b!587714 m!566157))

(declare-fun m!566159 () Bool)

(assert (=> b!587714 m!566159))

(declare-fun m!566161 () Bool)

(assert (=> b!587714 m!566161))

(declare-fun m!566163 () Bool)

(assert (=> b!587714 m!566163))

(assert (=> b!587714 m!566159))

(declare-fun m!566165 () Bool)

(assert (=> b!587714 m!566165))

(declare-fun m!566167 () Bool)

(assert (=> b!587714 m!566167))

(declare-fun m!566169 () Bool)

(assert (=> b!587714 m!566169))

(assert (=> b!587714 m!566167))

(declare-fun m!566171 () Bool)

(assert (=> b!587719 m!566171))

(declare-fun m!566173 () Bool)

(assert (=> b!587716 m!566173))

(assert (=> b!587716 m!566161))

(declare-fun m!566175 () Bool)

(assert (=> b!587716 m!566175))

(declare-fun m!566177 () Bool)

(assert (=> b!587721 m!566177))

(assert (=> b!587722 m!566159))

(assert (=> b!587722 m!566159))

(declare-fun m!566179 () Bool)

(assert (=> b!587722 m!566179))

(declare-fun m!566181 () Bool)

(assert (=> b!587717 m!566181))

(declare-fun m!566183 () Bool)

(assert (=> start!53878 m!566183))

(declare-fun m!566185 () Bool)

(assert (=> start!53878 m!566185))

(declare-fun m!566187 () Bool)

(assert (=> b!587718 m!566187))

(assert (=> b!587723 m!566159))

(assert (=> b!587723 m!566159))

(declare-fun m!566189 () Bool)

(assert (=> b!587723 m!566189))

(declare-fun m!566191 () Bool)

(assert (=> b!587720 m!566191))

(assert (=> b!587720 m!566159))

(push 1)

