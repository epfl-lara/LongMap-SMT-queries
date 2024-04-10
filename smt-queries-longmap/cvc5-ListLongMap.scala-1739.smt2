; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31940 () Bool)

(assert start!31940)

(declare-fun b!319229 () Bool)

(declare-fun e!198291 () Bool)

(declare-datatypes ((SeekEntryResult!2834 0))(
  ( (MissingZero!2834 (index!13512 (_ BitVec 32))) (Found!2834 (index!13513 (_ BitVec 32))) (Intermediate!2834 (undefined!3646 Bool) (index!13514 (_ BitVec 32)) (x!31772 (_ BitVec 32))) (Undefined!2834) (MissingVacant!2834 (index!13515 (_ BitVec 32))) )
))
(declare-fun lt!155739 () SeekEntryResult!2834)

(declare-fun lt!155737 () SeekEntryResult!2834)

(assert (=> b!319229 (= e!198291 (= lt!155739 lt!155737))))

(declare-fun lt!155733 () SeekEntryResult!2834)

(declare-fun lt!155732 () SeekEntryResult!2834)

(assert (=> b!319229 (= lt!155733 lt!155732)))

(declare-datatypes ((Unit!9806 0))(
  ( (Unit!9807) )
))
(declare-fun lt!155735 () Unit!9806)

(declare-datatypes ((array!16260 0))(
  ( (array!16261 (arr!7694 (Array (_ BitVec 32) (_ BitVec 64))) (size!8046 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16260)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!155734 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9806)

(assert (=> b!319229 (= lt!155735 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155734 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319230 () Bool)

(declare-fun res!173622 () Bool)

(declare-fun e!198289 () Bool)

(assert (=> b!319230 (=> (not res!173622) (not e!198289))))

(assert (=> b!319230 (= res!173622 (and (= (size!8046 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8046 a!3293))))))

(declare-fun b!319231 () Bool)

(declare-fun e!198292 () Bool)

(assert (=> b!319231 (= e!198292 (not e!198291))))

(declare-fun res!173617 () Bool)

(assert (=> b!319231 (=> res!173617 e!198291)))

(declare-fun lt!155736 () SeekEntryResult!2834)

(assert (=> b!319231 (= res!173617 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155734 #b00000000000000000000000000000000) (bvsge lt!155734 (size!8046 a!3293)) (not (= lt!155732 lt!155736))))))

(assert (=> b!319231 (= lt!155739 lt!155733)))

(declare-fun lt!155738 () array!16260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16260 (_ BitVec 32)) SeekEntryResult!2834)

(assert (=> b!319231 (= lt!155733 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155734 k!2441 lt!155738 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319231 (= lt!155739 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155738 mask!3709))))

(assert (=> b!319231 (= lt!155738 (array!16261 (store (arr!7694 a!3293) i!1240 k!2441) (size!8046 a!3293)))))

(assert (=> b!319231 (= lt!155737 lt!155732)))

(assert (=> b!319231 (= lt!155732 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155734 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319231 (= lt!155734 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!319232 () Bool)

(declare-fun res!173615 () Bool)

(assert (=> b!319232 (=> (not res!173615) (not e!198289))))

(declare-fun arrayContainsKey!0 (array!16260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319232 (= res!173615 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319233 () Bool)

(declare-fun e!198288 () Bool)

(assert (=> b!319233 (= e!198288 e!198292)))

(declare-fun res!173620 () Bool)

(assert (=> b!319233 (=> (not res!173620) (not e!198292))))

(assert (=> b!319233 (= res!173620 (and (= lt!155737 lt!155736) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7694 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319233 (= lt!155737 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!319234 () Bool)

(declare-fun res!173618 () Bool)

(assert (=> b!319234 (=> (not res!173618) (not e!198289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319234 (= res!173618 (validKeyInArray!0 k!2441))))

(declare-fun res!173613 () Bool)

(assert (=> start!31940 (=> (not res!173613) (not e!198289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31940 (= res!173613 (validMask!0 mask!3709))))

(assert (=> start!31940 e!198289))

(declare-fun array_inv!5657 (array!16260) Bool)

(assert (=> start!31940 (array_inv!5657 a!3293)))

(assert (=> start!31940 true))

(declare-fun b!319235 () Bool)

(declare-fun res!173619 () Bool)

(assert (=> b!319235 (=> (not res!173619) (not e!198289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16260 (_ BitVec 32)) Bool)

(assert (=> b!319235 (= res!173619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319236 () Bool)

(assert (=> b!319236 (= e!198289 e!198288)))

(declare-fun res!173614 () Bool)

(assert (=> b!319236 (=> (not res!173614) (not e!198288))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319236 (= res!173614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155736))))

(assert (=> b!319236 (= lt!155736 (Intermediate!2834 false resIndex!52 resX!52))))

(declare-fun b!319237 () Bool)

(declare-fun res!173621 () Bool)

(assert (=> b!319237 (=> (not res!173621) (not e!198289))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16260 (_ BitVec 32)) SeekEntryResult!2834)

(assert (=> b!319237 (= res!173621 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2834 i!1240)))))

(declare-fun b!319238 () Bool)

(declare-fun res!173616 () Bool)

(assert (=> b!319238 (=> (not res!173616) (not e!198288))))

(assert (=> b!319238 (= res!173616 (and (= (select (arr!7694 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8046 a!3293))))))

(assert (= (and start!31940 res!173613) b!319230))

(assert (= (and b!319230 res!173622) b!319234))

(assert (= (and b!319234 res!173618) b!319232))

(assert (= (and b!319232 res!173615) b!319237))

(assert (= (and b!319237 res!173621) b!319235))

(assert (= (and b!319235 res!173619) b!319236))

(assert (= (and b!319236 res!173614) b!319238))

(assert (= (and b!319238 res!173616) b!319233))

(assert (= (and b!319233 res!173620) b!319231))

(assert (= (and b!319231 (not res!173617)) b!319229))

(declare-fun m!327845 () Bool)

(assert (=> b!319237 m!327845))

(declare-fun m!327847 () Bool)

(assert (=> b!319235 m!327847))

(declare-fun m!327849 () Bool)

(assert (=> b!319238 m!327849))

(declare-fun m!327851 () Bool)

(assert (=> start!31940 m!327851))

(declare-fun m!327853 () Bool)

(assert (=> start!31940 m!327853))

(declare-fun m!327855 () Bool)

(assert (=> b!319234 m!327855))

(declare-fun m!327857 () Bool)

(assert (=> b!319236 m!327857))

(assert (=> b!319236 m!327857))

(declare-fun m!327859 () Bool)

(assert (=> b!319236 m!327859))

(declare-fun m!327861 () Bool)

(assert (=> b!319232 m!327861))

(declare-fun m!327863 () Bool)

(assert (=> b!319229 m!327863))

(declare-fun m!327865 () Bool)

(assert (=> b!319231 m!327865))

(declare-fun m!327867 () Bool)

(assert (=> b!319231 m!327867))

(declare-fun m!327869 () Bool)

(assert (=> b!319231 m!327869))

(declare-fun m!327871 () Bool)

(assert (=> b!319231 m!327871))

(declare-fun m!327873 () Bool)

(assert (=> b!319231 m!327873))

(declare-fun m!327875 () Bool)

(assert (=> b!319233 m!327875))

(declare-fun m!327877 () Bool)

(assert (=> b!319233 m!327877))

(push 1)

