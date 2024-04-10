; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44454 () Bool)

(assert start!44454)

(declare-fun b!488223 () Bool)

(declare-fun res!291392 () Bool)

(declare-fun e!287227 () Bool)

(assert (=> b!488223 (=> (not res!291392) (not e!287227))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31609 0))(
  ( (array!31610 (arr!15195 (Array (_ BitVec 32) (_ BitVec 64))) (size!15559 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31609)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488223 (= res!291392 (and (= (size!15559 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15559 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15559 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!291390 () Bool)

(assert (=> start!44454 (=> (not res!291390) (not e!287227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44454 (= res!291390 (validMask!0 mask!3524))))

(assert (=> start!44454 e!287227))

(assert (=> start!44454 true))

(declare-fun array_inv!10991 (array!31609) Bool)

(assert (=> start!44454 (array_inv!10991 a!3235)))

(declare-fun b!488224 () Bool)

(declare-fun e!287228 () Bool)

(assert (=> b!488224 (= e!287228 (not true))))

(declare-fun lt!220341 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488224 (= lt!220341 (toIndex!0 (select (arr!15195 a!3235) j!176) mask!3524))))

(declare-fun e!287226 () Bool)

(assert (=> b!488224 e!287226))

(declare-fun res!291388 () Bool)

(assert (=> b!488224 (=> (not res!291388) (not e!287226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31609 (_ BitVec 32)) Bool)

(assert (=> b!488224 (= res!291388 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14270 0))(
  ( (Unit!14271) )
))
(declare-fun lt!220342 () Unit!14270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14270)

(assert (=> b!488224 (= lt!220342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488225 () Bool)

(declare-fun res!291386 () Bool)

(assert (=> b!488225 (=> (not res!291386) (not e!287227))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488225 (= res!291386 (validKeyInArray!0 k!2280))))

(declare-fun b!488226 () Bool)

(assert (=> b!488226 (= e!287227 e!287228)))

(declare-fun res!291387 () Bool)

(assert (=> b!488226 (=> (not res!291387) (not e!287228))))

(declare-datatypes ((SeekEntryResult!3662 0))(
  ( (MissingZero!3662 (index!16827 (_ BitVec 32))) (Found!3662 (index!16828 (_ BitVec 32))) (Intermediate!3662 (undefined!4474 Bool) (index!16829 (_ BitVec 32)) (x!45949 (_ BitVec 32))) (Undefined!3662) (MissingVacant!3662 (index!16830 (_ BitVec 32))) )
))
(declare-fun lt!220340 () SeekEntryResult!3662)

(assert (=> b!488226 (= res!291387 (or (= lt!220340 (MissingZero!3662 i!1204)) (= lt!220340 (MissingVacant!3662 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31609 (_ BitVec 32)) SeekEntryResult!3662)

(assert (=> b!488226 (= lt!220340 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488227 () Bool)

(declare-fun res!291385 () Bool)

(assert (=> b!488227 (=> (not res!291385) (not e!287228))))

(assert (=> b!488227 (= res!291385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488228 () Bool)

(declare-fun res!291384 () Bool)

(assert (=> b!488228 (=> (not res!291384) (not e!287227))))

(declare-fun arrayContainsKey!0 (array!31609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488228 (= res!291384 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488229 () Bool)

(assert (=> b!488229 (= e!287226 (= (seekEntryOrOpen!0 (select (arr!15195 a!3235) j!176) a!3235 mask!3524) (Found!3662 j!176)))))

(declare-fun b!488230 () Bool)

(declare-fun res!291391 () Bool)

(assert (=> b!488230 (=> (not res!291391) (not e!287228))))

(declare-datatypes ((List!9353 0))(
  ( (Nil!9350) (Cons!9349 (h!10208 (_ BitVec 64)) (t!15581 List!9353)) )
))
(declare-fun arrayNoDuplicates!0 (array!31609 (_ BitVec 32) List!9353) Bool)

(assert (=> b!488230 (= res!291391 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9350))))

(declare-fun b!488231 () Bool)

(declare-fun res!291389 () Bool)

(assert (=> b!488231 (=> (not res!291389) (not e!287227))))

(assert (=> b!488231 (= res!291389 (validKeyInArray!0 (select (arr!15195 a!3235) j!176)))))

(assert (= (and start!44454 res!291390) b!488223))

(assert (= (and b!488223 res!291392) b!488231))

(assert (= (and b!488231 res!291389) b!488225))

(assert (= (and b!488225 res!291386) b!488228))

(assert (= (and b!488228 res!291384) b!488226))

(assert (= (and b!488226 res!291387) b!488227))

(assert (= (and b!488227 res!291385) b!488230))

(assert (= (and b!488230 res!291391) b!488224))

(assert (= (and b!488224 res!291388) b!488229))

(declare-fun m!467973 () Bool)

(assert (=> b!488229 m!467973))

(assert (=> b!488229 m!467973))

(declare-fun m!467975 () Bool)

(assert (=> b!488229 m!467975))

(declare-fun m!467977 () Bool)

(assert (=> b!488230 m!467977))

(declare-fun m!467979 () Bool)

(assert (=> b!488226 m!467979))

(declare-fun m!467981 () Bool)

(assert (=> b!488228 m!467981))

(declare-fun m!467983 () Bool)

(assert (=> start!44454 m!467983))

(declare-fun m!467985 () Bool)

(assert (=> start!44454 m!467985))

(assert (=> b!488231 m!467973))

(assert (=> b!488231 m!467973))

(declare-fun m!467987 () Bool)

(assert (=> b!488231 m!467987))

(declare-fun m!467989 () Bool)

(assert (=> b!488227 m!467989))

(assert (=> b!488224 m!467973))

(assert (=> b!488224 m!467973))

(declare-fun m!467991 () Bool)

(assert (=> b!488224 m!467991))

(declare-fun m!467993 () Bool)

(assert (=> b!488224 m!467993))

(declare-fun m!467995 () Bool)

(assert (=> b!488224 m!467995))

(declare-fun m!467997 () Bool)

(assert (=> b!488225 m!467997))

(push 1)

