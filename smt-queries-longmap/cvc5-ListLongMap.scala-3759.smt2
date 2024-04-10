; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51548 () Bool)

(assert start!51548)

(declare-fun res!355223 () Bool)

(declare-fun e!324969 () Bool)

(assert (=> start!51548 (=> (not res!355223) (not e!324969))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51548 (= res!355223 (validMask!0 mask!3119))))

(assert (=> start!51548 e!324969))

(assert (=> start!51548 true))

(declare-datatypes ((array!35413 0))(
  ( (array!35414 (arr!17007 (Array (_ BitVec 32) (_ BitVec 64))) (size!17371 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35413)

(declare-fun array_inv!12803 (array!35413) Bool)

(assert (=> start!51548 (array_inv!12803 a!3118)))

(declare-fun b!564068 () Bool)

(declare-fun e!324967 () Bool)

(assert (=> b!564068 (= e!324967 false)))

(declare-fun lt!257430 () Bool)

(declare-datatypes ((List!11087 0))(
  ( (Nil!11084) (Cons!11083 (h!12086 (_ BitVec 64)) (t!17315 List!11087)) )
))
(declare-fun arrayNoDuplicates!0 (array!35413 (_ BitVec 32) List!11087) Bool)

(assert (=> b!564068 (= lt!257430 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11084))))

(declare-fun b!564069 () Bool)

(declare-fun res!355225 () Bool)

(assert (=> b!564069 (=> (not res!355225) (not e!324969))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564069 (= res!355225 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564070 () Bool)

(declare-fun res!355222 () Bool)

(assert (=> b!564070 (=> (not res!355222) (not e!324969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564070 (= res!355222 (validKeyInArray!0 k!1914))))

(declare-fun b!564071 () Bool)

(assert (=> b!564071 (= e!324969 e!324967)))

(declare-fun res!355220 () Bool)

(assert (=> b!564071 (=> (not res!355220) (not e!324967))))

(declare-datatypes ((SeekEntryResult!5456 0))(
  ( (MissingZero!5456 (index!24051 (_ BitVec 32))) (Found!5456 (index!24052 (_ BitVec 32))) (Intermediate!5456 (undefined!6268 Bool) (index!24053 (_ BitVec 32)) (x!52935 (_ BitVec 32))) (Undefined!5456) (MissingVacant!5456 (index!24054 (_ BitVec 32))) )
))
(declare-fun lt!257431 () SeekEntryResult!5456)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564071 (= res!355220 (or (= lt!257431 (MissingZero!5456 i!1132)) (= lt!257431 (MissingVacant!5456 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35413 (_ BitVec 32)) SeekEntryResult!5456)

(assert (=> b!564071 (= lt!257431 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564072 () Bool)

(declare-fun res!355221 () Bool)

(assert (=> b!564072 (=> (not res!355221) (not e!324967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35413 (_ BitVec 32)) Bool)

(assert (=> b!564072 (= res!355221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564073 () Bool)

(declare-fun res!355226 () Bool)

(assert (=> b!564073 (=> (not res!355226) (not e!324969))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564073 (= res!355226 (validKeyInArray!0 (select (arr!17007 a!3118) j!142)))))

(declare-fun b!564074 () Bool)

(declare-fun res!355224 () Bool)

(assert (=> b!564074 (=> (not res!355224) (not e!324969))))

(assert (=> b!564074 (= res!355224 (and (= (size!17371 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17371 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17371 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51548 res!355223) b!564074))

(assert (= (and b!564074 res!355224) b!564073))

(assert (= (and b!564073 res!355226) b!564070))

(assert (= (and b!564070 res!355222) b!564069))

(assert (= (and b!564069 res!355225) b!564071))

(assert (= (and b!564071 res!355220) b!564072))

(assert (= (and b!564072 res!355221) b!564068))

(declare-fun m!542541 () Bool)

(assert (=> b!564071 m!542541))

(declare-fun m!542543 () Bool)

(assert (=> b!564072 m!542543))

(declare-fun m!542545 () Bool)

(assert (=> start!51548 m!542545))

(declare-fun m!542547 () Bool)

(assert (=> start!51548 m!542547))

(declare-fun m!542549 () Bool)

(assert (=> b!564073 m!542549))

(assert (=> b!564073 m!542549))

(declare-fun m!542551 () Bool)

(assert (=> b!564073 m!542551))

(declare-fun m!542553 () Bool)

(assert (=> b!564069 m!542553))

(declare-fun m!542555 () Bool)

(assert (=> b!564068 m!542555))

(declare-fun m!542557 () Bool)

(assert (=> b!564070 m!542557))

(push 1)

