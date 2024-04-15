; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45942 () Bool)

(assert start!45942)

(declare-fun b!508406 () Bool)

(declare-fun res!309394 () Bool)

(declare-fun e!297410 () Bool)

(assert (=> b!508406 (=> (not res!309394) (not e!297410))))

(declare-datatypes ((array!32663 0))(
  ( (array!32664 (arr!15710 (Array (_ BitVec 32) (_ BitVec 64))) (size!16075 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32663)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32663 (_ BitVec 32)) Bool)

(assert (=> b!508406 (= res!309394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508407 () Bool)

(declare-fun res!309397 () Bool)

(declare-fun e!297408 () Bool)

(assert (=> b!508407 (=> (not res!309397) (not e!297408))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508407 (= res!309397 (validKeyInArray!0 (select (arr!15710 a!3235) j!176)))))

(declare-fun res!309393 () Bool)

(assert (=> start!45942 (=> (not res!309393) (not e!297408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45942 (= res!309393 (validMask!0 mask!3524))))

(assert (=> start!45942 e!297408))

(assert (=> start!45942 true))

(declare-fun array_inv!11593 (array!32663) Bool)

(assert (=> start!45942 (array_inv!11593 a!3235)))

(declare-fun b!508408 () Bool)

(declare-fun e!297409 () Bool)

(declare-datatypes ((SeekEntryResult!4174 0))(
  ( (MissingZero!4174 (index!18884 (_ BitVec 32))) (Found!4174 (index!18885 (_ BitVec 32))) (Intermediate!4174 (undefined!4986 Bool) (index!18886 (_ BitVec 32)) (x!47874 (_ BitVec 32))) (Undefined!4174) (MissingVacant!4174 (index!18887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32663 (_ BitVec 32)) SeekEntryResult!4174)

(assert (=> b!508408 (= e!297409 (= (seekEntryOrOpen!0 (select (arr!15710 a!3235) j!176) a!3235 mask!3524) (Found!4174 j!176)))))

(declare-fun b!508409 () Bool)

(assert (=> b!508409 (= e!297410 (not true))))

(assert (=> b!508409 e!297409))

(declare-fun res!309400 () Bool)

(assert (=> b!508409 (=> (not res!309400) (not e!297409))))

(assert (=> b!508409 (= res!309400 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15592 0))(
  ( (Unit!15593) )
))
(declare-fun lt!232093 () Unit!15592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15592)

(assert (=> b!508409 (= lt!232093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508410 () Bool)

(assert (=> b!508410 (= e!297408 e!297410)))

(declare-fun res!309398 () Bool)

(assert (=> b!508410 (=> (not res!309398) (not e!297410))))

(declare-fun lt!232092 () SeekEntryResult!4174)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508410 (= res!309398 (or (= lt!232092 (MissingZero!4174 i!1204)) (= lt!232092 (MissingVacant!4174 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!508410 (= lt!232092 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508411 () Bool)

(declare-fun res!309399 () Bool)

(assert (=> b!508411 (=> (not res!309399) (not e!297410))))

(declare-datatypes ((List!9907 0))(
  ( (Nil!9904) (Cons!9903 (h!10780 (_ BitVec 64)) (t!16126 List!9907)) )
))
(declare-fun arrayNoDuplicates!0 (array!32663 (_ BitVec 32) List!9907) Bool)

(assert (=> b!508411 (= res!309399 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9904))))

(declare-fun b!508412 () Bool)

(declare-fun res!309395 () Bool)

(assert (=> b!508412 (=> (not res!309395) (not e!297408))))

(declare-fun arrayContainsKey!0 (array!32663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508412 (= res!309395 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508413 () Bool)

(declare-fun res!309396 () Bool)

(assert (=> b!508413 (=> (not res!309396) (not e!297408))))

(assert (=> b!508413 (= res!309396 (and (= (size!16075 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16075 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16075 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508414 () Bool)

(declare-fun res!309401 () Bool)

(assert (=> b!508414 (=> (not res!309401) (not e!297408))))

(assert (=> b!508414 (= res!309401 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45942 res!309393) b!508413))

(assert (= (and b!508413 res!309396) b!508407))

(assert (= (and b!508407 res!309397) b!508414))

(assert (= (and b!508414 res!309401) b!508412))

(assert (= (and b!508412 res!309395) b!508410))

(assert (= (and b!508410 res!309398) b!508406))

(assert (= (and b!508406 res!309394) b!508411))

(assert (= (and b!508411 res!309399) b!508409))

(assert (= (and b!508409 res!309400) b!508408))

(declare-fun m!488677 () Bool)

(assert (=> b!508414 m!488677))

(declare-fun m!488679 () Bool)

(assert (=> b!508407 m!488679))

(assert (=> b!508407 m!488679))

(declare-fun m!488681 () Bool)

(assert (=> b!508407 m!488681))

(declare-fun m!488683 () Bool)

(assert (=> b!508406 m!488683))

(assert (=> b!508408 m!488679))

(assert (=> b!508408 m!488679))

(declare-fun m!488685 () Bool)

(assert (=> b!508408 m!488685))

(declare-fun m!488687 () Bool)

(assert (=> b!508411 m!488687))

(declare-fun m!488689 () Bool)

(assert (=> b!508409 m!488689))

(declare-fun m!488691 () Bool)

(assert (=> b!508409 m!488691))

(declare-fun m!488693 () Bool)

(assert (=> start!45942 m!488693))

(declare-fun m!488695 () Bool)

(assert (=> start!45942 m!488695))

(declare-fun m!488697 () Bool)

(assert (=> b!508412 m!488697))

(declare-fun m!488699 () Bool)

(assert (=> b!508410 m!488699))

(check-sat (not b!508407) (not b!508411) (not b!508408) (not start!45942) (not b!508410) (not b!508412) (not b!508406) (not b!508409) (not b!508414))
(check-sat)
