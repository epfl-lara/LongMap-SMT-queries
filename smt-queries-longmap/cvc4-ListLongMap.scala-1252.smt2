; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26074 () Bool)

(assert start!26074)

(declare-fun b!268935 () Bool)

(declare-fun e!173632 () Bool)

(declare-fun e!173633 () Bool)

(assert (=> b!268935 (= e!173632 e!173633)))

(declare-fun res!133217 () Bool)

(assert (=> b!268935 (=> (not res!133217) (not e!173633))))

(declare-datatypes ((SeekEntryResult!1393 0))(
  ( (MissingZero!1393 (index!7742 (_ BitVec 32))) (Found!1393 (index!7743 (_ BitVec 32))) (Intermediate!1393 (undefined!2205 Bool) (index!7744 (_ BitVec 32)) (x!26094 (_ BitVec 32))) (Undefined!1393) (MissingVacant!1393 (index!7745 (_ BitVec 32))) )
))
(declare-fun lt!135042 () SeekEntryResult!1393)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268935 (= res!133217 (or (= lt!135042 (MissingZero!1393 i!1267)) (= lt!135042 (MissingVacant!1393 i!1267))))))

(declare-datatypes ((array!13171 0))(
  ( (array!13172 (arr!6235 (Array (_ BitVec 32) (_ BitVec 64))) (size!6587 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13171)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13171 (_ BitVec 32)) SeekEntryResult!1393)

(assert (=> b!268935 (= lt!135042 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268937 () Bool)

(assert (=> b!268937 (= e!173633 false)))

(declare-fun lt!135043 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13171 (_ BitVec 32)) Bool)

(assert (=> b!268937 (= lt!135043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268938 () Bool)

(declare-fun res!133218 () Bool)

(assert (=> b!268938 (=> (not res!133218) (not e!173632))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268938 (= res!133218 (and (= (size!6587 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6587 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6587 a!3325))))))

(declare-fun b!268939 () Bool)

(declare-fun res!133216 () Bool)

(assert (=> b!268939 (=> (not res!133216) (not e!173632))))

(declare-fun arrayContainsKey!0 (array!13171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268939 (= res!133216 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268940 () Bool)

(declare-fun res!133213 () Bool)

(assert (=> b!268940 (=> (not res!133213) (not e!173632))))

(declare-datatypes ((List!4043 0))(
  ( (Nil!4040) (Cons!4039 (h!4706 (_ BitVec 64)) (t!9125 List!4043)) )
))
(declare-fun arrayNoDuplicates!0 (array!13171 (_ BitVec 32) List!4043) Bool)

(assert (=> b!268940 (= res!133213 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4040))))

(declare-fun res!133215 () Bool)

(assert (=> start!26074 (=> (not res!133215) (not e!173632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26074 (= res!133215 (validMask!0 mask!3868))))

(assert (=> start!26074 e!173632))

(declare-fun array_inv!4198 (array!13171) Bool)

(assert (=> start!26074 (array_inv!4198 a!3325)))

(assert (=> start!26074 true))

(declare-fun b!268936 () Bool)

(declare-fun res!133214 () Bool)

(assert (=> b!268936 (=> (not res!133214) (not e!173632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268936 (= res!133214 (validKeyInArray!0 k!2581))))

(assert (= (and start!26074 res!133215) b!268938))

(assert (= (and b!268938 res!133218) b!268936))

(assert (= (and b!268936 res!133214) b!268940))

(assert (= (and b!268940 res!133213) b!268939))

(assert (= (and b!268939 res!133216) b!268935))

(assert (= (and b!268935 res!133217) b!268937))

(declare-fun m!284953 () Bool)

(assert (=> start!26074 m!284953))

(declare-fun m!284955 () Bool)

(assert (=> start!26074 m!284955))

(declare-fun m!284957 () Bool)

(assert (=> b!268935 m!284957))

(declare-fun m!284959 () Bool)

(assert (=> b!268937 m!284959))

(declare-fun m!284961 () Bool)

(assert (=> b!268940 m!284961))

(declare-fun m!284963 () Bool)

(assert (=> b!268939 m!284963))

(declare-fun m!284965 () Bool)

(assert (=> b!268936 m!284965))

(push 1)

(assert (not b!268935))

(assert (not b!268936))

(assert (not b!268937))

(assert (not b!268939))

(assert (not start!26074))

(assert (not b!268940))

(check-sat)

