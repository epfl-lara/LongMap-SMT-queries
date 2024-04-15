; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28382 () Bool)

(assert start!28382)

(declare-fun b!290446 () Bool)

(declare-fun e!183784 () Bool)

(assert (=> b!290446 (= e!183784 (not true))))

(declare-datatypes ((SeekEntryResult!2096 0))(
  ( (MissingZero!2096 (index!10554 (_ BitVec 32))) (Found!2096 (index!10555 (_ BitVec 32))) (Intermediate!2096 (undefined!2908 Bool) (index!10556 (_ BitVec 32)) (x!28770 (_ BitVec 32))) (Undefined!2096) (MissingVacant!2096 (index!10557 (_ BitVec 32))) )
))
(declare-fun lt!143379 () SeekEntryResult!2096)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290446 (= (index!10556 lt!143379) i!1256)))

(declare-fun b!290447 () Bool)

(declare-fun res!151841 () Bool)

(declare-fun e!183786 () Bool)

(assert (=> b!290447 (=> (not res!151841) (not e!183786))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290447 (= res!151841 (validKeyInArray!0 k0!2524))))

(declare-fun res!151836 () Bool)

(assert (=> start!28382 (=> (not res!151836) (not e!183786))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28382 (= res!151836 (validMask!0 mask!3809))))

(assert (=> start!28382 e!183786))

(assert (=> start!28382 true))

(declare-datatypes ((array!14644 0))(
  ( (array!14645 (arr!6948 (Array (_ BitVec 32) (_ BitVec 64))) (size!7301 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14644)

(declare-fun array_inv!4920 (array!14644) Bool)

(assert (=> start!28382 (array_inv!4920 a!3312)))

(declare-fun b!290448 () Bool)

(declare-fun res!151837 () Bool)

(declare-fun e!183782 () Bool)

(assert (=> b!290448 (=> (not res!151837) (not e!183782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14644 (_ BitVec 32)) Bool)

(assert (=> b!290448 (= res!151837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290449 () Bool)

(declare-fun e!183783 () Bool)

(assert (=> b!290449 (= e!183783 e!183784)))

(declare-fun res!151843 () Bool)

(assert (=> b!290449 (=> (not res!151843) (not e!183784))))

(declare-fun lt!143377 () Bool)

(assert (=> b!290449 (= res!151843 (and (or lt!143377 (not (undefined!2908 lt!143379))) (not lt!143377) (= (select (arr!6948 a!3312) (index!10556 lt!143379)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290449 (= lt!143377 (not ((_ is Intermediate!2096) lt!143379)))))

(declare-fun b!290450 () Bool)

(declare-fun res!151838 () Bool)

(assert (=> b!290450 (=> (not res!151838) (not e!183786))))

(declare-fun arrayContainsKey!0 (array!14644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290450 (= res!151838 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290451 () Bool)

(declare-fun res!151842 () Bool)

(assert (=> b!290451 (=> (not res!151842) (not e!183786))))

(assert (=> b!290451 (= res!151842 (and (= (size!7301 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7301 a!3312))))))

(declare-fun b!290452 () Bool)

(assert (=> b!290452 (= e!183782 e!183783)))

(declare-fun res!151839 () Bool)

(assert (=> b!290452 (=> (not res!151839) (not e!183783))))

(declare-fun lt!143382 () SeekEntryResult!2096)

(declare-fun lt!143381 () Bool)

(assert (=> b!290452 (= res!151839 (and (not lt!143381) (= lt!143382 (MissingVacant!2096 i!1256))))))

(declare-fun lt!143378 () (_ BitVec 32))

(declare-fun lt!143380 () SeekEntryResult!2096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14644 (_ BitVec 32)) SeekEntryResult!2096)

(assert (=> b!290452 (= lt!143380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143378 k0!2524 (array!14645 (store (arr!6948 a!3312) i!1256 k0!2524) (size!7301 a!3312)) mask!3809))))

(assert (=> b!290452 (= lt!143379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143378 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290452 (= lt!143378 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290453 () Bool)

(assert (=> b!290453 (= e!183786 e!183782)))

(declare-fun res!151840 () Bool)

(assert (=> b!290453 (=> (not res!151840) (not e!183782))))

(assert (=> b!290453 (= res!151840 (or lt!143381 (= lt!143382 (MissingVacant!2096 i!1256))))))

(assert (=> b!290453 (= lt!143381 (= lt!143382 (MissingZero!2096 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14644 (_ BitVec 32)) SeekEntryResult!2096)

(assert (=> b!290453 (= lt!143382 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28382 res!151836) b!290451))

(assert (= (and b!290451 res!151842) b!290447))

(assert (= (and b!290447 res!151841) b!290450))

(assert (= (and b!290450 res!151838) b!290453))

(assert (= (and b!290453 res!151840) b!290448))

(assert (= (and b!290448 res!151837) b!290452))

(assert (= (and b!290452 res!151839) b!290449))

(assert (= (and b!290449 res!151843) b!290446))

(declare-fun m!304007 () Bool)

(assert (=> b!290447 m!304007))

(declare-fun m!304009 () Bool)

(assert (=> b!290453 m!304009))

(declare-fun m!304011 () Bool)

(assert (=> b!290448 m!304011))

(declare-fun m!304013 () Bool)

(assert (=> b!290450 m!304013))

(declare-fun m!304015 () Bool)

(assert (=> start!28382 m!304015))

(declare-fun m!304017 () Bool)

(assert (=> start!28382 m!304017))

(declare-fun m!304019 () Bool)

(assert (=> b!290449 m!304019))

(declare-fun m!304021 () Bool)

(assert (=> b!290452 m!304021))

(declare-fun m!304023 () Bool)

(assert (=> b!290452 m!304023))

(declare-fun m!304025 () Bool)

(assert (=> b!290452 m!304025))

(declare-fun m!304027 () Bool)

(assert (=> b!290452 m!304027))

(check-sat (not start!28382) (not b!290448) (not b!290447) (not b!290453) (not b!290452) (not b!290450))
(check-sat)
