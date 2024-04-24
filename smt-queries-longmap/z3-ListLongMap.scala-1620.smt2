; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30432 () Bool)

(assert start!30432)

(declare-fun b!304783 () Bool)

(declare-fun e!191481 () Bool)

(declare-fun e!191479 () Bool)

(assert (=> b!304783 (= e!191481 e!191479)))

(declare-fun res!162184 () Bool)

(assert (=> b!304783 (=> (not res!162184) (not e!191479))))

(declare-datatypes ((SeekEntryResult!2441 0))(
  ( (MissingZero!2441 (index!11940 (_ BitVec 32))) (Found!2441 (index!11941 (_ BitVec 32))) (Intermediate!2441 (undefined!3253 Bool) (index!11942 (_ BitVec 32)) (x!30304 (_ BitVec 32))) (Undefined!2441) (MissingVacant!2441 (index!11943 (_ BitVec 32))) )
))
(declare-fun lt!150557 () SeekEntryResult!2441)

(declare-datatypes ((array!15500 0))(
  ( (array!15501 (arr!7336 (Array (_ BitVec 32) (_ BitVec 64))) (size!7688 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15500)

(declare-fun lt!150558 () SeekEntryResult!2441)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304783 (= res!162184 (and (= lt!150558 lt!150557) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7336 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7336 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7336 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15500 (_ BitVec 32)) SeekEntryResult!2441)

(assert (=> b!304783 (= lt!150558 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!162185 () Bool)

(declare-fun e!191478 () Bool)

(assert (=> start!30432 (=> (not res!162185) (not e!191478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30432 (= res!162185 (validMask!0 mask!3709))))

(assert (=> start!30432 e!191478))

(declare-fun array_inv!5286 (array!15500) Bool)

(assert (=> start!30432 (array_inv!5286 a!3293)))

(assert (=> start!30432 true))

(declare-fun b!304784 () Bool)

(declare-fun res!162183 () Bool)

(assert (=> b!304784 (=> (not res!162183) (not e!191478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15500 (_ BitVec 32)) Bool)

(assert (=> b!304784 (= res!162183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304785 () Bool)

(assert (=> b!304785 (= e!191478 e!191481)))

(declare-fun res!162178 () Bool)

(assert (=> b!304785 (=> (not res!162178) (not e!191481))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304785 (= res!162178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150557))))

(assert (=> b!304785 (= lt!150557 (Intermediate!2441 false resIndex!52 resX!52))))

(declare-fun b!304786 () Bool)

(declare-fun res!162180 () Bool)

(assert (=> b!304786 (=> (not res!162180) (not e!191478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304786 (= res!162180 (validKeyInArray!0 k0!2441))))

(declare-fun b!304787 () Bool)

(assert (=> b!304787 (= e!191479 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304787 (= lt!150558 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304788 () Bool)

(declare-fun res!162186 () Bool)

(assert (=> b!304788 (=> (not res!162186) (not e!191478))))

(declare-fun arrayContainsKey!0 (array!15500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304788 (= res!162186 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304789 () Bool)

(declare-fun res!162179 () Bool)

(assert (=> b!304789 (=> (not res!162179) (not e!191481))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304789 (= res!162179 (and (= (select (arr!7336 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7688 a!3293))))))

(declare-fun b!304790 () Bool)

(declare-fun res!162181 () Bool)

(assert (=> b!304790 (=> (not res!162181) (not e!191478))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15500 (_ BitVec 32)) SeekEntryResult!2441)

(assert (=> b!304790 (= res!162181 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2441 i!1240)))))

(declare-fun b!304791 () Bool)

(declare-fun res!162182 () Bool)

(assert (=> b!304791 (=> (not res!162182) (not e!191478))))

(assert (=> b!304791 (= res!162182 (and (= (size!7688 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7688 a!3293))))))

(assert (= (and start!30432 res!162185) b!304791))

(assert (= (and b!304791 res!162182) b!304786))

(assert (= (and b!304786 res!162180) b!304788))

(assert (= (and b!304788 res!162186) b!304790))

(assert (= (and b!304790 res!162181) b!304784))

(assert (= (and b!304784 res!162183) b!304785))

(assert (= (and b!304785 res!162178) b!304789))

(assert (= (and b!304789 res!162179) b!304783))

(assert (= (and b!304783 res!162184) b!304787))

(declare-fun m!316033 () Bool)

(assert (=> b!304785 m!316033))

(assert (=> b!304785 m!316033))

(declare-fun m!316035 () Bool)

(assert (=> b!304785 m!316035))

(declare-fun m!316037 () Bool)

(assert (=> b!304784 m!316037))

(declare-fun m!316039 () Bool)

(assert (=> b!304790 m!316039))

(declare-fun m!316041 () Bool)

(assert (=> b!304787 m!316041))

(assert (=> b!304787 m!316041))

(declare-fun m!316043 () Bool)

(assert (=> b!304787 m!316043))

(declare-fun m!316045 () Bool)

(assert (=> b!304788 m!316045))

(declare-fun m!316047 () Bool)

(assert (=> b!304786 m!316047))

(declare-fun m!316049 () Bool)

(assert (=> b!304783 m!316049))

(declare-fun m!316051 () Bool)

(assert (=> b!304783 m!316051))

(declare-fun m!316053 () Bool)

(assert (=> start!30432 m!316053))

(declare-fun m!316055 () Bool)

(assert (=> start!30432 m!316055))

(declare-fun m!316057 () Bool)

(assert (=> b!304789 m!316057))

(check-sat (not b!304788) (not b!304783) (not b!304784) (not b!304785) (not b!304790) (not b!304786) (not b!304787) (not start!30432))
(check-sat)
