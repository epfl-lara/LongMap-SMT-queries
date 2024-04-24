; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32510 () Bool)

(assert start!32510)

(declare-fun b!325260 () Bool)

(declare-fun e!200507 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325260 (= e!200507 (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lt!156995 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325260 (= lt!156995 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!325261 () Bool)

(declare-fun e!200506 () Bool)

(assert (=> b!325261 (= e!200506 e!200507)))

(declare-fun res!178648 () Bool)

(assert (=> b!325261 (=> (not res!178648) (not e!200507))))

(declare-datatypes ((array!16662 0))(
  ( (array!16663 (arr!7888 (Array (_ BitVec 32) (_ BitVec 64))) (size!8240 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16662)

(declare-datatypes ((SeekEntryResult!2984 0))(
  ( (MissingZero!2984 (index!14112 (_ BitVec 32))) (Found!2984 (index!14113 (_ BitVec 32))) (Intermediate!2984 (undefined!3796 Bool) (index!14114 (_ BitVec 32)) (x!32457 (_ BitVec 32))) (Undefined!2984) (MissingVacant!2984 (index!14115 (_ BitVec 32))) )
))
(declare-fun lt!156996 () SeekEntryResult!2984)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16662 (_ BitVec 32)) SeekEntryResult!2984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325261 (= res!178648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156996))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325261 (= lt!156996 (Intermediate!2984 false resIndex!58 resX!58))))

(declare-fun res!178644 () Bool)

(assert (=> start!32510 (=> (not res!178644) (not e!200506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32510 (= res!178644 (validMask!0 mask!3777))))

(assert (=> start!32510 e!200506))

(declare-fun array_inv!5838 (array!16662) Bool)

(assert (=> start!32510 (array_inv!5838 a!3305)))

(assert (=> start!32510 true))

(declare-fun b!325262 () Bool)

(declare-fun res!178642 () Bool)

(assert (=> b!325262 (=> (not res!178642) (not e!200507))))

(assert (=> b!325262 (= res!178642 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7888 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325263 () Bool)

(declare-fun res!178643 () Bool)

(assert (=> b!325263 (=> (not res!178643) (not e!200506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16662 (_ BitVec 32)) Bool)

(assert (=> b!325263 (= res!178643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325264 () Bool)

(declare-fun res!178645 () Bool)

(assert (=> b!325264 (=> (not res!178645) (not e!200506))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16662 (_ BitVec 32)) SeekEntryResult!2984)

(assert (=> b!325264 (= res!178645 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2984 i!1250)))))

(declare-fun b!325265 () Bool)

(declare-fun res!178650 () Bool)

(assert (=> b!325265 (=> (not res!178650) (not e!200507))))

(assert (=> b!325265 (= res!178650 (and (= (select (arr!7888 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8240 a!3305))))))

(declare-fun b!325266 () Bool)

(declare-fun res!178646 () Bool)

(assert (=> b!325266 (=> (not res!178646) (not e!200506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325266 (= res!178646 (validKeyInArray!0 k0!2497))))

(declare-fun b!325267 () Bool)

(declare-fun res!178641 () Bool)

(assert (=> b!325267 (=> (not res!178641) (not e!200506))))

(assert (=> b!325267 (= res!178641 (and (= (size!8240 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8240 a!3305))))))

(declare-fun b!325268 () Bool)

(declare-fun res!178647 () Bool)

(assert (=> b!325268 (=> (not res!178647) (not e!200506))))

(declare-fun arrayContainsKey!0 (array!16662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325268 (= res!178647 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325269 () Bool)

(declare-fun res!178649 () Bool)

(assert (=> b!325269 (=> (not res!178649) (not e!200507))))

(assert (=> b!325269 (= res!178649 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156996))))

(assert (= (and start!32510 res!178644) b!325267))

(assert (= (and b!325267 res!178641) b!325266))

(assert (= (and b!325266 res!178646) b!325268))

(assert (= (and b!325268 res!178647) b!325264))

(assert (= (and b!325264 res!178645) b!325263))

(assert (= (and b!325263 res!178643) b!325261))

(assert (= (and b!325261 res!178648) b!325265))

(assert (= (and b!325265 res!178650) b!325269))

(assert (= (and b!325269 res!178649) b!325262))

(assert (= (and b!325262 res!178642) b!325260))

(declare-fun m!332365 () Bool)

(assert (=> b!325268 m!332365))

(declare-fun m!332367 () Bool)

(assert (=> b!325265 m!332367))

(declare-fun m!332369 () Bool)

(assert (=> b!325263 m!332369))

(declare-fun m!332371 () Bool)

(assert (=> b!325269 m!332371))

(declare-fun m!332373 () Bool)

(assert (=> b!325261 m!332373))

(assert (=> b!325261 m!332373))

(declare-fun m!332375 () Bool)

(assert (=> b!325261 m!332375))

(declare-fun m!332377 () Bool)

(assert (=> b!325264 m!332377))

(declare-fun m!332379 () Bool)

(assert (=> start!32510 m!332379))

(declare-fun m!332381 () Bool)

(assert (=> start!32510 m!332381))

(declare-fun m!332383 () Bool)

(assert (=> b!325260 m!332383))

(declare-fun m!332385 () Bool)

(assert (=> b!325262 m!332385))

(declare-fun m!332387 () Bool)

(assert (=> b!325266 m!332387))

(check-sat (not b!325264) (not b!325268) (not b!325261) (not b!325260) (not b!325263) (not start!32510) (not b!325269) (not b!325266))
(check-sat)
