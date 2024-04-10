; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30256 () Bool)

(assert start!30256)

(declare-fun b!302775 () Bool)

(declare-fun res!160269 () Bool)

(declare-fun e!190767 () Bool)

(assert (=> b!302775 (=> (not res!160269) (not e!190767))))

(declare-datatypes ((array!15362 0))(
  ( (array!15363 (arr!7269 (Array (_ BitVec 32) (_ BitVec 64))) (size!7621 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15362)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302775 (= res!160269 (and (= (select (arr!7269 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7621 a!3293))))))

(declare-fun res!160268 () Bool)

(declare-fun e!190768 () Bool)

(assert (=> start!30256 (=> (not res!160268) (not e!190768))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30256 (= res!160268 (validMask!0 mask!3709))))

(assert (=> start!30256 e!190768))

(declare-fun array_inv!5232 (array!15362) Bool)

(assert (=> start!30256 (array_inv!5232 a!3293)))

(assert (=> start!30256 true))

(declare-fun b!302776 () Bool)

(declare-fun res!160262 () Bool)

(assert (=> b!302776 (=> (not res!160262) (not e!190768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15362 (_ BitVec 32)) Bool)

(assert (=> b!302776 (= res!160262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302777 () Bool)

(declare-fun res!160261 () Bool)

(assert (=> b!302777 (=> (not res!160261) (not e!190768))))

(assert (=> b!302777 (= res!160261 (and (= (size!7621 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7621 a!3293))))))

(declare-fun b!302778 () Bool)

(declare-fun res!160265 () Bool)

(assert (=> b!302778 (=> (not res!160265) (not e!190768))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302778 (= res!160265 (validKeyInArray!0 k0!2441))))

(declare-fun b!302779 () Bool)

(declare-fun res!160264 () Bool)

(assert (=> b!302779 (=> (not res!160264) (not e!190768))))

(declare-fun arrayContainsKey!0 (array!15362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302779 (= res!160264 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302780 () Bool)

(declare-fun res!160267 () Bool)

(assert (=> b!302780 (=> (not res!160267) (not e!190768))))

(declare-datatypes ((SeekEntryResult!2409 0))(
  ( (MissingZero!2409 (index!11812 (_ BitVec 32))) (Found!2409 (index!11813 (_ BitVec 32))) (Intermediate!2409 (undefined!3221 Bool) (index!11814 (_ BitVec 32)) (x!30082 (_ BitVec 32))) (Undefined!2409) (MissingVacant!2409 (index!11815 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15362 (_ BitVec 32)) SeekEntryResult!2409)

(assert (=> b!302780 (= res!160267 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2409 i!1240)))))

(declare-fun b!302781 () Bool)

(assert (=> b!302781 (= e!190767 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7269 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7269 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7269 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302782 () Bool)

(assert (=> b!302782 (= e!190768 e!190767)))

(declare-fun res!160263 () Bool)

(assert (=> b!302782 (=> (not res!160263) (not e!190767))))

(declare-fun lt!150129 () SeekEntryResult!2409)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15362 (_ BitVec 32)) SeekEntryResult!2409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302782 (= res!160263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150129))))

(assert (=> b!302782 (= lt!150129 (Intermediate!2409 false resIndex!52 resX!52))))

(declare-fun b!302783 () Bool)

(declare-fun res!160266 () Bool)

(assert (=> b!302783 (=> (not res!160266) (not e!190767))))

(assert (=> b!302783 (= res!160266 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150129))))

(assert (= (and start!30256 res!160268) b!302777))

(assert (= (and b!302777 res!160261) b!302778))

(assert (= (and b!302778 res!160265) b!302779))

(assert (= (and b!302779 res!160264) b!302780))

(assert (= (and b!302780 res!160267) b!302776))

(assert (= (and b!302776 res!160262) b!302782))

(assert (= (and b!302782 res!160263) b!302775))

(assert (= (and b!302775 res!160269) b!302783))

(assert (= (and b!302783 res!160266) b!302781))

(declare-fun m!314241 () Bool)

(assert (=> start!30256 m!314241))

(declare-fun m!314243 () Bool)

(assert (=> start!30256 m!314243))

(declare-fun m!314245 () Bool)

(assert (=> b!302778 m!314245))

(declare-fun m!314247 () Bool)

(assert (=> b!302783 m!314247))

(declare-fun m!314249 () Bool)

(assert (=> b!302782 m!314249))

(assert (=> b!302782 m!314249))

(declare-fun m!314251 () Bool)

(assert (=> b!302782 m!314251))

(declare-fun m!314253 () Bool)

(assert (=> b!302776 m!314253))

(declare-fun m!314255 () Bool)

(assert (=> b!302780 m!314255))

(declare-fun m!314257 () Bool)

(assert (=> b!302779 m!314257))

(declare-fun m!314259 () Bool)

(assert (=> b!302781 m!314259))

(declare-fun m!314261 () Bool)

(assert (=> b!302775 m!314261))

(check-sat (not b!302783) (not start!30256) (not b!302778) (not b!302776) (not b!302782) (not b!302780) (not b!302779))
(check-sat)
