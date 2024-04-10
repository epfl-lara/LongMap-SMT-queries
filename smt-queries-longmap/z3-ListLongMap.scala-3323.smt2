; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45884 () Bool)

(assert start!45884)

(declare-fun b!508223 () Bool)

(declare-fun e!297347 () Bool)

(declare-fun e!297346 () Bool)

(assert (=> b!508223 (= e!297347 e!297346)))

(declare-fun res!309188 () Bool)

(assert (=> b!508223 (=> (not res!309188) (not e!297346))))

(declare-datatypes ((SeekEntryResult!4167 0))(
  ( (MissingZero!4167 (index!18856 (_ BitVec 32))) (Found!4167 (index!18857 (_ BitVec 32))) (Intermediate!4167 (undefined!4979 Bool) (index!18858 (_ BitVec 32)) (x!47840 (_ BitVec 32))) (Undefined!4167) (MissingVacant!4167 (index!18859 (_ BitVec 32))) )
))
(declare-fun lt!232179 () SeekEntryResult!4167)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508223 (= res!309188 (or (= lt!232179 (MissingZero!4167 i!1204)) (= lt!232179 (MissingVacant!4167 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32640 0))(
  ( (array!32641 (arr!15700 (Array (_ BitVec 32) (_ BitVec 64))) (size!16064 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32640)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32640 (_ BitVec 32)) SeekEntryResult!4167)

(assert (=> b!508223 (= lt!232179 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508224 () Bool)

(declare-fun res!309185 () Bool)

(assert (=> b!508224 (=> (not res!309185) (not e!297347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508224 (= res!309185 (validKeyInArray!0 k0!2280))))

(declare-fun b!508225 () Bool)

(declare-fun res!309184 () Bool)

(assert (=> b!508225 (=> (not res!309184) (not e!297347))))

(declare-fun arrayContainsKey!0 (array!32640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508225 (= res!309184 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508226 () Bool)

(assert (=> b!508226 (= e!297346 false)))

(declare-fun lt!232180 () Bool)

(declare-datatypes ((List!9858 0))(
  ( (Nil!9855) (Cons!9854 (h!10731 (_ BitVec 64)) (t!16086 List!9858)) )
))
(declare-fun arrayNoDuplicates!0 (array!32640 (_ BitVec 32) List!9858) Bool)

(assert (=> b!508226 (= lt!232180 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9855))))

(declare-fun b!508227 () Bool)

(declare-fun res!309186 () Bool)

(assert (=> b!508227 (=> (not res!309186) (not e!297347))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508227 (= res!309186 (validKeyInArray!0 (select (arr!15700 a!3235) j!176)))))

(declare-fun b!508228 () Bool)

(declare-fun res!309182 () Bool)

(assert (=> b!508228 (=> (not res!309182) (not e!297346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32640 (_ BitVec 32)) Bool)

(assert (=> b!508228 (= res!309182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508229 () Bool)

(declare-fun res!309187 () Bool)

(assert (=> b!508229 (=> (not res!309187) (not e!297347))))

(assert (=> b!508229 (= res!309187 (and (= (size!16064 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16064 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16064 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!309183 () Bool)

(assert (=> start!45884 (=> (not res!309183) (not e!297347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45884 (= res!309183 (validMask!0 mask!3524))))

(assert (=> start!45884 e!297347))

(assert (=> start!45884 true))

(declare-fun array_inv!11496 (array!32640) Bool)

(assert (=> start!45884 (array_inv!11496 a!3235)))

(assert (= (and start!45884 res!309183) b!508229))

(assert (= (and b!508229 res!309187) b!508227))

(assert (= (and b!508227 res!309186) b!508224))

(assert (= (and b!508224 res!309185) b!508225))

(assert (= (and b!508225 res!309184) b!508223))

(assert (= (and b!508223 res!309188) b!508228))

(assert (= (and b!508228 res!309182) b!508226))

(declare-fun m!489021 () Bool)

(assert (=> b!508226 m!489021))

(declare-fun m!489023 () Bool)

(assert (=> b!508223 m!489023))

(declare-fun m!489025 () Bool)

(assert (=> b!508225 m!489025))

(declare-fun m!489027 () Bool)

(assert (=> b!508227 m!489027))

(assert (=> b!508227 m!489027))

(declare-fun m!489029 () Bool)

(assert (=> b!508227 m!489029))

(declare-fun m!489031 () Bool)

(assert (=> start!45884 m!489031))

(declare-fun m!489033 () Bool)

(assert (=> start!45884 m!489033))

(declare-fun m!489035 () Bool)

(assert (=> b!508228 m!489035))

(declare-fun m!489037 () Bool)

(assert (=> b!508224 m!489037))

(check-sat (not b!508224) (not b!508223) (not start!45884) (not b!508228) (not b!508226) (not b!508227) (not b!508225))
(check-sat)
