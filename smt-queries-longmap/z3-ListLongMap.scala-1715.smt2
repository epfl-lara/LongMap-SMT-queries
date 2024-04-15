; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31566 () Bool)

(assert start!31566)

(declare-fun res!170982 () Bool)

(declare-fun e!196387 () Bool)

(assert (=> start!31566 (=> (not res!170982) (not e!196387))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31566 (= res!170982 (validMask!0 mask!3709))))

(assert (=> start!31566 e!196387))

(declare-datatypes ((array!16094 0))(
  ( (array!16095 (arr!7617 (Array (_ BitVec 32) (_ BitVec 64))) (size!7970 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16094)

(declare-fun array_inv!5589 (array!16094) Bool)

(assert (=> start!31566 (array_inv!5589 a!3293)))

(assert (=> start!31566 true))

(declare-fun b!315623 () Bool)

(declare-fun res!170985 () Bool)

(assert (=> b!315623 (=> (not res!170985) (not e!196387))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315623 (= res!170985 (and (= (size!7970 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7970 a!3293))))))

(declare-fun b!315624 () Bool)

(declare-fun res!170981 () Bool)

(declare-fun e!196390 () Bool)

(assert (=> b!315624 (=> (not res!170981) (not e!196390))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315624 (= res!170981 (and (= (select (arr!7617 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7970 a!3293))))))

(declare-fun b!315625 () Bool)

(declare-fun res!170983 () Bool)

(assert (=> b!315625 (=> (not res!170983) (not e!196387))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315625 (= res!170983 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315626 () Bool)

(declare-fun res!170986 () Bool)

(assert (=> b!315626 (=> (not res!170986) (not e!196387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315626 (= res!170986 (validKeyInArray!0 k0!2441))))

(declare-fun b!315627 () Bool)

(assert (=> b!315627 false))

(declare-datatypes ((Unit!9701 0))(
  ( (Unit!9702) )
))
(declare-fun e!196391 () Unit!9701)

(declare-fun Unit!9703 () Unit!9701)

(assert (=> b!315627 (= e!196391 Unit!9703)))

(declare-fun b!315628 () Bool)

(assert (=> b!315628 (= e!196390 (not (= (select (arr!7617 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!315628 (= index!1781 resIndex!52)))

(declare-fun lt!154168 () Unit!9701)

(declare-fun e!196389 () Unit!9701)

(assert (=> b!315628 (= lt!154168 e!196389)))

(declare-fun c!49940 () Bool)

(assert (=> b!315628 (= c!49940 (not (= resIndex!52 index!1781)))))

(declare-fun b!315629 () Bool)

(declare-fun res!170980 () Bool)

(assert (=> b!315629 (=> (not res!170980) (not e!196390))))

(assert (=> b!315629 (= res!170980 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7617 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315630 () Bool)

(declare-fun Unit!9704 () Unit!9701)

(assert (=> b!315630 (= e!196389 Unit!9704)))

(declare-fun b!315631 () Bool)

(declare-fun res!170987 () Bool)

(assert (=> b!315631 (=> (not res!170987) (not e!196387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16094 (_ BitVec 32)) Bool)

(assert (=> b!315631 (= res!170987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315632 () Bool)

(assert (=> b!315632 false))

(declare-datatypes ((SeekEntryResult!2756 0))(
  ( (MissingZero!2756 (index!13200 (_ BitVec 32))) (Found!2756 (index!13201 (_ BitVec 32))) (Intermediate!2756 (undefined!3568 Bool) (index!13202 (_ BitVec 32)) (x!31461 (_ BitVec 32))) (Undefined!2756) (MissingVacant!2756 (index!13203 (_ BitVec 32))) )
))
(declare-fun lt!154169 () SeekEntryResult!2756)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16094 (_ BitVec 32)) SeekEntryResult!2756)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315632 (= lt!154169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9705 () Unit!9701)

(assert (=> b!315632 (= e!196391 Unit!9705)))

(declare-fun b!315633 () Bool)

(declare-fun res!170984 () Bool)

(assert (=> b!315633 (=> (not res!170984) (not e!196387))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16094 (_ BitVec 32)) SeekEntryResult!2756)

(assert (=> b!315633 (= res!170984 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2756 i!1240)))))

(declare-fun b!315634 () Bool)

(assert (=> b!315634 (= e!196389 e!196391)))

(declare-fun c!49939 () Bool)

(assert (=> b!315634 (= c!49939 (or (= (select (arr!7617 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7617 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315635 () Bool)

(declare-fun res!170988 () Bool)

(assert (=> b!315635 (=> (not res!170988) (not e!196390))))

(declare-fun lt!154167 () SeekEntryResult!2756)

(assert (=> b!315635 (= res!170988 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154167))))

(declare-fun b!315636 () Bool)

(assert (=> b!315636 (= e!196387 e!196390)))

(declare-fun res!170979 () Bool)

(assert (=> b!315636 (=> (not res!170979) (not e!196390))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315636 (= res!170979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154167))))

(assert (=> b!315636 (= lt!154167 (Intermediate!2756 false resIndex!52 resX!52))))

(assert (= (and start!31566 res!170982) b!315623))

(assert (= (and b!315623 res!170985) b!315626))

(assert (= (and b!315626 res!170986) b!315625))

(assert (= (and b!315625 res!170983) b!315633))

(assert (= (and b!315633 res!170984) b!315631))

(assert (= (and b!315631 res!170987) b!315636))

(assert (= (and b!315636 res!170979) b!315624))

(assert (= (and b!315624 res!170981) b!315635))

(assert (= (and b!315635 res!170988) b!315629))

(assert (= (and b!315629 res!170980) b!315628))

(assert (= (and b!315628 c!49940) b!315634))

(assert (= (and b!315628 (not c!49940)) b!315630))

(assert (= (and b!315634 c!49939) b!315627))

(assert (= (and b!315634 (not c!49939)) b!315632))

(declare-fun m!324259 () Bool)

(assert (=> b!315628 m!324259))

(declare-fun m!324261 () Bool)

(assert (=> start!31566 m!324261))

(declare-fun m!324263 () Bool)

(assert (=> start!31566 m!324263))

(assert (=> b!315629 m!324259))

(declare-fun m!324265 () Bool)

(assert (=> b!315633 m!324265))

(declare-fun m!324267 () Bool)

(assert (=> b!315636 m!324267))

(assert (=> b!315636 m!324267))

(declare-fun m!324269 () Bool)

(assert (=> b!315636 m!324269))

(declare-fun m!324271 () Bool)

(assert (=> b!315631 m!324271))

(declare-fun m!324273 () Bool)

(assert (=> b!315626 m!324273))

(declare-fun m!324275 () Bool)

(assert (=> b!315632 m!324275))

(assert (=> b!315632 m!324275))

(declare-fun m!324277 () Bool)

(assert (=> b!315632 m!324277))

(declare-fun m!324279 () Bool)

(assert (=> b!315625 m!324279))

(declare-fun m!324281 () Bool)

(assert (=> b!315635 m!324281))

(declare-fun m!324283 () Bool)

(assert (=> b!315624 m!324283))

(assert (=> b!315634 m!324259))

(check-sat (not b!315631) (not b!315625) (not b!315636) (not b!315632) (not start!31566) (not b!315635) (not b!315633) (not b!315626))
(check-sat)
