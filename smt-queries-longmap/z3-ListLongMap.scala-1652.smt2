; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30732 () Bool)

(assert start!30732)

(declare-fun res!164931 () Bool)

(declare-fun e!192703 () Bool)

(assert (=> start!30732 (=> (not res!164931) (not e!192703))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30732 (= res!164931 (validMask!0 mask!3709))))

(assert (=> start!30732 e!192703))

(declare-datatypes ((array!15689 0))(
  ( (array!15690 (arr!7428 (Array (_ BitVec 32) (_ BitVec 64))) (size!7781 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15689)

(declare-fun array_inv!5400 (array!15689) Bool)

(assert (=> start!30732 (array_inv!5400 a!3293)))

(assert (=> start!30732 true))

(declare-fun b!308163 () Bool)

(declare-fun res!164930 () Bool)

(assert (=> b!308163 (=> (not res!164930) (not e!192703))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308163 (= res!164930 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308164 () Bool)

(declare-fun res!164929 () Bool)

(assert (=> b!308164 (=> (not res!164929) (not e!192703))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2567 0))(
  ( (MissingZero!2567 (index!12444 (_ BitVec 32))) (Found!2567 (index!12445 (_ BitVec 32))) (Intermediate!2567 (undefined!3379 Bool) (index!12446 (_ BitVec 32)) (x!30702 (_ BitVec 32))) (Undefined!2567) (MissingVacant!2567 (index!12447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15689 (_ BitVec 32)) SeekEntryResult!2567)

(assert (=> b!308164 (= res!164929 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2567 i!1240)))))

(declare-fun b!308165 () Bool)

(declare-fun res!164924 () Bool)

(assert (=> b!308165 (=> (not res!164924) (not e!192703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15689 (_ BitVec 32)) Bool)

(assert (=> b!308165 (= res!164924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308166 () Bool)

(declare-fun e!192704 () Bool)

(assert (=> b!308166 (= e!192704 false)))

(declare-fun lt!151133 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308166 (= lt!151133 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308167 () Bool)

(declare-fun res!164928 () Bool)

(assert (=> b!308167 (=> (not res!164928) (not e!192704))))

(declare-fun lt!151132 () SeekEntryResult!2567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15689 (_ BitVec 32)) SeekEntryResult!2567)

(assert (=> b!308167 (= res!164928 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151132))))

(declare-fun b!308168 () Bool)

(declare-fun res!164925 () Bool)

(assert (=> b!308168 (=> (not res!164925) (not e!192703))))

(assert (=> b!308168 (= res!164925 (and (= (size!7781 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7781 a!3293))))))

(declare-fun b!308169 () Bool)

(declare-fun res!164927 () Bool)

(assert (=> b!308169 (=> (not res!164927) (not e!192704))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308169 (= res!164927 (and (= (select (arr!7428 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7781 a!3293))))))

(declare-fun b!308170 () Bool)

(assert (=> b!308170 (= e!192703 e!192704)))

(declare-fun res!164922 () Bool)

(assert (=> b!308170 (=> (not res!164922) (not e!192704))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308170 (= res!164922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151132))))

(assert (=> b!308170 (= lt!151132 (Intermediate!2567 false resIndex!52 resX!52))))

(declare-fun b!308171 () Bool)

(declare-fun res!164923 () Bool)

(assert (=> b!308171 (=> (not res!164923) (not e!192703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308171 (= res!164923 (validKeyInArray!0 k0!2441))))

(declare-fun b!308172 () Bool)

(declare-fun res!164926 () Bool)

(assert (=> b!308172 (=> (not res!164926) (not e!192704))))

(assert (=> b!308172 (= res!164926 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7428 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (= (and start!30732 res!164931) b!308168))

(assert (= (and b!308168 res!164925) b!308171))

(assert (= (and b!308171 res!164923) b!308163))

(assert (= (and b!308163 res!164930) b!308164))

(assert (= (and b!308164 res!164929) b!308165))

(assert (= (and b!308165 res!164924) b!308170))

(assert (= (and b!308170 res!164922) b!308169))

(assert (= (and b!308169 res!164927) b!308167))

(assert (= (and b!308167 res!164928) b!308172))

(assert (= (and b!308172 res!164926) b!308166))

(declare-fun m!317761 () Bool)

(assert (=> b!308172 m!317761))

(declare-fun m!317763 () Bool)

(assert (=> b!308165 m!317763))

(declare-fun m!317765 () Bool)

(assert (=> b!308169 m!317765))

(declare-fun m!317767 () Bool)

(assert (=> start!30732 m!317767))

(declare-fun m!317769 () Bool)

(assert (=> start!30732 m!317769))

(declare-fun m!317771 () Bool)

(assert (=> b!308163 m!317771))

(declare-fun m!317773 () Bool)

(assert (=> b!308167 m!317773))

(declare-fun m!317775 () Bool)

(assert (=> b!308164 m!317775))

(declare-fun m!317777 () Bool)

(assert (=> b!308170 m!317777))

(assert (=> b!308170 m!317777))

(declare-fun m!317779 () Bool)

(assert (=> b!308170 m!317779))

(declare-fun m!317781 () Bool)

(assert (=> b!308171 m!317781))

(declare-fun m!317783 () Bool)

(assert (=> b!308166 m!317783))

(check-sat (not b!308170) (not b!308165) (not b!308164) (not b!308171) (not start!30732) (not b!308166) (not b!308163) (not b!308167))
(check-sat)
