; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44448 () Bool)

(assert start!44448)

(declare-fun b!488142 () Bool)

(declare-fun res!291307 () Bool)

(declare-fun e!287192 () Bool)

(assert (=> b!488142 (=> (not res!291307) (not e!287192))))

(declare-datatypes ((array!31603 0))(
  ( (array!31604 (arr!15192 (Array (_ BitVec 32) (_ BitVec 64))) (size!15556 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31603)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31603 (_ BitVec 32)) Bool)

(assert (=> b!488142 (= res!291307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488143 () Bool)

(declare-fun e!287190 () Bool)

(assert (=> b!488143 (= e!287190 e!287192)))

(declare-fun res!291306 () Bool)

(assert (=> b!488143 (=> (not res!291306) (not e!287192))))

(declare-datatypes ((SeekEntryResult!3659 0))(
  ( (MissingZero!3659 (index!16815 (_ BitVec 32))) (Found!3659 (index!16816 (_ BitVec 32))) (Intermediate!3659 (undefined!4471 Bool) (index!16817 (_ BitVec 32)) (x!45938 (_ BitVec 32))) (Undefined!3659) (MissingVacant!3659 (index!16818 (_ BitVec 32))) )
))
(declare-fun lt!220313 () SeekEntryResult!3659)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488143 (= res!291306 (or (= lt!220313 (MissingZero!3659 i!1204)) (= lt!220313 (MissingVacant!3659 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31603 (_ BitVec 32)) SeekEntryResult!3659)

(assert (=> b!488143 (= lt!220313 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488144 () Bool)

(declare-fun res!291308 () Bool)

(assert (=> b!488144 (=> (not res!291308) (not e!287190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488144 (= res!291308 (validKeyInArray!0 k!2280))))

(declare-fun b!488145 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!287193 () Bool)

(assert (=> b!488145 (= e!287193 (= (seekEntryOrOpen!0 (select (arr!15192 a!3235) j!176) a!3235 mask!3524) (Found!3659 j!176)))))

(declare-fun b!488146 () Bool)

(assert (=> b!488146 (= e!287192 (not true))))

(declare-fun lt!220315 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488146 (= lt!220315 (toIndex!0 (select (arr!15192 a!3235) j!176) mask!3524))))

(assert (=> b!488146 e!287193))

(declare-fun res!291304 () Bool)

(assert (=> b!488146 (=> (not res!291304) (not e!287193))))

(assert (=> b!488146 (= res!291304 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14264 0))(
  ( (Unit!14265) )
))
(declare-fun lt!220314 () Unit!14264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14264)

(assert (=> b!488146 (= lt!220314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!291310 () Bool)

(assert (=> start!44448 (=> (not res!291310) (not e!287190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44448 (= res!291310 (validMask!0 mask!3524))))

(assert (=> start!44448 e!287190))

(assert (=> start!44448 true))

(declare-fun array_inv!10988 (array!31603) Bool)

(assert (=> start!44448 (array_inv!10988 a!3235)))

(declare-fun b!488147 () Bool)

(declare-fun res!291311 () Bool)

(assert (=> b!488147 (=> (not res!291311) (not e!287192))))

(declare-datatypes ((List!9350 0))(
  ( (Nil!9347) (Cons!9346 (h!10205 (_ BitVec 64)) (t!15578 List!9350)) )
))
(declare-fun arrayNoDuplicates!0 (array!31603 (_ BitVec 32) List!9350) Bool)

(assert (=> b!488147 (= res!291311 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9347))))

(declare-fun b!488148 () Bool)

(declare-fun res!291305 () Bool)

(assert (=> b!488148 (=> (not res!291305) (not e!287190))))

(assert (=> b!488148 (= res!291305 (and (= (size!15556 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15556 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15556 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488149 () Bool)

(declare-fun res!291303 () Bool)

(assert (=> b!488149 (=> (not res!291303) (not e!287190))))

(assert (=> b!488149 (= res!291303 (validKeyInArray!0 (select (arr!15192 a!3235) j!176)))))

(declare-fun b!488150 () Bool)

(declare-fun res!291309 () Bool)

(assert (=> b!488150 (=> (not res!291309) (not e!287190))))

(declare-fun arrayContainsKey!0 (array!31603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488150 (= res!291309 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44448 res!291310) b!488148))

(assert (= (and b!488148 res!291305) b!488149))

(assert (= (and b!488149 res!291303) b!488144))

(assert (= (and b!488144 res!291308) b!488150))

(assert (= (and b!488150 res!291309) b!488143))

(assert (= (and b!488143 res!291306) b!488142))

(assert (= (and b!488142 res!291307) b!488147))

(assert (= (and b!488147 res!291311) b!488146))

(assert (= (and b!488146 res!291304) b!488145))

(declare-fun m!467895 () Bool)

(assert (=> start!44448 m!467895))

(declare-fun m!467897 () Bool)

(assert (=> start!44448 m!467897))

(declare-fun m!467899 () Bool)

(assert (=> b!488147 m!467899))

(declare-fun m!467901 () Bool)

(assert (=> b!488143 m!467901))

(declare-fun m!467903 () Bool)

(assert (=> b!488146 m!467903))

(assert (=> b!488146 m!467903))

(declare-fun m!467905 () Bool)

(assert (=> b!488146 m!467905))

(declare-fun m!467907 () Bool)

(assert (=> b!488146 m!467907))

(declare-fun m!467909 () Bool)

(assert (=> b!488146 m!467909))

(declare-fun m!467911 () Bool)

(assert (=> b!488142 m!467911))

(assert (=> b!488145 m!467903))

(assert (=> b!488145 m!467903))

(declare-fun m!467913 () Bool)

(assert (=> b!488145 m!467913))

(assert (=> b!488149 m!467903))

(assert (=> b!488149 m!467903))

(declare-fun m!467915 () Bool)

(assert (=> b!488149 m!467915))

(declare-fun m!467917 () Bool)

(assert (=> b!488144 m!467917))

(declare-fun m!467919 () Bool)

(assert (=> b!488150 m!467919))

(push 1)

