; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31554 () Bool)

(assert start!31554)

(declare-fun res!170927 () Bool)

(declare-fun e!196442 () Bool)

(assert (=> start!31554 (=> (not res!170927) (not e!196442))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31554 (= res!170927 (validMask!0 mask!3709))))

(assert (=> start!31554 e!196442))

(declare-datatypes ((array!16091 0))(
  ( (array!16092 (arr!7615 (Array (_ BitVec 32) (_ BitVec 64))) (size!7967 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16091)

(declare-fun array_inv!5565 (array!16091) Bool)

(assert (=> start!31554 (array_inv!5565 a!3293)))

(assert (=> start!31554 true))

(declare-fun b!315593 () Bool)

(declare-fun e!196443 () Bool)

(assert (=> b!315593 (= e!196442 e!196443)))

(declare-fun res!170925 () Bool)

(assert (=> b!315593 (=> (not res!170925) (not e!196443))))

(declare-datatypes ((SeekEntryResult!2720 0))(
  ( (MissingZero!2720 (index!13056 (_ BitVec 32))) (Found!2720 (index!13057 (_ BitVec 32))) (Intermediate!2720 (undefined!3532 Bool) (index!13058 (_ BitVec 32)) (x!31411 (_ BitVec 32))) (Undefined!2720) (MissingVacant!2720 (index!13059 (_ BitVec 32))) )
))
(declare-fun lt!154366 () SeekEntryResult!2720)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16091 (_ BitVec 32)) SeekEntryResult!2720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315593 (= res!170925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154366))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315593 (= lt!154366 (Intermediate!2720 false resIndex!52 resX!52))))

(declare-fun b!315594 () Bool)

(declare-datatypes ((Unit!9671 0))(
  ( (Unit!9672) )
))
(declare-fun e!196439 () Unit!9671)

(declare-fun Unit!9673 () Unit!9671)

(assert (=> b!315594 (= e!196439 Unit!9673)))

(declare-fun b!315595 () Bool)

(declare-fun e!196440 () Unit!9671)

(assert (=> b!315595 (= e!196439 e!196440)))

(declare-fun c!49952 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315595 (= c!49952 (or (= (select (arr!7615 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7615 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315596 () Bool)

(declare-fun res!170931 () Bool)

(assert (=> b!315596 (=> (not res!170931) (not e!196442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16091 (_ BitVec 32)) Bool)

(assert (=> b!315596 (= res!170931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315597 () Bool)

(declare-fun res!170929 () Bool)

(assert (=> b!315597 (=> (not res!170929) (not e!196442))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315597 (= res!170929 (and (= (size!7967 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7967 a!3293))))))

(declare-fun b!315598 () Bool)

(declare-fun res!170930 () Bool)

(assert (=> b!315598 (=> (not res!170930) (not e!196442))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16091 (_ BitVec 32)) SeekEntryResult!2720)

(assert (=> b!315598 (= res!170930 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2720 i!1240)))))

(declare-fun b!315599 () Bool)

(declare-fun res!170933 () Bool)

(assert (=> b!315599 (=> (not res!170933) (not e!196443))))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!315599 (= res!170933 (and (= (select (arr!7615 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7967 a!3293))))))

(declare-fun b!315600 () Bool)

(declare-fun res!170934 () Bool)

(assert (=> b!315600 (=> (not res!170934) (not e!196443))))

(assert (=> b!315600 (= res!170934 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154366))))

(declare-fun b!315601 () Bool)

(declare-fun res!170926 () Bool)

(assert (=> b!315601 (=> (not res!170926) (not e!196442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315601 (= res!170926 (validKeyInArray!0 k0!2441))))

(declare-fun b!315602 () Bool)

(assert (=> b!315602 (= e!196443 (not (= index!1781 resIndex!52)))))

(declare-fun lt!154367 () Unit!9671)

(assert (=> b!315602 (= lt!154367 e!196439)))

(declare-fun c!49951 () Bool)

(assert (=> b!315602 (= c!49951 (not (= resIndex!52 index!1781)))))

(declare-fun b!315603 () Bool)

(declare-fun res!170932 () Bool)

(assert (=> b!315603 (=> (not res!170932) (not e!196442))))

(declare-fun arrayContainsKey!0 (array!16091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315603 (= res!170932 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315604 () Bool)

(assert (=> b!315604 false))

(declare-fun Unit!9674 () Unit!9671)

(assert (=> b!315604 (= e!196440 Unit!9674)))

(declare-fun b!315605 () Bool)

(assert (=> b!315605 false))

(declare-fun lt!154368 () SeekEntryResult!2720)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315605 (= lt!154368 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9675 () Unit!9671)

(assert (=> b!315605 (= e!196440 Unit!9675)))

(declare-fun b!315606 () Bool)

(declare-fun res!170928 () Bool)

(assert (=> b!315606 (=> (not res!170928) (not e!196443))))

(assert (=> b!315606 (= res!170928 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7615 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(assert (= (and start!31554 res!170927) b!315597))

(assert (= (and b!315597 res!170929) b!315601))

(assert (= (and b!315601 res!170926) b!315603))

(assert (= (and b!315603 res!170932) b!315598))

(assert (= (and b!315598 res!170930) b!315596))

(assert (= (and b!315596 res!170931) b!315593))

(assert (= (and b!315593 res!170925) b!315599))

(assert (= (and b!315599 res!170933) b!315600))

(assert (= (and b!315600 res!170934) b!315606))

(assert (= (and b!315606 res!170928) b!315602))

(assert (= (and b!315602 c!49951) b!315595))

(assert (= (and b!315602 (not c!49951)) b!315594))

(assert (= (and b!315595 c!49952) b!315604))

(assert (= (and b!315595 (not c!49952)) b!315605))

(declare-fun m!324985 () Bool)

(assert (=> b!315596 m!324985))

(declare-fun m!324987 () Bool)

(assert (=> b!315606 m!324987))

(declare-fun m!324989 () Bool)

(assert (=> b!315593 m!324989))

(assert (=> b!315593 m!324989))

(declare-fun m!324991 () Bool)

(assert (=> b!315593 m!324991))

(declare-fun m!324993 () Bool)

(assert (=> b!315605 m!324993))

(assert (=> b!315605 m!324993))

(declare-fun m!324995 () Bool)

(assert (=> b!315605 m!324995))

(declare-fun m!324997 () Bool)

(assert (=> b!315603 m!324997))

(declare-fun m!324999 () Bool)

(assert (=> b!315600 m!324999))

(declare-fun m!325001 () Bool)

(assert (=> start!31554 m!325001))

(declare-fun m!325003 () Bool)

(assert (=> start!31554 m!325003))

(declare-fun m!325005 () Bool)

(assert (=> b!315599 m!325005))

(declare-fun m!325007 () Bool)

(assert (=> b!315598 m!325007))

(assert (=> b!315595 m!324987))

(declare-fun m!325009 () Bool)

(assert (=> b!315601 m!325009))

(check-sat (not b!315605) (not b!315601) (not b!315600) (not b!315603) (not b!315596) (not b!315598) (not start!31554) (not b!315593))
(check-sat)
