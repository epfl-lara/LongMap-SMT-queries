; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31368 () Bool)

(assert start!31368)

(declare-fun b!314368 () Bool)

(declare-fun res!170123 () Bool)

(declare-fun e!195829 () Bool)

(assert (=> b!314368 (=> (not res!170123) (not e!195829))))

(declare-datatypes ((array!16039 0))(
  ( (array!16040 (arr!7594 (Array (_ BitVec 32) (_ BitVec 64))) (size!7946 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16039)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314368 (= res!170123 (and (= (size!7946 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7946 a!3293))))))

(declare-fun b!314369 () Bool)

(declare-fun res!170117 () Bool)

(assert (=> b!314369 (=> (not res!170117) (not e!195829))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2734 0))(
  ( (MissingZero!2734 (index!13112 (_ BitVec 32))) (Found!2734 (index!13113 (_ BitVec 32))) (Intermediate!2734 (undefined!3546 Bool) (index!13114 (_ BitVec 32)) (x!31340 (_ BitVec 32))) (Undefined!2734) (MissingVacant!2734 (index!13115 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16039 (_ BitVec 32)) SeekEntryResult!2734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314369 (= res!170117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2734 false resIndex!52 resX!52)))))

(declare-fun b!314370 () Bool)

(declare-fun res!170118 () Bool)

(assert (=> b!314370 (=> (not res!170118) (not e!195829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314370 (= res!170118 (validKeyInArray!0 k!2441))))

(declare-fun b!314371 () Bool)

(declare-fun res!170122 () Bool)

(assert (=> b!314371 (=> (not res!170122) (not e!195829))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314371 (= res!170122 (and (= (select (arr!7594 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7946 a!3293))))))

(declare-fun res!170121 () Bool)

(assert (=> start!31368 (=> (not res!170121) (not e!195829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31368 (= res!170121 (validMask!0 mask!3709))))

(assert (=> start!31368 e!195829))

(declare-fun array_inv!5557 (array!16039) Bool)

(assert (=> start!31368 (array_inv!5557 a!3293)))

(assert (=> start!31368 true))

(declare-fun b!314372 () Bool)

(assert (=> b!314372 (= e!195829 false)))

(declare-fun lt!153897 () SeekEntryResult!2734)

(assert (=> b!314372 (= lt!153897 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314373 () Bool)

(declare-fun res!170124 () Bool)

(assert (=> b!314373 (=> (not res!170124) (not e!195829))))

(declare-fun arrayContainsKey!0 (array!16039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314373 (= res!170124 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314374 () Bool)

(declare-fun res!170119 () Bool)

(assert (=> b!314374 (=> (not res!170119) (not e!195829))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16039 (_ BitVec 32)) SeekEntryResult!2734)

(assert (=> b!314374 (= res!170119 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2734 i!1240)))))

(declare-fun b!314375 () Bool)

(declare-fun res!170120 () Bool)

(assert (=> b!314375 (=> (not res!170120) (not e!195829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16039 (_ BitVec 32)) Bool)

(assert (=> b!314375 (= res!170120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31368 res!170121) b!314368))

(assert (= (and b!314368 res!170123) b!314370))

(assert (= (and b!314370 res!170118) b!314373))

(assert (= (and b!314373 res!170124) b!314374))

(assert (= (and b!314374 res!170119) b!314375))

(assert (= (and b!314375 res!170120) b!314369))

(assert (= (and b!314369 res!170117) b!314371))

(assert (= (and b!314371 res!170122) b!314372))

(declare-fun m!323937 () Bool)

(assert (=> b!314370 m!323937))

(declare-fun m!323939 () Bool)

(assert (=> start!31368 m!323939))

(declare-fun m!323941 () Bool)

(assert (=> start!31368 m!323941))

(declare-fun m!323943 () Bool)

(assert (=> b!314375 m!323943))

(declare-fun m!323945 () Bool)

(assert (=> b!314369 m!323945))

(assert (=> b!314369 m!323945))

(declare-fun m!323947 () Bool)

(assert (=> b!314369 m!323947))

(declare-fun m!323949 () Bool)

(assert (=> b!314373 m!323949))

(declare-fun m!323951 () Bool)

(assert (=> b!314372 m!323951))

(declare-fun m!323953 () Bool)

(assert (=> b!314374 m!323953))

(declare-fun m!323955 () Bool)

(assert (=> b!314371 m!323955))

(push 1)

(assert (not b!314374))

(assert (not b!314372))

(assert (not b!314369))

(assert (not b!314375))

(assert (not b!314370))

(assert (not start!31368))

(assert (not b!314373))

(check-sat)

(pop 1)

(push 1)

