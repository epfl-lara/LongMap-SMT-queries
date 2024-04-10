; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25640 () Bool)

(assert start!25640)

(declare-fun b!265914 () Bool)

(declare-fun res!130213 () Bool)

(declare-fun e!172158 () Bool)

(assert (=> b!265914 (=> (not res!130213) (not e!172158))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265914 (= res!130213 (validKeyInArray!0 k!2698))))

(declare-fun b!265915 () Bool)

(declare-fun res!130211 () Bool)

(assert (=> b!265915 (=> (not res!130211) (not e!172158))))

(declare-datatypes ((array!12819 0))(
  ( (array!12820 (arr!6064 (Array (_ BitVec 32) (_ BitVec 64))) (size!6416 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12819)

(declare-fun arrayContainsKey!0 (array!12819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265915 (= res!130211 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265916 () Bool)

(declare-fun e!172159 () Bool)

(assert (=> b!265916 (= e!172159 false)))

(declare-fun lt!134265 () Bool)

(declare-datatypes ((List!3878 0))(
  ( (Nil!3875) (Cons!3874 (h!4541 (_ BitVec 64)) (t!8960 List!3878)) )
))
(declare-fun arrayNoDuplicates!0 (array!12819 (_ BitVec 32) List!3878) Bool)

(assert (=> b!265916 (= lt!134265 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3875))))

(declare-fun b!265917 () Bool)

(declare-fun res!130210 () Bool)

(assert (=> b!265917 (=> (not res!130210) (not e!172159))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12819 (_ BitVec 32)) Bool)

(assert (=> b!265917 (= res!130210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265918 () Bool)

(declare-fun res!130214 () Bool)

(assert (=> b!265918 (=> (not res!130214) (not e!172158))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265918 (= res!130214 (and (= (size!6416 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6416 a!3436))))))

(declare-fun b!265919 () Bool)

(assert (=> b!265919 (= e!172158 e!172159)))

(declare-fun res!130212 () Bool)

(assert (=> b!265919 (=> (not res!130212) (not e!172159))))

(declare-datatypes ((SeekEntryResult!1255 0))(
  ( (MissingZero!1255 (index!7190 (_ BitVec 32))) (Found!1255 (index!7191 (_ BitVec 32))) (Intermediate!1255 (undefined!2067 Bool) (index!7192 (_ BitVec 32)) (x!25500 (_ BitVec 32))) (Undefined!1255) (MissingVacant!1255 (index!7193 (_ BitVec 32))) )
))
(declare-fun lt!134266 () SeekEntryResult!1255)

(assert (=> b!265919 (= res!130212 (or (= lt!134266 (MissingZero!1255 i!1355)) (= lt!134266 (MissingVacant!1255 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12819 (_ BitVec 32)) SeekEntryResult!1255)

(assert (=> b!265919 (= lt!134266 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!130215 () Bool)

(assert (=> start!25640 (=> (not res!130215) (not e!172158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25640 (= res!130215 (validMask!0 mask!4002))))

(assert (=> start!25640 e!172158))

(assert (=> start!25640 true))

(declare-fun array_inv!4027 (array!12819) Bool)

(assert (=> start!25640 (array_inv!4027 a!3436)))

(assert (= (and start!25640 res!130215) b!265918))

(assert (= (and b!265918 res!130214) b!265914))

(assert (= (and b!265914 res!130213) b!265915))

(assert (= (and b!265915 res!130211) b!265919))

(assert (= (and b!265919 res!130212) b!265917))

(assert (= (and b!265917 res!130210) b!265916))

(declare-fun m!282613 () Bool)

(assert (=> b!265917 m!282613))

(declare-fun m!282615 () Bool)

(assert (=> b!265919 m!282615))

(declare-fun m!282617 () Bool)

(assert (=> b!265916 m!282617))

(declare-fun m!282619 () Bool)

(assert (=> b!265914 m!282619))

(declare-fun m!282621 () Bool)

(assert (=> start!25640 m!282621))

(declare-fun m!282623 () Bool)

(assert (=> start!25640 m!282623))

(declare-fun m!282625 () Bool)

(assert (=> b!265915 m!282625))

(push 1)

(assert (not b!265915))

(assert (not b!265919))

(assert (not b!265914))

(assert (not start!25640))

(assert (not b!265917))

(assert (not b!265916))

(check-sat)

