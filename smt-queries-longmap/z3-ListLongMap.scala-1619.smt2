; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30426 () Bool)

(assert start!30426)

(declare-fun b!304702 () Bool)

(declare-fun e!191444 () Bool)

(declare-fun e!191443 () Bool)

(assert (=> b!304702 (= e!191444 e!191443)))

(declare-fun res!162103 () Bool)

(assert (=> b!304702 (=> (not res!162103) (not e!191443))))

(declare-datatypes ((array!15494 0))(
  ( (array!15495 (arr!7333 (Array (_ BitVec 32) (_ BitVec 64))) (size!7685 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15494)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2438 0))(
  ( (MissingZero!2438 (index!11928 (_ BitVec 32))) (Found!2438 (index!11929 (_ BitVec 32))) (Intermediate!2438 (undefined!3250 Bool) (index!11930 (_ BitVec 32)) (x!30293 (_ BitVec 32))) (Undefined!2438) (MissingVacant!2438 (index!11931 (_ BitVec 32))) )
))
(declare-fun lt!150540 () SeekEntryResult!2438)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lt!150539 () SeekEntryResult!2438)

(assert (=> b!304702 (= res!162103 (and (= lt!150540 lt!150539) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7333 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7333 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7333 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15494 (_ BitVec 32)) SeekEntryResult!2438)

(assert (=> b!304702 (= lt!150540 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304703 () Bool)

(declare-fun res!162098 () Bool)

(declare-fun e!191445 () Bool)

(assert (=> b!304703 (=> (not res!162098) (not e!191445))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15494 (_ BitVec 32)) SeekEntryResult!2438)

(assert (=> b!304703 (= res!162098 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2438 i!1240)))))

(declare-fun b!304704 () Bool)

(declare-fun res!162099 () Bool)

(assert (=> b!304704 (=> (not res!162099) (not e!191445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304704 (= res!162099 (validKeyInArray!0 k0!2441))))

(declare-fun b!304706 () Bool)

(declare-fun res!162101 () Bool)

(assert (=> b!304706 (=> (not res!162101) (not e!191445))))

(declare-fun arrayContainsKey!0 (array!15494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304706 (= res!162101 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304707 () Bool)

(declare-fun res!162100 () Bool)

(assert (=> b!304707 (=> (not res!162100) (not e!191444))))

(assert (=> b!304707 (= res!162100 (and (= (select (arr!7333 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7685 a!3293))))))

(declare-fun b!304708 () Bool)

(declare-fun res!162097 () Bool)

(assert (=> b!304708 (=> (not res!162097) (not e!191445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15494 (_ BitVec 32)) Bool)

(assert (=> b!304708 (= res!162097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304709 () Bool)

(assert (=> b!304709 (= e!191445 e!191444)))

(declare-fun res!162105 () Bool)

(assert (=> b!304709 (=> (not res!162105) (not e!191444))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304709 (= res!162105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150539))))

(assert (=> b!304709 (= lt!150539 (Intermediate!2438 false resIndex!52 resX!52))))

(declare-fun b!304710 () Bool)

(assert (=> b!304710 (= e!191443 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304710 (= lt!150540 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!162102 () Bool)

(assert (=> start!30426 (=> (not res!162102) (not e!191445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30426 (= res!162102 (validMask!0 mask!3709))))

(assert (=> start!30426 e!191445))

(declare-fun array_inv!5283 (array!15494) Bool)

(assert (=> start!30426 (array_inv!5283 a!3293)))

(assert (=> start!30426 true))

(declare-fun b!304705 () Bool)

(declare-fun res!162104 () Bool)

(assert (=> b!304705 (=> (not res!162104) (not e!191445))))

(assert (=> b!304705 (= res!162104 (and (= (size!7685 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7685 a!3293))))))

(assert (= (and start!30426 res!162102) b!304705))

(assert (= (and b!304705 res!162104) b!304704))

(assert (= (and b!304704 res!162099) b!304706))

(assert (= (and b!304706 res!162101) b!304703))

(assert (= (and b!304703 res!162098) b!304708))

(assert (= (and b!304708 res!162097) b!304709))

(assert (= (and b!304709 res!162105) b!304707))

(assert (= (and b!304707 res!162100) b!304702))

(assert (= (and b!304702 res!162103) b!304710))

(declare-fun m!315955 () Bool)

(assert (=> b!304706 m!315955))

(declare-fun m!315957 () Bool)

(assert (=> b!304709 m!315957))

(assert (=> b!304709 m!315957))

(declare-fun m!315959 () Bool)

(assert (=> b!304709 m!315959))

(declare-fun m!315961 () Bool)

(assert (=> b!304708 m!315961))

(declare-fun m!315963 () Bool)

(assert (=> b!304707 m!315963))

(declare-fun m!315965 () Bool)

(assert (=> b!304703 m!315965))

(declare-fun m!315967 () Bool)

(assert (=> b!304702 m!315967))

(declare-fun m!315969 () Bool)

(assert (=> b!304702 m!315969))

(declare-fun m!315971 () Bool)

(assert (=> start!30426 m!315971))

(declare-fun m!315973 () Bool)

(assert (=> start!30426 m!315973))

(declare-fun m!315975 () Bool)

(assert (=> b!304704 m!315975))

(declare-fun m!315977 () Bool)

(assert (=> b!304710 m!315977))

(assert (=> b!304710 m!315977))

(declare-fun m!315979 () Bool)

(assert (=> b!304710 m!315979))

(check-sat (not b!304703) (not b!304704) (not b!304709) (not start!30426) (not b!304702) (not b!304710) (not b!304706) (not b!304708))
(check-sat)
