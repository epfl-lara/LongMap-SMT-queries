; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31938 () Bool)

(assert start!31938)

(declare-fun b!319199 () Bool)

(declare-fun res!173584 () Bool)

(declare-fun e!198277 () Bool)

(assert (=> b!319199 (=> (not res!173584) (not e!198277))))

(declare-datatypes ((array!16258 0))(
  ( (array!16259 (arr!7693 (Array (_ BitVec 32) (_ BitVec 64))) (size!8045 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16258)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319199 (= res!173584 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319200 () Bool)

(declare-fun res!173583 () Bool)

(assert (=> b!319200 (=> (not res!173583) (not e!198277))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2833 0))(
  ( (MissingZero!2833 (index!13508 (_ BitVec 32))) (Found!2833 (index!13509 (_ BitVec 32))) (Intermediate!2833 (undefined!3645 Bool) (index!13510 (_ BitVec 32)) (x!31763 (_ BitVec 32))) (Undefined!2833) (MissingVacant!2833 (index!13511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16258 (_ BitVec 32)) SeekEntryResult!2833)

(assert (=> b!319200 (= res!173583 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2833 i!1240)))))

(declare-fun b!319201 () Bool)

(declare-fun res!173587 () Bool)

(assert (=> b!319201 (=> (not res!173587) (not e!198277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319201 (= res!173587 (validKeyInArray!0 k!2441))))

(declare-fun b!319202 () Bool)

(declare-fun res!173590 () Bool)

(assert (=> b!319202 (=> (not res!173590) (not e!198277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16258 (_ BitVec 32)) Bool)

(assert (=> b!319202 (= res!173590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319203 () Bool)

(declare-fun e!198276 () Bool)

(assert (=> b!319203 (= e!198277 e!198276)))

(declare-fun res!173589 () Bool)

(assert (=> b!319203 (=> (not res!173589) (not e!198276))))

(declare-fun lt!155713 () SeekEntryResult!2833)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16258 (_ BitVec 32)) SeekEntryResult!2833)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319203 (= res!173589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155713))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!319203 (= lt!155713 (Intermediate!2833 false resIndex!52 resX!52))))

(declare-fun b!319204 () Bool)

(declare-fun res!173585 () Bool)

(assert (=> b!319204 (=> (not res!173585) (not e!198276))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319204 (= res!173585 (and (= (select (arr!7693 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8045 a!3293))))))

(declare-fun b!319205 () Bool)

(declare-fun res!173586 () Bool)

(assert (=> b!319205 (=> (not res!173586) (not e!198277))))

(assert (=> b!319205 (= res!173586 (and (= (size!8045 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8045 a!3293))))))

(declare-fun b!319206 () Bool)

(declare-fun e!198275 () Bool)

(assert (=> b!319206 (= e!198275 true)))

(declare-fun lt!155709 () SeekEntryResult!2833)

(declare-fun lt!155708 () SeekEntryResult!2833)

(assert (=> b!319206 (= lt!155709 lt!155708)))

(declare-fun lt!155710 () (_ BitVec 32))

(declare-datatypes ((Unit!9804 0))(
  ( (Unit!9805) )
))
(declare-fun lt!155712 () Unit!9804)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16258 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9804)

(assert (=> b!319206 (= lt!155712 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155710 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319207 () Bool)

(declare-fun e!198273 () Bool)

(assert (=> b!319207 (= e!198276 e!198273)))

(declare-fun res!173588 () Bool)

(assert (=> b!319207 (=> (not res!173588) (not e!198273))))

(declare-fun lt!155711 () SeekEntryResult!2833)

(assert (=> b!319207 (= res!173588 (and (= lt!155711 lt!155713) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7693 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319207 (= lt!155711 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!173592 () Bool)

(assert (=> start!31938 (=> (not res!173592) (not e!198277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31938 (= res!173592 (validMask!0 mask!3709))))

(assert (=> start!31938 e!198277))

(declare-fun array_inv!5656 (array!16258) Bool)

(assert (=> start!31938 (array_inv!5656 a!3293)))

(assert (=> start!31938 true))

(declare-fun b!319208 () Bool)

(assert (=> b!319208 (= e!198273 (not e!198275))))

(declare-fun res!173591 () Bool)

(assert (=> b!319208 (=> res!173591 e!198275)))

(assert (=> b!319208 (= res!173591 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155710 #b00000000000000000000000000000000) (bvsge lt!155710 (size!8045 a!3293)) (not (= lt!155708 lt!155713))))))

(declare-fun lt!155715 () SeekEntryResult!2833)

(assert (=> b!319208 (= lt!155715 lt!155709)))

(declare-fun lt!155714 () array!16258)

(assert (=> b!319208 (= lt!155709 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155710 k!2441 lt!155714 mask!3709))))

(assert (=> b!319208 (= lt!155715 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155714 mask!3709))))

(assert (=> b!319208 (= lt!155714 (array!16259 (store (arr!7693 a!3293) i!1240 k!2441) (size!8045 a!3293)))))

(assert (=> b!319208 (= lt!155711 lt!155708)))

(assert (=> b!319208 (= lt!155708 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155710 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319208 (= lt!155710 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31938 res!173592) b!319205))

(assert (= (and b!319205 res!173586) b!319201))

(assert (= (and b!319201 res!173587) b!319199))

(assert (= (and b!319199 res!173584) b!319200))

(assert (= (and b!319200 res!173583) b!319202))

(assert (= (and b!319202 res!173590) b!319203))

(assert (= (and b!319203 res!173589) b!319204))

(assert (= (and b!319204 res!173585) b!319207))

(assert (= (and b!319207 res!173588) b!319208))

(assert (= (and b!319208 (not res!173591)) b!319206))

(declare-fun m!327811 () Bool)

(assert (=> b!319199 m!327811))

(declare-fun m!327813 () Bool)

(assert (=> b!319206 m!327813))

(declare-fun m!327815 () Bool)

(assert (=> b!319204 m!327815))

(declare-fun m!327817 () Bool)

(assert (=> b!319207 m!327817))

(declare-fun m!327819 () Bool)

(assert (=> b!319207 m!327819))

(declare-fun m!327821 () Bool)

(assert (=> b!319201 m!327821))

(declare-fun m!327823 () Bool)

(assert (=> b!319208 m!327823))

(declare-fun m!327825 () Bool)

(assert (=> b!319208 m!327825))

(declare-fun m!327827 () Bool)

(assert (=> b!319208 m!327827))

(declare-fun m!327829 () Bool)

(assert (=> b!319208 m!327829))

(declare-fun m!327831 () Bool)

(assert (=> b!319208 m!327831))

(declare-fun m!327833 () Bool)

(assert (=> start!31938 m!327833))

(declare-fun m!327835 () Bool)

(assert (=> start!31938 m!327835))

(declare-fun m!327837 () Bool)

(assert (=> b!319200 m!327837))

(declare-fun m!327839 () Bool)

(assert (=> b!319203 m!327839))

(assert (=> b!319203 m!327839))

(declare-fun m!327841 () Bool)

(assert (=> b!319203 m!327841))

(declare-fun m!327843 () Bool)

(assert (=> b!319202 m!327843))

(push 1)

(assert (not b!319206))

(assert (not b!319199))

(assert (not b!319200))

(assert (not b!319207))

(assert (not b!319201))

(assert (not start!31938))

(assert (not b!319203))

