; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25642 () Bool)

(assert start!25642)

(declare-fun b!265932 () Bool)

(declare-fun res!130230 () Bool)

(declare-fun e!172168 () Bool)

(assert (=> b!265932 (=> (not res!130230) (not e!172168))))

(declare-datatypes ((array!12821 0))(
  ( (array!12822 (arr!6065 (Array (_ BitVec 32) (_ BitVec 64))) (size!6417 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12821)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12821 (_ BitVec 32)) Bool)

(assert (=> b!265932 (= res!130230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130232 () Bool)

(declare-fun e!172169 () Bool)

(assert (=> start!25642 (=> (not res!130232) (not e!172169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25642 (= res!130232 (validMask!0 mask!4002))))

(assert (=> start!25642 e!172169))

(assert (=> start!25642 true))

(declare-fun array_inv!4028 (array!12821) Bool)

(assert (=> start!25642 (array_inv!4028 a!3436)))

(declare-fun b!265933 () Bool)

(declare-fun res!130229 () Bool)

(assert (=> b!265933 (=> (not res!130229) (not e!172169))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265933 (= res!130229 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265934 () Bool)

(declare-fun res!130231 () Bool)

(assert (=> b!265934 (=> (not res!130231) (not e!172169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265934 (= res!130231 (validKeyInArray!0 k!2698))))

(declare-fun b!265935 () Bool)

(declare-fun res!130228 () Bool)

(assert (=> b!265935 (=> (not res!130228) (not e!172169))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265935 (= res!130228 (and (= (size!6417 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6417 a!3436))))))

(declare-fun b!265936 () Bool)

(assert (=> b!265936 (= e!172168 false)))

(declare-fun lt!134271 () Bool)

(declare-datatypes ((List!3879 0))(
  ( (Nil!3876) (Cons!3875 (h!4542 (_ BitVec 64)) (t!8961 List!3879)) )
))
(declare-fun arrayNoDuplicates!0 (array!12821 (_ BitVec 32) List!3879) Bool)

(assert (=> b!265936 (= lt!134271 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3876))))

(declare-fun b!265937 () Bool)

(assert (=> b!265937 (= e!172169 e!172168)))

(declare-fun res!130233 () Bool)

(assert (=> b!265937 (=> (not res!130233) (not e!172168))))

(declare-datatypes ((SeekEntryResult!1256 0))(
  ( (MissingZero!1256 (index!7194 (_ BitVec 32))) (Found!1256 (index!7195 (_ BitVec 32))) (Intermediate!1256 (undefined!2068 Bool) (index!7196 (_ BitVec 32)) (x!25509 (_ BitVec 32))) (Undefined!1256) (MissingVacant!1256 (index!7197 (_ BitVec 32))) )
))
(declare-fun lt!134272 () SeekEntryResult!1256)

(assert (=> b!265937 (= res!130233 (or (= lt!134272 (MissingZero!1256 i!1355)) (= lt!134272 (MissingVacant!1256 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12821 (_ BitVec 32)) SeekEntryResult!1256)

(assert (=> b!265937 (= lt!134272 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25642 res!130232) b!265935))

(assert (= (and b!265935 res!130228) b!265934))

(assert (= (and b!265934 res!130231) b!265933))

(assert (= (and b!265933 res!130229) b!265937))

(assert (= (and b!265937 res!130233) b!265932))

(assert (= (and b!265932 res!130230) b!265936))

(declare-fun m!282627 () Bool)

(assert (=> b!265934 m!282627))

(declare-fun m!282629 () Bool)

(assert (=> start!25642 m!282629))

(declare-fun m!282631 () Bool)

(assert (=> start!25642 m!282631))

(declare-fun m!282633 () Bool)

(assert (=> b!265937 m!282633))

(declare-fun m!282635 () Bool)

(assert (=> b!265936 m!282635))

(declare-fun m!282637 () Bool)

(assert (=> b!265932 m!282637))

(declare-fun m!282639 () Bool)

(assert (=> b!265933 m!282639))

(push 1)

(assert (not start!25642))

(assert (not b!265932))

(assert (not b!265937))

(assert (not b!265936))

(assert (not b!265933))

(assert (not b!265934))

