; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25664 () Bool)

(assert start!25664)

(declare-fun b!265947 () Bool)

(declare-fun res!130296 () Bool)

(declare-fun e!172148 () Bool)

(assert (=> b!265947 (=> (not res!130296) (not e!172148))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265947 (= res!130296 (validKeyInArray!0 k0!2698))))

(declare-fun b!265948 () Bool)

(declare-fun res!130299 () Bool)

(declare-fun e!172149 () Bool)

(assert (=> b!265948 (=> (not res!130299) (not e!172149))))

(declare-datatypes ((array!12831 0))(
  ( (array!12832 (arr!6069 (Array (_ BitVec 32) (_ BitVec 64))) (size!6422 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12831)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12831 (_ BitVec 32)) Bool)

(assert (=> b!265948 (= res!130299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265949 () Bool)

(assert (=> b!265949 (= e!172148 e!172149)))

(declare-fun res!130297 () Bool)

(assert (=> b!265949 (=> (not res!130297) (not e!172149))))

(declare-datatypes ((SeekEntryResult!1259 0))(
  ( (MissingZero!1259 (index!7206 (_ BitVec 32))) (Found!1259 (index!7207 (_ BitVec 32))) (Intermediate!1259 (undefined!2071 Bool) (index!7208 (_ BitVec 32)) (x!25535 (_ BitVec 32))) (Undefined!1259) (MissingVacant!1259 (index!7209 (_ BitVec 32))) )
))
(declare-fun lt!134145 () SeekEntryResult!1259)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265949 (= res!130297 (or (= lt!134145 (MissingZero!1259 i!1355)) (= lt!134145 (MissingVacant!1259 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12831 (_ BitVec 32)) SeekEntryResult!1259)

(assert (=> b!265949 (= lt!134145 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265950 () Bool)

(assert (=> b!265950 (= e!172149 false)))

(declare-fun lt!134144 () Bool)

(declare-datatypes ((List!3856 0))(
  ( (Nil!3853) (Cons!3852 (h!4519 (_ BitVec 64)) (t!8929 List!3856)) )
))
(declare-fun arrayNoDuplicates!0 (array!12831 (_ BitVec 32) List!3856) Bool)

(assert (=> b!265950 (= lt!134144 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3853))))

(declare-fun b!265951 () Bool)

(declare-fun res!130298 () Bool)

(assert (=> b!265951 (=> (not res!130298) (not e!172148))))

(declare-fun arrayContainsKey!0 (array!12831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265951 (= res!130298 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130300 () Bool)

(assert (=> start!25664 (=> (not res!130300) (not e!172148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25664 (= res!130300 (validMask!0 mask!4002))))

(assert (=> start!25664 e!172148))

(assert (=> start!25664 true))

(declare-fun array_inv!4041 (array!12831) Bool)

(assert (=> start!25664 (array_inv!4041 a!3436)))

(declare-fun b!265952 () Bool)

(declare-fun res!130295 () Bool)

(assert (=> b!265952 (=> (not res!130295) (not e!172148))))

(assert (=> b!265952 (= res!130295 (and (= (size!6422 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6422 a!3436))))))

(assert (= (and start!25664 res!130300) b!265952))

(assert (= (and b!265952 res!130295) b!265947))

(assert (= (and b!265947 res!130296) b!265951))

(assert (= (and b!265951 res!130298) b!265949))

(assert (= (and b!265949 res!130297) b!265948))

(assert (= (and b!265948 res!130299) b!265950))

(declare-fun m!282161 () Bool)

(assert (=> b!265947 m!282161))

(declare-fun m!282163 () Bool)

(assert (=> start!25664 m!282163))

(declare-fun m!282165 () Bool)

(assert (=> start!25664 m!282165))

(declare-fun m!282167 () Bool)

(assert (=> b!265949 m!282167))

(declare-fun m!282169 () Bool)

(assert (=> b!265948 m!282169))

(declare-fun m!282171 () Bool)

(assert (=> b!265950 m!282171))

(declare-fun m!282173 () Bool)

(assert (=> b!265951 m!282173))

(check-sat (not b!265949) (not b!265950) (not start!25664) (not b!265948) (not b!265947) (not b!265951))
(check-sat)
