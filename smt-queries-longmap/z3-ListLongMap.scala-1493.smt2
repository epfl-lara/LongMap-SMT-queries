; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28394 () Bool)

(assert start!28394)

(declare-fun b!290689 () Bool)

(declare-fun res!152027 () Bool)

(declare-fun e!183945 () Bool)

(assert (=> b!290689 (=> (not res!152027) (not e!183945))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14663 0))(
  ( (array!14664 (arr!6957 (Array (_ BitVec 32) (_ BitVec 64))) (size!7309 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14663)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290689 (= res!152027 (and (= (size!7309 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7309 a!3312))))))

(declare-fun res!152034 () Bool)

(assert (=> start!28394 (=> (not res!152034) (not e!183945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28394 (= res!152034 (validMask!0 mask!3809))))

(assert (=> start!28394 e!183945))

(assert (=> start!28394 true))

(declare-fun array_inv!4920 (array!14663) Bool)

(assert (=> start!28394 (array_inv!4920 a!3312)))

(declare-fun b!290690 () Bool)

(declare-fun e!183944 () Bool)

(assert (=> b!290690 (= e!183944 (not true))))

(declare-datatypes ((SeekEntryResult!2106 0))(
  ( (MissingZero!2106 (index!10594 (_ BitVec 32))) (Found!2106 (index!10595 (_ BitVec 32))) (Intermediate!2106 (undefined!2918 Bool) (index!10596 (_ BitVec 32)) (x!28789 (_ BitVec 32))) (Undefined!2106) (MissingVacant!2106 (index!10597 (_ BitVec 32))) )
))
(declare-fun lt!143633 () SeekEntryResult!2106)

(assert (=> b!290690 (= (index!10596 lt!143633) i!1256)))

(declare-fun b!290691 () Bool)

(declare-fun e!183947 () Bool)

(declare-fun e!183943 () Bool)

(assert (=> b!290691 (= e!183947 e!183943)))

(declare-fun res!152030 () Bool)

(assert (=> b!290691 (=> (not res!152030) (not e!183943))))

(declare-fun lt!143630 () SeekEntryResult!2106)

(declare-fun lt!143631 () Bool)

(assert (=> b!290691 (= res!152030 (and (not lt!143631) (= lt!143630 (MissingVacant!2106 i!1256))))))

(declare-fun lt!143634 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!143632 () SeekEntryResult!2106)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14663 (_ BitVec 32)) SeekEntryResult!2106)

(assert (=> b!290691 (= lt!143632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143634 k0!2524 (array!14664 (store (arr!6957 a!3312) i!1256 k0!2524) (size!7309 a!3312)) mask!3809))))

(assert (=> b!290691 (= lt!143633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143634 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290691 (= lt!143634 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290692 () Bool)

(declare-fun res!152028 () Bool)

(assert (=> b!290692 (=> (not res!152028) (not e!183945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290692 (= res!152028 (validKeyInArray!0 k0!2524))))

(declare-fun b!290693 () Bool)

(assert (=> b!290693 (= e!183943 e!183944)))

(declare-fun res!152033 () Bool)

(assert (=> b!290693 (=> (not res!152033) (not e!183944))))

(declare-fun lt!143635 () Bool)

(assert (=> b!290693 (= res!152033 (and (or lt!143635 (not (undefined!2918 lt!143633))) (not lt!143635) (= (select (arr!6957 a!3312) (index!10596 lt!143633)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290693 (= lt!143635 (not ((_ is Intermediate!2106) lt!143633)))))

(declare-fun b!290694 () Bool)

(declare-fun res!152032 () Bool)

(assert (=> b!290694 (=> (not res!152032) (not e!183947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14663 (_ BitVec 32)) Bool)

(assert (=> b!290694 (= res!152032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290695 () Bool)

(declare-fun res!152029 () Bool)

(assert (=> b!290695 (=> (not res!152029) (not e!183945))))

(declare-fun arrayContainsKey!0 (array!14663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290695 (= res!152029 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290696 () Bool)

(assert (=> b!290696 (= e!183945 e!183947)))

(declare-fun res!152031 () Bool)

(assert (=> b!290696 (=> (not res!152031) (not e!183947))))

(assert (=> b!290696 (= res!152031 (or lt!143631 (= lt!143630 (MissingVacant!2106 i!1256))))))

(assert (=> b!290696 (= lt!143631 (= lt!143630 (MissingZero!2106 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14663 (_ BitVec 32)) SeekEntryResult!2106)

(assert (=> b!290696 (= lt!143630 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28394 res!152034) b!290689))

(assert (= (and b!290689 res!152027) b!290692))

(assert (= (and b!290692 res!152028) b!290695))

(assert (= (and b!290695 res!152029) b!290696))

(assert (= (and b!290696 res!152031) b!290694))

(assert (= (and b!290694 res!152032) b!290691))

(assert (= (and b!290691 res!152030) b!290693))

(assert (= (and b!290693 res!152033) b!290690))

(declare-fun m!304687 () Bool)

(assert (=> b!290696 m!304687))

(declare-fun m!304689 () Bool)

(assert (=> start!28394 m!304689))

(declare-fun m!304691 () Bool)

(assert (=> start!28394 m!304691))

(declare-fun m!304693 () Bool)

(assert (=> b!290694 m!304693))

(declare-fun m!304695 () Bool)

(assert (=> b!290691 m!304695))

(declare-fun m!304697 () Bool)

(assert (=> b!290691 m!304697))

(declare-fun m!304699 () Bool)

(assert (=> b!290691 m!304699))

(declare-fun m!304701 () Bool)

(assert (=> b!290691 m!304701))

(declare-fun m!304703 () Bool)

(assert (=> b!290695 m!304703))

(declare-fun m!304705 () Bool)

(assert (=> b!290692 m!304705))

(declare-fun m!304707 () Bool)

(assert (=> b!290693 m!304707))

(check-sat (not b!290692) (not b!290695) (not start!28394) (not b!290696) (not b!290694) (not b!290691))
(check-sat)
