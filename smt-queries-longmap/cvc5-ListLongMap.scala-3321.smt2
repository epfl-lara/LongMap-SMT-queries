; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45870 () Bool)

(assert start!45870)

(declare-fun b!508060 () Bool)

(declare-fun res!309024 () Bool)

(declare-fun e!297285 () Bool)

(assert (=> b!508060 (=> (not res!309024) (not e!297285))))

(declare-datatypes ((array!32626 0))(
  ( (array!32627 (arr!15693 (Array (_ BitVec 32) (_ BitVec 64))) (size!16057 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32626)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32626 (_ BitVec 32)) Bool)

(assert (=> b!508060 (= res!309024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508061 () Bool)

(declare-fun res!309021 () Bool)

(declare-fun e!297283 () Bool)

(assert (=> b!508061 (=> (not res!309021) (not e!297283))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508061 (= res!309021 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508062 () Bool)

(assert (=> b!508062 (= e!297283 e!297285)))

(declare-fun res!309022 () Bool)

(assert (=> b!508062 (=> (not res!309022) (not e!297285))))

(declare-datatypes ((SeekEntryResult!4160 0))(
  ( (MissingZero!4160 (index!18828 (_ BitVec 32))) (Found!4160 (index!18829 (_ BitVec 32))) (Intermediate!4160 (undefined!4972 Bool) (index!18830 (_ BitVec 32)) (x!47817 (_ BitVec 32))) (Undefined!4160) (MissingVacant!4160 (index!18831 (_ BitVec 32))) )
))
(declare-fun lt!232153 () SeekEntryResult!4160)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508062 (= res!309022 (or (= lt!232153 (MissingZero!4160 i!1204)) (= lt!232153 (MissingVacant!4160 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32626 (_ BitVec 32)) SeekEntryResult!4160)

(assert (=> b!508062 (= lt!232153 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!309020 () Bool)

(assert (=> start!45870 (=> (not res!309020) (not e!297283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45870 (= res!309020 (validMask!0 mask!3524))))

(assert (=> start!45870 e!297283))

(assert (=> start!45870 true))

(declare-fun array_inv!11489 (array!32626) Bool)

(assert (=> start!45870 (array_inv!11489 a!3235)))

(declare-fun b!508063 () Bool)

(declare-fun res!309019 () Bool)

(assert (=> b!508063 (=> (not res!309019) (not e!297283))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508063 (= res!309019 (and (= (size!16057 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16057 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16057 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508064 () Bool)

(assert (=> b!508064 (= e!297285 (bvsgt #b00000000000000000000000000000000 (size!16057 a!3235)))))

(declare-fun b!508065 () Bool)

(declare-fun res!309023 () Bool)

(assert (=> b!508065 (=> (not res!309023) (not e!297283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508065 (= res!309023 (validKeyInArray!0 (select (arr!15693 a!3235) j!176)))))

(declare-fun b!508066 () Bool)

(declare-fun res!309025 () Bool)

(assert (=> b!508066 (=> (not res!309025) (not e!297283))))

(assert (=> b!508066 (= res!309025 (validKeyInArray!0 k!2280))))

(declare-fun b!508067 () Bool)

(declare-fun res!309026 () Bool)

(assert (=> b!508067 (=> (not res!309026) (not e!297285))))

(declare-datatypes ((List!9851 0))(
  ( (Nil!9848) (Cons!9847 (h!10724 (_ BitVec 64)) (t!16079 List!9851)) )
))
(declare-fun arrayNoDuplicates!0 (array!32626 (_ BitVec 32) List!9851) Bool)

(assert (=> b!508067 (= res!309026 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9848))))

(assert (= (and start!45870 res!309020) b!508063))

(assert (= (and b!508063 res!309019) b!508065))

(assert (= (and b!508065 res!309023) b!508066))

(assert (= (and b!508066 res!309025) b!508061))

(assert (= (and b!508061 res!309021) b!508062))

(assert (= (and b!508062 res!309022) b!508060))

(assert (= (and b!508060 res!309024) b!508067))

(assert (= (and b!508067 res!309026) b!508064))

(declare-fun m!488895 () Bool)

(assert (=> b!508060 m!488895))

(declare-fun m!488897 () Bool)

(assert (=> b!508065 m!488897))

(assert (=> b!508065 m!488897))

(declare-fun m!488899 () Bool)

(assert (=> b!508065 m!488899))

(declare-fun m!488901 () Bool)

(assert (=> start!45870 m!488901))

(declare-fun m!488903 () Bool)

(assert (=> start!45870 m!488903))

(declare-fun m!488905 () Bool)

(assert (=> b!508067 m!488905))

(declare-fun m!488907 () Bool)

(assert (=> b!508066 m!488907))

(declare-fun m!488909 () Bool)

(assert (=> b!508061 m!488909))

(declare-fun m!488911 () Bool)

(assert (=> b!508062 m!488911))

(push 1)

