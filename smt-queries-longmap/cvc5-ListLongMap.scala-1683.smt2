; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30986 () Bool)

(assert start!30986)

(declare-fun b!311327 () Bool)

(declare-fun res!167790 () Bool)

(declare-fun e!194264 () Bool)

(assert (=> b!311327 (=> (not res!167790) (not e!194264))))

(declare-datatypes ((array!15888 0))(
  ( (array!15889 (arr!7526 (Array (_ BitVec 32) (_ BitVec 64))) (size!7878 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15888)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2666 0))(
  ( (MissingZero!2666 (index!12840 (_ BitVec 32))) (Found!2666 (index!12841 (_ BitVec 32))) (Intermediate!2666 (undefined!3478 Bool) (index!12842 (_ BitVec 32)) (x!31063 (_ BitVec 32))) (Undefined!2666) (MissingVacant!2666 (index!12843 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15888 (_ BitVec 32)) SeekEntryResult!2666)

(assert (=> b!311327 (= res!167790 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2666 i!1240)))))

(declare-fun b!311329 () Bool)

(declare-fun e!194266 () Bool)

(assert (=> b!311329 (= e!194266 (not true))))

(declare-fun e!194263 () Bool)

(assert (=> b!311329 e!194263))

(declare-fun res!167788 () Bool)

(assert (=> b!311329 (=> (not res!167788) (not e!194263))))

(declare-fun lt!152313 () (_ BitVec 32))

(declare-fun lt!152311 () SeekEntryResult!2666)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15888 (_ BitVec 32)) SeekEntryResult!2666)

(assert (=> b!311329 (= res!167788 (= lt!152311 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152313 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311329 (= lt!152313 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311330 () Bool)

(declare-fun res!167789 () Bool)

(assert (=> b!311330 (=> (not res!167789) (not e!194264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15888 (_ BitVec 32)) Bool)

(assert (=> b!311330 (= res!167789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311331 () Bool)

(declare-fun e!194262 () Bool)

(assert (=> b!311331 (= e!194264 e!194262)))

(declare-fun res!167785 () Bool)

(assert (=> b!311331 (=> (not res!167785) (not e!194262))))

(declare-fun lt!152310 () SeekEntryResult!2666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311331 (= res!167785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152310))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311331 (= lt!152310 (Intermediate!2666 false resIndex!52 resX!52))))

(declare-fun b!311332 () Bool)

(assert (=> b!311332 (= e!194262 e!194266)))

(declare-fun res!167783 () Bool)

(assert (=> b!311332 (=> (not res!167783) (not e!194266))))

(assert (=> b!311332 (= res!167783 (and (= lt!152311 lt!152310) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7526 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311332 (= lt!152311 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311333 () Bool)

(declare-fun res!167784 () Bool)

(assert (=> b!311333 (=> (not res!167784) (not e!194262))))

(assert (=> b!311333 (= res!167784 (and (= (select (arr!7526 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7878 a!3293))))))

(declare-fun b!311334 () Bool)

(declare-fun res!167787 () Bool)

(assert (=> b!311334 (=> (not res!167787) (not e!194264))))

(declare-fun arrayContainsKey!0 (array!15888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311334 (= res!167787 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311328 () Bool)

(declare-fun res!167782 () Bool)

(assert (=> b!311328 (=> (not res!167782) (not e!194264))))

(assert (=> b!311328 (= res!167782 (and (= (size!7878 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7878 a!3293))))))

(declare-fun res!167781 () Bool)

(assert (=> start!30986 (=> (not res!167781) (not e!194264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30986 (= res!167781 (validMask!0 mask!3709))))

(assert (=> start!30986 e!194264))

(declare-fun array_inv!5489 (array!15888) Bool)

(assert (=> start!30986 (array_inv!5489 a!3293)))

(assert (=> start!30986 true))

(declare-fun b!311335 () Bool)

(declare-fun lt!152312 () array!15888)

(assert (=> b!311335 (= e!194263 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152312 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152313 k!2441 lt!152312 mask!3709)))))

(assert (=> b!311335 (= lt!152312 (array!15889 (store (arr!7526 a!3293) i!1240 k!2441) (size!7878 a!3293)))))

(declare-fun b!311336 () Bool)

(declare-fun res!167786 () Bool)

(assert (=> b!311336 (=> (not res!167786) (not e!194264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311336 (= res!167786 (validKeyInArray!0 k!2441))))

(assert (= (and start!30986 res!167781) b!311328))

(assert (= (and b!311328 res!167782) b!311336))

(assert (= (and b!311336 res!167786) b!311334))

(assert (= (and b!311334 res!167787) b!311327))

(assert (= (and b!311327 res!167790) b!311330))

(assert (= (and b!311330 res!167789) b!311331))

(assert (= (and b!311331 res!167785) b!311333))

(assert (= (and b!311333 res!167784) b!311332))

(assert (= (and b!311332 res!167783) b!311329))

(assert (= (and b!311329 res!167788) b!311335))

(declare-fun m!321293 () Bool)

(assert (=> b!311332 m!321293))

(declare-fun m!321295 () Bool)

(assert (=> b!311332 m!321295))

(declare-fun m!321297 () Bool)

(assert (=> start!30986 m!321297))

(declare-fun m!321299 () Bool)

(assert (=> start!30986 m!321299))

(declare-fun m!321301 () Bool)

(assert (=> b!311333 m!321301))

(declare-fun m!321303 () Bool)

(assert (=> b!311330 m!321303))

(declare-fun m!321305 () Bool)

(assert (=> b!311335 m!321305))

(declare-fun m!321307 () Bool)

(assert (=> b!311335 m!321307))

(declare-fun m!321309 () Bool)

(assert (=> b!311335 m!321309))

(declare-fun m!321311 () Bool)

(assert (=> b!311327 m!321311))

(declare-fun m!321313 () Bool)

(assert (=> b!311329 m!321313))

(declare-fun m!321315 () Bool)

(assert (=> b!311329 m!321315))

(declare-fun m!321317 () Bool)

(assert (=> b!311336 m!321317))

(declare-fun m!321319 () Bool)

(assert (=> b!311331 m!321319))

(assert (=> b!311331 m!321319))

(declare-fun m!321321 () Bool)

(assert (=> b!311331 m!321321))

(declare-fun m!321323 () Bool)

(assert (=> b!311334 m!321323))

(push 1)

