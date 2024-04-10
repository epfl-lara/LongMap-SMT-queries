; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28508 () Bool)

(assert start!28508)

(declare-fun b!291697 () Bool)

(declare-fun e!184571 () Bool)

(declare-fun e!184572 () Bool)

(assert (=> b!291697 (= e!184571 e!184572)))

(declare-fun res!152899 () Bool)

(assert (=> b!291697 (=> (not res!152899) (not e!184572))))

(declare-datatypes ((SeekEntryResult!2139 0))(
  ( (MissingZero!2139 (index!10726 (_ BitVec 32))) (Found!2139 (index!10727 (_ BitVec 32))) (Intermediate!2139 (undefined!2951 Bool) (index!10728 (_ BitVec 32)) (x!28916 (_ BitVec 32))) (Undefined!2139) (MissingVacant!2139 (index!10729 (_ BitVec 32))) )
))
(declare-fun lt!144323 () SeekEntryResult!2139)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144321 () Bool)

(assert (=> b!291697 (= res!152899 (and (not lt!144321) (= lt!144323 (MissingVacant!2139 i!1256))))))

(declare-fun lt!144325 () SeekEntryResult!2139)

(declare-fun lt!144320 () (_ BitVec 32))

(declare-datatypes ((array!14732 0))(
  ( (array!14733 (arr!6990 (Array (_ BitVec 32) (_ BitVec 64))) (size!7342 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14732)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14732 (_ BitVec 32)) SeekEntryResult!2139)

(assert (=> b!291697 (= lt!144325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144320 k0!2524 (array!14733 (store (arr!6990 a!3312) i!1256 k0!2524) (size!7342 a!3312)) mask!3809))))

(declare-fun lt!144324 () SeekEntryResult!2139)

(assert (=> b!291697 (= lt!144324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144320 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291697 (= lt!144320 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!152897 () Bool)

(declare-fun e!184574 () Bool)

(assert (=> start!28508 (=> (not res!152897) (not e!184574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28508 (= res!152897 (validMask!0 mask!3809))))

(assert (=> start!28508 e!184574))

(assert (=> start!28508 true))

(declare-fun array_inv!4953 (array!14732) Bool)

(assert (=> start!28508 (array_inv!4953 a!3312)))

(declare-fun b!291698 () Bool)

(assert (=> b!291698 (= e!184574 e!184571)))

(declare-fun res!152894 () Bool)

(assert (=> b!291698 (=> (not res!152894) (not e!184571))))

(assert (=> b!291698 (= res!152894 (or lt!144321 (= lt!144323 (MissingVacant!2139 i!1256))))))

(assert (=> b!291698 (= lt!144321 (= lt!144323 (MissingZero!2139 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14732 (_ BitVec 32)) SeekEntryResult!2139)

(assert (=> b!291698 (= lt!144323 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291699 () Bool)

(declare-fun res!152896 () Bool)

(assert (=> b!291699 (=> (not res!152896) (not e!184574))))

(declare-fun arrayContainsKey!0 (array!14732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291699 (= res!152896 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291700 () Bool)

(declare-fun e!184573 () Bool)

(assert (=> b!291700 (= e!184573 (not true))))

(assert (=> b!291700 (= (index!10728 lt!144324) i!1256)))

(declare-fun b!291701 () Bool)

(assert (=> b!291701 (= e!184572 e!184573)))

(declare-fun res!152895 () Bool)

(assert (=> b!291701 (=> (not res!152895) (not e!184573))))

(declare-fun lt!144322 () Bool)

(assert (=> b!291701 (= res!152895 (and (or lt!144322 (not (undefined!2951 lt!144324))) (not lt!144322) (= (select (arr!6990 a!3312) (index!10728 lt!144324)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291701 (= lt!144322 (not ((_ is Intermediate!2139) lt!144324)))))

(declare-fun b!291702 () Bool)

(declare-fun res!152898 () Bool)

(assert (=> b!291702 (=> (not res!152898) (not e!184574))))

(assert (=> b!291702 (= res!152898 (and (= (size!7342 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7342 a!3312))))))

(declare-fun b!291703 () Bool)

(declare-fun res!152900 () Bool)

(assert (=> b!291703 (=> (not res!152900) (not e!184574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291703 (= res!152900 (validKeyInArray!0 k0!2524))))

(declare-fun b!291704 () Bool)

(declare-fun res!152901 () Bool)

(assert (=> b!291704 (=> (not res!152901) (not e!184571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14732 (_ BitVec 32)) Bool)

(assert (=> b!291704 (= res!152901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28508 res!152897) b!291702))

(assert (= (and b!291702 res!152898) b!291703))

(assert (= (and b!291703 res!152900) b!291699))

(assert (= (and b!291699 res!152896) b!291698))

(assert (= (and b!291698 res!152894) b!291704))

(assert (= (and b!291704 res!152901) b!291697))

(assert (= (and b!291697 res!152899) b!291701))

(assert (= (and b!291701 res!152895) b!291700))

(declare-fun m!305533 () Bool)

(assert (=> b!291697 m!305533))

(declare-fun m!305535 () Bool)

(assert (=> b!291697 m!305535))

(declare-fun m!305537 () Bool)

(assert (=> b!291697 m!305537))

(declare-fun m!305539 () Bool)

(assert (=> b!291697 m!305539))

(declare-fun m!305541 () Bool)

(assert (=> b!291704 m!305541))

(declare-fun m!305543 () Bool)

(assert (=> b!291701 m!305543))

(declare-fun m!305545 () Bool)

(assert (=> b!291703 m!305545))

(declare-fun m!305547 () Bool)

(assert (=> start!28508 m!305547))

(declare-fun m!305549 () Bool)

(assert (=> start!28508 m!305549))

(declare-fun m!305551 () Bool)

(assert (=> b!291698 m!305551))

(declare-fun m!305553 () Bool)

(assert (=> b!291699 m!305553))

(check-sat (not b!291703) (not b!291698) (not b!291699) (not b!291704) (not start!28508) (not b!291697))
(check-sat)
