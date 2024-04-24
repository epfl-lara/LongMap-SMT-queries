; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31560 () Bool)

(assert start!31560)

(declare-fun b!315719 () Bool)

(declare-fun res!171024 () Bool)

(declare-fun e!196484 () Bool)

(assert (=> b!315719 (=> (not res!171024) (not e!196484))))

(declare-datatypes ((array!16097 0))(
  ( (array!16098 (arr!7618 (Array (_ BitVec 32) (_ BitVec 64))) (size!7970 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16097)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315719 (= res!171024 (and (= (select (arr!7618 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7970 a!3293))))))

(declare-fun res!171020 () Bool)

(declare-fun e!196485 () Bool)

(assert (=> start!31560 (=> (not res!171020) (not e!196485))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31560 (= res!171020 (validMask!0 mask!3709))))

(assert (=> start!31560 e!196485))

(declare-fun array_inv!5568 (array!16097) Bool)

(assert (=> start!31560 (array_inv!5568 a!3293)))

(assert (=> start!31560 true))

(declare-fun b!315720 () Bool)

(assert (=> b!315720 (= e!196484 (not true))))

(assert (=> b!315720 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9686 0))(
  ( (Unit!9687) )
))
(declare-fun lt!154394 () Unit!9686)

(declare-fun e!196487 () Unit!9686)

(assert (=> b!315720 (= lt!154394 e!196487)))

(declare-fun c!49969 () Bool)

(assert (=> b!315720 (= c!49969 (not (= resIndex!52 index!1781)))))

(declare-fun b!315721 () Bool)

(declare-fun e!196488 () Unit!9686)

(assert (=> b!315721 (= e!196487 e!196488)))

(declare-fun c!49970 () Bool)

(assert (=> b!315721 (= c!49970 (or (= (select (arr!7618 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7618 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315722 () Bool)

(assert (=> b!315722 false))

(declare-fun Unit!9688 () Unit!9686)

(assert (=> b!315722 (= e!196488 Unit!9688)))

(declare-fun b!315723 () Bool)

(declare-fun res!171015 () Bool)

(assert (=> b!315723 (=> (not res!171015) (not e!196485))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2723 0))(
  ( (MissingZero!2723 (index!13068 (_ BitVec 32))) (Found!2723 (index!13069 (_ BitVec 32))) (Intermediate!2723 (undefined!3535 Bool) (index!13070 (_ BitVec 32)) (x!31422 (_ BitVec 32))) (Undefined!2723) (MissingVacant!2723 (index!13071 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16097 (_ BitVec 32)) SeekEntryResult!2723)

(assert (=> b!315723 (= res!171015 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2723 i!1240)))))

(declare-fun b!315724 () Bool)

(assert (=> b!315724 (= e!196485 e!196484)))

(declare-fun res!171017 () Bool)

(assert (=> b!315724 (=> (not res!171017) (not e!196484))))

(declare-fun lt!154395 () SeekEntryResult!2723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16097 (_ BitVec 32)) SeekEntryResult!2723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315724 (= res!171017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154395))))

(assert (=> b!315724 (= lt!154395 (Intermediate!2723 false resIndex!52 resX!52))))

(declare-fun b!315725 () Bool)

(declare-fun res!171023 () Bool)

(assert (=> b!315725 (=> (not res!171023) (not e!196484))))

(assert (=> b!315725 (= res!171023 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154395))))

(declare-fun b!315726 () Bool)

(declare-fun res!171021 () Bool)

(assert (=> b!315726 (=> (not res!171021) (not e!196485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315726 (= res!171021 (validKeyInArray!0 k0!2441))))

(declare-fun b!315727 () Bool)

(declare-fun res!171022 () Bool)

(assert (=> b!315727 (=> (not res!171022) (not e!196485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16097 (_ BitVec 32)) Bool)

(assert (=> b!315727 (= res!171022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315728 () Bool)

(assert (=> b!315728 false))

(declare-fun lt!154393 () SeekEntryResult!2723)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315728 (= lt!154393 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9689 () Unit!9686)

(assert (=> b!315728 (= e!196488 Unit!9689)))

(declare-fun b!315729 () Bool)

(declare-fun res!171019 () Bool)

(assert (=> b!315729 (=> (not res!171019) (not e!196485))))

(assert (=> b!315729 (= res!171019 (and (= (size!7970 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7970 a!3293))))))

(declare-fun b!315730 () Bool)

(declare-fun res!171016 () Bool)

(assert (=> b!315730 (=> (not res!171016) (not e!196484))))

(assert (=> b!315730 (= res!171016 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7618 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315731 () Bool)

(declare-fun Unit!9690 () Unit!9686)

(assert (=> b!315731 (= e!196487 Unit!9690)))

(declare-fun b!315732 () Bool)

(declare-fun res!171018 () Bool)

(assert (=> b!315732 (=> (not res!171018) (not e!196485))))

(declare-fun arrayContainsKey!0 (array!16097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315732 (= res!171018 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31560 res!171020) b!315729))

(assert (= (and b!315729 res!171019) b!315726))

(assert (= (and b!315726 res!171021) b!315732))

(assert (= (and b!315732 res!171018) b!315723))

(assert (= (and b!315723 res!171015) b!315727))

(assert (= (and b!315727 res!171022) b!315724))

(assert (= (and b!315724 res!171017) b!315719))

(assert (= (and b!315719 res!171024) b!315725))

(assert (= (and b!315725 res!171023) b!315730))

(assert (= (and b!315730 res!171016) b!315720))

(assert (= (and b!315720 c!49969) b!315721))

(assert (= (and b!315720 (not c!49969)) b!315731))

(assert (= (and b!315721 c!49970) b!315722))

(assert (= (and b!315721 (not c!49970)) b!315728))

(declare-fun m!325063 () Bool)

(assert (=> b!315732 m!325063))

(declare-fun m!325065 () Bool)

(assert (=> b!315728 m!325065))

(assert (=> b!315728 m!325065))

(declare-fun m!325067 () Bool)

(assert (=> b!315728 m!325067))

(declare-fun m!325069 () Bool)

(assert (=> b!315730 m!325069))

(declare-fun m!325071 () Bool)

(assert (=> b!315727 m!325071))

(declare-fun m!325073 () Bool)

(assert (=> b!315726 m!325073))

(declare-fun m!325075 () Bool)

(assert (=> b!315723 m!325075))

(declare-fun m!325077 () Bool)

(assert (=> b!315719 m!325077))

(assert (=> b!315721 m!325069))

(declare-fun m!325079 () Bool)

(assert (=> b!315724 m!325079))

(assert (=> b!315724 m!325079))

(declare-fun m!325081 () Bool)

(assert (=> b!315724 m!325081))

(declare-fun m!325083 () Bool)

(assert (=> b!315725 m!325083))

(declare-fun m!325085 () Bool)

(assert (=> start!31560 m!325085))

(declare-fun m!325087 () Bool)

(assert (=> start!31560 m!325087))

(check-sat (not b!315728) (not b!315732) (not b!315725) (not b!315723) (not b!315724) (not b!315727) (not b!315726) (not start!31560))
(check-sat)
