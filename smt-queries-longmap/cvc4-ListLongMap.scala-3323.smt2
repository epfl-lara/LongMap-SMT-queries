; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45886 () Bool)

(assert start!45886)

(declare-fun b!508244 () Bool)

(declare-fun res!309207 () Bool)

(declare-fun e!297355 () Bool)

(assert (=> b!508244 (=> (not res!309207) (not e!297355))))

(declare-datatypes ((array!32642 0))(
  ( (array!32643 (arr!15701 (Array (_ BitVec 32) (_ BitVec 64))) (size!16065 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32642)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32642 (_ BitVec 32)) Bool)

(assert (=> b!508244 (= res!309207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508245 () Bool)

(declare-fun res!309204 () Bool)

(declare-fun e!297357 () Bool)

(assert (=> b!508245 (=> (not res!309204) (not e!297357))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508245 (= res!309204 (validKeyInArray!0 (select (arr!15701 a!3235) j!176)))))

(declare-fun b!508246 () Bool)

(declare-fun res!309208 () Bool)

(assert (=> b!508246 (=> (not res!309208) (not e!297357))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!508246 (= res!309208 (validKeyInArray!0 k!2280))))

(declare-fun b!508247 () Bool)

(declare-fun res!309209 () Bool)

(assert (=> b!508247 (=> (not res!309209) (not e!297357))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508247 (= res!309209 (and (= (size!16065 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16065 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16065 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508248 () Bool)

(assert (=> b!508248 (= e!297355 false)))

(declare-fun lt!232185 () Bool)

(declare-datatypes ((List!9859 0))(
  ( (Nil!9856) (Cons!9855 (h!10732 (_ BitVec 64)) (t!16087 List!9859)) )
))
(declare-fun arrayNoDuplicates!0 (array!32642 (_ BitVec 32) List!9859) Bool)

(assert (=> b!508248 (= lt!232185 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9856))))

(declare-fun b!508249 () Bool)

(declare-fun res!309205 () Bool)

(assert (=> b!508249 (=> (not res!309205) (not e!297357))))

(declare-fun arrayContainsKey!0 (array!32642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508249 (= res!309205 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309203 () Bool)

(assert (=> start!45886 (=> (not res!309203) (not e!297357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45886 (= res!309203 (validMask!0 mask!3524))))

(assert (=> start!45886 e!297357))

(assert (=> start!45886 true))

(declare-fun array_inv!11497 (array!32642) Bool)

(assert (=> start!45886 (array_inv!11497 a!3235)))

(declare-fun b!508250 () Bool)

(assert (=> b!508250 (= e!297357 e!297355)))

(declare-fun res!309206 () Bool)

(assert (=> b!508250 (=> (not res!309206) (not e!297355))))

(declare-datatypes ((SeekEntryResult!4168 0))(
  ( (MissingZero!4168 (index!18860 (_ BitVec 32))) (Found!4168 (index!18861 (_ BitVec 32))) (Intermediate!4168 (undefined!4980 Bool) (index!18862 (_ BitVec 32)) (x!47841 (_ BitVec 32))) (Undefined!4168) (MissingVacant!4168 (index!18863 (_ BitVec 32))) )
))
(declare-fun lt!232186 () SeekEntryResult!4168)

(assert (=> b!508250 (= res!309206 (or (= lt!232186 (MissingZero!4168 i!1204)) (= lt!232186 (MissingVacant!4168 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32642 (_ BitVec 32)) SeekEntryResult!4168)

(assert (=> b!508250 (= lt!232186 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45886 res!309203) b!508247))

(assert (= (and b!508247 res!309209) b!508245))

(assert (= (and b!508245 res!309204) b!508246))

(assert (= (and b!508246 res!309208) b!508249))

(assert (= (and b!508249 res!309205) b!508250))

(assert (= (and b!508250 res!309206) b!508244))

(assert (= (and b!508244 res!309207) b!508248))

(declare-fun m!489039 () Bool)

(assert (=> b!508246 m!489039))

(declare-fun m!489041 () Bool)

(assert (=> b!508249 m!489041))

(declare-fun m!489043 () Bool)

(assert (=> b!508248 m!489043))

(declare-fun m!489045 () Bool)

(assert (=> b!508245 m!489045))

(assert (=> b!508245 m!489045))

(declare-fun m!489047 () Bool)

(assert (=> b!508245 m!489047))

(declare-fun m!489049 () Bool)

(assert (=> b!508250 m!489049))

(declare-fun m!489051 () Bool)

(assert (=> b!508244 m!489051))

(declare-fun m!489053 () Bool)

(assert (=> start!45886 m!489053))

(declare-fun m!489055 () Bool)

(assert (=> start!45886 m!489055))

(push 1)

