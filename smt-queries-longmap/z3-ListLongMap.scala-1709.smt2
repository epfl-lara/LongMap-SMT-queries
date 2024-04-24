; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31422 () Bool)

(assert start!31422)

(declare-fun b!314773 () Bool)

(declare-fun e!196002 () Bool)

(declare-fun e!196001 () Bool)

(assert (=> b!314773 (= e!196002 e!196001)))

(declare-fun res!170438 () Bool)

(assert (=> b!314773 (=> (not res!170438) (not e!196001))))

(declare-datatypes ((array!16061 0))(
  ( (array!16062 (arr!7603 (Array (_ BitVec 32) (_ BitVec 64))) (size!7955 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16061)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2708 0))(
  ( (MissingZero!2708 (index!13008 (_ BitVec 32))) (Found!2708 (index!13009 (_ BitVec 32))) (Intermediate!2708 (undefined!3520 Bool) (index!13010 (_ BitVec 32)) (x!31349 (_ BitVec 32))) (Undefined!2708) (MissingVacant!2708 (index!13011 (_ BitVec 32))) )
))
(declare-fun lt!154052 () SeekEntryResult!2708)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16061 (_ BitVec 32)) SeekEntryResult!2708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314773 (= res!170438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154052))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314773 (= lt!154052 (Intermediate!2708 false resIndex!52 resX!52))))

(declare-fun b!314774 () Bool)

(declare-fun res!170436 () Bool)

(assert (=> b!314774 (=> (not res!170436) (not e!196002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16061 (_ BitVec 32)) Bool)

(assert (=> b!314774 (= res!170436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314775 () Bool)

(declare-fun e!196000 () Bool)

(assert (=> b!314775 (= e!196001 e!196000)))

(declare-fun res!170431 () Bool)

(assert (=> b!314775 (=> (not res!170431) (not e!196000))))

(declare-fun lt!154053 () SeekEntryResult!2708)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!314775 (= res!170431 (and (= lt!154053 lt!154052) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7603 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7603 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7603 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314775 (= lt!154053 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314776 () Bool)

(declare-fun res!170435 () Bool)

(assert (=> b!314776 (=> (not res!170435) (not e!196002))))

(declare-fun arrayContainsKey!0 (array!16061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314776 (= res!170435 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170432 () Bool)

(assert (=> start!31422 (=> (not res!170432) (not e!196002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31422 (= res!170432 (validMask!0 mask!3709))))

(assert (=> start!31422 e!196002))

(declare-fun array_inv!5553 (array!16061) Bool)

(assert (=> start!31422 (array_inv!5553 a!3293)))

(assert (=> start!31422 true))

(declare-fun b!314777 () Bool)

(declare-fun res!170434 () Bool)

(assert (=> b!314777 (=> (not res!170434) (not e!196002))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16061 (_ BitVec 32)) SeekEntryResult!2708)

(assert (=> b!314777 (= res!170434 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2708 i!1240)))))

(declare-fun b!314778 () Bool)

(declare-fun res!170439 () Bool)

(assert (=> b!314778 (=> (not res!170439) (not e!196002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314778 (= res!170439 (validKeyInArray!0 k0!2441))))

(declare-fun b!314779 () Bool)

(assert (=> b!314779 (= e!196000 (not false))))

(assert (=> b!314779 (= lt!154053 (Intermediate!2708 false index!1781 resX!52))))

(declare-fun b!314780 () Bool)

(declare-fun res!170433 () Bool)

(assert (=> b!314780 (=> (not res!170433) (not e!196002))))

(assert (=> b!314780 (= res!170433 (and (= (size!7955 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7955 a!3293))))))

(declare-fun b!314781 () Bool)

(declare-fun res!170437 () Bool)

(assert (=> b!314781 (=> (not res!170437) (not e!196001))))

(assert (=> b!314781 (= res!170437 (and (= (select (arr!7603 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7955 a!3293))))))

(assert (= (and start!31422 res!170432) b!314780))

(assert (= (and b!314780 res!170433) b!314778))

(assert (= (and b!314778 res!170439) b!314776))

(assert (= (and b!314776 res!170435) b!314777))

(assert (= (and b!314777 res!170434) b!314774))

(assert (= (and b!314774 res!170436) b!314773))

(assert (= (and b!314773 res!170438) b!314781))

(assert (= (and b!314781 res!170437) b!314775))

(assert (= (and b!314775 res!170431) b!314779))

(declare-fun m!324397 () Bool)

(assert (=> b!314776 m!324397))

(declare-fun m!324399 () Bool)

(assert (=> start!31422 m!324399))

(declare-fun m!324401 () Bool)

(assert (=> start!31422 m!324401))

(declare-fun m!324403 () Bool)

(assert (=> b!314774 m!324403))

(declare-fun m!324405 () Bool)

(assert (=> b!314775 m!324405))

(declare-fun m!324407 () Bool)

(assert (=> b!314775 m!324407))

(declare-fun m!324409 () Bool)

(assert (=> b!314773 m!324409))

(assert (=> b!314773 m!324409))

(declare-fun m!324411 () Bool)

(assert (=> b!314773 m!324411))

(declare-fun m!324413 () Bool)

(assert (=> b!314777 m!324413))

(declare-fun m!324415 () Bool)

(assert (=> b!314781 m!324415))

(declare-fun m!324417 () Bool)

(assert (=> b!314778 m!324417))

(check-sat (not b!314777) (not b!314773) (not start!31422) (not b!314775) (not b!314776) (not b!314778) (not b!314774))
(check-sat)
