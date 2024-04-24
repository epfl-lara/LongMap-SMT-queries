; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45020 () Bool)

(assert start!45020)

(declare-fun b!494035 () Bool)

(declare-fun e!290010 () Bool)

(assert (=> b!494035 (= e!290010 true)))

(declare-datatypes ((SeekEntryResult!3790 0))(
  ( (MissingZero!3790 (index!17339 (_ BitVec 32))) (Found!3790 (index!17340 (_ BitVec 32))) (Intermediate!3790 (undefined!4602 Bool) (index!17341 (_ BitVec 32)) (x!46561 (_ BitVec 32))) (Undefined!3790) (MissingVacant!3790 (index!17342 (_ BitVec 32))) )
))
(declare-fun lt!223579 () SeekEntryResult!3790)

(assert (=> b!494035 (= lt!223579 Undefined!3790)))

(declare-fun b!494036 () Bool)

(declare-fun e!290007 () Bool)

(declare-fun e!290009 () Bool)

(assert (=> b!494036 (= e!290007 e!290009)))

(declare-fun res!296665 () Bool)

(assert (=> b!494036 (=> (not res!296665) (not e!290009))))

(declare-fun lt!223577 () SeekEntryResult!3790)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494036 (= res!296665 (or (= lt!223577 (MissingZero!3790 i!1204)) (= lt!223577 (MissingVacant!3790 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31966 0))(
  ( (array!31967 (arr!15367 (Array (_ BitVec 32) (_ BitVec 64))) (size!15731 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31966)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31966 (_ BitVec 32)) SeekEntryResult!3790)

(assert (=> b!494036 (= lt!223577 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494037 () Bool)

(declare-fun res!296660 () Bool)

(assert (=> b!494037 (=> res!296660 e!290010)))

(declare-fun lt!223578 () SeekEntryResult!3790)

(get-info :version)

(assert (=> b!494037 (= res!296660 (or (not ((_ is Intermediate!3790) lt!223578)) (not (undefined!4602 lt!223578))))))

(declare-fun b!494038 () Bool)

(declare-fun res!296668 () Bool)

(assert (=> b!494038 (=> (not res!296668) (not e!290009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31966 (_ BitVec 32)) Bool)

(assert (=> b!494038 (= res!296668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494039 () Bool)

(declare-fun res!296664 () Bool)

(assert (=> b!494039 (=> (not res!296664) (not e!290007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494039 (= res!296664 (validKeyInArray!0 k0!2280))))

(declare-fun res!296667 () Bool)

(assert (=> start!45020 (=> (not res!296667) (not e!290007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45020 (= res!296667 (validMask!0 mask!3524))))

(assert (=> start!45020 e!290007))

(assert (=> start!45020 true))

(declare-fun array_inv!11226 (array!31966) Bool)

(assert (=> start!45020 (array_inv!11226 a!3235)))

(declare-fun b!494040 () Bool)

(declare-fun res!296662 () Bool)

(assert (=> b!494040 (=> (not res!296662) (not e!290009))))

(declare-datatypes ((List!9432 0))(
  ( (Nil!9429) (Cons!9428 (h!10296 (_ BitVec 64)) (t!15652 List!9432)) )
))
(declare-fun arrayNoDuplicates!0 (array!31966 (_ BitVec 32) List!9432) Bool)

(assert (=> b!494040 (= res!296662 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9429))))

(declare-fun b!494041 () Bool)

(declare-fun res!296659 () Bool)

(assert (=> b!494041 (=> (not res!296659) (not e!290007))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494041 (= res!296659 (and (= (size!15731 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15731 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15731 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494042 () Bool)

(declare-fun res!296666 () Bool)

(assert (=> b!494042 (=> (not res!296666) (not e!290007))))

(assert (=> b!494042 (= res!296666 (validKeyInArray!0 (select (arr!15367 a!3235) j!176)))))

(declare-fun b!494043 () Bool)

(assert (=> b!494043 (= e!290009 (not e!290010))))

(declare-fun res!296663 () Bool)

(assert (=> b!494043 (=> res!296663 e!290010)))

(declare-fun lt!223580 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31966 (_ BitVec 32)) SeekEntryResult!3790)

(assert (=> b!494043 (= res!296663 (= lt!223578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223580 (select (store (arr!15367 a!3235) i!1204 k0!2280) j!176) (array!31967 (store (arr!15367 a!3235) i!1204 k0!2280) (size!15731 a!3235)) mask!3524)))))

(declare-fun lt!223582 () (_ BitVec 32))

(assert (=> b!494043 (= lt!223578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223582 (select (arr!15367 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494043 (= lt!223580 (toIndex!0 (select (store (arr!15367 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494043 (= lt!223582 (toIndex!0 (select (arr!15367 a!3235) j!176) mask!3524))))

(assert (=> b!494043 (= lt!223579 (Found!3790 j!176))))

(assert (=> b!494043 (= lt!223579 (seekEntryOrOpen!0 (select (arr!15367 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494043 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14587 0))(
  ( (Unit!14588) )
))
(declare-fun lt!223581 () Unit!14587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14587)

(assert (=> b!494043 (= lt!223581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494044 () Bool)

(declare-fun res!296661 () Bool)

(assert (=> b!494044 (=> (not res!296661) (not e!290007))))

(declare-fun arrayContainsKey!0 (array!31966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494044 (= res!296661 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45020 res!296667) b!494041))

(assert (= (and b!494041 res!296659) b!494042))

(assert (= (and b!494042 res!296666) b!494039))

(assert (= (and b!494039 res!296664) b!494044))

(assert (= (and b!494044 res!296661) b!494036))

(assert (= (and b!494036 res!296665) b!494038))

(assert (= (and b!494038 res!296668) b!494040))

(assert (= (and b!494040 res!296662) b!494043))

(assert (= (and b!494043 (not res!296663)) b!494037))

(assert (= (and b!494037 (not res!296660)) b!494035))

(declare-fun m!475255 () Bool)

(assert (=> b!494042 m!475255))

(assert (=> b!494042 m!475255))

(declare-fun m!475257 () Bool)

(assert (=> b!494042 m!475257))

(declare-fun m!475259 () Bool)

(assert (=> start!45020 m!475259))

(declare-fun m!475261 () Bool)

(assert (=> start!45020 m!475261))

(declare-fun m!475263 () Bool)

(assert (=> b!494039 m!475263))

(declare-fun m!475265 () Bool)

(assert (=> b!494038 m!475265))

(declare-fun m!475267 () Bool)

(assert (=> b!494044 m!475267))

(declare-fun m!475269 () Bool)

(assert (=> b!494040 m!475269))

(declare-fun m!475271 () Bool)

(assert (=> b!494043 m!475271))

(declare-fun m!475273 () Bool)

(assert (=> b!494043 m!475273))

(declare-fun m!475275 () Bool)

(assert (=> b!494043 m!475275))

(assert (=> b!494043 m!475255))

(declare-fun m!475277 () Bool)

(assert (=> b!494043 m!475277))

(assert (=> b!494043 m!475255))

(declare-fun m!475279 () Bool)

(assert (=> b!494043 m!475279))

(assert (=> b!494043 m!475255))

(assert (=> b!494043 m!475255))

(declare-fun m!475281 () Bool)

(assert (=> b!494043 m!475281))

(assert (=> b!494043 m!475275))

(declare-fun m!475283 () Bool)

(assert (=> b!494043 m!475283))

(declare-fun m!475285 () Bool)

(assert (=> b!494043 m!475285))

(assert (=> b!494043 m!475275))

(declare-fun m!475287 () Bool)

(assert (=> b!494043 m!475287))

(declare-fun m!475289 () Bool)

(assert (=> b!494036 m!475289))

(check-sat (not b!494039) (not b!494043) (not b!494040) (not start!45020) (not b!494036) (not b!494042) (not b!494038) (not b!494044))
(check-sat)
