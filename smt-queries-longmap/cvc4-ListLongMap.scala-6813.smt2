; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85704 () Bool)

(assert start!85704)

(declare-fun b!994576 () Bool)

(declare-fun res!665088 () Bool)

(declare-fun e!561274 () Bool)

(assert (=> b!994576 (=> (not res!665088) (not e!561274))))

(declare-datatypes ((array!62910 0))(
  ( (array!62911 (arr!30294 (Array (_ BitVec 32) (_ BitVec 64))) (size!30796 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62910)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994576 (= res!665088 (validKeyInArray!0 (select (arr!30294 a!3219) j!170)))))

(declare-fun b!994577 () Bool)

(declare-fun res!665087 () Bool)

(assert (=> b!994577 (=> (not res!665087) (not e!561274))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994577 (= res!665087 (and (= (size!30796 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30796 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30796 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665086 () Bool)

(assert (=> start!85704 (=> (not res!665086) (not e!561274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85704 (= res!665086 (validMask!0 mask!3464))))

(assert (=> start!85704 e!561274))

(declare-fun array_inv!23418 (array!62910) Bool)

(assert (=> start!85704 (array_inv!23418 a!3219)))

(assert (=> start!85704 true))

(declare-fun b!994578 () Bool)

(declare-fun res!665083 () Bool)

(assert (=> b!994578 (=> (not res!665083) (not e!561274))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994578 (= res!665083 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994579 () Bool)

(declare-fun res!665085 () Bool)

(assert (=> b!994579 (=> (not res!665085) (not e!561274))))

(declare-datatypes ((SeekEntryResult!9226 0))(
  ( (MissingZero!9226 (index!39275 (_ BitVec 32))) (Found!9226 (index!39276 (_ BitVec 32))) (Intermediate!9226 (undefined!10038 Bool) (index!39277 (_ BitVec 32)) (x!86723 (_ BitVec 32))) (Undefined!9226) (MissingVacant!9226 (index!39278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62910 (_ BitVec 32)) SeekEntryResult!9226)

(assert (=> b!994579 (= res!665085 (not (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) (MissingVacant!9226 i!1194))))))

(declare-fun b!994580 () Bool)

(assert (=> b!994580 (= e!561274 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!994581 () Bool)

(declare-fun res!665084 () Bool)

(assert (=> b!994581 (=> (not res!665084) (not e!561274))))

(assert (=> b!994581 (= res!665084 (validKeyInArray!0 k!2224))))

(assert (= (and start!85704 res!665086) b!994577))

(assert (= (and b!994577 res!665087) b!994576))

(assert (= (and b!994576 res!665088) b!994581))

(assert (= (and b!994581 res!665084) b!994578))

(assert (= (and b!994578 res!665083) b!994579))

(assert (= (and b!994579 res!665085) b!994580))

(declare-fun m!922137 () Bool)

(assert (=> b!994581 m!922137))

(declare-fun m!922139 () Bool)

(assert (=> start!85704 m!922139))

(declare-fun m!922141 () Bool)

(assert (=> start!85704 m!922141))

(declare-fun m!922143 () Bool)

(assert (=> b!994579 m!922143))

(declare-fun m!922145 () Bool)

(assert (=> b!994576 m!922145))

(assert (=> b!994576 m!922145))

(declare-fun m!922147 () Bool)

(assert (=> b!994576 m!922147))

(declare-fun m!922149 () Bool)

(assert (=> b!994578 m!922149))

(push 1)

(assert (not b!994578))

(assert (not start!85704))

(assert (not b!994576))

(assert (not b!994581))

(assert (not b!994579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

