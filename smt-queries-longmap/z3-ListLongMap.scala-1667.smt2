; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30876 () Bool)

(assert start!30876)

(declare-fun b!309850 () Bool)

(declare-fun res!166356 () Bool)

(declare-fun e!193525 () Bool)

(assert (=> b!309850 (=> (not res!166356) (not e!193525))))

(declare-datatypes ((array!15791 0))(
  ( (array!15792 (arr!7477 (Array (_ BitVec 32) (_ BitVec 64))) (size!7829 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15791)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309850 (= res!166356 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309851 () Bool)

(declare-fun e!193524 () Bool)

(declare-fun e!193526 () Bool)

(assert (=> b!309851 (= e!193524 e!193526)))

(declare-fun res!166362 () Bool)

(assert (=> b!309851 (=> (not res!166362) (not e!193526))))

(declare-datatypes ((SeekEntryResult!2582 0))(
  ( (MissingZero!2582 (index!12504 (_ BitVec 32))) (Found!2582 (index!12505 (_ BitVec 32))) (Intermediate!2582 (undefined!3394 Bool) (index!12506 (_ BitVec 32)) (x!30848 (_ BitVec 32))) (Undefined!2582) (MissingVacant!2582 (index!12507 (_ BitVec 32))) )
))
(declare-fun lt!151779 () SeekEntryResult!2582)

(declare-fun lt!151778 () SeekEntryResult!2582)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309851 (= res!166362 (and (= lt!151779 lt!151778) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7477 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15791 (_ BitVec 32)) SeekEntryResult!2582)

(assert (=> b!309851 (= lt!151779 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309852 () Bool)

(declare-fun res!166357 () Bool)

(assert (=> b!309852 (=> (not res!166357) (not e!193524))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309852 (= res!166357 (and (= (select (arr!7477 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7829 a!3293))))))

(declare-fun b!309853 () Bool)

(declare-fun res!166355 () Bool)

(assert (=> b!309853 (=> (not res!166355) (not e!193525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15791 (_ BitVec 32)) Bool)

(assert (=> b!309853 (= res!166355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!166359 () Bool)

(assert (=> start!30876 (=> (not res!166359) (not e!193525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30876 (= res!166359 (validMask!0 mask!3709))))

(assert (=> start!30876 e!193525))

(declare-fun array_inv!5427 (array!15791) Bool)

(assert (=> start!30876 (array_inv!5427 a!3293)))

(assert (=> start!30876 true))

(declare-fun b!309854 () Bool)

(declare-fun res!166360 () Bool)

(assert (=> b!309854 (=> (not res!166360) (not e!193525))))

(assert (=> b!309854 (= res!166360 (and (= (size!7829 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7829 a!3293))))))

(declare-fun b!309855 () Bool)

(declare-fun res!166358 () Bool)

(assert (=> b!309855 (=> (not res!166358) (not e!193525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309855 (= res!166358 (validKeyInArray!0 k0!2441))))

(declare-fun b!309856 () Bool)

(assert (=> b!309856 (= e!193525 e!193524)))

(declare-fun res!166354 () Bool)

(assert (=> b!309856 (=> (not res!166354) (not e!193524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309856 (= res!166354 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151778))))

(assert (=> b!309856 (= lt!151778 (Intermediate!2582 false resIndex!52 resX!52))))

(declare-fun b!309857 () Bool)

(declare-fun lt!151777 () (_ BitVec 32))

(assert (=> b!309857 (= e!193526 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!151777 #b00000000000000000000000000000000) (bvsge lt!151777 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(assert (=> b!309857 (= lt!151779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151777 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309857 (= lt!151777 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!309858 () Bool)

(declare-fun res!166361 () Bool)

(assert (=> b!309858 (=> (not res!166361) (not e!193525))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15791 (_ BitVec 32)) SeekEntryResult!2582)

(assert (=> b!309858 (= res!166361 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2582 i!1240)))))

(assert (= (and start!30876 res!166359) b!309854))

(assert (= (and b!309854 res!166360) b!309855))

(assert (= (and b!309855 res!166358) b!309850))

(assert (= (and b!309850 res!166356) b!309858))

(assert (= (and b!309858 res!166361) b!309853))

(assert (= (and b!309853 res!166355) b!309856))

(assert (= (and b!309856 res!166354) b!309852))

(assert (= (and b!309852 res!166357) b!309851))

(assert (= (and b!309851 res!166362) b!309857))

(declare-fun m!319927 () Bool)

(assert (=> b!309851 m!319927))

(declare-fun m!319929 () Bool)

(assert (=> b!309851 m!319929))

(declare-fun m!319931 () Bool)

(assert (=> b!309852 m!319931))

(declare-fun m!319933 () Bool)

(assert (=> b!309853 m!319933))

(declare-fun m!319935 () Bool)

(assert (=> b!309850 m!319935))

(declare-fun m!319937 () Bool)

(assert (=> b!309856 m!319937))

(assert (=> b!309856 m!319937))

(declare-fun m!319939 () Bool)

(assert (=> b!309856 m!319939))

(declare-fun m!319941 () Bool)

(assert (=> start!30876 m!319941))

(declare-fun m!319943 () Bool)

(assert (=> start!30876 m!319943))

(declare-fun m!319945 () Bool)

(assert (=> b!309855 m!319945))

(declare-fun m!319947 () Bool)

(assert (=> b!309858 m!319947))

(declare-fun m!319949 () Bool)

(assert (=> b!309857 m!319949))

(declare-fun m!319951 () Bool)

(assert (=> b!309857 m!319951))

(check-sat (not b!309853) (not b!309857) (not b!309856) (not start!30876) (not b!309855) (not b!309858) (not b!309850) (not b!309851))
(check-sat)
