; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45888 () Bool)

(assert start!45888)

(declare-fun b!508267 () Bool)

(declare-fun res!309226 () Bool)

(declare-fun e!297364 () Bool)

(assert (=> b!508267 (=> (not res!309226) (not e!297364))))

(declare-datatypes ((array!32644 0))(
  ( (array!32645 (arr!15702 (Array (_ BitVec 32) (_ BitVec 64))) (size!16066 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32644)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32644 (_ BitVec 32)) Bool)

(assert (=> b!508267 (= res!309226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508268 () Bool)

(declare-fun res!309233 () Bool)

(assert (=> b!508268 (=> (not res!309233) (not e!297364))))

(declare-datatypes ((List!9860 0))(
  ( (Nil!9857) (Cons!9856 (h!10733 (_ BitVec 64)) (t!16088 List!9860)) )
))
(declare-fun arrayNoDuplicates!0 (array!32644 (_ BitVec 32) List!9860) Bool)

(assert (=> b!508268 (= res!309233 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9857))))

(declare-fun res!309232 () Bool)

(declare-fun e!297366 () Bool)

(assert (=> start!45888 (=> (not res!309232) (not e!297366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45888 (= res!309232 (validMask!0 mask!3524))))

(assert (=> start!45888 e!297366))

(assert (=> start!45888 true))

(declare-fun array_inv!11498 (array!32644) Bool)

(assert (=> start!45888 (array_inv!11498 a!3235)))

(declare-fun b!508269 () Bool)

(declare-fun res!309230 () Bool)

(assert (=> b!508269 (=> (not res!309230) (not e!297366))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508269 (= res!309230 (validKeyInArray!0 k!2280))))

(declare-fun b!508270 () Bool)

(declare-fun res!309228 () Bool)

(assert (=> b!508270 (=> (not res!309228) (not e!297366))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508270 (= res!309228 (and (= (size!16066 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16066 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16066 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508271 () Bool)

(declare-fun res!309231 () Bool)

(assert (=> b!508271 (=> (not res!309231) (not e!297366))))

(declare-fun arrayContainsKey!0 (array!32644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508271 (= res!309231 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508272 () Bool)

(assert (=> b!508272 (= e!297366 e!297364)))

(declare-fun res!309229 () Bool)

(assert (=> b!508272 (=> (not res!309229) (not e!297364))))

(declare-datatypes ((SeekEntryResult!4169 0))(
  ( (MissingZero!4169 (index!18864 (_ BitVec 32))) (Found!4169 (index!18865 (_ BitVec 32))) (Intermediate!4169 (undefined!4981 Bool) (index!18866 (_ BitVec 32)) (x!47850 (_ BitVec 32))) (Undefined!4169) (MissingVacant!4169 (index!18867 (_ BitVec 32))) )
))
(declare-fun lt!232192 () SeekEntryResult!4169)

(assert (=> b!508272 (= res!309229 (or (= lt!232192 (MissingZero!4169 i!1204)) (= lt!232192 (MissingVacant!4169 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32644 (_ BitVec 32)) SeekEntryResult!4169)

(assert (=> b!508272 (= lt!232192 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508273 () Bool)

(declare-fun res!309227 () Bool)

(assert (=> b!508273 (=> (not res!309227) (not e!297366))))

(assert (=> b!508273 (= res!309227 (validKeyInArray!0 (select (arr!15702 a!3235) j!176)))))

(declare-fun b!508274 () Bool)

(assert (=> b!508274 (= e!297364 (not true))))

(assert (=> b!508274 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15596 0))(
  ( (Unit!15597) )
))
(declare-fun lt!232191 () Unit!15596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15596)

(assert (=> b!508274 (= lt!232191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45888 res!309232) b!508270))

(assert (= (and b!508270 res!309228) b!508273))

(assert (= (and b!508273 res!309227) b!508269))

(assert (= (and b!508269 res!309230) b!508271))

(assert (= (and b!508271 res!309231) b!508272))

(assert (= (and b!508272 res!309229) b!508267))

(assert (= (and b!508267 res!309226) b!508268))

(assert (= (and b!508268 res!309233) b!508274))

(declare-fun m!489057 () Bool)

(assert (=> b!508273 m!489057))

(assert (=> b!508273 m!489057))

(declare-fun m!489059 () Bool)

(assert (=> b!508273 m!489059))

(declare-fun m!489061 () Bool)

(assert (=> b!508267 m!489061))

(declare-fun m!489063 () Bool)

(assert (=> start!45888 m!489063))

(declare-fun m!489065 () Bool)

(assert (=> start!45888 m!489065))

(declare-fun m!489067 () Bool)

(assert (=> b!508268 m!489067))

(declare-fun m!489069 () Bool)

(assert (=> b!508272 m!489069))

(declare-fun m!489071 () Bool)

(assert (=> b!508269 m!489071))

(declare-fun m!489073 () Bool)

(assert (=> b!508271 m!489073))

(declare-fun m!489075 () Bool)

(assert (=> b!508274 m!489075))

(declare-fun m!489077 () Bool)

(assert (=> b!508274 m!489077))

(push 1)

