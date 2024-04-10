; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27644 () Bool)

(assert start!27644)

(declare-fun b!285363 () Bool)

(declare-fun res!147770 () Bool)

(declare-fun e!180896 () Bool)

(assert (=> b!285363 (=> (not res!147770) (not e!180896))))

(declare-datatypes ((array!14249 0))(
  ( (array!14250 (arr!6762 (Array (_ BitVec 32) (_ BitVec 64))) (size!7114 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14249)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!285363 (= res!147770 (and (= (size!7114 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7114 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7114 a!3325))))))

(declare-fun b!285364 () Bool)

(declare-fun res!147773 () Bool)

(assert (=> b!285364 (=> (not res!147773) (not e!180896))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285364 (= res!147773 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285365 () Bool)

(declare-fun e!180894 () Bool)

(assert (=> b!285365 (= e!180894 false)))

(declare-fun lt!140796 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14249 (_ BitVec 32)) Bool)

(assert (=> b!285365 (= lt!140796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147772 () Bool)

(assert (=> start!27644 (=> (not res!147772) (not e!180896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27644 (= res!147772 (validMask!0 mask!3868))))

(assert (=> start!27644 e!180896))

(declare-fun array_inv!4725 (array!14249) Bool)

(assert (=> start!27644 (array_inv!4725 a!3325)))

(assert (=> start!27644 true))

(declare-fun b!285366 () Bool)

(declare-fun res!147771 () Bool)

(assert (=> b!285366 (=> (not res!147771) (not e!180896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285366 (= res!147771 (validKeyInArray!0 k0!2581))))

(declare-fun b!285367 () Bool)

(assert (=> b!285367 (= e!180896 e!180894)))

(declare-fun res!147774 () Bool)

(assert (=> b!285367 (=> (not res!147774) (not e!180894))))

(declare-datatypes ((SeekEntryResult!1920 0))(
  ( (MissingZero!1920 (index!9850 (_ BitVec 32))) (Found!1920 (index!9851 (_ BitVec 32))) (Intermediate!1920 (undefined!2732 Bool) (index!9852 (_ BitVec 32)) (x!28047 (_ BitVec 32))) (Undefined!1920) (MissingVacant!1920 (index!9853 (_ BitVec 32))) )
))
(declare-fun lt!140797 () SeekEntryResult!1920)

(assert (=> b!285367 (= res!147774 (or (= lt!140797 (MissingZero!1920 i!1267)) (= lt!140797 (MissingVacant!1920 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14249 (_ BitVec 32)) SeekEntryResult!1920)

(assert (=> b!285367 (= lt!140797 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!285368 () Bool)

(declare-fun res!147769 () Bool)

(assert (=> b!285368 (=> (not res!147769) (not e!180896))))

(declare-datatypes ((List!4570 0))(
  ( (Nil!4567) (Cons!4566 (h!5239 (_ BitVec 64)) (t!9652 List!4570)) )
))
(declare-fun arrayNoDuplicates!0 (array!14249 (_ BitVec 32) List!4570) Bool)

(assert (=> b!285368 (= res!147769 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4567))))

(assert (= (and start!27644 res!147772) b!285363))

(assert (= (and b!285363 res!147770) b!285366))

(assert (= (and b!285366 res!147771) b!285368))

(assert (= (and b!285368 res!147769) b!285364))

(assert (= (and b!285364 res!147773) b!285367))

(assert (= (and b!285367 res!147774) b!285365))

(declare-fun m!300209 () Bool)

(assert (=> b!285365 m!300209))

(declare-fun m!300211 () Bool)

(assert (=> b!285366 m!300211))

(declare-fun m!300213 () Bool)

(assert (=> b!285368 m!300213))

(declare-fun m!300215 () Bool)

(assert (=> start!27644 m!300215))

(declare-fun m!300217 () Bool)

(assert (=> start!27644 m!300217))

(declare-fun m!300219 () Bool)

(assert (=> b!285364 m!300219))

(declare-fun m!300221 () Bool)

(assert (=> b!285367 m!300221))

(check-sat (not b!285364) (not b!285368) (not b!285367) (not b!285366) (not start!27644) (not b!285365))
(check-sat)
