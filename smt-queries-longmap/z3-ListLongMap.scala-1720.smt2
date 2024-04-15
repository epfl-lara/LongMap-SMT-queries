; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31704 () Bool)

(assert start!31704)

(declare-fun b!316666 () Bool)

(declare-fun res!171591 () Bool)

(declare-fun e!196922 () Bool)

(assert (=> b!316666 (=> (not res!171591) (not e!196922))))

(declare-datatypes ((array!16130 0))(
  ( (array!16131 (arr!7632 (Array (_ BitVec 32) (_ BitVec 64))) (size!7985 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16130)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316666 (= res!171591 (and (= (size!7985 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7985 a!3293))))))

(declare-fun b!316667 () Bool)

(declare-fun res!171588 () Bool)

(assert (=> b!316667 (=> (not res!171588) (not e!196922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16130 (_ BitVec 32)) Bool)

(assert (=> b!316667 (= res!171588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316668 () Bool)

(declare-fun e!196919 () Bool)

(declare-fun e!196921 () Bool)

(assert (=> b!316668 (= e!196919 e!196921)))

(declare-fun res!171586 () Bool)

(assert (=> b!316668 (=> (not res!171586) (not e!196921))))

(declare-datatypes ((SeekEntryResult!2771 0))(
  ( (MissingZero!2771 (index!13260 (_ BitVec 32))) (Found!2771 (index!13261 (_ BitVec 32))) (Intermediate!2771 (undefined!3583 Bool) (index!13262 (_ BitVec 32)) (x!31534 (_ BitVec 32))) (Undefined!2771) (MissingVacant!2771 (index!13263 (_ BitVec 32))) )
))
(declare-fun lt!154519 () SeekEntryResult!2771)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!154520 () SeekEntryResult!2771)

(declare-fun k0!2441 () (_ BitVec 64))

(assert (=> b!316668 (= res!171586 (and (= lt!154520 lt!154519) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7632 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16130 (_ BitVec 32)) SeekEntryResult!2771)

(assert (=> b!316668 (= lt!154520 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316669 () Bool)

(declare-fun res!171592 () Bool)

(assert (=> b!316669 (=> (not res!171592) (not e!196922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316669 (= res!171592 (validKeyInArray!0 k0!2441))))

(declare-fun b!316670 () Bool)

(declare-fun res!171589 () Bool)

(assert (=> b!316670 (=> (not res!171589) (not e!196922))))

(declare-fun arrayContainsKey!0 (array!16130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316670 (= res!171589 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316671 () Bool)

(assert (=> b!316671 (= e!196922 e!196919)))

(declare-fun res!171594 () Bool)

(assert (=> b!316671 (=> (not res!171594) (not e!196919))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316671 (= res!171594 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154519))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316671 (= lt!154519 (Intermediate!2771 false resIndex!52 resX!52))))

(declare-fun b!316672 () Bool)

(declare-fun res!171590 () Bool)

(assert (=> b!316672 (=> (not res!171590) (not e!196919))))

(assert (=> b!316672 (= res!171590 (and (= (select (arr!7632 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7985 a!3293))))))

(declare-fun b!316673 () Bool)

(declare-fun res!171593 () Bool)

(assert (=> b!316673 (=> (not res!171593) (not e!196922))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16130 (_ BitVec 32)) SeekEntryResult!2771)

(assert (=> b!316673 (= res!171593 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2771 i!1240)))))

(declare-fun b!316674 () Bool)

(assert (=> b!316674 (= e!196921 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316674 (= lt!154520 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!171587 () Bool)

(assert (=> start!31704 (=> (not res!171587) (not e!196922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31704 (= res!171587 (validMask!0 mask!3709))))

(assert (=> start!31704 e!196922))

(declare-fun array_inv!5604 (array!16130) Bool)

(assert (=> start!31704 (array_inv!5604 a!3293)))

(assert (=> start!31704 true))

(assert (= (and start!31704 res!171587) b!316666))

(assert (= (and b!316666 res!171591) b!316669))

(assert (= (and b!316669 res!171592) b!316670))

(assert (= (and b!316670 res!171589) b!316673))

(assert (= (and b!316673 res!171593) b!316667))

(assert (= (and b!316667 res!171588) b!316671))

(assert (= (and b!316671 res!171594) b!316672))

(assert (= (and b!316672 res!171590) b!316668))

(assert (= (and b!316668 res!171586) b!316674))

(declare-fun m!324955 () Bool)

(assert (=> start!31704 m!324955))

(declare-fun m!324957 () Bool)

(assert (=> start!31704 m!324957))

(declare-fun m!324959 () Bool)

(assert (=> b!316674 m!324959))

(assert (=> b!316674 m!324959))

(declare-fun m!324961 () Bool)

(assert (=> b!316674 m!324961))

(declare-fun m!324963 () Bool)

(assert (=> b!316669 m!324963))

(declare-fun m!324965 () Bool)

(assert (=> b!316671 m!324965))

(assert (=> b!316671 m!324965))

(declare-fun m!324967 () Bool)

(assert (=> b!316671 m!324967))

(declare-fun m!324969 () Bool)

(assert (=> b!316668 m!324969))

(declare-fun m!324971 () Bool)

(assert (=> b!316668 m!324971))

(declare-fun m!324973 () Bool)

(assert (=> b!316667 m!324973))

(declare-fun m!324975 () Bool)

(assert (=> b!316673 m!324975))

(declare-fun m!324977 () Bool)

(assert (=> b!316670 m!324977))

(declare-fun m!324979 () Bool)

(assert (=> b!316672 m!324979))

(check-sat (not b!316669) (not b!316674) (not b!316673) (not start!31704) (not b!316670) (not b!316667) (not b!316668) (not b!316671))
(check-sat)
