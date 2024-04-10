; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53528 () Bool)

(assert start!53528)

(declare-fun res!370499 () Bool)

(declare-fun e!334068 () Bool)

(assert (=> start!53528 (=> (not res!370499) (not e!334068))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53528 (= res!370499 (validMask!0 mask!3053))))

(assert (=> start!53528 e!334068))

(assert (=> start!53528 true))

(declare-datatypes ((array!36429 0))(
  ( (array!36430 (arr!17489 (Array (_ BitVec 32) (_ BitVec 64))) (size!17853 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36429)

(declare-fun array_inv!13285 (array!36429) Bool)

(assert (=> start!53528 (array_inv!13285 a!2986)))

(declare-fun b!582678 () Bool)

(declare-fun res!370498 () Bool)

(declare-fun e!334067 () Bool)

(assert (=> b!582678 (=> (not res!370498) (not e!334067))))

(declare-datatypes ((List!11530 0))(
  ( (Nil!11527) (Cons!11526 (h!12571 (_ BitVec 64)) (t!17758 List!11530)) )
))
(declare-fun arrayNoDuplicates!0 (array!36429 (_ BitVec 32) List!11530) Bool)

(assert (=> b!582678 (= res!370498 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11527))))

(declare-fun b!582679 () Bool)

(declare-fun res!370494 () Bool)

(assert (=> b!582679 (=> (not res!370494) (not e!334068))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582679 (= res!370494 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582680 () Bool)

(declare-fun res!370501 () Bool)

(assert (=> b!582680 (=> (not res!370501) (not e!334068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582680 (= res!370501 (validKeyInArray!0 k!1786))))

(declare-fun b!582681 () Bool)

(declare-fun res!370495 () Bool)

(assert (=> b!582681 (=> (not res!370495) (not e!334068))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582681 (= res!370495 (validKeyInArray!0 (select (arr!17489 a!2986) j!136)))))

(declare-fun b!582682 () Bool)

(assert (=> b!582682 (= e!334067 false)))

(declare-datatypes ((SeekEntryResult!5929 0))(
  ( (MissingZero!5929 (index!25943 (_ BitVec 32))) (Found!5929 (index!25944 (_ BitVec 32))) (Intermediate!5929 (undefined!6741 Bool) (index!25945 (_ BitVec 32)) (x!54790 (_ BitVec 32))) (Undefined!5929) (MissingVacant!5929 (index!25946 (_ BitVec 32))) )
))
(declare-fun lt!265167 () SeekEntryResult!5929)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36429 (_ BitVec 32)) SeekEntryResult!5929)

(assert (=> b!582682 (= lt!265167 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17489 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582683 () Bool)

(declare-fun res!370502 () Bool)

(assert (=> b!582683 (=> (not res!370502) (not e!334067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36429 (_ BitVec 32)) Bool)

(assert (=> b!582683 (= res!370502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582684 () Bool)

(assert (=> b!582684 (= e!334068 e!334067)))

(declare-fun res!370496 () Bool)

(assert (=> b!582684 (=> (not res!370496) (not e!334067))))

(declare-fun lt!265168 () SeekEntryResult!5929)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582684 (= res!370496 (or (= lt!265168 (MissingZero!5929 i!1108)) (= lt!265168 (MissingVacant!5929 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36429 (_ BitVec 32)) SeekEntryResult!5929)

(assert (=> b!582684 (= lt!265168 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582685 () Bool)

(declare-fun res!370500 () Bool)

(assert (=> b!582685 (=> (not res!370500) (not e!334067))))

(assert (=> b!582685 (= res!370500 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17489 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17489 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582686 () Bool)

(declare-fun res!370497 () Bool)

(assert (=> b!582686 (=> (not res!370497) (not e!334068))))

(assert (=> b!582686 (= res!370497 (and (= (size!17853 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17853 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17853 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53528 res!370499) b!582686))

(assert (= (and b!582686 res!370497) b!582681))

(assert (= (and b!582681 res!370495) b!582680))

(assert (= (and b!582680 res!370501) b!582679))

(assert (= (and b!582679 res!370494) b!582684))

(assert (= (and b!582684 res!370496) b!582683))

(assert (= (and b!582683 res!370502) b!582678))

(assert (= (and b!582678 res!370498) b!582685))

(assert (= (and b!582685 res!370500) b!582682))

(declare-fun m!561173 () Bool)

(assert (=> b!582685 m!561173))

(declare-fun m!561175 () Bool)

(assert (=> b!582685 m!561175))

(declare-fun m!561177 () Bool)

(assert (=> b!582685 m!561177))

(declare-fun m!561179 () Bool)

(assert (=> b!582679 m!561179))

(declare-fun m!561181 () Bool)

(assert (=> b!582678 m!561181))

(declare-fun m!561183 () Bool)

(assert (=> b!582682 m!561183))

(assert (=> b!582682 m!561183))

(declare-fun m!561185 () Bool)

(assert (=> b!582682 m!561185))

(declare-fun m!561187 () Bool)

(assert (=> start!53528 m!561187))

(declare-fun m!561189 () Bool)

(assert (=> start!53528 m!561189))

(assert (=> b!582681 m!561183))

(assert (=> b!582681 m!561183))

(declare-fun m!561191 () Bool)

(assert (=> b!582681 m!561191))

(declare-fun m!561193 () Bool)

(assert (=> b!582684 m!561193))

(declare-fun m!561195 () Bool)

(assert (=> b!582683 m!561195))

(declare-fun m!561197 () Bool)

(assert (=> b!582680 m!561197))

(push 1)

(assert (not b!582683))

(assert (not b!582684))

(assert (not b!582682))

(assert (not b!582679))

(assert (not b!582678))

(assert (not start!53528))

(assert (not b!582681))

(assert (not b!582680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

