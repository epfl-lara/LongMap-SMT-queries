; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28430 () Bool)

(assert start!28430)

(declare-fun b!291022 () Bool)

(declare-fun res!152418 () Bool)

(declare-fun e!184145 () Bool)

(assert (=> b!291022 (=> (not res!152418) (not e!184145))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291022 (= res!152418 (validKeyInArray!0 k0!2524))))

(declare-fun b!291023 () Bool)

(declare-fun e!184142 () Bool)

(declare-fun e!184146 () Bool)

(assert (=> b!291023 (= e!184142 e!184146)))

(declare-fun res!152415 () Bool)

(assert (=> b!291023 (=> (not res!152415) (not e!184146))))

(declare-datatypes ((array!14692 0))(
  ( (array!14693 (arr!6972 (Array (_ BitVec 32) (_ BitVec 64))) (size!7325 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14692)

(declare-datatypes ((SeekEntryResult!2120 0))(
  ( (MissingZero!2120 (index!10650 (_ BitVec 32))) (Found!2120 (index!10651 (_ BitVec 32))) (Intermediate!2120 (undefined!2932 Bool) (index!10652 (_ BitVec 32)) (x!28858 (_ BitVec 32))) (Undefined!2120) (MissingVacant!2120 (index!10653 (_ BitVec 32))) )
))
(declare-fun lt!143809 () SeekEntryResult!2120)

(declare-fun lt!143810 () Bool)

(assert (=> b!291023 (= res!152415 (and (or lt!143810 (not (undefined!2932 lt!143809))) (not lt!143810) (= (select (arr!6972 a!3312) (index!10652 lt!143809)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291023 (= lt!143810 (not ((_ is Intermediate!2120) lt!143809)))))

(declare-fun b!291024 () Bool)

(declare-fun res!152413 () Bool)

(assert (=> b!291024 (=> (not res!152413) (not e!184145))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291024 (= res!152413 (and (= (size!7325 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7325 a!3312))))))

(declare-fun b!291025 () Bool)

(declare-fun res!152419 () Bool)

(assert (=> b!291025 (=> (not res!152419) (not e!184145))))

(declare-fun arrayContainsKey!0 (array!14692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291025 (= res!152419 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291026 () Bool)

(declare-fun e!184144 () Bool)

(assert (=> b!291026 (= e!184145 e!184144)))

(declare-fun res!152414 () Bool)

(assert (=> b!291026 (=> (not res!152414) (not e!184144))))

(declare-fun lt!143811 () Bool)

(declare-fun lt!143813 () SeekEntryResult!2120)

(assert (=> b!291026 (= res!152414 (or lt!143811 (= lt!143813 (MissingVacant!2120 i!1256))))))

(assert (=> b!291026 (= lt!143811 (= lt!143813 (MissingZero!2120 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14692 (_ BitVec 32)) SeekEntryResult!2120)

(assert (=> b!291026 (= lt!143813 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291027 () Bool)

(assert (=> b!291027 (= e!184146 (not (= lt!143809 (Intermediate!2120 false (index!10652 lt!143809) (x!28858 lt!143809)))))))

(assert (=> b!291027 (= (index!10652 lt!143809) i!1256)))

(declare-fun b!291028 () Bool)

(assert (=> b!291028 (= e!184144 e!184142)))

(declare-fun res!152412 () Bool)

(assert (=> b!291028 (=> (not res!152412) (not e!184142))))

(assert (=> b!291028 (= res!152412 (and (not lt!143811) (= lt!143813 (MissingVacant!2120 i!1256))))))

(declare-fun lt!143814 () SeekEntryResult!2120)

(declare-fun lt!143812 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14692 (_ BitVec 32)) SeekEntryResult!2120)

(assert (=> b!291028 (= lt!143814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143812 k0!2524 (array!14693 (store (arr!6972 a!3312) i!1256 k0!2524) (size!7325 a!3312)) mask!3809))))

(assert (=> b!291028 (= lt!143809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143812 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291028 (= lt!143812 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291029 () Bool)

(declare-fun res!152416 () Bool)

(assert (=> b!291029 (=> (not res!152416) (not e!184144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14692 (_ BitVec 32)) Bool)

(assert (=> b!291029 (= res!152416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152417 () Bool)

(assert (=> start!28430 (=> (not res!152417) (not e!184145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28430 (= res!152417 (validMask!0 mask!3809))))

(assert (=> start!28430 e!184145))

(assert (=> start!28430 true))

(declare-fun array_inv!4944 (array!14692) Bool)

(assert (=> start!28430 (array_inv!4944 a!3312)))

(assert (= (and start!28430 res!152417) b!291024))

(assert (= (and b!291024 res!152413) b!291022))

(assert (= (and b!291022 res!152418) b!291025))

(assert (= (and b!291025 res!152419) b!291026))

(assert (= (and b!291026 res!152414) b!291029))

(assert (= (and b!291029 res!152416) b!291028))

(assert (= (and b!291028 res!152412) b!291023))

(assert (= (and b!291023 res!152415) b!291027))

(declare-fun m!304535 () Bool)

(assert (=> b!291025 m!304535))

(declare-fun m!304537 () Bool)

(assert (=> start!28430 m!304537))

(declare-fun m!304539 () Bool)

(assert (=> start!28430 m!304539))

(declare-fun m!304541 () Bool)

(assert (=> b!291026 m!304541))

(declare-fun m!304543 () Bool)

(assert (=> b!291023 m!304543))

(declare-fun m!304545 () Bool)

(assert (=> b!291029 m!304545))

(declare-fun m!304547 () Bool)

(assert (=> b!291028 m!304547))

(declare-fun m!304549 () Bool)

(assert (=> b!291028 m!304549))

(declare-fun m!304551 () Bool)

(assert (=> b!291028 m!304551))

(declare-fun m!304553 () Bool)

(assert (=> b!291028 m!304553))

(declare-fun m!304555 () Bool)

(assert (=> b!291022 m!304555))

(check-sat (not b!291022) (not b!291025) (not b!291029) (not b!291026) (not b!291028) (not start!28430))
(check-sat)
