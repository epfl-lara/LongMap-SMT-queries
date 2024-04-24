; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32196 () Bool)

(assert start!32196)

(declare-fun res!174846 () Bool)

(declare-fun e!198927 () Bool)

(assert (=> start!32196 (=> (not res!174846) (not e!198927))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32196 (= res!174846 (validMask!0 mask!3777))))

(assert (=> start!32196 e!198927))

(assert (=> start!32196 true))

(declare-datatypes ((array!16399 0))(
  ( (array!16400 (arr!7758 (Array (_ BitVec 32) (_ BitVec 64))) (size!8110 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16399)

(declare-fun array_inv!5708 (array!16399) Bool)

(assert (=> start!32196 (array_inv!5708 a!3305)))

(declare-fun b!320671 () Bool)

(declare-fun res!174845 () Bool)

(assert (=> b!320671 (=> (not res!174845) (not e!198927))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320671 (= res!174845 (and (= (size!8110 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8110 a!3305))))))

(declare-fun b!320672 () Bool)

(declare-fun res!174844 () Bool)

(assert (=> b!320672 (=> (not res!174844) (not e!198927))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320672 (= res!174844 (validKeyInArray!0 k!2497))))

(declare-fun b!320673 () Bool)

(declare-fun res!174841 () Bool)

(assert (=> b!320673 (=> (not res!174841) (not e!198927))))

(declare-fun arrayContainsKey!0 (array!16399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320673 (= res!174841 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320674 () Bool)

(declare-fun res!174843 () Bool)

(assert (=> b!320674 (=> (not res!174843) (not e!198927))))

(declare-datatypes ((SeekEntryResult!2854 0))(
  ( (MissingZero!2854 (index!13592 (_ BitVec 32))) (Found!2854 (index!13593 (_ BitVec 32))) (Intermediate!2854 (undefined!3666 Bool) (index!13594 (_ BitVec 32)) (x!31966 (_ BitVec 32))) (Undefined!2854) (MissingVacant!2854 (index!13595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16399 (_ BitVec 32)) SeekEntryResult!2854)

(assert (=> b!320674 (= res!174843 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2854 i!1250)))))

(declare-fun b!320675 () Bool)

(assert (=> b!320675 (= e!198927 false)))

(declare-fun lt!156129 () SeekEntryResult!2854)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16399 (_ BitVec 32)) SeekEntryResult!2854)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320675 (= lt!156129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320676 () Bool)

(declare-fun res!174842 () Bool)

(assert (=> b!320676 (=> (not res!174842) (not e!198927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16399 (_ BitVec 32)) Bool)

(assert (=> b!320676 (= res!174842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32196 res!174846) b!320671))

(assert (= (and b!320671 res!174845) b!320672))

(assert (= (and b!320672 res!174844) b!320673))

(assert (= (and b!320673 res!174841) b!320674))

(assert (= (and b!320674 res!174843) b!320676))

(assert (= (and b!320676 res!174842) b!320675))

(declare-fun m!329175 () Bool)

(assert (=> b!320676 m!329175))

(declare-fun m!329177 () Bool)

(assert (=> b!320675 m!329177))

(assert (=> b!320675 m!329177))

(declare-fun m!329179 () Bool)

(assert (=> b!320675 m!329179))

(declare-fun m!329181 () Bool)

(assert (=> b!320674 m!329181))

(declare-fun m!329183 () Bool)

(assert (=> b!320672 m!329183))

(declare-fun m!329185 () Bool)

(assert (=> start!32196 m!329185))

(declare-fun m!329187 () Bool)

(assert (=> start!32196 m!329187))

(declare-fun m!329189 () Bool)

(assert (=> b!320673 m!329189))

(push 1)

(assert (not b!320672))

(assert (not b!320674))

(assert (not b!320675))

(assert (not b!320676))

(assert (not b!320673))

(assert (not start!32196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

