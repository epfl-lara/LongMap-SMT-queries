; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26486 () Bool)

(assert start!26486)

(declare-fun b!274974 () Bool)

(declare-fun res!138969 () Bool)

(declare-fun e!175963 () Bool)

(assert (=> b!274974 (=> (not res!138969) (not e!175963))))

(declare-datatypes ((array!13583 0))(
  ( (array!13584 (arr!6441 (Array (_ BitVec 32) (_ BitVec 64))) (size!6793 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13583)

(declare-datatypes ((List!4249 0))(
  ( (Nil!4246) (Cons!4245 (h!4912 (_ BitVec 64)) (t!9331 List!4249)) )
))
(declare-fun arrayNoDuplicates!0 (array!13583 (_ BitVec 32) List!4249) Bool)

(assert (=> b!274974 (= res!138969 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4246))))

(declare-fun b!274975 () Bool)

(declare-fun e!175962 () Bool)

(assert (=> b!274975 (= e!175962 false)))

(declare-fun lt!137232 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13583 (_ BitVec 32)) Bool)

(assert (=> b!274975 (= lt!137232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!138964 () Bool)

(assert (=> start!26486 (=> (not res!138964) (not e!175963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26486 (= res!138964 (validMask!0 mask!3868))))

(assert (=> start!26486 e!175963))

(declare-fun array_inv!4404 (array!13583) Bool)

(assert (=> start!26486 (array_inv!4404 a!3325)))

(assert (=> start!26486 true))

(declare-fun b!274976 () Bool)

(declare-fun res!138966 () Bool)

(assert (=> b!274976 (=> (not res!138966) (not e!175963))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274976 (= res!138966 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274977 () Bool)

(assert (=> b!274977 (= e!175963 e!175962)))

(declare-fun res!138968 () Bool)

(assert (=> b!274977 (=> (not res!138968) (not e!175962))))

(declare-datatypes ((SeekEntryResult!1599 0))(
  ( (MissingZero!1599 (index!8566 (_ BitVec 32))) (Found!1599 (index!8567 (_ BitVec 32))) (Intermediate!1599 (undefined!2411 Bool) (index!8568 (_ BitVec 32)) (x!26852 (_ BitVec 32))) (Undefined!1599) (MissingVacant!1599 (index!8569 (_ BitVec 32))) )
))
(declare-fun lt!137233 () SeekEntryResult!1599)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274977 (= res!138968 (or (= lt!137233 (MissingZero!1599 i!1267)) (= lt!137233 (MissingVacant!1599 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13583 (_ BitVec 32)) SeekEntryResult!1599)

(assert (=> b!274977 (= lt!137233 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274978 () Bool)

(declare-fun res!138967 () Bool)

(assert (=> b!274978 (=> (not res!138967) (not e!175963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274978 (= res!138967 (validKeyInArray!0 k0!2581))))

(declare-fun b!274979 () Bool)

(declare-fun res!138965 () Bool)

(assert (=> b!274979 (=> (not res!138965) (not e!175963))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274979 (= res!138965 (and (= (size!6793 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6793 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6793 a!3325))))))

(assert (= (and start!26486 res!138964) b!274979))

(assert (= (and b!274979 res!138965) b!274978))

(assert (= (and b!274978 res!138967) b!274974))

(assert (= (and b!274974 res!138969) b!274976))

(assert (= (and b!274976 res!138966) b!274977))

(assert (= (and b!274977 res!138968) b!274975))

(declare-fun m!290645 () Bool)

(assert (=> b!274977 m!290645))

(declare-fun m!290647 () Bool)

(assert (=> start!26486 m!290647))

(declare-fun m!290649 () Bool)

(assert (=> start!26486 m!290649))

(declare-fun m!290651 () Bool)

(assert (=> b!274978 m!290651))

(declare-fun m!290653 () Bool)

(assert (=> b!274976 m!290653))

(declare-fun m!290655 () Bool)

(assert (=> b!274974 m!290655))

(declare-fun m!290657 () Bool)

(assert (=> b!274975 m!290657))

(check-sat (not b!274975) (not b!274976) (not b!274977) (not start!26486) (not b!274978) (not b!274974))
(check-sat)
