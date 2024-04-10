; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28388 () Bool)

(assert start!28388)

(declare-fun b!290617 () Bool)

(declare-fun res!151962 () Bool)

(declare-fun e!183899 () Bool)

(assert (=> b!290617 (=> (not res!151962) (not e!183899))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290617 (= res!151962 (validKeyInArray!0 k0!2524))))

(declare-fun res!151957 () Bool)

(assert (=> start!28388 (=> (not res!151957) (not e!183899))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28388 (= res!151957 (validMask!0 mask!3809))))

(assert (=> start!28388 e!183899))

(assert (=> start!28388 true))

(declare-datatypes ((array!14657 0))(
  ( (array!14658 (arr!6954 (Array (_ BitVec 32) (_ BitVec 64))) (size!7306 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14657)

(declare-fun array_inv!4917 (array!14657) Bool)

(assert (=> start!28388 (array_inv!4917 a!3312)))

(declare-fun b!290618 () Bool)

(declare-fun res!151955 () Bool)

(assert (=> b!290618 (=> (not res!151955) (not e!183899))))

(declare-fun arrayContainsKey!0 (array!14657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290618 (= res!151955 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290619 () Bool)

(declare-fun e!183900 () Bool)

(declare-fun e!183898 () Bool)

(assert (=> b!290619 (= e!183900 e!183898)))

(declare-fun res!151956 () Bool)

(assert (=> b!290619 (=> (not res!151956) (not e!183898))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143577 () Bool)

(declare-datatypes ((SeekEntryResult!2103 0))(
  ( (MissingZero!2103 (index!10582 (_ BitVec 32))) (Found!2103 (index!10583 (_ BitVec 32))) (Intermediate!2103 (undefined!2915 Bool) (index!10584 (_ BitVec 32)) (x!28778 (_ BitVec 32))) (Undefined!2103) (MissingVacant!2103 (index!10585 (_ BitVec 32))) )
))
(declare-fun lt!143579 () SeekEntryResult!2103)

(assert (=> b!290619 (= res!151956 (and (not lt!143577) (= lt!143579 (MissingVacant!2103 i!1256))))))

(declare-fun lt!143580 () (_ BitVec 32))

(declare-fun lt!143578 () SeekEntryResult!2103)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14657 (_ BitVec 32)) SeekEntryResult!2103)

(assert (=> b!290619 (= lt!143578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143580 k0!2524 (array!14658 (store (arr!6954 a!3312) i!1256 k0!2524) (size!7306 a!3312)) mask!3809))))

(declare-fun lt!143576 () SeekEntryResult!2103)

(assert (=> b!290619 (= lt!143576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143580 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290619 (= lt!143580 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290620 () Bool)

(assert (=> b!290620 (= e!183899 e!183900)))

(declare-fun res!151958 () Bool)

(assert (=> b!290620 (=> (not res!151958) (not e!183900))))

(assert (=> b!290620 (= res!151958 (or lt!143577 (= lt!143579 (MissingVacant!2103 i!1256))))))

(assert (=> b!290620 (= lt!143577 (= lt!143579 (MissingZero!2103 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14657 (_ BitVec 32)) SeekEntryResult!2103)

(assert (=> b!290620 (= lt!143579 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290621 () Bool)

(declare-fun res!151961 () Bool)

(assert (=> b!290621 (=> (not res!151961) (not e!183900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14657 (_ BitVec 32)) Bool)

(assert (=> b!290621 (= res!151961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290622 () Bool)

(declare-fun e!183902 () Bool)

(assert (=> b!290622 (= e!183898 e!183902)))

(declare-fun res!151959 () Bool)

(assert (=> b!290622 (=> (not res!151959) (not e!183902))))

(declare-fun lt!143581 () Bool)

(assert (=> b!290622 (= res!151959 (and (or lt!143581 (not (undefined!2915 lt!143576))) (not lt!143581) (= (select (arr!6954 a!3312) (index!10584 lt!143576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290622 (= lt!143581 (not ((_ is Intermediate!2103) lt!143576)))))

(declare-fun b!290623 () Bool)

(assert (=> b!290623 (= e!183902 (not true))))

(assert (=> b!290623 (= (index!10584 lt!143576) i!1256)))

(declare-fun b!290624 () Bool)

(declare-fun res!151960 () Bool)

(assert (=> b!290624 (=> (not res!151960) (not e!183899))))

(assert (=> b!290624 (= res!151960 (and (= (size!7306 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7306 a!3312))))))

(assert (= (and start!28388 res!151957) b!290624))

(assert (= (and b!290624 res!151960) b!290617))

(assert (= (and b!290617 res!151962) b!290618))

(assert (= (and b!290618 res!151955) b!290620))

(assert (= (and b!290620 res!151958) b!290621))

(assert (= (and b!290621 res!151961) b!290619))

(assert (= (and b!290619 res!151956) b!290622))

(assert (= (and b!290622 res!151959) b!290623))

(declare-fun m!304621 () Bool)

(assert (=> start!28388 m!304621))

(declare-fun m!304623 () Bool)

(assert (=> start!28388 m!304623))

(declare-fun m!304625 () Bool)

(assert (=> b!290618 m!304625))

(declare-fun m!304627 () Bool)

(assert (=> b!290622 m!304627))

(declare-fun m!304629 () Bool)

(assert (=> b!290621 m!304629))

(declare-fun m!304631 () Bool)

(assert (=> b!290620 m!304631))

(declare-fun m!304633 () Bool)

(assert (=> b!290617 m!304633))

(declare-fun m!304635 () Bool)

(assert (=> b!290619 m!304635))

(declare-fun m!304637 () Bool)

(assert (=> b!290619 m!304637))

(declare-fun m!304639 () Bool)

(assert (=> b!290619 m!304639))

(declare-fun m!304641 () Bool)

(assert (=> b!290619 m!304641))

(check-sat (not b!290620) (not b!290618) (not b!290621) (not start!28388) (not b!290617) (not b!290619))
(check-sat)
