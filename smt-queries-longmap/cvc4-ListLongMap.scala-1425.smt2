; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27580 () Bool)

(assert start!27580)

(declare-fun b!284958 () Bool)

(declare-fun res!147471 () Bool)

(declare-fun e!180680 () Bool)

(assert (=> b!284958 (=> (not res!147471) (not e!180680))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284958 (= res!147471 (not (= startIndex!26 i!1267)))))

(declare-fun b!284959 () Bool)

(declare-fun res!147469 () Bool)

(assert (=> b!284959 (=> (not res!147469) (not e!180680))))

(declare-datatypes ((array!14230 0))(
  ( (array!14231 (arr!6754 (Array (_ BitVec 32) (_ BitVec 64))) (size!7106 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14230)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14230 (_ BitVec 32)) Bool)

(assert (=> b!284959 (= res!147469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284960 () Bool)

(declare-fun res!147468 () Bool)

(declare-fun e!180678 () Bool)

(assert (=> b!284960 (=> (not res!147468) (not e!180678))))

(assert (=> b!284960 (= res!147468 (and (= (size!7106 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7106 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7106 a!3325))))))

(declare-fun res!147473 () Bool)

(assert (=> start!27580 (=> (not res!147473) (not e!180678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27580 (= res!147473 (validMask!0 mask!3868))))

(assert (=> start!27580 e!180678))

(declare-fun array_inv!4717 (array!14230) Bool)

(assert (=> start!27580 (array_inv!4717 a!3325)))

(assert (=> start!27580 true))

(declare-fun b!284961 () Bool)

(assert (=> b!284961 (= e!180678 e!180680)))

(declare-fun res!147470 () Bool)

(assert (=> b!284961 (=> (not res!147470) (not e!180680))))

(declare-datatypes ((SeekEntryResult!1912 0))(
  ( (MissingZero!1912 (index!9818 (_ BitVec 32))) (Found!1912 (index!9819 (_ BitVec 32))) (Intermediate!1912 (undefined!2724 Bool) (index!9820 (_ BitVec 32)) (x!28015 (_ BitVec 32))) (Undefined!1912) (MissingVacant!1912 (index!9821 (_ BitVec 32))) )
))
(declare-fun lt!140659 () SeekEntryResult!1912)

(assert (=> b!284961 (= res!147470 (or (= lt!140659 (MissingZero!1912 i!1267)) (= lt!140659 (MissingVacant!1912 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14230 (_ BitVec 32)) SeekEntryResult!1912)

(assert (=> b!284961 (= lt!140659 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284962 () Bool)

(declare-fun res!147472 () Bool)

(assert (=> b!284962 (=> (not res!147472) (not e!180678))))

(declare-fun arrayContainsKey!0 (array!14230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284962 (= res!147472 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284963 () Bool)

(declare-fun res!147467 () Bool)

(assert (=> b!284963 (=> (not res!147467) (not e!180680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284963 (= res!147467 (not (validKeyInArray!0 (select (arr!6754 a!3325) startIndex!26))))))

(declare-fun b!284964 () Bool)

(declare-fun res!147474 () Bool)

(assert (=> b!284964 (=> (not res!147474) (not e!180678))))

(assert (=> b!284964 (= res!147474 (validKeyInArray!0 k!2581))))

(declare-fun b!284965 () Bool)

(assert (=> b!284965 (= e!180680 (and (bvslt startIndex!26 (bvsub (size!7106 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!7106 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7106 a!3325) startIndex!26))))))

(declare-fun b!284966 () Bool)

(declare-fun res!147466 () Bool)

(assert (=> b!284966 (=> (not res!147466) (not e!180678))))

(declare-datatypes ((List!4562 0))(
  ( (Nil!4559) (Cons!4558 (h!5231 (_ BitVec 64)) (t!9644 List!4562)) )
))
(declare-fun arrayNoDuplicates!0 (array!14230 (_ BitVec 32) List!4562) Bool)

(assert (=> b!284966 (= res!147466 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4559))))

(assert (= (and start!27580 res!147473) b!284960))

(assert (= (and b!284960 res!147468) b!284964))

(assert (= (and b!284964 res!147474) b!284966))

(assert (= (and b!284966 res!147466) b!284962))

(assert (= (and b!284962 res!147472) b!284961))

(assert (= (and b!284961 res!147470) b!284959))

(assert (= (and b!284959 res!147469) b!284958))

(assert (= (and b!284958 res!147471) b!284963))

(assert (= (and b!284963 res!147467) b!284965))

(declare-fun m!299847 () Bool)

(assert (=> b!284961 m!299847))

(declare-fun m!299849 () Bool)

(assert (=> b!284964 m!299849))

(declare-fun m!299851 () Bool)

(assert (=> b!284959 m!299851))

(declare-fun m!299853 () Bool)

(assert (=> b!284962 m!299853))

(declare-fun m!299855 () Bool)

(assert (=> b!284966 m!299855))

(declare-fun m!299857 () Bool)

(assert (=> b!284963 m!299857))

(assert (=> b!284963 m!299857))

(declare-fun m!299859 () Bool)

(assert (=> b!284963 m!299859))

(declare-fun m!299861 () Bool)

(assert (=> start!27580 m!299861))

(declare-fun m!299863 () Bool)

(assert (=> start!27580 m!299863))

(push 1)

(assert (not b!284966))

(assert (not start!27580))

(assert (not b!284961))

(assert (not b!284964))

(assert (not b!284963))

(assert (not b!284959))

(assert (not b!284962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

