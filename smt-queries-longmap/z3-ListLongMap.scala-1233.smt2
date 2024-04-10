; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25958 () Bool)

(assert start!25958)

(declare-fun b!267931 () Bool)

(declare-fun e!173159 () Bool)

(assert (=> b!267931 (= e!173159 false)))

(declare-datatypes ((SeekEntryResult!1335 0))(
  ( (MissingZero!1335 (index!7510 (_ BitVec 32))) (Found!1335 (index!7511 (_ BitVec 32))) (Intermediate!1335 (undefined!2147 Bool) (index!7512 (_ BitVec 32)) (x!25884 (_ BitVec 32))) (Undefined!1335) (MissingVacant!1335 (index!7513 (_ BitVec 32))) )
))
(declare-fun lt!134752 () SeekEntryResult!1335)

(declare-datatypes ((array!13055 0))(
  ( (array!13056 (arr!6177 (Array (_ BitVec 32) (_ BitVec 64))) (size!6529 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13055)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13055 (_ BitVec 32)) SeekEntryResult!1335)

(assert (=> b!267931 (= lt!134752 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!267933 () Bool)

(declare-fun res!132210 () Bool)

(assert (=> b!267933 (=> (not res!132210) (not e!173159))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267933 (= res!132210 (and (= (size!6529 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6529 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6529 a!3325))))))

(declare-fun b!267934 () Bool)

(declare-fun res!132211 () Bool)

(assert (=> b!267934 (=> (not res!132211) (not e!173159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267934 (= res!132211 (validKeyInArray!0 k0!2581))))

(declare-fun b!267935 () Bool)

(declare-fun res!132209 () Bool)

(assert (=> b!267935 (=> (not res!132209) (not e!173159))))

(declare-fun arrayContainsKey!0 (array!13055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267935 (= res!132209 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132212 () Bool)

(assert (=> start!25958 (=> (not res!132212) (not e!173159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25958 (= res!132212 (validMask!0 mask!3868))))

(assert (=> start!25958 e!173159))

(declare-fun array_inv!4140 (array!13055) Bool)

(assert (=> start!25958 (array_inv!4140 a!3325)))

(assert (=> start!25958 true))

(declare-fun b!267932 () Bool)

(declare-fun res!132213 () Bool)

(assert (=> b!267932 (=> (not res!132213) (not e!173159))))

(declare-datatypes ((List!3985 0))(
  ( (Nil!3982) (Cons!3981 (h!4648 (_ BitVec 64)) (t!9067 List!3985)) )
))
(declare-fun arrayNoDuplicates!0 (array!13055 (_ BitVec 32) List!3985) Bool)

(assert (=> b!267932 (= res!132213 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3982))))

(assert (= (and start!25958 res!132212) b!267933))

(assert (= (and b!267933 res!132210) b!267934))

(assert (= (and b!267934 res!132211) b!267932))

(assert (= (and b!267932 res!132213) b!267935))

(assert (= (and b!267935 res!132209) b!267931))

(declare-fun m!284175 () Bool)

(assert (=> b!267931 m!284175))

(declare-fun m!284177 () Bool)

(assert (=> b!267935 m!284177))

(declare-fun m!284179 () Bool)

(assert (=> b!267934 m!284179))

(declare-fun m!284181 () Bool)

(assert (=> b!267932 m!284181))

(declare-fun m!284183 () Bool)

(assert (=> start!25958 m!284183))

(declare-fun m!284185 () Bool)

(assert (=> start!25958 m!284185))

(check-sat (not b!267932) (not b!267934) (not start!25958) (not b!267935) (not b!267931))
(check-sat)
