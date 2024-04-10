; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26476 () Bool)

(assert start!26476)

(declare-fun b!274882 () Bool)

(declare-fun res!138875 () Bool)

(declare-fun e!175916 () Bool)

(assert (=> b!274882 (=> (not res!138875) (not e!175916))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274882 (= res!138875 (validKeyInArray!0 k!2581))))

(declare-fun b!274883 () Bool)

(declare-fun res!138876 () Bool)

(declare-fun e!175917 () Bool)

(assert (=> b!274883 (=> (not res!138876) (not e!175917))))

(declare-datatypes ((array!13573 0))(
  ( (array!13574 (arr!6436 (Array (_ BitVec 32) (_ BitVec 64))) (size!6788 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13573)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13573 (_ BitVec 32)) Bool)

(assert (=> b!274883 (= res!138876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274884 () Bool)

(declare-fun e!175919 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274884 (= e!175919 (not (or (bvslt startIndex!26 (bvsub (size!6788 a!3325) #b00000000000000000000000000000001)) (bvsle startIndex!26 (size!6788 a!3325)))))))

(assert (=> b!274884 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8675 0))(
  ( (Unit!8676) )
))
(declare-fun lt!137200 () Unit!8675)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8675)

(assert (=> b!274884 (= lt!137200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137203 () array!13573)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1594 0))(
  ( (MissingZero!1594 (index!8546 (_ BitVec 32))) (Found!1594 (index!8547 (_ BitVec 32))) (Intermediate!1594 (undefined!2406 Bool) (index!8548 (_ BitVec 32)) (x!26831 (_ BitVec 32))) (Undefined!1594) (MissingVacant!1594 (index!8549 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13573 (_ BitVec 32)) SeekEntryResult!1594)

(assert (=> b!274884 (= (seekEntryOrOpen!0 (select (arr!6436 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6436 a!3325) i!1267 k!2581) startIndex!26) lt!137203 mask!3868))))

(declare-fun lt!137201 () Unit!8675)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13573 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8675)

(assert (=> b!274884 (= lt!137201 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4244 0))(
  ( (Nil!4241) (Cons!4240 (h!4907 (_ BitVec 64)) (t!9326 List!4244)) )
))
(declare-fun arrayNoDuplicates!0 (array!13573 (_ BitVec 32) List!4244) Bool)

(assert (=> b!274884 (arrayNoDuplicates!0 lt!137203 #b00000000000000000000000000000000 Nil!4241)))

(declare-fun lt!137202 () Unit!8675)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13573 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4244) Unit!8675)

(assert (=> b!274884 (= lt!137202 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4241))))

(declare-fun b!274885 () Bool)

(declare-fun res!138871 () Bool)

(assert (=> b!274885 (=> (not res!138871) (not e!175919))))

(assert (=> b!274885 (= res!138871 (validKeyInArray!0 (select (arr!6436 a!3325) startIndex!26)))))

(declare-fun b!274886 () Bool)

(assert (=> b!274886 (= e!175916 e!175917)))

(declare-fun res!138877 () Bool)

(assert (=> b!274886 (=> (not res!138877) (not e!175917))))

(declare-fun lt!137199 () SeekEntryResult!1594)

(assert (=> b!274886 (= res!138877 (or (= lt!137199 (MissingZero!1594 i!1267)) (= lt!137199 (MissingVacant!1594 i!1267))))))

(assert (=> b!274886 (= lt!137199 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274887 () Bool)

(assert (=> b!274887 (= e!175917 e!175919)))

(declare-fun res!138874 () Bool)

(assert (=> b!274887 (=> (not res!138874) (not e!175919))))

(assert (=> b!274887 (= res!138874 (not (= startIndex!26 i!1267)))))

(assert (=> b!274887 (= lt!137203 (array!13574 (store (arr!6436 a!3325) i!1267 k!2581) (size!6788 a!3325)))))

(declare-fun res!138873 () Bool)

(assert (=> start!26476 (=> (not res!138873) (not e!175916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26476 (= res!138873 (validMask!0 mask!3868))))

(assert (=> start!26476 e!175916))

(declare-fun array_inv!4399 (array!13573) Bool)

(assert (=> start!26476 (array_inv!4399 a!3325)))

(assert (=> start!26476 true))

(declare-fun b!274881 () Bool)

(declare-fun res!138878 () Bool)

(assert (=> b!274881 (=> (not res!138878) (not e!175916))))

(assert (=> b!274881 (= res!138878 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4241))))

(declare-fun b!274888 () Bool)

(declare-fun res!138879 () Bool)

(assert (=> b!274888 (=> (not res!138879) (not e!175916))))

(declare-fun arrayContainsKey!0 (array!13573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274888 (= res!138879 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274889 () Bool)

(declare-fun res!138872 () Bool)

(assert (=> b!274889 (=> (not res!138872) (not e!175916))))

(assert (=> b!274889 (= res!138872 (and (= (size!6788 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6788 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6788 a!3325))))))

(assert (= (and start!26476 res!138873) b!274889))

(assert (= (and b!274889 res!138872) b!274882))

(assert (= (and b!274882 res!138875) b!274881))

(assert (= (and b!274881 res!138878) b!274888))

(assert (= (and b!274888 res!138879) b!274886))

(assert (= (and b!274886 res!138877) b!274883))

(assert (= (and b!274883 res!138876) b!274887))

(assert (= (and b!274887 res!138874) b!274885))

(assert (= (and b!274885 res!138871) b!274884))

(declare-fun m!290553 () Bool)

(assert (=> b!274882 m!290553))

(declare-fun m!290555 () Bool)

(assert (=> b!274885 m!290555))

(assert (=> b!274885 m!290555))

(declare-fun m!290557 () Bool)

(assert (=> b!274885 m!290557))

(declare-fun m!290559 () Bool)

(assert (=> b!274887 m!290559))

(declare-fun m!290561 () Bool)

(assert (=> b!274883 m!290561))

(declare-fun m!290563 () Bool)

(assert (=> start!26476 m!290563))

(declare-fun m!290565 () Bool)

(assert (=> start!26476 m!290565))

(declare-fun m!290567 () Bool)

(assert (=> b!274886 m!290567))

(declare-fun m!290569 () Bool)

(assert (=> b!274881 m!290569))

(declare-fun m!290571 () Bool)

(assert (=> b!274884 m!290571))

(assert (=> b!274884 m!290559))

(declare-fun m!290573 () Bool)

(assert (=> b!274884 m!290573))

(assert (=> b!274884 m!290555))

(declare-fun m!290575 () Bool)

(assert (=> b!274884 m!290575))

(declare-fun m!290577 () Bool)

(assert (=> b!274884 m!290577))

(declare-fun m!290579 () Bool)

(assert (=> b!274884 m!290579))

(declare-fun m!290581 () Bool)

(assert (=> b!274884 m!290581))

(assert (=> b!274884 m!290555))

(declare-fun m!290583 () Bool)

(assert (=> b!274884 m!290583))

(declare-fun m!290585 () Bool)

(assert (=> b!274884 m!290585))

(assert (=> b!274884 m!290579))

(declare-fun m!290587 () Bool)

(assert (=> b!274888 m!290587))

(push 1)

(assert (not b!274882))

(assert (not b!274881))

(assert (not b!274888))

(assert (not b!274886))

(assert (not start!26476))

(assert (not b!274884))

(assert (not b!274883))

(assert (not b!274885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

