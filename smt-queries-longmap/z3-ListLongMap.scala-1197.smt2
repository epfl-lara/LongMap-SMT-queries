; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25652 () Bool)

(assert start!25652)

(declare-fun b!266033 () Bool)

(declare-fun res!130307 () Bool)

(declare-fun e!172220 () Bool)

(assert (=> b!266033 (=> (not res!130307) (not e!172220))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266033 (= res!130307 (validKeyInArray!0 k0!2698))))

(declare-fun b!266034 () Bool)

(declare-fun e!172218 () Bool)

(assert (=> b!266034 (= e!172220 e!172218)))

(declare-fun res!130304 () Bool)

(assert (=> b!266034 (=> (not res!130304) (not e!172218))))

(declare-datatypes ((SeekEntryResult!1223 0))(
  ( (MissingZero!1223 (index!7062 (_ BitVec 32))) (Found!1223 (index!7063 (_ BitVec 32))) (Intermediate!1223 (undefined!2035 Bool) (index!7064 (_ BitVec 32)) (x!25484 (_ BitVec 32))) (Undefined!1223) (MissingVacant!1223 (index!7065 (_ BitVec 32))) )
))
(declare-fun lt!134349 () SeekEntryResult!1223)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266034 (= res!130304 (or (= lt!134349 (MissingZero!1223 i!1355)) (= lt!134349 (MissingVacant!1223 i!1355))))))

(declare-datatypes ((array!12826 0))(
  ( (array!12827 (arr!6067 (Array (_ BitVec 32) (_ BitVec 64))) (size!6419 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12826)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12826 (_ BitVec 32)) SeekEntryResult!1223)

(assert (=> b!266034 (= lt!134349 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!130308 () Bool)

(assert (=> start!25652 (=> (not res!130308) (not e!172220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25652 (= res!130308 (validMask!0 mask!4002))))

(assert (=> start!25652 e!172220))

(assert (=> start!25652 true))

(declare-fun array_inv!4017 (array!12826) Bool)

(assert (=> start!25652 (array_inv!4017 a!3436)))

(declare-fun b!266035 () Bool)

(declare-fun res!130303 () Bool)

(assert (=> b!266035 (=> (not res!130303) (not e!172220))))

(declare-fun arrayContainsKey!0 (array!12826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266035 (= res!130303 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266036 () Bool)

(declare-fun res!130306 () Bool)

(assert (=> b!266036 (=> (not res!130306) (not e!172218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12826 (_ BitVec 32)) Bool)

(assert (=> b!266036 (= res!130306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266037 () Bool)

(assert (=> b!266037 (= e!172218 false)))

(declare-fun lt!134348 () Bool)

(declare-datatypes ((List!3794 0))(
  ( (Nil!3791) (Cons!3790 (h!4457 (_ BitVec 64)) (t!8868 List!3794)) )
))
(declare-fun arrayNoDuplicates!0 (array!12826 (_ BitVec 32) List!3794) Bool)

(assert (=> b!266037 (= lt!134348 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3791))))

(declare-fun b!266038 () Bool)

(declare-fun res!130305 () Bool)

(assert (=> b!266038 (=> (not res!130305) (not e!172220))))

(assert (=> b!266038 (= res!130305 (and (= (size!6419 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6419 a!3436))))))

(assert (= (and start!25652 res!130308) b!266038))

(assert (= (and b!266038 res!130305) b!266033))

(assert (= (and b!266033 res!130307) b!266035))

(assert (= (and b!266035 res!130303) b!266034))

(assert (= (and b!266034 res!130304) b!266036))

(assert (= (and b!266036 res!130306) b!266037))

(declare-fun m!282875 () Bool)

(assert (=> b!266034 m!282875))

(declare-fun m!282877 () Bool)

(assert (=> b!266035 m!282877))

(declare-fun m!282879 () Bool)

(assert (=> b!266037 m!282879))

(declare-fun m!282881 () Bool)

(assert (=> start!25652 m!282881))

(declare-fun m!282883 () Bool)

(assert (=> start!25652 m!282883))

(declare-fun m!282885 () Bool)

(assert (=> b!266036 m!282885))

(declare-fun m!282887 () Bool)

(assert (=> b!266033 m!282887))

(check-sat (not b!266036) (not b!266035) (not b!266034) (not b!266037) (not b!266033) (not start!25652))
(check-sat)
