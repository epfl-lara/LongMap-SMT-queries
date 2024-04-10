; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45882 () Bool)

(assert start!45882)

(declare-fun b!508202 () Bool)

(declare-fun e!297339 () Bool)

(assert (=> b!508202 (= e!297339 false)))

(declare-fun lt!232174 () Bool)

(declare-datatypes ((array!32638 0))(
  ( (array!32639 (arr!15699 (Array (_ BitVec 32) (_ BitVec 64))) (size!16063 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32638)

(declare-datatypes ((List!9857 0))(
  ( (Nil!9854) (Cons!9853 (h!10730 (_ BitVec 64)) (t!16085 List!9857)) )
))
(declare-fun arrayNoDuplicates!0 (array!32638 (_ BitVec 32) List!9857) Bool)

(assert (=> b!508202 (= lt!232174 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9854))))

(declare-fun b!508203 () Bool)

(declare-fun res!309161 () Bool)

(declare-fun e!297337 () Bool)

(assert (=> b!508203 (=> (not res!309161) (not e!297337))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508203 (= res!309161 (and (= (size!16063 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16063 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16063 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508204 () Bool)

(declare-fun res!309167 () Bool)

(assert (=> b!508204 (=> (not res!309167) (not e!297337))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508204 (= res!309167 (validKeyInArray!0 k!2280))))

(declare-fun b!508206 () Bool)

(declare-fun res!309163 () Bool)

(assert (=> b!508206 (=> (not res!309163) (not e!297339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32638 (_ BitVec 32)) Bool)

(assert (=> b!508206 (= res!309163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508207 () Bool)

(declare-fun res!309166 () Bool)

(assert (=> b!508207 (=> (not res!309166) (not e!297337))))

(assert (=> b!508207 (= res!309166 (validKeyInArray!0 (select (arr!15699 a!3235) j!176)))))

(declare-fun b!508208 () Bool)

(assert (=> b!508208 (= e!297337 e!297339)))

(declare-fun res!309162 () Bool)

(assert (=> b!508208 (=> (not res!309162) (not e!297339))))

(declare-datatypes ((SeekEntryResult!4166 0))(
  ( (MissingZero!4166 (index!18852 (_ BitVec 32))) (Found!4166 (index!18853 (_ BitVec 32))) (Intermediate!4166 (undefined!4978 Bool) (index!18854 (_ BitVec 32)) (x!47839 (_ BitVec 32))) (Undefined!4166) (MissingVacant!4166 (index!18855 (_ BitVec 32))) )
))
(declare-fun lt!232173 () SeekEntryResult!4166)

(assert (=> b!508208 (= res!309162 (or (= lt!232173 (MissingZero!4166 i!1204)) (= lt!232173 (MissingVacant!4166 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32638 (_ BitVec 32)) SeekEntryResult!4166)

(assert (=> b!508208 (= lt!232173 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508205 () Bool)

(declare-fun res!309165 () Bool)

(assert (=> b!508205 (=> (not res!309165) (not e!297337))))

(declare-fun arrayContainsKey!0 (array!32638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508205 (= res!309165 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309164 () Bool)

(assert (=> start!45882 (=> (not res!309164) (not e!297337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45882 (= res!309164 (validMask!0 mask!3524))))

(assert (=> start!45882 e!297337))

(assert (=> start!45882 true))

(declare-fun array_inv!11495 (array!32638) Bool)

(assert (=> start!45882 (array_inv!11495 a!3235)))

(assert (= (and start!45882 res!309164) b!508203))

(assert (= (and b!508203 res!309161) b!508207))

(assert (= (and b!508207 res!309166) b!508204))

(assert (= (and b!508204 res!309167) b!508205))

(assert (= (and b!508205 res!309165) b!508208))

(assert (= (and b!508208 res!309162) b!508206))

(assert (= (and b!508206 res!309163) b!508202))

(declare-fun m!489003 () Bool)

(assert (=> b!508207 m!489003))

(assert (=> b!508207 m!489003))

(declare-fun m!489005 () Bool)

(assert (=> b!508207 m!489005))

(declare-fun m!489007 () Bool)

(assert (=> b!508202 m!489007))

(declare-fun m!489009 () Bool)

(assert (=> b!508204 m!489009))

(declare-fun m!489011 () Bool)

(assert (=> b!508206 m!489011))

(declare-fun m!489013 () Bool)

(assert (=> start!45882 m!489013))

(declare-fun m!489015 () Bool)

(assert (=> start!45882 m!489015))

(declare-fun m!489017 () Bool)

(assert (=> b!508205 m!489017))

(declare-fun m!489019 () Bool)

(assert (=> b!508208 m!489019))

(push 1)

