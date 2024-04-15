; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30268 () Bool)

(assert start!30268)

(declare-fun b!302825 () Bool)

(declare-fun res!160461 () Bool)

(declare-fun e!190681 () Bool)

(assert (=> b!302825 (=> (not res!160461) (not e!190681))))

(declare-datatypes ((array!15378 0))(
  ( (array!15379 (arr!7277 (Array (_ BitVec 32) (_ BitVec 64))) (size!7630 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15378)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2416 0))(
  ( (MissingZero!2416 (index!11840 (_ BitVec 32))) (Found!2416 (index!11841 (_ BitVec 32))) (Intermediate!2416 (undefined!3228 Bool) (index!11842 (_ BitVec 32)) (x!30116 (_ BitVec 32))) (Undefined!2416) (MissingVacant!2416 (index!11843 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15378 (_ BitVec 32)) SeekEntryResult!2416)

(assert (=> b!302825 (= res!160461 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2416 i!1240)))))

(declare-fun b!302826 () Bool)

(assert (=> b!302826 (= e!190681 false)))

(declare-fun lt!149933 () SeekEntryResult!2416)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15378 (_ BitVec 32)) SeekEntryResult!2416)

(assert (=> b!302826 (= lt!149933 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302827 () Bool)

(declare-fun res!160462 () Bool)

(assert (=> b!302827 (=> (not res!160462) (not e!190681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302827 (= res!160462 (validKeyInArray!0 k!2441))))

(declare-fun b!302828 () Bool)

(declare-fun res!160463 () Bool)

(assert (=> b!302828 (=> (not res!160463) (not e!190681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15378 (_ BitVec 32)) Bool)

(assert (=> b!302828 (= res!160463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302829 () Bool)

(declare-fun res!160464 () Bool)

(assert (=> b!302829 (=> (not res!160464) (not e!190681))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302829 (= res!160464 (and (= (select (arr!7277 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7630 a!3293))))))

(declare-fun b!302830 () Bool)

(declare-fun res!160457 () Bool)

(assert (=> b!302830 (=> (not res!160457) (not e!190681))))

(assert (=> b!302830 (= res!160457 (and (= (size!7630 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7630 a!3293))))))

(declare-fun res!160458 () Bool)

(assert (=> start!30268 (=> (not res!160458) (not e!190681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30268 (= res!160458 (validMask!0 mask!3709))))

(assert (=> start!30268 e!190681))

(declare-fun array_inv!5249 (array!15378) Bool)

(assert (=> start!30268 (array_inv!5249 a!3293)))

(assert (=> start!30268 true))

(declare-fun b!302831 () Bool)

(declare-fun res!160459 () Bool)

(assert (=> b!302831 (=> (not res!160459) (not e!190681))))

(declare-fun arrayContainsKey!0 (array!15378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302831 (= res!160459 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302832 () Bool)

(declare-fun res!160460 () Bool)

(assert (=> b!302832 (=> (not res!160460) (not e!190681))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302832 (= res!160460 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2416 false resIndex!52 resX!52)))))

(assert (= (and start!30268 res!160458) b!302830))

(assert (= (and b!302830 res!160457) b!302827))

(assert (= (and b!302827 res!160462) b!302831))

(assert (= (and b!302831 res!160459) b!302825))

(assert (= (and b!302825 res!160461) b!302828))

(assert (= (and b!302828 res!160463) b!302832))

(assert (= (and b!302832 res!160460) b!302829))

(assert (= (and b!302829 res!160464) b!302826))

(declare-fun m!313781 () Bool)

(assert (=> b!302832 m!313781))

(assert (=> b!302832 m!313781))

(declare-fun m!313783 () Bool)

(assert (=> b!302832 m!313783))

(declare-fun m!313785 () Bool)

(assert (=> b!302829 m!313785))

(declare-fun m!313787 () Bool)

(assert (=> b!302828 m!313787))

(declare-fun m!313789 () Bool)

(assert (=> start!30268 m!313789))

(declare-fun m!313791 () Bool)

(assert (=> start!30268 m!313791))

(declare-fun m!313793 () Bool)

(assert (=> b!302827 m!313793))

(declare-fun m!313795 () Bool)

(assert (=> b!302831 m!313795))

(declare-fun m!313797 () Bool)

(assert (=> b!302826 m!313797))

(declare-fun m!313799 () Bool)

(assert (=> b!302825 m!313799))

(push 1)

(assert (not b!302825))

(assert (not b!302826))

(assert (not b!302832))

(assert (not b!302828))

(assert (not b!302827))

(assert (not b!302831))

(assert (not start!30268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

