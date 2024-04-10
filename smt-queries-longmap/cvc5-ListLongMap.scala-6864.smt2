; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86438 () Bool)

(assert start!86438)

(declare-fun b!1000633 () Bool)

(declare-fun res!670115 () Bool)

(declare-fun e!563960 () Bool)

(assert (=> b!1000633 (=> (not res!670115) (not e!563960))))

(declare-datatypes ((array!63239 0))(
  ( (array!63240 (arr!30445 (Array (_ BitVec 32) (_ BitVec 64))) (size!30947 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63239)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9377 0))(
  ( (MissingZero!9377 (index!39879 (_ BitVec 32))) (Found!9377 (index!39880 (_ BitVec 32))) (Intermediate!9377 (undefined!10189 Bool) (index!39881 (_ BitVec 32)) (x!87309 (_ BitVec 32))) (Undefined!9377) (MissingVacant!9377 (index!39882 (_ BitVec 32))) )
))
(declare-fun lt!442338 () SeekEntryResult!9377)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63239 (_ BitVec 32)) SeekEntryResult!9377)

(assert (=> b!1000633 (= res!670115 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30445 a!3219) j!170) a!3219 mask!3464) lt!442338))))

(declare-fun b!1000634 () Bool)

(declare-fun res!670114 () Bool)

(assert (=> b!1000634 (=> (not res!670114) (not e!563960))))

(declare-fun lt!442340 () SeekEntryResult!9377)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000634 (= res!670114 (not (= lt!442340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30445 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30445 a!3219) i!1194 k!2224) j!170) (array!63240 (store (arr!30445 a!3219) i!1194 k!2224) (size!30947 a!3219)) mask!3464))))))

(declare-fun b!1000635 () Bool)

(declare-fun res!670118 () Bool)

(declare-fun e!563962 () Bool)

(assert (=> b!1000635 (=> (not res!670118) (not e!563962))))

(declare-datatypes ((List!21121 0))(
  ( (Nil!21118) (Cons!21117 (h!22294 (_ BitVec 64)) (t!30122 List!21121)) )
))
(declare-fun arrayNoDuplicates!0 (array!63239 (_ BitVec 32) List!21121) Bool)

(assert (=> b!1000635 (= res!670118 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21118))))

(declare-fun b!1000636 () Bool)

(declare-fun res!670119 () Bool)

(declare-fun e!563961 () Bool)

(assert (=> b!1000636 (=> (not res!670119) (not e!563961))))

