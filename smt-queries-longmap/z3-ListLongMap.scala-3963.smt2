; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53838 () Bool)

(assert start!53838)

(declare-fun b!587175 () Bool)

(declare-fun res!374889 () Bool)

(declare-fun e!335536 () Bool)

(assert (=> b!587175 (=> (not res!374889) (not e!335536))))

(declare-datatypes ((array!36684 0))(
  ( (array!36685 (arr!17614 (Array (_ BitVec 32) (_ BitVec 64))) (size!17978 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36684)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587175 (= res!374889 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587176 () Bool)

(declare-fun res!374891 () Bool)

(declare-fun e!335537 () Bool)

(assert (=> b!587176 (=> (not res!374891) (not e!335537))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36684 (_ BitVec 32)) Bool)

(assert (=> b!587176 (= res!374891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587177 () Bool)

(declare-fun res!374894 () Bool)

(assert (=> b!587177 (=> (not res!374894) (not e!335537))))

(declare-datatypes ((List!11562 0))(
  ( (Nil!11559) (Cons!11558 (h!12606 (_ BitVec 64)) (t!17782 List!11562)) )
))
(declare-fun arrayNoDuplicates!0 (array!36684 (_ BitVec 32) List!11562) Bool)

(assert (=> b!587177 (= res!374894 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11559))))

(declare-fun b!587178 () Bool)

(declare-fun res!374896 () Bool)

(assert (=> b!587178 (=> (not res!374896) (not e!335536))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587178 (= res!374896 (validKeyInArray!0 (select (arr!17614 a!2986) j!136)))))

(declare-fun b!587179 () Bool)

(declare-fun res!374892 () Bool)

(assert (=> b!587179 (=> (not res!374892) (not e!335536))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587179 (= res!374892 (and (= (size!17978 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17978 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17978 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!374890 () Bool)

(assert (=> start!53838 (=> (not res!374890) (not e!335536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53838 (= res!374890 (validMask!0 mask!3053))))

(assert (=> start!53838 e!335536))

(assert (=> start!53838 true))

(declare-fun array_inv!13473 (array!36684) Bool)

(assert (=> start!53838 (array_inv!13473 a!2986)))

(declare-fun b!587180 () Bool)

(declare-fun res!374886 () Bool)

(assert (=> b!587180 (=> (not res!374886) (not e!335537))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6010 0))(
  ( (MissingZero!6010 (index!26267 (_ BitVec 32))) (Found!6010 (index!26268 (_ BitVec 32))) (Intermediate!6010 (undefined!6822 Bool) (index!26269 (_ BitVec 32)) (x!55226 (_ BitVec 32))) (Undefined!6010) (MissingVacant!6010 (index!26270 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36684 (_ BitVec 32)) SeekEntryResult!6010)

(assert (=> b!587180 (= res!374886 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17614 a!2986) j!136) a!2986 mask!3053) (Found!6010 j!136)))))

(declare-fun b!587181 () Bool)

(assert (=> b!587181 (= e!335536 e!335537)))

(declare-fun res!374887 () Bool)

(assert (=> b!587181 (=> (not res!374887) (not e!335537))))

(declare-fun lt!266341 () SeekEntryResult!6010)

(assert (=> b!587181 (= res!374887 (or (= lt!266341 (MissingZero!6010 i!1108)) (= lt!266341 (MissingVacant!6010 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36684 (_ BitVec 32)) SeekEntryResult!6010)

(assert (=> b!587181 (= lt!266341 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587182 () Bool)

(assert (=> b!587182 (= e!335537 (not true))))

(declare-fun lt!266340 () (_ BitVec 32))

(assert (=> b!587182 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266340 vacantSpotIndex!68 (select (arr!17614 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266340 vacantSpotIndex!68 (select (store (arr!17614 a!2986) i!1108 k0!1786) j!136) (array!36685 (store (arr!17614 a!2986) i!1108 k0!1786) (size!17978 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18217 0))(
  ( (Unit!18218) )
))
(declare-fun lt!266339 () Unit!18217)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36684 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18217)

(assert (=> b!587182 (= lt!266339 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266340 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587182 (= lt!266340 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!587183 () Bool)

(declare-fun res!374893 () Bool)

(assert (=> b!587183 (=> (not res!374893) (not e!335536))))

(assert (=> b!587183 (= res!374893 (validKeyInArray!0 k0!1786))))

(declare-fun b!587184 () Bool)

(declare-fun res!374895 () Bool)

(assert (=> b!587184 (=> (not res!374895) (not e!335537))))

(assert (=> b!587184 (= res!374895 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17614 a!2986) index!984) (select (arr!17614 a!2986) j!136))) (not (= (select (arr!17614 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587185 () Bool)

(declare-fun res!374888 () Bool)

(assert (=> b!587185 (=> (not res!374888) (not e!335537))))

(assert (=> b!587185 (= res!374888 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17614 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17614 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53838 res!374890) b!587179))

(assert (= (and b!587179 res!374892) b!587178))

(assert (= (and b!587178 res!374896) b!587183))

(assert (= (and b!587183 res!374893) b!587175))

(assert (= (and b!587175 res!374889) b!587181))

(assert (= (and b!587181 res!374887) b!587176))

(assert (= (and b!587176 res!374891) b!587177))

(assert (= (and b!587177 res!374894) b!587185))

(assert (= (and b!587185 res!374888) b!587180))

(assert (= (and b!587180 res!374886) b!587184))

(assert (= (and b!587184 res!374895) b!587182))

(declare-fun m!565763 () Bool)

(assert (=> b!587178 m!565763))

(assert (=> b!587178 m!565763))

(declare-fun m!565765 () Bool)

(assert (=> b!587178 m!565765))

(assert (=> b!587180 m!565763))

(assert (=> b!587180 m!565763))

(declare-fun m!565767 () Bool)

(assert (=> b!587180 m!565767))

(declare-fun m!565769 () Bool)

(assert (=> b!587181 m!565769))

(declare-fun m!565771 () Bool)

(assert (=> b!587184 m!565771))

(assert (=> b!587184 m!565763))

(declare-fun m!565773 () Bool)

(assert (=> b!587175 m!565773))

(assert (=> b!587182 m!565763))

(declare-fun m!565775 () Bool)

(assert (=> b!587182 m!565775))

(declare-fun m!565777 () Bool)

(assert (=> b!587182 m!565777))

(assert (=> b!587182 m!565763))

(declare-fun m!565779 () Bool)

(assert (=> b!587182 m!565779))

(declare-fun m!565781 () Bool)

(assert (=> b!587182 m!565781))

(declare-fun m!565783 () Bool)

(assert (=> b!587182 m!565783))

(assert (=> b!587182 m!565783))

(declare-fun m!565785 () Bool)

(assert (=> b!587182 m!565785))

(declare-fun m!565787 () Bool)

(assert (=> b!587176 m!565787))

(declare-fun m!565789 () Bool)

(assert (=> start!53838 m!565789))

(declare-fun m!565791 () Bool)

(assert (=> start!53838 m!565791))

(declare-fun m!565793 () Bool)

(assert (=> b!587183 m!565793))

(declare-fun m!565795 () Bool)

(assert (=> b!587185 m!565795))

(assert (=> b!587185 m!565779))

(declare-fun m!565797 () Bool)

(assert (=> b!587185 m!565797))

(declare-fun m!565799 () Bool)

(assert (=> b!587177 m!565799))

(check-sat (not b!587180) (not b!587177) (not b!587181) (not b!587182) (not b!587176) (not start!53838) (not b!587183) (not b!587178) (not b!587175))
(check-sat)
