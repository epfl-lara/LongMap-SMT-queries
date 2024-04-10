; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45880 () Bool)

(assert start!45880)

(declare-fun b!508180 () Bool)

(declare-fun res!309144 () Bool)

(declare-fun e!297329 () Bool)

(assert (=> b!508180 (=> (not res!309144) (not e!297329))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508180 (= res!309144 (validKeyInArray!0 k!2280))))

(declare-fun b!508181 () Bool)

(declare-fun res!309141 () Bool)

(declare-fun e!297330 () Bool)

(assert (=> b!508181 (=> (not res!309141) (not e!297330))))

(declare-datatypes ((array!32636 0))(
  ( (array!32637 (arr!15698 (Array (_ BitVec 32) (_ BitVec 64))) (size!16062 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32636)

(declare-datatypes ((List!9856 0))(
  ( (Nil!9853) (Cons!9852 (h!10729 (_ BitVec 64)) (t!16084 List!9856)) )
))
(declare-fun arrayNoDuplicates!0 (array!32636 (_ BitVec 32) List!9856) Bool)

(assert (=> b!508181 (= res!309141 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9853))))

(declare-fun b!508183 () Bool)

(declare-fun res!309140 () Bool)

(assert (=> b!508183 (=> (not res!309140) (not e!297329))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508183 (= res!309140 (and (= (size!16062 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16062 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16062 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508184 () Bool)

(declare-fun res!309139 () Bool)

(assert (=> b!508184 (=> (not res!309139) (not e!297329))))

(declare-fun arrayContainsKey!0 (array!32636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508184 (= res!309139 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508185 () Bool)

(declare-fun res!309145 () Bool)

(assert (=> b!508185 (=> (not res!309145) (not e!297330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32636 (_ BitVec 32)) Bool)

(assert (=> b!508185 (= res!309145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508186 () Bool)

(assert (=> b!508186 (= e!297330 (and (bvsle #b00000000000000000000000000000000 (size!16062 a!3235)) (bvsgt j!176 (size!16062 a!3235))))))

(declare-fun b!508187 () Bool)

(declare-fun res!309142 () Bool)

(assert (=> b!508187 (=> (not res!309142) (not e!297329))))

(assert (=> b!508187 (= res!309142 (validKeyInArray!0 (select (arr!15698 a!3235) j!176)))))

(declare-fun b!508182 () Bool)

(assert (=> b!508182 (= e!297329 e!297330)))

(declare-fun res!309146 () Bool)

(assert (=> b!508182 (=> (not res!309146) (not e!297330))))

(declare-datatypes ((SeekEntryResult!4165 0))(
  ( (MissingZero!4165 (index!18848 (_ BitVec 32))) (Found!4165 (index!18849 (_ BitVec 32))) (Intermediate!4165 (undefined!4977 Bool) (index!18850 (_ BitVec 32)) (x!47830 (_ BitVec 32))) (Undefined!4165) (MissingVacant!4165 (index!18851 (_ BitVec 32))) )
))
(declare-fun lt!232168 () SeekEntryResult!4165)

(assert (=> b!508182 (= res!309146 (or (= lt!232168 (MissingZero!4165 i!1204)) (= lt!232168 (MissingVacant!4165 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32636 (_ BitVec 32)) SeekEntryResult!4165)

(assert (=> b!508182 (= lt!232168 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!309143 () Bool)

(assert (=> start!45880 (=> (not res!309143) (not e!297329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45880 (= res!309143 (validMask!0 mask!3524))))

(assert (=> start!45880 e!297329))

(assert (=> start!45880 true))

(declare-fun array_inv!11494 (array!32636) Bool)

(assert (=> start!45880 (array_inv!11494 a!3235)))

(assert (= (and start!45880 res!309143) b!508183))

(assert (= (and b!508183 res!309140) b!508187))

(assert (= (and b!508187 res!309142) b!508180))

(assert (= (and b!508180 res!309144) b!508184))

(assert (= (and b!508184 res!309139) b!508182))

(assert (= (and b!508182 res!309146) b!508185))

(assert (= (and b!508185 res!309145) b!508181))

(assert (= (and b!508181 res!309141) b!508186))

(declare-fun m!488985 () Bool)

(assert (=> start!45880 m!488985))

(declare-fun m!488987 () Bool)

(assert (=> start!45880 m!488987))

(declare-fun m!488989 () Bool)

(assert (=> b!508185 m!488989))

(declare-fun m!488991 () Bool)

(assert (=> b!508181 m!488991))

(declare-fun m!488993 () Bool)

(assert (=> b!508184 m!488993))

(declare-fun m!488995 () Bool)

(assert (=> b!508180 m!488995))

(declare-fun m!488997 () Bool)

(assert (=> b!508187 m!488997))

(assert (=> b!508187 m!488997))

(declare-fun m!488999 () Bool)

(assert (=> b!508187 m!488999))

(declare-fun m!489001 () Bool)

(assert (=> b!508182 m!489001))

(push 1)

(assert (not b!508187))

(assert (not start!45880))

(assert (not b!508184))

(assert (not b!508181))

(assert (not b!508185))

(assert (not b!508180))

(assert (not b!508182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

