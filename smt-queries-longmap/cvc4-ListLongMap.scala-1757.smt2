; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32144 () Bool)

(assert start!32144)

(declare-fun b!320355 () Bool)

(declare-fun res!174602 () Bool)

(declare-fun e!198790 () Bool)

(assert (=> b!320355 (=> (not res!174602) (not e!198790))))

(declare-datatypes ((array!16379 0))(
  ( (array!16380 (arr!7750 (Array (_ BitVec 32) (_ BitVec 64))) (size!8102 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16379)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2881 0))(
  ( (MissingZero!2881 (index!13700 (_ BitVec 32))) (Found!2881 (index!13701 (_ BitVec 32))) (Intermediate!2881 (undefined!3693 Bool) (index!13702 (_ BitVec 32)) (x!31966 (_ BitVec 32))) (Undefined!2881) (MissingVacant!2881 (index!13703 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16379 (_ BitVec 32)) SeekEntryResult!2881)

(assert (=> b!320355 (= res!174602 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2881 i!1250)))))

(declare-fun res!174599 () Bool)

(assert (=> start!32144 (=> (not res!174599) (not e!198790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32144 (= res!174599 (validMask!0 mask!3777))))

(assert (=> start!32144 e!198790))

(assert (=> start!32144 true))

(declare-fun array_inv!5713 (array!16379) Bool)

(assert (=> start!32144 (array_inv!5713 a!3305)))

(declare-fun b!320356 () Bool)

(declare-fun res!174601 () Bool)

(assert (=> b!320356 (=> (not res!174601) (not e!198790))))

(declare-fun arrayContainsKey!0 (array!16379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320356 (= res!174601 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320357 () Bool)

(assert (=> b!320357 (= e!198790 false)))

(declare-fun lt!156012 () SeekEntryResult!2881)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16379 (_ BitVec 32)) SeekEntryResult!2881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320357 (= lt!156012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320358 () Bool)

(declare-fun res!174600 () Bool)

(assert (=> b!320358 (=> (not res!174600) (not e!198790))))

(assert (=> b!320358 (= res!174600 (and (= (size!8102 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8102 a!3305))))))

(declare-fun b!320359 () Bool)

(declare-fun res!174598 () Bool)

(assert (=> b!320359 (=> (not res!174598) (not e!198790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320359 (= res!174598 (validKeyInArray!0 k!2497))))

(declare-fun b!320360 () Bool)

(declare-fun res!174603 () Bool)

(assert (=> b!320360 (=> (not res!174603) (not e!198790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16379 (_ BitVec 32)) Bool)

(assert (=> b!320360 (= res!174603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32144 res!174599) b!320358))

(assert (= (and b!320358 res!174600) b!320359))

(assert (= (and b!320359 res!174598) b!320356))

(assert (= (and b!320356 res!174601) b!320355))

(assert (= (and b!320355 res!174602) b!320360))

(assert (= (and b!320360 res!174603) b!320357))

(declare-fun m!328747 () Bool)

(assert (=> b!320356 m!328747))

(declare-fun m!328749 () Bool)

(assert (=> b!320359 m!328749))

(declare-fun m!328751 () Bool)

(assert (=> b!320360 m!328751))

(declare-fun m!328753 () Bool)

(assert (=> b!320357 m!328753))

(assert (=> b!320357 m!328753))

(declare-fun m!328755 () Bool)

(assert (=> b!320357 m!328755))

(declare-fun m!328757 () Bool)

(assert (=> start!32144 m!328757))

(declare-fun m!328759 () Bool)

(assert (=> start!32144 m!328759))

(declare-fun m!328761 () Bool)

(assert (=> b!320355 m!328761))

(push 1)

(assert (not b!320355))

(assert (not b!320357))

(assert (not b!320356))

(assert (not start!32144))

(assert (not b!320360))

(assert (not b!320359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

