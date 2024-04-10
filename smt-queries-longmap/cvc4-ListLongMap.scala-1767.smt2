; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32252 () Bool)

(assert start!32252)

(declare-fun b!321253 () Bool)

(declare-fun res!175373 () Bool)

(declare-fun e!199113 () Bool)

(assert (=> b!321253 (=> (not res!175373) (not e!199113))))

(declare-datatypes ((array!16442 0))(
  ( (array!16443 (arr!7780 (Array (_ BitVec 32) (_ BitVec 64))) (size!8132 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16442)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2911 0))(
  ( (MissingZero!2911 (index!13820 (_ BitVec 32))) (Found!2911 (index!13821 (_ BitVec 32))) (Intermediate!2911 (undefined!3723 Bool) (index!13822 (_ BitVec 32)) (x!32082 (_ BitVec 32))) (Undefined!2911) (MissingVacant!2911 (index!13823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16442 (_ BitVec 32)) SeekEntryResult!2911)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321253 (= res!175373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2911 false resIndex!58 resX!58)))))

(declare-fun b!321254 () Bool)

(declare-fun res!175375 () Bool)

(assert (=> b!321254 (=> (not res!175375) (not e!199113))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321254 (= res!175375 (and (= (size!8132 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8132 a!3305))))))

(declare-fun b!321255 () Bool)

(assert (=> b!321255 (= e!199113 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!156174 () SeekEntryResult!2911)

(assert (=> b!321255 (= lt!156174 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!321256 () Bool)

(declare-fun res!175377 () Bool)

(assert (=> b!321256 (=> (not res!175377) (not e!199113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16442 (_ BitVec 32)) Bool)

(assert (=> b!321256 (= res!175377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321257 () Bool)

(declare-fun res!175374 () Bool)

(assert (=> b!321257 (=> (not res!175374) (not e!199113))))

(assert (=> b!321257 (= res!175374 (and (= (select (arr!7780 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8132 a!3305))))))

(declare-fun res!175379 () Bool)

(assert (=> start!32252 (=> (not res!175379) (not e!199113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32252 (= res!175379 (validMask!0 mask!3777))))

(assert (=> start!32252 e!199113))

(declare-fun array_inv!5743 (array!16442) Bool)

(assert (=> start!32252 (array_inv!5743 a!3305)))

(assert (=> start!32252 true))

(declare-fun b!321258 () Bool)

(declare-fun res!175376 () Bool)

(assert (=> b!321258 (=> (not res!175376) (not e!199113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321258 (= res!175376 (validKeyInArray!0 k!2497))))

(declare-fun b!321259 () Bool)

(declare-fun res!175380 () Bool)

(assert (=> b!321259 (=> (not res!175380) (not e!199113))))

(declare-fun arrayContainsKey!0 (array!16442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321259 (= res!175380 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321260 () Bool)

(declare-fun res!175378 () Bool)

(assert (=> b!321260 (=> (not res!175378) (not e!199113))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16442 (_ BitVec 32)) SeekEntryResult!2911)

(assert (=> b!321260 (= res!175378 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2911 i!1250)))))

(assert (= (and start!32252 res!175379) b!321254))

(assert (= (and b!321254 res!175375) b!321258))

(assert (= (and b!321258 res!175376) b!321259))

(assert (= (and b!321259 res!175380) b!321260))

(assert (= (and b!321260 res!175378) b!321256))

(assert (= (and b!321256 res!175377) b!321253))

(assert (= (and b!321253 res!175373) b!321257))

(assert (= (and b!321257 res!175374) b!321255))

(declare-fun m!329433 () Bool)

(assert (=> b!321260 m!329433))

(declare-fun m!329435 () Bool)

(assert (=> b!321256 m!329435))

(declare-fun m!329437 () Bool)

(assert (=> b!321257 m!329437))

(declare-fun m!329439 () Bool)

(assert (=> b!321258 m!329439))

(declare-fun m!329441 () Bool)

(assert (=> b!321253 m!329441))

(assert (=> b!321253 m!329441))

(declare-fun m!329443 () Bool)

(assert (=> b!321253 m!329443))

(declare-fun m!329445 () Bool)

(assert (=> start!32252 m!329445))

(declare-fun m!329447 () Bool)

(assert (=> start!32252 m!329447))

(declare-fun m!329449 () Bool)

(assert (=> b!321255 m!329449))

(declare-fun m!329451 () Bool)

(assert (=> b!321259 m!329451))

(push 1)

(assert (not start!32252))

(assert (not b!321256))

(assert (not b!321253))

(assert (not b!321258))

(assert (not b!321260))

(assert (not b!321259))

(assert (not b!321255))

(check-sat)

(pop 1)

(push 1)

