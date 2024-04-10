; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30534 () Bool)

(assert start!30534)

(declare-fun b!305578 () Bool)

(declare-fun res!162737 () Bool)

(declare-fun e!191871 () Bool)

(assert (=> b!305578 (=> (not res!162737) (not e!191871))))

(declare-datatypes ((array!15538 0))(
  ( (array!15539 (arr!7354 (Array (_ BitVec 32) (_ BitVec 64))) (size!7706 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15538)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15538 (_ BitVec 32)) Bool)

(assert (=> b!305578 (= res!162737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305579 () Bool)

(declare-fun res!162741 () Bool)

(assert (=> b!305579 (=> (not res!162741) (not e!191871))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305579 (= res!162741 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!162736 () Bool)

(assert (=> start!30534 (=> (not res!162736) (not e!191871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30534 (= res!162736 (validMask!0 mask!3709))))

(assert (=> start!30534 e!191871))

(declare-fun array_inv!5317 (array!15538) Bool)

(assert (=> start!30534 (array_inv!5317 a!3293)))

(assert (=> start!30534 true))

(declare-fun b!305580 () Bool)

(declare-fun e!191874 () Bool)

(assert (=> b!305580 (= e!191871 e!191874)))

(declare-fun res!162735 () Bool)

(assert (=> b!305580 (=> (not res!162735) (not e!191874))))

(declare-datatypes ((SeekEntryResult!2494 0))(
  ( (MissingZero!2494 (index!12152 (_ BitVec 32))) (Found!2494 (index!12153 (_ BitVec 32))) (Intermediate!2494 (undefined!3306 Bool) (index!12154 (_ BitVec 32)) (x!30409 (_ BitVec 32))) (Undefined!2494) (MissingVacant!2494 (index!12155 (_ BitVec 32))) )
))
(declare-fun lt!150778 () SeekEntryResult!2494)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15538 (_ BitVec 32)) SeekEntryResult!2494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305580 (= res!162735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150778))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305580 (= lt!150778 (Intermediate!2494 false resIndex!52 resX!52))))

(declare-fun b!305581 () Bool)

(declare-datatypes ((Unit!9411 0))(
  ( (Unit!9412) )
))
(declare-fun e!191872 () Unit!9411)

(declare-fun Unit!9413 () Unit!9411)

(assert (=> b!305581 (= e!191872 Unit!9413)))

(declare-fun b!305582 () Bool)

(declare-fun res!162733 () Bool)

(assert (=> b!305582 (=> (not res!162733) (not e!191871))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15538 (_ BitVec 32)) SeekEntryResult!2494)

(assert (=> b!305582 (= res!162733 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2494 i!1240)))))

(declare-fun b!305583 () Bool)

(declare-fun res!162739 () Bool)

(assert (=> b!305583 (=> (not res!162739) (not e!191874))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305583 (= res!162739 (and (= (select (arr!7354 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7706 a!3293))))))

(declare-fun b!305584 () Bool)

(declare-fun res!162738 () Bool)

(assert (=> b!305584 (=> (not res!162738) (not e!191874))))

(assert (=> b!305584 (= res!162738 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7354 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305585 () Bool)

(declare-fun res!162732 () Bool)

(assert (=> b!305585 (=> (not res!162732) (not e!191871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305585 (= res!162732 (validKeyInArray!0 k!2441))))

(declare-fun b!305586 () Bool)

(assert (=> b!305586 false))

(declare-fun lt!150779 () SeekEntryResult!2494)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305586 (= lt!150779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun e!191873 () Unit!9411)

(declare-fun Unit!9414 () Unit!9411)

(assert (=> b!305586 (= e!191873 Unit!9414)))

(declare-fun b!305587 () Bool)

(declare-fun res!162740 () Bool)

(assert (=> b!305587 (=> (not res!162740) (not e!191874))))

(assert (=> b!305587 (= res!162740 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150778))))

(declare-fun b!305588 () Bool)

(assert (=> b!305588 (= e!191872 e!191873)))

(declare-fun c!49026 () Bool)

(assert (=> b!305588 (= c!49026 (or (= (select (arr!7354 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7354 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305589 () Bool)

(assert (=> b!305589 false))

(declare-fun Unit!9415 () Unit!9411)

(assert (=> b!305589 (= e!191873 Unit!9415)))

(declare-fun b!305590 () Bool)

(assert (=> b!305590 (= e!191874 (not true))))

(assert (=> b!305590 (= index!1781 resIndex!52)))

(declare-fun lt!150780 () Unit!9411)

(assert (=> b!305590 (= lt!150780 e!191872)))

(declare-fun c!49025 () Bool)

(assert (=> b!305590 (= c!49025 (not (= resIndex!52 index!1781)))))

(declare-fun b!305591 () Bool)

(declare-fun res!162734 () Bool)

(assert (=> b!305591 (=> (not res!162734) (not e!191871))))

(assert (=> b!305591 (= res!162734 (and (= (size!7706 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7706 a!3293))))))

(assert (= (and start!30534 res!162736) b!305591))

(assert (= (and b!305591 res!162734) b!305585))

(assert (= (and b!305585 res!162732) b!305579))

(assert (= (and b!305579 res!162741) b!305582))

(assert (= (and b!305582 res!162733) b!305578))

(assert (= (and b!305578 res!162737) b!305580))

(assert (= (and b!305580 res!162735) b!305583))

(assert (= (and b!305583 res!162739) b!305587))

(assert (= (and b!305587 res!162740) b!305584))

(assert (= (and b!305584 res!162738) b!305590))

(assert (= (and b!305590 c!49025) b!305588))

(assert (= (and b!305590 (not c!49025)) b!305581))

(assert (= (and b!305588 c!49026) b!305589))

(assert (= (and b!305588 (not c!49026)) b!305586))

(declare-fun m!316497 () Bool)

(assert (=> b!305585 m!316497))

(declare-fun m!316499 () Bool)

(assert (=> b!305583 m!316499))

(declare-fun m!316501 () Bool)

(assert (=> b!305588 m!316501))

(declare-fun m!316503 () Bool)

(assert (=> b!305586 m!316503))

(assert (=> b!305586 m!316503))

(declare-fun m!316505 () Bool)

(assert (=> b!305586 m!316505))

(declare-fun m!316507 () Bool)

(assert (=> b!305582 m!316507))

(declare-fun m!316509 () Bool)

(assert (=> b!305578 m!316509))

(declare-fun m!316511 () Bool)

(assert (=> start!30534 m!316511))

(declare-fun m!316513 () Bool)

(assert (=> start!30534 m!316513))

(assert (=> b!305584 m!316501))

(declare-fun m!316515 () Bool)

(assert (=> b!305580 m!316515))

(assert (=> b!305580 m!316515))

(declare-fun m!316517 () Bool)

(assert (=> b!305580 m!316517))

(declare-fun m!316519 () Bool)

(assert (=> b!305579 m!316519))

(declare-fun m!316521 () Bool)

(assert (=> b!305587 m!316521))

(push 1)

(assert (not b!305580))

(assert (not b!305586))

