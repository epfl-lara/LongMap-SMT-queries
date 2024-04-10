; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32134 () Bool)

(assert start!32134)

(declare-datatypes ((array!16369 0))(
  ( (array!16370 (arr!7745 (Array (_ BitVec 32) (_ BitVec 64))) (size!8097 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16369)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!320258 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun e!198759 () Bool)

(assert (=> b!320258 (= e!198759 (and (= (select (arr!7745 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8097 a!3305)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320259 () Bool)

(declare-fun res!174503 () Bool)

(assert (=> b!320259 (=> (not res!174503) (not e!198759))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320259 (= res!174503 (validKeyInArray!0 k!2497))))

(declare-fun b!320260 () Bool)

(declare-fun res!174502 () Bool)

(assert (=> b!320260 (=> (not res!174502) (not e!198759))))

(declare-datatypes ((SeekEntryResult!2876 0))(
  ( (MissingZero!2876 (index!13680 (_ BitVec 32))) (Found!2876 (index!13681 (_ BitVec 32))) (Intermediate!2876 (undefined!3688 Bool) (index!13682 (_ BitVec 32)) (x!31953 (_ BitVec 32))) (Undefined!2876) (MissingVacant!2876 (index!13683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16369 (_ BitVec 32)) SeekEntryResult!2876)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320260 (= res!174502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2876 false resIndex!58 resX!58)))))

(declare-fun b!320261 () Bool)

(declare-fun res!174505 () Bool)

(assert (=> b!320261 (=> (not res!174505) (not e!198759))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16369 (_ BitVec 32)) SeekEntryResult!2876)

(assert (=> b!320261 (= res!174505 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2876 i!1250)))))

(declare-fun b!320262 () Bool)

(declare-fun res!174504 () Bool)

(assert (=> b!320262 (=> (not res!174504) (not e!198759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16369 (_ BitVec 32)) Bool)

(assert (=> b!320262 (= res!174504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320263 () Bool)

(declare-fun res!174506 () Bool)

(assert (=> b!320263 (=> (not res!174506) (not e!198759))))

(assert (=> b!320263 (= res!174506 (and (= (size!8097 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8097 a!3305))))))

(declare-fun b!320264 () Bool)

(declare-fun res!174501 () Bool)

(assert (=> b!320264 (=> (not res!174501) (not e!198759))))

(declare-fun arrayContainsKey!0 (array!16369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320264 (= res!174501 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174507 () Bool)

(assert (=> start!32134 (=> (not res!174507) (not e!198759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32134 (= res!174507 (validMask!0 mask!3777))))

(assert (=> start!32134 e!198759))

(declare-fun array_inv!5708 (array!16369) Bool)

(assert (=> start!32134 (array_inv!5708 a!3305)))

(assert (=> start!32134 true))

(assert (= (and start!32134 res!174507) b!320263))

(assert (= (and b!320263 res!174506) b!320259))

(assert (= (and b!320259 res!174503) b!320264))

(assert (= (and b!320264 res!174501) b!320261))

(assert (= (and b!320261 res!174505) b!320262))

(assert (= (and b!320262 res!174504) b!320260))

(assert (= (and b!320260 res!174502) b!320258))

(declare-fun m!328661 () Bool)

(assert (=> b!320259 m!328661))

(declare-fun m!328663 () Bool)

(assert (=> b!320262 m!328663))

(declare-fun m!328665 () Bool)

(assert (=> b!320264 m!328665))

(declare-fun m!328667 () Bool)

(assert (=> b!320261 m!328667))

(declare-fun m!328669 () Bool)

(assert (=> b!320258 m!328669))

(declare-fun m!328671 () Bool)

(assert (=> start!32134 m!328671))

(declare-fun m!328673 () Bool)

(assert (=> start!32134 m!328673))

(declare-fun m!328675 () Bool)

(assert (=> b!320260 m!328675))

(assert (=> b!320260 m!328675))

(declare-fun m!328677 () Bool)

(assert (=> b!320260 m!328677))

(push 1)

(assert (not b!320260))

(assert (not start!32134))

(assert (not b!320261))

(assert (not b!320262))

(assert (not b!320259))

(assert (not b!320264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

