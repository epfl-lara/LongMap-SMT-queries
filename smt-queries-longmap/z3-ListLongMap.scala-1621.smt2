; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30438 () Bool)

(assert start!30438)

(declare-fun res!162261 () Bool)

(declare-fun e!191515 () Bool)

(assert (=> start!30438 (=> (not res!162261) (not e!191515))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30438 (= res!162261 (validMask!0 mask!3709))))

(assert (=> start!30438 e!191515))

(declare-datatypes ((array!15506 0))(
  ( (array!15507 (arr!7339 (Array (_ BitVec 32) (_ BitVec 64))) (size!7691 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15506)

(declare-fun array_inv!5289 (array!15506) Bool)

(assert (=> start!30438 (array_inv!5289 a!3293)))

(assert (=> start!30438 true))

(declare-fun b!304864 () Bool)

(declare-fun e!191517 () Bool)

(assert (=> b!304864 (= e!191515 e!191517)))

(declare-fun res!162263 () Bool)

(assert (=> b!304864 (=> (not res!162263) (not e!191517))))

(declare-datatypes ((SeekEntryResult!2444 0))(
  ( (MissingZero!2444 (index!11952 (_ BitVec 32))) (Found!2444 (index!11953 (_ BitVec 32))) (Intermediate!2444 (undefined!3256 Bool) (index!11954 (_ BitVec 32)) (x!30315 (_ BitVec 32))) (Undefined!2444) (MissingVacant!2444 (index!11955 (_ BitVec 32))) )
))
(declare-fun lt!150575 () SeekEntryResult!2444)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15506 (_ BitVec 32)) SeekEntryResult!2444)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304864 (= res!162263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150575))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304864 (= lt!150575 (Intermediate!2444 false resIndex!52 resX!52))))

(declare-fun b!304865 () Bool)

(declare-fun res!162265 () Bool)

(assert (=> b!304865 (=> (not res!162265) (not e!191515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15506 (_ BitVec 32)) Bool)

(assert (=> b!304865 (= res!162265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304866 () Bool)

(declare-fun res!162267 () Bool)

(assert (=> b!304866 (=> (not res!162267) (not e!191515))))

(declare-fun arrayContainsKey!0 (array!15506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304866 (= res!162267 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304867 () Bool)

(declare-fun res!162260 () Bool)

(assert (=> b!304867 (=> (not res!162260) (not e!191515))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304867 (= res!162260 (and (= (size!7691 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7691 a!3293))))))

(declare-fun b!304868 () Bool)

(declare-fun res!162264 () Bool)

(assert (=> b!304868 (=> (not res!162264) (not e!191515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304868 (= res!162264 (validKeyInArray!0 k0!2441))))

(declare-fun b!304869 () Bool)

(declare-fun res!162266 () Bool)

(assert (=> b!304869 (=> (not res!162266) (not e!191515))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15506 (_ BitVec 32)) SeekEntryResult!2444)

(assert (=> b!304869 (= res!162266 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2444 i!1240)))))

(declare-fun b!304870 () Bool)

(declare-fun e!191516 () Bool)

(assert (=> b!304870 (= e!191517 e!191516)))

(declare-fun res!162262 () Bool)

(assert (=> b!304870 (=> (not res!162262) (not e!191516))))

(declare-fun lt!150576 () SeekEntryResult!2444)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304870 (= res!162262 (and (= lt!150576 lt!150575) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7339 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7339 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7339 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304870 (= lt!150576 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304871 () Bool)

(assert (=> b!304871 (= e!191516 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304871 (= lt!150576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304872 () Bool)

(declare-fun res!162259 () Bool)

(assert (=> b!304872 (=> (not res!162259) (not e!191517))))

(assert (=> b!304872 (= res!162259 (and (= (select (arr!7339 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7691 a!3293))))))

(assert (= (and start!30438 res!162261) b!304867))

(assert (= (and b!304867 res!162260) b!304868))

(assert (= (and b!304868 res!162264) b!304866))

(assert (= (and b!304866 res!162267) b!304869))

(assert (= (and b!304869 res!162266) b!304865))

(assert (= (and b!304865 res!162265) b!304864))

(assert (= (and b!304864 res!162263) b!304872))

(assert (= (and b!304872 res!162259) b!304870))

(assert (= (and b!304870 res!162262) b!304871))

(declare-fun m!316111 () Bool)

(assert (=> b!304872 m!316111))

(declare-fun m!316113 () Bool)

(assert (=> start!30438 m!316113))

(declare-fun m!316115 () Bool)

(assert (=> start!30438 m!316115))

(declare-fun m!316117 () Bool)

(assert (=> b!304866 m!316117))

(declare-fun m!316119 () Bool)

(assert (=> b!304865 m!316119))

(declare-fun m!316121 () Bool)

(assert (=> b!304864 m!316121))

(assert (=> b!304864 m!316121))

(declare-fun m!316123 () Bool)

(assert (=> b!304864 m!316123))

(declare-fun m!316125 () Bool)

(assert (=> b!304868 m!316125))

(declare-fun m!316127 () Bool)

(assert (=> b!304869 m!316127))

(declare-fun m!316129 () Bool)

(assert (=> b!304870 m!316129))

(declare-fun m!316131 () Bool)

(assert (=> b!304870 m!316131))

(declare-fun m!316133 () Bool)

(assert (=> b!304871 m!316133))

(assert (=> b!304871 m!316133))

(declare-fun m!316135 () Bool)

(assert (=> b!304871 m!316135))

(check-sat (not b!304864) (not b!304870) (not b!304865) (not b!304868) (not b!304871) (not start!30438) (not b!304869) (not b!304866))
(check-sat)
