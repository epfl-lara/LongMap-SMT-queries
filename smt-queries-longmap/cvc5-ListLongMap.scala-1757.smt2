; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32130 () Bool)

(assert start!32130)

(declare-fun b!320302 () Bool)

(declare-fun res!174596 () Bool)

(declare-fun e!198756 () Bool)

(assert (=> b!320302 (=> (not res!174596) (not e!198756))))

(declare-datatypes ((array!16378 0))(
  ( (array!16379 (arr!7749 (Array (_ BitVec 32) (_ BitVec 64))) (size!8101 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16378)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320302 (= res!174596 (and (= (size!8101 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8101 a!3305))))))

(declare-fun res!174599 () Bool)

(assert (=> start!32130 (=> (not res!174599) (not e!198756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32130 (= res!174599 (validMask!0 mask!3777))))

(assert (=> start!32130 e!198756))

(assert (=> start!32130 true))

(declare-fun array_inv!5699 (array!16378) Bool)

(assert (=> start!32130 (array_inv!5699 a!3305)))

(declare-fun b!320303 () Bool)

(declare-fun res!174597 () Bool)

(assert (=> b!320303 (=> (not res!174597) (not e!198756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16378 (_ BitVec 32)) Bool)

(assert (=> b!320303 (= res!174597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320304 () Bool)

(declare-fun res!174600 () Bool)

(assert (=> b!320304 (=> (not res!174600) (not e!198756))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320304 (= res!174600 (validKeyInArray!0 k!2497))))

(declare-fun b!320305 () Bool)

(declare-fun res!174595 () Bool)

(assert (=> b!320305 (=> (not res!174595) (not e!198756))))

(declare-datatypes ((SeekEntryResult!2845 0))(
  ( (MissingZero!2845 (index!13556 (_ BitVec 32))) (Found!2845 (index!13557 (_ BitVec 32))) (Intermediate!2845 (undefined!3657 Bool) (index!13558 (_ BitVec 32)) (x!31927 (_ BitVec 32))) (Undefined!2845) (MissingVacant!2845 (index!13559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16378 (_ BitVec 32)) SeekEntryResult!2845)

(assert (=> b!320305 (= res!174595 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2845 i!1250)))))

(declare-fun b!320306 () Bool)

(declare-fun res!174598 () Bool)

(assert (=> b!320306 (=> (not res!174598) (not e!198756))))

(declare-fun arrayContainsKey!0 (array!16378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320306 (= res!174598 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320307 () Bool)

(assert (=> b!320307 (= e!198756 false)))

(declare-fun lt!156030 () SeekEntryResult!2845)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16378 (_ BitVec 32)) SeekEntryResult!2845)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320307 (= lt!156030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and start!32130 res!174599) b!320302))

(assert (= (and b!320302 res!174596) b!320304))

(assert (= (and b!320304 res!174600) b!320306))

(assert (= (and b!320306 res!174598) b!320305))

(assert (= (and b!320305 res!174595) b!320303))

(assert (= (and b!320303 res!174597) b!320307))

(declare-fun m!328923 () Bool)

(assert (=> b!320307 m!328923))

(assert (=> b!320307 m!328923))

(declare-fun m!328925 () Bool)

(assert (=> b!320307 m!328925))

(declare-fun m!328927 () Bool)

(assert (=> start!32130 m!328927))

(declare-fun m!328929 () Bool)

(assert (=> start!32130 m!328929))

(declare-fun m!328931 () Bool)

(assert (=> b!320306 m!328931))

(declare-fun m!328933 () Bool)

(assert (=> b!320304 m!328933))

(declare-fun m!328935 () Bool)

(assert (=> b!320303 m!328935))

(declare-fun m!328937 () Bool)

(assert (=> b!320305 m!328937))

(push 1)

(assert (not b!320305))

(assert (not b!320304))

(assert (not b!320306))

(assert (not b!320303))

(assert (not start!32130))

(assert (not b!320307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

