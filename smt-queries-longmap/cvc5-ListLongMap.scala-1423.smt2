; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27564 () Bool)

(assert start!27564)

(declare-fun b!284790 () Bool)

(declare-fun res!147303 () Bool)

(declare-fun e!180607 () Bool)

(assert (=> b!284790 (=> (not res!147303) (not e!180607))))

(declare-datatypes ((array!14214 0))(
  ( (array!14215 (arr!6746 (Array (_ BitVec 32) (_ BitVec 64))) (size!7098 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14214)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284790 (= res!147303 (and (= (size!7098 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7098 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7098 a!3325))))))

(declare-fun b!284791 () Bool)

(declare-fun e!180608 () Bool)

(assert (=> b!284791 (= e!180607 e!180608)))

(declare-fun res!147299 () Bool)

(assert (=> b!284791 (=> (not res!147299) (not e!180608))))

(declare-datatypes ((SeekEntryResult!1904 0))(
  ( (MissingZero!1904 (index!9786 (_ BitVec 32))) (Found!1904 (index!9787 (_ BitVec 32))) (Intermediate!1904 (undefined!2716 Bool) (index!9788 (_ BitVec 32)) (x!27991 (_ BitVec 32))) (Undefined!1904) (MissingVacant!1904 (index!9789 (_ BitVec 32))) )
))
(declare-fun lt!140619 () SeekEntryResult!1904)

(assert (=> b!284791 (= res!147299 (or (= lt!140619 (MissingZero!1904 i!1267)) (= lt!140619 (MissingVacant!1904 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14214 (_ BitVec 32)) SeekEntryResult!1904)

(assert (=> b!284791 (= lt!140619 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284792 () Bool)

(declare-fun res!147302 () Bool)

(assert (=> b!284792 (=> (not res!147302) (not e!180607))))

(declare-datatypes ((List!4554 0))(
  ( (Nil!4551) (Cons!4550 (h!5223 (_ BitVec 64)) (t!9636 List!4554)) )
))
(declare-fun arrayNoDuplicates!0 (array!14214 (_ BitVec 32) List!4554) Bool)

(assert (=> b!284792 (= res!147302 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4551))))

(declare-fun b!284793 () Bool)

(assert (=> b!284793 (= e!180608 false)))

(declare-fun lt!140620 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14214 (_ BitVec 32)) Bool)

(assert (=> b!284793 (= lt!140620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284794 () Bool)

(declare-fun res!147298 () Bool)

(assert (=> b!284794 (=> (not res!147298) (not e!180607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284794 (= res!147298 (validKeyInArray!0 k!2581))))

(declare-fun res!147301 () Bool)

(assert (=> start!27564 (=> (not res!147301) (not e!180607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27564 (= res!147301 (validMask!0 mask!3868))))

(assert (=> start!27564 e!180607))

(declare-fun array_inv!4709 (array!14214) Bool)

(assert (=> start!27564 (array_inv!4709 a!3325)))

(assert (=> start!27564 true))

(declare-fun b!284795 () Bool)

(declare-fun res!147300 () Bool)

(assert (=> b!284795 (=> (not res!147300) (not e!180607))))

(declare-fun arrayContainsKey!0 (array!14214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284795 (= res!147300 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27564 res!147301) b!284790))

(assert (= (and b!284790 res!147303) b!284794))

(assert (= (and b!284794 res!147298) b!284792))

(assert (= (and b!284792 res!147302) b!284795))

(assert (= (and b!284795 res!147300) b!284791))

(assert (= (and b!284791 res!147299) b!284793))

(declare-fun m!299727 () Bool)

(assert (=> b!284791 m!299727))

(declare-fun m!299729 () Bool)

(assert (=> b!284793 m!299729))

(declare-fun m!299731 () Bool)

(assert (=> b!284794 m!299731))

(declare-fun m!299733 () Bool)

(assert (=> b!284792 m!299733))

(declare-fun m!299735 () Bool)

(assert (=> start!27564 m!299735))

(declare-fun m!299737 () Bool)

(assert (=> start!27564 m!299737))

(declare-fun m!299739 () Bool)

(assert (=> b!284795 m!299739))

(push 1)

