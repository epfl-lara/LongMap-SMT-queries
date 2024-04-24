; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27132 () Bool)

(assert start!27132)

(declare-fun b!280655 () Bool)

(declare-fun res!143703 () Bool)

(declare-fun e!178621 () Bool)

(assert (=> b!280655 (=> (not res!143703) (not e!178621))))

(declare-datatypes ((array!13949 0))(
  ( (array!13950 (arr!6616 (Array (_ BitVec 32) (_ BitVec 64))) (size!6968 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13949)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280655 (= res!143703 (validKeyInArray!0 (select (arr!6616 a!3325) startIndex!26)))))

(declare-fun b!280656 () Bool)

(declare-fun e!178620 () Bool)

(assert (=> b!280656 (= e!178620 e!178621)))

(declare-fun res!143702 () Bool)

(assert (=> b!280656 (=> (not res!143702) (not e!178621))))

(declare-datatypes ((SeekEntryResult!1739 0))(
  ( (MissingZero!1739 (index!9126 (_ BitVec 32))) (Found!1739 (index!9127 (_ BitVec 32))) (Intermediate!1739 (undefined!2551 Bool) (index!9128 (_ BitVec 32)) (x!27473 (_ BitVec 32))) (Undefined!1739) (MissingVacant!1739 (index!9129 (_ BitVec 32))) )
))
(declare-fun lt!138924 () SeekEntryResult!1739)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280656 (= res!143702 (or (= lt!138924 (MissingZero!1739 i!1267)) (= lt!138924 (MissingVacant!1739 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13949 (_ BitVec 32)) SeekEntryResult!1739)

(assert (=> b!280656 (= lt!138924 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280657 () Bool)

(declare-fun res!143700 () Bool)

(assert (=> b!280657 (=> (not res!143700) (not e!178620))))

(declare-fun arrayContainsKey!0 (array!13949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280657 (= res!143700 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280658 () Bool)

(declare-fun res!143704 () Bool)

(assert (=> b!280658 (=> (not res!143704) (not e!178620))))

(assert (=> b!280658 (= res!143704 (and (= (size!6968 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6968 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6968 a!3325))))))

(declare-fun res!143706 () Bool)

(assert (=> start!27132 (=> (not res!143706) (not e!178620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27132 (= res!143706 (validMask!0 mask!3868))))

(assert (=> start!27132 e!178620))

(declare-fun array_inv!4566 (array!13949) Bool)

(assert (=> start!27132 (array_inv!4566 a!3325)))

(assert (=> start!27132 true))

(declare-fun b!280659 () Bool)

(declare-fun res!143701 () Bool)

(assert (=> b!280659 (=> (not res!143701) (not e!178620))))

(assert (=> b!280659 (= res!143701 (validKeyInArray!0 k0!2581))))

(declare-fun b!280660 () Bool)

(declare-fun res!143705 () Bool)

(assert (=> b!280660 (=> (not res!143705) (not e!178621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13949 (_ BitVec 32)) Bool)

(assert (=> b!280660 (= res!143705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280661 () Bool)

(assert (=> b!280661 (= e!178621 (not true))))

(declare-datatypes ((List!4337 0))(
  ( (Nil!4334) (Cons!4333 (h!5003 (_ BitVec 64)) (t!9411 List!4337)) )
))
(declare-fun arrayNoDuplicates!0 (array!13949 (_ BitVec 32) List!4337) Bool)

(assert (=> b!280661 (arrayNoDuplicates!0 (array!13950 (store (arr!6616 a!3325) i!1267 k0!2581) (size!6968 a!3325)) #b00000000000000000000000000000000 Nil!4334)))

(declare-datatypes ((Unit!8808 0))(
  ( (Unit!8809) )
))
(declare-fun lt!138923 () Unit!8808)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13949 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4337) Unit!8808)

(assert (=> b!280661 (= lt!138923 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4334))))

(declare-fun b!280662 () Bool)

(declare-fun res!143699 () Bool)

(assert (=> b!280662 (=> (not res!143699) (not e!178621))))

(assert (=> b!280662 (= res!143699 (not (= startIndex!26 i!1267)))))

(declare-fun b!280663 () Bool)

(declare-fun res!143698 () Bool)

(assert (=> b!280663 (=> (not res!143698) (not e!178620))))

(assert (=> b!280663 (= res!143698 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4334))))

(assert (= (and start!27132 res!143706) b!280658))

(assert (= (and b!280658 res!143704) b!280659))

(assert (= (and b!280659 res!143701) b!280663))

(assert (= (and b!280663 res!143698) b!280657))

(assert (= (and b!280657 res!143700) b!280656))

(assert (= (and b!280656 res!143702) b!280660))

(assert (= (and b!280660 res!143705) b!280662))

(assert (= (and b!280662 res!143699) b!280655))

(assert (= (and b!280655 res!143703) b!280661))

(declare-fun m!295229 () Bool)

(assert (=> b!280657 m!295229))

(declare-fun m!295231 () Bool)

(assert (=> b!280659 m!295231))

(declare-fun m!295233 () Bool)

(assert (=> b!280660 m!295233))

(declare-fun m!295235 () Bool)

(assert (=> b!280661 m!295235))

(declare-fun m!295237 () Bool)

(assert (=> b!280661 m!295237))

(declare-fun m!295239 () Bool)

(assert (=> b!280661 m!295239))

(declare-fun m!295241 () Bool)

(assert (=> b!280663 m!295241))

(declare-fun m!295243 () Bool)

(assert (=> b!280656 m!295243))

(declare-fun m!295245 () Bool)

(assert (=> b!280655 m!295245))

(assert (=> b!280655 m!295245))

(declare-fun m!295247 () Bool)

(assert (=> b!280655 m!295247))

(declare-fun m!295249 () Bool)

(assert (=> start!27132 m!295249))

(declare-fun m!295251 () Bool)

(assert (=> start!27132 m!295251))

(check-sat (not b!280655) (not b!280661) (not b!280656) (not b!280660) (not b!280659) (not start!27132) (not b!280663) (not b!280657))
(check-sat)
