; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27522 () Bool)

(assert start!27522)

(declare-fun b!284432 () Bool)

(declare-fun res!146919 () Bool)

(declare-fun e!180443 () Bool)

(assert (=> b!284432 (=> (not res!146919) (not e!180443))))

(declare-datatypes ((array!14171 0))(
  ( (array!14172 (arr!6724 (Array (_ BitVec 32) (_ BitVec 64))) (size!7076 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14171)

(declare-datatypes ((List!4445 0))(
  ( (Nil!4442) (Cons!4441 (h!5114 (_ BitVec 64)) (t!9519 List!4445)) )
))
(declare-fun arrayNoDuplicates!0 (array!14171 (_ BitVec 32) List!4445) Bool)

(assert (=> b!284432 (= res!146919 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4442))))

(declare-fun b!284433 () Bool)

(declare-fun e!180442 () Bool)

(assert (=> b!284433 (= e!180442 false)))

(declare-fun lt!140562 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14171 (_ BitVec 32)) Bool)

(assert (=> b!284433 (= lt!140562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284434 () Bool)

(assert (=> b!284434 (= e!180443 e!180442)))

(declare-fun res!146914 () Bool)

(assert (=> b!284434 (=> (not res!146914) (not e!180442))))

(declare-datatypes ((SeekEntryResult!1847 0))(
  ( (MissingZero!1847 (index!9558 (_ BitVec 32))) (Found!1847 (index!9559 (_ BitVec 32))) (Intermediate!1847 (undefined!2659 Bool) (index!9560 (_ BitVec 32)) (x!27878 (_ BitVec 32))) (Undefined!1847) (MissingVacant!1847 (index!9561 (_ BitVec 32))) )
))
(declare-fun lt!140561 () SeekEntryResult!1847)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284434 (= res!146914 (or (= lt!140561 (MissingZero!1847 i!1267)) (= lt!140561 (MissingVacant!1847 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14171 (_ BitVec 32)) SeekEntryResult!1847)

(assert (=> b!284434 (= lt!140561 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284435 () Bool)

(declare-fun res!146918 () Bool)

(assert (=> b!284435 (=> (not res!146918) (not e!180443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284435 (= res!146918 (validKeyInArray!0 k0!2581))))

(declare-fun b!284436 () Bool)

(declare-fun res!146917 () Bool)

(assert (=> b!284436 (=> (not res!146917) (not e!180443))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284436 (= res!146917 (and (= (size!7076 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7076 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7076 a!3325))))))

(declare-fun res!146915 () Bool)

(assert (=> start!27522 (=> (not res!146915) (not e!180443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27522 (= res!146915 (validMask!0 mask!3868))))

(assert (=> start!27522 e!180443))

(declare-fun array_inv!4674 (array!14171) Bool)

(assert (=> start!27522 (array_inv!4674 a!3325)))

(assert (=> start!27522 true))

(declare-fun b!284437 () Bool)

(declare-fun res!146916 () Bool)

(assert (=> b!284437 (=> (not res!146916) (not e!180443))))

(declare-fun arrayContainsKey!0 (array!14171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284437 (= res!146916 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27522 res!146915) b!284436))

(assert (= (and b!284436 res!146917) b!284435))

(assert (= (and b!284435 res!146918) b!284432))

(assert (= (and b!284432 res!146919) b!284437))

(assert (= (and b!284437 res!146916) b!284434))

(assert (= (and b!284434 res!146914) b!284433))

(declare-fun m!299627 () Bool)

(assert (=> start!27522 m!299627))

(declare-fun m!299629 () Bool)

(assert (=> start!27522 m!299629))

(declare-fun m!299631 () Bool)

(assert (=> b!284435 m!299631))

(declare-fun m!299633 () Bool)

(assert (=> b!284434 m!299633))

(declare-fun m!299635 () Bool)

(assert (=> b!284432 m!299635))

(declare-fun m!299637 () Bool)

(assert (=> b!284433 m!299637))

(declare-fun m!299639 () Bool)

(assert (=> b!284437 m!299639))

(check-sat (not b!284432) (not start!27522) (not b!284434) (not b!284437) (not b!284433) (not b!284435))
(check-sat)
