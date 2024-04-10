; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31922 () Bool)

(assert start!31922)

(declare-fun b!318959 () Bool)

(declare-fun res!173346 () Bool)

(declare-fun e!198156 () Bool)

(assert (=> b!318959 (=> (not res!173346) (not e!198156))))

(declare-datatypes ((array!16242 0))(
  ( (array!16243 (arr!7685 (Array (_ BitVec 32) (_ BitVec 64))) (size!8037 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16242)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16242 (_ BitVec 32)) Bool)

(assert (=> b!318959 (= res!173346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318960 () Bool)

(declare-fun res!173352 () Bool)

(assert (=> b!318960 (=> (not res!173352) (not e!198156))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2825 0))(
  ( (MissingZero!2825 (index!13476 (_ BitVec 32))) (Found!2825 (index!13477 (_ BitVec 32))) (Intermediate!2825 (undefined!3637 Bool) (index!13478 (_ BitVec 32)) (x!31739 (_ BitVec 32))) (Undefined!2825) (MissingVacant!2825 (index!13479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16242 (_ BitVec 32)) SeekEntryResult!2825)

(assert (=> b!318960 (= res!173352 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2825 i!1240)))))

(declare-fun b!318961 () Bool)

(declare-fun res!173343 () Bool)

(assert (=> b!318961 (=> (not res!173343) (not e!198156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318961 (= res!173343 (validKeyInArray!0 k!2441))))

(declare-fun b!318962 () Bool)

(declare-fun res!173350 () Bool)

(assert (=> b!318962 (=> (not res!173350) (not e!198156))))

(assert (=> b!318962 (= res!173350 (and (= (size!8037 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8037 a!3293))))))

(declare-fun b!318963 () Bool)

(declare-fun e!198155 () Bool)

(assert (=> b!318963 (= e!198156 e!198155)))

(declare-fun res!173344 () Bool)

(assert (=> b!318963 (=> (not res!173344) (not e!198155))))

(declare-fun lt!155565 () SeekEntryResult!2825)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16242 (_ BitVec 32)) SeekEntryResult!2825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318963 (= res!173344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155565))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318963 (= lt!155565 (Intermediate!2825 false resIndex!52 resX!52))))

(declare-fun b!318964 () Bool)

(declare-fun res!173351 () Bool)

(assert (=> b!318964 (=> (not res!173351) (not e!198156))))

(declare-fun arrayContainsKey!0 (array!16242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318964 (= res!173351 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318965 () Bool)

(declare-fun e!198154 () Bool)

(assert (=> b!318965 (= e!198155 e!198154)))

(declare-fun res!173348 () Bool)

(assert (=> b!318965 (=> (not res!173348) (not e!198154))))

(declare-fun lt!155564 () SeekEntryResult!2825)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318965 (= res!173348 (and (= lt!155564 lt!155565) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7685 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318965 (= lt!155564 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318966 () Bool)

(declare-fun res!173347 () Bool)

(assert (=> b!318966 (=> (not res!173347) (not e!198155))))

(assert (=> b!318966 (= res!173347 (and (= (select (arr!7685 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8037 a!3293))))))

(declare-fun lt!155567 () (_ BitVec 32))

(declare-fun e!198157 () Bool)

(declare-fun lt!155566 () array!16242)

(declare-fun b!318967 () Bool)

(assert (=> b!318967 (= e!198157 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155566 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155567 k!2441 lt!155566 mask!3709)))))

(assert (=> b!318967 (= lt!155566 (array!16243 (store (arr!7685 a!3293) i!1240 k!2441) (size!8037 a!3293)))))

(declare-fun res!173349 () Bool)

(assert (=> start!31922 (=> (not res!173349) (not e!198156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31922 (= res!173349 (validMask!0 mask!3709))))

(assert (=> start!31922 e!198156))

(declare-fun array_inv!5648 (array!16242) Bool)

(assert (=> start!31922 (array_inv!5648 a!3293)))

(assert (=> start!31922 true))

(declare-fun b!318968 () Bool)

(declare-fun lt!155568 () SeekEntryResult!2825)

(assert (=> b!318968 (= e!198154 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155567 #b00000000000000000000000000000000) (bvsge lt!155567 (size!8037 a!3293)) (= lt!155568 lt!155565))))))

(assert (=> b!318968 e!198157))

(declare-fun res!173345 () Bool)

(assert (=> b!318968 (=> (not res!173345) (not e!198157))))

(assert (=> b!318968 (= res!173345 (= lt!155564 lt!155568))))

(assert (=> b!318968 (= lt!155568 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155567 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318968 (= lt!155567 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31922 res!173349) b!318962))

(assert (= (and b!318962 res!173350) b!318961))

(assert (= (and b!318961 res!173343) b!318964))

(assert (= (and b!318964 res!173351) b!318960))

(assert (= (and b!318960 res!173352) b!318959))

(assert (= (and b!318959 res!173346) b!318963))

(assert (= (and b!318963 res!173344) b!318966))

(assert (= (and b!318966 res!173347) b!318965))

(assert (= (and b!318965 res!173348) b!318968))

(assert (= (and b!318968 res!173345) b!318967))

(declare-fun m!327551 () Bool)

(assert (=> b!318964 m!327551))

(declare-fun m!327553 () Bool)

(assert (=> start!31922 m!327553))

(declare-fun m!327555 () Bool)

(assert (=> start!31922 m!327555))

(declare-fun m!327557 () Bool)

(assert (=> b!318960 m!327557))

(declare-fun m!327559 () Bool)

(assert (=> b!318966 m!327559))

(declare-fun m!327561 () Bool)

(assert (=> b!318959 m!327561))

(declare-fun m!327563 () Bool)

(assert (=> b!318963 m!327563))

(assert (=> b!318963 m!327563))

(declare-fun m!327565 () Bool)

(assert (=> b!318963 m!327565))

(declare-fun m!327567 () Bool)

(assert (=> b!318965 m!327567))

(declare-fun m!327569 () Bool)

(assert (=> b!318965 m!327569))

(declare-fun m!327571 () Bool)

(assert (=> b!318967 m!327571))

(declare-fun m!327573 () Bool)

(assert (=> b!318967 m!327573))

(declare-fun m!327575 () Bool)

(assert (=> b!318967 m!327575))

(declare-fun m!327577 () Bool)

(assert (=> b!318968 m!327577))

(declare-fun m!327579 () Bool)

(assert (=> b!318968 m!327579))

(declare-fun m!327581 () Bool)

(assert (=> b!318961 m!327581))

(push 1)

