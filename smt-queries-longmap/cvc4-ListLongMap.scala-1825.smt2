; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33008 () Bool)

(assert start!33008)

(declare-fun b!328741 () Bool)

(declare-fun res!181069 () Bool)

(declare-fun e!202057 () Bool)

(assert (=> b!328741 (=> (not res!181069) (not e!202057))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328741 (= res!181069 (validKeyInArray!0 k!2497))))

(declare-fun b!328742 () Bool)

(declare-fun res!181074 () Bool)

(assert (=> b!328742 (=> (not res!181074) (not e!202057))))

(declare-datatypes ((array!16814 0))(
  ( (array!16815 (arr!7954 (Array (_ BitVec 32) (_ BitVec 64))) (size!8306 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16814)

(declare-fun arrayContainsKey!0 (array!16814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328742 (= res!181074 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328743 () Bool)

(declare-fun res!181071 () Bool)

(assert (=> b!328743 (=> (not res!181071) (not e!202057))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328743 (= res!181071 (and (= (size!8306 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8306 a!3305))))))

(declare-fun b!328745 () Bool)

(declare-fun res!181067 () Bool)

(assert (=> b!328745 (=> (not res!181067) (not e!202057))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328745 (= res!181067 (and (= (select (arr!7954 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8306 a!3305))))))

(declare-fun b!328746 () Bool)

(declare-fun res!181068 () Bool)

(assert (=> b!328746 (=> (not res!181068) (not e!202057))))

(declare-datatypes ((SeekEntryResult!3085 0))(
  ( (MissingZero!3085 (index!14516 (_ BitVec 32))) (Found!3085 (index!14517 (_ BitVec 32))) (Intermediate!3085 (undefined!3897 Bool) (index!14518 (_ BitVec 32)) (x!32780 (_ BitVec 32))) (Undefined!3085) (MissingVacant!3085 (index!14519 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16814 (_ BitVec 32)) SeekEntryResult!3085)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328746 (= res!181068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3085 false resIndex!58 resX!58)))))

(declare-fun b!328747 () Bool)

(assert (=> b!328747 (= e!202057 false)))

(declare-fun lt!158019 () SeekEntryResult!3085)

(assert (=> b!328747 (= lt!158019 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328748 () Bool)

(declare-fun res!181073 () Bool)

(assert (=> b!328748 (=> (not res!181073) (not e!202057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16814 (_ BitVec 32)) Bool)

(assert (=> b!328748 (= res!181073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328744 () Bool)

(declare-fun res!181072 () Bool)

(assert (=> b!328744 (=> (not res!181072) (not e!202057))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16814 (_ BitVec 32)) SeekEntryResult!3085)

(assert (=> b!328744 (= res!181072 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3085 i!1250)))))

(declare-fun res!181070 () Bool)

(assert (=> start!33008 (=> (not res!181070) (not e!202057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33008 (= res!181070 (validMask!0 mask!3777))))

(assert (=> start!33008 e!202057))

(declare-fun array_inv!5917 (array!16814) Bool)

(assert (=> start!33008 (array_inv!5917 a!3305)))

(assert (=> start!33008 true))

(assert (= (and start!33008 res!181070) b!328743))

(assert (= (and b!328743 res!181071) b!328741))

(assert (= (and b!328741 res!181069) b!328742))

(assert (= (and b!328742 res!181074) b!328744))

(assert (= (and b!328744 res!181072) b!328748))

(assert (= (and b!328748 res!181073) b!328746))

(assert (= (and b!328746 res!181068) b!328745))

(assert (= (and b!328745 res!181067) b!328747))

(declare-fun m!334605 () Bool)

(assert (=> start!33008 m!334605))

(declare-fun m!334607 () Bool)

(assert (=> start!33008 m!334607))

(declare-fun m!334609 () Bool)

(assert (=> b!328741 m!334609))

(declare-fun m!334611 () Bool)

(assert (=> b!328744 m!334611))

(declare-fun m!334613 () Bool)

(assert (=> b!328746 m!334613))

(assert (=> b!328746 m!334613))

(declare-fun m!334615 () Bool)

(assert (=> b!328746 m!334615))

(declare-fun m!334617 () Bool)

(assert (=> b!328747 m!334617))

(declare-fun m!334619 () Bool)

(assert (=> b!328745 m!334619))

(declare-fun m!334621 () Bool)

(assert (=> b!328742 m!334621))

(declare-fun m!334623 () Bool)

(assert (=> b!328748 m!334623))

(push 1)

(assert (not start!33008))

(assert (not b!328746))

(assert (not b!328742))

(assert (not b!328741))

(assert (not b!328747))

(assert (not b!328748))

(assert (not b!328744))

(check-sat)

(pop 1)

