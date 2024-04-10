; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29142 () Bool)

(assert start!29142)

(declare-fun b!295654 () Bool)

(declare-fun e!186870 () Bool)

(declare-fun e!186868 () Bool)

(assert (=> b!295654 (= e!186870 e!186868)))

(declare-fun res!155464 () Bool)

(assert (=> b!295654 (=> (not res!155464) (not e!186868))))

(declare-fun lt!146630 () Bool)

(assert (=> b!295654 (= res!155464 lt!146630)))

(declare-datatypes ((SeekEntryResult!2232 0))(
  ( (MissingZero!2232 (index!11098 (_ BitVec 32))) (Found!2232 (index!11099 (_ BitVec 32))) (Intermediate!2232 (undefined!3044 Bool) (index!11100 (_ BitVec 32)) (x!29316 (_ BitVec 32))) (Undefined!2232) (MissingVacant!2232 (index!11101 (_ BitVec 32))) )
))
(declare-fun lt!146628 () SeekEntryResult!2232)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146626 () (_ BitVec 32))

(declare-datatypes ((array!14945 0))(
  ( (array!14946 (arr!7083 (Array (_ BitVec 32) (_ BitVec 64))) (size!7435 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14945)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14945 (_ BitVec 32)) SeekEntryResult!2232)

(assert (=> b!295654 (= lt!146628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146626 k0!2524 (array!14946 (store (arr!7083 a!3312) i!1256 k0!2524) (size!7435 a!3312)) mask!3809))))

(declare-fun lt!146627 () SeekEntryResult!2232)

(assert (=> b!295654 (= lt!146627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146626 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295654 (= lt!146626 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295655 () Bool)

(declare-fun res!155466 () Bool)

(assert (=> b!295655 (=> (not res!155466) (not e!186870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14945 (_ BitVec 32)) Bool)

(assert (=> b!295655 (= res!155466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155463 () Bool)

(declare-fun e!186867 () Bool)

(assert (=> start!29142 (=> (not res!155463) (not e!186867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29142 (= res!155463 (validMask!0 mask!3809))))

(assert (=> start!29142 e!186867))

(assert (=> start!29142 true))

(declare-fun array_inv!5046 (array!14945) Bool)

(assert (=> start!29142 (array_inv!5046 a!3312)))

(declare-fun b!295656 () Bool)

(declare-fun e!186869 () Bool)

(assert (=> b!295656 (= e!186868 e!186869)))

(declare-fun res!155469 () Bool)

(assert (=> b!295656 (=> (not res!155469) (not e!186869))))

(declare-fun lt!146631 () Bool)

(assert (=> b!295656 (= res!155469 (and (or lt!146631 (not (undefined!3044 lt!146627))) (or lt!146631 (not (= (select (arr!7083 a!3312) (index!11100 lt!146627)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146631 (not (= (select (arr!7083 a!3312) (index!11100 lt!146627)) k0!2524))) (not lt!146631)))))

(get-info :version)

(assert (=> b!295656 (= lt!146631 (not ((_ is Intermediate!2232) lt!146627)))))

(declare-fun b!295657 () Bool)

(declare-fun res!155462 () Bool)

(assert (=> b!295657 (=> (not res!155462) (not e!186867))))

(assert (=> b!295657 (= res!155462 (and (= (size!7435 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7435 a!3312))))))

(declare-fun b!295658 () Bool)

(declare-fun res!155467 () Bool)

(assert (=> b!295658 (=> (not res!155467) (not e!186867))))

(declare-fun arrayContainsKey!0 (array!14945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295658 (= res!155467 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295659 () Bool)

(assert (=> b!295659 (= e!186869 (not true))))

(assert (=> b!295659 (and (= (select (arr!7083 a!3312) (index!11100 lt!146627)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11100 lt!146627) i!1256))))

(declare-fun b!295660 () Bool)

(assert (=> b!295660 (= e!186867 e!186870)))

(declare-fun res!155465 () Bool)

(assert (=> b!295660 (=> (not res!155465) (not e!186870))))

(declare-fun lt!146629 () SeekEntryResult!2232)

(assert (=> b!295660 (= res!155465 (or lt!146630 (= lt!146629 (MissingVacant!2232 i!1256))))))

(assert (=> b!295660 (= lt!146630 (= lt!146629 (MissingZero!2232 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14945 (_ BitVec 32)) SeekEntryResult!2232)

(assert (=> b!295660 (= lt!146629 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295661 () Bool)

(declare-fun res!155468 () Bool)

(assert (=> b!295661 (=> (not res!155468) (not e!186867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295661 (= res!155468 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29142 res!155463) b!295657))

(assert (= (and b!295657 res!155462) b!295661))

(assert (= (and b!295661 res!155468) b!295658))

(assert (= (and b!295658 res!155467) b!295660))

(assert (= (and b!295660 res!155465) b!295655))

(assert (= (and b!295655 res!155466) b!295654))

(assert (= (and b!295654 res!155464) b!295656))

(assert (= (and b!295656 res!155469) b!295659))

(declare-fun m!308743 () Bool)

(assert (=> b!295661 m!308743))

(declare-fun m!308745 () Bool)

(assert (=> b!295659 m!308745))

(declare-fun m!308747 () Bool)

(assert (=> b!295658 m!308747))

(declare-fun m!308749 () Bool)

(assert (=> b!295655 m!308749))

(declare-fun m!308751 () Bool)

(assert (=> b!295654 m!308751))

(declare-fun m!308753 () Bool)

(assert (=> b!295654 m!308753))

(declare-fun m!308755 () Bool)

(assert (=> b!295654 m!308755))

(declare-fun m!308757 () Bool)

(assert (=> b!295654 m!308757))

(declare-fun m!308759 () Bool)

(assert (=> start!29142 m!308759))

(declare-fun m!308761 () Bool)

(assert (=> start!29142 m!308761))

(assert (=> b!295656 m!308745))

(declare-fun m!308763 () Bool)

(assert (=> b!295660 m!308763))

(check-sat (not b!295658) (not b!295661) (not b!295655) (not start!29142) (not b!295654) (not b!295660))
(check-sat)
