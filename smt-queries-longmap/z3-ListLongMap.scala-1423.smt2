; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27564 () Bool)

(assert start!27564)

(declare-fun b!284837 () Bool)

(declare-fun res!147321 () Bool)

(declare-fun e!180632 () Bool)

(assert (=> b!284837 (=> (not res!147321) (not e!180632))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284837 (= res!147321 (validKeyInArray!0 k0!2581))))

(declare-fun b!284838 () Bool)

(declare-fun e!180630 () Bool)

(assert (=> b!284838 (= e!180630 false)))

(declare-fun lt!140678 () Bool)

(declare-datatypes ((array!14213 0))(
  ( (array!14214 (arr!6745 (Array (_ BitVec 32) (_ BitVec 64))) (size!7097 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14213)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14213 (_ BitVec 32)) Bool)

(assert (=> b!284838 (= lt!140678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284839 () Bool)

(declare-fun res!147322 () Bool)

(assert (=> b!284839 (=> (not res!147322) (not e!180632))))

(declare-datatypes ((List!4466 0))(
  ( (Nil!4463) (Cons!4462 (h!5135 (_ BitVec 64)) (t!9540 List!4466)) )
))
(declare-fun arrayNoDuplicates!0 (array!14213 (_ BitVec 32) List!4466) Bool)

(assert (=> b!284839 (= res!147322 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4463))))

(declare-fun res!147320 () Bool)

(assert (=> start!27564 (=> (not res!147320) (not e!180632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27564 (= res!147320 (validMask!0 mask!3868))))

(assert (=> start!27564 e!180632))

(declare-fun array_inv!4695 (array!14213) Bool)

(assert (=> start!27564 (array_inv!4695 a!3325)))

(assert (=> start!27564 true))

(declare-fun b!284840 () Bool)

(declare-fun res!147324 () Bool)

(assert (=> b!284840 (=> (not res!147324) (not e!180632))))

(declare-fun arrayContainsKey!0 (array!14213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284840 (= res!147324 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284841 () Bool)

(declare-fun res!147319 () Bool)

(assert (=> b!284841 (=> (not res!147319) (not e!180632))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284841 (= res!147319 (and (= (size!7097 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7097 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7097 a!3325))))))

(declare-fun b!284842 () Bool)

(assert (=> b!284842 (= e!180632 e!180630)))

(declare-fun res!147323 () Bool)

(assert (=> b!284842 (=> (not res!147323) (not e!180630))))

(declare-datatypes ((SeekEntryResult!1868 0))(
  ( (MissingZero!1868 (index!9642 (_ BitVec 32))) (Found!1868 (index!9643 (_ BitVec 32))) (Intermediate!1868 (undefined!2680 Bool) (index!9644 (_ BitVec 32)) (x!27955 (_ BitVec 32))) (Undefined!1868) (MissingVacant!1868 (index!9645 (_ BitVec 32))) )
))
(declare-fun lt!140679 () SeekEntryResult!1868)

(assert (=> b!284842 (= res!147323 (or (= lt!140679 (MissingZero!1868 i!1267)) (= lt!140679 (MissingVacant!1868 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14213 (_ BitVec 32)) SeekEntryResult!1868)

(assert (=> b!284842 (= lt!140679 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27564 res!147320) b!284841))

(assert (= (and b!284841 res!147319) b!284837))

(assert (= (and b!284837 res!147321) b!284839))

(assert (= (and b!284839 res!147322) b!284840))

(assert (= (and b!284840 res!147324) b!284842))

(assert (= (and b!284842 res!147323) b!284838))

(declare-fun m!299933 () Bool)

(assert (=> start!27564 m!299933))

(declare-fun m!299935 () Bool)

(assert (=> start!27564 m!299935))

(declare-fun m!299937 () Bool)

(assert (=> b!284837 m!299937))

(declare-fun m!299939 () Bool)

(assert (=> b!284838 m!299939))

(declare-fun m!299941 () Bool)

(assert (=> b!284842 m!299941))

(declare-fun m!299943 () Bool)

(assert (=> b!284840 m!299943))

(declare-fun m!299945 () Bool)

(assert (=> b!284839 m!299945))

(check-sat (not b!284839) (not b!284837) (not b!284838) (not b!284840) (not b!284842) (not start!27564))
(check-sat)
