; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26256 () Bool)

(assert start!26256)

(declare-fun b!271875 () Bool)

(declare-fun res!135865 () Bool)

(declare-fun e!174668 () Bool)

(assert (=> b!271875 (=> (not res!135865) (not e!174668))))

(declare-datatypes ((array!13353 0))(
  ( (array!13354 (arr!6326 (Array (_ BitVec 32) (_ BitVec 64))) (size!6678 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13353)

(declare-datatypes ((List!4134 0))(
  ( (Nil!4131) (Cons!4130 (h!4797 (_ BitVec 64)) (t!9216 List!4134)) )
))
(declare-fun arrayNoDuplicates!0 (array!13353 (_ BitVec 32) List!4134) Bool)

(assert (=> b!271875 (= res!135865 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4131))))

(declare-fun b!271876 () Bool)

(declare-fun res!135868 () Bool)

(declare-fun e!174667 () Bool)

(assert (=> b!271876 (=> (not res!135868) (not e!174667))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271876 (= res!135868 (validKeyInArray!0 (select (arr!6326 a!3325) startIndex!26)))))

(declare-fun b!271877 () Bool)

(declare-fun res!135872 () Bool)

(assert (=> b!271877 (=> (not res!135872) (not e!174668))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271877 (= res!135872 (and (= (size!6678 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6678 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6678 a!3325))))))

(declare-fun res!135873 () Bool)

(assert (=> start!26256 (=> (not res!135873) (not e!174668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26256 (= res!135873 (validMask!0 mask!3868))))

(assert (=> start!26256 e!174668))

(declare-fun array_inv!4289 (array!13353) Bool)

(assert (=> start!26256 (array_inv!4289 a!3325)))

(assert (=> start!26256 true))

(declare-fun b!271878 () Bool)

(declare-fun res!135867 () Bool)

(assert (=> b!271878 (=> (not res!135867) (not e!174667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13353 (_ BitVec 32)) Bool)

(assert (=> b!271878 (= res!135867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271879 () Bool)

(declare-fun res!135869 () Bool)

(assert (=> b!271879 (=> (not res!135869) (not e!174668))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271879 (= res!135869 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271880 () Bool)

(assert (=> b!271880 (= e!174668 e!174667)))

(declare-fun res!135870 () Bool)

(assert (=> b!271880 (=> (not res!135870) (not e!174667))))

(declare-datatypes ((SeekEntryResult!1484 0))(
  ( (MissingZero!1484 (index!8106 (_ BitVec 32))) (Found!1484 (index!8107 (_ BitVec 32))) (Intermediate!1484 (undefined!2296 Bool) (index!8108 (_ BitVec 32)) (x!26433 (_ BitVec 32))) (Undefined!1484) (MissingVacant!1484 (index!8109 (_ BitVec 32))) )
))
(declare-fun lt!135877 () SeekEntryResult!1484)

(assert (=> b!271880 (= res!135870 (or (= lt!135877 (MissingZero!1484 i!1267)) (= lt!135877 (MissingVacant!1484 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13353 (_ BitVec 32)) SeekEntryResult!1484)

(assert (=> b!271880 (= lt!135877 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271881 () Bool)

(assert (=> b!271881 (= e!174667 (not true))))

(assert (=> b!271881 (arrayNoDuplicates!0 (array!13354 (store (arr!6326 a!3325) i!1267 k!2581) (size!6678 a!3325)) #b00000000000000000000000000000000 Nil!4131)))

(declare-datatypes ((Unit!8455 0))(
  ( (Unit!8456) )
))
(declare-fun lt!135876 () Unit!8455)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4134) Unit!8455)

(assert (=> b!271881 (= lt!135876 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4131))))

(declare-fun b!271882 () Bool)

(declare-fun res!135866 () Bool)

(assert (=> b!271882 (=> (not res!135866) (not e!174667))))

(assert (=> b!271882 (= res!135866 (not (= startIndex!26 i!1267)))))

(declare-fun b!271883 () Bool)

(declare-fun res!135871 () Bool)

(assert (=> b!271883 (=> (not res!135871) (not e!174668))))

(assert (=> b!271883 (= res!135871 (validKeyInArray!0 k!2581))))

(assert (= (and start!26256 res!135873) b!271877))

(assert (= (and b!271877 res!135872) b!271883))

(assert (= (and b!271883 res!135871) b!271875))

(assert (= (and b!271875 res!135865) b!271879))

(assert (= (and b!271879 res!135869) b!271880))

(assert (= (and b!271880 res!135870) b!271878))

(assert (= (and b!271878 res!135867) b!271882))

(assert (= (and b!271882 res!135866) b!271876))

(assert (= (and b!271876 res!135868) b!271881))

(declare-fun m!287037 () Bool)

(assert (=> b!271880 m!287037))

(declare-fun m!287039 () Bool)

(assert (=> b!271883 m!287039))

(declare-fun m!287041 () Bool)

(assert (=> b!271879 m!287041))

(declare-fun m!287043 () Bool)

(assert (=> b!271881 m!287043))

(declare-fun m!287045 () Bool)

(assert (=> b!271881 m!287045))

(declare-fun m!287047 () Bool)

(assert (=> b!271881 m!287047))

(declare-fun m!287049 () Bool)

(assert (=> b!271875 m!287049))

(declare-fun m!287051 () Bool)

(assert (=> b!271878 m!287051))

(declare-fun m!287053 () Bool)

(assert (=> start!26256 m!287053))

(declare-fun m!287055 () Bool)

(assert (=> start!26256 m!287055))

(declare-fun m!287057 () Bool)

(assert (=> b!271876 m!287057))

(assert (=> b!271876 m!287057))

(declare-fun m!287059 () Bool)

(assert (=> b!271876 m!287059))

(push 1)

