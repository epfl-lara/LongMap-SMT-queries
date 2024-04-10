; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27146 () Bool)

(assert start!27146)

(declare-fun b!280797 () Bool)

(declare-fun res!143867 () Bool)

(declare-fun e!178660 () Bool)

(assert (=> b!280797 (=> (not res!143867) (not e!178660))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280797 (= res!143867 (validKeyInArray!0 k0!2581))))

(declare-fun b!280798 () Bool)

(declare-fun res!143870 () Bool)

(declare-fun e!178659 () Bool)

(assert (=> b!280798 (=> (not res!143870) (not e!178659))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280798 (= res!143870 (not (= startIndex!26 i!1267)))))

(declare-fun b!280799 () Bool)

(declare-fun res!143872 () Bool)

(assert (=> b!280799 (=> (not res!143872) (not e!178660))))

(declare-datatypes ((array!13964 0))(
  ( (array!13965 (arr!6624 (Array (_ BitVec 32) (_ BitVec 64))) (size!6976 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13964)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280799 (= res!143872 (and (= (size!6976 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6976 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6976 a!3325))))))

(declare-fun b!280800 () Bool)

(declare-fun res!143874 () Bool)

(assert (=> b!280800 (=> (not res!143874) (not e!178660))))

(declare-fun arrayContainsKey!0 (array!13964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280800 (= res!143874 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280801 () Bool)

(declare-fun res!143866 () Bool)

(assert (=> b!280801 (=> (not res!143866) (not e!178659))))

(assert (=> b!280801 (= res!143866 (validKeyInArray!0 (select (arr!6624 a!3325) startIndex!26)))))

(declare-fun b!280802 () Bool)

(declare-fun res!143869 () Bool)

(assert (=> b!280802 (=> (not res!143869) (not e!178660))))

(declare-datatypes ((List!4432 0))(
  ( (Nil!4429) (Cons!4428 (h!5098 (_ BitVec 64)) (t!9514 List!4432)) )
))
(declare-fun arrayNoDuplicates!0 (array!13964 (_ BitVec 32) List!4432) Bool)

(assert (=> b!280802 (= res!143869 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4429))))

(declare-fun b!280803 () Bool)

(declare-fun res!143868 () Bool)

(assert (=> b!280803 (=> (not res!143868) (not e!178659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13964 (_ BitVec 32)) Bool)

(assert (=> b!280803 (= res!143868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!143871 () Bool)

(assert (=> start!27146 (=> (not res!143871) (not e!178660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27146 (= res!143871 (validMask!0 mask!3868))))

(assert (=> start!27146 e!178660))

(declare-fun array_inv!4587 (array!13964) Bool)

(assert (=> start!27146 (array_inv!4587 a!3325)))

(assert (=> start!27146 true))

(declare-fun b!280804 () Bool)

(assert (=> b!280804 (= e!178660 e!178659)))

(declare-fun res!143873 () Bool)

(assert (=> b!280804 (=> (not res!143873) (not e!178659))))

(declare-datatypes ((SeekEntryResult!1782 0))(
  ( (MissingZero!1782 (index!9298 (_ BitVec 32))) (Found!1782 (index!9299 (_ BitVec 32))) (Intermediate!1782 (undefined!2594 Bool) (index!9300 (_ BitVec 32)) (x!27532 (_ BitVec 32))) (Undefined!1782) (MissingVacant!1782 (index!9301 (_ BitVec 32))) )
))
(declare-fun lt!138906 () SeekEntryResult!1782)

(assert (=> b!280804 (= res!143873 (or (= lt!138906 (MissingZero!1782 i!1267)) (= lt!138906 (MissingVacant!1782 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13964 (_ BitVec 32)) SeekEntryResult!1782)

(assert (=> b!280804 (= lt!138906 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280805 () Bool)

(assert (=> b!280805 (= e!178659 (not true))))

(assert (=> b!280805 (arrayNoDuplicates!0 (array!13965 (store (arr!6624 a!3325) i!1267 k0!2581) (size!6976 a!3325)) #b00000000000000000000000000000000 Nil!4429)))

(declare-datatypes ((Unit!8848 0))(
  ( (Unit!8849) )
))
(declare-fun lt!138907 () Unit!8848)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13964 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4432) Unit!8848)

(assert (=> b!280805 (= lt!138907 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4429))))

(assert (= (and start!27146 res!143871) b!280799))

(assert (= (and b!280799 res!143872) b!280797))

(assert (= (and b!280797 res!143867) b!280802))

(assert (= (and b!280802 res!143869) b!280800))

(assert (= (and b!280800 res!143874) b!280804))

(assert (= (and b!280804 res!143873) b!280803))

(assert (= (and b!280803 res!143868) b!280798))

(assert (= (and b!280798 res!143870) b!280801))

(assert (= (and b!280801 res!143866) b!280805))

(declare-fun m!295191 () Bool)

(assert (=> start!27146 m!295191))

(declare-fun m!295193 () Bool)

(assert (=> start!27146 m!295193))

(declare-fun m!295195 () Bool)

(assert (=> b!280802 m!295195))

(declare-fun m!295197 () Bool)

(assert (=> b!280805 m!295197))

(declare-fun m!295199 () Bool)

(assert (=> b!280805 m!295199))

(declare-fun m!295201 () Bool)

(assert (=> b!280805 m!295201))

(declare-fun m!295203 () Bool)

(assert (=> b!280803 m!295203))

(declare-fun m!295205 () Bool)

(assert (=> b!280804 m!295205))

(declare-fun m!295207 () Bool)

(assert (=> b!280801 m!295207))

(assert (=> b!280801 m!295207))

(declare-fun m!295209 () Bool)

(assert (=> b!280801 m!295209))

(declare-fun m!295211 () Bool)

(assert (=> b!280797 m!295211))

(declare-fun m!295213 () Bool)

(assert (=> b!280800 m!295213))

(check-sat (not b!280802) (not b!280805) (not b!280801) (not b!280797) (not start!27146) (not b!280800) (not b!280803) (not b!280804))
(check-sat)
