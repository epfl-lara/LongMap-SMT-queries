; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29146 () Bool)

(assert start!29146)

(declare-fun res!155613 () Bool)

(declare-fun e!186979 () Bool)

(assert (=> start!29146 (=> (not res!155613) (not e!186979))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29146 (= res!155613 (validMask!0 mask!3809))))

(assert (=> start!29146 e!186979))

(assert (=> start!29146 true))

(declare-datatypes ((array!14952 0))(
  ( (array!14953 (arr!7087 (Array (_ BitVec 32) (_ BitVec 64))) (size!7439 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14952)

(declare-fun array_inv!5037 (array!14952) Bool)

(assert (=> start!29146 (array_inv!5037 a!3312)))

(declare-fun b!295839 () Bool)

(declare-fun res!155612 () Bool)

(assert (=> b!295839 (=> (not res!155612) (not e!186979))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295839 (= res!155612 (and (= (size!7439 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7439 a!3312))))))

(declare-fun b!295840 () Bool)

(declare-fun e!186980 () Bool)

(assert (=> b!295840 (= e!186980 (not true))))

(declare-datatypes ((SeekEntryResult!2201 0))(
  ( (MissingZero!2201 (index!10974 (_ BitVec 32))) (Found!2201 (index!10975 (_ BitVec 32))) (Intermediate!2201 (undefined!3013 Bool) (index!10976 (_ BitVec 32)) (x!29302 (_ BitVec 32))) (Undefined!2201) (MissingVacant!2201 (index!10977 (_ BitVec 32))) )
))
(declare-fun lt!146783 () SeekEntryResult!2201)

(assert (=> b!295840 (and (= (select (arr!7087 a!3312) (index!10976 lt!146783)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10976 lt!146783) i!1256))))

(declare-fun b!295841 () Bool)

(declare-fun e!186976 () Bool)

(assert (=> b!295841 (= e!186979 e!186976)))

(declare-fun res!155614 () Bool)

(assert (=> b!295841 (=> (not res!155614) (not e!186976))))

(declare-fun lt!146786 () SeekEntryResult!2201)

(declare-fun lt!146784 () Bool)

(assert (=> b!295841 (= res!155614 (or lt!146784 (= lt!146786 (MissingVacant!2201 i!1256))))))

(assert (=> b!295841 (= lt!146784 (= lt!146786 (MissingZero!2201 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14952 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!295841 (= lt!146786 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295842 () Bool)

(declare-fun res!155616 () Bool)

(assert (=> b!295842 (=> (not res!155616) (not e!186976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14952 (_ BitVec 32)) Bool)

(assert (=> b!295842 (= res!155616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295843 () Bool)

(declare-fun res!155615 () Bool)

(assert (=> b!295843 (=> (not res!155615) (not e!186979))))

(declare-fun arrayContainsKey!0 (array!14952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295843 (= res!155615 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295844 () Bool)

(declare-fun e!186977 () Bool)

(assert (=> b!295844 (= e!186976 e!186977)))

(declare-fun res!155611 () Bool)

(assert (=> b!295844 (=> (not res!155611) (not e!186977))))

(assert (=> b!295844 (= res!155611 lt!146784)))

(declare-fun lt!146785 () (_ BitVec 32))

(declare-fun lt!146782 () SeekEntryResult!2201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14952 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!295844 (= lt!146782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146785 k0!2524 (array!14953 (store (arr!7087 a!3312) i!1256 k0!2524) (size!7439 a!3312)) mask!3809))))

(assert (=> b!295844 (= lt!146783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146785 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295844 (= lt!146785 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295845 () Bool)

(assert (=> b!295845 (= e!186977 e!186980)))

(declare-fun res!155609 () Bool)

(assert (=> b!295845 (=> (not res!155609) (not e!186980))))

(declare-fun lt!146787 () Bool)

(assert (=> b!295845 (= res!155609 (and (or lt!146787 (not (undefined!3013 lt!146783))) (or lt!146787 (not (= (select (arr!7087 a!3312) (index!10976 lt!146783)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146787 (not (= (select (arr!7087 a!3312) (index!10976 lt!146783)) k0!2524))) (not lt!146787)))))

(get-info :version)

(assert (=> b!295845 (= lt!146787 (not ((_ is Intermediate!2201) lt!146783)))))

(declare-fun b!295846 () Bool)

(declare-fun res!155610 () Bool)

(assert (=> b!295846 (=> (not res!155610) (not e!186979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295846 (= res!155610 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29146 res!155613) b!295839))

(assert (= (and b!295839 res!155612) b!295846))

(assert (= (and b!295846 res!155610) b!295843))

(assert (= (and b!295843 res!155615) b!295841))

(assert (= (and b!295841 res!155614) b!295842))

(assert (= (and b!295842 res!155616) b!295844))

(assert (= (and b!295844 res!155611) b!295845))

(assert (= (and b!295845 res!155609) b!295840))

(declare-fun m!309083 () Bool)

(assert (=> b!295845 m!309083))

(declare-fun m!309085 () Bool)

(assert (=> b!295844 m!309085))

(declare-fun m!309087 () Bool)

(assert (=> b!295844 m!309087))

(declare-fun m!309089 () Bool)

(assert (=> b!295844 m!309089))

(declare-fun m!309091 () Bool)

(assert (=> b!295844 m!309091))

(declare-fun m!309093 () Bool)

(assert (=> b!295842 m!309093))

(declare-fun m!309095 () Bool)

(assert (=> b!295846 m!309095))

(declare-fun m!309097 () Bool)

(assert (=> b!295843 m!309097))

(declare-fun m!309099 () Bool)

(assert (=> start!29146 m!309099))

(declare-fun m!309101 () Bool)

(assert (=> start!29146 m!309101))

(declare-fun m!309103 () Bool)

(assert (=> b!295841 m!309103))

(assert (=> b!295840 m!309083))

(check-sat (not b!295846) (not start!29146) (not b!295844) (not b!295843) (not b!295842) (not b!295841))
(check-sat)
