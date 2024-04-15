; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53904 () Bool)

(assert start!53904)

(declare-fun b!588135 () Bool)

(declare-fun res!375915 () Bool)

(declare-fun e!335831 () Bool)

(assert (=> b!588135 (=> (not res!375915) (not e!335831))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588135 (= res!375915 (validKeyInArray!0 k0!1786))))

(declare-fun b!588136 () Bool)

(declare-fun res!375922 () Bool)

(declare-fun e!335834 () Bool)

(assert (=> b!588136 (=> (not res!375922) (not e!335834))))

(declare-datatypes ((array!36762 0))(
  ( (array!36763 (arr!17654 (Array (_ BitVec 32) (_ BitVec 64))) (size!18019 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36762)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36762 (_ BitVec 32)) Bool)

(assert (=> b!588136 (= res!375922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588137 () Bool)

(declare-fun res!375918 () Bool)

(assert (=> b!588137 (=> (not res!375918) (not e!335834))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588137 (= res!375918 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17654 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17654 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588138 () Bool)

(declare-fun e!335833 () Bool)

(assert (=> b!588138 (= e!335834 e!335833)))

(declare-fun res!375919 () Bool)

(assert (=> b!588138 (=> (not res!375919) (not e!335833))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6091 0))(
  ( (MissingZero!6091 (index!26594 (_ BitVec 32))) (Found!6091 (index!26595 (_ BitVec 32))) (Intermediate!6091 (undefined!6903 Bool) (index!26596 (_ BitVec 32)) (x!55404 (_ BitVec 32))) (Undefined!6091) (MissingVacant!6091 (index!26597 (_ BitVec 32))) )
))
(declare-fun lt!266542 () SeekEntryResult!6091)

(assert (=> b!588138 (= res!375919 (and (= lt!266542 (Found!6091 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17654 a!2986) index!984) (select (arr!17654 a!2986) j!136))) (not (= (select (arr!17654 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36762 (_ BitVec 32)) SeekEntryResult!6091)

(assert (=> b!588138 (= lt!266542 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17654 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588139 () Bool)

(assert (=> b!588139 (= e!335831 e!335834)))

(declare-fun res!375913 () Bool)

(assert (=> b!588139 (=> (not res!375913) (not e!335834))))

(declare-fun lt!266544 () SeekEntryResult!6091)

(assert (=> b!588139 (= res!375913 (or (= lt!266544 (MissingZero!6091 i!1108)) (= lt!266544 (MissingVacant!6091 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36762 (_ BitVec 32)) SeekEntryResult!6091)

(assert (=> b!588139 (= lt!266544 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588140 () Bool)

(assert (=> b!588140 (= e!335833 (not true))))

(declare-fun e!335835 () Bool)

(assert (=> b!588140 e!335835))

(declare-fun res!375914 () Bool)

(assert (=> b!588140 (=> (not res!375914) (not e!335835))))

(declare-fun lt!266545 () (_ BitVec 32))

(declare-fun lt!266543 () SeekEntryResult!6091)

(assert (=> b!588140 (= res!375914 (= lt!266543 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266545 vacantSpotIndex!68 (select (store (arr!17654 a!2986) i!1108 k0!1786) j!136) (array!36763 (store (arr!17654 a!2986) i!1108 k0!1786) (size!18019 a!2986)) mask!3053)))))

(assert (=> b!588140 (= lt!266543 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266545 vacantSpotIndex!68 (select (arr!17654 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18288 0))(
  ( (Unit!18289) )
))
(declare-fun lt!266541 () Unit!18288)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36762 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18288)

(assert (=> b!588140 (= lt!266541 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266545 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588140 (= lt!266545 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588141 () Bool)

(declare-fun res!375917 () Bool)

(assert (=> b!588141 (=> (not res!375917) (not e!335831))))

(declare-fun arrayContainsKey!0 (array!36762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588141 (= res!375917 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!375923 () Bool)

(assert (=> start!53904 (=> (not res!375923) (not e!335831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53904 (= res!375923 (validMask!0 mask!3053))))

(assert (=> start!53904 e!335831))

(assert (=> start!53904 true))

(declare-fun array_inv!13537 (array!36762) Bool)

(assert (=> start!53904 (array_inv!13537 a!2986)))

(declare-fun b!588142 () Bool)

(declare-fun res!375916 () Bool)

(assert (=> b!588142 (=> (not res!375916) (not e!335834))))

(declare-datatypes ((List!11734 0))(
  ( (Nil!11731) (Cons!11730 (h!12775 (_ BitVec 64)) (t!17953 List!11734)) )
))
(declare-fun arrayNoDuplicates!0 (array!36762 (_ BitVec 32) List!11734) Bool)

(assert (=> b!588142 (= res!375916 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11731))))

(declare-fun b!588143 () Bool)

(declare-fun res!375921 () Bool)

(assert (=> b!588143 (=> (not res!375921) (not e!335831))))

(assert (=> b!588143 (= res!375921 (validKeyInArray!0 (select (arr!17654 a!2986) j!136)))))

(declare-fun b!588144 () Bool)

(assert (=> b!588144 (= e!335835 (= lt!266542 lt!266543))))

(declare-fun b!588145 () Bool)

(declare-fun res!375920 () Bool)

(assert (=> b!588145 (=> (not res!375920) (not e!335831))))

(assert (=> b!588145 (= res!375920 (and (= (size!18019 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18019 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18019 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53904 res!375923) b!588145))

(assert (= (and b!588145 res!375920) b!588143))

(assert (= (and b!588143 res!375921) b!588135))

(assert (= (and b!588135 res!375915) b!588141))

(assert (= (and b!588141 res!375917) b!588139))

(assert (= (and b!588139 res!375913) b!588136))

(assert (= (and b!588136 res!375922) b!588142))

(assert (= (and b!588142 res!375916) b!588137))

(assert (= (and b!588137 res!375918) b!588138))

(assert (= (and b!588138 res!375919) b!588140))

(assert (= (and b!588140 res!375914) b!588144))

(declare-fun m!566167 () Bool)

(assert (=> b!588141 m!566167))

(declare-fun m!566169 () Bool)

(assert (=> b!588135 m!566169))

(declare-fun m!566171 () Bool)

(assert (=> b!588140 m!566171))

(declare-fun m!566173 () Bool)

(assert (=> b!588140 m!566173))

(declare-fun m!566175 () Bool)

(assert (=> b!588140 m!566175))

(declare-fun m!566177 () Bool)

(assert (=> b!588140 m!566177))

(declare-fun m!566179 () Bool)

(assert (=> b!588140 m!566179))

(assert (=> b!588140 m!566173))

(declare-fun m!566181 () Bool)

(assert (=> b!588140 m!566181))

(assert (=> b!588140 m!566177))

(declare-fun m!566183 () Bool)

(assert (=> b!588140 m!566183))

(declare-fun m!566185 () Bool)

(assert (=> start!53904 m!566185))

(declare-fun m!566187 () Bool)

(assert (=> start!53904 m!566187))

(assert (=> b!588143 m!566177))

(assert (=> b!588143 m!566177))

(declare-fun m!566189 () Bool)

(assert (=> b!588143 m!566189))

(declare-fun m!566191 () Bool)

(assert (=> b!588142 m!566191))

(declare-fun m!566193 () Bool)

(assert (=> b!588138 m!566193))

(assert (=> b!588138 m!566177))

(assert (=> b!588138 m!566177))

(declare-fun m!566195 () Bool)

(assert (=> b!588138 m!566195))

(declare-fun m!566197 () Bool)

(assert (=> b!588137 m!566197))

(assert (=> b!588137 m!566175))

(declare-fun m!566199 () Bool)

(assert (=> b!588137 m!566199))

(declare-fun m!566201 () Bool)

(assert (=> b!588139 m!566201))

(declare-fun m!566203 () Bool)

(assert (=> b!588136 m!566203))

(check-sat (not b!588139) (not b!588138) (not b!588136) (not b!588135) (not b!588143) (not b!588140) (not b!588141) (not start!53904) (not b!588142))
(check-sat)
