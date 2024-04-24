; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26256 () Bool)

(assert start!26256)

(declare-fun b!271922 () Bool)

(declare-fun res!135894 () Bool)

(declare-fun e!174692 () Bool)

(assert (=> b!271922 (=> (not res!135894) (not e!174692))))

(declare-datatypes ((array!13352 0))(
  ( (array!13353 (arr!6325 (Array (_ BitVec 32) (_ BitVec 64))) (size!6677 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13352)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271922 (= res!135894 (validKeyInArray!0 (select (arr!6325 a!3325) startIndex!26)))))

(declare-fun b!271923 () Bool)

(declare-fun res!135886 () Bool)

(declare-fun e!174690 () Bool)

(assert (=> b!271923 (=> (not res!135886) (not e!174690))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!271923 (= res!135886 (validKeyInArray!0 k0!2581))))

(declare-fun b!271924 () Bool)

(declare-fun res!135891 () Bool)

(assert (=> b!271924 (=> (not res!135891) (not e!174690))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271924 (= res!135891 (and (= (size!6677 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6677 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6677 a!3325))))))

(declare-fun b!271926 () Bool)

(assert (=> b!271926 (= e!174692 (not true))))

(declare-datatypes ((List!4046 0))(
  ( (Nil!4043) (Cons!4042 (h!4709 (_ BitVec 64)) (t!9120 List!4046)) )
))
(declare-fun arrayNoDuplicates!0 (array!13352 (_ BitVec 32) List!4046) Bool)

(assert (=> b!271926 (arrayNoDuplicates!0 (array!13353 (store (arr!6325 a!3325) i!1267 k0!2581) (size!6677 a!3325)) #b00000000000000000000000000000000 Nil!4043)))

(declare-datatypes ((Unit!8435 0))(
  ( (Unit!8436) )
))
(declare-fun lt!135935 () Unit!8435)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4046) Unit!8435)

(assert (=> b!271926 (= lt!135935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4043))))

(declare-fun b!271927 () Bool)

(declare-fun res!135887 () Bool)

(assert (=> b!271927 (=> (not res!135887) (not e!174692))))

(assert (=> b!271927 (= res!135887 (not (= startIndex!26 i!1267)))))

(declare-fun b!271928 () Bool)

(declare-fun res!135888 () Bool)

(assert (=> b!271928 (=> (not res!135888) (not e!174690))))

(declare-fun arrayContainsKey!0 (array!13352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271928 (= res!135888 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271929 () Bool)

(declare-fun res!135889 () Bool)

(assert (=> b!271929 (=> (not res!135889) (not e!174690))))

(assert (=> b!271929 (= res!135889 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4043))))

(declare-fun b!271930 () Bool)

(declare-fun res!135890 () Bool)

(assert (=> b!271930 (=> (not res!135890) (not e!174692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13352 (_ BitVec 32)) Bool)

(assert (=> b!271930 (= res!135890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!135892 () Bool)

(assert (=> start!26256 (=> (not res!135892) (not e!174690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26256 (= res!135892 (validMask!0 mask!3868))))

(assert (=> start!26256 e!174690))

(declare-fun array_inv!4275 (array!13352) Bool)

(assert (=> start!26256 (array_inv!4275 a!3325)))

(assert (=> start!26256 true))

(declare-fun b!271925 () Bool)

(assert (=> b!271925 (= e!174690 e!174692)))

(declare-fun res!135893 () Bool)

(assert (=> b!271925 (=> (not res!135893) (not e!174692))))

(declare-datatypes ((SeekEntryResult!1448 0))(
  ( (MissingZero!1448 (index!7962 (_ BitVec 32))) (Found!1448 (index!7963 (_ BitVec 32))) (Intermediate!1448 (undefined!2260 Bool) (index!7964 (_ BitVec 32)) (x!26397 (_ BitVec 32))) (Undefined!1448) (MissingVacant!1448 (index!7965 (_ BitVec 32))) )
))
(declare-fun lt!135936 () SeekEntryResult!1448)

(assert (=> b!271925 (= res!135893 (or (= lt!135936 (MissingZero!1448 i!1267)) (= lt!135936 (MissingVacant!1448 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13352 (_ BitVec 32)) SeekEntryResult!1448)

(assert (=> b!271925 (= lt!135936 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26256 res!135892) b!271924))

(assert (= (and b!271924 res!135891) b!271923))

(assert (= (and b!271923 res!135886) b!271929))

(assert (= (and b!271929 res!135889) b!271928))

(assert (= (and b!271928 res!135888) b!271925))

(assert (= (and b!271925 res!135893) b!271930))

(assert (= (and b!271930 res!135890) b!271927))

(assert (= (and b!271927 res!135887) b!271922))

(assert (= (and b!271922 res!135894) b!271926))

(declare-fun m!287243 () Bool)

(assert (=> b!271925 m!287243))

(declare-fun m!287245 () Bool)

(assert (=> b!271930 m!287245))

(declare-fun m!287247 () Bool)

(assert (=> b!271923 m!287247))

(declare-fun m!287249 () Bool)

(assert (=> b!271929 m!287249))

(declare-fun m!287251 () Bool)

(assert (=> b!271922 m!287251))

(assert (=> b!271922 m!287251))

(declare-fun m!287253 () Bool)

(assert (=> b!271922 m!287253))

(declare-fun m!287255 () Bool)

(assert (=> b!271926 m!287255))

(declare-fun m!287257 () Bool)

(assert (=> b!271926 m!287257))

(declare-fun m!287259 () Bool)

(assert (=> b!271926 m!287259))

(declare-fun m!287261 () Bool)

(assert (=> b!271928 m!287261))

(declare-fun m!287263 () Bool)

(assert (=> start!26256 m!287263))

(declare-fun m!287265 () Bool)

(assert (=> start!26256 m!287265))

(check-sat (not b!271930) (not b!271929) (not b!271928) (not b!271926) (not start!26256) (not b!271922) (not b!271923) (not b!271925))
(check-sat)
