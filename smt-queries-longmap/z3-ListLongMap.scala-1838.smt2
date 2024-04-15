; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33278 () Bool)

(assert start!33278)

(declare-fun b!330771 () Bool)

(declare-fun e!202954 () Bool)

(assert (=> b!330771 (= e!202954 false)))

(declare-datatypes ((array!16890 0))(
  ( (array!16891 (arr!7986 (Array (_ BitVec 32) (_ BitVec 64))) (size!8339 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16890)

(declare-datatypes ((Unit!10293 0))(
  ( (Unit!10294) )
))
(declare-fun lt!158468 () Unit!10293)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16890 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10293)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330771 (= lt!158468 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!330772 () Bool)

(declare-fun res!182328 () Bool)

(assert (=> b!330772 (=> (not res!182328) (not e!202954))))

(assert (=> b!330772 (= res!182328 (and (= (select (arr!7986 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8339 a!3305))))))

(declare-fun res!182324 () Bool)

(declare-fun e!202955 () Bool)

(assert (=> start!33278 (=> (not res!182324) (not e!202955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33278 (= res!182324 (validMask!0 mask!3777))))

(assert (=> start!33278 e!202955))

(declare-fun array_inv!5958 (array!16890) Bool)

(assert (=> start!33278 (array_inv!5958 a!3305)))

(assert (=> start!33278 true))

(declare-fun b!330773 () Bool)

(declare-fun res!182327 () Bool)

(assert (=> b!330773 (=> (not res!182327) (not e!202955))))

(assert (=> b!330773 (= res!182327 (and (= (size!8339 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8339 a!3305))))))

(declare-fun b!330774 () Bool)

(declare-fun res!182325 () Bool)

(assert (=> b!330774 (=> (not res!182325) (not e!202954))))

(assert (=> b!330774 (= res!182325 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7986 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!330775 () Bool)

(declare-fun res!182320 () Bool)

(assert (=> b!330775 (=> (not res!182320) (not e!202955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330775 (= res!182320 (validKeyInArray!0 k0!2497))))

(declare-fun b!330776 () Bool)

(declare-fun res!182322 () Bool)

(assert (=> b!330776 (=> (not res!182322) (not e!202954))))

(declare-datatypes ((SeekEntryResult!3116 0))(
  ( (MissingZero!3116 (index!14640 (_ BitVec 32))) (Found!3116 (index!14641 (_ BitVec 32))) (Intermediate!3116 (undefined!3928 Bool) (index!14642 (_ BitVec 32)) (x!32943 (_ BitVec 32))) (Undefined!3116) (MissingVacant!3116 (index!14643 (_ BitVec 32))) )
))
(declare-fun lt!158467 () SeekEntryResult!3116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16890 (_ BitVec 32)) SeekEntryResult!3116)

(assert (=> b!330776 (= res!182322 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158467))))

(declare-fun b!330777 () Bool)

(assert (=> b!330777 (= e!202955 e!202954)))

(declare-fun res!182319 () Bool)

(assert (=> b!330777 (=> (not res!182319) (not e!202954))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330777 (= res!182319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158467))))

(assert (=> b!330777 (= lt!158467 (Intermediate!3116 false resIndex!58 resX!58))))

(declare-fun b!330778 () Bool)

(declare-fun res!182321 () Bool)

(assert (=> b!330778 (=> (not res!182321) (not e!202955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16890 (_ BitVec 32)) Bool)

(assert (=> b!330778 (= res!182321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330779 () Bool)

(declare-fun res!182323 () Bool)

(assert (=> b!330779 (=> (not res!182323) (not e!202955))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16890 (_ BitVec 32)) SeekEntryResult!3116)

(assert (=> b!330779 (= res!182323 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3116 i!1250)))))

(declare-fun b!330780 () Bool)

(declare-fun res!182326 () Bool)

(assert (=> b!330780 (=> (not res!182326) (not e!202955))))

(declare-fun arrayContainsKey!0 (array!16890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330780 (= res!182326 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33278 res!182324) b!330773))

(assert (= (and b!330773 res!182327) b!330775))

(assert (= (and b!330775 res!182320) b!330780))

(assert (= (and b!330780 res!182326) b!330779))

(assert (= (and b!330779 res!182323) b!330778))

(assert (= (and b!330778 res!182321) b!330777))

(assert (= (and b!330777 res!182319) b!330772))

(assert (= (and b!330772 res!182328) b!330776))

(assert (= (and b!330776 res!182322) b!330774))

(assert (= (and b!330774 res!182325) b!330771))

(declare-fun m!335323 () Bool)

(assert (=> b!330777 m!335323))

(assert (=> b!330777 m!335323))

(declare-fun m!335325 () Bool)

(assert (=> b!330777 m!335325))

(declare-fun m!335327 () Bool)

(assert (=> b!330779 m!335327))

(declare-fun m!335329 () Bool)

(assert (=> b!330776 m!335329))

(declare-fun m!335331 () Bool)

(assert (=> b!330774 m!335331))

(declare-fun m!335333 () Bool)

(assert (=> b!330778 m!335333))

(declare-fun m!335335 () Bool)

(assert (=> b!330772 m!335335))

(declare-fun m!335337 () Bool)

(assert (=> b!330780 m!335337))

(declare-fun m!335339 () Bool)

(assert (=> b!330775 m!335339))

(declare-fun m!335341 () Bool)

(assert (=> b!330771 m!335341))

(assert (=> b!330771 m!335341))

(declare-fun m!335343 () Bool)

(assert (=> b!330771 m!335343))

(declare-fun m!335345 () Bool)

(assert (=> start!33278 m!335345))

(declare-fun m!335347 () Bool)

(assert (=> start!33278 m!335347))

(check-sat (not b!330780) (not b!330779) (not b!330777) (not b!330775) (not b!330771) (not b!330776) (not b!330778) (not start!33278))
(check-sat)
