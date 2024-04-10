; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31438 () Bool)

(assert start!31438)

(declare-fun b!314853 () Bool)

(declare-fun e!196048 () Bool)

(assert (=> b!314853 (= e!196048 (not false))))

(declare-datatypes ((SeekEntryResult!2745 0))(
  ( (MissingZero!2745 (index!13156 (_ BitVec 32))) (Found!2745 (index!13157 (_ BitVec 32))) (Intermediate!2745 (undefined!3557 Bool) (index!13158 (_ BitVec 32)) (x!31389 (_ BitVec 32))) (Undefined!2745) (MissingVacant!2745 (index!13159 (_ BitVec 32))) )
))
(declare-fun lt!154040 () SeekEntryResult!2745)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314853 (= lt!154040 (Intermediate!2745 false index!1781 resX!52))))

(declare-fun b!314854 () Bool)

(declare-fun e!196046 () Bool)

(declare-fun e!196045 () Bool)

(assert (=> b!314854 (= e!196046 e!196045)))

(declare-fun res!170469 () Bool)

(assert (=> b!314854 (=> (not res!170469) (not e!196045))))

(declare-fun lt!154041 () SeekEntryResult!2745)

(declare-datatypes ((array!16064 0))(
  ( (array!16065 (arr!7605 (Array (_ BitVec 32) (_ BitVec 64))) (size!7957 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16064)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16064 (_ BitVec 32)) SeekEntryResult!2745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314854 (= res!170469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154041))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!314854 (= lt!154041 (Intermediate!2745 false resIndex!52 resX!52))))

(declare-fun b!314855 () Bool)

(declare-fun res!170467 () Bool)

(assert (=> b!314855 (=> (not res!170467) (not e!196046))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314855 (= res!170467 (and (= (size!7957 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7957 a!3293))))))

(declare-fun b!314856 () Bool)

(declare-fun res!170463 () Bool)

(assert (=> b!314856 (=> (not res!170463) (not e!196046))))

(declare-fun arrayContainsKey!0 (array!16064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314856 (= res!170463 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314857 () Bool)

(declare-fun res!170466 () Bool)

(assert (=> b!314857 (=> (not res!170466) (not e!196045))))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!314857 (= res!170466 (and (= (select (arr!7605 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7957 a!3293))))))

(declare-fun res!170464 () Bool)

(assert (=> start!31438 (=> (not res!170464) (not e!196046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31438 (= res!170464 (validMask!0 mask!3709))))

(assert (=> start!31438 e!196046))

(declare-fun array_inv!5568 (array!16064) Bool)

(assert (=> start!31438 (array_inv!5568 a!3293)))

(assert (=> start!31438 true))

(declare-fun b!314858 () Bool)

(assert (=> b!314858 (= e!196045 e!196048)))

(declare-fun res!170461 () Bool)

(assert (=> b!314858 (=> (not res!170461) (not e!196048))))

(assert (=> b!314858 (= res!170461 (and (= lt!154040 lt!154041) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7605 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7605 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7605 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314858 (= lt!154040 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314859 () Bool)

(declare-fun res!170462 () Bool)

(assert (=> b!314859 (=> (not res!170462) (not e!196046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314859 (= res!170462 (validKeyInArray!0 k0!2441))))

(declare-fun b!314860 () Bool)

(declare-fun res!170468 () Bool)

(assert (=> b!314860 (=> (not res!170468) (not e!196046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16064 (_ BitVec 32)) Bool)

(assert (=> b!314860 (= res!170468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314861 () Bool)

(declare-fun res!170465 () Bool)

(assert (=> b!314861 (=> (not res!170465) (not e!196046))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16064 (_ BitVec 32)) SeekEntryResult!2745)

(assert (=> b!314861 (= res!170465 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2745 i!1240)))))

(assert (= (and start!31438 res!170464) b!314855))

(assert (= (and b!314855 res!170467) b!314859))

(assert (= (and b!314859 res!170462) b!314856))

(assert (= (and b!314856 res!170463) b!314861))

(assert (= (and b!314861 res!170465) b!314860))

(assert (= (and b!314860 res!170468) b!314854))

(assert (= (and b!314854 res!170469) b!314857))

(assert (= (and b!314857 res!170466) b!314858))

(assert (= (and b!314858 res!170461) b!314853))

(declare-fun m!324279 () Bool)

(assert (=> b!314856 m!324279))

(declare-fun m!324281 () Bool)

(assert (=> b!314858 m!324281))

(declare-fun m!324283 () Bool)

(assert (=> b!314858 m!324283))

(declare-fun m!324285 () Bool)

(assert (=> b!314854 m!324285))

(assert (=> b!314854 m!324285))

(declare-fun m!324287 () Bool)

(assert (=> b!314854 m!324287))

(declare-fun m!324289 () Bool)

(assert (=> b!314859 m!324289))

(declare-fun m!324291 () Bool)

(assert (=> b!314857 m!324291))

(declare-fun m!324293 () Bool)

(assert (=> start!31438 m!324293))

(declare-fun m!324295 () Bool)

(assert (=> start!31438 m!324295))

(declare-fun m!324297 () Bool)

(assert (=> b!314860 m!324297))

(declare-fun m!324299 () Bool)

(assert (=> b!314861 m!324299))

(check-sat (not b!314858) (not b!314860) (not b!314861) (not b!314854) (not b!314856) (not b!314859) (not start!31438))
(check-sat)
