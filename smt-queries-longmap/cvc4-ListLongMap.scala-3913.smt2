; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53492 () Bool)

(assert start!53492)

(declare-fun b!582192 () Bool)

(declare-fun e!333904 () Bool)

(assert (=> b!582192 (= e!333904 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5911 0))(
  ( (MissingZero!5911 (index!25871 (_ BitVec 32))) (Found!5911 (index!25872 (_ BitVec 32))) (Intermediate!5911 (undefined!6723 Bool) (index!25873 (_ BitVec 32)) (x!54724 (_ BitVec 32))) (Undefined!5911) (MissingVacant!5911 (index!25874 (_ BitVec 32))) )
))
(declare-fun lt!265059 () SeekEntryResult!5911)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36393 0))(
  ( (array!36394 (arr!17471 (Array (_ BitVec 32) (_ BitVec 64))) (size!17835 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36393)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36393 (_ BitVec 32)) SeekEntryResult!5911)

(assert (=> b!582192 (= lt!265059 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17471 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370013 () Bool)

(declare-fun e!333906 () Bool)

(assert (=> start!53492 (=> (not res!370013) (not e!333906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53492 (= res!370013 (validMask!0 mask!3053))))

(assert (=> start!53492 e!333906))

(assert (=> start!53492 true))

(declare-fun array_inv!13267 (array!36393) Bool)

(assert (=> start!53492 (array_inv!13267 a!2986)))

(declare-fun b!582193 () Bool)

(declare-fun res!370015 () Bool)

(assert (=> b!582193 (=> (not res!370015) (not e!333906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582193 (= res!370015 (validKeyInArray!0 (select (arr!17471 a!2986) j!136)))))

(declare-fun b!582194 () Bool)

(declare-fun res!370009 () Bool)

(assert (=> b!582194 (=> (not res!370009) (not e!333904))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!582194 (= res!370009 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17471 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17471 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582195 () Bool)

(declare-fun res!370012 () Bool)

(assert (=> b!582195 (=> (not res!370012) (not e!333906))))

(assert (=> b!582195 (= res!370012 (and (= (size!17835 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17835 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17835 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582196 () Bool)

(declare-fun res!370014 () Bool)

(assert (=> b!582196 (=> (not res!370014) (not e!333906))))

(assert (=> b!582196 (= res!370014 (validKeyInArray!0 k!1786))))

(declare-fun b!582197 () Bool)

(declare-fun res!370008 () Bool)

(assert (=> b!582197 (=> (not res!370008) (not e!333904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36393 (_ BitVec 32)) Bool)

(assert (=> b!582197 (= res!370008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582198 () Bool)

(declare-fun res!370016 () Bool)

(assert (=> b!582198 (=> (not res!370016) (not e!333904))))

(declare-datatypes ((List!11512 0))(
  ( (Nil!11509) (Cons!11508 (h!12553 (_ BitVec 64)) (t!17740 List!11512)) )
))
(declare-fun arrayNoDuplicates!0 (array!36393 (_ BitVec 32) List!11512) Bool)

(assert (=> b!582198 (= res!370016 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11509))))

(declare-fun b!582199 () Bool)

(declare-fun res!370010 () Bool)

(assert (=> b!582199 (=> (not res!370010) (not e!333906))))

(declare-fun arrayContainsKey!0 (array!36393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582199 (= res!370010 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582200 () Bool)

(assert (=> b!582200 (= e!333906 e!333904)))

(declare-fun res!370011 () Bool)

(assert (=> b!582200 (=> (not res!370011) (not e!333904))))

(declare-fun lt!265060 () SeekEntryResult!5911)

(assert (=> b!582200 (= res!370011 (or (= lt!265060 (MissingZero!5911 i!1108)) (= lt!265060 (MissingVacant!5911 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36393 (_ BitVec 32)) SeekEntryResult!5911)

(assert (=> b!582200 (= lt!265060 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53492 res!370013) b!582195))

(assert (= (and b!582195 res!370012) b!582193))

(assert (= (and b!582193 res!370015) b!582196))

(assert (= (and b!582196 res!370014) b!582199))

(assert (= (and b!582199 res!370010) b!582200))

(assert (= (and b!582200 res!370011) b!582197))

(assert (= (and b!582197 res!370008) b!582198))

(assert (= (and b!582198 res!370016) b!582194))

(assert (= (and b!582194 res!370009) b!582192))

(declare-fun m!560705 () Bool)

(assert (=> b!582193 m!560705))

(assert (=> b!582193 m!560705))

(declare-fun m!560707 () Bool)

(assert (=> b!582193 m!560707))

(declare-fun m!560709 () Bool)

(assert (=> b!582198 m!560709))

(declare-fun m!560711 () Bool)

(assert (=> b!582194 m!560711))

(declare-fun m!560713 () Bool)

(assert (=> b!582194 m!560713))

(declare-fun m!560715 () Bool)

(assert (=> b!582194 m!560715))

(declare-fun m!560717 () Bool)

(assert (=> start!53492 m!560717))

(declare-fun m!560719 () Bool)

(assert (=> start!53492 m!560719))

(assert (=> b!582192 m!560705))

(assert (=> b!582192 m!560705))

(declare-fun m!560721 () Bool)

(assert (=> b!582192 m!560721))

(declare-fun m!560723 () Bool)

(assert (=> b!582197 m!560723))

(declare-fun m!560725 () Bool)

(assert (=> b!582200 m!560725))

(declare-fun m!560727 () Bool)

(assert (=> b!582196 m!560727))

(declare-fun m!560729 () Bool)

(assert (=> b!582199 m!560729))

(push 1)

