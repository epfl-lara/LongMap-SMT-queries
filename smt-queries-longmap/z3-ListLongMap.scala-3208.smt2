; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44982 () Bool)

(assert start!44982)

(declare-fun b!493285 () Bool)

(declare-fun res!295998 () Bool)

(declare-fun e!289659 () Bool)

(assert (=> b!493285 (=> (not res!295998) (not e!289659))))

(declare-datatypes ((array!31937 0))(
  ( (array!31938 (arr!15353 (Array (_ BitVec 32) (_ BitVec 64))) (size!15718 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31937)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493285 (= res!295998 (validKeyInArray!0 (select (arr!15353 a!3235) j!176)))))

(declare-fun b!493286 () Bool)

(declare-fun res!296000 () Bool)

(assert (=> b!493286 (=> (not res!296000) (not e!289659))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493286 (= res!296000 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493287 () Bool)

(declare-fun e!289656 () Bool)

(assert (=> b!493287 (= e!289659 e!289656)))

(declare-fun res!296003 () Bool)

(assert (=> b!493287 (=> (not res!296003) (not e!289656))))

(declare-datatypes ((SeekEntryResult!3817 0))(
  ( (MissingZero!3817 (index!17447 (_ BitVec 32))) (Found!3817 (index!17448 (_ BitVec 32))) (Intermediate!3817 (undefined!4629 Bool) (index!17449 (_ BitVec 32)) (x!46538 (_ BitVec 32))) (Undefined!3817) (MissingVacant!3817 (index!17450 (_ BitVec 32))) )
))
(declare-fun lt!223008 () SeekEntryResult!3817)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493287 (= res!296003 (or (= lt!223008 (MissingZero!3817 i!1204)) (= lt!223008 (MissingVacant!3817 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31937 (_ BitVec 32)) SeekEntryResult!3817)

(assert (=> b!493287 (= lt!223008 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493288 () Bool)

(declare-fun res!296002 () Bool)

(assert (=> b!493288 (=> (not res!296002) (not e!289659))))

(assert (=> b!493288 (= res!296002 (validKeyInArray!0 k0!2280))))

(declare-fun res!296004 () Bool)

(assert (=> start!44982 (=> (not res!296004) (not e!289659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44982 (= res!296004 (validMask!0 mask!3524))))

(assert (=> start!44982 e!289659))

(assert (=> start!44982 true))

(declare-fun array_inv!11236 (array!31937) Bool)

(assert (=> start!44982 (array_inv!11236 a!3235)))

(declare-fun b!493289 () Bool)

(declare-fun res!295997 () Bool)

(declare-fun e!289658 () Bool)

(assert (=> b!493289 (=> res!295997 e!289658)))

(declare-fun lt!223010 () SeekEntryResult!3817)

(get-info :version)

(assert (=> b!493289 (= res!295997 (or (not ((_ is Intermediate!3817) lt!223010)) (not (undefined!4629 lt!223010))))))

(declare-fun b!493290 () Bool)

(declare-fun res!295999 () Bool)

(assert (=> b!493290 (=> (not res!295999) (not e!289656))))

(declare-datatypes ((List!9550 0))(
  ( (Nil!9547) (Cons!9546 (h!10414 (_ BitVec 64)) (t!15769 List!9550)) )
))
(declare-fun arrayNoDuplicates!0 (array!31937 (_ BitVec 32) List!9550) Bool)

(assert (=> b!493290 (= res!295999 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9547))))

(declare-fun b!493291 () Bool)

(assert (=> b!493291 (= e!289656 (not e!289658))))

(declare-fun res!296001 () Bool)

(assert (=> b!493291 (=> res!296001 e!289658)))

(declare-fun lt!223007 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31937 (_ BitVec 32)) SeekEntryResult!3817)

(assert (=> b!493291 (= res!296001 (= lt!223010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223007 (select (store (arr!15353 a!3235) i!1204 k0!2280) j!176) (array!31938 (store (arr!15353 a!3235) i!1204 k0!2280) (size!15718 a!3235)) mask!3524)))))

(declare-fun lt!223009 () (_ BitVec 32))

(assert (=> b!493291 (= lt!223010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223009 (select (arr!15353 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493291 (= lt!223007 (toIndex!0 (select (store (arr!15353 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493291 (= lt!223009 (toIndex!0 (select (arr!15353 a!3235) j!176) mask!3524))))

(declare-fun lt!223011 () SeekEntryResult!3817)

(assert (=> b!493291 (= lt!223011 (Found!3817 j!176))))

(assert (=> b!493291 (= lt!223011 (seekEntryOrOpen!0 (select (arr!15353 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31937 (_ BitVec 32)) Bool)

(assert (=> b!493291 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14566 0))(
  ( (Unit!14567) )
))
(declare-fun lt!223012 () Unit!14566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14566)

(assert (=> b!493291 (= lt!223012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493292 () Bool)

(declare-fun res!296006 () Bool)

(assert (=> b!493292 (=> (not res!296006) (not e!289659))))

(assert (=> b!493292 (= res!296006 (and (= (size!15718 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15718 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15718 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493293 () Bool)

(assert (=> b!493293 (= e!289658 true)))

(assert (=> b!493293 (= lt!223011 Undefined!3817)))

(declare-fun b!493294 () Bool)

(declare-fun res!296005 () Bool)

(assert (=> b!493294 (=> (not res!296005) (not e!289656))))

(assert (=> b!493294 (= res!296005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44982 res!296004) b!493292))

(assert (= (and b!493292 res!296006) b!493285))

(assert (= (and b!493285 res!295998) b!493288))

(assert (= (and b!493288 res!296002) b!493286))

(assert (= (and b!493286 res!296000) b!493287))

(assert (= (and b!493287 res!296003) b!493294))

(assert (= (and b!493294 res!296005) b!493290))

(assert (= (and b!493290 res!295999) b!493291))

(assert (= (and b!493291 (not res!296001)) b!493289))

(assert (= (and b!493289 (not res!295997)) b!493293))

(declare-fun m!473671 () Bool)

(assert (=> b!493290 m!473671))

(declare-fun m!473673 () Bool)

(assert (=> b!493288 m!473673))

(declare-fun m!473675 () Bool)

(assert (=> b!493287 m!473675))

(declare-fun m!473677 () Bool)

(assert (=> b!493294 m!473677))

(declare-fun m!473679 () Bool)

(assert (=> b!493291 m!473679))

(declare-fun m!473681 () Bool)

(assert (=> b!493291 m!473681))

(declare-fun m!473683 () Bool)

(assert (=> b!493291 m!473683))

(declare-fun m!473685 () Bool)

(assert (=> b!493291 m!473685))

(assert (=> b!493291 m!473683))

(declare-fun m!473687 () Bool)

(assert (=> b!493291 m!473687))

(assert (=> b!493291 m!473683))

(declare-fun m!473689 () Bool)

(assert (=> b!493291 m!473689))

(declare-fun m!473691 () Bool)

(assert (=> b!493291 m!473691))

(declare-fun m!473693 () Bool)

(assert (=> b!493291 m!473693))

(assert (=> b!493291 m!473691))

(declare-fun m!473695 () Bool)

(assert (=> b!493291 m!473695))

(assert (=> b!493291 m!473691))

(assert (=> b!493291 m!473683))

(declare-fun m!473697 () Bool)

(assert (=> b!493291 m!473697))

(declare-fun m!473699 () Bool)

(assert (=> start!44982 m!473699))

(declare-fun m!473701 () Bool)

(assert (=> start!44982 m!473701))

(declare-fun m!473703 () Bool)

(assert (=> b!493286 m!473703))

(assert (=> b!493285 m!473683))

(assert (=> b!493285 m!473683))

(declare-fun m!473705 () Bool)

(assert (=> b!493285 m!473705))

(check-sat (not b!493285) (not b!493288) (not b!493287) (not b!493290) (not b!493294) (not start!44982) (not b!493286) (not b!493291))
(check-sat)
