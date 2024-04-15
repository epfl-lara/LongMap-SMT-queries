; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25884 () Bool)

(assert start!25884)

(declare-fun res!131763 () Bool)

(declare-fun e!172865 () Bool)

(assert (=> start!25884 (=> (not res!131763) (not e!172865))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25884 (= res!131763 (validMask!0 mask!3868))))

(assert (=> start!25884 e!172865))

(declare-datatypes ((array!12991 0))(
  ( (array!12992 (arr!6146 (Array (_ BitVec 32) (_ BitVec 64))) (size!6499 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12991)

(declare-fun array_inv!4118 (array!12991) Bool)

(assert (=> start!25884 (array_inv!4118 a!3325)))

(assert (=> start!25884 true))

(declare-fun b!267414 () Bool)

(declare-fun res!131764 () Bool)

(assert (=> b!267414 (=> (not res!131764) (not e!172865))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267414 (= res!131764 (and (= (size!6499 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6499 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6499 a!3325))))))

(declare-fun b!267415 () Bool)

(declare-fun res!131762 () Bool)

(assert (=> b!267415 (=> (not res!131762) (not e!172865))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267415 (= res!131762 (validKeyInArray!0 k!2581))))

(declare-fun b!267416 () Bool)

(assert (=> b!267416 (= e!172865 false)))

(declare-fun lt!134529 () Bool)

(declare-datatypes ((List!3927 0))(
  ( (Nil!3924) (Cons!3923 (h!4590 (_ BitVec 64)) (t!9000 List!3927)) )
))
(declare-fun arrayNoDuplicates!0 (array!12991 (_ BitVec 32) List!3927) Bool)

(assert (=> b!267416 (= lt!134529 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3924))))

(assert (= (and start!25884 res!131763) b!267414))

(assert (= (and b!267414 res!131764) b!267415))

(assert (= (and b!267415 res!131762) b!267416))

(declare-fun m!283317 () Bool)

(assert (=> start!25884 m!283317))

(declare-fun m!283319 () Bool)

(assert (=> start!25884 m!283319))

(declare-fun m!283321 () Bool)

(assert (=> b!267415 m!283321))

(declare-fun m!283323 () Bool)

(assert (=> b!267416 m!283323))

(push 1)

(assert (not b!267416))

(assert (not start!25884))

(assert (not b!267415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

