; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32214 () Bool)

(assert start!32214)

(declare-fun b!320672 () Bool)

(declare-fun res!174943 () Bool)

(declare-fun e!198847 () Bool)

(assert (=> b!320672 (=> (not res!174943) (not e!198847))))

(declare-datatypes ((array!16408 0))(
  ( (array!16409 (arr!7763 (Array (_ BitVec 32) (_ BitVec 64))) (size!8116 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16408)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320672 (= res!174943 (and (= (select (arr!7763 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8116 a!3305))))))

(declare-fun b!320673 () Bool)

(declare-fun res!174944 () Bool)

(assert (=> b!320673 (=> (not res!174944) (not e!198847))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16408 (_ BitVec 32)) Bool)

(assert (=> b!320673 (= res!174944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320674 () Bool)

(declare-fun res!174941 () Bool)

(assert (=> b!320674 (=> (not res!174941) (not e!198847))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2893 0))(
  ( (MissingZero!2893 (index!13748 (_ BitVec 32))) (Found!2893 (index!13749 (_ BitVec 32))) (Intermediate!2893 (undefined!3705 Bool) (index!13750 (_ BitVec 32)) (x!32027 (_ BitVec 32))) (Undefined!2893) (MissingVacant!2893 (index!13751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16408 (_ BitVec 32)) SeekEntryResult!2893)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320674 (= res!174941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2893 false resIndex!58 resX!58)))))

(declare-fun b!320675 () Bool)

(declare-fun res!174938 () Bool)

(assert (=> b!320675 (=> (not res!174938) (not e!198847))))

(declare-fun arrayContainsKey!0 (array!16408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320675 (= res!174938 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320676 () Bool)

(declare-fun res!174945 () Bool)

(assert (=> b!320676 (=> (not res!174945) (not e!198847))))

(assert (=> b!320676 (= res!174945 (and (= (size!8116 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8116 a!3305))))))

(declare-fun b!320677 () Bool)

(declare-fun res!174940 () Bool)

(assert (=> b!320677 (=> (not res!174940) (not e!198847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320677 (= res!174940 (validKeyInArray!0 k!2497))))

(declare-fun res!174939 () Bool)

(assert (=> start!32214 (=> (not res!174939) (not e!198847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32214 (= res!174939 (validMask!0 mask!3777))))

(assert (=> start!32214 e!198847))

(declare-fun array_inv!5735 (array!16408) Bool)

(assert (=> start!32214 (array_inv!5735 a!3305)))

(assert (=> start!32214 true))

(declare-fun b!320678 () Bool)

(declare-fun res!174942 () Bool)

(assert (=> b!320678 (=> (not res!174942) (not e!198847))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16408 (_ BitVec 32)) SeekEntryResult!2893)

(assert (=> b!320678 (= res!174942 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2893 i!1250)))))

(declare-fun b!320679 () Bool)

(assert (=> b!320679 (= e!198847 false)))

(declare-fun lt!155903 () SeekEntryResult!2893)

(assert (=> b!320679 (= lt!155903 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!32214 res!174939) b!320676))

(assert (= (and b!320676 res!174945) b!320677))

(assert (= (and b!320677 res!174940) b!320675))

(assert (= (and b!320675 res!174938) b!320678))

(assert (= (and b!320678 res!174942) b!320673))

(assert (= (and b!320673 res!174944) b!320674))

(assert (= (and b!320674 res!174941) b!320672))

(assert (= (and b!320672 res!174943) b!320679))

(declare-fun m!328451 () Bool)

(assert (=> b!320679 m!328451))

(declare-fun m!328453 () Bool)

(assert (=> start!32214 m!328453))

(declare-fun m!328455 () Bool)

(assert (=> start!32214 m!328455))

(declare-fun m!328457 () Bool)

(assert (=> b!320673 m!328457))

(declare-fun m!328459 () Bool)

(assert (=> b!320675 m!328459))

(declare-fun m!328461 () Bool)

(assert (=> b!320678 m!328461))

(declare-fun m!328463 () Bool)

(assert (=> b!320674 m!328463))

(assert (=> b!320674 m!328463))

(declare-fun m!328465 () Bool)

(assert (=> b!320674 m!328465))

(declare-fun m!328467 () Bool)

(assert (=> b!320672 m!328467))

(declare-fun m!328469 () Bool)

(assert (=> b!320677 m!328469))

(push 1)

(assert (not b!320675))

(assert (not b!320678))

(assert (not b!320677))

(assert (not start!32214))

(assert (not b!320679))

(assert (not b!320673))

(assert (not b!320674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

