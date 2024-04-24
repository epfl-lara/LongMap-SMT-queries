; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50238 () Bool)

(assert start!50238)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34638 0))(
  ( (array!34639 (arr!16633 (Array (_ BitVec 32) (_ BitVec 64))) (size!16997 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34638)

(declare-fun b!549554 () Bool)

(declare-fun e!317434 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549554 (= e!317434 (not (validKeyInArray!0 (select (store (arr!16633 a!3118) i!1132 k0!1914) j!142))))))

(declare-fun res!342595 () Bool)

(declare-fun e!317436 () Bool)

(assert (=> start!50238 (=> (not res!342595) (not e!317436))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50238 (= res!342595 (validMask!0 mask!3119))))

(assert (=> start!50238 e!317436))

(assert (=> start!50238 true))

(declare-fun array_inv!12492 (array!34638) Bool)

(assert (=> start!50238 (array_inv!12492 a!3118)))

(declare-fun b!549555 () Bool)

(declare-fun res!342596 () Bool)

(assert (=> b!549555 (=> (not res!342596) (not e!317436))))

(declare-fun arrayContainsKey!0 (array!34638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549555 (= res!342596 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549556 () Bool)

(declare-fun res!342594 () Bool)

(assert (=> b!549556 (=> (not res!342594) (not e!317436))))

(assert (=> b!549556 (= res!342594 (and (= (size!16997 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16997 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16997 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549557 () Bool)

(declare-fun e!317435 () Bool)

(assert (=> b!549557 (= e!317436 e!317435)))

(declare-fun res!342599 () Bool)

(assert (=> b!549557 (=> (not res!342599) (not e!317435))))

(declare-datatypes ((SeekEntryResult!5038 0))(
  ( (MissingZero!5038 (index!22379 (_ BitVec 32))) (Found!5038 (index!22380 (_ BitVec 32))) (Intermediate!5038 (undefined!5850 Bool) (index!22381 (_ BitVec 32)) (x!51467 (_ BitVec 32))) (Undefined!5038) (MissingVacant!5038 (index!22382 (_ BitVec 32))) )
))
(declare-fun lt!250212 () SeekEntryResult!5038)

(assert (=> b!549557 (= res!342599 (or (= lt!250212 (MissingZero!5038 i!1132)) (= lt!250212 (MissingVacant!5038 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34638 (_ BitVec 32)) SeekEntryResult!5038)

(assert (=> b!549557 (= lt!250212 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549558 () Bool)

(declare-fun res!342601 () Bool)

(assert (=> b!549558 (=> (not res!342601) (not e!317435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34638 (_ BitVec 32)) Bool)

(assert (=> b!549558 (= res!342601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549559 () Bool)

(assert (=> b!549559 (= e!317435 e!317434)))

(declare-fun res!342597 () Bool)

(assert (=> b!549559 (=> (not res!342597) (not e!317434))))

(declare-fun lt!250213 () (_ BitVec 32))

(assert (=> b!549559 (= res!342597 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsge lt!250213 #b00000000000000000000000000000000) (bvslt lt!250213 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549559 (= lt!250213 (toIndex!0 (select (store (arr!16633 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549560 () Bool)

(declare-fun res!342593 () Bool)

(assert (=> b!549560 (=> (not res!342593) (not e!317436))))

(assert (=> b!549560 (= res!342593 (validKeyInArray!0 k0!1914))))

(declare-fun b!549561 () Bool)

(declare-fun res!342598 () Bool)

(assert (=> b!549561 (=> (not res!342598) (not e!317436))))

(assert (=> b!549561 (= res!342598 (validKeyInArray!0 (select (arr!16633 a!3118) j!142)))))

(declare-fun b!549562 () Bool)

(declare-fun res!342600 () Bool)

(assert (=> b!549562 (=> (not res!342600) (not e!317435))))

(declare-datatypes ((List!10620 0))(
  ( (Nil!10617) (Cons!10616 (h!11592 (_ BitVec 64)) (t!16840 List!10620)) )
))
(declare-fun arrayNoDuplicates!0 (array!34638 (_ BitVec 32) List!10620) Bool)

(assert (=> b!549562 (= res!342600 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10617))))

(assert (= (and start!50238 res!342595) b!549556))

(assert (= (and b!549556 res!342594) b!549561))

(assert (= (and b!549561 res!342598) b!549560))

(assert (= (and b!549560 res!342593) b!549555))

(assert (= (and b!549555 res!342596) b!549557))

(assert (= (and b!549557 res!342599) b!549558))

(assert (= (and b!549558 res!342601) b!549562))

(assert (= (and b!549562 res!342600) b!549559))

(assert (= (and b!549559 res!342597) b!549554))

(declare-fun m!526541 () Bool)

(assert (=> b!549557 m!526541))

(declare-fun m!526543 () Bool)

(assert (=> b!549562 m!526543))

(declare-fun m!526545 () Bool)

(assert (=> b!549561 m!526545))

(assert (=> b!549561 m!526545))

(declare-fun m!526547 () Bool)

(assert (=> b!549561 m!526547))

(declare-fun m!526549 () Bool)

(assert (=> b!549558 m!526549))

(declare-fun m!526551 () Bool)

(assert (=> start!50238 m!526551))

(declare-fun m!526553 () Bool)

(assert (=> start!50238 m!526553))

(declare-fun m!526555 () Bool)

(assert (=> b!549560 m!526555))

(declare-fun m!526557 () Bool)

(assert (=> b!549555 m!526557))

(declare-fun m!526559 () Bool)

(assert (=> b!549554 m!526559))

(declare-fun m!526561 () Bool)

(assert (=> b!549554 m!526561))

(assert (=> b!549554 m!526561))

(declare-fun m!526563 () Bool)

(assert (=> b!549554 m!526563))

(assert (=> b!549559 m!526559))

(assert (=> b!549559 m!526561))

(assert (=> b!549559 m!526561))

(declare-fun m!526565 () Bool)

(assert (=> b!549559 m!526565))

(check-sat (not b!549557) (not b!549560) (not b!549562) (not b!549561) (not start!50238) (not b!549559) (not b!549558) (not b!549554) (not b!549555))
(check-sat)
