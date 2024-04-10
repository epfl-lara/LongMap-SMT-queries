; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31802 () Bool)

(assert start!31802)

(declare-fun b!317672 () Bool)

(declare-fun res!172253 () Bool)

(declare-fun e!197485 () Bool)

(assert (=> b!317672 (=> (not res!172253) (not e!197485))))

(declare-datatypes ((array!16173 0))(
  ( (array!16174 (arr!7652 (Array (_ BitVec 32) (_ BitVec 64))) (size!8004 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16173)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317672 (= res!172253 (and (= (size!8004 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8004 a!3293))))))

(declare-fun b!317674 () Bool)

(declare-fun res!172254 () Bool)

(assert (=> b!317674 (=> (not res!172254) (not e!197485))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2792 0))(
  ( (MissingZero!2792 (index!13344 (_ BitVec 32))) (Found!2792 (index!13345 (_ BitVec 32))) (Intermediate!2792 (undefined!3604 Bool) (index!13346 (_ BitVec 32)) (x!31609 (_ BitVec 32))) (Undefined!2792) (MissingVacant!2792 (index!13347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16173 (_ BitVec 32)) SeekEntryResult!2792)

(assert (=> b!317674 (= res!172254 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2792 i!1240)))))

(declare-fun e!197482 () Bool)

(declare-fun lt!155043 () (_ BitVec 32))

(declare-fun b!317675 () Bool)

(declare-fun lt!155046 () array!16173)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16173 (_ BitVec 32)) SeekEntryResult!2792)

(assert (=> b!317675 (= e!197482 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155046 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155043 k!2441 lt!155046 mask!3709)))))

(assert (=> b!317675 (= lt!155046 (array!16174 (store (arr!7652 a!3293) i!1240 k!2441) (size!8004 a!3293)))))

(declare-fun b!317676 () Bool)

(declare-fun e!197481 () Bool)

(declare-fun e!197484 () Bool)

(assert (=> b!317676 (= e!197481 e!197484)))

(declare-fun res!172256 () Bool)

(assert (=> b!317676 (=> (not res!172256) (not e!197484))))

(declare-fun lt!155045 () SeekEntryResult!2792)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!155044 () SeekEntryResult!2792)

(assert (=> b!317676 (= res!172256 (and (= lt!155044 lt!155045) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7652 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317676 (= lt!155044 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317677 () Bool)

(declare-fun res!172257 () Bool)

(assert (=> b!317677 (=> (not res!172257) (not e!197485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16173 (_ BitVec 32)) Bool)

(assert (=> b!317677 (= res!172257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317678 () Bool)

(assert (=> b!317678 (= e!197485 e!197481)))

(declare-fun res!172255 () Bool)

(assert (=> b!317678 (=> (not res!172255) (not e!197481))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317678 (= res!172255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155045))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317678 (= lt!155045 (Intermediate!2792 false resIndex!52 resX!52))))

(declare-fun b!317679 () Bool)

(declare-fun res!172252 () Bool)

(assert (=> b!317679 (=> (not res!172252) (not e!197485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317679 (= res!172252 (validKeyInArray!0 k!2441))))

(declare-fun b!317680 () Bool)

(declare-fun res!172260 () Bool)

(assert (=> b!317680 (=> (not res!172260) (not e!197485))))

(declare-fun arrayContainsKey!0 (array!16173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317680 (= res!172260 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317681 () Bool)

(assert (=> b!317681 (= e!197484 (not true))))

(assert (=> b!317681 e!197482))

(declare-fun res!172259 () Bool)

(assert (=> b!317681 (=> (not res!172259) (not e!197482))))

(assert (=> b!317681 (= res!172259 (= lt!155044 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155043 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317681 (= lt!155043 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317673 () Bool)

(declare-fun res!172258 () Bool)

(assert (=> b!317673 (=> (not res!172258) (not e!197481))))

(assert (=> b!317673 (= res!172258 (and (= (select (arr!7652 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8004 a!3293))))))

(declare-fun res!172251 () Bool)

(assert (=> start!31802 (=> (not res!172251) (not e!197485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31802 (= res!172251 (validMask!0 mask!3709))))

(assert (=> start!31802 e!197485))

(declare-fun array_inv!5615 (array!16173) Bool)

(assert (=> start!31802 (array_inv!5615 a!3293)))

(assert (=> start!31802 true))

(assert (= (and start!31802 res!172251) b!317672))

(assert (= (and b!317672 res!172253) b!317679))

(assert (= (and b!317679 res!172252) b!317680))

(assert (= (and b!317680 res!172260) b!317674))

(assert (= (and b!317674 res!172254) b!317677))

(assert (= (and b!317677 res!172257) b!317678))

(assert (= (and b!317678 res!172255) b!317673))

(assert (= (and b!317673 res!172258) b!317676))

(assert (= (and b!317676 res!172256) b!317681))

(assert (= (and b!317681 res!172259) b!317675))

(declare-fun m!326321 () Bool)

(assert (=> b!317674 m!326321))

(declare-fun m!326323 () Bool)

(assert (=> b!317673 m!326323))

(declare-fun m!326325 () Bool)

(assert (=> b!317679 m!326325))

(declare-fun m!326327 () Bool)

(assert (=> start!31802 m!326327))

(declare-fun m!326329 () Bool)

(assert (=> start!31802 m!326329))

(declare-fun m!326331 () Bool)

(assert (=> b!317681 m!326331))

(declare-fun m!326333 () Bool)

(assert (=> b!317681 m!326333))

(declare-fun m!326335 () Bool)

(assert (=> b!317675 m!326335))

(declare-fun m!326337 () Bool)

(assert (=> b!317675 m!326337))

(declare-fun m!326339 () Bool)

(assert (=> b!317675 m!326339))

(declare-fun m!326341 () Bool)

(assert (=> b!317678 m!326341))

(assert (=> b!317678 m!326341))

(declare-fun m!326343 () Bool)

(assert (=> b!317678 m!326343))

(declare-fun m!326345 () Bool)

(assert (=> b!317676 m!326345))

(declare-fun m!326347 () Bool)

(assert (=> b!317676 m!326347))

(declare-fun m!326349 () Bool)

(assert (=> b!317680 m!326349))

(declare-fun m!326351 () Bool)

(assert (=> b!317677 m!326351))

(push 1)

