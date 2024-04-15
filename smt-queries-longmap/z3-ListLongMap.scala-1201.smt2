; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25676 () Bool)

(assert start!25676)

(declare-fun b!266055 () Bool)

(declare-fun e!172201 () Bool)

(assert (=> b!266055 (= e!172201 false)))

(declare-fun lt!134181 () Bool)

(declare-datatypes ((array!12843 0))(
  ( (array!12844 (arr!6075 (Array (_ BitVec 32) (_ BitVec 64))) (size!6428 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12843)

(declare-datatypes ((List!3862 0))(
  ( (Nil!3859) (Cons!3858 (h!4525 (_ BitVec 64)) (t!8935 List!3862)) )
))
(declare-fun arrayNoDuplicates!0 (array!12843 (_ BitVec 32) List!3862) Bool)

(assert (=> b!266055 (= lt!134181 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3859))))

(declare-fun b!266056 () Bool)

(declare-fun res!130406 () Bool)

(declare-fun e!172203 () Bool)

(assert (=> b!266056 (=> (not res!130406) (not e!172203))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266056 (= res!130406 (and (= (size!6428 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6428 a!3436))))))

(declare-fun b!266057 () Bool)

(declare-fun res!130404 () Bool)

(assert (=> b!266057 (=> (not res!130404) (not e!172201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12843 (_ BitVec 32)) Bool)

(assert (=> b!266057 (= res!130404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266058 () Bool)

(declare-fun res!130407 () Bool)

(assert (=> b!266058 (=> (not res!130407) (not e!172203))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266058 (= res!130407 (validKeyInArray!0 k0!2698))))

(declare-fun res!130403 () Bool)

(assert (=> start!25676 (=> (not res!130403) (not e!172203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25676 (= res!130403 (validMask!0 mask!4002))))

(assert (=> start!25676 e!172203))

(assert (=> start!25676 true))

(declare-fun array_inv!4047 (array!12843) Bool)

(assert (=> start!25676 (array_inv!4047 a!3436)))

(declare-fun b!266059 () Bool)

(assert (=> b!266059 (= e!172203 e!172201)))

(declare-fun res!130408 () Bool)

(assert (=> b!266059 (=> (not res!130408) (not e!172201))))

(declare-datatypes ((SeekEntryResult!1265 0))(
  ( (MissingZero!1265 (index!7230 (_ BitVec 32))) (Found!1265 (index!7231 (_ BitVec 32))) (Intermediate!1265 (undefined!2077 Bool) (index!7232 (_ BitVec 32)) (x!25557 (_ BitVec 32))) (Undefined!1265) (MissingVacant!1265 (index!7233 (_ BitVec 32))) )
))
(declare-fun lt!134180 () SeekEntryResult!1265)

(assert (=> b!266059 (= res!130408 (or (= lt!134180 (MissingZero!1265 i!1355)) (= lt!134180 (MissingVacant!1265 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12843 (_ BitVec 32)) SeekEntryResult!1265)

(assert (=> b!266059 (= lt!134180 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266060 () Bool)

(declare-fun res!130405 () Bool)

(assert (=> b!266060 (=> (not res!130405) (not e!172203))))

(declare-fun arrayContainsKey!0 (array!12843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266060 (= res!130405 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25676 res!130403) b!266056))

(assert (= (and b!266056 res!130406) b!266058))

(assert (= (and b!266058 res!130407) b!266060))

(assert (= (and b!266060 res!130405) b!266059))

(assert (= (and b!266059 res!130408) b!266057))

(assert (= (and b!266057 res!130404) b!266055))

(declare-fun m!282245 () Bool)

(assert (=> b!266057 m!282245))

(declare-fun m!282247 () Bool)

(assert (=> b!266055 m!282247))

(declare-fun m!282249 () Bool)

(assert (=> b!266059 m!282249))

(declare-fun m!282251 () Bool)

(assert (=> b!266060 m!282251))

(declare-fun m!282253 () Bool)

(assert (=> b!266058 m!282253))

(declare-fun m!282255 () Bool)

(assert (=> start!25676 m!282255))

(declare-fun m!282257 () Bool)

(assert (=> start!25676 m!282257))

(check-sat (not b!266059) (not b!266057) (not start!25676) (not b!266058) (not b!266055) (not b!266060))
(check-sat)
