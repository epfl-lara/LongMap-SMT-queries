; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53428 () Bool)

(assert start!53428)

(declare-fun b!581303 () Bool)

(declare-fun res!369121 () Bool)

(declare-fun e!333618 () Bool)

(assert (=> b!581303 (=> (not res!369121) (not e!333618))))

(declare-datatypes ((array!36329 0))(
  ( (array!36330 (arr!17439 (Array (_ BitVec 32) (_ BitVec 64))) (size!17803 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36329)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581303 (= res!369121 (validKeyInArray!0 (select (arr!17439 a!2986) j!136)))))

(declare-fun b!581304 () Bool)

(declare-fun res!369122 () Bool)

(declare-fun e!333617 () Bool)

(assert (=> b!581304 (=> (not res!369122) (not e!333617))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36329 (_ BitVec 32)) Bool)

(assert (=> b!581304 (= res!369122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581305 () Bool)

(assert (=> b!581305 (= e!333618 e!333617)))

(declare-fun res!369126 () Bool)

(assert (=> b!581305 (=> (not res!369126) (not e!333617))))

(declare-datatypes ((SeekEntryResult!5879 0))(
  ( (MissingZero!5879 (index!25743 (_ BitVec 32))) (Found!5879 (index!25744 (_ BitVec 32))) (Intermediate!5879 (undefined!6691 Bool) (index!25745 (_ BitVec 32)) (x!54612 (_ BitVec 32))) (Undefined!5879) (MissingVacant!5879 (index!25746 (_ BitVec 32))) )
))
(declare-fun lt!264883 () SeekEntryResult!5879)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581305 (= res!369126 (or (= lt!264883 (MissingZero!5879 i!1108)) (= lt!264883 (MissingVacant!5879 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36329 (_ BitVec 32)) SeekEntryResult!5879)

(assert (=> b!581305 (= lt!264883 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!369125 () Bool)

(assert (=> start!53428 (=> (not res!369125) (not e!333618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53428 (= res!369125 (validMask!0 mask!3053))))

(assert (=> start!53428 e!333618))

(assert (=> start!53428 true))

(declare-fun array_inv!13235 (array!36329) Bool)

(assert (=> start!53428 (array_inv!13235 a!2986)))

(declare-fun b!581306 () Bool)

(declare-fun res!369120 () Bool)

(assert (=> b!581306 (=> (not res!369120) (not e!333618))))

(assert (=> b!581306 (= res!369120 (validKeyInArray!0 k!1786))))

(declare-fun b!581307 () Bool)

(declare-fun res!369128 () Bool)

(assert (=> b!581307 (=> (not res!369128) (not e!333618))))

(declare-fun arrayContainsKey!0 (array!36329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581307 (= res!369128 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581308 () Bool)

(declare-fun res!369127 () Bool)

(assert (=> b!581308 (=> (not res!369127) (not e!333618))))

(assert (=> b!581308 (= res!369127 (and (= (size!17803 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17803 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17803 a!2986)) (not (= i!1108 j!136))))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!581309 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581309 (= e!333617 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17439 a!2986) index!984) (select (arr!17439 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581310 () Bool)

(declare-fun res!369119 () Bool)

(assert (=> b!581310 (=> (not res!369119) (not e!333617))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36329 (_ BitVec 32)) SeekEntryResult!5879)

(assert (=> b!581310 (= res!369119 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17439 a!2986) j!136) a!2986 mask!3053) (Found!5879 j!136)))))

(declare-fun b!581311 () Bool)

(declare-fun res!369123 () Bool)

(assert (=> b!581311 (=> (not res!369123) (not e!333617))))

(assert (=> b!581311 (= res!369123 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17439 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17439 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581312 () Bool)

(declare-fun res!369124 () Bool)

(assert (=> b!581312 (=> (not res!369124) (not e!333617))))

(declare-datatypes ((List!11480 0))(
  ( (Nil!11477) (Cons!11476 (h!12521 (_ BitVec 64)) (t!17708 List!11480)) )
))
(declare-fun arrayNoDuplicates!0 (array!36329 (_ BitVec 32) List!11480) Bool)

(assert (=> b!581312 (= res!369124 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11477))))

(assert (= (and start!53428 res!369125) b!581308))

(assert (= (and b!581308 res!369127) b!581303))

(assert (= (and b!581303 res!369121) b!581306))

(assert (= (and b!581306 res!369120) b!581307))

(assert (= (and b!581307 res!369128) b!581305))

(assert (= (and b!581305 res!369126) b!581304))

(assert (= (and b!581304 res!369122) b!581312))

(assert (= (and b!581312 res!369124) b!581311))

(assert (= (and b!581311 res!369123) b!581310))

(assert (= (and b!581310 res!369119) b!581309))

(declare-fun m!559849 () Bool)

(assert (=> b!581303 m!559849))

(assert (=> b!581303 m!559849))

(declare-fun m!559851 () Bool)

(assert (=> b!581303 m!559851))

(assert (=> b!581310 m!559849))

(assert (=> b!581310 m!559849))

(declare-fun m!559853 () Bool)

(assert (=> b!581310 m!559853))

(declare-fun m!559855 () Bool)

(assert (=> b!581309 m!559855))

(assert (=> b!581309 m!559849))

(declare-fun m!559857 () Bool)

(assert (=> b!581304 m!559857))

(declare-fun m!559859 () Bool)

(assert (=> b!581305 m!559859))

(declare-fun m!559861 () Bool)

(assert (=> b!581307 m!559861))

(declare-fun m!559863 () Bool)

(assert (=> b!581311 m!559863))

(declare-fun m!559865 () Bool)

(assert (=> b!581311 m!559865))

(declare-fun m!559867 () Bool)

(assert (=> b!581311 m!559867))

(declare-fun m!559869 () Bool)

(assert (=> start!53428 m!559869))

(declare-fun m!559871 () Bool)

(assert (=> start!53428 m!559871))

(declare-fun m!559873 () Bool)

(assert (=> b!581306 m!559873))

(declare-fun m!559875 () Bool)

(assert (=> b!581312 m!559875))

(push 1)

