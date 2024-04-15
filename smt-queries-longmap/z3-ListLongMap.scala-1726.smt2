; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31794 () Bool)

(assert start!31794)

(declare-fun b!317487 () Bool)

(declare-fun e!197353 () Bool)

(declare-fun e!197352 () Bool)

(assert (=> b!317487 (= e!197353 e!197352)))

(declare-fun res!172218 () Bool)

(assert (=> b!317487 (=> (not res!172218) (not e!197352))))

(declare-datatypes ((array!16169 0))(
  ( (array!16170 (arr!7650 (Array (_ BitVec 32) (_ BitVec 64))) (size!8003 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16169)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2789 0))(
  ( (MissingZero!2789 (index!13332 (_ BitVec 32))) (Found!2789 (index!13333 (_ BitVec 32))) (Intermediate!2789 (undefined!3601 Bool) (index!13334 (_ BitVec 32)) (x!31609 (_ BitVec 32))) (Undefined!2789) (MissingVacant!2789 (index!13335 (_ BitVec 32))) )
))
(declare-fun lt!154845 () SeekEntryResult!2789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16169 (_ BitVec 32)) SeekEntryResult!2789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317487 (= res!172218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154845))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317487 (= lt!154845 (Intermediate!2789 false resIndex!52 resX!52))))

(declare-fun b!317488 () Bool)

(declare-fun res!172220 () Bool)

(assert (=> b!317488 (=> (not res!172220) (not e!197353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16169 (_ BitVec 32)) Bool)

(assert (=> b!317488 (= res!172220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317489 () Bool)

(declare-fun res!172216 () Bool)

(assert (=> b!317489 (=> (not res!172216) (not e!197353))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317489 (= res!172216 (and (= (size!8003 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8003 a!3293))))))

(declare-fun b!317490 () Bool)

(declare-fun e!197350 () Bool)

(assert (=> b!317490 (= e!197352 e!197350)))

(declare-fun res!172215 () Bool)

(assert (=> b!317490 (=> (not res!172215) (not e!197350))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!154846 () SeekEntryResult!2789)

(assert (=> b!317490 (= res!172215 (and (= lt!154846 lt!154845) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7650 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317490 (= lt!154846 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317491 () Bool)

(declare-fun res!172213 () Bool)

(assert (=> b!317491 (=> (not res!172213) (not e!197353))))

(declare-fun arrayContainsKey!0 (array!16169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317491 (= res!172213 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317492 () Bool)

(declare-fun res!172217 () Bool)

(assert (=> b!317492 (=> (not res!172217) (not e!197352))))

(assert (=> b!317492 (= res!172217 (and (= (select (arr!7650 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8003 a!3293))))))

(declare-fun b!317493 () Bool)

(declare-fun lt!154847 () (_ BitVec 32))

(declare-fun e!197351 () Bool)

(declare-fun lt!154844 () array!16169)

(assert (=> b!317493 (= e!197351 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154844 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154847 k0!2441 lt!154844 mask!3709)))))

(assert (=> b!317493 (= lt!154844 (array!16170 (store (arr!7650 a!3293) i!1240 k0!2441) (size!8003 a!3293)))))

(declare-fun b!317494 () Bool)

(declare-fun res!172221 () Bool)

(assert (=> b!317494 (=> (not res!172221) (not e!197353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317494 (= res!172221 (validKeyInArray!0 k0!2441))))

(declare-fun b!317495 () Bool)

(assert (=> b!317495 (= e!197350 (not true))))

(assert (=> b!317495 e!197351))

(declare-fun res!172214 () Bool)

(assert (=> b!317495 (=> (not res!172214) (not e!197351))))

(assert (=> b!317495 (= res!172214 (= lt!154846 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154847 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317495 (= lt!154847 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317496 () Bool)

(declare-fun res!172219 () Bool)

(assert (=> b!317496 (=> (not res!172219) (not e!197353))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16169 (_ BitVec 32)) SeekEntryResult!2789)

(assert (=> b!317496 (= res!172219 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2789 i!1240)))))

(declare-fun res!172212 () Bool)

(assert (=> start!31794 (=> (not res!172212) (not e!197353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31794 (= res!172212 (validMask!0 mask!3709))))

(assert (=> start!31794 e!197353))

(declare-fun array_inv!5622 (array!16169) Bool)

(assert (=> start!31794 (array_inv!5622 a!3293)))

(assert (=> start!31794 true))

(assert (= (and start!31794 res!172212) b!317489))

(assert (= (and b!317489 res!172216) b!317494))

(assert (= (and b!317494 res!172221) b!317491))

(assert (= (and b!317491 res!172213) b!317496))

(assert (= (and b!317496 res!172219) b!317488))

(assert (= (and b!317488 res!172220) b!317487))

(assert (= (and b!317487 res!172218) b!317492))

(assert (= (and b!317492 res!172217) b!317490))

(assert (= (and b!317490 res!172215) b!317495))

(assert (= (and b!317495 res!172214) b!317493))

(declare-fun m!325687 () Bool)

(assert (=> b!317487 m!325687))

(assert (=> b!317487 m!325687))

(declare-fun m!325689 () Bool)

(assert (=> b!317487 m!325689))

(declare-fun m!325691 () Bool)

(assert (=> b!317496 m!325691))

(declare-fun m!325693 () Bool)

(assert (=> b!317494 m!325693))

(declare-fun m!325695 () Bool)

(assert (=> b!317493 m!325695))

(declare-fun m!325697 () Bool)

(assert (=> b!317493 m!325697))

(declare-fun m!325699 () Bool)

(assert (=> b!317493 m!325699))

(declare-fun m!325701 () Bool)

(assert (=> start!31794 m!325701))

(declare-fun m!325703 () Bool)

(assert (=> start!31794 m!325703))

(declare-fun m!325705 () Bool)

(assert (=> b!317491 m!325705))

(declare-fun m!325707 () Bool)

(assert (=> b!317495 m!325707))

(declare-fun m!325709 () Bool)

(assert (=> b!317495 m!325709))

(declare-fun m!325711 () Bool)

(assert (=> b!317492 m!325711))

(declare-fun m!325713 () Bool)

(assert (=> b!317490 m!325713))

(declare-fun m!325715 () Bool)

(assert (=> b!317490 m!325715))

(declare-fun m!325717 () Bool)

(assert (=> b!317488 m!325717))

(check-sat (not b!317487) (not b!317496) (not b!317490) (not b!317494) (not b!317493) (not b!317495) (not b!317488) (not b!317491) (not start!31794))
(check-sat)
