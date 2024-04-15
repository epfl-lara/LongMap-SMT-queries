; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30402 () Bool)

(assert start!30402)

(declare-fun b!304156 () Bool)

(declare-fun res!161648 () Bool)

(declare-fun e!191158 () Bool)

(assert (=> b!304156 (=> (not res!161648) (not e!191158))))

(declare-datatypes ((array!15461 0))(
  ( (array!15462 (arr!7317 (Array (_ BitVec 32) (_ BitVec 64))) (size!7670 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15461)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15461 (_ BitVec 32)) Bool)

(assert (=> b!304156 (= res!161648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304158 () Bool)

(declare-fun res!161655 () Bool)

(assert (=> b!304158 (=> (not res!161655) (not e!191158))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304158 (= res!161655 (validKeyInArray!0 k0!2441))))

(declare-fun b!304159 () Bool)

(declare-fun e!191156 () Bool)

(assert (=> b!304159 (= e!191156 (not true))))

(declare-datatypes ((SeekEntryResult!2456 0))(
  ( (MissingZero!2456 (index!12000 (_ BitVec 32))) (Found!2456 (index!12001 (_ BitVec 32))) (Intermediate!2456 (undefined!3268 Bool) (index!12002 (_ BitVec 32)) (x!30277 (_ BitVec 32))) (Undefined!2456) (MissingVacant!2456 (index!12003 (_ BitVec 32))) )
))
(declare-fun lt!150215 () SeekEntryResult!2456)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15461 (_ BitVec 32)) SeekEntryResult!2456)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304159 (= lt!150215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304160 () Bool)

(declare-fun res!161647 () Bool)

(assert (=> b!304160 (=> (not res!161647) (not e!191158))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304160 (= res!161647 (and (= (size!7670 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7670 a!3293))))))

(declare-fun b!304161 () Bool)

(declare-fun res!161653 () Bool)

(assert (=> b!304161 (=> (not res!161653) (not e!191158))))

(declare-fun arrayContainsKey!0 (array!15461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304161 (= res!161653 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304162 () Bool)

(declare-fun e!191157 () Bool)

(assert (=> b!304162 (= e!191157 e!191156)))

(declare-fun res!161650 () Bool)

(assert (=> b!304162 (=> (not res!161650) (not e!191156))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!150214 () SeekEntryResult!2456)

(assert (=> b!304162 (= res!161650 (and (= lt!150215 lt!150214) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7317 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7317 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7317 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304162 (= lt!150215 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304163 () Bool)

(declare-fun res!161652 () Bool)

(assert (=> b!304163 (=> (not res!161652) (not e!191158))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15461 (_ BitVec 32)) SeekEntryResult!2456)

(assert (=> b!304163 (= res!161652 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2456 i!1240)))))

(declare-fun b!304164 () Bool)

(declare-fun res!161654 () Bool)

(assert (=> b!304164 (=> (not res!161654) (not e!191157))))

(assert (=> b!304164 (= res!161654 (and (= (select (arr!7317 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7670 a!3293))))))

(declare-fun res!161651 () Bool)

(assert (=> start!30402 (=> (not res!161651) (not e!191158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30402 (= res!161651 (validMask!0 mask!3709))))

(assert (=> start!30402 e!191158))

(declare-fun array_inv!5289 (array!15461) Bool)

(assert (=> start!30402 (array_inv!5289 a!3293)))

(assert (=> start!30402 true))

(declare-fun b!304157 () Bool)

(assert (=> b!304157 (= e!191158 e!191157)))

(declare-fun res!161649 () Bool)

(assert (=> b!304157 (=> (not res!161649) (not e!191157))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304157 (= res!161649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150214))))

(assert (=> b!304157 (= lt!150214 (Intermediate!2456 false resIndex!52 resX!52))))

(assert (= (and start!30402 res!161651) b!304160))

(assert (= (and b!304160 res!161647) b!304158))

(assert (= (and b!304158 res!161655) b!304161))

(assert (= (and b!304161 res!161653) b!304163))

(assert (= (and b!304163 res!161652) b!304156))

(assert (= (and b!304156 res!161648) b!304157))

(assert (= (and b!304157 res!161649) b!304164))

(assert (= (and b!304164 res!161654) b!304162))

(assert (= (and b!304162 res!161650) b!304159))

(declare-fun m!314797 () Bool)

(assert (=> b!304161 m!314797))

(declare-fun m!314799 () Bool)

(assert (=> b!304158 m!314799))

(declare-fun m!314801 () Bool)

(assert (=> b!304156 m!314801))

(declare-fun m!314803 () Bool)

(assert (=> start!30402 m!314803))

(declare-fun m!314805 () Bool)

(assert (=> start!30402 m!314805))

(declare-fun m!314807 () Bool)

(assert (=> b!304163 m!314807))

(declare-fun m!314809 () Bool)

(assert (=> b!304159 m!314809))

(assert (=> b!304159 m!314809))

(declare-fun m!314811 () Bool)

(assert (=> b!304159 m!314811))

(declare-fun m!314813 () Bool)

(assert (=> b!304164 m!314813))

(declare-fun m!314815 () Bool)

(assert (=> b!304162 m!314815))

(declare-fun m!314817 () Bool)

(assert (=> b!304162 m!314817))

(declare-fun m!314819 () Bool)

(assert (=> b!304157 m!314819))

(assert (=> b!304157 m!314819))

(declare-fun m!314821 () Bool)

(assert (=> b!304157 m!314821))

(check-sat (not b!304162) (not start!30402) (not b!304163) (not b!304157) (not b!304159) (not b!304158) (not b!304156) (not b!304161))
(check-sat)
