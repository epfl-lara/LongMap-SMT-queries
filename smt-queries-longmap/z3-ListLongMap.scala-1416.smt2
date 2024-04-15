; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27524 () Bool)

(assert start!27524)

(declare-fun b!284238 () Bool)

(declare-fun res!146801 () Bool)

(declare-fun e!180317 () Bool)

(assert (=> b!284238 (=> (not res!146801) (not e!180317))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284238 (= res!146801 (validKeyInArray!0 k0!2581))))

(declare-fun res!146800 () Bool)

(assert (=> start!27524 (=> (not res!146800) (not e!180317))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27524 (= res!146800 (validMask!0 mask!3868))))

(assert (=> start!27524 e!180317))

(declare-datatypes ((array!14163 0))(
  ( (array!14164 (arr!6720 (Array (_ BitVec 32) (_ BitVec 64))) (size!7073 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14163)

(declare-fun array_inv!4692 (array!14163) Bool)

(assert (=> start!27524 (array_inv!4692 a!3325)))

(assert (=> start!27524 true))

(declare-fun b!284239 () Bool)

(declare-fun e!180316 () Bool)

(assert (=> b!284239 (= e!180317 e!180316)))

(declare-fun res!146799 () Bool)

(assert (=> b!284239 (=> (not res!146799) (not e!180316))))

(declare-datatypes ((SeekEntryResult!1877 0))(
  ( (MissingZero!1877 (index!9678 (_ BitVec 32))) (Found!1877 (index!9679 (_ BitVec 32))) (Intermediate!1877 (undefined!2689 Bool) (index!9680 (_ BitVec 32)) (x!27907 (_ BitVec 32))) (Undefined!1877) (MissingVacant!1877 (index!9681 (_ BitVec 32))) )
))
(declare-fun lt!140322 () SeekEntryResult!1877)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284239 (= res!146799 (or (= lt!140322 (MissingZero!1877 i!1267)) (= lt!140322 (MissingVacant!1877 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14163 (_ BitVec 32)) SeekEntryResult!1877)

(assert (=> b!284239 (= lt!140322 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284240 () Bool)

(declare-fun res!146803 () Bool)

(assert (=> b!284240 (=> (not res!146803) (not e!180317))))

(declare-fun arrayContainsKey!0 (array!14163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284240 (= res!146803 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284241 () Bool)

(assert (=> b!284241 (= e!180316 false)))

(declare-fun lt!140321 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14163 (_ BitVec 32)) Bool)

(assert (=> b!284241 (= lt!140321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284242 () Bool)

(declare-fun res!146802 () Bool)

(assert (=> b!284242 (=> (not res!146802) (not e!180317))))

(declare-datatypes ((List!4501 0))(
  ( (Nil!4498) (Cons!4497 (h!5170 (_ BitVec 64)) (t!9574 List!4501)) )
))
(declare-fun arrayNoDuplicates!0 (array!14163 (_ BitVec 32) List!4501) Bool)

(assert (=> b!284242 (= res!146802 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4498))))

(declare-fun b!284243 () Bool)

(declare-fun res!146798 () Bool)

(assert (=> b!284243 (=> (not res!146798) (not e!180317))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284243 (= res!146798 (and (= (size!7073 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7073 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7073 a!3325))))))

(assert (= (and start!27524 res!146800) b!284243))

(assert (= (and b!284243 res!146798) b!284238))

(assert (= (and b!284238 res!146801) b!284242))

(assert (= (and b!284242 res!146802) b!284240))

(assert (= (and b!284240 res!146803) b!284239))

(assert (= (and b!284239 res!146799) b!284241))

(declare-fun m!298829 () Bool)

(assert (=> b!284240 m!298829))

(declare-fun m!298831 () Bool)

(assert (=> start!27524 m!298831))

(declare-fun m!298833 () Bool)

(assert (=> start!27524 m!298833))

(declare-fun m!298835 () Bool)

(assert (=> b!284242 m!298835))

(declare-fun m!298837 () Bool)

(assert (=> b!284238 m!298837))

(declare-fun m!298839 () Bool)

(assert (=> b!284239 m!298839))

(declare-fun m!298841 () Bool)

(assert (=> b!284241 m!298841))

(check-sat (not b!284242) (not b!284239) (not start!27524) (not b!284241) (not b!284238) (not b!284240))
(check-sat)
