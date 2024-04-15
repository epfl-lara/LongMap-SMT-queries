; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25766 () Bool)

(assert start!25766)

(declare-fun b!266946 () Bool)

(declare-fun res!131296 () Bool)

(declare-fun e!172606 () Bool)

(assert (=> b!266946 (=> (not res!131296) (not e!172606))))

(declare-datatypes ((array!12933 0))(
  ( (array!12934 (arr!6120 (Array (_ BitVec 32) (_ BitVec 64))) (size!6473 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12933)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266946 (= res!131296 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266947 () Bool)

(declare-fun res!131295 () Bool)

(assert (=> b!266947 (=> (not res!131295) (not e!172606))))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!266947 (= res!131295 (and (= (size!6473 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6473 a!3436))))))

(declare-fun b!266949 () Bool)

(declare-fun e!172608 () Bool)

(assert (=> b!266949 (= e!172606 e!172608)))

(declare-fun res!131297 () Bool)

(assert (=> b!266949 (=> (not res!131297) (not e!172608))))

(declare-datatypes ((SeekEntryResult!1310 0))(
  ( (MissingZero!1310 (index!7410 (_ BitVec 32))) (Found!1310 (index!7411 (_ BitVec 32))) (Intermediate!1310 (undefined!2122 Bool) (index!7412 (_ BitVec 32)) (x!25722 (_ BitVec 32))) (Undefined!1310) (MissingVacant!1310 (index!7413 (_ BitVec 32))) )
))
(declare-fun lt!134442 () SeekEntryResult!1310)

(assert (=> b!266949 (= res!131297 (or (= lt!134442 (MissingZero!1310 i!1355)) (= lt!134442 (MissingVacant!1310 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12933 (_ BitVec 32)) SeekEntryResult!1310)

(assert (=> b!266949 (= lt!134442 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266950 () Bool)

(declare-fun res!131299 () Bool)

(assert (=> b!266950 (=> (not res!131299) (not e!172608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12933 (_ BitVec 32)) Bool)

(assert (=> b!266950 (= res!131299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266951 () Bool)

(declare-fun res!131294 () Bool)

(assert (=> b!266951 (=> (not res!131294) (not e!172606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266951 (= res!131294 (validKeyInArray!0 k0!2698))))

(declare-fun res!131298 () Bool)

(assert (=> start!25766 (=> (not res!131298) (not e!172606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25766 (= res!131298 (validMask!0 mask!4002))))

(assert (=> start!25766 e!172606))

(assert (=> start!25766 true))

(declare-fun array_inv!4092 (array!12933) Bool)

(assert (=> start!25766 (array_inv!4092 a!3436)))

(declare-fun b!266948 () Bool)

(assert (=> b!266948 (= e!172608 false)))

(declare-fun lt!134441 () Bool)

(declare-datatypes ((List!3907 0))(
  ( (Nil!3904) (Cons!3903 (h!4570 (_ BitVec 64)) (t!8980 List!3907)) )
))
(declare-fun arrayNoDuplicates!0 (array!12933 (_ BitVec 32) List!3907) Bool)

(assert (=> b!266948 (= lt!134441 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3904))))

(assert (= (and start!25766 res!131298) b!266947))

(assert (= (and b!266947 res!131295) b!266951))

(assert (= (and b!266951 res!131294) b!266946))

(assert (= (and b!266946 res!131296) b!266949))

(assert (= (and b!266949 res!131297) b!266950))

(assert (= (and b!266950 res!131299) b!266948))

(declare-fun m!282947 () Bool)

(assert (=> b!266951 m!282947))

(declare-fun m!282949 () Bool)

(assert (=> b!266946 m!282949))

(declare-fun m!282951 () Bool)

(assert (=> b!266949 m!282951))

(declare-fun m!282953 () Bool)

(assert (=> b!266950 m!282953))

(declare-fun m!282955 () Bool)

(assert (=> b!266948 m!282955))

(declare-fun m!282957 () Bool)

(assert (=> start!25766 m!282957))

(declare-fun m!282959 () Bool)

(assert (=> start!25766 m!282959))

(check-sat (not b!266949) (not start!25766) (not b!266951) (not b!266946) (not b!266950) (not b!266948))
(check-sat)
