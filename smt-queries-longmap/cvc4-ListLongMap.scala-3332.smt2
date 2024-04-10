; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45988 () Bool)

(assert start!45988)

(declare-fun res!309981 () Bool)

(declare-fun e!297788 () Bool)

(assert (=> start!45988 (=> (not res!309981) (not e!297788))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45988 (= res!309981 (validMask!0 mask!3524))))

(assert (=> start!45988 e!297788))

(assert (=> start!45988 true))

(declare-datatypes ((array!32699 0))(
  ( (array!32700 (arr!15728 (Array (_ BitVec 32) (_ BitVec 64))) (size!16092 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32699)

(declare-fun array_inv!11524 (array!32699) Bool)

(assert (=> start!45988 (array_inv!11524 a!3235)))

(declare-fun b!509136 () Bool)

(declare-fun res!309982 () Bool)

(assert (=> b!509136 (=> (not res!309982) (not e!297788))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509136 (= res!309982 (validKeyInArray!0 k!2280))))

(declare-fun b!509137 () Bool)

(declare-fun e!297786 () Bool)

(assert (=> b!509137 (= e!297788 e!297786)))

(declare-fun res!309987 () Bool)

(assert (=> b!509137 (=> (not res!309987) (not e!297786))))

(declare-datatypes ((SeekEntryResult!4195 0))(
  ( (MissingZero!4195 (index!18968 (_ BitVec 32))) (Found!4195 (index!18969 (_ BitVec 32))) (Intermediate!4195 (undefined!5007 Bool) (index!18970 (_ BitVec 32)) (x!47940 (_ BitVec 32))) (Undefined!4195) (MissingVacant!4195 (index!18971 (_ BitVec 32))) )
))
(declare-fun lt!232516 () SeekEntryResult!4195)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509137 (= res!309987 (or (= lt!232516 (MissingZero!4195 i!1204)) (= lt!232516 (MissingVacant!4195 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32699 (_ BitVec 32)) SeekEntryResult!4195)

(assert (=> b!509137 (= lt!232516 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!297787 () Bool)

(declare-fun b!509138 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509138 (= e!297787 (= (seekEntryOrOpen!0 (select (arr!15728 a!3235) j!176) a!3235 mask!3524) (Found!4195 j!176)))))

(declare-fun b!509139 () Bool)

(declare-fun res!309986 () Bool)

(assert (=> b!509139 (=> (not res!309986) (not e!297786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32699 (_ BitVec 32)) Bool)

(assert (=> b!509139 (= res!309986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509140 () Bool)

(assert (=> b!509140 (= e!297786 (not true))))

(declare-fun lt!232518 () SeekEntryResult!4195)

(declare-fun lt!232519 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32699 (_ BitVec 32)) SeekEntryResult!4195)

(assert (=> b!509140 (= lt!232518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232519 (select (store (arr!15728 a!3235) i!1204 k!2280) j!176) (array!32700 (store (arr!15728 a!3235) i!1204 k!2280) (size!16092 a!3235)) mask!3524))))

(declare-fun lt!232517 () SeekEntryResult!4195)

(declare-fun lt!232515 () (_ BitVec 32))

(assert (=> b!509140 (= lt!232517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232515 (select (arr!15728 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509140 (= lt!232519 (toIndex!0 (select (store (arr!15728 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509140 (= lt!232515 (toIndex!0 (select (arr!15728 a!3235) j!176) mask!3524))))

(assert (=> b!509140 e!297787))

(declare-fun res!309988 () Bool)

(assert (=> b!509140 (=> (not res!309988) (not e!297787))))

(assert (=> b!509140 (= res!309988 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15648 0))(
  ( (Unit!15649) )
))
(declare-fun lt!232514 () Unit!15648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15648)

(assert (=> b!509140 (= lt!232514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509141 () Bool)

(declare-fun res!309989 () Bool)

(assert (=> b!509141 (=> (not res!309989) (not e!297788))))

(declare-fun arrayContainsKey!0 (array!32699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509141 (= res!309989 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509142 () Bool)

(declare-fun res!309984 () Bool)

(assert (=> b!509142 (=> (not res!309984) (not e!297788))))

(assert (=> b!509142 (= res!309984 (validKeyInArray!0 (select (arr!15728 a!3235) j!176)))))

(declare-fun b!509143 () Bool)

(declare-fun res!309983 () Bool)

(assert (=> b!509143 (=> (not res!309983) (not e!297786))))

(declare-datatypes ((List!9886 0))(
  ( (Nil!9883) (Cons!9882 (h!10759 (_ BitVec 64)) (t!16114 List!9886)) )
))
(declare-fun arrayNoDuplicates!0 (array!32699 (_ BitVec 32) List!9886) Bool)

(assert (=> b!509143 (= res!309983 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9883))))

(declare-fun b!509144 () Bool)

(declare-fun res!309985 () Bool)

(assert (=> b!509144 (=> (not res!309985) (not e!297788))))

(assert (=> b!509144 (= res!309985 (and (= (size!16092 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16092 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16092 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45988 res!309981) b!509144))

(assert (= (and b!509144 res!309985) b!509142))

(assert (= (and b!509142 res!309984) b!509136))

(assert (= (and b!509136 res!309982) b!509141))

(assert (= (and b!509141 res!309989) b!509137))

(assert (= (and b!509137 res!309987) b!509139))

(assert (= (and b!509139 res!309986) b!509143))

(assert (= (and b!509143 res!309983) b!509140))

(assert (= (and b!509140 res!309988) b!509138))

(declare-fun m!489921 () Bool)

(assert (=> b!509141 m!489921))

(declare-fun m!489923 () Bool)

(assert (=> b!509142 m!489923))

(assert (=> b!509142 m!489923))

(declare-fun m!489925 () Bool)

(assert (=> b!509142 m!489925))

(declare-fun m!489927 () Bool)

(assert (=> b!509136 m!489927))

(declare-fun m!489929 () Bool)

(assert (=> b!509140 m!489929))

(declare-fun m!489931 () Bool)

(assert (=> b!509140 m!489931))

(declare-fun m!489933 () Bool)

(assert (=> b!509140 m!489933))

(assert (=> b!509140 m!489923))

(declare-fun m!489935 () Bool)

(assert (=> b!509140 m!489935))

(assert (=> b!509140 m!489923))

(declare-fun m!489937 () Bool)

(assert (=> b!509140 m!489937))

(assert (=> b!509140 m!489923))

(declare-fun m!489939 () Bool)

(assert (=> b!509140 m!489939))

(assert (=> b!509140 m!489933))

(declare-fun m!489941 () Bool)

(assert (=> b!509140 m!489941))

(assert (=> b!509140 m!489933))

(declare-fun m!489943 () Bool)

(assert (=> b!509140 m!489943))

(declare-fun m!489945 () Bool)

(assert (=> start!45988 m!489945))

(declare-fun m!489947 () Bool)

(assert (=> start!45988 m!489947))

(assert (=> b!509138 m!489923))

(assert (=> b!509138 m!489923))

(declare-fun m!489949 () Bool)

(assert (=> b!509138 m!489949))

(declare-fun m!489951 () Bool)

(assert (=> b!509137 m!489951))

(declare-fun m!489953 () Bool)

(assert (=> b!509143 m!489953))

(declare-fun m!489955 () Bool)

(assert (=> b!509139 m!489955))

(push 1)

