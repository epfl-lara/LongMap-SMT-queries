; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30448 () Bool)

(assert start!30448)

(declare-fun b!304863 () Bool)

(declare-fun e!191524 () Bool)

(declare-fun e!191527 () Bool)

(assert (=> b!304863 (= e!191524 e!191527)))

(declare-fun res!162212 () Bool)

(assert (=> b!304863 (=> (not res!162212) (not e!191527))))

(declare-datatypes ((array!15503 0))(
  ( (array!15504 (arr!7338 (Array (_ BitVec 32) (_ BitVec 64))) (size!7690 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15503)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2478 0))(
  ( (MissingZero!2478 (index!12088 (_ BitVec 32))) (Found!2478 (index!12089 (_ BitVec 32))) (Intermediate!2478 (undefined!3290 Bool) (index!12090 (_ BitVec 32)) (x!30344 (_ BitVec 32))) (Undefined!2478) (MissingVacant!2478 (index!12091 (_ BitVec 32))) )
))
(declare-fun lt!150546 () SeekEntryResult!2478)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15503 (_ BitVec 32)) SeekEntryResult!2478)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304863 (= res!162212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150546))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304863 (= lt!150546 (Intermediate!2478 false resIndex!52 resX!52))))

(declare-fun b!304864 () Bool)

(declare-fun res!162215 () Bool)

(assert (=> b!304864 (=> (not res!162215) (not e!191527))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304864 (= res!162215 (and (= (select (arr!7338 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7690 a!3293))))))

(declare-fun b!304865 () Bool)

(declare-fun res!162214 () Bool)

(assert (=> b!304865 (=> (not res!162214) (not e!191524))))

(declare-fun arrayContainsKey!0 (array!15503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304865 (= res!162214 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304866 () Bool)

(declare-fun res!162213 () Bool)

(assert (=> b!304866 (=> (not res!162213) (not e!191524))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15503 (_ BitVec 32)) SeekEntryResult!2478)

(assert (=> b!304866 (= res!162213 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2478 i!1240)))))

(declare-fun b!304867 () Bool)

(declare-fun e!191526 () Bool)

(assert (=> b!304867 (= e!191526 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!150545 () SeekEntryResult!2478)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304867 (= lt!150545 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304868 () Bool)

(declare-fun res!162216 () Bool)

(assert (=> b!304868 (=> (not res!162216) (not e!191524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304868 (= res!162216 (validKeyInArray!0 k0!2441))))

(declare-fun b!304869 () Bool)

(assert (=> b!304869 (= e!191527 e!191526)))

(declare-fun res!162210 () Bool)

(assert (=> b!304869 (=> (not res!162210) (not e!191526))))

(assert (=> b!304869 (= res!162210 (and (= lt!150545 lt!150546) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7338 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7338 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7338 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304869 (= lt!150545 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304870 () Bool)

(declare-fun res!162211 () Bool)

(assert (=> b!304870 (=> (not res!162211) (not e!191524))))

(assert (=> b!304870 (= res!162211 (and (= (size!7690 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7690 a!3293))))))

(declare-fun res!162208 () Bool)

(assert (=> start!30448 (=> (not res!162208) (not e!191524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30448 (= res!162208 (validMask!0 mask!3709))))

(assert (=> start!30448 e!191524))

(declare-fun array_inv!5301 (array!15503) Bool)

(assert (=> start!30448 (array_inv!5301 a!3293)))

(assert (=> start!30448 true))

(declare-fun b!304871 () Bool)

(declare-fun res!162209 () Bool)

(assert (=> b!304871 (=> (not res!162209) (not e!191524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15503 (_ BitVec 32)) Bool)

(assert (=> b!304871 (= res!162209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30448 res!162208) b!304870))

(assert (= (and b!304870 res!162211) b!304868))

(assert (= (and b!304868 res!162216) b!304865))

(assert (= (and b!304865 res!162214) b!304866))

(assert (= (and b!304866 res!162213) b!304871))

(assert (= (and b!304871 res!162209) b!304863))

(assert (= (and b!304863 res!162212) b!304864))

(assert (= (and b!304864 res!162215) b!304869))

(assert (= (and b!304869 res!162210) b!304867))

(declare-fun m!315943 () Bool)

(assert (=> b!304866 m!315943))

(declare-fun m!315945 () Bool)

(assert (=> b!304863 m!315945))

(assert (=> b!304863 m!315945))

(declare-fun m!315947 () Bool)

(assert (=> b!304863 m!315947))

(declare-fun m!315949 () Bool)

(assert (=> b!304865 m!315949))

(declare-fun m!315951 () Bool)

(assert (=> start!30448 m!315951))

(declare-fun m!315953 () Bool)

(assert (=> start!30448 m!315953))

(declare-fun m!315955 () Bool)

(assert (=> b!304864 m!315955))

(declare-fun m!315957 () Bool)

(assert (=> b!304869 m!315957))

(declare-fun m!315959 () Bool)

(assert (=> b!304869 m!315959))

(declare-fun m!315961 () Bool)

(assert (=> b!304868 m!315961))

(declare-fun m!315963 () Bool)

(assert (=> b!304867 m!315963))

(assert (=> b!304867 m!315963))

(declare-fun m!315965 () Bool)

(assert (=> b!304867 m!315965))

(declare-fun m!315967 () Bool)

(assert (=> b!304871 m!315967))

(check-sat (not b!304863) (not b!304866) (not b!304871) (not b!304868) (not b!304865) (not b!304869) (not b!304867) (not start!30448))
(check-sat)
