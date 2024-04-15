; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25968 () Bool)

(assert start!25968)

(declare-fun b!267844 () Bool)

(declare-fun res!132176 () Bool)

(declare-fun e!173082 () Bool)

(assert (=> b!267844 (=> (not res!132176) (not e!173082))))

(declare-datatypes ((array!13054 0))(
  ( (array!13055 (arr!6176 (Array (_ BitVec 32) (_ BitVec 64))) (size!6529 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13054)

(declare-datatypes ((List!3957 0))(
  ( (Nil!3954) (Cons!3953 (h!4620 (_ BitVec 64)) (t!9030 List!3957)) )
))
(declare-fun arrayNoDuplicates!0 (array!13054 (_ BitVec 32) List!3957) Bool)

(assert (=> b!267844 (= res!132176 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3954))))

(declare-fun b!267845 () Bool)

(declare-fun res!132177 () Bool)

(assert (=> b!267845 (=> (not res!132177) (not e!173082))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267845 (= res!132177 (validKeyInArray!0 k!2581))))

(declare-fun b!267846 () Bool)

(declare-fun res!132178 () Bool)

(assert (=> b!267846 (=> (not res!132178) (not e!173082))))

(declare-fun arrayContainsKey!0 (array!13054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267846 (= res!132178 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267847 () Bool)

(declare-fun res!132174 () Bool)

(assert (=> b!267847 (=> (not res!132174) (not e!173082))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267847 (= res!132174 (and (= (size!6529 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6529 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6529 a!3325))))))

(declare-fun res!132175 () Bool)

(assert (=> start!25968 (=> (not res!132175) (not e!173082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25968 (= res!132175 (validMask!0 mask!3868))))

(assert (=> start!25968 e!173082))

(declare-fun array_inv!4148 (array!13054) Bool)

(assert (=> start!25968 (array_inv!4148 a!3325)))

(assert (=> start!25968 true))

(declare-fun b!267848 () Bool)

(assert (=> b!267848 (= e!173082 false)))

(declare-datatypes ((SeekEntryResult!1333 0))(
  ( (MissingZero!1333 (index!7502 (_ BitVec 32))) (Found!1333 (index!7503 (_ BitVec 32))) (Intermediate!1333 (undefined!2145 Bool) (index!7504 (_ BitVec 32)) (x!25889 (_ BitVec 32))) (Undefined!1333) (MissingVacant!1333 (index!7505 (_ BitVec 32))) )
))
(declare-fun lt!134583 () SeekEntryResult!1333)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13054 (_ BitVec 32)) SeekEntryResult!1333)

(assert (=> b!267848 (= lt!134583 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!25968 res!132175) b!267847))

(assert (= (and b!267847 res!132174) b!267845))

(assert (= (and b!267845 res!132177) b!267844))

(assert (= (and b!267844 res!132176) b!267846))

(assert (= (and b!267846 res!132178) b!267848))

(declare-fun m!283631 () Bool)

(assert (=> b!267845 m!283631))

(declare-fun m!283633 () Bool)

(assert (=> b!267848 m!283633))

(declare-fun m!283635 () Bool)

(assert (=> start!25968 m!283635))

(declare-fun m!283637 () Bool)

(assert (=> start!25968 m!283637))

(declare-fun m!283639 () Bool)

(assert (=> b!267844 m!283639))

(declare-fun m!283641 () Bool)

(assert (=> b!267846 m!283641))

(push 1)

(assert (not b!267845))

(assert (not b!267844))

(assert (not b!267846))

(assert (not start!25968))

(assert (not b!267848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

