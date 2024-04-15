; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27152 () Bool)

(assert start!27152)

(declare-fun b!280704 () Bool)

(declare-fun e!178576 () Bool)

(declare-fun e!178577 () Bool)

(assert (=> b!280704 (= e!178576 e!178577)))

(declare-fun res!143830 () Bool)

(assert (=> b!280704 (=> (not res!143830) (not e!178577))))

(declare-datatypes ((SeekEntryResult!1778 0))(
  ( (MissingZero!1778 (index!9282 (_ BitVec 32))) (Found!1778 (index!9283 (_ BitVec 32))) (Intermediate!1778 (undefined!2590 Bool) (index!9284 (_ BitVec 32)) (x!27535 (_ BitVec 32))) (Undefined!1778) (MissingVacant!1778 (index!9285 (_ BitVec 32))) )
))
(declare-fun lt!138737 () SeekEntryResult!1778)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280704 (= res!143830 (or (= lt!138737 (MissingZero!1778 i!1267)) (= lt!138737 (MissingVacant!1778 i!1267))))))

(declare-datatypes ((array!13959 0))(
  ( (array!13960 (arr!6621 (Array (_ BitVec 32) (_ BitVec 64))) (size!6974 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13959)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13959 (_ BitVec 32)) SeekEntryResult!1778)

(assert (=> b!280704 (= lt!138737 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280705 () Bool)

(declare-fun res!143832 () Bool)

(assert (=> b!280705 (=> (not res!143832) (not e!178576))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280705 (= res!143832 (and (= (size!6974 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6974 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6974 a!3325))))))

(declare-fun b!280706 () Bool)

(declare-fun res!143827 () Bool)

(assert (=> b!280706 (=> (not res!143827) (not e!178576))))

(declare-fun arrayContainsKey!0 (array!13959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280706 (= res!143827 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!143825 () Bool)

(assert (=> start!27152 (=> (not res!143825) (not e!178576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27152 (= res!143825 (validMask!0 mask!3868))))

(assert (=> start!27152 e!178576))

(declare-fun array_inv!4593 (array!13959) Bool)

(assert (=> start!27152 (array_inv!4593 a!3325)))

(assert (=> start!27152 true))

(declare-fun b!280707 () Bool)

(assert (=> b!280707 (= e!178577 (not true))))

(declare-datatypes ((List!4402 0))(
  ( (Nil!4399) (Cons!4398 (h!5068 (_ BitVec 64)) (t!9475 List!4402)) )
))
(declare-fun arrayNoDuplicates!0 (array!13959 (_ BitVec 32) List!4402) Bool)

(assert (=> b!280707 (arrayNoDuplicates!0 (array!13960 (store (arr!6621 a!3325) i!1267 k0!2581) (size!6974 a!3325)) #b00000000000000000000000000000000 Nil!4399)))

(declare-datatypes ((Unit!8802 0))(
  ( (Unit!8803) )
))
(declare-fun lt!138738 () Unit!8802)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13959 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4402) Unit!8802)

(assert (=> b!280707 (= lt!138738 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4399))))

(declare-fun b!280708 () Bool)

(declare-fun res!143829 () Bool)

(assert (=> b!280708 (=> (not res!143829) (not e!178576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280708 (= res!143829 (validKeyInArray!0 k0!2581))))

(declare-fun b!280709 () Bool)

(declare-fun res!143828 () Bool)

(assert (=> b!280709 (=> (not res!143828) (not e!178577))))

(assert (=> b!280709 (= res!143828 (validKeyInArray!0 (select (arr!6621 a!3325) startIndex!26)))))

(declare-fun b!280710 () Bool)

(declare-fun res!143831 () Bool)

(assert (=> b!280710 (=> (not res!143831) (not e!178577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13959 (_ BitVec 32)) Bool)

(assert (=> b!280710 (= res!143831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280711 () Bool)

(declare-fun res!143826 () Bool)

(assert (=> b!280711 (=> (not res!143826) (not e!178577))))

(assert (=> b!280711 (= res!143826 (not (= startIndex!26 i!1267)))))

(declare-fun b!280712 () Bool)

(declare-fun res!143833 () Bool)

(assert (=> b!280712 (=> (not res!143833) (not e!178576))))

(assert (=> b!280712 (= res!143833 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4399))))

(assert (= (and start!27152 res!143825) b!280705))

(assert (= (and b!280705 res!143832) b!280708))

(assert (= (and b!280708 res!143829) b!280712))

(assert (= (and b!280712 res!143833) b!280706))

(assert (= (and b!280706 res!143827) b!280704))

(assert (= (and b!280704 res!143830) b!280710))

(assert (= (and b!280710 res!143831) b!280711))

(assert (= (and b!280711 res!143826) b!280709))

(assert (= (and b!280709 res!143828) b!280707))

(declare-fun m!294647 () Bool)

(assert (=> b!280710 m!294647))

(declare-fun m!294649 () Bool)

(assert (=> b!280712 m!294649))

(declare-fun m!294651 () Bool)

(assert (=> b!280704 m!294651))

(declare-fun m!294653 () Bool)

(assert (=> b!280708 m!294653))

(declare-fun m!294655 () Bool)

(assert (=> b!280707 m!294655))

(declare-fun m!294657 () Bool)

(assert (=> b!280707 m!294657))

(declare-fun m!294659 () Bool)

(assert (=> b!280707 m!294659))

(declare-fun m!294661 () Bool)

(assert (=> b!280706 m!294661))

(declare-fun m!294663 () Bool)

(assert (=> start!27152 m!294663))

(declare-fun m!294665 () Bool)

(assert (=> start!27152 m!294665))

(declare-fun m!294667 () Bool)

(assert (=> b!280709 m!294667))

(assert (=> b!280709 m!294667))

(declare-fun m!294669 () Bool)

(assert (=> b!280709 m!294669))

(check-sat (not b!280709) (not b!280706) (not start!27152) (not b!280712) (not b!280710) (not b!280708) (not b!280707) (not b!280704))
(check-sat)
