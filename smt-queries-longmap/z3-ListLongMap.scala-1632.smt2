; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30558 () Bool)

(assert start!30558)

(declare-fun b!306101 () Bool)

(declare-fun res!163181 () Bool)

(declare-fun e!191980 () Bool)

(assert (=> b!306101 (=> (not res!163181) (not e!191980))))

(declare-datatypes ((array!15566 0))(
  ( (array!15567 (arr!7368 (Array (_ BitVec 32) (_ BitVec 64))) (size!7721 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15566)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2507 0))(
  ( (MissingZero!2507 (index!12204 (_ BitVec 32))) (Found!2507 (index!12205 (_ BitVec 32))) (Intermediate!2507 (undefined!3319 Bool) (index!12206 (_ BitVec 32)) (x!30473 (_ BitVec 32))) (Undefined!2507) (MissingVacant!2507 (index!12207 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15566 (_ BitVec 32)) SeekEntryResult!2507)

(assert (=> b!306101 (= res!163181 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2507 i!1240)))))

(declare-fun b!306102 () Bool)

(declare-fun res!163175 () Bool)

(declare-fun e!191981 () Bool)

(assert (=> b!306102 (=> (not res!163175) (not e!191981))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!306102 (= res!163175 (and (= (select (arr!7368 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7721 a!3293))))))

(declare-fun b!306103 () Bool)

(declare-datatypes ((Unit!9466 0))(
  ( (Unit!9467) )
))
(declare-fun e!191984 () Unit!9466)

(declare-fun e!191983 () Unit!9466)

(assert (=> b!306103 (= e!191984 e!191983)))

(declare-fun c!49066 () Bool)

(assert (=> b!306103 (= c!49066 (or (= (select (arr!7368 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7368 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306104 () Bool)

(assert (=> b!306104 false))

(declare-fun Unit!9468 () Unit!9466)

(assert (=> b!306104 (= e!191983 Unit!9468)))

(declare-fun b!306105 () Bool)

(declare-fun res!163174 () Bool)

(assert (=> b!306105 (=> (not res!163174) (not e!191980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15566 (_ BitVec 32)) Bool)

(assert (=> b!306105 (= res!163174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306107 () Bool)

(assert (=> b!306107 false))

(declare-fun lt!150714 () SeekEntryResult!2507)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15566 (_ BitVec 32)) SeekEntryResult!2507)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306107 (= lt!150714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9469 () Unit!9466)

(assert (=> b!306107 (= e!191983 Unit!9469)))

(declare-fun b!306108 () Bool)

(declare-fun res!163177 () Bool)

(assert (=> b!306108 (=> (not res!163177) (not e!191980))))

(assert (=> b!306108 (= res!163177 (and (= (size!7721 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7721 a!3293))))))

(declare-fun b!306109 () Bool)

(assert (=> b!306109 (= e!191980 e!191981)))

(declare-fun res!163173 () Bool)

(assert (=> b!306109 (=> (not res!163173) (not e!191981))))

(declare-fun lt!150716 () SeekEntryResult!2507)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306109 (= res!163173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150716))))

(assert (=> b!306109 (= lt!150716 (Intermediate!2507 false resIndex!52 resX!52))))

(declare-fun b!306110 () Bool)

(declare-fun Unit!9470 () Unit!9466)

(assert (=> b!306110 (= e!191984 Unit!9470)))

(declare-fun b!306111 () Bool)

(declare-fun res!163178 () Bool)

(assert (=> b!306111 (=> (not res!163178) (not e!191981))))

(assert (=> b!306111 (= res!163178 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150716))))

(declare-fun b!306112 () Bool)

(declare-fun res!163182 () Bool)

(assert (=> b!306112 (=> (not res!163182) (not e!191980))))

(declare-fun arrayContainsKey!0 (array!15566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306112 (= res!163182 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!163176 () Bool)

(assert (=> start!30558 (=> (not res!163176) (not e!191980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30558 (= res!163176 (validMask!0 mask!3709))))

(assert (=> start!30558 e!191980))

(declare-fun array_inv!5340 (array!15566) Bool)

(assert (=> start!30558 (array_inv!5340 a!3293)))

(assert (=> start!30558 true))

(declare-fun b!306106 () Bool)

(assert (=> b!306106 (= e!191981 (not (or (not (= (select (arr!7368 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(assert (=> b!306106 (= index!1781 resIndex!52)))

(declare-fun lt!150715 () Unit!9466)

(assert (=> b!306106 (= lt!150715 e!191984)))

(declare-fun c!49067 () Bool)

(assert (=> b!306106 (= c!49067 (not (= resIndex!52 index!1781)))))

(declare-fun b!306113 () Bool)

(declare-fun res!163180 () Bool)

(assert (=> b!306113 (=> (not res!163180) (not e!191981))))

(assert (=> b!306113 (= res!163180 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7368 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306114 () Bool)

(declare-fun res!163179 () Bool)

(assert (=> b!306114 (=> (not res!163179) (not e!191980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306114 (= res!163179 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30558 res!163176) b!306108))

(assert (= (and b!306108 res!163177) b!306114))

(assert (= (and b!306114 res!163179) b!306112))

(assert (= (and b!306112 res!163182) b!306101))

(assert (= (and b!306101 res!163181) b!306105))

(assert (= (and b!306105 res!163174) b!306109))

(assert (= (and b!306109 res!163173) b!306102))

(assert (= (and b!306102 res!163175) b!306111))

(assert (= (and b!306111 res!163178) b!306113))

(assert (= (and b!306113 res!163180) b!306106))

(assert (= (and b!306106 c!49067) b!306103))

(assert (= (and b!306106 (not c!49067)) b!306110))

(assert (= (and b!306103 c!49066) b!306104))

(assert (= (and b!306103 (not c!49066)) b!306107))

(declare-fun m!316261 () Bool)

(assert (=> b!306106 m!316261))

(declare-fun m!316263 () Bool)

(assert (=> b!306105 m!316263))

(declare-fun m!316265 () Bool)

(assert (=> start!30558 m!316265))

(declare-fun m!316267 () Bool)

(assert (=> start!30558 m!316267))

(declare-fun m!316269 () Bool)

(assert (=> b!306107 m!316269))

(assert (=> b!306107 m!316269))

(declare-fun m!316271 () Bool)

(assert (=> b!306107 m!316271))

(assert (=> b!306103 m!316261))

(declare-fun m!316273 () Bool)

(assert (=> b!306102 m!316273))

(declare-fun m!316275 () Bool)

(assert (=> b!306109 m!316275))

(assert (=> b!306109 m!316275))

(declare-fun m!316277 () Bool)

(assert (=> b!306109 m!316277))

(declare-fun m!316279 () Bool)

(assert (=> b!306101 m!316279))

(declare-fun m!316281 () Bool)

(assert (=> b!306114 m!316281))

(assert (=> b!306113 m!316261))

(declare-fun m!316283 () Bool)

(assert (=> b!306111 m!316283))

(declare-fun m!316285 () Bool)

(assert (=> b!306112 m!316285))

(check-sat (not b!306112) (not b!306105) (not start!30558) (not b!306114) (not b!306107) (not b!306111) (not b!306101) (not b!306109))
(check-sat)
