; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27506 () Bool)

(assert start!27506)

(declare-fun b!284241 () Bool)

(declare-fun res!146751 () Bool)

(declare-fun e!180347 () Bool)

(assert (=> b!284241 (=> (not res!146751) (not e!180347))))

(declare-datatypes ((array!14156 0))(
  ( (array!14157 (arr!6717 (Array (_ BitVec 32) (_ BitVec 64))) (size!7069 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14156)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284241 (= res!146751 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284242 () Bool)

(declare-fun res!146749 () Bool)

(assert (=> b!284242 (=> (not res!146749) (not e!180347))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284242 (= res!146749 (and (= (size!7069 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7069 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7069 a!3325))))))

(declare-fun b!284243 () Bool)

(declare-fun res!146750 () Bool)

(assert (=> b!284243 (=> (not res!146750) (not e!180347))))

(declare-datatypes ((List!4525 0))(
  ( (Nil!4522) (Cons!4521 (h!5194 (_ BitVec 64)) (t!9607 List!4525)) )
))
(declare-fun arrayNoDuplicates!0 (array!14156 (_ BitVec 32) List!4525) Bool)

(assert (=> b!284243 (= res!146750 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4522))))

(declare-fun b!284244 () Bool)

(declare-fun e!180346 () Bool)

(assert (=> b!284244 (= e!180346 false)))

(declare-fun lt!140455 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14156 (_ BitVec 32)) Bool)

(assert (=> b!284244 (= lt!140455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!146754 () Bool)

(assert (=> start!27506 (=> (not res!146754) (not e!180347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27506 (= res!146754 (validMask!0 mask!3868))))

(assert (=> start!27506 e!180347))

(declare-fun array_inv!4680 (array!14156) Bool)

(assert (=> start!27506 (array_inv!4680 a!3325)))

(assert (=> start!27506 true))

(declare-fun b!284245 () Bool)

(declare-fun res!146752 () Bool)

(assert (=> b!284245 (=> (not res!146752) (not e!180347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284245 (= res!146752 (validKeyInArray!0 k0!2581))))

(declare-fun b!284246 () Bool)

(assert (=> b!284246 (= e!180347 e!180346)))

(declare-fun res!146753 () Bool)

(assert (=> b!284246 (=> (not res!146753) (not e!180346))))

(declare-datatypes ((SeekEntryResult!1875 0))(
  ( (MissingZero!1875 (index!9670 (_ BitVec 32))) (Found!1875 (index!9671 (_ BitVec 32))) (Intermediate!1875 (undefined!2687 Bool) (index!9672 (_ BitVec 32)) (x!27882 (_ BitVec 32))) (Undefined!1875) (MissingVacant!1875 (index!9673 (_ BitVec 32))) )
))
(declare-fun lt!140454 () SeekEntryResult!1875)

(assert (=> b!284246 (= res!146753 (or (= lt!140454 (MissingZero!1875 i!1267)) (= lt!140454 (MissingVacant!1875 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14156 (_ BitVec 32)) SeekEntryResult!1875)

(assert (=> b!284246 (= lt!140454 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27506 res!146754) b!284242))

(assert (= (and b!284242 res!146749) b!284245))

(assert (= (and b!284245 res!146752) b!284243))

(assert (= (and b!284243 res!146750) b!284241))

(assert (= (and b!284241 res!146751) b!284246))

(assert (= (and b!284246 res!146753) b!284244))

(declare-fun m!299309 () Bool)

(assert (=> b!284241 m!299309))

(declare-fun m!299311 () Bool)

(assert (=> b!284245 m!299311))

(declare-fun m!299313 () Bool)

(assert (=> start!27506 m!299313))

(declare-fun m!299315 () Bool)

(assert (=> start!27506 m!299315))

(declare-fun m!299317 () Bool)

(assert (=> b!284244 m!299317))

(declare-fun m!299319 () Bool)

(assert (=> b!284243 m!299319))

(declare-fun m!299321 () Bool)

(assert (=> b!284246 m!299321))

(check-sat (not b!284241) (not b!284245) (not b!284243) (not b!284244) (not b!284246) (not start!27506))
(check-sat)
