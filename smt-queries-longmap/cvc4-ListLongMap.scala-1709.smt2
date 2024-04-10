; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31440 () Bool)

(assert start!31440)

(declare-fun b!314880 () Bool)

(declare-fun res!170494 () Bool)

(declare-fun e!196060 () Bool)

(assert (=> b!314880 (=> (not res!170494) (not e!196060))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314880 (= res!170494 (validKeyInArray!0 k!2441))))

(declare-fun res!170491 () Bool)

(assert (=> start!31440 (=> (not res!170491) (not e!196060))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31440 (= res!170491 (validMask!0 mask!3709))))

(assert (=> start!31440 e!196060))

(declare-datatypes ((array!16066 0))(
  ( (array!16067 (arr!7606 (Array (_ BitVec 32) (_ BitVec 64))) (size!7958 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16066)

(declare-fun array_inv!5569 (array!16066) Bool)

(assert (=> start!31440 (array_inv!5569 a!3293)))

(assert (=> start!31440 true))

(declare-fun b!314881 () Bool)

(declare-fun e!196058 () Bool)

(assert (=> b!314881 (= e!196058 (not false))))

(declare-datatypes ((SeekEntryResult!2746 0))(
  ( (MissingZero!2746 (index!13160 (_ BitVec 32))) (Found!2746 (index!13161 (_ BitVec 32))) (Intermediate!2746 (undefined!3558 Bool) (index!13162 (_ BitVec 32)) (x!31390 (_ BitVec 32))) (Undefined!2746) (MissingVacant!2746 (index!13163 (_ BitVec 32))) )
))
(declare-fun lt!154046 () SeekEntryResult!2746)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314881 (= lt!154046 (Intermediate!2746 false index!1781 resX!52))))

(declare-fun b!314882 () Bool)

(declare-fun res!170492 () Bool)

(declare-fun e!196059 () Bool)

(assert (=> b!314882 (=> (not res!170492) (not e!196059))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!314882 (= res!170492 (and (= (select (arr!7606 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7958 a!3293))))))

(declare-fun b!314883 () Bool)

(declare-fun res!170489 () Bool)

(assert (=> b!314883 (=> (not res!170489) (not e!196060))))

(declare-fun arrayContainsKey!0 (array!16066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314883 (= res!170489 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314884 () Bool)

(declare-fun res!170495 () Bool)

(assert (=> b!314884 (=> (not res!170495) (not e!196060))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16066 (_ BitVec 32)) SeekEntryResult!2746)

(assert (=> b!314884 (= res!170495 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2746 i!1240)))))

(declare-fun b!314885 () Bool)

(assert (=> b!314885 (= e!196059 e!196058)))

(declare-fun res!170496 () Bool)

(assert (=> b!314885 (=> (not res!170496) (not e!196058))))

(declare-fun lt!154047 () SeekEntryResult!2746)

(assert (=> b!314885 (= res!170496 (and (= lt!154046 lt!154047) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7606 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7606 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7606 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16066 (_ BitVec 32)) SeekEntryResult!2746)

(assert (=> b!314885 (= lt!154046 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314886 () Bool)

(declare-fun res!170488 () Bool)

(assert (=> b!314886 (=> (not res!170488) (not e!196060))))

(assert (=> b!314886 (= res!170488 (and (= (size!7958 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7958 a!3293))))))

(declare-fun b!314887 () Bool)

(declare-fun res!170490 () Bool)

(assert (=> b!314887 (=> (not res!170490) (not e!196060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16066 (_ BitVec 32)) Bool)

(assert (=> b!314887 (= res!170490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314888 () Bool)

(assert (=> b!314888 (= e!196060 e!196059)))

(declare-fun res!170493 () Bool)

(assert (=> b!314888 (=> (not res!170493) (not e!196059))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314888 (= res!170493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154047))))

(assert (=> b!314888 (= lt!154047 (Intermediate!2746 false resIndex!52 resX!52))))

(assert (= (and start!31440 res!170491) b!314886))

(assert (= (and b!314886 res!170488) b!314880))

(assert (= (and b!314880 res!170494) b!314883))

(assert (= (and b!314883 res!170489) b!314884))

(assert (= (and b!314884 res!170495) b!314887))

(assert (= (and b!314887 res!170490) b!314888))

(assert (= (and b!314888 res!170493) b!314882))

(assert (= (and b!314882 res!170492) b!314885))

(assert (= (and b!314885 res!170496) b!314881))

(declare-fun m!324301 () Bool)

(assert (=> b!314884 m!324301))

(declare-fun m!324303 () Bool)

(assert (=> b!314885 m!324303))

(declare-fun m!324305 () Bool)

(assert (=> b!314885 m!324305))

(declare-fun m!324307 () Bool)

(assert (=> b!314880 m!324307))

(declare-fun m!324309 () Bool)

(assert (=> b!314887 m!324309))

(declare-fun m!324311 () Bool)

(assert (=> b!314883 m!324311))

(declare-fun m!324313 () Bool)

(assert (=> start!31440 m!324313))

(declare-fun m!324315 () Bool)

(assert (=> start!31440 m!324315))

(declare-fun m!324317 () Bool)

(assert (=> b!314882 m!324317))

(declare-fun m!324319 () Bool)

(assert (=> b!314888 m!324319))

(assert (=> b!314888 m!324319))

(declare-fun m!324321 () Bool)

(assert (=> b!314888 m!324321))

(push 1)

(assert (not b!314888))

(assert (not b!314883))

(assert (not b!314885))

(assert (not b!314887))

(assert (not b!314880))

(assert (not b!314884))

(assert (not start!31440))

(check-sat)

(pop 1)

(push 1)

