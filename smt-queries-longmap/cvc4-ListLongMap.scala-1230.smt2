; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25942 () Bool)

(assert start!25942)

(declare-fun res!132082 () Bool)

(declare-fun e!173111 () Bool)

(assert (=> start!25942 (=> (not res!132082) (not e!173111))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25942 (= res!132082 (validMask!0 mask!3868))))

(assert (=> start!25942 e!173111))

(declare-datatypes ((array!13039 0))(
  ( (array!13040 (arr!6169 (Array (_ BitVec 32) (_ BitVec 64))) (size!6521 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13039)

(declare-fun array_inv!4132 (array!13039) Bool)

(assert (=> start!25942 (array_inv!4132 a!3325)))

(assert (=> start!25942 true))

(declare-fun b!267804 () Bool)

(declare-fun res!132083 () Bool)

(assert (=> b!267804 (=> (not res!132083) (not e!173111))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267804 (= res!132083 (and (= (size!6521 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6521 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6521 a!3325))))))

(declare-fun b!267805 () Bool)

(declare-fun res!132084 () Bool)

(assert (=> b!267805 (=> (not res!132084) (not e!173111))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267805 (= res!132084 (validKeyInArray!0 k!2581))))

(declare-fun b!267806 () Bool)

(assert (=> b!267806 (= e!173111 false)))

(declare-fun lt!134737 () Bool)

(declare-datatypes ((List!3977 0))(
  ( (Nil!3974) (Cons!3973 (h!4640 (_ BitVec 64)) (t!9059 List!3977)) )
))
(declare-fun arrayNoDuplicates!0 (array!13039 (_ BitVec 32) List!3977) Bool)

(assert (=> b!267806 (= lt!134737 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3974))))

(assert (= (and start!25942 res!132082) b!267804))

(assert (= (and b!267804 res!132083) b!267805))

(assert (= (and b!267805 res!132084) b!267806))

(declare-fun m!284083 () Bool)

(assert (=> start!25942 m!284083))

(declare-fun m!284085 () Bool)

(assert (=> start!25942 m!284085))

(declare-fun m!284087 () Bool)

(assert (=> b!267805 m!284087))

(declare-fun m!284089 () Bool)

(assert (=> b!267806 m!284089))

(push 1)

(assert (not b!267805))

(assert (not b!267806))

(assert (not start!25942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

