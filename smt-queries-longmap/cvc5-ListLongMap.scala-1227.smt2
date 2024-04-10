; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25920 () Bool)

(assert start!25920)

(declare-fun res!131966 () Bool)

(declare-fun e!173045 () Bool)

(assert (=> start!25920 (=> (not res!131966) (not e!173045))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25920 (= res!131966 (validMask!0 mask!3868))))

(assert (=> start!25920 e!173045))

(declare-datatypes ((array!13017 0))(
  ( (array!13018 (arr!6158 (Array (_ BitVec 32) (_ BitVec 64))) (size!6510 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13017)

(declare-fun array_inv!4121 (array!13017) Bool)

(assert (=> start!25920 (array_inv!4121 a!3325)))

(assert (=> start!25920 true))

(declare-fun b!267687 () Bool)

(declare-fun res!131965 () Bool)

(assert (=> b!267687 (=> (not res!131965) (not e!173045))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267687 (= res!131965 (and (= (size!6510 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6510 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6510 a!3325))))))

(declare-fun b!267688 () Bool)

(declare-fun res!131967 () Bool)

(assert (=> b!267688 (=> (not res!131967) (not e!173045))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267688 (= res!131967 (validKeyInArray!0 k!2581))))

(declare-fun b!267689 () Bool)

(assert (=> b!267689 (= e!173045 false)))

(declare-fun lt!134713 () Bool)

(declare-datatypes ((List!3966 0))(
  ( (Nil!3963) (Cons!3962 (h!4629 (_ BitVec 64)) (t!9048 List!3966)) )
))
(declare-fun arrayNoDuplicates!0 (array!13017 (_ BitVec 32) List!3966) Bool)

(assert (=> b!267689 (= lt!134713 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3963))))

(assert (= (and start!25920 res!131966) b!267687))

(assert (= (and b!267687 res!131965) b!267688))

(assert (= (and b!267688 res!131967) b!267689))

(declare-fun m!283989 () Bool)

(assert (=> start!25920 m!283989))

(declare-fun m!283991 () Bool)

(assert (=> start!25920 m!283991))

(declare-fun m!283993 () Bool)

(assert (=> b!267688 m!283993))

(declare-fun m!283995 () Bool)

(assert (=> b!267689 m!283995))

(push 1)

(assert (not b!267688))

(assert (not start!25920))

(assert (not b!267689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

