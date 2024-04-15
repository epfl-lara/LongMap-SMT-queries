; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31422 () Bool)

(assert start!31422)

(declare-fun b!314551 () Bool)

(declare-fun res!170313 () Bool)

(declare-fun e!195857 () Bool)

(assert (=> b!314551 (=> (not res!170313) (not e!195857))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314551 (= res!170313 (validKeyInArray!0 k0!2441))))

(declare-fun b!314552 () Bool)

(declare-fun res!170312 () Bool)

(assert (=> b!314552 (=> (not res!170312) (not e!195857))))

(declare-datatypes ((array!16052 0))(
  ( (array!16053 (arr!7599 (Array (_ BitVec 32) (_ BitVec 64))) (size!7952 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16052)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16052 (_ BitVec 32)) Bool)

(assert (=> b!314552 (= res!170312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314553 () Bool)

(declare-fun res!170307 () Bool)

(declare-fun e!195860 () Bool)

(assert (=> b!314553 (=> (not res!170307) (not e!195860))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314553 (= res!170307 (and (= (select (arr!7599 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7952 a!3293))))))

(declare-fun b!314554 () Bool)

(declare-fun res!170309 () Bool)

(assert (=> b!314554 (=> (not res!170309) (not e!195857))))

(declare-fun arrayContainsKey!0 (array!16052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314554 (= res!170309 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314555 () Bool)

(declare-fun e!195859 () Bool)

(assert (=> b!314555 (= e!195860 e!195859)))

(declare-fun res!170310 () Bool)

(assert (=> b!314555 (=> (not res!170310) (not e!195859))))

(declare-datatypes ((SeekEntryResult!2738 0))(
  ( (MissingZero!2738 (index!13128 (_ BitVec 32))) (Found!2738 (index!13129 (_ BitVec 32))) (Intermediate!2738 (undefined!3550 Bool) (index!13130 (_ BitVec 32)) (x!31377 (_ BitVec 32))) (Undefined!2738) (MissingVacant!2738 (index!13131 (_ BitVec 32))) )
))
(declare-fun lt!153799 () SeekEntryResult!2738)

(declare-fun lt!153800 () SeekEntryResult!2738)

(assert (=> b!314555 (= res!170310 (and (= lt!153800 lt!153799) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7599 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7599 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7599 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16052 (_ BitVec 32)) SeekEntryResult!2738)

(assert (=> b!314555 (= lt!153800 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314556 () Bool)

(declare-fun res!170305 () Bool)

(assert (=> b!314556 (=> (not res!170305) (not e!195857))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16052 (_ BitVec 32)) SeekEntryResult!2738)

(assert (=> b!314556 (= res!170305 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2738 i!1240)))))

(declare-fun res!170311 () Bool)

(assert (=> start!31422 (=> (not res!170311) (not e!195857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31422 (= res!170311 (validMask!0 mask!3709))))

(assert (=> start!31422 e!195857))

(declare-fun array_inv!5571 (array!16052) Bool)

(assert (=> start!31422 (array_inv!5571 a!3293)))

(assert (=> start!31422 true))

(declare-fun b!314557 () Bool)

(assert (=> b!314557 (= e!195859 (not false))))

(assert (=> b!314557 (= lt!153800 (Intermediate!2738 false index!1781 resX!52))))

(declare-fun b!314558 () Bool)

(assert (=> b!314558 (= e!195857 e!195860)))

(declare-fun res!170308 () Bool)

(assert (=> b!314558 (=> (not res!170308) (not e!195860))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314558 (= res!170308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153799))))

(assert (=> b!314558 (= lt!153799 (Intermediate!2738 false resIndex!52 resX!52))))

(declare-fun b!314559 () Bool)

(declare-fun res!170306 () Bool)

(assert (=> b!314559 (=> (not res!170306) (not e!195857))))

(assert (=> b!314559 (= res!170306 (and (= (size!7952 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7952 a!3293))))))

(assert (= (and start!31422 res!170311) b!314559))

(assert (= (and b!314559 res!170306) b!314551))

(assert (= (and b!314551 res!170313) b!314554))

(assert (= (and b!314554 res!170309) b!314556))

(assert (= (and b!314556 res!170305) b!314552))

(assert (= (and b!314552 res!170312) b!314558))

(assert (= (and b!314558 res!170308) b!314553))

(assert (= (and b!314553 res!170307) b!314555))

(assert (= (and b!314555 res!170310) b!314557))

(declare-fun m!323527 () Bool)

(assert (=> b!314554 m!323527))

(declare-fun m!323529 () Bool)

(assert (=> b!314555 m!323529))

(declare-fun m!323531 () Bool)

(assert (=> b!314555 m!323531))

(declare-fun m!323533 () Bool)

(assert (=> b!314558 m!323533))

(assert (=> b!314558 m!323533))

(declare-fun m!323535 () Bool)

(assert (=> b!314558 m!323535))

(declare-fun m!323537 () Bool)

(assert (=> b!314553 m!323537))

(declare-fun m!323539 () Bool)

(assert (=> start!31422 m!323539))

(declare-fun m!323541 () Bool)

(assert (=> start!31422 m!323541))

(declare-fun m!323543 () Bool)

(assert (=> b!314552 m!323543))

(declare-fun m!323545 () Bool)

(assert (=> b!314556 m!323545))

(declare-fun m!323547 () Bool)

(assert (=> b!314551 m!323547))

(check-sat (not b!314556) (not b!314554) (not b!314551) (not b!314555) (not b!314558) (not start!31422) (not b!314552))
(check-sat)
