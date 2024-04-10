; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51552 () Bool)

(assert start!51552)

(declare-fun b!564110 () Bool)

(declare-fun e!324985 () Bool)

(declare-fun e!324987 () Bool)

(assert (=> b!564110 (= e!324985 e!324987)))

(declare-fun res!355265 () Bool)

(assert (=> b!564110 (=> (not res!355265) (not e!324987))))

(declare-datatypes ((SeekEntryResult!5458 0))(
  ( (MissingZero!5458 (index!24059 (_ BitVec 32))) (Found!5458 (index!24060 (_ BitVec 32))) (Intermediate!5458 (undefined!6270 Bool) (index!24061 (_ BitVec 32)) (x!52937 (_ BitVec 32))) (Undefined!5458) (MissingVacant!5458 (index!24062 (_ BitVec 32))) )
))
(declare-fun lt!257442 () SeekEntryResult!5458)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564110 (= res!355265 (or (= lt!257442 (MissingZero!5458 i!1132)) (= lt!257442 (MissingVacant!5458 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35417 0))(
  ( (array!35418 (arr!17009 (Array (_ BitVec 32) (_ BitVec 64))) (size!17373 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35417)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35417 (_ BitVec 32)) SeekEntryResult!5458)

(assert (=> b!564110 (= lt!257442 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564111 () Bool)

(declare-fun res!355268 () Bool)

(assert (=> b!564111 (=> (not res!355268) (not e!324985))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564111 (= res!355268 (and (= (size!17373 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17373 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17373 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355266 () Bool)

(assert (=> start!51552 (=> (not res!355266) (not e!324985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51552 (= res!355266 (validMask!0 mask!3119))))

(assert (=> start!51552 e!324985))

(assert (=> start!51552 true))

(declare-fun array_inv!12805 (array!35417) Bool)

(assert (=> start!51552 (array_inv!12805 a!3118)))

(declare-fun b!564112 () Bool)

(assert (=> b!564112 (= e!324987 false)))

(declare-fun lt!257443 () Bool)

(declare-datatypes ((List!11089 0))(
  ( (Nil!11086) (Cons!11085 (h!12088 (_ BitVec 64)) (t!17317 List!11089)) )
))
(declare-fun arrayNoDuplicates!0 (array!35417 (_ BitVec 32) List!11089) Bool)

(assert (=> b!564112 (= lt!257443 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11086))))

(declare-fun b!564113 () Bool)

(declare-fun res!355262 () Bool)

(assert (=> b!564113 (=> (not res!355262) (not e!324985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564113 (= res!355262 (validKeyInArray!0 k!1914))))

(declare-fun b!564114 () Bool)

(declare-fun res!355263 () Bool)

(assert (=> b!564114 (=> (not res!355263) (not e!324987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35417 (_ BitVec 32)) Bool)

(assert (=> b!564114 (= res!355263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564115 () Bool)

(declare-fun res!355267 () Bool)

(assert (=> b!564115 (=> (not res!355267) (not e!324985))))

(assert (=> b!564115 (= res!355267 (validKeyInArray!0 (select (arr!17009 a!3118) j!142)))))

(declare-fun b!564116 () Bool)

(declare-fun res!355264 () Bool)

(assert (=> b!564116 (=> (not res!355264) (not e!324985))))

(declare-fun arrayContainsKey!0 (array!35417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564116 (= res!355264 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51552 res!355266) b!564111))

(assert (= (and b!564111 res!355268) b!564115))

(assert (= (and b!564115 res!355267) b!564113))

(assert (= (and b!564113 res!355262) b!564116))

(assert (= (and b!564116 res!355264) b!564110))

(assert (= (and b!564110 res!355265) b!564114))

(assert (= (and b!564114 res!355263) b!564112))

(declare-fun m!542577 () Bool)

(assert (=> b!564110 m!542577))

(declare-fun m!542579 () Bool)

(assert (=> b!564114 m!542579))

(declare-fun m!542581 () Bool)

(assert (=> b!564116 m!542581))

(declare-fun m!542583 () Bool)

(assert (=> b!564112 m!542583))

(declare-fun m!542585 () Bool)

(assert (=> b!564113 m!542585))

(declare-fun m!542587 () Bool)

(assert (=> b!564115 m!542587))

(assert (=> b!564115 m!542587))

(declare-fun m!542589 () Bool)

(assert (=> b!564115 m!542589))

(declare-fun m!542591 () Bool)

(assert (=> start!51552 m!542591))

(declare-fun m!542593 () Bool)

(assert (=> start!51552 m!542593))

(push 1)

(assert (not b!564113))

(assert (not b!564110))

