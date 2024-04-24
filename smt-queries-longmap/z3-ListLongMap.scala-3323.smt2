; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45872 () Bool)

(assert start!45872)

(declare-fun res!309157 () Bool)

(declare-fun e!297300 () Bool)

(assert (=> start!45872 (=> (not res!309157) (not e!297300))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45872 (= res!309157 (validMask!0 mask!3524))))

(assert (=> start!45872 e!297300))

(assert (=> start!45872 true))

(declare-datatypes ((array!32629 0))(
  ( (array!32630 (arr!15694 (Array (_ BitVec 32) (_ BitVec 64))) (size!16058 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32629)

(declare-fun array_inv!11553 (array!32629) Bool)

(assert (=> start!45872 (array_inv!11553 a!3235)))

(declare-fun b!508141 () Bool)

(declare-fun res!309160 () Bool)

(assert (=> b!508141 (=> (not res!309160) (not e!297300))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508141 (= res!309160 (and (= (size!16058 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16058 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16058 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508142 () Bool)

(declare-fun res!309155 () Bool)

(assert (=> b!508142 (=> (not res!309155) (not e!297300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508142 (= res!309155 (validKeyInArray!0 (select (arr!15694 a!3235) j!176)))))

(declare-fun b!508143 () Bool)

(declare-fun e!297299 () Bool)

(assert (=> b!508143 (= e!297299 false)))

(declare-fun lt!232186 () Bool)

(declare-datatypes ((List!9759 0))(
  ( (Nil!9756) (Cons!9755 (h!10632 (_ BitVec 64)) (t!15979 List!9759)) )
))
(declare-fun arrayNoDuplicates!0 (array!32629 (_ BitVec 32) List!9759) Bool)

(assert (=> b!508143 (= lt!232186 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9756))))

(declare-fun b!508144 () Bool)

(declare-fun res!309156 () Bool)

(assert (=> b!508144 (=> (not res!309156) (not e!297300))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!508144 (= res!309156 (validKeyInArray!0 k0!2280))))

(declare-fun b!508145 () Bool)

(assert (=> b!508145 (= e!297300 e!297299)))

(declare-fun res!309159 () Bool)

(assert (=> b!508145 (=> (not res!309159) (not e!297299))))

(declare-datatypes ((SeekEntryResult!4117 0))(
  ( (MissingZero!4117 (index!18656 (_ BitVec 32))) (Found!4117 (index!18657 (_ BitVec 32))) (Intermediate!4117 (undefined!4929 Bool) (index!18658 (_ BitVec 32)) (x!47787 (_ BitVec 32))) (Undefined!4117) (MissingVacant!4117 (index!18659 (_ BitVec 32))) )
))
(declare-fun lt!232185 () SeekEntryResult!4117)

(assert (=> b!508145 (= res!309159 (or (= lt!232185 (MissingZero!4117 i!1204)) (= lt!232185 (MissingVacant!4117 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32629 (_ BitVec 32)) SeekEntryResult!4117)

(assert (=> b!508145 (= lt!232185 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508146 () Bool)

(declare-fun res!309154 () Bool)

(assert (=> b!508146 (=> (not res!309154) (not e!297299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32629 (_ BitVec 32)) Bool)

(assert (=> b!508146 (= res!309154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508147 () Bool)

(declare-fun res!309158 () Bool)

(assert (=> b!508147 (=> (not res!309158) (not e!297300))))

(declare-fun arrayContainsKey!0 (array!32629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508147 (= res!309158 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45872 res!309157) b!508141))

(assert (= (and b!508141 res!309160) b!508142))

(assert (= (and b!508142 res!309155) b!508144))

(assert (= (and b!508144 res!309156) b!508147))

(assert (= (and b!508147 res!309158) b!508145))

(assert (= (and b!508145 res!309159) b!508146))

(assert (= (and b!508146 res!309154) b!508143))

(declare-fun m!489187 () Bool)

(assert (=> b!508143 m!489187))

(declare-fun m!489189 () Bool)

(assert (=> b!508147 m!489189))

(declare-fun m!489191 () Bool)

(assert (=> start!45872 m!489191))

(declare-fun m!489193 () Bool)

(assert (=> start!45872 m!489193))

(declare-fun m!489195 () Bool)

(assert (=> b!508146 m!489195))

(declare-fun m!489197 () Bool)

(assert (=> b!508145 m!489197))

(declare-fun m!489199 () Bool)

(assert (=> b!508144 m!489199))

(declare-fun m!489201 () Bool)

(assert (=> b!508142 m!489201))

(assert (=> b!508142 m!489201))

(declare-fun m!489203 () Bool)

(assert (=> b!508142 m!489203))

(check-sat (not b!508146) (not b!508143) (not b!508147) (not b!508144) (not b!508142) (not b!508145) (not start!45872))
(check-sat)
