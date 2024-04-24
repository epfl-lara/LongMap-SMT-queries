; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27126 () Bool)

(assert start!27126)

(declare-fun b!280574 () Bool)

(declare-fun res!143624 () Bool)

(declare-fun e!178594 () Bool)

(assert (=> b!280574 (=> (not res!143624) (not e!178594))))

(declare-datatypes ((array!13943 0))(
  ( (array!13944 (arr!6613 (Array (_ BitVec 32) (_ BitVec 64))) (size!6965 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13943)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280574 (= res!143624 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280575 () Bool)

(declare-fun res!143617 () Bool)

(declare-fun e!178593 () Bool)

(assert (=> b!280575 (=> (not res!143617) (not e!178593))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280575 (= res!143617 (validKeyInArray!0 (select (arr!6613 a!3325) startIndex!26)))))

(declare-fun res!143621 () Bool)

(assert (=> start!27126 (=> (not res!143621) (not e!178594))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27126 (= res!143621 (validMask!0 mask!3868))))

(assert (=> start!27126 e!178594))

(declare-fun array_inv!4563 (array!13943) Bool)

(assert (=> start!27126 (array_inv!4563 a!3325)))

(assert (=> start!27126 true))

(declare-fun b!280576 () Bool)

(assert (=> b!280576 (= e!178594 e!178593)))

(declare-fun res!143625 () Bool)

(assert (=> b!280576 (=> (not res!143625) (not e!178593))))

(declare-datatypes ((SeekEntryResult!1736 0))(
  ( (MissingZero!1736 (index!9114 (_ BitVec 32))) (Found!1736 (index!9115 (_ BitVec 32))) (Intermediate!1736 (undefined!2548 Bool) (index!9116 (_ BitVec 32)) (x!27462 (_ BitVec 32))) (Undefined!1736) (MissingVacant!1736 (index!9117 (_ BitVec 32))) )
))
(declare-fun lt!138905 () SeekEntryResult!1736)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280576 (= res!143625 (or (= lt!138905 (MissingZero!1736 i!1267)) (= lt!138905 (MissingVacant!1736 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13943 (_ BitVec 32)) SeekEntryResult!1736)

(assert (=> b!280576 (= lt!138905 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280577 () Bool)

(declare-fun res!143619 () Bool)

(assert (=> b!280577 (=> (not res!143619) (not e!178594))))

(declare-datatypes ((List!4334 0))(
  ( (Nil!4331) (Cons!4330 (h!5000 (_ BitVec 64)) (t!9408 List!4334)) )
))
(declare-fun arrayNoDuplicates!0 (array!13943 (_ BitVec 32) List!4334) Bool)

(assert (=> b!280577 (= res!143619 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4331))))

(declare-fun b!280578 () Bool)

(declare-fun res!143622 () Bool)

(assert (=> b!280578 (=> (not res!143622) (not e!178594))))

(assert (=> b!280578 (= res!143622 (and (= (size!6965 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6965 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6965 a!3325))))))

(declare-fun b!280579 () Bool)

(assert (=> b!280579 (= e!178593 (not true))))

(assert (=> b!280579 (arrayNoDuplicates!0 (array!13944 (store (arr!6613 a!3325) i!1267 k0!2581) (size!6965 a!3325)) #b00000000000000000000000000000000 Nil!4331)))

(declare-datatypes ((Unit!8802 0))(
  ( (Unit!8803) )
))
(declare-fun lt!138906 () Unit!8802)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4334) Unit!8802)

(assert (=> b!280579 (= lt!138906 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4331))))

(declare-fun b!280580 () Bool)

(declare-fun res!143620 () Bool)

(assert (=> b!280580 (=> (not res!143620) (not e!178593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13943 (_ BitVec 32)) Bool)

(assert (=> b!280580 (= res!143620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280581 () Bool)

(declare-fun res!143618 () Bool)

(assert (=> b!280581 (=> (not res!143618) (not e!178593))))

(assert (=> b!280581 (= res!143618 (not (= startIndex!26 i!1267)))))

(declare-fun b!280582 () Bool)

(declare-fun res!143623 () Bool)

(assert (=> b!280582 (=> (not res!143623) (not e!178594))))

(assert (=> b!280582 (= res!143623 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27126 res!143621) b!280578))

(assert (= (and b!280578 res!143622) b!280582))

(assert (= (and b!280582 res!143623) b!280577))

(assert (= (and b!280577 res!143619) b!280574))

(assert (= (and b!280574 res!143624) b!280576))

(assert (= (and b!280576 res!143625) b!280580))

(assert (= (and b!280580 res!143620) b!280581))

(assert (= (and b!280581 res!143618) b!280575))

(assert (= (and b!280575 res!143617) b!280579))

(declare-fun m!295157 () Bool)

(assert (=> b!280582 m!295157))

(declare-fun m!295159 () Bool)

(assert (=> b!280577 m!295159))

(declare-fun m!295161 () Bool)

(assert (=> start!27126 m!295161))

(declare-fun m!295163 () Bool)

(assert (=> start!27126 m!295163))

(declare-fun m!295165 () Bool)

(assert (=> b!280575 m!295165))

(assert (=> b!280575 m!295165))

(declare-fun m!295167 () Bool)

(assert (=> b!280575 m!295167))

(declare-fun m!295169 () Bool)

(assert (=> b!280576 m!295169))

(declare-fun m!295171 () Bool)

(assert (=> b!280574 m!295171))

(declare-fun m!295173 () Bool)

(assert (=> b!280579 m!295173))

(declare-fun m!295175 () Bool)

(assert (=> b!280579 m!295175))

(declare-fun m!295177 () Bool)

(assert (=> b!280579 m!295177))

(declare-fun m!295179 () Bool)

(assert (=> b!280580 m!295179))

(check-sat (not b!280579) (not b!280582) (not b!280574) (not b!280580) (not b!280575) (not b!280576) (not start!27126) (not b!280577))
(check-sat)
