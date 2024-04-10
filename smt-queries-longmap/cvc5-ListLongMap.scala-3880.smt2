; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53290 () Bool)

(assert start!53290)

(declare-fun b!579429 () Bool)

(declare-fun res!367246 () Bool)

(declare-fun e!332997 () Bool)

(assert (=> b!579429 (=> (not res!367246) (not e!332997))))

(declare-datatypes ((array!36191 0))(
  ( (array!36192 (arr!17370 (Array (_ BitVec 32) (_ BitVec 64))) (size!17734 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36191)

(declare-datatypes ((List!11411 0))(
  ( (Nil!11408) (Cons!11407 (h!12452 (_ BitVec 64)) (t!17639 List!11411)) )
))
(declare-fun arrayNoDuplicates!0 (array!36191 (_ BitVec 32) List!11411) Bool)

(assert (=> b!579429 (= res!367246 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11408))))

(declare-fun b!579430 () Bool)

(declare-fun res!367245 () Bool)

(declare-fun e!332996 () Bool)

(assert (=> b!579430 (=> (not res!367245) (not e!332996))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579430 (= res!367245 (and (= (size!17734 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17734 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17734 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579431 () Bool)

(assert (=> b!579431 (= e!332996 e!332997)))

(declare-fun res!367247 () Bool)

(assert (=> b!579431 (=> (not res!367247) (not e!332997))))

(declare-datatypes ((SeekEntryResult!5810 0))(
  ( (MissingZero!5810 (index!25467 (_ BitVec 32))) (Found!5810 (index!25468 (_ BitVec 32))) (Intermediate!5810 (undefined!6622 Bool) (index!25469 (_ BitVec 32)) (x!54359 (_ BitVec 32))) (Undefined!5810) (MissingVacant!5810 (index!25470 (_ BitVec 32))) )
))
(declare-fun lt!264481 () SeekEntryResult!5810)

(assert (=> b!579431 (= res!367247 (or (= lt!264481 (MissingZero!5810 i!1108)) (= lt!264481 (MissingVacant!5810 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36191 (_ BitVec 32)) SeekEntryResult!5810)

(assert (=> b!579431 (= lt!264481 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579432 () Bool)

(declare-fun res!367248 () Bool)

(assert (=> b!579432 (=> (not res!367248) (not e!332996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579432 (= res!367248 (validKeyInArray!0 k!1786))))

(declare-fun b!579433 () Bool)

(declare-fun res!367251 () Bool)

(assert (=> b!579433 (=> (not res!367251) (not e!332997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36191 (_ BitVec 32)) Bool)

(assert (=> b!579433 (= res!367251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579434 () Bool)

(declare-fun res!367249 () Bool)

(assert (=> b!579434 (=> (not res!367249) (not e!332996))))

(assert (=> b!579434 (= res!367249 (validKeyInArray!0 (select (arr!17370 a!2986) j!136)))))

(declare-fun b!579435 () Bool)

(assert (=> b!579435 (= e!332997 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264480 () SeekEntryResult!5810)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36191 (_ BitVec 32)) SeekEntryResult!5810)

(assert (=> b!579435 (= lt!264480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17370 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!367252 () Bool)

(assert (=> start!53290 (=> (not res!367252) (not e!332996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53290 (= res!367252 (validMask!0 mask!3053))))

(assert (=> start!53290 e!332996))

(assert (=> start!53290 true))

(declare-fun array_inv!13166 (array!36191) Bool)

(assert (=> start!53290 (array_inv!13166 a!2986)))

(declare-fun b!579436 () Bool)

(declare-fun res!367253 () Bool)

(assert (=> b!579436 (=> (not res!367253) (not e!332996))))

(declare-fun arrayContainsKey!0 (array!36191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579436 (= res!367253 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579437 () Bool)

(declare-fun res!367250 () Bool)

(assert (=> b!579437 (=> (not res!367250) (not e!332997))))

(assert (=> b!579437 (= res!367250 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17370 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17370 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53290 res!367252) b!579430))

(assert (= (and b!579430 res!367245) b!579434))

(assert (= (and b!579434 res!367249) b!579432))

(assert (= (and b!579432 res!367248) b!579436))

(assert (= (and b!579436 res!367253) b!579431))

(assert (= (and b!579431 res!367247) b!579433))

(assert (= (and b!579433 res!367251) b!579429))

(assert (= (and b!579429 res!367246) b!579437))

(assert (= (and b!579437 res!367250) b!579435))

(declare-fun m!558049 () Bool)

(assert (=> b!579433 m!558049))

(declare-fun m!558051 () Bool)

(assert (=> start!53290 m!558051))

(declare-fun m!558053 () Bool)

(assert (=> start!53290 m!558053))

(declare-fun m!558055 () Bool)

(assert (=> b!579435 m!558055))

(assert (=> b!579435 m!558055))

(declare-fun m!558057 () Bool)

(assert (=> b!579435 m!558057))

(declare-fun m!558059 () Bool)

(assert (=> b!579432 m!558059))

(declare-fun m!558061 () Bool)

(assert (=> b!579437 m!558061))

(declare-fun m!558063 () Bool)

(assert (=> b!579437 m!558063))

(declare-fun m!558065 () Bool)

(assert (=> b!579437 m!558065))

(declare-fun m!558067 () Bool)

(assert (=> b!579436 m!558067))

(assert (=> b!579434 m!558055))

(assert (=> b!579434 m!558055))

(declare-fun m!558069 () Bool)

(assert (=> b!579434 m!558069))

(declare-fun m!558071 () Bool)

(assert (=> b!579431 m!558071))

(declare-fun m!558073 () Bool)

(assert (=> b!579429 m!558073))

(push 1)

(assert (not b!579432))

(assert (not b!579433))

(assert (not b!579436))

(assert (not b!579429))

(assert (not b!579435))

(assert (not start!53290))

(assert (not b!579431))

(assert (not b!579434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

