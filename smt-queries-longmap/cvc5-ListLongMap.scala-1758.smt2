; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32146 () Bool)

(assert start!32146)

(declare-fun b!320375 () Bool)

(declare-fun res!174621 () Bool)

(declare-fun e!198796 () Bool)

(assert (=> b!320375 (=> (not res!174621) (not e!198796))))

(declare-datatypes ((array!16381 0))(
  ( (array!16382 (arr!7751 (Array (_ BitVec 32) (_ BitVec 64))) (size!8103 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16381)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2882 0))(
  ( (MissingZero!2882 (index!13704 (_ BitVec 32))) (Found!2882 (index!13705 (_ BitVec 32))) (Intermediate!2882 (undefined!3694 Bool) (index!13706 (_ BitVec 32)) (x!31975 (_ BitVec 32))) (Undefined!2882) (MissingVacant!2882 (index!13707 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16381 (_ BitVec 32)) SeekEntryResult!2882)

(assert (=> b!320375 (= res!174621 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2882 i!1250)))))

(declare-fun b!320376 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320376 (= e!198796 (and (= (select (arr!7751 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8103 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320377 () Bool)

(declare-fun res!174622 () Bool)

(assert (=> b!320377 (=> (not res!174622) (not e!198796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320377 (= res!174622 (validKeyInArray!0 k!2497))))

(declare-fun b!320379 () Bool)

(declare-fun res!174624 () Bool)

(assert (=> b!320379 (=> (not res!174624) (not e!198796))))

(declare-fun arrayContainsKey!0 (array!16381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320379 (= res!174624 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320380 () Bool)

(declare-fun res!174623 () Bool)

(assert (=> b!320380 (=> (not res!174623) (not e!198796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16381 (_ BitVec 32)) Bool)

(assert (=> b!320380 (= res!174623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320381 () Bool)

(declare-fun res!174620 () Bool)

(assert (=> b!320381 (=> (not res!174620) (not e!198796))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16381 (_ BitVec 32)) SeekEntryResult!2882)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320381 (= res!174620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2882 false resIndex!58 resX!58)))))

(declare-fun res!174618 () Bool)

(assert (=> start!32146 (=> (not res!174618) (not e!198796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32146 (= res!174618 (validMask!0 mask!3777))))

(assert (=> start!32146 e!198796))

(declare-fun array_inv!5714 (array!16381) Bool)

(assert (=> start!32146 (array_inv!5714 a!3305)))

(assert (=> start!32146 true))

(declare-fun b!320378 () Bool)

(declare-fun res!174619 () Bool)

(assert (=> b!320378 (=> (not res!174619) (not e!198796))))

(assert (=> b!320378 (= res!174619 (and (= (size!8103 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8103 a!3305))))))

(assert (= (and start!32146 res!174618) b!320378))

(assert (= (and b!320378 res!174619) b!320377))

(assert (= (and b!320377 res!174622) b!320379))

(assert (= (and b!320379 res!174624) b!320375))

(assert (= (and b!320375 res!174621) b!320380))

(assert (= (and b!320380 res!174623) b!320381))

(assert (= (and b!320381 res!174620) b!320376))

(declare-fun m!328763 () Bool)

(assert (=> b!320376 m!328763))

(declare-fun m!328765 () Bool)

(assert (=> b!320379 m!328765))

(declare-fun m!328767 () Bool)

(assert (=> b!320380 m!328767))

(declare-fun m!328769 () Bool)

(assert (=> start!32146 m!328769))

(declare-fun m!328771 () Bool)

(assert (=> start!32146 m!328771))

(declare-fun m!328773 () Bool)

(assert (=> b!320381 m!328773))

(assert (=> b!320381 m!328773))

(declare-fun m!328775 () Bool)

(assert (=> b!320381 m!328775))

(declare-fun m!328777 () Bool)

(assert (=> b!320377 m!328777))

(declare-fun m!328779 () Bool)

(assert (=> b!320375 m!328779))

(push 1)

(assert (not b!320377))

(assert (not b!320375))

(assert (not b!320380))

(assert (not b!320379))

(assert (not b!320381))

(assert (not start!32146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

