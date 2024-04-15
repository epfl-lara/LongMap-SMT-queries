; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27578 () Bool)

(assert start!27578)

(declare-fun b!284757 () Bool)

(declare-fun res!147319 () Bool)

(declare-fun e!180559 () Bool)

(assert (=> b!284757 (=> (not res!147319) (not e!180559))))

(declare-datatypes ((array!14217 0))(
  ( (array!14218 (arr!6747 (Array (_ BitVec 32) (_ BitVec 64))) (size!7100 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14217)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284757 (= res!147319 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147322 () Bool)

(assert (=> start!27578 (=> (not res!147322) (not e!180559))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27578 (= res!147322 (validMask!0 mask!3868))))

(assert (=> start!27578 e!180559))

(declare-fun array_inv!4719 (array!14217) Bool)

(assert (=> start!27578 (array_inv!4719 a!3325)))

(assert (=> start!27578 true))

(declare-fun b!284758 () Bool)

(declare-fun res!147323 () Bool)

(declare-fun e!180560 () Bool)

(assert (=> b!284758 (=> (not res!147323) (not e!180560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14217 (_ BitVec 32)) Bool)

(assert (=> b!284758 (= res!147323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284759 () Bool)

(declare-fun res!147318 () Bool)

(assert (=> b!284759 (=> (not res!147318) (not e!180559))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284759 (= res!147318 (and (= (size!7100 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7100 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7100 a!3325))))))

(declare-fun b!284760 () Bool)

(declare-fun res!147325 () Bool)

(assert (=> b!284760 (=> (not res!147325) (not e!180559))))

(declare-datatypes ((List!4528 0))(
  ( (Nil!4525) (Cons!4524 (h!5197 (_ BitVec 64)) (t!9601 List!4528)) )
))
(declare-fun arrayNoDuplicates!0 (array!14217 (_ BitVec 32) List!4528) Bool)

(assert (=> b!284760 (= res!147325 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4525))))

(declare-fun b!284761 () Bool)

(declare-fun res!147317 () Bool)

(assert (=> b!284761 (=> (not res!147317) (not e!180560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284761 (= res!147317 (not (validKeyInArray!0 (select (arr!6747 a!3325) startIndex!26))))))

(declare-fun b!284762 () Bool)

(declare-fun res!147324 () Bool)

(assert (=> b!284762 (=> (not res!147324) (not e!180560))))

(assert (=> b!284762 (= res!147324 (not (= startIndex!26 i!1267)))))

(declare-fun b!284763 () Bool)

(assert (=> b!284763 (= e!180559 e!180560)))

(declare-fun res!147321 () Bool)

(assert (=> b!284763 (=> (not res!147321) (not e!180560))))

(declare-datatypes ((SeekEntryResult!1904 0))(
  ( (MissingZero!1904 (index!9786 (_ BitVec 32))) (Found!1904 (index!9787 (_ BitVec 32))) (Intermediate!1904 (undefined!2716 Bool) (index!9788 (_ BitVec 32)) (x!28006 (_ BitVec 32))) (Undefined!1904) (MissingVacant!1904 (index!9789 (_ BitVec 32))) )
))
(declare-fun lt!140472 () SeekEntryResult!1904)

(assert (=> b!284763 (= res!147321 (or (= lt!140472 (MissingZero!1904 i!1267)) (= lt!140472 (MissingVacant!1904 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14217 (_ BitVec 32)) SeekEntryResult!1904)

(assert (=> b!284763 (= lt!140472 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284764 () Bool)

(assert (=> b!284764 (= e!180560 (and (bvslt startIndex!26 (bvsub (size!7100 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!7100 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7100 a!3325) startIndex!26))))))

(declare-fun b!284765 () Bool)

(declare-fun res!147320 () Bool)

(assert (=> b!284765 (=> (not res!147320) (not e!180559))))

(assert (=> b!284765 (= res!147320 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27578 res!147322) b!284759))

(assert (= (and b!284759 res!147318) b!284765))

(assert (= (and b!284765 res!147320) b!284760))

(assert (= (and b!284760 res!147325) b!284757))

(assert (= (and b!284757 res!147319) b!284763))

(assert (= (and b!284763 res!147321) b!284758))

(assert (= (and b!284758 res!147323) b!284762))

(assert (= (and b!284762 res!147324) b!284761))

(assert (= (and b!284761 res!147317) b!284764))

(declare-fun m!299219 () Bool)

(assert (=> b!284758 m!299219))

(declare-fun m!299221 () Bool)

(assert (=> b!284760 m!299221))

(declare-fun m!299223 () Bool)

(assert (=> b!284763 m!299223))

(declare-fun m!299225 () Bool)

(assert (=> start!27578 m!299225))

(declare-fun m!299227 () Bool)

(assert (=> start!27578 m!299227))

(declare-fun m!299229 () Bool)

(assert (=> b!284765 m!299229))

(declare-fun m!299231 () Bool)

(assert (=> b!284757 m!299231))

(declare-fun m!299233 () Bool)

(assert (=> b!284761 m!299233))

(assert (=> b!284761 m!299233))

(declare-fun m!299235 () Bool)

(assert (=> b!284761 m!299235))

(check-sat (not b!284758) (not b!284760) (not b!284763) (not b!284757) (not b!284761) (not start!27578) (not b!284765))
(check-sat)
