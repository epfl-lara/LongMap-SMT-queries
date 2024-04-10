; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53506 () Bool)

(assert start!53506)

(declare-fun b!582381 () Bool)

(declare-fun res!370198 () Bool)

(declare-fun e!333969 () Bool)

(assert (=> b!582381 (=> (not res!370198) (not e!333969))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582381 (= res!370198 (validKeyInArray!0 k!1786))))

(declare-fun b!582382 () Bool)

(declare-fun res!370202 () Bool)

(declare-fun e!333967 () Bool)

(assert (=> b!582382 (=> (not res!370202) (not e!333967))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36407 0))(
  ( (array!36408 (arr!17478 (Array (_ BitVec 32) (_ BitVec 64))) (size!17842 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36407)

(assert (=> b!582382 (= res!370202 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17478 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17478 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582383 () Bool)

(declare-fun res!370197 () Bool)

(assert (=> b!582383 (=> (not res!370197) (not e!333969))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582383 (= res!370197 (and (= (size!17842 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17842 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17842 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!370201 () Bool)

(assert (=> start!53506 (=> (not res!370201) (not e!333969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53506 (= res!370201 (validMask!0 mask!3053))))

(assert (=> start!53506 e!333969))

(assert (=> start!53506 true))

(declare-fun array_inv!13274 (array!36407) Bool)

(assert (=> start!53506 (array_inv!13274 a!2986)))

(declare-fun b!582384 () Bool)

(declare-fun res!370199 () Bool)

(assert (=> b!582384 (=> (not res!370199) (not e!333967))))

(declare-datatypes ((List!11519 0))(
  ( (Nil!11516) (Cons!11515 (h!12560 (_ BitVec 64)) (t!17747 List!11519)) )
))
(declare-fun arrayNoDuplicates!0 (array!36407 (_ BitVec 32) List!11519) Bool)

(assert (=> b!582384 (= res!370199 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11516))))

(declare-fun b!582385 () Bool)

(declare-fun res!370205 () Bool)

(assert (=> b!582385 (=> (not res!370205) (not e!333967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36407 (_ BitVec 32)) Bool)

(assert (=> b!582385 (= res!370205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582386 () Bool)

(assert (=> b!582386 (= e!333969 e!333967)))

(declare-fun res!370200 () Bool)

(assert (=> b!582386 (=> (not res!370200) (not e!333967))))

(declare-datatypes ((SeekEntryResult!5918 0))(
  ( (MissingZero!5918 (index!25899 (_ BitVec 32))) (Found!5918 (index!25900 (_ BitVec 32))) (Intermediate!5918 (undefined!6730 Bool) (index!25901 (_ BitVec 32)) (x!54755 (_ BitVec 32))) (Undefined!5918) (MissingVacant!5918 (index!25902 (_ BitVec 32))) )
))
(declare-fun lt!265101 () SeekEntryResult!5918)

(assert (=> b!582386 (= res!370200 (or (= lt!265101 (MissingZero!5918 i!1108)) (= lt!265101 (MissingVacant!5918 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36407 (_ BitVec 32)) SeekEntryResult!5918)

(assert (=> b!582386 (= lt!265101 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582387 () Bool)

(declare-fun res!370203 () Bool)

(assert (=> b!582387 (=> (not res!370203) (not e!333969))))

(assert (=> b!582387 (= res!370203 (validKeyInArray!0 (select (arr!17478 a!2986) j!136)))))

(declare-fun b!582388 () Bool)

(assert (=> b!582388 (= e!333967 false)))

(declare-fun lt!265102 () SeekEntryResult!5918)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36407 (_ BitVec 32)) SeekEntryResult!5918)

(assert (=> b!582388 (= lt!265102 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17478 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582389 () Bool)

(declare-fun res!370204 () Bool)

(assert (=> b!582389 (=> (not res!370204) (not e!333969))))

(declare-fun arrayContainsKey!0 (array!36407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582389 (= res!370204 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53506 res!370201) b!582383))

(assert (= (and b!582383 res!370197) b!582387))

(assert (= (and b!582387 res!370203) b!582381))

(assert (= (and b!582381 res!370198) b!582389))

(assert (= (and b!582389 res!370204) b!582386))

(assert (= (and b!582386 res!370200) b!582385))

(assert (= (and b!582385 res!370205) b!582384))

(assert (= (and b!582384 res!370199) b!582382))

(assert (= (and b!582382 res!370202) b!582388))

(declare-fun m!560887 () Bool)

(assert (=> b!582387 m!560887))

(assert (=> b!582387 m!560887))

(declare-fun m!560889 () Bool)

(assert (=> b!582387 m!560889))

(declare-fun m!560891 () Bool)

(assert (=> b!582389 m!560891))

(assert (=> b!582388 m!560887))

(assert (=> b!582388 m!560887))

(declare-fun m!560893 () Bool)

(assert (=> b!582388 m!560893))

(declare-fun m!560895 () Bool)

(assert (=> b!582384 m!560895))

(declare-fun m!560897 () Bool)

(assert (=> start!53506 m!560897))

(declare-fun m!560899 () Bool)

(assert (=> start!53506 m!560899))

(declare-fun m!560901 () Bool)

(assert (=> b!582382 m!560901))

(declare-fun m!560903 () Bool)

(assert (=> b!582382 m!560903))

(declare-fun m!560905 () Bool)

(assert (=> b!582382 m!560905))

(declare-fun m!560907 () Bool)

(assert (=> b!582385 m!560907))

(declare-fun m!560909 () Bool)

(assert (=> b!582381 m!560909))

(declare-fun m!560911 () Bool)

(assert (=> b!582386 m!560911))

(push 1)

(assert (not b!582384))

(assert (not b!582381))

(assert (not start!53506))

(assert (not b!582388))

(assert (not b!582386))

(assert (not b!582385))

(assert (not b!582387))

(assert (not b!582389))

(check-sat)

