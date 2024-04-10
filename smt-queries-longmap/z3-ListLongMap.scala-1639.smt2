; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30616 () Bool)

(assert start!30616)

(declare-fun b!307171 () Bool)

(declare-fun res!163925 () Bool)

(declare-fun e!192426 () Bool)

(assert (=> b!307171 (=> (not res!163925) (not e!192426))))

(declare-datatypes ((array!15620 0))(
  ( (array!15621 (arr!7395 (Array (_ BitVec 32) (_ BitVec 64))) (size!7747 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15620)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307171 (= res!163925 (and (= (select (arr!7395 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7747 a!3293))))))

(declare-fun res!163927 () Bool)

(assert (=> start!30616 (=> (not res!163927) (not e!192426))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30616 (= res!163927 (validMask!0 mask!3709))))

(assert (=> start!30616 e!192426))

(declare-fun array_inv!5358 (array!15620) Bool)

(assert (=> start!30616 (array_inv!5358 a!3293)))

(assert (=> start!30616 true))

(declare-fun b!307172 () Bool)

(declare-fun res!163931 () Bool)

(assert (=> b!307172 (=> (not res!163931) (not e!192426))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307172 (= res!163931 (validKeyInArray!0 k0!2441))))

(declare-fun b!307173 () Bool)

(assert (=> b!307173 (= e!192426 false)))

(declare-datatypes ((SeekEntryResult!2535 0))(
  ( (MissingZero!2535 (index!12316 (_ BitVec 32))) (Found!2535 (index!12317 (_ BitVec 32))) (Intermediate!2535 (undefined!3347 Bool) (index!12318 (_ BitVec 32)) (x!30562 (_ BitVec 32))) (Undefined!2535) (MissingVacant!2535 (index!12319 (_ BitVec 32))) )
))
(declare-fun lt!151101 () SeekEntryResult!2535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15620 (_ BitVec 32)) SeekEntryResult!2535)

(assert (=> b!307173 (= lt!151101 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!307174 () Bool)

(declare-fun res!163932 () Bool)

(assert (=> b!307174 (=> (not res!163932) (not e!192426))))

(assert (=> b!307174 (= res!163932 (and (= (size!7747 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7747 a!3293))))))

(declare-fun b!307175 () Bool)

(declare-fun res!163928 () Bool)

(assert (=> b!307175 (=> (not res!163928) (not e!192426))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307175 (= res!163928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2535 false resIndex!52 resX!52)))))

(declare-fun b!307176 () Bool)

(declare-fun res!163930 () Bool)

(assert (=> b!307176 (=> (not res!163930) (not e!192426))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15620 (_ BitVec 32)) SeekEntryResult!2535)

(assert (=> b!307176 (= res!163930 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2535 i!1240)))))

(declare-fun b!307177 () Bool)

(declare-fun res!163929 () Bool)

(assert (=> b!307177 (=> (not res!163929) (not e!192426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15620 (_ BitVec 32)) Bool)

(assert (=> b!307177 (= res!163929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307178 () Bool)

(declare-fun res!163926 () Bool)

(assert (=> b!307178 (=> (not res!163926) (not e!192426))))

(declare-fun arrayContainsKey!0 (array!15620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307178 (= res!163926 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30616 res!163927) b!307174))

(assert (= (and b!307174 res!163932) b!307172))

(assert (= (and b!307172 res!163931) b!307178))

(assert (= (and b!307178 res!163926) b!307176))

(assert (= (and b!307176 res!163930) b!307177))

(assert (= (and b!307177 res!163929) b!307175))

(assert (= (and b!307175 res!163928) b!307171))

(assert (= (and b!307171 res!163925) b!307173))

(declare-fun m!317527 () Bool)

(assert (=> b!307178 m!317527))

(declare-fun m!317529 () Bool)

(assert (=> b!307173 m!317529))

(declare-fun m!317531 () Bool)

(assert (=> start!30616 m!317531))

(declare-fun m!317533 () Bool)

(assert (=> start!30616 m!317533))

(declare-fun m!317535 () Bool)

(assert (=> b!307172 m!317535))

(declare-fun m!317537 () Bool)

(assert (=> b!307171 m!317537))

(declare-fun m!317539 () Bool)

(assert (=> b!307175 m!317539))

(assert (=> b!307175 m!317539))

(declare-fun m!317541 () Bool)

(assert (=> b!307175 m!317541))

(declare-fun m!317543 () Bool)

(assert (=> b!307177 m!317543))

(declare-fun m!317545 () Bool)

(assert (=> b!307176 m!317545))

(check-sat (not b!307178) (not b!307177) (not b!307176) (not start!30616) (not b!307175) (not b!307172) (not b!307173))
