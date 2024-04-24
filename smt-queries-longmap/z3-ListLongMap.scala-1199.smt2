; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25664 () Bool)

(assert start!25664)

(declare-fun res!130415 () Bool)

(declare-fun e!172274 () Bool)

(assert (=> start!25664 (=> (not res!130415) (not e!172274))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25664 (= res!130415 (validMask!0 mask!4002))))

(assert (=> start!25664 e!172274))

(assert (=> start!25664 true))

(declare-datatypes ((array!12838 0))(
  ( (array!12839 (arr!6073 (Array (_ BitVec 32) (_ BitVec 64))) (size!6425 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12838)

(declare-fun array_inv!4023 (array!12838) Bool)

(assert (=> start!25664 (array_inv!4023 a!3436)))

(declare-fun b!266141 () Bool)

(declare-fun res!130414 () Bool)

(declare-fun e!172272 () Bool)

(assert (=> b!266141 (=> (not res!130414) (not e!172272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12838 (_ BitVec 32)) Bool)

(assert (=> b!266141 (= res!130414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266142 () Bool)

(declare-fun res!130413 () Bool)

(assert (=> b!266142 (=> (not res!130413) (not e!172274))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266142 (= res!130413 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266143 () Bool)

(declare-fun res!130411 () Bool)

(assert (=> b!266143 (=> (not res!130411) (not e!172274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266143 (= res!130411 (validKeyInArray!0 k0!2698))))

(declare-fun b!266144 () Bool)

(assert (=> b!266144 (= e!172272 false)))

(declare-fun lt!134384 () Bool)

(declare-datatypes ((List!3800 0))(
  ( (Nil!3797) (Cons!3796 (h!4463 (_ BitVec 64)) (t!8874 List!3800)) )
))
(declare-fun arrayNoDuplicates!0 (array!12838 (_ BitVec 32) List!3800) Bool)

(assert (=> b!266144 (= lt!134384 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3797))))

(declare-fun b!266145 () Bool)

(assert (=> b!266145 (= e!172274 e!172272)))

(declare-fun res!130416 () Bool)

(assert (=> b!266145 (=> (not res!130416) (not e!172272))))

(declare-datatypes ((SeekEntryResult!1229 0))(
  ( (MissingZero!1229 (index!7086 (_ BitVec 32))) (Found!1229 (index!7087 (_ BitVec 32))) (Intermediate!1229 (undefined!2041 Bool) (index!7088 (_ BitVec 32)) (x!25506 (_ BitVec 32))) (Undefined!1229) (MissingVacant!1229 (index!7089 (_ BitVec 32))) )
))
(declare-fun lt!134385 () SeekEntryResult!1229)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266145 (= res!130416 (or (= lt!134385 (MissingZero!1229 i!1355)) (= lt!134385 (MissingVacant!1229 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12838 (_ BitVec 32)) SeekEntryResult!1229)

(assert (=> b!266145 (= lt!134385 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266146 () Bool)

(declare-fun res!130412 () Bool)

(assert (=> b!266146 (=> (not res!130412) (not e!172274))))

(assert (=> b!266146 (= res!130412 (and (= (size!6425 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6425 a!3436))))))

(assert (= (and start!25664 res!130415) b!266146))

(assert (= (and b!266146 res!130412) b!266143))

(assert (= (and b!266143 res!130411) b!266142))

(assert (= (and b!266142 res!130413) b!266145))

(assert (= (and b!266145 res!130416) b!266141))

(assert (= (and b!266141 res!130414) b!266144))

(declare-fun m!282959 () Bool)

(assert (=> start!25664 m!282959))

(declare-fun m!282961 () Bool)

(assert (=> start!25664 m!282961))

(declare-fun m!282963 () Bool)

(assert (=> b!266141 m!282963))

(declare-fun m!282965 () Bool)

(assert (=> b!266143 m!282965))

(declare-fun m!282967 () Bool)

(assert (=> b!266142 m!282967))

(declare-fun m!282969 () Bool)

(assert (=> b!266145 m!282969))

(declare-fun m!282971 () Bool)

(assert (=> b!266144 m!282971))

(check-sat (not b!266143) (not b!266144) (not start!25664) (not b!266145) (not b!266142) (not b!266141))
(check-sat)
