; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32136 () Bool)

(assert start!32136)

(declare-fun b!320142 () Bool)

(declare-fun res!174536 () Bool)

(declare-fun e!198631 () Bool)

(assert (=> b!320142 (=> (not res!174536) (not e!198631))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320142 (= res!174536 (validKeyInArray!0 k!2497))))

(declare-datatypes ((array!16375 0))(
  ( (array!16376 (arr!7748 (Array (_ BitVec 32) (_ BitVec 64))) (size!8101 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16375)

(declare-fun b!320143 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!320143 (= e!198631 (and (= (select (arr!7748 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8101 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320144 () Bool)

(declare-fun res!174533 () Bool)

(assert (=> b!320144 (=> (not res!174533) (not e!198631))))

(declare-fun arrayContainsKey!0 (array!16375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320144 (= res!174533 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174535 () Bool)

(assert (=> start!32136 (=> (not res!174535) (not e!198631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32136 (= res!174535 (validMask!0 mask!3777))))

(assert (=> start!32136 e!198631))

(declare-fun array_inv!5720 (array!16375) Bool)

(assert (=> start!32136 (array_inv!5720 a!3305)))

(assert (=> start!32136 true))

(declare-fun b!320145 () Bool)

(declare-fun res!174534 () Bool)

(assert (=> b!320145 (=> (not res!174534) (not e!198631))))

(declare-datatypes ((SeekEntryResult!2878 0))(
  ( (MissingZero!2878 (index!13688 (_ BitVec 32))) (Found!2878 (index!13689 (_ BitVec 32))) (Intermediate!2878 (undefined!3690 Bool) (index!13690 (_ BitVec 32)) (x!31966 (_ BitVec 32))) (Undefined!2878) (MissingVacant!2878 (index!13691 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16375 (_ BitVec 32)) SeekEntryResult!2878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320145 (= res!174534 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2878 false resIndex!58 resX!58)))))

(declare-fun b!320146 () Bool)

(declare-fun res!174532 () Bool)

(assert (=> b!320146 (=> (not res!174532) (not e!198631))))

(assert (=> b!320146 (= res!174532 (and (= (size!8101 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8101 a!3305))))))

(declare-fun b!320147 () Bool)

(declare-fun res!174537 () Bool)

(assert (=> b!320147 (=> (not res!174537) (not e!198631))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16375 (_ BitVec 32)) SeekEntryResult!2878)

(assert (=> b!320147 (= res!174537 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2878 i!1250)))))

(declare-fun b!320148 () Bool)

(declare-fun res!174531 () Bool)

(assert (=> b!320148 (=> (not res!174531) (not e!198631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16375 (_ BitVec 32)) Bool)

(assert (=> b!320148 (= res!174531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32136 res!174535) b!320146))

(assert (= (and b!320146 res!174532) b!320142))

(assert (= (and b!320142 res!174536) b!320144))

(assert (= (and b!320144 res!174533) b!320147))

(assert (= (and b!320147 res!174537) b!320148))

(assert (= (and b!320148 res!174531) b!320145))

(assert (= (and b!320145 res!174534) b!320143))

(declare-fun m!328069 () Bool)

(assert (=> b!320147 m!328069))

(declare-fun m!328071 () Bool)

(assert (=> b!320143 m!328071))

(declare-fun m!328073 () Bool)

(assert (=> b!320145 m!328073))

(assert (=> b!320145 m!328073))

(declare-fun m!328075 () Bool)

(assert (=> b!320145 m!328075))

(declare-fun m!328077 () Bool)

(assert (=> start!32136 m!328077))

(declare-fun m!328079 () Bool)

(assert (=> start!32136 m!328079))

(declare-fun m!328081 () Bool)

(assert (=> b!320148 m!328081))

(declare-fun m!328083 () Bool)

(assert (=> b!320144 m!328083))

(declare-fun m!328085 () Bool)

(assert (=> b!320142 m!328085))

(push 1)

(assert (not b!320148))

(assert (not b!320147))

(assert (not b!320144))

(assert (not start!32136))

(assert (not b!320142))

(assert (not b!320145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

