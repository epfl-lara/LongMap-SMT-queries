; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32472 () Bool)

(assert start!32472)

(declare-fun b!324533 () Bool)

(declare-fun res!177870 () Bool)

(declare-fun e!200306 () Bool)

(assert (=> b!324533 (=> (not res!177870) (not e!200306))))

(declare-datatypes ((array!16611 0))(
  ( (array!16612 (arr!7863 (Array (_ BitVec 32) (_ BitVec 64))) (size!8215 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16611)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2994 0))(
  ( (MissingZero!2994 (index!14152 (_ BitVec 32))) (Found!2994 (index!14153 (_ BitVec 32))) (Intermediate!2994 (undefined!3806 Bool) (index!14154 (_ BitVec 32)) (x!32398 (_ BitVec 32))) (Undefined!2994) (MissingVacant!2994 (index!14155 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16611 (_ BitVec 32)) SeekEntryResult!2994)

(assert (=> b!324533 (= res!177870 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2994 i!1250)))))

(declare-fun b!324534 () Bool)

(declare-fun res!177872 () Bool)

(assert (=> b!324534 (=> (not res!177872) (not e!200306))))

(declare-fun arrayContainsKey!0 (array!16611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324534 (= res!177872 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324535 () Bool)

(declare-fun res!177871 () Bool)

(assert (=> b!324535 (=> (not res!177871) (not e!200306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324535 (= res!177871 (validKeyInArray!0 k0!2497))))

(declare-fun b!324536 () Bool)

(declare-fun res!177865 () Bool)

(declare-fun e!200307 () Bool)

(assert (=> b!324536 (=> (not res!177865) (not e!200307))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156821 () SeekEntryResult!2994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16611 (_ BitVec 32)) SeekEntryResult!2994)

(assert (=> b!324536 (= res!177865 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156821))))

(declare-fun b!324537 () Bool)

(declare-fun res!177864 () Bool)

(assert (=> b!324537 (=> (not res!177864) (not e!200306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16611 (_ BitVec 32)) Bool)

(assert (=> b!324537 (= res!177864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324538 () Bool)

(declare-fun res!177866 () Bool)

(assert (=> b!324538 (=> (not res!177866) (not e!200307))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324538 (= res!177866 (and (= (select (arr!7863 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8215 a!3305))))))

(declare-fun b!324539 () Bool)

(assert (=> b!324539 (= e!200306 e!200307)))

(declare-fun res!177867 () Bool)

(assert (=> b!324539 (=> (not res!177867) (not e!200307))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324539 (= res!177867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156821))))

(assert (=> b!324539 (= lt!156821 (Intermediate!2994 false resIndex!58 resX!58))))

(declare-fun b!324540 () Bool)

(declare-fun res!177869 () Bool)

(assert (=> b!324540 (=> (not res!177869) (not e!200306))))

(assert (=> b!324540 (= res!177869 (and (= (size!8215 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8215 a!3305))))))

(declare-fun res!177868 () Bool)

(assert (=> start!32472 (=> (not res!177868) (not e!200306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32472 (= res!177868 (validMask!0 mask!3777))))

(assert (=> start!32472 e!200306))

(declare-fun array_inv!5826 (array!16611) Bool)

(assert (=> start!32472 (array_inv!5826 a!3305)))

(assert (=> start!32472 true))

(declare-fun b!324541 () Bool)

(assert (=> b!324541 (= e!200307 false)))

(declare-fun lt!156822 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324541 (= lt!156822 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324542 () Bool)

(declare-fun res!177873 () Bool)

(assert (=> b!324542 (=> (not res!177873) (not e!200307))))

(assert (=> b!324542 (= res!177873 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7863 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32472 res!177868) b!324540))

(assert (= (and b!324540 res!177869) b!324535))

(assert (= (and b!324535 res!177871) b!324534))

(assert (= (and b!324534 res!177872) b!324533))

(assert (= (and b!324533 res!177870) b!324537))

(assert (= (and b!324537 res!177864) b!324539))

(assert (= (and b!324539 res!177867) b!324538))

(assert (= (and b!324538 res!177866) b!324536))

(assert (= (and b!324536 res!177865) b!324542))

(assert (= (and b!324542 res!177873) b!324541))

(declare-fun m!331559 () Bool)

(assert (=> b!324537 m!331559))

(declare-fun m!331561 () Bool)

(assert (=> b!324535 m!331561))

(declare-fun m!331563 () Bool)

(assert (=> b!324542 m!331563))

(declare-fun m!331565 () Bool)

(assert (=> b!324536 m!331565))

(declare-fun m!331567 () Bool)

(assert (=> b!324533 m!331567))

(declare-fun m!331569 () Bool)

(assert (=> b!324539 m!331569))

(assert (=> b!324539 m!331569))

(declare-fun m!331571 () Bool)

(assert (=> b!324539 m!331571))

(declare-fun m!331573 () Bool)

(assert (=> b!324541 m!331573))

(declare-fun m!331575 () Bool)

(assert (=> b!324534 m!331575))

(declare-fun m!331577 () Bool)

(assert (=> start!32472 m!331577))

(declare-fun m!331579 () Bool)

(assert (=> start!32472 m!331579))

(declare-fun m!331581 () Bool)

(assert (=> b!324538 m!331581))

(check-sat (not b!324539) (not b!324534) (not b!324536) (not b!324535) (not b!324533) (not start!32472) (not b!324537) (not b!324541))
(check-sat)
