; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30432 () Bool)

(assert start!30432)

(declare-fun b!304647 () Bool)

(declare-fun res!161997 () Bool)

(declare-fun e!191430 () Bool)

(assert (=> b!304647 (=> (not res!161997) (not e!191430))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304647 (= res!161997 (validKeyInArray!0 k!2441))))

(declare-fun b!304648 () Bool)

(declare-fun res!161992 () Bool)

(assert (=> b!304648 (=> (not res!161992) (not e!191430))))

(declare-datatypes ((array!15487 0))(
  ( (array!15488 (arr!7330 (Array (_ BitVec 32) (_ BitVec 64))) (size!7682 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15487)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15487 (_ BitVec 32)) Bool)

(assert (=> b!304648 (= res!161992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304649 () Bool)

(declare-fun res!161998 () Bool)

(assert (=> b!304649 (=> (not res!161998) (not e!191430))))

(declare-fun arrayContainsKey!0 (array!15487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304649 (= res!161998 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304650 () Bool)

(declare-fun res!161994 () Bool)

(assert (=> b!304650 (=> (not res!161994) (not e!191430))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304650 (= res!161994 (and (= (size!7682 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7682 a!3293))))))

(declare-fun b!304651 () Bool)

(declare-fun e!191431 () Bool)

(declare-fun e!191428 () Bool)

(assert (=> b!304651 (= e!191431 e!191428)))

(declare-fun res!161999 () Bool)

(assert (=> b!304651 (=> (not res!161999) (not e!191428))))

(declare-datatypes ((SeekEntryResult!2470 0))(
  ( (MissingZero!2470 (index!12056 (_ BitVec 32))) (Found!2470 (index!12057 (_ BitVec 32))) (Intermediate!2470 (undefined!3282 Bool) (index!12058 (_ BitVec 32)) (x!30312 (_ BitVec 32))) (Undefined!2470) (MissingVacant!2470 (index!12059 (_ BitVec 32))) )
))
(declare-fun lt!150498 () SeekEntryResult!2470)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!150497 () SeekEntryResult!2470)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304651 (= res!161999 (and (= lt!150497 lt!150498) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7330 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7330 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7330 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15487 (_ BitVec 32)) SeekEntryResult!2470)

(assert (=> b!304651 (= lt!150497 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!161996 () Bool)

(assert (=> start!30432 (=> (not res!161996) (not e!191430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30432 (= res!161996 (validMask!0 mask!3709))))

(assert (=> start!30432 e!191430))

(declare-fun array_inv!5293 (array!15487) Bool)

(assert (=> start!30432 (array_inv!5293 a!3293)))

(assert (=> start!30432 true))

(declare-fun b!304652 () Bool)

(declare-fun res!161993 () Bool)

(assert (=> b!304652 (=> (not res!161993) (not e!191431))))

(assert (=> b!304652 (= res!161993 (and (= (select (arr!7330 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7682 a!3293))))))

(declare-fun b!304653 () Bool)

(declare-fun res!161995 () Bool)

(assert (=> b!304653 (=> (not res!161995) (not e!191430))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15487 (_ BitVec 32)) SeekEntryResult!2470)

(assert (=> b!304653 (= res!161995 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2470 i!1240)))))

(declare-fun b!304654 () Bool)

(assert (=> b!304654 (= e!191428 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304654 (= lt!150497 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304655 () Bool)

(assert (=> b!304655 (= e!191430 e!191431)))

(declare-fun res!162000 () Bool)

(assert (=> b!304655 (=> (not res!162000) (not e!191431))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304655 (= res!162000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150498))))

(assert (=> b!304655 (= lt!150498 (Intermediate!2470 false resIndex!52 resX!52))))

(assert (= (and start!30432 res!161996) b!304650))

(assert (= (and b!304650 res!161994) b!304647))

(assert (= (and b!304647 res!161997) b!304649))

(assert (= (and b!304649 res!161998) b!304653))

(assert (= (and b!304653 res!161995) b!304648))

(assert (= (and b!304648 res!161992) b!304655))

(assert (= (and b!304655 res!162000) b!304652))

(assert (= (and b!304652 res!161993) b!304651))

(assert (= (and b!304651 res!161999) b!304654))

(declare-fun m!315735 () Bool)

(assert (=> start!30432 m!315735))

(declare-fun m!315737 () Bool)

(assert (=> start!30432 m!315737))

(declare-fun m!315739 () Bool)

(assert (=> b!304648 m!315739))

(declare-fun m!315741 () Bool)

(assert (=> b!304653 m!315741))

(declare-fun m!315743 () Bool)

(assert (=> b!304647 m!315743))

(declare-fun m!315745 () Bool)

(assert (=> b!304649 m!315745))

(declare-fun m!315747 () Bool)

(assert (=> b!304654 m!315747))

(assert (=> b!304654 m!315747))

(declare-fun m!315749 () Bool)

(assert (=> b!304654 m!315749))

(declare-fun m!315751 () Bool)

(assert (=> b!304652 m!315751))

(declare-fun m!315753 () Bool)

(assert (=> b!304655 m!315753))

(assert (=> b!304655 m!315753))

(declare-fun m!315755 () Bool)

(assert (=> b!304655 m!315755))

(declare-fun m!315757 () Bool)

(assert (=> b!304651 m!315757))

(declare-fun m!315759 () Bool)

(assert (=> b!304651 m!315759))

(push 1)

(assert (not b!304655))

(assert (not b!304654))

(assert (not b!304647))

(assert (not b!304649))

(assert (not start!30432))

(assert (not b!304653))

(assert (not b!304648))

(assert (not b!304651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

