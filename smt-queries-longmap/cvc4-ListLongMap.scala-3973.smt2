; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53912 () Bool)

(assert start!53912)

(declare-fun b!588274 () Bool)

(declare-fun e!335949 () Bool)

(declare-fun e!335948 () Bool)

(assert (=> b!588274 (= e!335949 e!335948)))

(declare-fun res!375913 () Bool)

(assert (=> b!588274 (=> (not res!375913) (not e!335948))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6091 0))(
  ( (MissingZero!6091 (index!26594 (_ BitVec 32))) (Found!6091 (index!26595 (_ BitVec 32))) (Intermediate!6091 (undefined!6903 Bool) (index!26596 (_ BitVec 32)) (x!55393 (_ BitVec 32))) (Undefined!6091) (MissingVacant!6091 (index!26597 (_ BitVec 32))) )
))
(declare-fun lt!266718 () SeekEntryResult!6091)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36756 0))(
  ( (array!36757 (arr!17651 (Array (_ BitVec 32) (_ BitVec 64))) (size!18015 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36756)

(assert (=> b!588274 (= res!375913 (and (= lt!266718 (Found!6091 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17651 a!2986) index!984) (select (arr!17651 a!2986) j!136))) (not (= (select (arr!17651 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36756 (_ BitVec 32)) SeekEntryResult!6091)

(assert (=> b!588274 (= lt!266718 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17651 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588275 () Bool)

(declare-fun res!375917 () Bool)

(assert (=> b!588275 (=> (not res!375917) (not e!335949))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!588275 (= res!375917 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17651 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17651 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588276 () Bool)

(declare-fun e!335945 () Bool)

(assert (=> b!588276 (= e!335945 e!335949)))

(declare-fun res!375920 () Bool)

(assert (=> b!588276 (=> (not res!375920) (not e!335949))))

(declare-fun lt!266717 () SeekEntryResult!6091)

(assert (=> b!588276 (= res!375920 (or (= lt!266717 (MissingZero!6091 i!1108)) (= lt!266717 (MissingVacant!6091 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36756 (_ BitVec 32)) SeekEntryResult!6091)

(assert (=> b!588276 (= lt!266717 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588277 () Bool)

(declare-fun res!375911 () Bool)

(assert (=> b!588277 (=> (not res!375911) (not e!335945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588277 (= res!375911 (validKeyInArray!0 (select (arr!17651 a!2986) j!136)))))

(declare-fun b!588278 () Bool)

(declare-fun e!335947 () Bool)

(declare-fun lt!266719 () SeekEntryResult!6091)

(assert (=> b!588278 (= e!335947 (= lt!266718 lt!266719))))

(declare-fun b!588280 () Bool)

(declare-fun res!375915 () Bool)

(assert (=> b!588280 (=> (not res!375915) (not e!335945))))

(assert (=> b!588280 (= res!375915 (and (= (size!18015 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18015 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18015 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588279 () Bool)

(declare-fun res!375918 () Bool)

(assert (=> b!588279 (=> (not res!375918) (not e!335945))))

(assert (=> b!588279 (= res!375918 (validKeyInArray!0 k!1786))))

(declare-fun res!375914 () Bool)

(assert (=> start!53912 (=> (not res!375914) (not e!335945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53912 (= res!375914 (validMask!0 mask!3053))))

(assert (=> start!53912 e!335945))

(assert (=> start!53912 true))

(declare-fun array_inv!13447 (array!36756) Bool)

(assert (=> start!53912 (array_inv!13447 a!2986)))

(declare-fun b!588281 () Bool)

(declare-fun res!375912 () Bool)

(assert (=> b!588281 (=> (not res!375912) (not e!335945))))

(declare-fun arrayContainsKey!0 (array!36756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588281 (= res!375912 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588282 () Bool)

(assert (=> b!588282 (= e!335948 (not true))))

(assert (=> b!588282 e!335947))

(declare-fun res!375916 () Bool)

(assert (=> b!588282 (=> (not res!375916) (not e!335947))))

(declare-fun lt!266715 () (_ BitVec 32))

(assert (=> b!588282 (= res!375916 (= lt!266719 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266715 vacantSpotIndex!68 (select (store (arr!17651 a!2986) i!1108 k!1786) j!136) (array!36757 (store (arr!17651 a!2986) i!1108 k!1786) (size!18015 a!2986)) mask!3053)))))

(assert (=> b!588282 (= lt!266719 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266715 vacantSpotIndex!68 (select (arr!17651 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18302 0))(
  ( (Unit!18303) )
))
(declare-fun lt!266716 () Unit!18302)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36756 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18302)

(assert (=> b!588282 (= lt!266716 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266715 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588282 (= lt!266715 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588283 () Bool)

(declare-fun res!375910 () Bool)

(assert (=> b!588283 (=> (not res!375910) (not e!335949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36756 (_ BitVec 32)) Bool)

(assert (=> b!588283 (= res!375910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588284 () Bool)

(declare-fun res!375919 () Bool)

(assert (=> b!588284 (=> (not res!375919) (not e!335949))))

(declare-datatypes ((List!11692 0))(
  ( (Nil!11689) (Cons!11688 (h!12733 (_ BitVec 64)) (t!17920 List!11692)) )
))
(declare-fun arrayNoDuplicates!0 (array!36756 (_ BitVec 32) List!11692) Bool)

(assert (=> b!588284 (= res!375919 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11689))))

(assert (= (and start!53912 res!375914) b!588280))

(assert (= (and b!588280 res!375915) b!588277))

(assert (= (and b!588277 res!375911) b!588279))

(assert (= (and b!588279 res!375918) b!588281))

(assert (= (and b!588281 res!375912) b!588276))

(assert (= (and b!588276 res!375920) b!588283))

(assert (= (and b!588283 res!375910) b!588284))

(assert (= (and b!588284 res!375919) b!588275))

(assert (= (and b!588275 res!375917) b!588274))

(assert (= (and b!588274 res!375913) b!588282))

(assert (= (and b!588282 res!375916) b!588278))

(declare-fun m!566801 () Bool)

(assert (=> b!588281 m!566801))

(declare-fun m!566803 () Bool)

(assert (=> b!588276 m!566803))

(declare-fun m!566805 () Bool)

(assert (=> b!588283 m!566805))

(declare-fun m!566807 () Bool)

(assert (=> b!588277 m!566807))

(assert (=> b!588277 m!566807))

(declare-fun m!566809 () Bool)

(assert (=> b!588277 m!566809))

(declare-fun m!566811 () Bool)

(assert (=> b!588275 m!566811))

(declare-fun m!566813 () Bool)

(assert (=> b!588275 m!566813))

(declare-fun m!566815 () Bool)

(assert (=> b!588275 m!566815))

(declare-fun m!566817 () Bool)

(assert (=> b!588274 m!566817))

(assert (=> b!588274 m!566807))

(assert (=> b!588274 m!566807))

(declare-fun m!566819 () Bool)

(assert (=> b!588274 m!566819))

(declare-fun m!566821 () Bool)

(assert (=> start!53912 m!566821))

(declare-fun m!566823 () Bool)

(assert (=> start!53912 m!566823))

(declare-fun m!566825 () Bool)

(assert (=> b!588284 m!566825))

(declare-fun m!566827 () Bool)

(assert (=> b!588279 m!566827))

(declare-fun m!566829 () Bool)

(assert (=> b!588282 m!566829))

(declare-fun m!566831 () Bool)

(assert (=> b!588282 m!566831))

(assert (=> b!588282 m!566807))

(declare-fun m!566833 () Bool)

(assert (=> b!588282 m!566833))

(assert (=> b!588282 m!566807))

(assert (=> b!588282 m!566813))

(assert (=> b!588282 m!566831))

(declare-fun m!566835 () Bool)

(assert (=> b!588282 m!566835))

(declare-fun m!566837 () Bool)

(assert (=> b!588282 m!566837))

(push 1)

