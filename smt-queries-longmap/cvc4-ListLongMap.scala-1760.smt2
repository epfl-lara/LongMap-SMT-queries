; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32210 () Bool)

(assert start!32210)

(declare-fun b!320724 () Bool)

(declare-fun res!174845 () Bool)

(declare-fun e!198961 () Bool)

(assert (=> b!320724 (=> (not res!174845) (not e!198961))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320724 (= res!174845 (validKeyInArray!0 k!2497))))

(declare-fun res!174846 () Bool)

(assert (=> start!32210 (=> (not res!174846) (not e!198961))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32210 (= res!174846 (validMask!0 mask!3777))))

(assert (=> start!32210 e!198961))

(assert (=> start!32210 true))

(declare-datatypes ((array!16400 0))(
  ( (array!16401 (arr!7759 (Array (_ BitVec 32) (_ BitVec 64))) (size!8111 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16400)

(declare-fun array_inv!5722 (array!16400) Bool)

(assert (=> start!32210 (array_inv!5722 a!3305)))

(declare-fun b!320725 () Bool)

(assert (=> b!320725 (= e!198961 false)))

(declare-datatypes ((SeekEntryResult!2890 0))(
  ( (MissingZero!2890 (index!13736 (_ BitVec 32))) (Found!2890 (index!13737 (_ BitVec 32))) (Intermediate!2890 (undefined!3702 Bool) (index!13738 (_ BitVec 32)) (x!32005 (_ BitVec 32))) (Undefined!2890) (MissingVacant!2890 (index!13739 (_ BitVec 32))) )
))
(declare-fun lt!156111 () SeekEntryResult!2890)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16400 (_ BitVec 32)) SeekEntryResult!2890)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320725 (= lt!156111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320726 () Bool)

(declare-fun res!174849 () Bool)

(assert (=> b!320726 (=> (not res!174849) (not e!198961))))

(declare-fun arrayContainsKey!0 (array!16400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320726 (= res!174849 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320727 () Bool)

(declare-fun res!174848 () Bool)

(assert (=> b!320727 (=> (not res!174848) (not e!198961))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16400 (_ BitVec 32)) SeekEntryResult!2890)

(assert (=> b!320727 (= res!174848 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2890 i!1250)))))

(declare-fun b!320728 () Bool)

(declare-fun res!174847 () Bool)

(assert (=> b!320728 (=> (not res!174847) (not e!198961))))

(assert (=> b!320728 (= res!174847 (and (= (size!8111 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8111 a!3305))))))

(declare-fun b!320729 () Bool)

(declare-fun res!174844 () Bool)

(assert (=> b!320729 (=> (not res!174844) (not e!198961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16400 (_ BitVec 32)) Bool)

(assert (=> b!320729 (= res!174844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32210 res!174846) b!320728))

(assert (= (and b!320728 res!174847) b!320724))

(assert (= (and b!320724 res!174845) b!320726))

(assert (= (and b!320726 res!174849) b!320727))

(assert (= (and b!320727 res!174848) b!320729))

(assert (= (and b!320729 res!174844) b!320725))

(declare-fun m!328999 () Bool)

(assert (=> b!320724 m!328999))

(declare-fun m!329001 () Bool)

(assert (=> b!320729 m!329001))

(declare-fun m!329003 () Bool)

(assert (=> b!320726 m!329003))

(declare-fun m!329005 () Bool)

(assert (=> start!32210 m!329005))

(declare-fun m!329007 () Bool)

(assert (=> start!32210 m!329007))

(declare-fun m!329009 () Bool)

(assert (=> b!320725 m!329009))

(assert (=> b!320725 m!329009))

(declare-fun m!329011 () Bool)

(assert (=> b!320725 m!329011))

(declare-fun m!329013 () Bool)

(assert (=> b!320727 m!329013))

(push 1)

(assert (not b!320725))

(assert (not b!320724))

(assert (not b!320729))

(assert (not start!32210))

(assert (not b!320727))

(assert (not b!320726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

