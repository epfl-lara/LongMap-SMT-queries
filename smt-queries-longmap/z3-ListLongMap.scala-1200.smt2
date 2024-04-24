; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25670 () Bool)

(assert start!25670)

(declare-fun b!266195 () Bool)

(declare-fun e!172300 () Bool)

(assert (=> b!266195 (= e!172300 false)))

(declare-fun lt!134402 () Bool)

(declare-datatypes ((array!12844 0))(
  ( (array!12845 (arr!6076 (Array (_ BitVec 32) (_ BitVec 64))) (size!6428 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12844)

(declare-datatypes ((List!3803 0))(
  ( (Nil!3800) (Cons!3799 (h!4466 (_ BitVec 64)) (t!8877 List!3803)) )
))
(declare-fun arrayNoDuplicates!0 (array!12844 (_ BitVec 32) List!3803) Bool)

(assert (=> b!266195 (= lt!134402 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3800))))

(declare-fun res!130467 () Bool)

(declare-fun e!172301 () Bool)

(assert (=> start!25670 (=> (not res!130467) (not e!172301))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25670 (= res!130467 (validMask!0 mask!4002))))

(assert (=> start!25670 e!172301))

(assert (=> start!25670 true))

(declare-fun array_inv!4026 (array!12844) Bool)

(assert (=> start!25670 (array_inv!4026 a!3436)))

(declare-fun b!266196 () Bool)

(declare-fun res!130468 () Bool)

(assert (=> b!266196 (=> (not res!130468) (not e!172301))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266196 (= res!130468 (and (= (size!6428 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6428 a!3436))))))

(declare-fun b!266197 () Bool)

(assert (=> b!266197 (= e!172301 e!172300)))

(declare-fun res!130470 () Bool)

(assert (=> b!266197 (=> (not res!130470) (not e!172300))))

(declare-datatypes ((SeekEntryResult!1232 0))(
  ( (MissingZero!1232 (index!7098 (_ BitVec 32))) (Found!1232 (index!7099 (_ BitVec 32))) (Intermediate!1232 (undefined!2044 Bool) (index!7100 (_ BitVec 32)) (x!25517 (_ BitVec 32))) (Undefined!1232) (MissingVacant!1232 (index!7101 (_ BitVec 32))) )
))
(declare-fun lt!134403 () SeekEntryResult!1232)

(assert (=> b!266197 (= res!130470 (or (= lt!134403 (MissingZero!1232 i!1355)) (= lt!134403 (MissingVacant!1232 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12844 (_ BitVec 32)) SeekEntryResult!1232)

(assert (=> b!266197 (= lt!134403 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266198 () Bool)

(declare-fun res!130466 () Bool)

(assert (=> b!266198 (=> (not res!130466) (not e!172301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266198 (= res!130466 (validKeyInArray!0 k0!2698))))

(declare-fun b!266199 () Bool)

(declare-fun res!130465 () Bool)

(assert (=> b!266199 (=> (not res!130465) (not e!172301))))

(declare-fun arrayContainsKey!0 (array!12844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266199 (= res!130465 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266200 () Bool)

(declare-fun res!130469 () Bool)

(assert (=> b!266200 (=> (not res!130469) (not e!172300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12844 (_ BitVec 32)) Bool)

(assert (=> b!266200 (= res!130469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25670 res!130467) b!266196))

(assert (= (and b!266196 res!130468) b!266198))

(assert (= (and b!266198 res!130466) b!266199))

(assert (= (and b!266199 res!130465) b!266197))

(assert (= (and b!266197 res!130470) b!266200))

(assert (= (and b!266200 res!130469) b!266195))

(declare-fun m!283001 () Bool)

(assert (=> b!266198 m!283001))

(declare-fun m!283003 () Bool)

(assert (=> b!266195 m!283003))

(declare-fun m!283005 () Bool)

(assert (=> start!25670 m!283005))

(declare-fun m!283007 () Bool)

(assert (=> start!25670 m!283007))

(declare-fun m!283009 () Bool)

(assert (=> b!266199 m!283009))

(declare-fun m!283011 () Bool)

(assert (=> b!266200 m!283011))

(declare-fun m!283013 () Bool)

(assert (=> b!266197 m!283013))

(check-sat (not start!25670) (not b!266200) (not b!266198) (not b!266195) (not b!266197) (not b!266199))
(check-sat)
