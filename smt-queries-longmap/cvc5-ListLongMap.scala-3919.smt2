; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53524 () Bool)

(assert start!53524)

(declare-fun b!582624 () Bool)

(declare-fun res!370441 () Bool)

(declare-fun e!334048 () Bool)

(assert (=> b!582624 (=> (not res!370441) (not e!334048))))

(declare-datatypes ((array!36425 0))(
  ( (array!36426 (arr!17487 (Array (_ BitVec 32) (_ BitVec 64))) (size!17851 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36425)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582624 (= res!370441 (validKeyInArray!0 (select (arr!17487 a!2986) j!136)))))

(declare-fun b!582625 () Bool)

(declare-fun res!370446 () Bool)

(assert (=> b!582625 (=> (not res!370446) (not e!334048))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!582625 (= res!370446 (validKeyInArray!0 k!1786))))

(declare-fun b!582626 () Bool)

(declare-fun res!370447 () Bool)

(assert (=> b!582626 (=> (not res!370447) (not e!334048))))

(declare-fun arrayContainsKey!0 (array!36425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582626 (= res!370447 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582627 () Bool)

(declare-fun res!370440 () Bool)

(declare-fun e!334049 () Bool)

(assert (=> b!582627 (=> (not res!370440) (not e!334049))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582627 (= res!370440 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17487 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17487 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582628 () Bool)

(declare-fun res!370448 () Bool)

(assert (=> b!582628 (=> (not res!370448) (not e!334049))))

(declare-datatypes ((List!11528 0))(
  ( (Nil!11525) (Cons!11524 (h!12569 (_ BitVec 64)) (t!17756 List!11528)) )
))
(declare-fun arrayNoDuplicates!0 (array!36425 (_ BitVec 32) List!11528) Bool)

(assert (=> b!582628 (= res!370448 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11525))))

(declare-fun b!582629 () Bool)

(declare-fun res!370443 () Bool)

(assert (=> b!582629 (=> (not res!370443) (not e!334048))))

(assert (=> b!582629 (= res!370443 (and (= (size!17851 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17851 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17851 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582630 () Bool)

(declare-fun res!370445 () Bool)

(assert (=> b!582630 (=> (not res!370445) (not e!334049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36425 (_ BitVec 32)) Bool)

(assert (=> b!582630 (= res!370445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!370442 () Bool)

(assert (=> start!53524 (=> (not res!370442) (not e!334048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53524 (= res!370442 (validMask!0 mask!3053))))

(assert (=> start!53524 e!334048))

(assert (=> start!53524 true))

(declare-fun array_inv!13283 (array!36425) Bool)

(assert (=> start!53524 (array_inv!13283 a!2986)))

(declare-fun b!582631 () Bool)

(assert (=> b!582631 (= e!334049 false)))

(declare-datatypes ((SeekEntryResult!5927 0))(
  ( (MissingZero!5927 (index!25935 (_ BitVec 32))) (Found!5927 (index!25936 (_ BitVec 32))) (Intermediate!5927 (undefined!6739 Bool) (index!25937 (_ BitVec 32)) (x!54788 (_ BitVec 32))) (Undefined!5927) (MissingVacant!5927 (index!25938 (_ BitVec 32))) )
))
(declare-fun lt!265156 () SeekEntryResult!5927)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36425 (_ BitVec 32)) SeekEntryResult!5927)

(assert (=> b!582631 (= lt!265156 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17487 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582632 () Bool)

(assert (=> b!582632 (= e!334048 e!334049)))

(declare-fun res!370444 () Bool)

(assert (=> b!582632 (=> (not res!370444) (not e!334049))))

(declare-fun lt!265155 () SeekEntryResult!5927)

(assert (=> b!582632 (= res!370444 (or (= lt!265155 (MissingZero!5927 i!1108)) (= lt!265155 (MissingVacant!5927 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36425 (_ BitVec 32)) SeekEntryResult!5927)

(assert (=> b!582632 (= lt!265155 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53524 res!370442) b!582629))

(assert (= (and b!582629 res!370443) b!582624))

(assert (= (and b!582624 res!370441) b!582625))

(assert (= (and b!582625 res!370446) b!582626))

(assert (= (and b!582626 res!370447) b!582632))

(assert (= (and b!582632 res!370444) b!582630))

(assert (= (and b!582630 res!370445) b!582628))

(assert (= (and b!582628 res!370448) b!582627))

(assert (= (and b!582627 res!370440) b!582631))

(declare-fun m!561121 () Bool)

(assert (=> b!582626 m!561121))

(declare-fun m!561123 () Bool)

(assert (=> b!582627 m!561123))

(declare-fun m!561125 () Bool)

(assert (=> b!582627 m!561125))

(declare-fun m!561127 () Bool)

(assert (=> b!582627 m!561127))

(declare-fun m!561129 () Bool)

(assert (=> b!582632 m!561129))

(declare-fun m!561131 () Bool)

(assert (=> b!582628 m!561131))

(declare-fun m!561133 () Bool)

(assert (=> start!53524 m!561133))

(declare-fun m!561135 () Bool)

(assert (=> start!53524 m!561135))

(declare-fun m!561137 () Bool)

(assert (=> b!582630 m!561137))

(declare-fun m!561139 () Bool)

(assert (=> b!582631 m!561139))

(assert (=> b!582631 m!561139))

(declare-fun m!561141 () Bool)

(assert (=> b!582631 m!561141))

(assert (=> b!582624 m!561139))

(assert (=> b!582624 m!561139))

(declare-fun m!561143 () Bool)

(assert (=> b!582624 m!561143))

(declare-fun m!561145 () Bool)

(assert (=> b!582625 m!561145))

(push 1)

(assert (not b!582630))

(assert (not b!582631))

(assert (not b!582624))

(assert (not b!582625))

(assert (not b!582632))

(assert (not b!582628))

(assert (not b!582626))

(assert (not start!53524))

(check-sat)

(pop 1)

