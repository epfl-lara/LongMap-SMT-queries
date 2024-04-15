; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33006 () Bool)

(assert start!33006)

(declare-fun b!328610 () Bool)

(declare-fun res!181083 () Bool)

(declare-fun e!201917 () Bool)

(assert (=> b!328610 (=> (not res!181083) (not e!201917))))

(declare-datatypes ((array!16816 0))(
  ( (array!16817 (arr!7955 (Array (_ BitVec 32) (_ BitVec 64))) (size!8308 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16816)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328610 (= res!181083 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328611 () Bool)

(declare-fun res!181084 () Bool)

(assert (=> b!328611 (=> (not res!181084) (not e!201917))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328611 (= res!181084 (and (= (select (arr!7955 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8308 a!3305))))))

(declare-fun b!328612 () Bool)

(assert (=> b!328612 (= e!201917 false)))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3085 0))(
  ( (MissingZero!3085 (index!14516 (_ BitVec 32))) (Found!3085 (index!14517 (_ BitVec 32))) (Intermediate!3085 (undefined!3897 Bool) (index!14518 (_ BitVec 32)) (x!32791 (_ BitVec 32))) (Undefined!3085) (MissingVacant!3085 (index!14519 (_ BitVec 32))) )
))
(declare-fun lt!157802 () SeekEntryResult!3085)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16816 (_ BitVec 32)) SeekEntryResult!3085)

(assert (=> b!328612 (= lt!157802 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328613 () Bool)

(declare-fun res!181085 () Bool)

(assert (=> b!328613 (=> (not res!181085) (not e!201917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16816 (_ BitVec 32)) Bool)

(assert (=> b!328613 (= res!181085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328614 () Bool)

(declare-fun res!181086 () Bool)

(assert (=> b!328614 (=> (not res!181086) (not e!201917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328614 (= res!181086 (validKeyInArray!0 k!2497))))

(declare-fun b!328615 () Bool)

(declare-fun res!181082 () Bool)

(assert (=> b!328615 (=> (not res!181082) (not e!201917))))

(assert (=> b!328615 (= res!181082 (and (= (size!8308 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8308 a!3305))))))

(declare-fun b!328616 () Bool)

(declare-fun res!181089 () Bool)

(assert (=> b!328616 (=> (not res!181089) (not e!201917))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16816 (_ BitVec 32)) SeekEntryResult!3085)

(assert (=> b!328616 (= res!181089 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3085 i!1250)))))

(declare-fun b!328617 () Bool)

(declare-fun res!181088 () Bool)

(assert (=> b!328617 (=> (not res!181088) (not e!201917))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328617 (= res!181088 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3085 false resIndex!58 resX!58)))))

(declare-fun res!181087 () Bool)

(assert (=> start!33006 (=> (not res!181087) (not e!201917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33006 (= res!181087 (validMask!0 mask!3777))))

(assert (=> start!33006 e!201917))

(declare-fun array_inv!5927 (array!16816) Bool)

(assert (=> start!33006 (array_inv!5927 a!3305)))

(assert (=> start!33006 true))

(assert (= (and start!33006 res!181087) b!328615))

(assert (= (and b!328615 res!181082) b!328614))

(assert (= (and b!328614 res!181086) b!328610))

(assert (= (and b!328610 res!181083) b!328616))

(assert (= (and b!328616 res!181089) b!328613))

(assert (= (and b!328613 res!181085) b!328617))

(assert (= (and b!328617 res!181088) b!328611))

(assert (= (and b!328611 res!181084) b!328612))

(declare-fun m!333995 () Bool)

(assert (=> b!328610 m!333995))

(declare-fun m!333997 () Bool)

(assert (=> b!328613 m!333997))

(declare-fun m!333999 () Bool)

(assert (=> b!328617 m!333999))

(assert (=> b!328617 m!333999))

(declare-fun m!334001 () Bool)

(assert (=> b!328617 m!334001))

(declare-fun m!334003 () Bool)

(assert (=> b!328611 m!334003))

(declare-fun m!334005 () Bool)

(assert (=> b!328616 m!334005))

(declare-fun m!334007 () Bool)

(assert (=> b!328612 m!334007))

(declare-fun m!334009 () Bool)

(assert (=> b!328614 m!334009))

(declare-fun m!334011 () Bool)

(assert (=> start!33006 m!334011))

(declare-fun m!334013 () Bool)

(assert (=> start!33006 m!334013))

(push 1)

(assert (not start!33006))

(assert (not b!328617))

(assert (not b!328610))

(assert (not b!328616))

(assert (not b!328614))

(assert (not b!328612))

(assert (not b!328613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

