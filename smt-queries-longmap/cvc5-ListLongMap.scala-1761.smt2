; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32202 () Bool)

(assert start!32202)

(declare-fun b!320519 () Bool)

(declare-fun res!174790 () Bool)

(declare-fun e!198802 () Bool)

(assert (=> b!320519 (=> (not res!174790) (not e!198802))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16396 0))(
  ( (array!16397 (arr!7757 (Array (_ BitVec 32) (_ BitVec 64))) (size!8110 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16396)

(declare-datatypes ((SeekEntryResult!2887 0))(
  ( (MissingZero!2887 (index!13724 (_ BitVec 32))) (Found!2887 (index!13725 (_ BitVec 32))) (Intermediate!2887 (undefined!3699 Bool) (index!13726 (_ BitVec 32)) (x!32005 (_ BitVec 32))) (Undefined!2887) (MissingVacant!2887 (index!13727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16396 (_ BitVec 32)) SeekEntryResult!2887)

(assert (=> b!320519 (= res!174790 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2887 i!1250)))))

(declare-fun b!320520 () Bool)

(assert (=> b!320520 (= e!198802 false)))

(declare-fun lt!155885 () SeekEntryResult!2887)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16396 (_ BitVec 32)) SeekEntryResult!2887)

(assert (=> b!320520 (= lt!155885 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320521 () Bool)

(declare-fun res!174789 () Bool)

(assert (=> b!320521 (=> (not res!174789) (not e!198802))))

(declare-fun arrayContainsKey!0 (array!16396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320521 (= res!174789 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174788 () Bool)

(assert (=> start!32202 (=> (not res!174788) (not e!198802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32202 (= res!174788 (validMask!0 mask!3777))))

(assert (=> start!32202 e!198802))

(declare-fun array_inv!5729 (array!16396) Bool)

(assert (=> start!32202 (array_inv!5729 a!3305)))

(assert (=> start!32202 true))

(declare-fun b!320522 () Bool)

(declare-fun res!174787 () Bool)

(assert (=> b!320522 (=> (not res!174787) (not e!198802))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!320522 (= res!174787 (and (= (select (arr!7757 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8110 a!3305))))))

(declare-fun b!320523 () Bool)

(declare-fun res!174785 () Bool)

(assert (=> b!320523 (=> (not res!174785) (not e!198802))))

(assert (=> b!320523 (= res!174785 (and (= (size!8110 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8110 a!3305))))))

(declare-fun b!320524 () Bool)

(declare-fun res!174792 () Bool)

(assert (=> b!320524 (=> (not res!174792) (not e!198802))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320524 (= res!174792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2887 false resIndex!58 resX!58)))))

(declare-fun b!320525 () Bool)

(declare-fun res!174791 () Bool)

(assert (=> b!320525 (=> (not res!174791) (not e!198802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16396 (_ BitVec 32)) Bool)

(assert (=> b!320525 (= res!174791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320526 () Bool)

(declare-fun res!174786 () Bool)

(assert (=> b!320526 (=> (not res!174786) (not e!198802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320526 (= res!174786 (validKeyInArray!0 k!2497))))

(assert (= (and start!32202 res!174788) b!320523))

(assert (= (and b!320523 res!174785) b!320526))

(assert (= (and b!320526 res!174786) b!320521))

(assert (= (and b!320521 res!174789) b!320519))

(assert (= (and b!320519 res!174790) b!320525))

(assert (= (and b!320525 res!174791) b!320524))

(assert (= (and b!320524 res!174792) b!320522))

(assert (= (and b!320522 res!174787) b!320520))

(declare-fun m!328325 () Bool)

(assert (=> start!32202 m!328325))

(declare-fun m!328327 () Bool)

(assert (=> start!32202 m!328327))

(declare-fun m!328329 () Bool)

(assert (=> b!320521 m!328329))

(declare-fun m!328331 () Bool)

(assert (=> b!320522 m!328331))

(declare-fun m!328333 () Bool)

(assert (=> b!320525 m!328333))

(declare-fun m!328335 () Bool)

(assert (=> b!320519 m!328335))

(declare-fun m!328337 () Bool)

(assert (=> b!320524 m!328337))

(assert (=> b!320524 m!328337))

(declare-fun m!328339 () Bool)

(assert (=> b!320524 m!328339))

(declare-fun m!328341 () Bool)

(assert (=> b!320520 m!328341))

(declare-fun m!328343 () Bool)

(assert (=> b!320526 m!328343))

(push 1)

(assert (not b!320525))

(assert (not b!320521))

(assert (not b!320524))

(assert (not start!32202))

(assert (not b!320526))

(assert (not b!320520))

(assert (not b!320519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

