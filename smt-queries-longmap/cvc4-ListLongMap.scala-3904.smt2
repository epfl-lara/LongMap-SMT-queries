; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53438 () Bool)

(assert start!53438)

(declare-fun b!581445 () Bool)

(declare-fun res!369267 () Bool)

(declare-fun e!333663 () Bool)

(assert (=> b!581445 (=> (not res!369267) (not e!333663))))

(declare-datatypes ((array!36339 0))(
  ( (array!36340 (arr!17444 (Array (_ BitVec 32) (_ BitVec 64))) (size!17808 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36339)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36339 (_ BitVec 32)) Bool)

(assert (=> b!581445 (= res!369267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581446 () Bool)

(declare-fun res!369268 () Bool)

(declare-fun e!333662 () Bool)

(assert (=> b!581446 (=> (not res!369268) (not e!333662))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581446 (= res!369268 (and (= (size!17808 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17808 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17808 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581447 () Bool)

(declare-fun res!369269 () Bool)

(assert (=> b!581447 (=> (not res!369269) (not e!333662))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581447 (= res!369269 (validKeyInArray!0 k!1786))))

(declare-fun b!581448 () Bool)

(declare-fun res!369261 () Bool)

(assert (=> b!581448 (=> (not res!369261) (not e!333662))))

(declare-fun arrayContainsKey!0 (array!36339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581448 (= res!369261 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!369263 () Bool)

(assert (=> start!53438 (=> (not res!369263) (not e!333662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53438 (= res!369263 (validMask!0 mask!3053))))

(assert (=> start!53438 e!333662))

(assert (=> start!53438 true))

(declare-fun array_inv!13240 (array!36339) Bool)

(assert (=> start!53438 (array_inv!13240 a!2986)))

(declare-fun b!581449 () Bool)

(declare-fun res!369262 () Bool)

(assert (=> b!581449 (=> (not res!369262) (not e!333663))))

(declare-datatypes ((List!11485 0))(
  ( (Nil!11482) (Cons!11481 (h!12526 (_ BitVec 64)) (t!17713 List!11485)) )
))
(declare-fun arrayNoDuplicates!0 (array!36339 (_ BitVec 32) List!11485) Bool)

(assert (=> b!581449 (= res!369262 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11482))))

(declare-fun b!581450 () Bool)

(declare-fun res!369264 () Bool)

(assert (=> b!581450 (=> (not res!369264) (not e!333662))))

(assert (=> b!581450 (= res!369264 (validKeyInArray!0 (select (arr!17444 a!2986) j!136)))))

(declare-fun b!581451 () Bool)

(declare-fun res!369266 () Bool)

(assert (=> b!581451 (=> (not res!369266) (not e!333663))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581451 (= res!369266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17444 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17444 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581452 () Bool)

(assert (=> b!581452 (= e!333662 e!333663)))

(declare-fun res!369265 () Bool)

(assert (=> b!581452 (=> (not res!369265) (not e!333663))))

(declare-datatypes ((SeekEntryResult!5884 0))(
  ( (MissingZero!5884 (index!25763 (_ BitVec 32))) (Found!5884 (index!25764 (_ BitVec 32))) (Intermediate!5884 (undefined!6696 Bool) (index!25765 (_ BitVec 32)) (x!54625 (_ BitVec 32))) (Undefined!5884) (MissingVacant!5884 (index!25766 (_ BitVec 32))) )
))
(declare-fun lt!264906 () SeekEntryResult!5884)

(assert (=> b!581452 (= res!369265 (or (= lt!264906 (MissingZero!5884 i!1108)) (= lt!264906 (MissingVacant!5884 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36339 (_ BitVec 32)) SeekEntryResult!5884)

(assert (=> b!581452 (= lt!264906 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581453 () Bool)

(assert (=> b!581453 (= e!333663 false)))

(declare-fun lt!264907 () SeekEntryResult!5884)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36339 (_ BitVec 32)) SeekEntryResult!5884)

(assert (=> b!581453 (= lt!264907 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17444 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53438 res!369263) b!581446))

(assert (= (and b!581446 res!369268) b!581450))

(assert (= (and b!581450 res!369264) b!581447))

(assert (= (and b!581447 res!369269) b!581448))

(assert (= (and b!581448 res!369261) b!581452))

(assert (= (and b!581452 res!369265) b!581445))

(assert (= (and b!581445 res!369267) b!581449))

(assert (= (and b!581449 res!369262) b!581451))

(assert (= (and b!581451 res!369266) b!581453))

(declare-fun m!559985 () Bool)

(assert (=> b!581449 m!559985))

(declare-fun m!559987 () Bool)

(assert (=> b!581451 m!559987))

(declare-fun m!559989 () Bool)

(assert (=> b!581451 m!559989))

(declare-fun m!559991 () Bool)

(assert (=> b!581451 m!559991))

(declare-fun m!559993 () Bool)

(assert (=> b!581453 m!559993))

(assert (=> b!581453 m!559993))

(declare-fun m!559995 () Bool)

(assert (=> b!581453 m!559995))

(declare-fun m!559997 () Bool)

(assert (=> b!581448 m!559997))

(declare-fun m!559999 () Bool)

(assert (=> b!581452 m!559999))

(declare-fun m!560001 () Bool)

(assert (=> b!581447 m!560001))

(assert (=> b!581450 m!559993))

(assert (=> b!581450 m!559993))

(declare-fun m!560003 () Bool)

(assert (=> b!581450 m!560003))

(declare-fun m!560005 () Bool)

(assert (=> start!53438 m!560005))

(declare-fun m!560007 () Bool)

(assert (=> start!53438 m!560007))

(declare-fun m!560009 () Bool)

(assert (=> b!581445 m!560009))

(push 1)

