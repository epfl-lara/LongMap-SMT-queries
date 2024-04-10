; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53520 () Bool)

(assert start!53520)

(declare-fun b!582570 () Bool)

(declare-fun e!334030 () Bool)

(declare-fun e!334032 () Bool)

(assert (=> b!582570 (= e!334030 e!334032)))

(declare-fun res!370390 () Bool)

(assert (=> b!582570 (=> (not res!370390) (not e!334032))))

(declare-datatypes ((SeekEntryResult!5925 0))(
  ( (MissingZero!5925 (index!25927 (_ BitVec 32))) (Found!5925 (index!25928 (_ BitVec 32))) (Intermediate!5925 (undefined!6737 Bool) (index!25929 (_ BitVec 32)) (x!54778 (_ BitVec 32))) (Undefined!5925) (MissingVacant!5925 (index!25930 (_ BitVec 32))) )
))
(declare-fun lt!265144 () SeekEntryResult!5925)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582570 (= res!370390 (or (= lt!265144 (MissingZero!5925 i!1108)) (= lt!265144 (MissingVacant!5925 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36421 0))(
  ( (array!36422 (arr!17485 (Array (_ BitVec 32) (_ BitVec 64))) (size!17849 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36421)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36421 (_ BitVec 32)) SeekEntryResult!5925)

(assert (=> b!582570 (= lt!265144 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582571 () Bool)

(declare-fun res!370389 () Bool)

(assert (=> b!582571 (=> (not res!370389) (not e!334030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582571 (= res!370389 (validKeyInArray!0 k0!1786))))

(declare-fun b!582572 () Bool)

(declare-fun res!370387 () Bool)

(assert (=> b!582572 (=> (not res!370387) (not e!334030))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582572 (= res!370387 (validKeyInArray!0 (select (arr!17485 a!2986) j!136)))))

(declare-fun b!582574 () Bool)

(declare-fun res!370388 () Bool)

(assert (=> b!582574 (=> (not res!370388) (not e!334032))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582574 (= res!370388 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17485 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17485 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582575 () Bool)

(declare-fun res!370386 () Bool)

(assert (=> b!582575 (=> (not res!370386) (not e!334032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36421 (_ BitVec 32)) Bool)

(assert (=> b!582575 (= res!370386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582576 () Bool)

(declare-fun res!370391 () Bool)

(assert (=> b!582576 (=> (not res!370391) (not e!334032))))

(declare-datatypes ((List!11526 0))(
  ( (Nil!11523) (Cons!11522 (h!12567 (_ BitVec 64)) (t!17754 List!11526)) )
))
(declare-fun arrayNoDuplicates!0 (array!36421 (_ BitVec 32) List!11526) Bool)

(assert (=> b!582576 (= res!370391 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11523))))

(declare-fun b!582577 () Bool)

(declare-fun res!370392 () Bool)

(assert (=> b!582577 (=> (not res!370392) (not e!334030))))

(assert (=> b!582577 (= res!370392 (and (= (size!17849 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17849 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17849 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582578 () Bool)

(assert (=> b!582578 (= e!334032 false)))

(declare-fun lt!265143 () SeekEntryResult!5925)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36421 (_ BitVec 32)) SeekEntryResult!5925)

(assert (=> b!582578 (= lt!265143 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17485 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370393 () Bool)

(assert (=> start!53520 (=> (not res!370393) (not e!334030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53520 (= res!370393 (validMask!0 mask!3053))))

(assert (=> start!53520 e!334030))

(assert (=> start!53520 true))

(declare-fun array_inv!13281 (array!36421) Bool)

(assert (=> start!53520 (array_inv!13281 a!2986)))

(declare-fun b!582573 () Bool)

(declare-fun res!370394 () Bool)

(assert (=> b!582573 (=> (not res!370394) (not e!334030))))

(declare-fun arrayContainsKey!0 (array!36421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582573 (= res!370394 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53520 res!370393) b!582577))

(assert (= (and b!582577 res!370392) b!582572))

(assert (= (and b!582572 res!370387) b!582571))

(assert (= (and b!582571 res!370389) b!582573))

(assert (= (and b!582573 res!370394) b!582570))

(assert (= (and b!582570 res!370390) b!582575))

(assert (= (and b!582575 res!370386) b!582576))

(assert (= (and b!582576 res!370391) b!582574))

(assert (= (and b!582574 res!370388) b!582578))

(declare-fun m!561069 () Bool)

(assert (=> b!582571 m!561069))

(declare-fun m!561071 () Bool)

(assert (=> b!582574 m!561071))

(declare-fun m!561073 () Bool)

(assert (=> b!582574 m!561073))

(declare-fun m!561075 () Bool)

(assert (=> b!582574 m!561075))

(declare-fun m!561077 () Bool)

(assert (=> b!582576 m!561077))

(declare-fun m!561079 () Bool)

(assert (=> b!582570 m!561079))

(declare-fun m!561081 () Bool)

(assert (=> b!582572 m!561081))

(assert (=> b!582572 m!561081))

(declare-fun m!561083 () Bool)

(assert (=> b!582572 m!561083))

(declare-fun m!561085 () Bool)

(assert (=> start!53520 m!561085))

(declare-fun m!561087 () Bool)

(assert (=> start!53520 m!561087))

(declare-fun m!561089 () Bool)

(assert (=> b!582575 m!561089))

(declare-fun m!561091 () Bool)

(assert (=> b!582573 m!561091))

(assert (=> b!582578 m!561081))

(assert (=> b!582578 m!561081))

(declare-fun m!561093 () Bool)

(assert (=> b!582578 m!561093))

(check-sat (not b!582576) (not start!53520) (not b!582570) (not b!582573) (not b!582578) (not b!582572) (not b!582575) (not b!582571))
