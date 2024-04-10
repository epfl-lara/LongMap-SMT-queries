; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51566 () Bool)

(assert start!51566)

(declare-fun b!564259 () Bool)

(declare-fun res!355418 () Bool)

(declare-fun e!325050 () Bool)

(assert (=> b!564259 (=> (not res!355418) (not e!325050))))

(declare-datatypes ((array!35431 0))(
  ( (array!35432 (arr!17016 (Array (_ BitVec 32) (_ BitVec 64))) (size!17380 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35431)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35431 (_ BitVec 32)) Bool)

(assert (=> b!564259 (= res!355418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355411 () Bool)

(declare-fun e!325048 () Bool)

(assert (=> start!51566 (=> (not res!355411) (not e!325048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51566 (= res!355411 (validMask!0 mask!3119))))

(assert (=> start!51566 e!325048))

(assert (=> start!51566 true))

(declare-fun array_inv!12812 (array!35431) Bool)

(assert (=> start!51566 (array_inv!12812 a!3118)))

(declare-fun b!564260 () Bool)

(assert (=> b!564260 (= e!325048 e!325050)))

(declare-fun res!355417 () Bool)

(assert (=> b!564260 (=> (not res!355417) (not e!325050))))

(declare-datatypes ((SeekEntryResult!5465 0))(
  ( (MissingZero!5465 (index!24087 (_ BitVec 32))) (Found!5465 (index!24088 (_ BitVec 32))) (Intermediate!5465 (undefined!6277 Bool) (index!24089 (_ BitVec 32)) (x!52968 (_ BitVec 32))) (Undefined!5465) (MissingVacant!5465 (index!24090 (_ BitVec 32))) )
))
(declare-fun lt!257484 () SeekEntryResult!5465)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564260 (= res!355417 (or (= lt!257484 (MissingZero!5465 i!1132)) (= lt!257484 (MissingVacant!5465 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35431 (_ BitVec 32)) SeekEntryResult!5465)

(assert (=> b!564260 (= lt!257484 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564261 () Bool)

(declare-fun res!355416 () Bool)

(assert (=> b!564261 (=> (not res!355416) (not e!325048))))

(declare-fun arrayContainsKey!0 (array!35431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564261 (= res!355416 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564262 () Bool)

(declare-fun res!355414 () Bool)

(assert (=> b!564262 (=> (not res!355414) (not e!325048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564262 (= res!355414 (validKeyInArray!0 k!1914))))

(declare-fun b!564263 () Bool)

(declare-fun res!355415 () Bool)

(assert (=> b!564263 (=> (not res!355415) (not e!325050))))

(declare-datatypes ((List!11096 0))(
  ( (Nil!11093) (Cons!11092 (h!12095 (_ BitVec 64)) (t!17324 List!11096)) )
))
(declare-fun arrayNoDuplicates!0 (array!35431 (_ BitVec 32) List!11096) Bool)

(assert (=> b!564263 (= res!355415 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11093))))

(declare-fun b!564264 () Bool)

(declare-fun res!355412 () Bool)

(assert (=> b!564264 (=> (not res!355412) (not e!325048))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564264 (= res!355412 (and (= (size!17380 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17380 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17380 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564265 () Bool)

(declare-fun res!355413 () Bool)

(assert (=> b!564265 (=> (not res!355413) (not e!325048))))

(assert (=> b!564265 (= res!355413 (validKeyInArray!0 (select (arr!17016 a!3118) j!142)))))

(declare-fun b!564266 () Bool)

(assert (=> b!564266 (= e!325050 false)))

(declare-fun lt!257485 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564266 (= lt!257485 (toIndex!0 (select (arr!17016 a!3118) j!142) mask!3119))))

(assert (= (and start!51566 res!355411) b!564264))

(assert (= (and b!564264 res!355412) b!564265))

(assert (= (and b!564265 res!355413) b!564262))

(assert (= (and b!564262 res!355414) b!564261))

(assert (= (and b!564261 res!355416) b!564260))

(assert (= (and b!564260 res!355417) b!564259))

(assert (= (and b!564259 res!355418) b!564263))

(assert (= (and b!564263 res!355415) b!564266))

(declare-fun m!542703 () Bool)

(assert (=> b!564265 m!542703))

(assert (=> b!564265 m!542703))

(declare-fun m!542705 () Bool)

(assert (=> b!564265 m!542705))

(declare-fun m!542707 () Bool)

(assert (=> b!564263 m!542707))

(declare-fun m!542709 () Bool)

(assert (=> start!51566 m!542709))

(declare-fun m!542711 () Bool)

(assert (=> start!51566 m!542711))

(declare-fun m!542713 () Bool)

(assert (=> b!564262 m!542713))

(declare-fun m!542715 () Bool)

(assert (=> b!564260 m!542715))

(assert (=> b!564266 m!542703))

(assert (=> b!564266 m!542703))

(declare-fun m!542717 () Bool)

(assert (=> b!564266 m!542717))

(declare-fun m!542719 () Bool)

(assert (=> b!564261 m!542719))

(declare-fun m!542721 () Bool)

(assert (=> b!564259 m!542721))

(push 1)

