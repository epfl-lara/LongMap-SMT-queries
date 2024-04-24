; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25942 () Bool)

(assert start!25942)

(declare-fun res!132103 () Bool)

(declare-fun e!173135 () Bool)

(assert (=> start!25942 (=> (not res!132103) (not e!173135))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25942 (= res!132103 (validMask!0 mask!3868))))

(assert (=> start!25942 e!173135))

(declare-datatypes ((array!13038 0))(
  ( (array!13039 (arr!6168 (Array (_ BitVec 32) (_ BitVec 64))) (size!6520 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13038)

(declare-fun array_inv!4118 (array!13038) Bool)

(assert (=> start!25942 (array_inv!4118 a!3325)))

(assert (=> start!25942 true))

(declare-fun b!267851 () Bool)

(declare-fun res!132105 () Bool)

(assert (=> b!267851 (=> (not res!132105) (not e!173135))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267851 (= res!132105 (and (= (size!6520 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6520 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6520 a!3325))))))

(declare-fun b!267852 () Bool)

(declare-fun res!132104 () Bool)

(assert (=> b!267852 (=> (not res!132104) (not e!173135))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267852 (= res!132104 (validKeyInArray!0 k!2581))))

(declare-fun b!267853 () Bool)

(assert (=> b!267853 (= e!173135 false)))

(declare-fun lt!134796 () Bool)

(declare-datatypes ((List!3889 0))(
  ( (Nil!3886) (Cons!3885 (h!4552 (_ BitVec 64)) (t!8963 List!3889)) )
))
(declare-fun arrayNoDuplicates!0 (array!13038 (_ BitVec 32) List!3889) Bool)

(assert (=> b!267853 (= lt!134796 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3886))))

(assert (= (and start!25942 res!132103) b!267851))

(assert (= (and b!267851 res!132105) b!267852))

(assert (= (and b!267852 res!132104) b!267853))

(declare-fun m!284289 () Bool)

(assert (=> start!25942 m!284289))

(declare-fun m!284291 () Bool)

(assert (=> start!25942 m!284291))

(declare-fun m!284293 () Bool)

(assert (=> b!267852 m!284293))

(declare-fun m!284295 () Bool)

(assert (=> b!267853 m!284295))

(push 1)

(assert (not start!25942))

(assert (not b!267853))

(assert (not b!267852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

