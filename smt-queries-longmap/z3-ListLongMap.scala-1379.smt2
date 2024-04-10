; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27128 () Bool)

(assert start!27128)

(declare-fun b!280555 () Bool)

(declare-fun e!178580 () Bool)

(declare-fun e!178579 () Bool)

(assert (=> b!280555 (= e!178580 e!178579)))

(declare-fun res!143626 () Bool)

(assert (=> b!280555 (=> (not res!143626) (not e!178579))))

(declare-datatypes ((SeekEntryResult!1773 0))(
  ( (MissingZero!1773 (index!9262 (_ BitVec 32))) (Found!1773 (index!9263 (_ BitVec 32))) (Intermediate!1773 (undefined!2585 Bool) (index!9264 (_ BitVec 32)) (x!27499 (_ BitVec 32))) (Undefined!1773) (MissingVacant!1773 (index!9265 (_ BitVec 32))) )
))
(declare-fun lt!138852 () SeekEntryResult!1773)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280555 (= res!143626 (or (= lt!138852 (MissingZero!1773 i!1267)) (= lt!138852 (MissingVacant!1773 i!1267))))))

(declare-datatypes ((array!13946 0))(
  ( (array!13947 (arr!6615 (Array (_ BitVec 32) (_ BitVec 64))) (size!6967 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13946)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13946 (_ BitVec 32)) SeekEntryResult!1773)

(assert (=> b!280555 (= lt!138852 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280556 () Bool)

(declare-fun res!143624 () Bool)

(assert (=> b!280556 (=> (not res!143624) (not e!178580))))

(declare-datatypes ((List!4423 0))(
  ( (Nil!4420) (Cons!4419 (h!5089 (_ BitVec 64)) (t!9505 List!4423)) )
))
(declare-fun arrayNoDuplicates!0 (array!13946 (_ BitVec 32) List!4423) Bool)

(assert (=> b!280556 (= res!143624 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4420))))

(declare-fun b!280557 () Bool)

(declare-fun res!143627 () Bool)

(assert (=> b!280557 (=> (not res!143627) (not e!178579))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280557 (= res!143627 (validKeyInArray!0 (select (arr!6615 a!3325) startIndex!26)))))

(declare-fun b!280558 () Bool)

(declare-fun res!143631 () Bool)

(assert (=> b!280558 (=> (not res!143631) (not e!178579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13946 (_ BitVec 32)) Bool)

(assert (=> b!280558 (= res!143631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280559 () Bool)

(declare-fun res!143623 () Bool)

(assert (=> b!280559 (=> (not res!143623) (not e!178580))))

(declare-fun arrayContainsKey!0 (array!13946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280559 (= res!143623 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280560 () Bool)

(declare-fun res!143629 () Bool)

(assert (=> b!280560 (=> (not res!143629) (not e!178580))))

(assert (=> b!280560 (= res!143629 (and (= (size!6967 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6967 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6967 a!3325))))))

(declare-fun b!280561 () Bool)

(declare-fun res!143625 () Bool)

(assert (=> b!280561 (=> (not res!143625) (not e!178580))))

(assert (=> b!280561 (= res!143625 (validKeyInArray!0 k0!2581))))

(declare-fun b!280562 () Bool)

(declare-fun res!143630 () Bool)

(assert (=> b!280562 (=> (not res!143630) (not e!178579))))

(assert (=> b!280562 (= res!143630 (not (= startIndex!26 i!1267)))))

(declare-fun b!280554 () Bool)

(assert (=> b!280554 (= e!178579 (not true))))

(assert (=> b!280554 (arrayNoDuplicates!0 (array!13947 (store (arr!6615 a!3325) i!1267 k0!2581) (size!6967 a!3325)) #b00000000000000000000000000000000 Nil!4420)))

(declare-datatypes ((Unit!8830 0))(
  ( (Unit!8831) )
))
(declare-fun lt!138853 () Unit!8830)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13946 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4423) Unit!8830)

(assert (=> b!280554 (= lt!138853 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4420))))

(declare-fun res!143628 () Bool)

(assert (=> start!27128 (=> (not res!143628) (not e!178580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27128 (= res!143628 (validMask!0 mask!3868))))

(assert (=> start!27128 e!178580))

(declare-fun array_inv!4578 (array!13946) Bool)

(assert (=> start!27128 (array_inv!4578 a!3325)))

(assert (=> start!27128 true))

(assert (= (and start!27128 res!143628) b!280560))

(assert (= (and b!280560 res!143629) b!280561))

(assert (= (and b!280561 res!143625) b!280556))

(assert (= (and b!280556 res!143624) b!280559))

(assert (= (and b!280559 res!143623) b!280555))

(assert (= (and b!280555 res!143626) b!280558))

(assert (= (and b!280558 res!143631) b!280562))

(assert (= (and b!280562 res!143630) b!280557))

(assert (= (and b!280557 res!143627) b!280554))

(declare-fun m!294975 () Bool)

(assert (=> start!27128 m!294975))

(declare-fun m!294977 () Bool)

(assert (=> start!27128 m!294977))

(declare-fun m!294979 () Bool)

(assert (=> b!280561 m!294979))

(declare-fun m!294981 () Bool)

(assert (=> b!280556 m!294981))

(declare-fun m!294983 () Bool)

(assert (=> b!280557 m!294983))

(assert (=> b!280557 m!294983))

(declare-fun m!294985 () Bool)

(assert (=> b!280557 m!294985))

(declare-fun m!294987 () Bool)

(assert (=> b!280554 m!294987))

(declare-fun m!294989 () Bool)

(assert (=> b!280554 m!294989))

(declare-fun m!294991 () Bool)

(assert (=> b!280554 m!294991))

(declare-fun m!294993 () Bool)

(assert (=> b!280555 m!294993))

(declare-fun m!294995 () Bool)

(assert (=> b!280558 m!294995))

(declare-fun m!294997 () Bool)

(assert (=> b!280559 m!294997))

(check-sat (not start!27128) (not b!280555) (not b!280561) (not b!280556) (not b!280559) (not b!280558) (not b!280557) (not b!280554))
(check-sat)
