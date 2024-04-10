; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30316 () Bool)

(assert start!30316)

(declare-fun b!303540 () Bool)

(declare-fun e!190991 () Bool)

(declare-fun e!190993 () Bool)

(assert (=> b!303540 (= e!190991 e!190993)))

(declare-fun res!161029 () Bool)

(assert (=> b!303540 (=> (not res!161029) (not e!190993))))

(declare-datatypes ((array!15422 0))(
  ( (array!15423 (arr!7299 (Array (_ BitVec 32) (_ BitVec 64))) (size!7651 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15422)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2439 0))(
  ( (MissingZero!2439 (index!11932 (_ BitVec 32))) (Found!2439 (index!11933 (_ BitVec 32))) (Intermediate!2439 (undefined!3251 Bool) (index!11934 (_ BitVec 32)) (x!30192 (_ BitVec 32))) (Undefined!2439) (MissingVacant!2439 (index!11935 (_ BitVec 32))) )
))
(declare-fun lt!150219 () SeekEntryResult!2439)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15422 (_ BitVec 32)) SeekEntryResult!2439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303540 (= res!161029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150219))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303540 (= lt!150219 (Intermediate!2439 false resIndex!52 resX!52))))

(declare-fun b!303541 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303541 (= e!190993 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7299 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7299 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7299 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!303542 () Bool)

(declare-fun res!161030 () Bool)

(assert (=> b!303542 (=> (not res!161030) (not e!190991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15422 (_ BitVec 32)) Bool)

(assert (=> b!303542 (= res!161030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303543 () Bool)

(declare-fun res!161033 () Bool)

(assert (=> b!303543 (=> (not res!161033) (not e!190991))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15422 (_ BitVec 32)) SeekEntryResult!2439)

(assert (=> b!303543 (= res!161033 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2439 i!1240)))))

(declare-fun b!303544 () Bool)

(declare-fun res!161031 () Bool)

(assert (=> b!303544 (=> (not res!161031) (not e!190991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303544 (= res!161031 (validKeyInArray!0 k0!2441))))

(declare-fun b!303545 () Bool)

(declare-fun res!161028 () Bool)

(assert (=> b!303545 (=> (not res!161028) (not e!190993))))

(assert (=> b!303545 (= res!161028 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150219))))

(declare-fun b!303546 () Bool)

(declare-fun res!161032 () Bool)

(assert (=> b!303546 (=> (not res!161032) (not e!190993))))

(assert (=> b!303546 (= res!161032 (and (= (select (arr!7299 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7651 a!3293))))))

(declare-fun b!303547 () Bool)

(declare-fun res!161027 () Bool)

(assert (=> b!303547 (=> (not res!161027) (not e!190991))))

(assert (=> b!303547 (= res!161027 (and (= (size!7651 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7651 a!3293))))))

(declare-fun b!303548 () Bool)

(declare-fun res!161034 () Bool)

(assert (=> b!303548 (=> (not res!161034) (not e!190991))))

(declare-fun arrayContainsKey!0 (array!15422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303548 (= res!161034 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!161026 () Bool)

(assert (=> start!30316 (=> (not res!161026) (not e!190991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30316 (= res!161026 (validMask!0 mask!3709))))

(assert (=> start!30316 e!190991))

(declare-fun array_inv!5262 (array!15422) Bool)

(assert (=> start!30316 (array_inv!5262 a!3293)))

(assert (=> start!30316 true))

(assert (= (and start!30316 res!161026) b!303547))

(assert (= (and b!303547 res!161027) b!303544))

(assert (= (and b!303544 res!161031) b!303548))

(assert (= (and b!303548 res!161034) b!303543))

(assert (= (and b!303543 res!161033) b!303542))

(assert (= (and b!303542 res!161030) b!303540))

(assert (= (and b!303540 res!161029) b!303546))

(assert (= (and b!303546 res!161032) b!303545))

(assert (= (and b!303545 res!161028) b!303541))

(declare-fun m!314871 () Bool)

(assert (=> b!303544 m!314871))

(declare-fun m!314873 () Bool)

(assert (=> b!303543 m!314873))

(declare-fun m!314875 () Bool)

(assert (=> b!303542 m!314875))

(declare-fun m!314877 () Bool)

(assert (=> b!303541 m!314877))

(declare-fun m!314879 () Bool)

(assert (=> start!30316 m!314879))

(declare-fun m!314881 () Bool)

(assert (=> start!30316 m!314881))

(declare-fun m!314883 () Bool)

(assert (=> b!303548 m!314883))

(declare-fun m!314885 () Bool)

(assert (=> b!303540 m!314885))

(assert (=> b!303540 m!314885))

(declare-fun m!314887 () Bool)

(assert (=> b!303540 m!314887))

(declare-fun m!314889 () Bool)

(assert (=> b!303546 m!314889))

(declare-fun m!314891 () Bool)

(assert (=> b!303545 m!314891))

(check-sat (not start!30316) (not b!303542) (not b!303544) (not b!303543) (not b!303548) (not b!303545) (not b!303540))
(check-sat)
