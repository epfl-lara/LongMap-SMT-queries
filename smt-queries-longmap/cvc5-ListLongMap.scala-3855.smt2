; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53068 () Bool)

(assert start!53068)

(declare-fun b!577512 () Bool)

(declare-fun e!332201 () Bool)

(assert (=> b!577512 (= e!332201 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5688 0))(
  ( (MissingZero!5688 (index!24979 (_ BitVec 32))) (Found!5688 (index!24980 (_ BitVec 32))) (Intermediate!5688 (undefined!6500 Bool) (index!24981 (_ BitVec 32)) (x!54040 (_ BitVec 32))) (Undefined!5688) (MissingVacant!5688 (index!24982 (_ BitVec 32))) )
))
(declare-fun lt!264052 () SeekEntryResult!5688)

(declare-datatypes ((array!36031 0))(
  ( (array!36032 (arr!17292 (Array (_ BitVec 32) (_ BitVec 64))) (size!17656 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36031)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36031 (_ BitVec 32)) SeekEntryResult!5688)

(assert (=> b!577512 (= lt!264052 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577513 () Bool)

(declare-fun res!365440 () Bool)

(assert (=> b!577513 (=> (not res!365440) (not e!332201))))

(declare-fun arrayContainsKey!0 (array!36031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577513 (= res!365440 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577514 () Bool)

(declare-fun res!365443 () Bool)

(assert (=> b!577514 (=> (not res!365443) (not e!332201))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577514 (= res!365443 (and (= (size!17656 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17656 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17656 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577515 () Bool)

(declare-fun res!365441 () Bool)

(assert (=> b!577515 (=> (not res!365441) (not e!332201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577515 (= res!365441 (validKeyInArray!0 k!1786))))

(declare-fun b!577516 () Bool)

(declare-fun res!365439 () Bool)

(assert (=> b!577516 (=> (not res!365439) (not e!332201))))

(assert (=> b!577516 (= res!365439 (validKeyInArray!0 (select (arr!17292 a!2986) j!136)))))

(declare-fun res!365442 () Bool)

(assert (=> start!53068 (=> (not res!365442) (not e!332201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53068 (= res!365442 (validMask!0 mask!3053))))

(assert (=> start!53068 e!332201))

(assert (=> start!53068 true))

(declare-fun array_inv!13151 (array!36031) Bool)

(assert (=> start!53068 (array_inv!13151 a!2986)))

(assert (= (and start!53068 res!365442) b!577514))

(assert (= (and b!577514 res!365443) b!577516))

(assert (= (and b!577516 res!365439) b!577515))

(assert (= (and b!577515 res!365441) b!577513))

(assert (= (and b!577513 res!365440) b!577512))

(declare-fun m!556551 () Bool)

(assert (=> b!577516 m!556551))

(assert (=> b!577516 m!556551))

(declare-fun m!556553 () Bool)

(assert (=> b!577516 m!556553))

(declare-fun m!556555 () Bool)

(assert (=> b!577512 m!556555))

(declare-fun m!556557 () Bool)

(assert (=> start!53068 m!556557))

(declare-fun m!556559 () Bool)

(assert (=> start!53068 m!556559))

(declare-fun m!556561 () Bool)

(assert (=> b!577515 m!556561))

(declare-fun m!556563 () Bool)

(assert (=> b!577513 m!556563))

(push 1)

(assert (not b!577512))

(assert (not b!577513))

(assert (not start!53068))

(assert (not b!577515))

(assert (not b!577516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

