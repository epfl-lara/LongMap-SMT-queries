; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32052 () Bool)

(assert start!32052)

(declare-fun b!319639 () Bool)

(declare-fun res!174102 () Bool)

(declare-fun e!198433 () Bool)

(assert (=> b!319639 (=> (not res!174102) (not e!198433))))

(declare-datatypes ((array!16330 0))(
  ( (array!16331 (arr!7727 (Array (_ BitVec 32) (_ BitVec 64))) (size!8080 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16330)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2857 0))(
  ( (MissingZero!2857 (index!13604 (_ BitVec 32))) (Found!2857 (index!13605 (_ BitVec 32))) (Intermediate!2857 (undefined!3669 Bool) (index!13606 (_ BitVec 32)) (x!31886 (_ BitVec 32))) (Undefined!2857) (MissingVacant!2857 (index!13607 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16330 (_ BitVec 32)) SeekEntryResult!2857)

(assert (=> b!319639 (= res!174102 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2857 i!1250)))))

(declare-fun b!319640 () Bool)

(declare-fun res!174098 () Bool)

(assert (=> b!319640 (=> (not res!174098) (not e!198433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319640 (= res!174098 (validKeyInArray!0 k!2497))))

(declare-fun b!319641 () Bool)

(assert (=> b!319641 (= e!198433 false)))

(declare-fun lt!155660 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319641 (= lt!155660 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319643 () Bool)

(declare-fun res!174100 () Bool)

(assert (=> b!319643 (=> (not res!174100) (not e!198433))))

(declare-fun arrayContainsKey!0 (array!16330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319643 (= res!174100 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319644 () Bool)

(declare-fun res!174101 () Bool)

(assert (=> b!319644 (=> (not res!174101) (not e!198433))))

(assert (=> b!319644 (= res!174101 (and (= (size!8080 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8080 a!3305))))))

(declare-fun b!319642 () Bool)

(declare-fun res!174097 () Bool)

(assert (=> b!319642 (=> (not res!174097) (not e!198433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16330 (_ BitVec 32)) Bool)

(assert (=> b!319642 (= res!174097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174099 () Bool)

(assert (=> start!32052 (=> (not res!174099) (not e!198433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32052 (= res!174099 (validMask!0 mask!3777))))

(assert (=> start!32052 e!198433))

(assert (=> start!32052 true))

(declare-fun array_inv!5699 (array!16330) Bool)

(assert (=> start!32052 (array_inv!5699 a!3305)))

(assert (= (and start!32052 res!174099) b!319644))

(assert (= (and b!319644 res!174101) b!319640))

(assert (= (and b!319640 res!174098) b!319643))

(assert (= (and b!319643 res!174100) b!319639))

(assert (= (and b!319639 res!174102) b!319642))

(assert (= (and b!319642 res!174097) b!319641))

(declare-fun m!327665 () Bool)

(assert (=> b!319643 m!327665))

(declare-fun m!327667 () Bool)

(assert (=> b!319642 m!327667))

(declare-fun m!327669 () Bool)

(assert (=> b!319641 m!327669))

(declare-fun m!327671 () Bool)

(assert (=> start!32052 m!327671))

(declare-fun m!327673 () Bool)

(assert (=> start!32052 m!327673))

(declare-fun m!327675 () Bool)

(assert (=> b!319639 m!327675))

(declare-fun m!327677 () Bool)

(assert (=> b!319640 m!327677))

(push 1)

(assert (not b!319641))

(assert (not b!319639))

(assert (not b!319640))

(assert (not start!32052))

(assert (not b!319643))

(assert (not b!319642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

