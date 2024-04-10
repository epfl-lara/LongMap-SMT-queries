; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30556 () Bool)

(assert start!30556)

(declare-fun b!306040 () Bool)

(assert (=> b!306040 false))

(declare-datatypes ((Unit!9466 0))(
  ( (Unit!9467) )
))
(declare-fun e!192037 () Unit!9466)

(declare-fun Unit!9468 () Unit!9466)

(assert (=> b!306040 (= e!192037 Unit!9468)))

(declare-datatypes ((array!15560 0))(
  ( (array!15561 (arr!7365 (Array (_ BitVec 32) (_ BitVec 64))) (size!7717 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15560)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!306041 () Bool)

(declare-fun e!192040 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306041 (= e!192040 (not (or (not (= (select (arr!7365 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306041 (= index!1781 resIndex!52)))

(declare-fun lt!150879 () Unit!9466)

(declare-fun e!192039 () Unit!9466)

(assert (=> b!306041 (= lt!150879 e!192039)))

(declare-fun c!49092 () Bool)

(assert (=> b!306041 (= c!49092 (not (= resIndex!52 index!1781)))))

(declare-fun b!306042 () Bool)

(assert (=> b!306042 (= e!192039 e!192037)))

(declare-fun c!49091 () Bool)

(assert (=> b!306042 (= c!49091 (or (= (select (arr!7365 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7365 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306043 () Bool)

(assert (=> b!306043 false))

(declare-datatypes ((SeekEntryResult!2505 0))(
  ( (MissingZero!2505 (index!12196 (_ BitVec 32))) (Found!2505 (index!12197 (_ BitVec 32))) (Intermediate!2505 (undefined!3317 Bool) (index!12198 (_ BitVec 32)) (x!30452 (_ BitVec 32))) (Undefined!2505) (MissingVacant!2505 (index!12199 (_ BitVec 32))) )
))
(declare-fun lt!150877 () SeekEntryResult!2505)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15560 (_ BitVec 32)) SeekEntryResult!2505)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306043 (= lt!150877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9469 () Unit!9466)

(assert (=> b!306043 (= e!192037 Unit!9469)))

(declare-fun res!163063 () Bool)

(declare-fun e!192038 () Bool)

(assert (=> start!30556 (=> (not res!163063) (not e!192038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30556 (= res!163063 (validMask!0 mask!3709))))

(assert (=> start!30556 e!192038))

(declare-fun array_inv!5328 (array!15560) Bool)

(assert (=> start!30556 (array_inv!5328 a!3293)))

(assert (=> start!30556 true))

(declare-fun b!306044 () Bool)

(declare-fun res!163070 () Bool)

(assert (=> b!306044 (=> (not res!163070) (not e!192038))))

(declare-fun arrayContainsKey!0 (array!15560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306044 (= res!163070 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306045 () Bool)

(declare-fun res!163071 () Bool)

(assert (=> b!306045 (=> (not res!163071) (not e!192040))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306045 (= res!163071 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7365 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306046 () Bool)

(declare-fun res!163062 () Bool)

(assert (=> b!306046 (=> (not res!163062) (not e!192038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306046 (= res!163062 (validKeyInArray!0 k0!2441))))

(declare-fun b!306047 () Bool)

(declare-fun res!163068 () Bool)

(assert (=> b!306047 (=> (not res!163068) (not e!192040))))

(declare-fun lt!150878 () SeekEntryResult!2505)

(assert (=> b!306047 (= res!163068 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150878))))

(declare-fun b!306048 () Bool)

(declare-fun res!163069 () Bool)

(assert (=> b!306048 (=> (not res!163069) (not e!192038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15560 (_ BitVec 32)) Bool)

(assert (=> b!306048 (= res!163069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306049 () Bool)

(declare-fun res!163065 () Bool)

(assert (=> b!306049 (=> (not res!163065) (not e!192040))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306049 (= res!163065 (and (= (select (arr!7365 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7717 a!3293))))))

(declare-fun b!306050 () Bool)

(declare-fun res!163067 () Bool)

(assert (=> b!306050 (=> (not res!163067) (not e!192038))))

(assert (=> b!306050 (= res!163067 (and (= (size!7717 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7717 a!3293))))))

(declare-fun b!306051 () Bool)

(declare-fun Unit!9470 () Unit!9466)

(assert (=> b!306051 (= e!192039 Unit!9470)))

(declare-fun b!306052 () Bool)

(declare-fun res!163064 () Bool)

(assert (=> b!306052 (=> (not res!163064) (not e!192038))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15560 (_ BitVec 32)) SeekEntryResult!2505)

(assert (=> b!306052 (= res!163064 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2505 i!1240)))))

(declare-fun b!306053 () Bool)

(assert (=> b!306053 (= e!192038 e!192040)))

(declare-fun res!163066 () Bool)

(assert (=> b!306053 (=> (not res!163066) (not e!192040))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306053 (= res!163066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150878))))

(assert (=> b!306053 (= lt!150878 (Intermediate!2505 false resIndex!52 resX!52))))

(assert (= (and start!30556 res!163063) b!306050))

(assert (= (and b!306050 res!163067) b!306046))

(assert (= (and b!306046 res!163062) b!306044))

(assert (= (and b!306044 res!163070) b!306052))

(assert (= (and b!306052 res!163064) b!306048))

(assert (= (and b!306048 res!163069) b!306053))

(assert (= (and b!306053 res!163066) b!306049))

(assert (= (and b!306049 res!163065) b!306047))

(assert (= (and b!306047 res!163068) b!306045))

(assert (= (and b!306045 res!163071) b!306041))

(assert (= (and b!306041 c!49092) b!306042))

(assert (= (and b!306041 (not c!49092)) b!306051))

(assert (= (and b!306042 c!49091) b!306040))

(assert (= (and b!306042 (not c!49091)) b!306043))

(declare-fun m!316783 () Bool)

(assert (=> b!306042 m!316783))

(declare-fun m!316785 () Bool)

(assert (=> b!306047 m!316785))

(declare-fun m!316787 () Bool)

(assert (=> b!306044 m!316787))

(declare-fun m!316789 () Bool)

(assert (=> b!306043 m!316789))

(assert (=> b!306043 m!316789))

(declare-fun m!316791 () Bool)

(assert (=> b!306043 m!316791))

(assert (=> b!306045 m!316783))

(declare-fun m!316793 () Bool)

(assert (=> b!306049 m!316793))

(declare-fun m!316795 () Bool)

(assert (=> b!306046 m!316795))

(declare-fun m!316797 () Bool)

(assert (=> b!306052 m!316797))

(declare-fun m!316799 () Bool)

(assert (=> start!30556 m!316799))

(declare-fun m!316801 () Bool)

(assert (=> start!30556 m!316801))

(declare-fun m!316803 () Bool)

(assert (=> b!306053 m!316803))

(assert (=> b!306053 m!316803))

(declare-fun m!316805 () Bool)

(assert (=> b!306053 m!316805))

(declare-fun m!316807 () Bool)

(assert (=> b!306048 m!316807))

(assert (=> b!306041 m!316783))

(check-sat (not start!30556) (not b!306047) (not b!306044) (not b!306048) (not b!306053) (not b!306052) (not b!306046) (not b!306043))
(check-sat)
