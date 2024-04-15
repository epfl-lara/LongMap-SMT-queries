; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45936 () Bool)

(assert start!45936)

(declare-fun b!508325 () Bool)

(declare-fun e!297375 () Bool)

(assert (=> b!508325 (= e!297375 (not true))))

(declare-fun e!297374 () Bool)

(assert (=> b!508325 e!297374))

(declare-fun res!309316 () Bool)

(assert (=> b!508325 (=> (not res!309316) (not e!297374))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32657 0))(
  ( (array!32658 (arr!15707 (Array (_ BitVec 32) (_ BitVec 64))) (size!16072 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32657)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32657 (_ BitVec 32)) Bool)

(assert (=> b!508325 (= res!309316 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15586 0))(
  ( (Unit!15587) )
))
(declare-fun lt!232075 () Unit!15586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15586)

(assert (=> b!508325 (= lt!232075 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508326 () Bool)

(declare-fun res!309319 () Bool)

(declare-fun e!297373 () Bool)

(assert (=> b!508326 (=> (not res!309319) (not e!297373))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508326 (= res!309319 (validKeyInArray!0 k0!2280))))

(declare-fun res!309314 () Bool)

(assert (=> start!45936 (=> (not res!309314) (not e!297373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45936 (= res!309314 (validMask!0 mask!3524))))

(assert (=> start!45936 e!297373))

(assert (=> start!45936 true))

(declare-fun array_inv!11590 (array!32657) Bool)

(assert (=> start!45936 (array_inv!11590 a!3235)))

(declare-fun b!508327 () Bool)

(declare-fun res!309315 () Bool)

(assert (=> b!508327 (=> (not res!309315) (not e!297373))))

(declare-fun arrayContainsKey!0 (array!32657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508327 (= res!309315 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508328 () Bool)

(declare-fun res!309312 () Bool)

(assert (=> b!508328 (=> (not res!309312) (not e!297375))))

(declare-datatypes ((List!9904 0))(
  ( (Nil!9901) (Cons!9900 (h!10777 (_ BitVec 64)) (t!16123 List!9904)) )
))
(declare-fun arrayNoDuplicates!0 (array!32657 (_ BitVec 32) List!9904) Bool)

(assert (=> b!508328 (= res!309312 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9901))))

(declare-fun b!508329 () Bool)

(declare-fun res!309318 () Bool)

(assert (=> b!508329 (=> (not res!309318) (not e!297373))))

(assert (=> b!508329 (= res!309318 (validKeyInArray!0 (select (arr!15707 a!3235) j!176)))))

(declare-fun b!508330 () Bool)

(assert (=> b!508330 (= e!297373 e!297375)))

(declare-fun res!309320 () Bool)

(assert (=> b!508330 (=> (not res!309320) (not e!297375))))

(declare-datatypes ((SeekEntryResult!4171 0))(
  ( (MissingZero!4171 (index!18872 (_ BitVec 32))) (Found!4171 (index!18873 (_ BitVec 32))) (Intermediate!4171 (undefined!4983 Bool) (index!18874 (_ BitVec 32)) (x!47863 (_ BitVec 32))) (Undefined!4171) (MissingVacant!4171 (index!18875 (_ BitVec 32))) )
))
(declare-fun lt!232074 () SeekEntryResult!4171)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508330 (= res!309320 (or (= lt!232074 (MissingZero!4171 i!1204)) (= lt!232074 (MissingVacant!4171 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32657 (_ BitVec 32)) SeekEntryResult!4171)

(assert (=> b!508330 (= lt!232074 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508331 () Bool)

(assert (=> b!508331 (= e!297374 (= (seekEntryOrOpen!0 (select (arr!15707 a!3235) j!176) a!3235 mask!3524) (Found!4171 j!176)))))

(declare-fun b!508332 () Bool)

(declare-fun res!309317 () Bool)

(assert (=> b!508332 (=> (not res!309317) (not e!297373))))

(assert (=> b!508332 (= res!309317 (and (= (size!16072 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16072 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16072 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508333 () Bool)

(declare-fun res!309313 () Bool)

(assert (=> b!508333 (=> (not res!309313) (not e!297375))))

(assert (=> b!508333 (= res!309313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45936 res!309314) b!508332))

(assert (= (and b!508332 res!309317) b!508329))

(assert (= (and b!508329 res!309318) b!508326))

(assert (= (and b!508326 res!309319) b!508327))

(assert (= (and b!508327 res!309315) b!508330))

(assert (= (and b!508330 res!309320) b!508333))

(assert (= (and b!508333 res!309313) b!508328))

(assert (= (and b!508328 res!309312) b!508325))

(assert (= (and b!508325 res!309316) b!508331))

(declare-fun m!488605 () Bool)

(assert (=> b!508327 m!488605))

(declare-fun m!488607 () Bool)

(assert (=> b!508325 m!488607))

(declare-fun m!488609 () Bool)

(assert (=> b!508325 m!488609))

(declare-fun m!488611 () Bool)

(assert (=> b!508331 m!488611))

(assert (=> b!508331 m!488611))

(declare-fun m!488613 () Bool)

(assert (=> b!508331 m!488613))

(assert (=> b!508329 m!488611))

(assert (=> b!508329 m!488611))

(declare-fun m!488615 () Bool)

(assert (=> b!508329 m!488615))

(declare-fun m!488617 () Bool)

(assert (=> b!508333 m!488617))

(declare-fun m!488619 () Bool)

(assert (=> b!508330 m!488619))

(declare-fun m!488621 () Bool)

(assert (=> b!508328 m!488621))

(declare-fun m!488623 () Bool)

(assert (=> b!508326 m!488623))

(declare-fun m!488625 () Bool)

(assert (=> start!45936 m!488625))

(declare-fun m!488627 () Bool)

(assert (=> start!45936 m!488627))

(check-sat (not b!508329) (not b!508327) (not b!508325) (not b!508330) (not b!508326) (not start!45936) (not b!508333) (not b!508328) (not b!508331))
(check-sat)
