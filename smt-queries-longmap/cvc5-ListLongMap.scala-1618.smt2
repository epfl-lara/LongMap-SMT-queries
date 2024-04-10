; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30434 () Bool)

(assert start!30434)

(declare-fun e!191443 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!304674 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304674 (= e!191443 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-datatypes ((array!15489 0))(
  ( (array!15490 (arr!7331 (Array (_ BitVec 32) (_ BitVec 64))) (size!7683 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15489)

(declare-datatypes ((SeekEntryResult!2471 0))(
  ( (MissingZero!2471 (index!12060 (_ BitVec 32))) (Found!2471 (index!12061 (_ BitVec 32))) (Intermediate!2471 (undefined!3283 Bool) (index!12062 (_ BitVec 32)) (x!30321 (_ BitVec 32))) (Undefined!2471) (MissingVacant!2471 (index!12063 (_ BitVec 32))) )
))
(declare-fun lt!150503 () SeekEntryResult!2471)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15489 (_ BitVec 32)) SeekEntryResult!2471)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304674 (= lt!150503 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304675 () Bool)

(declare-fun res!162019 () Bool)

(declare-fun e!191441 () Bool)

(assert (=> b!304675 (=> (not res!162019) (not e!191441))))

(declare-fun arrayContainsKey!0 (array!15489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304675 (= res!162019 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304676 () Bool)

(declare-fun res!162020 () Bool)

(assert (=> b!304676 (=> (not res!162020) (not e!191441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15489 (_ BitVec 32)) Bool)

(assert (=> b!304676 (= res!162020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304677 () Bool)

(declare-fun e!191442 () Bool)

(assert (=> b!304677 (= e!191442 e!191443)))

(declare-fun res!162027 () Bool)

(assert (=> b!304677 (=> (not res!162027) (not e!191443))))

(declare-fun lt!150504 () SeekEntryResult!2471)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304677 (= res!162027 (and (= lt!150503 lt!150504) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7331 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7331 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7331 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304677 (= lt!150503 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304679 () Bool)

(declare-fun res!162024 () Bool)

(assert (=> b!304679 (=> (not res!162024) (not e!191441))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304679 (= res!162024 (and (= (size!7683 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7683 a!3293))))))

(declare-fun b!304680 () Bool)

(declare-fun res!162023 () Bool)

(assert (=> b!304680 (=> (not res!162023) (not e!191441))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15489 (_ BitVec 32)) SeekEntryResult!2471)

(assert (=> b!304680 (= res!162023 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2471 i!1240)))))

(declare-fun b!304681 () Bool)

(declare-fun res!162026 () Bool)

(assert (=> b!304681 (=> (not res!162026) (not e!191441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304681 (= res!162026 (validKeyInArray!0 k!2441))))

(declare-fun b!304682 () Bool)

(declare-fun res!162025 () Bool)

(assert (=> b!304682 (=> (not res!162025) (not e!191442))))

(assert (=> b!304682 (= res!162025 (and (= (select (arr!7331 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7683 a!3293))))))

(declare-fun b!304678 () Bool)

(assert (=> b!304678 (= e!191441 e!191442)))

(declare-fun res!162021 () Bool)

(assert (=> b!304678 (=> (not res!162021) (not e!191442))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304678 (= res!162021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150504))))

(assert (=> b!304678 (= lt!150504 (Intermediate!2471 false resIndex!52 resX!52))))

(declare-fun res!162022 () Bool)

(assert (=> start!30434 (=> (not res!162022) (not e!191441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30434 (= res!162022 (validMask!0 mask!3709))))

(assert (=> start!30434 e!191441))

(declare-fun array_inv!5294 (array!15489) Bool)

(assert (=> start!30434 (array_inv!5294 a!3293)))

(assert (=> start!30434 true))

(assert (= (and start!30434 res!162022) b!304679))

(assert (= (and b!304679 res!162024) b!304681))

(assert (= (and b!304681 res!162026) b!304675))

(assert (= (and b!304675 res!162019) b!304680))

(assert (= (and b!304680 res!162023) b!304676))

(assert (= (and b!304676 res!162020) b!304678))

(assert (= (and b!304678 res!162021) b!304682))

(assert (= (and b!304682 res!162025) b!304677))

(assert (= (and b!304677 res!162027) b!304674))

(declare-fun m!315761 () Bool)

(assert (=> b!304677 m!315761))

(declare-fun m!315763 () Bool)

(assert (=> b!304677 m!315763))

(declare-fun m!315765 () Bool)

(assert (=> b!304681 m!315765))

(declare-fun m!315767 () Bool)

(assert (=> b!304680 m!315767))

(declare-fun m!315769 () Bool)

(assert (=> b!304674 m!315769))

(assert (=> b!304674 m!315769))

(declare-fun m!315771 () Bool)

(assert (=> b!304674 m!315771))

(declare-fun m!315773 () Bool)

(assert (=> b!304675 m!315773))

(declare-fun m!315775 () Bool)

(assert (=> start!30434 m!315775))

(declare-fun m!315777 () Bool)

(assert (=> start!30434 m!315777))

(declare-fun m!315779 () Bool)

(assert (=> b!304682 m!315779))

(declare-fun m!315781 () Bool)

(assert (=> b!304676 m!315781))

(declare-fun m!315783 () Bool)

(assert (=> b!304678 m!315783))

(assert (=> b!304678 m!315783))

(declare-fun m!315785 () Bool)

(assert (=> b!304678 m!315785))

(push 1)

