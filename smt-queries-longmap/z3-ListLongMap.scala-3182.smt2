; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44708 () Bool)

(assert start!44708)

(declare-fun b!490724 () Bool)

(declare-fun e!288422 () Bool)

(declare-fun e!288420 () Bool)

(assert (=> b!490724 (= e!288422 (not e!288420))))

(declare-fun res!293716 () Bool)

(assert (=> b!490724 (=> res!293716 e!288420)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31768 0))(
  ( (array!31769 (arr!15271 (Array (_ BitVec 32) (_ BitVec 64))) (size!15635 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31768)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221736 () (_ BitVec 64))

(declare-fun lt!221739 () array!31768)

(declare-datatypes ((SeekEntryResult!3694 0))(
  ( (MissingZero!3694 (index!16955 (_ BitVec 32))) (Found!3694 (index!16956 (_ BitVec 32))) (Intermediate!3694 (undefined!4506 Bool) (index!16957 (_ BitVec 32)) (x!46197 (_ BitVec 32))) (Undefined!3694) (MissingVacant!3694 (index!16958 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31768 (_ BitVec 32)) SeekEntryResult!3694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490724 (= res!293716 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15271 a!3235) j!176) mask!3524) (select (arr!15271 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221736 mask!3524) lt!221736 lt!221739 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490724 (= lt!221736 (select (store (arr!15271 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490724 (= lt!221739 (array!31769 (store (arr!15271 a!3235) i!1204 k0!2280) (size!15635 a!3235)))))

(declare-fun lt!221737 () SeekEntryResult!3694)

(assert (=> b!490724 (= lt!221737 (Found!3694 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31768 (_ BitVec 32)) SeekEntryResult!3694)

(assert (=> b!490724 (= lt!221737 (seekEntryOrOpen!0 (select (arr!15271 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31768 (_ BitVec 32)) Bool)

(assert (=> b!490724 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14395 0))(
  ( (Unit!14396) )
))
(declare-fun lt!221738 () Unit!14395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14395)

(assert (=> b!490724 (= lt!221738 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490725 () Bool)

(declare-fun res!293720 () Bool)

(declare-fun e!288421 () Bool)

(assert (=> b!490725 (=> (not res!293720) (not e!288421))))

(declare-fun arrayContainsKey!0 (array!31768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490725 (= res!293720 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490726 () Bool)

(assert (=> b!490726 (= e!288421 e!288422)))

(declare-fun res!293715 () Bool)

(assert (=> b!490726 (=> (not res!293715) (not e!288422))))

(declare-fun lt!221735 () SeekEntryResult!3694)

(assert (=> b!490726 (= res!293715 (or (= lt!221735 (MissingZero!3694 i!1204)) (= lt!221735 (MissingVacant!3694 i!1204))))))

(assert (=> b!490726 (= lt!221735 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490727 () Bool)

(declare-fun res!293719 () Bool)

(assert (=> b!490727 (=> (not res!293719) (not e!288421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490727 (= res!293719 (validKeyInArray!0 k0!2280))))

(declare-fun b!490728 () Bool)

(declare-fun res!293718 () Bool)

(assert (=> b!490728 (=> (not res!293718) (not e!288422))))

(declare-datatypes ((List!9336 0))(
  ( (Nil!9333) (Cons!9332 (h!10194 (_ BitVec 64)) (t!15556 List!9336)) )
))
(declare-fun arrayNoDuplicates!0 (array!31768 (_ BitVec 32) List!9336) Bool)

(assert (=> b!490728 (= res!293718 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9333))))

(declare-fun b!490729 () Bool)

(declare-fun res!293714 () Bool)

(assert (=> b!490729 (=> (not res!293714) (not e!288421))))

(assert (=> b!490729 (= res!293714 (validKeyInArray!0 (select (arr!15271 a!3235) j!176)))))

(declare-fun b!490730 () Bool)

(declare-fun res!293721 () Bool)

(assert (=> b!490730 (=> (not res!293721) (not e!288421))))

(assert (=> b!490730 (= res!293721 (and (= (size!15635 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15635 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15635 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490731 () Bool)

(assert (=> b!490731 (= e!288420 true)))

(assert (=> b!490731 (= lt!221737 (seekEntryOrOpen!0 lt!221736 lt!221739 mask!3524))))

(declare-fun lt!221740 () Unit!14395)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31768 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14395)

(assert (=> b!490731 (= lt!221740 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!293722 () Bool)

(assert (=> start!44708 (=> (not res!293722) (not e!288421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44708 (= res!293722 (validMask!0 mask!3524))))

(assert (=> start!44708 e!288421))

(assert (=> start!44708 true))

(declare-fun array_inv!11130 (array!31768) Bool)

(assert (=> start!44708 (array_inv!11130 a!3235)))

(declare-fun b!490732 () Bool)

(declare-fun res!293717 () Bool)

(assert (=> b!490732 (=> (not res!293717) (not e!288422))))

(assert (=> b!490732 (= res!293717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44708 res!293722) b!490730))

(assert (= (and b!490730 res!293721) b!490729))

(assert (= (and b!490729 res!293714) b!490727))

(assert (= (and b!490727 res!293719) b!490725))

(assert (= (and b!490725 res!293720) b!490726))

(assert (= (and b!490726 res!293715) b!490732))

(assert (= (and b!490732 res!293717) b!490728))

(assert (= (and b!490728 res!293718) b!490724))

(assert (= (and b!490724 (not res!293716)) b!490731))

(declare-fun m!471241 () Bool)

(assert (=> b!490732 m!471241))

(declare-fun m!471243 () Bool)

(assert (=> start!44708 m!471243))

(declare-fun m!471245 () Bool)

(assert (=> start!44708 m!471245))

(declare-fun m!471247 () Bool)

(assert (=> b!490724 m!471247))

(declare-fun m!471249 () Bool)

(assert (=> b!490724 m!471249))

(assert (=> b!490724 m!471247))

(declare-fun m!471251 () Bool)

(assert (=> b!490724 m!471251))

(declare-fun m!471253 () Bool)

(assert (=> b!490724 m!471253))

(declare-fun m!471255 () Bool)

(assert (=> b!490724 m!471255))

(declare-fun m!471257 () Bool)

(assert (=> b!490724 m!471257))

(declare-fun m!471259 () Bool)

(assert (=> b!490724 m!471259))

(declare-fun m!471261 () Bool)

(assert (=> b!490724 m!471261))

(assert (=> b!490724 m!471259))

(assert (=> b!490724 m!471257))

(assert (=> b!490724 m!471259))

(declare-fun m!471263 () Bool)

(assert (=> b!490724 m!471263))

(assert (=> b!490724 m!471259))

(declare-fun m!471265 () Bool)

(assert (=> b!490724 m!471265))

(declare-fun m!471267 () Bool)

(assert (=> b!490726 m!471267))

(declare-fun m!471269 () Bool)

(assert (=> b!490731 m!471269))

(declare-fun m!471271 () Bool)

(assert (=> b!490731 m!471271))

(declare-fun m!471273 () Bool)

(assert (=> b!490725 m!471273))

(declare-fun m!471275 () Bool)

(assert (=> b!490728 m!471275))

(declare-fun m!471277 () Bool)

(assert (=> b!490727 m!471277))

(assert (=> b!490729 m!471259))

(assert (=> b!490729 m!471259))

(declare-fun m!471279 () Bool)

(assert (=> b!490729 m!471279))

(check-sat (not b!490731) (not b!490724) (not b!490728) (not b!490732) (not b!490726) (not b!490725) (not start!44708) (not b!490727) (not b!490729))
(check-sat)
