; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53554 () Bool)

(assert start!53554)

(declare-fun b!583029 () Bool)

(declare-fun res!370850 () Bool)

(declare-fun e!334184 () Bool)

(assert (=> b!583029 (=> (not res!370850) (not e!334184))))

(declare-datatypes ((array!36455 0))(
  ( (array!36456 (arr!17502 (Array (_ BitVec 32) (_ BitVec 64))) (size!17866 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36455)

(declare-datatypes ((List!11543 0))(
  ( (Nil!11540) (Cons!11539 (h!12584 (_ BitVec 64)) (t!17771 List!11543)) )
))
(declare-fun arrayNoDuplicates!0 (array!36455 (_ BitVec 32) List!11543) Bool)

(assert (=> b!583029 (= res!370850 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11540))))

(declare-fun b!583030 () Bool)

(declare-fun res!370845 () Bool)

(declare-fun e!334185 () Bool)

(assert (=> b!583030 (=> (not res!370845) (not e!334185))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583030 (= res!370845 (validKeyInArray!0 (select (arr!17502 a!2986) j!136)))))

(declare-fun b!583031 () Bool)

(assert (=> b!583031 (= e!334184 false)))

(declare-datatypes ((SeekEntryResult!5942 0))(
  ( (MissingZero!5942 (index!25995 (_ BitVec 32))) (Found!5942 (index!25996 (_ BitVec 32))) (Intermediate!5942 (undefined!6754 Bool) (index!25997 (_ BitVec 32)) (x!54843 (_ BitVec 32))) (Undefined!5942) (MissingVacant!5942 (index!25998 (_ BitVec 32))) )
))
(declare-fun lt!265246 () SeekEntryResult!5942)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36455 (_ BitVec 32)) SeekEntryResult!5942)

(assert (=> b!583031 (= lt!265246 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17502 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583032 () Bool)

(declare-fun res!370849 () Bool)

(assert (=> b!583032 (=> (not res!370849) (not e!334185))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583032 (= res!370849 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583033 () Bool)

(declare-fun res!370846 () Bool)

(assert (=> b!583033 (=> (not res!370846) (not e!334184))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583033 (= res!370846 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17502 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17502 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370853 () Bool)

(assert (=> start!53554 (=> (not res!370853) (not e!334185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53554 (= res!370853 (validMask!0 mask!3053))))

(assert (=> start!53554 e!334185))

(assert (=> start!53554 true))

(declare-fun array_inv!13298 (array!36455) Bool)

(assert (=> start!53554 (array_inv!13298 a!2986)))

(declare-fun b!583034 () Bool)

(declare-fun res!370851 () Bool)

(assert (=> b!583034 (=> (not res!370851) (not e!334185))))

(assert (=> b!583034 (= res!370851 (and (= (size!17866 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17866 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17866 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583035 () Bool)

(assert (=> b!583035 (= e!334185 e!334184)))

(declare-fun res!370852 () Bool)

(assert (=> b!583035 (=> (not res!370852) (not e!334184))))

(declare-fun lt!265245 () SeekEntryResult!5942)

(assert (=> b!583035 (= res!370852 (or (= lt!265245 (MissingZero!5942 i!1108)) (= lt!265245 (MissingVacant!5942 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36455 (_ BitVec 32)) SeekEntryResult!5942)

(assert (=> b!583035 (= lt!265245 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583036 () Bool)

(declare-fun res!370848 () Bool)

(assert (=> b!583036 (=> (not res!370848) (not e!334185))))

(assert (=> b!583036 (= res!370848 (validKeyInArray!0 k!1786))))

(declare-fun b!583037 () Bool)

(declare-fun res!370847 () Bool)

(assert (=> b!583037 (=> (not res!370847) (not e!334184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36455 (_ BitVec 32)) Bool)

(assert (=> b!583037 (= res!370847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53554 res!370853) b!583034))

(assert (= (and b!583034 res!370851) b!583030))

(assert (= (and b!583030 res!370845) b!583036))

(assert (= (and b!583036 res!370848) b!583032))

(assert (= (and b!583032 res!370849) b!583035))

(assert (= (and b!583035 res!370852) b!583037))

(assert (= (and b!583037 res!370847) b!583029))

(assert (= (and b!583029 res!370850) b!583033))

(assert (= (and b!583033 res!370846) b!583031))

(declare-fun m!561511 () Bool)

(assert (=> start!53554 m!561511))

(declare-fun m!561513 () Bool)

(assert (=> start!53554 m!561513))

(declare-fun m!561515 () Bool)

(assert (=> b!583030 m!561515))

(assert (=> b!583030 m!561515))

(declare-fun m!561517 () Bool)

(assert (=> b!583030 m!561517))

(declare-fun m!561519 () Bool)

(assert (=> b!583035 m!561519))

(declare-fun m!561521 () Bool)

(assert (=> b!583037 m!561521))

(declare-fun m!561523 () Bool)

(assert (=> b!583029 m!561523))

(assert (=> b!583031 m!561515))

(assert (=> b!583031 m!561515))

(declare-fun m!561525 () Bool)

(assert (=> b!583031 m!561525))

(declare-fun m!561527 () Bool)

(assert (=> b!583033 m!561527))

(declare-fun m!561529 () Bool)

(assert (=> b!583033 m!561529))

(declare-fun m!561531 () Bool)

(assert (=> b!583033 m!561531))

(declare-fun m!561533 () Bool)

(assert (=> b!583032 m!561533))

(declare-fun m!561535 () Bool)

(assert (=> b!583036 m!561535))

(push 1)

(assert (not b!583031))

(assert (not b!583035))

(assert (not start!53554))

(assert (not b!583036))

(assert (not b!583032))

(assert (not b!583029))

(assert (not b!583037))

(assert (not b!583030))

(check-sat)

(pop 1)