(declare-fun arrayContainsKey!0 (array!63239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000636 (= res!670119 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000637 () Bool)

(assert (=> b!1000637 (= e!563960 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun res!670117 () Bool)

(assert (=> start!86438 (=> (not res!670117) (not e!563961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86438 (= res!670117 (validMask!0 mask!3464))))

(assert (=> start!86438 e!563961))

(declare-fun array_inv!23569 (array!63239) Bool)

(assert (=> start!86438 (array_inv!23569 a!3219)))

(assert (=> start!86438 true))

(declare-fun b!1000638 () Bool)

(declare-fun res!670111 () Bool)

(assert (=> b!1000638 (=> (not res!670111) (not e!563961))))

(assert (=> b!1000638 (= res!670111 (and (= (size!30947 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30947 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30947 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000639 () Bool)

(declare-fun res!670120 () Bool)

(assert (=> b!1000639 (=> (not res!670120) (not e!563962))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000639 (= res!670120 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30947 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30947 a!3219))))))

(declare-fun b!1000640 () Bool)

(declare-fun res!670112 () Bool)

(assert (=> b!1000640 (=> (not res!670112) (not e!563961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000640 (= res!670112 (validKeyInArray!0 (select (arr!30445 a!3219) j!170)))))

(declare-fun b!1000641 () Bool)

(declare-fun res!670122 () Bool)

(assert (=> b!1000641 (=> (not res!670122) (not e!563961))))

(assert (=> b!1000641 (= res!670122 (validKeyInArray!0 k!2224))))

(declare-fun b!1000642 () Bool)

(assert (=> b!1000642 (= e!563962 e!563960)))

(declare-fun res!670116 () Bool)

(assert (=> b!1000642 (=> (not res!670116) (not e!563960))))

(assert (=> b!1000642 (= res!670116 (= lt!442340 lt!442338))))

(assert (=> b!1000642 (= lt!442338 (Intermediate!9377 false resIndex!38 resX!38))))

(assert (=> b!1000642 (= lt!442340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30445 a!3219) j!170) mask!3464) (select (arr!30445 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000643 () Bool)

(assert (=> b!1000643 (= e!563961 e!563962)))

(declare-fun res!670121 () Bool)

(assert (=> b!1000643 (=> (not res!670121) (not e!563962))))

(declare-fun lt!442339 () SeekEntryResult!9377)

(assert (=> b!1000643 (= res!670121 (or (= lt!442339 (MissingVacant!9377 i!1194)) (= lt!442339 (MissingZero!9377 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63239 (_ BitVec 32)) SeekEntryResult!9377)

(assert (=> b!1000643 (= lt!442339 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000644 () Bool)

(declare-fun res!670113 () Bool)

(assert (=> b!1000644 (=> (not res!670113) (not e!563962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63239 (_ BitVec 32)) Bool)

(assert (=> b!1000644 (= res!670113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86438 res!670117) b!1000638))

(assert (= (and b!1000638 res!670111) b!1000640))

(assert (= (and b!1000640 res!670112) b!1000641))

(assert (= (and b!1000641 res!670122) b!1000636))

(assert (= (and b!1000636 res!670119) b!1000643))

(assert (= (and b!1000643 res!670121) b!1000644))

(assert (= (and b!1000644 res!670113) b!1000635))

(assert (= (and b!1000635 res!670118) b!1000639))

(assert (= (and b!1000639 res!670120) b!1000642))

(assert (= (and b!1000642 res!670116) b!1000633))

(assert (= (and b!1000633 res!670115) b!1000634))

(assert (= (and b!1000634 res!670114) b!1000637))

(declare-fun m!926783 () Bool)

(assert (=> b!1000635 m!926783))

(declare-fun m!926785 () Bool)

(assert (=> start!86438 m!926785))

(declare-fun m!926787 () Bool)

(assert (=> start!86438 m!926787))

(declare-fun m!926789 () Bool)

(assert (=> b!1000642 m!926789))

(assert (=> b!1000642 m!926789))

(declare-fun m!926791 () Bool)

(assert (=> b!1000642 m!926791))

(assert (=> b!1000642 m!926791))

(assert (=> b!1000642 m!926789))

(declare-fun m!926793 () Bool)

(assert (=> b!1000642 m!926793))

(assert (=> b!1000640 m!926789))

(assert (=> b!1000640 m!926789))

(declare-fun m!926795 () Bool)

(assert (=> b!1000640 m!926795))

(declare-fun m!926797 () Bool)

(assert (=> b!1000634 m!926797))

(declare-fun m!926799 () Bool)

(assert (=> b!1000634 m!926799))

(assert (=> b!1000634 m!926799))

(declare-fun m!926801 () Bool)

(assert (=> b!1000634 m!926801))

(assert (=> b!1000634 m!926801))

(assert (=> b!1000634 m!926799))

(declare-fun m!926803 () Bool)

(assert (=> b!1000634 m!926803))

(declare-fun m!926805 () Bool)

(assert (=> b!1000644 m!926805))

(declare-fun m!926807 () Bool)

(assert (=> b!1000636 m!926807))

(assert (=> b!1000633 m!926789))

(assert (=> b!1000633 m!926789))

(declare-fun m!926809 () Bool)

(assert (=> b!1000633 m!926809))

(declare-fun m!926811 () Bool)

(assert (=> b!1000641 m!926811))

(declare-fun m!926813 () Bool)

(assert (=> b!1000643 m!926813))

(push 1)

