; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30262 () Bool)

(assert start!30262)

(declare-fun b!302851 () Bool)

(declare-fun res!160339 () Bool)

(declare-fun e!190789 () Bool)

(assert (=> b!302851 (=> (not res!160339) (not e!190789))))

(declare-datatypes ((array!15368 0))(
  ( (array!15369 (arr!7272 (Array (_ BitVec 32) (_ BitVec 64))) (size!7624 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15368)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302851 (= res!160339 (and (= (size!7624 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7624 a!3293))))))

(declare-fun b!302853 () Bool)

(declare-fun res!160337 () Bool)

(assert (=> b!302853 (=> (not res!160337) (not e!190789))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302853 (= res!160337 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302854 () Bool)

(assert (=> b!302854 (= e!190789 false)))

(declare-datatypes ((SeekEntryResult!2412 0))(
  ( (MissingZero!2412 (index!11824 (_ BitVec 32))) (Found!2412 (index!11825 (_ BitVec 32))) (Intermediate!2412 (undefined!3224 Bool) (index!11826 (_ BitVec 32)) (x!30093 (_ BitVec 32))) (Undefined!2412) (MissingVacant!2412 (index!11827 (_ BitVec 32))) )
))
(declare-fun lt!150138 () SeekEntryResult!2412)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15368 (_ BitVec 32)) SeekEntryResult!2412)

(assert (=> b!302854 (= lt!150138 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!302855 () Bool)

(declare-fun res!160342 () Bool)

(assert (=> b!302855 (=> (not res!160342) (not e!190789))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15368 (_ BitVec 32)) SeekEntryResult!2412)

(assert (=> b!302855 (= res!160342 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2412 i!1240)))))

(declare-fun b!302856 () Bool)

(declare-fun res!160338 () Bool)

(assert (=> b!302856 (=> (not res!160338) (not e!190789))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302856 (= res!160338 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2412 false resIndex!52 resX!52)))))

(declare-fun b!302857 () Bool)

(declare-fun res!160341 () Bool)

(assert (=> b!302857 (=> (not res!160341) (not e!190789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302857 (= res!160341 (validKeyInArray!0 k0!2441))))

(declare-fun b!302858 () Bool)

(declare-fun res!160340 () Bool)

(assert (=> b!302858 (=> (not res!160340) (not e!190789))))

(assert (=> b!302858 (= res!160340 (and (= (select (arr!7272 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7624 a!3293))))))

(declare-fun b!302852 () Bool)

(declare-fun res!160343 () Bool)

(assert (=> b!302852 (=> (not res!160343) (not e!190789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15368 (_ BitVec 32)) Bool)

(assert (=> b!302852 (= res!160343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!160344 () Bool)

(assert (=> start!30262 (=> (not res!160344) (not e!190789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30262 (= res!160344 (validMask!0 mask!3709))))

(assert (=> start!30262 e!190789))

(declare-fun array_inv!5235 (array!15368) Bool)

(assert (=> start!30262 (array_inv!5235 a!3293)))

(assert (=> start!30262 true))

(assert (= (and start!30262 res!160344) b!302851))

(assert (= (and b!302851 res!160339) b!302857))

(assert (= (and b!302857 res!160341) b!302853))

(assert (= (and b!302853 res!160337) b!302855))

(assert (= (and b!302855 res!160342) b!302852))

(assert (= (and b!302852 res!160343) b!302856))

(assert (= (and b!302856 res!160338) b!302858))

(assert (= (and b!302858 res!160340) b!302854))

(declare-fun m!314305 () Bool)

(assert (=> b!302853 m!314305))

(declare-fun m!314307 () Bool)

(assert (=> b!302857 m!314307))

(declare-fun m!314309 () Bool)

(assert (=> b!302858 m!314309))

(declare-fun m!314311 () Bool)

(assert (=> start!30262 m!314311))

(declare-fun m!314313 () Bool)

(assert (=> start!30262 m!314313))

(declare-fun m!314315 () Bool)

(assert (=> b!302856 m!314315))

(assert (=> b!302856 m!314315))

(declare-fun m!314317 () Bool)

(assert (=> b!302856 m!314317))

(declare-fun m!314319 () Bool)

(assert (=> b!302852 m!314319))

(declare-fun m!314321 () Bool)

(assert (=> b!302855 m!314321))

(declare-fun m!314323 () Bool)

(assert (=> b!302854 m!314323))

(check-sat (not b!302856) (not start!30262) (not b!302855) (not b!302854) (not b!302857) (not b!302853) (not b!302852))
