; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30772 () Bool)

(assert start!30772)

(declare-fun b!308796 () Bool)

(declare-fun res!165410 () Bool)

(declare-fun e!193028 () Bool)

(assert (=> b!308796 (=> (not res!165410) (not e!193028))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308796 (= res!165410 (validKeyInArray!0 k0!2441))))

(declare-fun b!308797 () Bool)

(declare-fun res!165417 () Bool)

(assert (=> b!308797 (=> (not res!165417) (not e!193028))))

(declare-datatypes ((array!15725 0))(
  ( (array!15726 (arr!7446 (Array (_ BitVec 32) (_ BitVec 64))) (size!7798 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15725)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308797 (= res!165417 (and (= (size!7798 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7798 a!3293))))))

(declare-fun b!308799 () Bool)

(declare-fun res!165411 () Bool)

(assert (=> b!308799 (=> (not res!165411) (not e!193028))))

(declare-datatypes ((SeekEntryResult!2586 0))(
  ( (MissingZero!2586 (index!12520 (_ BitVec 32))) (Found!2586 (index!12521 (_ BitVec 32))) (Intermediate!2586 (undefined!3398 Bool) (index!12522 (_ BitVec 32)) (x!30758 (_ BitVec 32))) (Undefined!2586) (MissingVacant!2586 (index!12523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15725 (_ BitVec 32)) SeekEntryResult!2586)

(assert (=> b!308799 (= res!165411 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2586 i!1240)))))

(declare-fun b!308800 () Bool)

(declare-fun e!193030 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308800 (= e!193030 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151446 () SeekEntryResult!2586)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15725 (_ BitVec 32)) SeekEntryResult!2586)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308800 (= lt!151446 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308801 () Bool)

(declare-fun e!193029 () Bool)

(assert (=> b!308801 (= e!193028 e!193029)))

(declare-fun res!165409 () Bool)

(assert (=> b!308801 (=> (not res!165409) (not e!193029))))

(declare-fun lt!151445 () SeekEntryResult!2586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308801 (= res!165409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151445))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308801 (= lt!151445 (Intermediate!2586 false resIndex!52 resX!52))))

(declare-fun b!308802 () Bool)

(assert (=> b!308802 (= e!193029 e!193030)))

(declare-fun res!165416 () Bool)

(assert (=> b!308802 (=> (not res!165416) (not e!193030))))

(assert (=> b!308802 (= res!165416 (and (= lt!151446 lt!151445) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7446 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308802 (= lt!151446 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308798 () Bool)

(declare-fun res!165415 () Bool)

(assert (=> b!308798 (=> (not res!165415) (not e!193028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15725 (_ BitVec 32)) Bool)

(assert (=> b!308798 (= res!165415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!165413 () Bool)

(assert (=> start!30772 (=> (not res!165413) (not e!193028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30772 (= res!165413 (validMask!0 mask!3709))))

(assert (=> start!30772 e!193028))

(declare-fun array_inv!5409 (array!15725) Bool)

(assert (=> start!30772 (array_inv!5409 a!3293)))

(assert (=> start!30772 true))

(declare-fun b!308803 () Bool)

(declare-fun res!165412 () Bool)

(assert (=> b!308803 (=> (not res!165412) (not e!193029))))

(assert (=> b!308803 (= res!165412 (and (= (select (arr!7446 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7798 a!3293))))))

(declare-fun b!308804 () Bool)

(declare-fun res!165414 () Bool)

(assert (=> b!308804 (=> (not res!165414) (not e!193028))))

(declare-fun arrayContainsKey!0 (array!15725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308804 (= res!165414 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30772 res!165413) b!308797))

(assert (= (and b!308797 res!165417) b!308796))

(assert (= (and b!308796 res!165410) b!308804))

(assert (= (and b!308804 res!165414) b!308799))

(assert (= (and b!308799 res!165411) b!308798))

(assert (= (and b!308798 res!165415) b!308801))

(assert (= (and b!308801 res!165409) b!308803))

(assert (= (and b!308803 res!165412) b!308802))

(assert (= (and b!308802 res!165416) b!308800))

(declare-fun m!318823 () Bool)

(assert (=> b!308796 m!318823))

(declare-fun m!318825 () Bool)

(assert (=> b!308800 m!318825))

(assert (=> b!308800 m!318825))

(declare-fun m!318827 () Bool)

(assert (=> b!308800 m!318827))

(declare-fun m!318829 () Bool)

(assert (=> b!308799 m!318829))

(declare-fun m!318831 () Bool)

(assert (=> start!30772 m!318831))

(declare-fun m!318833 () Bool)

(assert (=> start!30772 m!318833))

(declare-fun m!318835 () Bool)

(assert (=> b!308804 m!318835))

(declare-fun m!318837 () Bool)

(assert (=> b!308801 m!318837))

(assert (=> b!308801 m!318837))

(declare-fun m!318839 () Bool)

(assert (=> b!308801 m!318839))

(declare-fun m!318841 () Bool)

(assert (=> b!308798 m!318841))

(declare-fun m!318843 () Bool)

(assert (=> b!308802 m!318843))

(declare-fun m!318845 () Bool)

(assert (=> b!308802 m!318845))

(declare-fun m!318847 () Bool)

(assert (=> b!308803 m!318847))

(check-sat (not b!308804) (not b!308801) (not start!30772) (not b!308796) (not b!308800) (not b!308799) (not b!308798) (not b!308802))
(check-sat)
