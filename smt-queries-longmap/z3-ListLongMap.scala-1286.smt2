; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26276 () Bool)

(assert start!26276)

(declare-fun b!271971 () Bool)

(declare-fun res!136015 () Bool)

(declare-fun e!174646 () Bool)

(assert (=> b!271971 (=> (not res!136015) (not e!174646))))

(declare-datatypes ((array!13362 0))(
  ( (array!13363 (arr!6330 (Array (_ BitVec 32) (_ BitVec 64))) (size!6683 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13362)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271971 (= res!136015 (validKeyInArray!0 (select (arr!6330 a!3325) startIndex!26)))))

(declare-fun b!271972 () Bool)

(declare-fun res!136020 () Bool)

(declare-fun e!174648 () Bool)

(assert (=> b!271972 (=> (not res!136020) (not e!174648))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271972 (= res!136020 (and (= (size!6683 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6683 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6683 a!3325))))))

(declare-fun b!271973 () Bool)

(declare-fun res!136021 () Bool)

(assert (=> b!271973 (=> (not res!136021) (not e!174648))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271973 (= res!136021 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271974 () Bool)

(declare-fun res!136016 () Bool)

(assert (=> b!271974 (=> (not res!136016) (not e!174646))))

(assert (=> b!271974 (= res!136016 (not (= startIndex!26 i!1267)))))

(declare-fun b!271975 () Bool)

(declare-fun res!136017 () Bool)

(assert (=> b!271975 (=> (not res!136017) (not e!174646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13362 (_ BitVec 32)) Bool)

(assert (=> b!271975 (= res!136017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271976 () Bool)

(declare-fun res!136019 () Bool)

(assert (=> b!271976 (=> (not res!136019) (not e!174648))))

(declare-datatypes ((List!4111 0))(
  ( (Nil!4108) (Cons!4107 (h!4774 (_ BitVec 64)) (t!9184 List!4111)) )
))
(declare-fun arrayNoDuplicates!0 (array!13362 (_ BitVec 32) List!4111) Bool)

(assert (=> b!271976 (= res!136019 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4108))))

(declare-fun b!271977 () Bool)

(assert (=> b!271977 (= e!174648 e!174646)))

(declare-fun res!136018 () Bool)

(assert (=> b!271977 (=> (not res!136018) (not e!174646))))

(declare-datatypes ((SeekEntryResult!1487 0))(
  ( (MissingZero!1487 (index!8118 (_ BitVec 32))) (Found!1487 (index!8119 (_ BitVec 32))) (Intermediate!1487 (undefined!2299 Bool) (index!8120 (_ BitVec 32)) (x!26459 (_ BitVec 32))) (Undefined!1487) (MissingVacant!1487 (index!8121 (_ BitVec 32))) )
))
(declare-fun lt!135749 () SeekEntryResult!1487)

(assert (=> b!271977 (= res!136018 (or (= lt!135749 (MissingZero!1487 i!1267)) (= lt!135749 (MissingVacant!1487 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13362 (_ BitVec 32)) SeekEntryResult!1487)

(assert (=> b!271977 (= lt!135749 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!136013 () Bool)

(assert (=> start!26276 (=> (not res!136013) (not e!174648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26276 (= res!136013 (validMask!0 mask!3868))))

(assert (=> start!26276 e!174648))

(declare-fun array_inv!4302 (array!13362) Bool)

(assert (=> start!26276 (array_inv!4302 a!3325)))

(assert (=> start!26276 true))

(declare-fun b!271978 () Bool)

(assert (=> b!271978 (= e!174646 (not true))))

(assert (=> b!271978 (arrayNoDuplicates!0 (array!13363 (store (arr!6330 a!3325) i!1267 k0!2581) (size!6683 a!3325)) #b00000000000000000000000000000000 Nil!4108)))

(declare-datatypes ((Unit!8427 0))(
  ( (Unit!8428) )
))
(declare-fun lt!135750 () Unit!8427)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13362 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4111) Unit!8427)

(assert (=> b!271978 (= lt!135750 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4108))))

(declare-fun b!271979 () Bool)

(declare-fun res!136014 () Bool)

(assert (=> b!271979 (=> (not res!136014) (not e!174648))))

(assert (=> b!271979 (= res!136014 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26276 res!136013) b!271972))

(assert (= (and b!271972 res!136020) b!271979))

(assert (= (and b!271979 res!136014) b!271976))

(assert (= (and b!271976 res!136019) b!271973))

(assert (= (and b!271973 res!136021) b!271977))

(assert (= (and b!271977 res!136018) b!271975))

(assert (= (and b!271975 res!136017) b!271974))

(assert (= (and b!271974 res!136016) b!271971))

(assert (= (and b!271971 res!136015) b!271978))

(declare-fun m!286661 () Bool)

(assert (=> b!271973 m!286661))

(declare-fun m!286663 () Bool)

(assert (=> b!271979 m!286663))

(declare-fun m!286665 () Bool)

(assert (=> b!271975 m!286665))

(declare-fun m!286667 () Bool)

(assert (=> b!271971 m!286667))

(assert (=> b!271971 m!286667))

(declare-fun m!286669 () Bool)

(assert (=> b!271971 m!286669))

(declare-fun m!286671 () Bool)

(assert (=> b!271978 m!286671))

(declare-fun m!286673 () Bool)

(assert (=> b!271978 m!286673))

(declare-fun m!286675 () Bool)

(assert (=> b!271978 m!286675))

(declare-fun m!286677 () Bool)

(assert (=> b!271976 m!286677))

(declare-fun m!286679 () Bool)

(assert (=> start!26276 m!286679))

(declare-fun m!286681 () Bool)

(assert (=> start!26276 m!286681))

(declare-fun m!286683 () Bool)

(assert (=> b!271977 m!286683))

(check-sat (not b!271971) (not b!271978) (not b!271977) (not b!271973) (not start!26276) (not b!271979) (not b!271975) (not b!271976))
(check-sat)
