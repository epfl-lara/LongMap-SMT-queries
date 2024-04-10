; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51558 () Bool)

(assert start!51558)

(declare-fun b!564173 () Bool)

(declare-fun e!325012 () Bool)

(declare-fun e!325013 () Bool)

(assert (=> b!564173 (= e!325012 e!325013)))

(declare-fun res!355327 () Bool)

(assert (=> b!564173 (=> (not res!355327) (not e!325013))))

(declare-datatypes ((SeekEntryResult!5461 0))(
  ( (MissingZero!5461 (index!24071 (_ BitVec 32))) (Found!5461 (index!24072 (_ BitVec 32))) (Intermediate!5461 (undefined!6273 Bool) (index!24073 (_ BitVec 32)) (x!52948 (_ BitVec 32))) (Undefined!5461) (MissingVacant!5461 (index!24074 (_ BitVec 32))) )
))
(declare-fun lt!257460 () SeekEntryResult!5461)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564173 (= res!355327 (or (= lt!257460 (MissingZero!5461 i!1132)) (= lt!257460 (MissingVacant!5461 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35423 0))(
  ( (array!35424 (arr!17012 (Array (_ BitVec 32) (_ BitVec 64))) (size!17376 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35423)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35423 (_ BitVec 32)) SeekEntryResult!5461)

(assert (=> b!564173 (= lt!257460 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564174 () Bool)

(declare-fun res!355325 () Bool)

(assert (=> b!564174 (=> (not res!355325) (not e!325013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35423 (_ BitVec 32)) Bool)

(assert (=> b!564174 (= res!355325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355328 () Bool)

(assert (=> start!51558 (=> (not res!355328) (not e!325012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51558 (= res!355328 (validMask!0 mask!3119))))

(assert (=> start!51558 e!325012))

(assert (=> start!51558 true))

(declare-fun array_inv!12808 (array!35423) Bool)

(assert (=> start!51558 (array_inv!12808 a!3118)))

(declare-fun b!564175 () Bool)

(declare-fun res!355330 () Bool)

(assert (=> b!564175 (=> (not res!355330) (not e!325012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564175 (= res!355330 (validKeyInArray!0 k!1914))))

(declare-fun b!564176 () Bool)

(declare-fun res!355326 () Bool)

(assert (=> b!564176 (=> (not res!355326) (not e!325012))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564176 (= res!355326 (and (= (size!17376 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17376 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17376 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564177 () Bool)

(assert (=> b!564177 (= e!325013 false)))

(declare-fun lt!257461 () Bool)

(declare-datatypes ((List!11092 0))(
  ( (Nil!11089) (Cons!11088 (h!12091 (_ BitVec 64)) (t!17320 List!11092)) )
))
(declare-fun arrayNoDuplicates!0 (array!35423 (_ BitVec 32) List!11092) Bool)

(assert (=> b!564177 (= lt!257461 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11089))))

(declare-fun b!564178 () Bool)

(declare-fun res!355329 () Bool)

(assert (=> b!564178 (=> (not res!355329) (not e!325012))))

(assert (=> b!564178 (= res!355329 (validKeyInArray!0 (select (arr!17012 a!3118) j!142)))))

(declare-fun b!564179 () Bool)

(declare-fun res!355331 () Bool)

(assert (=> b!564179 (=> (not res!355331) (not e!325012))))

(declare-fun arrayContainsKey!0 (array!35423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564179 (= res!355331 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51558 res!355328) b!564176))

(assert (= (and b!564176 res!355326) b!564178))

(assert (= (and b!564178 res!355329) b!564175))

(assert (= (and b!564175 res!355330) b!564179))

(assert (= (and b!564179 res!355331) b!564173))

(assert (= (and b!564173 res!355327) b!564174))

(assert (= (and b!564174 res!355325) b!564177))

(declare-fun m!542631 () Bool)

(assert (=> b!564179 m!542631))

(declare-fun m!542633 () Bool)

(assert (=> b!564174 m!542633))

(declare-fun m!542635 () Bool)

(assert (=> b!564173 m!542635))

(declare-fun m!542637 () Bool)

(assert (=> b!564175 m!542637))

(declare-fun m!542639 () Bool)

(assert (=> start!51558 m!542639))

(declare-fun m!542641 () Bool)

(assert (=> start!51558 m!542641))

(declare-fun m!542643 () Bool)

(assert (=> b!564178 m!542643))

(assert (=> b!564178 m!542643))

(declare-fun m!542645 () Bool)

(assert (=> b!564178 m!542645))

(declare-fun m!542647 () Bool)

(assert (=> b!564177 m!542647))

(push 1)

(assert (not b!564173))

(assert (not b!564174))

(assert (not b!564179))

(assert (not b!564178))

(assert (not start!51558))

