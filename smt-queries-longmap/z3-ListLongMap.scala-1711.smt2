; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31488 () Bool)

(assert start!31488)

(declare-fun b!315178 () Bool)

(declare-fun res!170682 () Bool)

(declare-fun e!196219 () Bool)

(assert (=> b!315178 (=> (not res!170682) (not e!196219))))

(declare-datatypes ((array!16076 0))(
  ( (array!16077 (arr!7609 (Array (_ BitVec 32) (_ BitVec 64))) (size!7961 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16076)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315178 (= res!170682 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315179 () Bool)

(declare-fun e!196221 () Bool)

(declare-fun e!196220 () Bool)

(assert (=> b!315179 (= e!196221 e!196220)))

(declare-fun res!170677 () Bool)

(assert (=> b!315179 (=> (not res!170677) (not e!196220))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2714 0))(
  ( (MissingZero!2714 (index!13032 (_ BitVec 32))) (Found!2714 (index!13033 (_ BitVec 32))) (Intermediate!2714 (undefined!3526 Bool) (index!13034 (_ BitVec 32)) (x!31380 (_ BitVec 32))) (Undefined!2714) (MissingVacant!2714 (index!13035 (_ BitVec 32))) )
))
(declare-fun lt!154202 () SeekEntryResult!2714)

(declare-fun lt!154201 () SeekEntryResult!2714)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!315179 (= res!170677 (and (= lt!154201 lt!154202) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7609 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7609 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7609 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16076 (_ BitVec 32)) SeekEntryResult!2714)

(assert (=> b!315179 (= lt!154201 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!315180 () Bool)

(declare-fun res!170683 () Bool)

(assert (=> b!315180 (=> (not res!170683) (not e!196219))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315180 (= res!170683 (and (= (size!7961 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7961 a!3293))))))

(declare-fun res!170679 () Bool)

(assert (=> start!31488 (=> (not res!170679) (not e!196219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31488 (= res!170679 (validMask!0 mask!3709))))

(assert (=> start!31488 e!196219))

(declare-fun array_inv!5559 (array!16076) Bool)

(assert (=> start!31488 (array_inv!5559 a!3293)))

(assert (=> start!31488 true))

(declare-fun b!315181 () Bool)

(assert (=> b!315181 (= e!196219 e!196221)))

(declare-fun res!170678 () Bool)

(assert (=> b!315181 (=> (not res!170678) (not e!196221))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315181 (= res!170678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154202))))

(assert (=> b!315181 (= lt!154202 (Intermediate!2714 false resIndex!52 resX!52))))

(declare-fun b!315182 () Bool)

(declare-fun res!170681 () Bool)

(assert (=> b!315182 (=> (not res!170681) (not e!196221))))

(assert (=> b!315182 (= res!170681 (and (= (select (arr!7609 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7961 a!3293))))))

(declare-fun b!315183 () Bool)

(declare-fun res!170685 () Bool)

(assert (=> b!315183 (=> (not res!170685) (not e!196219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315183 (= res!170685 (validKeyInArray!0 k0!2441))))

(declare-fun b!315184 () Bool)

(declare-fun lt!154203 () SeekEntryResult!2714)

(get-info :version)

(assert (=> b!315184 (= e!196220 (not ((_ is Intermediate!2714) lt!154203)))))

(assert (=> b!315184 (= lt!154201 lt!154203)))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315184 (= lt!154203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315185 () Bool)

(declare-fun res!170680 () Bool)

(assert (=> b!315185 (=> (not res!170680) (not e!196219))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16076 (_ BitVec 32)) SeekEntryResult!2714)

(assert (=> b!315185 (= res!170680 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2714 i!1240)))))

(declare-fun b!315186 () Bool)

(declare-fun res!170684 () Bool)

(assert (=> b!315186 (=> (not res!170684) (not e!196219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16076 (_ BitVec 32)) Bool)

(assert (=> b!315186 (= res!170684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31488 res!170679) b!315180))

(assert (= (and b!315180 res!170683) b!315183))

(assert (= (and b!315183 res!170685) b!315178))

(assert (= (and b!315178 res!170682) b!315185))

(assert (= (and b!315185 res!170680) b!315186))

(assert (= (and b!315186 res!170684) b!315181))

(assert (= (and b!315181 res!170678) b!315182))

(assert (= (and b!315182 res!170681) b!315179))

(assert (= (and b!315179 res!170677) b!315184))

(declare-fun m!324685 () Bool)

(assert (=> b!315186 m!324685))

(declare-fun m!324687 () Bool)

(assert (=> b!315184 m!324687))

(assert (=> b!315184 m!324687))

(declare-fun m!324689 () Bool)

(assert (=> b!315184 m!324689))

(declare-fun m!324691 () Bool)

(assert (=> b!315182 m!324691))

(declare-fun m!324693 () Bool)

(assert (=> b!315178 m!324693))

(declare-fun m!324695 () Bool)

(assert (=> b!315179 m!324695))

(declare-fun m!324697 () Bool)

(assert (=> b!315179 m!324697))

(declare-fun m!324699 () Bool)

(assert (=> b!315183 m!324699))

(declare-fun m!324701 () Bool)

(assert (=> b!315185 m!324701))

(declare-fun m!324703 () Bool)

(assert (=> start!31488 m!324703))

(declare-fun m!324705 () Bool)

(assert (=> start!31488 m!324705))

(declare-fun m!324707 () Bool)

(assert (=> b!315181 m!324707))

(assert (=> b!315181 m!324707))

(declare-fun m!324709 () Bool)

(assert (=> b!315181 m!324709))

(check-sat (not b!315178) (not b!315179) (not b!315185) (not b!315183) (not b!315186) (not b!315181) (not b!315184) (not start!31488))
(check-sat)
