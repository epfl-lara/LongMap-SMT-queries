; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27642 () Bool)

(assert start!27642)

(declare-fun b!285345 () Bool)

(declare-fun res!147753 () Bool)

(declare-fun e!180886 () Bool)

(assert (=> b!285345 (=> (not res!147753) (not e!180886))))

(declare-datatypes ((array!14247 0))(
  ( (array!14248 (arr!6761 (Array (_ BitVec 32) (_ BitVec 64))) (size!7113 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14247)

(declare-datatypes ((List!4569 0))(
  ( (Nil!4566) (Cons!4565 (h!5238 (_ BitVec 64)) (t!9651 List!4569)) )
))
(declare-fun arrayNoDuplicates!0 (array!14247 (_ BitVec 32) List!4569) Bool)

(assert (=> b!285345 (= res!147753 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4566))))

(declare-fun b!285346 () Bool)

(declare-fun res!147751 () Bool)

(assert (=> b!285346 (=> (not res!147751) (not e!180886))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285346 (= res!147751 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147756 () Bool)

(assert (=> start!27642 (=> (not res!147756) (not e!180886))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27642 (= res!147756 (validMask!0 mask!3868))))

(assert (=> start!27642 e!180886))

(declare-fun array_inv!4724 (array!14247) Bool)

(assert (=> start!27642 (array_inv!4724 a!3325)))

(assert (=> start!27642 true))

(declare-fun b!285347 () Bool)

(declare-fun res!147752 () Bool)

(assert (=> b!285347 (=> (not res!147752) (not e!180886))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285347 (= res!147752 (and (= (size!7113 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7113 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7113 a!3325))))))

(declare-fun b!285348 () Bool)

(declare-fun e!180885 () Bool)

(assert (=> b!285348 (= e!180885 false)))

(declare-fun lt!140790 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14247 (_ BitVec 32)) Bool)

(assert (=> b!285348 (= lt!140790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285349 () Bool)

(assert (=> b!285349 (= e!180886 e!180885)))

(declare-fun res!147754 () Bool)

(assert (=> b!285349 (=> (not res!147754) (not e!180885))))

(declare-datatypes ((SeekEntryResult!1919 0))(
  ( (MissingZero!1919 (index!9846 (_ BitVec 32))) (Found!1919 (index!9847 (_ BitVec 32))) (Intermediate!1919 (undefined!2731 Bool) (index!9848 (_ BitVec 32)) (x!28046 (_ BitVec 32))) (Undefined!1919) (MissingVacant!1919 (index!9849 (_ BitVec 32))) )
))
(declare-fun lt!140791 () SeekEntryResult!1919)

(assert (=> b!285349 (= res!147754 (or (= lt!140791 (MissingZero!1919 i!1267)) (= lt!140791 (MissingVacant!1919 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14247 (_ BitVec 32)) SeekEntryResult!1919)

(assert (=> b!285349 (= lt!140791 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!285350 () Bool)

(declare-fun res!147755 () Bool)

(assert (=> b!285350 (=> (not res!147755) (not e!180886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285350 (= res!147755 (validKeyInArray!0 k!2581))))

(assert (= (and start!27642 res!147756) b!285347))

(assert (= (and b!285347 res!147752) b!285350))

(assert (= (and b!285350 res!147755) b!285345))

(assert (= (and b!285345 res!147753) b!285346))

(assert (= (and b!285346 res!147751) b!285349))

(assert (= (and b!285349 res!147754) b!285348))

(declare-fun m!300195 () Bool)

(assert (=> b!285349 m!300195))

(declare-fun m!300197 () Bool)

(assert (=> b!285345 m!300197))

(declare-fun m!300199 () Bool)

(assert (=> b!285348 m!300199))

(declare-fun m!300201 () Bool)

(assert (=> b!285350 m!300201))

(declare-fun m!300203 () Bool)

(assert (=> b!285346 m!300203))

(declare-fun m!300205 () Bool)

(assert (=> start!27642 m!300205))

(declare-fun m!300207 () Bool)

(assert (=> start!27642 m!300207))

(push 1)

(assert (not b!285345))

(assert (not b!285350))

(assert (not b!285346))

(assert (not b!285348))

(assert (not start!27642))

(assert (not b!285349))

(check-sat)

(pop 1)

