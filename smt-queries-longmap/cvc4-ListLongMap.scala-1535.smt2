; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29144 () Bool)

(assert start!29144)

(declare-fun b!295678 () Bool)

(declare-fun res!155487 () Bool)

(declare-fun e!186885 () Bool)

(assert (=> b!295678 (=> (not res!155487) (not e!186885))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295678 (= res!155487 (validKeyInArray!0 k!2524))))

(declare-fun b!295679 () Bool)

(declare-fun e!186882 () Bool)

(declare-fun e!186886 () Bool)

(assert (=> b!295679 (= e!186882 e!186886)))

(declare-fun res!155490 () Bool)

(assert (=> b!295679 (=> (not res!155490) (not e!186886))))

(declare-fun lt!146648 () Bool)

(declare-datatypes ((array!14947 0))(
  ( (array!14948 (arr!7084 (Array (_ BitVec 32) (_ BitVec 64))) (size!7436 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14947)

(declare-datatypes ((SeekEntryResult!2233 0))(
  ( (MissingZero!2233 (index!11102 (_ BitVec 32))) (Found!2233 (index!11103 (_ BitVec 32))) (Intermediate!2233 (undefined!3045 Bool) (index!11104 (_ BitVec 32)) (x!29317 (_ BitVec 32))) (Undefined!2233) (MissingVacant!2233 (index!11105 (_ BitVec 32))) )
))
(declare-fun lt!146647 () SeekEntryResult!2233)

(assert (=> b!295679 (= res!155490 (and (or lt!146648 (not (undefined!3045 lt!146647))) (or lt!146648 (not (= (select (arr!7084 a!3312) (index!11104 lt!146647)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146648 (not (= (select (arr!7084 a!3312) (index!11104 lt!146647)) k!2524))) (not lt!146648)))))

(assert (=> b!295679 (= lt!146648 (not (is-Intermediate!2233 lt!146647)))))

(declare-fun b!295680 () Bool)

(declare-fun e!186884 () Bool)

(assert (=> b!295680 (= e!186885 e!186884)))

(declare-fun res!155491 () Bool)

(assert (=> b!295680 (=> (not res!155491) (not e!186884))))

(declare-fun lt!146649 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146645 () SeekEntryResult!2233)

(assert (=> b!295680 (= res!155491 (or lt!146649 (= lt!146645 (MissingVacant!2233 i!1256))))))

(assert (=> b!295680 (= lt!146649 (= lt!146645 (MissingZero!2233 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14947 (_ BitVec 32)) SeekEntryResult!2233)

(assert (=> b!295680 (= lt!146645 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295681 () Bool)

(declare-fun res!155493 () Bool)

(assert (=> b!295681 (=> (not res!155493) (not e!186885))))

(assert (=> b!295681 (= res!155493 (and (= (size!7436 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7436 a!3312))))))

(declare-fun b!295682 () Bool)

(assert (=> b!295682 (= e!186884 e!186882)))

(declare-fun res!155492 () Bool)

(assert (=> b!295682 (=> (not res!155492) (not e!186882))))

(assert (=> b!295682 (= res!155492 lt!146649)))

(declare-fun lt!146646 () (_ BitVec 32))

(declare-fun lt!146644 () SeekEntryResult!2233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14947 (_ BitVec 32)) SeekEntryResult!2233)

(assert (=> b!295682 (= lt!146644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146646 k!2524 (array!14948 (store (arr!7084 a!3312) i!1256 k!2524) (size!7436 a!3312)) mask!3809))))

(assert (=> b!295682 (= lt!146647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146646 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295682 (= lt!146646 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295683 () Bool)

(assert (=> b!295683 (= e!186886 (not true))))

(assert (=> b!295683 (and (= (select (arr!7084 a!3312) (index!11104 lt!146647)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11104 lt!146647) i!1256))))

(declare-fun res!155486 () Bool)

(assert (=> start!29144 (=> (not res!155486) (not e!186885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29144 (= res!155486 (validMask!0 mask!3809))))

(assert (=> start!29144 e!186885))

(assert (=> start!29144 true))

(declare-fun array_inv!5047 (array!14947) Bool)

(assert (=> start!29144 (array_inv!5047 a!3312)))

(declare-fun b!295684 () Bool)

(declare-fun res!155488 () Bool)

(assert (=> b!295684 (=> (not res!155488) (not e!186884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14947 (_ BitVec 32)) Bool)

(assert (=> b!295684 (= res!155488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295685 () Bool)

(declare-fun res!155489 () Bool)

(assert (=> b!295685 (=> (not res!155489) (not e!186885))))

(declare-fun arrayContainsKey!0 (array!14947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295685 (= res!155489 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29144 res!155486) b!295681))

(assert (= (and b!295681 res!155493) b!295678))

(assert (= (and b!295678 res!155487) b!295685))

(assert (= (and b!295685 res!155489) b!295680))

(assert (= (and b!295680 res!155491) b!295684))

(assert (= (and b!295684 res!155488) b!295682))

(assert (= (and b!295682 res!155492) b!295679))

(assert (= (and b!295679 res!155490) b!295683))

(declare-fun m!308765 () Bool)

(assert (=> b!295680 m!308765))

(declare-fun m!308767 () Bool)

(assert (=> b!295678 m!308767))

(declare-fun m!308769 () Bool)

(assert (=> b!295685 m!308769))

(declare-fun m!308771 () Bool)

(assert (=> b!295684 m!308771))

(declare-fun m!308773 () Bool)

(assert (=> b!295682 m!308773))

(declare-fun m!308775 () Bool)

(assert (=> b!295682 m!308775))

(declare-fun m!308777 () Bool)

(assert (=> b!295682 m!308777))

(declare-fun m!308779 () Bool)

(assert (=> b!295682 m!308779))

(declare-fun m!308781 () Bool)

(assert (=> b!295679 m!308781))

(assert (=> b!295683 m!308781))

(declare-fun m!308783 () Bool)

(assert (=> start!29144 m!308783))

(declare-fun m!308785 () Bool)

(assert (=> start!29144 m!308785))

(push 1)

(assert (not b!295680))

(assert (not b!295685))

