; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31062 () Bool)

(assert start!31062)

(declare-fun b!312402 () Bool)

(declare-fun e!194761 () Bool)

(declare-fun e!194764 () Bool)

(assert (=> b!312402 (= e!194761 (not e!194764))))

(declare-fun res!169008 () Bool)

(assert (=> b!312402 (=> res!169008 e!194764)))

(declare-datatypes ((SeekEntryResult!2705 0))(
  ( (MissingZero!2705 (index!12996 (_ BitVec 32))) (Found!2705 (index!12997 (_ BitVec 32))) (Intermediate!2705 (undefined!3517 Bool) (index!12998 (_ BitVec 32)) (x!31217 (_ BitVec 32))) (Undefined!2705) (MissingVacant!2705 (index!12999 (_ BitVec 32))) )
))
(declare-fun lt!152990 () SeekEntryResult!2705)

(declare-datatypes ((array!15968 0))(
  ( (array!15969 (arr!7566 (Array (_ BitVec 32) (_ BitVec 64))) (size!7919 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15968)

(declare-fun lt!152985 () (_ BitVec 32))

(declare-fun lt!152986 () SeekEntryResult!2705)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!312402 (= res!169008 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152985 #b00000000000000000000000000000000) (bvsge lt!152985 (size!7919 a!3293)) (not (= lt!152986 lt!152990))))))

(declare-fun lt!152988 () SeekEntryResult!2705)

(declare-fun lt!152983 () SeekEntryResult!2705)

(assert (=> b!312402 (= lt!152988 lt!152983)))

(declare-fun lt!152987 () array!15968)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15968 (_ BitVec 32)) SeekEntryResult!2705)

(assert (=> b!312402 (= lt!152983 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152985 k0!2441 lt!152987 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312402 (= lt!152988 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152987 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312402 (= lt!152987 (array!15969 (store (arr!7566 a!3293) i!1240 k0!2441) (size!7919 a!3293)))))

(declare-fun lt!152984 () SeekEntryResult!2705)

(assert (=> b!312402 (= lt!152984 lt!152986)))

(assert (=> b!312402 (= lt!152986 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152985 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312402 (= lt!152985 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312403 () Bool)

(declare-fun res!169005 () Bool)

(declare-fun e!194763 () Bool)

(assert (=> b!312403 (=> (not res!169005) (not e!194763))))

(declare-fun arrayContainsKey!0 (array!15968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312403 (= res!169005 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312404 () Bool)

(declare-fun res!169002 () Bool)

(assert (=> b!312404 (=> (not res!169002) (not e!194763))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15968 (_ BitVec 32)) SeekEntryResult!2705)

(assert (=> b!312404 (= res!169002 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2705 i!1240)))))

(declare-fun b!312405 () Bool)

(declare-fun e!194765 () Bool)

(assert (=> b!312405 (= e!194765 e!194761)))

(declare-fun res!169004 () Bool)

(assert (=> b!312405 (=> (not res!169004) (not e!194761))))

(assert (=> b!312405 (= res!169004 (and (= lt!152984 lt!152990) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7566 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312405 (= lt!152984 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312407 () Bool)

(declare-fun res!169009 () Bool)

(assert (=> b!312407 (=> (not res!169009) (not e!194765))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312407 (= res!169009 (and (= (select (arr!7566 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7919 a!3293))))))

(declare-fun b!312408 () Bool)

(assert (=> b!312408 (= e!194763 e!194765)))

(declare-fun res!169010 () Bool)

(assert (=> b!312408 (=> (not res!169010) (not e!194765))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312408 (= res!169010 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152990))))

(assert (=> b!312408 (= lt!152990 (Intermediate!2705 false resIndex!52 resX!52))))

(declare-fun b!312409 () Bool)

(assert (=> b!312409 (= e!194764 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(assert (=> b!312409 (= lt!152983 lt!152986)))

(declare-datatypes ((Unit!9613 0))(
  ( (Unit!9614) )
))
(declare-fun lt!152989 () Unit!9613)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15968 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9613)

(assert (=> b!312409 (= lt!152989 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152985 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312410 () Bool)

(declare-fun res!169007 () Bool)

(assert (=> b!312410 (=> (not res!169007) (not e!194763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15968 (_ BitVec 32)) Bool)

(assert (=> b!312410 (= res!169007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312411 () Bool)

(declare-fun res!169011 () Bool)

(assert (=> b!312411 (=> (not res!169011) (not e!194763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312411 (= res!169011 (validKeyInArray!0 k0!2441))))

(declare-fun b!312406 () Bool)

(declare-fun res!169006 () Bool)

(assert (=> b!312406 (=> (not res!169006) (not e!194763))))

(assert (=> b!312406 (= res!169006 (and (= (size!7919 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7919 a!3293))))))

(declare-fun res!169003 () Bool)

(assert (=> start!31062 (=> (not res!169003) (not e!194763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31062 (= res!169003 (validMask!0 mask!3709))))

(assert (=> start!31062 e!194763))

(declare-fun array_inv!5538 (array!15968) Bool)

(assert (=> start!31062 (array_inv!5538 a!3293)))

(assert (=> start!31062 true))

(assert (= (and start!31062 res!169003) b!312406))

(assert (= (and b!312406 res!169006) b!312411))

(assert (= (and b!312411 res!169011) b!312403))

(assert (= (and b!312403 res!169005) b!312404))

(assert (= (and b!312404 res!169002) b!312410))

(assert (= (and b!312410 res!169007) b!312408))

(assert (= (and b!312408 res!169010) b!312407))

(assert (= (and b!312407 res!169009) b!312405))

(assert (= (and b!312405 res!169004) b!312402))

(assert (= (and b!312402 (not res!169008)) b!312409))

(declare-fun m!322063 () Bool)

(assert (=> b!312411 m!322063))

(declare-fun m!322065 () Bool)

(assert (=> b!312410 m!322065))

(declare-fun m!322067 () Bool)

(assert (=> b!312402 m!322067))

(declare-fun m!322069 () Bool)

(assert (=> b!312402 m!322069))

(declare-fun m!322071 () Bool)

(assert (=> b!312402 m!322071))

(declare-fun m!322073 () Bool)

(assert (=> b!312402 m!322073))

(declare-fun m!322075 () Bool)

(assert (=> b!312402 m!322075))

(declare-fun m!322077 () Bool)

(assert (=> b!312409 m!322077))

(declare-fun m!322079 () Bool)

(assert (=> b!312408 m!322079))

(assert (=> b!312408 m!322079))

(declare-fun m!322081 () Bool)

(assert (=> b!312408 m!322081))

(declare-fun m!322083 () Bool)

(assert (=> start!31062 m!322083))

(declare-fun m!322085 () Bool)

(assert (=> start!31062 m!322085))

(declare-fun m!322087 () Bool)

(assert (=> b!312404 m!322087))

(declare-fun m!322089 () Bool)

(assert (=> b!312403 m!322089))

(declare-fun m!322091 () Bool)

(assert (=> b!312407 m!322091))

(declare-fun m!322093 () Bool)

(assert (=> b!312405 m!322093))

(declare-fun m!322095 () Bool)

(assert (=> b!312405 m!322095))

(check-sat (not b!312408) (not b!312403) (not b!312405) (not b!312411) (not b!312402) (not b!312410) (not b!312409) (not b!312404) (not start!31062))
(check-sat)
