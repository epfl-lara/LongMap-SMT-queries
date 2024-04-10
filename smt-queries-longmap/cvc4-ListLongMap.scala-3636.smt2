; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50196 () Bool)

(assert start!50196)

(declare-fun b!549408 () Bool)

(declare-fun res!342557 () Bool)

(declare-fun e!317328 () Bool)

(assert (=> b!549408 (=> (not res!342557) (not e!317328))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549408 (= res!342557 (validKeyInArray!0 k!1914))))

(declare-fun b!549409 () Bool)

(declare-fun res!342555 () Bool)

(declare-fun e!317331 () Bool)

(assert (=> b!549409 (=> (not res!342555) (not e!317331))))

(declare-datatypes ((array!34649 0))(
  ( (array!34650 (arr!16640 (Array (_ BitVec 32) (_ BitVec 64))) (size!17004 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34649)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34649 (_ BitVec 32)) Bool)

(assert (=> b!549409 (= res!342555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549410 () Bool)

(declare-fun res!342553 () Bool)

(assert (=> b!549410 (=> (not res!342553) (not e!317328))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549410 (= res!342553 (and (= (size!17004 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17004 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17004 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549411 () Bool)

(assert (=> b!549411 (= e!317328 e!317331)))

(declare-fun res!342552 () Bool)

(assert (=> b!549411 (=> (not res!342552) (not e!317331))))

(declare-datatypes ((SeekEntryResult!5089 0))(
  ( (MissingZero!5089 (index!22583 (_ BitVec 32))) (Found!5089 (index!22584 (_ BitVec 32))) (Intermediate!5089 (undefined!5901 Bool) (index!22585 (_ BitVec 32)) (x!51515 (_ BitVec 32))) (Undefined!5089) (MissingVacant!5089 (index!22586 (_ BitVec 32))) )
))
(declare-fun lt!250114 () SeekEntryResult!5089)

(assert (=> b!549411 (= res!342552 (or (= lt!250114 (MissingZero!5089 i!1132)) (= lt!250114 (MissingVacant!5089 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34649 (_ BitVec 32)) SeekEntryResult!5089)

(assert (=> b!549411 (= lt!250114 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549412 () Bool)

(declare-fun e!317329 () Bool)

(assert (=> b!549412 (= e!317331 e!317329)))

(declare-fun res!342559 () Bool)

(assert (=> b!549412 (=> (not res!342559) (not e!317329))))

(declare-fun lt!250113 () (_ BitVec 32))

(assert (=> b!549412 (= res!342559 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsge lt!250113 #b00000000000000000000000000000000) (bvslt lt!250113 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549412 (= lt!250113 (toIndex!0 (select (store (arr!16640 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun res!342560 () Bool)

(assert (=> start!50196 (=> (not res!342560) (not e!317328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50196 (= res!342560 (validMask!0 mask!3119))))

(assert (=> start!50196 e!317328))

(assert (=> start!50196 true))

(declare-fun array_inv!12436 (array!34649) Bool)

(assert (=> start!50196 (array_inv!12436 a!3118)))

(declare-fun b!549413 () Bool)

(assert (=> b!549413 (= e!317329 (not (validKeyInArray!0 (select (store (arr!16640 a!3118) i!1132 k!1914) j!142))))))

(declare-fun b!549414 () Bool)

(declare-fun res!342558 () Bool)

(assert (=> b!549414 (=> (not res!342558) (not e!317328))))

(assert (=> b!549414 (= res!342558 (validKeyInArray!0 (select (arr!16640 a!3118) j!142)))))

(declare-fun b!549415 () Bool)

(declare-fun res!342556 () Bool)

(assert (=> b!549415 (=> (not res!342556) (not e!317331))))

(declare-datatypes ((List!10720 0))(
  ( (Nil!10717) (Cons!10716 (h!11689 (_ BitVec 64)) (t!16948 List!10720)) )
))
(declare-fun arrayNoDuplicates!0 (array!34649 (_ BitVec 32) List!10720) Bool)

(assert (=> b!549415 (= res!342556 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10717))))

(declare-fun b!549416 () Bool)

(declare-fun res!342554 () Bool)

(assert (=> b!549416 (=> (not res!342554) (not e!317328))))

(declare-fun arrayContainsKey!0 (array!34649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549416 (= res!342554 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50196 res!342560) b!549410))

(assert (= (and b!549410 res!342553) b!549414))

(assert (= (and b!549414 res!342558) b!549408))

(assert (= (and b!549408 res!342557) b!549416))

(assert (= (and b!549416 res!342554) b!549411))

(assert (= (and b!549411 res!342552) b!549409))

(assert (= (and b!549409 res!342555) b!549415))

(assert (= (and b!549415 res!342556) b!549412))

(assert (= (and b!549412 res!342559) b!549413))

(declare-fun m!526255 () Bool)

(assert (=> b!549414 m!526255))

(assert (=> b!549414 m!526255))

(declare-fun m!526257 () Bool)

(assert (=> b!549414 m!526257))

(declare-fun m!526259 () Bool)

(assert (=> b!549416 m!526259))

(declare-fun m!526261 () Bool)

(assert (=> b!549409 m!526261))

(declare-fun m!526263 () Bool)

(assert (=> b!549411 m!526263))

(declare-fun m!526265 () Bool)

(assert (=> b!549412 m!526265))

(declare-fun m!526267 () Bool)

(assert (=> b!549412 m!526267))

(assert (=> b!549412 m!526267))

(declare-fun m!526269 () Bool)

(assert (=> b!549412 m!526269))

(assert (=> b!549413 m!526265))

(assert (=> b!549413 m!526267))

(assert (=> b!549413 m!526267))

(declare-fun m!526271 () Bool)

(assert (=> b!549413 m!526271))

(declare-fun m!526273 () Bool)

(assert (=> b!549415 m!526273))

(declare-fun m!526275 () Bool)

(assert (=> start!50196 m!526275))

(declare-fun m!526277 () Bool)

(assert (=> start!50196 m!526277))

(declare-fun m!526279 () Bool)

(assert (=> b!549408 m!526279))

(push 1)

(assert (not b!549408))

(assert (not b!549409))

(assert (not b!549416))

(assert (not start!50196))

(assert (not b!549411))

(assert (not b!549414))

