; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53458 () Bool)

(assert start!53458)

(declare-fun b!581715 () Bool)

(declare-fun res!369535 () Bool)

(declare-fun e!333752 () Bool)

(assert (=> b!581715 (=> (not res!369535) (not e!333752))))

(declare-datatypes ((array!36359 0))(
  ( (array!36360 (arr!17454 (Array (_ BitVec 32) (_ BitVec 64))) (size!17818 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36359)

(declare-datatypes ((List!11495 0))(
  ( (Nil!11492) (Cons!11491 (h!12536 (_ BitVec 64)) (t!17723 List!11495)) )
))
(declare-fun arrayNoDuplicates!0 (array!36359 (_ BitVec 32) List!11495) Bool)

(assert (=> b!581715 (= res!369535 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11492))))

(declare-fun b!581716 () Bool)

(declare-fun res!369533 () Bool)

(declare-fun e!333751 () Bool)

(assert (=> b!581716 (=> (not res!369533) (not e!333751))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581716 (= res!369533 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!369536 () Bool)

(assert (=> start!53458 (=> (not res!369536) (not e!333751))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53458 (= res!369536 (validMask!0 mask!3053))))

(assert (=> start!53458 e!333751))

(assert (=> start!53458 true))

(declare-fun array_inv!13250 (array!36359) Bool)

(assert (=> start!53458 (array_inv!13250 a!2986)))

(declare-fun b!581717 () Bool)

(declare-fun res!369534 () Bool)

(assert (=> b!581717 (=> (not res!369534) (not e!333751))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581717 (= res!369534 (and (= (size!17818 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17818 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17818 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581718 () Bool)

(declare-fun res!369531 () Bool)

(assert (=> b!581718 (=> (not res!369531) (not e!333752))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581718 (= res!369531 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17454 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17454 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581719 () Bool)

(declare-fun res!369532 () Bool)

(assert (=> b!581719 (=> (not res!369532) (not e!333751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581719 (= res!369532 (validKeyInArray!0 (select (arr!17454 a!2986) j!136)))))

(declare-fun b!581720 () Bool)

(assert (=> b!581720 (= e!333751 e!333752)))

(declare-fun res!369539 () Bool)

(assert (=> b!581720 (=> (not res!369539) (not e!333752))))

(declare-datatypes ((SeekEntryResult!5894 0))(
  ( (MissingZero!5894 (index!25803 (_ BitVec 32))) (Found!5894 (index!25804 (_ BitVec 32))) (Intermediate!5894 (undefined!6706 Bool) (index!25805 (_ BitVec 32)) (x!54667 (_ BitVec 32))) (Undefined!5894) (MissingVacant!5894 (index!25806 (_ BitVec 32))) )
))
(declare-fun lt!264967 () SeekEntryResult!5894)

(assert (=> b!581720 (= res!369539 (or (= lt!264967 (MissingZero!5894 i!1108)) (= lt!264967 (MissingVacant!5894 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36359 (_ BitVec 32)) SeekEntryResult!5894)

(assert (=> b!581720 (= lt!264967 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581721 () Bool)

(declare-fun res!369538 () Bool)

(assert (=> b!581721 (=> (not res!369538) (not e!333751))))

(assert (=> b!581721 (= res!369538 (validKeyInArray!0 k!1786))))

(declare-fun b!581722 () Bool)

(assert (=> b!581722 (= e!333752 false)))

(declare-fun lt!264966 () SeekEntryResult!5894)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36359 (_ BitVec 32)) SeekEntryResult!5894)

(assert (=> b!581722 (= lt!264966 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581723 () Bool)

(declare-fun res!369537 () Bool)

(assert (=> b!581723 (=> (not res!369537) (not e!333752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36359 (_ BitVec 32)) Bool)

(assert (=> b!581723 (= res!369537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53458 res!369536) b!581717))

(assert (= (and b!581717 res!369534) b!581719))

(assert (= (and b!581719 res!369532) b!581721))

(assert (= (and b!581721 res!369538) b!581716))

(assert (= (and b!581716 res!369533) b!581720))

(assert (= (and b!581720 res!369539) b!581723))

(assert (= (and b!581723 res!369537) b!581715))

(assert (= (and b!581715 res!369535) b!581718))

(assert (= (and b!581718 res!369531) b!581722))

(declare-fun m!560245 () Bool)

(assert (=> b!581720 m!560245))

(declare-fun m!560247 () Bool)

(assert (=> b!581722 m!560247))

(assert (=> b!581722 m!560247))

(declare-fun m!560249 () Bool)

(assert (=> b!581722 m!560249))

(declare-fun m!560251 () Bool)

(assert (=> b!581718 m!560251))

(declare-fun m!560253 () Bool)

(assert (=> b!581718 m!560253))

(declare-fun m!560255 () Bool)

(assert (=> b!581718 m!560255))

(assert (=> b!581719 m!560247))

(assert (=> b!581719 m!560247))

(declare-fun m!560257 () Bool)

(assert (=> b!581719 m!560257))

(declare-fun m!560259 () Bool)

(assert (=> b!581723 m!560259))

(declare-fun m!560261 () Bool)

(assert (=> start!53458 m!560261))

(declare-fun m!560263 () Bool)

(assert (=> start!53458 m!560263))

(declare-fun m!560265 () Bool)

(assert (=> b!581721 m!560265))

(declare-fun m!560267 () Bool)

(assert (=> b!581716 m!560267))

(declare-fun m!560269 () Bool)

(assert (=> b!581715 m!560269))

(push 1)

