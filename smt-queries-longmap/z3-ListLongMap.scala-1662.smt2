; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30792 () Bool)

(assert start!30792)

(declare-fun b!309202 () Bool)

(declare-fun e!193199 () Bool)

(declare-fun e!193198 () Bool)

(assert (=> b!309202 (= e!193199 e!193198)))

(declare-fun res!165871 () Bool)

(assert (=> b!309202 (=> (not res!165871) (not e!193198))))

(declare-datatypes ((array!15758 0))(
  ( (array!15759 (arr!7462 (Array (_ BitVec 32) (_ BitVec 64))) (size!7814 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15758)

(declare-datatypes ((SeekEntryResult!2567 0))(
  ( (MissingZero!2567 (index!12444 (_ BitVec 32))) (Found!2567 (index!12445 (_ BitVec 32))) (Intermediate!2567 (undefined!3379 Bool) (index!12446 (_ BitVec 32)) (x!30784 (_ BitVec 32))) (Undefined!2567) (MissingVacant!2567 (index!12447 (_ BitVec 32))) )
))
(declare-fun lt!151565 () SeekEntryResult!2567)

(declare-fun lt!151566 () SeekEntryResult!2567)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309202 (= res!165871 (and (= lt!151565 lt!151566) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7462 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15758 (_ BitVec 32)) SeekEntryResult!2567)

(assert (=> b!309202 (= lt!151565 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309203 () Bool)

(declare-fun res!165873 () Bool)

(declare-fun e!193200 () Bool)

(assert (=> b!309203 (=> (not res!165873) (not e!193200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309203 (= res!165873 (validKeyInArray!0 k0!2441))))

(declare-fun b!309204 () Bool)

(declare-fun res!165865 () Bool)

(assert (=> b!309204 (=> (not res!165865) (not e!193200))))

(declare-fun arrayContainsKey!0 (array!15758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309204 (= res!165865 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309205 () Bool)

(assert (=> b!309205 (= e!193198 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309205 (= lt!151565 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!165870 () Bool)

(assert (=> start!30792 (=> (not res!165870) (not e!193200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30792 (= res!165870 (validMask!0 mask!3709))))

(assert (=> start!30792 e!193200))

(declare-fun array_inv!5412 (array!15758) Bool)

(assert (=> start!30792 (array_inv!5412 a!3293)))

(assert (=> start!30792 true))

(declare-fun b!309206 () Bool)

(declare-fun res!165868 () Bool)

(assert (=> b!309206 (=> (not res!165868) (not e!193200))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309206 (= res!165868 (and (= (size!7814 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7814 a!3293))))))

(declare-fun b!309207 () Bool)

(declare-fun res!165867 () Bool)

(assert (=> b!309207 (=> (not res!165867) (not e!193200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15758 (_ BitVec 32)) Bool)

(assert (=> b!309207 (= res!165867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309208 () Bool)

(declare-fun res!165866 () Bool)

(assert (=> b!309208 (=> (not res!165866) (not e!193199))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309208 (= res!165866 (and (= (select (arr!7462 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7814 a!3293))))))

(declare-fun b!309209 () Bool)

(assert (=> b!309209 (= e!193200 e!193199)))

(declare-fun res!165872 () Bool)

(assert (=> b!309209 (=> (not res!165872) (not e!193199))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309209 (= res!165872 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151566))))

(assert (=> b!309209 (= lt!151566 (Intermediate!2567 false resIndex!52 resX!52))))

(declare-fun b!309210 () Bool)

(declare-fun res!165869 () Bool)

(assert (=> b!309210 (=> (not res!165869) (not e!193200))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15758 (_ BitVec 32)) SeekEntryResult!2567)

(assert (=> b!309210 (= res!165869 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2567 i!1240)))))

(assert (= (and start!30792 res!165870) b!309206))

(assert (= (and b!309206 res!165868) b!309203))

(assert (= (and b!309203 res!165873) b!309204))

(assert (= (and b!309204 res!165865) b!309210))

(assert (= (and b!309210 res!165869) b!309207))

(assert (= (and b!309207 res!165867) b!309209))

(assert (= (and b!309209 res!165872) b!309208))

(assert (= (and b!309208 res!165866) b!309202))

(assert (= (and b!309202 res!165871) b!309205))

(declare-fun m!319393 () Bool)

(assert (=> b!309204 m!319393))

(declare-fun m!319395 () Bool)

(assert (=> b!309210 m!319395))

(declare-fun m!319397 () Bool)

(assert (=> b!309209 m!319397))

(assert (=> b!309209 m!319397))

(declare-fun m!319399 () Bool)

(assert (=> b!309209 m!319399))

(declare-fun m!319401 () Bool)

(assert (=> b!309203 m!319401))

(declare-fun m!319403 () Bool)

(assert (=> b!309205 m!319403))

(assert (=> b!309205 m!319403))

(declare-fun m!319405 () Bool)

(assert (=> b!309205 m!319405))

(declare-fun m!319407 () Bool)

(assert (=> start!30792 m!319407))

(declare-fun m!319409 () Bool)

(assert (=> start!30792 m!319409))

(declare-fun m!319411 () Bool)

(assert (=> b!309202 m!319411))

(declare-fun m!319413 () Bool)

(assert (=> b!309202 m!319413))

(declare-fun m!319415 () Bool)

(assert (=> b!309208 m!319415))

(declare-fun m!319417 () Bool)

(assert (=> b!309207 m!319417))

(check-sat (not b!309209) (not start!30792) (not b!309203) (not b!309204) (not b!309205) (not b!309210) (not b!309202) (not b!309207))
(check-sat)
