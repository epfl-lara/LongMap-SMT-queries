; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25922 () Bool)

(assert start!25922)

(declare-fun res!131974 () Bool)

(declare-fun e!173051 () Bool)

(assert (=> start!25922 (=> (not res!131974) (not e!173051))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25922 (= res!131974 (validMask!0 mask!3868))))

(assert (=> start!25922 e!173051))

(declare-datatypes ((array!13019 0))(
  ( (array!13020 (arr!6159 (Array (_ BitVec 32) (_ BitVec 64))) (size!6511 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13019)

(declare-fun array_inv!4122 (array!13019) Bool)

(assert (=> start!25922 (array_inv!4122 a!3325)))

(assert (=> start!25922 true))

(declare-fun b!267696 () Bool)

(declare-fun res!131975 () Bool)

(assert (=> b!267696 (=> (not res!131975) (not e!173051))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267696 (= res!131975 (and (= (size!6511 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6511 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6511 a!3325))))))

(declare-fun b!267697 () Bool)

(declare-fun res!131976 () Bool)

(assert (=> b!267697 (=> (not res!131976) (not e!173051))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267697 (= res!131976 (validKeyInArray!0 k0!2581))))

(declare-fun b!267698 () Bool)

(assert (=> b!267698 (= e!173051 false)))

(declare-fun lt!134716 () Bool)

(declare-datatypes ((List!3967 0))(
  ( (Nil!3964) (Cons!3963 (h!4630 (_ BitVec 64)) (t!9049 List!3967)) )
))
(declare-fun arrayNoDuplicates!0 (array!13019 (_ BitVec 32) List!3967) Bool)

(assert (=> b!267698 (= lt!134716 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3964))))

(assert (= (and start!25922 res!131974) b!267696))

(assert (= (and b!267696 res!131975) b!267697))

(assert (= (and b!267697 res!131976) b!267698))

(declare-fun m!283997 () Bool)

(assert (=> start!25922 m!283997))

(declare-fun m!283999 () Bool)

(assert (=> start!25922 m!283999))

(declare-fun m!284001 () Bool)

(assert (=> b!267697 m!284001))

(declare-fun m!284003 () Bool)

(assert (=> b!267698 m!284003))

(check-sat (not b!267698) (not b!267697) (not start!25922))
