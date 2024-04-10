; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27576 () Bool)

(assert start!27576)

(declare-fun b!284904 () Bool)

(declare-fun res!147418 () Bool)

(declare-fun e!180660 () Bool)

(assert (=> b!284904 (=> (not res!147418) (not e!180660))))

(declare-datatypes ((array!14226 0))(
  ( (array!14227 (arr!6752 (Array (_ BitVec 32) (_ BitVec 64))) (size!7104 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14226)

(declare-datatypes ((List!4560 0))(
  ( (Nil!4557) (Cons!4556 (h!5229 (_ BitVec 64)) (t!9642 List!4560)) )
))
(declare-fun arrayNoDuplicates!0 (array!14226 (_ BitVec 32) List!4560) Bool)

(assert (=> b!284904 (= res!147418 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4557))))

(declare-fun b!284905 () Bool)

(declare-fun res!147414 () Bool)

(declare-fun e!180662 () Bool)

(assert (=> b!284905 (=> (not res!147414) (not e!180662))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284905 (= res!147414 (not (= startIndex!26 i!1267)))))

(declare-fun res!147412 () Bool)

(assert (=> start!27576 (=> (not res!147412) (not e!180660))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27576 (= res!147412 (validMask!0 mask!3868))))

(assert (=> start!27576 e!180660))

(declare-fun array_inv!4715 (array!14226) Bool)

(assert (=> start!27576 (array_inv!4715 a!3325)))

(assert (=> start!27576 true))

(declare-fun b!284906 () Bool)

(declare-fun res!147419 () Bool)

(assert (=> b!284906 (=> (not res!147419) (not e!180660))))

(assert (=> b!284906 (= res!147419 (and (= (size!7104 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7104 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7104 a!3325))))))

(declare-fun b!284907 () Bool)

(declare-fun res!147420 () Bool)

(assert (=> b!284907 (=> (not res!147420) (not e!180660))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284907 (= res!147420 (validKeyInArray!0 k!2581))))

(declare-fun b!284908 () Bool)

(declare-fun res!147417 () Bool)

(assert (=> b!284908 (=> (not res!147417) (not e!180660))))

(declare-fun arrayContainsKey!0 (array!14226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284908 (= res!147417 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284909 () Bool)

(assert (=> b!284909 (= e!180660 e!180662)))

(declare-fun res!147416 () Bool)

(assert (=> b!284909 (=> (not res!147416) (not e!180662))))

(declare-datatypes ((SeekEntryResult!1910 0))(
  ( (MissingZero!1910 (index!9810 (_ BitVec 32))) (Found!1910 (index!9811 (_ BitVec 32))) (Intermediate!1910 (undefined!2722 Bool) (index!9812 (_ BitVec 32)) (x!28013 (_ BitVec 32))) (Undefined!1910) (MissingVacant!1910 (index!9813 (_ BitVec 32))) )
))
(declare-fun lt!140653 () SeekEntryResult!1910)

(assert (=> b!284909 (= res!147416 (or (= lt!140653 (MissingZero!1910 i!1267)) (= lt!140653 (MissingVacant!1910 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14226 (_ BitVec 32)) SeekEntryResult!1910)

(assert (=> b!284909 (= lt!140653 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284910 () Bool)

(declare-fun res!147413 () Bool)

(assert (=> b!284910 (=> (not res!147413) (not e!180662))))

(assert (=> b!284910 (= res!147413 (not (validKeyInArray!0 (select (arr!6752 a!3325) startIndex!26))))))

(declare-fun b!284911 () Bool)

(assert (=> b!284911 (= e!180662 (and (bvslt startIndex!26 (bvsub (size!7104 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!7104 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7104 a!3325) startIndex!26))))))

(declare-fun b!284912 () Bool)

(declare-fun res!147415 () Bool)

(assert (=> b!284912 (=> (not res!147415) (not e!180662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14226 (_ BitVec 32)) Bool)

(assert (=> b!284912 (= res!147415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27576 res!147412) b!284906))

(assert (= (and b!284906 res!147419) b!284907))

(assert (= (and b!284907 res!147420) b!284904))

(assert (= (and b!284904 res!147418) b!284908))

(assert (= (and b!284908 res!147417) b!284909))

(assert (= (and b!284909 res!147416) b!284912))

(assert (= (and b!284912 res!147415) b!284905))

(assert (= (and b!284905 res!147414) b!284910))

(assert (= (and b!284910 res!147413) b!284911))

(declare-fun m!299811 () Bool)

(assert (=> start!27576 m!299811))

(declare-fun m!299813 () Bool)

(assert (=> start!27576 m!299813))

(declare-fun m!299815 () Bool)

(assert (=> b!284907 m!299815))

(declare-fun m!299817 () Bool)

(assert (=> b!284904 m!299817))

(declare-fun m!299819 () Bool)

(assert (=> b!284910 m!299819))

(assert (=> b!284910 m!299819))

(declare-fun m!299821 () Bool)

(assert (=> b!284910 m!299821))

(declare-fun m!299823 () Bool)

(assert (=> b!284908 m!299823))

(declare-fun m!299825 () Bool)

(assert (=> b!284909 m!299825))

(declare-fun m!299827 () Bool)

(assert (=> b!284912 m!299827))

(push 1)

(assert (not b!284910))

(assert (not start!27576))

(assert (not b!284907))

(assert (not b!284909))

(assert (not b!284912))

(assert (not b!284908))

(assert (not b!284904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

