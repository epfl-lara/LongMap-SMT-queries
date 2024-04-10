; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30260 () Bool)

(assert start!30260)

(declare-fun b!302827 () Bool)

(declare-fun res!160319 () Bool)

(declare-fun e!190782 () Bool)

(assert (=> b!302827 (=> (not res!160319) (not e!190782))))

(declare-datatypes ((array!15366 0))(
  ( (array!15367 (arr!7271 (Array (_ BitVec 32) (_ BitVec 64))) (size!7623 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15366)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15366 (_ BitVec 32)) Bool)

(assert (=> b!302827 (= res!160319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302828 () Bool)

(assert (=> b!302828 (= e!190782 false)))

(declare-datatypes ((SeekEntryResult!2411 0))(
  ( (MissingZero!2411 (index!11820 (_ BitVec 32))) (Found!2411 (index!11821 (_ BitVec 32))) (Intermediate!2411 (undefined!3223 Bool) (index!11822 (_ BitVec 32)) (x!30092 (_ BitVec 32))) (Undefined!2411) (MissingVacant!2411 (index!11823 (_ BitVec 32))) )
))
(declare-fun lt!150135 () SeekEntryResult!2411)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15366 (_ BitVec 32)) SeekEntryResult!2411)

(assert (=> b!302828 (= lt!150135 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302829 () Bool)

(declare-fun res!160316 () Bool)

(assert (=> b!302829 (=> (not res!160316) (not e!190782))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302829 (= res!160316 (and (= (size!7623 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7623 a!3293))))))

(declare-fun b!302830 () Bool)

(declare-fun res!160318 () Bool)

(assert (=> b!302830 (=> (not res!160318) (not e!190782))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302830 (= res!160318 (and (= (select (arr!7271 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7623 a!3293))))))

(declare-fun b!302831 () Bool)

(declare-fun res!160317 () Bool)

(assert (=> b!302831 (=> (not res!160317) (not e!190782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302831 (= res!160317 (validKeyInArray!0 k!2441))))

(declare-fun b!302832 () Bool)

(declare-fun res!160313 () Bool)

(assert (=> b!302832 (=> (not res!160313) (not e!190782))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302832 (= res!160313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2411 false resIndex!52 resX!52)))))

(declare-fun res!160315 () Bool)

(assert (=> start!30260 (=> (not res!160315) (not e!190782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30260 (= res!160315 (validMask!0 mask!3709))))

(assert (=> start!30260 e!190782))

(declare-fun array_inv!5234 (array!15366) Bool)

(assert (=> start!30260 (array_inv!5234 a!3293)))

(assert (=> start!30260 true))

(declare-fun b!302833 () Bool)

(declare-fun res!160320 () Bool)

(assert (=> b!302833 (=> (not res!160320) (not e!190782))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15366 (_ BitVec 32)) SeekEntryResult!2411)

(assert (=> b!302833 (= res!160320 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2411 i!1240)))))

(declare-fun b!302834 () Bool)

(declare-fun res!160314 () Bool)

(assert (=> b!302834 (=> (not res!160314) (not e!190782))))

(declare-fun arrayContainsKey!0 (array!15366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302834 (= res!160314 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30260 res!160315) b!302829))

(assert (= (and b!302829 res!160316) b!302831))

(assert (= (and b!302831 res!160317) b!302834))

(assert (= (and b!302834 res!160314) b!302833))

(assert (= (and b!302833 res!160320) b!302827))

(assert (= (and b!302827 res!160319) b!302832))

(assert (= (and b!302832 res!160313) b!302830))

(assert (= (and b!302830 res!160318) b!302828))

(declare-fun m!314285 () Bool)

(assert (=> b!302832 m!314285))

(assert (=> b!302832 m!314285))

(declare-fun m!314287 () Bool)

(assert (=> b!302832 m!314287))

(declare-fun m!314289 () Bool)

(assert (=> b!302831 m!314289))

(declare-fun m!314291 () Bool)

(assert (=> b!302833 m!314291))

(declare-fun m!314293 () Bool)

(assert (=> b!302827 m!314293))

(declare-fun m!314295 () Bool)

(assert (=> start!30260 m!314295))

(declare-fun m!314297 () Bool)

(assert (=> start!30260 m!314297))

(declare-fun m!314299 () Bool)

(assert (=> b!302830 m!314299))

(declare-fun m!314301 () Bool)

(assert (=> b!302828 m!314301))

(declare-fun m!314303 () Bool)

(assert (=> b!302834 m!314303))

(push 1)

(assert (not b!302827))

(assert (not b!302834))

(assert (not b!302832))

(assert (not b!302831))

(assert (not start!30260))

(assert (not b!302828))

(assert (not b!302833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

