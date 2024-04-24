; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31776 () Bool)

(assert start!31776)

(declare-fun b!317440 () Bool)

(declare-fun res!172071 () Bool)

(declare-fun e!197358 () Bool)

(assert (=> b!317440 (=> (not res!172071) (not e!197358))))

(declare-datatypes ((array!16160 0))(
  ( (array!16161 (arr!7645 (Array (_ BitVec 32) (_ BitVec 64))) (size!7997 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16160)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317440 (= res!172071 (and (= (size!7997 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7997 a!3293))))))

(declare-fun b!317441 () Bool)

(declare-fun res!172069 () Bool)

(assert (=> b!317441 (=> (not res!172069) (not e!197358))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317441 (= res!172069 (validKeyInArray!0 k0!2441))))

(declare-fun b!317442 () Bool)

(declare-fun res!172070 () Bool)

(assert (=> b!317442 (=> (not res!172070) (not e!197358))))

(declare-fun arrayContainsKey!0 (array!16160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317442 (= res!172070 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317443 () Bool)

(declare-fun e!197360 () Bool)

(declare-fun e!197359 () Bool)

(assert (=> b!317443 (= e!197360 e!197359)))

(declare-fun res!172068 () Bool)

(assert (=> b!317443 (=> (not res!172068) (not e!197359))))

(declare-datatypes ((SeekEntryResult!2750 0))(
  ( (MissingZero!2750 (index!13176 (_ BitVec 32))) (Found!2750 (index!13177 (_ BitVec 32))) (Intermediate!2750 (undefined!3562 Bool) (index!13178 (_ BitVec 32)) (x!31548 (_ BitVec 32))) (Undefined!2750) (MissingVacant!2750 (index!13179 (_ BitVec 32))) )
))
(declare-fun lt!154991 () SeekEntryResult!2750)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!154992 () SeekEntryResult!2750)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317443 (= res!172068 (and (= lt!154991 lt!154992) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7645 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16160 (_ BitVec 32)) SeekEntryResult!2750)

(assert (=> b!317443 (= lt!154991 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317444 () Bool)

(declare-fun res!172075 () Bool)

(assert (=> b!317444 (=> (not res!172075) (not e!197358))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16160 (_ BitVec 32)) SeekEntryResult!2750)

(assert (=> b!317444 (= res!172075 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2750 i!1240)))))

(declare-fun b!317445 () Bool)

(assert (=> b!317445 (= e!197358 e!197360)))

(declare-fun res!172074 () Bool)

(assert (=> b!317445 (=> (not res!172074) (not e!197360))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317445 (= res!172074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154992))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317445 (= lt!154992 (Intermediate!2750 false resIndex!52 resX!52))))

(declare-fun b!317446 () Bool)

(assert (=> b!317446 (= e!197359 (not true))))

(declare-fun e!197361 () Bool)

(assert (=> b!317446 e!197361))

(declare-fun res!172077 () Bool)

(assert (=> b!317446 (=> (not res!172077) (not e!197361))))

(declare-fun lt!154989 () (_ BitVec 32))

(assert (=> b!317446 (= res!172077 (= lt!154991 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154989 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317446 (= lt!154989 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!172073 () Bool)

(assert (=> start!31776 (=> (not res!172073) (not e!197358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31776 (= res!172073 (validMask!0 mask!3709))))

(assert (=> start!31776 e!197358))

(declare-fun array_inv!5595 (array!16160) Bool)

(assert (=> start!31776 (array_inv!5595 a!3293)))

(assert (=> start!31776 true))

(declare-fun b!317439 () Bool)

(declare-fun res!172072 () Bool)

(assert (=> b!317439 (=> (not res!172072) (not e!197358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16160 (_ BitVec 32)) Bool)

(assert (=> b!317439 (= res!172072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317447 () Bool)

(declare-fun res!172076 () Bool)

(assert (=> b!317447 (=> (not res!172076) (not e!197360))))

(assert (=> b!317447 (= res!172076 (and (= (select (arr!7645 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7997 a!3293))))))

(declare-fun b!317448 () Bool)

(declare-fun lt!154990 () array!16160)

(assert (=> b!317448 (= e!197361 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154990 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154989 k0!2441 lt!154990 mask!3709)))))

(assert (=> b!317448 (= lt!154990 (array!16161 (store (arr!7645 a!3293) i!1240 k0!2441) (size!7997 a!3293)))))

(assert (= (and start!31776 res!172073) b!317440))

(assert (= (and b!317440 res!172071) b!317441))

(assert (= (and b!317441 res!172069) b!317442))

(assert (= (and b!317442 res!172070) b!317444))

(assert (= (and b!317444 res!172075) b!317439))

(assert (= (and b!317439 res!172072) b!317445))

(assert (= (and b!317445 res!172074) b!317447))

(assert (= (and b!317447 res!172076) b!317443))

(assert (= (and b!317443 res!172068) b!317446))

(assert (= (and b!317446 res!172077) b!317448))

(declare-fun m!326299 () Bool)

(assert (=> b!317446 m!326299))

(declare-fun m!326301 () Bool)

(assert (=> b!317446 m!326301))

(declare-fun m!326303 () Bool)

(assert (=> b!317448 m!326303))

(declare-fun m!326305 () Bool)

(assert (=> b!317448 m!326305))

(declare-fun m!326307 () Bool)

(assert (=> b!317448 m!326307))

(declare-fun m!326309 () Bool)

(assert (=> start!31776 m!326309))

(declare-fun m!326311 () Bool)

(assert (=> start!31776 m!326311))

(declare-fun m!326313 () Bool)

(assert (=> b!317447 m!326313))

(declare-fun m!326315 () Bool)

(assert (=> b!317442 m!326315))

(declare-fun m!326317 () Bool)

(assert (=> b!317443 m!326317))

(declare-fun m!326319 () Bool)

(assert (=> b!317443 m!326319))

(declare-fun m!326321 () Bool)

(assert (=> b!317445 m!326321))

(assert (=> b!317445 m!326321))

(declare-fun m!326323 () Bool)

(assert (=> b!317445 m!326323))

(declare-fun m!326325 () Bool)

(assert (=> b!317441 m!326325))

(declare-fun m!326327 () Bool)

(assert (=> b!317444 m!326327))

(declare-fun m!326329 () Bool)

(assert (=> b!317439 m!326329))

(check-sat (not b!317439) (not b!317442) (not b!317444) (not b!317446) (not b!317443) (not start!31776) (not b!317448) (not b!317441) (not b!317445))
(check-sat)
