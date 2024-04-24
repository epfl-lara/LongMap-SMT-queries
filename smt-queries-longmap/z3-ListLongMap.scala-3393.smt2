; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46760 () Bool)

(assert start!46760)

(declare-fun b!516507 () Bool)

(declare-fun res!316132 () Bool)

(declare-fun e!301425 () Bool)

(assert (=> b!516507 (=> res!316132 e!301425)))

(declare-datatypes ((SeekEntryResult!4327 0))(
  ( (MissingZero!4327 (index!19496 (_ BitVec 32))) (Found!4327 (index!19497 (_ BitVec 32))) (Intermediate!4327 (undefined!5139 Bool) (index!19498 (_ BitVec 32)) (x!48599 (_ BitVec 32))) (Undefined!4327) (MissingVacant!4327 (index!19499 (_ BitVec 32))) )
))
(declare-fun lt!236490 () SeekEntryResult!4327)

(get-info :version)

(assert (=> b!516507 (= res!316132 (or (undefined!5139 lt!236490) (not ((_ is Intermediate!4327) lt!236490))))))

(declare-fun b!516508 () Bool)

(declare-fun res!316131 () Bool)

(declare-fun e!301424 () Bool)

(assert (=> b!516508 (=> (not res!316131) (not e!301424))))

(declare-datatypes ((array!33073 0))(
  ( (array!33074 (arr!15904 (Array (_ BitVec 32) (_ BitVec 64))) (size!16268 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33073)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516508 (= res!316131 (validKeyInArray!0 (select (arr!15904 a!3235) j!176)))))

(declare-fun b!516509 () Bool)

(declare-fun res!316125 () Bool)

(declare-fun e!301421 () Bool)

(assert (=> b!516509 (=> (not res!316125) (not e!301421))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33073 (_ BitVec 32)) Bool)

(assert (=> b!516509 (= res!316125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516511 () Bool)

(assert (=> b!516511 (= e!301424 e!301421)))

(declare-fun res!316129 () Bool)

(assert (=> b!516511 (=> (not res!316129) (not e!301421))))

(declare-fun lt!236489 () SeekEntryResult!4327)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516511 (= res!316129 (or (= lt!236489 (MissingZero!4327 i!1204)) (= lt!236489 (MissingVacant!4327 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33073 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!516511 (= lt!236489 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516512 () Bool)

(declare-fun res!316126 () Bool)

(assert (=> b!516512 (=> (not res!316126) (not e!301424))))

(declare-fun arrayContainsKey!0 (array!33073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516512 (= res!316126 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516513 () Bool)

(assert (=> b!516513 (= e!301421 (not e!301425))))

(declare-fun res!316135 () Bool)

(assert (=> b!516513 (=> res!316135 e!301425)))

(declare-fun lt!236491 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33073 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!516513 (= res!316135 (= lt!236490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236491 (select (store (arr!15904 a!3235) i!1204 k0!2280) j!176) (array!33074 (store (arr!15904 a!3235) i!1204 k0!2280) (size!16268 a!3235)) mask!3524)))))

(declare-fun lt!236487 () (_ BitVec 32))

(assert (=> b!516513 (= lt!236490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236487 (select (arr!15904 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516513 (= lt!236491 (toIndex!0 (select (store (arr!15904 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516513 (= lt!236487 (toIndex!0 (select (arr!15904 a!3235) j!176) mask!3524))))

(declare-fun e!301422 () Bool)

(assert (=> b!516513 e!301422))

(declare-fun res!316128 () Bool)

(assert (=> b!516513 (=> (not res!316128) (not e!301422))))

(assert (=> b!516513 (= res!316128 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15973 0))(
  ( (Unit!15974) )
))
(declare-fun lt!236488 () Unit!15973)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15973)

(assert (=> b!516513 (= lt!236488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516514 () Bool)

(assert (=> b!516514 (= e!301422 (= (seekEntryOrOpen!0 (select (arr!15904 a!3235) j!176) a!3235 mask!3524) (Found!4327 j!176)))))

(declare-fun b!516515 () Bool)

(declare-fun res!316133 () Bool)

(assert (=> b!516515 (=> (not res!316133) (not e!301424))))

(assert (=> b!516515 (= res!316133 (validKeyInArray!0 k0!2280))))

(declare-fun b!516510 () Bool)

(declare-fun res!316134 () Bool)

(assert (=> b!516510 (=> (not res!316134) (not e!301421))))

(declare-datatypes ((List!9969 0))(
  ( (Nil!9966) (Cons!9965 (h!10863 (_ BitVec 64)) (t!16189 List!9969)) )
))
(declare-fun arrayNoDuplicates!0 (array!33073 (_ BitVec 32) List!9969) Bool)

(assert (=> b!516510 (= res!316134 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9966))))

(declare-fun res!316130 () Bool)

(assert (=> start!46760 (=> (not res!316130) (not e!301424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46760 (= res!316130 (validMask!0 mask!3524))))

(assert (=> start!46760 e!301424))

(assert (=> start!46760 true))

(declare-fun array_inv!11763 (array!33073) Bool)

(assert (=> start!46760 (array_inv!11763 a!3235)))

(declare-fun b!516516 () Bool)

(declare-fun res!316127 () Bool)

(assert (=> b!516516 (=> (not res!316127) (not e!301424))))

(assert (=> b!516516 (= res!316127 (and (= (size!16268 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16268 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16268 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516517 () Bool)

(assert (=> b!516517 (= e!301425 (or (not (= (select (arr!15904 a!3235) (index!19498 lt!236490)) (select (arr!15904 a!3235) j!176))) (bvsle (x!48599 lt!236490) #b01111111111111111111111111111110)))))

(assert (=> b!516517 (and (bvslt (x!48599 lt!236490) #b01111111111111111111111111111110) (or (= (select (arr!15904 a!3235) (index!19498 lt!236490)) (select (arr!15904 a!3235) j!176)) (= (select (arr!15904 a!3235) (index!19498 lt!236490)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15904 a!3235) (index!19498 lt!236490)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46760 res!316130) b!516516))

(assert (= (and b!516516 res!316127) b!516508))

(assert (= (and b!516508 res!316131) b!516515))

(assert (= (and b!516515 res!316133) b!516512))

(assert (= (and b!516512 res!316126) b!516511))

(assert (= (and b!516511 res!316129) b!516509))

(assert (= (and b!516509 res!316125) b!516510))

(assert (= (and b!516510 res!316134) b!516513))

(assert (= (and b!516513 res!316128) b!516514))

(assert (= (and b!516513 (not res!316135)) b!516507))

(assert (= (and b!516507 (not res!316132)) b!516517))

(declare-fun m!498259 () Bool)

(assert (=> start!46760 m!498259))

(declare-fun m!498261 () Bool)

(assert (=> start!46760 m!498261))

(declare-fun m!498263 () Bool)

(assert (=> b!516514 m!498263))

(assert (=> b!516514 m!498263))

(declare-fun m!498265 () Bool)

(assert (=> b!516514 m!498265))

(assert (=> b!516513 m!498263))

(declare-fun m!498267 () Bool)

(assert (=> b!516513 m!498267))

(declare-fun m!498269 () Bool)

(assert (=> b!516513 m!498269))

(declare-fun m!498271 () Bool)

(assert (=> b!516513 m!498271))

(declare-fun m!498273 () Bool)

(assert (=> b!516513 m!498273))

(assert (=> b!516513 m!498263))

(declare-fun m!498275 () Bool)

(assert (=> b!516513 m!498275))

(assert (=> b!516513 m!498263))

(declare-fun m!498277 () Bool)

(assert (=> b!516513 m!498277))

(assert (=> b!516513 m!498273))

(declare-fun m!498279 () Bool)

(assert (=> b!516513 m!498279))

(assert (=> b!516513 m!498273))

(declare-fun m!498281 () Bool)

(assert (=> b!516513 m!498281))

(declare-fun m!498283 () Bool)

(assert (=> b!516510 m!498283))

(declare-fun m!498285 () Bool)

(assert (=> b!516509 m!498285))

(declare-fun m!498287 () Bool)

(assert (=> b!516515 m!498287))

(assert (=> b!516508 m!498263))

(assert (=> b!516508 m!498263))

(declare-fun m!498289 () Bool)

(assert (=> b!516508 m!498289))

(declare-fun m!498291 () Bool)

(assert (=> b!516511 m!498291))

(declare-fun m!498293 () Bool)

(assert (=> b!516512 m!498293))

(declare-fun m!498295 () Bool)

(assert (=> b!516517 m!498295))

(assert (=> b!516517 m!498263))

(check-sat (not b!516513) (not b!516508) (not b!516514) (not b!516509) (not b!516511) (not b!516512) (not b!516510) (not b!516515) (not start!46760))
(check-sat)
