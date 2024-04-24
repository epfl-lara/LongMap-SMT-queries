; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27144 () Bool)

(assert start!27144)

(declare-fun b!280817 () Bool)

(declare-fun res!143862 () Bool)

(declare-fun e!178676 () Bool)

(assert (=> b!280817 (=> (not res!143862) (not e!178676))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280817 (= res!143862 (not (= startIndex!26 i!1267)))))

(declare-fun b!280818 () Bool)

(declare-fun res!143861 () Bool)

(declare-fun e!178674 () Bool)

(assert (=> b!280818 (=> (not res!143861) (not e!178674))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280818 (= res!143861 (validKeyInArray!0 k0!2581))))

(declare-fun b!280819 () Bool)

(declare-fun res!143860 () Bool)

(assert (=> b!280819 (=> (not res!143860) (not e!178674))))

(declare-datatypes ((array!13961 0))(
  ( (array!13962 (arr!6622 (Array (_ BitVec 32) (_ BitVec 64))) (size!6974 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13961)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280819 (= res!143860 (and (= (size!6974 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6974 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6974 a!3325))))))

(declare-fun b!280820 () Bool)

(declare-fun res!143865 () Bool)

(assert (=> b!280820 (=> (not res!143865) (not e!178676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13961 (_ BitVec 32)) Bool)

(assert (=> b!280820 (= res!143865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280821 () Bool)

(assert (=> b!280821 (= e!178674 e!178676)))

(declare-fun res!143868 () Bool)

(assert (=> b!280821 (=> (not res!143868) (not e!178676))))

(declare-datatypes ((SeekEntryResult!1745 0))(
  ( (MissingZero!1745 (index!9150 (_ BitVec 32))) (Found!1745 (index!9151 (_ BitVec 32))) (Intermediate!1745 (undefined!2557 Bool) (index!9152 (_ BitVec 32)) (x!27495 (_ BitVec 32))) (Undefined!1745) (MissingVacant!1745 (index!9153 (_ BitVec 32))) )
))
(declare-fun lt!138960 () SeekEntryResult!1745)

(assert (=> b!280821 (= res!143868 (or (= lt!138960 (MissingZero!1745 i!1267)) (= lt!138960 (MissingVacant!1745 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13961 (_ BitVec 32)) SeekEntryResult!1745)

(assert (=> b!280821 (= lt!138960 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280822 () Bool)

(assert (=> b!280822 (= e!178676 (not true))))

(declare-datatypes ((List!4343 0))(
  ( (Nil!4340) (Cons!4339 (h!5009 (_ BitVec 64)) (t!9417 List!4343)) )
))
(declare-fun arrayNoDuplicates!0 (array!13961 (_ BitVec 32) List!4343) Bool)

(assert (=> b!280822 (arrayNoDuplicates!0 (array!13962 (store (arr!6622 a!3325) i!1267 k0!2581) (size!6974 a!3325)) #b00000000000000000000000000000000 Nil!4340)))

(declare-datatypes ((Unit!8820 0))(
  ( (Unit!8821) )
))
(declare-fun lt!138959 () Unit!8820)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13961 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4343) Unit!8820)

(assert (=> b!280822 (= lt!138959 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4340))))

(declare-fun b!280823 () Bool)

(declare-fun res!143864 () Bool)

(assert (=> b!280823 (=> (not res!143864) (not e!178674))))

(assert (=> b!280823 (= res!143864 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4340))))

(declare-fun res!143866 () Bool)

(assert (=> start!27144 (=> (not res!143866) (not e!178674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27144 (= res!143866 (validMask!0 mask!3868))))

(assert (=> start!27144 e!178674))

(declare-fun array_inv!4572 (array!13961) Bool)

(assert (=> start!27144 (array_inv!4572 a!3325)))

(assert (=> start!27144 true))

(declare-fun b!280824 () Bool)

(declare-fun res!143867 () Bool)

(assert (=> b!280824 (=> (not res!143867) (not e!178674))))

(declare-fun arrayContainsKey!0 (array!13961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280824 (= res!143867 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280825 () Bool)

(declare-fun res!143863 () Bool)

(assert (=> b!280825 (=> (not res!143863) (not e!178676))))

(assert (=> b!280825 (= res!143863 (validKeyInArray!0 (select (arr!6622 a!3325) startIndex!26)))))

(assert (= (and start!27144 res!143866) b!280819))

(assert (= (and b!280819 res!143860) b!280818))

(assert (= (and b!280818 res!143861) b!280823))

(assert (= (and b!280823 res!143864) b!280824))

(assert (= (and b!280824 res!143867) b!280821))

(assert (= (and b!280821 res!143868) b!280820))

(assert (= (and b!280820 res!143865) b!280817))

(assert (= (and b!280817 res!143862) b!280825))

(assert (= (and b!280825 res!143863) b!280822))

(declare-fun m!295373 () Bool)

(assert (=> b!280824 m!295373))

(declare-fun m!295375 () Bool)

(assert (=> b!280822 m!295375))

(declare-fun m!295377 () Bool)

(assert (=> b!280822 m!295377))

(declare-fun m!295379 () Bool)

(assert (=> b!280822 m!295379))

(declare-fun m!295381 () Bool)

(assert (=> b!280823 m!295381))

(declare-fun m!295383 () Bool)

(assert (=> b!280825 m!295383))

(assert (=> b!280825 m!295383))

(declare-fun m!295385 () Bool)

(assert (=> b!280825 m!295385))

(declare-fun m!295387 () Bool)

(assert (=> b!280820 m!295387))

(declare-fun m!295389 () Bool)

(assert (=> start!27144 m!295389))

(declare-fun m!295391 () Bool)

(assert (=> start!27144 m!295391))

(declare-fun m!295393 () Bool)

(assert (=> b!280818 m!295393))

(declare-fun m!295395 () Bool)

(assert (=> b!280821 m!295395))

(check-sat (not b!280823) (not b!280822) (not b!280820) (not start!27144) (not b!280825) (not b!280818) (not b!280821) (not b!280824))
(check-sat)
