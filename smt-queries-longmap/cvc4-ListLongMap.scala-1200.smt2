; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25670 () Bool)

(assert start!25670)

(declare-fun res!130481 () Bool)

(declare-fun e!172294 () Bool)

(assert (=> start!25670 (=> (not res!130481) (not e!172294))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25670 (= res!130481 (validMask!0 mask!4002))))

(assert (=> start!25670 e!172294))

(assert (=> start!25670 true))

(declare-datatypes ((array!12849 0))(
  ( (array!12850 (arr!6079 (Array (_ BitVec 32) (_ BitVec 64))) (size!6431 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12849)

(declare-fun array_inv!4042 (array!12849) Bool)

(assert (=> start!25670 (array_inv!4042 a!3436)))

(declare-fun b!266184 () Bool)

(declare-fun res!130484 () Bool)

(assert (=> b!266184 (=> (not res!130484) (not e!172294))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266184 (= res!130484 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266185 () Bool)

(declare-fun e!172295 () Bool)

(assert (=> b!266185 (= e!172295 false)))

(declare-fun lt!134355 () Bool)

(declare-datatypes ((List!3893 0))(
  ( (Nil!3890) (Cons!3889 (h!4556 (_ BitVec 64)) (t!8975 List!3893)) )
))
(declare-fun arrayNoDuplicates!0 (array!12849 (_ BitVec 32) List!3893) Bool)

(assert (=> b!266185 (= lt!134355 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3890))))

(declare-fun b!266186 () Bool)

(declare-fun res!130480 () Bool)

(assert (=> b!266186 (=> (not res!130480) (not e!172294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266186 (= res!130480 (validKeyInArray!0 k!2698))))

(declare-fun b!266187 () Bool)

(declare-fun res!130482 () Bool)

(assert (=> b!266187 (=> (not res!130482) (not e!172294))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266187 (= res!130482 (and (= (size!6431 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6431 a!3436))))))

(declare-fun b!266188 () Bool)

(declare-fun res!130483 () Bool)

(assert (=> b!266188 (=> (not res!130483) (not e!172295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12849 (_ BitVec 32)) Bool)

(assert (=> b!266188 (= res!130483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266189 () Bool)

(assert (=> b!266189 (= e!172294 e!172295)))

(declare-fun res!130485 () Bool)

(assert (=> b!266189 (=> (not res!130485) (not e!172295))))

(declare-datatypes ((SeekEntryResult!1270 0))(
  ( (MissingZero!1270 (index!7250 (_ BitVec 32))) (Found!1270 (index!7251 (_ BitVec 32))) (Intermediate!1270 (undefined!2082 Bool) (index!7252 (_ BitVec 32)) (x!25555 (_ BitVec 32))) (Undefined!1270) (MissingVacant!1270 (index!7253 (_ BitVec 32))) )
))
(declare-fun lt!134356 () SeekEntryResult!1270)

(assert (=> b!266189 (= res!130485 (or (= lt!134356 (MissingZero!1270 i!1355)) (= lt!134356 (MissingVacant!1270 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12849 (_ BitVec 32)) SeekEntryResult!1270)

(assert (=> b!266189 (= lt!134356 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25670 res!130481) b!266187))

(assert (= (and b!266187 res!130482) b!266186))

(assert (= (and b!266186 res!130480) b!266184))

(assert (= (and b!266184 res!130484) b!266189))

(assert (= (and b!266189 res!130485) b!266188))

(assert (= (and b!266188 res!130483) b!266185))

(declare-fun m!282823 () Bool)

(assert (=> b!266185 m!282823))

(declare-fun m!282825 () Bool)

(assert (=> b!266189 m!282825))

(declare-fun m!282827 () Bool)

(assert (=> b!266186 m!282827))

(declare-fun m!282829 () Bool)

(assert (=> start!25670 m!282829))

(declare-fun m!282831 () Bool)

(assert (=> start!25670 m!282831))

(declare-fun m!282833 () Bool)

(assert (=> b!266188 m!282833))

(declare-fun m!282835 () Bool)

(assert (=> b!266184 m!282835))

(push 1)

(assert (not b!266188))

(assert (not start!25670))

(assert (not b!266186))

(assert (not b!266185))

(assert (not b!266184))

(assert (not b!266189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

